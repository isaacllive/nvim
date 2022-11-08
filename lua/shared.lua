------------------------------------------------------------------
-- Global Lua Functions and Variabels
------------------------------------------------------------------

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
    print('Lua: Warning [' .. module .. '] module not found')
    print('Lua: ' .. res)
    return nil
  end
end


