vehicle_mash = {
	S = minetest.get_translator(minetest.get_current_modname())
}

-- Fix `player_api` eye height model if desired
if minetest.settings:get_bool("vehicle_mash.player_api_fix") == true or minetest.settings:get_bool("vehicle_mash.player_api_fix") == nil
	and player_api.registered_models["character.b3d"] then

	player_api.registered_models["character.b3d"].animations.sit.eye_height = 1.47
end

-- get modpath
local mpath = minetest.get_modpath("vehicle_mash")
local craft_check = minetest.settings:get_bool("vehicle_mash.enable_crafts")

-- Do not change value at settingtypes.txt
-- Only change value at minetest.conf and Minetest Settings tab
local api_check = minetest.settings:get_bool("vehicle_mash.api_mode")

-- Set to default (false) if nil, because all options are normally
-- nil. This will also help with the boolean checks below.
if api_check == nil then
	minetest.settings:set_bool("vehicle_mash.api_mode", false)
end

if api_check then -- Now we can safely check if this option is enabled
	-- load framework
	dofile(mpath .. "/framework.lua")

	-- load crafts
	if craft_check or craft_check == nil then
		dofile(mpath .. "/crafts.lua")
	end
else
	-- load framework
	dofile(mpath .. "/framework.lua")

	-- load crafts
	if craft_check or craft_check == nil then
		dofile(mpath .. "/crafts.lua")
	end

	-- ***********************
	-- load vehicles down here
	-- ***********************

	-- ** CAR01s **
	------------------------------------------------------------------------------
	-- create CAR01 common def
	local car01_def = {
		-- adjust to change how vehicle reacts while driving
		terrain_type = 1,	-- 0 = air, 1 = land, 2 = liquid, 3 = land + liquid
		max_speed_forward = 10,
		max_speed_reverse = 7,
		accel = 2,
		braking = 4,
		turn_speed = 2,
		stepheight = 1.1,
		-- model specific stuff
		visual = "mesh",
		mesh = "car.x",
		visual_size = {x=1, y=1},
		wield_scale = vector.new(1,1,1),
		collisionbox = {-0.6, -0.05, -0.6, 0.6, 1, 0.6},
		onplace_position_adj = -0.45,
		-- player specific stuff
		player_rotation = vector.new(0,90,0),
		driver_attach_at = vector.new(3.5,3.7,3.5),
		driver_eye_offset = vector.new(-4,0,0),
		number_of_passengers = 3,

		passengers = {
			{
				attach_at = vector.new(3.5,3.7,-3.5),
				eye_offset = vector.new(4,0,0),
			},
			{
				attach_at = vector.new(-4,3.7,3.5),
				eye_offset = vector.new(-4,3,0),
			},
			{
				attach_at = vector.new(-4,3.7,-3.5),
				eye_offset = vector.new(4,3,0),
			},
		},

		-- HP/Armor stuff. Uncomment to enable.
		-- min_hp = 10,
		-- max_hp = 35,
		-- armor = 25,

		-- drop and recipe
		drop_on_destroy = {"vehicle_mash:tire 2", "vehicle_mash:windshield",
			"vehicle_mash:battery", "vehicle_mash:motor"},
		recipe = nil
	}

	-- Load CAR01.
	loadfile(mpath .. "/vehicles/car01.lua")(table.copy(car01_def))

	-- ** MeseCars **
	------------------------------------------------------------------------------
	-- create Mesecar common def
	local mesecar_def = {
		-- adjust to change how vehicle reacts while driving
		terrain_type = 1,
		max_speed_forward = 10,
		max_speed_reverse = 7,
		accel = 3,
		braking = 6,
		turn_speed = 4,
		stepheight = 0.6,
		-- model specific stuff
		visual = "cube",
		mesh = "",
		visual_size = {x=1.5, y=1.5},
		wield_scale = vector.new(1,1,1),
		collisionbox = {-0.75, -0.75, -0.75, 0.75, 0.75, 0.75},
		onplace_position_adj = 0.25,
		-- player specific stuff
		player_rotation = vector.new(0,0,0),
		driver_attach_at = vector.new(0,0,-2.0),
		driver_eye_offset = vector.new(0,0,0),
		number_of_passengers = 0,

		passengers = {
			{
				attach_at = vector.new(0,0,0),
				eye_offset = vector.new(0,0,0),
			},
		},

		-- HP/Armor stuff. Uncomment to enable.
		-- min_hp = 10,
		-- max_hp = 35,
		-- armor = 25,

		-- drop and recipe
		drop_on_destroy = {"vehicle_mash:motor", "vehicle_mash:battery"},
		recipe = nil
	}

	-- Load Mesecar.
	loadfile(mpath .. "/vehicles/mesecar.lua")(table.copy(mesecar_def))

	-- ** Boats **
	------------------------------------------------------------------------------
	-- create boats common def
	local boat_def = {
		-- adjust to change how vehicle reacts while driving
		terrain_type = 2,
		max_speed_forward = 3,
		max_speed_reverse = 3,
		accel = 3,
		braking = 3,
		turn_speed = 3,
		stepheight = 0,
		-- model specific stuff
		visual = "mesh",
		visual_size = {x=1, y=1},
		wield_scale = vector.new(1,1,1),
		collisionbox = {-0.5, -0.35, -0.5, 0.5, 0.3, 0.5},
		onplace_position_adj = 0,
		textures = {"default_wood.png"},
		-- player specific stuff
		player_rotation = vector.new(0,0,0),
		driver_attach_at = vector.new(0.5,1,-3),
		driver_eye_offset = vector.new(0,0,0),
		number_of_passengers = 0,
		passengers = {
			{
				attach_at = vector.new(0,0,0),
				eye_offset = vector.new(0,0,0),
			},
		},

		-- HP/Armor stuff. Uncomment to enable.
		-- min_hp = 10,
		-- max_hp = 35,
		-- armor = 25,
	}

	-- Load boats.
	loadfile(mpath .. "/vehicles/boats.lua")(table.copy(boat_def))

	-- ** Hovercraft **
	------------------------------------------------------------------------------
	-- create hovercraft common def
	local hover_def = {
		-- adjust to change how vehicle reacts while driving
		terrain_type = 3,
		max_speed_forward = 10,
		max_speed_reverse = 0,
		accel = 3,
		braking = 1,
		turn_speed = 2,
		stepheight = 1.1,
		-- model specific stuff
		visual = "mesh",
		mesh = "hovercraft.x",
		visual_size = {x=1, y=1},
		wield_scale = vector.new(1,1,1),
		collisionbox = {-0.8, -0.25, -0.8, 0.8, 1.2, 0.8},
		onplace_position_adj = -0.25,
		-- player specific stuff
		player_rotation = vector.new(0,90,0),
		driver_attach_at = vector.new(-2,6.3,0),
		driver_eye_offset = vector.new(0,0,0),
		number_of_passengers = 0,

		passengers = {
			{
				attach_at = vector.new(0,0,0),
				eye_offset = vector.new(0,0,0),
			},
		},

		-- HP/Armor stuff. Uncomment to enable.
		-- min_hp = 10,
		-- max_hp = 35,
		-- armor = 25,

		-- recipe
		recipe = nil
	}

	-- Load Hovercraft.
	loadfile(mpath .. "/vehicles/hovercraft.lua")(table.copy(hover_def))
end
