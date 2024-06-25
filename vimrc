
set encoding=utf-8
"Plugins
call plug#begin('~/.vim/plugged')
Plug 'quafzi/vim-flow-diagram'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-emoji'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'turbio/bracey.vim'
Plug 'tribela/vim-transparent'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
call plug#end()
"initialize settings
filetype plugin off
syntax on
set tabstop=4
set hidden
set nu
set relativenumber
set hlsearch
set incsearch
set expandtab
set shiftwidth=4
set autoindent
set colorcolumn=80
set nocursorcolumn
set cursorlineopt=line
set cursorline
set mouse=a
set completeopt-=preview
set autoindent  
"setl noai nocin nosi inde=
"set foldmethod=manual
"set laststatus=0
set nopaste
set pastetoggle=<F8>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set completefunc=emoji#complete
colorscheme elflord


"maps
map <Leader><Space> :noh<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap bn : bnext <CR>
nnoremap bp : bprevious <CR>
nnoremap ,b :ls<CR>:buffer
nnoremap ,l : Files<CR>
nnoremap <C-l> : set laststatus=0<CR>
nnoremap <C-k> : set laststatus=2<CR>
nnoremap <C-o> : only<CR>

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" to markdowncell
nnoremap <Leader>m :IPythonCellToMarkdown<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap e :%s/:\([^:]\+\):/\=emoji#for(submatch(1), submatch(0))/g<CR>:noh<CR>
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
nmap <F9> :IPythonCellInsertAbove<CR>a
nmap <F10> :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
imap <F9> <C-o>:IPythonCellInsertAbove<CR>
imap <F10> <C-o>:IPythonCellInsertBelow<CR>

"autocmd
au bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sassc %:p %:r.css"
au BufNewFile *.ino r ~/.vim/template/arduino.ino
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

"colors
"hi CursorLine cterm=NONE ctermbg=NONE ctermfg=11
"hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE
"hi CursorColumn cterm=None ctermbg=52 ctermfg=20
"hi Normal ctermbg=NONE guibg=NONE
hi IPythonCell ctermbg=235
"autocommands
"augroup ipython_cell_highlight
"    autocmd!
"    autocmd ColorScheme * highlight IPythonCell ctermbg=238 guifg=darkgrey guibg=#444d56
"augroup END


"default values
let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
let g:gitgutter_sign_modified_removed = emoji#for('collision')


let g:snipMate = { 'snippet_version' : 1 }

let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 1
let g:livepreview_use_biber = 1
let g:bracey_server_port=4444
let g:UltiSnipsUsePythonVersion = 3
"Sayntax kontrolunu devredisi birak
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   

"Multicursor ayarlari
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:ipython_cell_cell_command="%paste "
" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
              \ 'socket_name': get(split($TMUX, ','), 0),
              "\ 'target_pane': '{bottom-right}' }
              "\ 'target_pane': '{top}' }
              \ 'target_pane': '{top-right}' }

let g:slime_dont_ask_default = 1

function KeyboardChange()
    let s:keylang=system('setxkbmap -query | tail -n 1 | cut -d " " -f6')
    if s:keylang == "us\n"
        :!setxkbmap tr 
        echo "tr atandi"
        let s:keylang="tr"
    else
        :!setxkbmap us
        echo "us atandi"
        let s:keylang="en"
    endif
endfunction 
command! KlavyeDegistir call KeyboardChange()

nmap <F12> :KlavyeDegistir<CR>


function SetPath()
    set path+=$PWD/**
    echo 'path guncellendi...'
    set path?
endfunction 

command! SetPath call SetPath()


command! Run call s:Run()
nmap <F5> :Run<CR>
function! s:Run()
  let e = expand("%:e")
  
  if e == "c"
    :Gcc
  endif

  if e == "cpp"
    :Cplusplus
  endif 

  if e == "py"
    :Python
  endif
  
  if e == "ino"
    :PlatformioCheck
  endif

  if e == "sh"
    :Bash
  endif

  if e == "html"
      :Bracey 
  endif 
endfunction

command! Python call s:Python()
function! s:Python()
  :!clear ; python %
endfunction

command! Gcc call s:Gcc()
function! s:Gcc()
  if has("win32") || has("win64")
    :!gcc % -o %:r.exe
    :!%:r.exe
  else
    :!clear ; gcc % -o %:r.out;./%:r.out
  endif
endfunction

command! Cplusplus call s:Cplusplus()
function! s:Cplusplus()
  :!g++ % -o %:r.out;./%:r.out
endfunction

command! PlatformioCheck call s:PlatformioCheck()
function! s:PlatformioCheck()
  if filereadable("platformio.ini")
    nmap <F6> :!pio run -t upload;screen /dev/ttyUSB0 115200;<CR>
    :!pio run;
  else
    echom "platformio.ini dosyasi bulunamadi!"
  endif
endfunction


command! Bash call s:Bash()
function! s:Bash()
  :!clear ; bash %;
endfunction

function! Girintile()
    let pos=getcurpos('.')
    normal! gg=G
    call setpos('.',pos)
endfunction
command! Girintile call Girintile()
nmap gr :Girintile<CR>

