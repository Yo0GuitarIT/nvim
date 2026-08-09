return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            results_width = 0.4,
          },
        },
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    })
    pcall(require("telescope").load_extension, "fzf")
  end,
}
