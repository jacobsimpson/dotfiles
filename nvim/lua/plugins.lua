--
-- There have been a couple of problems related to plugins that have been difficult to troubleshoot.
--
-- 1.  Plugin reloads are unreliable. Make sure to :PackerCompile after any change. And start and
--     stop Neovim.
-- 2.  Scoping and visibility are weird. Calling local functions from the configuration function
--     doesn't work correctly.
--
-- My experience with Packer though tells me that using a Lua plugin manager is awesome because Lua
-- functions can be used to do the additional configuration. My experience with Packer itself is
-- mixed. The emphasis on the compile step make reloads weird, config functions uncertain, and
-- requires that the :PackerCompile step be re-run all the time, instead of just picking up changes
-- as other plugin managers would. Make sure to re-run :PackerCompile in the nvim instance where
-- testing is happening. Running it in another instance and restarting a test instance had
-- inconsistent results.
--

-- This section should cause changes to plugins and plugin configuration to be automatically
-- reloaded.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */dotfiles/nvim/lua/plugins.lua source <afile> | PackerCompile
    autocmd BufWritePost */dotfiles/nvim/lua/plugins/*.lua source <afile> | PackerCompile
  augroup end
]])

-- Automatically install packer, if it isn't already available.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
end

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- This works ok, I didn't notice anything especially awesome about it. One big drawback, it
    -- hides the cursor after a motion has succeeded, so I don't get the visual feedback of the new
    -- location until I do something. Also, it replaces/extends the f/t keys. Which is not terrible,
    -- just not helpful, especially when coupled with hiding the cursor after a jump.
    -- use('ggandor/lightspeed.nvim')
    -- Slightly different mechanism for selecting the jump target identifiers.
    use {'phaazon/hop.nvim', branch = 'v1', config = require('plugins.hop')}

    -- When a visual selection is active, pressing * or # will do a file search of the selection,
    -- instead of a file search of the word under the cursor.
    use({ 'bronson/vim-visual-star-search' })

    use({ 'tpope/vim-surround', requires = { { 'tpope/vim-repeat' } } })

    -- Git access from inside Vim.
    use({ 'tpope/vim-fugitive' })

    -- In Vim support for some standard Unix commands. I'm mostly interested in Move.
    use({ 'tpope/vim-eunuch' })

    -- Add better text object handling, things like ci" or ci(
    use({ 'wellle/targets.vim' })

    use({ 'jacobsimpson/nvim-editconfig' })

    use({ 'hashivim/vim-terraform' })

    -- use({ 'jrozner/vim-antlr' })

    -- use({ 'jasontbradshaw/pigeon.vim', config = require('plugins.pigeon') })

    use({ 'famiu/bufdelete.nvim' })

    use({
        'rafcamlet/nvim-luapad',
        config = function()
            require('luapad').setup({
                split_orientation = 'horizontal',
                preview = false,
            })
        end,
    })

    use({
        'nvim-telescope/telescope.nvim',
        config = require('plugins.telescope'),
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'BurntSushi/ripgrep' },
            { 'nvim-telescope/telescope-live-grep-raw.nvim' },
        },
    })
    -- Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    -- This plugin will pop up a selection list of emojis. I didn't end up mapping a key for this.
    -- Wasn't sure how much use it would get. Activate with the following command.
    -- lua require'telescope.builtin'.symbols{ sources = {'emoji', 'math', 'latex', 'gitmoji'} }
    use({ 'nvim-telescope/telescope-symbols.nvim' })

    -- After a yank, the yanked text is highlighted in a different color to show what happened.
    -- NOTE: Replaced with a Neovim feature, see init.vim for configuration.
    -- use {'machakann/vim-highlightedyank'}

    use({ 'neovim/nvim-lspconfig', config = require('plugins.nvim-lspconfig') })

    -- Debugging
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
        config = require('plugins.nvim-dap-ui'),
    }

    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = {
            'nvim-lua/plenary.nvim',
            'jose-elias-alvarez/null-ls.nvim'
        },
        config = function()
            require('crates').setup()
        end,
    }

    -- I like the idea of this plugin, it looks very helpful and people like it, but it isn't
    -- loading. When I enable it, it kills Rust highlighting.
    --use({
    --    'simrat39/rust-tools.nvim',
    --    config = function ()
    --        local rt = require('rust-tools')
    --        rt.setup({
    --          server = {
    --            on_attach = function(_, bufnr)
    --              -- Hover actions
    --              vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    --              -- Code action groups
    --              vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    --            end,
    --          },
    --        })
    --    end,
    --})

    -- Snippet support. I've never been really good at using this, but it seems like a good idea.
    use({ 'dcampos/nvim-snippy', config = require('plugins.nvim-snippy') })

    -- Default keymapping is gcc/gbc in normal mode, gc/gb in visual mode.
    use({ 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    })
    --config = require('plugins.comment') })

    -- Shows lines added or removed according to the version control system.
    use({ 'lewis6991/gitsigns.nvim', config = require('plugins.gitsigns') })

    -- Strip trailing whitespace on save.
    --use({ 'mcauley-penney/tidy.nvim',
    --    config = function()
    --        require("tidy").setup()
    --    end
    --})

    -- Using packer.nvim
    use({
        'johnfrankmorgan/whitespace.nvim',
        config = function ()
            require('whitespace-nvim').setup({
            --    -- configuration options and their defaults

            --    -- `highlight` configures which highlight is used to display
            --    -- trailing whitespace
                highlight = 'DiffDelete',

            --    -- `ignored_filetypes` configures which filetypes to ignore when
            --    -- displaying trailing whitespace
                ignored_filetypes = { 'TelescopePrompt' },
            })

            ---- remove trailing whitespace with a keybinding
            --vim.api.nvim_set_keymap(
            --    'n',
            --    '<Leader>t',
            --    [[<cmd>lua require('whitespace-nvim').trim()<CR>]]
            --    { noremap = true }
            --)
        end
    })

    -- Adds a matching closing element whenever an opening element is inserted, for a list of elements
    -- that commonly occur in pairs.
    use({ 'windwp/nvim-autopairs', config = require('plugins.nvim-autopairs') })

    -- Note taking app.
    use({
        'renerocksai/telekasten.nvim',
        config = require('plugins.telekasten'),
        requires = {
            { 'renerocksai/calendar-vim' },
        },
    })

    use({
        'hrsh7th/nvim-cmp',
        config = require('plugins.nvim-cmp'),
        requires = {
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'dcampos/nvim-snippy' },
            { 'dcampos/cmp-snippy' },
        },
    })

    use({
        'ckipp01/stylua-nvim',
        run = 'cargo install stylua',
        config = function()
            require('stylua-nvim').setup({ config_file = '~/dotfiles/nvim/language/stylua.toml' })
        end,
    })

    use({
        'nvim-lualine/lualine.nvim',
        config = require('plugins.lualine'),
        requires = { { 'kyazdani42/nvim-web-devicons' } },
    })

    -- The treesitter plugin itself provides language parsing and supports queries. Actual functionality
    -- is implemented by modules, configured below.
    --
    -- The TSUpdate option will cause nvim-treesitter itself to download and install up to date parsers
    -- for all configured languages whenever the nvim-treesitter plugin is updated.
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('plugins.nvim-treesitter'),
        requires = {
            -- Treesitter text object module configuration.
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
            { 'nvim-treesitter/playground' },
        },
    })

    use({
        'kosayoda/nvim-lightbulb',
        config = function()
            vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
        end,
    })

    --use {
    --    "nvim-neotest/neotest",
    --    requires = {
    --        "nvim-lua/plenary.nvim",
    --        "nvim-treesitter/nvim-treesitter",
    --        "antoinemadec/FixCursorHold.nvim",
    --        "rouge8/neotest-rust",
    --        "nvim-neotest/neotest-vim-test",
    --    },
    --    config = function()
    --        require("neotest").setup({
    --            adapters = {
    --                require("neotest-rust"),
    --                require("neotest-vim-test")({
    --                    ignore_file_types = { "rust" },
    --                })
    --            }
    --        })
    --    end
    --}

    use({
        'https://gitlab.com/yorickpeterse/nvim-window.git',
        config = function()
            -- require('nvim-window').pick()

            vim.keymap.set(
                {'n', 'i', 'v'},
                '<C-w>',
                require('nvim-window').pick,
                { desc = 'Show a window picker.', remap = false }
            )

        end
    })

    -- call nvim_win_set_option(win, 'Normal:MyHighlight,FloatBorder:MyHighlight')
    -- win = 0 => current window
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                window = {
                    border = "double"
                }
            }
        end
    }

    --use 'ray-x/go.nvim'
    --use 'ray-x/guihua.lua' -- recommended if need floating window support

    -- Automatically set up your configuration after cloning packer.nvim. Put this at the end after
    -- all plugins.
    if packer_bootstrap then
        require('packer').sync()
    end
end)
