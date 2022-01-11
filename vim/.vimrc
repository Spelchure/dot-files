execute pathogen#infect()
syntax on
filetype plugin indent on
set t_Co=256
set nu
set encoding=UTF-8
set guifont='Meslo\ LG\ M\ DZ\ Regular\ Nerd\ Font\ Complete\ 12'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" vim-fugitive git branch
let g:airline#extensions#branch#enabled=1

"NERDTree
nmap <C-n> :NERDTreeToggle<CR>

"GRUVBox theme
let g:gruvbox_italic=1
set bg=dark
autocmd vimenter * ++nested colorscheme gruvbox
