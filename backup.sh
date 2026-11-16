#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./backup.sh <file>"
    exit 1
fi

filename="$1"

if [ ! -e "$filename" ]; then
    echo "Not found: $filename"
    exit 2
fi

if [ -d "$filename" ]; then
    echo "$filename is a directory, not a file"
    exit 3
fi

if [ ! -r "$filename" ]; then
    echo "Cannot read: $filename"
    exit 4
fi

todays_date=$(date +%F)
dest="${filename}.${todays_date}.bak"
cp "$filename" "$dest"

size=$(wc -c < "$dest")
echo "Backup created: $dest ($size bytes)"
