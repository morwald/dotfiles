# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# source custom functions
source $HOME/.config/zsh/functions.zsh

# history
HISTFILE=~/.config/zsh/.zshhist
HISTSIZE=1000
SAVEHIST=1000

# vim bindings
bindkey -v

zstyle :compinstall filename '/home/moritz/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

# term variable
export TERM=screen-256color

# personal prompt
PROMPT='[%F{blue}%2~%f%b]%# '

# keyboard shortcuts
bindkey -s '^f' 'open_with_fzf^M'
bindkey -s '^o' 'cd_with_fzf^M'

# aliases
alias ls="ls --color=auto"
alias lsa="ls -a"
alias ..="cdls .."
alias cd="cdls"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias z="zathura --fork"
alias zathura="zathura --fork"
alias s="sxiv"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias tmuxrc="nvim ~/.config/tmux/tmux.conf"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # dotfiles

cdls() { builtin cd "$@" && ls; }

# set variables
export EDITOR=/usr/bin/nvim

# add paths
path+=('/home/moritz/.local/bin')
path+=('/home/moritz/.scripts')
path+=('/home/moritz/.config/coc/extensions/coc-clangd-data/install/13.0.0/clangd_13.0.0/bin')
path+=('/opt/openocd/bin')

# miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# tmux fix
bindkey "^E" end-of-line # map end-of-line key in the same way as zprezto editor module to prevent issue with tmux-resurrect
setopt CLOBBER # allow pipe to existing file. prevent issue with history save in tmux-resurrect.

# zsh default configs
# create a zkbd compatible hash;sh
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
		function zle_application_mode_start { echoti smkx }
			function zle_application_mode_stop { echoti rmkx }
				add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
					add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
					fi
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

