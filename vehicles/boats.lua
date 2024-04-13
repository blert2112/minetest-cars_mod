local name = "rowboat"
local definition = ...
local craft_check = minetest.settings:get_bool("vehicle_mash.enable_crafts")

local def = table.copy(definition)
def.description = vehicle_mash.S("Rowboat")
def.inventory_image = "rowboat_inventory.png"
def.wield_image = "rowboat_wield.png"
def.mesh = "rowboat.x"
def.drop_on_destroy = {"default:wood 4"}

if craft_check or craft_check == nil then
	def.recipe = {
		{"",			"",				""},
		{"group:wood",	"",				"group:wood"},
		{"group:wood",	"group:wood",	"group:wood"}
	}
end

if minetest.settings:get_bool("vehicle_mash.enable_" .. name) then
	vehicle_mash.register_vehicle("vehicle_mash:"..name, def)
end

name = "boat"
definition = ...

def = table.copy(definition)
def.description = vehicle_mash.S("BoatA")
def.inventory_image = "boat_inventory.png"
def.wield_image = "boat_wield.png"
def.mesh = "boats_boat.obj"
def.drop_on_destroy = {"default:wood 3"}

if craft_check or craft_check == nil then
	def.recipe = {
		{"",			"",				""},
		{"",			"",				"group:wood"},
		{"group:wood",	"group:wood",	"group:wood"}
	}
end

if minetest.settings:get_bool("vehicle_mash.enable_" .. name) then
	vehicle_mash.register_vehicle("vehicle_mash:"..name, def)
end
