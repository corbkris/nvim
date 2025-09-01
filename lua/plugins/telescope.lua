local Plugin = { 'nvim-telescope/telescope.nvim' }
local is_unix = vim.fn.has('unix') == 1 or vim.fn.has('mac') == 1

Plugin.branch = '0.1.x'

Plugin.build = false

Plugin.dependencies = {
	{ 'nvim-lua/plenary.nvim',                 build = false },
	{ 'natecraddock/telescope-zf-native.nvim', build = false },
}

Plugin.cmd = { 'Telescope' }

function Plugin.init()
	-- See :help telescope.builtin
	--
	vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>', { desc = 'Search file history' })
	vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>', { desc = 'Search open files' })
	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Search all files' })
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Search in project' })
	vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Search diagnostics' })
	vim.keymap.set('n', '<leader>fD', '<cmd>Telescope diagnostics bufnr=0<CR>', { desc = 'Search diagnostics in current buffer' })
	vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Buffer local search' })

	vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true })
end

function Plugin.config()
	pcall(require('telescope').load_extension, 'zf-native')
end

return Plugin
