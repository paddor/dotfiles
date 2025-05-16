# chruby 1.0.0
set fish_function_path /usr/local/share/fish/vendor_functions.d $fish_function_path
# chruby 3.2.2
set -gx RUBYOPT '--jit'

# personal executables
set -gx PATH ~/.local/bin ~/.cargo/bin ~/go/bin ~/.docker/bin $PATH

# set -x PAGER nvim
set -x VISUAL nvim
set -x EDITOR nvim
set -x LESS "-rFX"
set -x BAT_STYLE "numbers,changes"
set -x ROADSTER_LOG_COLORSCHEME 'SOLARIZED'
set -x MOSH_TITLE_NOPREFIX

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

set -gx XDG_CONFIG_HOME $HOME/.config
