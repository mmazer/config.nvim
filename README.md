#### Vim Configuration 

Vim configuration files based on XDG directories specified in the environment:

    export XDG_CONFIG_HOME=$HOME/.config
    export XDG_DATA_HOME=$HOME/.local/share
    export XDG_CACHE_HOME=$HOME/.cache

To use set the `VIMNIT` environment variable:

    export VIMINIT=let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC

Site specific settings can be placed in `$XDG_DATA_HOME/vim/site.vim`.

This configuration can also be used with Neovim. Any Neovim specific configuration can be wrapped in:

    if has('nvim')
      ...
    endif

#### References

 - <http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables>
 - <http://tlvince.com/vim-respect-xdg>
