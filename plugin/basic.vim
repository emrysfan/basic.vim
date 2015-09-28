" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700 

" Mac OS X clipboard sharing
set clipboard=unnamed

" Show line number
set number

" Diff vertically
set diffopt=vertical

" highlight current line
" set cursorline

" change default vsplit separator
set fillchars+=vert:\ 


set hidden

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
noremap <leader>s :w!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to :(command)
map <space> :

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><CR> :noh<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen
  " set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Vimgreps in the current file
noremap <leader>g :vimgrep /<C-R><C-W>/ <C-R>%<CR>
noremap <leader>f :Ack <C-R><C-W><CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encoding gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
" Quickly open a buffer for scripbble
noremap <leader>b :tabnew ~/.buffer<CR>

" Toggle paste mode on and off
noremap <leader>p :setlocal paste!<CR>

" Read Ex commands from ~/.vimrc
" noremap <leader>s :source ~/.vimrc<CR>

" Open a window to show current result when excute a quickfix command
autocmd QuickFixCmdPost * :copen


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    let l:filename = expand(@%)

    if a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/ ' . l:filename)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Preview window on the bottom
function! PreviewDown()
    if !&previewwindow 
        silent! wincmd P 
    endif 
    if &previewwindow 
        silent! wincmd J 
        silent! wincmd p 
    endif 
endf
au BufWinEnter * call PreviewDown()

autocmd FileType * set sw=2
autocmd FileType ruby set sw=2
autocmd FileType python set sw=4
autocmd FileType objc set sw=4
autocmd FileType go set sw=4

noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>t :TagbarToggle<CR>
noremap <Leader>m :CtrlPMRUFiles<CR>

let g:molokai_original = 1
let g:rehash256 = 1
let g:airline_exclude_preview = 1
set background=dark
colorscheme molokai

let g:go_fmt_command = 'goimports'
let g:neocomplete#enable_at_startup = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1

" Vim-go Mappings
au FileType go nnoremap <leader>gr :GoRun<CR>
au FileType go nnoremap <leader>ge :GoRename<CR>
au FileType go nnoremap <leader>gb :GoBuild<CR>
au FileType go nnoremap <leader>gt :GoTest<CR>
au FileType go nnoremap <leader>gi :GoInfo<CR>
au FileType go nnoremap <leader>gs :GoImplements<CR>

noremap <Leader> <Plug>(easymotion-prefix)
nmap <Leader>w <Plug>(easymotion-bd-w)
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-sn)

let g:syntastic_javascript_checker = "jshint"

let g:ctrlp_open_new_file = 't'

let g:ctrlp_custom_ignore = {
      \ 'dir': 'node_modules',
      \ }

autocmd FileType ruby nmap <leader>r :'<,'>w !ruby<cr>
autocmd FileType ruby nmap <leader>r :'<,'>w !python<cr>

hi StatusLineNC term=bold,reverse cterm=bold,reverse ctermfg=232 ctermbg=239 gui=bold,reverse guifg=#455354 guibg=fg
hi StatusLine term=bold,reverse cterm=bold,reverse ctermfg=28 ctermbg=15 gui=bold,reverse guifg=#455354 guibg=fg

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        exec t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

nnoremap <leader>q :qa<CR>

autocmd FileType ruby nmap <leader>r :w !ruby<CR>
autocmd FileType ruby vmap <leader>r :'<,'>:w !ruby<CR>
autocmd FileType javascript nmap <leader>r :w !babel \|node<CR>
autocmd FileType javascript vmap <leader>r :'<,'>:w !babel \|node<CR>
autocmd FileType python nmap <leader>r :w !python<CR>
autocmd FileType python vmap <leader>r :'<,'>:w !python<CR>
