local perms = exports.core.perms
local COMMANDS = {}

function COMMANDS.register(name, opts, fn)
  opts = opts or {}
  RegisterCommand(name, function(src, args)
    if opts.perm and not perms:has(src, opts.perm) then
      TriggerClientEvent('core:notify', src, 'no permission', 'error')
      return
    end
    fn(src, args)
  end, false)
end

exports('commands', COMMANDS)
