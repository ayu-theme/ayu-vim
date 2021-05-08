![ayu-vim](http://i.imgur.com/7vnF4Na.png)

# Warning

`ayu` is still in development and a lot of things need to be covered. Theme works only if VIM supports `termguicolors` option. This is true for [Neovim](https://neovim.io) and VIM from 7.4.1799.

# Installation

```VimL
Plug 'Luxed/ayu-vim'    " or other package manager
"...
set termguicolors       " enable true colors support

set background=light    " for light version of theme
set background=dark     " for either mirage or dark version.

let g:ayucolor="mirage" " for mirage version of theme
let g:ayucolor="dark"   " for dark version of theme
" NOTE: g:ayucolor will default to 'dark' when not set. 

colorscheme ayu
```

# Supported Plugins

Here is a list of plugins which have been customized to work better with this theme:

- [vim-gitgutter](https://github.com/airblade/vim-gitgutter). Git sign column signs.
- [vim-signify](https://github.com/mhinz/vim-signify). General VCS sign column signs.
- [NERDTree](https://github.com/preservim/nerdtree). File explorer.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim). Fuzzy finder (neovim only).
- [YATS](https://github.com/HerringtonDarkholme/yats.vim). Yet Another TypeScript Syntax.
- [fugitive.vim](https://github.com/tpope/vim-fugitive). Git helper.
- [startify](https://github.com/mhinz/vim-startify). Start screen plugin.
- [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax). Pandoc specific markdown syntax.
- [haskell-vim](https://github.com/neovimhaskell/haskell-vim). Haskell syntax highlighting.

And here is a list of other supported syntax groups:

- Vim8 and Neovim Terminals.
- Diff syntax.
- Netrw.
- Neovim's Built-in LSP.
- TreeSitter (Neovim only).
- Javascript.
- Vimscript.
- XML.
- INI.
- Shell.
- PHP.
- Ruby

# Options

```VimL
let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
```

# Customize The Theme To Your Liking

```VimL
function! s:custom_ayu_colors()
  " Put whatever highlights you want here.
  " The ayu#hi function is defined as followed:
  " ayu#hi(highlight_group, foreground, background, [gui options])
  " See autoload/ayu.vim for color palette. 
  " `foreground` and `background` are required while the gui options are optional
  " `gui options` only represents the values you could put in the `gui` part of the highlight. See `:h highlight-gui`.
  call ayu#hi('IncSearch', '', 'vcs_modified')
endfunction

augroup custom_colors
  autocmd!
  autocmd ColorScheme ayu call s:custom_ayu_colors()
augroup END
```

Doing this will allow you to modify the theme to your liking while not modifying the colors for any other theme.

# Related Projects

- [ayu-vim](https://github.com/ayu-theme/ayu-vim): The official ayu-vim theme. It is currently un-maintained.
- [neovim-ayu](https://github.com/Shatur95/neovim-ayu): A reimplementation of the theme in lua for better Neovim and lua support.
