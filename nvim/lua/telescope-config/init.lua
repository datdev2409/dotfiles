local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        layout_config = {
          prompt_position = "top",
          preview_cutoff = 120,
          horizontal = {mirror = false},
          vertical = {mirror = false},
        },
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {"smart"},
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            }
        }
    },
    pickers = {
        -- find_files = {
        --     theme='dropdown',       
        --     previewer = false,
        --     layout_config = {
        --       width = 0.4,
        --       prompt_position = "top",
        --       preview_cutoff = 120,
        --       horizontal = {mirror = false},
        --       vertical = {mirror = false},
        --     },
        -- },

        buffers = {
            theme='dropdown',       
            previewer = false,
            layout_config = {
              width = 0.4,
              prompt_position = "top",
              preview_cutoff = 120,
              horizontal = {mirror = false},
              vertical = {mirror = false},
            },
        },

        live_grep = {
            theme='dropdown',
            layout_config = {
                width = 0.4,
            }
        },

        lsp_document_symbols = {
            path_display = {"tail"},
            theme='dropdown',
        }

    }
}

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', 'gi', '<cmd> Telescope lsp_implementations<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', 'gr', '<cmd> Telescope lsp_references<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd> Telescope lsp_document_symbols<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd> Telescope lsp_document_diagnostics<CR>', { noremap = true})

vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
