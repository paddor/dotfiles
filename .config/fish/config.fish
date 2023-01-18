# chruby 1.0.0
set fish_function_path /usr/local/share/fish/vendor_functions.d $fish_function_path
chruby 3.2

# personal executables
set -gx PATH ~/.local/bin ~/go/bin $PATH

set -x EDITOR vim
set -x LESS "-rFX"
set -x ROADSTER_LOG_COLORSCHEME 'SOLARIZED'

# no greeting
function fish_greeting
end

source ~/.config/fish/conf.d/alias.fish


# Homebrew
if test (uname) = 'Darwin'
	set -gx HOMEBREW_PREFIX /usr/local
end


# NVM (needed for Ember in Overmind)
set -gx NVM_DIR "$HOME/.nvm"


# PostgreSQL
set -gx PATH /usr/lib/postgresql/12/bin $PATH


# Solarized Dark & Green highlight
# https://github.com/decors/fish-colored-man
set -g man_blink -o red
set -g man_bold -o green
set -g man_standout -b black 93a1a1
set -g man_underline -u 93a1a1


# remove SSH: prefix from prompt if connecting from Mac
if [ -n "$SSH_CLIENT" ]
	if [ (string split -f1 ' ' $SSH_CLIENT) = (string split -f1 ' ' (getent hosts mac.shared)) ]
		set --erase SSH_CLIENT
	end
end
