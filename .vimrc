" vim:fdm=marker

" Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'andymass/vim-matchup'
Plug 'cohama/lexima.vim'   " auto close parentheses
Plug 'drewtempelmeyer/palenight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
"Plug 'itchyny/lightline.vim'
Plug 'kana/vim-repeat'
Plug 'Lenovsky/nuake'
Plug 'liuchengxu/vista.vim'
Plug 'pbogut/fzf-mru.vim'
"Plug 'maximbaz/lightline-ale'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'nelstrom/vim-visual-star-search'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/context_filetype.vim'
Plug 'TaDaa/vimade'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'tyru/caw.vim'      " comment
Plug 'wincent/terminus'
Plug 'w0rp/ale'
Plug 'preservim/nerdcommenter'
Plug 'mcchrish/nnn.vim'
Plug 'mileszs/ack.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'artanikin/vim-synthwave84'
Plug 'mhartington/oceanic-next'
Plug 'arzg/vim-substrata'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
Plug 'prisma/vim-prisma'

call plug#end()
" }}}
" Base config {{{
let mapleader=','
set laststatus=2          " Make visible the status bar
syntax on                  " Turn on syntax highlighting
set grepprg='rg'           " Use ripgrep instead of grep
" set cursorline            " Highlight the current line
set visualbell            " Don't beep
set noerrorbells          " Don't beep
set hlsearch              " Highlight search
set incsearch             " Highlight while typing the search
set ignorecase            " Make search case-insensitive
set lazyredraw            " Redraw only when we need to
set conceallevel=1
set undofile               " Maintain undo history between sessions
set undodir=~/.vim/undodir "set dir for persistent undo
" set concealcursor=nc
" (do not redraw while running macros)

set noswapfile             " No swap files (I don't like files.swap)
set nobackup               " No backup files
set nowritebackup
set hidden                 " Open files without saving the current file
set autoread               " Allow read files that changes outside vim
set encoding=utf-8         " Set the encoding that is showing in the terminal
set fileencoding=utf-8     " Set the encoding of the file that is written
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set nowrap                " Don't Wrap the text (windows size)
set linebreak             " Wrap at 'breakat' instead of the last character
set tabstop=4             " The width of a tab is four spaces
set shiftwidth=4          " Spaces to use when (auto)indent.
set softtabstop=4         " when hitting <BS>, pretend like a tab is removed, even if spaces"
set expandtab             " Use spaces instead of Tabs
set shiftround            " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting

" set formatoptions-=o      " Don't auto-comment the next line when pressing 'o'
" Actually is not working for me :'(
set wildmenu              " Autocomplete like zsh in command mode
set noshowmode            " Hide mode from bottom status
set scrolloff=999         " Keep the cursor vertically centered
set ttyfast               " For better redrawing when scrolling
set sidescroll=1          " Sensible Horizontal Scroll in Vim
setg fixendofline         " EOL
set cmdheight=2           " Better display for messages
set updatetime=300        " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c          " don't give |ins-completion-menu| messages.
"set noshowmatch


" Disable parentheses matching depends on system. This way we should address all cases (?)
"set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
"function! g:FckThatMatchParen ()
    "if exists(":NoMatchParen")
        ":NoMatchParen
    "endif
"endfunction

augroup plugin_initialize
    "autocmd!
    "autocmd VimEnter * call FckThatMatchParen()
augroup END


if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set tags+=tags,tags.vendors

set noshowmode
set clipboard=unnamed

set termguicolors

" }}}
" colorscheme {{{
set background=dark
set t_Co=256
"



" ====================================================================
set noshowmode

let NERDTreeStatusline="%8*%=%7*NERD%8*%="

set laststatus=2
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
    return  WebDevIconsGetFileTypeSymbol() . ' ' . a:filetype
  endif
endfunction
" }}}

hi def link nerdtreedirslash folded
hi def link nerdtreero statement
hi def link nerdtreebookmark statement
hi def link nerdtreeflags statement
hi def link nerdtreedir folded
hi def link nerdtreeup folded
hi def link nerdtreefile folded
hi def link nerdtreecwd folded
hi def link nerdtreeopenable folded
hi def link nerdtreeclosable folded
hi def link nerdtreeignore folded


" }}}
" Autocommands and functions {{{

" call macro in visual region
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" vue (fix highlight when stop working)
" autocmd FileType vue syntax sync fromstart
" autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
"
" let g:vue_disable_pre_processors = 1

" vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>i <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>i :call PhpInsertUse()<CR>

" Make sure Vim open in the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Auto-remove trailing spaces
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
autocmd BufWritePre * call StripWhitespace()

