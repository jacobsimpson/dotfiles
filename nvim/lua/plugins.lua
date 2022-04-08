
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

    -- When a visual selection is active, pressing * or # will do a file search of the selection,
    -- instead of a file search of the word under the cursor.
    use {'bronson/vim-visual-star-search'}

    use {'tpope/vim-surround'}

    -- Helps the vim-surround plugin honor the '.' repeat command.
    use {'tpope/vim-repeat'}

    -- Git access from inside Vim.
    use {'tpope/vim-fugitive'}

    -- In Vim support for some standard Unix commands. I'm mostly interested in Move.
    use {'tpope/vim-eunuch'}

    -- Add better text object handling, things like ci" or ci(
    use {'wellle/targets.vim'}

    use {'jacobsimpson/nvim-editconfig'}

    use {'hashivim/vim-terraform'}

    use {'jrozner/vim-antlr'}

    use {'jasontbradshaw/pigeon.vim', config = require('plugins.pigeon')}

    use {'famiu/bufdelete.nvim'}

    use {'rafcamlet/nvim-luapad'}

    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    -- Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    -- I didn't end up mapping a key for this. Wasn't sure how much use it would get. Activate with
    -- the following command.
    -- lua require'telescope.builtin'.symbols{ sources = {'emoji', 'math', 'latex', 'gitmoji'} }
    use {'nvim-telescope/telescope-symbols.nvim'}

    -- After a yank, the yanked text is highlighted in a different color to show what happened.
    use {'machakann/vim-highlightedyank'}

    use {'neovim/nvim-lspconfig', config = require('plugins.nvim-lspconfig')}

    -- Snippet support. I've never been really good at using this, but it seems like a good idea.
    use {'dcampos/nvim-snippy', config = require('plugins.nvim-snippy')}

    use {'numToStr/Comment.nvim', config = require('plugins.comment')}

    -- Shows lines added or removed according to the version control system.
    use {'lewis6991/gitsigns.nvim', config = require('plugins.gitsigns')}

    -- Strip trailing whitespace on save.
    use "McAuleyPenney/tidy.nvim"

    -- Adds a matching closing element whenever an opening element is inserted, for a list of elements
    -- that commonly occur in pairs.
    use {'windwp/nvim-autopairs', config = require('plugins.nvim-autopairs')}

    -- Note taking app.
    use {'renerocksai/telekasten.nvim', requires = {{'renerocksai/calendar-vim'}}, config = require('plugins.telekasten')}

    -- Automatically set up your configuration after cloning packer.nvim. Put this at the end after
    -- all plugins.
    if packer_bootstrap then
        require('packer').sync()
    end
end)
