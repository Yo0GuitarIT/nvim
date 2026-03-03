vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Buffer navigation
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true })

-- 關閉 buffer 時跳過 NvimTree，避免直接顯示 file explorer
local function smart_bdelete()
  local cur_buf = vim.api.nvim_get_current_buf()
  local bufs = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_valid(b)
      and vim.bo[b].buflisted
      and vim.bo[b].filetype ~= "NvimTree"
      and b ~= cur_buf
  end, vim.api.nvim_list_bufs())

  if #bufs > 0 then
    vim.api.nvim_set_current_buf(bufs[#bufs])
  else
    vim.cmd("enew") -- 沒有其他 buffer 時開一個空白 buffer
  end
  vim.api.nvim_buf_delete(cur_buf, { force = false })
end

vim.keymap.set("n", "<leader>bd", smart_bdelete, { silent = true, desc = "Delete buffer (skip NvimTree)" })

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })

-- Window split
vim.keymap.set("n", "<leader>-", ":split<CR>", { silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { silent = true, desc = "Close current window" })

-- Window resize
vim.keymap.set("n", "<M-j>", ":resize +2<CR>", { silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<M-k>", ":resize -2<CR>", { silent = true, desc = "Decrease window height" })
vim.keymap.set("n", "<M-l>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease window width" })
vim.keymap.set("n", "<M-h>", ":vertical resize +2<CR>", { silent = true, desc = "Increase window width" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { silent = true, desc = "Equal window sizes" })

-- Terminal Toggle
local term_buf = nil
local term_win = nil

local function toggle_terminal()
  -- 檢查終端窗口是否存在且有效
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    -- 隱藏終端窗口
    vim.api.nvim_win_hide(term_win)
    term_win = nil
  else
    -- 開啟終端窗口
    vim.cmd("botright 5split")

    -- 如果終端 buffer 存在且有效，使用它
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.api.nvim_win_set_buf(0, term_buf)
    else
      -- 創建新的終端
      vim.cmd("terminal")
      term_buf = vim.api.nvim_get_current_buf()

      -- 設置 buffer 選項：不列在 buffer 列表中
      vim.bo[term_buf].buflisted = false
    end

    term_win = vim.api.nvim_get_current_win()

    -- 進入插入模式
    vim.cmd("startinsert")
  end
end

vim.keymap.set("n", "<leader>t", toggle_terminal, { silent = true, desc = "Toggle Terminal" })

-- Terminal mode keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true, desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true, desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true, desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true, desc = "Go to right window" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
