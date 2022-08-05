local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- General Dep
Plug 'nvim-lua/plenary.nvim'

-- JS & TS
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

-- GraphQL
Plug 'jparise/vim-graphql'

-- Airline - Bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Themes
-- Plug 'arcticicestudio/nord-vim'
-- Plug 'alessandroyorba/alduin'
Plug 'joshdick/onedark.vim'
-- Plug('embark-theme/vim', { as = 'embark', branch = 'main' })
-- Plug('folke/tokyonight.nvim', { branch = 'main' })
-- Plug('catppuccin/nvim', { as = 'catppuccin' })

-- Enables gcc command comment
Plug 'tpope/vim-commentary'

-- Fuzzy Finder
vim.cmd("Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }")
Plug 'junegunn/fzf.vim'

-- Icons
Plug 'ryanoasis/vim-devicons'

-- Copilot
Plug 'github/copilot.vim'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug('https://git.sr.ht/~whynothugo/lsp_lines.nvim', { as = 'lsp_lines', branch = 'main' })

-- Autocomplete
Plug('neoclide/coc.nvim', { branch = 'release'})

-- Tree Sitter
Plug('nvim-treesitter/nvim-treesitter')

-- Start Screen
Plug 'goolord/alpha-nvim'

vim.call('plug#end')


