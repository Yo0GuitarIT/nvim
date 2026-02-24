require("config.options")
require("config.keymaps")
require("config.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "astro", "javascript", "typescript", "tsx", "jsx", "html", "css" },
  callback = function()
    vim.treesitter.start()
  end,
})
