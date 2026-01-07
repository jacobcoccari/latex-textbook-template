# Architecture

## Overview

This LaTeX environment uses a modular design separating content from styling, with automated compilation via latexmk.

```
┌─────────────────────────────────────────────────────────────┐
│                        VS Code                               │
│  ┌─────────────┐    ┌──────────────┐    ┌───────────────┐  │
│  │  main.tex   │───▶│ LaTeX Workshop│───▶│   latexmk     │  │
│  │  (content)  │    │  (extension)  │    │  (build tool) │  │
│  └─────────────┘    └──────────────┘    └───────┬───────┘  │
│                                                  │          │
└──────────────────────────────────────────────────┼──────────┘
                                                   │
                                                   ▼
                              ┌─────────────────────────────┐
                              │         LuaLaTeX            │
                              │   (TeX Live 2025 engine)    │
                              └─────────────┬───────────────┘
                                            │
                    ┌───────────────────────┼───────────────────────┐
                    │                       │                       │
                    ▼                       ▼                       ▼
            ┌───────────┐           ┌───────────┐           ┌───────────┐
            │   Biber   │           │  fontspec │           │ tcolorbox │
            │ (bib mgmt)│           │  (fonts)  │           │  (boxes)  │
            └───────────┘           └───────────┘           └───────────┘
```

## Engine Choice: LuaLaTeX

| Engine | Speed | Unicode | Custom Fonts | Scripting |
|--------|-------|---------|--------------|-----------|
| pdfLaTeX | Fastest | Limited | No | No |
| XeLaTeX | Medium | Native | Yes | No |
| **LuaLaTeX** | Medium | Native | Yes | Lua |

LuaLaTeX selected because:
1. Native OpenType/TrueType font support (custom fonts requirement)
2. Full Unicode support
3. Future extensibility via Lua scripting
4. Recommended for modern documents

## File Structure

### Core Files

```
main.tex          Entry point, document structure, content
    │
    └──▶ preamble.tex    All \usepackage declarations, custom environments
              │
              └──▶ references.bib    Bibliography database
```

### Configuration Files

```
.latexmkrc              Build automation settings
                        - Engine selection (lualatex)
                        - Biber integration
                        - Output directory
                        - Clean patterns

.vscode/settings.json   Editor integration
                        - Auto-build on save
                        - Recipe definitions
                        - SyncTeX settings
```

## Package Dependencies

### Layout & Typography

| Package | Purpose |
|---------|---------|
| `geometry` | Page dimensions, margins (3" right for margin notes) |
| `fontspec` | Custom font loading (LuaLaTeX only) |
| `microtype` | Improved justification, character protrusion |
| `setspace` | Line spacing control |
| `titlesec` | Section heading customization |
| `fancyhdr` | Running headers with section titles |

### Content Elements

| Package | Purpose |
|---------|---------|
| `tcolorbox` | Callout boxes (info, solution, definition, prompt) |
| `marginnote` | Right-margin annotations |
| `sidenotes` | Enhanced sidenote support |
| `enumitem` | List customization (bullets, lettered) |
| `listings` | Code formatting |

### Bibliography

| Package | Purpose |
|---------|---------|
| `biblatex` | Modern bibliography management |
| `biber` | Backend processor (replaces BibTeX) |

Style: `authoryear` for (Author 2025) citations

### Utilities

| Package | Purpose |
|---------|---------|
| `xcolor` | Color definitions |
| `hyperref` | PDF hyperlinks, metadata |
| `graphicx` | Image inclusion |
| `booktabs` | Professional tables |

## Custom Environments

### Box Definitions (tcolorbox)

All boxes use `tcolorbox` with `enhanced` and `breakable` options.

```
infobox         Blue 2pt border, white background
                Usage: \begin{infobox}[Title]...\end{infobox}

solutionbox     Light gray background, auto-numbered
                Counter: solutioncount
                Usage: \begin{solutionbox}...\end{solutionbox}

definitionbox   Dark charcoal header bar, white body
                Usage: \begin{definitionbox}[Term]...\end{definitionbox}

promptbox       Cream background, for code/prompts
                Usage: \begin{promptbox}...\end{promptbox}
```

### Color Palette

```
boxblue         #4A90D9    Info box borders
boxbluebg       #F0F7FF    Light blue backgrounds
solutionbg      #F5F7FA    Solution box background
definitionheader #2D3748   Dark header bars
codebg          #FAFAF8    Code background (cream)
warningred      #C53030    Warning text
linkblue        #2B6CB0    Hyperlinks
```

## Build Process

### latexmk Workflow

```
1. Parse .latexmkrc configuration
2. Run lualatex (first pass)
3. Detect bibliography changes → run biber
4. Detect cross-reference changes → re-run lualatex
5. Repeat until stable (max 5 iterations)
6. Output PDF to build/
```

### VS Code Integration

```
Save main.tex
    │
    ▼
LaTeX Workshop detects change
    │
    ▼
Executes recipe: latexmk_lualatex
    │
    ▼
latexmk runs with args:
  -lualatex
  -shell-escape
  -synctex=1
  -interaction=nonstopmode
  -outdir=build
    │
    ▼
PDF generated in build/main.pdf
    │
    ▼
SyncTeX enables click-to-source navigation
```

## Directory Purposes

| Directory | Purpose |
|-----------|---------|
| `build/` | All compilation output (PDF, aux files) |
| `chapters/` | Optional: split content into chapter files |
| `figures/` | Images referenced in document |
| `upstream/` | Reference implementation (latex-service) |
| `docs/v1/` | This documentation |

## Extension Points

### Adding Custom Fonts

In `preamble.tex`:
```latex
\setmainfont{Your Font Name}
\setsansfont{Your Sans Font}
\setmonofont{Your Mono Font}[Scale=0.9]
```

### Adding New Box Types

Use `\newtcolorbox` in `preamble.tex`:
```latex
\newtcolorbox{mybox}[1][]{
  enhanced,
  breakable,
  colback=white,
  colframe=mycolor,
  ...
}
```

### Switching to pdfLaTeX

If custom fonts not needed, edit `.latexmkrc`:
```perl
$pdf_mode = 1;  # Switch from 4 (lualatex) to 1 (pdflatex)
```

And update VS Code recipe to `latexmk (pdflatex)`.
