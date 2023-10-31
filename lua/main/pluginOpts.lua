------------------------------------------
-- Where to place configs of plugins
------------------------------------------
local configs = {}

configs.example = function()
  local ok, example = pcall(require, "example")
  if ok then
    return {}
  end
end

configs.lazy = function()
  local ok, _ = pcall(require, "lazy")
  if ok then
    return {
      defaults = { lazy = false },
      ui = {
        size = { width = 0.9, height = 0.9 },
        border = "rounded",
        icons = require('icons').lazy
      }
    }
  end
end

configs.refactoring = function()
  local ok, refactoring = pcall(require, "refactoring")
  if ok then
    refactoring.setup()
  end
end

configs.surround = function()
  local ok, surround = pcall(require, "nvim-surround")
  if ok then
    surround.setup()
  end
end

configs.htmlcss = function()
  local ok, htmlcss = pcall(require, "html-css")
  if ok then
    htmlcss:setup()
  end
end

configs.null_ls = function()
  local ok, null_ls = pcall(require, "null-ls")
  if ok then
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      debug = false,
      sources = {
        diagnostics.shellcheck,
        diagnostics.zsh,
        diagnostics.yamllint,
        diagnostics.eslint,
        formatting.codespell,
        formatting.eslint,
        code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,
        code_actions.eslint,
      },
    })
  end
end

configs.signature = function()
  local ok, signature = pcall(require, "lsp_signature")
  if ok then
    signature.setup()
  end
end

configs.cmp = function()
  local cmp_ok, cmp = pcall(require, "cmp")
  if not cmp_ok then
    return
  end
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return
  end

  local formatting = {}
  local icons = require("icons")
  local symbol_map = vim.tbl_deep_extend('force', {},
    icons.ui, icons.git,
    icons.kind, icons.lazy,
    icons.misc, icons.type,
    icons.diagnostics
  );
  local kind_ok, lspkind = pcall(require, "lspkind")
  if kind_ok and icons then
    formatting = vim.tbl_deep_extend('force', formatting, {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        symbol_map = symbol_map,
        before = function(entry, vim_item)
          if entry.source.name == "html-css" then
            vim_item.menu = entry.completion_item.menu
          end
          return vim_item
        end
      })
    })
  end

  -- local ok, _ = pcall(require, "html-css")
  -- if ok then
  --   formatting = vim.tbl_deep_extend('force', formatting, {
  --     format = lspkind.cmp_format({
  --       mode = "symbol_text",
  --       symbol_map = lspkind_symbol_map,
  --     })
  --   })
  -- end

  require("luasnip/loaders/from_vscode").lazy_load()
  cmp.setup({
    completion = {
      autocomplete = false,
      -- completeopt = 'menu,preview,menuone,longest'
      completeopt = 'menu,menuone,longest'
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif HasCharBehindCursor() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s", "c" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<up>"] = cmp.mapping.select_prev_item(),
      ["<down>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.scroll_docs(4),
      ["<C-l>"] = cmp.mapping.scroll_docs(-4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-Space>"] = cmp.mapping.abort(),
      ["<Space>"] = cmp.mapping.confirm({ select = true }),
    }),
    -- sources = cmp.config.sources({
    --   -- { name = "nvim_lsp", keyword_length = 2 },
    --   -- { name = "luasnip",  keyword_length = 3 }, -- For luasnip users.
    --   -- { name = "buffer",  keyword_length = 3 },
    --   -- { name = "git",     keyword_length = 3 },
    --   -- { name = "path",    keyword_length = 3 },
    --   -- { name = "cmdline", keyword_length = 3 },
    --   {
    --     name = "html-css",
    --     option = {
    --       max_count = {}, -- not ready yet
    --       enable_on = { "html" },                     -- set the file types you want the plugin to work on
    --       file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
    --       style_sheets = {
    --         -- example of remote styles, only css no js for now
    --         "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
    --       }
    --     }
    --   }
    -- }),

    sources = cmp.config.sources({
      { name = "nvim_lsp",               keyword_length = 2 },
      { name = "luasnip",                keyword_length = 3, max_view_entries = 5 }, -- For luasnip users.
      { name = "buffer",                 keyword_length = 3 },
      { name = "git",                    keyword_length = 3 },
      { name = "path",                   keyword_length = 3 },
      { name = "cmdline",                keyword_length = 3 },
      { name = "nvim_lsp_signature_help" },
      {
        name = "html-css",
        option = {
          max_count = {}, -- not ready yet
          enable_on = {
            "html",
          },                                           -- set the file types you want the plugin to work on
          file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
          style_sheets = {
            -- example of remote styles, only css no js for now
            "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
            "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
          },
        },
      },
    }, {
      { name = "buffer", keyword_length = 5 },
    }),

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    view = {
      entries = { name = 'custom' },
    },
    experimental = { ghost_text = true, },
    formatting = formatting
  })
  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = "buffer" },
    }),
  })
  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
  -- Use cmdline &con path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  local autopair_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
  if autopair_ok then
    cmp.event:on("confirms", cmp_autopairs.on_confirm_done())
  end
