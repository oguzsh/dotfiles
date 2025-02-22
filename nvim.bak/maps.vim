" Description: Keymaps

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

nnoremap <leader>/ :nohlsearch<CR>

" Comments
autocmd FileType javascript noremap <leader>[ :s/^/\/\/<cr>
autocmd FileType javascript noremap <leader>] :s/\/\//<cr>
autocmd FileType typescript noremap <leader>[ :s/^/\/\/<cr>
autocmd FileType typescript noremap <leader>] :s/\/\//<cr>
autocmd FileType ruby noremap <leader>[ :s/^/#<cr>
autocmd FileType ruby noremap <leader>] :s/#/<cr>
autocmd FileType python noremap <leader>[ :s/^/#<cr>
autocmd FileType python noremap <leader>] :s/#/<cr>
autocmd FileType go noremap <leader>[ :s/^/\/\/<cr>
autocmd FileType go noremap <leader>] :s/\/\//<cr>
autocmd FileType lua noremap <leader>[ :s/^/--<cr>
autocmd FileType lua noremap <leader>] :s/--/<cr>
autocmd FileType vim noremap <leader>[ :s/^/"<cr>
autocmd FileType vim noremap <leader>] :s/"/<cr>


" Moving Lines
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Stable cursor while searching
nnoremap n nzzzv
nnoremap N Nzzzv
" Stable cursing while merge line with the next line
nnoremap J mzJ`z
