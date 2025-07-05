return {
	"RRethy/vim-illuminate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetype_overrides = {},
		filetypes_denylist = {
			"dirbuf",
			"dirvish",
			"fugitive",
		},
		filetypes_allowlist = {},
		modes_denylist = {},
		modes_allowlist = {},
		providers_regex_syntax_denylist = {},
		providers_regex_syntax_allowlist = {},
		under_cursor = true,
		large_file_cutoff = 10000,
		large_file_overrides = nil,
		min_count_to_highlight = 1,
		should_enable = function(bufnr) return true end,
		case_insensitive_regex = false,
		disable_keymaps = true,
	},
	config = function(_, opts)
		local illuminate = require("illuminate")
		illuminate.configure(opts)

		-- Keybindings for navigating references
		vim.keymap.set("n", "<C-n>", function() illuminate.goto_next_reference(true) end, { desc = "Next Reference" })
		vim.keymap.set("n", "<C-p>", function() illuminate.goto_prev_reference(true) end, { desc = "Previous Reference" })
		vim.keymap.set("n", "<C-f>", function() illuminate.textobj_select() end, { desc = "Find Reference" })
	end,
}
