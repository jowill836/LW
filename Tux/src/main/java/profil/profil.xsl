<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : profil.xsl
    Created on : 10 octobre 2020, 23:27
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
                <title>profil</title>
            </head>
            <body>
              
                <table style = "width:100%;" border = "1">
                    <tr>
                        <th>Nom</th>
                        <th>Avatar</th>
                        <th>Anniversaires</th>
                        <th>Parties</th>
                    </tr>
                    <xsl:for-each select = "//tux:profil" >
                        <tr> 
                            <td align = "center">
                                <xsl:value-of select="tux:nom"/>
                            </td>     
                            <td align = "center">
                                <xsl:value-of select="tux:avatar"/>
                            </td>
                            <td align = "center">
                                <xsl:value-of select="tux:anniversaire"/>
                            </td>
                            <td>
                                <table style = "width:100%;" border = "1">
                                    <th>Date</th>
                                    <th>Temps</th>
                                    <th>Mot</th>
                                    <th>Trouvé</th>
                                    <xsl:for-each select = "//tux:partie" >
                                    <tr>
                                        <td align = "center" >
                                            <xsl:value-of select="@date"/>
                                        </td>
                                        <td align = "center">
                                            <xsl:value-of select="tux:temps"/>
                                        </td>  
                                        <td align = "center">
                                            <xsl:value-of select="tux:mot"/>
                                        </td>
                                        <td align = "center" >
                                            <xsl:value-of select="@trouvé"/>
                                        </td>  
                                    </tr>
                                    </xsl:for-each>
                                </table>
                        
                            </td>       
               
                        </tr>
                    </xsl:for-each>
                </table>
           
            </body>
        </html>
    </xsl:template>
    
    

</xsl:stylesheet>
