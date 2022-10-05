ESX = nil

S4 = {}
Shops = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 

initShops = function()

   for k,v in pairs(Config.Shops) do
   
       shopdata = MySQL.Sync.fetchall("SELECT * FROM s4_shops WHERE shop_id = '"..v.id.."' ")
       
       if #shopdata == 0 then 
        
        info = {
            enableShopList = false,
            shop = Config.DefaultShop.shop,
            theme = Config.DefaultShop.theme,
            marker = Config.DefaultShop.marker,
            markerY = Config.DefaultShop.markerY,
            markerColor = Config.DefaultShop.markerColor,
            lock = Config.DefaultShop.lock,
            money_earned = Config.DefaultShop.money_earned,
            owner = "",
            shop_transfer_fee = Config.DefaultShop.shop_transfer_fee,
        }
        
        sales_history = {}

        MySQL.Async.execute("INSERT INTO s4_shops (shop_id, data, items, sales_history) VALUES ('"..v.id.."', '"..json.encode(info).."', '"..json.encode(Config.DefaultShop.items).."', '"..json.encode(sales_history).."')", {  })
    
       end
      Wait(100)
   end

   LoadShops()
end



LoadShops = function() 
    shops = MySQL.Sync.fetchall("SELECT * FROM s4_shops")
    for k,v in pairs(shops) do
       
       shopsdata = json.decode(v.data)
       shopitems = json.decode(v.items)
       sales_history = json.decode(v.sales_history)
     
       shop = {
         id = v.shop_id,
         enableShopList = shopsdata.enableShopList,
         shop = shopsdata.shop,
         owner = shopsdata.owner,
         marker = shopsdata.marker,
         lock = shopsdata.lock,
         markerY = shopsdata.markerY,
         markerColor = shopsdata.markerColor,
         money_earned = shopsdata.money_earned,
         theme = shopsdata.theme,
         items = shopitems,
         sales_history = sales_history,
         shop_transfer_fee = shopsdata.shop_transfer_fee,
       }
 
       table.insert(Shops, shop)

      
    end
   
end


RegisterNetEvent('s4:shops:updateShop')
AddEventHandler('s4:shops:updateShop', function(data)
   for k,v in pairs(data) do
      S4.SetShopProp(data.id, k, v, source)
   end
end)

RegisterNetEvent('s4:shops:manage')
AddEventHandler('s4:shops:manage', function(sid, src)
    if src then 
       source = src
    end
    if ESX.GetPlayerFromId(source).identifier == GetShopFromId(sid).owner then
      TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(sid))
      TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-on', text = 'Access granted.'  })
    elseif GetShopFromId(sid).owner == ""  then
       TriggerClientEvent('s4:shops:acsess', source, "buy", GetShopFromId(sid))
       TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-on', text = 'It can be purchased.'  })
    else 
      TriggerClientEvent('s4:shops:acsess', source, false, GetShopFromId(sid)) 
      TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-on', text = 'Someone else owns the shop.'  })
    end
end)
 
RegisterNetEvent('s4-shops:server:requestShops')
AddEventHandler('s4-shops:server:requestShops', function()
   local source = source
 
   if #Shops == 0 then 
      TriggerClientEvent('s4-shops:client:tryAgain', tonumber(source))
   else 
      TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
   end
   
end)

RegisterNetEvent('s4-shops:server:SaveShops')
AddEventHandler('s4-shops:server:SaveShops', function()
   S4.UpdateShops()
end)


RegisterNetEvent('s4:shops:addShopMoney')
AddEventHandler('s4:shops:addShopMoney', function(data)
   val = tonumber(data.value)
   xPlayer = ESX.GetPlayerFromId(source)
   
   if xPlayer.getAccount(Config.PayAccount).money >= val then 
      S4.AddShopMoney(data.id,  data.type, val, source)
      xPlayer.removeAccountMoney(Config.PayAccount, val)
   end
  
end)


RegisterNetEvent('s4:shops:updateShopItem')
AddEventHandler('s4:shops:updateShopItem', function(data)
   S4.UpdateShopItem(data.id, data.item, { buy = tonumber(data.buyprice), sell = tonumber(data.sellprice) }, source)
end)

S4.UpdateShopItem = function(shop_id, item, data, source)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         for ks,val in pairs(v.items) do
            if val.item == item then 
               v.items[ks].price = data
               break
            end
         end
         break
      end
   end
   TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(shop_id))
   TriggerClientEvent('s4-shops:client:updateShops', -1, Shops)
end

RegisterNetEvent('s4:shops:removeShopItem')
AddEventHandler('s4:shops:removeShopItem', function(data)
   S4.RemoveShopItem(data.id, data.item, source)
end)

