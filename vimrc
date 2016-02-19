set nocompatible              " be iMproved, required

" =============================================
" Plugins
" =============================================
"
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'aufgang001/vim-nerdtree_plugin_open'
Plugin 'sheerun/vim-polyglot'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'

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
set colorcolumn=100
set textwidth=100

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
if $THEME == "light"
    set background=light
else
    set background=dark
endif
colorscheme solarized


" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" =============================================
" Functionality
" =============================================
"
" Copy/paste between vim sessions
set clipboard=unnamedplus

" Automatically reload vimrc file
"autocmd! BufWritePost ~/.vimrc nested :source ~/.vimrc

" Recognise *.md flies as markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Allow Alt key bindings
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50


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

" " Commenting blocks of code.
" let b:comment_leader ='// '
" autocmd FileType c,cpp,java,scala,php   let b:comment_leader = '// '
" autocmd FileType sh,ruby,python         let b:comment_leader = '# '
" autocmd FileType fortran                let b:comment_leader = '! '
" autocmd FileType conf,fstab             let b:comment_leader = '# '
" autocmd FileType tex,matlab             let b:comment_leader = '% '
" autocmd FileType mail                   let b:comment_leader = '> '
" autocmd FileType vim                    let b:comment_leader = '" '
" " mapping
" noremap <silent> <Leader>j :<C-B>silent<C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> <Leader>k :<C-B>silent<C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

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


" ctags shortcut
autocmd FileType c,cpp          let b:ctags_kinds = '--c++-kinds=+p'
autocmd FileType java           let b:ctags_kinds = '--java-kinds=+p'
autocmd FileType python         let b:ctags_kinds = '--python-kinds=-i'
noremap <F8> :!/usr/bin/ctags -R <C-R>=b:ctags_kinds<CR> --fields=+iaS --exclude='.git' --extra=+q .<CR>

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


" =============================================
" You Complete Me
" =============================================
"
let g:ycm_confirm_extra_conf = 0
" Don't load ycm
let g:loaded_youcompleteme = 1

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:nerdtree_plugin_open_cmd = 'gnome-open'

set tags+=tags;$HOME
