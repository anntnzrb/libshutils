#!/bin/sh

# Generate html documentation for a script
#
# Sample usage:
#   doc_parser script.sh
# To parse multiple files at once:
#   printf "%s\n" ./* | xargs -I{} -n1 ./doc_parser.sh '{}'

# FIXME: 'change echo -> printf for portability' [Sun, 08 Nov ]
is_docs() {
    # **
    # Checks is "$1" is documentation or just decoration
    # *

    if [ -n "$1" ] && [ "$(printf "%c" "$1")" != '*' ]; then
        echo 0
    else
        echo -1
    fi

    # TODO: 'shorten if possible' [Sun, 08 Nov]
    #[ -n "$1" ] && [ "$(printf "%c" "$1")" != '*' ] && echo 0 || echo -1
}

wrap() {
    # **
    # Wraps "$1" in the HTML tag "$2"
    # *

    body="$1"
    tag="$2"

    [ -n "$body" ] && echo "<$tag>$body</$tag>"
}

wrap_p() {
    # **
    # Wraps "$1" in 'p' tags
    # *

    wrap "$1" 'p'
}

wrap_h3() {
    # **
    # Wraps "$1" in 'h' tags
    # *

    wrap "$1" 'h3'
}

trim() {
    # **
    # Trims leading and trailing whitespace from "$1"
    # *

    echo "$1" | awk '{gsub(/^ +| +$/,"");print}'
}

basename() {
    # **
    # Extracts the basename from $1
    # *

    echo "${1##*/}"
}

wrap_h3 "$1"

is_header=0
desc=""

while read -r x xs; do
    if [ "$x" = '#' ] && [ "$(is_docs "$xs")" -eq 0 ]; then
        if [ "$is_header" -eq 0 ]; then
            is_header=1
            wrap_p "$(trim "$xs")"
        else
            desc="${desc}${xs} "
        fi
    fi
done <"${1:-/dev/stdin}"

wrap_p "$(trim "$desc")"
