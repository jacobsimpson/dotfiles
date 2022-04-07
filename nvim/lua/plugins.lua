
-- Automatically install packer, it if isn't already available.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically execute PackerInstall every time this file changes.
--augroup packer_user_config
--  autocmd!
--  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--augroup end
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)

    use {'phaazon/hop.nvim', branch = 'v1', config = require('plugins.hop')}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
