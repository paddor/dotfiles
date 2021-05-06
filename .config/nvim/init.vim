if &compatible
  set nocompatible               " Be iMproved
endif

"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
if has('nvim')
	call plug#begin(stdpath('data') . '/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

if !has('nvim')
	Plug 'tpope/vim-sensible'
endif
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-vinegar' " lingering buffers in :Buffers :/
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'


Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeToggle', 'NERDTreeToggleVCS', 'NERDTreeFocus', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'lambdalisue/fern.vim'
" Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/nerdfont.vim'
" Plug 'lambdalisue/glyph-palette.vim'
" Plug 'lambdalisue/fern-git-status.vim'
" Plug 'lambdalisue/fern-hijack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/nerd-fonts'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
"Plug 'inkarkat/vim-EnhancedJumps' " WTF broken?
" Plug 'romainl/vim-qf' " steals focus

Plug 'vim-ruby/vim-ruby'
" Plug 'lucapette/vim-ruby-doc' " unusable in TUI: https://github.com/lucapette/vim-ruby-doc/issues/8
Plug 'vim-scripts/matchit.zip'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'justinmk/vim-sneak'
Plug 'glts/vim-textobj-comment'

Plug 'glts/vim-magnum' " for vim-radical
Plug 'glts/vim-radical'

"Plug 'svermeulen/vim-easyclip' " too much. Better solution: vim-subversive
Plug 'svermeulen/vim-subversive'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'micha/vim-colors-solarized'
Plug 'machakann/vim-highlightedyank'
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesToggle' }
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'itchyny/lightline.vim'
Plug 'thoughtbot/vim-rspec'

" Plug 'kassio/neoterm' " defines ,tt which adds timeout to , command
" Plug 'hwartig/vim-seeing-is-believing'

Plug 'dag/vim-fish'
Plug 'vifm/vifm.vim'

" Initialize plugin system
call plug#end()



" allow abandoning modified buffers keep them loaded
set hidden


" enable mouse
set mouse=a

if has('nvim')
	set backupdir=~/.nvim-tmp/backup/
	set directory=~/.nvim-tmp/swap/
else
	set backupdir=~/.vim-tmp/backup/
	set directory=~/.vim-tmp/swap/
endif


" tabstop
augroup TwoSpacesAsTab
  autocmd!
  autocmd Filetype cpp,vim,json,yaml set ts=2 sw=2 et
augroup END

augroup ShellScriptTabWidth
  au!
  autocmd FileType sh,fish set ts=4 sw=4
augroup END

augroup RubyCustomConfigs
  au!
  autocmd FileType ruby set tw=118 iskeyword-=#-
augroup END


hi clear Search
hi Search cterm=reverse



if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep X lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" set terminal title
set title

" show line numbers
"set number

" ignore case in search unless searching uppercase letters
set ignorecase smartcase

" start scrolling 3 lines before horizontal window border
"set scolloff=1

" short messages
set shortmess=aoOtTI

" write swap file every 100 characters
" set updatecount=50

" automatically save buffer on :next or the like
set autowrite
noremap <Esc> :update<CR>

" time to wait after moving cursor before writing swap file and
" firing CursorHold event
set updatetime=500

" faster scrolling with ^e ^y
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" line-wise scrolling with track pad
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" better % command
runtime macros/matchit.vim " and needed for textobj-rubyblock

" moving between tabs
" map <S-L> :tabn<return>
" map <S-H> :tabprev<return>
map <S-right> :tabn<return>
map <S-left> :tabprev<return>

" nice leader key to bind custom actions
"let mapleader = ","
set timeoutlen=700 " ms

" stop highlighting search results
nnoremap <silent> <leader>n :silent :nohlsearch<CR>

" toggle line numbers
nnoremap <silent> <leader>m :silent :set nu!<CR>

" toggle listchars
nnoremap <silent> <leader>l :silent :set list!<CR>

" run makeprg
"nnoremap ~<CR> :Make %<CR>
" nnoremap `<CR> :Dispatch -compiler=rspec_ff<CR>
" nnoremap ~<CR> :Dispatch -compiler=rspec<CR>
nnoremap ~<CR> :Dispatch bundle exec rspec %<CR>
nnoremap <leader>C :Copen<CR>
"nnoremap <leader>b :Make %<CR>
"nnoremap <leader>B :Make<CR>
"nnoremap <silent> <leader>r :Dispatch<CR>
" NOTE: Using the mappings from Dispatch instead. See :h dispatch-maps
" Dispatch (e.g. Rspec)
"autocmd FileType ruby let b:dispatch = 'bundle exec rspec -ff %'
" NOTE: Set in .projectionist.json file instead.


