" Configuration for Neovim
"
" PLUGINS
" =======
" Specify a directory for plugins (for Neovim: )
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/vim-easy-align'
" Syntax highlight and much goodness
Plug 'vim-syntastic/syntastic'
" Ack Search in vim
Plug 'mileszs/ack.vim'
" Insert and delete brackets etc in pairs
Plug 'jiangmiao/auto-pairs'
" Fuzzy finder files, buffers, tags :CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" Mean, lean, status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colour scheme
Plug 'freeo/vim-kalisi'
" editorconfig, change settings based on .editorconfig
Plug 'editorconfig/editorconfig-vim'
" Show thin verticle line for indentation level
Plug 'Yggdroot/indentLine'
" Handy git integrations
Plug 'tpope/vim-fugitive'
" nerdtree
" python-syntax
" stackanswers.vim
" vim-colors-solarized
" vim-commentary
" vim-gitgutter
" vim-javascript-syntax
" javascript-libraries-syntax

" Initialize plugin system
call plug#end()

" Map ctrl n to open filetree
map <C-n> :NERDTreeToggle<CR>

" open new file from ctrl+p in pane
let g:ctrlp_switch_buffer = 'et'
" dont limit the files ctrl+p can search
let g:ctrlp_max_files=50000
" ignore .gitignored files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" COLOURSCHEME
" ============
set t_Co=256
" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
" Mean lean status line
let g:vim_airline_theme='kalisi'
colorscheme kalisi
" set background=light
" or 
set background=dark
" if you don't set the background, the light theme will be used

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_yaml_checker_args = '{"extends": "default", "rules": {"line-length": {"level": "warning"}}}'
let g:syntastic_javascript_eslint_exe = 'node_modules/.bin/eslint --config=.eslintrc.js --max-warnings=0'
let g:syntastic_python_checkers = ['pylint']
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


