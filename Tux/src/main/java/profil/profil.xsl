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
                                <link rel="stylesheet" type="text/css" href="main.css" media="screen"/>

            </head>
            <body>
                <h1>
                    <b>INFO JOUEUR</b>
                </h1>
              
                   
                       
                    
                <xsl:for-each select = "//tux:profil" >
                        
                    <p>  
                        <b>Nom:</b> 
               
                        <xsl:value-of select="tux:nom"/>
                           <br/>     
                           <b>Avatar:</b>
                        <xsl:value-of select="tux:avatar"/>
                        <br/>
                        <b>Anniversaires:</b>
                        <xsl:value-of select="tux:anniversaire"/>
                    </p>
                    <h3>Parties</h3>
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
                        
                           
               
                
                </xsl:for-each>
            
           
            </body>
        </html>
    </xsl:template>
    
    

</xsl:stylesheet>
