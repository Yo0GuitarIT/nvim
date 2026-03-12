return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.pairs").setup()
    require("mini.icons").setup({
      style = "glyph",
    })
    require("mini.bufremove").setup() -- 啟用 bufremove
    MiniIcons.mock_nvim_web_devicons()
    vim.defer_fn(function()
      MiniIcons.tweak_lsp_kind("prepend")
    end, 0)
  end,
}
