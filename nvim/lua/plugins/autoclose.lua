return {
  { "m4xshen/autoclose.nvim", opts = {
    options = {
      disabled_filetypes = { "text", "markdown" },
      disable_when_touch = true,
    },
      keys = {
          ["'"] = { escape = false, close = false, pair = "''", disabled_filetypes = {} },
      }
  } },
}