" indent html tag
let g:html_indent_inctags = "html,body,head,tbody" " Indent html tag (Vim 7.4)

autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell         " Enable spell check on git commit messages

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby    " Highlight Vagrant files like ruby
autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown " Highlight Markdown files

autocmd BufRead,BufNewFile *.go  set tabstop=4 shiftwidth=4  softtabstop=4
autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.blade.php set filetype=blade
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 tabstop=2

augroup vim-colors-xcode
    autocmd!
augroup END


" }}}
" Mappings {{{
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Fast save
nmap <leader>w :w!<CR>
imap <leader>w <esc>:w<CR>
map <leader>fs <esc>:CocCommand eslint.executeAutoFix<CR>


" source vimrc
nmap <Leader>so :so $MYVIMRC<CR>  " Fast source .vimrc
map <Leader>vi :vsp $MYVIMRC<CR>  " Obviously :)

" Make Arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>

" Buffer navigation
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap <leader>a :bprev<cr>
nnoremap <leader>t :bnext<cr>

" Buffer delete
" nnoremap <leader>d :bd<cr>
nnoremap <leader>d :bp<cr>:bd #<cr>

" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Set (No)Paste Toogle
"set pastetoggle=<leader>z
"


" Jump to next error and previous error
map ]l :lnext<CR>
map [l :lprevious<CR>

" move in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep selection after indentng
vnoremap > >gv
vnoremap < <gv

" }}}
" Plugins configuration {{{
hi ColorColumn  term=reverse ctermbg=1 guibg=#3E4452
hi! link ColorColumn Comment

" vim vue
let g:vim_vue_plugin_load_full_syntax = 0
let g:vim_vue_plugin_use_foldexpr = 0

" Vista
"map <leader>vv :Vista!!<CR>
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"let g:vista#renderer#enable_icon = 1
"let g:vista_disable_statusline = 1
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'coc'
"let g:vista_fzf_preview = ['right:50%']
" let g:vista_icon_indent = ["▸ ", ""]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" https://github.com/liuchengxu/vista.vim/blob/master/autoload/vista/renderer.vim
"let g:vista#renderer#icons = {
"\   "function": "ƒ",
"\   "var": "",
"\   "variable": "",
"\   "variables": "",
"\   "class": " ",
"\   "namespaces": "",
"\   "default": ""
"\ }

" Colorizer
" let g:colorizer_use_virtual_text = 0
" let g:colorizer_colornames = 0
" let g:colorizer_syntax = 1
"let g:colorizer_auto_filetype='css,scss'
"au BufNewFile,BufRead *.css,*.scss :ColorHighlight!


" vim-matchup
let g:loaded_matchit = 1

" coc-nvim
" let $COC_NO_PLUGINS=1
" let $NODE_CLIENT_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let g:node_client_debug = 1
 let g:coc_global_extensions = []
let g:coc_watch_extensions = []
let g:coc_node_path = '/usr/local/bin/node'
 let g:coc_global_extensions = [
\  'coc-json',
\  'coc-eslint',
\  'coc-css',
\  'coc-emmet',
\  'coc-html',
\  'coc-diagnostic',
\  'coc-phpls',
\  'coc-snippets'
\ ]

" User configuration.
let g:coc_user_config = {
	\ 'suggest': {
		\ 'enablePreview': v:true,
		\ 'noselect': v:false,
		\ 'timeout': 500,
		\ 'preferCompleteThanJumpPlaceholder': v:true,
		\ 'minTriggerInputLength': 2,
	\ },
	\ 'diagnostic': {
		\ 'displayByAle': v:false,
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•',
	\ }
\ }


"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-l>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-;>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" snippets with tab
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" jump to symbol under cursor (go to definition)
nnoremap <silent> <C-s>  :exe 'CocList -I --normal --input='.expand('<cword>').' symbols'<CR>

" add current to selection and go to next
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

nmap <silent> <C-e> <Plug>(coc-cursors-word)*
xmap <silent> <C-e> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

"eleline
let g:eleline_powerline_fonts = 0
let g:eleline_slim = 1

"vim slash
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

" vim nnn

let g:nnn#command = 'nnn -d'
"
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Then set your own
nnoremap <silent> <leader>nn :NnnPicker<CR>

" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" Or override
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>


" splitjoin
let splitjoin_php_method_chain_full=1

" gutentags
" let g:gutentags_ctags_extra_args = [
"             \ '--recurse=yes',
"             \ '--tag-relative=yes',
"             \ '--exclude=.git',
"             \ '--languages=php',
"             \ '--PHP-kinds=+cdfint-av',
"             \ '--langmap=php:.engine.inc.module.theme.install.php',
"             \ '--PHP-kinds=+cf-v'
"             \]
" let g:gutentags_ctags_exclude = [
"             \ '*.css', '*.html', '*.js', '*.json', '*.xml',
"             \ '*.phar', '*.ini', '*.rst', '*.md',
"             \ '*var/cache*', '*var/log*'
"             \]

"php pactor
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>cm :call phpactor#ContextMenu()<CR>

" php server
" au User lsp_setup call lsp#register_server({
"             \ 'name': 'php-language-server',
"             \ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
"             \ 'whitelist': ['php'],
"             \ })

" vim easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim prettier
let g:prettier#config#tab_width = 2
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1


" pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_arrow_function       = "⇒"

"ale
let g:ale_disable_lsp = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_php_phpcs_standard='psr2 -n'
let g:ale_php_phpcs_use_global=1
" let g:ale_php_langserver_executable = 'intelephense'
" let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')
let g:ale_php_langserver_use_global = 1

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'html': [''],
      \}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_enabled = 0

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:DevIconsEnableFoldersOpenClose = v:true
let g:DevIconsEnableFolderExtensionPatternMatching = 1
" Use one space after a glyph instead of two.
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" Set default file and directory icons.
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

