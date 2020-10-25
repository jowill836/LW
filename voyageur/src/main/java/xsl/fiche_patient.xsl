<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : fiche_patient.xsl
    Created on : 25 octobre 2020, 04:08
    Author     : josias
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:cab = "http://www.ujf-grenoble.fr/l3miage/medical"
                xmlns:act= 'http://www.ujf-grenoble.fr/l3miage/actes'
                version="1.0">    
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Fiche patient</title>
                <link rel="stylesheet" type="text/css" href="main.css" media="screen"/>
            </head>
            <body>
                <h1>
                    <b>FICHE PATIENT</b>
                </h1>
                
                <p>    
                    <b> Nom: </b> 
                    <xsl:value-of select="//cab:patient/cab:nom"/>
                    <br/>    
                    
                    <b>Prénom: </b> 
                    <xsl:value-of select="//cab:patient/cab:prénom"/>
                    <br/>   
                    
                    <b>Sexe: </b> 
                    <xsl:value-of select="//cab:patient/cab:sexe"/>
                    <br/>  
                    
                    <b>Date de naissance: </b> 
                    <xsl:value-of select="//cab:patient/cab:naissance"/>
                    <br/> 
                    
                    <b>Numéro de sécurité sociale: </b> 
                    <xsl:value-of select="//cab:patient/cab:numéro"/>
                    <br/>  
                    
                    <b>Adresse: </b> 
                    
                    <br/>              
                    Etage: 
                    <xsl:value-of select="//cab:patient/cab:adresse/cab:étage"/>
                    <br/>         
                             
                    Numéro: 
                    <xsl:value-of select="//cab:patient/cab:adresse/cab:numéro"/>
                            
                    <br/>          
                    Rue: 
                    <xsl:value-of select="//cab:patient/cab:adresse/cab:rue"/>
                    <br/>        
                             
                    Code postal: 
                    <xsl:value-of select="//cab:patient/cab:adresse/cab:codePostal"/>
                    <br/>         
                             
                    Ville: 
                    <xsl:value-of select="//cab:patient/cab:adresse/cab:ville"/>
                    <br/>
                            
                </p>   
                <h3 align = "center">
                    <b  > Visites</b>
                </h3>  
                        
                <table  border =" 1" style="width:100%;">   
                  
                        
         
                
                    <tr>
                        <th style="width:33,33%;">Dates</th>
                        <th style="width:33,33%;">Intervenants</th>
                        <th style="width:33,33%;">Actes</th>
                    </tr>
                    <tr>
                        <td style="width:33,33%;">
                            <xsl:value-of select="//cab:patient/cab:visite/cab:date"/>

                        </td>
                        <td style="width:33,33%;">
                            <xsl:value-of select="//cab:patient/cab:visite/cab:intervenant"/>
                        </td>
                        <td style="width:33,33%;">
                            <xsl:value-of select="//cab:patient/cab:visite/cab:acte"/>
                        </td>
                    </tr>
                    
                </table>
                    
                
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