" Move cursor back to where it was in insert mode after exiting insert mode.
" This prevents the cursor from moving one character to the left.
inoremap <silent> <Esc> <Esc>`^

" NERDTree
let NERDTreeHijackNetrw=1
let NERDTreeMinimalMenu=1
let NERDTreeMinimalUI=1
nnoremap <leader>t :NERDTreeToggleVCS<CR>
nnoremap - :NERDTreeFind<CR>
augroup NERDTreeConfig
 au!
 " open NERDTree when no file args given
 autocmd vimenter * if !argc() | NERDTree | endif
 " close when NERDTree is last window
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

set modelines=5
"set cursorline " highlight current line

set fillchars="stl:,stlnc:,vert:|,fold:-,diff:-"
if &encoding == "utf-8"
  set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
  set showbreak=↪
else
  set listchars=tab:-->,eol:$,nbsp:~,trail:_,
  let &showbreak='> '
endif


" don't treat "-" as a word character
" set iskeyword-=-
" augroup CustomKeywordChars
  " au!
  " autocmd BufNewFile,BufRead * setlocal iskeyword-=-
" augroup END

set bg=dark
colorscheme solarized


"hi clear Search
"hi Search cterm=reverse
"hi Search cterm=bold ctermbg=darkmagenta ctermfg=black
"hi Search cterm=bold ctermbg=darkcyan ctermfg=black
hi Search cterm=bold ctermbg=darkmagenta ctermfg=black
" hi Search cterm=bold ctermbg=darkyellow ctermfg=black
"hi Search cterm=reverse ctermbg=magenta ctermfg=magenta
"hi IncSearch cterm=underline,reverse
"hi CursorLine cterm=none ctermfg=none ctermbg=black
"hi CursorLine cterm=none ctermfg=none ctermbg=none
"hi CursorLineNr cterm=none ctermfg=none ctermbg=none
"reset CursorLine
" hi CursorLine cterm=none ctermfg=none ctermbg=none
"hi StatusLine   cterm=bold ctermfg=grey ctermbg=black " horizontal line below window
"hi StatusLineNC cterm=none ctermfg=grey ctermbg=black " not current window
"hi VertSplit    cterm=none ctermfg=grey ctermbg=black
hi VertSplit    cterm=none ctermfg=green ctermbg=none
"hi LineNr ctermfg=yellow ctermbg=black cterm=none
"hi SignColumn ctermfg=yellow ctermbg=black cterm=none
hi Visual cterm=NONE ctermbg=darkgreen
"hi Visual cterm=none ctermfg=magenta ctermbg=black
" hi Visual cterm=reverse ctermbg=white
hi SpecialKey ctermbg=NONE ctermfg=darkblue cterm=NONE " nbsp, space, tab and trail
"hi Todo ctermbg=darkyellow ctermfg=black cterm=bold " TODOs
" TODO
hi TabLineFill cterm=none ctermbg=black
hi TabLine ctermfg=darkyellow ctermbg=black cterm=none
"hi TabLineSel ctermfg=darkcyan ctermbg=black cterm=bold
hi TabLineSel ctermfg=darkyellow cterm=bold,reverse
"hi Folded ctermfg=yellow ctermbg=none cterm=underline
hi Folded ctermfg=green ctermbg=none cterm=none
"hi MatchParen ctermbg=darkyellow ctermfg=grey cterm=none,bold
hi MatchParen ctermfg=darkmagenta ctermbg=none
hi link QuickFixLine none

" show extra white spaces as errors, but not while typing
hi link ExtraWhiteSpace ErrorMsg
match ExtraWhiteSpace '\s\+$'
augroup ExtraWhitespace
  au!
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ " \%# = cursor position, \@<! = only match if previous atom doesn't match
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
augroup END

augroup QuickFix
  au!
  " don't highlight extra whitespaces
  autocmd BufWinEnter quickfix match ExtraWhitespace ''

  au FileType qf call AdjustWindowHeight(8, 16)
  hi CursorLine ctermbg=black
  au FileType qf set cursorline

  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | q | endif

  " disable statusline
  autocmd BufWinEnter quickfix setlocal laststatus=0

  " exclude from :ls and buffer navigation like [b and ]b
  autocmd BufWinEnter quickfix set nobuflisted
augroup END

function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"hi DiffAdd        ctermfg=darkgreen ctermbg=none
"hi DiffChange     ctermfg=none ctermbg=none
"hi DiffDelete     ctermfg=red ctermbg=none
"hi DiffText       cterm=bold,reverse ctermbg=none


" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" alternate file (projectionist)
nnoremap <silent> <leader>a :A<CR>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Go to tab by number
" au TabLeave * let g:lasttab = tabpagenr()
" nnoremap <leader>` :exe "tabn ".g:lasttab<cr>
" nnoremap <leader>1 1gt
" nnoremap <leader>2 2gt
" nnoremap <leader>3 3gt
" nnoremap <leader>4 4gt
" nnoremap <leader>5 5gt
" nnoremap <leader>6 6gt
" nnoremap <leader>7 7gt
" nnoremap <leader>8 8gt
" nnoremap <leader>9 9gt
" nnoremap <leader>0 :tablast<cr>


