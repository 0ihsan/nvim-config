lang en_GB.UTF-8

let g:wheel#map#down = '<c-j>'
let g:wheel#map#up   = '<c-k>'
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
au FileType markdown let b:delimitMate_nesting_quotes = ['`']
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}" " vim-closetag
aug fugitive
	ca git Git
	ca gw  Gwrite
	ca Gw  Gwrite
	ca GW  Gwrite
	ca ga  Git add
	ca Ga  Git add
	ca GA  Git add
	ca gl  vert Git log
	ca Gl  vert Git log
	ca GL  vert Git log
	ca grm GRemove
	ca Grm GRemove
	ca GRm GRemove
	ca gd  vert Git diff
	ca Gd  vert Git diff
	ca GD  vert Git diff
	ca gp  Git push
	ca Gp  Git push
	ca GP  Git push
	ca gs  vert Git
	ca Gs  vert Git
	ca GS  vert Git
	ca gc  tab Git commit
	ca Gc  tab Git commit
	ca GC  tab Git commit
aug end
aug InfoFileType
	au FileType info nm <silent> <buffer> <space> :Follow<cr>
aug end
nn ch :ColorHighlight<cr>
au WinEnter *.css ColorHighlight<cr>
let g:colorizer_disable_bufleave = 1
nn <silent><m-k> :Sayonara!<cr>
tma <silent> <m-k> <c-\><c-n>:Sayonara!<cr>
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'max_height': '20%',
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
      \       wilder#check({-> getcmdtype() ==# ':'}),
      \       {ctx, x -> wilder#cmdline#parse(x).cmd ==# 'Man' ? v:true : v:false},
      \     ],
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': has('nvim'),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

" list/array does not work for `next_key`. it takes only the first element into
" account.
call wilder#setup({
      \ 'modes': [':'],
      \ 'next_key': ['<Tab>', '<c-n>'],
      \ 'previous_key': ['<S-Tab>', '<c-p>'],
      \ })
let nix_recommended_style = 0
let g:everforest_enable_italic = 1
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1
let g:auto_dark_light_dark_theme = 'nightfox'
let g:auto_dark_light_dark_tgc    = 1

let g:auto_dark_light_light_theme = 'dawnfox'
let g:auto_dark_light_light_tgc   = 1
au FileType ledger nm <silent><tab> :set ep=ledger\ -f\ -\ print<cr>=
au FileType ledger xn <silent><tab> :<c-u>set ep=ledger\ -f\ -\ print<cr>gv=
au FileType ledger se commentstring=;\ %s
xm ga <Plug>(EasyAlign)
nm ga <Plug>(EasyAlign)
let g:limelight_default_coefficient = 0.8

nm <m-l> :Limelight!!<cr>
xm <m-l> <Plug>(Limelight)

let g:codi#interpreters = {
\   'python': {
\       'bin': 'python3',
\       'prompt': '^\(>>>\|\.\.\.\) ',
\       },
\   }
let g:ale_cpp_cc_executable = 'g++-11'
let g:ale_cpp_cc_options    = '-std=c++20 -Wall'

let g:ale_c_clang_options   = '-I/opt/homebrew/include -L/opt/homebrew/lib -I$HOME/include'
let g:ale_cpp_clang_options = '-I/opt/homebrew/include -L/opt/homebrew/lib -I$HOME/include'


if has('nvim-0.5')
" :TSInstall markdown
let g:compe                  = {}
let g:compe.autocomplete     = v:true
let g:compe.debug            = v:false
let g:compe.documentation    = v:true
let g:compe.enabled          = v:true
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width   = 80
let g:compe.max_kind_width   = 80
let g:compe.max_menu_width   = 80
let g:compe.min_length       = 1
let g:compe.preselect        = 'enable'
let g:compe.resolve_timeout  = 800
let g:compe.source           = {}
let g:compe.source.buffer    = v:true
let g:compe.source.calc      = v:true
let g:compe.source.emoji     = v:false
let g:compe.source.luasnip   = v:false
let g:compe.source.nvim_lsp  = v:true
let g:compe.source.nvim_lua  = v:true
let g:compe.source.path      = v:true
let g:compe.source.ultisnips = v:false
let g:compe.source.vsnip     = v:false
let g:compe.source_timeout   = 200
let g:compe.throttle_time    = 10
command Rg :FzfLua live_grep_native
nm <m-f> :FzfLua files<cr>
nm <m-s> :FzfLua blines<cr>
nm <m-b> :FzfLua buffers<cr>
nm <m-r> :FzfLua oldfiles<cr>
nm <m-h> :FzfLua help_tags<cr>
tma <m-r> <c-\><c-n>:FzfLua oldfiles<cr>
set completeopt=menuone,noselect
nn <silent> <c-tab>   <cmd>lua vim.lsp.buf.formatting()<cr>
nn <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<cr>
nn <silent> [d        <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nn <silent> ]d        <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nn <silent> glD       <cmd>lua vim.lsp.buf.declaration()<cr>
nn <silent> gld       <cmd>lua vim.lsp.buf.definition()<cr>
nn <silent> glh       <cmd>lua vim.lsp.buf.hover()<cr>
nn <silent> gli       <cmd>lua vim.lsp.buf.implementation()<cr>
nn <silent> glr       <cmd>lua vim.lsp.buf.references()<cr>
nn <silent> gls       <cmd>lua vim.lsp.buf.signature_help()<cr>
nn <silent> glt       <cmd>lua vim.lsp.buf.type_definition()<cr>
xn <silent> <c-tab>   :lua vim.lsp.buf.range_formatting()<cr>

lua <<EOF
-- disable diagnostcs globally
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

require'lspconfig'.clangd.setup{ cmd = { "clangd" } }
-- require'lspconfig'.eslint.setup{}
require'lspconfig'.flow.setup{}
require'lspconfig'.nimls.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.gopls.setup{}
-- require'lspconfig'.rls.setup{}
-- require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.sourcekit.setup{cmd={"xcrun","sourcekit-lsp"}}

require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 3000, -- do not enable if more than x lines
	},
	highlight = {
		enable = true, -- the whole extension
		disable = { "ledger" },
	},
}

EOF

else
let g:rainbow_active = 1
nm <m-f> :Files<cr>
nm <m-s> :BLines<cr>
nm <m-b> :Buffers<cr>
nm <m-r> :History<cr>
nm <m-h> :Helptags!<cr>
tma <m-r> <c-\><c-n>:History<cr>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)
" nm <silent> <m-2> :call fzf#run({'sink': 'e', 'left': '30%'})<cr>

let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = []
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_colors = {
	\ 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment']
\}

func! Dirname(key, val)
	return fnamemodify(a:val, ":h")
endf

func! OldDirs() " (unique dirs)
	call fzf#run(fzf#wrap({'sink':'tcd',
		\ 'source':uniq(sort(map(deepcopy(v:oldfiles), function('Dirname'))))}),
	\ {'options': [ '--prompt', 'Recent Dirs' ]})
endf

nm <silent> <m-d> :call OldDirs()<cr>

end

nohlsearch
