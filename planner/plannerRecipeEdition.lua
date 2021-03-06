-------------------------------------------------------------------------------
-- Classe to build recipe edition dialog
--
-- @module PlannerRecipeEdition
-- @extends #PlannerDialog
--

PlannerRecipeEdition = setclass("HMPlannerRecipeEdition", PlannerDialog)

-------------------------------------------------------------------------------
-- On initialization
--
-- @function [parent=#PlannerRecipeEdition] on_init
--
-- @param #PlannerController parent parent controller
--
function PlannerRecipeEdition.methods:on_init(parent)
	self.panelCaption = ({"helmod_recipe-edition-panel.title"})
	self.sectionStyle = "helmod_recipe-section-frame"
	self.cellStyle = "helmod_recipe-cell-frame"
	self.player = self.parent.parent
	self.model = self.parent.model
end

-------------------------------------------------------------------------------
-- Get the parent panel
--
-- @function [parent=#PlannerRecipeEdition] getParentPanel
--
-- @param #LuaPlayer player
--
-- @return #LuaGuiElement
--
function PlannerRecipeEdition.methods:getParentPanel(player)
	return self.parent:getDialogPanel(player)
end

-------------------------------------------------------------------------------
-- On open
--
-- @function [parent=#PlannerRecipeEdition] on_open
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
-- @return #boolean if true the next call close dialog
--
function PlannerRecipeEdition.methods:on_open(player, element, action, item, item2, item3)
	local model = self.model:getModel(player)
	local close = true
	if model.guiRecipeLast == nil or model.guiRecipeLast ~= item..item2 then
		close = false
		model.factoryGroupSelected = nil
		model.beaconGroupSelected = nil
	end
	model.guiRecipeLast = item..item2
	return close
end

-------------------------------------------------------------------------------
-- On close dialog
--
-- @function [parent=#PlannerRecipeEdition] on_close
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:on_close(player, element, action, item, item2, item3)
	local model = self.model:getModel(player)
	model.guiRecipeLast = nil
end

-------------------------------------------------------------------------------
-- Get or create recipe panel
--
-- @function [parent=#PlannerRecipeEdition] getRecipePanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getRecipePanel(player)
	local panel = self:getPanel(player)
	if panel["recipe"] ~= nil and panel["recipe"].valid then
		return panel["recipe"]
	end
	return self:addGuiFrameH(panel, "recipe", self.sectionStyle, ({"helmod_common.recipe"}))
end

-------------------------------------------------------------------------------
-- Get or create recipe info panel
--
-- @function [parent=#PlannerRecipeEdition] getRecipeInfoPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getRecipeInfoPanel(player)
	local panel = self:getRecipePanel(player)
	if panel["info"] ~= nil and panel["info"].valid then
		return panel["info"]
	end
	return self:addGuiFrameH(panel, "info", self.cellStyle)
end

-------------------------------------------------------------------------------
-- Get or create ingredients recipe panel
--
-- @function [parent=#PlannerRecipeEdition] getRecipeIngredientsPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getRecipeIngredientsPanel(player)
	local panel = self:getRecipePanel(player)
	if panel["ingredients"] ~= nil and panel["ingredients"].valid then
		return panel["ingredients"]
	end
	return self:addGuiFrameV(panel, "ingredients", self.cellStyle, ({"helmod_common.ingredients"}))
end

-------------------------------------------------------------------------------
-- Get or create products recipe panel
--
-- @function [parent=#PlannerRecipeEdition] getRecipeProductsPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getRecipeProductsPanel(player)
	local panel = self:getRecipePanel(player)
	if panel["products"] ~= nil and panel["products"].valid then
		return panel["products"]
	end
	return self:addGuiFrameV(panel, "products", self.cellStyle, ({"helmod_common.products"}))
end

-------------------------------------------------------------------------------
-- Get or create factory panel
--
-- @function [parent=#PlannerRecipeEdition] getFactoryPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getFactoryPanel(player)
	local panel = self:getPanel(player)
	if panel["factory"] ~= nil and panel["factory"].valid then
		return panel["factory"]
	end
	return self:addGuiFrameH(panel, "factory", self.sectionStyle, ({"helmod_common.factory"}))
end

-------------------------------------------------------------------------------
-- Get or create factory selector panel
--
-- @function [parent=#PlannerRecipeEdition] getFactorySelectorPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getFactorySelectorPanel(player)
	local panel = self:getFactoryPanel(player)
	if panel["selector"] ~= nil and panel["selector"].valid then
		return panel["selector"]
	end
	return self:addGuiFrameV(panel, "selector", self.cellStyle)
end

-------------------------------------------------------------------------------
-- Get or create factory info panel
--
-- @function [parent=#PlannerRecipeEdition] getFactoryInfoPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getFactoryInfoPanel(player)
	local panel = self:getFactoryPanel(player)
	if panel["info"] ~= nil and panel["info"].valid then
		return panel["info"]
	end
	return self:addGuiFrameV(panel, "info", self.cellStyle)
end

-------------------------------------------------------------------------------
-- Get or create factory modules panel
--
-- @function [parent=#PlannerRecipeEdition] getFactoryModulesPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getFactoryModulesPanel(player)
	local panel = self:getFactoryPanel(player)
	if panel["modules"] ~= nil and panel["modules"].valid then
		return panel["modules"]
	end
	return self:addGuiFlowV(panel, "modules")
end

-------------------------------------------------------------------------------
-- Get or create beacon panel
--
-- @function [parent=#PlannerRecipeEdition] getBeaconPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getBeaconPanel(player)
	local panel = self:getPanel(player)
	if panel["beacon"] ~= nil and panel["beacon"].valid then
		return panel["beacon"]
	end
	return self:addGuiFrameH(panel, "beacon", self.sectionStyle, ({"helmod_common.beacon"}))
end

-------------------------------------------------------------------------------
-- Get or create selector panel
--
-- @function [parent=#PlannerRecipeEdition] getBeaconSelectorPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getBeaconSelectorPanel(player)
	local panel = self:getBeaconPanel(player)
	if panel["selector"] ~= nil and panel["selector"].valid then
		return panel["selector"]
	end
	return self:addGuiFrameV(panel, "selector", self.cellStyle)
end

-------------------------------------------------------------------------------
-- Get or create info panel
--
-- @function [parent=#PlannerRecipeEdition] getBeaconInfoPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getBeaconInfoPanel(player)
	local panel = self:getBeaconPanel(player)
	if panel["info"] ~= nil and panel["info"].valid then
		return panel["info"]
	end
	return self:addGuiFrameV(panel, "info", self.cellStyle)
end

-------------------------------------------------------------------------------
-- Get or create modules panel
--
-- @function [parent=#PlannerRecipeEdition] getBeaconModulesPanel
--
-- @param #LuaPlayer player
--
function PlannerRecipeEdition.methods:getBeaconModulesPanel(player)
	local panel = self:getBeaconPanel(player)
	if panel["modules"] ~= nil and panel["modules"].valid then
		return panel["modules"]
	end
	return self:addGuiFlowV(panel, "modules")
end

-------------------------------------------------------------------------------
-- After open
--
-- @function [parent=#PlannerRecipeEdition] after_open
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:after_open(player, element, action, item, item2, item3)
	self.parent:send_event(player, "HMPlannerProductEdition", "CLOSE")
	self.parent:send_event(player, "HMPlannerRecipeSelector", "CLOSE")
	self.parent:send_event(player, "HMPlannerSettings", "CLOSE")
	local model = self.model:getModel(player)
	-- recipe
	self:getRecipeInfoPanel(player)
	self:getRecipeIngredientsPanel(player)
	self:getRecipeProductsPanel(player)
	if model.blocks[item] ~= nil and model.blocks[item].recipes[item2] then
		-- factory
		self:getFactorySelectorPanel(player)
		self:getFactoryInfoPanel(player)
		self:getFactoryModulesPanel(player)
		-- beacon
		self:getBeaconSelectorPanel(player)
		self:getBeaconInfoPanel(player)
		self:getBeaconModulesPanel(player)
	end
end

-------------------------------------------------------------------------------
-- On update
--
-- @function [parent=#PlannerRecipeEdition] on_update
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:on_update(player, element, action, item, item2, item3)
	Logging:debug("PlannerRecipeEdition:on_update():",player, element, action, item, item2, item3)
	local model = self.model:getModel(player)
	-- recipe
	self:updateRecipeInfo(player, element, action, item, item2, item3)
	self:updateRecipeIngredients(player, element, action, item, item2, item3)
	self:updateRecipeProducts(player, element, action, item, item2, item3)
	if model.blocks[item] ~= nil and model.blocks[item].recipes[item2] then
		-- factory
		self:updateFactorySelector(player, element, action, item, item2, item3)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self:updateFactoryModules(player, element, action, item, item2, item3)
		-- beacon
		self:updateBeaconSelector(player, element, action, item, item2, item3)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self:updateBeaconModules(player, element, action, item, item2, item3)
	end
end

-------------------------------------------------------------------------------
-- Update information
--
-- @function [parent=#PlannerRecipeEdition] updateRecipeInfo
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateRecipeInfo(player, element, action, item, item2, item3)
	Logging:debug("PlannerRecipeEdition:updateRecipeInfo():",player, element, action, item, item2, item3)
	local infoPanel = self:getRecipeInfoPanel(player)
	local model = self.model:getModel(player)
	local default = self.model:getDefault(player)
	local recipe = self.player:getRecipe(player, item2)

	if recipe ~= nil then
		Logging:debug("PlannerRecipeEdition:updateRecipeInfo():recipe=",recipe)
		for k,guiName in pairs(infoPanel.children_names) do
			infoPanel[guiName].destroy()
		end

		local tablePanel = self:addGuiTable(infoPanel,"table-info",2)
		self:addIconButton(tablePanel, "recipe", "recipe", recipe.name)
		self:addGuiLabel(tablePanel, "label", recipe.name)

--		self:addGuiLabel(tablePanel, "label-active", "Active")
		--
		--		local actived = true
		--		if model.blocks[item].recipes[item2] ~= nil then
		--			actived = model.blocks[item].recipes[item2].active
		--		elseif default.recipes[item] ~= nil then
		--			actived = default.recipes[item].active
		--		end
		--		self:addGuiCheckbox(tablePanel, self:classname().."=recipe-active=ID="..item.."="..recipe.name, actived)
	end
end

-------------------------------------------------------------------------------
-- Update ingredients information
--
-- @function [parent=#PlannerRecipeEdition] updateRecipeIngredients
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateRecipeIngredients(player, element, action, item, item2, item3)
	local ingredientsPanel = self:getRecipeIngredientsPanel(player)
	local model = self.model:getModel(player)
	local recipe = self.player:getRecipe(player, item2)

	if recipe ~= nil then

		for k,guiName in pairs(ingredientsPanel.children_names) do
			ingredientsPanel[guiName].destroy()
		end
		local tablePanel= self:addGuiTable(ingredientsPanel, "table-ingredients", 8)
		for key, ingredient in pairs(recipe.ingredients) do
			self:addIconButton(tablePanel, "item=ID=", self.player:getItemIconType(ingredient), ingredient.name)
			self:addGuiLabel(tablePanel, ingredient.name, ingredient.amount)
		end
	end
end

-------------------------------------------------------------------------------
-- Update products information
--
-- @function [parent=#PlannerRecipeEdition] updateRecipeProducts
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateRecipeProducts(player, element, action, item, item2, item3)
	local productsPanel = self:getRecipeProductsPanel(player)
	local model = self.model:getModel(player)
	local recipe = self.player:getRecipe(player, item2)

	if recipe ~= nil then

		for k,guiName in pairs(productsPanel.children_names) do
			productsPanel[guiName].destroy()
		end
		local tablePanel= self:addGuiTable(productsPanel, "table-products", 8)
		for key, product in pairs(recipe.products) do
			self:addIconButton(tablePanel, "item=ID=", self.player:getItemIconType(product), product.name)
			self:addGuiLabel(tablePanel, product.name, product.amount)
		end
	end
end

-------------------------------------------------------------------------------
-- Update information
--
-- @function [parent=#PlannerRecipeEdition] updateFactoryInfo
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateFactoryInfo(player, element, action, item, item2, item3)
	local infoPanel = self:getFactoryInfoPanel(player)
	local model = self.model:getModel(player)
	if  model.blocks[item] ~= nil then
		local recipe = model.blocks[item].recipes[item2]
		if recipe ~= nil then
			local factory = recipe.factory

			for k,guiName in pairs(infoPanel.children_names) do
				infoPanel[guiName].destroy()
			end

			local headerPanel = self:addGuiTable(infoPanel,"table-header",2)
			self:addIconButton(headerPanel, "icon", factory.type, factory.name)
			self:addGuiLabel(headerPanel, "label", factory.name)

			local inputPanel = self:addGuiTable(infoPanel,"table-input",2)

			self:addGuiLabel(inputPanel, "label-energy-nominal", ({"helmod_label.energy-nominal"}))
			self:addGuiText(inputPanel, "energy-nominal", factory.energy_nominal, "helmod_textfield")

			self:addGuiLabel(inputPanel, "label-speed-nominal", ({"helmod_label.speed-nominal"}))
			self:addGuiText(inputPanel, "speed-nominal", factory.speed_nominal, "helmod_textfield")

			self:addGuiLabel(inputPanel, "label-module-slots", ({"helmod_label.module-slots"}))
			self:addGuiText(inputPanel, "module-slots", factory.module_slots, "helmod_textfield")

			self:addGuiLabel(inputPanel, "label-energy", ({"helmod_label.energy"}))
			self:addGuiLabel(inputPanel, "energy", factory.energy)

			self:addGuiLabel(inputPanel, "label-speed", ({"helmod_label.speed"}))
			self:addGuiLabel(inputPanel, "speed", factory.speed)

			self:addGuiButton(infoPanel, self:classname().."=factory-update=ID="..item.."=", recipe.name, "helmod_button-default", ({"helmod_button.update"}))
		end
	end
end

-------------------------------------------------------------------------------
-- Update module information
--
-- @function [parent=#PlannerRecipeEdition] updateFactoryModules
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateFactoryModules(player, element, action, item, item2, item3)
	local modulesPanel = self:getFactoryModulesPanel(player)
	local model = self.model:getModel(player)

	local recipe = model.blocks[item].recipes[item2]
	local factory = recipe.factory

	for k,guiName in pairs(modulesPanel.children_names) do
		modulesPanel[guiName].destroy()
	end

	local currentModulesPanel = self:addGuiFrameV(modulesPanel, "current-modules", self.cellStyle, ({"helmod_recipe-edition-panel.current-modules"}))
	local currentTableModulesPanel = self:addGuiTable(currentModulesPanel,"modules",4,"helmod_recipe-modules")
	for module, count in pairs(factory.modules) do
		for i = 1, count, 1 do
			self:addSpriteIconButton(currentTableModulesPanel, self:classname().."=factory-module-remove=ID="..item.."="..recipe.name.."="..module.."="..i, "item", module)
		end
	end

	local selectionModulesPanel = self:addGuiFrameV(modulesPanel, "selection-modules", self.cellStyle, ({"helmod_recipe-edition-panel.selection-modules"}))
	local tableModulesPanel = self:addGuiTable(selectionModulesPanel,"modules",3)
	for k, module in pairs(self.player:getModules()) do
		self:addSpriteIconButton(tableModulesPanel, self:classname().."=factory-module-add=ID="..item.."="..recipe.name.."=", "item", module.name)
	end
end

-------------------------------------------------------------------------------
-- Update factory group
--
-- @function [parent=#PlannerRecipeEdition] updateFactorySelector
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateFactorySelector(player, element, action, item, item2, item3)
	Logging:debug("PlannerFactorySelector:updateFactorySelector():",player, element, action, item, item2, item3)
	local globalSettings = self.player:getGlobal(player, "settings")
	
	local selectorPanel = self:getFactorySelectorPanel(player)
	local model = self.model:getModel(player)

	local recipe = model.blocks[item].recipes[item2]

	if selectorPanel["factory-groups"] ~= nil and selectorPanel["factory-groups"].valid then
		selectorPanel["factory-groups"].destroy()
	end

	-- ajouter de la table des groupes de recipe
	local groupsPanel = self:addGuiTable(selectorPanel, "factory-groups", 2)
	Logging:debug("PlannerFactorySelector:updateFactorySelector(): group category=",recipe.category)
	
	local category = recipe.category
	if globalSettings.model_filter_factory ~= nil and globalSettings.model_filter_factory == false then category = nil end

	for group, name in pairs(self.player:getProductionGroups(category)) do
		-- set le groupe
		if model.factoryGroupSelected == nil then model.factoryGroupSelected = group end
		-- ajoute les icons de groupe
		local action = self:addItemButton(groupsPanel, self:classname().."=factory-group=ID="..item.."="..recipe.name.."=", group)
	end

	if selectorPanel["factory-table"] ~= nil and selectorPanel["factory-table"].valid then
		selectorPanel["factory-table"].destroy()
	end

	local tablePanel = self:addGuiTable(selectorPanel, "factory-table", 10)
	Logging:debug("factories:",self.player:getProductions())
	for key, factory in pairs(self.player:getProductions()) do
		if factory.type == model.factoryGroupSelected then
			self:addSpriteIconButton(tablePanel, self:classname().."=factory-select=ID="..item.."="..recipe.name.."=", "item", factory.name, true)
		end
	end
end

-------------------------------------------------------------------------------
-- Update information
--
-- @function [parent=#PlannerRecipeEdition] updateBeaconInfo
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateBeaconInfo(player, element, action, item, item2, item3)
	local infoPanel = self:getBeaconInfoPanel(player)
	local model = self.model:getModel(player)
	local recipe = model.blocks[item].recipes[item2]
	if recipe ~= nil then
		local beacon = recipe.beacon

		for k,guiName in pairs(infoPanel.children_names) do
			infoPanel[guiName].destroy()
		end

		local headerPanel = self:addGuiTable(infoPanel,"table-header",2)
		self:addIconButton(headerPanel, "icon", beacon.type, beacon.name)
		self:addGuiLabel(headerPanel, "label", beacon.name)

		local inputPanel = self:addGuiTable(infoPanel,"table-input",2)

		self:addGuiLabel(inputPanel, "label-energy-nominal", "Nominal energy")
		self:addGuiText(inputPanel, "energy-nominal", beacon.energy_nominal, "helmod_textfield")

		self:addGuiLabel(inputPanel, "label-combo", "Combo")
		self:addGuiText(inputPanel, "combo", beacon.combo, "helmod_textfield")

		self:addGuiLabel(inputPanel, "label-factory", "Factory")
		self:addGuiText(inputPanel, "factory", beacon.factory, "helmod_textfield")

		self:addGuiLabel(inputPanel, "label-efficiency", "Efficiency")
		self:addGuiText(inputPanel, "efficiency", beacon.efficiency, "helmod_textfield")

		self:addGuiLabel(inputPanel, "label-module-slots", "Module Slots")
		self:addGuiText(inputPanel, "module-slots", beacon.module_slots, "helmod_textfield")

		self:addGuiButton(infoPanel, self:classname().."=beacon-update=ID="..item.."=", recipe.name, "helmod_button-default", "Update")
	end
end

-------------------------------------------------------------------------------
-- Update module information
--
-- @function [parent=#PlannerRecipeEdition] updateBeaconModules
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateBeaconModules(player, element, action, item, item2, item3)
	local modulesPanel = self:getBeaconModulesPanel(player)
	local model = self.model:getModel(player)

	local recipe = model.blocks[item].recipes[item2]
	local beacon = recipe.beacon

	for k,guiName in pairs(modulesPanel.children_names) do
		modulesPanel[guiName].destroy()
	end

	local currentModulesPanel = self:addGuiFrameV(modulesPanel, "current-modules", self.cellStyle, ({"helmod_recipe-edition-panel.current-modules"}))
	local currentTableModulesPanel = self:addGuiTable(currentModulesPanel,"modules",4, "helmod_recipe-modules")
	for module, count in pairs(beacon.modules) do
		for i = 1, count, 1 do
			self:addSpriteIconButton(currentTableModulesPanel, self:classname().."=beacon-module-remove=ID="..item.."="..recipe.name.."="..module.."="..i, "item", module)
		end
	end

	local selectionModulesPanel = self:addGuiFrameV(modulesPanel, "selection-modules", self.cellStyle, ({"helmod_recipe-edition-panel.selection-modules"}))
	local tableModulesPanel = self:addGuiTable(selectionModulesPanel,"modules",3)
	for k, module in pairs(self.player:getModules()) do
		self:addSpriteIconButton(tableModulesPanel, self:classname().."=beacon-module-add=ID="..item.."="..recipe.name.."=", "item", module.name)
	end
end

-------------------------------------------------------------------------------
-- Update factory group
--
-- @function [parent=#PlannerRecipeEdition] updateBeaconSelector
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:updateBeaconSelector(player, element, action, item, item2, item3)
	local globalSettings = self.player:getGlobal(player, "settings")
	local selectorPanel = self:getBeaconSelectorPanel(player)
	local model = self.model:getModel(player)

	local recipe = model.blocks[item].recipes[item2]

	if selectorPanel["beacon-groups"] ~= nil and selectorPanel["beacon-groups"].valid then
		selectorPanel["beacon-groups"].destroy()
	end

	-- ajouter de la table des groupes de recipe
	local groupsPanel = self:addGuiTable(selectorPanel, "beacon-groups", 2)
	local category = "module"
	if globalSettings.model_filter_beacon ~= nil and globalSettings.model_filter_beacon == false then category = nil end
	for group, name in pairs(self.player:getProductionGroups(category)) do
		-- set le groupe
		if model.beaconGroupSelected == nil then model.beaconGroupSelected = group end
		-- ajoute les icons de groupe
		local action = self:addItemButton(groupsPanel, self:classname().."=beacon-group=ID="..item.."="..recipe.name.."=", group)
	end

	if selectorPanel["beacon-table"] ~= nil and selectorPanel["beacon-table"].valid then
		selectorPanel["beacon-table"].destroy()
	end

	local tablePanel = self:addGuiTable(selectorPanel, "beacon-table", 10)
	--Logging:debug("factories:",self.player:getProductions())
	for key, beacon in pairs(self.player:getProductions()) do
		if beacon.type == model.beaconGroupSelected then
			self:addSpriteIconButton(tablePanel, self:classname().."=beacon-select=ID="..item.."="..recipe.name.."=", "item", beacon.name, true)
		end
	end
end

-------------------------------------------------------------------------------
-- On event
--
-- @function [parent=#PlannerRecipeEdition] on_event
--
-- @param #LuaPlayer player
-- @param #LuaGuiElement element button
-- @param #string action action name
-- @param #string item first item name
-- @param #string item2 second item name
-- @param #string item3 third item name
--
function PlannerRecipeEdition.methods:on_event(player, element, action, item, item2, item3)
	Logging:debug("PlannerRecipeEdition:on_event():",player, element, action, item, item2, item3)
	local model = self.model:getModel(player)
--	if action == "recipe-active" then
--		self.model:setActiveRecipe(player, item, item2)
--		self.model:update(player)
--		self.parent:refreshDisplayData(player, nil, item, item2)
--		self:close(player)
--	end

	if action == "factory-group" then
		model.factoryGroupSelected = item3
		self:updateFactorySelector(player, element, action, item, item2, item3)
	end

	if action == "factory-select" then
		--element.state = true
		-- item=recipe item2=factory
		self.model:setFactory(player, item, item2, item3)
		self.model:update(player)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self:updateFactoryModules(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "factory-update" then
		local inputPanel = self:getFactoryInfoPanel(player)["table-input"]
		local options = {}

		if inputPanel["energy-nominal"] ~= nil then
			options["energy_nominal"] = self:getInputNumber(inputPanel["energy-nominal"])
		end

		if inputPanel["speed-nominal"] ~= nil then
			options["speed_nominal"] = self:getInputNumber(inputPanel["speed-nominal"])
		end

		if inputPanel["module-slots"] ~= nil then
			options["module_slots"] = self:getInputNumber(inputPanel["module-slots"])
		end

		self.model:updateFactory(player, item, item2, options)
		self.model:update(player)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self:updateFactoryModules(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "factory-module-add" then
		self.model:addFactoryModule(player, item, item2, item3)
		self.model:update(player)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self:updateFactoryModules(player, element, action, item, item2, item3)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "factory-module-remove" then
		self.model:removeFactoryModule(player, item, item2, item3)
		self.model:update(player)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self:updateFactoryModules(player, element, action, item, item2, item3)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "beacon-group" then
		model.beaconGroupSelected = item3
		self:updateBeaconSelector(player, element, action, item, item2, item3)
	end

	if action == "beacon-select" then
		self.model:setBeacon(player, item, item2, item3)
		self.model:update(player)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self:updateBeaconModules(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "beacon-update" then
		local inputPanel = self:getBeaconInfoPanel(player)["table-input"]
		local options = {}

		if inputPanel["energy-nominal"] ~= nil then
			options["energy_nominal"] = self:getInputNumber(inputPanel["energy-nominal"])
		end

		if inputPanel["combo"] ~= nil then
			options["combo"] = self:getInputNumber(inputPanel["combo"])
		end

		if inputPanel["factory"] ~= nil then
			options["factory"] = self:getInputNumber(inputPanel["factory"])
		end

		if inputPanel["efficiency"] ~= nil then
			options["efficiency"] = self:getInputNumber(inputPanel["efficiency"])
		end

		if inputPanel["module-slots"] ~= nil then
			options["module_slots"] = self:getInputNumber(inputPanel["module-slots"])
		end

		self.model:updateBeacon(player, item, item2, options)
		self.model:update(player)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self:updateBeaconModules(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "beacon-module-add" then
		self.model:addBeaconModule(player, item, item2, item3)
		self.model:update(player)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self:updateBeaconModules(player, element, action, item, item2, item3)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end

	if action == "beacon-module-remove" then
		self.model:removeBeaconModule(player, item, item2, item3)
		self.model:update(player)
		self:updateBeaconInfo(player, element, action, item, item2, item3)
		self:updateBeaconModules(player, element, action, item, item2, item3)
		self:updateFactoryInfo(player, element, action, item, item2, item3)
		self.parent:refreshDisplayData(player, nil, item, item2)
	end
end
