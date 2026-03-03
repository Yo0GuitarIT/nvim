return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true, -- 切換 buffer 時自動展開並定位到該檔案
        update_root = false, -- 不自動變更根目錄
      },
    })
  end,
}
