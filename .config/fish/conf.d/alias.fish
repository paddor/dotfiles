function vi; nvim $argv; end

if test (uname) = 'Darwin'
	# system VIM is broken
	function vim; nvim $argv; end
end

function g; git $argv; end
function gs; g s $argv; end
function gl; g l $argv; end
function gg; g g $argv; end
function gd; g d $argv; end
function ga; g a $argv; end
function gap; g ap $argv; end
function gdc; g dc $argv; end
function gc; g c -v $argv; end
function gcm; g cm $argv; end
function gca; g ca $argv; end
function gup; g up $argv; end
function gpv; g pv $argv; end

function irb; pry $argv; end
function be; bundle exec $argv; end
function bede; env DEV_ENV=true bundle exec $argv; end

function le; env less $argv; end


if test (uname) != 'Darwin'
	function pbcopy;  xsel --clipboard --input; end
	function pbpaste; xsel --clipboard --output; end
end

# alias fd=fdfind so that fzf-plugin for fish works
function fd; fdfind $argv; end

function projdiff
	set a $argv[2]
	set b $argv[1]/$argv[2]

	echo vimdiff $a $b
	diff --brief --report-identical-files --ignore-blank-lines $a $b && return
	vimdiff $a $b

function reload_chruby
	source /usr/local/share/chruby/chruby.fish
end

function install_ruby
    # ruby-install --no-install-deps ruby $argv[1] -- CC=clang-13 --enable-shared --with-rdoc=ri --with-jemalloc --with-openssl-dir=/usr/local/ssl CFLAGS="-O0 -g"
    ruby-install --no-install-deps ruby $argv[1] -- --enable-shared --with-rdoc=ri --with-jemalloc --with-openssl-dir=/usr/local/ssl CFLAGS="-O0 -g"
    # ruby-install ruby $argv[1] -- --enable-shared --with-rdoc=ri --with-jemalloc CFLAGS="-O0 -g"
    echo "NOTE: Run update_ruby_tags after activating the new Ruby."
end

function update_ruby_tags
    which ctags
    ctags --verbose --recurse --language-force=C --extras --kinds-C=+p -f $RUBY_ROOT/tags $RUBY_ROOT/include
end
