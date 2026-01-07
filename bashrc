# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# key bindings
bind '"\es": "tmux-sessionizer\n"'
bind '"\ee": "yazi\n"'

# interactive nvim with fzf file picker
inv() {
  file=$(fzf -m --preview="bat --color=always {}")
  if [[ -n "$file" ]]; then
    nvim $file
  fi
}

# common aliases
alias c='clear'

# pnpm
alias pn='pnpm'
alias pnx='pnpm dlx'

# git
alias gst='git status'
alias gaa='git add --all'
alias gp="git push"
alias gco='git checkout'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gfa='git fetch --all --tags --prune'
alias gsw='git switch'
alias gswc='git switch -c'

