# fivem-core

Small, modular FiveM framework. No bloat, no ESX/QBCore dependency. A base for building your own scripts fast.

## Why

Every other framework drags in 50+ resources before you can ship a single feature. I wanted a 3 file base with just the modules I actually use: notifications, commands, permissions, HTTP, callbacks.

## Modules

- `notify`, client side notifications, 3 styles, animated
- `commands`, one liner command registration with perm checks
- `perms`, role based permission system (owner / admin / mod / user)
- `callbacks`, promise style client ↔ server calls
- `http`, express style HTTP endpoints on your FX server
- `storage`, tiny key value store on top of ox_lib or MySQL

## Quick example

```lua
-- server
local core = exports.core

core.commands.register('setmoney', { perm = 'admin' }, function(src, args)
  local target = tonumber(args[1])
  local amount = tonumber(args[2])
  TriggerClientEvent('core:notify', target, 'got $' .. amount)
end)

-- client
RegisterNetEvent('core:notify', function(msg)
  exports.core:notify(msg, 'success')
end)
```

## Install

```
cd server-data/resources
git clone https://github.com/missending/fivem-core core
```

Add to `server.cfg`:
```
ensure core
```

## Live demo server

https://tec72.cc

## Contact / commissions

- Discord: https://discord.gg/c7d2vBY52z

## License

MIT
