return {
  colorscheme = "catppuccin-macchiato",

  plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
    {
      "goolord/alpha-nvim",
      opts = function()
        local dashboard = require "alpha.themes.dashboard"
        dashboard.section.header.val = {
          "██╗     ██╗    ██╗   ██╗ ██████╗ ███╗   ██╗ ██████╗      ██╗  ██╗██╗███╗   ██╗ ██████╗ ",
          "██║     ██║    ╚██╗ ██╔╝██╔═══██╗████╗  ██║██╔════╝      ╚██╗██╔╝██║████╗  ██║██╔════╝ ",
          "██║     ██║     ╚████╔╝ ██║   ██║██╔██╗ ██║██║  ███╗      ╚███╔╝ ██║██╔██╗ ██║██║  ███╗",
          "██║     ██║      ╚██╔╝  ██║   ██║██║╚██╗██║██║   ██║      ██╔██╗ ██║██║╚██╗██║██║   ██║",
          "███████╗██║       ██║   ╚██████╔╝██║ ╚████║╚██████╔╝     ██╔╝ ██╗██║██║ ╚████║╚██████╔╝",
          "╚══════╝╚═╝       ╚═╝    ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝      ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ", }
        dashboard.section.header.opts.hl = "DashboardHeader"

        local button = require("astronvim.utils").alpha_button
        dashboard.section.buttons.val = {
          button("LDR n", "  New File  "),
          button("LDR f f", "  Find File  "),
          button("LDR f o", "󰈙  Recents  "),
          button("LDR f w", "󰈭  Find Word  "),
          button("LDR f '", "  Bookmarks  "),
          button("LDR S l", "  Last Session  "),
        }

        dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
        dashboard.config.layout[3].val = 5
        dashboard.config.opts.noautocmd = true
        return dashboard
      end
    },
    {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {
            '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt',
            'zz', 'zb'
          },
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,       -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil              -- Function to run after the scrolling animation ends
        })
      end
    },
    {
      "tpope/vim-surround",
      -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
      setup = function() vim.o.timeoutlen = 500 end
    },
    {'akinsho/git-conflict.nvim', version = "*", config = true}
    
  },

  vim.api.nvim_set_keymap(
    'n', '<S-H>', ':bprev<CR>', { noremap = true }
  ),

  vim.api.nvim_set_keymap(
    'n', '<S-L>', ':bnext<CR>', { noremap = true }
  ),

  vim.api.nvim_set_keymap(
    'v', '<S-J>', ':m +1<CR>gv-gv', { noremap = true }
  ),

  vim.api.nvim_set_keymap(
    'v', '<S-K>', ':m -2<CR>gv-gv', { noremap = true }
  ),

}
