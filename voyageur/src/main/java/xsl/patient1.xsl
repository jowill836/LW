<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : patient1.xsl
    Created on : 25 octobre 2020, 02:53
    Author     : josias
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:cab = "http://www.ujf-grenoble.fr/l3miage/medical"
                xmlns:act= 'http://www.ujf-grenoble.fr/l3miage/actes'
                version="1.0">
    <xsl:output method="xml" indent="yes"/>


    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:param name="destinedName" select="Orouge"/>
    <xsl:variable name="actes" select="document('actes.xml', /)/act:ngap"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select = "//cab:patient[cab:nom = 'Orouge']">
            <xsl:with-param name="destinedName" select="Orouge"/>
        </xsl:apply-templates>
        
    </xsl:template>
    
    <xsl:template match="//cab:patient">
        <xsl:param name="destinedName"/>
        <cab:patient>
            <cab:nom>
                <xsl:value-of select="cab:nom"/>
            </cab:nom>
            <cab:prénom>
                <xsl:value-of select="cab:prénom"/>
            </cab:prénom>
            <cab:sexe>
                <xsl:value-of select="cab:sexe"/>
            </cab:sexe>
            <cab:naissance>
                <xsl:value-of select="cab:naissance"/>
            </cab:naissance>
            <cab:numéro>
                <xsl:value-of select="cab:numéro"/>
            </cab:numéro>
            <cab:adresse>
                <cab:étage>
                    <xsl:value-of select="cab:adresse/cab:étage"/>
                </cab:étage>
                <cab:numéro>
                    <xsl:value-of select="cab:adresse/cab:numéro"/>
                </cab:numéro>
                <cab:rue>
                    <xsl:value-of select="cab:adresse/cab:rue"/>
                </cab:rue>
                <cab:ville>
                    <xsl:value-of select="cab:adresse/cab:ville"/>
                </cab:ville>
                <cab:codePostal>
                    <xsl:value-of select="cab:adresse/cab:codePostal"/>
                </cab:codePostal>
            </cab:adresse>
            <cab:visite>
                <cab:date>
                    <xsl:value-of select="cab:visite/@date"/>

                </cab:date>
                <cab:intervenant>
                    <xsl:variable name="idInf" select="cab:visite/@intervenant"/>
                    <cab:nom>
                        <xsl:value-of select="../../cab:infirmiers/cab:infirmier[@id = $idInf]/cab:nom"/>
                    </cab:nom>
                    <cab:prénom>
                        <xsl:value-of select="../../cab:infirmiers/cab:infirmier[@id = $idInf]/cab:prénom"/>
                    </cab:prénom>
                </cab:intervenant>
                <cab:acte>
                    <xsl:variable name="codeP" select="cab:visite/cab:acte/@id"/>
                    <xsl:value-of select="$actes/act:actes/act:acte[@id = $codeP]"/>
                </cab:acte>
            </cab:visite>
        </cab:patient>
    </xsl:template>

</xsl:stylesheet>
