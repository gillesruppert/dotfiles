set nocompatible " must be the first line
syntax on
filetype on
filetype plugin on
filetype indent on
let mapleader = ","


" added filetypes
au BufNewFile,BufRead *.spv set filetype=php "add filetype
au BufNewFile,BufRead *.liquid set filetype=xhtml "add filetype
augroup mkd " add markdown syntax
	autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" automatically close tag as needed
au Filetype html,xml,xsl,php,spv,phtml source $HOME/.vim/scripts/closetag.vim

" taglist
let Tlist_Ctags_Cmd = '~/.vim/utils/ctags' " set path to ctags utility
let Tlist_WinWidth = 50
map <leader>l :TlistToggle<CR> 
map <F8> :!~/.vim/utils/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Easy Grep options
let g:EasyGrepMode = 2
let g:EasyGrepRecursive = 1

" PHP options
let php_sql_query=1
let php_htmlInStrings=1
"let php_folding=1

" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <c-m> :w!<CR>:!/usr/bin/php %<CR>

" PHP parser check (CTRL-L)
":autocmd FileType php noremap <c-l> :!/usr/bin/php -l %<CR>
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" save with ,,
inoremap <leader>, <esc>:w<cr>
nnoremap <leader>, :w<cr>

" save & restore sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <c-s> :mksession! $HOME/.vimsession <cr>
map <c-o> :source $HOME/.vimsession <cr>

" added word chars
set iskeyword+=$
set iskeyword+=-
set iskeyword+=_ 

" buffer can't be put to background without saving
set hidden

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase
" switch search highighting off temporaril
nmap <silent> <leader>n :silent :nohlsearch<CR>

" indent settings
set autoindent
set smartindent

" tab settings
set sw=4
set tabstop=4
set noexpandtab
set smarttab

" show line number, cursor position
set number
set ruler
set cul " highlights the cursor line
set nowrap
set encoding=utf-8

set visualbell

" show invisible chars
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>i :set nolist!<CR>

" scroll 3 lines before bottom/top
set scrolloff=3

" put swp files into the tmp dir rather than next to the file!
set backupdir=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp
set directory=$HOME/.vim-tmp,$HOME/.tmp,$HOME/tmp,/var/tmp,/tmp

" customised shortcuts
" escape out of insert mode with jk
inoremap jk <Esc>

" autocomplete shortcut to ctrol-space
imap <c-space> <c-x><c-o>

" swaps ' ` for easier bookmark return
nnoremap ' `
nnoremap ` '

" Vertical split then hop to new buffer
:noremap <leader>v :vsp<CR>
:noremap <leader>h :split<CR>
" Make current window the only one
:noremap <leader>O :only :tabo<CR>
:noremap <leader>o :only<CR>

" Buffer next,previous (ctrl-{n,p})
:noremap <c-n> :bn<CR>
:noremap <c-p> :bp<CR>
" Buffer delete (ctrl-c)
":noremap <c-q> :bd<CR>

" remap going through windows
map <c-j> <c-w>j 
map <c-k> <c-w>k 
map <c-l> <c-w>l 
map <c-h> <c-w>h
map <c-c>j <c-w>j<c-w>c<c-w>k
map <c-c>k <c-w>k<c-w>c<c-w>j
map <c-c>l <c-w>l<c-w>c<c-w>h
map <c-c>h <c-w>h<c-w>c<c-w>l

" set backspace to act like normal
set backspace=start,indent,eol

" create a larger history
set history=100

" show autocomplete menus
set wildmenu
set wildmode=list:longest " completion menu behaves more like cli

" hide files matching the pattern:
let g:explHideFiles='^\.,.*\.pyc$'

" display incomplete commands
set showcmd

" show editing mode
set showmode

" gvim don't display the menu or toolbar
set guioptions-=m
set guioptions-=T

" set the title within xterm as well
set title

" set status line
set laststatus=2
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \%P\ %{fugitive#statusline()} " set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" set colorscheme depending on env
set bg=dark
if has("gui_running")
	"colorscheme desert
	"colorscheme inkpot
	colorscheme wombat
else
	"colorscheme darkblue
	colorscheme wombat
endif

" Font. Very important.
set guifont="Monaco:h12"

if has('win32') || has('win64')
    " set guifont=Monaco:h16
    " http://jeffmilner.com/index.php/2005/07/30/windows-vista-fonts-now-available/
    set guifont=Consolas:h12:cANSI
elseif has('unix')
    let &guifont="Monospace:h12"
endif

" fuzzy finder
"let g:fuzzy_ceiling = 10
let g:fuzzy_matching_limit = 30
let g:fuzzy_ignore = '**/profilingFixtures/*;**/fixtures/*'
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <c-t> :FufFile<cr> "new version of FuzzyFileFinder

" nerd tree
map <leader>d :NERDTreeToggle<CR>

" change the VCS prefix command
" let VCSCommandMapPrefix="<leader>s"

" phpdoc
inoremap <leader>p <esc>:call PhpDocSingle()<cr>i
nnoremap <leader>p :call PhpDocSingle()<cr>
vnoremap <leader>p :call PhpDocSingle()<cr>

" Make ',e' (in normal mode) give a prompt for opening files
" in the same dir as the current buffer's file.
" if has("unix")
"   map ,e :e <CR>=expand("%:p:h") . "/" <CR>
" else
"   map ,e :e <CR>=expand("%:p:h") . "\\" <CR>
" endif

imap <c-j>d <c-r>=system('$HOME/.vim/utils/uuid.sh')<cr>

" cscope settings
" if has("cscope")
	" Some scsope specific settings
"	set cscopequickfix=s-,c-,d-,i-,t-,e-

	" always use cscope instead of tags
	" set cst

	" path to cscope
"	set csprg=/usr/bin/cscope

	" search databased before searching tag files
	" set cscopetagorder=0

	" don\'t display cscope messages when adding database
	" set nocsverb

	" add any database in current directory
	" if filereadable("cscope.out")
		" cs add cscope.out
		" else add database pointed to by environment
	" elseif $CSCOPE_DB != ""
		" cs add $CSCOPE_DB
	" endif

	" reset cscope verbosity
	" set csverb
" endif
