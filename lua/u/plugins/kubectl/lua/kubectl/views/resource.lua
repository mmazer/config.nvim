local kubectl = require("kubectl.commands")
local events = require("kubectl.commands.events")
local views= require("kubectl.views")
local view = views.buffer_view
local namespace = views.view_namespace
local set_current_namespace = views.set_current_namespace
local lib = require("kubectl.lib")

local ResourceView = {}

ResourceView.__index = ResourceView

function ResourceView:new(kind, cmd)
  local instance = setmetatable({}, { __index = ResourceView })
  instance.kind = kind
  instance.cmd = cmd
  instance.keymap = {
    gd=function()
      local name = lib.current_word()
      local cmd = kubectl.describe(kind, name, namespace())
      view({kind, name}, cmd)
    end,
    ge=function()
      local name = lib.current_word()
      local cmd = events.for_resource(kind, name, namespace())
      view({"Events for", name}, cmd)
    end,
    gj=function()
      local name = lib.current_word()
      local cmd = kubectl.json(kind, name, namespace())
      view({"Deployment", name}, cmd, {filetype="json"})
    end,
    gy=function()
      local name = lib.current_word()
      local cmd = kubectl.yaml(kind, name, namespace())
      view({"Deployment", name}, cmd, {filetype="yaml"})
    end
  }

  return instance
end

function ResourceView:view()
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
    keymap = self.keymap
  end

  local cmd = kubectl.get(kind, nil, ns, opts)
  local view_name = {kind}
  local view_ns = ns
  if view_ns == nil or view_ns == '' then
    view_ns = "*all*"
  end
  vim.list_extend(view_name, {"namespace="..view_ns})

  view(view_name, cmd, { keymap = keymap })
end
