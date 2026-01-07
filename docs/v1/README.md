# LaTeX Whitepaper Template v1

A fast, customizable LaTeX environment for creating textbook-style documents with margin notes, callout boxes, and professional typography.

## Features

- **Margin notes** - Right-side annotations for supplementary content
- **Callout boxes** - Info, solution, definition, and code boxes
- **Custom fonts** - OpenType/TrueType support via LuaLaTeX
- **Bibliography** - Author-date citations with Biber
- **Auto-build** - Compiles on save in VS Code

## Requirements

- **TeX Live 2025** (via MacTeX on macOS)
- **VS Code** with LaTeX Workshop extension
- **Biber** (included with TeX Live)

## Quick Start

1. Install MacTeX: `brew install --cask mactex`
2. Install VS Code LaTeX Workshop extension
3. Open `main.tex` and save to compile
4. PDF outputs to `build/` directory

## Project Structure

```
latex-whitepaper/
├── main.tex             # Main document
├── preamble.tex         # Packages, boxes, styling
├── references.bib       # Bibliography entries
├── .latexmkrc           # Compilation settings
├── .vscode/settings.json
├── build/               # Output directory
├── chapters/            # Chapter files (optional)
├── figures/             # Images
└── docs/v1/             # Documentation
```

## Custom Environments

| Environment | Usage |
|-------------|-------|
| `\marginnotetext{text}` | Margin annotation |
| `\begin{infobox}[Title]` | Blue-bordered info box |
| `\begin{solutionbox}` | Numbered solution (gray background) |
| `\begin{definitionbox}[Term]` | Definition with dark header |
| `\begin{promptbox}` | Code/prompt display |
| `\warningnotice{text}` | Centered red warning |

## Text Commands

| Command | Output | Use for |
|---------|--------|---------|
| `\term{word}` | *italics* | Defined terms |
| `\tech{word}` | `monospace` | Technical terms, commands |
| `\strong{word}` | **bold** | Key concepts |

## Citations

Uses `biblatex` with author-date style:

- `\textcite{key}` → Shankar et al. (2025)
- `\parencite{key}` → (Shankar et al. 2025)

## Compilation

Automatic via VS Code on save, or manual:

```bash
latexmk -lualatex -outdir=build main.tex
```

Clean build artifacts:

```bash
latexmk -c -outdir=build
```
