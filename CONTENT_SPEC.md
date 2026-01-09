# LaTeX Textbook Content Specification

This document specifies the LaTeX syntax for writing content in this textbook template. Follow these patterns exactly.

## Document Structure

### Chapters

```latex
\chapter{Chapter Title}
\label{chap:short-name}

Opening paragraph of the chapter.
```

### Sections

```latex
\section{Section Title}
\label{sec:short-name}

Section content.
```

### Subsections

```latex
\subsection{Subsection Title}
\label{subsec:short-name}

Subsection content.
```

---

## Text Formatting

### Inline Styles

| Syntax | Renders As | Use For |
|--------|------------|---------|
| `\term{machine learning}` | *machine learning* | First use of technical terms |
| `\tech{pip install}` | `pip install` | Commands, code, file names |
| `\strong{important}` | **important** | Key emphasis |
| `\textit{emphasis}` | *emphasis* | General italics |
| `\textbf{bold}` | **bold** | General bold |

### Example

```latex
When working with \term{neural networks}, use the \tech{torch} library.
The \strong{key insight} is that layers compose.
```

---

## Callout Boxes

### Info Box

For supplementary notes and context.

```latex
\begin{infobox}[Note]
Additional context that supports the main text but isn't essential.
\end{infobox}
```

The title in brackets is optional. Default is "Note".

```latex
\begin{infobox}[Historical Context]
Custom title appears in bold at the top.
\end{infobox}
```

### Definition Box

For key terms and formal definitions.

```latex
\begin{definitionbox}[Term Name]
The formal definition of the term.

Can include multiple paragraphs and lists:
\begin{itemize}
  \item Property one
  \item Property two
\end{itemize}
\end{definitionbox}
```

### Question Box

For exercises and practice problems. Auto-numbered Q1, Q2, etc.

```latex
\begin{questionbox}
What is the time complexity of binary search?
\end{questionbox}
```

### Solution Box

For exercise solutions. Auto-numbered S1, S2, etc. Pair with question boxes.

```latex
\begin{solutionbox}
The time complexity is O(log n) because the search space is halved
with each comparison.
\end{solutionbox}
```

### Prompt Box

For code, prompts, or verbatim content. Renders in monospace.

```latex
\begin{promptbox}[Sample Prompt]
Write a Python function that calculates the factorial of a number.
Include error handling for negative inputs.
\end{promptbox}
```

Custom title:

```latex
\begin{promptbox}[System Prompt]
You are a helpful assistant...
\end{promptbox}
```

### Takeaway Box

For critical points readers must remember. Auto-numbered.

```latex
\begin{takeawaybox}
Always validate user input before processing. Never trust data
from external sources.
\end{takeawaybox}
```

---

## Margin Notes

### Plain Margin Note

```latex
This is the main text.\marginnotetext{This appears in the right margin.}
```

### Attributed Margin Note

```latex
This is the main text.\authornote{Alice}{I found this particularly useful
when working on Project X.}
```

---

## Warning Notice

Centered, red, uppercase warning text.

```latex
\warningnotice{This section contains advanced material}
```

---

## Lists

### Bullet List

```latex
\begin{itemize}
  \item First item
  \item Second item
  \item Third item
\end{itemize}
```

### Numbered List (Lettered)

```latex
\begin{enumerate}
  \item First item (renders as (a))
  \item Second item (renders as (b))
  \item Third item (renders as (c))
\end{enumerate}
```

### Nested List

```latex
\begin{itemize}
  \item Main point
    \begin{itemize}
      \item Sub-point (renders with dash)
      \item Another sub-point
    \end{itemize}
  \item Another main point
\end{itemize}
```

---

## Code

### Inline Code

```latex
Use the \tech{print()} function to output text.
```

### Code Block

```latex
\begin{lstlisting}
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
\end{lstlisting}
```

Or use a prompt box for longer code with context:

```latex
\begin{promptbox}[Python Example]
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
\end{promptbox}
```

---

## Citations

### In-Text Citation

```latex
According to \textcite{smith2024}, the approach works well.
```
Renders: According to Smith (2024), the approach works well.

### Parenthetical Citation

```latex
The approach has been validated \parencite{smith2024}.
```
Renders: The approach has been validated (Smith, 2024).

### Multiple Citations

```latex
Several studies support this \parencite{smith2024,jones2023}.
```

---

## Cross-References

### Referencing Chapters

```latex
As discussed in Chapter~\ref{chap:introduction}, the concept applies broadly.
```

### Referencing Sections

```latex
See Section~\ref{sec:background} for more details.
```

---

## Images

```latex
\begin{figure}[h]
  \centering
  \includegraphics[width=0.8\textwidth]{figures/diagram.png}
  \caption{Description of the figure.}
  \label{fig:diagram}
\end{figure}
```

Reference with: `Figure~\ref{fig:diagram}`

---

## Tables

```latex
\begin{table}[h]
  \centering
  \begin{tabular}{lcc}
    \toprule
    Name & Value & Unit \\
    \midrule
    Alpha & 1.5 & m/s \\
    Beta & 2.3 & m/s \\
    \bottomrule
  \end{tabular}
  \caption{Description of the table.}
  \label{tab:example}
\end{table}
```

---

## Complete Chapter Example

```latex
\chapter{Getting Started}
\label{chap:getting-started}

This chapter introduces the fundamental concepts.\marginnotetext{Start here if you're new.}

\section{Prerequisites}
\label{sec:prerequisites}

Before beginning, ensure you have:

\begin{itemize}
  \item Python 3.8 or higher
  \item Basic programming knowledge
  \item A text editor
\end{itemize}

\begin{infobox}[Note]
Windows users may need to install additional tools.
\end{infobox}

\section{Core Concepts}
\label{sec:core-concepts}

\begin{definitionbox}[Algorithm]
A step-by-step procedure for solving a problem or accomplishing a task.
\end{definitionbox}

The \term{algorithm} is the foundation of computer science.\authornote{Editor}{This definition is intentionally simplified.}

\begin{takeawaybox}
Every program you write implements at least one algorithm.
\end{takeawaybox}

\section{Practice}
\label{sec:practice}

\begin{questionbox}
Write pseudocode for making a cup of tea.
\end{questionbox}

\begin{solutionbox}
1. Boil water
2. Place tea bag in cup
3. Pour water over tea bag
4. Steep for 3-5 minutes
5. Remove tea bag
6. Add milk/sugar if desired
\end{solutionbox}

\begin{promptbox}[Try This]
Implement your pseudocode in Python using print statements.
\end{promptbox}

\warningnotice{Practice exercises are essential for learning}
```

---

## Special Characters

| Character | LaTeX Syntax |
|-----------|--------------|
| % | `\%` |
| $ | `\$` |
| & | `\&` |
| # | `\#` |
| _ | `\_` |
| { | `\{` |
| } | `\}` |
| ~ | `\textasciitilde` |
| ^ | `\textasciicircum` |
| \ | `\textbackslash` |

---

## Best Practices

1. **Labels**: Always add `\label{}` after chapters, sections, figures, and tables
2. **Margin notes**: Keep brief (1-2 sentences)
3. **Box content**: Keep focused on one idea per box
4. **Question/Solution pairs**: Number them sequentially within a chapter
5. **Cross-references**: Use `~` before `\ref{}` to prevent line breaks (e.g., `Section~\ref{sec:foo}`)
6. **Technical terms**: Use `\term{}` on first occurrence, plain text after
