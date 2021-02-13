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

# Options

```VimL
let g:ayu_italic_comment = 1 " defaults to 0.
let g:ayu_sign_contrast = 1 " defaults to 0. If set to 1, SignColumn and FoldColumn will have a higher contrast instead of using the Normal background
```

# Term colors

For now In `/term` you can find color schemes for iTerm. More to come.

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
