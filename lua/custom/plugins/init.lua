-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
            vim.keymap.set('n', '<leader>ca', '<cmd>RustLsp codeAction<cr>', { desc = 'RUST [C]ode [A]ction' })
            vim.keymap.set('n', '<leader>cd', '<cmd>RustLsp debug<cr>', { desc = 'RUST [C]ode [D]ebug' })
            vim.keymap.set('n', '<leader>ch', '<cmd>RustLsp hover actions<cr><cmd>RustLsp hover actions<cr>', { desc = 'RUST [C]ode [H]over Action' })
            vim.keymap.set('n', '<leader>co', '<cmd>RustLsp openCargo<cr>', { desc = 'RUST [C]ode [O]pen Cargo' })
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {},
          },
        },
        -- DAP configuration
        dap = {},
      }
    end,
  },
}
