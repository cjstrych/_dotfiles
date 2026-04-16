## HISTCONTROL
## ignorespace: lines which begin with a space are not saved
## ignoredups: lines which match the previous line are not saved
## ignoreboth: shorthand for ignorespace and ignoredups
## erasedups: similar to ignoredups, but removes all lines like the current one and adds it to the history list

#HISTCONTROL=ignoreboth
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T - "

## APPEND TO THE HISTORY FILE, DON'T OVERWRITE IT
shopt -s histappend

## FOR SETTING HISTORY LENGTH SEE HISTSIZE AND HISTFILESIZE IN BASH(1)
HISTSIZE=10240
HISTFILESIZE=10240

## CHECK THE WINDOW SIZE AFTER EACH COMMAND AND, IF NECESSARY,
## UPDATE THE VALUES OF LINES AND COLUMNS.
shopt -s checkwinsize

## COLORIZED WITH GIT INFORMATION
RED='\[\033[0;31m\]'
GRN='\[\033[0;32m\]'
YLW='\[\033[0;33m\]'
CYN='\[\033[0;36m\]'
WHT='\[\033[0;39m\]'
RST='\[\033[0m\]'

# PS1="${RED}┌──[${WHT}\u${GRN}@${YLW}\h${RED}:${GRN}\w${RED}]\n"
#PS1+="${RED}|${CYN} \$(date +'%F %T') ${RED}- (${GRN}\$(git branch 2>/dev/null | sed -n 's/^\* //p')${RED})\n"
#PS1+="${RED}└──${GRN}\\\$ ${RST}"
 PS1="${RED}┌─[${WHT}\u${GRN}@${YLW}\h${RED}:${GRN}\w${RED}]\n"
PS1+="${CYN}\$(date -Iseconds) ${RED}- (${GRN}\$(git branch 2>/dev/null | sed -n 's/^\* //p')${RED})\n"
PS1+="${RED}└─${GRN}\\\$ ${RST}"

## ALIAS
alias cp='cp -i'
alias decomment='grep -Ev "^[[:space:]]*((#|;|//).*)?$"'
alias diff='diff --color=auto'
#alias egrep='egrep --color=auto'
#alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
#alias ll='ls -alF --color=auto'
alias ll='ls -altrF --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'

## EXPORTS
export EDITOR=vim
export LESS="-X"

## FUNCTIONS
back-up() {
  local TARGET="${1%/}"
  if [ -z "$TARGET" ]; then
    return 1
  fi
  cp -rv "$TARGET" "${TARGET}_$(date +%F)"
}

## YOU MAY WANT TO PUT ALL YOUR ADDITIONS INTO A SEPARATE FILE LIKE
## ~/.bash_aliases, INSTEAD OF ADDING THEM HERE DIRECTLY.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
