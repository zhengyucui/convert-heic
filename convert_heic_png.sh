#!/bin/bash

# Check if the folder is provided as an argument
if [ -z "$1" ]; then
	echo "Usage: $0 /path/to/folder"
	exit 1
fi

folder_path="$1"
output_folder="$folder_path/converted_pngs"
mkdir -p "$output_folder"

# Find and convert all HEIC files to PNG
for file in "$folder_path"/*.HEIC; do
	if [ -f "$file" ]; then
		filename=$(basename "$file" .heic)
		
		output_file="$output_folder/${filename%.*}.png"
		magick "$file" "$output_file"

		echo "Converted: $file -> $output_file"
	else
		echo "No HEIC files found in the directory."
		exit 1
	fi
done

echo "Conversion complete!"

