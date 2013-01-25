set t_Co=256

" Turn on line numbering. Turn it off with 'set nonu' 
set nu 

" Fix backspace when on the terminal...
set backspace=2

" Set plugin / syntax required options...
set nocompatible
filetype plugin on
syntax on

" Plugin-specific settings...

" START  neocomplcache
"let g:neocomplcache_enable_at_startup = 1 
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"let g:neocomplcache_dictionary_filetype_lists = { 
    "\ 'default' : '', 
    "\ 'vimshell' : $HOME.'/.vimshell_hist', 
    "\ 'scheme' : $HOME.'/.gosh_completions' 
    "\ } 

"if !exists('g:neocomplcache_keyword_patterns') 
    "let g:neocomplcache_keyword_patterns = {} 
"endif 
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*' 

"imap <C-k>     <Plug>(neocomplcache_snippets_expand) 
"smap <C-k>     <Plug>(neocomplcache_snippets_expand) 
"inoremap <expr><C-g>     neocomplcache#undo_completion() 
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

"noremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>" 
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>" 
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>" 
"inoremap <expr><C-y>  neocomplcache#close_popup() 
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"if !exists('g:neocomplcache_omni_patterns') 
    "let g:neocomplcache_omni_patterns = {} 
"endif 
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::' 
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" END neocomplecache

" Set personalized key settings...
let NERDComInsertMap='<c-c>'
let mapleader=","
nnoremap <F3> :let @/ = ""<CR>
set whichwrap+=<,>,h,l,[,]

" Indent automatically depending on filetype
filetype indent on
set autoindent

" 'Smart' case insensitive search
set ic
set sc

" Set tabs to four spaces + smart indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Add row / columnn information
set ruler

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Change colorscheme from default to delek
set background=dark
colorscheme zenburn

" Whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
