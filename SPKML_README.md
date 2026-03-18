# SPKML: Semantic Programming and Knowledge Markup Language
## Complete Ecosystem Guide & Documentation

**Version:** 1.0.0  
**Release Date:** February 2026  
**Maintained By:** Dylan OS Foundation  
**License:** CC-BY-SA 4.0  
**Status:** Production Ready  

---

## Quick Start

### 1. Download SPKML Files

Clone or download the SPKML specification package:

```bash
# Files you'll need:
- spkml.dtd              # Document Type Definition
- spkml.xsd              # XML Schema Definition
- spkml-to-html.xslt     # XSLT transformation to HTML5
- spkml-default.css      # Default CSS stylesheet
- SPKML_Specification_1.0.md  # Full specification
- SPKML_Template_Examples.md  # Ready-to-use templates
```

### 2. Choose a Template

Start with one of the provided templates:

```bash
cp SPKML_Template_Examples.md template-blog-post.spkml
# Edit template-blog-post.spkml with your content
```

### 3. Validate Your Document

```bash
# Using xmllint (part of libxml2)
xmllint --schema spkml.xsd your-document.spkml

# Or using Python's xml module
python3 -m xml.etree.ElementTree your-document.spkml
```

### 4. Transform to HTML

```bash
# Using xsltproc (part of libxslt)
xsltproc --stringparam stylesheet spkml-default.css \
         spkml-to-html.xslt \
         your-document.spkml > output.html
```

### 5. View in Browser

Open `output.html` in any modern web browser.

---

## What is SPKML?

SPKML is a **semantic, format-agnostic XML markup language** designed for:

- **Knowledge preservation**: Represent content in its essential semantic form
- **Multi-format output**: Transform the same SPKML to HTML, PDF, ePub, plain text
- **Machine readability**: Parse and extract knowledge programmatically
- **Accessibility**: Native support for screen readers and accessibility tools
- **Longevity**: XML-based format that will remain readable for decades

SPKML is **not** a replacement for HTML, Markdown, or Word. Rather, it's a **semantic superstructure** that sits at a higher level of abstraction.

---

## Files in This Package

### Core Specification Files

#### `SPKML_Specification_1.0.md`
- **Purpose**: Complete SPKML specification with detailed element reference
- **Contains**: 
  - Design philosophy
  - Core syntax and rules
  - Complete element reference (50+ elements)
  - 7 document type examples
  - Language support (100+ languages)
  - Code examples
  - Best practices

#### `spkml.dtd` (Document Type Definition)
- **Purpose**: Validates SPKML documents using DTD rules
- **Use**: `<!DOCTYPE spkml PUBLIC "-//Dylan OS//DTD SPKML 1.0//EN" "http://dylan.os/spkml/1.0/spkml.dtd">`
- **When to use**: Legacy XML validators, doctype-based validation
- **Size**: ~6KB

#### `spkml.xsd` (XML Schema Definition)
- **Purpose**: Modern, detailed validation of SPKML documents
- **Use**: XSD validation with tools like xmllint, VS Code, oxygen
- **When to use**: New documents, strict validation, IDE integration
- **Features**: 
  - Type definitions for all elements
  - Attribute restrictions and patterns
  - Language code validation (ISO 639-1)
  - URI format validation
  - Cardinality and occurrence rules

### Transformation Files

#### `spkml-to-html.xslt` (XSLT Stylesheet)
- **Purpose**: Transform SPKML → HTML5
- **Use**: `xsltproc spkml-to-html.xslt input.spkml > output.html`
- **Output**: Valid HTML5 with semantic markup
- **Size**: ~15KB
- **Requirements**: libxslt (usually pre-installed on Linux/Mac)

#### `spkml-default.css` (Cascading Stylesheets)
- **Purpose**: Professional styling for SPKML-generated HTML
- **Features**:
  - Responsive design (mobile, tablet, desktop)
  - Dark mode support
  - Print-friendly styles
  - Accessibility features (focus states, high contrast)
  - Reduced motion support
  - Professional typography
- **Use**: Include in HTML output for polished appearance
- **Size**: ~11KB
- **Customizable**: All colors/fonts in CSS variables

### Documentation Files

