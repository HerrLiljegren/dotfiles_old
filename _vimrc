	set nocompatible

	if has('win32')
		set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		autocmd GUIEnter * simalt ~x
		"source $VIMRUNTIME\mswin.vim
	endif

	" Load Plugins here

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	Plugin 'xolox/vim-misc'
	Plugin 'scrooloose/nerdtree'
	Plugin 'bling/vim-airline'
	Plugin 'xolox/vim-session'
	Plugin 'othree/html5.vim'
	Plugin 'marijnh/tern_for_vim'
	Plugin 'jiangmiao/auto-pairs'
	Plugin 'Yggdroot/indentLine'
	Plugin 'myusuf3/numbers.vim'
	Plugin 'kien/ctrlp.vim'
	Plugin 'majutsushi/tagbar'
	Plugin 'elzr/vim-json'
	Plugin 'kshenoy/vim-signature'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required


	" Show hidden characters
	set list
	set tabpagemax=15               " Only show 15 tabs
	set showmode                    " Display the current mode

	set cursorline                  " Highlight current line

	set backspace=indent,eol,start  " Backspace for dummies
	set linespace=0                 " No extra spaces between rows
	set number                      " Line numbers on
	set showmatch                   " Show matching brackets/parenthesis
	set incsearch                   " Find as you type search
	set hlsearch                    " Highlight search terms
	set winminheight=0              " Windows can be 0 line high
	set ignorecase                  " Case insensitive search
	set smartcase                   " Case sensitive when uc present
	set wildmenu                    " Show list instead of just completing
	set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
	set wildignore=*\\tmp\\*,*.swp,*.zip,*.exe,node_modules,bower_components,.git
	set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
	set scrolljump=5                " Lines to scroll when cursor leaves screen
	set scrolloff=3                 " Minimum lines to keep above and below cursor
	"set foldenable                 " Auto fold code
	set nofoldenable
	set list
	set listchars=tab:»\ ,trail:·,extends:#,nbsp:.,eol:¬ " Highlight problematic whitespace

	filetype plugin indent on       " Automatically detect file types.
	syntax on                       " Syntax highlighting
	set mouse=a                     " Automatically enable mouse usage
	set mousehide                   " Hide the mouse cursor while typing
	scriptencoding utf-8
	set encoding=utf-8
	set termencoding=utf-8
	"set fileencoding=utf-8

	"set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
	"set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
	set virtualedit=onemore             " Allow for cursor beyond last character
	set history=1000                    " Store a ton of history (default is 20)
	"set spell                           " Spell checking on
	set hidden                          " Allow buffer switching without saving

	" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
	" Restore cursor to file position in previous editing session
	function! ResCur()
		if line("'\"") <= line("$")
			normal! g`"
			return 1
		endif
	endfunction

	augroup resCur
		autocmd!
		autocmd BufWinEnter * call ResCur()
	augroup END

	set background=dark    " Setting dark mode
	set guifont=InputMono:h12
	let g:gruvbox_italic=0
	colorscheme gruvbox


	if has('gui_running')
		set guioptions-=m  " remove menu bar
		set guioptions-=T  " remove toolbar
		set guioptions-=r  " remove right-hand scroll bar
		set guioptions-=L  " remove left-hand scroll bar
		"set lines=40                " 40 lines of text instead of 24
	endif

	set nowrap                      " Do not wrap long lines
	set autoindent                  " Indent at the same level of the previous line
	set shiftwidth=4                " Use indents of 4 spaces
	"set expandtab                   " Tabs are spaces, not tabs
	set tabstop=4                   " An indentation every four columns
	set softtabstop=4               " Let backspace delete indent
	set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
	set splitright                  " Puts new vsplit windows to the right of the current
	set splitbelow                  " Puts new split windows to the bottom of the current
	"set matchpairs+=<:>             " Match, to be used with %
	set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

	" Remove trailing whitespaces and ^M chars
	autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
	
	autocmd BufNewFile,BufRead *.aspx,*.asmx,*.ascx,*.master setlocal ft=html

	" Key remapps
	let mapleader = ','

	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

	" Wrapped lines goes down/up to next row, rather than next line in file.
	noremap j gj
	noremap k gk

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	"go to first and last char of line
	nnoremap H ^
	nnoremap L g_
	vnoremap H ^
	vnoremap L g_

	" use ESC to remove search higlight
	nnoremap <esc> :noh<return><esc>

	" map control-backspace to delete the previous word
	imap <C-BS> <C-W>
	nmap <silent> <leader>ev :e $MYVIMRC<CR>
	nmap <silent> <leader>rv :so $MYVIMRC<CR>

	" Toggle NERDTree
	map <leader>n :NERDTreeToggle<CR>

	" File Open Dialog in Windows
	map <silent> <M-o> :browse confirm e<CR>
	

	" windows like clipboard
	" yank to and paste from the clipboard without prepending "* to commands
	let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
	" map c-x and c-v to work as they do in windows, only in insert mode
	vm <c-x> "+x
	vm <c-c> "+y
	cno <c-v> <c-r>+
	exe 'ino <script> <C-V>' paste#paste_cmd['i']

	" save with ctrl+s
	nmap <c-s> :w<CR>
	imap <c-s> <Esc>:w<CR>a

	" Quick move between buffers
	noremap <leader>q :bp<CR>
	noremap <leader>w :bn<CR>

	" Plugin settings

	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_powerline_fonts = 1

	let g:NERDTreeChDirMode       = 2
	let g:ctrlp_working_path_mode = 'rw'

	let g:session_autoload = 'yes'
	let g:session_autosave = 'yes'

	let g:AutoPairsShortcutFastWrap='<Nop>'

	" Functions

	" Strip whitespace
	function! StripTrailingWhitespace()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" do the business:
		%s/\s\+$//e
		" clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
	endfunction
