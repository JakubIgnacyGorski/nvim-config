-- plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        texlab = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_markers = {
            "compile_commands.json",
            "compile_flags.txt",
            "configure.ac", -- AutoTools
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja",
            ".git",
          },
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        neocmake = {},
        dockerls = {},
        docker_compose_language_service = {},
        jsonls = {
          -- lazy-load schemastore when needed
          before_init = function(_, new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
        marksman = {},
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        bacon_ls = {
          enabled = diagnostics == "bacon-ls",
        },
        rust_analyzer = { enabled = false },
      },
      yamlls = {
        -- Have to add this for yamlls to understand that we support line folding
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        -- lazy-load schemastore when needed
        before_init = function(_, new_config)
          new_config.settings.yaml.schemas =
            vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = true,
            },
            validate = true,
            schemaStore = {
              -- Must disable built-in schemaStore support to use
              -- schemas from SchemaStore.nvim plugin
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
        ruff = function()
          Snacks.util.lsp.on({ name = ruff }, function(_, client)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
      },

      function(_, opts)
        -- TODO: Add mypy
        local servers = { "pyright", "basedpyright", "ruff", "ruff_lsp", ruff, lsp }
        for _, server in ipairs(servers) do
          opts.servers[server] = opts.servers[server] or {}
          opts.servers[server].enabled = server == lsp or server == ruff
        end
      end,
    },
  },
}