#### `SPKML_Template_Examples.md`
- **Purpose**: Ready-to-use templates for common document types
- **Contains**:
  - Blog post / article template
  - Technical documentation template
  - Academic paper template
  - Presentation template
  - Podcast template
  - Video tutorial template
  - Book/long-form document template
- **Use**: Copy, paste, and customize for your needs

#### `README.md` (This File)
- **Purpose**: Overview, quick start, and usage guide
- **Contains**: Getting started, file descriptions, workflows

### Schema Files (For Reference)

These files are typically referenced, not directly used:

- **Namespace**: `http://dylan.os/spkml/1.0`
- **Default location**: `http://dylan.os/spkml/1.0/spkml.{xsd|dtd|xslt|css}`

---

## Element Quick Reference

### Structural (Block) Elements
- `<spkml>` - Root element
- `<metadata>` - Document metadata
- `<section>` - Top-level section
- `<subsection>` - Nested section
- `<heading level="1-6">` - Heading with explicit level

### Text Elements
- `<paragraph>` - Paragraph of text
- `<emphasis>` - Emphasized text (typically italic)
- `<strong>` - Strong importance (typically bold)
- `<code>` - Inline code reference
- `<literal>` - Literal text with preserved whitespace

### List Elements
- `<list type="ordered|unordered">` - List container
- `<item>` - List item

### Code Elements
- `<codeblock language="...">` - Multi-line code block
- `<syntax language="...">` - Formatted code with markup

### Media Elements
- `<figure src="..." alt="...">` - Image/diagram with caption
- `<audio src="..." format="...">` - Audio content
- `<video src="..." format="...">` - Video content
- `<animation src="..." format="...">` - Animation content

### Table Elements
- `<table>` - Table container
- `<header>` - Table header row
- `<row>` - Table data row
- `<cell>` - Table cell

### Citation Elements
- `<quote source="...">` - Block quotation
- `<reference type="..." url="...">` - Citation/reference
- `<footnote id="...">` - Footnote

### Semantic Elements
- `<concept type="..." domain="...">` - Semantic concept
- `<term>` - Term being defined
- `<definition>` - Definition of term
- `<example>` - Example of concept
- `<timeline>` - Timeline of events
- `<event timestamp="...">` - Event in timeline

---

## Workflow Examples

### Workflow 1: Blog Post Creation

```bash
# 1. Start from template
cp SPKML_Template_Examples.md my-blog-post.spkml

# 2. Edit in your favorite text editor
vim my-blog-post.spkml

# 3. Validate
xmllint --schema spkml.xsd my-blog-post.spkml

# 4. Transform to HTML
xsltproc spkml-to-html.xslt my-blog-post.spkml > blog-post.html

# 5. Add CSS (optional)
# Edit HTML to include <link rel="stylesheet" href="spkml-default.css">

# 6. Deploy
cp blog-post.html /var/www/html/
cp spkml-default.css /var/www/html/
```

### Workflow 2: Academic Paper Writing

```bash
# 1. Create new document from template
cp SPKML_Template_Examples.md research-paper.spkml

# 2. Write content in SPKML
emacs research-paper.spkml

# 3. Validate structure
xmllint --valid research-paper.spkml

# 4. Generate multiple outputs
# HTML version
xsltproc spkml-to-html.xslt research-paper.spkml > paper.html

# Plain text (using custom XSLT)
xsltproc spkml-to-text.xslt research-paper.spkml > paper.txt

# 5. Archive original SPKML
git add research-paper.spkml
git commit -m "Add research paper"
```

### Workflow 3: Documentation Generation

```bash
# 1. Create master document
cat > manual.spkml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Product Manual</title>
  </metadata>
  <section>
    <!-- Include content from chapters -->
  </section>
</spkml>
EOF

# 2. Validate all chapters
for chapter in chapters/*.spkml; do
  xmllint --schema spkml.xsd "$chapter" || exit 1
done

# 3. Generate HTML site
xsltproc spkml-to-html.xslt manual.spkml > docs/manual.html

# 4. Generate PDF (via intermediate HTML/CSS)
wkhtmltopdf docs/manual.html docs/manual.pdf
```

---

## Language Support

SPKML fully supports **100+ languages** through ISO 639-1 language codes:

