function formatRewardCfgList(arg_1_0)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0) do
		table.insert(var_1_0, formatReward(iter_1_1))
	end

	return var_1_0
end

function unformatRewardCfgList(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		table.insert(var_2_0, {
			iter_2_1.id,
			iter_2_1.num,
			[4] = iter_2_1.time_valid
		})
	end

	return var_2_0
end

function formatReward(arg_3_0)
	if arg_3_0[1] then
		return {
			id = arg_3_0[1],
			num = arg_3_0[2],
			time_valid = arg_3_0[4]
		}
	elseif arg_3_0.id then
		return arg_3_0
	end

	error("传入的reward结构既非{id:number, num:number, timeValid:number}也非number[4]")
end

local function var_0_0(arg_4_0)
	ShowPopItem(POP_ITEM, arg_4_0)
end

function rewardToItemTemplate(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1 or clone(ItemTemplateData)

	var_5_0.id = arg_5_0.id
	var_5_0.number = arg_5_0.num
	var_5_0.timeValid = arg_5_0.time_valid

	if arg_5_2 then
		var_5_0.clickFun = var_0_0
	end

	return var_5_0
end

local var_0_1 = {}

local function var_0_2(arg_6_0)
	local var_6_0 = var_0_1[arg_6_0]

	if var_6_0 == nil then
		function var_6_0(arg_7_0)
			ShowPopItem(arg_6_0, arg_7_0)
		end

		var_0_1[arg_6_0] = var_6_0
	end

	return var_6_0
end

function rewardToPopableItemTemplate(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = rewardToItemTemplate(arg_8_0, arg_8_1)

	var_8_0.clickFun = var_0_2(arg_8_2 or POP_ITEM)

	return var_8_0
end

function getReward(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	if type(arg_9_2) ~= "function" then
		arg_9_2 = nil
	end

	if arg_9_0 and #arg_9_0 > 0 then
		showRewardUI(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	end
end

getReward2 = getReward

function sortMergeGetReward(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	arg_10_0 = mergeReward(arg_10_0)

	sortReward(arg_10_0, true)
	getReward(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
end

function showRewardUI(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = {}
	local var_11_1 = {}
	local var_11_2 = arg_11_2
	local var_11_3 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0) do
		local var_11_4 = ItemWillConvert(iter_11_1) and iter_11_1.convert_from.id or iter_11_1.id
		local var_11_5 = ItemCfg[var_11_4]

		if arg_11_1 ~= nil and #arg_11_1 > 0 and table.indexof(arg_11_1, var_11_5.type) then
			if ItemConst.ITEM_TYPE.WEAPON_SERVANT == var_11_5.type then
				if var_11_5.display_rare > 3 or IllustratedData:GetNewObtainedServant(var_11_4) then
					table.insert(var_11_1, iter_11_1)
				end
			else
				table.insert(var_11_1, iter_11_1)
			end
		end

		if var_11_5.type == 8 and var_11_5.id ~= var_11_5.param[1] then
			function var_11_2()
				if arg_11_2 then
					arg_11_2()
				end

				PlayerAction.RefreshSkinGiftRedPoint()
			end

			table.insert(var_11_1, iter_11_1)
		end

		if var_11_5.type == 21 then
			var_11_3.HasDlc = true
			var_11_3.dlcCfg = var_11_5
		end
	end

	local var_11_6
	local var_11_7 = 0

	for iter_11_2, iter_11_3 in ipairs(arg_11_0) do
		if ItemCfg[iter_11_3.id].sub_type == ItemConst.ITEM_SUB_TYPE.LIMIT_TIME_SKIN_ITEM then
			var_11_6 = iter_11_3
			var_11_7 = var_11_7 + 1
		end
	end

	if var_11_7 == 1 then
		local var_11_8 = deepClone(var_11_2)

		function var_11_2()
			if var_11_8 then
				var_11_8()
			end

			JumpTools.OpenPageByJump("limitTimeSkinUsePop", {
				itemData = var_11_6
			})
		end
	end

	IllustratedData:ConsumeNewObtainedServant()

	if #var_11_1 > 0 then
		local function var_11_9()
			JumpTools.OpenPageByJump("switchHeroReward", {
				list = arg_11_0,
				needShowVitalityBox = needShowVitalityFullBox(),
				needShowEquipBox = needShowBagFullBox(),
				callBack = var_11_2,
				lateCallback = arg_11_3
			})
		end

		local var_11_10 = {
			doNextHandler = var_11_9,
			itemList = var_11_1,
			obtainsParams = var_11_3
		}

		gameContext:Go("obtainView", var_11_10)
	else
		JumpTools.OpenPageByJump("switchHeroReward", {
			list = arg_11_0,
			needShowVitalityBox = needShowVitalityFullBox(),
			needShowEquipBox = needShowBagFullBox(),
			callBack = var_11_2,
			lateCallback = arg_11_3
		})
	end
end

function rewardSortFunc(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.id
	local var_15_1 = arg_15_1.id
	local var_15_2 = ItemCfg[var_15_0]
	local var_15_3 = ItemCfg[var_15_1]
	local var_15_4 = var_15_2.rare
	local var_15_5 = var_15_3.rare

	if var_15_4 ~= var_15_5 then
		return var_15_5 < var_15_4
	end

	local var_15_6 = var_15_2.type
	local var_15_7 = var_15_3.type

	if var_15_6 ~= var_15_7 then
		return var_15_6 < var_15_7
	elseif var_15_6 == ItemConst.ITEM_TYPE.EQUIP then
		local var_15_8 = 0
		local var_15_9 = 0
		local var_15_10 = EquipCfg[var_15_0].starlevel
		local var_15_11 = EquipCfg[var_15_1].starlevel

		if var_15_10 == var_15_11 then
			return var_15_1 < var_15_0
		else
			return var_15_11 < var_15_10
		end
	else
		return var_15_1 < var_15_0
	end
end

function sortReward(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1 and arg_16_0 or clone(arg_16_0)

	table.sort(var_16_0, rewardSortFunc)

	return var_16_0
end

function getItemStar(arg_17_0)
	local var_17_0 = ItemCfg[arg_17_0]
	local var_17_1 = 0

	if var_17_0.type == ItemConst.ITEM_TYPE.EQUIP then
		var_17_1 = EquipCfg[arg_17_0].starlevel
	end

	if var_17_1 > 6 then
		var_17_1 = 6
	end

	return var_17_1
end

function ItemWillConvert(arg_18_0)
	return (nullable(arg_18_0, "convert_from", "id") or 0) ~= 0
end

local function var_0_3(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.id
	local var_19_1 = arg_19_1.num
	local var_19_2 = arg_19_1.time_valid
	local var_19_3 = ItemCfg[var_19_0]

	if var_19_3.type == ItemConst.ITEM_TYPE.EQUIP or var_19_3.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		return false
	elseif var_19_0 ~= arg_19_0.id then
		return false
	elseif var_19_2 ~= arg_19_0.time_valid then
		return false
	elseif ItemWillConvert(arg_19_0) or ItemWillConvert(arg_19_1) then
		return false
	end

	return true
end

function mergeRewardItem(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		if var_0_3(iter_20_1, arg_20_1) then
			iter_20_1.num = arg_20_1.num + iter_20_1.num

			return arg_20_0
		end
	end

	table.insert(arg_20_0, arg_20_1)

	return arg_20_0
end

function mergeRewardList(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_1) do
		mergeRewardItem(arg_21_0, iter_21_1)
	end

	return arg_21_0
end

function mergeReward(arg_22_0)
	return mergeRewardList({}, arg_22_0)
end

mergeReward2 = mergeReward

function IsConditionAchieved(arg_23_0, arg_23_1)
	local var_23_0 = ConditionCfg[arg_23_0]

	if var_23_0 == nil then
		return true, 0, 0
	end

	local var_23_1 = false
	local var_23_2 = 0
	local var_23_3 = var_23_0.params[1]

	if var_23_0.type == 1001 then
		var_23_2 = HeroData:GetHeroData(arg_23_1.heroId).level
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1004 then
		var_23_2 = HeroTools.GetHeroProficiency(arg_23_1.heroId)
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1002 then
		var_23_2 = HeroTools.CountHeroTotalSkilllv(arg_23_1.heroId)
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1003 then
		var_23_2 = HeroData:GetHeroData(arg_23_1.heroId).star / 100
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1024 then
		var_23_2 = HeroData:GetHeroData(arg_23_1.heroId).star
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1005 then
		var_23_2 = #HeroData:GetHeroData(arg_23_1.heroId).unlocked_astrolabe
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1006 then
		local var_23_4 = HeroData:GetHeroData(arg_23_1.heroId)

		var_23_3 = 1

		for iter_23_0, iter_23_1 in pairs(var_23_0.params) do
			if table.keyof(var_23_4.clear_mission_list, iter_23_1) then
				var_23_2 = 1
				var_23_1 = true

				break
			end
		end
	elseif var_23_0.type == 1007 then
		var_23_2 = HeroData:GetHeroData(arg_23_1.heroId).weapon_info.level or 0
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1008 then
		var_23_3 = 1

		local var_23_5 = HeroCfg[arg_23_1.heroId].study_stage[1]

		if BattleTeachData:GetHeroTeachInfo(arg_23_1.heroId, var_23_5) > 0 then
			var_23_2 = 1
			var_23_1 = true
		end
	elseif var_23_0.type == 1009 then
		local var_23_6 = HeroTools.GetExSkillId(arg_23_1.heroId)
		local var_23_7 = HeroTools.GetSkillLv(arg_23_1.heroId, var_23_6)
		local var_23_8 = HeroData:GetHeroData(arg_23_1.heroId)

		var_23_2 = var_23_7 + HeroTools.GetHeroSkillAddLevel(var_23_8, var_23_6)
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1010 then
		var_23_2 = HeroData:GetHeroData(arg_23_1.heroId).break_level
		var_23_3 = var_23_0.params[1]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1011 or var_23_0.type == 5002 then
		local var_23_9 = BattleStageData:GetStageData()[var_23_0.params[1]]

		var_23_2 = var_23_9 and var_23_9.clear_times > 0 and 1 or 0
		var_23_3 = 1
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1012 then
		local var_23_10 = HeroTools.GetHeroOntologyID(arg_23_1.heroId)
		local var_23_11 = ArchiveData:GetArchive(var_23_10).lv

		var_23_1 = var_23_3 <= var_23_11
		var_23_2 = var_23_11
	elseif var_23_0.type == 1013 then
		local var_23_12 = HeroTools.GetHeroOntologyID(arg_23_1.heroId)
		local var_23_13 = HeroRecordCfg[var_23_12].gift_like_id1[1]

		var_23_2 = ArchiveData:GetArchive(var_23_12).gift_list[var_23_13] or 0
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1014 then
		var_23_2 = PlayerData:GetPlayerInfo().userLevel
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1015 then
		local var_23_14 = HeroData:GetHeroData(var_23_0.params[1])

		var_23_2 = var_23_14 and var_23_14.level or 0
		var_23_3 = var_23_0.params[2]
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 1016 then
		local var_23_15 = HeroTools.GetHeroOntologyID(arg_23_1.heroId)
		local var_23_16 = ArchiveData:GetArchive(var_23_15).lv

		var_23_1 = var_23_3 <= var_23_16
		var_23_2 = var_23_16
	elseif var_23_0.type == 1019 then
		local var_23_17 = ArchiveData:GetTrustLevel(arg_23_1.heroId)

		var_23_1 = var_23_3 <= var_23_17
		var_23_2 = var_23_17
	elseif var_23_0.type == 2001 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 2002 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 2003 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 2004 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 2005 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 1

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 2101 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 2201 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 2202 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 2301 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 2401 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 3001 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 3002 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3003 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3004 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 3005 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3006 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3007 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3008 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 3009 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 5001 then
		local var_23_18 = var_23_0.params[1]
		local var_23_19 = HeroTools.GetHeroOntologyID(var_23_18)
		local var_23_20 = HeroRecordCfg[var_23_19].plot_id

		for iter_23_2, iter_23_3 in ipairs(var_23_20) do
			if not ArchiveData:IsStoryRead(var_23_19, iter_23_3) then
				return false
			end
		end

		return true
	elseif var_23_0.type == 1017 then
		var_23_3 = 1

		local var_23_21 = var_23_0.params[1]
		local var_23_22 = var_23_0.params[2]

		if HeroTools.IsSkinUnlock(var_23_21) and HomeSceneSettingData:IsHaveScene(var_23_22) then
			var_23_2 = 1
			var_23_1 = true
		end
	elseif var_23_0.type == 1018 then
		var_23_3 = 1

		local var_23_23 = var_23_0.params[1]

		if HeroTools.IsSkinUnlock(var_23_23) then
			var_23_2 = 1
			var_23_1 = true
		end
	elseif var_23_0.type == 9001 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9002 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9003 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9004 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 9005 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 9011 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9012 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 9013 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9014 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 9015 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 9016 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 9017 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 1101 then
		local var_23_24 = var_23_0.params[1]
		local var_23_25 = var_23_0.params[2]

		var_23_2 = nullable(ShopData.GetGoodInfo(var_23_24, var_23_25), "buy_times") or 0

		return var_23_2 >= var_23_0.params[3], var_23_2, var_23_0.params[3]
	elseif var_23_0.type == 1102 then
		local var_23_26 = var_23_0.params[1]
		local var_23_27 = var_23_0.params[2]

		return TowerData:CheckIsOverStage(var_23_26, var_23_27)
	elseif var_23_0.type == 8013 then
		var_23_2 = CanteenData:GetFurnitureLevel(var_23_0.params[1]) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 8014 then
		var_23_2 = CanteenData:GetCurEarning() or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 8021 then
		local var_23_28 = arg_23_1.heroId
		local var_23_29 = HeroTools.GetHeroOntologyID(var_23_28)
		local var_23_30 = DormRoomTools:GetDormIDViaArchive(var_23_29)

		var_23_2 = DormRoomTools:GetGiftNumByRoomID(var_23_30) or 0
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 8022 then
		local var_23_31 = arg_23_1.heroId
		local var_23_32 = HeroTools.GetHeroOntologyID(var_23_31)

		var_23_2 = DormHeroTools:GetDormLevelByHeroID(var_23_32)
		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 8023 then
		local var_23_33 = arg_23_1.heroId
		local var_23_34 = DormData:GetHeroTemplateInfo(var_23_33)

		if var_23_34 then
			var_23_2 = var_23_34:GetHeroTotalFeedTime() or 0
		else
			var_23_2 = 0
		end

		var_23_1 = var_23_3 <= var_23_2
	elseif var_23_0.type == 8101 then
		var_23_2 = DormRoomTools:GetUnlockRoomNum() or 0

		return var_23_2 >= var_23_0.params[1], var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 5003 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[3], var_23_2, var_23_0.params[3]
	elseif var_23_0.type == 11200 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 > 0, var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 11201 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 > 0, var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 11202 then
		var_23_2 = ActivityData:GetActivityIsOpen(var_23_0.params[1]) and 1 or 0

		return var_23_2 > 0, var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 11203 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 11204 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 > 0, var_23_2, var_23_0.params[1]
	elseif var_23_0.type == 11205 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 > 0, var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 11206 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= var_23_0.params[2], var_23_2, var_23_0.params[2]
	elseif var_23_0.type == 11501 then
		var_23_2 = HistoryData:GetHistoryData(var_23_0.id) or 0

		return var_23_2 >= 1, var_23_2, 1
	elseif var_23_0.type == 11503 then
		var_23_2 = ActivityRhythmGameData:GetStageDataList()
		var_23_3 = var_23_0.params[1]

		local var_23_35 = false

		for iter_23_4, iter_23_5 in pairs(var_23_2) do
			if iter_23_4 == var_23_3 then
				var_23_35 = true

				break
			end
		end

		var_23_1 = var_23_35
	elseif var_23_0.type == 11502 then
		local var_23_36 = MonsterCosplayData:GetDataByPara("monsterData")
		local var_23_37 = false

		for iter_23_6, iter_23_7 in pairs(var_23_36) do
			if iter_23_7.finishedStage[var_23_0.params[1]] then
				var_23_37 = true
			end
		end

		return var_23_37, var_23_2, 1
	elseif var_23_0.type == 12001 then
		local var_23_38 = var_23_0.params

		var_23_2 = ChallengeRogueTeamData:GetHistoryDifficultyClearCnt(var_23_38[1], var_23_38[2])

		return var_23_2 >= var_23_38[3], var_23_2, var_23_38[3]
	elseif var_23_0.type == 12002 then
		return ChallengeRogueTeamData:GetHistoryEndingPassCnt(arg_23_1[1], arg_23_1[2]) >= arg_23_1[2]
	elseif var_23_0.type == 12101 then
		return WeekBossData:GetBossConsumeHp() / WeekBossData:GetBossTotalHp() * 100 >= var_23_0.params[1]
	elseif var_23_0.type == 12102 then
		return GodEaterData.hubLv >= var_23_0.params[1]
	end

	return var_23_1, var_23_2, var_23_3
end

function GetConditionProgressText(arg_24_0, arg_24_1, arg_24_2)
	if ConditionCfg[arg_24_0].progress_show == 1 then
		return string.format("%s/%s", arg_24_1, arg_24_2)
	else
		return ""
	end
end

function isMeetAllCondition(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0) do
		if not isMeetCondition(iter_25_1) then
			return false
		end
	end

	return true
end

function isMeetCondition(arg_26_0)
	if arg_26_0[1] == 101 then
		return ChapterTools.IsClearStage(arg_26_0[2])
	elseif arg_26_0[1] == 102 then
		local var_26_0 = arg_26_0[2]

		return ChapterTools.IsClearChapter(var_26_0)
	else
		return false
	end
end

function getConditionText(arg_27_0)
	if arg_27_0[1] == 101 then
		local var_27_0 = arg_27_0[2]
		local var_27_1 = getChapterIDByStageID(var_27_0)
		local var_27_2 = BattleStageTools.GetStageCfg(ChapterCfg[var_27_1].type, var_27_0)

		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(var_27_2.name))
	elseif arg_27_0[1] == 102 then
		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(ChapterCfg[arg_27_0[2]].subhead))
	else
		return ""
	end
end

function needShowBagFullBox()
	if EquipData:GetEquipBagFull() then
		EquipAction.EquipBagFull(false)

		return true
	end

	return false
end

function isBagFull(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0) do
		if ItemCfg[iter_29_1[1]].type == ItemConst.ITEM_TYPE.EQUIP and EquipTools.GetEquipNum() >= GameSetting.max_equip.value[1] then
			return true
		end
	end

	return false
end

function showEquipSendMail(arg_30_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("EQUIP_SEND_MAIL"),
		OkCallback = function()
			if arg_30_0 then
				arg_30_0()
			end
		end
	})
end

function showBagFullBox()
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("EQUIP_NUM_MAX"),
		OkCallback = function()
			JumpTools.GoToSystem("/bag", {
				type = "equip"
			}, ViewConst.SYSTEM_ID.BAG)
		end
	})
end

function needShowVitalityFullBox()
	if CurrencyData:GetVitalityFull() then
		ActionCreators.VitalityFull(false)

		return true
	end

	return false
end

function isVitalityFull()
	return ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY) >= ItemCfg[CurrencyConst.CURRENCY_TYPE_VITALITY].max
end

function showVitalitySendMail(arg_36_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("VITALITY_FULL"),
		OkCallback = function()
			if arg_36_0 then
				arg_36_0()
			end
		end
	})
end

function canAddVitalityByProp(arg_38_0)
	if table.keyof(GameSetting.vitality_exchange_id_list.value, arg_38_0) then
		return not isVitalityFull()
	else
		return true
	end
end

function hasVitalityProp()
	for iter_39_0, iter_39_1 in ipairs(GameSetting.vitality_exchange_id_list.value) do
		if ItemTools.getItemNum(iter_39_1) > 0 then
			return true
		end
	end

	return false
end

function isOpenMission(arg_40_0)
	local var_40_0 = BattleStageData:GetStageData()
	local var_40_1 = getChapterIDByStageID(arg_40_0)

	if ChapterTools.IsFinishPreChapter(var_40_1) and var_40_0[arg_40_0] then
		if arg_40_0 == GameSetting.travel_skuld_new_ending_stage_id.value[1] and var_40_0[arg_40_0].clear_times < 1 then
			return false
		end

		return true
	end

	return false
end

function getMaxOpenSection(arg_41_0)
	local var_41_0 = getChapterIDByStageID(arg_41_0)

	if isOpenMission(arg_41_0) then
		return arg_41_0, var_41_0
	end

	for iter_41_0 = ChapterCfg[var_41_0].difficulty, 1, -1 do
		local var_41_1 = getChapterListByDifficulty(BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT, iter_41_0)

		for iter_41_1 = table.keyof(var_41_1, var_41_0), 1, -1 do
			local var_41_2 = ChapterCfg[var_41_1[iter_41_1]]

			for iter_41_2 = table.keyof(var_41_2.section_id_list, arg_41_0) or #var_41_2.section_id_list, 1, -1 do
				local var_41_3 = var_41_2.section_id_list[iter_41_2]

				if isOpenMission(var_41_3) then
					return var_41_3, var_41_1[iter_41_1]
				end
			end
		end
	end

	return arg_41_0, var_41_0
end

function getHeroAffixs(arg_42_0)
	if type(arg_42_0) ~= "table" then
		return {}
	end

	local var_42_0 = {}

	for iter_42_0, iter_42_1 in pairs(arg_42_0) do
		if iter_42_1[3] and iter_42_1[3] == 3 then
			table.insert(var_42_0, iter_42_1)
		end
	end

	return var_42_0
end

function getMosterAffix(arg_43_0)
	if type(arg_43_0) ~= "table" then
		return {}
	end

	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0) do
		if iter_43_1[3] and iter_43_1[3] ~= 3 then
			table.insert(var_43_0, iter_43_1)
		end
	end

	return var_43_0
end

function getAffixName(arg_44_0)
	local var_44_0 = arg_44_0[1]

	if var_44_0 == nil then
		return ""
	end

	local var_44_1 = AffixTypeCfg[var_44_0]

	if var_44_1 == nil then
		-- block empty
	end

	return GetI18NText(var_44_1.name)
end

function getAffixDesc(arg_45_0)
	local var_45_0 = arg_45_0[1]
	local var_45_1 = arg_45_0[2]
	local var_45_2 = ""

	if var_45_0 == nil then
		return var_45_2
	end

	local var_45_3 = {}
	local var_45_4 = AffixTypeCfg[var_45_0]

	if var_45_4 == nil then
		-- block empty
	end

	local var_45_5 = GetCfgDescription(var_45_4.description[1], var_45_1)

	return GetI18NText(var_45_5)
end

function getAffixSprite(arg_46_0)
	local var_46_0 = arg_46_0[1]

	if var_46_0 == nil then
		return ""
	end

	local var_46_1 = AffixTypeCfg[var_46_0]

	if var_46_1 == nil then
		-- block empty
	end

	local var_46_2 = PublicBuffCfg[var_46_1.affix_buff_id].icon

	if var_46_2 == "" then
		-- block empty
	end

	return getSpriteWithoutAtlas(SpritePathCfg.AffixIcon.path .. var_46_2)
end

function getEquipSkillSprite(arg_47_0)
	if arg_47_0 == nil then
		return ""
	end

	local var_47_0 = EquipSkillCfg[arg_47_0]

	if var_47_0 == nil then
		-- block empty
	end

	local var_47_1 = var_47_0.icon

	return getSpriteWithoutAtlas("TextureConfig/Equip/EquipSkillIcon/" .. var_47_1)
end

function getAttributeAffix(arg_48_0, arg_48_1)
	local var_48_0 = clone(EquipBreakThroughMaterialItemCfg[arg_48_0].params)
	local var_48_1 = PublicBuffCfg[AffixTypeCfg[var_48_0[1]].buffid[1]]

	if arg_48_1 > var_48_1.max_level then
		var_48_0[2] = var_48_1.max_level
	else
		var_48_0[2] = arg_48_1
	end

	return var_48_0
end

function getAttributeAffixValue(arg_49_0, arg_49_1)
	local var_49_0 = clone(EquipBreakThroughMaterialItemCfg[arg_49_0].params)
	local var_49_1 = PublicBuffCfg[AffixTypeCfg[var_49_0[1]].buffid[1]]

	if arg_49_1 > var_49_1.max_level then
		arg_49_1 = var_49_1.max_level
	end

	return var_49_1.buffparam_base[2] + var_49_1.buffparam_factor[2] * (arg_49_1 - 1)
end

function MergeActivityID(arg_50_0, arg_50_1)
	if arg_50_0 then
		local var_50_0 = ActivityCfg[arg_50_0]

		if var_50_0 and var_50_0.activity_template == ActivityTemplateConst.STORY_STAGE then
			for iter_50_0, iter_50_1 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STORY]) do
				if table.keyof(ActivityCfg[iter_50_1].sub_activity_list, arg_50_0) then
					return iter_50_1
				end
			end
		elseif var_50_0 and var_50_0.activity_template == ActivityTemplateConst.ACTIVITY_AFFIX_SELECT_SUBMODULE then
			for iter_50_2, iter_50_3 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_AFFIX_SELECT]) do
				if table.keyof(ActivityCfg[iter_50_3].sub_activity_list, arg_50_0) then
					return iter_50_3
				end
			end
		end
	end

	return arg_50_0
