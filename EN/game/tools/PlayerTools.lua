local var_0_0 = {}
local var_0_1 = import("game.const.HeroConst")
local var_0_2 = import("game.tools.BattleInstance")

function var_0_0.SortShowHero(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = {}
	local var_1_1 = {}

	for iter_1_0, iter_1_1 in pairs(arg_1_0) do
		if type(iter_1_1) == "table" then
			local var_1_2 = HeroCfg[iter_1_0]

			var_1_0[iter_1_0] = iter_1_0 + (iter_1_1.level or iter_1_1.hero_level) * 10000 + (iter_1_1.star or iter_1_1.hero_star) * 10000000

			local var_1_3 = table.keyof(arg_1_1, iter_1_0)

			if var_1_3 then
				var_1_0[iter_1_0] = var_1_3 + 100000000 * (4 - var_1_3)
			end

			if arg_1_1[arg_1_2] == iter_1_0 then
				var_1_0[iter_1_0] = var_1_0[iter_1_0] + 1000000000
			end

			if iter_1_1.hero_unlock == 1 or iter_1_1.unlock == 1 then
				table.insert(var_1_1, iter_1_0)
			end
		end
	end

	table.sort(var_1_1, function(arg_2_0, arg_2_1)
		return var_1_0[arg_2_0] > var_1_0[arg_2_1]
	end)

	return var_1_1
end

function var_0_0.PackUserData(arg_3_0)
	local var_3_0 = PlayerData:GetPlayerInfo()

	if var_3_0 == nil then
		return "{}"
	end

	local var_3_1 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND)
	local var_3_2 = var_3_0.register_timestamp
	local var_3_3 = var_3_0.userID
	local var_3_4 = var_3_0.nick
	local var_3_5 = var_3_0.userLevel
	local var_3_6 = _G.TMP_SERVER_ID
	local var_3_7 = var_0_2.GetCurrentBattleId()

	return string.format("{\"dataType\" : \"%s\",\"money\" : \"%d\",\"createTime\" : \"%d\",\"roleId\" : \"%s\",\"roleName\" : \"%s\",\"level\" : \"%s\",\"serverId\" : \"%s\",\"chapter\" : \"%s\"}", arg_3_0, var_3_1, var_3_2, tostring(var_3_3), tostring(var_3_4), tostring(var_3_5), tostring(var_3_6), tostring(var_3_7))
end

return var_0_0
