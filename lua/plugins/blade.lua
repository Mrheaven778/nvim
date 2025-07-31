return {
  -- Blade syntax highlighting
  {
    "jwalton512/vim-blade",
    ft = "blade",
    config = function()
      -- Set up Blade file detection
      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = "*.blade.php",
        callback = function()
          vim.bo.filetype = "blade"
        end,
      })
    end,
  },

  -- Better Blade support with treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "blade", "php_only" })
      end
    end,
  },

  -- Emmet for HTML in Blade files
  {
    "mattn/emmet-vim",
    ft = { "html", "blade", "php" },
    config = function()
      vim.g.user_emmet_settings = {
        blade = {
          extends = "html",
        },
      }
    end,
  },

  -- Auto pairs for Blade directives
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      
      npairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
      
      -- Add Blade directive pairs
      npairs.add_rules({
        Rule("@if", "@endif", "blade"),
        Rule("@foreach", "@endforeach", "blade"),
        Rule("@for", "@endfor", "blade"),
        Rule("@while", "@endwhile", "blade"),
        Rule("@section", "@endsection", "blade"),
        Rule("@push", "@endpush", "blade"),
        Rule("@component", "@endcomponent", "blade"),
      })
    end,
  },
}
