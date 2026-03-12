return {
  "yousefhadder/markdown-plus.nvim",
  ft = "markdown", -- 僅在 markdown 檔案中載入
  version = "*", -- 使用穩定版本
  opts = {
    -- 這裡可以放入您的自定義配置，預設設定已經非常強大
    -- 例如：
    -- table = {
    --   mappings = {
    --     insert_row_below = "<M-o>",
    --     insert_row_above = "<M-O>",
    --   },
    -- },
  },
  config = function(_, opts)
    require("markdown-plus").setup(opts)
  end,
}
