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

let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background

colorscheme ayu
```

# Term colors

For now In `/term` you can find color schemes for iTerm. More to come.
