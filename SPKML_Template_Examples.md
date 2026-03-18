# SPKML Template Examples
## Starter Kit for Common Document Types

This document provides complete, ready-to-use templates for the most common SPKML document types.

---

## Template 1: Blog Post / Article

Save as: `template-blog-post.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://dylan.os/spkml/1.0
                           http://dylan.os/spkml/1.0/spkml.xsd">
  
  <metadata>
    <title>Article Title Goes Here</title>
    <subtitle>Optional subtitle for the article</subtitle>
    <author>Author Name</author>
    <date>2026-02-17</date>
    <version>1.0.0</version>
    <keywords>keyword1, keyword2, keyword3</keywords>
    <description>One-sentence description of the article</description>
    <language>en</language>
    <type>article</type>
  </metadata>
  
  <section id="introduction">
    <heading level="1">Introduction</heading>
    <paragraph>
      Start with an engaging introduction that hooks the reader. 
      Introduce the topic and explain why it matters.
    </paragraph>
  </section>
  
  <section id="main-content">
    <heading level="1">Main Content</heading>
    
    <subsection id="section-1">
      <heading level="2">First Main Point</heading>
      <paragraph>
        Develop your first point here with detailed explanation and examples.
      </paragraph>
      <list type="unordered">
        <item>Supporting detail 1</item>
        <item>Supporting detail 2</item>
        <item>Supporting detail 3</item>
      </list>
    </subsection>
    
    <subsection id="section-2">
      <heading level="2">Second Main Point</heading>
      <paragraph>
        Develop your second point with supporting evidence.
      </paragraph>
      
      <figure src="image.png" alt="Relevant image">
        <caption>Figure 1: Caption explaining the image</caption>
      </figure>
    </subsection>
    
    <subsection id="section-3">
      <heading level="2">Third Main Point</heading>
      <paragraph>
        Continue building your argument with concrete examples.
      </paragraph>
    </subsection>
  </section>
  
  <section id="conclusion">
    <heading level="1">Conclusion</heading>
    <paragraph>
      Summarize your main points and provide closure. 
      End with a call to action or thought-provoking statement.
    </paragraph>
  </section>
  
</spkml>
```

---

## Template 2: Technical Documentation / Tutorial

Save as: `template-technical-doc.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>Installation and Setup Guide</title>
    <author>Documentation Team</author>
    <date>2026-02-17</date>
    <version>1.0.0</version>
    <keywords>installation, setup, tutorial</keywords>
    <type>technical documentation</type>
  </metadata>
  
  <section id="overview">
    <heading level="1">Overview</heading>
    <paragraph>
      Provide a brief overview of what this guide covers and who it's for.
    </paragraph>
  </section>
  
  <section id="requirements">
    <heading level="1">System Requirements</heading>
    <list type="unordered">
      <item>Requirement 1</item>
      <item>Requirement 2</item>
      <item>Requirement 3</item>
    </list>
  </section>
  
  <section id="installation">
    <heading level="1">Installation Steps</heading>
    
    <subsection id="step-1">
      <heading level="2">Step 1: Download</heading>
      <paragraph>
        Download the software from the official website.
      </paragraph>
      <paragraph>
        <code>wget https://example.org/software.tar.gz</code>
      </paragraph>
    </subsection>
    
    <subsection id="step-2">
      <heading level="2">Step 2: Extract</heading>
      <paragraph>
        Extract the downloaded file.
      </paragraph>
      <codeblock language="bash">
tar -xzf software.tar.gz
cd software-1.0/
      </codeblock>
    </subsection>
    
    <subsection id="step-3">
      <heading level="2">Step 3: Configure</heading>
      <paragraph>
        Run the configuration script.
      </paragraph>
      <codeblock language="bash">
./configure --prefix=/usr/local
make
sudo make install
      </codeblock>
    </subsection>
  </section>
  
  <section id="verification">
    <heading level="1">Verification</heading>
    <paragraph>
      Verify the installation was successful.
    </paragraph>
    <codeblock language="bash">
software --version
software --help
    </codeblock>
  </section>
  
  <section id="troubleshooting">
    <heading level="1">Troubleshooting</heading>
    <list type="unordered">
      <item>Common issue 1 - Resolution</item>
      <item>Common issue 2 - Resolution</item>
    </list>
  </section>
  
</spkml>
```

---

## Template 3: Academic Paper / Research Article

