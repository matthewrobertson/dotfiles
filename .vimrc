""
"" Basic Setup
""
set nocompatible      " Use vim, no vi defaults
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

" turn on pathogen
execute pathogen#infect()

" remap the leader key
let mapleader=","

""
"" Facebook Specific Stuff
""
if filereadable(expand("~/.fb.vimrc"))
  " make ctrlp root the current file only
  source ~/.fb.vimrc
endif

""
"" Ctrl-p stuff
""
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']

""
"" Ack.vim stuff
""
let g:ack_default_options = " -H --nocolor --nogroup --column"

""
"" NerdCommenter stuff
""
let NERDSpaceDelims=1
nnoremap ,c :call NERDComment(0,"toggle")<CR>
vnoremap ,c :call NERDComment(0,"toggle")<CR>

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
set listchars+=trail:.            " show trailing spaces as dots
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
" ,t to refresh and open fuzzy finder
map <leader>t :CtrlPClearCache<cr>\|:CtrlP<cr>
" ,f to open CtrP with word under cursor
map <leader>f :CtrlP<CR><C-\>w
" ,s to search and replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" bind K to grep word under cursor
:nnoremap K :Ack "\b<C-R><C-W>\b"<CR>
" Double tap j to exit insert mode
inoremap jj <Esc>
" Double tap , to go to previous file
nnoremap <leader><leader> <c-^>
" Use \ to toggle NERDTree
nnoremap \ :NERDTreeToggle<CR>
" Don't lose selection after indenting block
vnoremap < <gv
vnoremap > >gv
" ENTER to hide highlighted search matches
nnoremap <CR> :nohlsearch<cr>

""
"" Style tweeks
""
set t_Co=256
color wombat256mod
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

" set relativenumber    " Use relative line numbers
" highlight clear SignColumn
" highlight VertSplit    ctermbg=236
" highlight ColorColumn  ctermbg=237
" highlight LineNr       ctermbg=236 ctermfg=240
" highlight LineNr guibg=#222222 guifg=#666666 ctermbg=black ctermfg=grey
" highlight Normal guibg=#1B1B1B
" hi! VertSplit guifg=#333333 guibg=#333333 gui=NONE ctermfg=black ctermbg=black cterm=NONE
" highlight StatusLineNC ctermbg=238 ctermfg=0
" highlight StatusLine   ctermbg=240 ctermfg=12
" highlight IncSearch    ctermbg=0   ctermfg=3
" highlight Search       ctermbg=0   ctermfg=9
" highlight Pmenu        ctermbg=240 ctermfg=12
" highlight PmenuSel     ctermbg=0   ctermfg=3
" highlight SpellBad     ctermbg=0   ctermfg=1
" hi Directory guifg=#9CBA3F ctermfg=green
