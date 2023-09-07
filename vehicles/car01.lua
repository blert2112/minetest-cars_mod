local definition = ...
local types = {
	"black", "blue", "brown", "cyan",
	"dark_green", "dark_grey", "green",
	"grey", "magenta", "orange",
	"pink", "red", "violet",
	"white", "yellow", "hot_rod",
	"nyan_ride", "oerkki_bliss", "road_master"
}

for _, color in ipairs(types) do
    if minetest.settings:get_bool("vehicle_mash.enable_" .. color .. "_car") == false then return end

    local name = "car_"..color
    local capitalization = color:gsub("^%l", string.upper)
    local style = capitalization:gsub("_", " ")

    definition.description = vehicle_mash.S("@1 Car", style)

    -- These types of car do not have an inventory image.
    if color == "road_master" then
        definition.inventory_image = "inv_car_brown.png"
        definition.wield_image = "inv_car_brown.png"
    elseif color == "nyan_ride" then
        definition.inventory_image = "inv_car_pink.png"
        definition.wield_image = "inv_car_pink.png"
    elseif color == "oerkki_bliss" then
        definition.inventory_image = "inv_car_black.png"
        definition.wield_image = "inv_car_black.png"
    elseif color == "hot_rod" then
        definition.inventory_image = "inv_car_red.png"
        definition.wield_image = "inv_car_red.png"
    else
        definition.inventory_image = "inv_car_" .. color .. ".png"
        definition.wield_image = "inv_car_" .. color .. ".png"
    end

    if color ~= "hot_rod" or color ~= "nyan_ride" or color ~= "oerkki_bliss"
        or color ~= "road_master" then
        definition.textures = {"car_"..color..".png"}
    else
        definition.textures = {color..".png"}
    end
    vehicle_mash.register_vehicle("vehicle_mash:" .. name, definition)
end
