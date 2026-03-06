local lazygit_buf = nil
local lazygit_win = nil

local function toggle_lazygit()
  if lazygit_win and vim.api.nvim_win_is_valid(lazygit_win) then
    vim.api.nvim_win_hide(lazygit_win)
    lazygit_win = nil
    return
  end

  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.9)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  if not lazygit_buf or not vim.api.nvim_buf_is_valid(lazygit_buf) then
    lazygit_buf = vim.api.nvim_create_buf(false, true)
  end

  lazygit_win = vim.api.nvim_open_win(lazygit_buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  if vim.bo[lazygit_buf].buftype ~= "terminal" then
    vim.fn.termopen("lazygit", {
      on_exit = function()
        if lazygit_win and vim.api.nvim_win_is_valid(lazygit_win) then
          vim.api.nvim_win_hide(lazygit_win)
          lazygit_win = nil
        end
        if lazygit_buf and vim.api.nvim_buf_is_valid(lazygit_buf) then
          vim.api.nvim_buf_delete(lazygit_buf, { force = true })
          lazygit_buf = nil
        end
      end,
    })
  end

  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>gg", toggle_lazygit, { silent = true, desc = "Toggle Lazygit" })
