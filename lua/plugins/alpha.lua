return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-mini/mini.nvim" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 設定 header
    dashboard.section.header.val = {
      "__/\\\\\\________/\\\\\\___________________/\\\\\\\\\\\\\\_______________/\\\\\\________/\\\\\\___________________________        ",
      " _\\///\\\\\\____/\\\\\\/__________________/\\\\\\/////\\\\\\____________\\/\\\\\\_______\\/\\\\\\___________________________       ",
      "  ___\\///\\\\\\/\\\\\\/___________________/\\\\\\____\\//\\\\\\___________\\//\\\\\\______/\\\\\\___/\\\\\\_____________________      ",
      "   _____\\///\\\\\\/__________/\\\\\\\\____\\/\\\\\\_____\\/\\\\\\____________\\//\\\\\\____/\\\\\\___\\///_____/\\\\\\\\__/\\\\\\\\___     ",
      "    _______\\/\\\\\\_________/\\\\\\///\\\\\\__\\/\\\\\\_____\\/\\\\\\_____________\\//\\\\\\__/\\\\\\_____/\\\\\\__/\\\\\\///\\\\\\\\\\///\\\\\\     ",
      "     _______\\/\\\\\\________/\\\\\\__\\//\\\\\\_\\/\\\\\\_____\\/\\\\\\______________\\//\\\\\\/\\\\\\_____\\/\\\\\\_\\/\\\\\\_\\//\\\\\\__\\/\\\\\\   ",
      "      _______\\/\\\\\\_______\\//\\\\\\__/\\\\\\__\\//\\\\\\____/\\\\\\________________\\//\\\\\\\\\\______\\/\\\\\\_\\/\\\\\\__\\/\\\\\\__\\/\\\\\\  ",
      "       _______\\/\\\\\\________\\///\\\\\\\\\\/____\\///\\\\\\\\\\\\\\//__________________\\//\\\\\\_______\\/\\\\\\_\\/\\\\\\__\\/\\\\\\__\\/\\\\\\ ",
      "        _______\\///___________\\/////________\\///////_____________________\\///________\\///__\\///___\\///___\\///__",
    }
    dashboard.section.header.opts.hl = "Title"

    -- 設定按鈕
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find files", ":Telescope find_files <CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
      dashboard.button("l", "  Lazy", ":Lazy<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- 設定各區塊間距以達到垂直置中效果
    local section_marg = function(margval)
      return { type = "padding", val = margval }
    end

    dashboard.config.layout = {
      section_marg(8),
      dashboard.section.header,
      section_marg(2),
      dashboard.section.buttons,
      section_marg(1),
      dashboard.section.footer,
    }

    -- 設定 footer
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    end

    dashboard.section.footer.val = footer()

    -- 關閉 nvim-tree 和 bufferline 在啟動畫面的衝突
    dashboard.opts.opts.noautocmd = true

    -- 送出設定到 alpha
    alpha.setup(dashboard.opts)

    -- 在檔案載入後隱藏 alpha
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
