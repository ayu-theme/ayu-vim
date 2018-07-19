let s:white     = [ '#fafafa', 234 ]
let s:white2  = [ '#ffffff', 236 ]
let s:white3      = [ '#f5f5f5', 242 ]
let s:text      = [ '#6e7580', 253 ]
let s:blue      = [ '#55b4d4', 75 ]
let s:cyan      = [ '#4cbf99', 116 ]
let s:green     = [ '#86b300', 150 ]
let s:orange    = [ '#fa6e32', 220 ]
let s:purple    = [ '#a37acc', 183 ]
let s:red       = [ '#f51818', 210 ]
let s:yellow    = [ '#f29718', 222 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:text, s:white2 ], [ s:text, s:white3 ] ]
let s:p.normal.right    = [ [ s:white, s:orange ], [ s:text, s:white2 ] ]
let s:p.normal.middle   = [ [ s:green, s:white ] ]
let s:p.normal.error    = [ [ s:red, s:white2, 'bold' ] ]
let s:p.normal.warning  = [ [ s:yellow, s:white2, 'bold' ] ]

let s:p.normal.right    = [ [ s:text, s:white2, 'bold' ], [s:text, s:white3] ]

let s:p.insert.left     = [ [ s:white, s:blue ], [ s:white, s:white3 ] ]
let s:p.replace.left    = [ [ s:white, s:red ], [ s:white, s:white3 ] ]
let s:p.visual.left     = [ [ s:white, s:purple ], [ s:white, s:white3 ] ]

let s:p.tabline.left    = [ [ s:text, s:white2 ] ]
let s:p.tabline.tabsel  = [ [ s:white, s:orange, 'bold' ] ]

let g:lightline#colorscheme#ayu#palette = lightline#colorscheme#flatten(s:p)
