# Script to add and export paths from input file to the PATH variable.
# This script is meant to be used with '.' or 'source'.
#
# Usage:
#   source add_paths_from_file.sh path/to/input.txt
#
# Every line in input.txt must be a path to a directory with executable files.
#
# A common use case is to keep the paths in ~/.paths.txt and use this
# script from bashrc as:
#   source path/add_paths_from_file.sh ~/.paths.txt
#

if [ $# -ne 1 ]; then
    echo "Error: Please provide the input file containing paths."
    return 1
fi

_input_file="$1"

if [ ! -f "$_input_file" ]; then
    echo "Error: Input file '$_input_file' does not exist."
    return 1
fi

# Combine all the paths into one
# Replace newline with colon and remove leading colons
_new_paths="$(cat "$_input_file" | tr '\n' ':' | sed -e 's|:\+$||g')"

# Add the intermediate paths to the existing PATH
export PATH="$_new_paths:$PATH"

unset _input_file
unset _new_paths
