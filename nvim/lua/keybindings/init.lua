--=> Key mappings
--""""""""""""""""""""""""""""""""""""""""""""""""""""""""""--
vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true }

-- Maped in better escape plugin
--map('i', 'jj', '<ESC>', opt)

map('n', 'J', '5j', opt)
map('n', 'K', '5k', opt)
map('v', 'J', '5j', opt)
map('v', 'K', '5k', opt)

map('n', '<leader>w', ':w<CR>', opt)
map('n', '<C-s>', ':source%<CR>', opt)

--Map to move tab
map('n', '<C-w>', ':bd<CR>', opt)

--Focus
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-l>', '<C-w>l', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-j>', '<C-w>j', opt)

--Split screen
map('n', '<C-\\>', ':vsp<CR>', opt) 

--Resize
map('n', '<Right>', ':vertical resize +1<cr>', opt)
map('n', '<Left>', ':vertical resize -1<cr>', opt)
map('n', '<Down>', ':resize +1<cr>', opt)
map('n', '<Up>', ':resize -1<cr>', opt)

map('n', '<leader>u', ':lua folding()<cr>', opt)
