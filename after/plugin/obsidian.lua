vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    if string.match(vim.fn.expand('%:p'), '~/vaults') then
      vim.cmd("highlight markdownLinkText cterm=underline gui=underline")
    end
  end,
})

