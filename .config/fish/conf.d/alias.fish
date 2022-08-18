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
end