end

function GetTrialHeroList(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or arg_51_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT then
		local var_51_0 = getChapterIDByStageID(arg_51_1)
		local var_51_1 = ChapterCfg[var_51_0]
		local var_51_2 = var_51_1.activity_id

		if var_51_2 ~= 0 and ActivityTools.GetActivityStatus(var_51_2) ~= 1 then
			return {}
		end

		return type(var_51_1.trial_list) == "table" and var_51_1.trial_list or {}
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS then
		if GetChessLevelIDByStageID(arg_51_1) then
			local var_51_3 = WarchessLevelCfg[GetChessLevelIDByStageID(arg_51_1)]

			return type(var_51_3.trial_list) == "table" and var_51_3.trial_list or {}
		else
			return {}
		end
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS then
		local var_51_4 = {}
		local var_51_5 = NewWarChessData:GetHeroInfoList()

		for iter_51_0, iter_51_1 in pairs(var_51_5) do
			if iter_51_1[2] > 0 then
				table.insert(var_51_4, NewWarChessHeroCfg[iter_51_1[1]].temp_id)
			end
		end

		return var_51_4
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON then
		local var_51_6 = SoloHeartDemonData:GetDataByPara("openEditor")
		local var_51_7 = SoloHeartDemonCfg[var_51_6]

		if SoloHeartDemonData:GetDataByPara("stageToDifficulty")[arg_51_1] < 3 then
			return var_51_7.trial_hero
		end

		return {}
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.AREA_BATTLE then
		return ActivityAreaBattleCfg[arg_51_2].hero
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.MULT_HEART_DEMON then
		return MultHeartDemonCfg[MultHeartDemonCfg.get_id_list_by_activity_id[arg_51_2][1]].trial_hero
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME then
		local var_51_8 = DestroyBoxGameCfg.get_id_list_by_activity_id[arg_51_2][1]
		local var_51_9 = DestroyBoxGameCfg[var_51_8].main_activity_id
		local var_51_10 = DestroyBoxGameData:GetSelectID(var_51_9)

		return DestroyBoxGameCfg[var_51_10].trial_hero
	end

	if arg_51_0 == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		return ChallengeRogueTeamData:GetTrialHeroList()
	end

	local var_51_11 = GetHeroTeamActivityID(arg_51_0, arg_51_2, true)

	return BattleTeamData:GetHeroTrial(var_51_11) or {}
end

function SetHeroTeam(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4, arg_52_5, arg_52_6, arg_52_7, arg_52_8)
	local var_52_0 = ReserveParams.New(nil, arg_52_7, arg_52_8, {
		stageType = arg_52_0,
		stageID = arg_52_1,
		activityID = arg_52_2
	})
	local var_52_1 = arg_52_6.mimir_id or 0
	local var_52_2 = arg_52_6.chip_list or {}

	ReserveTools.SetTeam(var_52_0, arg_52_3, arg_52_4, arg_52_5, var_52_1, var_52_2)
end

function GetHeroTeamActivityID(arg_53_0, arg_53_1, arg_53_2)
	if arg_53_0 == BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON then
		if DemonChallengeCfg[arg_53_1] then
			return DemonChallengeCfg[arg_53_1].activity_id
		else
			return arg_53_1
		end
	elseif arg_53_1 and arg_53_1 ~= 0 then
		return arg_53_2 and arg_53_1 or MergeActivityID(arg_53_1)
	elseif arg_53_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or arg_53_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE or arg_53_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or arg_53_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE or arg_53_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE or arg_53_0 == BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL or arg_53_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY or arg_53_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY_SP or arg_53_0 == BattleConst.STAGE_TYPE_NEW.SURVIVE_SOLO or arg_53_0 == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		return arg_53_0
	else
		return 0
	end
end

function GetLocalHeroTeam(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	local var_54_0 = {
		0,
		0,
		0
	}
	local var_54_1 = {
		false,
		false,
		false
	}
	local var_54_2 = {}
	local var_54_3 = {
		0,
		0,
		0
	}
	local var_54_4 = false

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_54_0 then
		var_54_0 = MatrixData:GetMatrixBattleHeroTeam()

		local var_54_5 = not MatrixData:GetCanChangeCaptain()

		var_54_1 = {
			var_54_5,
			var_54_5,
			var_54_5
		}
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == arg_54_0 then
		var_54_0 = ActivityMatrixData:GetMatrixBattleHeroTeam(arg_54_2)

		local var_54_6 = not ActivityMatrixData:GetCanChangeCaptain(arg_54_2)

		var_54_1 = {
			var_54_6,
			var_54_6,
			var_54_6
		}
	elseif BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX == arg_54_0 then
		var_54_0 = StrategyMatrixData:GetMatrixBattleHeroTeam(arg_54_2)

		local var_54_7 = not StrategyMatrixData:GetCanChangeCaptain(arg_54_2)

		var_54_1 = {
			var_54_7,
			var_54_7,
			var_54_7
		}
	else
		local var_54_8 = ReserveParams.New(nil, arg_54_3, arg_54_4, {
			stageType = arg_54_0,
			stageID = arg_54_1,
			activityID = arg_54_2
		})

		return ReserveTools.GetHeroList(var_54_8)
	end

	return var_54_0, var_54_1, var_54_2, var_54_3, var_54_4
end

function getShopCfg(arg_55_0)
	return ShopCfg[arg_55_0]
end

function getGoodListByGiveID(arg_56_0)
	return ShopCfg.get_id_list_by_give_id[arg_56_0] or {}
end

function getShopIDListByShopID(arg_57_0)
	return ShopCfg.get_id_list_by_shop_id[arg_57_0] or {}
end

function getShopIDListByCurrency(arg_58_0)
	return ShopCfg.get_id_list_by_cost_id[arg_58_0] or {}
end

_G.SceneDataForExcehangeVar = nil

function GetSceneDataForExcehange()
	if _G.SceneDataForExcehangeVar == nil then
		_G.SceneDataForExcehangeVar = SceneDataForExcehange.New()
	end

	return _G.SceneDataForExcehangeVar
end

function ResetSceneDataForExcehange()
	_G.SceneDataForExcehangeVar = SceneDataForExcehange.New()
end

function TryToStartBattle()
	SetForceShowQuanquan(true)
	LuaExchangeHelper.Launcher(GetSceneDataForExcehange(), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)
end

_G.ChessDataForExcehangeVar = nil

function GetChessDataForExcehange()
	if _G.ChessDataForExcehangeVar == nil then
		_G.ChessDataForExcehangeVar = ChessDataForExchange.New()
	end

	return _G.ChessDataForExcehangeVar
end

function ResetChessDataForExcehange()
	_G.ChessDataForExcehangeVar = ChessDataForExchange.New()
end

function StartChessBattleMode()
	SetForceShowQuanquan(true)
	ChessLuaBridge.Launcher(GetChessDataForExcehange(), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)

	_G.ChessDataForExcehangeVar = nil
end

_G.NewChessDataForExcehangeVar = nil

function GetNewChessDataForExcehange()
	if _G.NewChessDataForExcehangeVar == nil then
		_G.NewChessDataForExcehangeVar = NewChessDataForExchange.New()
	end

	return _G.NewChessDataForExcehangeVar
end

function ResetNewChessDataForExcehange()
	_G.NewChessDataForExcehangeVar = NewChessDataForExchange.New()
end

function StartNewChessBattleMode()
	SetForceShowQuanquan(true)
	NewChessLuaBridge.Launcher(GetNewChessDataForExcehange(), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)

	_G.NewChessDataForExcehangeVar = nil
end

_G.ChessBoardDataForExcehangeVar = nil

function GetChessBoardDataForExcehange()
	if _G.ChessBoardDataForExcehangeVar == nil then
		_G.ChessBoardDataForExcehangeVar = ChessBoardDataForExchange.New()
	end

	return _G.ChessBoardDataForExcehangeVar
end

function StartChessBoardBattleMode()
	SetForceShowQuanquan(true)
	ChessBoardLuaBridge.Launcher(GetChessBoardDataForExcehange(), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)

	_G.ChessBoardDataForExcehangeVar = nil
end

_G.MusicDataForExchangeVar = nil

function GetMusicDataForExchange()
	if _G.MusicDataForExchangeVar == nil then
		_G.MusicDataForExchangeVar = MusicDataForExchange.New()
	end

	return _G.MusicDataForExchangeVar
end

function StartMusicMode()
	DestroyLua()
	MusicLuaBridge.Launcher(GetMusicDataForExchange())
end

_G.MusicDataForExchangeVar2 = nil

function GetMusicDataForExchange2()
	if _G.MusicDataForExchangeVar2 == nil then
		_G.MusicDataForExchangeVar2 = MusicDataForExchange2.New()
	end

	return _G.MusicDataForExchangeVar2
end

function StartMusicMode2()
	DestroyLua()
	MusicLuaBridge2.Launcher(GetMusicDataForExchange2())
end

_G.ZumaDataForExchangeVar = nil

function GetZumaDataForExchange()
	if _G.ZumaDataForExchangeVar == nil then
		_G.ZumaDataForExchangeVar = ZumaDataForExchange.New()
	end

	return _G.ZumaDataForExchangeVar
end

_G.DormDataForExcehangeVar = nil

function GetDormDataForExcehange()
	if _G.DormDataForExcehangeVar == nil then
		_G.DormDataForExcehangeVar = DormDataForExchange.New()
	end

	return _G.DormDataForExcehangeVar
end

function ResetDormDataForExcehange()
	_G.DormDataForExcehangeVar = DormDataForExchange.New()
end

function StartDormMode(arg_81_0)
	SetForceShowQuanquan(true)
	DormLuaBridge.Launcher(arg_81_0 or GetDormDataForExcehange(), function()
		SetForceShowQuanquan(false)
		DestroyLua()
	end)

	_G.DormDataForExcehangeVar = nil
end

_G.GuildActivityDataForExchangeVar = nil

function GetGuildActivityDataForExchange(arg_83_0, arg_83_1)
	if _G.GuildActivityDataForExchangeVar == nil then
		_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
	end

	if arg_83_0 ~= nil and arg_83_0 > 0 then
		_G.GuildActivityDataForExchangeVar.nodeId = arg_83_0
		_G.GuildActivityDataForExchangeVar.level = arg_83_1
	else
		_G.GuildActivityDataForExchangeVar.nodeId = 11001
		_G.GuildActivityDataForExchangeVar.level = 1
	end

	return _G.GuildActivityDataForExchangeVar
end

function ResetGuildActivityDataForExchange()
	_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
end

function StartGuildActivity(arg_85_0)
	SetForceShowQuanquan(true)

	local var_85_0

	if arg_85_0 ~= nil and arg_85_0 > 0 then
		local var_85_1 = ActivityClubCfg[arg_85_0].map_id

		var_85_0 = table.indexof(ActivityClubMapCfg.all, var_85_1)
	else
		var_85_0 = 1
	end

	GuildActivityLuaBridge.Launcher(GetGuildActivityDataForExchange(arg_85_0, var_85_0), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		manager.windowBar:SetWhereTag("guildActivity")
		DestroyLua()
		gameContext:SetSystemLayer("guildActivity")
	end, function()
		manager.uiInit()
		GuildActivityAction.EnterGuildWarField(function()
			JumpTools.OpenPageByJump("/guildActivityWarField", {
				activityID = ActivityConst.GUILD_ACTIVITY_START,
				level = var_85_0
			})
			GuildActivityLuaBridge.StartGuildActivity(arg_85_0)
		end)
	end)

	_G.GuildActivityDataForExchangeVar = nil
end

_G.GuildActivitySPDataForExchangeVar = nil

function GetGuildSPActivityDataForExchange(arg_89_0, arg_89_1)
	if _G.GuildActivitySPDataForExchangeVar == nil then
		_G.GuildActivitySPDataForExchangeVar = GuildActivitySPDataForExchange.New()
	end

	if arg_89_0 ~= nil and arg_89_0 > 0 then
		_G.GuildActivitySPDataForExchangeVar.nodeId = arg_89_0
		_G.GuildActivitySPDataForExchangeVar.level = arg_89_1
		_G.GuildActivitySPDataForExchangeVar.activityID = GuildActivitySPData:GetCurMainActivityID()
	else
		_G.GuildActivitySPDataForExchangeVar.nodeId = 11001
		_G.GuildActivitySPDataForExchangeVar.level = 1
		_G.GuildActivitySPDataForExchangeVar.activityID = ActivityConst.GUILD_ACTIVITY_SP_2_4
	end

	return _G.GuildActivitySPDataForExchangeVar
end

function ResetGuildActivitySPDataForExchange()
	_G.GuildActivitySPDataForExchangeVar = GuildActivitySPDataForExchange.New()
end

function StartGuildActivitySP(arg_91_0)
	SetForceShowQuanquan(true)

	local var_91_0

	if arg_91_0 ~= nil and arg_91_0 > 0 then
		local var_91_1 = ActivityClubSPCfg[arg_91_0].map_id
		local var_91_2 = GuildActivitySPData:GetCurRunActivityID()
		local var_91_3 = ActivityClubSPMapCfg.get_id_list_by_activity[var_91_2]

		var_91_0 = table.indexof(var_91_3, var_91_1)
	else
		var_91_0 = 1
	end

	if type(var_91_0) ~= "number" then
		SetForceShowQuanquan(false)
		print("未找到当前点位对应的地图索引,节点id为" .. arg_91_0)

		return
	end

	GuildActivitySPLuaBridge.Launcher(GetGuildSPActivityDataForExchange(arg_91_0, var_91_0), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		manager.windowBar:SetWhereTag("guildActivitySP")
		DestroyLua()
		gameContext:SetSystemLayer("guildActivitySP")
	end, function()
		manager.uiInit()
		GuildActivitySPAction.EnterGuildWarField(function()
			GuildActivitySPLuaBridge.StartGuildActivity(arg_91_0)

			local var_94_0 = GuildActivitySPData:GetCurRunActivityID()

			JumpTools.OpenPageByJump("/guildActivitySPWarField", {
				nodeID = arg_91_0,
				activityID = var_94_0,
				level = var_91_0,
				totalActivityID = var_94_0
			})
		end)
	end)

	_G.GuildActivitySPDataForExchangeVar = nil
end

function StartCaptureGameMode(arg_95_0)
	SetForceShowQuanquan(true)
	Capture.Runtime.CaptureGameLuaBridge.Launcher(arg_95_0, function()
		SetForceShowQuanquan(false)
		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)
end

function getRewardFromDropCfg(arg_97_0, arg_97_1)
	if arg_97_0 == nil then
		return {}
	end

	local var_97_0 = DropCfg[arg_97_0]

	if arg_97_0 == 0 then
		return {}
	end

	if var_97_0 == nil then
		return {}
	end

	local var_97_1 = {}

	if arg_97_1 and #var_97_0.base_drop >= 1 then
		if var_97_0.base_drop ~= "" then
			for iter_97_0, iter_97_1 in pairs(var_97_0.base_drop) do
				table.insert(var_97_1, formatReward(iter_97_1))
			end
		end
	else
		if var_97_0.random_drop ~= "" then
			for iter_97_2, iter_97_3 in pairs(var_97_0.random_drop) do
				table.insert(var_97_1, formatReward(iter_97_3))
			end
		end

		if var_97_0.weight_drop ~= "" then
			for iter_97_4, iter_97_5 in pairs(var_97_0.weight_drop) do
				table.insert(var_97_1, formatReward(iter_97_5))
			end
		end
	end

	local var_97_2 = mergeReward(var_97_1)

	return (sortReward(var_97_2))
end

function checkGold(arg_98_0, arg_98_1)
	if arg_98_1 == nil then
		arg_98_1 = true
	end

	if arg_98_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) then
		if arg_98_1 then
			local var_98_0 = false
			local var_98_1 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.PROPS_BOND]

			for iter_98_0, iter_98_1 in ipairs(var_98_1 or {}) do
				if ItemTools.getItemNum(iter_98_1) > 0 then
					var_98_0 = true

					break
				end
			end

			if CurrencyData:GetGoldBuyTimes() >= GameSetting.coin_max_buy_time.value[1] and not var_98_0 then
				ShowTips("ERROR_ITEM_NOT_ENOUGH_GOLD")
			else
				JumpTools.OpenPopUp("currencyBuyGold")
			end
		end

		return false
	end

	return true
