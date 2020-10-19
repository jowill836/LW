<?xml version="1.0" encoding="UTF-8"?>
<!-- greeting.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>
    
    <xsl:template match="/">
        <xsl:element name="X3D">
            <xsl:attribute name="profile">Immersive</xsl:attribute>
            <xsl:attribute name="version">3.3</xsl:attribute>
            <xsl:element name="head">
                <xsl:element name="meta">
                    <xsl:attribute name="content">HellowXSLT.x3d</xsl:attribute>
                    <xsl:attribute name="name">title</xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">
                    <xsl:attribute name="content">Simple X3D example</xsl:attribute>
                    <xsl:attribute name="name">description</xsl:attribute>
                </xsl:element>
            </xsl:element>

            <xsl:element name="Scene">
                <Group>
                    <Viewpoint DEF='ViewUpClose' centerOfRotation='0 -1 0' description='Hello world!' position='0 -1 7'/>
                    <Transform translation='0 -2 0'>
                        <Shape>
                            <xsl:element name="Text">
                                <xsl:attribute name="DEF">TextMessage</xsl:attribute>
                                <xsl:attribute name="string"><xsl:value-of select="greeting"/></xsl:attribute>
                                <xsl:element name="FontStyle">
                                    <xsl:attribute name="justify">"MIDDLE" "MIDDLE"</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                            <Appearance>
                                <Material USE='MaterialLightBlue'/>
                            </Appearance>
                        </Shape>
                    </Transform>
                </Group>
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
