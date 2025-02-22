local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
    use {"junegunn/fzf"}

    use {"junegunn/fzf.vim"}

    use {
        "ojroques/nvim-lspfuzzy",
        config = function()
            require('lspfuzzy').setup {
                methods = 'all', -- either 'all' or a list of LSP methods (see below)
                jump_one = true, -- jump immediately if there is only one location
                callback = nil, -- callback called after jumping to a location
                save_last = false, -- save last location results for the :LspFuzzyLast command
                fzf_preview = { -- arguments to the FZF '--preview-window' option
                    'right:+{2}-/2' -- preview on the right and centered on entry
                },
                fzf_action = { -- FZF actions
                    ['ctrl-t'] = 'tab split', -- go to location in a new tab
                    ['ctrl-v'] = 'vsplit', -- go to location in a vertical split
                    ['ctrl-x'] = 'split' -- go to location in a horizontal split
                },
                fzf_modifier = ':~:.', -- format FZF entries, see |filename-modifiers|
                fzf_trim = true -- trim FZF entries
            }
        end
    }

    use {"vim-ruby/vim-ruby"}

    use {"tpope/vim-rails"}

    use {"tpope/vim-endwise"}

    use {"tpope/vim-rbenv"}

end)

-- the above snippet is just an example
