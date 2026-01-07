# LaTeX compilation configuration
# Using LuaLaTeX for custom font support (OpenType/TrueType)

# Default to LuaLaTeX for custom fonts
$pdf_mode = 4;  # 4 = lualatex, 1 = pdflatex, 5 = xelatex

# LuaLaTeX command with shell-escape for minted/external tools
$lualatex = 'lualatex -interaction=nonstopmode -shell-escape -synctex=1 %O %S';

# Alternative: pdfLaTeX (faster, but no custom fonts)
# $pdf_mode = 1;
# $pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape -synctex=1 %O %S';

# Biber for bibliography (modern replacement for bibtex)
$biber = 'biber %O %S';
$bibtex_use = 2;  # Run biber when needed

# Output directory (keep build files organized)
$out_dir = 'build';

# Clean up auxiliary files
$clean_ext = 'aux bbl bcf blg fdb_latexmk fls log out run.xml synctex.gz toc lot lof';

# Preview settings
$preview_mode = 0;
$pdf_previewer = 'open -a Skim';  # Use Skim for PDF preview (supports SyncTeX)

# Continuous preview mode settings
$sleep_time = 1;  # Check for changes every 1 second

# Maximum number of runs to resolve references
$max_repeat = 5;

# Show compilation commands
$silent = 0;
