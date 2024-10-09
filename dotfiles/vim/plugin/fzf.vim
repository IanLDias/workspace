set rtp+=/opt/homebrew/opt/fzf

" Basic FZF options
let g:fzf_layout = { 'down': '~40%' }

" Enable per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" File searching
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fr :History<CR>

" Text searching
nnoremap <Leader>/ :Rg<CR>
" Buffer operations
nnoremap <Leader>fb :Buffers<CR>

" Git operations
nnoremap <Leader>fg :GFiles?<CR>

" Search in current buffer directory
nnoremap <Leader>f. :Files <C-r>=expand("%:h")<CR>/<CR>

" Improved Ripgrep configuration
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.
  \   '--glob "!.git/*" '.
  \   '--glob "!tags" '.
  \   shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
