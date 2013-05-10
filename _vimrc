set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

inoremap jk <esc>
inoremap kj <esc>

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'

" snipmate installation garbas/vim-snipmate
" Install dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"

" Install
Bundle "garbas/vim-snipmate"

filetype plugin indent on


" Tab specific options www.haskell.org/haskellWiki/Vim
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround
set nojoinspaces



let mapleader = ","
set scrolloff=5
set autoindent

" useful to add braces in normal mode around the word using leader
" combinations
" a = angle
" s = square
" d = curly
" f = parenthesis
noremap <Leader>9 bi(<Esc>ea)<Esc>
noremap <Leader>0 bi(<Esc>ea)<Esc>
noremap <Leader>f bi(<Esc>ea)<Esc>
noremap <Leader>{ bi{<Esc>ea}<Esc>
noremap <Leader>} bi{<Esc>ea}<Esc>
noremap <Leader>d bi{<Esc>ea}<Esc>
noremap <Leader>[ bi[<Esc>ea]<Esc>
noremap <Leader>] bi[<Esc>ea]<Esc>
noremap <Leader>s bi[<Esc>ea]<Esc>
noremap <Leader>< bi<<Esc>ea><Esc>
noremap <Leader>> bi<<Esc>ea><Esc>
noremap <Leader>a bi<<Esc>ea><Esc>
noremap <Leader>" bi"<Esc>ea"<Esc>
noremap <Leader>' bi'<Esc>ea'<Esc>
" end


" brackets and exclamation in insert mode
" type jj in insert mode while inside brackets to get out of them
" a >>= angle brackets
" s >>= square brackets
" d >>= dat ass >>= ass is curvy >>= curly brackets
" f >>= no explanation
" g >>= for deleting the accidental wrong brackets when you use on of the
" below commands like when you did <Leader>a and instead of <leader> b and you
" want to undo it do 
inoremap <Leader>a <><Esc>i
inoremap <Leader>s []<Esc>i
inoremap <Leader>d {}<Esc>i
inoremap <Leader>f ()<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap jj <Esc>%%a
inoremap ,g <Esc>xxa
" end

" abbrevations for monads in haskell
" ab mm >>=
" ab nn ->

"   remapping backspace"
inoremap ,. <BackSpace>
inoremap ., <BackSpace>

" remapping ,, to ctrl for intellisense
inoremap ,, <C-p>
