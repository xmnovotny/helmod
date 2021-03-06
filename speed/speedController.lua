SpeedController = setclass("HMSpeedController")

function SpeedController.methods:init(parent)
	self.parent = parent

	self.names = {}
	self.names.command = "helmod_speed-menu-command"
	self.names.speedDown = "helmod_speed-menu-down"
	self.names.speed = "helmod_speed-menu"
	self.names.speedUp = "helmod_speed-menu-up"

	self.default = {}
	self.default.speed = {}
	self.default.speed.max = 32
	self.default.speed.min = 1

end

function SpeedController.methods:cleanController(player)
end

function SpeedController.methods:bindController(player)
	Logging:trace("SpeedController:bindController(player)")
	local parentGui = self.parent:getGui(player)
	if parentGui ~= nil then
		local gui = parentGui.add({type="flow", name=self.names.command, direction="horizontal"})
		gui.add({type="button", name=self.names.speedDown, caption=({self.names.speedDown}), style="helmod_button-small-bold-start"})
		gui.add({type="button", name=self.names.speed, caption=({self.names.speed}), style="helmod_button-small-bold-middle"})
		gui.add({type="button", name=self.names.speedUp, caption=({self.names.speedUp}), style="helmod_button-small-bold-end"})
	end
end

--------------------------------------------------------------------------------------
function SpeedController.methods:on_speed(option)
	local speed = game.speed
	if option == nil then
		game.speed = 1
	elseif option == "+" then
		speed = speed * 2
		if speed <= self.default.speed.max then
			game.speed = speed
		end
	elseif option == "-" then
		speed = speed / 2
		if speed >= self.default.speed.min then
			game.speed = speed
		end
	end
	for key, player in pairs(game.players) do
		local parentGui = self.parent:getGui(player)
		if parentGui ~= nil then
			local gui = parentGui[self.names.command]
			if gui[self.names.speed] ~= nil and gui[self.names.speed].valid then
				gui[self.names.speed].caption = string.format("x%1.0f", game.speed)
			end
		end
	end
end

function SpeedController.methods:on_gui_click(event)
	if event.element.name == self.names.speedDown then
		self:on_speed("-")
	elseif event.element.name == self.names.speed then
		self:on_speed(nil)
	elseif event.element.name == self.names.speedUp then
		self:on_speed("+")
	end
end
