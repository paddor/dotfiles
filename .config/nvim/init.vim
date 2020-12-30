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

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeToggle', 'NERDTreeToggleVCS', 'NERDTreeFocus', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-ruby/vim-ruby'
Plug 'lucapette/vim-ruby-doc'
Plug 'vim-scripts/matchit.zip'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'justinmk/vim-sneak'

Plug 'glts/vim-magnum' " for vim-radical
Plug 'glts/vim-radical'

Plug 'svermeulen/vim-easyclip'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'micha/vim-colors-solarized'
" Plug 'Yggdroot/indentLine'
Plug 'preservim/tagbar'
Plug 'itchyny/lightline.vim'
"Plug 'edkolev/tmuxline.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'kassio/neoterm'


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
" autocmd Filetype ruby set ts=2 sw=2 et
autocmd Filetype cpp set ts=2 sw=2 et


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
"set scrolloff=1

" short messages
set shortmess=aoOtTI

" write swap file every 100 characters
set updatecount=50

" automatically save buffer on :next or the like
set autowrite
noremap <Esc> :update<CR>

set updatetime=4000

" faster scrolling with ^e ^y
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

" line-wise scrolling with track pad
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" better % command
runtime macros/matchit.vim " and needed for textobj-rubyblock

" moving between tabs
" map <S-L> :tabn<return>
" map <S-H> :tabprev<return>

" nice leader key to bind custom actions
"let mapleader = ","
set timeoutlen=700 " ms

" stop highlighting search results
nmap <silent> <leader>n :silent :nohlsearch<CR>

" toggle line numbers
nmap <silent> <leader>m :silent :set nu!<CR>

" toggle listchars
nmap <silent> <leader>l :silent :set list!<CR>

" run makeprg
nmap <leader>b :Make<CR>
nmap <leader>B :Make!<CR>
" Dispatch (e.g. Rspec)
nmap <silent> <leader>r :Dispatch<CR>


" Move cursor back to where it was in insert mode after exiting insert mode.
" This prevents the cursor from moving one character to the left.
inoremap <silent> <Esc> <Esc>`^

" NERDTree
let NERDTreeHijackNetrw=1
let NERDTreeMinimalMenu=1
let NERDTreeMinimalUI=1
nnoremap <leader>t :NERDTreeToggleVCS<CR>
nnoremap - :NERDTreeFind<CR>
" open NERDTree when no file args given
"autocmd vimenter * if !argc() | NERDTree | endif
" close when NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set modelines=5
"set cursorline " highlight current line

"set list
"set listchars=tab:>-,trail:^,eol:$
"set listchars=tab:>-,trail:_,eol:$
"set listchars=tab:>-,eol:$
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨ " let's see how vim-sensible feels
set fillchars="stl:,stlnc:,vert:|,fold:-,diff:-"
"set showbreak=↪\ 


" don't treat "-" as a word character
set iskeyword-=-


set bg=dark
colorscheme solarized

"hi clear Search
"hi Search cterm=reverse
hi Search cterm=bold ctermbg=darkmagenta ctermfg=black

"hi Search cterm=reverse ctermbg=magenta ctermfg=magenta
"hi IncSearch cterm=underline,reverse
"hi CursorLine cterm=none ctermfg=none ctermbg=black
"hi StatusLine   cterm=bold ctermfg=grey ctermbg=black " horizontal line below window
"hi StatusLineNC cterm=none ctermfg=grey ctermbg=black " not current window
"hi VertSplit    cterm=none ctermfg=grey ctermbg=black
hi VertSplit    cterm=none ctermfg=green ctermbg=none
"hi LineNr ctermfg=yellow ctermbg=black cterm=none
"hi SignColumn ctermfg=yellow ctermbg=black cterm=none
""hi Visual cterm=NONE ctermbg=black
"hi Visual cterm=none ctermfg=magenta ctermbg=black
"hi Visual cterm=reverse ctermbg=white
"hi Comment cterm=none ctermfg=darkblue
"hi String ctermfg=1 cterm=bold
"hi Special ctermbg=NONE ctermfg=darkblue cterm=NONE
hi SpecialKey ctermbg=NONE ctermfg=darkblue cterm=NONE " nbsp, space, tab and trail
"hi Todo ctermbg=darkyellow ctermfg=black cterm=bold " TODOs
" TODO
hi TabLineFill cterm=none ctermbg=black
hi TabLine ctermfg=darkyellow ctermbg=black cterm=none
"hi TabLineSel ctermfg=darkcyan ctermbg=black cterm=bold
hi TabLineSel ctermfg=darkyellow cterm=bold,reverse
"hi Folded ctermfg=yellow ctermbg=none cterm=underline
"hi MatchParen ctermbg=darkyellow ctermfg=grey cterm=none,bold
"hi MatchParen ctermfg=darkyellow ctermbg=none
match ErrorMsg '\s\+$'


"hi DiffAdd        ctermfg=darkgreen ctermbg=none
"hi DiffChange     ctermfg=none ctermbg=none
"hi DiffDelete     ctermfg=red ctermbg=none
"hi DiffText       cterm=bold,reverse ctermbg=none


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" alternate file (projectionist)
nmap <silent> <leader>a :A<CR>


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
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>T :TagbarToggle<CR>
let g:tagbar_position='topleft vertical'
"let g:tagbar_sort = 0


" FZF
nnoremap <m-g> :GFiles<CR>
nnoremap <m-f> :Files<CR>

set splitright
set splitbelow

" fast buffer listing and switching
" vanilla:
" nnoremap gb :ls<CR>:b<Space>
" with FZF:
nnoremap gb :Buffers<CR>

" vertical split :h (help)
cabbrev h vert to h

map f <Plug>Sneak_s
map F <Plug>Sneak_S

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

set nofixeol


" M to move text from cursor to end of line (easyclip)
nmap M <Plug>MoveMotionEndOfLinePlug


nnoremap <F12> :so $MYVIMRC \| :PlugInstall<CR>
nnoremap <S-F12> :PlugUpdate<CR>


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


" Bundler
let $DEV_ENV='true'


" vim-ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
let ruby_operators        = 1
let ruby_pseudo_operators = 1
"let ruby_fold = 0
"let ruby_foldable_groups = 'def'

" vim-ruby-doc
"let g:ruby_doc_command='w3m'
