" Although it seems like it should be possible to detect the current directory
" of _this_ config file, and use that as the config root directory (i.e. let
" ConfigDir = expand('%:p:h')), when neovim is started with a file specified
" on the command line (i.e. vi ~/.zshrc), % will actually refer to the file
" specified on the command line, and not this file.
let ConfigDir = '~/dotfiles/nvim/'

function! SourceConfig(file)
  exe 'source' g:ConfigDir . a:file
endfunction

function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" These don't seem to work. The Neovim documentation implies that setting
" these variables will select the python interpreter. However, when I set
" these, I still get python errors (neovim can't find the neovim package in
" the interpreter). When I select a virtual environment (pyenv activate
" neovim-3.9) before launching neovim, then neovim is able to use Python for
" plugins.
"let g:python_host_prog = $HOME."/.pyenv/versions/neovim-2.7/bin/python2"
"let g:python3_host_prog = $HOME."/.pyenv/versions/neovim-3.9/bin/python3"

" This is the setting the actually worked selecting a virtualenv for a Python
" interpreter for neovim to use. This environment variable is honored by pyenv
" for selecting a specific interpreter. As long as I don't need both a 2.7
" interpreter and a 3.x interpreter.
let $PYENV_VERSION="neovim-3.9"

syntax on
filetype plugin indent off
set tabstop=4
" Sets how much indent for the >
set shiftwidth=4

" Use 'shiftwidth' when using <Tab> in front of a line. By default it's used
" only for shift commands ("<", ">").
set smarttab