```xml
<!-- English (default) -->
<spkml xml:lang="en">

<!-- Spanish -->
<spkml xml:lang="es">

<!-- French -->
<spkml xml:lang="fr">

<!-- Chinese (Simplified) -->
<spkml xml:lang="zh">

<!-- Japanese -->
<spkml xml:lang="ja">

<!-- Mixed-language document -->
<spkml xml:lang="en">
  <section xml:lang="es">
    <heading>Español</heading>
  </section>
  <section xml:lang="fr">
    <heading>Français</heading>
  </section>
</spkml>
```

Supported languages include:
- All major European languages
- Major Asian languages (Chinese, Japanese, Korean, Hindi)
- Middle Eastern languages (Arabic, Hebrew)
- And 80+ others

---

## Document Types Supported

SPKML can represent any of these document types:

| Type | Template | Key Elements |
|------|----------|--------------|
| Blog Post | template-blog-post.spkml | sections, paragraphs, lists |
| Technical Doc | template-technical-doc.spkml | steps, code, warnings |
| Academic Paper | template-academic-paper.spkml | abstract, methodology, references |
| Presentation | template-presentation.spkml | slides as sections |
| Podcast | template-podcast.spkml | audio, transcript |
| Video Tutorial | template-video-tutorial.spkml | video, chapters |
| Book | template-book.spkml | chapters, sections, bibliography |
| Timeline | (custom) | timeline, events |
| Gallery | (custom) | figures, captions |

---

## Validation Tools

### Command-Line Tools

**xmllint** (LibXML2)
```bash
# Validate against DTD
xmllint --dtdvalid spkml.dtd document.spkml

# Validate against XSD
xmllint --schema spkml.xsd document.spkml

# Well-formedness check
xmllint --noout document.spkml
```

**xmlstarlet**
```bash
# Validate
xml val -s spkml.xsd document.spkml

# Transform
xml tr spkml-to-html.xslt document.spkml
```

### IDE Integration

**VS Code**
- Install "XML" extension by Red Hat
- Add workspace settings:
  ```json
  {
    "xml.fileAssociations": [
      {
        "pattern": "*.spkml",
        "systemId": "http://dylan.os/spkml/1.0/spkml.xsd"
      }
    ]
  }
  ```

**Oxygen XML Editor**
- File → New Document → SPKML
- Auto-validates against XSD
- Provides element completion

**Emacs**
- Use nxml-mode with custom schema:
  ```elisp
  (add-to-list 'rng-schema-locating-rule-alist
    '("SPKML" "http://dylan.os/spkml/1.0/spkml.xsd"))
  ```

### Online Validators
- W3C XML Validator: https://www.w3.org/2012/06/xsd-validator/
- XMLValidator.com: https://www.xmlvalidation.com/

---

## Transformation Pipeline

### SPKML → HTML5

```bash
xsltproc spkml-to-html.xslt input.spkml > output.html
```

Output includes:
- Semantic HTML5 markup (`<section>`, `<article>`, `<header>`)
- Default CSS styling
- Responsive design
- Accessibility features

### SPKML → PDF (via HTML)

```bash
# 1. Transform to HTML
xsltproc spkml-to-html.xslt input.spkml > temp.html

# 2. Add CSS reference
sed -i '/<head>/a\  <link rel="stylesheet" href="spkml-default.css">' temp.html

# 3. Convert to PDF
wkhtmltopdf temp.html output.pdf
# or
prince temp.html output.pdf
```

### SPKML → Plain Text

Write custom XSLT:
```xslt
<xsl:template match="spkml:paragraph">
  <xsl:apply-templates/>
  <xsl:text>

</xsl:text>
</xsl:template>
```

### SPKML → Markdown

Convert with `--format markdown` if using specialized transformer.

### SPKML → EPUB (for eBooks)

1. Transform to HTML
2. Package HTML files as EPUB container
3. Include CSS for eReader optimization

---

## Best Practices

### 1. Always Use Meaningful IDs

```xml
<!-- Good: Semantic, searchable -->
<section id="installation-steps">
  <heading level="1">Installation Steps</heading>
</section>

<!-- Poor: Not semantic -->
<section id="s1">
  <heading level="1">Installation Steps</heading>
</section>
```

### 2. Complete Metadata

```xml
<metadata>
  <title>Document Title</title>
  <author>Author Name</author>
  <date>2026-02-17</date>
  <version>1.0.0</version>
  <keywords>keyword1, keyword2</keywords>
  <language>en</language>
  <type>article</type>
</metadata>
```

