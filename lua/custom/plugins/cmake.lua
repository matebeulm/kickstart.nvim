return {
  {
    'stevearc/overseer.nvim',
    opts = {},
  },

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
    },
  },

  {
    'Civitasv/cmake-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/overseer.nvim',
      'akinsho/toggleterm.nvim',
    },
    opts = {},
  },
}
