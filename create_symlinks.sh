#!/bin/bash

source_dir="$HOME/dotfiles"  # Location of downloaded files
target_dir="$HOME"           # Destination for symlinks

# Iterate through files and folders in source directory
for file_or_folder in "$source_dir"/*; do
    # Determine relative path from source directory
    rel_path="${file_or_folder#$source_dir/}"

    # Create symlink for files
    if [[ -f "$file_or_folder" ]]; then
        ln -svf "$file_or_folder" "$target_dir/$rel_path"
    fi

    # Create symlinks within folders, preserving structure
    if [[ -d "$file_or_folder" ]]; then
        mkdir -p "$target_dir/$rel_path"
        for item in "$file_or_folder"/*; do
            ln -svf "$item" "$target_dir/$rel_path/${item#$file_or_folder/}"
        done
    fi
done
