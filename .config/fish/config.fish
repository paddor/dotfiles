# chruby
if test -e /usr/local/share/chruby/chruby.fish
	set -gx CHRUBY_ROOT /usr/local/
	source /usr/local/share/chruby/chruby.fish
	chruby 3.0
end

# personal executables
set -gx PATH ~/.local/bin ~/go/bin $PATH

set -x EDITOR vim
set -x LESS "-rFX"

# no greeting
function fish_greeting
end

source ~/.config/fish/conf.d/alias.fish


# Homebrew
if test (uname) = 'Darwin'
	set -gx HOMEBREW_PREFIX /usr/local
end


# PostgreSQL
set -gx PATH /usr/lib/postgresql/12/bin $PATH


# Solarized Dark & Green highlight
# https://github.com/decors/fish-colored-man
set -g man_blink -o red
set -g man_bold -o green
set -g man_standout -b black 93a1a1
set -g man_underline -u 93a1a1
