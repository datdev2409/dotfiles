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
        file_ignore_patterns = {'node_modules'},
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
              width = 0.8,
              prompt_position = "top",
              preview_cutoff = 120,
              horizontal = {mirror = false},
              vertical = {mirror = false},
            },
        },

        live_grep = {
            theme='dropdown',
            layout_config = {
                width = 0.8,
            }
        },

        lsp_document_symbols = {
            path_display = {"tail"},
            theme='dropdown',
        }
    }
}


