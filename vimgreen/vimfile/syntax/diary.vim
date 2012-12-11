set tabstop=4
set softtabstop=4
set shiftwidth=4
set go=
set nonu
syn match dTitle "^· .\{10} 星期\W"
hi dTitle guifg=lightBlue
syn match dSaturday "^· .\{10} 星期六"
hi dSaturday guifg=lightgreen
syn match dSunday "^· .\{10} 星期日"
hi dSunday guifg=lightred
:map <F2> <ESC>ggO· <C-R>=strftime("%Y %m %d %A")<CR><ESC>3o<ESC>ggJj^i<tab>