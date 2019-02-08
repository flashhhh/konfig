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

" Remap VIM 0 to first non-blank character
map 0 ^

" Open Ack and put the cursor in the right position
nnoremap <leader>g :Ack
" When you press gv you Ack after the selected text
vnoremap <silent> <leader>g :call VisualSelection('gv', '')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

nmap <F1> <Plug>BufTabLine.Go(1)
nmap <F2> <Plug>BufTabLine.Go(2)
nmap <F3> <Plug>BufTabLine.Go(3)
nmap <F4> <Plug>BufTabLine.Go(4)
nmap <F5> <Plug>BufTabLine.Go(5)
nmap <F6> <Plug>BufTabLine.Go(6)
nmap <F7> <Plug>BufTabLine.Go(7)
nmap <F8> <Plug>BufTabLine.Go(8)
nmap <F9> <Plug>BufTabLine.Go(9)
nmap § :b#<CR>

nmap <leader><F1> <F1><leader>bd
nmap <leader><F2> <F2><leader>bd
nmap <leader><F3> <F3><leader>bd
nmap <leader><F4> <F4><leader>bd
nmap <leader><F5> <F5><leader>bd
nmap <leader><F6> <F6><leader>bd
nmap <leader><F7> <F7><leader>bd
nmap <leader><F8> <F8><leader>bd
nmap <leader><F9> <F9><leader>bd

" Map incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

map <Right> :echo "Use l!"<CR>
map <Left> :echo "Use h!"<CR>
map <Up> :echo "Use k!"<CR>
map <Down> :echo "Use j!"<CR>

map - <Leader>c<Space>

map <Leader>n :noh<CR>
map <Leader>o :only<CR>

map <Leader>e :NERDTreeFind<CR>

let g:elm_setup_keybindings = 0

nmap <silent> <C-]> <Plug>(coc-definition)
nmap gr <Plug>(coc-rename)
nmap <silent> gu <Plug>(coc-references)
unmap <C-l>
imap <C-l> <Plug>(coc-snippets-expand)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" This works only if you do this:
" https://stackoverflow.com/a/42461580/4429540
inoremap <expr> <S-CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map <leader>p :FZF!<CR>
let g:fzf_history_dir = '~/tmp/fzf-history'

nmap <silent> }a <Plug>(coc-diagnostic-prev)
nmap <silent> {a <Plug>(coc-diagnostic-next)

" Helper functions

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
