" PATHOGEN: https://github.com/tpope/vim-pathogen
	execute pathogen#infect()

" Ag https://github.com/rking/ag.vim
  nnoremap <leader>a :Ag<CR>

" Airline
  let g:airline_powerline_fonts = 1

" COMPATIBILITY
	set nocompatible " Turn off vi compatibility
	set backspace=2 " Make backspace work like most other apps

" CtrlP
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|gem)$',
    \ }
  
  " Hand off searching to ag
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" KEY MAPPINGS
	" Reassign leader from \ to ,
	let mapleader = ','

	" Turn off search highlight
  nnoremap <C-n> :nohlsearch<CR>

  " Toggle Gundo http://sjl.bitbucket.org/gundo.vim/
  " Graph your Vim undo tree in style.
  nnoremap <leader>u :GundoToggle<CR>

  " Navigate split windows with <C-{hjkl}>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Split vertical/horizontal shortcuts
  " nnoremap <C-v> :vsp<CR>
  " nnoremap <C-x> :sp<CR>

  " CtrlP
  let g:ctrlp_map = '<leader><leader>'
  nnoremap <leader>b :CtrlPBuffer<CR>

  " NERDTree
  nnoremap <C-p> :NERDTreeToggle<CR>
  nnoremap <leader>p :NERDTreeFind<CR>

  " Save session. Reopen with `vim -S`
  nnoremap <leader>s :mksession<CR>

" NERDTree
  let NERDTreeShowHidden=1 " Show hidden files by default.

  " Close if NERDTree the only buffer open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" PERFORMANCE
	" Vim loves to redraw the screen during things it probably
	" doesn't need to—like in the middle of macros. This tells
	" Vim not to bother redrawing during these scenarios,
	" leading to faster macros.
	set lazyredraw

  " Files to ignore when working with wildcards.
  " CtrlP uses this as part of its own exclusion.
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*,*vendor/* 

" SEARCH
	set incsearch " Search as characters are entered
	set hlsearch  " Highlight search matches

" SPLIT
  " Open new split panes to right and bottom, which feels more natural than Vim’s default
  set splitbelow
  set splitright

" VISUAL
	colorscheme tomorrow-night " Set the color scheme
  syntax enable              " Enable syntax processing

	set number      " Show line numbers
	set cursorline  " Highlight the current line
	set showmatch   " Highlight matching characters, i.e. [{}]

" WHITESPACE
	" http://tedlogan.com/techblog3.html
	set shiftwidth=2  " How many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation
	set tabstop=2     " How many columns a tab counts for
	set softtabstop=2 " How many columns vim uses when you hit Tab in insert mode
	set expandtab     " Tab in insert mode will produce the appropriate number of spaces
  set autoindent

	" File based indentation
  " Indentation files are loaded from ~/.vim/indent/python.vim
	filetype indent on
