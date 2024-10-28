local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag =  '0.1.2' })
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn[':TSUpdate']})
Plug "neovim/nvim-lspconfig"
Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "saadparwaiz1/cmp_luasnip"
Plug "L3MON4D3/LuaSnip"
Plug "SmiteshP/nvim-navic"
Plug "MunifTanjim/nui.nvim"
Plug "numToStr/Comment.nvim"
Plug "SmiteshP/nvim-navbuddy"
Plug ('fatih/vim-go', {['do'] = vim.fn['GoUpdateBinaries']})
Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'nanozuki/tabby.nvim'
Plug 'janko-m/vim-test'
Plug 'Aasim-A/scrollEOF.nvim'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
Plug 'rmagatti/goto-preview'


vim.call('plug#end')
