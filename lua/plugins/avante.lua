return {
  {
    -- avante 需要的 copilot provider（與 autocomplete 用的 github/copilot.vim 獨立）
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false }, -- 停用 suggestion（由 github/copilot.vim 負責）
        panel = { enabled = false }, -- 停用 panel（由 github/copilot.vim 負責）
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- 不要設為 "*"
    build = "make",
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4.6", -- 可用 :AvanteModels 查看當前帳號所有可用模型後再切換
          extra_request_body = {
            temperature = 0,
            max_tokens = 8192,
          },
        },
      },
      behaviour = {
        auto_suggestions = false, -- 避免與 copilot autocomplete 衝突
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
      },
      windows = {
        position = "right",
        width = 30,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      "nvim-tree/nvim-web-devicons",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
