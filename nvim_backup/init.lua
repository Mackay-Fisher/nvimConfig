-- init.lua

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Set leader key to space

require("lazy").setup({
  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } }
  },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({
        capabilities = capabilities,
      }) -- Compiler-focused setup (C/C++)

      lspconfig.asm_lsp.setup({
        capabilities = capabilities,
        filetypes = { "asm", "s" }, -- Add relevant assembly file types
        root_dir = lspconfig.util.root_pattern(".git", "*.asm"),
      }) -- Assembly LSP setup

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end
  },
    {
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight")
  end
},


  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "pyright", "lua_ls", "asm_lsp" },
        automatic_installation = true,
      })
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "lua", "python", "make", "assembly" },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },

  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({})
    end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" }
        }
      })
    end
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "c", "cpp", "lua", "python", "make", "assembly" },
  highlight = { enable = true },
  indent = { enable = true }
})

vim.api.nvim_command("autocmd FileType sh highlight Keyword ctermfg=Blue guifg=Blue")
vim.api.nvim_command("autocmd FileType sh highlight String ctermfg=Green guifg=Green")

vim.api.nvim_set_keymap('n', '<leader>th', ':TSPlaygroundToggle<CR>', { noremap = true, silent = true })

require("mason-lspconfig").setup({
  ensure_installed = { "bashls" }
})

local lspconfig = require("lspconfig")
lspconfig.bashls.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable LSP debugging
vim.lsp.set_log_level("debug")

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

