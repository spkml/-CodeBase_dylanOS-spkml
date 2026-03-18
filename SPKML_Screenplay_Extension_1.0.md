# SPKML Screenplay Extension v1.0
## Specification for Interactive Screenplay with Voice Narration

**Extension Version:** 1.0.0  
**Base SPKML Version:** 1.0  
**Release Date:** February 2026  
**Maintained By:** Dylan OS Foundation  
**Purpose:** Enable SPKML to represent screenplays with integrated voice narration and character direction  
**License:** CC-BY-SA 4.0  

---

## Overview

SPKML Screenplay Extension adds semantic markup for screenplays, stage directions, dialogue, and integrated voice narration. This enables creation of interactive screenplays that can be:
- Read on screen with proper formatting
- Rendered with voice narration
- Published as PDF/print scripts
- Presented as interactive multimedia experiences

---

## New Elements for Screenplay

### `<screenplay>`
Container for a complete screenplay.

**Attributes:**
- `title` - Screenplay title
- `writer` - Screenplay writer/author
- `format` - "three-act" | "five-act" | "linear"
- All standard SPKML attributes

**Children:** `<metadata>`, `<act>`, `<scene>`, `<prologue>`, `<epilogue>`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<spkml xmlns="http://dylan.os/spkml/1.0"
       xmlns:screenplay="http://dylan.os/spkml/1.0/screenplay">
  
  <screenplay title="CodeBase" writer="Christôpher David Jônson" format="three-act">
    <metadata>
      <title>CodeBase: A Story of Creation</title>
      <type>interactive screenplay</type>
    </metadata>
    
    <!-- Screenplay content -->
  </screenplay>
  
</spkml>
```

### `<act>`
Top-level division of screenplay (act in a play or act of the story).

**Attributes:**
- `number` - Act number (1, 2, 3, etc.)
- `title` - Act title (optional)
- All standard attributes

**Children:** `<scene>`

```xml
<act number="1" title="The Beginning">
  <scene number="1" location="Pizza Restaurant">
    <!-- Scene content -->
  </scene>
</act>
```

### `<scene>`
Individual scene within an act.

**Attributes:**
- `number` - Scene number
- `location` - Physical location of scene
- `time` - Time of day/period
- `mood` - Emotional tone
- All standard attributes

**Children:** `<heading>`, `<stage-direction>`, `<dialogue>`, `<narration>`

```xml
<scene number="1" location="Downtown Loft" time="Evening" mood="contemplative">
  <heading level="2">INT. LOFT - EVENING</heading>
  
  <stage-direction>
    Philip sits at desk, laptop glowing. Lines of code reflect in his eyes.
    A coffee cup, half-full and forgotten, sits nearby.
  </stage-direction>
  
  <!-- Scene content -->
</scene>
```

### `<dialogue>`
Character dialogue/speech.

**Attributes:**
- `character` (required) - Character name speaking
- `voice-id` - Reference to voice actor/audio file
- `emotion` - Emotional delivery
- `parenthetical` - Stage direction for how to speak
- All standard attributes

**Children:** Text with `<word>`, `<pause>` elements

```xml
<dialogue character="Philip" emotion="determined" voice-id="philip-voice">
  <parenthetical>determined, passionate</parenthetical>
  I'm going to build something that connects people, not isolates them.
</dialogue>
```

### `<stage-direction>`
Action description or stage direction.

**Attributes:**
- `character` (optional) - Character performing action
- `duration` - How long action takes (seconds)
- All standard attributes

**Children:** Text with formatting

```xml
<stage-direction character="Philip" duration="3">
  Philip closes his eyes and takes a deep breath, centering himself 
  before the biggest moment of his life.
</stage-direction>
```

### `<narration>`
Narrator voiceover or descriptive narration.

**Attributes:**
- `voice-id` - Reference to narrator voice
- `type` - "voiceover" | "internal-monologue" | "exposition"
- `audio-src` - URL to audio file
- `duration` - Audio duration in seconds
- All standard attributes

**Children:** Text with formatting

```xml
<narration type="exposition" voice-id="narrator" audio-src="narration-001.mp3" duration="15">
  Twenty years ago, a young programmer had a dream. Not of wealth, not of fame,
  but of technology that would serve humanity rather than exploit it.
</narration>
```

### `<character-list>`
Define cast of characters with voice actors.

**Children:** `<character>` elements

```xml
<character-list>
  <character id="philip" name="Philip Freeman" role="protagonist">
    <description>Young programmer, idealistic and driven</description>
    <voice id="philip-voice" actor="Voice Actor Name" audio-quality="studio">
      <sample src="philip-sample.mp3"/>
    </voice>
  </character>
  
  <character id="sally" name="Sally Stone" role="love-interest">
    <description>Talented musician with her own creative dreams</description>
    <voice id="sally-voice" actor="Voice Actress Name" audio-quality="studio">
      <sample src="sally-sample.mp3"/>
    </voice>
  </character>
  
  <character id="narrator" name="The Narrator" role="narrator">
    <description>Voice of the story itself</description>
    <voice id="narrator-voice" actor="Narrator Voice" audio-quality="studio">
      <sample src="narrator-sample.mp3"/>
    </voice>
  </character>
