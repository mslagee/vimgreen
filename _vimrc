set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



" ================================����Ϊ�����޸ĵ�����================================
let @a="G?^��\rdG\<C-w>wGp\<C-w>w"


"=========================================================================
" DesCRiption: �ʺ��Լ�ʹ�õ�vimrc�ļ���for Linux/Windows, GUI/Console
"
" Last Change: 2010-03-21 10:48:32 Asins - asinsimple AT gmail DOT com
"
" Author: Assins - asinsimple AT gmail DOT com
" Get latest vimrc from http://nootn.com/blog/Tool/22/
"
" Version: 1.74
"
"=========================================================================

set nocompatible " �ر� vi ����ģʽ
syntax on " �Զ��﷨����
set t_Co=256 " �趨256ɫ
colors evening " �趨��ɫ����
set number " ��ʾ�к�
set cursorline " ͻ����ʾ��ǰ��
set ruler " ��״̬�����
set shiftwidth=4 " �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4

set expandtab        "��space���tab������
"set noexpandtab      "����space���tab������
"set softtabstop=4 " ʹ�ð��˸��ʱ����һ��ɾ�� 4 ���ո�
set tabstop=4 " �趨 tab ����Ϊ 4

set nobackup " �����ļ�ʱ������
set autochdir " �Զ��л���ǰĿ¼Ϊ��ǰ�ļ����ڵ�Ŀ¼
filetype plugin indent on " �������
set backupcopy=yes " ���ñ���ʱ����ΪΪ����
set ignorecase smartcase " ����ʱ���Դ�Сд��������һ�������ϴ�д��ĸʱ�Ա��ֶԴ�Сд����
"set nowrapscan " ��ֹ���������ļ�����ʱ��������
set incsearch " ������������ʱ����ʾ�������
set hlsearch " ����ʱ������ʾ���ҵ����ı�
set noerrorbells " �رմ�����Ϣ����
set novisualbell " �ر�ʹ�ÿ�������������
set t_vb= " �ÿմ����������ն˴���
set showmatch " ��������ʱ�����ݵ���ת��ƥ��Ķ�Ӧ����
set matchtime=2 " ������ת��ƥ�����ŵ�ʱ��
set magic " ����ħ��
set hidden " ��������δ������޸�ʱ�л�����������ʱ���޸��� vim ���𱣴�

set smartindent " ��������ʱʹ�������Զ�����
set backspace=indent,eol,start
" ���趨�Ļ��ڲ���״̬�޷����˸���� Delete ��ɾ���س���

""""""""""""""""""""""""""""""
" => ������״̬����ʾ����Ϣ
""""""""""""""""""""""""""""""
set cmdheight=1 " �趨�����е�����Ϊ 1
set laststatus=2 " ��ʾ״̬�� (Ĭ��ֵΪ 1, �޷���ʾ״̬��)
" set statusline=%{VimBuddy()}\ %F%m%r%h%w\ [%{&ff}]\ [%Y]\ [\%03.3b\ \%02.2B]\ [%02v\ %03l\ %L\ %p%%] 
" ������״̬����ʾ����Ϣ


" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
if has("win16") || has("win32") || has("win64") || has("win95")
return "windows"
elseif has("unix")
return "linux"
endif
endfunction

" ���û�Ŀ¼
if MySys() == "windows"
let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
let $VIMFILES = $VIM.'/.vim'
endif

" �������� �Լ�����֧��
if has("win32")
set guifont=Inconsolata:h12:cANSI
endif


" ���ö����Ի���
if has("multi_byte")
" UTF-8 ����
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

if v:lang =~? '^(zh)|(ja)|(ko)'
set ambiwidth=double
endif

if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" �趨docĿ¼
let helptags=$VIMFILES.'/doc'

" Buffers������ݷ�ʽ!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab������ݷ�ʽ!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"һЩ�����ӳ��ת���﷨�������һ���ļ��л���˲�ͬ����ʱ���ã�
map <leader>1 :set filetype=xhtml<CR>
map <leader>2 :set filetype=css<CR>
map <leader>3 :set filetype=javascript<CR>
map <leader>4 :set filetype=php<CR>
map <leader>5 :set filetype=python<CR>

" Fileformats
set fileformats=unix,dos,mac
nmap <leader>fd :se fileformat=dos<CR>
nmap <leader>fu :se fileformat=unix<CR>

"���ڷָ�ʱ,�����л��İ����ȼ���Ҫ��������,������·������ƶ�
"��굽�Ϸ�����,��Ҫ<c-w><c-w>k,�ǳ��鷳,������ӳ��Ϊ<c-k>,�л���
"ʱ����÷ǳ�����.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers�����ݷ�ʽ!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Python �ļ���һ�����ã����粻Ҫ tab ��
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR> 

let Tlist_Use_Right_Window=1 "�����б������Ļ���Ҳ�
let Tlist_File_Fold_Auto_Close=1 "��ǰ�����༭���ļ��ķ����б��Զ��۵�����

map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>  " ��󻯴���
au GUIEnter * simalt ~x " ���������
"set guioptions-=T " ���ع�����
"set guioptions-=m " ���ز˵���

"---------------- �����۵� ---------------------------
"set foldmethod=indent

"---------------- ����������ڵ��� -------------------
":match Todo /\k*\%#\k*/
"set hlsearch

"---- ֻ���½��˱�ǩҳ�Ż��ڴ����Ϸ���ʾ�����ϣ��������ʾ��ǩ����set showtabline=2
set showtabline=1