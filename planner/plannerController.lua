require "planner/plannerModel"
require "planner/plannerDialog"
require "planner/plannerResult"
require "planner/plannerSettings"
require "planner/plannerRecipeSelector"
require "planner/plannerRecipeEdition"
require "planner/plannerProductEdition"


PLANNER_COMMAND = "helmod_planner-command"

-------------------------------------------------------------------------------
-- Classe de player
--
-- @module PlannerController
--

PlannerController = setclass("HMPlannerController", ElementGui)

-------------------------------------------------------------------------------
-- Initialization
--
-- @function [parent=#PlayerController] init
--
-- @param #PlayerController parent controller parent
--
function PlannerController.methods:init(parent)
	self.parent = parent
	self.controllers = {}
	self.modelFilename = "helmod-planner-model.data"
	self.model = PlannerModel:new(self)
end

-------------------------------------------------------------------------------
-- Cleanup
--
-- @function [parent=#PlannerController] cleanController
--
-- @param #LuaPlayer player
--
function PlannerController.methods:cleanController(player)
	Logging:trace("PlannerController:cleanController(player)")
	if player.gui.left["helmod_planner_main"] ~= nil then
		player.gui.left["helmod_planner_main"].destroy()
	end
end

-------------------------------------------------------------------------------
-- Bind all controllers
--
-- @function [parent=#PlannerController] bindController
--
-- @param #LuaPlayer player
--
function PlannerController.methods:bindController(player)
	Logging:trace("PlannerController:bindController(player)")
	local parentGui = self.parent:getGui(player)
	if parentGui ~= nil then
		parentGui.add({type="button", name=PLANNER_COMMAND, caption=({PLANNER_COMMAND}), style="helmod_button-small-bold"})
	end
end

-------------------------------------------------------------------------------
-- On click event
--
-- @function [parent=#PlannerController] on_gui_click
--
-- @param event
--
function PlannerController.methods:on_gui_click(event)
	if self.controllers ~= nil then
		for r, controller in pairs(self.controllers) do
			controller:on_gui_click(event)
		end
	end

	if event.element.valid then
		if event.element.name == PLANNER_COMMAND then
			local player = game.players[event.player_index]
			self:main(player)
		end
	end
end

-------------------------------------------------------------------------------
-- Send event dialog
--
-- @function [parent=#PlannerController] send_event
--
-- @param #LuaPlayer player
-- @param #string classname controller name
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerController.methods:send_event(player, classname, action, item, item2, item3)
	if self.controllers ~= nil then
		for r, controller in pairs(self.controllers) do
			if controller:classname() == classname then
				controller:send_event(player, nil, action, item, item2, item3)
			end
		end
	end
end

-------------------------------------------------------------------------------
-- Prepare main display
--
-- @function [parent=#PlannerController] main
--
-- @param #LuaPlayer player
--
function PlannerController.methods:main(player)
	Logging:trace("PlannerController:main(player)")
	if player.gui.left["helmod_planner_main"] ~= nil and player.gui.left["helmod_planner_main"].valid then
		player.gui.left["helmod_planner_main"].destroy()
	else
		-- main panel
		Logging:debug("Create main panel")
		local mainPanel = self:getMainPanel(player)
		-- info
		Logging:debug("Create info panel")
		local infoPanel = self:getInfoPanel(player)
		-- menu
		Logging:debug("Create settings panel")
		local settingsPanel = self:getSettingsPanel(player)
		-- data
		Logging:debug("Create data panel")
		local dataPanel = self:getDataPanel(player)
		-- dialogue
		Logging:debug("Create dialog panel")
		local dialogPanel = self:getDialogPanel(player)

		-- menu

		self.controllers["result"] = PlannerResult:new(self)
		self.controllers["result"]:buildPanel(player)

		self.controllers["settings"] = PlannerSettings:new(self)
		self.controllers["settings"]:buildPanel(player)

		self.controllers["recipe-selector"] = PlannerRecipeSelector:new(self)

		self.controllers["recipe-edition"] = PlannerRecipeEdition:new(self)

		self.controllers["product-edition"] = PlannerProductEdition:new(self)

	end
end

-------------------------------------------------------------------------------
-- Get or create main panel
--
-- @function [parent=#PlannerController] getMainPanel
--
-- @param #LuaPlayer player
--
function PlannerController.methods:getMainPanel(player)
	if player.gui.left["helmod_planner_main"] ~= nil and player.gui.left["helmod_planner_main"].valid then
		return player.gui.left["helmod_planner_main"]
	end
	return self:addGuiFlowH(player.gui.left, "helmod_planner_main")
end

-------------------------------------------------------------------------------
-- Get or create info panel
--
-- @function [parent=#PlannerController] getInfoPanel
--
-- @param #LuaPlayer player
--
function PlannerController.methods:getInfoPanel(player)
	local mainPanel = self:getMainPanel(player)
	if mainPanel["helmod_planner_info"] ~= nil and mainPanel["helmod_planner_info"].valid then
		return mainPanel["helmod_planner_info"]
	end
	return self:addGuiFlowV(mainPanel, "helmod_planner_info")
end

-------------------------------------------------------------------------------
-- Get or create dialog panel
--
-- @function [parent=#PlannerController] getDialogPanel
--
-- @param #LuaPlayer player
--
function PlannerController.methods:getDialogPanel(player)
	local mainPanel = self:getMainPanel(player)
	if mainPanel["helmod_planner_dialog"] ~= nil and mainPanel["helmod_planner_dialog"].valid then
		return mainPanel["helmod_planner_dialog"]
	end
	return self:addGuiFlowH(mainPanel, "helmod_planner_dialog")
end

-------------------------------------------------------------------------------
-- Get or create settings panel
--
-- @function [parent=#PlannerController] getSettingsPanel
--
-- @param #LuaPlayer player
--
function PlannerController.methods:getSettingsPanel(player)
	local infoPanel = self:getInfoPanel(player)
	if infoPanel["helmod_planner_settings"] ~= nil and infoPanel["helmod_planner_settings"].valid then
		return infoPanel["helmod_planner_settings"]
	end
	return self:addGuiFrameH(infoPanel, "helmod_planner_settings", "helmod_menu_frame_style")
end

-------------------------------------------------------------------------------
-- Get or create data panel
--
-- @function [parent=#PlannerController] getDataPanel
--
-- @param #LuaPlayer player
--
function PlannerController.methods:getDataPanel(player)
	local infoPanel = self:getInfoPanel(player)
	if infoPanel["helmod_planner_data"] ~= nil and infoPanel["helmod_planner_data"].valid then
		return infoPanel["helmod_planner_data"]
	end
	return self:addGuiFlowV(infoPanel, "helmod_planner_data")
end

-------------------------------------------------------------------------------
-- Refresh display data
--
-- @function [parent=#PlannerController] refreshDisplayData
--
-- @param #LuaPlayer player
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerController.methods:refreshDisplayData(player, item, item2, item3)
	Logging:debug("PlannerController:refreshDisplayData():",player, item, item2, item3)
	self.controllers["result"]:update(player, item, item2, item3)
end
