local definition = ...
local types = {
    "blue", "green", "red", "yellow"
}

for _, color in pairs(types) do
    if minetest.settings:get_bool("vehicle_mash.enable_hover_" .. color) then
        local def = table.copy(definition)
        local name = "hover_"..color
        local capitalization = color:gsub("^%l", string.upper)
        local style = capitalization:gsub("_", " ")

        def.description = vehicle_mash.S("@1 Hovercraft", style)
        def.inventory_image = "hovercraft_" .. color .. "_inv.png"
        def.wield_image = "hovercraft_" .. color .. "_inv.png"
        def.textures = { "hovercraft_" .. color .. ".png" }
        def.drop_on_destroy = { "wool:" .. color, "wool:black 2", "default:steelblock" }

        vehicle_mash.register_vehicle("vehicle_mash:"..name, def)
    end
end
