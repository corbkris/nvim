return {
	'joshdick/onedark.vim',
	config = function()
		-- Set line numbering options
		vim.opt.number = true
		vim.opt.relativenumber = true

		-- Create an autocommand to adjust highlights on ColorScheme change
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				local highlights = {
					'Normal',
					'LineNr',
					'Folded',
					'NonText',
					'SpecialKey',
					'VertSplit',
					'SignColumn',
					'EndOfBuffer',
					'TablineFill', -- Specific to tabline appearance
					'LineNr',
				}
				for _, name in ipairs(highlights) do
					vim.cmd.highlight(name .. ' guibg=none ctermbg=none')
				end
			end,
		})

		-- Set the colorscheme, defaulting to 'onedark' if none is specified
		vim.cmd('colorscheme ' .. (vim.g.colors_name or 'onedark'))

		-- Set specific highlight groups
		vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'grey', bold = false })
		vim.api.nvim_set_hl(0, 'LineNr', { fg = 'blue', bold = false })
		vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'grey', bold = false })
		vim.api.nvim_set_hl(0, 'TreesitterContext', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = 'NONE', fg = 'NONE' })
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
		vim.api.nvim_set_hl(0, 'NavBuddyColors', { bg = 'blue', bold = true })
	end,
}
