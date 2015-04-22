set nocompatible              " be iMproved, required

" =============================================
" Plugins
" =============================================
"
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
" Plugin 'git://git.wincent.com/command-t.git'


call vundle#end()
filetype plugin indent on



" =============================================
" Toggles
" =============================================
" Map key to toggle opt
"function MapToggle(key, opt)
"  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
"  exec 'nnoremap '.a:key.' '.cmd
"  exec 'inoremap '.a:key." \<C-O>".cmd
"endfunction
"command -nargs=+ MapToggle call MapToggle(<f-args>)
"MapToggle <F2> hlsearch
"set pastetoggle=<F3>

" =============================================
" Backup
" =============================================
"
set backup
set backupdir=$HOME/.tmp/vim-backup
set dir=$HOME/.tmp/vim-swap


" =============================================
" Formatting
" =============================================
"
set encoding=utf-8

" Spelling
setlocal spell spelllang=en_us
set nospell

" Show line numbers
set number

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
set colorcolumn=80

" Powerline configuration
set laststatus=2
set termencoding=utf-8
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1


" Solarized color scheme
syntax on
set term=screen-256color-bce
set t_Co=256
let g:solarized_termcolors=16
set background=light
colorscheme solarized


" =============================================
" Functionality
" =============================================
"
" Copy/paste between vim sessions
set clipboard=unnamed

" Automatically reload vimrc file
"autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc

" Recognise *.md flies as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

 
" =============================================
" Key bindings
" =============================================
"
" Escape
inoremap jk <Esc>

" Sort
vnoremap <Leader>s :sort<CR>

" Remove unwanted white spaces
map <F6> :%s/\s\+$//gc<CR>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'
noremap <silent> <Leader>j :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>k :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Code block handling
vnoremap < <gv
vnoremap > >gv

" ctags shortcut
autocmd FileType c,cpp   let b:ctags_kinds = '--c++-kinds=+p'
autocmd FileType python   let b:ctags_kinds = '--python-kinds=-i'
noremap <F8> :!/usr/bin/ctags -R <C-R>=b:ctags_kinds<CR> --fields=+iaS --extra=+q .<CR>

"NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Binding for XPTemplate
let g:xptemplate_key = '<Tab>'

" Find replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>


" =============================================
" Syntastic
" =============================================
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F9> :SyntasticCheck<CR>
nnoremap <F10> :SyntasticToggleMode<CR>


set tags+=tags;$HOME
