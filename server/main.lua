
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

craftingItem = {}

vRP.prepare('sjr/setItens', 'REPLACE INTO facs_farmsystem(user_id, itens, day) VALUES(@user_id, @itens, @day)')
vRP.prepare('sjr/getItens', 'SELECT * from facs_farmsystem WHERE user_id = @user_id')

vRP.prepare('sjr/selectFarmLog', [[
    SELECT * FROM facs_farm_logs 
    WHERE user_id = @user_id AND item_name = @item_name AND date = CURDATE() AND org_name = @org
]])



vRP.prepare('sjr/updateFarmLogs', [[
    UPDATE facs_farm_logs
    SET amount = amount + @amount
    WHERE user_id = @user_id AND org_name = @org_name AND item_name = @item_name AND date = CURDATE()
]])

vRP.prepare('sjr/insertFarmLogs', [[
    INSERT INTO facs_farm_logs (user_id, org_name, item_name, amount, date)
    VALUES (@user_id, @org_name, @item_name, @amount, CURDATE())
]])



src.checkPerm = function(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return vRP.hasPermission(user_id, perm)
    end
    return false
end

src.getStorage = function(data)
    if not Config.Storages[data.name] or not Config.Storages[data.name].itens then return {} end
    local storage = vRP.getSData('Storage:'..data.name)
    if storage then
        local itens = json.decode(storage) or {}
        local table = {}
        for k,v in pairs(Config.Storages[data.name].itens) do
            if itens[k] then
                table[#table+1] = {name = k, qtdStock = itens[k], img = Config.images..""..k..".png", qtdMax = v}
            else
                table[#table+1] = {name = k, qtdStock = 0, img = Config.images..""..k..".png", qtdMax = v}
            end
        end
        return table
    end
    return {}
end



src.storageItem = function(data, type, id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local query = vRP.query('sjr/getItens', { user_id = user_id })
        local org_name = vRP.getUserOrgName(user_id)  -- Pega o nome da organização do jogador

        local info = Config.Tables[type]
        if not info or not info['locations'] or not info['locations'][id] or not info['locations'][id].requireStorage or not info['locations'][id].requireStorage.name then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return true
        end
        
        local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
        local storage = json.decode(datatable) or {}
        if storage[data.name] then
            local amount = vRP.getInventoryItemAmount(user_id, data.name)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, data.name, amount, true) then
                storage[data.name] = parseInt(storage[data.name]) + amount
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
                local temp = os.date("*t", os.time())

                if #query > 0 then
                    local value = json.decode(query[1].itens)
                    if value[data.name] then
                        value[data.name] = value[data.name] + amount
                    else
                        value[data.name] = amount
                    end
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })


                    -- Atualiza logs de farm
                    vRP.execute('sjr/updateFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,
                        item_name = data.name,
                        amount = amount
                    })
                else
                    local value = {}
                    value[data.name] = amount
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })

                    -- Insere novo log se não existir
                    vRP.execute('sjr/insertFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,
                        item_name = data.name,
                        amount = amount
                    })
                end
                TriggerClientEvent('Notify', source, 'sucesso', "Item guardado com sucesso.", 5000)
            else
                TriggerClientEvent('Notify', source, 'negado', "Você não possui esse item para depositar.", 5000)
            end
        else
            storage[data.name] = 0
            local amount = vRP.getInventoryItemAmount(user_id, data.name)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, data.name, amount, true) then
                storage[data.name] = amount
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
                local temp = os.date("*t", os.time())

                if #query > 0 then
                    local value = json.decode(query[1].itens)
                    if value[data.name] then
                        value[data.name] = value[data.name] + amount
                    else
                        value[data.name] = amount
                    end
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })

                    vRP.execute('sjr/updateFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,
                        item_name = data.name,
                        amount = amount
                    })
                else
                    local value = {}
                    value[data.name] = amount
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })

                    vRP.execute('sjr/insertFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,
                        item_name = data.name,
                        amount = amount
                    })
                end
                TriggerClientEvent('Notify', source, 'sucesso', "Item guardado com sucesso.", 5000)
            else
                TriggerClientEvent('Notify', source, 'negado', "Você não possui esse item para depositar.", 5000)
            end
        end
    end
    return true
end



vRP.prepare('vRP/getUserOrgByUserId', [[
  SELECT org
  FROM flow_orgs
  WHERE JSON_VALUE(membros, CONCAT('$.', @user_id, '.nome')) IS NOT NULL;
]])


function vRP.getUserOrgName(user_id)
    
    local rows = vRP.query('vRP/getUserOrgByUserId', { user_id = user_id })
   
    if #rows > 0 then
       
        return rows[1].org or "Sem Organização"
    end
    return "Sem Organização"
end




