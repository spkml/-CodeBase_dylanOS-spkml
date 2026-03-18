# Dylan OS GitHub Repository Structure
## SPKML Language Specification & Interactive CodeBase Screenplay

```
https://github.com/dylan-os/spkml
│
├── README.md
│   ├── Project overview
│   ├── Quick start guide
│   ├── Key features
│   └── Links to documentation
│
├── LICENSE
│   └── CC-BY-SA 4.0
│
├── CONTRIBUTING.md
│   ├── How to contribute
│   ├── Code of conduct
│   ├── Development setup
│   └── Pull request guidelines
│
├── specification/
│   ├── SPKML_Specification_1.0.md
│   ├── SPKML_Screenplay_Extension_1.0.md
│   ├── SPKML_Semantic_Elements.md
│   ├── SPKML_Language_Support.md
│   └── schema/
│       ├── spkml.dtd
│       ├── spkml.xsd
│       ├── spkml-screenplay.xsd
│       └── spkml-namespaces.md
│
├── transformations/
│   ├── xslt/
│   │   ├── spkml-to-html.xslt
│   │   ├── spkml-screenplay-to-html.xslt
│   │   ├── spkml-to-pdf.xslt
│   │   └── spkml-to-markdown.xslt
│   ├── css/
│   │   ├── spkml-default.css
│   │   ├── spkml-screenplay.css
│   │   └── spkml-print.css
│   └── javascript/
│       ├── spkml-player.js
│       ├── screenplay-navigator.js
│       └── audio-sync.js
│
├── screenplays/
│   ├── codebook/
│   │   ├── README.md
│   │   │   ├── Project description
│   │   │   ├── Cast and credits
│   │   │   ├── How to view/listen
│   │   │   └── Development status
│   │   │
│   │   ├── SCREENPLAY_METADATA.spkml
│   │   │   ├── Production info
│   │   │   ├── Cast list with voice actors
│   │   │   ├── Character profiles
│   │   │   └── Voice actor samples
│   │   │
│   │   ├── scenes/
│   │   │   ├── prologue.spkml
│   │   │   ├── act-1/
│   │   │   │   ├── scene-001.spkml
│   │   │   │   ├── scene-002.spkml
│   │   │   │   ├── scene-003.spkml
│   │   │   │   └── ... (continuing scenes)
│   │   │   ├── act-2/
│   │   │   │   ├── scene-001.spkml
│   │   │   │   ├── scene-002.spkml
│   │   │   │   └── ...
│   │   │   ├── act-3/
│   │   │   │   ├── scene-001.spkml
│   │   │   │   ├── scene-002.spkml
│   │   │   │   └── ...
│   │   │   └── epilogue.spkml
│   │   │
│   │   ├── audio/
│   │   │   ├── narration/
│   │   │   │   ├── narrator-intro.mp3
│   │   │   │   ├── prologue.mp3
│   │   │   │   └── ...
│   │   │   ├── dialogue/
│   │   │   │   ├── philip/
│   │   │   │   │   ├── scene-001-line-001.mp3
│   │   │   │   │   ├── scene-001-line-002.mp3
│   │   │   │   │   └── ...
│   │   │   │   ├── sally/
│   │   │   │   ├── dylan/
│   │   │   │   └── ... (other characters)
│   │   │   ├── ambient/
│   │   │   │   ├── loft-ambience.mp3
│   │   │   │   ├── city-sounds.mp3
│   │   │   │   └── ...
│   │   │   ├── effects/
│   │   │   │   ├── keyboard-typing.mp3
│   │   │   │   ├── music-box.mp3
│   │   │   │   └── ...
│   │   │   └── music/
│   │   │       ├── theme.mp3
│   │   │       ├── underscore-dramatic.mp3
│   │   │       └── ...
│   │   │
│   │   ├── images/
│   │   │   ├── concept-art/
│   │   │   ├── character-designs/
│   │   │   ├── location-reference/
│   │   │   └── diagrams/
│   │   │
│   │   ├── rendered/
│   │   │   ├── codebook-screenplay.html
│   │   │   ├── codebook-screenplay.pdf
│   │   │   ├── codebook-screenplay.epub
│   │   │   └── codebook-audiobook-manifest.json
│   │   │
│   │   └── build/
│   │       ├── Makefile
│   │       ├── build-screenplay.sh
│   │       ├── sync-audio.py
│   │       └── generate-manifest.py
│   │
│   └── templates/
│       ├── blank-screenplay.spkml
│       ├── screenplay-with-structure.spkml
│       └── screenplay-with-full-markup.spkml
│
├── templates/
│   ├── screenplay-template.md
│   ├── scene-template.spkml
│   ├── character-template.spkml
│   └── voice-actor-brief.md
│
├── documentation/
│   ├── Getting_Started.md
│   ├── Creating_Screenplays.md
│   ├── Voice_Acting_Guide.md
│   ├── Audio_Production_Guide.md
│   ├── Publishing_Guide.md
│   ├── FAQ.md
│   └── Troubleshooting.md
│
├── tools/
│   ├── validators/
│   │   ├── validate-screenplay.py
│   │   ├── validate-audio-sync.py
│   │   └── check-character-consistency.py
│   │
│   ├── converters/
│   │   ├── spkml-to-html.py
│   │   ├── screenplay-to-audiobook-manifest.py
│   │   └── merge-screenplays.py
│   │
│   ├── generators/
│   │   ├── character-sheet-generator.py
│   │   ├── audio-sync-generator.py
│   │   └── toc-generator.py
│   │
│   └── editors/
│       ├── screenplay-editor.html
│       └── screenplay-previewer.js
│
├── audio/
│   ├── voice-samples/
│   │   ├── narrator/
│   │   ├── philip/
│   │   ├── sally/
│   │   ├── dylan/
│   │   └── supporting-cast/
│   │
│   ├── guidelines/
│   │   ├── voice-direction-guide.md
│   │   ├── recording-standards.md
│   │   └── audio-mixing-specs.md
│   │
│   └── production-notes/
│       ├── casting-notes.md
│       ├── recording-schedule.md
│       └── post-production-checklist.md
│
├── examples/
│   ├── simple-screenplay.spkml
│   ├── screenplay-with-narration.spkml
│   ├── screenplay-with-multimedia.spkml
│   └── sample-rendered-output.html
│
├── tests/
│   ├── validate-spkml.test.js
│   ├── validate-screenplay.test.js
│   ├── audio-sync.test.js
│   └── rendering.test.js
│
├── ci-cd/
│   ├── .github/
│   │   └── workflows/
│   │       ├── validate-spkml.yml
│   │       ├── test-screenplay.yml
│   │       ├── build-renders.yml
│   │       └── check-audio-sync.yml
│   │
│   └── .gitignore
│       (Exclude large audio files, build artifacts)
│
└── website/
    ├── index.html
    ├── docs/
    ├── playground/
    ├── showcase/
    └── assets/

```

