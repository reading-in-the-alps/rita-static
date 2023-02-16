import glob
import os

from typesense.api_call import ObjectNotFound
from acdh_cfts_pyutils import TYPESENSE_CLIENT as client
from acdh_cfts_pyutils import CFTS_COLLECTION
from acdh_tei_pyutils.tei import TeiReader
from tqdm import tqdm


files = glob.glob('./data/editions/*.xml')
for x in glob.glob('./data/rita1/*.xml'):
    files.append(x)
print(len(files))


try:
    client.collections['rita'].delete()
except ObjectNotFound:
    pass

current_schema = {
    'name': 'rita',
    'fields': [
        {
            'name': 'id',
            'type': 'string'
        },
        {
            'name': 'rec_id',
            'type': 'string'
        },
        {
            'name': 'title',
            'type': 'string'
        },
        {
            'name': 'full_text',
            'type': 'string'
        },
        {
            'name': 'persons',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
        {
            'name': 'places',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
        {
            'name': 'books',
            'type': 'string[]',
            'facet': True,
            'optional': True
        },
    ]
}

client.collections.create(current_schema)

records = []
cfts_records = []
for x in tqdm(files, total=len(files)):
    cfts_record = {
        'project': 'rita',
    }
    record = {}
    
    doc = TeiReader(x)
    body = doc.any_xpath('.//tei:body')[0]
    record['id'] = os.path.split(x)[-1].replace('.xml', '')
    cfts_record['id'] = record['id']
    cfts_record['resolver'] = f"https://rita.acdh.oeaw.ac.at/{record['id']}.html"
    record['rec_id'] = os.path.split(x)[-1]
    cfts_record['rec_id'] = record['rec_id']
    record['title'] = " ".join(" ".join(doc.any_xpath('.//tei:titleStmt/tei:title//text()')).split())
    cfts_record['title'] = record['title']
    record['persons'] = [
        " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:person//tei:persName[1]')
    ]
    record['places'] = [
        " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:place//tei:placeName[1]')
    ]

    record['books'] = [
         " ".join(" ".join(x.xpath('.//text()')).split()) for x in doc.any_xpath('.//tei:back//tei:listBibl//tei:bibl[@xml:id]/tei:title[1]')
    ]
    cfts_record['books'] = record['books']
    record['full_text'] = " ".join(''.join(body.itertext()).split())
    cfts_record['full_text'] = record['full_text']
    records.append(record)
    cfts_records.append(cfts_record)

make_index = client.collections['rita'].documents.import_(records)
print(make_index)
print('done with indexing rita')

make_index = CFTS_COLLECTION.documents.import_(cfts_records, {'action': 'upsert'})
print(make_index)
print('done with cfts-index rita')
