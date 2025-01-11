return {
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        tools = {
          test_executor = "background",
        },
        server = {
          -- https://users.rust-lang.org/t/neovim-vs-blocking-waiting-for-file-lock-on-build-directory/72188
          cmd_env = {
            CARGO_TARGET_DIR = "target/lsp",
          },
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              rustfmt = {
                extraArgs = { "+nightly" },
              },
            },
          },
          on_attach = function(_, bufnr)
            local lsp_map = function(mode, keys, func, desc)
              vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
            end

            -- rust-lsp
            lsp_map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust hover docs")
            lsp_map("n", "J", function() vim.cmd.RustLsp("joinLines") end, "Rust join lines")
            lsp_map("n", "<Leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Rust Code action")
            lsp_map("n", "<Leader>rue", function() vim.cmd.RustLsp("explainError") end, "Rust error explain")
            lsp_map("n", "<Leader>rud", function() vim.cmd.RustLsp("openDocs") end, "Rust docs")
            lsp_map("n", "<Leader>rum", function() vim.cmd.RustLsp("expandMacro") end, "Rust expand macro")
            lsp_map("n", "<Leader>rut", function() vim.cmd.RustLsp("testables") end, "Rust test")

            -- copy from lsp_config
            lsp_map("n", "gd", vim.lsp.buf.definition, "Goto definition")
            lsp_map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
            lsp_map("n", "gI", vim.lsp.buf.implementation, "Goto implementation")
            lsp_map("n", "gT", vim.lsp.buf.type_definition, "Goto type definition")
            lsp_map("n", "<Leader>rs", vim.lsp.buf.rename, "Rename symbol")
            lsp_map("n", "<Leader>ds", require("telescope.builtin").lsp_document_symbols, "Document symbols")
            lsp_map("n", "<Leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")

            local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format() end,
              group = format_sync_grp,
            })
          end,
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
        completion = {
          cmp = {
            enabled = true,
          },
        },
        popup = {
          keys = {
            toggle_feature = { "<cr>", "<space>" },
          },
        },
      })
    end,
    keys = {
      {
        "<Leader>ruca",
        function() require("crates").upgrade_all_crates() end,
        ft = "toml",
        mode = { "n" },
        desc = "Rust rate upgrade all",
      },
      {
        "<Leader>rucl",
        function() require("crates").upgrade_crate() end,
        ft = "toml",
        mode = { "n" },
        desc = "Rust crate upgrade line",
      },
      {
        "<Leader>rucf",
        function()
          require("crates").show_features_popup()
          require("crates").focus_popup()
        end,
        ft = "toml",
        mode = { "n" },
        desc = "Rust crate features",
      },
    }
  },
}