end

configs.neoscroll = function()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then
    return
  end

  neoscroll.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
  })
end

configs.highlightColors = function()
  local ok, highlightColors = pcall(require, "nvim-highlight-colors")
  if ok then
    highlightColors.setup({ render = "background" })
  end
end

configs.lualine = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  local icons = require("icons")
  if not icons then
    error("CUSTOM: Icons not detected")
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      -- component_separators = { "|", "|" },
      -- section_separators = { "|", "|" },
      disabled_filetypes = {},
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        "filename"
      },
      lualine_x = { "filetype" },
      lualine_y = { "diff",
        {
          "diagnostics",
          always_visible = true,
          sections = { 'error', 'warn', 'hint' },
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warning,
            info = icons.diagnostics.Information,
            hint = icons.diagnostics.Hint
          },
        },
      },
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "fzf" },
  })
  -- function() print(os.execute("tmux display-message -p '#I'")) end
end

configs.autosession = function()
  local ok, session = pcall(require, "auto_session")
  if ok then
    session.setup({
      log_level = "info",
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_enabled = true,
      auto_save_enabled = nil,
      auto_restore_enabled = nil,
      auto_session_suppress_dirs = nil,
      auto_session_use_git_branch = nil,
      bypass_session_save_file_types = nil,
    })
  end
end

configs.luasnip = function()
end


configs.gitsigns = function()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end

  gitsigns.setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = {
        hl = "GitSignsChange",
        text = "~",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
  })
end

configs.impatient = function()
  local status_ok, impatient = pcall(require, "impatient")
  if not status_ok then
    return
  end

  _G.__luacache_config = {
    chunks = {
      enable = true,
      path = vim.fn.stdpath("cache") .. "/luacache_chunks",
    },
    modpaths = {
      enable = true,
      path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
    },
  }
  impatient.enable_profile()
end

configs.lightbulb = function()
  local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
  if not status_ok then
    return
  end

  lightbulb.setup({
    autocmd = {
      enabled = true,
    },
    number = {
      enabled = false,
      -- Highlight group to highlight the number column if there is a lightbulb.
      hl = "LightBulbNumber",
    },
  })
end

configs.lspkind = function()
  local status_ok, lspkind = pcall(require, "lspkind")
  if status_ok then
    return
  end

  -- local icons = CustomRequire("icons")
  -- if not icons then
  --   error("CUSTOM: Icons not detected")
  -- end
  --
  -- local lspkind_symbol_map = icons.kind
  --
  -- lspkind.init({
  --   mode = "symbol_text",
  --   preset = "codicons",
  --   symbol_map = lspkind_symbol_map,
  -- })
end

configs.trouble = function()
  local status_ok, trouble = pcall(require, "trouble")
  if not status_ok then
    return
  end

  trouble.setup({
    fold_open = "v",      -- icon used for open folds
    fold_closed = ">",    -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
      error = "error",
      warning = "warn",
      hint = "hint",
      information = "info",
    },
    use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
  })
end

configs.lsputils = function()
  local status_ok, lsputils = pcall(require, "lsputils")
  if not status_ok then
    return
  end

  local border_chars = {
    TOP_LEFT = "┌",
    TOP_RIGHT = "┐",
    MID_HORIZONTAL = "─",
    MID_VERTICAL = "│",
    BOTTOM_LEFT = "└",
    BOTTOM_RIGHT = "┘",
  }

  vim.g.lsp_utils_codeaction_opts = {
    mode = "editor",
    preview = {
      title = "Suggestions Preview",
      border = true,
      border_chars = border_chars,
    },
  }

  vim.g.lsp_utils_location_opts = {
    height = 24,
    mode = "editor",
    preview = {
      title = "Location Preview",
      border = true,
      border_chars = border_chars,
    },
    keymaps = {
      n = {
        ["<C-n>"] = "j",
        ["<C-p>"] = "k",
      },
    },
  }

  vim.g.lsp_utils_symbols_opts = {
    height = 24,
    mode = "editor",
    preview = {
      title = "Symbols Preview",
      border = true,
      border_chars = border_chars,
    },
    prompt = {},
  }

  vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
  vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
  vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
  vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
  vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
  vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
  vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
  vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
