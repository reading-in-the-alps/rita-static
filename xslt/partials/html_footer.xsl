<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        
    <footer class="main-footer">
        
            <div class="footer-wrapper">
                
                <div class="row">
                    <div class="col-md-3">
                        <a href="https://www.oeaw.ac.at/acdh/acdh-home/" target="_blank" rel="noopener" aria-label="ACDH-CH">
                            <img src="https://shared.acdh.oeaw.ac.at/acdh-common-assets/images/acdh-ch-logo-grayscale.svg" alt="ACDHCH" title="Austrian Centre for Digital Humanities and Cultural Heritage"/>Austrian Centre for Digital Humanities and Cultural Heritage
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder?search[what]=P+29329" target="_blank" rel="noopener" aria-label="FWF P 29329">
                            <img src="img/fwf.gif" alt="FWF" title="FWF funded Project P 29329"/>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="https://www.tirol.gv.at/bildung/tiroler-wissenschaftsfoerderung/" target="_blank" rel="noopener" aria-label="Tiroler Wissenschaftförderung">
                            <img src="img/twf_logo.png" alt="TWF" title="Tiroler Wissenschaftförderung"/>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a href="https://www.uibk.ac.at/" target="_blank" rel="noopener" aria-label="UIBK">
                            <img src="img/uibklogo.png" alt="UIBK" title="University of Innsbruck"/>
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer-imprint-bar">
                <a href="imprint.html">Impressum/Imprint</a> | <small>
                    <a href="https://hdl.handle.net/21.11115/0000-000C-D8D9-C">21.11115/0000-000C-D8D9-C</a>
                </small>
                <div class="row" style="padding-top: 20px;">
                    <div class="col-sm">
                        <a href="https://github.com/reading-in-the-alps/rita-app">
                            <em class="fab fa-github-square fa-2x"/>
                        </a>
                    </div>
                </div>
            </div>
        
        
    </footer>
        <script type="text/javascript" src="dist/fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="dist/fundament/js/fundament.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>
        <script type="text/javascript" src="js/dt.js"></script>
    </xsl:template>
</xsl:stylesheet>