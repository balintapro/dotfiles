return {
  -- current color scheme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      local rosepine = require("rose-pine")
      rosepine.setup({
        variant = "main",
        dark_variant = "main",
        disable_background = true,
        disable_italics = true
      })
      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      }
    }
  }
}
