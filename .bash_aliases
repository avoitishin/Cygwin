# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color'
alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -hFAlt --color | less -R '                             # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
alias vi=vim

# Ruby on Rails
#alias ruby='/cygdrive/c/Ruby192/bin/ruby.exe'
#alias gem='ruby C:\\Ruby192\\bin\\gem'
#alias rails='ruby C:\\Ruby192\\bin\\rails'
#alias irb='ruby C:\\Ruby192\\bin\\irb'
#alias rake='ruby C:\\Ruby192\\bin\\rake'
#alias bundle='ruby C:\\Ruby192\\bin\\bundle'

alias e='cygstart /cygdrive/c/"Program Files"/e/cmd/e.exe'

# Display PATH in readable format
alias PATH="echo $PATH | tr ':' '\n' | less -R"
