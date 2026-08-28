#!/bin/bash

INPUT_DIR="qr_codes"
OUTPUT_PDF="all_qrs_grid.pdf"
TEX_FILE="qr_layout.tex"

if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Directory '$INPUT_DIR' not found."
    exit 1
fi

echo "Generating LaTeX template with multi-page support..."

# Start writing the LaTeX file using longtable instead of tabular
cat << 'EOF' > "$TEX_FILE"
\documentclass{article}
\usepackage[margin=0.8in]{geometry}
\usepackage{graphicx}
\usepackage{longtable} % Allows tables to break across pages cleanly

\begin{document}
\pagestyle{empty} % Remove page numbers
\centering

% Define a 4-column longtable
\begin{longtable}{cccc}
EOF

COUNTER=0
COLUMNS=4

# Loop through all PNGs in natural numerical order
for img in $(ls -v "$INPUT_DIR"/*.png); do
    
    # Add the image to the current cell
    echo "  \includegraphics[width=1.5in]{$img}" >> "$TEX_FILE"
    
    ((COUNTER++))
    
    # Check if we hit the end of a row
    if [ $((COUNTER % COLUMNS)) -eq 0 ]; then
        # End the row and add some vertical spacing between rows
        echo "  \\\\ [1.5em]" >> "$TEX_FILE"
    else
        # Move to the next column cell
        echo "  &" >> "$TEX_FILE"
    fi
done

# Clean up trailing syntax if the last row wasn't perfectly full
if [ $((COUNTER % COLUMNS)) -ne 0 ]; then
    echo "  \\\\" >> "$TEX_FILE"
fi

# Close out the longtable syntax cleanly
cat << 'EOF' >> "$TEX_FILE"
\end{longtable}
\end{document}
EOF

echo "Compiling PDF with pdflatex..."
# Run pdflatex to build the document
pdflatex -interaction=batchmode "$TEX_FILE" > /dev/null

# Clean up build artifacts, leaving just your clean PDF
rm -f qr_layout.aux qr_layout.log "$TEX_FILE"
mv qr_layout.pdf "$OUTPUT_PDF"

echo "-----------------------------------------------"
echo "Done! All $COUNTER codes successfully spanned across pages in: $OUTPUT_PDF"
