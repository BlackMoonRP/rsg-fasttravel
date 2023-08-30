local RSGCore = exports['rsg-core']:GetCoreObject()
local fasttravel
local options = {}

-- prompts
Citizen.CreateThread(function()
    for fasttravel, v in pairs(Config.FastTravelLocations) do
        exports['rsg-core']:createPrompt(v.location, v.coords, RSGCore.Shared.Keybinds['J'], Lang:t('menu.open_prompt') .. v.name, {
            type = 'client',
            event = 'rsg-fasttravel:client:menu',
        })
        if v.showblip == true then
            local FastTravelBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(FastTravelBlip, Config.Blip.blipSprite, 1)
            SetBlipScale(FastTravelBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, FastTravelBlip, Config.Blip.blipName)
        end
    end
end)

------------------------------------------------------------------------------------------------------

for _, v in ipairs(Config.FastTravel) do
    table.insert(options, {
        title = v.title,
        description = v.description,
        icon = 'fas fa-map-marked-alt',
        serverEvent = 'rsg-fasttravel:server:buyTicket',
        args = {
            destination = v.destination,
            cost = v.cost,
            traveltime = v.traveltime
        }
    })
end

RegisterNetEvent('rsg-fasttravel:client:menu', function()
    lib.registerContext({
        id = 'fasttravel_menu',
        title = 'FastTravel Menu',
        options = options
    })
    lib.showContext('fasttravel_menu')
end)

------------------------------------------------------------------------------------------------------

-- do fast travel
RegisterNetEvent('rsg-fasttravel:client:doTravel')
AddEventHandler('rsg-fasttravel:client:doTravel', function(travel, waittime)
    PlaySoundFrontend("Gain_Point", "HUD_MP_PITP", true, 1)    
    local travelto = travel
    local ped = PlayerPedId()
    Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, Lang:t('menu.fast_travel'), '', '')
    Wait(waittime)
    Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), travelto)
    Citizen.InvokeNative(0x74E2261D2A66849A, 0)
    Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
    Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
    ShutdownLoadingScreen()
    DoScreenFadeIn(1000)
    Wait(1000)
    SetCinematicModeActive(false)
end)
