local HTTP = {}
local ROUTES = {}

function HTTP.get(path, fn)  ROUTES['GET '  .. path] = fn end
function HTTP.post(path, fn) ROUTES['POST ' .. path] = fn end

SetHttpHandler(function(req, res)
  local key = req.method .. ' ' .. req.path
  local fn  = ROUTES[key]
  if not fn then
    res.writeHead(404, { ['Content-Type'] = 'application/json' })
    res.send('{"error":"not_found"}')
    return
  end
  req.setDataHandler(function(body)
    local ok, out = pcall(fn, req, body)
    res.writeHead(ok and 200 or 500, { ['Content-Type'] = 'application/json' })
    res.send(json.encode(ok and (out or { ok = true }) or { error = tostring(out) }))
  end)
end)

exports('http', HTTP)
