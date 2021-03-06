helmod_defines = {}

helmod_defines.production_groups = {}
helmod_defines.production_groups["mining-drill"] = {
	name="mining-drill",
	categories = {"basic-fluid", "basic-solid"}
}
helmod_defines.production_groups["assembling-machine"] = {
	name="assembling-machine",
	categories = {"crafting", "advanced-crafting", "crafting-with-fluid", "oil-processing", "chemistry"}
}
helmod_defines.production_groups["generator"] = {
	name="generator",
	categories = {"energy"}
}
helmod_defines.production_groups["solar-panel"] = {
	name="solar-panel",
	categories = {"energy-solar"}
}
helmod_defines.production_groups["accumulator"] = {
	name="accumulator",
	categories = {"energy-accumulator"}
}
helmod_defines.production_groups["furnace"] = {
	name="furnace",
	categories = {"smelting"}
}
helmod_defines.production_groups["beacon"] = {
	name="beacon",
	categories = {"module"}
}
helmod_defines.production_groups["offshore-pump"] = {
	name="offshore-pump",
	categories = {"basic-fluid"}
}
helmod_defines.production_groups["rocket-silo"] = {
	name="rocket-silo",
	categories = {"rocket-building"}
}

-- vanilla name
helmod_defines.production_group_categories = {
	"crafting",
	"advanced-crafting",
	"crafting-with-fluid",
	"oil-processing",
	"chemistry",
	"basic-fluid",
	"basic-solid",
	"energy",
	"energy-solar",
	"energy-accumulator",
	"smelting",
	"module",
	"rocket-building"
}
-- items comme les ressources
helmod_defines.items = {}
helmod_defines.items["sulfuric-acid"]= {
	name="sulfuric-acid",
	type="sulfuric-acid"
}
helmod_defines.items["petroleum-gas"]= {
	name="petroleum-gas",
	type="fluid"
}
helmod_defines.items["water"]= {
	name="water",
	type="fluid"
}
helmod_defines.items["light-oil"]= {
	name="light-oil",
	type="fluid"
}
helmod_defines.items["heavy-oil"]= {
	name="heavy-oil",
	type="fluid"
}
helmod_defines.items["lubricant"]= {
	name="lubricant",
	type="fluid"
}
helmod_defines.items["crude-oil"]= {
	name="crude-oil",
	type="fluid"
}

-- parametre des factories
helmod_defines.beacon = {}
helmod_defines.beacon["beacon"]={
	name = "beacon",
	energy_nominal = 480,
	combo = 3,
	factory = 2,
	efficiency = 0.5,
	module_slots = 2
}


-- parametre des factories
helmod_defines.factory = {}
helmod_defines.factory["stone-furnace"]={
	name = "stone-furnace",
	energy_nominal = 0,
	speed_nominal = 1,
	module_slots = 2
}

helmod_defines.factory["steel-furnace"]={
	name = "steel-furnace",
	energy_nominal = 0,
	speed_nominal = 2,
	module_slots = 2
}

helmod_defines.factory["electric-furnace"]={
	name = "electric-furnace",
	energy_nominal = 180,
	speed_nominal = 2,
	module_slots = 2
}

helmod_defines.factory["assembling-machine-1"]={
	name = "assembling-machine-1",
	energy_nominal = 90,
	speed_nominal = 0.5,
	module_slots = 2
}

helmod_defines.factory["assembling-machine-2"]={
	name = "assembling-machine-2",
	energy_nominal = 150,
	speed_nominal = 0.75,
	module_slots = 2
}

helmod_defines.factory["assembling-machine-3"]={
	name = "assembling-machine-3",
	energy_nominal = 210,
	speed_nominal = 1.25,
	module_slots = 4
}


helmod_defines.factory["oil-refinery"]={
	name = "oil-refinery",
	energy_nominal = 420,
	speed_nominal = 1,
	module_slots = 2
}

helmod_defines.factory["chemical-plant"]={
	name = "chemical-plant",
	energy_nominal = 210,
	speed_nominal = 1.25,
	module_slots = 2
}


-- parametre des module
helmod_defines.modules = {}
helmod_defines.modules["speed-module"] = {
	speed = 0.2,
	productivity = 0,
	pollution = 0,
	consumption = 0.5
}

helmod_defines.modules["speed-module-2"] = {
	speed = 0.3,
	productivity = 0,
	pollution = 0,
	consumption = 0.6
}

helmod_defines.modules["speed-module-3"] = {
	speed = 0.5,
	productivity = 0,
	pollution = 0,
	consumption = 0.7
}

helmod_defines.modules["productivity-module"] = {
	speed = -0.15,
	productivity = 0.04,
	pollution = 0.3,
	consumption = 0.4
}

helmod_defines.modules["productivity-module-2"] = {
	speed = -0.15,
	productivity = 0.06,
	pollution = 0.4,
	consumption = 0.6
}

helmod_defines.modules["productivity-module-3"] = {
	speed = -0.15,
	productivity = 0.1,
	pollution = 0.5,
	consumption = 0.8
}

helmod_defines.modules["effectivity-module"] = {
	speed = 0,
	productivity = 0,
	pollution = 0,
	consumption = -0.3
}

helmod_defines.modules["effectivity-module-2"] = {
	speed = 0,
	productivity = 0,
	pollution = 0,
	consumption = -0.4
}

helmod_defines.modules["effectivity-module-3"] = {
	speed = 0,
	productivity = 0,
	pollution = 0,
	consumption = -0.5
}

helmod_icons = {}
helmod_icons["unknown-assembling-machine"]="__helmod__/graphics/icons/unknown-assembling-machine.png"
helmod_icons["default-assembling-machine"]="__helmod__/graphics/icons/unknown-assembling-machine.png"
