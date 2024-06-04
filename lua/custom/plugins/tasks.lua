return {
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
    -- {
    --   -- various configurable async stateful tasks (CMake, Cargo, and NPM support implemented using this)
    --   'DoDoENT/neovim-additional-tasks',
    --   dependencies = {
    --     {
    --       'Shatur/neovim-tasks',
    --       dependencies = { 'nvim-lua/plenary.nvim' },
    --     },
    --     'neovim/nvim-lspconfig',
    --     'mfussenegger/nvim-dap', -- needed for cmake debugger support
    --   },
    --   config = function()
    --     -- setup your mappings, see below for more details
    --   end,
    -- },
    {
        'stevearc/overseer.nvim',
        opts = {},
    },
    {
        'Civitasv/cmake-tools.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/overseer.nvim', 'akinsho/toggleterm.nvim' },
        config = function()
            require('cmake-tools').setup {
                cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
                cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
            }
        end,
    },
}
