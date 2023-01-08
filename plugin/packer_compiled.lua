-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/isaac/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/isaac/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/isaac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/isaac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/isaac/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\2K\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\fComment\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-git"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-omni"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2î\a\0\0\6\0\25\0\0316\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3B\2\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\rrelative\vcursor\nstyle\fminimal\bcol\3\1\vborder\vsingle\28current_line_blame_opts\1\0\4\14virt_text\2\ndelay\3è\a\18virt_text_pos\beol\22ignore_whitespace\1\17watch_gitdir\1\0\2\rinterval\3è\a\17follow_files\2\nsigns\1\0\n\20update_debounce\3d\24attach_to_untracked\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\vlinehl\1\nnumhl\1\18sign_priority\3\6\15signcolumn\2\23current_line_blame\1\20max_file_length\3À¸\2\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\2®\2\0\0\a\0\18\0!6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0006\2\3\0005\3\f\0005\4\5\0006\5\6\0009\5\a\0059\5\b\5'\6\t\0B\5\2\2'\6\n\0&\5\6\5=\5\v\4=\4\r\0035\4\14\0006\5\6\0009\5\a\0059\5\b\5'\6\t\0B\5\2\2'\6\15\0&\5\6\5=\5\v\4=\4\16\3=\3\4\0029\2\17\1B\2\1\1K\0\1\0\19enable_profile\rmodpaths\23/luacache_modpaths\1\0\1\venable\2\vchunks\1\0\0\tpath\21/luacache_chunks\ncache\fstdpath\afn\bvim\1\0\1\venable\2\22__luacache_config\a_G\14impatient\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\2Ù\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0005\4\5\0=\4\6\3B\2\2\1K\0\1\0\nsigns\1\0\4\16information\tinfo\thint\thint\fwarning\twarn\nerror\nerror\1\0\4\29use_lsp_diagnostic_signs\1\17indent_lines\1\16fold_closed\6>\14fold_open\6v\nsetup\ftrouble\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\2Â\2\0\0\t\0\17\0/6\0\0\0'\1\1\0B\0\2\2\14\0\0\0X\1\3€6\1\2\0'\2\3\0B\1\2\1'\1\4\0006\2\5\0009\2\6\0029\2\a\2)\3\0\0005\4\n\0006\5\5\0009\5\6\0059\5\b\0059\5\t\5=\5\b\4B\2\3\2\21\2\2\0006\3\5\0009\3\6\0039\3\a\3)\4\0\0005\5\f\0006\6\5\0009\6\6\0069\6\b\0069\6\v\6=\6\b\5B\3\3\2\21\3\3\0\18\4\1\0009\5\r\0009\5\14\5'\6\4\0\18\a\2\0'\b\15\0&\1\b\4\18\4\1\0009\5\r\0009\5\16\5'\6\4\0\18\a\3\0&\1\a\4L\1\2\0\fWarning\6 \nError\16diagnostics\1\0\0\tWARN\1\0\0\nERROR\rseverity\bget\15diagnostic\bvim\5\31CUSTOM: Icons not detected\nerror\nicons\18CustomRequireº\4\1\0\b\0 \00066\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€2\0.€3\2\3\0009\3\4\0015\4\v\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0=\6\t\0054\6\0\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0055\6\22\0004\a\3\0>\2\1\a>\a\1\6=\6\23\0055\6\24\0=\6\25\5=\5\26\0045\5\27\0004\6\0\0=\6\15\0054\6\0\0=\6\17\0055\6\28\0=\6\19\0054\6\0\0=\6\21\0054\6\0\0=\6\23\0054\6\0\0=\6\25\5=\5\29\0045\5\30\0=\5\31\4B\3\2\1K\0\1\0K\0\1\0\15extensions\1\2\0\0\bfzf\22inactive_sections\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\3\0\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\5\5\1\0\2\ntheme\tauto\18icons_enabled\2\nsetup\0\flualine\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\2ë\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2R\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\2C\0\1\3\0\4\0\a6\1\0\0'\2\1\0B\1\2\0029\1\2\0019\2\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireõ\1\0\1\6\2\v\2)6\1\0\0009\1\1\0019\1\2\1'\2\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\5€-\2\0\0009\2\5\2-\3\1\0B\2\2\1X\2\24€\b\1\1\0X\2\16€6\2\0\0009\2\1\0029\2\6\2'\3\3\0B\2\2\2\18\3\2\0009\2\a\2\18\4\1\0\18\5\1\0B\2\4\2\18\3\2\0009\2\b\2'\4\t\0B\2\3\2\15\0\2\0X\3\3€\18\2\0\0B\2\1\1X\2\3€-\2\0\0009\2\n\2B\2\1\1K\0\1\0\1À\2À\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0X\0\1\3\2\2\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1-\2\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\21select_prev_item\fvisibleS\0\0\3\1\5\0\t-\0\0\0009\0\0\0005\1\3\0-\2\0\0009\2\1\0029\2\2\2=\2\4\1B\0\2\1K\0\1\0\0\0\vreason\1\0\0\tAuto\18ContextReason\rcompletez\1\1\b\1\a\0\0176\1\0\0009\1\1\0019\1\2\1B\1\1\2\18\3\1\0009\2\3\1\18\4\0\0)\5\0\0006\6\0\0009\6\4\0063\a\5\0B\6\2\0A\2\3\1\18\3\1\0009\2\6\1B\2\2\1K\0\1\0\1À\tstop\0\18schedule_wrap\nstart\14new_timer\tloop\bvim‡\f\1\0\n\0J\0§\0016\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€2\0Ÿ€6\2\3\0009\2\4\0025\3\6\0=\3\5\0026\2\1\0'\3\a\0B\2\2\0029\2\b\2B\2\1\0015\2\v\0009\3\t\0019\3\n\3=\3\f\0029\3\r\0015\4\17\0005\5\15\0003\6\14\0=\6\16\5=\5\18\0045\5\22\0009\6\19\0019\6\20\0069\6\21\6B\6\1\2=\6\23\0059\6\19\0019\6\20\0069\6\21\6B\6\1\2=\6\24\5=\5\20\0049\5\25\0019\5\26\0059\5\27\0055\6\30\0009\a\25\0013\b\28\0005\t\29\0B\a\3\2=\a\31\0069\a\25\0013\b \0005\t!\0B\a\3\2=\a\"\0069\a\25\0019\a#\a)\büÿB\a\2\2=\a$\0069\a\25\0019\a#\a)\b\4\0B\a\2\2=\a%\0069\a\25\0019\a&\aB\a\1\2=\a'\0069\a\25\0019\a(\a5\b)\0B\a\2\2=\a*\6B\5\2\2=\5\25\0049\5\19\0019\5+\0054\6\3\0005\a,\0>\a\1\0065\a-\0>\a\2\0064\a\5\0005\b.\0>\b\1\a5\b/\0>\b\2\a5\b0\0>\b\3\a5\b1\0>\b\4\aB\5\3\2=\5+\0045\0052\0=\0053\4B\3\2\0019\3\r\0019\0034\3'\0045\0005\0058\0009\6\19\0019\6+\0064\a\3\0005\b6\0>\b\1\a4\b\3\0005\t7\0>\t\1\bB\6\3\2=\6+\5B\3\3\0019\3\r\0019\0039\3'\4:\0005\5;\0009\6\25\0019\6\26\0069\0069\6B\6\1\2=\6\25\0054\6\3\0005\a<\0>\a\1\6=\6+\5B\3\3\0019\3\r\0019\0039\3'\4=\0005\5>\0009\6\25\0019\6\26\0069\0069\6B\6\1\2=\6\25\0059\6\19\0019\6+\0064\a\3\0005\b?\0>\b\1\a4\b\3\0005\t@\0>\t\1\bB\6\3\2=\6+\5B\3\3\0013\3A\0007\3B\0006\3\3\0009\3C\3'\4D\0B\3\2\0016\3\0\0006\4\1\0'\5E\0B\3\3\3\14\0\3\0X\5\2€2\0\0€K\0\1\0009\5F\1\18\6\5\0009\5G\5'\aH\0009\bI\4B\b\1\0A\5\2\0012\0\0€K\0\1\0K\0\1\0\20on_confirm_done\rconfirms\aon\nevent\"nvim-autopairs.completion.cmpg  augroup CmpDebounceAuGroup\n    au!\n    au TextChangedI *  lua Lsp_Debounce(500)\n  augroup end\n  \bcmd\17Lsp_Debounce\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\17experimental\1\0\1\15ghost_text\2\1\0\2\19keyword_length\3\5\tname\fcmdline\1\0\2\19keyword_length\3\5\tname\tpath\1\0\2\19keyword_length\3\5\tname\bgit\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\2\19keyword_length\3\3\tname\fluasnip\1\0\2\19keyword_length\3\2\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\r<C-down>\v<C-up>\16scroll_docs\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rbehavior\1\0\0\vSelect\19SelectBehavior\14lazy_load luasnip.loaders.from_vscode\1\5\0\0\tmenu\fpreview\fmenuone\rnoselect\16completeopt\bopt\bvim\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-highlight-colors"] = {
    config = { "\27LJ\2\2r\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0B\2\2\1K\0\1\0\1\0\1\vrender\15background\nsetup\26nvim-highlight-colors\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\2”\3\0\0\6\0\21\0\0296\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0004\4\0\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\4=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\3B\2\2\1K\0\1\0\fautocmd\vevents\1\3\0\0\15CursorHold\16CursorHoldI\fpattern\1\2\0\0\6*\1\0\1\fenabled\2\16status_text\1\0\3\ttext\tðŸ’¡\21text_unavailable\5\fenabled\1\17virtual_text\1\0\3\ttext\tðŸ’¡\fhl_mode\freplace\fenabled\1\nfloat\rwin_opts\1\0\2\ttext\tðŸ’¡\fenabled\1\tsign\1\0\2\fenabled\2\rpriority\3\n\vignore\1\0\0\nsetup\19nvim-lightbulb\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2‡\3\0\0\6\0\15\0\0216\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0005\4\5\0005\5\6\0=\5\a\4=\4\b\0035\4\t\0005\5\n\0=\5\v\4=\4\f\0035\4\r\0=\4\14\3B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\ffoo.bar\15Identifier\1\0\2&additional_vim_regex_highligthing\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2^\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1'\3\4\0B\2\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-prisma"] = {
    loaded = true,
    path = "/home/isaac/.local/share/nvim/site/pack/packer/start/vim-prisma",
    url = "https://github.com/pantharshit00/vim-prisma"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2‡\3\0\0\6\0\15\0\0216\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0005\4\5\0005\5\6\0=\5\a\4=\4\b\0035\4\t\0005\5\n\0=\5\v\4=\4\f\0035\4\r\0=\4\14\3B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\20custom_captures\1\0\1\ffoo.bar\15Identifier\1\0\2&additional_vim_regex_highligthing\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\2C\0\1\3\0\4\0\a6\1\0\0'\2\1\0B\1\2\0029\1\2\0019\2\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireõ\1\0\1\6\2\v\2)6\1\0\0009\1\1\0019\1\2\1'\2\3\0B\1\2\2\23\1\0\1-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\5€-\2\0\0009\2\5\2-\3\1\0B\2\2\1X\2\24€\b\1\1\0X\2\16€6\2\0\0009\2\1\0029\2\6\2'\3\3\0B\2\2\2\18\3\2\0009\2\a\2\18\4\1\0\18\5\1\0B\2\4\2\18\3\2\0009\2\b\2'\4\t\0B\2\3\2\15\0\2\0X\3\3€\18\2\0\0B\2\1\1X\2\3€-\2\0\0009\2\n\2B\2\1\1K\0\1\0\1À\2À\rcomplete\a%s\nmatch\bsub\fgetline\21select_next_item\fvisible\6.\bcol\afn\bvim\2\0X\0\1\3\2\2\0\r-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\5€-\1\0\0009\1\1\1-\2\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\1À\2À\21select_prev_item\fvisibleS\0\0\3\1\5\0\t-\0\0\0009\0\0\0005\1\3\0-\2\0\0009\2\1\0029\2\2\2=\2\4\1B\0\2\1K\0\1\0\0\0\vreason\1\0\0\tAuto\18ContextReason\rcompletez\1\1\b\1\a\0\0176\1\0\0009\1\1\0019\1\2\1B\1\1\2\18\3\1\0009\2\3\1\18\4\0\0)\5\0\0006\6\0\0009\6\4\0063\a\5\0B\6\2\0A\2\3\1\18\3\1\0009\2\6\1B\2\2\1K\0\1\0\1À\tstop\0\18schedule_wrap\nstart\14new_timer\tloop\bvim‡\f\1\0\n\0J\0§\0016\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€2\0Ÿ€6\2\3\0009\2\4\0025\3\6\0=\3\5\0026\2\1\0'\3\a\0B\2\2\0029\2\b\2B\2\1\0015\2\v\0009\3\t\0019\3\n\3=\3\f\0029\3\r\0015\4\17\0005\5\15\0003\6\14\0=\6\16\5=\5\18\0045\5\22\0009\6\19\0019\6\20\0069\6\21\6B\6\1\2=\6\23\0059\6\19\0019\6\20\0069\6\21\6B\6\1\2=\6\24\5=\5\20\0049\5\25\0019\5\26\0059\5\27\0055\6\30\0009\a\25\0013\b\28\0005\t\29\0B\a\3\2=\a\31\0069\a\25\0013\b \0005\t!\0B\a\3\2=\a\"\0069\a\25\0019\a#\a)\büÿB\a\2\2=\a$\0069\a\25\0019\a#\a)\b\4\0B\a\2\2=\a%\0069\a\25\0019\a&\aB\a\1\2=\a'\0069\a\25\0019\a(\a5\b)\0B\a\2\2=\a*\6B\5\2\2=\5\25\0049\5\19\0019\5+\0054\6\3\0005\a,\0>\a\1\0065\a-\0>\a\2\0064\a\5\0005\b.\0>\b\1\a5\b/\0>\b\2\a5\b0\0>\b\3\a5\b1\0>\b\4\aB\5\3\2=\5+\0045\0052\0=\0053\4B\3\2\0019\3\r\0019\0034\3'\0045\0005\0058\0009\6\19\0019\6+\0064\a\3\0005\b6\0>\b\1\a4\b\3\0005\t7\0>\t\1\bB\6\3\2=\6+\5B\3\3\0019\3\r\0019\0039\3'\4:\0005\5;\0009\6\25\0019\6\26\0069\0069\6B\6\1\2=\6\25\0054\6\3\0005\a<\0>\a\1\6=\6+\5B\3\3\0019\3\r\0019\0039\3'\4=\0005\5>\0009\6\25\0019\6\26\0069\0069\6B\6\1\2=\6\25\0059\6\19\0019\6+\0064\a\3\0005\b?\0>\b\1\a4\b\3\0005\t@\0>\t\1\bB\6\3\2=\6+\5B\3\3\0013\3A\0007\3B\0006\3\3\0009\3C\3'\4D\0B\3\2\0016\3\0\0006\4\1\0'\5E\0B\3\3\3\14\0\3\0X\5\2€2\0\0€K\0\1\0009\5F\1\18\6\5\0009\5G\5'\aH\0009\bI\4B\b\1\0A\5\2\0012\0\0€K\0\1\0K\0\1\0\20on_confirm_done\rconfirms\aon\nevent\"nvim-autopairs.completion.cmpg  augroup CmpDebounceAuGroup\n    au!\n    au TextChangedI *  lua Lsp_Debounce(500)\n  augroup end\n  \bcmd\17Lsp_Debounce\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\17experimental\1\0\1\15ghost_text\2\1\0\2\19keyword_length\3\5\tname\fcmdline\1\0\2\19keyword_length\3\5\tname\tpath\1\0\2\19keyword_length\3\5\tname\bgit\1\0\2\19keyword_length\3\3\tname\vbuffer\1\0\2\19keyword_length\3\3\tname\fluasnip\1\0\2\19keyword_length\3\2\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\r<C-down>\v<C-up>\16scroll_docs\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\rbehavior\1\0\0\vSelect\19SelectBehavior\14lazy_load luasnip.loaders.from_vscode\1\5\0\0\tmenu\fpreview\fmenuone\rnoselect\16completeopt\bopt\bvim\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\2ë\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\5\0005\4\4\0=\4\6\3B\2\2\1K\0\1\0\rmappings\1\0\5\24use_local_scrolloff\1\22respect_scrolloff\1\16hide_cursor\2\25cursor_scrolls_alone\2\rstop_eof\2\1\n\0\0\n<C-u>\n<C-d>\n<C-b>\n<C-f>\n<C-y>\n<C-e>\azt\azz\azb\nsetup\14neoscroll\frequire\npcall\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\2®\2\0\0\a\0\18\0!6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0006\2\3\0005\3\f\0005\4\5\0006\5\6\0009\5\a\0059\5\b\5'\6\t\0B\5\2\2'\6\n\0&\5\6\5=\5\v\4=\4\r\0035\4\14\0006\5\6\0009\5\a\0059\5\b\5'\6\t\0B\5\2\2'\6\15\0&\5\6\5=\5\v\4=\4\16\3=\3\4\0029\2\17\1B\2\1\1K\0\1\0\19enable_profile\rmodpaths\23/luacache_modpaths\1\0\1\venable\2\vchunks\1\0\0\tpath\21/luacache_chunks\ncache\fstdpath\afn\bvim\1\0\1\venable\2\22__luacache_config\a_G\14impatient\frequire\npcall\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2^\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1'\3\4\0B\2\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-highlight-colors
time([[Config for nvim-highlight-colors]], true)
try_loadstring("\27LJ\2\2r\0\0\4\0\5\0\v6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0B\2\2\1K\0\1\0\1\0\1\vrender\15background\nsetup\26nvim-highlight-colors\frequire\npcall\0", "config", "nvim-highlight-colors")
time([[Config for nvim-highlight-colors]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\2Â\2\0\0\t\0\17\0/6\0\0\0'\1\1\0B\0\2\2\14\0\0\0X\1\3€6\1\2\0'\2\3\0B\1\2\1'\1\4\0006\2\5\0009\2\6\0029\2\a\2)\3\0\0005\4\n\0006\5\5\0009\5\6\0059\5\b\0059\5\t\5=\5\b\4B\2\3\2\21\2\2\0006\3\5\0009\3\6\0039\3\a\3)\4\0\0005\5\f\0006\6\5\0009\6\6\0069\6\b\0069\6\v\6=\6\b\5B\3\3\2\21\3\3\0\18\4\1\0009\5\r\0009\5\14\5'\6\4\0\18\a\2\0'\b\15\0&\1\b\4\18\4\1\0009\5\r\0009\5\16\5'\6\4\0\18\a\3\0&\1\a\4L\1\2\0\fWarning\6 \nError\16diagnostics\1\0\0\tWARN\1\0\0\nERROR\rseverity\bget\15diagnostic\bvim\5\31CUSTOM: Icons not detected\nerror\nicons\18CustomRequireº\4\1\0\b\0 \00066\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€2\0.€3\2\3\0009\3\4\0015\4\v\0005\5\5\0005\6\6\0=\6\a\0055\6\b\0=\6\t\0054\6\0\0=\6\n\5=\5\f\0045\5\14\0005\6\r\0=\6\15\0055\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0055\6\22\0004\a\3\0>\2\1\a>\a\1\6=\6\23\0055\6\24\0=\6\25\5=\5\26\0045\5\27\0004\6\0\0=\6\15\0054\6\0\0=\6\17\0055\6\28\0=\6\19\0054\6\0\0=\6\21\0054\6\0\0=\6\23\0054\6\0\0=\6\25\5=\5\29\0045\5\30\0=\5\31\4B\3\2\1K\0\1\0K\0\1\0\15extensions\1\2\0\0\bfzf\22inactive_sections\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\3\0\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\3\0\0\5\5\25component_separators\1\3\0\0\5\5\1\0\2\ntheme\tauto\18icons_enabled\2\nsetup\0\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
try_loadstring("\27LJ\2\2Ù\1\0\0\5\0\a\0\r6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0005\4\5\0=\4\6\3B\2\2\1K\0\1\0\nsigns\1\0\4\16information\tinfo\thint\thint\fwarning\twarn\nerror\nerror\1\0\4\29use_lsp_diagnostic_signs\1\17indent_lines\1\16fold_closed\6>\14fold_open\6v\nsetup\ftrouble\frequire\npcall\0", "config", "lsp-trouble.nvim")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\2”\3\0\0\6\0\21\0\0296\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\4\0004\4\0\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\4=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0005\5\16\0=\5\17\0045\5\18\0=\5\19\4=\4\20\3B\2\2\1K\0\1\0\fautocmd\vevents\1\3\0\0\15CursorHold\16CursorHoldI\fpattern\1\2\0\0\6*\1\0\1\fenabled\2\16status_text\1\0\3\ttext\tðŸ’¡\21text_unavailable\5\fenabled\1\17virtual_text\1\0\3\ttext\tðŸ’¡\fhl_mode\freplace\fenabled\1\nfloat\rwin_opts\1\0\2\ttext\tðŸ’¡\fenabled\1\tsign\1\0\2\fenabled\2\rpriority\3\n\vignore\1\0\0\nsetup\19nvim-lightbulb\frequire\npcall\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\2K\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\fComment\frequire\npcall\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2R\0\0\3\0\4\0\n6\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2î\a\0\0\6\0\25\0\0316\0\0\0006\1\1\0'\2\2\0B\0\3\3\14\0\0\0X\2\1€K\0\1\0009\2\3\0015\3\15\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\3B\2\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\rrelative\vcursor\nstyle\fminimal\bcol\3\1\vborder\vsingle\28current_line_blame_opts\1\0\4\14virt_text\2\ndelay\3è\a\18virt_text_pos\beol\22ignore_whitespace\1\17watch_gitdir\1\0\2\rinterval\3è\a\17follow_files\2\nsigns\1\0\n\20update_debounce\3d\24attach_to_untracked\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\vlinehl\1\nnumhl\1\18sign_priority\3\6\15signcolumn\2\23current_line_blame\1\20max_file_length\3À¸\2\14word_diff\1\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”‚\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\npcall\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
