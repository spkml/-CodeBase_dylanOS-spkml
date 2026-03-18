<?xml version="1.0" encoding="UTF-8"?>
<!--
    SPKML to HTML5 XSLT Transformation
    
    This stylesheet transforms SPKML documents into valid HTML5.
    
    Target Namespace: http://dylan.os/spkml/1.0
    Output Format: HTML5 with CSS
    
    Usage:
      xsltproc spkml-to-html.xslt input.spkml > output.html
      
    License: CC-BY-SA 4.0
    Maintained by: Dylan OS Foundation
    Last Updated: February 2026
-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:spkml="http://dylan.os/spkml/1.0"
    exclude-result-prefixes="spkml">

  <xsl:output method="html" encoding="UTF-8" version="5.0" indent="yes"/>

  <!-- ============================================
       HTML5 Document Structure
       ============================================ -->

  <xsl:template match="/spkml:spkml">
    <html lang="{@xml:lang='en'}">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>
          <xsl:value-of select="spkml:metadata/spkml:title"/>
        </title>
        <style>
          <xsl:call-template name="default-styles"/>
        </style>
      </head>
      <body>
        <xsl:apply-templates select="spkml:metadata"/>
        <main>
          <xsl:apply-templates select="*[not(self::spkml:metadata)]"/>
        </main>
      </body>
    </html>
  </xsl:template>

  <!-- ============================================
       Default CSS Styles
       ============================================ -->

  <xsl:template name="default-styles">
    <xsl:text>
      body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        line-height: 1.6;
        max-width: 900px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f5f5f5;
        color: #333;
      }
      
      header {
        border-bottom: 2px solid #333;
        margin-bottom: 30px;
        padding-bottom: 20px;
      }
      
      header h1 {
        margin: 0;
        font-size: 2.5em;
      }
      
      header .metadata {
        font-size: 0.9em;
        color: #666;
        margin-top: 10px;
      }
      
      main {
        background-color: white;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      }
      
      h1, h2, h3, h4, h5, h6 {
        margin-top: 1.5em;
        margin-bottom: 0.5em;
        font-weight: 600;
      }
      
      h1 { font-size: 2em; border-bottom: 2px solid #333; padding-bottom: 10px; }
      h2 { font-size: 1.6em; border-bottom: 1px solid #666; padding-bottom: 5px; }
      h3 { font-size: 1.3em; }
      h4 { font-size: 1.1em; }
      h5 { font-size: 1em; }
      h6 { font-size: 0.9em; }
      
      p {
        margin: 1em 0;
        text-align: justify;
      }
      
      ul, ol {
        margin: 1em 0;
        padding-left: 30px;
      }
      
      li {
        margin: 0.5em 0;
      }
      
      code {
        background-color: #f0f0f0;
        padding: 2px 6px;
        border-radius: 3px;
        font-family: 'Courier New', monospace;
        font-size: 0.9em;
      }
      
      pre {
        background-color: #f0f0f0;
        padding: 15px;
        border-left: 4px solid #333;
        overflow-x: auto;
        font-family: 'Courier New', monospace;
        line-height: 1.4;
      }
      
      blockquote {
        border-left: 4px solid #999;
        margin-left: 0;
        padding-left: 20px;
        color: #666;
        font-style: italic;
      }
      
      table {
        border-collapse: collapse;
        width: 100%;
        margin: 1em 0;
      }
      
      th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
      }
      
      th {
        background-color: #f0f0f0;
        font-weight: bold;
      }
      
      figure {
        margin: 2em 0;
        text-align: center;
      }
      
      img {
        max-width: 100%;
        height: auto;
        border: 1px solid #ddd;
        border-radius: 5px;
      }
      
      figcaption {
        font-size: 0.9em;
        color: #666;
        margin-top: 10px;
        font-style: italic;
      }
      
      .metadata {
        font-size: 0.9em;
        color: #666;
      }
      
      .reference {
        color: #0066cc;
        text-decoration: none;
      }
      
      .reference:hover {
        text-decoration: underline;
      }
      
      strong {
        font-weight: bold;
      }
      
      em {
        font-style: italic;
      }
    </xsl:text>
  </xsl:template>

  <!-- ============================================
       Metadata Rendering
       ============================================ -->

  <xsl:template match="spkml:metadata">
    <header>
      <h1>
        <xsl:value-of select="spkml:title"/>
      </h1>
      <xsl:if test="spkml:subtitle">
        <h2 style="font-size: 1.3em; border: none; margin: 0.5em 0;">
          <xsl:value-of select="spkml:subtitle"/>
        </h2>
      </xsl:if>
      <div class="metadata">
        <xsl:if test="spkml:author">
          <p>By <strong><xsl:value-of select="spkml:author"/></strong></p>
        </xsl:if>
        <xsl:if test="spkml:date">
          <p>Published: <xsl:value-of select="spkml:date"/></p>
        </xsl:if>
        <xsl:if test="spkml:version">
          <p>Version: <xsl:value-of select="spkml:version"/></p>
        </xsl:if>
        <xsl:if test="spkml:keywords">
          <p>Keywords: <xsl:value-of select="spkml:keywords"/></p>
        </xsl:if>
      </div>
    </header>
  </xsl:template>

  <!-- ============================================
       Structural Elements
       ============================================ -->

  <xsl:template match="spkml:section">
    <section>
      <xsl:copy-of select="@id|@class|@role|@xml:lang"/>
      <xsl:apply-templates/>
    </section>
  </xsl:template>

  <xsl:template match="spkml:subsection">
    <section>
      <xsl:copy-of select="@id|@class|@role|@xml:lang"/>
      <xsl:apply-templates/>
    </section>
  </xsl:template>

  <!-- ============================================
       Heading Elements
       ============================================ -->

  <xsl:template match="spkml:heading">
    <xsl:element name="h{@level}">
      <xsl:copy-of select="@id|@class"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <!-- ============================================
       Text Elements
       ============================================ -->

  <xsl:template match="spkml:paragraph">
    <p>
      <xsl:copy-of select="@id|@class"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="spkml:emphasis">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>

  <xsl:template match="spkml:strong">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>

  <xsl:template match="spkml:code">
    <code>
      <xsl:apply-templates/>
    </code>
  </xsl:template>

  <xsl:template match="spkml:literal">
    <code style="white-space: pre;">
      <xsl:apply-templates/>
    </code>
  </xsl:template>

  <!-- ============================================
       List Elements
       ============================================ -->

  <xsl:template match="spkml:list[@type='ordered']">
    <ol>
      <xsl:copy-of select="@id|@class"/>
      <xsl:if test="@start">
        <xsl:attribute name="start">
          <xsl:value-of select="@start"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="spkml:list[@type='unordered']">
    <ul>
      <xsl:copy-of select="@id|@class"/>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="spkml:item">
    <li>
      <xsl:copy-of select="@id|@class"/>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <!-- ============================================
       Code Elements
       ============================================ -->

  <xsl:template match="spkml:codeblock">
    <figure style="margin: 1.5em 0;">
      <xsl:if test="@title">
        <figcaption>
          <xsl:value-of select="@title"/>
        </figcaption>
      </xsl:if>
      <pre><code class="language-{@language}"><xsl:apply-templates/></code></pre>
    </figure>
  </xsl:template>

  <!-- ============================================
       Media Elements
       ============================================ -->

  <xsl:template match="spkml:figure">
    <figure>
      <img src="{@src}" alt="{@alt}" title="{@title}"/>
      <xsl:if test="spkml:caption">
        <figcaption>
          <xsl:apply-templates select="spkml:caption"/>
        </figcaption>
      </xsl:if>
    </figure>
  </xsl:template>

  <xsl:template match="spkml:audio">
    <figure style="margin: 1.5em 0;">
      <audio controls style="width: 100%;">
        <source src="{@src}" type="audio/{@format}"/>
        Your browser does not support the audio element.
      </audio>
      <xsl:if test="spkml:description">
        <figcaption>
          <xsl:apply-templates select="spkml:description"/>
        </figcaption>
      </xsl:if>
    </figure>
  </xsl:template>

  <xsl:template match="spkml:video">
    <figure style="margin: 1.5em 0;">
      <video controls style="width: 100%; max-width: {@width}px;">
        <source src="{@src}" type="video/{@format}"/>
        Your browser does not support the video element.
      </video>
      <xsl:if test="spkml:description">
        <figcaption>
          <xsl:apply-templates select="spkml:description"/>
        </figcaption>
      </xsl:if>
    </figure>
  </xsl:template>

  <!-- ============================================
       Table Elements
       ============================================ -->

  <xsl:template match="spkml:table">
    <table>
      <xsl:copy-of select="@id|@class"/>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="spkml:header">
    <thead>
      <tr>
        <xsl:apply-templates/>
      </tr>
    </thead>
  </xsl:template>

  <xsl:template match="spkml:row">
    <tr>
      <xsl:apply-templates/>
    </tr>
  </xsl:template>

  <xsl:template match="spkml:cell">
    <td>
      <xsl:copy-of select="@colspan|@rowspan|@align"/>
      <xsl:apply-templates/>
    </td>
  </xsl:template>

  <!-- ============================================
       Citation Elements
       ============================================ -->

  <xsl:template match="spkml:quote">
    <blockquote>
      <xsl:if test="@source">
        <p><em>— <xsl:value-of select="@source"/></em></p>
      </xsl:if>
      <xsl:apply-templates/>
    </blockquote>
  </xsl:template>

  <xsl:template match="spkml:reference">
    <a href="{@url}" class="reference" title="{.}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <!-- ============================================
       Concept Elements
       ============================================ -->

  <xsl:template match="spkml:concept">
    <section style="background-color: #f9f9f9; padding: 15px; margin: 1.5em 0; border-left: 4px solid #0066cc; border-radius: 3px;">
      <xsl:if test="spkml:term">
        <h4 style="margin-top: 0;">
          <xsl:apply-templates select="spkml:term"/>
        </h4>
      </xsl:if>
      <xsl:if test="spkml:definition">
        <p><strong>Definition:</strong> <xsl:apply-templates select="spkml:definition"/></p>
      </xsl:if>
      <xsl:if test="spkml:explanation">
        <p><strong>Explanation:</strong></p>
        <xsl:apply-templates select="spkml:explanation"/>
      </xsl:if>
      <xsl:if test="spkml:example">
        <div style="margin-top: 1em;">
          <strong>Example:</strong>
          <xsl:apply-templates select="spkml:example"/>
        </div>
      </xsl:if>
    </section>
  </xsl:template>

</xsl:stylesheet>
