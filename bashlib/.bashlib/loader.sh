# ~/.bashlib/loader.sh — sourced once from .bashrc. Loads exports first
# (so aliases/functions can rely on them), then every aliases/*.sh and
# functions/*.sh file, then puts scripts/ on PATH. Drop a new file into
# aliases/ or functions/ and it loads automatically — no .bashrc edit needed.

for f in "$HOME"/.bashlib/exports/*.sh; do
    [ -f "$f" ] && source "$f"
done

for f in "$HOME"/.bashlib/aliases/*.sh "$HOME"/.bashlib/functions/*.sh; do
    [ -f "$f" ] && source "$f"
done

case ":$PATH:" in
    *":$HOME/.bashlib/scripts:"*) ;;
    *) export PATH="$HOME/.bashlib/scripts:$PATH" ;;
esac
