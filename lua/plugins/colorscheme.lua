return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = true, -- 透明背景
        terminal_colors = true,
        dim_inactive = false,
        styles = {
          comments = "italic",
          keywords = "italic",
          statements = "bold",
        },
      },
    })
    vim.cmd("colorscheme terafox")
  end,
}
