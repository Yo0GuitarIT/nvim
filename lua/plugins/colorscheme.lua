return {
  "shaunsingh/nord.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_disable_background = true -- Transparent background
    vim.g.nord_italic = true
    vim.g.nord_bold = true
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    require("nord").set()
  end,
}
