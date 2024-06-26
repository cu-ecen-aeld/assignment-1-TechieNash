#!/bin/sh

# Check if both arguments are provided
if [ $# -ne 2 ]; then
  echo "Error: Both a directory path and a search string must be provided."
  exit 1
fi

filesdir=$1
searchstr=$2

# Check if the provided directory exists
if [ ! -d "$filesdir" ]; then
  echo "Error: Directory $filesdir does not exist."
  exit 1
fi

# Find the number of files
num_files=$(find "$filesdir" -type f | wc -l)

# Find the number of matching lines
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

exit 0
