#!/bin/sh

# Generate html documentation for a script
# Sample usage:
#   doc_parser script.sh
# To parse multiple files at once:
#   printf "%s\n" ./* | xargs -I{} -n1 ./doc_parser.sh '{}'

is_docs() {
    if [ -n "$1" ] && [ "$(printf "%c" "$1")" != '*' ]; then
        echo 0
    else
        echo -1
    fi
}

wrap() {
    body="$1"
    tag="$2"

    echo "<$tag>$body</$tag>"
}

wrap_p() {
    wrap "$1" 'p'
}

wrap_h3() {
    wrap "$1" 'h3'
}

trim() {
    no_trailing=${1%* }               # strip trailing whitespace
    printf "%s\n" "${no_trailing#* }" # strip leading whitespace
}

wrap_h3 "${1##*/}" # script name

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
done < "${1:-/dev/stdin}"

[ -n "$desc" ] && wrap_p "$(trim "$desc")"
