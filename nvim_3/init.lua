require("mackay.core.options")
require("mackay.core")
require("mackay.lazy")
-- Use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Map keybindings for copy and paste
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-v>", "<C-r><C-o>+", { noremap = true, silent = true })
