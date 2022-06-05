local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('neoclide/coc.nvim', {['branch'] = 'master', ['do'] = 'yarn install --frozen-lockfile' })

Plug('gruvbox-community/gruvbox');

-- Telescope
Plug('nvim-lua/plenary.nvim');
Plug('kyazdani42/nvim-web-devicons');
Plug('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' });
Plug('nvim-telescope/telescope-live-grep-raw.nvim');
Plug('nvim-telescope/telescope.nvim');

vim.call('plug#end')

vim.cmd('colorscheme gruvbox')