" This will affect CtrlP plugin, and exclude files from the listing.
" Ignore these directories for CtrlP
set wildignore+=*.o,*.class,.svn,*.jar,*.gif,*.jpg,*.pyc,.git,*.so,*.zip,*.swp
set wildignore+=*/bin/*,*/build/*,*/target/*,*/node_modules/*,*/lib/*

" Each new line will match code block
set autoindent
" Tabs will be changed to equivalent spaces,
" affects autoindent and shift (>) operator.
set expandtab

" Toggle the NERDTree side bar on and off.
nmap <leader>d :NERDTreeToggle<CR>

" Add incremental searching to vim.
set incsearch

" Set case insensitive searching.
set ignorecase
" If you include a capital letter in a search, vim switches to case sensitive searching.
set smartcase

" This setting allows you to switch between buffers, leave unsaved changes
" in a buffer and have them still be there when you get back.
set hidden

" Maps the RE search key so it gets extended regular expressions by default.
"
" As it turns out, this is painful. It's always in the way, I often have to
" delete it for some reason.
"
" What I really want is for all / searches to just be extended regular
" expression. Haven't found a way to do that yet.
"
"nnoremap / /\v
"vnoremap / /\v

" Set up the Go-Lang plugins. Copy-Paste from the
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set runtimepath+=$GOROOT/misc/vim " replace $GOROOT with the output of: go env GOROOT
filetype plugin indent on
syntax on
autocmd FileType go compiler go

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
    call SourceConfig("plugins.vim")
call plug#end()

" Options for highlighting matching values of search.
"  Turn on highlighting.
set hlsearch
"  Map a key to make it easy to turn off search highlighting.
nnoremap <silent> <Space><Space> :nohlsearch<Bar>:echo<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Required:
filetype plugin indent on

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" You know when you are editing a file and you try to save it only to find out
" it is write restricted and you have to exit vim and re-run it with sudo root
" just so you can save changes?
" Do :w!! instead.
cmap w!! w !sudo tee > /dev/null %

" This will execute highlighted text as VimScript.
vmap <silent> <leader>r "xy:@x<CR>

" Navigating quickfix should get easier.
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
nnoremap ,c :cclose<CR>

" Improved window navigation key strokes. Fewer keys makes a big
" difference for window navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" NOTE: C-H is special. C-H is commonly used by terminals to send the
" backspace character. So, to make this work, I had to change iTerm to send
" the C-? character as backspace (Settings -> Profile -> Select Profile ->
" Keymap -> + (to add a new keymap) -> Backspace as C-?)
" http://vi.stackexchange.com/questions/3119/mapping-control-h-in-insert-mode-doesnt-work-it-always-works-like-backspace
"
" This works on Linux.
nnoremap <C-H> <C-W><C-H>
" This is for Mac.
" To make this work, I had to change iTerm to send
" the C-? character as backspace (Settings -> Profile -> Select Profile ->
" Keymap -> + (to add a new keymap) -> Backspace as C-?)
" http://vi.stackexchange.com/questions/3119/mapping-control-h-in-insert-mode-doesnt-work-it-always-works-like-backspace
nnoremap <Backspace> <C-W><C-H>

" The Goal:
" Improved windowing experience in Vim.
" 1. Really simple hotkeys for common actions.
"   - moving windows
"   - C-hjkl - not bad, but C-h maps to backspace in many terminal programs.
"              Also, on Mac OS X, it isn't mapped properly in the term progs.
"              https://github.com/neovim/neovim/issues/2048
"   - A-hjkl - not bad, but Mac uses Alt for Unicode chars be default.
" 2. Closing a buffer in a window should really pop back a buffer, like a
" stack. But the stack should be specific to that window.
" 3. Easy to change between a couple common arrangements.
"   - big window in the middle, one on each side, terminal type on the bottom.
"   - side by side diff of two things.
" 4. Pair navigation.
"   - navigate to the paired file.
"   - some kind of function or pattern for recognizing a pair.
"   - file to the unit test, that kind of thing.
"   - primary, secondary, tertiary pair.
"
" On a Mac, the default keyboard mapping doesn't pass the Alt key
" combinations, so this is a mapping of the Unicode characters it does pass.
noremap ê <C-W><C-J>
noremap ë <C-W><C-K>
noremap ì <C-W><C-L>
noremap è <C-W><C-H>
noremap <A-h> <C-W><C-H>
noremap <A-j> <C-W><C-J>
noremap <A-k> <C-W><C-k>
noremap <A-l> <C-W><C-l>

" Open new split panes to right and bottom, which feels more natural than
" Vim’s default:
set splitbelow
set splitright

" Makes the Airline status bar visible at all times.
set laststatus=2

" Keep visual selection after indenting or unindenting.
vnoremap < <gv
vnoremap > >gv
"vmap <TAB> >
"vmap <S-TAB> <
"nmap <TAB> >>
"nmap <S-TAB> <<
" When inserting, allow Shift-Tab to un-Tab.
"inoremap <S-TAB> <C-D>

" Buffer navigation is extremely common, so there are some things I remapped
" to make that go faster. I hope.
map <silent> ,bd :Bdelete<CR>
map <silent> ,bb :b#<CR>
map <silent> ,bp :bp<CR>
map <silent> ,bn :bn<CR>
map <silent> ,bl :Buffers<CR>

" Make the cursor at least this many lines away from the edge of the screen.
set scrolloff=3

" Make global substitutions the default.
" So, when you do:
"     :%s/abc/123/
" it will act like:
"     :%s/abc/123/g
set gdefault

" Marks in Vim can be used two ways. The ' takes you to the line of the mark,
" the ` takes you to the line and column of the mark. I nearly always want the
" line and column position, but I find the ' easier to use, so these commands
" reverse the keymaps.
" NOTE: There is a still a problem with this. These keys are not remapped when
" used in sequences like d'a (delete to mark a).
nnoremap ` '
nnoremap ' `
vnoremap ` '
vnoremap ' `

" These mappings should allow easily moving a line up or down.
nnoremap <Space>k   :<C-u>silent! move-2<CR>==
nnoremap <Space>j   :<C-u>silent! move+<CR>==
xnoremap <Space>k   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap <Space>j   :<C-u>silent! '<,'>move'>+<CR>gv=gv

" Keep the cursor at the column it was at after a move, like switching
" buffers.
set nostartofline

" Set the colors used when the cursor is on a matching paren.
hi MatchParen cterm=bold ctermbg=none ctermfg=Yellow

" When Vim is resized, make all the splits resize equally. Not a perfect
" solution (maintaining proportion would be perfect) but a sufficient
" solution.
augroup Misc
    autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END

call SourceConfig("/nvimrc")

" Automatically save the file when the user does a build.
set autowrite

" This changes the default command line editor experience (the mode you enter
" with the : key) to use a command-line-editor window instead. It allows you
" to have an editing experience more in line with the other Vim windows.
"
" NOTE: This was an experiment that didn't work out. At first it seemed okay,
" but in daily usage, the following problems appeared:
" 1. If you start typing a command and press the up arrow, the partially typed
" command is NOT used to limit up arrow navigation to matches. Instead, up
" arrow just takes you one line up, to the previous command.
" 2. :pwd - output disappears off the screeen and isn't visible.
" 3. The command-line-editor, even at height of 1, causes all windows to
" resize each time you do a ':' command. It's kind of annoying, though
" ultimately livable.
"nnoremap : q::startinsert<cr>
"set cmdwinheight=1

" Configure Universal Text Linking plugin.
let g:utl_cfg_hdl_scm_http_system = 'silent !/usr/bin/open -a "/Applications/Google Chrome.app" "%u"'

map <silent> ,r :e %<CR>
map ,q :q<CR>

" This makes it so that when you are navigating up and down in a long line
" that wraps on the screen, you will move one display line, instead of one
" physical line (as determined by the hard line break.)
nmap j gj
nmap k gk

" This should give Emacs style navigation within the command line window.
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
cnoremap <C-y>  <C-r>"

" Set the keys for repeating the previous search to use the absolute direction
" that the key indicates, rather than a direction relative to the last search
" performed. For example, if you search ?pattern, normally the next key n will
" search backwards, to match the direction of the most recent search. These
" mappings make it so that key n will search forward in all cases, no matter
" the direction of the most recent search.
nmap n /<CR>
nmap N ?<CR>

" Auto reload vimrc related changes on each save.
augroup reloadvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,nvimrc,*.vim so $MYVIMRC
augroup END

" Add an abbreviation so that %% is the directory of the current file. I tend
" to use %:h a lot, and this should be faster.
cabbr <expr> %% expand('%:p:h')

" Make it easy to get out of a help buffer.
autocmd FileType help nnoremap <silent> <buffer> <ESC> :bd<CR>
autocmd FileType help nnoremap <silent> <buffer> <C-C> :bd<CR>
autocmd FileType help nnoremap <silent> <buffer> q :bd<CR>

nnoremap <silent> yaF ggyG<C-o>
nnoremap <silent> yiF ggyG<C-o>
nnoremap <silent> viF ggVG
nnoremap <silent> vaF ggVG
nnoremap <silent> ciF ggVGc
nnoremap <silent> caF ggVGc

call SourceIfExists("~/.vimrc.local")

" You know how you have something in the buffer and you want to paste it
" several times, but each time you highlight a specific piece of text to
" replace, it ends up overwriting the default buffer with the selected text
" you are replacing? This mapping makes it so that the contents of the buffer
" are preserved after a visual paste.
vnoremap p "_dP

set textwidth=100
