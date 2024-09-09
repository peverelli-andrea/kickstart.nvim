-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.blade = {
  install_info = {
    url = 'https://github.com/EmranMR/tree-sitter-blade',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  filetype = 'blade',
}

vim.cmd [[
  augroup BladeFiltypeRelated
    au BufNewFile,BufRead *.blade.php set ft=blade
  augroup END
]]

return {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'blade-formatter',
        'css-lsp',
        'css-variables-language-server',
        'html-lsp',
        'htmx-lsp',
        'json-lsp',
        'lua-language-server',
        'phpactor',
        'typescript-language-server',
      },
    },
  },
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-dotenv',
      'MunifTanjim/nui.nvim',
      'nvimtools/none-ls.nvim',
    },
    cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' },
    opts = {
      features = {
        null_ls = {
          enable = true,
        },
        route_info = {
          enable = true, --- to enable the laravel.nvim virtual text
          position = 'right', --- where to show the info (available options 'right', 'top')
          middlewares = true, --- wheather to show the middlewares section in the info
          method = true, --- wheather to show the method section in the info
          uri = true, --- wheather to show the uri section in the info
        },
      },
    },
    config = true,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require 'notify'
      -- this for transparency
      notify.setup { background_colour = '#000000' }
      -- this overwrites the vim notify function
      vim.notify = notify.notify
    end,
  },
}
