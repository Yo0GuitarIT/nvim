return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- 所有檔案類型
      options = {
        parsers = {
          css = true, -- 啟用所有 CSS 功能 (#RGB, #RRGGBB, #RRGGBBAA, names, rgb(), hsl())
          css_fn = true, -- 啟用所有 CSS 函數 (rgb(), hsl(), oklch())
        },
      },
    })
  end,
}
