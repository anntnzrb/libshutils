#!/bin/sh

# -----------------------------------------------------------------------------
# preamble
# -----------------------------------------------------------------------------

# paths
# TODO: refactor to portable backticks
root="$(dirname "$(dirname "$(readlink -f "$0")")")"
collection="$root/collection"

# -----------------------------------------------------------------------------
# functions
# -----------------------------------------------------------------------------

die() {
    # **
    # prints a message stderr & exits script with non-successful code "1"
    # *

    case $# in
        0) exit 1 ;;
        *)
            printf '%s\n' "$@" >&2
            exit 1
            ;;
    esac
}

is_installed() {
    # TODO: `-x` is not portable

    # **
    # checks if command "$1" is installed;
    #
    # verifies if the file is an executable file, this is used to prevent
    # conflicts with user-defined aliases and functions
    # *

    # shellcheck disable=2006
    # backtick notation is portable

    test -x "`command -v "$1"`"
}

# -----------------------------------------------------------------------------
# main
# -----------------------------------------------------------------------------

# quit if tools not installed
! is_installed "shellcheck" \
    && die 'tools not installed :: shellcheck is required!'

# programs with pre-defined arguments
shellcheck_cmd="shellcheck --color --shell=sh"

if $shellcheck_cmd "$collection"/*; then
    printf 'Linting checks passed\n'
else
    die 'Linting checks were not successful; fix/suppress them to format'
fi
