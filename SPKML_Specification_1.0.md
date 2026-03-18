# SPKML: Semantic Programming and Knowledge Markup Language
## Official Specification v1.0

**Document Status:** Draft Specification  
**Version:** 1.0.0  
**Release Date:** February 2026  
**Maintained By:** Dylan OS Foundation  
**License:** CC-BY-SA 4.0  
**Namespace:** http://dylan.os/spkml/1.0  

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Design Philosophy](#design-philosophy)
3. [Technical Foundation](#technical-foundation)
4. [Core Syntax](#core-syntax)
5. [Element Reference](#element-reference)
6. [Supported Document Types](#supported-document-types)
7. [Language Support](#language-support)
8. [Code Examples](#code-examples)
9. [Templates & Starter Kit](#templates--starter-kit)
10. [Validation & Schema](#validation--schema)
11. [Best Practices](#best-practices)
12. [Migration Guide](#migration-guide)

---

## Executive Summary

SPKML (Semantic Programming and Knowledge Markup Language) is a strict, semantically-conscious XML dialect designed to:

- **Separate content from presentation** while enabling both
- **Preserve semantic meaning** across multiple output formats
- **Support nested document structures** from simple text to complex multimedia
- **Enable machine parsing and knowledge extraction** through explicit semantic markup
- **Maintain readability** for both humans and automated systems
- **Support accessibility** natively through semantic richness

SPKML is not a replacement for HTML/XHTML or other markup languages. Rather, it's a **semantic superstructure** that can represent knowledge in its essential form, with transformations to other formats handled by XSLT.

### Key Characteristics

- **XML-based** with strict well-formedness requirements
- **Semantically explicit** - every element has clear meaning
- **Format-agnostic** - same SPKML can produce PDF, HTML, ePub, etc.
- **Namespace-aware** - supports multiple XML namespaces
- **Validation-first** - XML Schema and DTD definitions provided
- **Transform-friendly** - works seamlessly with XSLT
- **Human-readable** - designed to be understood without special tools

---

## Design Philosophy

SPKML is based on three core principles:

### 1. Semantics Over Syntax

Every element should express what it *means*, not how it looks:

```xml
<!-- Good: Semantic clarity -->
<document>
  <heading level="1">Chapter Title</heading>
  <paragraph>Text content here.</paragraph>
  <list type="ordered">
    <item>First item</item>
    <item>Second item</item>
  </list>
</document>

<!-- Avoid: Presentation-focused -->
<div class="title" style="font-size: 24px; font-weight: bold;">
Chapter Title
</div>
<p class="body-text">Text content here.</p>
```

### 2. Knowledge Preservation

Content should remain valid and understandable even without styling:

```xml
<!-- A document should make sense in plain text -->
<concept type="principle" domain="physics">
  <term>Law of Conservation of Energy</term>
  <definition>Energy cannot be created or destroyed, only converted.</definition>
  <equation formal="true">E = mc²</equation>
  <explanation>Mass and energy are interchangeable.</explanation>
</concept>
```

### 3. Extensibility Through Metadata

SPKML accommodates domain-specific needs via attributes and namespaces:

```xml
<document xmlns="http://dylan.os/spkml/1.0"
          xmlns:medical="http://medical.org/spkml-medical"
          xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  
  <section medical:category="treatment-protocol">
    <!-- Medical-specific markup -->
  </section>
</document>
```

---

## Technical Foundation

### XML Standards Compliance

SPKML is **100% compliant with XML 1.0 specification**:
- All documents must be well-formed XML
- All documents must validate against the provided DTD and XSD
- Unicode (UTF-8, UTF-16) fully supported
- All special characters properly escaped

### Namespaces

SPKML documents use the default namespace:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <!-- document content -->
</spkml>
```

Additional namespaces can be declared for extensions:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0"
       xmlns:dc="http://purl.org/dc/elements/1.1/"
       xmlns:custom="http://example.org/custom">
  <!-- Content using multiple namespaces -->
</spkml>
```

### Character Encoding

- **Required:** UTF-8 or UTF-16
- **Default:** UTF-8
- **Recommended:** Always specify encoding in XML declaration

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

---

## Core Syntax

### Document Structure

Every SPKML document follows this basic structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <!-- Document metadata -->
  </metadata>
  
  <section id="unique-id">
    <!-- Document content -->
  </section>
</spkml>
```

### Required Elements

1. **XML Declaration** - Must be first line
2. **Root Element** - Always `<spkml>`
3. **Metadata Section** - Contains document-level information
4. **Content Sections** - Container for actual content

### Attributes

Standard SPKML attributes available on most elements:

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | string | No | Unique identifier within document |
| `class` | string | No | CSS class for styling |
| `lang` | language code | No | Language of content (e.g., 'en', 'es') |
| `xml:lang` | language code | No | XML standard language tag |
| `role` | string | No | Semantic role (e.g., 'main', 'nav', 'search') |
| `title` | string | No | Human-readable title/tooltip |
| `type` | string | No | Element subtype (varies by element) |
| `level` | integer | No | Hierarchy level (headings, lists) |

---

## Element Reference

### Metadata Elements

#### `<metadata>`
Container for document-level information.

**Attributes:** Standard attributes
**Children:** metadata elements

```xml
<metadata>
  <title>Document Title</title>
  <author>Author Name</author>
  <date>2026-02-17</date>
</metadata>
```

**Child Elements:**
- `title` - Document title
- `subtitle` - Document subtitle
- `author` - Author name/email
- `date` - Publication date (ISO 8601)
- `version` - Version number
- `license` - License information
- `keywords` - Comma-separated keywords
- `description` - Document description
- `language` - Primary language

#### `<title>`
Document title. Can be used in metadata and as section title.

```xml
<metadata>
  <title>My Document Title</title>
</metadata>

<section>
  <title>Section Title</title>
  <!-- section content -->
</section>
```

**Attributes:** Standard attributes  
**Content:** Text only

---

### Structural Elements

#### `<section>`
Top-level document section.

**Attributes:** 
- `id` (recommended - must be unique)
- `class`
- `role`
- All standard attributes

**Children:** `heading`, `subsection`, `paragraph`, `list`, `figure`, etc.

```xml
<section id="introduction">
  <heading level="1">Introduction</heading>
  <paragraph>Content here...</paragraph>
  
  <subsection id="background">
    <heading level="2">Background</heading>
    <paragraph>More content...</paragraph>
  </subsection>
</section>
```

#### `<subsection>`
Nested section within a section.

**Attributes:** Same as `<section>`  
**Children:** Same as `<section>`

```xml
<section id="main">
  <heading level="1">Main Section</heading>
  
  <subsection id="sub1">
    <heading level="2">Subsection 1</heading>
    
    <subsection id="sub1a">
      <heading level="3">Sub-subsection</heading>
    </subsection>
  </subsection>
</section>
```

#### `<heading>`
Section heading with explicit level.

**Attributes:**
- `level` (required) - 1-6, where 1 is highest
- All standard attributes

**Content:** Text with inline elements

```xml
<heading level="1">Main Title</heading>
<heading level="2">Subtitle</heading>
<heading level="3">Minor Heading</heading>
```

---

### Text Content Elements

#### `<paragraph>`
Text paragraph.

**Attributes:** Standard attributes  
**Children:** Text with inline elements (emphasis, strong, code, etc.)

```xml
<paragraph>
  This is a paragraph with <strong>bold text</strong> and 
  <emphasis>italic text</emphasis>.
</paragraph>
```

#### `<emphasis>`
Emphasized text (typically italic).

```xml
<paragraph>This word is <emphasis>emphasized</emphasis>.</paragraph>
```

#### `<strong>`
Strong importance text (typically bold).

```xml
<paragraph>This is <strong>very important</strong>.</paragraph>
```

#### `<code>`
Inline code reference.

```xml
<paragraph>
  Use the <code>function_name()</code> function to do this.
</paragraph>
```

#### `<literal>`
Literal text to be displayed exactly as written.

```xml
<literal>  This text preserves   spacing  </literal>
```

---

### List Elements

#### `<list>`
Ordered or unordered list.

**Attributes:**
- `type` (required) - "ordered" or "unordered"
- All standard attributes

**Children:** `item` elements only

```xml
<list type="unordered">
  <item>First item</item>
  <item>Second item</item>
  <item>Third item</item>
</list>

<list type="ordered">
  <item>First step</item>
  <item>Second step</item>
  <item>Third step</item>
</list>
```

#### `<item>`
List item (child of `<list>`).

**Attributes:** Standard attributes  
**Children:** Text and block elements

```xml
<list type="ordered">
  <item>
    <paragraph>Item with paragraph content</paragraph>
  </item>
  <item>
    Simple text item
  </item>
</list>
```

---

### Code Elements

#### `<codeblock>`
Multi-line code or syntax.

**Attributes:**
- `language` - Programming language identifier
- `linenumbers` - "true" or "false"
- All standard attributes

**Content:** Literal code text (whitespace preserved)

```xml
<codeblock language="python" linenumbers="true">
def hello_world():
    print("Hello, World!")
    
hello_world()
</codeblock>
```

#### `<syntax>`
Formatted code with syntax highlighting markup.

```xml
<syntax language="xml">
  <keyword>&lt;element&gt;</keyword>
  <string>"attribute value"</string>
  <comment>&lt;!-- comment --&gt;</comment>
</syntax>
```

---

### Media Elements

#### `<figure>`
Image, diagram, or illustration with caption.

**Attributes:**
- `src` - URL or path to media
- `alt` - Alternative text (required)
- `type` - Media type (image, diagram, chart)
- All standard attributes

**Children:** `caption` (optional)

```xml
<figure src="diagram.png" alt="System Architecture" type="diagram">
  <caption>Figure 1: System architecture overview</caption>
</figure>
```

#### `<audio>`
Audio content reference.

**Attributes:**
- `src` - URL or path to audio file
- `format` - Audio format (mp3, ogg, wav)
- `duration` - Duration in seconds
- All standard attributes

```xml
<audio src="podcast.mp3" format="mp3" duration="1800">
  <description>Podcast episode discussing Dylan OS</description>
</audio>
```

#### `<video>`
Video content reference.

**Attributes:**
- `src` - URL or path to video file
- `format` - Video format (mp4, webm, ogv)
- `duration` - Duration in seconds
- `width`, `height` - Dimensions in pixels
- All standard attributes

```xml
<video src="demo.mp4" format="mp4" duration="300" width="1280" height="720">
  <description>Dylan OS demo video</description>
  <transcript>Optional full transcript of video</transcript>
</video>
```

#### `<animation>`
Animation or interactive media.

**Attributes:**
- `src` - URL to animation file
- `format` - Format (svg, webm, gif)
- `loops` - Number of loops (-1 = infinite)
- All standard attributes

```xml
<animation src="loading.svg" format="svg" loops="-1">
  <description>Loading animation</description>
</animation>
```

---

### Table Elements

#### `<table>`
Structured tabular data.

**Attributes:**
- `columns` - Number of columns
- `bordered` - "true" or "false"
- All standard attributes

**Children:** `header` (optional), `row` elements

```xml
<table columns="3" bordered="true">
  <header>
    <cell>Column 1</cell>
    <cell>Column 2</cell>
    <cell>Column 3</cell>
  </header>
  <row>
    <cell>Data 1</cell>
    <cell>Data 2</cell>
    <cell>Data 3</cell>
  </row>
</table>
```

#### `<row>`
Table row (child of `<table>`).

**Children:** `cell` elements only

```xml
<row>
  <cell>Cell content</cell>
  <cell>Another cell</cell>
</row>
```

#### `<cell>`
Table cell (child of `<row>` or `<header>`).

**Attributes:**
- `colspan` - Number of columns to span
- `rowspan` - Number of rows to span
- All standard attributes

```xml
<cell colspan="2">Spans two columns</cell>
```

---

### Citation & Reference Elements

#### `<quote>`
Block quotation.

**Attributes:**
- `source` - Source of quote
- All standard attributes

**Children:** `paragraph` elements and inline content

```xml
<quote source="Dylan OS Manifesto">
  <paragraph>
    Technology should amplify human capability, not replace it.
  </paragraph>
</quote>
```

#### `<reference>`
Citation or reference to external source.

**Attributes:**
- `type` - Type of reference (book, website, paper, etc.)
- `url` - URL if applicable
- All standard attributes

**Content:** Text describing the reference

```xml
<reference type="book" url="https://example.org/codebook">
Dylan OS: A Vision for Personal Computing (2026)
</reference>
```

#### `<footnote>`
Footnote or endnote content.

**Attributes:** Standard attributes  
**Content:** Text with inline markup

```xml
<paragraph>
  This is text with a footnote<footnote id="fn1">
  This is the footnote content that appears at the bottom.
  </footnote>.
</paragraph>
```

---

### Semantic Content Elements

#### `<concept>`
Semantic concept with structured definition.

**Attributes:**
- `type` - Type of concept (principle, theory, definition)
- `domain` - Knowledge domain
- All standard attributes

**Children:** `term`, `definition`, `explanation`, `example`

```xml
<concept type="definition" domain="physics">
  <term>Entropy</term>
  <definition>
    Measure of disorder or randomness in a system.
  </definition>
  <explanation>
    Higher entropy means less organized energy available for work.
  </explanation>
  <example>
    Ice melting into water increases entropy.
  </example>
</concept>
```

#### `<term>`
Key term being defined or explained.

```xml
<concept>
  <term>Machine Learning</term>
  <definition>Algorithms that learn patterns from data...</definition>
</concept>
```

#### `<definition>`
Formal definition of a concept or term.

```xml
<definition>
  The process by which systems improve through experience.
</definition>
```

#### `<example>`
Example demonstrating a concept.

```xml
<example>
  <paragraph>Here is an example of...</paragraph>
  <codeblock language="python">
    # example code
  </codeblock>
</example>
```

---

## Supported Document Types

SPKML can represent any of these document types through appropriate element selection and structure:

### 1. Text Documents

Plain text with semantic structure.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Plain Text Document</title>
    <author>Author Name</author>
    <type>text</type>
  </metadata>
  
  <section id="main">
    <heading level="1">Main Heading</heading>
    <paragraph>Text content...</paragraph>
  </section>
</spkml>
```

### 2. Rich Text Documents

Documents with mixed formatting.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Rich Text Document</title>
    <type>richtext</type>
  </metadata>
  
  <section id="content">
    <heading level="1">Title</heading>
    <paragraph>
      Text with <strong>bold</strong>, <emphasis>italic</emphasis>, 
      and <code>code</code> formatting.
    </paragraph>
    <list type="unordered">
      <item>Bullet point</item>
    </list>
  </section>
</spkml>
```

### 3. Audio Documents

Documents with audio content and metadata.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Podcast Episode</title>
    <type>audio</type>
    <duration>3600</duration>
  </metadata>
  
  <section id="episode">
    <heading level="1">Episode Title</heading>
    
    <audio src="episode.mp3" format="mp3" duration="3600">
      <description>Episode description</description>
    </audio>
    
    <section id="transcript">
      <heading level="2">Transcript</heading>
      <paragraph>[Full transcript...]</paragraph>
    </section>
  </section>
</spkml>
```

### 4. Video Documents

Documents centered on video content.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Tutorial Video</title>
    <type>video</type>
  </metadata>
  
  <section id="tutorial">
    <heading level="1">How to Use Dylan OS</heading>
    
    <video src="tutorial.mp4" format="mp4" duration="600" width="1280" height="720">
      <description>Step-by-step tutorial</description>
      <transcript>[Full transcript...]</transcript>
    </video>
    
    <section id="key-points">
      <heading level="2">Key Points</heading>
      <list type="ordered">
        <item>Point 1</item>
        <item>Point 2</item>
      </list>
    </section>
  </section>
</spkml>
```

### 5. Timeline-Based Presentations

Documents with timeline/chronological structure.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Project Timeline</title>
    <type>timeline</type>
  </metadata>
  
  <section id="timeline">
    <heading level="1">Dylan OS Development Timeline</heading>
    
    <timeline>
      <event timestamp="2026-01-01" phase="Phase 1">
        <title>Foundation Work Begins</title>
        <description>Initial architecture and proof of concept</description>
      </event>
      
      <event timestamp="2026-06-30" phase="Phase 1">
        <title>Reference Implementation Complete</title>
        <description>Dylan OS runs on three hardware platforms</description>
      </event>
      
      <event timestamp="2028-01-01" phase="Phase 2">
        <title>Ecosystem Expansion</title>
        <description>Multi-device synchronization, extensions</description>
      </event>
    </timeline>
  </section>
</spkml>
```

### 6. Multimedia Animation Documents

Documents with animations and interactive elements.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Interactive Animation</title>
    <type>animation</type>
  </metadata>
  
  <section id="demo">
    <heading level="1">System Architecture Demo</heading>
    
    <animation src="architecture.svg" format="svg" loops="-1">
      <description>Animated system architecture visualization</description>
    </animation>
    
    <section id="explanation">
      <heading level="2">How It Works</heading>
      <paragraph>Explanation of the animation...</paragraph>
    </section>
  </section>
</spkml>
```

### 7. Vector/Raster Graphics Documents

Documents focused on graphics content.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Design Documentation</title>
    <type>graphics</type>
  </metadata>
  
  <section id="designs">
    <heading level="1">UI Design Mockups</heading>
    
    <figure src="mockup1.svg" alt="Main interface design" type="diagram">
      <caption>Figure 1: Main interface layout</caption>
    </figure>
    
    <figure src="mockup2.png" alt="Detail view" type="image">
      <caption>Figure 2: Detailed component view</caption>
    </figure>
  </section>
</spkml>
```

---

## Language Support

SPKML supports multilingual content through the `lang` and `xml:lang` attributes:

### Declaring Languages

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0" xml:lang="en">
  
  <metadata>
    <title>Multilingual Document</title>
    <language>en, es, fr</language>
  </metadata>
  
  <section id="english" xml:lang="en">
    <heading level="1">English Section</heading>
    <paragraph>Content in English.</paragraph>
  </section>
  
  <section id="spanish" xml:lang="es">
    <heading level="1">Sección en Español</heading>
    <paragraph>Contenido en español.</paragraph>
  </section>
  
  <section id="french" xml:lang="fr">
    <heading level="1">Section en Français</heading>
    <paragraph>Contenu en français.</paragraph>
  </section>
  
</spkml>
```

### Supported Language Codes

SPKML recognizes all ISO 639-1 language codes:

| Language | Code | | Language | Code |
|----------|------|---|----------|------|
| English | en | | Spanish | es |
| Français | fr | | Deutsch | de |
| Italiano | it | | Português | pt |
| 日本語 | ja | | 中文 | zh |
| 한국어 | ko | | Русский | ru |
| العربية | ar | | ภาษาไทย | th |
| Ελληνικά | el | | עברית | he |
| हिन्दी | hi | | Türkçe | tr |

And 100+ others as defined by ISO 639-1.

---

## Code Examples

### Example 1: Simple Blog Post

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Personal AI: The Future of Computing</title>
    <author>Jane Doe</author>
    <date>2026-02-17</date>
    <keywords>AI, personal computing, technology</keywords>
  </metadata>
  
  <section id="article">
    <heading level="1">Personal AI: The Future of Computing</heading>
    
    <paragraph>
      Today, most AI systems are designed to serve many users with a single model. 
      What if we inverted this model?
    </paragraph>
    
    <section id="the-problem">
      <heading level="2">The Current Problem</heading>
      <list type="unordered">
        <item>One AI model serves billions of users</item>
        <item>Privacy is compromised</item>
        <item>Systems optimize for engagement, not user needs</item>
        <item>Users have no control or understanding</item>
      </list>
    </section>
    
    <section id="the-vision">
      <heading level="2">A Better Vision</heading>
      <paragraph>
        What if each person had their own AI assistant, trained exclusively on 
        their needs, values, and preferences? This is the vision behind Dylan OS.
      </paragraph>
    </section>
  </section>
</spkml>
```

### Example 2: Technical Documentation

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Dylan OS Installation Guide</title>
    <type>technical documentation</type>
  </metadata>
  
  <section id="installation">
    <heading level="1">Installation Guide</heading>
    
    <section id="requirements">
      <heading level="2">System Requirements</heading>
      <list type="unordered">
        <item>Processor: 2008 or later (Intel/AMD/ARM)</item>
        <item>RAM: 2GB minimum, 4GB recommended</item>
        <item>Storage: 20GB free space</item>
      </list>
    </section>
    
    <section id="installation-steps">
      <heading level="2">Installation Steps</heading>
      <list type="ordered">
        <item>Download Dylan OS image from official site</item>
        <item>Verify checksum (SHA-256)</item>
        <item>Create bootable USB using Rufus or dd</item>
        <item>Boot from USB and follow installer</item>
      </list>
    </section>
    
    <section id="post-install">
      <heading level="2">Post-Installation</heading>
      <paragraph>After installation completes:</paragraph>
      <codeblock language="bash">
# Update system packages
sudo dylan-update

# Initialize personal AI
dylan-ai --init

# Verify installation
dylan-verify --all
      </codeblock>
    </section>
  </section>
</spkml>
```

### Example 3: Academic Paper

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0"
       xmlns:academic="http://academic.org/spkml-academic">
  <metadata>
    <title>Personalized AI Assistants: Architecture and Implementation</title>
    <author>Dr. Research Author</author>
    <date>2026-02-17</date>
    <type>academic paper</type>
  </metadata>
  
  <section id="abstract">
    <heading level="1">Abstract</heading>
    <paragraph>
      This paper presents a novel architecture for personal AI assistants 
      that are trained exclusively on individual user data...
    </paragraph>
  </section>
  
  <section id="introduction">
    <heading level="1">1. Introduction</heading>
    <paragraph>
      Current AI systems consolidate data from billions of users to train 
      single models. This approach...
    </paragraph>
  </section>
  
  <section id="methodology">
    <heading level="1">2. Methodology</heading>
    
    <figure src="architecture.svg" alt="System Architecture">
      <caption>Figure 1: Proposed System Architecture</caption>
    </figure>
    
    <codeblock language="python" linenumbers="true">
class PersonalAI:
    def __init__(self, user_id):
        self.user_id = user_id
        self.local_model = load_model()
        self.user_context = {}
    
    def train_on_user_data(self, data):
        self.local_model.fit(data)
    </codeblock>
  </section>
  
  <section id="references">
    <heading level="1">References</heading>
    <list type="ordered">
      <item>
        <reference type="book">
          Author, A. (2020). Book Title. Publisher.
        </reference>
      </item>
      <item>
        <reference type="paper" url="https://example.org/paper">
          Author, B. (2025). Paper Title. Journal Name.
        </reference>
      </item>
    </list>
  </section>
</spkml>
```

---

## Templates & Starter Kit

### Template 1: Minimal Document

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Document Title</title>
  </metadata>
  
  <section id="main">
    <heading level="1">Section Heading</heading>
    <paragraph>Content here...</paragraph>
  </section>
</spkml>
```

### Template 2: Rich Document

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  <metadata>
    <title>Full Featured Document</title>
    <subtitle>With all standard elements</subtitle>
    <author>Author Name</author>
    <date>2026-02-17</date>
    <version>1.0</version>
    <keywords>keyword1, keyword2, keyword3</keywords>
    <description>Document description</description>
  </metadata>
  
  <section id="introduction">
    <heading level="1">Introduction</heading>
    <paragraph>Introduction paragraph...</paragraph>
  </section>
  
  <section id="main-content">
    <heading level="1">Main Content</heading>
    
    <subsection id="subsection1">
      <heading level="2">Subsection 1</heading>
      <paragraph>Content...</paragraph>
      <list type="unordered">
        <item>Item 1</item>
        <item>Item 2</item>
      </list>
    </subsection>
    
    <subsection id="subsection2">
      <heading level="2">Subsection 2</heading>
      <figure src="image.png" alt="Image description">
        <caption>Figure 1: Caption text</caption>
      </figure>
    </subsection>
  </section>
  
  <section id="conclusion">
    <heading level="1">Conclusion</heading>
    <paragraph>Conclusion...</paragraph>
  </section>
</spkml>
```

---

## Validation & Schema

SPKML documents can be validated against:

1. **DTD** (Document Type Definition) - `spkml.dtd`
2. **XSD** (XML Schema Definition) - `spkml.xsd`

Both validators are available at:
- DTD: `http://dylan.os/spkml/1.0/spkml.dtd`
- XSD: `http://dylan.os/spkml/1.0/spkml.xsd`

### DTD Reference

```xml
<!DOCTYPE spkml PUBLIC "-//Dylan OS//DTD SPKML 1.0//EN"
                      "http://dylan.os/spkml/1.0/spkml.dtd">
```

### XSD Validation

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://dylan.os/spkml/1.0
                           http://dylan.os/spkml/1.0/spkml.xsd">
  <!-- Valid content -->
</spkml>
```

---

## Best Practices

### 1. Always Use Semantic Elements

```xml
<!-- Good -->
<emphasis>Important concept</emphasis>

<!-- Avoid -->
<span style="font-style: italic;">Important concept</span>
```

### 2. Provide Meaningful IDs

```xml
<!-- Good -->
<section id="installation-requirements">
  <heading level="2">Installation Requirements</heading>
</section>

<!-- Avoid -->
<section id="section1">
  <heading level="2">Installation Requirements</heading>
</section>
```

### 3. Use Alternative Text for Media

```xml
<!-- Good -->
<figure src="diagram.svg" alt="System architecture showing local and cloud components">
  <caption>Figure 1: System Architecture</caption>
</figure>

<!-- Avoid -->
<figure src="diagram.svg" alt="diagram">
  <caption>Figure</caption>
</figure>
```

### 4. Preserve Metadata

Always include complete metadata:

```xml
<metadata>
  <title>Clear, Descriptive Title</title>
  <author>Author Name</author>
  <date>ISO 8601 format: 2026-02-17</date>
  <version>Semantic versioning: 1.0.0</version>
  <keywords>Comma, separated, keywords</keywords>
  <description>One-sentence description</description>
</metadata>
```

### 5. Structure Logically

Use proper nesting: section → subsection → heading + content

```xml
<section id="main">
  <heading level="1">Main Section</heading>
  
  <subsection id="sub1">
    <heading level="2">Subsection</heading>
    <paragraph>Content...</paragraph>
  </subsection>
</section>
```

### 6. Use Proper Language Tags

```xml
<section xml:lang="es">
  <heading level="1">Sección en Español</heading>
</section>
```

### 7. Validate Before Distribution

Always validate against DTD/XSD before publishing.

---

## Migration Guide

### From HTML to SPKML

| HTML | SPKML |
|------|-------|
| `<h1>Title</h1>` | `<heading level="1">Title</heading>` |
| `<p>Text</p>` | `<paragraph>Text</paragraph>` |
| `<strong>bold</strong>` | `<strong>bold</strong>` |
| `<em>italic</em>` | `<emphasis>italic</emphasis>` |
| `<ul><li>item</li></ul>` | `<list type="unordered"><item>item</item></list>` |
| `<code>function()</code>` | `<code>function()</code>` |
| `<img src="x" alt="y">` | `<figure src="x" alt="y">` |

### From Markdown to SPKML

| Markdown | SPKML |
|----------|-------|
| `# Title` | `<heading level="1">Title</heading>` |
| `**bold**` | `<strong>bold</strong>` |
| `*italic*` | `<emphasis>italic</emphasis>` |
| `` `code` `` | `<code>code</code>` |
| `- item` | `<list type="unordered"><item>item</item></list>` |
| `> quote` | `<quote>quote</quote>` |
| `![alt](url)` | `<figure src="url" alt="alt">` |

---

## Conclusion

SPKML provides a powerful, semantically-explicit markup language suitable for any type of document from simple text to complex multimedia. By focusing on meaning rather than presentation, SPKML documents remain valuable and transformable long after specific technologies change.

For the most current specification, validation tools, and community resources, visit:

**Official SPKML Website:** http://dylan.os/spkml/  
**GitHub Repository:** https://github.com/dylan-os/spkml  
**Issue Tracker:** https://github.com/dylan-os/spkml/issues  
**Community Forum:** https://forum.dylan.os/spkml/  

---

**SPKML Specification v1.0**  
Released February 2026  
Maintained by the Dylan OS Foundation  
Licensed under CC-BY-SA 4.0
