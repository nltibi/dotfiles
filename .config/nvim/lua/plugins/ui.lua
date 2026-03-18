return {
  {
    "catppuccin/nvim",
    opts = {
      -- transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            -- SnacksIndentScope = { fg = colors.surface2 },
            IblScope = { fg = colors.overlay0 },
          }
        end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = { ".git" },
        },
      },
      default_component_configs = {
        modified = {
          symbol = " ",
        },
        git_status = {
          symbols = {
            added = " ",
            deleted = " ",
            renamed = " ",
            modified = " ",
            staged = " ",
            unstaged = "",
            ignored = " ",
            untracked = " ",
            conflict = "󰳤 ",
          },
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = "┊",
      },
      scope = {
        enabled = true,
        char = "┊",
        show_start = false,
        show_end = false,
        show_exact_scope = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      indent = {
        enabled = false,
      },
      scroll = {
        enabled = false,
      },
    },
  },
}
