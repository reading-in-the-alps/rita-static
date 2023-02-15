<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>

        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container container-custom">
                        <h1 style="text-align:center">Lesen im Alpental</h1>
                        <h2 style="text-align:center">Privater Buchbesitz im katholisch dominierten Zentralalpenraum 1750–1800. Eine systematische Untersuchung anhand von Inventaren aus dem Pustertal und dem Stubaital</h2>
                        
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" style="margin:20px">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="img/tlmf_books.jpg" alt="First slide" width="75%"/>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h2>„Alte Bücher im
                                            <a href="http://www.tiroler-landesmuseen.at/page.cfm?vpath=haeuser/ferdinandeum/haus/bibliothek">TLMF</a>. Foto:
                                            <a href="https://www.uibk.ac.at/geschichte-ethnologie/mitarbeiterinnen/projekt/span-michael/">Michael Span"</a>
                                        </h2>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="img/tla-aktenserie-lg-mieders-fasz-7-pos-5-004.jpg" alt="Second slide"/>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>„Inventar aus dem
                                            <a href="https://www.tirol.gv.at/kunst-kultur/landesarchiv/">Tiroler Landesarchiv</a>
                                            <br/>
                                            <small>© Tiroler Landearchiv, Landgericht Mieders, Aktenserie Fasz. 7, Pos. 5 (Inventare 1754), Nr. 29 (Inventar des Urban Sachser), Blatt 3v-4r.“</small>
                                        </h3>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="img/tlmf_cochem.jpg" alt="Third slide"/>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>„Cochem, Leben Christi (<a href="http://www.tiroler-landesmuseen.at/page.cfm?vpath=haeuser/ferdinandeum/haus/bibliothek">TLMF</a>). Foto:
                                            <a href="https://www.uibk.ac.at/geschichte-ethnologie/mitarbeiterinnen/projekt/span-michael/">Michael Span"</a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"/>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"/>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        
                            
                            <p style="text-align:justify">Ziel dieses FWF-geförderten, vom Institut für Geschichtswissenschaften und Europäische Ethnologie der Universität Innsbruck und dem Austrian Center for Digital Humanities and Cultural Heritage der Österreichischen Akademie der Wissenschaften
                                (ACDHCH-ÖAW) durchgeführten Projekts ist die systematische Erforschung des privaten Buchbesitzes im katholisch dominierten Zentralalpenraum, genauer gesagt in Tirol, für den Zeitraum von 1750 bis 1800. Als Hauptquelle werden – wie das auch in
                                vergleichbaren Studien, die sich bislang vor allem mit protestantisch-pietistisch geprägten Regionen beschäftigten, gemacht wurde – Inventare herangezogen. Bücher, die in rund 2000 Inventaren aus dem Südtiroler Pustertal genannt werden, sollen
                                erhoben und so der private Buchbesitz in dieser Region beschrieben und systematisch analysiert werden.</p>
                            <p style="text-align:justify">Wer besaß Bücher und welche Muster lassen sich bei den BuchbesitzerInnen beobachten? (Geschlecht, Alter, sozioökonomischer Hintergrund, Beruf)</p>
                            <p style="text-align:justify">Welche und wie viele Bücher waren im Umlauf bzw. populär/verbreitet? (religiöser oder weltlicher Inhalt, Autoren, Herkunft, Wert/Preis, Auswirkungen von staatlicher/kirchlicher Zensur)</p>
                            <p style="text-align:justify">Welche Unterschiede und Parallelen zeigen sich im Vergleich zu existierenden Studien?</p>
                            <p style="text-align:justify">Diese Studie betritt Neuland, nicht nur für das historische Tirol, sondern auch für das Gebiet des heutigen Österreich und den gesamten katholisch-süddeutschen Raum.</p>
                            <p style="text-align:justify">In Kooperation mit dem Austrian Center for Digital Humanities and Cultural Heritage der Österreichischen Akademie der Wissenschaften (ACDHCH-ÖAW), werden die Daten aus den systematisch analysierten Inventare hier in einer XML-codierten
                                Online-Datenbank publiziert. Auf diese Weise sollen sowohl die Wissenschaft als auch die interessierte Öffentlichkeit einfachen Zugang zu den aufbereiteten Quellen erhalten, die für eine ganze Reihe von Fragestellungen von Interesse sein können.</p>
                            <p style="text-align:justify">In einer Pilotstudie wurden bereits rund 200 Inventare aus dem Tiroler Stubaital untersucht. Die Ergebnisse sind hier ebenfalls zu finden.</p>
                            <h1 style="text-align:center">
                                <a class="btn btn-main btn-outline-primary btn-lg" href="toc.html?collection=editions" role="button">Inventare Pustertal</a>
                                <a class="btn btn-main btn-outline-primary btn-lg" href="rita1.html?collection=rita1" role="button">Inventare Stubaital</a>
                            </h1>
                        
                    </div>
                
                    
                    
                    
                    <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>