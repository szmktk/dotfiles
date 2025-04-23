# Neovim configurations

This directory contains two of my main [neovim](https://neovim.io/) profiles:
  - one for editing text files throughout my system (via `EDITOR=nvim`); found inside [nvim](nvim) directory
  - one for software development, acting as a custom tailored IDE for my specific needs; found inside [ukos](ukos) directory


### How to import a Neovim profile using `NVIM_APPNAME`

- clone a profile directory straight to `$XDG_CONFIG_HOME`
```
git clone $REPO_URL
mv $REPO_DIR ~/.config/
```

- define an alias
```
alias nv='NVIM_APPNAME=ukos nvim'
```


### Directory layout

As of 2025-04-11

```
.config
├── README.md
├── nvim
│   ├── after
│   │   └── plugin
│   │       ├── autopairs.lua
│   │       ├── gitsigns.lua
│   │       ├── lazygit.lua
│   │       ├── nvimtree.lua
│   │       ├── theme.lua
│   │       ├── toggleterm.lua
│   │       ├── treesitter.lua
│   │       └── vim-tmux-navigator.lua
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       └── szmktk
│           ├── aucmd.lua
│           ├── init.lua
│           ├── lazy.lua
│           ├── remap.lua
│           └── set.lua
└── ukos
    ├── after
    │   ├── ftplugin
    │   │   ├── go.lua
    │   │   └── python.lua
    │   └── plugin
    │       ├── ai.lua
    │       ├── auto-session.lua
    │       ├── dap.lua
    │       ├── gitsigns.lua
    │       ├── goto-preview.lua
    │       ├── harpoon.lua
    │       ├── lazygit.lua
    │       ├── neotest.lua
    │       ├── tabby.lua
    │       ├── telescope.lua
    │       ├── toggleterm.lua
    │       ├── treesitter.lua
    │       ├── vim-tmux-navigator.lua
    │       ├── which-key.lua
    │       └── yazi.lua
    ├── init.lua
    ├── lazy-lock.json
    ├── lua
    │   └── ukos
    │       ├── aucmd.lua
    │       ├── init.lua
    │       ├── keymap.lua
    │       ├── lazy.lua
    │       ├── lsp.lua
    │       ├── plugins
    │       │   ├── debug.lua
    │       │   ├── file_management.lua
    │       │   ├── finder.lua
    │       │   ├── games.lua
    │       │   ├── history.lua
    │       │   ├── language_server.lua
    │       │   ├── language_support.lua
    │       │   ├── misc.lua
    │       │   ├── navigation.lua
    │       │   ├── qol.lua
    │       │   └── ui.lua
    │       ├── set.lua
    │       ├── theme
    │       │   ├── catppuccin.lua
    │       │   ├── darcula_solid.lua
    │       │   ├── kanagawa.lua
    │       │   ├── lualine.lua
    │       │   ├── nightfox.lua
    │       │   ├── onedark.lua
    │       │   ├── rosepine.lua
    │       │   └── tokyonight.lua
    │       └── user_command.lua
    └── spell
        ├── en.utf-8.add
        └── en.utf-8.add.spl

```
