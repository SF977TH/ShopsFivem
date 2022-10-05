
ESX = nil
null = nil
CurrentShop = nil
CurrentType = nil
Shops = {}
Blips = {}
ShowBlip = true
 

 
OnPlayerLoad = function()
  
  Shops = Config.Shops

  Wait(1000)
  
  while 1>0 do
		Citizen.Wait(1)	 
		if NetworkIsPlayerActive(PlayerId()) then
			 TriggerServerEvent('s4-shops:server:requestShops')
          local c = Config
          c.Shops = nil
          c.DefaultShop = nil
          SendNUIMessage({ action = "config", config = c  })
			break
		end
  end
 
end


ClearBlips = function()
   for k, v in pairs(Blips) do
      RemoveBlip(v)
   end
end
 
CreateBlips = function(shop, coord)
   local blip = AddBlipForCoord(coord)
	SetBlipSprite(blip, 52)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 2) 
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(shop.shop)
	EndTextCommandSetBlipName(blip)
   table.insert(Blips, blip)
end

RegisterNetEvent('s4-shops:client:enableshops')
AddEventHandler('s4-shops:client:enableshops', function(bool) 
   ClearBlips()
   if bool == true then 
      for k,v in pairs(Shops) do
         CreateBlips(v, v.coords[1].coord)
      end
   end
   ShowBlip = bool
end)

RegisterNetEvent('s4:shops:acsess')
AddEventHandler('s4:shops:acsess', function(data, shop) 
   SetNuiFocus(1,1)
   if Config.GetFromServer == false then 
      SendNUIMessage({ action = "acsess",  data = data, shop = shop,  user = { cash = getCash(), bank =  getBank() }  })
   else 
      ESX.TriggerServerCallback('s4:shops:getuser', function(user)
         SendNUIMessage({ action = "acsess",  data = data, shop = shop,  user = user  })
      end)
   end
end)
 
RegisterNetEvent('s4-shops:client:tryAgain')
AddEventHandler('s4-shops:client:tryAgain', function() 
   TriggerServerEvent('s4-shops:server:requestShops')
end)

RegisterNetEvent('s4-shops:client:notify')
AddEventHandler('s4-shops:client:notify', function(data) 
   SendNUIMessage({ action = "notify",  data = data  })
end)

RegisterNetEvent('s4-shops:client:updateShops')
AddEventHandler('s4-shops:client:updateShops', function(ShopData) 
    for k,v in pairs(Shops) do
       for y,x in pairs(ShopData) do
          if v.id == x.id then 
             v.shop = x.shop
             v.enableShopList = x.enableShopList
             v.marker = x.marker
             v.markerY = x.markerY
             v.markerColor = x.markerColor
             v.money_earned = x.money_earned
             v.theme = x.theme
             v.items = x.items
             v.lock = x.lock
             v.sales_history = x.sales_history
             v.owner = x.owner
             v.shop_transfer_fee = x.shop_transfer_fee
             break
          end
       end
    end

    if CurrentType then 
      ESX.TriggerServerCallback('s4:shops:getLabels', function(items)
        CurrentShop.items = items
        SendNUIMessage({ action = "update", shop = CurrentShop, type = CurrentType, user = { cash = getCash(), bank =  getBank() } })
      end, CurrentShop.items)
    end
   

   ClearBlips()
   if ShowBlip == true then 
     for k,v in pairs(Shops) do
      CreateBlips(v, v.coords[1].coord)
     end
   end

end)




LoadCore = function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
 
  	ESX.PlayerData = ESX.GetPlayerData()
end
 
MainThread = function()
    Wait(2000)
    while 1>0 do
       sleepThread = 2500
       local pCoords = GetEntityCoords(PlayerPedId())

       for k,v in pairs(Shops) do
          
           for i,val in pairs(v.coords) do
                local dist = #(val.coord - pCoords)
                if dist < 3.0 then 

                    if v.enableShopList == true   then 
                        
                       if val.type == "mainshop" or val.type == "manage" then 
                        if v.marker then 
                            DrawMarker(tonumber(v.marker) or 1, val.coord.x, val.coord.y, val.coord.z+tonumber(v.markerY), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 1.0, tonumber(v.markerColor.r), tonumber(v.markerColor.g), tonumber(v.markerColor.b), 70, false, true, 2, true, false, false, false)
                         end
                         DrawText3D(val.coord.x, val.coord.y, val.coord.z + 0.2, l.key..val.label)
                         if dist < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                           if v.lock == false or val.type == "manage" then
                              initMarket(v.id, val.type)
                           else 
                              TriggerEvent("s4-shops:client:notify",  { icon = 'fad fa-key', text = 'This shop is locked.'  })
                           end
                           Wait(1000)
                         end
                        end
                    
                    else 
                    if val.type ~= "mainshop" then 
                    if v.marker then 
                       DrawMarker(tonumber(v.marker) or 1, val.coord.x, val.coord.y, val.coord.z+tonumber(v.markerY), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 1.0, tonumber(v.markerColor.r), tonumber(v.markerColor.g), tonumber(v.markerColor.b), 70, false, true, 2, true, false, false, false)
                    end
                    DrawText3D(val.coord.x, val.coord.y, val.coord.z + 0.2, l.key..val.label)
                    if dist < 1.40 and IsControlJustPressed(0, Config.OpenKey) then 
                      if v.lock == false or val.type == "manage" then  
                        initMarket(v.id, val.type)
                      else 
                        TriggerEvent("s4-shops:client:notify",  { icon = 'fad fa-key', text = 'This shop is locked.'  })
                      end
                      Wait(1000)
                    end
                    end
                    end
                    sleepThread = 1
                end
           end
       end
     
       Citizen.Wait(sleepThread)
    end