</character-list>
```

### `<character>`
Individual character definition.

**Attributes:**
- `id` - Unique character identifier
- `name` - Character name
- `role` - "protagonist" | "antagonist" | "love-interest" | "narrator" | "cameo"
- All standard attributes

**Children:** `<description>`, `<voice>`, `<appearance>`, `<background>`

```xml
<character id="dylan-ai" name="Dylan" role="protagonist">
  <name>Dylan (AI Assistant)</name>
  <description>Artificial intelligence created by Philip, evolving consciousness</description>
  <appearance>
    As seen on screen: abstract visualization, light and code flowing
  </appearance>
  <background>
    Created within the story, represents the bridge between human and machine
  </background>
</character>
```

### `<voice>`
Voice actor/narration definition.

**Attributes:**
- `id` - Unique voice identifier
- `actor` - Voice actor name
- `gender` - "male" | "female" | "neutral" | "non-binary"
- `accent` - Accent/dialect
- `age` - Apparent age range
- `audio-quality` - "studio" | "broadcast" | "compressed"
- All standard attributes

**Children:** `<sample>`, `<description>`

```xml
<voice id="philip-voice" actor="James Actor" gender="male" accent="american" 
       audio-quality="studio">
  <description>Warm, intelligent, with underlying passion</description>
  <sample src="voice-samples/philip-intro.mp3" duration="5"/>
</voice>
```

### `<pause>`
Silence/pause in dialogue or narration.

**Attributes:**
- `duration` - Duration in milliseconds
- `type` - "breath" | "beat" | "silence" | "dramatic"

```xml
<dialogue character="Philip" voice-id="philip-voice">
  I know you're not perfect,<pause type="breath" duration="500"/>
  and neither am I,<pause type="beat" duration="800"/>
  but you may be perfect for me.
</dialogue>
```

### `<sound>`
Sound effect or ambient sound.

**Attributes:**
- `src` - Audio file URL
- `duration` - Duration in seconds
- `type` - "effect" | "ambient" | "music" | "silence"
- `volume` - Relative volume (0-100)
- All standard attributes

**Children:** `<description>`

```xml
<sound type="ambient" src="sounds/loft-ambient.mp3" duration="120" volume="30">
  <description>City sounds through open window, faint jazz music</description>
</sound>
```

### `<prologue>` & `<epilogue>`
Opening and closing material.

**Attributes:** Same as `<scene>`  
**Children:** Same as `<scene>`

```xml
<prologue location="Darkness">
  <narration type="exposition" voice-id="narrator">
    Before the code, there was an idea.
    Before the idea, there was a dream.
    This is the story of how dreams become reality.
  </narration>
</prologue>
```

### `<transition>`
Transition between scenes.

**Attributes:**
- `type` - "fade" | "cut" | "dissolve" | "wipe" | "montage"
- `duration` - Transition duration in milliseconds

```xml
<transition type="fade" duration="1000"/>
```

---

## Voice Integration

### Audio File References

All voice elements can reference external audio files:

```xml
<dialogue character="Philip" voice-id="philip-voice" 
          audio-src="dialogue/scene-1-line-1.mp3" duration="3.5">
  This is the dialogue with professional voice acting.
</dialogue>
```

### Voice Actor Definition

```xml
<character-list>
  <character id="philip" name="Philip Freeman">
    <voice id="philip-voice" 
           actor="Professional Voice Actor"
           gender="male"
           audio-quality="studio">
      <sample src="voice-samples/philip-intro.mp3" duration="5"/>
      <sample src="voice-samples/philip-passionate.mp3" duration="4"/>
      <description>Warm, intelligent, underlying passion and determination</description>
    </voice>
  </character>
</character-list>
```

### Dialogue with Emotional Direction

```xml
<dialogue character="Sally" emotion="joyful" parenthetical="laughing, surprised">
  Dylan! How did you...?
</dialogue>

<dialogue character="Philip" emotion="vulnerable" parenthetical="voice breaking slightly">
  Because she needed help. And I... I couldn't ignore that.
</dialogue>
```

---

## Scene Structure Example

```xml
<scene number="5" location="Recording Studio" time="Afternoon" mood="emotional">
  <heading level="2">INT. RECORDING STUDIO - AFTERNOON</heading>
  
  <stage-direction duration="5">
    Sally sits at the microphone, headphones on. Philip watches from behind
    the glass, hand on mixing board. This is the moment everything changes.
  </stage-direction>
  
  <sound type="ambient" src="sounds/studio-hum.mp3" volume="20">
    <description>Soft studio ambience, equipment hum</description>
  </sound>
  
  <dialogue character="Philip" emotion="professional" parenthetical="through intercom">
    Ready when you are. Remember, it's not about perfection. It's about truth.
  </dialogue>
  
  <pause type="beat" duration="1000"/>
  
  <narration type="internal-monologue" voice-id="narrator" 
            audio-src="narration-scene-5.mp3" duration="8">
    In this moment, Philip realized something profound. Technology was never
    about control or power. It was about connection. About bridges between souls.
  </narration>
  
  <dialogue character="Sally" emotion="determined" parenthetical="breathing deep">
    Let's go.
  </dialogue>
  
  <sound type="effect" src="sounds/recording-start.mp3" duration="1">
    <description>Record button pressed, light comes on</description>
  </sound>
