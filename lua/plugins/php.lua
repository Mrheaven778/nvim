return {
  -- PHP treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "php",
        "phpdoc",
        "blade",
      })
    end,
  },

  -- PHP specific LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = {
          enabled = true,
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          init_options = {
            ["language_server_phpstan.enabled"] = false,
            ["language_server_psalm.enabled"] = false,
          },
        },
      },
    },
  },

  -- PHP refactoring tools
  {
    "phpactor/phpactor",
    build = "composer install --no-dev -o",
    ft = "php",
    keys = {
      { "<leader>pm", ":PhpactorContextMenu<CR>", desc = "PHPActor Context Menu" },
      { "<leader>pn", ":PhpactorClassNew<CR>", desc = "PHPActor New Class" },
    },
  },

  -- Composer integration
  {
    "noahfrederick/vim-composer",
    ft = "php",
  },

  -- PHP documentation
  {
    "mikehaertl/pdv-standalone",
    ft = "php",
    keys = {
      { "<leader>pd", ":call PhpDocSingle()<CR>", desc = "PHP Doc Single" },
      { "<leader>pD", ":call PhpDocRange()<CR>", desc = "PHP Doc Range", mode = "v" },
    },
  },
}
