local kubectl = require("kubectl.commands")
local events = require("kubectl.commands.events")
local views= require("kubectl.views")
local view = views.buffer_view
local namespace = views.view_namespace
local set_current_namespace = views.set_current_namespace
local lib = require("kubectl.lib")

local M = {
  resource = "deployment"
}

M.keymap = {
    gd=function()
      local name = lib.current_word()
      local cmd = kubectl.describe(M.resource, name, namespace())
      view({"Deployment", name}, cmd)
    end,
    ge=function()
      local name = lib.current_word()
      local cmd = events.for_resource(M.resource, name, namespace())
      view({"Events for", name}, cmd)
    end,
    gj=function()
      local name = lib.current_word()
      local cmd = kubectl.json(M.resource, name, namespace())
      view({"Deployment", name}, cmd, {filetype="json"})
    end,
    gy=function()
      local name = lib.current_word()
      local cmd = kubectl.yaml(M.resource, name, namespace())
      view({"Deployment", name}, cmd, {filetype="yaml"})
    end
}

M.view = function()
  local ns = namespace()
  local opts = {}
  local keymap
  if ns == nil or ns == '' then
    keymap = {
      gn=function()
        set_current_namespace()
      end,
      gN=function()
        views.set_view_namespace(nil)
      end,
      gd=function()
       set_current_namespace()
       M.keymap["gd"]()
      end,
      ge=function()
       set_current_namespace()
       M.keymap["ge"]()
      end,
      gy=function()
       set_current_namespace()
       M.keymap["gy"]()
      end,
      gj=function()
       set_current_namespace()
       M.keymap["gj"]()
      end
    }
    vim.list_extend(opts, {"-A"})
  else
    keymap = M.keymap
  end

  local cmd = kubectl.get(M.resource, nil, ns, opts)
  local view_name = {"Deployments"}
  local view_ns = ns
  if view_ns == nil or view_ns == '' then
    view_ns = "*all*"
  end
  vim.list_extend(view_name, {"namespace="..view_ns})

  lib.table_defaults(keymap, M.keymap)
  view(view_name, cmd, { keymap = keymap })
end

return M
