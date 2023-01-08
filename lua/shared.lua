------------------------------------------------------------------
-- Global Lua Functions and Variabels
------------------------------------------------------------------

function PackerInstalled()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Profile sensitive require
function CustomRequire(module)
  if (PROFILE) then
    return SafeRequire(PROFILE .. '.' .. module)
  else
    error("Lua: PROFILE global variable is not set")
  end
end

function SafeRequire(module)
  local status, res = pcall(require, module)
  if (status) then
    return res
  else
    print('CUSTOM: Warning [' .. module .. '] module not found')
    print('Lua: ' .. res)
    return nil
  end
end