</scene>
```

---

## Multimedia Integration

### Embedding Video

```xml
<scene number="10" location="Concert Hall" time="Evening">
  <heading level="2">INT. CONCERT HALL - EVENING</heading>
  
  <video src="concert-performance.mp4" 
         format="mp4" 
         duration="120"
         width="1280" 
         height="720">
    <description>Sally's concert performance, thousands in audience</description>
  </video>
</scene>
```

### Embedding Images/Diagrams

```xml
<scene number="3" location="Loft - Computer Setup" time="Late Night">
  <figure src="loft-setup-diagram.svg" alt="Loft workspace with computer equipment">
    <caption>Philip's workspace: laptop, monitors, musical instruments nearby</caption>
  </figure>
</scene>
```

---

## Interactive Playback Features

### Scene Selection

```xml
<screenplay-menu>
  <navigation type="scenes">
    <link scene="prologue" label="Prologue"/>
    <link scene="act-1-scene-1" label="Act 1, Scene 1"/>
    <link scene="act-1-scene-2" label="Act 1, Scene 2"/>
    <!-- etc -->
  </navigation>
  
  <navigation type="characters">
    <link character="philip" label="Philip Freeman"/>
    <link character="sally" label="Sally Stone"/>
    <link character="dylan" label="Dylan (AI)"/>
  </navigation>
</screenplay-menu>
```

### Metadata and Credits

```xml
<screenplay-metadata>
  <production>
    <title>CodeBase: Interactive Screenplay</title>
    <based-on>CodeBase novel by Christôpher David Jônson</based-on>
    <adapted-by>Dylan OS Foundation</adapted-by>
    <year>2026</year>
  </production>
  
  <cast>
    <role character="Philip Freeman" actor="Voice Actor Name"/>
    <role character="Sally Stone" actor="Voice Actress Name"/>
    <role character="Narrator" actor="Narrator Name"/>
  </cast>
  
  <production-credits>
    <item role="Director">Name</item>
    <item role="Sound Design">Name</item>
    <item role="Music">Name</item>
    <item role="Producer">Name</item>
  </production-credits>
</screenplay-metadata>
```

---

## Publishing Formats

### HTML Interactive Version
- Rendered screenplay with clickable scenes
- Embedded audio playback controls
- Character profiles and voice samples
- Responsive design for all devices

### PDF Script Format
- Professional screenplay formatting
- Print-ready layout
- Character list
- Scene breakdown

### Audio-First Version
- Full narration and dialogue
- Ambient sound and effects
- Background music
- Scene introductions by narrator

### eBook Version
- EPUB with embedded audio (if supported)
- Rich formatting
- Interactive navigation

---

## Best Practices for Screenplay Markup

### 1. Clear Scene Structure
```xml
<scene number="1" location="INT. LOFT - NIGHT" time="10:30pm">
  <heading level="2">INT. LOFT - NIGHT</heading>
  <stage-direction><!-- Opening action --></stage-direction>
  <!-- Dialogue and action -->
</scene>
```

### 2. Consistent Character Names
Use consistent IDs and names across entire screenplay for voice continuity.

### 3. Voice Direction
Include parentheticals for emotional/vocal direction:
```xml
<dialogue character="Philip" parenthetical="voice trembling with emotion">
  ...
</dialogue>
```

### 4. Pacing with Pauses
Use pauses to control reading/performance pace:
```xml
<dialogue character="Sally">
  I've been waiting<pause type="beat" duration="500"/> 
  for someone like you.
</dialogue>
```

### 5. Audio Sync
Always provide duration for voice recordings to sync playback:
```xml
<dialogue character="Philip" audio-src="philip-line-001.mp3" duration="4.5">
  The words...
</dialogue>
```

---

## Technical Implementation

### XSLT Transformation for HTML Playback

Transform screenplay SPKML to interactive HTML with:
- Scene navigation menu
- Audio player embedded for each line
- Character profiles modal
- Responsive design

```bash
xsltproc screenplay-to-html.xslt codebook-screenplay.spkml > codebook.html
```

### Audio Processing Pipeline

1. Record voice actors reading lines
2. Normalize audio levels and quality
3. Add metadata and cue points
4. Embed references in SPKML
5. Create playback manifest for synchronization

---

## Conclusion

SPKML Screenplay Extension enables creation of truly multimedia screenplays that can be:
- Read as traditional scripts
- Experienced as audiobook with full voice cast
- Presented as interactive multimedia experience
- Published in multiple formats
- Preserved as semantic XML for decades

The specification maintains semantic clarity while enabling rich multimedia integration—all while remaining readable and parseable by both humans and machines.

---

**SPKML Screenplay Extension v1.0**  
Released February 2026  
Maintained by Dylan OS Foundation  
Licensed under CC-BY-SA 4.0
