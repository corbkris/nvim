local TreesitterPlugin = { 'nvim-treesitter/nvim-treesitter' }

TreesitterPlugin.main = 'nvim-treesitter.configs'

TreesitterPlugin.dependencies = {
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	{ 'nvim-treesitter/nvim-treesitter-context' },
}


-- See :help nvim-treesitter-modules
TreesitterPlugin.opts = {
	auto_install = true,

	highlight = {
		enable = true,
	},

	-- :help nvim-treesitter-textobjects-modules
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			}
		},
	},

	ensure_installed = {
		'vim',
		'vimdoc',
		"c",
		"lua",
		"go",
		"gomod",
		"gowork",
		"gosum",
		"gotmpl",
		"query",
		"markdown",
		"markdown_inline",
		"rust",
		"javascript",
		"json",
		"typescript",
		"tsx"
	},
}

local TreesitterContextPlugin = {
	'nvim-treesitter/nvim-treesitter-context',
	config = function()
		require('treesitter-context').setup {
			enable = true,
			multiwindow = false,
			max_lines = 0,
			max_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = 'outer',
			mode = 'topline',
			seperator = nil,
			zindex = 20,
			on_attach = nil,
		}
	end
}

return { TreesitterPlugin, TreesitterContextPlugin }
