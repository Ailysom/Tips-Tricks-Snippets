syntax on
set mouse=a    " Enable mouse usage (all modes)
set tabstop=2
set noexpandtab
set number

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'fannheyward/coc-markdownlint'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required

let g:UltiSnipsExpandTrigger = '<C-y>'
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_auto_trigger = 1
set completeopt=popup,menu
"set previewpopup=height:10,width:60,highlight:PMenuSbar
hi! Pmenu ctermfg=black ctermbg=gray guibg=green
set pumheight=5

nnoremap <C-t> :NERDTreeToggle<CR>
vmap <C-y> :!xclip -f -sel clip<CR>

":au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

let g:airline_theme='base16_gruvbox_dark_hard'

