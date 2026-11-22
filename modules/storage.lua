local STORE = {}

function STORE.get(key, default)
  local raw = GetResourceKvpString(key)
  if not raw then return default end
  local ok, value = pcall(json.decode, raw)
  if not ok then return default end
  return value
end

function STORE.set(key, value)
  SetResourceKvp(key, json.encode(value))
end

function STORE.delete(key)
  DeleteResourceKvp(key)
end

exports('storage', STORE)
