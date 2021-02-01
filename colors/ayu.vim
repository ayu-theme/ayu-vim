" Initialisation:"{{{
" ----------------------------------------------------------------------------
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ayu"
"}}}

" Helper Functions:"{{{
" ----------------------------------------------------------------------------

function! s:hi(group_name, fg_color_name, bg_color_name, ...)
    let l:highlights = ['hi!', a:group_name]

    let l:fg_color = a:fg_color_name !=# '' ? ayu#get_color(a:fg_color_name) : 'NONE'
    call add(l:highlights, 'guifg=' . l:fg_color)

    let l:bg_color = a:bg_color_name !=# '' ? ayu#get_color(a:bg_color_name) : 'NONE'
    call add(l:highlights, 'guibg=' . l:bg_color)

    let l:fmt = get(a:, '1')
    call add(l:highlights, 'gui=' . (l:fmt !=# '0' ? l:fmt : 'NONE'))

    let l:cmd = join(l:highlights, ' ')
    execute l:cmd
endfunction

" }}}

" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------

call s:hi('Normal', 'fg', 'bg')
call s:hi('ColorColumn', '', 'line')
call s:hi('CursorColumn', '', 'line')
" NOTE: darker than before, but still looks good, gives a nice contrast
call s:hi('CursorLine', '', 'line')
call s:hi('CursorLineNr', 'accent', 'line')
call s:hi('LineNr', 'guide_normal', '')

call s:hi('Directory', 'fg_idle', '')
call s:hi('ErrorMsg', 'fg', 'error', 'standout')
call s:hi('VertSplit', 'bg', '')
call s:hi('Folded', 'fg_idle', 'panel_bg')
call s:hi('FoldColumn', '', 'panel_bg')
call s:hi('SignColumn', '', 'panel_bg')
"   Incsearch"

call s:hi('MatchParen', 'fg', 'bg', 'underline')
call s:hi('ModeMsg', 'string', '')
call s:hi('MoreMsg', 'string', '')
call s:hi('NonText', 'guide_normal', '')
" NOTE: darker than before, I like it, but might not be for everyone
call s:hi('Pmenu', 'fg', 'panel_shadow')
call s:hi('PmenuSel', 'fg', 'selection_inactive', 'reverse')
call s:hi('Question', 'string', '')
call s:hi('Search', 'bg', 'constant')
call s:hi('SpecialKey', 'selection_inactive', '')
call s:hi('SpellCap', 'tag', '', 'underline')
call s:hi('SpellLocal', 'keyword', '', 'underline')
call s:hi('SpellBad', 'error', '', 'underline')
call s:hi('SpellRare', 'regexp', '', 'underline')
call s:hi('StatusLine', 'fg', 'panel_bg')
call s:hi('StatusLineNC', 'fg_idle', 'panel_bg')
call s:hi('WildMenu', 'fg', 'markup')
call s:hi('TabLine', 'fg', 'panel_bg', 'reverse')
call s:hi('Title', 'keyword', '')
call s:hi('Visual', '', 'selection_inactive')
" TODO: add highlight called 'warning'
call s:hi('WarningMsg', 'keyword', '')

"}}}

" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------

call s:hi('Comment', 'comment', '')
call s:hi('Constant', 'constant', '')
call s:hi('String', 'string', '')

call s:hi('Identifier', 'entity', '')
call s:hi('Function', 'func', '')

call s:hi('Statement', 'keyword', '')
call s:hi('Operator', 'operator', '')

call s:hi('PreProc', 'special', '')

call s:hi('Type', 'entity', '')
call s:hi('Structure', 'special', '')

call s:hi('Special', 'special', '')

call s:hi('Underlined', 'tag', '', 'underline')

call s:hi('Ignore', '', '')

call s:hi('Error', 'fg', 'error')

call s:hi('Todo', 'markup', '')

" Quickfix window highlighting
call s:hi('qfLineNr', 'keyword', '')

call s:hi('Conceal', 'comment', '')
call s:hi('CursorLineConceal', 'guide_normal', 'line')


" Terminal
" ---------
if has("nvim")
  let g:terminal_color_0 =  ayu#get_color('bg')
  let g:terminal_color_1 =  ayu#get_color('markup')
  let g:terminal_color_2 =  ayu#get_color('string')
  let g:terminal_color_3 =  ayu#get_color('accent')
  let g:terminal_color_4 =  ayu#get_color('tag')
  let g:terminal_color_5 =  ayu#get_color('constant')
  let g:terminal_color_6 =  ayu#get_color('regexp')
  let g:terminal_color_7 =  "#FFFFFF"
  let g:terminal_color_8 =  ayu#get_color('fg_idle')
  let g:terminal_color_9 =  ayu#get_color('error')
  let g:terminal_color_10 = ayu#get_color('string')
  let g:terminal_color_11 = ayu#get_color('accent')
  let g:terminal_color_12 = ayu#get_color('tag')
  let g:terminal_color_13 = ayu#get_color('constant')
  let g:terminal_color_14 = ayu#get_color('regexp')
  let g:terminal_color_15 = ayu#get_color('comment')
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = ayu#get_color('fg')
else
  let g:terminal_ansi_colors =  [ayu#get_color('bg'),        ayu#get_color('markup')]
  let g:terminal_ansi_colors += [ayu#get_color('string'),  ayu#get_color('accent')]
  let g:terminal_ansi_colors += [ayu#get_color('tag'),     ayu#get_color('constant')]
  let g:terminal_ansi_colors += [ayu#get_color('regexp'),  "#FFFFFF"]
  let g:terminal_ansi_colors += [ayu#get_color('fg_idle'), ayu#get_color('error')]
  let g:terminal_ansi_colors += [ayu#get_color('string'),  ayu#get_color('accent')]
  let g:terminal_ansi_colors += [ayu#get_color('tag'),     ayu#get_color('constant')]
  let g:terminal_ansi_colors += [ayu#get_color('regexp'),  ayu#get_color('comment')]
endif


" NerdTree
" ---------
call s:hi('NERDTreeOpenable', 'fg_idle', '')
call s:hi('NERDTreeClosable', 'accent', '')
call s:hi('NERDTreeUp', 'fg_idle', '')
call s:hi('NERDTreeDir', 'func', '')
call s:hi('NERDTreeFile', '', '')
call s:hi('NERDTreeDirSlash', 'accent', '')


" GitGutter
" ---------
call s:hi('GitGutterAdd', 'vcs_added', '')
call s:hi('GitGutterChange', 'vcs_modified', '')
call s:hi('GitGutterDelete', 'vcs_removed', '')
call s:hi('GitGutterChangeDelete', 'vcs_modified', '', 'underline')

"}}}

" TODO: Add signify w/ background color to match column bg

" Diff Syntax Highlighting:"{{{
" ----------------------------------------------------------------------------

call s:hi('DiffAdd', 'vcs_added', '')
hi! link DiffAdded DiffAdd
call s:hi('DiffChange', 'vcs_modified', '')
call s:hi('DiffDelete', 'vcs_removed', '')
hi! link DiffRemoved DiffDelete
hi! DiffText NONE

"}}}

" Telescope:"{{{
call s:hi('TelescopeMatching', 'keyword', '', 'underline')
" }}}

" Neovim Builtin LSP:" {{{
call s:hi('LspDiagnosticsDefaultError', 'error', '')
call s:hi('LspDiagnosticsUnderlineError', 'error', '', 'underline')
call s:hi('LspDiagnosticsDefaultWarning', 'keyword', '')
call s:hi('LspDiagnosticsUnderlineWarning', 'keyword', '', 'underline')
" }}}

" YATS:" {{{
call s:hi('typescriptDecorator', 'markup', '')
call s:hi('typescriptImport', 'accent', '')
call s:hi('typescriptIdentifier', 'tag', '', 'italic')
call s:hi('typescriptAssign', 'operator', '')
call s:hi('typescriptBinaryOp', 'operator', '')
call s:hi('typescriptTernaryOp', 'operator', '')
" }}}
