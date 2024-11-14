local kubectl = require("kubectl.commands").kubectl

local M = {
  resource = "namespace"
}

M.list = function()
  local args = {"get", M.resource}
  return kubectl(args)
end

M.describe = function(name)
  local args = {"describe", M.resource, name}
  return kubectl(args)
end

M.get = function(name)
  local args = {"get", M.resource}
  local result = kubectl(args)
  return result
end

M.set = function(ns)
  local cmd = kubectl({"config", "set-context", "--current", "--namespace", ns})
  cmd.exec()
end

M.current = function()
  local result = kubectl({
    "config", "view", "--minify", "-o", "jsonpath='{..namespace}'"},
    {silent=true})
  return result.exec()
end
return M
