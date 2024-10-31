return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"SmiteshP/nvim-navic",
		"SmiteshP/nvim-navbuddy",
		"vim-airline/vim-airline",
		"numToStr/Comment.nvim", -- Optional
		"lukas-reineke/lsp-format.nvim",
	},

	config = function()
		vim.opt.updatetime = 350
		vim.opt.signcolumn = "yes"
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require('lspconfig')
		local navic = require("nvim-navic") -- Make sure to require navic
		local navbuddy = require("nvim-navbuddy")
		local formatter = require("lsp-format")




		vim.g.airline_section_c = "%{%v:lua.require'nvim-navic'.get_location()%}"
		--		vim.g.airline_section_c = "%{%v:lua.require'lsp.navic'.get_location()%}"

		-- Define on_attach function
		local on_attach = function(client, bufnr)
			-- Attach navic if the client supports document symbols
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
				navbuddy.attach(client, bufnr)
				formatter.on_attach(client, bufnr)
			end
			-- Additional on_attach configurations can go here
		end

		-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
		local servers = { 'gopls', 'rust_analyzer', 'ts_ls', 'clangd', 'lua_ls' } -- Added 'clangd'
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup {
				settings = {
					gopls = {
						gofumpt = true
					}
				},
				on_attach = on_attach, -- Use the on_attach function
				capabilities = capabilities,
			}
		end

		-- luasnip setup
		local luasnip = require 'luasnip'

		-- nvim-cmp setup
		local cmp = require 'cmp'
		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
				['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				},
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			},
		}
	end
}
