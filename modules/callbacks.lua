local CB = {}
local HANDLERS = {}

function CB.register(name, fn)
  HANDLERS[name] = fn
end

RegisterNetEvent('core:cb:call', function(name, reqId, ...)
  local src = source
  local fn = HANDLERS[name]
  if not fn then
    TriggerClientEvent('core:cb:response', src, reqId, nil, 'no_handler')
    return
  end
  local ok, res = pcall(fn, src, ...)
  TriggerClientEvent('core:cb:response', src, reqId, ok and res or nil, not ok and res or nil)
end)

exports('callbacks', CB)
