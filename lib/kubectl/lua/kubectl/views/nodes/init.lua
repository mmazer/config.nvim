local kubectl = require("kubectl.commands")
local views= require("kubectl.views")
local ResourceView = require("kubectl.views.resource")
local namespace = views.view_namespace

local M = {
  resource = "node"
}

M.view = function()
  local cmd = kubectl.get(M.resource, nil)
  ResourceView:create(M.resource, cmd):view()
end

return M