" TagBar
nnoremap <leader>T :TagbarToggle<CR>
let g:tagbar_position='topleft vertical'
let g:tagbar_sort = 0
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'


" FZF
nnoremap <m-g> :GFiles<CR>
nnoremap <m-f> :Files<CR>
" fix closing FZF with Esc: https://github.com/junegunn/fzf.vim/issues/1213
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
nnoremap gb :Buffers<CR>
" search for word under cursor with :Ag
nnoremap <leader>A "ayiw:Rg <c-R>a<CR>
nmap <C-]> <Plug>(fzf_tags)



" fast buffer listing and switching
" vanilla:
" nnoremap gb :ls<CR>:b<Space>

set splitright
set splitbelow

" vertical split :h (help)
cabbrev h vert to h

map f <Plug>Sneak_s
map F <Plug>Sneak_S

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

set nofixeol


" M to move text from cursor to end of line (easyclip)
"nmap M <Plug>MoveMotionEndOfLinePlug


" tends to fail 1st time
" nmap <F12> :so $MYVIMRC \| :PlugInstall \| :PlugUpdate<CR>
nmap <F12> :so $MYVIMRC \| :PlugInstall<CR>
"nmap <S-F12> :PlugUpdate<CR> " mapping S-F* is hard


set wildmode=longest:full,full

" allow Up/Down arrow keys in wildmenu
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" NeoTerm
let g:neoterm_repl_ruby='pry'
let g:neoterm_autoscroll='1'
tnoremap <Esc> <C-\><C-n>


" Bundler
let $DEV_ENV='true'


" vim-ruby
augroup RubyComplete
  autocmd!
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
  autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
  let ruby_operators        = 1
  let ruby_pseudo_operators = 1
  "let ruby_fold = 0
  "let ruby_foldable_groups = 'def'
augroup END


" vim-ruby-doc
"let g:ruby_doc_command='w3m'

" if !exists('g:dispatch_compilers')
"   let g:dispatch_compilers = {}
" endif
" let g:dispatch_compilers['rspec'] = 'rake'


augroup VimRspec
  au!
  autocmd FileType ruby,eruby let g:rspec_command = "compiler rspec | Make {spec}"
augroup END
nnoremap <silent> <leader>rn :call RunNearestSpec()<CR>
nnoremap <silent> <leader>rl :call RunLastSpec()<CR>

" Comments with CTRL-/ (typed using CTRL-V CTRL-/)
nnoremap  :Commentary<CR>j
xnoremap  :'<,'>Commentary<CR>

" s for substitute (vim-subversive)
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
nmap <leader>cs <plug>(SubversiveSubstituteRangeConfirm)
xmap <leader>cs <plug>(SubversiveSubstituteRangeConfirm)
nmap <leader>css <plug>(SubversiveSubstituteWordRangeConfirm)
let g:subversivePromptWithActualCommand = 1
let g:subversivePreserveCursorPosition = 1

" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>


let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nnoremap <leader>i :IndentLinesToggle<CR>

" don't insert comment leader when hitting o/O
augroup FormatOptions
  au!
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o
augroup END


" RGB
" if has('termguicolors')
" 	set termguicolors " UGLY
" endif

augroup RubyTemplates
  au!
  autocmd BufNewFile,BufRead *.rb.template set ft=ruby
augroup END


" Enable seeing-is-believing mappings only for Ruby
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <leader><Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <leader><Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END


if has('nvim')
	" show effects of commands (e.g. :subsitute) incrementally
	set inccommand=nosplit
endif


" highlightedyank
let g:highlightedyank_highlight_duration = 200
"highlight HighlightedyankRegion cterm=reverse gui=reverse
highlight HighlightedyankRegion ctermbg=3 ctermfg=black cterm=bold "gui=reverse


" search underlying word without jumping (and keep jumplist)
nnoremap * :keepjumps normal! mi*`i<CR>


" show highlighting group used under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" exchanging hunks in diffs
nnoremap g> :diffput<CR>
xnoremap g> :diffput<CR>
nnoremap g< :diffget<CR>
xnoremap g< :diffget<CR>
