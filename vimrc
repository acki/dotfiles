colorscheme desert
syntax on

set cursorline                      " highlight current line
highlight CursorLine guibg=#171717
set number                          " show line numbers
set encoding=utf-8                  " default encoding
set fileformat=unix                 " default file format
set scrolloff=1
set backspace=indent,eol,start      " backspace should work as expected
set vb                              " visual bell
set ls=2                            " show filename in statusbar
set ruler                           " show position in statusbar
set showmatch                       " show closing brackets
    " do not edit files of these types
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp
autocmd BufEnter * lcd %:p:h        " always switch working directory to directory of current file
    "" highlight long lines (>81)
hi LineTooLong cterm=bold ctermbg=red guibg=black
match LineTooLong /\%>80v.\+/

" macvim
let macvim_skip_cmd_opt_movement = 1
no   <D-Left>       <Home>
no!  <D-Left>       <Home>
no   <D-Right>      <End>
no!  <D-Right>      <End>
no   <D-Up>         <C-Home>
ino  <D-Up>         <C-Home>
no   <D-Down>       <C-End>
ino  <D-Down>       <C-End>


" INDENTING SETTINGS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
" Indent/Dedent with Tab
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >gv
vnoremap <S-Tab> <LT>gv


" SEARCH SETTINGS
set hlsearch
set incsearch


" GUI SETTINGS
if has("gui_running")
"    set columns=170
"    set lines=51
    set guioptions-=T               " disable toolbar
    set guioptions-=M               " disable menu bar
    set guioptions+=c               " use console dialogs
endif
" Map F2 to add/remove GUI options.
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
                      \set guioptions-=T <Bar>
                      \set guioptions-=m <Bar>
                    \else <Bar>
                      \set guioptions+=T <Bar>
                      \set guioptions+=m <Bar>
                    \endif<CR>
" Map F3: Switch to bigger resolution / set new window size
if has("gui_running")
    map <silent> <F3> :set lines=66<CR>
endif

" TABS
map ä :tabn<CR>
map ü :tabp<CR>
map $ :q<CR>
map - :e .<CR>
set showtabline=2                   " always show tab bar

" SPLITS
" ... move cursor around
nmap <A-LEFT> <C-W><LEFT>           " move left
nmap <A-RIGHT> <C-W><RIGHT>         " move right
nmap <A-UP> <C-W><UP>               " move up
nmap <A-DOWN> <C-W><DOWN>           " move down
" ... resize
nmap <A-D-LEFT> <C-W><              " decrease width
nmap <A-D-RIGHT> <C-W>>             " increase width
nmap <A-D-UP> 2<C-W>-               " decrease height
nmap <A-D-DOWN> 2<C-W>+             " increase height
nmap <A-D-CR> 1000<C-W>>1000<C-W>+  " maximize window
" ... move / rotate windows
nmap <A-D-C-LEFT><LEFT> <C-W>r      " retate windows
nmap <A-D-C-LEFT><RIGHT> <C-W>R     " reverse rotate windows
nmap <A-D-C-RIGHT> <C-W>x           " exchange window with next one
nmap <A-D-C-UP><UP> <C-W>K          " move to top
nmap <A-D-C-UP><DOWN> <C-W>J        " move to bottom
nmap <A-D-C-UP><LEFT> <C-W>H        " move to left
nmap <A-D-C-UP><RIGHT> <C-W>L       " move to right 


" VARIOUS MAPPINGS
let maplocalleader = ","
    " notes folder
map <D-2> :tabnew<CR>:e ~/Documents/notes<CR>:lcd ~/Documents/notes<CR>
    " reload .vimrc
map <D-3> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
    " Mac+[4-6] : edit various note files
map <D-4> :tabnew<CR>:e ~/Documents/notes/vim/note1.txt<CR>
map <D-5> :tabnew<CR>:e ~/Documents/notes/vim/note2.txt<CR>
map <D-6> :tabnew<CR>:e ~/Documents/notes/vim/note3.txt<CR>
    " stop highlighting
map <D-7> :nohlsearch<CR>
    " Mac: replace bad ctrl-space spaces with normal spaces
map <D-8> :%s/ / /g<CR>
    " toggle white-space
map W :set list!<CR>
    " _ : edit vimrc
map _ :tabnew<CR>:e ~/.vimrc<CR>
    " + : edit vimnotes
map + :tabnew<CR>:e ~/.vim/vimnotes<CR>

"" logging, zope, python
map lo :!~/.bin/taillog<CR>
map lp :!~/.bin/taillog open<CR>
map zr :!~/.bin/restartzope<CR>
map zo :!~/.bin/stopzope<CR>
map <A-D-p> <ESC>oimport pdb;pdb.set_trace()


"" HIGHLIGHTING
autocmd BufRead *.kss set filetype=css
autocmd BufRead *.css.dtml set filetype=css
autocmd BufRead *.zcml set filetype=xml
autocmd BufRead *.props set filetype=cfg
autocmd BufRead *.txt set filetype=doctest


"" FILETYPE (EXECUTE)
autocmd FileType python map <F5> :w<CR>:!python2.5 "%"<CR>
autocmd FileType php map <F5> :w<CR>:!php "%"<CR>
autocmd FileType tex map <F5> :w<CR>:!/usr/texbin/pdflatex "%";/usr/texbin/pdflatex "%";open %:r.pdf<CR>
autocmd FileType tex map <F4> :w<CR>:!clearLatexCache<CR>
au BufNewFile,BufRead *.textile setf textile


" ---------------------------
" PLUGIN: BUFEXPLORER.VIM
map ll :BufExplorer<CR>
map lh :split<CR>:BufExplorer<CR>
map lL :split<CR>:BufExplorer<CR>
map lv :vsplit<CR>:BufExplorer<CR>
map ö :tabnew<CR>:BufExplorer<CR>


" ---------------------------
" PLUGIN: PYTHON_EDITING.VIM 
source ~/.vim/ftplugin/python_editing.vim
map f :source ~/.vim/ftplugin/python_editing.vim<CR>


" ---------------------------
" PLUGIN: PYDOC.VIM
" <F1> calls Pydoc
noremap <F1> :call ShowPyDoc('<C-R><C-A>', 1)<CR> 


" ---------------------------
" PLUGIN: ROJECT.VIM
nmap <silent> <C-p> <Plug>ToggleProject


" ---------------------------
" PLUGIN: VCSPLUGIN.VIM
let VCSCommandMapPrefix = 'è'

" ---------------------------
" PLUGIN: GREP.VIM
let Grep_Skip_Dirs = '.svn'
let Grep_Default_Options = '-i'
nmap gg :Bgrep 
nmap gG :tabnew<CR>:Bgrep 
    " grep notes
nmap gn :exe 'Grep -r ' . input('Pattern:') . ' ~/Documents/notes'<CR>

