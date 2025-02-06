
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

### custom git commands for terminal prompt changes ###
# parse git branch code edit
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then

   PS1='\n\[\033[01;37m\]\w\[\033[00;96m\]$(parse_git_branch)\[\033[00m\]\n${debian_chroot:+($debian_chroot)}\[\033[01;30m\]lois.appiah\[\033[00m\]$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1="[ ${debian_chroot:+($debian_chroot)}\u : \w ]\\$ "
    PS2="&gt; "
fi
unset color_prompt force_color_prompt


function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# some more ls aliases
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias home='cd ~ && set-title home'
alias bashrc='vimc ~/.bashrc'
alias source-bash='source ~/.bashrc'
alias open='gio open'

#### Vim 
alias vim='~/Documents/squashfs-root/usr/bin/nvim'
alias vimk='NVIM_APPNAME=nvim-kickstart vim'
alias vimc='NVIM_APPNAME=nvim-custom vim'
alias vimc-edit='cd ~/.config/nvim-custom && vimc .'

#### Tmux
alias tmux-edit='vimc ~/.tmux.conf'
alias tmux-reload='tmux source ~/.tmux.conf'

#### Git
alias gst='git stash'
alias gpop='git stash pop'
alias gac='git commit -am'
alias gc='git commit -m'
alias gd='git diff'
alias gch='git checkout'
alias gr.='git restore .'
alias gr='git restore'
alias ga='git add'
alias grs='git restore --staged'
alias grs.='git restore --staged .'
alias greom='git rebase -i origin/main'
alias greh=' git rebase -i HEAD~'

# pnpm
alias pd='pnpm dev'
alias pa='pnpm add'
alias pc='pnpm clean'
alias pst='pnpm start'
alias pb='pnpm build'
alias pp='pnpm pack'
alias packtar='pnpm build && pnpm pack && realpath *.tgz'
alias prm='pnpm remove'
alias pin='pnpm install'
alias storybook='pnpm install && pnpm storybook'

alias idea='idea.sh'
### start tmux session on terminal startup
# if [ -n "$PS1" ] && [ -z "$TMUX" ];  then
#   tmux new-session -A -s main
# fi
