local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- General Dep
Plug 'nvim-lua/plenary.nvim'

-- Airline - Bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

-- Themes
Plug 'arcticicestudio/nord-vim'
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
Plug 'kyazdani42/nvim-web-devicons'

-- UI
Plug 'MunifTanjim/nui.nvim'

-- Copilot
Plug 'github/copilot.vim'

-- LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
-- Plug 'glepnir/lspsaga.nvim'

-- Autocomplete
-- Plug('neoclide/coc.nvim', { branch = 'release'})

-- GraphQL
Plug 'jparise/vim-graphql'

-- Prisma
Plug 'pantharshit00/vim-prisma'

-- Tree Sitter
Plug('nvim-treesitter/nvim-treesitter')

-- JS & TS
Plug 'mattn/emmet-vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

-- GO
Plug 'ray-x/go.nvim'
vim.cmd("Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }")

-- Start Screen
Plug 'goolord/alpha-nvim'

-- File Browser
Plug('nvim-neo-tree/neo-tree.nvim')

vim.call('plug#end')


