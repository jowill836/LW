<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : cabinet.xsl
    Created on : 24 octobre 2020, 20:57
    Author     : josias
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:cab = "http://www.ujf-grenoble.fr/l3miage/medical"
                xmlns:act= 'http://www.ujf-grenoble.fr/l3miage/actes'
                version="1.0">
    <xsl:output method="html"/>

    <xsl:param name="destinedId" select="001"/>
    <xsl:variable name="visitesDuJour" select="//cab:visite[@intervenant = $destinedId]"/>
    <xsl:variable name="actes" select="document('actes.xml', /)/act:ngap"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>cabinet</title>
                <link rel="stylesheet" type="text/css" href="main.css" media="screen"/>
                <script type ="text/javascript">
                    function openFacture(prenom, nom, actes) {
                    var width  = 500;
                    var height = 300;
                    if(window.innerWidth) {
                    var left = (window.innerWidth-width)/2;
                    var top = (window.innerHeight-height)/2;
                    }
                    else {
                    var left = (document.body.clientWidth-width)/2;
                    var top = (document.body.clientHeight-height)/2;
                    }
                    var factureWindow = window.open('','facture','menubar=yes, scrollbars=yes, top='+top+', left='+left+', width='+width+', height='+height+'');
                    factureText = "Facture pour : " + prenom + " " + nom;
                    factureWindow.document.write(factureText);
                    }   
                </script>
            </head>
            <body>
                <h1>
                    <b>FICHE INFIRMIER</b>
                </h1>
                <h4>Bonjour <xsl:value-of select="//cab:infirmier[@id = $destinedId]/cab:prénom"/>, </h4>
                <h4>Aujourd'hui, vous avez <xsl:value-of select="count(//cab:patient/cab:visite[@intervenant = $destinedId]/../cab:nom)"/> patient(es)</h4>
                <table border ="1" style =  "width:100%;">
                    <tr>
                        <th style = "width:25%;">Date</th>
                        <th style = "width:25%;">NOM</th>
                        <th style = "width:25%;">Adresse</th>
                        <th style = "width:25%;">Liste soins</th>
                    </tr>
                </table>
                
                <xsl:apply-templates select = "//cab:visite[@intervenant= $destinedId]">
                    <xsl:sort order = "ascending"/>
                </xsl:apply-templates>
               
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//cab:visite">
        <table border ="1" style =  "width:100%;">
            
            <tr>
                <td style = "width:25%;" align = "center">
                    <xsl:value-of select="@date"/>
                </td>
                <td style =  "width:25%;" align = "center">
                    <xsl:value-of select="../cab:nom"/>
                </td>
                <td align = "center" style = "width:25%;">
                    <xsl:value-of select="../cab:adresse/."/>
                   
                    
                </td>
                <td  style = "width:25%;" align = "center">
                    <xsl:variable name="code" select="cab:acte/@id"/>
                    <xsl:value-of select="$actes/act:actes/act:acte[@id = $code]"/>
                    
                    <input type="button" value="Facture">
                        <xsl:attribute name="onclick">
                            openFacture('<xsl:value-of select="../cab:prénom"/>', 
                            '<xsl:value-of select="../cab:nom"/>', 
                            '<xsl:value-of select="../cab:acte"/>')
                        </xsl:attribute>   
                    </input>
                    
                </td>
            </tr>
            
        </table>
        
    </xsl:template>

</xsl:stylesheet>
