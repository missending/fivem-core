local perms    = exports.core.perms
local commands = exports.core.commands

AddEventHandler('playerConnecting', function()
  local src = source
  local discord = ''
  for _, id in ipairs(GetPlayerIdentifiers(src)) do
    if id:sub(1, 8) == 'discord:' then discord = id:sub(9) end
  end
  if Config.defaultRoles[discord] then
    perms:set(src, Config.defaultRoles[discord])
  end
end)

commands.register('setrole', { perm = 'owner' }, function(src, args)
  local target = tonumber(args[1])
  local role   = args[2]
  if not target or not role then return end
  perms:set(target, role)
  TriggerClientEvent('core:notify', src, 'role set', 'success')
end)
