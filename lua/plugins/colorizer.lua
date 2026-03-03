return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- 所有檔案類型
      user_default_options = {
        RGB = true, -- #RGB
        RRGGBB = true, -- #RRGGBB
        names = true, -- "blue" 等顏色名稱
        RRGGBBAA = true, -- #RRGGBBAA
        rgb_fn = true, -- rgb() 和 rgba()
        hsl_fn = true, -- hsl() 和 hsla()
        css = true, -- 啟用所有 CSS 功能
        css_fn = true, -- 啟用所有 CSS 函數
      },
    })
  end,
}
