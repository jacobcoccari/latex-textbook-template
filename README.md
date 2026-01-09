# LaTeX Textbook Template

A LaTeX template for creating textbooks and technical documents with margin notes, callout boxes, and a clean typographic style.

## Prerequisites

- **TeX Live** (Linux/Windows) or **MacTeX** (macOS)
- **LuaLaTeX** engine (included with TeX Live/MacTeX)
- Optional: VS Code with [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension

## Quick Start

1. Clone or copy this repository
2. Edit `main.tex` with your content
3. Compile:

```bash
# Using latexmk (recommended)
latexmk -lualatex main.tex

# Or directly with lualatex
lualatex main.tex
biber main
lualatex main.tex
```

If using VS Code with LaTeX Workshop, the document auto-compiles on save.

## File Structure

```
├── main.tex          # Main document - edit this
├── preamble.tex      # All styling and custom environments
├── references.bib    # Bibliography entries
├── .latexmkrc        # Build configuration
├── .vscode/          # VS Code settings for LaTeX Workshop
└── build/            # Output directory (generated)
```

## Document Structure

The template uses the `book` document class with chapters, sections, and subsections:

```latex
\chapter{Chapter Title}
\section{Section Title}
\subsection{Subsection Title}
```

## Custom Environments

### Info Box
General notes and supplementary information.

```latex
\begin{infobox}[Note]
Your note content here.
\end{infobox}
```

### Definition Box
Key terms and definitions with a dark header.

```latex
\begin{definitionbox}[Term Name]
Definition content here.
\end{definitionbox}
```

### Question Box
Exercise questions, auto-numbered Q1, Q2, etc.

```latex
\begin{questionbox}
Your question here.
\end{questionbox}
```

### Solution Box
Exercise solutions, auto-numbered S1, S2, etc.

```latex
\begin{solutionbox}
Your solution here.
\end{solutionbox}
```

### Prompt Box
Sample prompts or code blocks with monospace font.

```latex
\begin{promptbox}[Sample Prompt]
Your prompt content here.
\end{promptbox}
```

### Takeaway Box
Key points readers should remember.

```latex
\begin{takeawaybox}
Critical point to remember.
\end{takeawaybox}
```

## Custom Commands

### Margin Notes

```latex
\marginnotetext{Plain margin note text.}
\authornote{Author Name}{Attributed note with author.}
```

### Warning Notice

```latex
\warningnotice{Important warning text}
```

### Text Styling

```latex
\term{technical term}    % Italic
\tech{code or command}   % Monospace
\strong{emphasis}        % Bold
```

## Customization

### Colors

Edit the color definitions in `preamble.tex`:

```latex
\definecolor{headerred}{HTML}{AA0000}      % Running header, URLs
\definecolor{tealheader}{HTML}{48B5A6}     % Question box header
\definecolor{charcoalheader}{HTML}{4A4A4A} % Definition box header
\definecolor{coralred}{HTML}{C94C4C}       % Takeaway box accent
\definecolor{promptaccent}{HTML}{6366F1}   % Prompt box accent
```

### Fonts

The template uses Latin Modern fonts by default. To change fonts, edit the fontspec section in `preamble.tex`:

```latex
\setmainfont{Your Font Name}
\setsansfont{Your Sans Font}
\setmonofont{Your Mono Font}
```

### Page Layout

Adjust margins in the geometry package settings in `preamble.tex`. The default includes a wide right margin for margin notes.

## Bibliography

Add entries to `references.bib` and cite them:

```latex
\cite{key}           % (Author, Year)
\textcite{key}       % Author (Year)
\parencite{key}      % (Author, Year)
```

Print the bibliography:

```latex
\printbibliography[title={References}]
```

## License

MIT
