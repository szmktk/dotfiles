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

As of 2023-11-19

```
.config
├── README.md
├── nvim
│   ├── after
│   │   └── plugin
│   │       ├── autopairs.lua
│   │       ├── gitsigns.lua
│   │       ├── lazygit.lua
│   │       ├── nvimtree.lua
│   │       ├── theme.lua
│   │       ├── toggleterm.lua
│   │       ├── treesitter.lua
│   │       └── vim-tmux-navigator.lua
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       └── szmktk
│           ├── aucmd.lua
│           ├── init.lua
│           ├── lazy.lua
│           ├── remap.lua
│           └── set.lua
└── ukos
    ├── after
    │   ├── ftplugin
    │   │   ├── markdown.lua
    │   │   └── python.lua
    │   └── plugin
    │       ├── autopairs.lua
    │       ├── dap.lua
    │       ├── gitsigns.lua
    │       ├── lazygit.lua
    │       ├── nvimtree.lua
    │       ├── telescope.lua
    │       ├── theme.lua
    │       ├── toggleterm.lua
    │       ├── treesitter.lua
    │       ├── vim-tmux-navigator.lua
    │       └── which-key.lua
    ├── init.lua
    ├── lazy-lock.json
    └── lua
        └── ukos
            ├── aucmd.lua
            ├── init.lua
            ├── lazy.lua
            ├── lsp.lua
            ├── remap.lua
            └── set.lua
```
