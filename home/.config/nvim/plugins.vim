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
Plug 'Townk/vim-autoclose'
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
Plug 'w0rp/ale'
Plug 'kshenoy/vim-signature'

call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'

" Ack! by default. Don't jump to the first result
cnoreabbrev Ack Ack!

" Open Ack and put the cursor in the right position
nnoremap <leader>g :Ack

" Highlight search results
let g:ackhighlight = 1
" Use Ag as the back-end for Ack command
let g:ackprg = 'ag --vimgrep'

let g:buftabline_indicators = 1
let g:buftabline_numbers = 2

let g:AutoPairsMoveCharacter = ""

" Automatically close unused Fugitive buffer
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:SuperTabDefaultCompletionType = "context"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:NERDTreeQuitOnOpen = 1

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'php': ['php', '/Users/kirillrogovoy/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php'],
    \ }

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#sources = {}
let g:deoplete#sources.php = ['LanguageClient']
let g:deoplete#sources.javascript = ['LanguageClient']
let g:deoplete#sources.typescript = ['LanguageClient']

let g:fzf_command_prefix = 'Fzf'

let g:phpfmt_autosave = 0

let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'php': ['php -l', 'phpcs'],
\   'go': ['golint', 'go build', 'go type', 'go vet', 'gosimple', 'staticcheck'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:LanguageClient_diagnosticsEnable = 0