### 3. Proper Heading Hierarchy

```xml
<!-- Good: Proper nesting -->
<section>
  <heading level="1">Chapter</heading>
  <subsection>
    <heading level="2">Section</heading>
    <subsection>
      <heading level="3">Subsection</heading>
    </subsection>
  </subsection>
</section>

<!-- Bad: Skipped levels -->
<h1>Chapter</h1>
<h3>Section (skipped h2!)</h3>
```

### 4. Accessibility

```xml
<!-- Good: Alternative text for images -->
<figure src="diagram.svg" 
        alt="System architecture with local and cloud components">
  <caption>Figure 1: Architecture Overview</caption>
</figure>

<!-- Good: Descriptive link text -->
<reference url="https://example.org/paper">
Learn more about this topic
</reference>

<!-- Bad: Non-descriptive links -->
<reference url="https://example.org/paper">
Click here
</reference>
```

### 5. Semantic Markup

```xml
<!-- Good: Clear semantics -->
<concept type="definition" domain="biology">
  <term>Photosynthesis</term>
  <definition>Process by which plants convert light to chemical energy</definition>
</concept>

<!-- Less ideal: Plain paragraphs -->
<paragraph>
  <strong>Photosynthesis:</strong> Process by which plants convert light...
</paragraph>
```

---

## Troubleshooting

### Issue: "Document is not valid"

**Solution**: Check against XSD:
```bash
xmllint --schema spkml.xsd your-file.spkml
```

Common issues:
- Missing required elements (metadata, heading)
- Improperly nested elements
- Invalid attribute values
- Character encoding issues (use UTF-8)

### Issue: "XSLT transformation fails"

**Solution**: Ensure libxslt is installed:
```bash
# macOS
brew install libxslt

# Linux (Ubuntu/Debian)
sudo apt-get install xsltproc

# Linux (Fedora/RHEL)
sudo dnf install libxslt
```

### Issue: "CSS not applied"

**Solution**: Reference CSS in HTML output:
```bash
# Add this line to HTML <head>
<link rel="stylesheet" href="spkml-default.css">
```

### Issue: "Element not found in schema"

**Solution**: Check spelling and namespace:
```xml
<!-- Correct namespace -->
<spkml xmlns="http://dylan.os/spkml/1.0">
  <!-- Use elements without namespace prefix -->
  <section>
    <heading level="1">Title</heading>
  </section>
</spkml>
```

---

## Getting Help

### Resources

- **Official Website**: http://dylan.os/spkml/
- **GitHub Repository**: https://github.com/dylan-os/spkml
- **Issue Tracker**: https://github.com/dylan-os/spkml/issues
- **Community Forum**: https://forum.dylan.os/spkml/
- **Email Support**: spkml-support@dylan.os

### Contributing

SPKML is open source and welcomes contributions:

1. Fork the repository
2. Create a feature branch
3. Make improvements
4. Submit a pull request

---

## License & Attribution

SPKML is released under the **Creative Commons Attribution-ShareAlike 4.0 International** license.

This means you can:
- ✅ Use SPKML freely
- ✅ Modify and extend it
- ✅ Create derivative works
- ✅ Use commercially

With the requirement that you:
- ✅ Attribute the original work
- ✅ Use the same license for derivatives

---

## Version History

### Version 1.0.0 (February 2026)
- Initial release
- Complete specification
- DTD and XSD validation
- XSLT transformation to HTML5
- Default CSS stylesheet
- Template examples
- Comprehensive documentation

---

## Credits

SPKML was created by the **Dylan OS Foundation** as part of the Dylan OS project, based on concepts from "CodeBase" by Christôpher David Jônson.

**Maintainers:**
- Dylan OS Foundation Technical Committee
- SPKML Community Contributors

---

## Conclusion

SPKML provides a powerful, semantically-explicit markup language suitable for any type of document. By focusing on meaning rather than presentation, SPKML documents remain valuable and transformable long after specific technologies change.

Start with a template, validate your document, and transform it to any format you need.

**Happy documenting!**

---

**SPKML Ecosystem - Version 1.0.0**  
Released February 2026  
Maintained by the Dylan OS Foundation  
Licensed under CC-BY-SA 4.0
