ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

adminRanks = { 
				'superadmin',
				'admin',
				'moderator',
            }

function havePermission(xPlayer, exclude)	
	if exclude and type(exclude) ~= 'table' then exclude = nil; end	

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end

RegisterNetEvent('raider:getperm')
AddEventHandler('raider:getperm', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if havePermission(xPlayer) then
    TriggerClientEvent('mythic_notify:client:SendAlert',source, { type = 'success', text = 'Giriş Onaylandı ( '..xPlayer.getGroup()..' )', length = 5000})  
    else
    TriggerClientEvent("yürülan", source)
    end
end)



RegisterServerEvent('menu:1')
AddEventHandler('menu:1', function()
	TriggerClientEvent('menuacil', -1)
end)
