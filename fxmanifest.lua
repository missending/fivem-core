fx_version 'cerulean'
game       'gta5'
lua54      'yes'

author      'Moon'
description 'Small, modular FiveM framework.'
version     '0.1.0'

shared_scripts {
  'config.lua',
  'modules/perms.lua',
}

server_scripts {
  'modules/commands.lua',
  'modules/callbacks.lua',
  'modules/http.lua',
  'modules/storage.lua',
  'server.lua',
}

client_scripts {
  'modules/notify.lua',
  'client.lua',
}
