-- Keymaps
vim.keymap.set('n', '<leader>ex', vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Sets
-- Set the colorscheme
vim.cmd.colorscheme('rose-pine-main')

-- Set line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set tab stops
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Keep long running undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.updatetime = 50

