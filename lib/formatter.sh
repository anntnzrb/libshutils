#!/bin/sh

# -----------------------------------------------------------------------------
# preamble
# -----------------------------------------------------------------------------

# paths
root="$(dirname "$(dirname "$(readlink -f "$0")")")"
collection="$root/collection"

# -----------------------------------------------------------------------------
# functions
# -----------------------------------------------------------------------------

die() {
    # **
    # prints a message stderr & exits script with non-successful code "1"
    # *

    printf '%s\n' "$@" >&2
    exit 1
}

is_installed() {
    # **
    # checks if command "$1" is installed;
    #
    # verifies if the file is an executable file, this is used to prevent
    # conflicts with user-defined aliases and functions
    # *

    [ -x "$(command -v "$1")" ]
}

# -----------------------------------------------------------------------------
# main
# -----------------------------------------------------------------------------

# quit if tools not installed
if ! { is_installed "shellcheck" && is_installed "shfmt"; }; then
    die 'tools not installed :: shellcheck & shfmt are required!'
fi

# programs with pre-defined arguments
shellcheck_cmd="shellcheck --color --shell=sh"
shfmt_cmd="shfmt -d -s -p -w -i 4 -bn"

if $shellcheck_cmd "$collection"/*; then
    $shfmt_cmd "$collection"/* >"$root/formatter.diff"
    printf 'a .diff file with formatting changes has been generated at %s\n' \
        "$root/formatter.diff"
else
    die 'Linting checks were not successful; fix/suppress them to format'
fi
