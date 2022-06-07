require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"html", "php"},
    additional_vim_regex_highlighting = false,
  },
}
