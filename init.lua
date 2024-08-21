-- mod-version:3

local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"
local SearchReplaceList = require "widgets.searchreplacelist"

-- TODO: add file(s) manipulation

local refactor = {}

local RefactorView = SearchReplaceList:extend()

function RefactorView:new()
	RefactorView.super.new(self)
	self.scrollable = true
end

function RefactorView:get_name()
	return "Refactor"
end

function RefactorView:get_scrollable_size()
  return 1.2 * self.size.y
end

function RefactorView:draw()
	self:draw_background(style.background)
  self:draw_scrollbar()
end

command.add("core.docview", {
  ["refactor:open"] = function ()
    core.root_view:get_active_node():add_view(RefactorView())
  end
})

keymap.add({
  ["alt+f6"] = "refactor:open"
})

return refactor
