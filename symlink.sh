#!/bin/bash

# Iterate over each file in the current directory starting with a dot (.)
for file in .[^.]*; do
    # Check if the file is a regular file or a directory
    if [ -f "$file" ] || [ -d "$file" ]; then
        # Construct the absolute path and the target symlink path
        abs_path="$(readlink -f "$file")"
        target_link="$HOME/$file"

        # Check if a symlink already exists at the target location
        if [ -L "$target_link" ] || [ -e "$target_link" ]; then
            echo "A file or symlink named $file already exists in your home directory."
            read -p "Do you want to overwrite it? [y/N] " response

            if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                # Remove the existing symlink or file
                rm -rf "$target_link"
                # Create a new symlink
                ln -s "$abs_path" "$target_link"
                echo "Replaced existing $file with a new symlink."
            else
                echo "Skipping $file..."
            fi
        else
            # Create a new symlink if none exists
            ln -s "$abs_path" "$target_link"
            echo "Created a symlink for $file in the home directory."
        fi
    fi
done

echo "Operation complete."
