# git — short mnemonic aliases. First letters of the subcommand, capitals
# distinguish a variant from its lowercase base (A = add -A, etc).
alias g='git'
alias gs='git status'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcam='git commit -a -m'

alias gp='git push'
alias gcp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'

alias gf='git fetch'
alias gfa='git fetch --all'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gswc='git switch -c'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'

alias gl='git log --oneline --graph --decorate'
alias gd='git diff --color=always'
alias gds='git diff --staged --color=always'

alias gm='git merge'
alias gr='git rebase'
alias gri='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'

alias gsta='git stash'
alias gstp='git stash pop'

alias grs='git reset'
alias gcl='git clone'
alias gt='git tag'
