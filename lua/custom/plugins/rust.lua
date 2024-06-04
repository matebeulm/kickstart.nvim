return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.keymap.set('n', '<leader>crr', '<cmd>RustLsp runnables<cr>', { desc = 'rust runnables' })
      vim.keymap.set('n', '<leader>cra', '<cmd>RustLsp hover actions<cr><cmd>RustLsp hover actions<cr>', { desc = 'rust hover actions' })
    end,
  },
}
