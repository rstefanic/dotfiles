" General Settings
set tabstop=2 
set shiftwidth=2 
set softtabstop=4
set expandtab

" Environment Setup
syntax on
set number
set showcmd
set ruler
set laststatus=2
set textwidth=80

" Remove Backup and Swap
set noswapfile
set nobackup
set nowritebackup

" Normal Mode Bindings
nmap <c-s> :w<CR>
nmap <c-a> <ESC>gg"+yG
nmap <c-p> "+p
nmap <c-y> "+y

" Normal Mode Function Calls & Binds
nmap <c-1> :call Fullrow()<CR>
nmap <c-2> :call Halfrow()<CR>
nmap <c-3> :call Thirds()<CR>

" Insert Mode Key Bindings
imap <c-bs> <c-w>

" Paste HTML Text Functions
function! Fullrow() 
    r~/.vim/snippets/full-row.txt
endfunction

function! Halfrow()
    r~/.vim/snippets/half-row.txt
endfunction

function! Thirds()
    r~/.vim/snippets/thirds.txt
endfunction
