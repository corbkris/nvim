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
