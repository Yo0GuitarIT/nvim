-- 如果你已安裝並在終端機中選擇了 Nerd Font，請設置為 true
vim.g.have_nerd_font = true

-- [[ 設置選項 ]]
-- 參見 `:help vim.opt`

-- 預設顯示行號
vim.opt.number = true
-- 相對行號，幫助跳轉
vim.opt.relativenumber = true

-- 啟用滑鼠模式，例如可用於調整分割視窗大小
vim.opt.mouse = "a"

-- 不顯示模式，因為狀態列已經顯示
vim.opt.showmode = false

-- 在作業系統和 Neovim 之間同步剪貼簿
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- 啟用斷行縮排
vim.opt.breakindent = true

-- 儲存復原歷史記錄
vim.opt.undofile = true

-- 不區分大小寫搜尋，除非搜尋詞中包含 \C 或一個或多個大寫字母
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 預設保持符號列開啟
vim.opt.signcolumn = "yes"

-- 減少更新時間
vim.opt.updatetime = 250

-- 減少按鍵序列等待時間
vim.opt.timeoutlen = 1000

-- 配置新分割視窗的開啟方式
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 使用空格而非 Tab
vim.opt.expandtab = true
-- 使用 << 和 >> 時的空格大小
vim.opt.shiftwidth = 2
-- Tab 鍵的空格大小
vim.opt.tabstop = 2
-- 按下 Tab 鍵時的空格數
vim.opt.softtabstop = 2

-- 縮排選項
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- 設置 Neovim 在編輯器中顯示特定空白字元的方式
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- 即時預覽替換，邊輸入邊顯示
vim.opt.inccommand = "split"

-- 顯示游標所在的行
vim.opt.cursorline = true

-- 游標上下保持的最小螢幕行數
vim.opt.scrolloff = 10

-- 如果執行的操作會因緩衝區中未儲存的變更而失敗（例如 `:q`）
-- 則顯示對話框詢問是否要儲存目前檔案
-- 參見 `:help 'confirm'`
vim.opt.confirm = true

-- 啟用真彩色支援
vim.opt.termguicolors = true

-- [[ 基本自動命令 ]]
-- 參見 `:help lua-guide-autocommands`

-- 複製文字時高亮顯示
-- 在普通模式下用 `yap` 試試
-- 參見 `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "複製文字時高亮顯示",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
