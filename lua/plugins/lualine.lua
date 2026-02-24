return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.nvim" },
  config = function()
    require("lualine").setup({
      options = { theme = "auto" }, -- 自動跟隨 colorscheme
    })
  end,
}
