set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require( "telescope" ).setup({
    defaults = {
        file_previewer = require( "telescope.previewers" ).cat.new,
    }
})

require( "telescope" ).load_extension( "fzf" )

require( "lualine" ).setup( {
    options = {
        theme = require( "lualine.themes.OceanicNext" )
    },
    sections = {
        lualine_a = {
            {
                "diagnostics",

                -- Table of diagnostic sources, available sources are:
                --   "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic", "coc", "ale", "vim_lsp".
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { "ale", "coc", "nvim_lsp" },

                -- Displays diagnostics for the defined severity types
                sections = { "error", "warn", "info", "hint" },

                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = "DiagnosticError", -- Changes diagnostics" error color.
                    warn  = "DiagnosticWarn",  -- Changes diagnostics" warn color.
                    info  = "DiagnosticInfo",  -- Changes diagnostics" info color.
                    hint  = "DiagnosticHint",  -- Changes diagnostics" hint color.
                },

                symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            }
        }
    }
} )

local function open_nvim_tree( data )

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw( vim.api.nvim_get_current_buf() )

  -- change to the directory
  vim.cmd.cd( data.file )

  -- open the tree
  require( "nvim-tree.api") .tree.open()
end

require( "nvim-tree" ).setup()
require( "nvim-web-devicons" ).setup()
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require( "bufferline" ).setup( {
    animation = true,
    auto_hide = true,
    closeable = false
} )

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

local function toggle_nvim_tree()
    require( "nvim-tree.api" ).tree.toggle( {
        path = nil,
        current_window = false,
        find_file = false,
        update_root = false,
        focus = true,
    })
end

-- ,t to toggle nvim tree
vim.keymap.set( "n" , "<leader>t" , toggle_nvim_tree , { noremap = true, silent = true } )

-- ,b to open a new buffer
vim.keymap.set( "n", "<leader>b", ":enew<CR>", { noremap = true } )

-- C-o to open buffer picker
vim.keymap.set( "n", "<C-o>", "<Cmd>BufferPick<CR>", { noremap = true, silent = true } )

-- C-h to go to previous buffer, C-l to go to next buffer
vim.keymap.set( "n", "<C-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true } )
vim.keymap.set( "n", "<C-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true } )

-- 

EOF
