return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    config = function(_, opts)
      if LazyVim.has("mason.nvim") then
        local registry = require("mason-registry")
        if registry.is_installed("codelldb") then
          local codelldb = vim.fn.exepath("codelldb")
          local library_path =
            vim.fn.globpath("$MASON/packages/codelldb/extension/lldb/lib", "liblldb.*", true, true)[1]
          opts.dap = {
            adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
          }
        end
      end
      vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    end,
  },
}
