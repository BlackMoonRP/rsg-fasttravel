local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-fasttravel/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-----------------------------------------------------------------------

RegisterServerEvent('rsg-fasttravel:server:buyTicket')
AddEventHandler('rsg-fasttravel:server:buyTicket', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local destination = data.destination
    local cost = data.cost
    local traveltime = data.traveltime
    local cashBalance = Player.PlayerData.money["cash"]
    if cashBalance >= cost then
        Player.Functions.RemoveMoney("cash", cost, "purchase-fasttravel")
        TriggerClientEvent('rsg-fasttravel:client:doTravel', src, destination, traveltime)
    else 
        RSGCore.Functions.Notify(src, Lang:t('error.no_cash'), 'error')
    end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
