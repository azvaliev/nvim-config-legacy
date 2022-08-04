# Description
This is my NeoVim config of choice. The full IDE setup.
These files comprise `~/.config/nvim`

## Getting started

Ensure you have [neovim](https://neovim.io) installed. Many of these plugins do not work with Vim

Install [Vim-Plug](https://github.com/junegunn/vim-plug) for neovim

Ensure you have `node` version 16+ installed

Install the following npm packages globally
```bash
npm i --location=global vscode-langservers-extracted typescript typescript-language-server cssmodules-language-server @tailwindcss/language-server
```

Ensure the contents of this repo are in `~/.config/nvim`

Open NeoVim anywhere and run this command `:PlugInstall` to install all plugins

Next, for `COQ` (responsible for amazing, fast code completion) re-open NeoVim anywhere and run `:COQDeps`

#### You're all set!

