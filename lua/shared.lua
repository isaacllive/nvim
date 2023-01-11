------------------------------------------------------------------
-- Global Lua Functions and Variabels
------------------------------------------------------------------

-- Check if Packer is Installed
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

-- Check if Packer is Installed
function BootsrapLazy()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

-- Functional wrapper for mapping custom keybindings
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Profile sensitive require
function CustomRequire(module)
  if (PROFILE) then
    return SafeRequire(PROFILE .. '.' .. module)
  else
    error("Lua: PROFILE global variable is not set")
  end
end

-- Procteted required call
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

-- Profile sensitive require
function GetProfile(module)
  if (PROFILE) then
    return PROFILE
  else
    error("Lua: PROFILE global variable is not set")
  end
end
