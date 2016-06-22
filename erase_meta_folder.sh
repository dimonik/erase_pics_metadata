#!/bin/bash

# Copyright 2016 Dmytro Nikandrov

# Globals
BASE_DIR="/home/username/Documents"
SEARCH_DIR="$BASE_DIR/metadata_example/img"


cd "$SEARCH_DIR"
ALL_FILES=$(find . -maxdepth 10 -type f \( -iname '*.png' -or -iname '*.jpg' \) -print)
for entry in $ALL_FILES;
do
	printf "\n"
        echo $(basename $entry)
        exiftool -All $(basename $entry)
	printf "\nErasing metadata..."
        exiftool -overwrite_original -all= $(basename $entry)
	printf "\nErased.\n"
	read -p "To check the next item press [Enter]"
done
printf "\nFINISHED\n"
echo "Press [ENTER] to exit." && read
