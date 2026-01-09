# Claude Context

This file contains context for Claude to work effectively on this LaTeX textbook template project.

## Project Overview

A LaTeX template for textbooks and technical documents using the `book` document class with custom styling, margin notes, and callout boxes. Compiled with LuaLaTeX for custom font support.

## File Structure

```
├── main.tex          # Main document - chapter content goes here
├── preamble.tex      # All packages, colors, environments, commands
├── references.bib    # Bibliography entries (BibTeX format)
├── .latexmkrc        # Build configuration (uses full paths to TeX binaries)
├── .vscode/          # VS Code LaTeX Workshop settings
├── build/            # Output directory (PDF, aux files) - gitignored
├── docs/             # Version documentation
│   └── v1/           # Current version docs
└── README.md         # User-facing documentation
```

## Version Management

We document major design iterations in `docs/vN/` directories:

- `docs/v1/` - Current version with README.md, ARCHITECTURE.md, BOOTSTRAP.md
- `docs/v2/` - Create when making significant design changes

Each version directory should contain:
- `README.md` - Features, quick start, environment reference
- `ARCHITECTURE.md` - Technical decisions, package choices, diagrams
- `BOOTSTRAP.md` - Setup instructions (optional)

When creating a new version:
1. Create `docs/vN/` directory
2. Copy and update documentation from previous version
3. Document what changed and why

## Compilation

Always use full paths to TeX binaries (for compatibility with VS Code):

```bash
/Library/TeX/texbin/latexmk -lualatex -output-directory=build main.tex
```

The `.latexmkrc` file contains full paths for `lualatex` and `biber`.

## Custom Environments

All defined in `preamble.tex`:

| Environment | Purpose | Numbering |
|-------------|---------|-----------|
| `infobox[Title]` | Notes, gray left bar | None |
| `definitionbox[Term]` | Definitions, charcoal header | None |
| `questionbox` | Exercise questions, teal header | Q1, Q2, ... |
| `solutionbox` | Exercise solutions, charcoal border | S1, S2, ... |
| `promptbox[Title]` | Code/prompts, indigo left bar, monospace | None |
| `takeawaybox` | Key points, coral left bar | Auto-numbered |

## Custom Commands

| Command | Output | Use |
|---------|--------|-----|
| `\marginnotetext{text}` | Margin note | Side annotations |
| `\authornote{Name}{text}` | Attributed margin note | Author comments |
| `\warningnotice{text}` | Red centered text | Warnings |
| `\term{word}` | Italic | Technical terms |
| `\tech{word}` | Monospace | Code, commands |
| `\strong{word}` | Bold | Emphasis |

## Color Scheme

```latex
headerred       #AA0000   % Running header, URLs
tealheader      #48B5A6   % Question box header
charcoalheader  #4A4A4A   % Definition box, solution border
promptaccent    #6366F1   % Prompt box (indigo)
coralred        #C94C4C   % Takeaway box
```

## Workflow Conventions

### Commits
- Commit after completing each logical change
- Use descriptive commit messages explaining "why"
- Include `Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>` when Claude contributes

### Testing Changes
1. Compile with latexmk to verify no errors
2. Check PDF output visually
3. Commit only after successful compilation

### Making Design Changes
1. Edit `preamble.tex` for styling changes
2. Test in `main.tex` with example content
3. Update `README.md` if adding new environments/commands
4. Update `docs/vN/` if significant architectural change

## Common Tasks

### Add a new box environment
Edit `preamble.tex`, add after existing boxes:
```latex
\newtcolorbox{mybox}[1][Title]{
  enhanced, breakable,
  colback=white,
  colframe=mycolor,
  % ... styling
}
```

### Change colors
Edit the color definitions section in `preamble.tex`:
```latex
\definecolor{colorname}{HTML}{XXXXXX}
```

### Add a new chapter
In `main.tex`:
```latex
\chapter{Chapter Title}
\label{chap:shortname}

\section{Section Title}
Content...
```

## Things to Avoid

- Don't use relative paths for TeX binaries (VS Code won't find them)
- Don't edit `build/` files directly (they're regenerated)
- Don't commit build artifacts (covered by .gitignore)
- Don't change document class without updating preamble (book class expected)