Save as: `template-academic-paper.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>Research Topic: A Comprehensive Study</title>
    <author>Dr. Research Author</author>
    <author>Co-Author Name</author>
    <date>2026-02-17</date>
    <version>1.0.0</version>
    <keywords>research, methodology, results</keywords>
    <type>academic paper</type>
  </metadata>
  
  <section id="abstract">
    <heading level="1">Abstract</heading>
    <paragraph>
      This paper presents findings on [research topic]. 
      Our study involved [methodology]. Results indicate [key findings].
      Conclusion [implications for field].
    </paragraph>
  </section>
  
  <section id="introduction">
    <heading level="1">1. Introduction</heading>
    <paragraph>
      Background information and context for the research.
      Why this topic matters and what gaps this research addresses.
    </paragraph>
  </section>
  
  <section id="literature-review">
    <heading level="1">2. Literature Review</heading>
    <paragraph>
      Summary of existing research and theoretical frameworks.
    </paragraph>
    <list type="ordered">
      <item>
        <reference type="journal">
          Author et al. (2020). Relevant Study Title. Journal Name.
        </reference>
      </item>
      <item>
        <reference type="book">
          Other Author (2019). Book Title. Publisher.
        </reference>
      </item>
    </list>
  </section>
  
  <section id="methodology">
    <heading level="1">3. Methodology</heading>
    
    <subsection id="participants">
      <heading level="2">3.1 Participants</heading>
      <paragraph>Description of study participants and selection criteria.</paragraph>
    </subsection>
    
    <subsection id="procedures">
      <heading level="2">3.2 Procedures</heading>
      <paragraph>Description of study procedures and data collection methods.</paragraph>
    </subsection>
    
    <subsection id="analysis">
      <heading level="2">3.3 Data Analysis</heading>
      <paragraph>Description of analytical methods and statistical tests used.</paragraph>
    </subsection>
  </section>
  
  <section id="results">
    <heading level="1">4. Results</heading>
    <figure src="results-graph.svg" alt="Results visualization">
      <caption>Figure 1: Key results from the study</caption>
    </figure>
    <paragraph>
      Interpretation of results and key findings.
    </paragraph>
  </section>
  
  <section id="discussion">
    <heading level="1">5. Discussion</heading>
    <paragraph>
      Interpretation of findings and implications for the field.
      Limitations of the study and suggestions for future research.
    </paragraph>
  </section>
  
  <section id="conclusion">
    <heading level="1">6. Conclusion</heading>
    <paragraph>
      Summary of main findings and broader implications.
    </paragraph>
  </section>
  
  <section id="references">
    <heading level="1">References</heading>
    <list type="ordered">
      <item>
        <reference type="journal">
          Author, A., &amp; Author, B. (2020). Paper title. Journal Name, 10(2), 100-120.
        </reference>
      </item>
      <item>
        <reference type="book">
          Author, C. (2019). Book title (2nd ed.). Publisher.
        </reference>
      </item>
    </list>
  </section>
  
</spkml>
```

---

## Template 4: Multimedia Presentation / Slide Deck

Save as: `template-presentation.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>Presentation Title</title>
    <subtitle>Subtitle or tagline</subtitle>
    <author>Presenter Name</author>
    <date>2026-02-17</date>
    <type>presentation</type>
  </metadata>
  
  <section id="slide-1">
    <heading level="1">Slide 1: Title Slide</heading>
    <paragraph>Main title and introduction</paragraph>
  </section>
  
  <section id="slide-2">
    <heading level="1">Slide 2: Overview</heading>
    <list type="unordered">
      <item>Key point 1</item>
      <item>Key point 2</item>
      <item>Key point 3</item>
    </list>
  </section>
  
  <section id="slide-3">
    <heading level="1">Slide 3: Visual Content</heading>
    <figure src="diagram.svg" alt="Key diagram">
      <caption>Visual representation of concept</caption>
    </figure>
  </section>
  
  <section id="slide-4">
    <heading level="1">Slide 4: Code Example</heading>
    <codeblock language="python">
def main():
    print("Hello, World!")
    return 0

if __name__ == "__main__":
    main()
    </codeblock>
  </section>
  
  <section id="slide-5">
    <heading level="1">Slide 5: Conclusion</heading>
    <paragraph>Wrap up with key takeaways.</paragraph>
  </section>
  
</spkml>
```

---

## Template 5: Podcast / Audio Content

Save as: `template-podcast.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>Podcast Episode Title</title>
    <author>Host Name</author>
    <date>2026-02-17</date>
    <version>Episode 1.0</version>
    <type>audio</type>
    <duration>3600</duration>
  </metadata>
  
  <section id="episode">
    <heading level="1">Episode 1: Topic Title</heading>
    
    <paragraph>
      Episode description and overview.
    </paragraph>
    
    <audio src="episode-001.mp3" format="mp3" duration="3600">
      <description>Full episode audio</description>
    </audio>
    
    <section id="transcript">
      <heading level="2">Transcript</heading>
      
      <paragraph>
        <strong>Host:</strong> Welcome to the podcast. Today we're discussing...
      </paragraph>
      
      <paragraph>
        <strong>Guest:</strong> Thanks for having me! I'm excited to talk about...
      </paragraph>
      
      <paragraph>
        [Full transcript content...]
      </paragraph>
    </section>
    
    <section id="show-notes">
      <heading level="2">Show Notes</heading>
      
      <list type="unordered">
        <item>
          <reference type="website" url="https://example.org">
            Resource mentioned in the show
          </reference>
        </item>
        <item>
          <reference type="book">
            Book recommended during episode
          </reference>
        </item>
      </list>
    </section>
  </section>
  
</spkml>
```