end

function checkMaterial(arg_99_0, arg_99_1)
	if arg_99_0 == nil then
		arg_99_0 = {}
	end

	if arg_99_1 == nil then
		arg_99_1 = true
	end

	for iter_99_0, iter_99_1 in ipairs(arg_99_0) do
		local var_99_0 = iter_99_1[1]

		if iter_99_1[2] > ItemTools.getItemNum(var_99_0) then
			if arg_99_1 then
				ShowPopItem(POP_SOURCE_ITEM, {
					var_99_0
				})
			end

			return false
		end
	end

	return true
end

function checkMoney(arg_100_0, arg_100_1)
	if arg_100_1 == nil then
		arg_100_1 = true
	end

	if arg_100_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND) then
		if arg_100_1 then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_DIAMOND")
		end

		return false
	end

	return true
end

function checkVitality(arg_101_0, arg_101_1)
	if arg_101_1 == nil then
		arg_101_1 = true
	end

	if arg_101_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY) then
		if arg_101_1 then
			if CurrencyData:GetFatigueBuyTimes() < GameSetting.fatigue_max_buy_time.value[1] then
				JumpTools.OpenPopUp("currencyBuyFatigue")
			else
				ShowTips("ERROR_ITEM_NOT_ENOUGH_FATIGUE")
			end
		end

		return false
	end

	return true
