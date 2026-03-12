vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Buffer navigation
vim.keymap.set("n", "L", ":bnext<CR>", { silent = true, desc = "Next buffer" })
vim.keymap.set("n", "H", ":bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- Delete buffer (使用 mini.bufremove 保持視窗佈局)
vim.keymap.set("n", "<leader>bd", function()
  local bd = require("mini.bufremove").delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
    if choice == 1 then
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = "Delete Buffer" })

-- NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Explorer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to Upper Window" })

-- Window split
vim.keymap.set("n", "<leader>-", ":split<CR>", { silent = true, desc = "Split Horizontal" })
vim.keymap.set("n", "<leader>|", ":vsplit<CR>", { silent = true, desc = "Split Vertical" })
vim.keymap.set("n", "<leader>wc", ":close<CR>", { silent = true, desc = "Close Current Window" })

-- Window resize
vim.keymap.set("n", "<M-j>", ":resize +2<CR>", { silent = true, desc = "Increase Height" })
vim.keymap.set("n", "<M-k>", ":resize -2<CR>", { silent = true, desc = "Decrease Height" })
vim.keymap.set("n", "<M-l>", ":vertical resize -2<CR>", { silent = true, desc = "Decrease Width" })
vim.keymap.set("n", "<M-h>", ":vertical resize +2<CR>", { silent = true, desc = "Increase Width" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { silent = true, desc = "Equal Window Sizes" })

-- Diagnostics (Neovim 0.11+ 建議映射)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list" })

-- Terminal Toggle (保持原有邏輯但微調)
local term_buf = nil
local term_win = nil

local function toggle_terminal()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_hide(term_win)
    term_win = nil
  else
    vim.cmd("botright 10split") -- 稍微加大一點終端機視窗
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
      vim.api.nvim_win_set_buf(0, term_buf)
    else
      vim.cmd("terminal")
      term_buf = vim.api.nvim_get_current_buf()
      vim.bo[term_buf].buflisted = false
    end
    term_win = vim.api.nvim_get_current_win()
    vim.cmd("startinsert")
  end
end

vim.keymap.set("n", "<leader>t", toggle_terminal, { silent = true, desc = "Toggle Terminal" })

-- Terminal mode keymaps
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- Search and Replace Word under cursor
vim.keymap.set(
  "n",
  "<leader>S",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word" }
)

-- Lazygit floating window
require("config.lazygit")
