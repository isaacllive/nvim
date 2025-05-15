local opts = {}

opts.ts_ls = function()
  return {}
end

opts.cssls = function()
  return {}
end

opts.phpactor = function()
  return {}
end

opts.bashls = function()
  return {}
end

opts.html = function()
  return {}
end

opts.jsonls = function()
  local ok, schemastore = pcall(require, "schemastore")
  if ok then
    return {
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true },
        },
      },
    }
  else return {}
  end
end

opts['lua_ls'] = function()
  return {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim", "use", "require", "pcall" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end


-- opts.yamlls = function()
--   return {
--     yaml = {
--       schemaStore = {
--         enable = true
--       }
--     }
--   }
-- end

-- opts.tailwindcss = function()
--   return {}
-- end
--
-- opts.pyright = function()
--   return {
--     settings = {
--       python = {
--         analysis = {
--           typeCheckingMode = "off",
--         },
--       },
--     },
--   }
-- end

-- opts.gopls = function()
--   return {}
-- end

-- opts.rust_analyzer = function()
--   local rust_opts = {
--     tools = {
--       on_initialized = function()
--         vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
--           pattern = { "*.rs" },
--           callback = function()
--             vim.lsp.codelens.refresh()
--           end,
--         })
--       end,
--       inlay_hints = {
--         -- Only show inlay hints for the current line
--         only_current_line = false,
-- 
--         -- Event which triggers a refersh of the inlay hints.
--         -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
--         -- not that this may cause higher CPU usage.
--         -- This option is only respected when only_current_line and
--         -- autoSetHints both are true.
--         only_current_line_autocmd = "CursorHold",
-- 
--         -- whether to show parameter hints with the inlay hints or not
--         -- default: true
--         show_parameter_hints = false,
-- 
--         -- whether to show variable name before type hints with the inlay hints or not
--         -- default: false
--         show_variable_name = false,
-- 
--         -- prefix for parameter hints
--         -- default: "<-"
--         -- parameter_hints_prefix = "<- ",
--         parameter_hints_prefix = " ",
-- 
--         -- prefix for all the other hints (type, chaining)
--         -- default: "=>"
--         -- other_hints_prefix = "=> ",
--         other_hints_prefix = " ",
-- 
--         -- whether to align to the lenght of the longest line in the file
--         max_len_align = false,
-- 
--         -- padding from the left if max_len_align is true
--         max_len_align_padding = 1,
-- 
--         -- whether to align to the extreme right or not
--         right_align = false,
-- 
--         -- padding from the right if right_align is true
--         right_align_padding = 7,
-- 
--         -- The color of the hints
--         highlight = "Comment",
--       },
--       hover_actions = {
--         auto_focus = false,
--         border = "rounded",
--         width = 60,
--         -- height = 30,
--       },
--     },
--     server = {
--       cmd = { "rustup", "run", "nightly", os.getenv "HOME" .. "/.local/bin/rust-analyzer" },
--       settings = {
--         ["rust-analyzer"] = {
--           lens = {
--             enable = true,
--           },
--           checkOnSave = {
--             command = "clippy",
--           },
--         },
--       },
--     },
--   }
-- 
--   local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
--   if not rust_tools_status_ok then
--     return {}
--   end
--   rust_tools.setup(rust_opts)
-- end


return opts
