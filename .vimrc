call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'arty88/sexy-railscasts-256-theme'
Plug 'jpo/vim-railscasts-theme'
Plug 'sheerun/vim-wombat-scheme'
Plug 'vim-airline/vim-airline'
call plug#end()

noremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

set backspace=indent,eol,start
inoremap <Char-0x07F> <c-r>=Backspace()<CR>
inoremap <BS> <c-r>=Backspace()<CR>

func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

""
"" Basic Setup
""
set nocompatible      " Use vim, no vi defaults
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" remap the leader key
let mapleader=","

if !has("gui_running")
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif



""
"" No fucking beeping
""
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

""
"" Whitespace
""
set softtabstop=2
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" remove trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text,ruby
  \ autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

""
"" Ignored file type
""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.orig
let NERDTreeIgnore = ['\.pyc$', '\.orig$']

""
"" List Characters
""
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:-            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter


""
"" Backup and swap files
""
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

""
"" Filetype Detection
""
if has("autocmd")
  filetype plugin indent on
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab
  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript
  " make Python whitespace
  au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

""
"" Key mappings
""

" make the timeout pretty fast
set timeout timeoutlen=300
" ,s to search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" Double tap j to exit insert mode
inoremap jj <Esc>
" Double tap , to go to previous file
nnoremap <leader><leader> <c-^>
" Use \ to toggle NERDTree
nnoremap \ :NERDTreeToggle %<CR>
" Don't lose selection after indenting block
vnoremap < <gv
vnoremap > >gv
" ENTER to hide highlighted search matches
nnoremap <CR> :nohlsearch<cr>

""
"" Style tweeks
""
set t_Co=256
colorscheme wombat
set cursorline
set number
highlight CursorLineNr ctermfg=200
highlight CursorLine   ctermbg=234
highlight Visual       ctermbg=3   ctermfg=0

""
"" Highlight lines > 80 characters
""
if exists('+colorcolumn')
  let &colorcolumn=join(range(81,999),",")
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

