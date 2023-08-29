-- Function to check if backspace should be inserted
local function CheckBackspace()
    local col = vim.fn.col('.') - 1
    local line = vim.fn.getline('.')
    return col == 0 or string.find(line:sub(col, col), '%s') ~= nil
end

-- Tab completion function
function TabCompletion()
    if vim.fn['coc#pum#visible']() then
        return vim.fn['coc#_select_confirm']()
    elseif vim.fn['coc#expandableOrJumpable']() then
        return vim.fn['coc#rpc#request']('doKeymap', {'snippets-expand-jump', ''}) .. '<CR>'
    elseif CheckBackspace() then
        return '<TAB>'
    else
        return vim.fn['coc#refresh']()
    end
end

-- Custom Tab mapping
vim.api.nvim_set_keymap('i', '<TAB>', 'v:lua.TabCompletion()', {expr = true, noremap = true, silent = true})

-- Set the global variable
vim.g.coc_snippet_next = '<tab>'

-- Use <C-l> for trigger snippet expand.
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(coc-snippets-expand)', {noremap = true, silent = true})

-- Use <C-j> for select text for visual placeholder of snippet.
vim.api.nvim_set_keymap('v', '<C-j>', '<Plug>(coc-snippets-select)', {noremap = true, silent = true})

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
vim.g.coc_snippet_next = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
vim.g.coc_snippet_prev = '<c-k>'

-- Use <C-j> for both expand and jump (make expand higher priority.)
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(coc-snippets-expand-jump)', {noremap = true, silent = true})

-- Use <leader>x for convert visual selected code to snippet
vim.api.nvim_set_keymap('x', '<leader>x', '<Plug>(coc-convert-snippet)', {noremap = true, silent = true})