end

function setTextColor(arg_102_0, arg_102_1, arg_102_2, arg_102_3, arg_102_4)
	local var_102_0 = "<color=#%s>" .. arg_102_2 .. "</color>"
	local var_102_1

	arg_102_4 = arg_102_4 or function(arg_103_0, arg_103_1)
		return arg_103_0 <= arg_103_1
	end

	if arg_102_4(arg_102_2, arg_102_3) then
		var_102_1 = string.format(var_102_0, arg_102_0)
	else
		var_102_1 = string.format(var_102_0, arg_102_1)
	end

	return var_102_1
end

function GetServerTime()
	return manager.time:GetServerTime()
end

function formatText(arg_105_0)
	arg_105_0 = GetI18NText(arg_105_0)

	return (string.gsub(arg_105_0, "#{(%w+)}#", function(arg_106_0)
		if arg_106_0 == "nickname" then
			return PlayerData:GetPlayerInfo().nick
		else
			return arg_106_0
		end
	end))
end

function GetMonsterName(arg_107_0)
	local var_107_0

	if type(arg_107_0) ~= "table" then
		return var_107_0
	end

	for iter_107_0, iter_107_1 in pairs(arg_107_0) do
		if var_107_0 == nil then
			var_107_0 = GetI18NText(CharactorParamCfg[iter_107_1].Name)
		elseif SDKTools.GetIsOverSea() then
			var_107_0 = var_107_0 .. "& " .. GetI18NText(CharactorParamCfg[iter_107_1].Name)
		else
			var_107_0 = var_107_0 .. "&" .. string.match(GetI18NText(CharactorParamCfg[iter_107_1].Name), "<.*>")
		end
	end

	return var_107_0