---

## Template 6: Video Tutorial / Course Content

Save as: `template-video-tutorial.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>How to [Learn/Do] Something</title>
    <author>Instructor Name</author>
    <date>2026-02-17</date>
    <type>video</type>
  </metadata>
  
  <section id="tutorial">
    <heading level="1">Complete Tutorial: Learn the Basics</heading>
    
    <paragraph>
      This tutorial will teach you everything you need to know about [topic].
    </paragraph>
    
    <video src="tutorial-full.mp4" format="mp4" duration="1200" width="1280" height="720">
      <description>Complete video tutorial</description>
      <transcript>
        <paragraph>
          [00:00] Introduction to the topic...
          [02:30] First concept explanation...
          [15:00] Practical demonstration...
          [20:00] Practice exercises...
          [25:00] Conclusion and next steps...
        </paragraph>
      </transcript>
    </video>
    
    <section id="outline">
      <heading level="2">Lesson Outline</heading>
      <list type="ordered">
        <item>Lesson 1: Fundamentals</item>
        <item>Lesson 2: Intermediate Concepts</item>
        <item>Lesson 3: Advanced Topics</item>
        <item>Lesson 4: Practical Project</item>
      </list>
    </section>
    
    <section id="resources">
      <heading level="2">Learning Resources</heading>
      <list type="unordered">
        <item>Practice exercise files</item>
        <item>Additional reading materials</item>
        <item>Reference documentation</item>
      </list>
    </section>
  </section>
  
</spkml>
```

---

## Template 7: Book / Long-Form Document

Save as: `template-book.spkml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0">
  
  <metadata>
    <title>Book Title Goes Here</title>
    <subtitle>Book subtitle</subtitle>
    <author>Author Name</author>
    <date>2026-02-17</date>
    <version>1.0.0</version>
    <keywords>book, fiction, subject</keywords>
    <type>book</type>
  </metadata>
  
  <section id="copyright">
    <heading level="1">Copyright</heading>
    <paragraph>
      Copyright information and publication details.
    </paragraph>
  </section>
  
  <section id="table-of-contents">
    <heading level="1">Table of Contents</heading>
    <list type="ordered">
      <item>Chapter 1: Title</item>
      <item>Chapter 2: Title</item>
      <item>Chapter 3: Title</item>
    </list>
  </section>
  
  <section id="preface">
    <heading level="1">Preface</heading>
    <paragraph>
      Introduction to the book, motivation, and what readers will learn.
    </paragraph>
  </section>
  
  <section id="chapter-1">
    <heading level="1">Chapter 1: Introduction</heading>
    
    <subsection id="ch1-section-1">
      <heading level="2">Section 1: Background</heading>
      <paragraph>Content here...</paragraph>
    </subsection>
    
    <subsection id="ch1-section-2">
      <heading level="2">Section 2: Main Ideas</heading>
      <paragraph>Content here...</paragraph>
    </subsection>
  </section>
  
  <section id="chapter-2">
    <heading level="1">Chapter 2: Development</heading>
    <paragraph>Chapter content...</paragraph>
  </section>
  
  <section id="conclusion">
    <heading level="1">Conclusion</heading>
    <paragraph>
      Concluding thoughts and final reflections.
    </paragraph>
  </section>
  
  <section id="bibliography">
    <heading level="1">Bibliography</heading>
    <list type="ordered">
      <item>
        <reference type="book">
          Author (Year). Book Title. Publisher.
        </reference>
      </item>
    </list>
  </section>
  
</spkml>
```

---

## How to Use These Templates

1. **Choose the appropriate template** for your document type
2. **Copy the template** to a new file
3. **Replace placeholder text** with your actual content
4. **Validate your document** against the SPKML schema:
   ```bash
   xmllint --schema spkml.xsd your-document.spkml
   ```
5. **Transform to HTML** (optional):
   ```bash
   xsltproc spkml-to-html.xslt your-document.spkml > output.html
   ```

---

## Template Customization Tips

- **Keep IDs meaningful**: Use descriptive IDs like `introduction`, `main-content`, `section-1` rather than `s1`, `s2`
- **Maintain hierarchy**: Don't skip heading levels (e.g., h1 → h2 → h4). Use proper nesting.
- **Use semantic elements**: Prefer `<emphasis>` over `<strong>` for emphasis; prefer lists for lists rather than paragraphs with line breaks
- **Include metadata**: Always fill in title, author, date, and keywords at minimum
- **Provide alt text**: Always include descriptive `alt` attributes on images
- **Preserve formatting**: Use `<literal>` for code that needs exact spacing, `<code>` for inline references

---

**Template Version:** 1.0  
**Last Updated:** February 2026  
**License:** CC-BY-SA 4.0
