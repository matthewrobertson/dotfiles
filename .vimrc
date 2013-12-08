" turn on pathogen
execute pathogen#infect()

" remap the leader key
let mapleader=","

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" No fucking beeping
""

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"
"" facebook-specific
"

if $ADMIN_SCRIPTS == ""
  let $ADMIN_SCRIPTS = "/mnt/vol/engshare/admin/scripts"
endif
set runtimepath+=$ADMIN_SCRIPTS/vim

" error log, hzhao's nemo
" TODO: can we make these more specifically depend on the error file
"   (like only 'vim -q blah.nemo' would try the nemo errorformat)
set errorformat+=%.%#PHP:\ %m\ \(in\ %f\ on\ line\ %l\)%.%#,
  \%E%[0-9]%#.%m:%f?rev=%.%##L%l\ %.%#,%C%.%#

" automatically load svn-commit template
if $SVN_COMMIT_TEMPLATE == ""
  let $SVN_COMMIT_TEMPLATE = "$ADMIN_SCRIPTS/templates/svn-commit-template.txt"
endif
autocmd BufNewFile,BufRead svn-commit.*tmp :0r $SVN_COMMIT_TEMPLATE

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

autocmd FileType c,cabal,cpp,haskell,javascript,php,python,readme,text
  \ autocmd BufWritePre <buffer>
  \ :call <SID>StripTrailingWhitespaces()

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
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
nnoremap <CR> :nohlsearch<cr>     " ENTER to hide highlighted search matches

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

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
" Double tap j to exit insert mode
inoremap jj <Esc>
" Double tap , to go to previous file
nnoremap <leader><leader> <c-^>
" Use \ to toggle NERDTree
nnoremap \ :NERDTreeToggle<CR>

"
" Style tweeks
"

" color distinguished
" highlight LineNr guibg=#222222 guifg=#666666 ctermbg=black ctermfg=grey
" highlight Normal guibg=#1B1B1B
" hi! VertSplit guifg=#333333 guibg=#333333 gui=NONE ctermfg=black ctermbg=black cterm=NONE
" hi Directory guifg=#9CBA3F ctermfg=green
set cursorline

color molokai
let g:molokai_original = 1
" set background=dark
" 
" highlight clear SignColumn
" highlight VertSplit    ctermbg=236
" highlight ColorColumn  ctermbg=237
" highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=234
" highlight StatusLineNC ctermbg=238 ctermfg=0
" highlight StatusLine   ctermbg=240 ctermfg=12
" highlight IncSearch    ctermbg=0   ctermfg=3
" highlight Search       ctermbg=0   ctermfg=9
highlight Visual       ctermbg=3   ctermfg=0
" highlight Pmenu        ctermbg=240 ctermfg=12
" highlight PmenuSel     ctermbg=0   ctermfg=3
" highlight SpellBad     ctermbg=0   ctermfg=1
