-- [nfnl] Compiled from fnl/utils.fnl by https://github.com/Olical/nfnl, do not edit.
local function autoload(id)
  local mod = nil
  local proxy = {}
  local ensure
  local function _1_()
    if mod then
      return mod
    else
      mod = require(id)
      return mod
    end
  end
  ensure = _1_
  local function _3_(t, ...)
    return ensure()(...)
  end
  local function _4_(t, k)
    return ensure()[k]
  end
  local function _5_(t, k, v)
    ensure()[k] = v
    return nil
  end
  return setmetatable(proxy, {__call = _3_, __index = _4_, __newindex = _5_})
end
return {autoload = autoload}
