-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                                -- Enable mouse support
opt.clipboard = 'unnamedplus'                  -- Copy/paste to system clipboard
opt.swapfile = false                           -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
g.t_Co = 256                                   -- 256 bit colors
g.termguicolors = true
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.cursorline = true       -- Show cursor line
opt.syntax = 'on'           -- Syntax highlighting
opt.number = true           -- Show line number
opt.relativenumber = true   -- Enable relative line numbers
opt.showmatch = true        -- Highlight matching parenthesis
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 4 spaces when tab
opt.tabstop = 2             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 400        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Plugin config (aesthetics)
-----------------------------------------------------------
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
	{text = "X", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
	{text = "⚠", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
	{text = "i", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
	{text = "", texthl = "DiagnosticSignHint"})

vim.cmd('let g:closetag_filenames = \'*.html,*.tsx,*.jsx\'')
vim.cmd('let g:airline#extensions#tabline#formatter = \'unique_tail_improved\'')
vim.cmd('let g:airline_theme=\'minimalist\'')
vim.o.background = 'dark'
vim.cmd [[colorscheme nord]]

-----------------------------------------------------------
-- Auto close HTML tags
-----------------------------------------------------------
require("nvim-autopairs").setup {}
-----------------------------------------------------------
-- Neovim tree
-----------------------------------------------------------
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = false, -- used when sorting files and directories in the tree
	sort_function = nil , -- use a custom function for sorting files and directories in the tree 
	-- sort_function = function (a,b)
	--       if a.type == b.type then
	--           return a.path > b.path
	--       else
	--           return a.type > b.type
	--       end
	--   end , -- this sorts files and directories descendantly
	default_component_configs = {
		container = {
			enable_character_fade = true
		},
		indent = {
			indent_size = 2,
			padding = 1, -- extra padding on left hand side
			-- indent guides
			with_markers = true,
			indent_marker = "│",
			last_indent_marker = "└",
			highlight = "NeoTreeIndentMarker",
			-- expander config, needed for nesting files
			with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "📁",
			expander_expanded = "📂",
			expander_highlight = "NeoTreeExpander",
		},
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
			-- then these will never be used.
			default = "*",
			highlight = "NeoTreeFileIcon"
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeModified",
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				-- Change type
				added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified  = "✍", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted   = "✘",-- this can only be used in the git_status source
				renamed   = "ℜ",-- this can only be used in the git_status source
				-- Status type
				untracked = "✨",
				ignored   = "ⅈ",
				unstaged  = "ℳ",
				staged    = "✔",
				conflict  = "",
			}
		},
	},
	window = {
		position = "left",
		width = 40,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = { 
					"toggle_node", 
					nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
			},
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["S"] = "open_split",
			["s"] = "open_vsplit",
			-- ["S"] = "split_with_window_picker",
			-- ["s"] = "vsplit_with_window_picker",
			["t"] = "open_tabnew",
			["w"] = "open_with_window_picker",
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			--["Z"] = "expand_all_nodes",
			["a"] = { 
				"add",
				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none" -- "none", "relative", "absolute"
				}
			},
			["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
			-- ["c"] = {
			--  "copy",
			--  config = {
			--    show_path = "none" -- "none", "relative", "absolute"
			--  }
			--}
			["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
		}
	},
	nesting_rules = {},
	filesystem = {
		filtered_items = {
			visible = false, -- when true, they will just be displayed differently than normal items
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_hidden = true, -- only works on Windows for hidden files/directories
			hide_by_name = {
				--"node_modules"
			},
			hide_by_pattern = { -- uses glob style patterns
				--"*.meta"
			},
			always_show = { -- remains visible even if other settings would normally hide it
				".env",
				".env.*",
				--".gitignored",
			},
			never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				".DS_Store",
				--"thumbs.db"
			},
		},
		follow_current_file = false, -- This will find and focus the file in the active buffer every
																 -- time the current file is changed while the tree is open.
		group_empty_dirs = false, -- when true, empty folders will be grouped together
		hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
																						-- in whatever position is specified in window.position
													-- "open_current",  -- netrw disabled, opening a directory opens within the
																						-- window like netrw would, regardless of window.position
													-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
		use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
																		-- instead of relying on nvim autocmd events.
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["/"] = "fuzzy_finder",
				["D"] = "fuzzy_finder_directory",
				["f"] = "filter_on_submit",
				["<c-x>"] = "clear_filter",
				["[g"] = "prev_git_modified",
				["]g"] = "next_git_modified",
			}
		}
	},
	buffers = {
		follow_current_file = true, -- This will find and focus the file in the active buffer every
																 -- time the current file is changed while the tree is open.
		group_empty_dirs = true, -- when true, empty folders will be grouped together
		show_unloaded = true,
		window = {
			mappings = {
				["bd"] = "buffer_delete",
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["A"]  = "git_add_all",
				["gu"] = "git_unstage_file",
				["ga"] = "git_add_file",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
			}
		}
	}
})
vim.cmd([[nnoremap <Leader>fs :Neotree toggle<cr>]])
-----------------------------------------------------------
-- Neovim File Icons
-----------------------------------------------------------
require'nvim-web-devicons'.setup {
 override = {
  md = {
    icon = "⁋",
    color = "#428850",
    cterm_color = "65",
    name = "md"
  },
	sum = {
		icon = "⚙",
    color = "#83ABD5",
    cterm_color = "65",
		name = "sum"
	},
	mod = {
		icon = "⚙",
    color = "#83ABD5",
    cterm_color = "65",
		name = "sum"
	},
	[".env"] = {
		icon = "⚙",
    color = "#8D8D8D",
    cterm_color = "8",
		name = "env"
	},
	[".env.template"] = {
		icon = "⚙",
    color = "#8D8D8D",
    cterm_color = "8",
		name = "template"
	},
	[".env.local"] = {
		icon = "⚙",
    color = "#8D8D8D",
    cterm_color = "8",
		name = "template"
	},
 };
 default = true;
}
