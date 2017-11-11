" Start an Eclim project
command ProjectStart execute 'ProjectCreate' getcwd() '-n java'
autocmd BufReadPost *.java Validate

let g:EclimLoclistSignText='░ '
let g:EclimUserSignText='■ '
let g:EclimQuickfixSignText='>'
let g:EclimHighlightInfo='ALEWarning'
let g:EclimHighlightWarning='ALEError'
let g:EclimHighlightError='ALEError'
