vim.opt.number = true
vim.opt.relativenumber = true
--vim.cmd('colorscheme elflord')
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
      'TablineFill', -- this is specific to how I like my tabline to look like
      'LineNr',
    }
    for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end
end,
})

vim.cmd('colorscheme ' .. (vim.g.colors_name or 'onedark'))


vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='grey', bold = false })
vim.api.nvim_set_hl(0, 'LineNr', { fg='blue', bold = false })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='grey', bold = false })
