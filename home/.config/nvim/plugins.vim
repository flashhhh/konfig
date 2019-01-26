call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/BufOnly.vim'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim'
" Plug 'mattn/emmet-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
" Plug 'Townk/vim-autoclose' it conflicts with good auto-completion behavior
Plug 'ap/vim-buftabline'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'alvan/vim-php-manual'
Plug 'beanworks/vim-phpfmt'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'

" Ack! by default. Don't jump to the first result
cnoreabbrev Ack Ack!

" Highlight search results
let g:ackhighlight = 1
" Use Ag as the back-end for Ack command
let g:ackprg = 'ag --vimgrep'

let g:buftabline_indicators = 1
let g:buftabline_numbers = 2

let g:AutoPairsMoveCharacter = ""

" Automatically close unused Fugitive buffer
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:delimitMate_expand_cr = 1

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:NERDTreeQuitOnOpen = 1

let g:LanguageClient_loggingFile = '/tmp/lc.txt'
let g:LanguageClient_autoStart = 0
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript.jsx': ['javascript-typescript-stdio'],
    \ 'php': ['php', '/Users/kirillrogovoy/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php'],
    \ }

let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_smart_case = 0

call deoplete#custom#option('auto_complete_delay', 100)
call deoplete#custom#option('auto_refresh_delay', 100)
call deoplete#custom#option('num_processes', -1)

let g:deoplete#sources = {}
" means enable all sources by default
let g:deoplete#sources._ = []
let g:deoplete#sources.php = ['phpcd', 'buffer', 'file', 'member']
let g:deoplete#sources.javascript = ['LanguageClient', 'file', 'buffer']
let g:deoplete#sources.typescript = ['LanguageClient', 'file', 'buffer']

let g:fzf_command_prefix = 'Fzf'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:phpfmt_autosave = 0

let g:LanguageClient_diagnosticsEnable = 0

let g:SignatureIncludeMarks = 'abcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ'

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.tsx set filetype=typescript.jsx
augroup END
