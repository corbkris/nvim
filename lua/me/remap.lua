vim.g.mapleader = " "
vim.keymap.set("n", "<leader>a", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<C-a>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Double quote
vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true, silent = true })

-- Single quote
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true, silent = true })

-- Backtick
vim.api.nvim_set_keymap('i', "`", "``<left>", { noremap = true, silent = true })

-- Curly brace
vim.api.nvim_set_keymap('i', "{", "{}<left>", { noremap = true, silent = true })

-- Parenthesis
vim.api.nvim_set_keymap('i', "(", "()<left>", { noremap = true, silent = true })

-- Square bracket
vim.api.nvim_set_keymap('i', "[", "[]<left>", { noremap = true, silent = true })



vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gdp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
vim.keymap.set("n", "gD", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap=true})
