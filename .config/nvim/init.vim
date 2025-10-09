" https://github.com/vscode-neovim/vscode-neovim
if exists('g:vscode')
    " nothing
else
    for f in split(glob('~/.config/nvim/rc/*.vim'), '\n')
        exe 'source' f
    endfor

    for f in split(glob('~/.config/nvim/lua/*.lua'), '\n')
        exe 'source' f
    endfor
endif
