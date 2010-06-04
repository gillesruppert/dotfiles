" proper hightlighting, formatting, etc
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Execute file being edited with <Meta> + r:
map <buffer> <s-e> :w<CR>:!/usr/bin/env python % <CR>

