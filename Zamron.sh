#!/bin/bash

echo "Welcome to Zamron PDF Generator. Just lead Zamron to the folder which contains the Archives, and let Zamron do the rest."
echo "Just to be safe, create a new folder with the archived files. Warning! The archives will be deleted after the generation of the pdf's." 
echo -n "Enter the Path to the Folder: "
read text
cd $text
for file in *; do mv "$file" "${file%.*}".cbr; done
for file in *; do mkdir "${file%.*}"; done
for file in *; do unrar e -r "$file" -C "${file%.*}"; done
for file in *; do convert "${file%.*}"/* "${file%.*}".pdf; done
for file in *; do rm "${file%.*}".cbr; done
for file in *; do rm -r "${file%.pdf}"; done
echo "Thank you for using Zamron PDF Generator."