end

function GetMonsterSkillDesList(arg_108_0)
	local var_108_0 = {}

	if type(arg_108_0) ~= "table" then
		return var_108_0
	end

	for iter_108_0, iter_108_1 in pairs(arg_108_0) do
		for iter_108_2 = 1, 6 do
			if string.len(MonsterCfg[iter_108_1]["skill" .. iter_108_2]) ~= 0 then
				table.insert(var_108_0, {
					name = MonsterCfg[iter_108_1]["skill" .. iter_108_2],
					info = MonsterCfg[iter_108_1]["skill_desc" .. iter_108_2]
				})
			end
		end
	end

	return var_108_0
end

function SetFile(arg_109_0, arg_109_1, arg_109_2, arg_109_3)
	local var_109_0 = arg_109_2
	local var_109_1 = PlayerPrefs.GetString("naive_angle_mode_key", "naive")
	local var_109_2

	for iter_109_0 in string.gmatch(arg_109_2, "[^/]+$") do
		var_109_2 = iter_109_0
	end

	local var_109_3 = VideoTrackCfg[var_109_2]

	if var_109_1 ~= "" and var_109_3 and var_109_3.has_non_native == 1 then
		var_109_0 = string.gsub(var_109_0, ".usm", "_alt.usm")
	end

	if not arg_109_3 then
		arg_109_0:SetFile(arg_109_1, var_109_0)
	else
		arg_109_0:SetFile(arg_109_1, var_109_0, arg_109_3)
	end
end

function ColorToHex(arg_110_0)
	local function var_110_0(arg_111_0)
		return string.format("%02X", arg_111_0)
	end

	return var_110_0(math.floor(arg_110_0.r * 255)) .. var_110_0(math.floor(arg_110_0.g * 255)) .. var_110_0(math.floor(arg_110_0.b * 255))
end
