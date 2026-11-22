local PERMS = {
  owner = { 'owner' },
  admin = { 'owner', 'admin' },
  mod   = { 'owner', 'admin', 'mod' },
  user  = { 'owner', 'admin', 'mod', 'user' },
}

local ROLES = {} -- src -> role

function PERMS.set(src, role)
  ROLES[src] = role
end

function PERMS.get(src)
  return ROLES[src] or 'user'
end

function PERMS.has(_, src, need)
  local have = PERMS.get(src)
  for _, allowed in ipairs(PERMS[need] or {}) do
    if allowed == have then return true end
  end
  return false
end

exports('perms', PERMS)
