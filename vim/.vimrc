for f in split(glob('~/.vim/rc/*.vim'), '\n')
    exe 'source' f
endfor
