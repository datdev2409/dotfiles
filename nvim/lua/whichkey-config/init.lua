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
    }
}

wk.register(n_mappings, opts)
