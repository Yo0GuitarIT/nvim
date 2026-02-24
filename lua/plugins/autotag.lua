return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "InsertEnter",
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        enable_close = true, -- 自動關閉標籤
        enable_rename = true, -- 自動重命名配對的標籤
        enable_close_on_slash = true, -- 在 /> 時自動關閉
      },
    })
  end,
}
