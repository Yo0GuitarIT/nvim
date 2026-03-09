return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && pnpm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_theme = "dark"
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", ft = "markdown", desc = "Markdown Preview Toggle" },
  },
}
