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
		end
	end,
	GetAllDormShopIDList = function(arg_5_0)
		return ShopTools.CollectShopInGroup(GameSetting.dorm_shop_display_group_furniture.value)
	end,
	GetShopStyleImage = function(arg_6_0)
		return getSpriteViaConfig("DormShopPreview", arg_6_0)
	end,
	GetFurLable = function(arg_7_0, arg_7_1)
		local var_7_0 = {}
		local var_7_1 = BackHomeFurniture[arg_7_1]

		table.insert(var_7_0, "is_give")
		table.insert(var_7_0, "dorm_exp")
		table.insert(var_7_0, "hero_id")
		table.insert(var_7_0, "scene_id")

		return var_7_0
	end,
	GetFurLableDesc = function(arg_8_0, arg_8_1, arg_8_2)
		local var_8_0 = ""

		if arg_8_2 == "is_give" then
			if BackHomeFurniture[arg_8_1].is_give == 1 then
				local var_8_1 = BackHomeFurniture[arg_8_1].give_max

				var_8_0 = string.format(GetTips("DORM_FUR_INFO_TAG2"), var_8_1)
			else
				var_8_0 = GetTips("DORM_FUR_INFO_TAG1")
			end
		elseif arg_8_2 == "dorm_exp" then
			var_8_0 = string.format(GetTips("DORM_FUR_INFO_TAG7"), BackHomeFurniture[arg_8_1].dorm_exp)
		elseif arg_8_2 == "hero_id" then
			local var_8_2 = BackHomeFurniture[arg_8_1].hero_id

			if HeroRecordCfg[var_8_2] then
				local var_8_3 = HeroRecordCfg[var_8_2].name

				var_8_0 = string.format(GetTips("DORM_FUR_INFO_TAG3"), var_8_3)
			end
		elseif arg_8_2 == "scene_id" then
			local var_8_4 = BackHomeFurniture[arg_8_1].scene_id

			var_8_0 = GetTips("DORM_FUR_INFO_TAG4")

			for iter_8_0, iter_8_1 in ipairs(var_8_4) do
				var_8_0 = var_8_0 .. arg_8_0:GetRoomTypeName(iter_8_1) .. " "
			end

			string.sub(var_8_0, 1, -2)
		end

		return var_8_0
	end,
	GetFurGiftTypeDesc = function(arg_9_0, arg_9_1)
		local var_9_0 = ""

		if BackHomeFurniture[arg_9_1].is_give == 1 then
			local var_9_1 = BackHomeFurniture[arg_9_1].give_max

			var_9_0 = GetTips("DORM_FUR_INFO_CAN_GIFT")
		elseif BackHomeFurniture[arg_9_1].is_give == 0 then
			var_9_0 = GetTips("DORM_FUR_INFO_TAG1")
		elseif BackHomeFurniture[arg_9_1].is_give == 3 then
			local var_9_2 = BackHomeFurniture[arg_9_1].hero_id

			if HeroRecordCfg[var_9_2] then
				local var_9_3 = HeroRecordCfg[var_9_2].name

				var_9_0 = string.format(GetTips("DORM_FUR_INFO_TAG3"), GetI18NText(var_9_3))
			end
		end

		return var_9_0
	end,
	GetFurPlaceSceneDesc = function(arg_10_0, arg_10_1)
		local var_10_0 = ""
		local var_10_1 = BackHomeFurniture[arg_10_1].scene_id
		local var_10_2 = GetTips("DORM_FUR_INFO_TAG4")

		for iter_10_0, iter_10_1 in ipairs(var_10_1) do
			var_10_2 = var_10_2 .. arg_10_0:GetRoomTypeName(iter_10_1) .. " "
		end

		string.sub(var_10_2, 1, -2)

		return var_10_2
	end,
	GetFurGiftMaxDesc = function(arg_11_0, arg_11_1)
		if BackHomeFurniture[arg_11_1].give_max > 0 then
			return tostring(BackHomeFurniture[arg_11_1].give_max)
		else
			return GetTips("DORM_FUR_GIFT_NUM_NONE")
		end
	end,
	GetFurComfortDesc = function(arg_12_0, arg_12_1)
		if BackHomeFurniture[arg_12_1].is_give == DormConst.BACKHOME_FUR_GIVE_TYPE.NO_GIFT then
			return GetTips("DORM_FUR_COMFORT_NONE")
		else
			return tostring(BackHomeFurniture[arg_12_1].dorm_exp)
		end
	end,
	PlayDormAudioEffect = function(arg_13_0, arg_13_1)
		manager.audio:PlayEffect("ui_dorm", arg_13_1, "")
	end,
	ShouldShowBirthdayBtn = function(arg_14_0, arg_14_1)
		return false
	end
}
local var_0_1 = {}

