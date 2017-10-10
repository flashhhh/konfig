execute pathogen#infect()
call pathogen#helptags()

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
map <leader>w :w!<cr>
" Fast leaving
map <leader>qq :q!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Turn on the WiLd menu - needed for good code completion exprerience
set wildmenu

" Height of the command bar
set cmdheight=1

" Ignore compiled files
" set wildignore=*.o,*~,*.pyc
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Enable syntax highlighting
syntax enable
let g:solarized_contrast="low"
let g:solarized_termtrans=0
set background=dark
colorscheme solarized

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Force 2 spaces in javascript files
au FileType javascript setl sw=2 sts=2 et

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map ` <C-W><C-W>

" Close the current buffer
map <leader>bd :Bclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Close all buffers except the current
map <leader>bo :Bonly<cr>

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=1
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Ack! by default. Don't jump to the first result
cnoreabbrev Ack Ack!

" When you press gv you Ack after the selected text
vnoremap <silent> <leader>g :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
nnoremap <leader>g :Ack

" Highlight search results
let g:ackhighlight = 1
" Use Ag as the back-end for Ack command
let g:ackprg = 'ag --vimgrep'

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

set number

if has("mac") || has("macunix")
    set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=/tmp/
    set undofile
catch
endtry

" Include dotfiles to CtrlP results
let g:ctrlp_dotfiles = 1

" Change default mappings for CtrlP
" let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_map = '<Leader>p'
map <Leader>P :CtrlPBuffer<CR>

" Enable JSDoc highlight
let g:javascript_plugin_jsdoc = 1
set statusline+=%#StatusLineNC#
set statusline+=\ %f\ %r\ %q
set statusline+=\ %{tagbar#currenttag('%s','','f')}
set statusline+=%=
set statusline+=%#Search#
set statusline+=\ %l:%v/%L
set statusline+=\ %#ErrorMsg#
set statusline+=\ %{ale#statusline#Count(bufnr('')).error}
set statusline+=\ |

let g:buftabline_indicators = 1
let g:buftabline_numbers = 2
hi! def link BufTabLineCurrent StatusLine
hi! def link BufTabLineFill    None
hi! def link BufTabLineActive  StatusLineNC
hi! def link BufTabLineHidden  StatusLineNC

hi! def link CursorLine StatusLineNC

let g:AutoPairsMoveCharacter = ""
map <F1> <Plug>BufTabLine.Go(1)
map <F2> <Plug>BufTabLine.Go(2)
map <F3> <Plug>BufTabLine.Go(3)
map <F4> <Plug>BufTabLine.Go(4)
map <F5> <Plug>BufTabLine.Go(5)
map <F6> <Plug>BufTabLine.Go(6)
map <F7> <Plug>BufTabLine.Go(7)
map <F8> <Plug>BufTabLine.Go(8)
map <F9> <Plug>BufTabLine.Go(9)
map § :b#<CR>

let g:ale_lint_on_enter = 0


" Map incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

" map <Right> :bnext<CR>
" map <Left> :bprev<CR>
map <Right> :echo "Use l!"<CR>
map <Left> :echo "Use h!"<CR>
map <Up> :echo "Use k!"<CR>
map <Down> :echo "Use j!"<CR>

" Automatically close unused Fugitive buffer
autocmd BufReadPost fugitive://* set bufhidden=delete

" Vertical splits by default
set dip=vertical

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

map - <Leader>c<Space>

set completeopt-=preview
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:easytags_auto_highlight = 0
let g:easytags_async = 1
let g:easytags_suppress_ctags_warning = 1

autocmd FileType javascript map <C-]> :TernDef<CR>
autocmd FileType go map <C-]> <Plug>(go-def)

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'php': ['php -l', 'phpcs'],
\   'go': ['golint', 'go build', 'go type', 'go vet', 'gosimple', 'staticcheck'],
\}

let g:ale_php_phpcs_standard = '~/Projects/rs/ruleset.xml'
let g:phpfmt_standard = '~/Projects/rs/ruleset.xml'

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0

nmap <silent> }a <Plug>(ale_next_wrap)
nmap <silent> {a <Plug>(ale_previous_wrap)


let g:vdebug_options = {}
let g:vdebug_options['port'] = 14090
let g:vdebug_options['path_maps'] = {"/srv/www/kro/rs": "/Users/kirillrogovoy/Projects/rs"}
let g:vdebug_keymap = {
\    "run" : "<leader><F5>",
\    "run_to_cursor" : "<leader><F9>",
\    "step_over" : "<leader><F2>",
\    "step_into" : "<leader><F3>",
\    "step_out" : "<leader><F4>",
\    "close" : "<leader><F6>",
\    "detach" : "<leader><F7>",
\    "set_breakpoint" : "<leader><F10>",
\    "get_context" : "<leader><F11>",
\    "eval_under_cursor" : "<leader><F12>",
\    "eval_visual" : "<Leader>e",
\}

let g:ctrlp_user_command = ['.git', 'bash -c "cd %s && git ls-files -co --exclude-standard"']

set ttyfast

set spell
set spell spelllang=en_us

map <Leader>n :noh<CR>
map <Leader>o :only<CR>

map <Leader>e :NERDTreeFind<CR>
set clipboard=unnamed
let g:SuperTabDefaultCompletionType = "context"
let g:go_fmt_command = "goimports"
" set updatetime=100
let g:go_fmt_fail_silently = 1

let g:NERDTreeQuitOnOpen = 1

set notimeout

function! PhpSyntaxOverride()
  hi! def link phpParent      None
  hi! def link phpIdentifier  None
  hi! def link phpVarSelector None
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

map <leader>t :TagbarOpenAutoClose<CR>

" set re=1

""" END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
