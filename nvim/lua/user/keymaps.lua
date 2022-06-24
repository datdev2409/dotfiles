local wk = require("which-key")
local opts = {mode = "n", prefix = "", noremap = true}

local n_mappings = {
    ["<leader>f"] = {
        name = "File",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        b = { "<cmd>Telescope buffers<CR>", "Buffers" },
        g = { "<cmd>Telescope live_grep<CR>", "Globals" }
    },

    g = {
        name = "LSP",
        r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol"},
        d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "GoTo Definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "GoTo Declaration"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "GoTo Implementation"},
        o = {"<cmd> Telescope lsp_document_symbols<CR>", "List All Symbols"},
        e = {"<cmd> lua vim.diagnostic.setloclist()<CR>", "List All Errors"},
        F = {":lua vim.lsp.buf.formatting()<CR>", "Formatting"},
        k = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
        l = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', "Show Errors"},
        h = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help"},
        ["]"] = {"<cmd>lua vim.diagnostic.goto_next({ border = \"rounded\" })<CR>", "Next Errors"},
        ["["] = {"<cmd>lua vim.diagnostic.goto_prev({ border = \"rounded\" })<CR>", "Prev Errors"},
    },

    ["<leader>"] = {
        name = "Leader",
        w = {"<cmd>w!<CR>", "Save"},
        q = {"<cmd>q!<CR>", "Exit"},
        s = {"<cmd>source%<CR>", "Reload"}
    },
    
    J = {"<cmd>HopLineAC<CR>", "Line After Cursor"},
    K = {"<cmd>HopLineBC<CR>", "Line Before Cursor"},
    W = {"<cmd>HopWordCurrentLine<CR>", "Words Current Line"},
    [";"] = {"<cmd>HopWordMW<CR>", "Words Whole File"},

    --Resize
    ['<Right>'] = {':vertical resize +5<cr>', "Right"},
    ['<Left>'] = {':vertical resize -5<cr>', "Left"},
    ['<Down>'] = {':resize +5<cr>', "Down"},
    ['<Up>'] = {':resize -5<cr>', "Up"},

    --Focus
    ['<C-l>'] = {'<C-w>l', "Focus Right"},
    ['<C-h>'] = {'<C-w>h', "Focus Left"},
    ['<C-k>'] = {'<C-w>k', "Focus Top"},
    ['<C-j>'] = {'<C-w>j', "Focus Bottom"},

    --Split screen
    ['<C-\\>'] = {':vsp<CR>', "Split vertical"},

    ["<A-j>"] = {":m .+1<CR>==", "Move text down"},
    ["<A-k>"] = {":m .-2<CR>==", "Move text down"},
}

local v_opts = {mode = "v", prefix = "", noremap = true}
local v_mappings = {
    J = {"4j", "Fast Cursor Down"},
    K = {"4k", "Fast Cursor Up"},
    ["<C-j>"] = {":m .+1<CR>==", "Move text down"},
    ["<C-k>"] = {":m .-2<CR>==", "Move text down"},
    [";"] = {"<cmd>HopWordMW<CR>", "Words Whole File"},

}

wk.register(n_mappings, opts)
wk.register(v_mappings, v_opts)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
