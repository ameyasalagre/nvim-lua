return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- 🌳 Treesitter (FULL FIX)
  {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- 👈 VERY IMPORTANT (force load at startup)
  build = ":TSUpdate",
  opts = function(_, opts)
    opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
      "javascript",
      "typescript",
      "tsx",
      "go",
      "json",
      "bash",
    })

    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }

    opts.indent = { enable = true }
  end,
},

  -- 🚀 Cool UI Plugins
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, 
        command_palette = true, 
        long_message_to_split = true, 
        inc_rename = false, 
        lsp_doc_border = false, 
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- ✨ Smooth Animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = {},
  },

  -- 🤖 Copilot & Copilot Chat
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- default options
    },
  },
}

