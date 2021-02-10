" Initialisation:"{{{
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "ayu"
let s:ayu_sign_contrast = get(g:, 'ayu_sign_contrast', 0)
"}}}

" Helper Functions:"{{{
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

function! s:sign_bg()
    return s:ayu_sign_contrast ? 'panel_bg' : ''
endfunction
" }}}

" Vim Highlighting: (see :help highlight-groups)"{{{
call s:hi('Normal', 'fg', 'bg')
call s:hi('ColorColumn', '', 'line')
call s:hi('CursorColumn', '', 'line')
call s:hi('CursorLine', '', 'line')
call s:hi('CursorLineNr', 'accent', 'line')
call s:hi('LineNr', 'guide_normal', '')

call s:hi('Directory', 'func', '')
call s:hi('ErrorMsg', 'fg', 'error', 'standout')
call s:hi('VertSplit', 'panel_bg', 'panel_bg')
call s:hi('Folded', 'fg_idle', 'panel_bg')
call s:hi('FoldColumn', '', s:sign_bg())
call s:hi('SignColumn', '', s:sign_bg())

call s:hi('MatchParen', 'fg', 'bg', 'underline')
call s:hi('ModeMsg', 'string', '')
call s:hi('MoreMsg', 'string', '')
call s:hi('NonText', 'guide_normal', '')
call s:hi('Pmenu', 'fg', 'selection_inactive')
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
call s:hi('TabLine', 'comment', 'panel_shadow')
call s:hi('TabLineFill', 'fg', 'panel_border')
call s:hi('TabLineSel', 'fg', 'bg')
call s:hi('Title', 'keyword', '')
call s:hi('Visual', '', 'selection_inactive')
call s:hi('WarningMsg', 'warning', '')
"}}}

" Generic Syntax Highlighting: (see :help group-name)"{{{
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
"}}}

" Diff Syntax Highlighting:"{{{
call s:hi('DiffAdd', 'vcs_added', 'guide_normal')
call s:hi('DiffAdded', 'vcs_added', '')
call s:hi('DiffChange', 'vcs_modified', 'guide_normal')
call s:hi('DiffDelete', 'vcs_removed', 'guide_normal')
call s:hi('DiffRemoved', 'vcs_removed', '')
call s:hi('DiffText', 'vcs_modified', 'guide_active')
"}}}

" Netrw:" {{{
call s:hi('netrwClassify', 'special', '')
" }}}

" GitGutter:" {{{
call s:hi('GitGutterAdd', 'vcs_added', s:sign_bg())
call s:hi('GitGutterChange', 'vcs_modified', s:sign_bg())
call s:hi('GitGutterDelete', 'vcs_removed', s:sign_bg())
call s:hi('GitGutterChangeDelete', 'vcs_modified', s:sign_bg(), 'underline')
" }}}

" Signify:" {{{
call s:hi('SignifySignAdd', 'vcs_added', s:sign_bg())
call s:hi('SignifySignChange', 'vcs_modified', s:sign_bg())
call s:hi('SignifySignDelete', 'vcs_removed', s:sign_bg())
call s:hi('SignifySignChangeDelete', 'vcs_modified', s:sign_bg(), 'underline')
" }}}

" NERDTree:" {{{
call s:hi('NERDTreeOpenable', 'fg_idle', '')
call s:hi('NERDTreeClosable', 'accent', '')
call s:hi('NERDTreeUp', 'fg_idle', '')
call s:hi('NERDTreeDir', 'func', '')
call s:hi('NERDTreeFile', '', '')
call s:hi('NERDTreeDirSlash', 'special', '')
" }}}

" Telescope:"{{{
call s:hi('TelescopeMatching', 'accent', '')
" }}}

" Neovim Builtin LSP:" {{{
call s:hi('LspDiagnosticsDefaultError', 'error', '')
call s:hi('LspDiagnosticsUnderlineError', 'error', '', 'underline')
call s:hi('LspDiagnosticsSignError', 'error', s:sign_bg())

call s:hi('LspDiagnosticsDefaultWarning', 'warning', '')
call s:hi('LspDiagnosticsUnderlineWarning', 'warning', '', 'underline')
call s:hi('LspDiagnosticsSignWarning', 'warning', s:sign_bg())

call s:hi('LspDiagnosticsVirtualTextHint', 'fg_idle', '')
call s:hi('LspDiagnosticsSignHint', 'fg', s:sign_bg())

call s:hi('LspDiagnosticsVirtualTextInformation', 'fg_idle', '')
call s:hi('LspDiagnosticsSignInformation', 'fg', s:sign_bg())
" }}}

" YATS:" {{{
call s:hi('typescriptDecorator', 'markup', '')
call s:hi('typescriptImport', 'accent', '')
call s:hi('typescriptExport', 'accent', '')
call s:hi('typescriptIdentifier', 'tag', '', 'italic')
call s:hi('typescriptAssign', 'operator', '')
call s:hi('typescriptBinaryOp', 'operator', '')
call s:hi('typescriptTernaryOp', 'operator', '')
call s:hi('typescriptModule', 'keyword', '')
call s:hi('typescriptTypeBrackets', 'special', '')
call s:hi('typescriptClassName', 'tag', '')
call s:hi('typescriptAmbientDeclaration', 'keyword', '')
call s:hi('typescriptRegexpString', 'regexp', '')
call s:hi('typescriptTry', 'markup', '')
call s:hi('typescriptExceptions', 'markup', '')
call s:hi('typescriptDebugger', 'markup', '', 'bold')
call s:hi('typescriptParens', 'fg', '')
" }}}

" TreeSitter:" {{{
call s:hi('TSInclude', 'accent', '')
call s:hi('TSParameter', 'fg', '')
call s:hi('TSField', 'tag', '')
call s:hi('TSAttribute', 'markup', '')
call s:hi('TSVariableBuiltin', 'tag', '', 'italic')
call s:hi('TSConstBuiltin', 'constant', '')
call s:hi('TSStringRegex', 'regexp', '')
" }}}

" Fugitive:" {{{
call s:hi('fugitiveUntrackedHeading', 'accent', '')
call s:hi('fugitiveUnstagedHeading', 'accent', '')
call s:hi('fugitiveStagedHeading', 'accent', '')
call s:hi('fugitiveHeading', 'accent', '')
" }}}

" Git Commit:" {{{
call s:hi('gitcommitBranch', 'func', '')
call s:hi('gitcommitHeader', 'accent', '')
call s:hi('gitcommitSummary', 'fg', '')
call s:hi('gitcommitOverflow', 'markup', '')
" }}}

" Startify:" {{{
call s:hi('StartifyFile', 'fg', '')
" }}}

" Vim:" {{{
call s:hi('vimUserFunc', 'func', '')
hi! link vimVar NONE
call s:hi('vimFunction', 'func', '')
call s:hi('vimIsCommand', '', '')
" }}}
