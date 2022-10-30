local QRCore = exports['qr-core']:GetCoreObject()
local fasttravel

-- prompts
Citizen.CreateThread(function()
    for fasttravel, v in pairs(Config.FastTravelLocations) do
        exports['qr-core']:createPrompt(v.location, v.coords, QRCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'rsg-fasttravel:client:menu',
            args = {},
        })
        if v.showblip == true then
            local FastTravelBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(FastTravelBlip, Config.Blip.blipSprite, 1)
            SetBlipScale(FastTravelBlip, Config.Blip.blipScale)
			Citizen.InvokeNative(0x9CB1A1623062F402, FastTravelBlip, Config.Blip.blipName)
        end
    end
end)

-- menu
RegisterNetEvent('rsg-fasttravel:client:menu', function()

    exports['qr-menu']:openMenu({
        {
            header = 'Fast Travel',
            icon = 'fas fa-globe-americas',
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = 'FastTravel to Annesburg',
            txt = 'Ticket Price $ '..Config.AnnesburgPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(2945.21,1272.35,44.0 -1),
					price = Config.AnnesburgPrice
                }
            }
        },
        {
            header = 'FastTravel to Armadillo',
            txt = 'Ticket Price $ '..Config.ArmadilloPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(-3729.09,-2603.55,-12.94 -1),
					price = Config.ArmadilloPrice
                }
            }
        },
        {
            header = 'FastTravel to Blackwater',
            txt = 'Ticket Price $ '..Config.BlackwaterPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(-830.92,-1343.15,43.67 -1),
					price = Config.BlackwaterPrice
                }
            }
        },
        {
            header = 'FastTravel to Rhodes',
            txt = 'Ticket Price $ '..Config.RhodesPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(1218.83,-1298.03,76.0 -1),
					price = Config.RhodesPrice
                }
            }
        },
        {
            header = 'FastTravel to Strawberry',
            txt = 'Ticket Price $ '..Config.StrawberryPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(-1827.5,-437.65,159.78 -1),
					price = Config.StrawberryPrice
                }
            }
        },
        {
            header = 'FastTravel to Saint Denis',
            txt = 'Ticket Price $ '..Config.StDenisPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(2688.77,-1459.11,46.0 -1),
					price = Config.StDenisPrice
                }
            }
        },
        {
            header = 'FastTravel to Tumbleweed',
            txt = 'Ticket Price $ '..Config.TumbleweedPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(-5501.2,-2954.32,-1.73 -1),
					price = Config.TumbleweedPrice
                }
            }
        },
        {
            header = 'FastTravel to Valentine',
            txt = 'Ticket Price $ '..Config.ValentinePrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(-170.64,628.58,113.00 -1),
					price = Config.ValentinePrice
                }
            }
        },
        {
            header = 'FastTravel to Van Horn',
            txt = 'Ticket Price $ '..Config.VanHornPrice,
            icon = 'fas fa-map-marked-alt',
            params = {
				isServer = true,
                event = 'rsg-fasttravel:server:buyTicket',
                args = {
					destination = vector3(2891.5263, 619.09191, 57.721347 -1),
					price = Config.VanHornPrice
                }
            }
        },
        {
            header = "❌ | Close Menu",
            txt = '',
            params = {
                event = 'qr-menu:closeMenu',
            }
        },
    })
	
end)

-- do fast travel
RegisterNetEvent('rsg-fasttravel:client:doTravel')
AddEventHandler('rsg-fasttravel:client:doTravel', function(travel)
	PlaySoundFrontend("Gain_Point", "HUD_MP_PITP", true, 1)	
	local travelto = travel
	local ped = PlayerPedId()
	Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'FastTravel', '', '')
	Wait(Config.TravelTime)
	Citizen.InvokeNative(0x203BEFFDBE12E96A, PlayerPedId(), travelto)
	Citizen.InvokeNative(0x74E2261D2A66849A, 0)
	Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
	Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
	ShutdownLoadingScreen()
	DoScreenFadeIn(1000)
	Wait(1000)
	SetCinematicModeActive(false)
end)