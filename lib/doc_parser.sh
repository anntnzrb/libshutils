#!/bin/sh

# **
# Generate html documentation for a script
#
# Sample usage:
#   <code>doc_parser script.sh</code>
#
# To parse multiple files at once:
#   <code>printf "%s\\n" ./* | xargs -I{} -n1 ./doc_parser.sh '{}'</code>
# *
wrap() {
    # **
    # Wraps $1 in the HTML tag $2
    # *
    printf "<%s>%s</%s>" "$2" "$1" "$2"
}

wrap_p() {
    # **
    # Wraps $1 in 'p' tags
    # *
    wrap "$1" 'p'
}

wrap_h3() {
    # **
    # Wraps $1 in 'h3' tags
    # *
    wrap "$1" 'h3'
}

trim() {
    # **
    # Trims leading and trailing whitespace from $1
    # *
    printf "%s\n" "$1" | awk '{gsub(/^ +| +$/,"");print}'
}

wrap_h3 "${1##*/}"

while read x xs
do
    if test "$x" = '#'; then
        case "$xs" in
            \*\*)
                docs=1
                continue
                ;;
            \*) docs=0 ;;
        esac
    fi
    if test -n "$docs" && test "$docs" -gt 0; then
        if test -z "$xs"; then
            test -n "$line" && wrap_p "`trim "$line"`"
            line=""
        else
            line="$line$xs"
        fi
    elif test -n "$docs" && test "$docs" -lt 1; then
        test -n "$line" && wrap_p "`trim "$line"`"
        break
    fi
done < "$1"
