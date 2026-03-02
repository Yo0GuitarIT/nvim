return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    win = {
      border = "single",
      padding = { 1, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- 註冊快捷鍵組別說明
    wk.add({
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code/Copilot" },
      { "<leader>ct", desc = "Toggle Copilot" },
      { "<leader>d", group = "Document" },
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>g", group = "Git (Fugitive)" },
      { "<leader>h", group = "Hunk (Gitsigns)" },
      { "<leader>s", group = "Search/Noice" },
      { "<leader>sn", group = "Noice" },
      { "<leader>t", group = "Toggle/Terminal" },
      { "<leader>w", group = "Window" },
      -- Fold (nvim-ufo)
      { "z",  group = "Fold" },
      { "zR", desc = "Open all folds" },
      { "zM", desc = "Close all folds" },
      { "zr", desc = "Open folds except kinds" },
      { "zm", desc = "Close folds with level" },
      { "za", desc = "Toggle fold" },
      { "zo", desc = "Open fold" },
      { "zc", desc = "Close fold" },
      { "zO", desc = "Open fold recursively" },
      { "zC", desc = "Close fold recursively" },
      { "K",  desc = "Peek fold / Hover" },
    })
  end,
}
