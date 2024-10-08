
" Setup XDG directories specs
" directory, undodir and backupdir is already set in /usr/share/vim/vimfiles/archlinux.vim

" set runtimepath-=~/.vim
" set runtimepath-=~/.vim/after
" set runtimepath^=$XDG_CONFIG_HOME/vim
" set runtimepath+=$XDG_CONFIG_HOME/vim/after

" set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
" let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"


" Map F4 to highlight search
noremap <F4> :set hlsearch! hlsearch?<CR>
set hlsearch


" Custom auto highlight
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead pacman.log set filetype=pacmanlog


" Show tabs, trailing whitespace, and continued lines visually
set list listchars=tab:»·,trail:·,extends:…
if has("syntax") && (&t_Co > 2 || has("gui_running"))
    syntax enable
    se t_Co=256

    function! ActivateInvisibleCharIndicator()
        syntax match TrailingSpace "[ \t]\+$" display containedin=ALL
        highlight TrailingSpace ctermbg=Red
    endf
    autocmd BufNewFile,BufRead * call ActivateInvisibleCharIndicator()
endif


" Map Y like C or D: until the end
map Y y$

set tabstop=2
set shiftwidth=2
set textwidth=110
set undofile

