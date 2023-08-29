local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag =  '0.1.2' })
Plug ('fatih/vim-go', {['do'] = vim.fn['GoUpdateBinaries']})
Plug ('neoclide/coc.nvim', {branch = 'release'})

--Plug 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
--Plug 'hrsh7th/nvim-cmp' -- Autocompletion plugin
--Plug 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
--Plug 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
--Plug 'L3MON4D3/LuaSnip' -- Snippets plugin
--Plug 'ray-x/lsp_signature.nvim'

vim.call('plug#end')
