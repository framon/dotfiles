execute pathogen#infect()


noremap <F4> :set hlsearch! hlsearch?<CR>


if has("syntax") && (&t_Co > 2 || has("gui_running"))
	syntax enable
	set background=dark
	colorscheme solarized
	se t_Co=256

	function! ActivateInvisibleCharIndicator()
		syntax match TrailingSpace "[ \t]\+$" display containedin=ALL
		highlight TrailingSpace ctermbg=Red
	endf
	autocmd BufNewFile,BufRead * call ActivateInvisibleCharIndicator()
endif

" Show tabs, trailing whitespace, and continued lines visually
set list listchars=tab:»·,trail:·,extends:…


set tabstop=4
set shiftwidth=4
set textwidth=100

