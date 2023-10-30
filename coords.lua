local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = ESX.Math.Round(coords.x, 2)
            c.y = ESX.Math.Round(coords.y, 2)
            c.z = ESX.Math.Round(coords.z, 2)
            heading = ESX.Math.Round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~'.._U("info.ped_coords") .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end



RegisterNetEvent('ToggleCoords', function()
    ToggleShowCoordinates()
end)