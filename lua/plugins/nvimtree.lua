return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true, -- Load this only when required by another plugin
	},
	{
		"nvim-tree/nvim-tree.lua",
		keys = { "<C-a>", "<C-l>" }, -- Lazy load on <C-a> or <C-l>
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- Default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- Custom mappings
				vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				disable_netrw = true,
				hijack_cursor = true,
				diagnostics = {
					enable = true,
					show_on_dirs = true,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				filesystem_watchers = {
					enable = true,
					debounce_delay = 50,
				},
				view = {
					width = 40,
					side = "left",
					signcolumn = "yes",
				},
				log = {
					enable = true,
					truncate = true,
					types = {
						diagnostics = true,
					},
				},
			})

			-- Key mappings for toggling and finding files
			vim.api.nvim_set_keymap("n", "<C-a>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<C-l>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
		end,
	},
}
