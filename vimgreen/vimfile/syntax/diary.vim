set tabstop=4
set softtabstop=4
set shiftwidth=4
set go=
set nonu
syn match dTitle "^�� .\{10} ����\W"
hi dTitle guifg=lightBlue
syn match dSaturday "^�� .\{10} ������"
hi dSaturday guifg=lightgreen
syn match dSunday "^�� .\{10} ������"
hi dSunday guifg=lightred
:map <F2> <ESC>ggO�� <C-R>=strftime("%Y %m %d %A")<CR><ESC>3o<ESC>ggJj^i<tab>