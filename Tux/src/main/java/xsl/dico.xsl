<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : dico.xsl
    Created on : 10 octobre 2020, 21:23
    Author     : josias
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tux = "http://myGame/tux"
                version="1.0">
    <xsl:output method="html"/>


    <xsl:template match="/">
        <html>
            <head>
                <title>dictionnaire</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select = "//tux:mot">
                        <xsl:sort order = "ascending"/>
                    </xsl:apply-templates>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tux:mot">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    

</xsl:stylesheet>
