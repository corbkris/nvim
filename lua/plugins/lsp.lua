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
		"SmiteshP/nvim-navbuddy",
		"numToStr/Comment.nvim", -- Optional
		"lukas-reineke/lsp-format.nvim",
	},

	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require('lspconfig')
		local navbuddy = require('nvim-navbuddy')
		local formatter = require("lsp-format")


		-- Show line diagnostics automatically in hover window
		vim.o.updatetime = 200
		vim.opt.signcolumn = "yes"


		vim.diagnostic.config({
			virtual_text = false
		})

		vim.api.nvim_set_keymap(
			'n',
			'<leader>d',
			':lua vim.diagnostic.open_float()<CR>',
			{ noremap = true, silent = true }
		)




		-- Define on_attach function
		local on_attach = function(client, bufnr)
			-- Attach navic if the client supports document symbols
			if client.server_capabilities.documentSymbolProvider then
				navbuddy.attach(client, bufnr)
				formatter.on_attach(client, bufnr)
			end
			handlers = handlers
			-- Additional on_attach configurations can go here
		end

		local server_configs = {
			gopls = {
				settings = {
					gopls = {
						gofumpt = true,
						staticcheck = true,
					},
				},
			},
			rust_analyzer = {
				settings = {
					['rust-analyzer'] = {
						diagnostics = {
							enable = true, -- Disables diagnostics provided by rust-analyzer
						},
					},
				},
			},
			ts_ls = {},
			clangd = {},
			lua_ls = {},
			solargraph = {},
			zls = {},
		}

		-- Set up each language server with common capabilities and on_attach
		for lsp, config in pairs(server_configs) do
			lspconfig[lsp].setup(vim.tbl_deep_extend("force", {
				on_attach = on_attach,
				capabilities = capabilities,
			}, config))
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
