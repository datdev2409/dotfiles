require('which-key').setup {
}


local wk = require("which-key")

mappings = {
    q = {"<cmd>:bd<cr>", "Close"},
    w = {"<cmd>w<cr>", "Save"},
    x = {"<cmd>:q!<cr>", "Exit"},
    f = {
        name = "File",
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        g = {"<cmd> Telescope live_grep<cr>", "Live Grep"},
        b = {"<cmd> Telescope buffers<cr>", "Search Buffers"},
    },
    l = {
        name = "LSP",   
        d = { "<cmd> Telescope lsp_definitions<cr>", "Go To Definitions" },
        i = { "<cmd> Telescope lsp_implementations<cr>", "Go To Implementations" },
        r = { "<cmd> Telescope lsp_references<cr>", "Search references" },
        o = { "<cmd> Telescope lsp_document_symbols<cr>", "Search Document Symbols" },
        O = { "<cmd> Telescope lsp_dynamic_workspace_symbols<cr>", "Search Workspace Symbols" },
        e = { "<cmd> Telescope lsp_document_diagnostics<cr>", "Search Document Errors"},
        E = { "<cmd> Telescope lsp_workspace_diagnostics<cr>", "Search Document Errors"},
        D = { "<cmd> lua vim.lsp.buf.declaration()<cr>", "Go to Declarations" },
        f = { "<cmd> lua vim.lsp.buf.formatting()<cr>", "Format Code"},
        R = { "<cmd> lua vim.lsp.buf.rename()<cr>", "Rename"},
    }
}

opts = {
    prefix = "<leader>"
}

wk.register(mappings, opts)
