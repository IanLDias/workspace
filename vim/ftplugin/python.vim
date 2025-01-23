" ~/.vim/ftplugin/python.vim

" PEP 8 indentation
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

" Enable folding
setlocal foldmethod=indent
setlocal foldlevel=99

" Enable autocompletion
setlocal omnifunc=pythoncomplete#Complete

" Run Python files with F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" ALE for Python settings
" --------------------------------
"
" Enable Ruff for linting
let b:ale_linters = ['ruff']

" Use Ruff for fixing as well
let b:ale_fixers = ['ruff']

" Ruff options
let g:ale_python_ruff_options = '--select ALL'

" Configure ALE to run automatically
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" Set this to 0 if you want to disable fixing on save
let g:ale_fix_on_save = 0

" Customize error/warning signs
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" Configure the error message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Enable completion
let g:ale_completion_enabled = 1

" Customize the loclist and quickfix behavior
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" ['all', 'current', 'disabled']
let g:ale_virtualtext_cursor = 'all'
let g:ale_virtualtext_delay = 1

" Optional: Enable hover balloons for more info (Vim 8.1+ with +balloon_eval_term)
let g:ale_set_balloons = 1

" Optional: Key mappings for navigation
nmap <silent> [g <Plug>(ale_previous_wrap)
nmap <silent> ]g <Plug>(ale_next_wrap)

" Optional: Key mapping for showing error details
nmap <silent> <leader>d <Plug>(ale_detail)
