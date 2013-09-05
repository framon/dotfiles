noremap <F4> :set hlsearch! hlsearch?<CR>

function TabStopToggle()
  if &tabstop == 4
	set tabstop=8
	set shiftwidth=8
  else
	set tabstop=4
	set shiftwidth=4
  endif
endf
noremap <F5> :call TabStopToggle()<CR>

set tabstop=4

if has("syntax") && (&t_Co > 2 || has("gui_running"))
syntax on
function! ActivateInvisibleCharIndicator()
syntax match TrailingSpace "[ \t]\+$" display containedin=ALL
highlight TrailingSpace ctermbg=Red
endf
autocmd BufNewFile,BufRead * call ActivateInvisibleCharIndicator()
endif
" Show tabs, trailing whitespace, and continued lines visually
set list listchars=tab:»·,trail:·,extends:…

" highlight overly long lines same as TODOs.
set textwidth=80
autocmd BufNewFile,BufRead *.c,*.h exec 'match Todo /\%>' . &textwidth . 'v.\+/'

