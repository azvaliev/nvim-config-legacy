-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                                -- Enable mouse support
opt.clipboard = 'unnamedplus'                  -- Copy/paste to system clipboard
opt.swapfile = false                           -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
g.t_Co = 256                                   -- 256 bit colors
g.termguicolors = true

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.cursorline = true       -- Show cursor line
opt.syntax = 'on'           -- Syntax highlighting
opt.number = true           -- Show line number
opt.relativenumber = true   -- Enable relative line numbers
opt.showmatch = true        -- Highlight matching parenthesis
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 4 spaces when tab
opt.tabstop = 2             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 400        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Plugin config (aesthetics)
-----------------------------------------------------------
vim.cmd('let g:closetag_filenames = \'*.html,*.tsx,*.jsx\'')
vim.cmd('let g:airline#extensions#tabline#formatter = \'unique_tail_improved\'')
vim.cmd('let g:airline_theme=\'minimalist\'')
vim.o.background = 'dark'
vim.cmd [[colorscheme onedark]]

-----------------------------------------------------------
-- LSP Multi Lines
-----------------------------------------------------------
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false,
})
-----------------------------------------------------------
-- Github Copilot
-----------------------------------------------------------
g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept(\'<CR>\')', { silent = true, expr = true })
g.copilot_filetypes = {
	['*'] = false,
	['javascript'] = true,
	['typescript'] = true,
	['lua'] = false,
	['rust'] = true,
	['c'] = true,
	['c#'] = true,
	['c++'] = true,
	['go'] = true,
	['python'] = true,
}

