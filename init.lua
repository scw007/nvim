local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-commentary',
  'tpope/vim-sleuth',
  'eapache/rainbow_parentheses.vim',
  'wellsjo/vim-save-cursor-position',
  'thinca/vim-visualstar',
  'Shougo/echodoc.vim',
  'fatih/vim-go',
  'hashivim/vim-terraform',

  {
     "L3MON4D3/LuaSnip",
     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
     build = "make install_jsregexp"
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      -- Custom function to show both absolute and relative line numbers
      local function lnum_both()
        local lnum = vim.v.lnum
        local relnum = vim.v.lnum == vim.fn.line(".") and 0 or math.abs(vim.v.lnum - vim.fn.line("."))
        return string.format("%3d %2d", lnum, relnum)
      end
      require("statuscol").setup({
        setopt = true,
        segments = {
          {
            sign = {
              namespace = { "gitsigns.*" },
              name = { "gitsigns.*" },
            },
          },
          {
            sign = {
              namespace = { ".*" },
              name = { ".*" },
              auto = true,
            },
          },
          {
            text = { lnum_both, " " },
            condition = { true },
            click = "v:lua.ScLa",
          },
        },
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      statuscolumn = { enabled = false }
    },
  },


  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'echasnovski/mini.nvim', version = '*'},
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          javascript = { 'prettier' },
          typescript = { 'prettier' },
        },
      })
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

}, {})

-- Colors
vim.cmd("colorscheme sorbet")
vim.cmd("highlight WhichKeyNormal guibg=#282c34 ctermbg=black")
-- vim.cmd("highlight WhichKeyTitle guibg=#3e4452 ctermbg=black")
-- vim.cmd("highlight WhichKeySeparator guibg=#282c34 ctermbg=black")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.shortmess = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
-- vim.o.timeoutlen = 300
vim.o.completeopt = 'fuzzy,menu,menuone,noinsert,popup,preview'
vim.o.termguicolors = true
require("bufferline").setup{}

vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.showbreak = "↪ "  -- You can customize this symbol
vim.opt.colorcolumn = "120"
vim.opt.inccommand = "split"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 3

-- Terminal scrollback buffer size
vim.g.terminal_scrollback_buffer_size = 10000

-- GUI cursor settings
vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175"
}

-- Better display for messages
vim.opt.cmdheight = 3
vim.opt.shortmess:append("c")

-- Go plugin settings
vim.g.go_def_mapping_enabled = 0
-- vim.g.go_list_type = "quickfix" -- Uncomment if needed
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1

-- Rainbow Parentheses
vim.g.rbpt_colorpairs = {
  {"brown", "SeaGreen3"},
  {"gray", "firebrick3"},
  {"cyan", "DarkOrchid3"},
}

-- Split behavior
vim.opt.splitbelow = true  -- New horizontal splits open below
vim.opt.splitright = true  -- New vertical splits open to the right

-- Fill characters for window separators
vim.opt.fillchars:append({ vert = "│" })

-- Environment variable
vim.env.GINKGO_EDITOR_INTEGRATION = "true"

-- Highlight trailing whitespace
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])

-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<leader>e', ':Explore<CR>')
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<Leader>s', ':split<CR>')
vim.keymap.set('n', '<Leader>c', ':set cursorline! cursorcolumn!<CR>')
vim.keymap.set('n', '<Leader>b', ':bnext<CR>')
vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>g', ':tabnext<CR>')
vim.keymap.set('n', '<Leader>i', ':set foldmethod=indent<CR>')
vim.keymap.set('n', '<Leader>r', ':GoReferrers<CR>')
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<A-h>', [[<C-\><C-N><C-w>h]])
vim.keymap.set('t', '<A-j>', [[<C-\><C-N><C-w>j]])
vim.keymap.set('t', '<A-k>', [[<C-\><C-N><C-w>k]])
vim.keymap.set('t', '<A-l>', [[<C-\><C-N><C-w>l]])

vim.keymap.set('i', '<A-h>', [[<C-\><C-N><C-w>h]])
vim.keymap.set('i', '<A-j>', [[<C-\><C-N><C-w>j]])
vim.keymap.set('i', '<A-k>', [[<C-\><C-N><C-w>k]])
vim.keymap.set('i', '<A-l>', [[<C-\><C-N><C-w>l]])

vim.keymap.set('n', '<A-h>', [[<C-w>h]])
vim.keymap.set('n', '<A-j>', [[<C-w>j]])
vim.keymap.set('n', '<A-k>', [[<C-w>k]])
vim.keymap.set('n', '<A-l>', [[<C-w>l]])

vim.api.nvim_set_keymap("n", "gi", ":GoInfo<CR>", { noremap = true, silent = true })


local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
      'c', 'cpp',
      -- 'go',
      'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash',
    },
    auto_install = true,

--     highlight = { enable = true },
--     indent = { enable = true },
--     incremental_selection = {
--       enable = true,
--       keymaps = {
--         init_selection = '<c-space>',
--         node_incremental = '<c-space>',
--         scope_incremental = '<c-s>',
--         node_decremental = '<M-space>',
--       },
--     },
--     textobjects = {
--       select = {
--         enable = true,
--         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--         keymaps = {
--           -- You can use the capture groups defined in textobjects.scm
--           ['aa'] = '@parameter.outer',
--           ['ia'] = '@parameter.inner',
--           ['af'] = '@function.outer',
--           ['if'] = '@function.inner',
--           ['ac'] = '@class.outer',
--           ['ic'] = '@class.inner',
--         },
--       },
--       move = {
--         enable = true,
--         set_jumps = true, -- whether to set jumps in the jumplist
--         goto_next_start = {
--           [']m'] = '@function.outer',
--           [']]'] = '@class.outer',
--         },
--         goto_next_end = {
--           [']M'] = '@function.outer',
--           [']['] = '@class.outer',
--         },
--         goto_previous_start = {
--           ['[m'] = '@function.outer',
--           ['[['] = '@class.outer',
--         },
--         goto_previous_end = {
--           ['[M'] = '@function.outer',
--           ['[]'] = '@class.outer',
--         },
--       },
--       swap = {
--         enable = true,
--         swap_next = {
--           ['<leader>a'] = '@parameter.inner',
--         },
--         swap_previous = {
--           ['<leader>A'] = '@parameter.inner',
--         },
--       },
--     },
  }
end, 0)



require('mini.snippets').setup({})
require('mini.completion').setup({})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}

-- cmp.setup {
--   snippet = {
--     -- expand = function(args)
--     --   luasnip.lsp_expand(args.body)
--     -- end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete {},
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     -- { name = 'luasnip' },
--   },
-- }

vim.lsp.enable({
  'gopls',
  'pylyzer',
  'bashls',
  'golangci_lint_ls',
  'terraform_lsp',
  'html',
  'yamlls',
  'jdtls',
})


-- Autocommands for Rainbow Parentheses
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "RainbowParenthesesToggle"
})

vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadRound"
})

vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadSquare"
})

vim.api.nvim_create_autocmd("Syntax", {
  pattern = "*",
  command = "RainbowParenthesesLoadBraces"
})
