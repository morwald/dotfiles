" current colorscheme
set background=dark
colorscheme solarized8
execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/solarized.vim')
let g:lightline.colorscheme = 'solarized'
highlight clear LineNr
