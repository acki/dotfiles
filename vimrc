colorscheme desert
syntax on
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set encoding=utf-8
set fileformat=unix
set scrolloff=1
"" Suchergebnisse hervorheben und schon beim Suchen anzeigen
set hlsearch
set incsearch
"" Verhalten der Rückschritttaste
set backspace=indent,eol,start
set vb "" visual bell
"" mac: ctrl + z auf undo mappen
nmap <D-Z> u
"" immer die Statuszeile mit dem Dateinamen anzeigen
set ls=2
"" zeigt unten links diverse Positionsinformationen der Schreibmarke
set ruler
"" zeigt beim Schließen von Klammern kurz an, wo sie geöffnet wurde
set showmatch


"" buf explorer
map L :split<CR>:BufExplorer<CR>
map l :BufExplorer<CR>

"" tabs
map ä :tabn<CR>
map ü :tabp<CR>
map ö :tabnew<CR>:BufExplorer<CR>
map $ :q<CR>
map - :e .<CR>
map _ :tabnew<CR>:e ~/.vimrc<CR>
"" \/ <fn>-
map + :tabnew<CR>:e ~/.vim/vimnotes<CR>
set showtabline=2
map <D-1> :GITDiff<CR><C-W>40>
map <D-2> :syntax off<CR>:syntax on<CR>
""map <silent> <D--> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <D-3> :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <D-6> :%s/ / /g<CR>
map <D-7> :nohlsearch<CR>
map <D-9> :prev<CR>
map <D-0> :next<CR>


"" misc
" toggle white-space
map W :set list!<CR>

"" highlighting
autocmd BufRead *.kss set filetype=css
autocmd BufRead *.css.dtml set filetype=css
autocmd BufRead *.zcml set filetype=xml
autocmd BufRead *.props set filetype=cfg

"" always switch working directory to directory of current file
autocmd BufEnter * lcd %:p:h

"" python
autocmd FileType python map <F5> :w<CR>:!python "%"<CR>
autocmd FileType php map <F5> :w<CR>:!php "%"<CR>
autocmd FileType tex map <F5> :w<CR>:!/usr/texbin/pdflatex "%";open *.pdf<CR>
"autocmd FileType php set tabstop=2
"autocmd FileType php set shiftwidth=2
"autocmd FileType php set softtabstop=2

"" folding
source ~/.vim/ftplugin/python_editing.vim
map f :source ~/.vim/ftplugin/python_editing.vim<CR>

"" highlight long lines (>81)
hi LineTooLong cterm=bold ctermbg=red guibg=darkGrey
match LineTooLong /\%>80v.\+/
""autocmd BufWinEnter,Syntax * exe "match LineTooLong /\\%>".&textwidth."v.\\+/"

"" highlightings
hi nose guibg=darkBlue
match nose /\cnose/
