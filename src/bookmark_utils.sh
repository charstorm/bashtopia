# Script with utility functions for bookmarking locations.
# This script is meant to be used with '.' or 'source'.

# All bookmarks are stored here
_bookmark_dir="$HOME/.bookmarks"

mkdir -p "$_bookmark_dir"
_prefix="bm__"
_target_file='$_bookmark_dir/${_prefix}$1'


# Adds bookmark to the bookmark dir with arg1 as its name.
# Don't use this function directly. Use a short alias.
bookmark_add() {
    if [ $# -ne 1 ]; then
        echo "Error: expects exactly 1 input argument!"
        return 1
    fi
    # Add a new bookmark
    local target_file=$(eval echo "$_target_file")
    pwd > "$target_file"
}


# CD to the bookmark with name arg1.
# Don't use this function directly. Use a short alias.
bookmark_cd() {
    if [ $# -ne 1 ]; then
        echo "Error: expects exactly 1 input argument!"
        return 1
    fi

    local target_file=$(eval echo "$_target_file")
    if [ ! -f "$target_file" ]; then
        echo "Error: No such bookmark!"
        return 1
    fi

    cd "$(cat "$target_file")"
}


# Prints bookmarks with paths containing arg1.
# Don't use this function directly. Use a short alias.
bookmark_search() {
    if [ $# -ne 1 ]; then
        echo "Error: expects exactly 1 input argument!"
        return 1
    fi

    local pattern="$1"
    grep -r "$pattern" "$_bookmark_dir" | \
        sed -e "s|^.*/$_prefix||g" -e "s|:| |g" | \
        column -t | \
        grep "$pattern" --color=always
}
