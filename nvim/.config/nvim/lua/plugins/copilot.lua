vim.g.copilot_fyletypes = {
    ["*"] = false,
    ["lua"] = false,
    ["javascript"] = true,
    ["typescript"] = true,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c))"] = true,
    ["go"] = true,
    ["python"] = true,
}

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.api.nvim_set_keymap("i", "<C-W>", 'copilot#Accept("<CR>")', { silent =  true, expr = true })

vim.cmd[[highlight CopilotSuggestion guifg=#f6d55c ctermfg=8]]
