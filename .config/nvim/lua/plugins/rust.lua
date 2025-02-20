return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    ft = "toml",
    config = function()
      require("crates").setup()
    end,
  },
}