end

configs.telescope = function()
  local ok, telescope = pcall(require, "telescope")
  if ok then
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--ignore-file',
          '.gitignore'
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    })
    --telescope.builtins.find_files({ hidden = true })
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('refactoring')
  end
end

configs.treesitter = function()
  local ok1, treesitter = pcall(require, "nvim-treesitter.config")
  if not ok1 then
    return
  end

  local ok2, installer = pcall(require, "nvim-treesitter.install")
  if not ok2 then
    return
  end

  installer.prefer_git = true

  treesitter.setup({
    ensure_installed = "all",
    auto_install = true,
  })
end

configs.comments = function()
  local ok, comment = pcall(require, "Comment")
  if not ok then
    return
  end
  comment.setup()
end

configs.autopairs = function()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if ok then
    autopairs.setup()
  end
end

configs.notify = function()
  local ok, notify = pcall(require, "notify")
  if not ok then
    return
  end

  local icons = require("icons")
  if not icons then
    error("CUSTOM: Icons not detected")
  end

  notify.setup({
    -- Animation style (see below for details)
    stages = "static",
    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,
    -- Function called when a window is closed
    on_close = nil,
    -- Render function for notifications. See notify-render()
    render = "default",
    -- Default timeout for notifications
    timeout = 2000,
    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    background_colour = "#000000",
    -- Minimum width for notification windows
    minimum_width = 10,
    -- Icons for the different levels
    icons = {
      ERROR = icons.diagnostics.error or " ",
      WARN = icons.diagnostics.warning or " ",
      INFO = icons.diagnostics.information or " ",
      DEBUG = icons.ui.Bug or " ",
      TRACE = icons.ui.Pencil or "✎ ",
    },
  })
  vim.notify = notify
end

configs.noice = function()
  local ok, noice = pcall(require, "noice")
  if not ok then
    return
  end
  noice.setup({
    lsp = {
      signature = {
        enabled = false
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = false,      -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    cmdline = {
      view = "cmdline",
    },
  })
end

configs.mason = function()
  local ok, mason = pcall(require, "mason")
  if ok then
    mason.setup()
  end
end

configs.projects = function()
  local ok, projects = pcall(require, "project_nvim")
  if ok then
    projects.setup({
      manual_mode = true
    })
  end
end

configs.lint = function()
  local ok, lint = pcall(require, "lint")
  if ok then
    lint.linters_by_ft = {
      stylize_markdown = { 'vale' }
    }
  end
end

configs.dashboard = function()
  local status_ok, db = pcall(require, "dashboard")
  if not status_ok then
    return
  end
  local fn = vim.fn
  local home = os.getenv("HOME")
  local plugins_count = fn.len(fn.globpath("~/.config/nvim/plugged", "*", 0, 1))

  db.custom_header = {
    "",
    "",
    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    "",
    "-----------------------------------------------------------",
    "",
    "",
    "MAIN MENU",
    "",
    "",
  }

  -- TODO make these actually work
  db.custom_center = {
    {
      icon = "  ",
      desc = "Find  File                               ",
      action = "Telescope find_files find_command=rg,--hidden,--files",
      shortcut = "SPC f f",
    },
    {
      icon = "  ",
      desc = "Recently opened files                    ",
      action = "DashboardFindHistory",
      shortcut = "SPC f h",
    },
    {
      icon = "  ",
      desc = "Find  word                               ",
      action = "Telescope live_grep",
      shortcut = "SPC f g",
    },
    {
      icon = "  ",
      desc = "Open Personal dotfiles                   ",
      action = "Telescope dotfiles path=" .. home .. "/dotfiles/dotfiles",
      shortcut = "SPC f d",
    },
  }

  db.custom_footer = {
    "",
    "",
    "-----------------------------------------------------------",
    "Plugins Loaded: " .. plugins_count,
    "",
    "",
    "",
  }
end

return configs
