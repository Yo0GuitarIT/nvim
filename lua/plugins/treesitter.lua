return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  init = function()
    -- 確保前端相關解析器已安裝（非同步，無重複安裝問題）
    require("nvim-treesitter").install({
      "javascript",
      "typescript",
      "tsx",
      "jsx",
      "html",
      "css",
    })
  end,
}
