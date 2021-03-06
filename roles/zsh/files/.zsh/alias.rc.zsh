alias c='cat'
alias cp='cp -i'

alias l='ls -l'
has exa && alias ls='exa -aF' || alias ls='ls -ACFG'

if is_linux; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi

alias p='pbpaste'

alias rm='rm -i'
alias x='chmod +x'

has 'gsed' && alias sed='gsed'
has 'gawk' && alias awk='gawk'

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias /='cd $(git-root || echo $HOME)'
alias u='cd -'
alias ~='cd ~'

has 'hub' && alias git='hub'

alias t='tig'

alias g='git'
alias ga='git add'
alias gaa='git add -A $(git root)'
alias gap='git add -p'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git commit'
alias gca='git add -A $(git root) && git commit'
alias gcam='git add -A $(git root) && git commit -m'
alias gcb='git checkout -b'
alias gch='git checkout'
alias gcm='git commit -m'
alias gco='git commit --amend --no-edit'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch -p'
alias gl='git log --pretty=format:"%Cred%h%Creset - %s%C(yellow)%d%Creset" --graph --abbrev-commit -n 15 --branches'
alias gm='git merge'
alias gms='git merge --ff --squash'
alias gnb='git new-branch'
alias gp='git push -u'
alias gpl='git pull'
alias gr='git reset'
alias grb='git rebase'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias gre='git restore'
alias gres='git restore --staged'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gs='git status'
alias gsc='git with-stash commit'
alias gscm='git with-stash commit -m'
alias gsco='git with-stash commit --amend --no-edit'
alias gsp='git stash pop'
alias gss='git stash save'

alias ghr='gh repo view --web'
alias ghpr='gh pr view --web'

has 'nvim' && alias vim='nvim'

alias v='vim'

alias b='bundle'
alias be='bundle exec'

alias d='docker'
alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcr='docker-compose run'
alias dcrm='docker-compose run --rm'
alias dm='docker-machine'
alias dr='docker run'
alias drm='docker run --rm'
alias drmit='docker run --rm -it'

alias ya='yarn add'
alias yr='yarn run'

alias n='npm'
alias ni='npm install'
alias nid='npm install -D'
alias nr='npm run'

alias tf='terraform'

alias reload='exec $SHELL -l'

alias -g F='| fzf --multi'
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g J='| jq'
alias -g L='| less'
alias -g M='| more'
alias -g N='> /dev/null 2>&1'
alias -g S='| sed'
alias -g X='| xargs -I%'
alias -g XP='X -P "$(ncpu)"'
alias -g Y='| pbcopy'
alias -g TY='| tee >(pbcopy)'

alias -s py=python
alias -s rb=ruby

mkcd() {
  mkdir -p $@ && cd $@;
}

ghqcd() {
  local dir
  dir="$(ghq list -p | sed "s/^${HOME//\//\\/}/~/g" | fzf)" && cd "$(eval echo "$dir")"
}

deincd() {
  local dir
  dir="$(GHQ_ROOT=~/.cache/dein/repos ghq list -p | sed "s/^${HOME//\//\\/}/~/g" | fzf)" && cd "$(eval echo "$dir")"
}

gocd() {
  local dir
  dir="$(echo $GOPATH/src/*/*/* | perl -pe 's/ /\n/g' | fzf)" && cd $dir
}
