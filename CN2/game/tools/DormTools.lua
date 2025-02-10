local var_0_0 = {
	GetDormAdditionByHeroID = function(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
		local var_1_0 = {
			attribute = {},
			voice = {}
		}
		local var_1_1 = DormData:GetHeroArchiveID(arg_1_1)
		local var_1_2 = table.indexof(DormHeroTools:GetCanUseHeroInDorm(), var_1_1)

		if not arg_1_2 and not var_1_2 then
			return var_1_0
		end

		local var_1_3 = DormHeroTools:GetTemplateIDInDorm(var_1_1)
		local var_1_4 = 0

		if not arg_1_3 then
			var_1_4 = arg_1_2 or DormHeroTools:GetDormLevelByHeroID(var_1_3)
		end

		for iter_1_0 = 1, var_1_4 do
			local var_1_5 = BackHomeHeroCfg[var_1_3].level_reward[iter_1_0]

			for iter_1_1, iter_1_2 in ipairs(var_1_5) do
				local var_1_6 = BackHomeDormLevelRewardCfg[iter_1_2]

				if var_1_6.type == 1 then
					if not var_1_0.attribute[var_1_6.reward[1]] then
						var_1_0.attribute[var_1_6.reward[1]] = 0
					end

					var_1_0.attribute[var_1_6.reward[1]] = var_1_0.attribute[var_1_6.reward[1]] + var_1_6.reward[2]
				elseif var_1_6.type == 2 then
					table.insert(var_1_0.voice, var_1_6.reward[1])
				end
			end
		end

		return var_1_0
	end,
	SecondSwitchTime = function(arg_2_0, arg_2_1)
		local var_2_0 = math.ceil(arg_2_1 / 60)
		local var_2_1 = math.modf(var_2_0 / 60)
		local var_2_2 = var_2_0 % 60
		local var_2_3 = GetTips("HOUR")
		local var_2_4 = GetTips("MINUTE")

		return string.format("%d%s%02d%s", var_2_1, var_2_3, var_2_2, var_2_4)
	end,
	MinSwitchTime = function(arg_3_0, arg_3_1)
		if arg_3_1 then
			local var_3_0, var_3_1 = math.modf(arg_3_1 / 60)

			return string.format("%02d:%02d:%02d", var_3_0, var_3_1, 0)
		end
	end,
	GetRoomTypeName = function(arg_4_0, arg_4_1)
		if arg_4_1 == DormConst.BACKHOME_TYPE.PublicDorm then
			return GetTips("DORM_FUR_INFO_TAG5")
		elseif arg_4_1 == DormConst.BACKHOME_TYPE.PrivateDorm then
			return GetTips("DORM_FUR_INFO_TAG6")
		elseif arg_4_1 == DormConst.BACKHOME_TYPE.Canteen then
			return GetTips("DORM_HERO_AT_CANTEEN")
		end
	end,
	GetAllDormShopIDList = function(arg_5_0)
		return ShopTools.CollectShopInGroup(GameSetting.dorm_shop_display_group_furniture.value)
	end,
	AnyShopInDiscount = function(arg_6_0)
		return ShopTools.IsAnyShopDiscount(arg_6_0:GetAllDormShopIDList())
	end,
	GetShopStyleImage = function(arg_7_0)
		return getSpriteViaConfig("DormShopPreview", arg_7_0)
	end,
	GetFurLable = function(arg_8_0, arg_8_1)
		local var_8_0 = {}
		local var_8_1 = BackHomeFurniture[arg_8_1]

		table.insert(var_8_0, "is_give")
		table.insert(var_8_0, "dorm_exp")
		table.insert(var_8_0, "hero_id")
		table.insert(var_8_0, "scene_id")

		return var_8_0
	end,
	GetFurLableDesc = function(arg_9_0, arg_9_1, arg_9_2)
		local var_9_0 = ""

		if arg_9_2 == "is_give" then
			if BackHomeFurniture[arg_9_1].is_give == 1 then
				local var_9_1 = BackHomeFurniture[arg_9_1].give_max

				var_9_0 = string.format(GetTips("DORM_FUR_INFO_TAG2"), var_9_1)
			else
				var_9_0 = GetTips("DORM_FUR_INFO_TAG1")
			end
		elseif arg_9_2 == "dorm_exp" then
			var_9_0 = string.format(GetTips("DORM_FUR_INFO_TAG7"), BackHomeFurniture[arg_9_1].dorm_exp)
		elseif arg_9_2 == "hero_id" then
			local var_9_2 = BackHomeFurniture[arg_9_1].hero_id

			if HeroRecordCfg[var_9_2] then
				local var_9_3 = HeroRecordCfg[var_9_2].name

				var_9_0 = string.format(GetTips("DORM_FUR_INFO_TAG3"), var_9_3)
			end
		elseif arg_9_2 == "scene_id" then
			local var_9_4 = BackHomeFurniture[arg_9_1].scene_id

			var_9_0 = GetTips("DORM_FUR_INFO_TAG4")

			for iter_9_0, iter_9_1 in ipairs(var_9_4) do
				var_9_0 = var_9_0 .. arg_9_0:GetRoomTypeName(iter_9_1) .. " "
			end

			string.sub(var_9_0, 1, -2)
		end

		return var_9_0
	end,
	GetFurGiftTypeDesc = function(arg_10_0, arg_10_1)
		local var_10_0 = ""

		if BackHomeFurniture[arg_10_1].is_give == 1 then
			local var_10_1 = BackHomeFurniture[arg_10_1].give_max

			var_10_0 = GetTips("DORM_FUR_INFO_CAN_GIFT")
		elseif BackHomeFurniture[arg_10_1].is_give == 0 then
			var_10_0 = GetTips("DORM_FUR_INFO_TAG1")
		elseif BackHomeFurniture[arg_10_1].is_give == 3 then
			local var_10_2 = BackHomeFurniture[arg_10_1].hero_id

			if HeroRecordCfg[var_10_2] then
				local var_10_3 = HeroRecordCfg[var_10_2].name

				var_10_0 = string.format(GetTips("DORM_FUR_INFO_TAG3"), var_10_3)
			end
		end

		return var_10_0
	end,
	GetFurPlaceSceneDesc = function(arg_11_0, arg_11_1)
		local var_11_0 = ""
		local var_11_1 = BackHomeFurniture[arg_11_1].scene_id
		local var_11_2 = GetTips("DORM_FUR_INFO_TAG4")

		for iter_11_0, iter_11_1 in ipairs(var_11_1) do
			var_11_2 = var_11_2 .. arg_11_0:GetRoomTypeName(iter_11_1) .. " "
		end

		string.sub(var_11_2, 1, -2)

		return var_11_2
	end,
	GetFurGiftMaxDesc = function(arg_12_0, arg_12_1)
		if BackHomeFurniture[arg_12_1].give_max > 0 then
			return tostring(BackHomeFurniture[arg_12_1].give_max)
		else
			return GetTips("DORM_FUR_GIFT_NUM_NONE")
		end
	end,
	GetFurComfortDesc = function(arg_13_0, arg_13_1)
		if BackHomeFurniture[arg_13_1].is_give == DormConst.BACKHOME_FUR_GIVE_TYPE.NO_GIFT then
			return GetTips("DORM_FUR_COMFORT_NONE")
		else
			return tostring(BackHomeFurniture[arg_13_1].dorm_exp)
		end
	end,
	PlayDormAudioEffect = function(arg_14_0, arg_14_1)
		manager.audio:PlayEffect("ui_dorm", arg_14_1, "")
	end,
	ShouldShowBirthdayBtn = function(arg_15_0, arg_15_1)
		return false
	end
}
local var_0_1 = {}

function var_0_0.SystemStayTime(arg_16_0, arg_16_1, arg_16_2)
	if not var_0_1 then
		var_0_1 = {}
	end

	if arg_16_2 == true then
		if var_0_1[arg_16_1] then
			local var_16_0 = manager.time:GetServerTime()

			SDKTools.SendMessageToSDK("backhome_dorm_opt", {
				backhome_type = arg_16_1,
				opt_time = var_16_0 - var_0_1[arg_16_1]
			})

			var_0_1[arg_16_1] = nil
		else
			CustomLog.log("未记录系统开始时间")
		end
	else
		var_0_1[arg_16_1] = manager.time:GetServerTime()

		SDKTools.SendMessageToSDK("backhome_dorm_opt", {
			opt_time = -1,
			backhome_type = arg_16_1
		})
	end
end

function dump_value_(arg_17_0)
	if type(arg_17_0) == "string" then
		arg_17_0 = "\"" .. arg_17_0 .. "\""
	end

	return tostring(arg_17_0)
end

function split(arg_18_0, arg_18_1)
	arg_18_0 = tostring(arg_18_0)
	arg_18_1 = tostring(arg_18_1)

	if arg_18_1 == "" then
		return false
	end

	local var_18_0 = 0
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in function()
		return string.find(arg_18_0, arg_18_1, var_18_0, true)
	end do
		table.insert(var_18_1, string.sub(arg_18_0, var_18_0, iter_18_0 - 1))

		var_18_0 = iter_18_1 + 1
	end

	table.insert(var_18_1, string.sub(arg_18_0, var_18_0))

	return var_18_1
end

function trim(arg_20_0)
	return (string.gsub(arg_20_0, "^%s*(.-)%s*$", "%1"))
end

local function var_0_2(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0) do
		print(iter_21_1)
	end
end

function dump(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if type(arg_22_2) ~= "number" then
		arg_22_2 = 7
	end

	local var_22_0 = {}
	local var_22_1 = {}
	local var_22_2 = split(debug.traceback("", 2), "\n")

	local function var_22_3(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
		arg_23_1 = arg_23_1 or "<var>"

		local var_23_0 = ""

		if type(arg_23_4) == "number" then
			var_23_0 = string.rep(" ", arg_23_4 - string.len(dump_value_(arg_23_1)))
		end

		if type(arg_23_0) ~= "table" then
			var_22_1[#var_22_1 + 1] = string.format("%s%s%s = %s", arg_23_2, dump_value_(arg_23_1), var_23_0, dump_value_(arg_23_0))
		elseif var_22_0[tostring(arg_23_0)] then
			var_22_1[#var_22_1 + 1] = string.format("%s%s%s = *REF*", arg_23_2, dump_value_(arg_23_1), var_23_0)
		else
			var_22_0[tostring(arg_23_0)] = true

			if arg_23_3 > arg_22_2 then
				var_22_1[#var_22_1 + 1] = string.format("%s%s = *MAX NESTING*", arg_23_2, dump_value_(arg_23_1))
			else
				var_22_1[#var_22_1 + 1] = string.format("%s%s = {", arg_23_2, dump_value_(arg_23_1))

				local var_23_1 = arg_23_2 .. "    "
				local var_23_2 = {}
				local var_23_3 = 0
				local var_23_4 = {}

				for iter_23_0, iter_23_1 in pairs(arg_23_0) do
					var_23_2[#var_23_2 + 1] = iter_23_0

					local var_23_5 = dump_value_(iter_23_0)
					local var_23_6 = string.len(var_23_5)

					if var_23_3 < var_23_6 then
						var_23_3 = var_23_6
					end

					var_23_4[iter_23_0] = iter_23_1
				end

				table.sort(var_23_2, function(arg_24_0, arg_24_1)
					if type(arg_24_0) == "number" and type(arg_24_1) == "number" then
						return arg_24_0 < arg_24_1
					else
						return tostring(arg_24_0) < tostring(arg_24_1)
					end
				end)

				for iter_23_2, iter_23_3 in ipairs(var_23_2) do
					var_22_3(var_23_4[iter_23_3], iter_23_3, var_23_1, arg_23_3 + 1, var_23_3)
				end

				var_22_1[#var_22_1 + 1] = string.format("%s}", arg_23_2)
			end
		end
	end

	var_22_3(arg_22_0, arg_22_1, "- ", 1)

	arg_22_3 = arg_22_3 or var_0_2

	return arg_22_3(var_22_1)
end

return var_0_0
