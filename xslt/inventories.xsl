<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/shared.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/osd-container.xsl"/>
    <xsl:import href="./partials/tei-facsimile.xsl"/>
    <xsl:import href="./partials/person.xsl"/>
    <xsl:import href="./partials/place.xsl"/>
    <xsl:import href="./partials/org.xsl"/>

    <xsl:variable name="prev">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@prev), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="next">
        <xsl:value-of select="replace(tokenize(data(tei:TEI/@next), '/')[last()], '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="teiSource">
        <xsl:value-of select="data(tei:TEI/@xml:id)"/>
    </xsl:variable>
    <xsl:variable name="link">
        <xsl:value-of select="replace($teiSource, '.xml', '.html')"/>
    </xsl:variable>
    <xsl:variable name="doc_title">
        <xsl:value-of select=".//tei:title[@type='label'][1]/text()"/>
    </xsl:variable>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="string-join(.//tei:titleStmt/tei:title[1]//text())"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-custom">                        
                        <div class="card" data-index="true">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-2">
                                        <xsl:if test="ends-with($prev,'.html')">
                                            <h1>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="$prev"/>
                                                    </xsl:attribute>
                                                    <i class="fas fa-chevron-left" title="prev"/>
                                                </a>
                                            </h1>
                                        </xsl:if>
                                    </div>
                                    <div class="col-md-8">
                                        <h1 align="center">
                                            <xsl:value-of select="$doc_title"/>
                                        </h1>
                                        <h3 align="center">
                                            <a href="{$teiSource}">
                                                <i class="fas fa-download" title="show TEI source"/>
                                            </a> |                                        
                                            <a>
                                                <i class="fas fa-info" title="Info" data-toggle="modal" data-target="#exampleModal"/>
                                            </a>
                                        </h3>
                                    </div>
                                    <div class="col-md-2" style="text-align:right">
                                        <xsl:if test="ends-with($next, '.html')">
                                            <h1>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="$next"/>
                                                    </xsl:attribute>
                                                    <i class="fas fa-chevron-right" title="next"/>
                                                </a>
                                            </h1>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">                                
                                <xsl:apply-templates select=".//tei:body"></xsl:apply-templates>
                            </div>
                            <div class="card-footer">
                                <p style="text-align:center;">
                                    <xsl:for-each select=".//tei:note[not(./tei:p)]">
                                        <div class="footnotes" id="{local:makeId(.)}">
                                            <xsl:element name="a">
                                                <xsl:attribute name="name">
                                                    <xsl:text>fn</xsl:text>
                                                    <xsl:number level="any" format="1" count="tei:note"/>
                                                </xsl:attribute>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:text>#fna_</xsl:text>
                                                        <xsl:number level="any" format="1" count="tei:note"/>
                                                    </xsl:attribute>
                                                    <span style="font-size:7pt;vertical-align:super; margin-right: 0.4em">
                                                        <xsl:number level="any" format="1" count="tei:note"/>
                                                    </span>
                                                </a>
                                            </xsl:element>
                                            <xsl:apply-templates/>
                                        </div>
                                    </xsl:for-each>
                                </p>
                            </div>
                        </div>                       
                    </div>
                    <div class="modal" tabindex="-1" role="dialog" id="exampleModal">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Infor zur Gesamtübersicht</h5>
                                </div>
                                <div class="modal-body">
                                    <p>
                                        Die Sortierung der einzelnen Spalten kann durch einen Klick auf die Spaltenüberschrift geändert werden. Das Suchfeld links oberhalb der Tabelle durchsucht den gesamten Tabelleninhalt. Darüber hinaus können mit Hilfe der Suchfelder unterhalb der
                                        Spaltenüberschriften die Inhalte dieser Spalten durchsucht beziehungsweise gefiltert werden.
                                    </p>
                                    <p>
                                        Die (ggf. gefilterte) Tabelle kann als PDF oder Excel heruntergeladen beziehungsweise in den Zwischenspeicher kopiert werden.
                                    </p>
                                    <p>
                                        Zusätzliche Spalten können über das Dropdown-Menü "Spalten" eingeblendet werden. Damit in diesen neu eingeblendeten Spalten aber auch gesucht werden kann, muss die Seite leider neu geladen werden.
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Schließen</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <xsl:call-template name="html_footer"/>
                    <script>
                        $(document).ready(function () {
                        createDataTable('tocTable')
                        });
                    </script>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:table">
        <table class="table table-striped display" id="tocTable" style="width:100%">
            <thead>
                <tr>
                    <th>Signatur</th>
                    <th>Name(Erklärung aus Verfachbuch)</th>
                    <th>Dokumententypus</th>
                    <th>Beruf</th>
                    <th>Wohnort; Ort des betreffenden Gutes/der betreffenden Behausung</th>
                    <th>Ort der Amtshandlung</th>
                    <th>Datum der Amtshandlung</th>
                    <th>Beteiligte Personen (Beamte, Gerichtsverpflichtete, Zeugen, ...)</th>
                    <th>Beteiligte Personen (Erbsinteressenten, Gerhaben, Anweiser, Verkäufer, Verpächter, Käufer, Pächter, ...)</th>
                    <th>Genannte Personen</th>
                    <th>Summe Inventar</th>
                    <th>Barschaft (teilweise eigene Berechnung)</th>
                    <th>Gesamtsumme Vermögen (vor Abzug der Passiva)</th>
                    <th>Gesamtsumme Vermögen (nach Abzug der Passiva)</th>
                    <th>Kaufpreis</th>
                    <th>Pacht</th>
                    <th>Buch/Bücher</th>
                    <th>Foto von</th>
                    <th>bis Foto</th>
                    <th>[empty]</th>
                    <th>[empty]</th>
                    <th>Gulden Inventarsumme</th>
                    <th>Kreuzer Inventarsumme</th>
                    <th>[empty]</th>
                    <th>Gulden vor Abzug Passiva</th>
                    <th>Kreuzer vor Abzug Passiva</th>
                    <th>[empty]</th>
                    <th>Gulden nach Abzug Passiva</th>
                    <th>Kreuzer nach Abzug Passiva</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="./tei:row[not(@style)]">
                    <tr>
                        <xsl:for-each select="./tei:cell">
                          <td><xsl:value-of select="./text()"/></td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    
      
</xsl:stylesheet>