<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : dico2.xsl
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
                <link rel="stylesheet" type="text/css" href="main.css" media="screen"/>

            </head>
            <body>
                <h1>
                    <b>MOTS DU DICTIONNAIRE</b>
                </h1>
                <table>
                    <tr>
                        <th>Mots</th>
                        <th>Niveau</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select = "//tux:mot">
                            <xsl:sort order = "ascending" select="@niveau"/>
                        </xsl:apply-templates>
                    
                    </tr>
                    
                </table> 
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tux:mot">
        
        <tr>
            <td>
           
               <xsl:value-of select="."/>        
            
            </td>
            <td> <xsl:value-of select="@niveau" /></td>
        </tr>
    </xsl:template>
    
    

</xsl:stylesheet>
