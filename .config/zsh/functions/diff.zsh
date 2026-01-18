# Colored diff using delta
diffc() {
    if [[ $# -lt 2 ]]; then
        echo "Usage: diffc <file1> <file2>" >&2
        return 1
    fi
    diff -u "$@" | delta
}

# Side-by-side diff
diffs() {
    if [[ $# -lt 2 ]]; then
        echo "Usage: diffs <file1> <file2>" >&2
        return 1
    fi
    delta --side-by-side "$@"
}
