# chruby
#set -gx CHRUBY_ROOT ~/.linuxbrew
set -gx CHRUBY_ROOT /usr/local/
source /usr/local/share/chruby/chruby.fish
#source ~/.linuxbrew/share/chruby/chruby.fish
#chruby 2.6.5
#chruby 2.7.1
chruby 3.0

# personal executables
set -gx PATH ~/.local/bin ~/go/bin $PATH

# linux brew
#set -gx PATH ~/.linuxbrew/bin $PATH
#set -gx MANPATH ~/.linuxbrew/share/man /usr/local/share/man/ /usr/local/man /usr/share/man $MANPATH
#set -gx INFOPATH ~/.linuxbrew/share/info $INFOPATH
#set -gx LD_LIBRARY_PATH "$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"

set -x EDITOR vim
set -x LESS "-rFX"

# no greeting
#set fish_greeting
#new way using a universal variable: set -U fish_greeting "" # once manually in a shell
function fish_greeting
end

source ~/.config/fish/conf.d/alias.fish


# NVM
#set -gx NVM_DIR $HOME/.nvm
#bass source "$NVM_DIR/nvm.sh"  # This loads nvm
# NOTE: use dash/bash instead :-(



# UaExpert (OPC-UA)
#
#set -gx PATH /opt/unifiedautomation/uaexpert/bin $PATH

# solve issue in nvim
#set -gxx TERM xfce4-terminal

# PostgreSQL
set -gx PATH /usr/lib/postgresql/12/bin $PATH


# Solarized Dark & Green highlight
# https://github.com/decors/fish-colored-man
set -g man_blink -o red
set -g man_bold -o green
set -g man_standout -b black 93a1a1
set -g man_underline -u 93a1a1
