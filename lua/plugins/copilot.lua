return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    -- 建議設定
    vim.g.copilot_no_tab_map = true -- 停用預設的 Tab 映射,我們自己配置
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_filetypes = {
      ["*"] = true,
      ["TelescopePrompt"] = false,
      ["alpha"] = false,
    }

    -- 切換 Copilot 啟用/停用
    vim.keymap.set("n", "<leader>ct", function()
      if vim.g.copilot_enabled == false then
        vim.cmd("Copilot enable")
        vim.notify("Copilot 已啟用", vim.log.levels.INFO)
      else
        vim.cmd("Copilot disable")
        vim.notify("Copilot 已停用", vim.log.levels.WARN)
      end
    end, { desc = "Toggle Copilot", silent = true })
  end,
}
