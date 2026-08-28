#!/bin/bash

# Check if the input file was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file.txt>"
    exit 1
fi

INPUT_FILE="$1"
COUNTER=1

# Create an output directory to keep things clean
OUTPUT_DIR="qr_codes"
mkdir -p "$OUTPUT_DIR"

# Read the file line by line
while IFS= read -r url || [ -n "$url" ]; do
    # Skip empty lines
    if [ -z "$url" ]; then
        continue
    fi

    echo "Processing ($COUNTER): $url"

    # Generate the QR code and save it in the output directory
    # -o specifies the output file path
    qrencode -o "$OUTPUT_DIR/qr_${COUNTER}.png" "$url"

    ((COUNTER++))
done < "$INPUT_FILE"

echo "-----------------------------------------------"
echo "Done! Generated $((COUNTER-1)) QR codes in the '$OUTPUT_DIR' directory."
