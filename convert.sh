#!/bin/bash

current_extension=""
new_extension=""
target="."

# Function to display usage instructions
display_usage() {
    echo "Usage: ./convert.sh --current_ext <current_extension> --new_ext <new_extension> [--target <target>]"
    echo "Usage: ./convert.sh --current_ext <current_extension> --new_ext <new_extension>"
    echo "Example 1: ./convert.sh --current_ext vue --new_ext ts --target src/template"
    echo "Example 2: ./convert.sh --current_ext ts --new_ext vue"
}

# Check if the required options are provided
display_warn() {
    if [ -z "$current_extension" ] || [ -z "$new_extension" ]; then
      echo "current extension and new extension are required"
      display_usage
      exit 1
    fi
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --current_ext)
            shift
            current_extension="$1"
            shift
            ;;
        --new_ext)
            shift
            new_extension="$1"
            shift
            ;;
        --target)
            shift
            target="$1"
            shift
            ;;
        --h|--help)
            display_usage
            exit 0
            ;;
        *)
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done


# Check if the required options are provided
display_warn


# change extension
convert_file() {
    local full_path="$1"

    if [ "${full_path##*.}" == "$current_extension" ]; then
        new_file="${file%.*}.$new_extension"
        mv "$file" "$new_file"
        echo "Converted ${file##*/%.*} ${new_file##*/%.*}"
   fi
}

# Function to scan files in a directory (including nested folders)
scan_files() {
    local dir="$1"

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            convert_file "$file"
        elif [ -d "$file" ]; then
            scan_files "$file"
        fi
    done
}

# Call the function to process files
scan_files "$target"
