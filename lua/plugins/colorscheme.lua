return {
  "vcraescu/islands-dark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    require("islands-dark").setup({
      transparent = true,
    })
    vim.cmd.colorscheme("islands-dark")
  end,
}
