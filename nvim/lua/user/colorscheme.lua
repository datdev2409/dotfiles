local onedarkpro = require("onedarkpro")
local colors = onedarkpro.get_colors(vim.g.onedarkpro_style)

onedarkpro.setup({
  theme = "onedark",

  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "NONE", -- Style that is applied to virtual text
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = false, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  },
  hlgroups = { -- Overriding the Comment highlight group
    NvimTreeFolderIcon = { fg = colors.blue}, -- 1
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeRootFolder = {
      fg = colors.fg,
      -- style = "italic"
    },
    NvimTreeOpenedFolderName = { fg = colors.blue, style="italic" },
    NvimTreeOpenedFile = {
      fg = colors.orange,
    },
    TSTagAttribute = { fg = colors.orange},
    TSURI = { fg = colors.green, style="underline"},
    TSTagDelimiter = { fg = colors.comment },
    javascriptTSVariable = { fg = colors.fg }

  },
  colors = {
    red = "#E06C75"
  }
})

vim.o.background = "dark" 
onedarkpro.load()
local colorscheme = "onedarkpro"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-- vim.cmd[[
--   highlight htmlTSTagDelimiter guifg=#a0a8b7
--   highlight htmlTSTag guifg=#E06C75
--   highlight htmlTSURI guifg=#8ebd6b cterm=underline gui=underline
--   highlight htmlTSTitle guifg=#a0a8b7 cterm=none
--   highlight htmlTSTagAttribute guifg=#D19A66 cterm=none
-- ]]
