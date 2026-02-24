return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- Lua
          "pyright", -- Python
          "ts_ls", -- TypeScript/JavaScript
          "astro", -- Astro
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP 快捷鍵設定
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          local builtin = require("telescope.builtin")

          -- Go to definition (使用 Telescope)
          vim.keymap.set("n", "gd", function()
            builtin.lsp_definitions({ reuse_win = true })
          end, vim.tbl_extend("force", opts, { desc = "Goto Definition" }))

          -- Go to declaration
          vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            vim.tbl_extend("force", opts, { desc = "Goto Declaration" })
          )

          -- Go to implementation (使用 Telescope)
          vim.keymap.set("n", "gI", function()
            builtin.lsp_implementations({ reuse_win = true })
          end, vim.tbl_extend("force", opts, { desc = "Goto Implementation" }))

          -- Go to type definition (使用 Telescope)
          vim.keymap.set("n", "gy", function()
            builtin.lsp_type_definitions({ reuse_win = true })
          end, vim.tbl_extend("force", opts, { desc = "Goto Type Definition" }))

          -- Show references (使用 Telescope)
          vim.keymap.set("n", "gr", function()
            builtin.lsp_references()
          end, vim.tbl_extend("force", opts, { desc = "References", nowait = true }))

          -- Hover documentation
          vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))

          -- Signature help
          vim.keymap.set(
            "n",
            "gK",
            vim.lsp.buf.signature_help,
            vim.tbl_extend("force", opts, { desc = "Signature Help" })
          )

          -- Rename symbol
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))

          -- Code action
          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            vim.tbl_extend("force", opts, { desc = "Code Action" })
          )

          -- Document symbols (額外功能)
          vim.keymap.set(
            "n",
            "<leader>ds",
            builtin.lsp_document_symbols,
            vim.tbl_extend("force", opts, { desc = "Document Symbols" })
          )

          -- Workspace symbols (額外功能)
          vim.keymap.set(
            "n",
            "<leader>ws",
            builtin.lsp_dynamic_workspace_symbols,
            vim.tbl_extend("force", opts, { desc = "Workspace Symbols" })
          )
        end,
      })

      -- Lua Language Server
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
      -- TypeScript/JavaScript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("ts_ls")
      -- Astro
      vim.lsp.config("astro", {
        capabilities = capabilities,
      })
      vim.lsp.enable("astro")
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = {
          "eslint_d", -- JavaScript/TypeScript
        },
        automatic_installation = true,
      })
    end,
  },
}
