local NOTIFY = {}

local STYLES = {
  success = { color = '#4ade80', icon = 'check'  },
  error   = { color = '#ef4444', icon = 'x'      },
  info    = { color = '#60a5fa', icon = 'info'   },
  warn    = { color = '#f59e0b', icon = 'alert'  },
}

function NOTIFY.push(message, kind, duration)
  kind     = kind or 'info'
  duration = duration or 4000

  local style = STYLES[kind] or STYLES.info
  SendNUIMessage({
    action   = 'notify',
    message  = message,
    color    = style.color,
    icon     = style.icon,
    duration = duration,
  })
end

RegisterNetEvent('core:notify', function(message, kind, duration)
  NOTIFY.push(message, kind, duration)
end)

exports('notify', NOTIFY.push)
