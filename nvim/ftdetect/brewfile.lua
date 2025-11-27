vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "Brewfile",
  command = "set filetype=ruby"
})
