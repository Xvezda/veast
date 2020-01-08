# veast.vim

Veast is a library for vim script.
It contains useful helper functions, which provides efficient way to writing vim plugins.


## Usage

You can either directly include veast to your vim plugin project or make dependency by using plugin manager(e.g. pathogen, vim-plug etc.) to make it works.

### Direct method
```sh
# Create autoload
mkdir -p <your_project_path>/autoload
# Copy veast library
cp plugin/veast.vim <your_project_path>/autoload/
```

### Plugin manager method

e.g. vim-plug
```vim
call plug#begin()
Plug 'Xvezda/vim-veast'
" ...
call plug#end()
```

### Include

```vim
runtime! autoload/veast.vim
```


## Test

`make test`


## Use case

* [vim-nobin](https://github.com/Xvezda/vim-nobin)
