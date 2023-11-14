local NeoHotbar = script.Parent.Parent.Parent

local Fusion = require(NeoHotbar.Parent.Fusion)
local FusionUtils = require(NeoHotbar.Parent.FusionUtils)
local States = require(NeoHotbar.UI.States)

local Hydrate = Fusion.Hydrate
local Computed = Fusion.Computed
local Child = FusionUtils.Child
local Children = Fusion.Children
local ForValues = Fusion.ForValues

local Components = NeoHotbar.UI.Components

local ActionButton = require(Components.ActionButton)

return function()
	return Hydrate(States.InstanceSet:get().ContextMenu:Clone())({
		Visible = Computed(function()
			local ContextMenuValue = States.ContextMenu:get()
			return (ContextMenuValue and true) or false
		end),

		[Child("Actions")] = {
			[Children] = {
				ForValues(States.ContextMenuActions, function(Action)
					return ActionButton({
						Action = Action,
					})
				end, Fusion.cleanup),
			},
		},
	})
end