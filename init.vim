" 
source ~/.config/nvim/plugin.vim

" General Configurations
source ~/.config/nvim/style.vim
source ~/.config/nvim/remaps.vim
source ~/.config/nvim/settings.vim

" Basically to auto import definitions
:lua <<EOF
  -- set this if you haven't set it elsewhere, ideally inside on_attach
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  
  -- define global function
  _G.lsp_import_on_completion = function()
      local completed_item = vim.v.completed_item
      if not (completed_item and completed_item.user_data and
          completed_item.user_data.nvim and completed_item.user_data.nvim.lsp and
          completed_item.user_data.nvim.lsp.completion_item) then return end
  
      local item = completed_item.user_data.nvim.lsp.completion_item
      local bufnr = vim.api.nvim_get_current_buf()
      vim.lsp.buf_request(bufnr, "completionItem/resolve", item,
                      function(_, _, result)
          if result and result.additionalTextEdits then
              vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr)
          end
      end)
  end
  
  -- define autocmd to listen for CompleteDone
  vim.api.nvim_exec([[
  augroup LSPImportOnCompletion
      autocmd!
      autocmd CompleteDone * lua lsp_import_on_completion()
  augroup END
  ]], false)
EOF



