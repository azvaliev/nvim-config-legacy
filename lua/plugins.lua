local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- JS & TS
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

-- Airline - Bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Themes
Plug 'arcticicestudio/nord-vim'
Plug 'alessandroyorba/alduin'
Plug 'joshdick/onedark.vim'
Plug('embark-theme/vim', { as = 'embark', branch = 'main' })

-- Enables gcc command comment
Plug 'tpope/vim-commentary'

-- Fuzzy Finder (old)
-- Plug 'junegunn/fzf'
-- Plug 'junegunn/fzf.vim'

-- Telescope
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
Plug 'nvim-telescope/telescope-file-browser.nvim'

-- Icons
Plug 'ryanoasis/vim-devicons'

-- Copilot
Plug 'github/copilot.vim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'whynothugo/lsp_lines.nvim'
Plug('https://git.sr.ht/~whynothugo/lsp_lines.nvim', { as = 'lsp_lines', branch = 'main' })


-- -- Autocomplete
Plug('neoclide/coc.nvim', { branch = 'release'})

-- Tree Sitter
Plug('nvim-treesitter/nvim-treesitter')

-- Start Screen
Plug 'goolord/alpha-nvim'

vim.call('plug#end')


