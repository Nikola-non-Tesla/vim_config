set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Plugin 'lifepillar/vim-gruvbox8'
Plugin 'valloric/youcompleteme'
Plugin 'puremourning/vimspector'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"tasto di leader
let mapleader = ' '


" Airline Config (Theme - monochrome - raven)
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" NERDThree Conifg
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F2> :NERDTreeToggle<CR>

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1 

"Tagbar Config
nmap <F3> :TagbarToggle<CR>

"GruvBox
"let g:gruvbox_contrast_dark='medium'

"Color
syntax enable
set background=dark
colorscheme gruvbox8
"colorscheme wal, gruvbox, forest-night

" Altre Configurazioni
set number
set relativenumber

"UltiSnips
" Tasti per UltraSnips.
"let g:UltiSnipsExpandTrigger="<s-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" :UltiSnipsEdit verticale.
let g:UltiSnipsEditSplit="vertical"

"Supertab
" Compatibilità tra YCM e UltiSnips (usando supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" Tasti per UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Posizione Snipped File 
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/ultisnips/UltiSnips"

"Spell Check
nmap <F6> :setlocal spell! spelllang=en_us,it<CR>

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Compilatore
augroup programming
	autocmd FileType c	nnoremap <buffer> <F5> :!clear && gcc -g -o %.bin % -lm && ./%.bin<CR>
	autocmd FileType tex 	nnoremap <buffer> <F5> :!clear && pdflatex %<CR>
	autocmd FileType cpp 	nnoremap <buffer> <F5> :!clear && g++ -o %.bin % && ./%.bin<CR>
	autocmd FileType python nnoremap <buffer> <F5> :!clear && python %<CR>
	autocmd FileType html 	nnoremap <buffer> <F5> :!$BROWSER %<CR>
	autocmd FileType bib	nnoremap <buffer> <F5> :!clear && bibtex %
augroup END

"Piegature nel file i3
augroup i3
	autocmd!
	autocmd BufWinLeave config mkview
	autocmd BufWinEnter config silent loadview
augroup END

filetype plugin indent on 

"Marcher in programmazione
"nmap <F6> :set foldmethod=marker<CR>

"Compatibilità YCM e Ultisnips
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

"urlview
"nnoremap <leader>u :silent w !xurls | uniq | dmenu -l 10 | xargs -r xdg-open<CR>

"carica il file default per avere la sintassi di c
au BufNewFile *.c 0r ~/.vim/defaultcode/default.c | let IndentStyle = "c"

"config debug (vimspector)
"let g:vimspector_enable_mapping = 'HUMAN'

nnoremap <leader>dd :call vimspector#Continue()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nmap <leader>dl <Plug>VimspectrorStepInto
nmap <leader>dj <Plug>VimspectrorStepOver
nmap <leader>dk <Plug>VimspectrorStepOut

nmap <leader>db <Plug>VimspectorToggleBreakpoint

"creo la fz gotowindow
fun! GoToWindow(id)
	call win_gotoid(a:id)
endfun
"comandi che uso per spstarmi tra le fineste
nnoremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<CR>

"comanid per passare da una schermata all'altra più velocemente
let i = 1 "premendo leader e il numero della schermata.
while i <= 9
	execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
        let i = i + 1
endwhile


"nmap <F7> <Plug>VimspectorToggleBreakpoint
"nmap <F9> <Plug>VimspectorPause
"nmap <F10> <Plug>VimspectorStepOver
"nmap <F11> <Plug>VimspectorStepInto

"au BufWinLeave * mkview
"nmap <F4> :silent loadview<CR>







let g:indentLine_enabled = 1
set encoding=utf-8
