
set nu
set expandtab
set ic
set tabstop=4
set mouse=nv
set t_Co=256
set shiftwidth=2
set hlsearch
syntax on
execute pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim

colorscheme Tomorrow-Night

"fixed c.vim cErrInParen and cErrInBracket
hi cErrInParen term=bold ctermfg=245 gui=bold guifg=#969896
hi cErrInBracket term=bold ctermfg=245 gui=bold guifg=#969896


nnoremap <F11> :wincmd p<CR>
nnoremap <F12> :Tlist<CR>
nnoremap <F5>  :NERDTree<CR>
nnoremap <C-n> :tabnew<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
map <F6> :!cscope -Rbq<CR>:cs reset<CR><CR>


"cscope-----------------

if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
"set csverb
"set cscopetag
"set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

nmap <c-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <c-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <c-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <c-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>


"NerdTree---------------
let g:NERDTreeWinPos = "rigth"

"Ctrlp------------------
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*.o

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END
