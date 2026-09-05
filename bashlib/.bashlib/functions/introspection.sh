# funcs: list every function name defined under ~/.bashlib/functions/*.sh
funcs() {
    grep -hoE '^[a-zA-Z_][a-zA-Z0-9_]*\(\)' "$HOME"/.bashlib/functions/*.sh 2>/dev/null \
        | sed 's/()$//' | sort -u
}

# scripts: list every executable in ~/.bashlib/scripts/ with its
# `# Description:` comment (required as the second line, after the shebang)
scripts() {
    local script name desc
    for script in "$HOME"/.bashlib/scripts/*; do
        [ -f "$script" ] || continue
        name=$(basename "$script")
        desc=$(sed -n '2{s/^#[[:space:]]*Description:[[:space:]]*//p}' "$script")
        printf '%-20s %s\n' "$name" "${desc:-(no description)}"
    done
}