S4.RemoveShopItem = function(shop_id, item, source)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         for ks,val in pairs(v.items) do
            if val.item == item then 
               table.remove(v.items, ks)
               break
            end
         end
         break
      end
   end
   TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(shop_id))
   TriggerClientEvent('s4-shops:client:updateShops', -1, Shops)
end

RegisterNetEvent('s4:shops:addShopItem')
AddEventHandler('s4:shops:addShopItem', function(data)
   S4.addShopItem(data.id, data.solditems, data.category, { buy = tonumber(data.buyprice), sell = tonumber(data.sellprice) }, source)
end)

S4.addShopItem = function(shop_id, item, cat, data, source)
   
   for k,v in pairs(GetShopFromId(shop_id).items) do
      if v.item == item then
         TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-exchange-alt', text = 'The item you want to add is already added.'  })
         return
      end
   end

   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         table.insert(v.items,  {  item = item,   price = data, stock = 0,  type = cat })
         break
      end
   end
   
   TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(shop_id))
   TriggerClientEvent('s4-shops:client:updateShops', -1, Shops)
end



S4.AddStock = function(shop_id, item, source)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         for ks,val in pairs(v.items) do
            if val.item == item.item then 
               val.stock = val.stock + 1
               v.money_earned = v.money_earned - val.price.buy 
            end
         end
         break
      end
   end
   TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
end



RegisterNetEvent('s4:shops:removeShopMoney')
AddEventHandler('s4:shops:removeShopMoney', function(data)
   S4.RemoveShopMoney(data.id,  data.type, tonumber(data.value), source)
end)

S4.RemoveShopMoney = function(shop_id, prop, val, source)
   shop_id = tonumber(shop_id)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         if v[prop] >= val then 
            xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addAccountMoney(Config.PayAccount, val) 
            v[prop] = v[prop] - val
         end 
         break
      end
   end
   
   if Config.SaveAfterTransaction == true then 
      S4.UpdateShop(shop_id)
   end

   TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(shop_id))
   
end

S4.AddShopMoney = function(shop_id, prop, val, source)
   shop_id = tonumber(shop_id)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         v[prop] = v[prop] + val
         break
      end
   end
   
   if Config.SaveAfterTransaction == true then 
      S4.UpdateShop(shop_id)
   end

   TriggerClientEvent('s4:shops:acsess', source, "manage", GetShopFromId(shop_id))
end


ESX.RegisterServerCallback('s4:shops:getuser', function(source, cb)
   xPlayer = ESX.GetPlayerFromId(source)
   cb({ bank = xPlayer.getAccount(Config.PayAccount).money, cash = xPlayer.GetInventoryItem(Config.PayItem).count  })
end)

ESX.RegisterServerCallback('s4:shops:getLabels', function(source, cb, items)
   local items = items
	for k, val in pairs(items) do 
	    if not val.label then 
		    val.label = ESX.GetItemLabel(val.item)
	    end
	end
   cb(items)
end)

 
RegisterNetEvent('s4:shops:updateSignal')
AddEventHandler('s4:shops:updateSignal', function(id)
    TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
end)

RegisterNetEvent('s4:shops:buyShop')
AddEventHandler('s4:shops:buyShop', function(id)
   xPlayer = ESX.GetPlayerFromId(source)
   curShop = GetShopFromId(id) 
   if curShop.owner ~= "" then return end
   if curShop.shop_transfer_fee == 0 then return end
   
   if xPlayer.getAccount(Config.PayAccount).money >= curShop.shop_transfer_fee then 
      xPlayer.removeAccountMoney(Config.PayAccount, curShop.shop_transfer_fee)
      S4.SetShopProp(curShop.id, 'owner', xPlayer.identifier, source)
      TriggerEvent('s4:shops:manage', id, source)
      TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-exchange-alt', text = 'Congratulations Your purchase was successful.'  })
      return
   end
   if xPlayer.GetInventoryItem(Config.PayItem).count >= curShop.shop_transfer_fee then       
      xPlayer.removeInventoryItem(Config.PayItem, curShop.shop_transfer_fee)
      S4.SetShopProp(curShop.id, 'owner', xPlayer.identifier, source)
      TriggerEvent('s4:shops:manage', id, source)
      TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-exchange-alt', text = 'Congratulations Your purchase was successful.'  })
      return
   end
   TriggerEvent('s4:shops:manage', id, source)
   TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-times', text = 'A problem occurred while purchasing.'  })
   cb(false)
end)


S4.SetShopProp = function(shop_id, prop, val, source)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         v[prop] = val
         break
      end
   end
   TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