function var_0_0.SystemStayTime(arg_15_0, arg_15_1, arg_15_2)
	if not var_0_1 then
		var_0_1 = {}
	end

	if arg_15_2 == true then
		if var_0_1[arg_15_1] then
			local var_15_0 = manager.time:GetServerTime()

			SDKTools.SendMessageToSDK("backhome_dorm_opt", {
				backhome_type = arg_15_1,
				opt_time = var_15_0 - var_0_1[arg_15_1]
			})

			var_0_1[arg_15_1] = nil
		else
			CustomLog.log("未记录系统开始时间")
		end
	else
		var_0_1[arg_15_1] = manager.time:GetServerTime()

		SDKTools.SendMessageToSDK("backhome_dorm_opt", {
			opt_time = -1,
			backhome_type = arg_15_1
		})
	end
end

function dump_value_(arg_16_0)
	if type(arg_16_0) == "string" then
		arg_16_0 = "\"" .. arg_16_0 .. "\""
	end

	return tostring(arg_16_0)
end

function split(arg_17_0, arg_17_1)
	arg_17_0 = tostring(arg_17_0)
	arg_17_1 = tostring(arg_17_1)

	if arg_17_1 == "" then
		return false
	end

	local var_17_0 = 0
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in function()
		return string.find(arg_17_0, arg_17_1, var_17_0, true)
	end do
		table.insert(var_17_1, string.sub(arg_17_0, var_17_0, iter_17_0 - 1))

		var_17_0 = iter_17_1 + 1
	end

	table.insert(var_17_1, string.sub(arg_17_0, var_17_0))

	return var_17_1
end

function trim(arg_19_0)
	return (string.gsub(arg_19_0, "^%s*(.-)%s*$", "%1"))
end

local function var_0_2(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		print(iter_20_1)
	end
end

function dump(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if type(arg_21_2) ~= "number" then
		arg_21_2 = 7
	end

	local var_21_0 = {}
	local var_21_1 = {}
	local var_21_2 = split(debug.traceback("", 2), "\n")

	local function var_21_3(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
		arg_22_1 = arg_22_1 or "<var>"

		local var_22_0 = ""

		if type(arg_22_4) == "number" then
			var_22_0 = string.rep(" ", arg_22_4 - string.len(dump_value_(arg_22_1)))
		end

		if type(arg_22_0) ~= "table" then
			var_21_1[#var_21_1 + 1] = string.format("%s%s%s = %s", arg_22_2, dump_value_(arg_22_1), var_22_0, dump_value_(arg_22_0))
		elseif var_21_0[tostring(arg_22_0)] then
			var_21_1[#var_21_1 + 1] = string.format("%s%s%s = *REF*", arg_22_2, dump_value_(arg_22_1), var_22_0)
		else
			var_21_0[tostring(arg_22_0)] = true

			if arg_22_3 > arg_21_2 then
				var_21_1[#var_21_1 + 1] = string.format("%s%s = *MAX NESTING*", arg_22_2, dump_value_(arg_22_1))
			else
				var_21_1[#var_21_1 + 1] = string.format("%s%s = {", arg_22_2, dump_value_(arg_22_1))

				local var_22_1 = arg_22_2 .. "    "
				local var_22_2 = {}
				local var_22_3 = 0
				local var_22_4 = {}

				for iter_22_0, iter_22_1 in pairs(arg_22_0) do
					var_22_2[#var_22_2 + 1] = iter_22_0

					local var_22_5 = dump_value_(iter_22_0)
					local var_22_6 = string.len(var_22_5)

					if var_22_3 < var_22_6 then
						var_22_3 = var_22_6
					end

					var_22_4[iter_22_0] = iter_22_1
				end

				table.sort(var_22_2, function(arg_23_0, arg_23_1)
					if type(arg_23_0) == "number" and type(arg_23_1) == "number" then
						return arg_23_0 < arg_23_1
					else
						return tostring(arg_23_0) < tostring(arg_23_1)
					end
				end)

				for iter_22_2, iter_22_3 in ipairs(var_22_2) do
					var_21_3(var_22_4[iter_22_3], iter_22_3, var_22_1, arg_22_3 + 1, var_22_3)
				end

				var_21_1[#var_21_1 + 1] = string.format("%s}", arg_22_2)
			end
		end
	end

	var_21_3(arg_21_0, arg_21_1, "- ", 1)

	arg_21_3 = arg_21_3 or var_0_2

	return arg_21_3(var_21_1)
end

return var_0_0
