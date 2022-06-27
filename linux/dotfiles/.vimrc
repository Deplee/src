filetype on
set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" PLUGINS
" Atom One Dark / Light theme.
Plugin 'rakr/vim-one'

" Gruvbox Community theme.
Plugin 'gruvbox-community/gruvbox'

" Better manage Vim sessions.
Plugin 'tpope/vim-obsession'

" Zoom in and out of a specific split pane (similar to tmux).
Plugin 'dhruvasagar/vim-zoom'

" Navigate and manipulate files in a tree view.
Plugin 'lambdalisue/fern.vim'
Plugin 'lambdalisue/fern-mapping-mark-children.vim'

" Helpers for moving and manipulating files / directories.
Plugin 'tpope/vim-eunuch'

" Run a diff on 2 directories.
Plugin 'will133/vim-dirdiff'

" Run a diff on 2 blocks of text.
Plugin 'AndrewRadev/linediff.vim'

" Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plugin 'inkarkat/vim-ingo-library' | Plugin 'inkarkat/vim-SpellCheck'

" Briefly highlight which text was yanked.
Plugin 'machakann/vim-highlightedyank'

" Highlight which character to jump to when using horizontal movement keys.
Plugin 'unblevable/quick-scope'

" Modify * to also work with visual selections.
Plugin 'nelstrom/vim-visual-star-search'

" Automatically clear search highlights after you move your cursor.
Plugin 'haya14busa/is.vim'

" Handle multi-file find and replace.
Plugin 'mhinz/vim-grepper'

" Better display unwanted whitespace.
Plugin 'ntpeters/vim-better-whitespace'

" Toggle comments in various ways.
Plugin 'tpope/vim-commentary'

" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plugin 'tpope/vim-sleuth'

" A number of useful motions for the quickfix list, pasting and more.
Plugin 'tpope/vim-unimpaired'

" Drastically improve insert mode performance in files with folds.
Plugin 'Konfekt/FastFold'

" Show git file changes in the gutter.
Plugin 'mhinz/vim-signify'

" Dim paragraphs above and below the active paragraph.
Plugin 'junegunn/limelight.vim'

" Distraction free writing by removing UI elements and centering everything.
Plugin 'junegunn/goyo.vim'

" A bunch of useful language related snippets (ultisnips is the engine).
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'

" Automatically show Vim's complete menu while typing.
Plugin 'vim-scripts/AutoComplPop'

" Run test suites for various languages.
Plugin 'janko/vim-test'

" Languages and file types.
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chr4/nginx.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-toml', { 'branch': 'main' }
Plugin 'godlygeek/tabular' | Plugin 'tpope/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
"Plugin 'pylipp/vim-markdown-preview', { 'branch': 'bugfix/firefox' }
Plugin 'jvirtanen/vim-hcl'
Plugin 'lifepillar/pgsql.vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-rails'
Plugin 'vim-python/python-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wgwoods/vim-systemd-syntax'
Plugin 'towolf/vim-helm'
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"OTHER
" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" Enable syntax highlighting.
syntax on

" Specific colorscheme settings (must come before setting your colorscheme).
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme.
colorscheme gruvbox
set background=dark

" Specific colorscheme settings (must come after setting your colorscheme).
if (g:colors_name == 'gruvbox')
  if (&background == 'dark')
    hi Visual cterm=NONE ctermfg=NONE ctermbg=237 guibg=#3a3a3a
  else
    hi Visual cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi CursorLine cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
    hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=228 guibg=#f2e5bc
  endif
endif

" Spelling mistakes will be colored up red.
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
"changes for bashsupport
let mapleader=" "
"let maplocalleader=" "

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Using iTerm2? Go-to preferences / profile / colors and disable the smart bar
" cursor color. Then pick a cursor and highlight color that matches your theme.
" That will ensure your cursor is always visible within insert mode.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=/tmp//,.
set clipboard=unnamedplus,unnamed
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cursorline
set directory=/tmp//,.
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set modelines=2
set mouse=a
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number relativenumber
set regexpengine=1
set ruler
set scrolloff=0
set shiftwidth=2
set showcmd
set showmatch
set shortmess+=c
set showmode
set smartcase
set softtabstop=2
set spelllang=en_us
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set ttyfast
if !has('nvim')
  set ttymouse=sgr
endif
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"



runtime! macros/matchit.vim

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Toggle spell check.
nnoremap <F5> :setlocal spell!<CR>
inoremap <F5> <C-o>:setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nnoremap <F6> :set relativenumber!<CR>
inoremap <F6> <C-o>:set relativenumber!<CR>

" Copy the current buffer's path to your clipboard.
nmap cp :let @+ = expand("%")<CR>

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Toggle visually showing all whitespace characters.
nnoremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

" Toggle quickfix window.
function! QuickFix_toggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor

    copen
endfunction
nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" Convert the selected text's title case using the external tcc script.
"   Requires: https://github.com/nickjj/title-case-converter
vnoremap <Leader>tc c<C-r>=system('tcc', getreg('"'))[:-2]<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting.
autocmd BufNewFile,BufRead .*aliases* set ft=sh

" Make sure Kubernetes yaml files end up being set as helm files.
au BufNewFile,BufRead *.{yaml,yml} if getline(1) =~ '^apiVersion:' || getline(2) =~ '^apiVersion:' | setlocal filetype=helm | endif

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Mappings to make Vim more friendly towards presenting slides.
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction

" ----------------------------------------------------------------------------
" Basic commands
" ----------------------------------------------------------------------------

" Allow files to be saved as root when forgetting to start Vim using sudo.
command Sw :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR>

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber | call FernInit()
augroup END

" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys.
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']

" Only underline the highlights instead of using custom colors.
highlight QuickScopePrimary gui=underline cterm=underline
highlight QuickScopeSecondary gui=underline cterm=underline

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" .............................................................................
" ntpeters/vim-better-whitespace
" .............................................................................

let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" .............................................................................
" Konfekt/FastFold
" .............................................................................

let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

" .............................................................................
" 'JamshedVesuna/vim-markdown-preview'
" .............................................................................

let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_hotkey='<C-m>'

" .............................................................................
" SirVer/ultisnips
" .............................................................................

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" .............................................................................
" janko/vim-test
" .............................................................................
