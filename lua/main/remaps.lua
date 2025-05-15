local remaps = {}

remaps.general = {
  autoload = true,
  setup = function()
    vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"
    vim.keymap.set({ 'i' }, 'kk', '<Esc>', { desc = 'Fast exit to normal mode' })
    vim.keymap.set({ 'i' }, 'kk', '<Esc>', { desc = 'Fast exit to normal mode' })
    vim.keymap.set('', 'j', '<Left>', { desc = 'Change default LEFT movement' })
    vim.keymap.set('', 'k', '<Down>', { desc = 'Change default DOWN movement' })
    vim.keymap.set('', 'l', '<Up>', { desc = 'Change default UP movement' })
    vim.keymap.set('n', 'h', ';', { desc = 'Change default RIGHT movement' })
    vim.keymap.set('', ';', '<Right>', { desc = 'Change default RIGHT movement' })
    vim.keymap.set('n', 'vv', '<C-v>', { desc = 'Area select shortcut' })
    vim.keymap.set('t', '<C-i>', '<C-\\><C-i>', { desc = 'Allow C-i to work in terminal' })
    vim.keymap.set('t', '<C-o>', '<C-\\><C-o>', { desc = 'Allow C-o to work in terminal' })
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'ESC to leave terminal' })
    vim.keymap.set('t', '<C-v>', '<C-\\><C-n><C-v>', { desc = 'Allow C-V paste in terminal' })
    vim.keymap.set('v', '*r', '"hy:%s/<C-r>h//g<left><left>', { desc = 'Enter replace prompt over selected text' })
    vim.keymap.set({ 'i' }, '<C-Space>', '<Nop>', { desc = 'Disable default behavior' })
    vim.keymap.set({ 'n' }, '<S-Tab>', '<C-o>', { desc = 'Reverse tab jump' })
  end
}

remaps.lsp = {
  autoload = false, -- Loaded when lsp attaches
  setup = function()
    vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end,
      { desc = 'Document Format' })
    vim.keymap.set({ 'n' }, '<leader>lsp', function() vim.cmd('LspRestart') end,
      { desc = 'Use h to restart LSP' })

    vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.hover() end, { desc = '' })
    vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.definition() end, { desc = '' })
    vim.keymap.set('n', '<leader>gD', function() vim.lsp.buf.declaration() end, { desc = '' })
    vim.keymap.set('n', '<leader>gi', function() vim.lsp.buf.implementation() end, { desc = '' })
    vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.autoload_definition() end, { desc = '' })
    vim.keymap.set('n', '<leader>gr', function() vim.lsp.buf.references() end, { desc = '' })
    vim.keymap.set('n', '<leader>s', function() vim.lsp.buf.signature_help() end, { desc = '' })
    vim.keymap.set('v', '<leader>*r', function() vim.lsp.buf.rename() end, { desc = '' })
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = '' })
    vim.keymap.set('v', '<leader>ca', function() vim.lsp.buf.range_code_action() end, { desc = '' })
    vim.keymap.set('n', '<leader>o', function() vim.diagnostic.open_float() end, { desc = '' })
    vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.get_next() end, { desc = '' })
    vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.get_prev() end, { desc = '' })
  end,
}

remaps.plugins = {
  autoload = true,
  setup = function()
    local ok, telescope = pcall(require, 'telescope')
    if ok then
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>tf', function() builtin.find_files({ no_ignore = true }) end, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>tg', function() builtin.live_grep() end, { desc = 'Telescope grep files' })
      vim.keymap.set('n', '<leader>tb', function() builtin.buffers() end, { desc = 'Telescope find buffer' })
      vim.keymap.set('n', '<leader>th', function() builtin.help_tags() end, { desc = 'Telescope search help tags' })
      vim.keymap.set('n', '<leader>tc', function() builtin.commands() end, { desc = 'Telescope view available commands' })
      vim.keymap.set('n', '<leader>tr', function() builtin.lsp_references() end, { desc = 'Telescope search lsp references' })
      vim.keymap.set('n', '<leader>ts', function() builtin.lsp_document_symbols() end, { desc = 'Telescope view document symbols' })
      vim.keymap.set('n', '<leader>tss', function() builtin.lsp_workspace_symbols() end, { desc = 'Telescope view workspace symbols' })
      vim.keymap.set('n', '<leader>te', function() builtin.lsp_document_diagnostics() end, { desc = 'Telescope view diagnostics' })
      vim.keymap.set('n', '<leader>tee', function() builtin.lsp_workspace_diagnostics() end, { desc = 'Telescope view worspace diagnostics' })
      vim.keymap.set('n', '<leader>ti', function() builtin.lsp_implementations() end, { desc = 'Telescope view implementations' })
      vim.keymap.set('n', '<leader>td', function() builtin.lsp_definitions() end, { desc = 'Telescope view definitions' })
      vim.keymap.set('v', '<leader>tr', function() telescope.extensions.refactoring.refactors() end,
        { desc = 'View all refactors available', noremap = true })
    end

    vim.keymap.set('n', '<leader>mp', function() vim.cmd('MarkdownPreview') end,
      { desc = 'Shortcut for viewing markdown preview' })
  end
}

local T = {
  remaps = remaps,
  setup = function()
    for _, remap in pairs(remaps) do
      if remap.autoload then
        remap.setup()
      end
    end
  end
}

return T
