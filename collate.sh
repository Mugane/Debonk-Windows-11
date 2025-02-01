#!/bin/sh

# This script collates the individual .reg templates in the ./registry folder into a single fixes.reg file
# The output is published by GitHub Actions to GitHub Pages at https://mugane.github.io/Debonk-Windows-11/fixes.reg

unlink ./fixes.reg 2>/dev/null # Quietly delete fixes.reg if it exists
printf "{\n  \"version\": \"2\",\n  \"registry\": [\n" > ./fixes.reg
for file in ./registry/*.reg; do # Collate all the .reg files in ./registry separated by two newlines
  sed -e 's/^/    /'  -e 's/\\n\\s*$//' "$file" >> ./fixes.reg # Add spaces for formatting, remove trailing space/newlines
  echo "\n\n" >> ./fixes.reg # Separate each joined registry file with two newlines
done
echo "./registry/ concatenated successfully into ./fixes.reg"
