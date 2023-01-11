local remaps = {}

remaps.general = {
  load = 'onStart',
  setup = function()

    vim.g.mapleader = ' ' -- Remapping Leader

    vim.keymap.set({ 'i' }, 'kk', '<Esc>',
      { desc = 'Fast exit to normal mode' })

    vim.keymap.set({ 'i' }, 'kk', '<Esc>',
      { desc = 'Fast exit to normal mode' })

    vim.keymap.set('', 'j', '<Left>',
      { desc = 'Change default LEFT movement' })

    vim.keymap.set('', 'k', '<Down>',
      { desc = 'Change default DOWN movement' })

    vim.keymap.set('', 'l', '<Up>',
      { desc = 'Change default UP movement' })

    vim.keymap.set('', ';', '<Right>',
      { desc = 'Change default RIGHT movement' })

    vim.keymap.set('', 'y', 'y',
      { desc = 'store yanked text in windows clipboard' })

    vim.keymap.set('n', 'vv', '<C-v>',
      { desc = 'Area select shortcut' })

    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>',
      { desc = 'ESC to leave terminal' })

    vim.keymap.set('t', '<C-v>', '<C-\\><C-n><C-v>',
      { desc = 'Allow C-V paste in terminal' })

    vim.keymap.set('v', '*r', '"hy:%s/<C-r>h//g<left><left>',
      { desc = 'Enter replace prompt over selected text' })

    vim.keymap.set('n', 'ff', function() vim.lsp.buf.format { async = true } end,
      { desc = 'Document Format' })

    vim.keymap.set({ '' }, '<C-Space>', '<Nop>',
      { desc = 'Disable default behavior' })

  end
}

remaps.telescope = {
  load = 'onStart',
  setup = function()
    local ok, builtin = pcall(require, 'telescope.builtin')
    if ok then
      vim.keymap.set('n', '<leader>tf', function() builtin.find_files({ no_ignore = true }) end,
        { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>tg', function() builtin.live_grep() end,
        { desc = 'Telescope grep files' })
      vim.keymap.set('n', '<leader>tb', function() builtin.buffers() end, { desc = 'Telescope find buffer' })
      vim.keymap.set('n', '<leader>th', function() builtin.help_tags() end, { desc = 'Telescope search help tags' })
      vim.keymap.set('n', '<leader>tc', function() builtin.commands() end, { desc = '' })
      vim.keymap.set('n', '<leader>tr', function() builtin.lsp_references() end, { desc = '' })
      vim.keymap.set('n', '<leader>ts', function() builtin.lsp_document_symbols() end, { desc = '' })
      vim.keymap.set('n', '<leader>tss', function() builtin.lsp_workspace_symbols() end, { desc = '' })
      vim.keymap.set('n', '<leader>tc', function() builtin.lsp_code_actions() end, { desc = '' })
      vim.keymap.set('n', '<leader>te', function() builtin.lsp_document_diagnostics() end, { desc = '' })
      vim.keymap.set('n', '<leader>tee', function() builtin.lsp_workspace_diagnostics() end, { desc = '' })
      vim.keymap.set('n', '<leader>ti', function() builtin.lsp_implementations() end, { desc = '' })
      vim.keymap.set('n', '<leader>td', function() builtin.lsp_definitions() end, { desc = '' })


      -- Telescope Extensions
      vim.keymap.set('n', '<leader>tp', function() builtin.extensions.projects({}) end,
        { desc = '' })
      vim.keymap.set('v', '<leader>tr ', function() builtin.extensions.refactoring.refactors() end,
        { desc = '', noremap = true })
    else
    end
  end
}

remaps.lsp = {
  load = 'conditional',
  setup = function()
    vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.hover() end, { desc = '' })
    vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, { desc = '' })
    vim.keymap.set('n', '<leader>gD', function() vim.lsp.buf.declaration() end, { desc = '' })
    vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.implementation() end, { desc = '' })
    vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.load_definition() end, { desc = '' })
    vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, { desc = '' })
    vim.keymap.set('n', '<leader>s', function() vim.lsp.buf.signature_help() end, { desc = '' })
    vim.keymap.set('n', '<leader>br', function() vim.lsp.buf.rename() end, { desc = '' })
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = '' })
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.range_code_action() end, { desc = '' })
    vim.keymap.set('n', '<leader>o', function() vim.diagnostic.open_float() end, { desc = '' })
    vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev() end, { desc = '' })
    vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end, { desc = '' })
  end,
}


local T = {
  remaps = remaps,
  setup = function()
    for _, remap in pairs(remaps) do
      if remap.load == 'onStart' then
        remap.setup()
      end
    end
  end
}

return T
