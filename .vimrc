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

" Insert Mode Key Bindings
imap <c-bs> <c-w>
