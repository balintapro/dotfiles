return {
    -- Theme
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                bold_vert_split = false,          -- use bold vertical separators
                dim_nc_background = true,         -- dim 'non-current' window backgrounds
                disable_background = true,       -- disable background
                disable_float_background = false, -- disable background for floats
                disable_italics = false,          -- disable italics
            }
        end,
        -- optionally set the colorscheme within lazy config
        init = function()
            vim.cmd("colorscheme poimandres")
        end
    },

    -- Statusline
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = 'poimandres',
                component_separators = '|',
                section_separators = '',
            }
        }
    }
}
