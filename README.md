# Description
This is my NeoVim config of choice. The full IDE setup.
These files comprise `~/.config/nvim`

## Getting started

Ensure you have [neovim](https://neovim.io) installed. Many of these plugins do not work with Vim

Install [Vim-Plug](https://github.com/junegunn/vim-plug) for neovim

## Optional, but highly reccomended setting
This config comes with a fuzzy finder (fzf.vim), to ensure proper usage I reccomend installing the dependencies listed [here](https://github.com/junegunn/fzf.vim#dependencies)

And for faster file finding, you can also install [fd](https://github.com/sharkdp/fd) and add the following to your `.zshrc`/`.bashrc`
```bash
export FZF_DEFAULT_COMMAND='fd --type f'
```

Ensure you have `node` version 16+ installed

Install the following npm packages globally
```bash
npm i --location=global vscode-langservers-extracted typescript typescript-language-server cssmodules-language-server @tailwindcss/language-server
```

Ensure the contents of this repo are in `~/.config/nvim`

Open NeoVim anywhere and run this command `:PlugInstall` to install all plugins

Next, for `COC` (responsible for amazing, fast code completion) re-open NeoVim anywhere and run
```bash
:CocInstall coc-tsserver coc-css coc-html coc-markdownlint coc-eslint
```
This will give you an LSP for TypeScript, JavaScript, ESLint, CSS, HTML, and Markdown. GraphQL is also included from the `coc-settings.json`. 

For any other languages, see the guide [here](https://github.com/neoclide/coc.nvim/wiki/Language-servers) for configuration

#### You're all set!

