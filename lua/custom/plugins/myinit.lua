---@diagnostic disable: missing-fields
-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.opt.relativenumber = true
vim.g.have_nerd_font = true

vim.keymap.set('i', 'jk', '<esc>', { desc = 'esc shortcut' })
vim.keymap.set('i', 'kj', '<esc>', { desc = 'esc shortcut' })

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = { --[[ things you want to change go here]]
      direction = 'float',
    },
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'toggle terminal' },
    },
  },
  -- {
  --   'shatur/neovim-tasks',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
  --   opts = {},
  --   ft = 'rust',
  --   keys = {
  --     { '<leader>trr', '<cmd>Task start cargo run<cr>', desc = 'cargo run' },
  --     { '<leader>trb', '<cmd>Task start cargo build<cr>', desc = 'cargo build' },
  --   },
  -- },
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup {}
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end
      vim.keymap.set('n', '<leader>hu', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon window' })
    end,
    keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'harpoon add',
      },
      {
        '<leader>hu',
        function()
          require('harpoon.ui'):toggle_quick_menu(require('harpoon'):list())
        end,
        desc = 'harpoon list',
      },
      {
        '<leader>hs',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'harpoon select 1',
      },
      {
        '<leader>hd',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'harpoon select 2',
      },
      {
        '<leader>hf',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'harpoon select 3',
      },
    },
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   build = function()
  --     vim.fn['mkdp#util#install']()
  --   end,
  --   keys = {
  --     {
  --       '<leader>cp',
  --       ft = 'markdown',
  --       '<cmd>MarkdownPreviewToggle<cr>',
  --       desc = 'Markdown Preview',
  --     },
  --   },
  --   config = function()
  --     vim.cmd [[do FileType]]
  --   end,
  -- },
  -- {
  --   'stevearc/aerial.nvim',
  --   opts = {
  --     on_attach = function(bufnr)
  --       -- Jump forwards/backwards with '{' and '}'
  --       vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
  --       vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  --     end,
  --   },
  --   keys = {
  --     { '<leader>a', '<cmd>AerialToggle!<cr>', desc = 'toggle aerial' },
  --   },
  -- },
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
      { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
    opts = {
      -- Your setup opts here
    },
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}
