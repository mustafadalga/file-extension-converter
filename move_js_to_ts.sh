#!/bin/bash

current_extension="js"
new_extension="ts"
target="./src"


# Add //@ts-nocheck comment to the top of the file
add_ts_nocheck_comment() {
    local file="$1"
    echo -e "//@ts-nocheck\n$(cat "$file")" > "$file"
}


# change extension
convert_file() {
    local full_path="$1"

    if [ "${full_path##*.}" == "$current_extension" ]; then
        new_file="${file%.*}.$new_extension"
                add_ts_nocheck_comment "$file"  # Add ts-nocheck comment before the mv command
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
