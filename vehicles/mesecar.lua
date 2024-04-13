local definition = ...
local types = {
    "blue", "pink", "purple", "yellow"
}

for _,color in pairs(types) do
    if minetest.settings:get_bool("vehicle_mash.enable_mesecar_" .. color .. "_car") then
        local def = table.copy(definition)
        local name = "mesecar_"..color
        local capitalization = color:gsub("^%l", string.upper)
        local style = capitalization:gsub("_", " ")

        def.description = vehicle_mash.S("@1 Mesecar", style)
        def.inventory_image = "mesecar_" .. type .. "_front"
        def.wield_image = "mesecar_" .. type .. "_front"

        vehicle_mash.register_vehicle("vehicle_mash:"..name, def)
    end
end
