vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4    -- Size of an indent
vim.opt.tabstop = 4       -- Number of spaces a tab counts for
vim.opt.softtabstop = 4   -- Number of spaces for tab key
vim.opt.expandtab = false -- Use tabs instead of spaces

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins
require("lazy").setup({
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "neovim/nvim-lspconfig" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Pass capabilities to LSP servers
      vim.lsp.config("clangd", {
        cmd = { "clangd" },
        root_markers = { ".clangd", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
      })
      vim.lsp.enable("clangd")
    end,
  },
})

-- Enable theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("moonfly")

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  float = {
    source = "always",
    border = "rounded",
  },
})

-- Diagnostic key mappings
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>q', vim.lsp.buf.code_action, { desc = 'Show code actions' })
