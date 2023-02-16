<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Buch- bzw. Werkregister'"/>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"/>
            </xsl:call-template>

            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>

                    <div class="container-custom">
                        <div class="card">
                            <div class="card-header">
                                <h1>
                                    <xsl:value-of select="$doc_title"/>
                                </h1>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped display" id="tocTable"
                                    style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>Titel</th>
                                            <th>Autor</th>
                                            <th>Exemplar(e)</th>
                                            <th>Anzahl Erwähnungen</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <xsl:for-each select=".//tei:bibl">
                                            <xsl:variable name="id">
                                                <xsl:value-of select="data(@xml:id)"/>
                                            </xsl:variable>
                                            <tr>
                                                <td>
                                                  <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of select="concat($id, '.html')"/>
                                                  </xsl:attribute>
                                                  <xsl:choose>
                                                  <xsl:when test="./tei:title[1]/text()">
                                                  <xsl:value-of select="./tei:title[1]/text()"/>
                                                  </xsl:when>
                                                  <xsl:otherwise>kein Titel</xsl:otherwise>
                                                  </xsl:choose>

                                                  </a>
                                                </td>
                                                <td>
                                                  <xsl:for-each select=".//tei:author">
                                                  <li>
                                                  <xsl:value-of select="./text()"/>
                                                  </li>
                                                  </xsl:for-each>
                                                </td>
                                                <td>
                                                  <xsl:for-each select="./tei:idno">
                                                  <li>
                                                  <a>
                                                  <xsl:attribute name="href">
                                                  <xsl:value-of select="./text()"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="./text()"/>
                                                  </a>
                                                  </li>
                                                  </xsl:for-each>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="count(.//tei:event)"/>
                                                </td>
                                                <!--<td>
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:value-of select="concat($id, '.html')"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="$id"/>
                                                    </a> 
                                                </td>-->
                                            </tr>
                                        </xsl:for-each>
                                    </tbody>
                                </table>
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
        <xsl:for-each select=".//tei:bibl">
            <xsl:variable name="filename" select="concat(./@xml:id, '.html')"/>
            <xsl:variable name="name">
                <xsl:choose>
                    <xsl:when test="./tei:title[1]/text()">
                        <xsl:value-of select="normalize-space(string-join(./tei:title[1]/text()))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>kein Titel</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:variable>
            <xsl:result-document href="{$filename}">
                <html xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:call-template name="html_head">
                        <xsl:with-param name="html_title" select="$name"/>
                    </xsl:call-template>

                    <body class="page">
                        <div class="hfeed site" id="page">
                            <xsl:call-template name="nav_bar"/>

                            <div class="container container-custom">
                                <div class="card">
                                    <div class="card-header">
                                        <h1>
                                            <xsl:value-of select="$name"/>
                                        </h1>
                                    </div>
                                    <div class="card-body">
                                        <ul>
                                            <li>
                                                <small>Titel:</small>
                                                <xsl:value-of select=".//tei:title[1]/text()"/>
                                            </li>
                                            <li>
                                                <small>Autor(en):</small>
                                                <ul>
                                                  <xsl:for-each select="./tei:author">
                                                  <li>
                                                  <xsl:choose>
                                                  <xsl:when test="./@ref">
                                                  <a href="{data(./@ref)}">
                                                  <xsl:value-of select="./text()"/>
                                                  </a>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="./text()"/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </li>
                                                  </xsl:for-each>
                                                </ul>
                                            </li>
                                            <li>
                                                <small>Exemplare: </small>
                                                <ul>
                                                  <xsl:for-each select=".//tei:idno">
                                                  <li>
                                                  <a href="{data(./@ref)}">
                                                  <xsl:value-of select="./text()"/>
                                                  </a>
                                                  </li>
                                                  </xsl:for-each>
                                                </ul>
                                            </li>
                                        </ul>



                                        <hr/>
                                        <div id="mentions">
                                            <legend>erwähnt in</legend>
                                            <ul>
                                                <xsl:for-each select=".//tei:event">
                                                  <xsl:variable name="linkToDocument">
                                                  <xsl:value-of
                                                  select="replace(tokenize(data(.//@target), '/')[last()], '.xml', '.html')"
                                                  />
                                                  </xsl:variable>


                                                  <li>
                                                  <xsl:value-of select=".//tei:title"/>
                                                  <xsl:text> </xsl:text>
                                                  <a href="{$linkToDocument}">
                                                  <i class="fas fa-external-link-alt"/>
                                                  </a>
                                                  </li>


                                                </xsl:for-each>
                                            </ul>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <xsl:call-template name="html_footer"/>
                        </div>
                    </body>
                </html>
            </xsl:result-document>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
