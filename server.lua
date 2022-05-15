--[[
                      _   _           _     _        _____
                     | | | |         (_)   | |      |_   _|
                     | | | |_ __  ___ _  __| | ___    | | ___  __ _ _ __ ___  
                     | | | | '_ \/ __| |/ _` |/ _ \   | |/ _ \/ _` | '_ ` _ \ 
                     | |_| | |_) \__ \ | (_| |  __/   | |  __/ (_| | | | | | |
                      \___/| .__/|___/_|\__,_|\___|   \_/\___|\__,_|_| |_| |_|
                           | |
                           |_|

					                Made By !FLOKI#0001
					               Discord.gg/UDEEpWucbH
]]
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "UT-SetModel")



--========== Code ==========--
local UT_setmodel = {function(player,choice)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil and vRP.hasPermission({user_id,Config.Permission}) then
	  vRP.prompt({player,"ايدي اللاعب ؟ :","",function(player,id)
		if id ~= nil and id ~= "" then
				id = parseInt(id)
				local psource = vRP.getUserSource({id})
				if psource ~= nil then
					vRP.prompt({player,"اسم الشخصية :","",function(player,pmodel)
						if pmodel ~= nil and pmodel ~= "" then
							local idle_copy = { model = pmodel }
							for i=0,19 do
							  idle_copy[i] = {0,0}
							end
							vRPclient.setCustomization(psource,{idle_copy})
							SendToDiscord("اعطاء شخصية","\n**الادري رقم : **[ ``" .. user_id .. "`` ]\n**قام بتغيير شخصية اللاعب رقم : **[ ``" .. id .. "`` ]\n**الشخصية : **[ ``" .. pmodel .. "`` ]", 6207853);
							TriggerClientEvent("pNotify:SendNotification",player,{
							text = "تم اعطاء اللاعب الشخصية",
						    type = "success",
						    timeout = (3000),
							layout = "centerRight"})
							TriggerClientEvent("pNotify:SendNotification",psource,{
								text = "تم تغيير شخصيتك",
								type = "success",
								timeout = (3000),
								layout = "centerRight"})

						  else
							TriggerClientEvent("pNotify:SendNotification",player,{
								text = "يجب كتابة الشخصية",
								type = "error",
								timeout = (3000),
								layout = "centerRight"})
						end
					end})
				end
			  else
				TriggerClientEvent("pNotify:SendNotification",player,{
					text = "يجب كتابة ايدي اللاعب",
					type = "error",
					timeout = (3000),
					layout = "centerRight"})
			end
	  end})
	end
end,"<span style='color:white;text-align: center;font-weight: 900'><h4>اعطاء شخصية للاعب<br/><h5>Made By !FLOKI#0001"}

RegisterCommand(Config.Command,function (player)
	local user_id = vRP.getUserId({player})
	if user_id ~= nil and vRP.hasPermission({user_id,Config.Permission}) then
	  vRP.prompt({player,"ايدي اللاعب ؟ :","",function(player,id)
		if id ~= nil and id ~= "" then
				id = parseInt(id)
				local psource = vRP.getUserSource({id})
				if psource ~= nil then
					vRP.prompt({player,"اسم الشخصية :","",function(player,pmodel)
						if pmodel ~= nil and pmodel ~= "" then
							local idle_copy = { model = pmodel }
							for i=0,19 do
							  idle_copy[i] = {0,0}
							end
							vRPclient.setCustomization(psource,{idle_copy})
							SendToDiscord("اعطاء شخصية","\n**الادري رقم : **[ ``" .. user_id .. "`` ]\n**قام بتغيير شخصية اللاعب رقم : **[ ``" .. id .. "`` ]\n**الشخصية : **[ ``" .. pmodel .. "`` ]", 6207853);
							TriggerClientEvent("pNotify:SendNotification",player,{
							text = "تم اعطاء اللاعب الشخصية",
						    type = "success",
						    timeout = (3000),
							layout = "centerRight"})
							TriggerClientEvent("pNotify:SendNotification",psource,{
								text = "تم تغيير شخصيتك",
								type = "success",
								timeout = (3000),
								layout = "centerRight"})

						  else
							TriggerClientEvent("pNotify:SendNotification",player,{
								text = "يجب كتابة الشخصية",
								type = "error",
								timeout = (3000),
								layout = "centerRight"})
						end
					end})
				end
			  else
				TriggerClientEvent("pNotify:SendNotification",player,{
					text = "يجب كتابة ايدي اللاعب",
					type = "error",
					timeout = (3000),
					layout = "centerRight"})
			end
	  end})
	end
end)


--========== MenuBuilder ==========--
vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		if vRP.hasPermission({user_id,Config.Permission}) then
			choices["اعطاء شخصية"] = UT_setmodel
		end
		add(choices)
	end
end})

--========== Webhook ==========--
function SendToDiscord(title , message , footer)
	local embed = {}
	embed = {
		{
			["color"] = "8359053",
			["title"] = "**".. title .."**",
			["description"] = "" .. message ..  "",
			["footer"] = {
            ["text"] = "Made By !FLOKI#0001 | Time " .. os.date("%x | %X") .. "",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/750290668571852851/926886762553409576/code_1.png",
			},
		}
	}
  PerformHttpRequest(Config.Webhook,
  function(err, text, headers) end, 'POST', json.encode({username = '', icon_url='' , embeds = embed}), { ['Content-Type'] = 'application/json' })
  end
  --========== Webhook ==========--
  --[[
                      _   _           _     _        _____
                     | | | |         (_)   | |      |_   _|
                     | | | |_ __  ___ _  __| | ___    | | ___  __ _ _ __ ___  
                     | | | | '_ \/ __| |/ _` |/ _ \   | |/ _ \/ _` | '_ ` _ \ 
                     | |_| | |_) \__ \ | (_| |  __/   | |  __/ (_| | | | | | |
                      \___/| .__/|___/_|\__,_|\___|   \_/\___|\__,_|_| |_| |_|
                           | |
                           |_|

					                Made By !FLOKI#0001
					               Discord.gg/UDEEpWucbH
]]