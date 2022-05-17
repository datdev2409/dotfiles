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
        o = {"<cmd> Telescope lsp_document_symbols<CR>", "List All Symbols"},
        e = {"<cmd> Telescope lsp_document_diagnostics<CR>", "List All Errors"},
        f = {":lua vim.lsp.buf.formatting()<CR>", "Formatting"},
        k = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
    },

    ["<leader>"] = {
        name = "Leader",
        c = {"<cmd>CommentToggle<CR>", "Comment Toggle"},
        w = {"<cmd>w!<CR>", "Save"},
        q = {"<cmd>q!<CR>", "Exit"},
        s = {"<cmd>source%<CR>", "Reload"}
    },
    
    J = {"<cmd>HopLineAC<CR>", "Line After Cursor"},
    K = {"<cmd>HopLineBC<CR>", "Line Before Cursor"},
    f = {"<cmd>HopChar1CurrentLineAC<CR>", "Char After Cursor"},
    F = {"<cmd>HopChar1CurrentLineBC<CR>", "Char Before Cursor"},
    [";"] = {"<cmd>HopWordMW<CR>", "Words Whole File"},

    --Resize
    ['<Right>'] = {':vertical resize +5<cr>', "Right"},
    ['<Left>'] = {':vertical resize -5<cr>', "Left"},
    ['<Down>'] = {':resize +5<cr>', "Down"},
    ['<Up>'] = {':resize -5<cr>', "Up"},


    --Focus
    ['<C-h>'] = {'<C-w>h', "Focus Left"},
    ['<C-l>'] = {'<C-w>l', "Focus Right"},
    ['<C-k>'] = {'<C-w>k', "Focus Top"},
    ['<C-j>'] = {'<C-w>j', "Focus Bottom"},

    --Split screen
    ['<C-\\>'] = {':vsp<CR>', "Split vertical"},
}

local v_opts = {mode = "v", prefix = "", noremap = true}
local v_mappings = {
    ["<leader>"] = {
        name = "Leader",
        c = {"<cmd>CommentToggle<CR>", "Comment Toggle"},
    },
    
    J = {"4j", "Fast Cursor Down"},
    K = {"4k", "Fast Cursor Up"},
    f = {"<cmd>HopChar1CurrentLineAC<CR>", "Char After Cursor"},
    F = {"<cmd>HopChar1CurrentLineBC<CR>", "Char Before Cursor"},
    [";"] = {"<cmd>HopWordMW<CR>", "Words Whole File"},

}

wk.register(n_mappings, opts)
wk.register(v_mappings, v_opts)
