
nnoremap <BS> ciw

" LSP" LSP Navigation
nnoremap <silent> gd :LspGotoDefinition<CR>
nnoremap <silent> gD :LspGotoDeclaration<CR>
nnoremap <silent> gi :LspGotoImpl<CR>
nnoremap <silent> gt :LspGotoTypeDef<CR>
nnoremap <silent> gr :LspShowReferences<CR>

" LSP Information
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <C-k> :LspShowSignature<CR>

" LSP Actions
nnoremap <silent> <leader>lrn :LspRename<CR>
nnoremap <silent> <leader>lca :LspCodeAction<CR>
nnoremap <silent> <leader>lcl :LspCodeLens<CR>

" LSP Diagnostics
nnoremap <silent> [d :LspDiag prev<CR>
nnoremap <silent> ]d :LspDiag next<CR>
nnoremap <silent> <leader>ld :LspDiag show<CR>

" LSP Symbols and Outline
nnoremap <silent> <leader>lo :LspOutline<CR>
nnoremap <silent> <leader>ls :LspDocumentSymbol<CR>
nnoremap <silent> <leader>lS :LspSymbolSearch<CR>

" LSP Formatting
nnoremap <silent> <leader>f :LspFormat<CR>

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let NERDTreeHijackNetrw=1
