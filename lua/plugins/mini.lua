return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.pairs").setup()
    require("mini.icons").setup({
      style = "glyph",
      -- 這裡可加自訂圖示
    })
    -- 統一圖示提供者
    MiniIcons.mock_nvim_web_devicons()
    -- 延遲讓 LSP kind 也帶圖示（可選）
    vim.defer_fn(function()
      MiniIcons.tweak_lsp_kind("prepend")
    end, 0)
  end,
}
