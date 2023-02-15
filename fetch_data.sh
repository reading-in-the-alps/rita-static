rm -rf rita2-data-master && rm master.zip
rm -rf data/editions && rm -rf data/indices && rm -rf data/meta
rm -rf data/rita1 && rm -rf data/inventare
wget https://github.com/reading-in-the-alps/rita2-data/archive/refs/heads/master.zip
unzip master
mv rita2-data-master/data/editions ./data/editions
mv rita2-data-master/data/indices ./data/indices
mv rita2-data-master/data/meta ./data/meta
mv rita2-data-master/data/inventare ./data/inventare
mv rita2-data-master/data/rita1 ./data/rita1


./dl_imprint.sh
rm -rf rita2-data-master && rm master.zip
rm data/meta/netvis-config.xml
mv data/meta/rita1_summary.xml data/inventare/stubaital-summary.xml

# echo "create calendar data"
# python make_calendar_data.py
add-attributes -g "./data/editions/*.xml" -b "https://id.acdh.oeaw.ac.at/rita/editions"
add-attributes -g "./data/meta/*.xml" -b "https://id.acdh.oeaw.ac.at/rita/meta"
add-attributes -g "./data/rita1/*.xml" -b "https://id.acdh.oeaw.ac.at/rita/rita1"
add-attributes -g "./data/inventare/*.xml" -b "https://id.acdh.oeaw.ac.at/rita/inventare"
add-attributes -g "./data/indices/*.xml" -b "https://id.acdh.oeaw.ac.at/rita/indices"

denormalize-indices -x './/tei:title[@type="short"]/text()' -i './data/indices/list*.xml' -f './data/editions/*.xml'