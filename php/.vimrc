" Use spaces instead of tabs for indentation
set expandtab

" Use 4 spaces for indentation
set shiftwidth=4

" Set tabs to be equivalent to 4 spaces (fixes retab)
set tabstop=4

" Round all indentations to multiple of shiftwidth
set shiftround

" Indent the next line similiar to current line
set autoindent

" Use same indentation characters as current line
set copyindent

" Remove all unwanted whitespaces on save
autocmd BufWritePre * :%s/\r\+$//e " Windows newlines
autocmd BufWritePre * :%s/\s\+$//e
