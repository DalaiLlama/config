set nocompatible              " be iMproved, required

" =============================================
" Plugins
" =============================================
"
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

"Visual
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'

"Git
Plugin 'tpope/vim-fugitive'

"Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t' "Fuzzy find

"C++
Plugin 'simplyzhao/cscope_maps.vim'

Plugin 'Valloric/YouCompleteMe'

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
"
" "Snippets
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"Comments
Plugin 'tomtom/tcomment_vim'

"Development
Plugin 'derekwyatt/vim-fswitch'
" Plugin 'scrooloose/syntastic'

"Misc
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on



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
" setlocal spell spelllang=en_us
setlocal spelllang=en_us

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

" Airline configuration
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

" " Map key to toggle opt
" function MapToggle(key, opt)
"  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
"  exec 'nnoremap '.a:key.' '.cmd
"  exec 'inoremap '.a:key." \<C-O>".cmd
" endfunction
" command -nargs=+ MapToggle call MapToggle(<f-args>)
" MapToggle <F2> hlsearch

" =============================================
" Tag list
" =============================================
"
let Tlist_Use_Right_Window   = 1
let Tlist_WinWidth = 50
nnoremap <F2> :TlistToggle<CR>

set pastetoggle=<F3>

" Remove unwanted white spaces
map <F4> :%s/\s\+$//gc<CR>

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
autocmd FileType c,cpp  let b:ctags_kinds = '--c++-kinds=+p'
autocmd FileType c,cpp  let b:cscope_kinds = '-name "*.c" -or -name "*.cpp" -or -name "*.h" -or -name "*.hpp"'
autocmd FileType java   let b:ctags_kinds = '--java-kinds=+p'
autocmd FileType java   let b:cscope_kinds = '-name "*.java" -or -name "*.aidl"'
autocmd FileType python let b:ctags_kinds = '--python-kinds=-i'
noremap <F5> :!/usr/bin/ctags -R <C-R>=b:ctags_kinds<CR> --fields=+iaS --exclude='.git' --extra=+q . ; find . -type f \( <C-R>=b:cscope_kinds<CR> \) > cscope.files ; cscope -b<CR>

"NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" Binding for XPTemplate
let g:xptemplate_key = '<Tab>'

" Find replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" nnoremap <Leader>R :bufdo %s/\<<C-r><C-w>\>//gce | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>


" =============================================
" Syntastic
" =============================================
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <F7> :SyntasticToggleMode<CR>
" nnoremap <F8> :SyntasticCheck<CR>

map <C-h> 4zh " Scroll 4 characters to the left
map <C-l> 4zl " Scroll 4 characters to the right

" =============================================
" You Complete Me
" =============================================
"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
" " Don't load ycm
" let g:loaded_youcompleteme = 1

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:nerdtree_plugin_open_cmd = 'gnome-open'

" =============================================
" You Complete Me
" =============================================
"
"Switch to the file and load it into the current window >
nmap <silent> <Leader>of :FSHere<cr>
<
"Switch to the file and load it into the window on the right >
nmap <silent> <Leader>ol :FSRight<cr>
<
"Switch to the file and load it into a new window split on the right >
nmap <silent> <Leader>oL :FSSplitRight<cr>
<
"Switch to the file and load it into the window on the left >
nmap <silent> <Leader>oh :FSLeft<cr>
<
"Switch to the file and load it into a new window split on the left >
nmap <silent> <Leader>oH :FSSplitLeft<cr>
<
"Switch to the file and load it into the window above >
nmap <silent> <Leader>ok :FSAbove<cr>
<
"Switch to the file and load it into a new window split above >
nmap <silent> <Leader>oK :FSSplitAbove<cr>
<
"Switch to the file and load it into the window below >
nmap <silent> <Leader>oj :FSBelow<cr>
<
"Switch to the file and load it into a new window split below >
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

set tags+=tags;$HOME
