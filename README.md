#### Vim Installation Notes

 - Create `.var/vim/backup` and `.var/vim/swp`

#### Windows

Alternate Windows builds are available here:
 - <http://wyw.dcweb.cn/#download> with Lua support and updates to latest patches.
 - <http://tuxproject.de/projects/vim/>
 - [Vim for Windows](https://bitbucket.org/Haroogan/vim-for-windows/src) 
 - [VIM for Windows, single drop](https://bitbucket.org/kybu/vim-for-windows-single-drop) - bundled with all 3rd party dependencies, e.g. python, lua


#### Python

The version of Python must match that compiled into Vim. Run `:version` to see
the name of the Python DLL it will look for at runtime.

##### General

 - create `~/vimfile` symlink to `~/.vim/` 

##### Plugins

##### Vundle

 - need to create .vim/bundle directory and clone [Vundle](https://github.com/gmarik/vundle) into it
 - copy .vim/resources/curl.cmd to Git installation `cmd` folder

##### Neocomplete

 - download [Lua binaries](http://luabinaries.sourceforge.net/) (.dll and exe) for the version that Vim was compiled against, see `:version`; install in same folder as Vim exe's 

##### Using ag for grepprg

A Windows build of ag can be downloaded from [here](http://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html)

It's also available via [chocolatey](http://chocolatey.org/)

