" Official Palette:" {{{
let g:ayu#palette = {}

" common
let g:ayu#palette.accent             = {'light': "#FF9940",  'mirage': "#FFCC66",  'dark': "#E6B450"}
let g:ayu#palette.bg                 = {'light': "#FAFAFA",  'mirage': "#1F2430",  'dark': "#0A0E14"}
let g:ayu#palette.fg                 = {'light': "#575F66",  'mirage': "#CBCCC6",  'dark': "#B3B1AD"}
let g:ayu#palette.ui                 = {'light': "#8A9199",  'mirage': "#707A8C",  'dark': "#4D5566"}

" syntax
let g:ayu#palette.tag                = {'light': "#55B4D4",  'mirage': "#5CCFE6",  'dark': "#39BAE6"}
let g:ayu#palette.func               = {'light': "#F2AE49",  'mirage': "#FFD580",  'dark': "#FFB454"}
let g:ayu#palette.entity             = {'light': "#399EE6",  'mirage': "#73D0FF",  'dark': "#59C2FF"}
let g:ayu#palette.string             = {'light': "#86B300",  'mirage': "#BAE67E",  'dark': "#C2D94C"}
let g:ayu#palette.regexp             = {'light': "#4CBF99",  'mirage': "#95E6CB",  'dark': "#95E6CB"}
let g:ayu#palette.markup             = {'light': "#F07171",  'mirage': "#F28779",  'dark': "#F07178"}
let g:ayu#palette.keyword            = {'light': "#FA8D3E",  'mirage': "#FFA759",  'dark': "#FF8F40"}
let g:ayu#palette.special            = {'light': "#E6BA7E",  'mirage': "#FFE6B3",  'dark': "#E6B673"}
let g:ayu#palette.comment            = {'light': "#ABB0B6",  'mirage': "#5C6773",  'dark': "#626A73"}
let g:ayu#palette.constant           = {'light': "#A37ACC",  'mirage': "#D4BFFF",  'dark': "#FFEE99"}
let g:ayu#palette.operator           = {'light': "#ED9366",  'mirage': "#F29E74",  'dark': "#F29668"}
let g:ayu#palette.error              = {'light': "#F51818",  'mirage': "#FF3333",  'dark': "#FF3333"}

" ui
" some of these colors should have transparency. Since this is not possible,
" they only 'emulate' their colors as if they were shown on the regular
" backaground color
let g:ayu#palette.line               = {'light': "#EFF0F1",  'mirage': "#191E2A",  'dark': "#00010A"}
let g:ayu#palette.panel_bg           = {'light': "#FFFFFF",  'mirage': "#232834",  'dark': "#0D1016"}
let g:ayu#palette.panel_shadow       = {'light': "#CCCED0",  'mirage': "#141925",  'dark': "#00010A"}
let g:ayu#palette.panel_border       = {'light': "#F0F0F0",  'mirage': "#101521",  'dark': "#000000"}
let g:ayu#palette.gutter_normal      = {'light': "#CDD0D3",  'mirage': "#404755",  'dark': "#323945"}
let g:ayu#palette.gutter_active      = {'light': "#A0A6AC",  'mirage': "#5F687A",  'dark': "#464D5E"}
let g:ayu#palette.selection_bg       = {'light': "#D1E4F4",  'mirage': "#33415E",  'dark': "#273747"}
let g:ayu#palette.selection_inactive = {'light': "#E7E8E9",  'mirage': "#323A4C",  'dark': "#1B2733"}
let g:ayu#palette.selection_border   = {'light': "#E1E1E2",  'mirage': "#232A4C",  'dark': "#304357"}
let g:ayu#palette.guide_active       = {'light': "#D3D5D8",  'mirage': "#576070",  'dark': "#393F4D"}
let g:ayu#palette.guide_normal       = {'light': "#E6E7E9",  'mirage': "#383E4C",  'dark': "#242A35"}

" vcs
let g:ayu#palette.vcs_added          = {'light': "#99BF4D",  'mirage': "#A6CC70",  'dark': "#91B362"}
let g:ayu#palette.vcs_modified       = {'light': "#709ECC",  'mirage': "#77A8D9",  'dark': "#6994BF"}
let g:ayu#palette.vcs_removed        = {'light': "#F27983",  'mirage': "#F27983",  'dark': "#D96C75"}

" TODO: Add 16 color palette for convenience
" }}}

" Extended Color Palette:" {{{

let g:ayu#palette.fg_idle = {'light': "#828C99",  'mirage': "#607080",  'dark': "#3E4B59"}
let g:ayu#palette.warning = {'light': "#FA8D3E",  'mirage': "#FFA759",  'dark': "#FF8F40"}

" }}}


function! ayu#get_style()
    return &background ==# 'dark' ? get(g:, 'ayucolor', 'dark') : &background
endfunction

function! ayu#get_color(color_name)
    let l:style = ayu#get_style()

    return g:ayu#palette[a:color_name][l:style]
endfunction

function! ayu#hi(group_name, fg_color_name, bg_color_name, ...)
    let l:highlights = ['hi!', a:group_name]

    let l:fg_color = a:fg_color_name !=# '' ? ayu#get_color(a:fg_color_name) : 'NONE'
    call add(l:highlights, 'guifg=' . l:fg_color)

    let l:bg_color = a:bg_color_name !=# '' ? ayu#get_color(a:bg_color_name) : 'NONE'
    call add(l:highlights, 'guibg=' . l:bg_color)

    let l:fmt = get(a:, '1')
    call add(l:highlights, 'gui=' . (l:fmt !=# '0' && l:fmt !=# '' ? l:fmt : 'NONE'))

    let l:cmd = join(l:highlights, ' ')
    execute l:cmd
endfunction
