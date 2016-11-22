set nocompatible              " be iMproved, required

" Plugins {{{
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle' " Let bundle manage its self

Plugin 'vim-airline/vim-airline' " Additional information bar
" {{{ vim-airline
set laststatus=2
set termencoding=utf-8
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
" Remove incorrectly displayed arrows
let g:airline_left_sep=''
let g:airline_right_sep=''
" }}}

Plugin 'vim-airline/vim-airline-themes' "Airline theming

Plugin 'sheerun/vim-polyglot' "Syntax related information for different file types

Plugin 'airblade/vim-gitgutter' "Git information in Airline

Plugin 'tpope/vim-fugitive' "Git commands

Plugin 'altercation/vim-colors-solarized' "Solarized colours

Plugin 'scrooloose/nerdtree' "Navigation tree
" {{{ nerdtree
map <C-n> :NERDTreeToggle<CR>
" }}}

Plugin 'derekwyatt/vim-fswitch' "Toggle between header and source
" {{{ vim-fswitch
"Load it into the current window
nmap <silent> <Leader>oo :FSHere<cr>
"Load it into the window on the left
nmap <silent> <Leader>oh :FSLeft<cr>
"Load it into a new window split on the left
nmap <silent> <Leader>oH :FSSplitLeft<cr>
"Load it into the window below
nmap <silent> <Leader>oj :FSBelow<cr>
"Load it into a new window split below
nmap <silent> <Leader>oJ :FSSplitBelow<cr>
"Load it into the window above
nmap <silent> <Leader>ok :FSAbove<cr>
"Load it into a new window split above
nmap <silent> <Leader>oK :FSSplitAbove<cr>
"Load it into the window on the right
nmap <silent> <Leader>ol :FSRight<cr>
"Load it into a new window split on the right
nmap <silent> <Leader>oL :FSSplitRight<cr>
" }}}

" Plugin 'amiel/vim-tmux-navigator' " Common navigation key between tmux and vim

Plugin 'kien/ctrlp.vim' "Fuzzy file search
" {{{ ctrlp
let g:ctrlp_max_files=0
set wildignore+=*/tmp/*,*/build/*,*.so,*.swp,*.zip
" }}}

Plugin 'rking/ag.vim' "silversearcher-ag
" {{{ ag.vim
let g:ag_working_path_mode="r"
let g:ag_prg = 'ag --nogroup --nocolor --column --ignore-dir=libs'
" }}}

Plugin 'simplyzhao/cscope_maps.vim' " Cscope

Plugin 'Valloric/YouCompleteMe' " YouCompleteMe
" {{{ YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" Don't load ycm
" let g:loaded_youcompleteme = 1
"UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" }}}

Plugin 'artur-shaik/vim-javacomplete2'
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Plugin 'ervandew/eclim'
" " {{{ eclim
" "Eclim integration with ycm
" let g:EclimCompletionMethod = 'omnifunc'
" " }}}

Plugin 'SirVer/ultisnips' "Snippet manager
" {{{ ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}

Plugin 'honza/vim-snippets' "Snippets

Plugin 'ervandew/supertab' "Helper for YouCompleteMe and UltiSnips compatibility
" {{{ supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
" }}}

Plugin 'editorconfig/editorconfig-vim' "File formatting

Plugin 'tomtom/tcomment_vim' "Comments

call vundle#end()
filetype plugin indent on

" }}}

" Vim configuration {{{
set backup
set backupdir=$HOME/.tmp/vim-backup
set dir=$HOME/.tmp/vim-swap

" Copy/paste between vim sessions
set clipboard=unnamedplus

set timeout ttimeoutlen=50

" Automatically reload vimrc file
autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc

" Mash jk to escape
inoremap jk <Esc>

" Toggle folds
nnoremap <Space> za
" }}}

" Theming {{{
syntax on
set term=screen-256color-bce
set t_Co=256
let g:solarized_termcolors=16
if $THEME == "dark"
    set background=dark
else
    set background=light
endif
colorscheme solarized
" }}}

" Formatting {{{
set encoding=utf-8

" setlocal spell spelllang=en_us
setlocal spelllang=en_us

" Spelling
set spell

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Highlight search
set hlsearch

" Uses spaces, not tab
set expandtab

" Number of spaces used for indentation
set shiftwidth=4

" Number of spaces used for indentation when editing
set softtabstop=4

" Delete over line breaks
set backspace=indent,eol,start

" Don't wrap lines by default
set nowrap

" Column with indication
set colorcolumn=100
set textwidth=100

" Git commit message lines to be 70 char long
au FileType gitcommit set tw=70

set fdm=marker

" Remove unwanted white spaces
map <F4> :%s/\s\+$//gc<CR>

" Find replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Sort
vnoremap <Leader>s :sort<CR>

" Code block handling
vnoremap < <gv
vnoremap > >gv

" Moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

map <C-h> 4zh " Scroll 4 characters to the left
map <C-l> 4zl " Scroll 4 characters to the right
" }}}

" IDE {{{
" Ctags
autocmd FileType c,cpp,h,hpp  let b:ctags_kinds = '--c++-kinds=+p'
autocmd FileType java         let b:ctags_kinds = '--java-kinds=+p'
autocmd FileType python       let b:ctags_kinds = '--python-kinds=-i'
function! UpdateCtags()
  let l:updateCtags = '!ctags -R ' . b:ctags_kinds . ' --fields=+iaS --exclude=".git" --exclude="libs" --extra=+q .'
  :silent exec l:updateCtags
endfunction

" Cscope
autocmd FileType c,cpp  let b:cscope_files = '-name "*.[cChH]" -o -name "*.[cChH]pp"'
autocmd FileType java   let b:cscope_files = '-name "*.java" -o -name "*.aidl"'
function! UpdateCScope()
  let l:updateCScope = '!find . -type f ' . b:cscope_files . ' > cscope.files'
  :silent exec l:updateCScope
  :silent !cscope -Rbvq
  :cs reset
endfunction

" Update references and indexes
function! UpdateReferences()
    call UpdateCtags()
    call UpdateCScope()
    " Purely silent commands need a screen redraw
    :redraw!
endfunction

" Update files and references used by Ctags and cScope
:nnoremap <F5> :call UpdateReferences()<CR>
" Update references automatically when saving a file
" :autocmd BufWritePost *.[cChH]{,pp,++} call UpdateReferences()

set tags+=tags;$HOME

" Recognise *.md flies as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" }}}
