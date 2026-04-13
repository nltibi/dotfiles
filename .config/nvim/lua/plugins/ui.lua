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
    init = function()
      -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
      -- because `cwd` is not set up properly.
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
        desc = "Start Neo-tree with directory",
        once = true,
        callback = function()
          if package.loaded["neo-tree"] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == "directory" then
              require("neo-tree")
            end
          end
        end,
      })
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.argc() == 0 then
            require("neo-tree.command").execute({ action = "show", dir = vim.loop.cwd() })
          end
        end,
      })
    end,
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
      dashboard = {
        enabled = false,
      },
      indent = {
        enabled = false,
      },
      scroll = {
        enabled = false,
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "<A-w>", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "<A-e>", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "<A-b>", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
}
