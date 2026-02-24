return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false, -- 編譯 colorscheme 以加速啟動
      undercurl = true, -- 啟用波浪底線
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- 不設定背景色（true 則透明背景）
      dimInactive = false, -- 暗化非作用中視窗
      terminalColors = true, -- 定義 vim.g.terminal_color_{0,17}
      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none", -- 移除 gutter 背景
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- 透明浮動視窗
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- 深色背景輔助 hlgroup（用於 TermOpen 等場合）
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- 插件浮動視窗背景
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Telescope 無邊框樣式
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- 深色補全選單
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
      theme = "dragon", -- 載入 "dragon" 主題（可選 "wave" 或 "lotus"）
      background = {
        dark = "dragon", -- vim.o.background = "dark" 時使用
        light = "lotus", -- vim.o.background = "light" 時使用
      },
    })
    vim.cmd("colorscheme kanagawa")
  end,
}
