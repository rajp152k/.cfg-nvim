-- INIT.LUA

-- {{{ NVIM-CMP
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.scroll_docs(-4),
		['<C-n>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' },
	}, {
		{ name = 'buffer' },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- }}}
-- {{{ LSP-zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})
-- }}}
-- {{{ Mason
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { "pylsp", "vimls", "lua_ls" , "marksman"},
	handlers = {
		lsp_zero.default_setup,
	},
})
-- }}}
-- {{{ IRON.NVIM
local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
	config = {
highlight_last = "IronLastSent",
		scratch_repl = false,
		close_window_on_exit = true,
		repl_definition = {
			sh = { command = { "bash" } },
			markdown = { command = { "bash" } },
			python = { command = { "ipython" } },
			lua = { command = { "lua" } },
			hy = { command = { "/home/rp152k/micromamba/envs/hy/bin/hy" } }
		},
		repl_open_cmd = view.split.vertical.botright(1 - 0.61903398875)
	},
	keymaps = {
		send_motion = "<leader>sm",
		visual_send = "<leader>sv",
		send_file = "<leader>sf",
		send_line = "<leader>sl",
		send_until_cursor = "<leader>su",
		send_mark = "<leader>sm",
		mark_motion = "<leader>mc",
		mark_visual = "<leader>mc",
		remove_mark = "<leader>md",
		cr = "<leader>s<cr>",
		interrupt = "<leader>s<leader>",
		exit = "<leader>sq",
		clear = "<leader>cl",
	},
	highlight = {
		italic = true
	},
	ignore_blank_lines = true
}
-- }}}
-- {{{ Neogit
local neogit = require("neogit")

neogit.setup {
  disable_hint = false,
  disable_context_highlighting = false,
  disable_signs = false,
  disable_commit_confirmation = false,
  disable_insert_on_commit = true,
  filewatcher = {
    interval = 1000,
    enabled = true,
  },
  git_services = {
    ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
    ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
    ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
  },
  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,
  remember_settings = true,
  use_per_project_settings = true,
  ignored_settings = {
    "NeogitPushPopup--force-with-lease",
    "NeogitPushPopup--force",
    "NeogitPullPopup--rebase",
    "NeogitCommitPopup--allow-empty",
    "NeogitRevertPopup--no-edit",
  },
  use_default_keymaps = true,
  auto_refresh = true,
  sort_branches = "-committerdate",
  kind = "tab",
  disable_line_numbers = true,
  console_timeout = 2000,
  auto_show_console = true,
  status = {
    recent_commit_count = 10,
  },
  commit_editor = {
    kind = "auto",
  },
  commit_select_view = {
    kind = "tab",
  },
  commit_view = {
    kind = "vsplit",
    verify_commit = os.execute("which gpg") == 0,
  },
  log_view = {
    kind = "tab",
  },
  rebase_editor = {
    kind = "auto",
  },
  reflog_view = {
    kind = "tab",
  },
  merge_editor = {
    kind = "auto",
  },
  tag_editor = {
    kind = "auto",
  },
  preview_buffer = {
    kind = "split",
  },
  popup = {
    kind = "split",
  },
  signs = {
    hunk = { "", "" },
    item = { ">", "v" },
    section = { ">", "v" },
  },
  integrations = {
    telescope = nil,
    diffview = nil,
    fzf_lua = nil,
  },
  sections = {
    sequencer = {
      folded = false,
      hidden = false,
    },
    untracked = {
      folded = false,
      hidden = false,
    },
    unstaged = {
      folded = false,
      hidden = false,
    },
    staged = {
      folded = false,
      hidden = false,
    },
    stashes = {
      folded = true,
      hidden = false,
    },
    unpulled_upstream = {
      folded = true,
      hidden = false,
    },
    unmerged_upstream = {
      folded = false,
      hidden = false,
    },
    unpulled_pushRemote = {
      folded = true,
      hidden = false,
    },
    unmerged_pushRemote = {
      folded = false,
      hidden = false,
    },
    recent = {
      folded = true,
      hidden = false,
    },
    rebase = {
      folded = true,
      hidden = false,
    },
  },
  mappings = {
    finder = {
      ["<cr>"] = "Select",
      ["<c-c>"] = "Close",
      ["<esc>"] = "Close",
      ["<c-n>"] = "Next",
      ["<c-p>"] = "Previous",
      ["<down>"] = "Next",
      ["<up>"] = "Previous",
      ["<tab>"] = "MultiselectToggleNext",
      ["<s-tab>"] = "MultiselectTogglePrevious",
      ["<c-j>"] = "NOP",
    },
    popup = {
      ["?"] = "HelpPopup",
      ["A"] = "CherryPickPopup",
      ["D"] = "DiffPopup",
      ["M"] = "RemotePopup",
      ["P"] = "PushPopup",
      ["X"] = "ResetPopup",
      ["Z"] = "StashPopup",
      ["b"] = "BranchPopup",
      ["c"] = "CommitPopup",
      ["f"] = "FetchPopup",
      ["l"] = "LogPopup",
      ["m"] = "MergePopup",
      ["p"] = "PullPopup",
      ["r"] = "RebasePopup",
      ["v"] = "RevertPopup",
    },
    status = {
      ["q"] = "Close",
      ["I"] = "InitRepo",
      ["1"] = "Depth1",
      ["2"] = "Depth2",
      ["3"] = "Depth3",
      ["4"] = "Depth4",
      ["<tab>"] = "Toggle",
      ["x"] = "Discard",
      ["s"] = "Stage",
      ["S"] = "StageUnstaged",
      ["<c-s>"] = "StageAll",
      ["u"] = "Unstage",
      ["U"] = "UnstageStaged",
      ["d"] = "DiffAtFile",
      ["$"] = "CommandHistory",
      ["#"] = "Console",
      ["<c-r>"] = "RefreshBuffer",
      ["<enter>"] = "GoToFile",
      ["<c-v>"] = "VSplitOpen",
      ["<c-x>"] = "SplitOpen",
      ["<c-t>"] = "TabOpen",
      ["{"] = "GoToPreviousHunkHeader",
      ["}"] = "GoToNextHunkHeader",
    },
  },
}
-- }}}