end


Citizen.CreateThread(function() 
    while 1>0 do 
      Citizen.Wait(Config.ShopUpdateInterval)
      TriggerServerEvent('s4-shops:server:requestShops')
    end
end)



initMarket = function(id,type)
   CurrentShop = GetShopFromId(id)
   CurrentType = type
   if type == "manage" then 
      TriggerServerEvent('s4:shops:manage', CurrentShop.id)
      return
   end
     SetNuiFocus(1,1)
     ESX.TriggerServerCallback('s4:shops:getLabels', function(items)
          CurrentShop.items = items
          SendNUIMessage({ action = "init", shop = CurrentShop, type = type, user = { cash = getCash(), bank =  getBank() } })
     end, CurrentShop.items)
    
end

GetShopFromId = function(id)
    for k,v in pairs(Shops) do
       if v.id == id then 
          return v
       end
    end
end

getCash = function()
    ESX.PlayerData = ESX.GetPlayerData()
    local cash = 0
    if ESX.PlayerData.inventory then 
     for k, v in pairs(ESX.PlayerData.inventory) do
       if v.name == "cash" then
         cash = cash + v.count
       end
     end
    end
    return tonumber(cash)
 end

 getBank = function()
    ESX.PlayerData = ESX.GetPlayerData()
    local cash = 0
    if ESX.PlayerData.accounts then 
     for k, v in pairs(ESX.PlayerData.accounts) do
       if v.name == "bank" then
         cash = v.money
       end
     end
    end
    return tonumber(cash)
 end

RegisterNUICallback("updateShopItem", function(data, cb)
   TriggerServerEvent('s4:shops:updateShopItem', data)
end)

RegisterNUICallback("removeShopItem", function(data, cb)
   TriggerServerEvent('s4:shops:removeShopItem', data)
end)

RegisterNUICallback("addShopItem", function(data, cb)
   TriggerServerEvent('s4:shops:addShopItem', data)
end)

RegisterNUICallback("removeShopMoney", function(data, cb)
   TriggerServerEvent('s4:shops:removeShopMoney', data)
end)

RegisterNUICallback("addShopMoney", function(data, cb)
   TriggerServerEvent('s4:shops:addShopMoney', data)
end)

RegisterNUICallback("updateShop", function(data, cb)
   TriggerServerEvent('s4:shops:updateShop', data)
end)

RegisterNUICallback("updateSignal", function(data, cb)
   TriggerServerEvent('s4:shops:updateSignal', data.id)
end)
 
RegisterNUICallback("buyShop", function(data, cb)
   TriggerServerEvent('s4:shops:buyShop', data.id)
end)
 
RegisterNUICallback("close", function(data, cb)
   SetNuiFocus(0, 0)    
end)

RegisterNUICallback("buy", function(data, cb)
   ESX.TriggerServerCallback('s4:shops:buy', function(apr)
      cb(apr)
   end, { item = GetItemFromCurrent(data.item), shop = CurrentShop   })
end)


RegisterNUICallback("sell", function(data, cb)
   ESX.TriggerServerCallback('s4:shops:sell', function(apr)
      cb(apr)
   end, { item = GetItemFromCurrent(data.item), shop = CurrentShop, pay = data.pay   })
end)


GetItemFromCurrent = function(item)
  for k,v in pairs(CurrentShop.items) do
     if v.item == item then 
        return v
     end
  end
end
 
DrawText3D = function (x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterCommand("saveshops", function()
   TriggerServerEvent("s4-shops:server:SaveShops")
end, true)




Citizen.CreateThread(OnPlayerLoad)
Citizen.CreateThread(MainThread)
Citizen.CreateThread(LoadCore)