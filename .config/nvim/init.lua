vim.g.mapleader = " "
vim.g.python3_host_prog = vim.fn.exepath("python3")

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
        
        vim.lsp.config("basedpyright", {
          cmd = { "basedpyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_markers = { "pyproject.toml", "ruff.toml", ".git" },
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
        })
        vim.lsp.enable("basedpyright")
      end,
    },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      backend = "kitty",
      integrations = {},
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      { "<leader>mi", "<cmd>MoltenInit<cr>",              desc = "Molten: init kernel" },
      { "<leader>ml", "<cmd>MoltenEvaluateLine<cr>",      desc = "Molten: run line" },
      { "<leader>mr", "<cmd>MoltenReevaluateCell<cr>",    desc = "Molten: re-run cell" },
      { "<leader>mv", "<cmd>MoltenEvaluateVisual<cr>",    desc = "Molten: run visual", mode = "v" },
      { "<leader>md", "<cmd>MoltenDelete<cr>",            desc = "Molten: delete output" },
      { "<leader>mh", "<cmd>MoltenHideOutput<cr>",        desc = "Molten: hide output" },
      { "<leader>ms", "<cmd>MoltenShowOutput<cr>",        desc = "Molten: show output" },
    },
    config = function()
      -- Cell navigation: jump between # %% markers
      vim.keymap.set("n", "]c", function()
        vim.fn.search("^# %%", "W")
      end, { desc = "Next cell" })
      vim.keymap.set("n", "[c", function()
        vim.fn.search("^# %%", "bW")
      end, { desc = "Prev cell" })

      -- Run current cell: from current # %% to next # %% (or EOF)
      vim.keymap.set("n", "<leader>mc", function()
        local start = vim.fn.search("^# %%", "bcnW")
        local finish = vim.fn.search("^# %%", "nW")
        if start == 0 then return end
        local from = start + 1
        local to = finish > 0 and (finish - 1) or vim.fn.line("$")
        if from > to then return end
        vim.fn.MoltenEvaluateRange(from, to)
      end, { desc = "Molten: run cell" })

      vim.keymap.set("n", "<leader>ma", function()
        local last_line = vim.fn.line("$")
        local markers = {}
        local lnum = 1
        while lnum <= last_line do
          local line = vim.fn.getline(lnum)
          if line:match("^# %%") then
            table.insert(markers, lnum)
          end
          lnum = lnum + 1
        end
        for i, marker in ipairs(markers) do
          local from = marker + 1
          local to = markers[i + 1] and (markers[i + 1] - 1) or last_line
          if from <= to then
            vim.fn.MoltenEvaluateRange(from, to)
          end
        end
      end, { desc = "Molten: run all cells" })
    end,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.indentexpr = ""
  end,
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