---

## Repository Statistics

- **Documentation Files**: 40+
- **SPKML Schema Files**: 4 (DTD, XSD, extensions, namespaces)
- **Transformation Files**: XSLT, CSS, JavaScript
- **Screenplay Content**: Modular scene-based structure
- **Audio Assets**: Organized by character, scene, and type
- **Tools & Utilities**: Validators, converters, generators

---

## Key Repository Features

### 1. Complete SPKML Specification
- Full language specification with all elements
- Screenplay-specific extension
- Multiple schema formats (DTD, XSD)
- Example documents and templates

### 2. Interactive CodeBase Screenplay
- Full screenplay in SPKML format
- Organized by scenes and acts
- Integrated voice narration
- Professional audio production
- Multiple character voices
- Ambient sound and effects

### 3. Professional Audio Integration
- Voice actor samples
- Audio synchronization
- Production guidelines
- Recording standards
- Post-production workflow

### 4. Transformation Tools
- SPKML → HTML5 (interactive web version)
- SPKML → PDF (printable script)
- SPKML → EPUB (eBook)
- SPKML → Markdown (portable format)
- Screenplay → Audiobook manifest

### 5. Development Tools
- Validators for SPKML and screenplay format
- Audio sync verification
- Character consistency checker
- Web-based screenplay editor
- Renderers and previewers

### 6. Comprehensive Documentation
- Getting started guides
- Voice acting guidelines
- Audio production best practices
- Publishing workflows
- FAQ and troubleshooting

---

## Build & Deployment

### GitHub Actions CI/CD Pipeline

```yaml
# Validate all SPKML files
- Validate against XSD schema
- Check screenplay structure
- Verify character references
- Test audio synchronization

# Build rendered outputs
- Generate HTML versions
- Create PDF scripts
- Package EPUB/audiobook
- Generate static website

# Quality assurance
- Run automated tests
- Verify audio sync
- Check links and references
- Performance testing
```

### Continuous Deployment
- Automatic website updates
- Built versions available for download
- Staging environment for testing
- Production deployment on release

---

## File Size Estimates

| Component | Size |
|-----------|------|
| Specification documentation | ~200 KB |
| SPKML schema files | ~60 KB |
| Transformation files (XSLT/CSS/JS) | ~100 KB |
| Screenplay text (SPKML) | ~300 KB |
| Audio files (compressed) | ~500 MB |
| Images and diagrams | ~50 MB |
| Built HTML/PDF versions | ~100 MB |
| **Total (with media)** | **~650 MB** |

---

## Git Workflow

### Branches
- `main` - Production-ready (tagged releases)
- `develop` - Development branch
- `feature/*` - Feature branches
- `fix/*` - Bug fix branches
- `docs/*` - Documentation updates

### Commit Message Convention
```
[TYPE] Brief description

Longer explanation if needed.

- Bullet point details
- More information

Closes #issue-number
```

Types: `[spec]`, `[screenplay]`, `[audio]`, `[tool]`, `[docs]`, `[fix]`

---

## Release Schedule

- **v1.0 (Current)**: Core specification + Sample scenes
- **v1.1**: Complete screenplay + Full voice cast
- **v1.2**: Additional rendering formats + Interactive tools
- **v2.0**: Extended screenplay + Additional content

---

## Contributing Guidelines

Contributors can help with:
- Voice acting and narration
- Audio production and mixing
- Writing and screenwriting
- SPKML development
- Tool development
- Documentation
- Translation

See `CONTRIBUTING.md` for detailed guidelines.

---

## Community

- **GitHub Discussions**: General Q&A and ideas
- **GitHub Issues**: Bug reports and feature requests
- **Pull Requests**: Contributions welcome
- **Discord Community**: Real-time chat
- **Forum**: https://forum.dylan.os/

---

**Repository**: https://github.com/dylan-os/spkml  
**License**: CC-BY-SA 4.0  
**Maintained By**: Dylan OS Foundation  
**Last Updated**: February 2026