src.startCrafting = function(data, qtd, type, id)

    
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        local info = Config.Tables[type]
        
        if craftingItem[user_id] and craftingItem[user_id][data.name] then
            TriggerClientEvent('Notify', source, 'negado', "Você já está craftando esse item, aguarde finalizar para iniciar ele novamente.", 5000)
            return false
        end
        
        if not info or not info['locations'] or not info['locations'][id] or not info['locations'][id].craftPermission then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        if vRP.hasPermission(user_id, info['locations'][id].craftPermission) then
            local table = info['craft'][data.id]
            local checked = #table.requires
            local value = 0
            local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
            local storage = json.decode(datatable) or {}
            
            for k,v in pairs(table.requires) do
                if storage[v.item] and storage[v.item] >= (v.amount*qtd) then
                    value = value + 1
                end
            end
            
            local removed = {}
            
            if checked == value then
                for k,v in pairs(table.requires) do
                    storage[v.item] = storage[v.item] - (v.amount * qtd)
                    removed[v.item] = (v.amount * qtd)
                end
                
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
                
                if not craftingItem[user_id] then
                    craftingItem[user_id] = {}
                end
                
                craftingItem[user_id][data.name] = { amount = data.qtd * qtd, type = type, id = id, itens = removed }
                
                -- Registra o log do item craftado
                vRP.sendLog("", "O ID "..user_id.." craftou o item: "..data.name.." na quantidade de "..(data.qtd * qtd))
                
                return true
            else
                TriggerClientEvent('Notify', source, 'negado', "Não possui itens suficientes no armazém.", 5000)
            end
        else
            TriggerClientEvent('Notify', source, 'negado', "Você não possui permissão para craftar.", 5000)
        end
    end
end

src.producedItem = function(data, type)
   
    local source = source
    local user_id = vRP.getUserId(source)
    local org_name = vRP.getUserOrgName(user_id)
    
    if user_id then
        local info = Config.Tables[type]
        
        if craftingItem[user_id] and craftingItem[user_id][data.name] then
            
            local current_amount = craftingItem[user_id][data.name].amount
            
            local permission = info['locations'][1].craftPermission

            -- vRP.giveInventoryItem(user_id, data.name, craftingItem[user_id][data.name].amount, true)

           updateListItems(data.name,current_amount,org_name,permission)
            -- exports.flow_inventory:sendItemsToChest(data.name,current_amount,5, org_name, 10000, org_name)
            -- Registra o log do item recebido como presente
            vRP.sendLog("", "O ID "..user_id.." recebeu o item: "..data.name.." como presente na quantidade de "..current_amount)
            TriggerClientEvent("Notify",source,"sucesso","Produção concluida do item "..data.name)
            TriggerClientEvent("m_craft_v2:alertSuccess",source)

            craftingItem[user_id][data.name] = nil
        else
            TriggerClientEvent('Notify', source, 'negado', "Você não está craftando esse item, então não é possível recebê-lo.", 5000)
            return false
        end
    end
end


function updateListItems(item,quantity,org_name,permission)
    
    local obter = "SELECT produced FROM facs_produced WHERE org = ?"
    local current_query = "UPDATE facs_produced SET produced = ?, permission = ? WHERE org = ?"
    local data = exports.oxmysql:query_async(obter, {org_name})
    
    if data and #data > 0 then -- Verifica se há resultados
        -- Decodifica o campo 'produced' (que está no formato JSON) em uma tabela
        local dataRes = json.decode(data[1].produced)
    
        if type(dataRes) ~= "table" then
            dataRes = {} -- Garante que seja uma tabela, caso esteja vazio ou inválido
        end
    
        local novoItem = {
            quantidade = quantity,
            item = item
        }
    
        -- Adiciona o novo item à tabela
        table.insert(dataRes, novoItem)
    
        -- Opcional: Codifica novamente para JSON, caso precise salvar ou enviar de volta
        local dataResJson = json.encode(dataRes)

        exports.oxmysql:update_async(current_query,{dataResJson,permission,org_name})
    
        -- print("Tabela atualizada com o novo item:")
        -- print(dataResJson) -- Exibe a tabela atualizada
    else
        print("Nenhum dado encontrado.")
    end


end


