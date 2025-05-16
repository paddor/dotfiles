abbr --add vi nvim
# function vi; nvim $argv; end

# if test (uname) = 'Darwin'
# 	# system VIM is broken
# 	function vim; nvim $argv; end
# end

abbr --add gs git status
abbr --add gl git log --graph
abbr --add gg git grep
abbr --add gd git diff
abbr --add ga git add
abbr --add gap git add -p
abbr --add gdc git diff --cached
abbr --add gc git commit -v
abbr --add gcm git commit -m
abbr --add gca git commit --amend
abbr --add gup git pull --rebase -v
abbr --add gpv git push -v
abbr --add gls git log --graph --stat

abbr --add irb pry
abbr --add be bundle exec
abbr --add bede env DEV_ENV=true bundle exec
abbr --add le less
abbr --add fgfg fg

# if test (uname) != 'Darwin'
# 	function pbcopy;  xsel --clipboard --input; end
# 	function pbpaste; xsel --clipboard --output; end
# end

# alias fd=fdfind so that fzf-plugin for fish works
if ! command -vq fd
	function fd; fdfind $argv; end
end

function projdiff
	set a $argv[2]
	set b $argv[1]/$argv[2]

	echo vimdiff $a $b
	diff --brief --report-identical-files --ignore-blank-lines $a $b && return
	vimdiff $a $b
end

function install_ruby
    # ruby-install ruby $argv[1] -- --enable-shared --with-rdoc=ri --with-jemalloc CFLAGS="-O0 -g"
    # ruby-install ruby $argv[1] -- --enable-shared --with-rdoc=ri --with-jemalloc # jemalloc breaks FFI
    env CFLAGS="-O2" ruby-install ruby $argv[1] -- --enable-shared --with-rdoc=ri && \
		echo "NOTE: Run update_ruby_tags after activating the new Ruby."
end

function install_ruby_debug
    env CFLAGS="-fsanitize=address -fno-omit-frame-pointer -DUSE_MN_THREADS=0 -O0 -Wall" ruby-install ruby $argv[1] -- --enable-shared --disable-install-doc --prefix=$HOME/.rubies/ruby-debug && \
		echo "NOTE: Run update_ruby_tags after activating the new Ruby."
end

function update_ruby_tags
    which ctags
    ctags --verbose --recurse --language-force=C --extras --kinds-C=+p -f $RUBY_ROOT/tags $RUBY_ROOT/include
end

alias pn=pnpm
alias ov=overmind
alias vimdiff="nvim -d"