end



ESX.RegisterServerCallback('s4:shops:buy', function(source, cb, data)
   shop = data.shop
   item = data.item
   xPlayer = ESX.GetPlayerFromId(source)
   if xPlayer.getAccount(Config.PayAccount).money >= item.price.sell then 
      xPlayer.removeAccountMoney(Config.PayAccount, item.price.sell)
      xPlayer.addInventoryItem(item.item, 1)
      S4.RemoveStock(data.shop.id, item, source)
      cb(item)
      return
   end
   if xPlayer.GetInventoryItem(Config.PayItem).count >= item.price.sell then 
      xPlayer.removeInventoryItem(Config.PayItem, item.price.sell)
      xPlayer.addInventoryItem(item.item, 1)
      S4.RemoveStock(data.shop.id, item, source)
      cb(item)
      return
   end
   cb(false)
end)

ESX.RegisterServerCallback('s4:shops:sell', function(source, cb, data)
   shop = data.shop
   item = data.item
   pay = data.pay
   xPlayer = ESX.GetPlayerFromId(source)

   if shop.money_earned >= item.price.sell then 
   
      if xPlayer.GetInventoryItem(item.item).count >= 1 then 
         xPlayer.removeInventoryItem(item.item, 1)
         if pay == "cash" then 
            xPlayer.addInventoryItem('cash', item.price.sell)
         else
            xPlayer.addAccountMoney('bank', item.price.sell)
         end
         S4.AddStock(shop.id, item, source)
         TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-on', text = 'Sales transaction successful.'  })
      else 
         TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-exclamation', text = 'You dont have enough item on you.'  })
      end
   else 
      TriggerClientEvent("s4-shops:client:notify", tonumber(source), { icon = 'fad fa-bell-exclamation', text = 'There is not enough money in the safe.'  })
   end

end)

S4.AddStock = function(shop_id, item, source)
    for s,v in pairs(Shops) do
       if v.id == shop_id then 
          for ks,val in pairs(v.items) do
             if val.item == item.item then 
                val.stock = val.stock + 1
                v.money_earned = v.money_earned - val.price.buy 
             end
          end
          break
       end
    end
    TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
 end

S4.RemoveStock = function(shop_id, item, source)
   for s,v in pairs(Shops) do
      if v.id == shop_id then 
         for ks,val in pairs(v.items) do
            if val.item == item.item then 
               val.stock = val.stock - 1
               v.money_earned = v.money_earned + val.price.sell 
            end
         end
         break
      end
   end
   TriggerClientEvent('s4-shops:client:updateShops', tonumber(source), Shops)
end
 
Citizen.CreateThread(function() 
   while 1>0 do 
     Citizen.Wait(Config.ShopSaveInterval)
     S4.UpdateShops()
     print("Trying to save shops...")
   end
end)

S4.UpdateShop = function(id)
	for k,v in pairs(Shops) do
      if v.id == id then 
        data = {
            shop = v.shop,
            enableShopList = v.enableShopList,
            marker = v.marker,
            lock = v.lock,
            markerY = v.markerY,
            markerColor = v.markerColor,
            money_earned = v.money_earned,
            theme = v.theme,
            owner = v.owner,
            shop_transfer_fee = v.shop_transfer_fee,
        }
        MySQL.Async.execute('UPDATE s4_shops SET data = @data, items = @items, sales_history = @sales_history WHERE shop_id = @shop_id', {
         ['@shop_id'] = v.id,
         ['@data'] = json.encode(data),
         ['@items'] = json.encode(v.items),
         ['@sales_history'] = json.encode(v.sales_history),
         })
      Wait(1000)
      break
      end
    end
end

S4.UpdateShops = function()
	for k,v in pairs(Shops) do
        data = {
            shop = v.shop,
            enableShopList = v.enableShopList,
            marker = v.marker,
            lock = v.lock,
            markerY = v.markerY,
            markerColor = v.markerColor,
            money_earned = v.money_earned,
            theme = v.theme,
            owner = v.owner,
            shop_transfer_fee = v.shop_transfer_fee,
        }
        MySQL.Async.execute('UPDATE s4_shops SET data = @data, items = @items, sales_history = @sales_history WHERE shop_id = @shop_id', {
         ['@shop_id'] = v.id,
         ['@data'] = json.encode(data),
         ['@items'] = json.encode(v.items),
         ['@sales_history'] = json.encode(v.sales_history),
         })
      Wait(1000)
    end
end

GetShopFromId = function(id)
   for k,v in pairs(Shops) do
      if v.id == id then 
         return v
      end
   end
end

Citizen.CreateThread(initShops)