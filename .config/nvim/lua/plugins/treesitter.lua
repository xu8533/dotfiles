return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- list like portions of a table cannot be merged naturally and require the user to merge it manually
    -- check to make sure the key exists
    if not opts.ensure_installed then opts.ensure_installed = {} end
    vim.list_extend(opts.ensure_installed, {
      "c",
      "lua",
      "python",
      "vim",
    })
    return opts
  end,
}
