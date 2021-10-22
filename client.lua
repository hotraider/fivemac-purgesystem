ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

 
RegisterCommand("arinma", function(source, args)
  TriggerServerEvent('menu:1', source)
  SetDisplay(false)
end)

RegisterNetEvent("yürülan")
AddEventHandler("yürülan", function (source)
TriggerServerEvent("raider:getperm", source)
  SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

function notify(type, text, time)
  if length == nil then length = 5000 end 
  TriggerEvent('mythic_notify:client:SendAlert', { type = type, text = text, length = length})
end

  RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
  end)

RegisterNetEvent('menuacil')
AddEventHandler('menuacil', function()
  
  TriggerServerEvent("raider:getperm", source)
  SetDisplay(true)
end)