set number
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


:imap jj <Esc>

"   VIM KEYBINDING PANE NAVIGATION
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"   BUFFER NAVIGATION
nnoremap H :bp<cr>
nnoremap L :bn<cr>


"   BUFFER TAB KEYMAP
"map <leader>t :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>q :bw<cr>
map <leader>tm :tabmove
map <leader>e :tabedit <c-r>=expand("%:p:h")<cr>/"


if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Ag.vim
let g:ag_working_path_mode="r"
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore public --ignore node_modules --ignore "./storage/*" --ignore "./public/stylesheets/*"'

" php.vim
let php_var_selector_is_identifier=1

" Php CS Fixer
let g:php_cs_fixer_fixers_list="-psr0"
let g:php_cs_fixer_level = "psr2"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 0
let g:phpfmt_php_path = "php8"
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pf :w \| :call PhpCsFixerFixFile()<CR><CR>

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1
" }}}
" Plugins mappings {{{

" NerdTree
map <leader>n :NERDTreeToggle<CR>

" FZF

let $FZF_DEFAULT_COMMAND = 'fzf rg --files --ignore-case --hidden --no-preview -g  "!{.git,node_modules,vendor}/*"'
nnoremap <C-p> :Files<Cr>
nnoremap <leader>m :FZFFreshMru<cr>
" let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'

let g:fzf_preview_window = []
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.4, 'yoffset': 0.02} }
"let g:preview_width = float2nr(&columns * 0.7)
" let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi' --preview-window right:" . g:preview_width
let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --no-preview"
"let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" let g:fzf_colors = {
" 			\ 'fg':      ['fg', 'Fold'],
" 			\ 'bg':      ['bg', 'Normal'],
" 			\ 'hl':      ['fg', 'Error'],
" 			\ 'fg+':     ['fg', 'String'],
" 			\ 'bg+':     ['bg', 'Normal'],
" 			\ 'hl+':     ['fg', 'Error'],
" 			\ 'info':    ['fg', 'Type'],
"             \ 'border':  ['fg', 'Ignore'],
" 			\ 'prompt':  ['fg', 'Special'],
" 			\ 'pointer': ['fg', 'Statement'],
" 			\ 'marker':  ['fg', 'Statemetn'],
" 			\ 'spinner': ['fg', 'Statement'],
" 			\ 'header':  ['fg', 'Special'],
"             \ }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  " let height = float2nr(10)
  " let width = float2nr(80)
  let height = float2nr(&lines * 0.85)
  let width = float2nr(&columns * 0.9)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
"

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

nnoremap <C-f> :Rg<CR>


nnoremap <silent> <leader>x :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob --no-preview "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction


" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:multi_cursor_quit_key = '<C-xx>'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   📝  ']            },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let s:header = [
      \ '',
      \ '               _____    ________)   ',
      \ '              (, /     (, /         ',
      \ '                /        /___,      ',
      \ '            ___/__ o  ) /           ',
      \ '          /   /      (_/            ',
      \ '         (__ /                      ',
      \ '                                    ',
      \ '       ❤️  ジェシカ ナターシャ ',
      \ '',
      \ ]

let g:airline_theme='transparent'
let g:startify_custom_header = s:header
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

colorscheme substrata


hi Normal guibg=NONE ctermbg=NONE