src.storageItemAll = function(type, id)
  
    local source = source
    local user_id = vRP.getUserId(source)
   
    
    if user_id then
        local query = vRP.query('sjr/getItens', { user_id = user_id })
        local org_name = vRP.getUserOrgName(user_id) -- <<-- pegue aqui também
       
        local info = Config.Tables[type]

        -- Verificações de config
        if not info or not info['locations'] or not info['locations'][id] or
           not info['locations'][id].requireStorage or not info['locations'][id].requireStorage.name then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        if not Config.Storages[info['locations'][id].requireStorage.name] or
           not Config.Storages[info['locations'][id].requireStorage.name].itens then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
        local storage = json.decode(datatable) or {}
        local depositou = false
        local temp = os.date("*t", os.time())

        for k, v in pairs(Config.Storages[info['locations'][id].requireStorage.name].itens) do
            local amount = vRP.getInventoryItemAmount(user_id, k)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, k, amount, true) then
                if not storage[k] then
                    storage[k] = 0
                end
                storage[k] = storage[k] + amount
                depositou = true
                
                -- Atualiza facs_farmsystem
                if #query > 0 then
                    local value = json.decode(query[1].itens) or {}
                    if value[k] then
                        value[k] = value[k] + amount
                    else
                        value[k] = amount
                    end
                    vRP.execute('sjr/setItens', {
                        user_id = user_id,
                        itens = json.encode(value),
                        day = temp.day
                    })
                else
                    local value = {}
                    value[k] = amount
                    vRP.execute('sjr/setItens', {
                        user_id = user_id,
                        itens = json.encode(value),
                        day = temp.day
                    })
                end

                -- Lógica de Log Diário
                local result = vRP.query('sjr/selectFarmLog', {
                    user_id = user_id,
                    item_name = k,
                    org = org_name
                })

                if #result > 0 then
                    
                    -- Se o item já existe, faz UPDATE
                    vRP.execute('sjr/updateFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,         -- <<-- adicione isto
                        item_name = k,
                        amount = amount
                    })
                else
                   
                    -- Se não existe, faz INSERT
                    vRP.execute('sjr/insertFarmLogs', {
                        user_id = user_id,
                        org_name = org_name,         -- <<-- adicione isto
                        item_name = k,
                        amount = amount
                    })
                end

                -- Registrar log (webhook)
                local itemName = vRP.getItemName(k) or k
                vRP.sendLog(
                    "", 
                    "O ID "..user_id.." depositou o item: "..itemName.." na quantidade de "..amount
                )
            end
        end

        if depositou then
            TriggerClientEvent('Notify', source, 'sucesso', "Itens guardados com sucesso!!!.", 5000)
            vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
            return true
        end
    end
    return false
end




AddEventHandler('vRP:playerLeave', function(user_id, source)
    if user_id then
        if craftingItem[user_id] then
            for k,v in pairs(craftingItem[user_id]) do
                local info = Config.Tables[v.type]
                local datatable = vRP.getSData('Storage:'..info['locations'][v.id].requireStorage.name)
                local storage = json.decode(datatable)
                for item, amount in pairs(v.itens) do
                    storage[item] = storage[item] + amount
                end
                vRP.setSData('Storage:'..info['locations'][v.id].requireStorage.name,json.encode(storage))
                craftingItem[user_id][k] = nil
            end
        end
    end
end)


function alertPolice(data)
    local policia = vRP.getUsersByPermission("policia.permissao") 
    if #policia > 0 then
        for k,v in pairs(policia) do
            local nsource = vRP.getUserSource(parseInt(v))
            if nsource then
                TriggerClientEvent("NotifyPush", nsource, { x = data.x, y = data.y, z = data.z, blipID = data.blipID, blipColor = data.blipColor, blipScale = data.blipScale, time = data.time, code = data.code, title = data.title, name = data.name })
            end
        end
    end
end

src.giveItem = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local change = false

        for k,v in pairs(data.parts) do
            
            local random = math.random(v.qtdMin, v.qtdMax)

            local check = exports.m_dominacao:checkDominas(user_id)
            if check and data.status then

                TriggerClientEvent("Notify", source, 'aviso', '[DOMINAÇÃO] Recebido bônus no farm', 5000)
                random = random*data.bonus
            end
            if vRP.computeInvWeight(user_id) + vRP.getItemWeight(v.name) * random <= vRP.getInventoryMaxWeight(user_id) then
                vRP.giveInventoryItem(user_id,v.name,random, true)
                change = true
            else
                TriggerClientEvent("Notify",source,"negado","Sua mochila esta cheia, você não pode pegar o item "..v.name..".", 3) 
            end
        end
        if data.callPolice then
            local chance = math.random(0,100)
            if chance <= data.percentualPolice then
                local cds = GetEntityCoords(GetPlayerPed(source))
                alertPolice({ x = cds.x, y = cds.y, z = cds.z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = 'Denúncia de coleta', name = "Uma pessoa avistou alguém coletando itens ilicitos nesse local."})
            end
        end
        return change
    end
end

src.sellItem = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local change = false
        for k,v in pairs(data.parts) do
            local random = math.random(v.qtdMin, v.qtdMax)
            if v.type == 'legal' then
                if vRP.tryGetInventoryItem(user_id, v.name, random, true) then
                    vRP.giveInventoryItem(user_id,'money',v.payment, true)
                    change = true
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui a quantidade de "..random.." do item "..v.name.." para vender.", 3) 
                end
            else
                if vRP.tryGetInventoryItem(user_id, v.name, random, true) then
                    vRP.giveInventoryItem(user_id,Config.dirtymoney,v.payment, true)
                    change = true
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui a quantidade de "..random.." do item "..v.name.." para vender.", 3) 
                end
            end
        end
        if data.callPolice then
            local chance = math.random(0,100)
            if chance <= data.percentualPolice then
                local cds = GetEntityCoords(GetPlayerPed(source))
                alertPolice({ x = cds.x, y = cds.y, z = cds.z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = 'Denúncia de coleta', name = "Uma pessoa avistou alguém coletando itens ilicitos nesse local."})
            end
        end
        return change
    end
end














