local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
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

     view = {
       width = 40,
       side = 'left',
       signcolumn = 'yes',
     },

     log = {
       enable=true,
       truncate=true,
       types={
           diagnostics=true,
       },
     },
}
