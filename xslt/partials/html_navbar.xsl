<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl tei xs" version="2.0">
    <xsl:template match="/" name="nav_bar">
        <div class="wrapper-fluid wrapper-navbar sticky-navbar" id="wrapper-navbar" >
            <a class="skip-link screen-reader-text sr-only" href="#content">Skip to content</a>
            <nav class="navbar navbar-expand-md navbar-light fixed-top bg-white box-shadow">
                <a class="navbar-brand" href="/">
                    <img src="img/project_logo.png" alt="Rita" title="Reading in the Alps, logo (c) by Sandra Lehecka"/>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"/>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Menü
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="/">Start</a>
                                <a class="dropdown-item" href="about.html">Über das Projekt</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Transkriptionen
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="../pages/toc.html?collection=editions">Pustertal (rita 2)</a>
                                <a class="dropdown-item" href="../pages/rita1.html?collection=rita1">Stubaital (rita 1)</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Summarische Auswertungen
                            </a>
                            <div class="dropdown-menu">
                                <h3 class="dropdown-header">Metadaten Inventare Pustertal (rita 2)</h3>
                                <a class="dropdown-item" href="../pages/show.html?document=lg_michaelsburg.xml&amp;directory=inventare">Landgericht St. Michaelsburg</a>
                                <a class="dropdown-item" href="../pages/show.html?document=sg_bruneck.xml&amp;directory=inventare">Stadtgericht Bruneck</a>
                                <a class="dropdown-item" href="../pages/show.html?document=oag_bruneck.xml&amp;directory=inventare">Oberamtsgericht Bruneck</a>
                                <a class="dropdown-item" href="../pages/inventare.html#myTable=vt0.1.2.3.16">Pustertal gesamt</a>
                                <h6 class="dropdown-header">Metadaten Inventare Pustertal (rita 2)</h6>
                                <a class="dropdown-item" href="../pages/show.html?document=rita1_summary.xml&amp;directory=meta&amp;stylesheet=inventare">Metadaten Inventare Stubaital (rita 1)</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Register
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="../pages/persons.html">Personen</a>
                                <a class="dropdown-item" href="../pages/places.html">Orte</a>
                                <a class="dropdown-item" href="../pages/bibl.html">Bücher</a>
                                <div class="dropdown-divider"/>
                                <a class="dropdown-item" href="../pages/netvis.html">Netzwerkgrafik</a>
                                
                            </div>
                        </li>
                    </ul>
                    <form method="get" action="../pages/ft_search.html" class="form-inline my-2 my-lg-0">
                        <input name="searchexpr" class="form-control mr-sm-2" type="text" placeholder="Suchen" aria-label="Suchen"/>
                        <button class="btn btn-main btn-outline-primary btn-mg" type="submit">Suchen</button>
                    </form>
                </div>
            </nav>
            <!-- .site-navigation -->
        </div>
    </xsl:template>
</xsl:stylesheet>