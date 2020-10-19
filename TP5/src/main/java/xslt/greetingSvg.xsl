<?xml version="1.0"?>
<!-- svg-greeting.xsl -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/2000/svg">
  <xsl:template match="/">
    <svg width="10cm" height="4cm">
      <g>
        <defs>
          <radialGradient id="MyGradient" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" style="stop-color:rgb(70,36,28)"/>
            <stop offset="100%" style="stop-color:rgb(10,255,25)"/>
            <stop offset="100%" style="stop-color:rgb(20,25,55)"/>
          </radialGradient>
        </defs>
        <rect style="fill:url(#MyGradient); stroke:black" x="1cm" y="1cm" width="8cm" height="2cm"/>
        <text x="5.05cm" y="2.25cm" text-anchor="middle" style="font-family:Verdana; font-size:24; font-weight:bold; fill:black">
          <xsl:apply-templates select="greeting"/>
        </text>
        <text x="5cm" y="2.2cm" text-anchor="middle" style="font-family:Verdana; font-size:24; font-weight:bold; fill:white">
          <xsl:apply-templates select="greeting"/>
        </text>
      </g>
    </svg>
  </xsl:template>
  <xsl:template match="greeting">
    <xsl:value-of select="."/>
  </xsl:template>
</xsl:stylesheet>
