vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.errorbells = false
vim.opt.belloff = "all"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.updatetime = 50
vim.opt.mouse = "n" -- mouse in NORMAL mode only
vim.opt.colorcolumn = "100"
vim.opt.backspace = "indent,eol,start"
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.list = true
vim.opt.listchars = "eol: ,tab:>·,trail:~,extends:>,precedes:<"
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.wildmenu = true
vim.opt.shortmess:append("c")
vim.opt.clipboard = ""
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.spell = false
vim.opt.complete = ".,w,b,u,t,i,kspell"
vim.opt.omnifunc = "syntaxcomplete#Complete"

vim.cmd([[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
]])
