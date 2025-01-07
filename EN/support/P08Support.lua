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

function rewardToItemTemplate(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1 or clone(ItemTemplateData)

	var_4_0.id = arg_4_0.id
	var_4_0.number = arg_4_0.num
	var_4_0.timeValid = arg_4_0.time_valid

	return var_4_0
end

local var_0_0 = {}

local function var_0_1(arg_5_0)
	local var_5_0 = var_0_0[arg_5_0]

	if var_5_0 == nil then
		function var_5_0(arg_6_0)
			ShowPopItem(arg_5_0, arg_6_0)
		end

		var_0_0[arg_5_0] = var_5_0
	end

	return var_5_0
end

function rewardToPopableItemTemplate(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = rewardToItemTemplate(arg_7_0, arg_7_1)

	var_7_0.clickFun = var_0_1(arg_7_2 or POP_ITEM)

	return var_7_0
end

function getReward(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	if type(arg_8_2) ~= "function" then
		arg_8_2 = nil
	end

	if arg_8_0 and #arg_8_0 > 0 then
		showRewardUI(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	end
end

getReward2 = getReward

function sortMergeGetReward(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	arg_9_0 = mergeReward(arg_9_0)

	sortReward(arg_9_0, true)
	getReward(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
end

function showRewardUI(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = {}
	local var_10_1 = {}
	local var_10_2 = arg_10_2
	local var_10_3 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		local var_10_4 = ItemWillConvert(iter_10_1) and iter_10_1.convert_from.id or iter_10_1.id
		local var_10_5 = ItemCfg[var_10_4]

		if arg_10_1 ~= nil and #arg_10_1 > 0 and table.indexof(arg_10_1, var_10_5.type) then
			if ItemConst.ITEM_TYPE.WEAPON_SERVANT == var_10_5.type then
				if var_10_5.display_rare > 3 or IllustratedData:GetNewObtainedServant(var_10_4) then
					table.insert(var_10_1, iter_10_1)
				end
			else
				table.insert(var_10_1, iter_10_1)
			end
		end

		if var_10_5.type == 8 and var_10_5.id ~= var_10_5.param[1] then
			function var_10_2()
				if arg_10_2 then
					arg_10_2()
				end

				PlayerAction.RefreshSkinGiftRedPoint()
			end

			table.insert(var_10_1, iter_10_1)
		end

		if var_10_5.type == 21 then
			var_10_3.HasDlc = true
			var_10_3.dlcCfg = var_10_5
		end
	end

	local var_10_6
	local var_10_7 = 0

	for iter_10_2, iter_10_3 in ipairs(arg_10_0) do
		if ItemCfg[iter_10_3.id].sub_type == ItemConst.ITEM_SUB_TYPE.LIMIT_TIME_SKIN_ITEM then
			var_10_6 = iter_10_3
			var_10_7 = var_10_7 + 1
		end
	end

	if var_10_7 == 1 then
		local var_10_8 = deepClone(var_10_2)

		function var_10_2()
			if var_10_8 then
				var_10_8()
			end

			JumpTools.OpenPageByJump("limitTimeSkinUsePop", {
				itemData = var_10_6
			})
		end
	end

	IllustratedData:ConsumeNewObtainedServant()

	if #var_10_1 > 0 then
		local function var_10_9()
			JumpTools.OpenPageByJump("switchHeroReward", {
				list = arg_10_0,
				needShowVitalityBox = needShowVitalityFullBox(),
				needShowEquipBox = needShowBagFullBox(),
				callBack = var_10_2,
				lateCallback = arg_10_3
			})
		end

		local var_10_10 = {
			doNextHandler = var_10_9,
			itemList = var_10_1,
			obtainsParams = var_10_3
		}

		gameContext:Go("obtainView", var_10_10)
	else
		JumpTools.OpenPageByJump("switchHeroReward", {
			list = arg_10_0,
			needShowVitalityBox = needShowVitalityFullBox(),
			needShowEquipBox = needShowBagFullBox(),
			callBack = var_10_2,
			lateCallback = arg_10_3
		})
	end
end

function rewardSortFunc(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.id
	local var_14_1 = arg_14_1.id
	local var_14_2 = ItemCfg[var_14_0]
	local var_14_3 = ItemCfg[var_14_1]
	local var_14_4 = var_14_2.rare
	local var_14_5 = var_14_3.rare

	if var_14_4 ~= var_14_5 then
		return var_14_5 < var_14_4
	end

	local var_14_6 = var_14_2.type
	local var_14_7 = var_14_3.type

	if var_14_6 ~= var_14_7 then
		return var_14_6 < var_14_7
	elseif var_14_6 == ItemConst.ITEM_TYPE.EQUIP then
		local var_14_8 = 0
		local var_14_9 = 0
		local var_14_10 = EquipCfg[var_14_0].starlevel
		local var_14_11 = EquipCfg[var_14_1].starlevel

		if var_14_10 == var_14_11 then
			return var_14_1 < var_14_0
		else
			return var_14_11 < var_14_10
		end
	else
		return var_14_1 < var_14_0
	end
end

function sortReward(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 and arg_15_0 or clone(arg_15_0)

	table.sort(var_15_0, rewardSortFunc)

	return var_15_0
end

function getItemStar(arg_16_0)
	local var_16_0 = ItemCfg[arg_16_0]
	local var_16_1 = 0

	if var_16_0.type == ItemConst.ITEM_TYPE.EQUIP then
		var_16_1 = EquipCfg[arg_16_0].starlevel
	end

	if var_16_1 > 6 then
		var_16_1 = 6
	end

	return var_16_1
end

function ItemWillConvert(arg_17_0)
	return (nullable(arg_17_0, "convert_from", "id") or 0) ~= 0
end

local function var_0_2(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.id
	local var_18_1 = arg_18_1.num
	local var_18_2 = arg_18_1.time_valid
	local var_18_3 = ItemCfg[var_18_0]

	if var_18_3.type == ItemConst.ITEM_TYPE.EQUIP or var_18_3.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		return false
	elseif var_18_0 ~= arg_18_0.id then
		return false
	elseif var_18_2 ~= arg_18_0.time_valid then
		return false
	elseif ItemWillConvert(arg_18_0) or ItemWillConvert(arg_18_1) then
		return false
	end

	return true
end

function mergeRewardItem(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0) do
		if var_0_2(iter_19_1, arg_19_1) then
			iter_19_1.num = arg_19_1.num + iter_19_1.num

			return arg_19_0
		end
	end

	table.insert(arg_19_0, arg_19_1)

	return arg_19_0
end

function mergeRewardList(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
		mergeRewardItem(arg_20_0, iter_20_1)
	end

	return arg_20_0
end

function mergeReward(arg_21_0)
	return mergeRewardList({}, arg_21_0)
end

mergeReward2 = mergeReward

function IsConditionAchieved(arg_22_0, arg_22_1)
	local var_22_0 = ConditionCfg[arg_22_0]

	if var_22_0 == nil then
		return true, 0, 0
	end

	local var_22_1 = false
	local var_22_2 = 0
	local var_22_3 = var_22_0.params[1]

	if var_22_0.type == 1001 then
		var_22_2 = HeroData:GetHeroData(arg_22_1.heroId).level
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1004 then
		var_22_2 = HeroTools.GetHeroProficiency(arg_22_1.heroId)
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1002 then
		var_22_2 = HeroTools.CountHeroTotalSkilllv(arg_22_1.heroId)
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1003 then
		var_22_2 = HeroData:GetHeroData(arg_22_1.heroId).star / 100
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1024 then
		var_22_2 = HeroData:GetHeroData(arg_22_1.heroId).star
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1005 then
		var_22_2 = #HeroData:GetHeroData(arg_22_1.heroId).unlocked_astrolabe
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1006 then
		local var_22_4 = HeroData:GetHeroData(arg_22_1.heroId)

		var_22_3 = 1

		for iter_22_0, iter_22_1 in pairs(var_22_0.params) do
			if table.keyof(var_22_4.clear_mission_list, iter_22_1) then
				var_22_2 = 1
				var_22_1 = true

				break
			end
		end
	elseif var_22_0.type == 1007 then
		var_22_2 = HeroData:GetHeroData(arg_22_1.heroId).weapon_info.level or 0
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1008 then
		var_22_3 = 1

		local var_22_5 = HeroCfg[arg_22_1.heroId].study_stage[1]

		if BattleTeachData:GetHeroTeachInfo(arg_22_1.heroId, var_22_5) > 0 then
			var_22_2 = 1
			var_22_1 = true
		end
	elseif var_22_0.type == 1009 then
		local var_22_6 = HeroTools.GetExSkillId(arg_22_1.heroId)
		local var_22_7 = HeroTools.GetSkillLv(arg_22_1.heroId, var_22_6)
		local var_22_8 = HeroData:GetHeroData(arg_22_1.heroId)

		var_22_2 = var_22_7 + HeroTools.GetHeroSkillAddLevel(var_22_8, var_22_6)
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1010 then
		var_22_2 = HeroData:GetHeroData(arg_22_1.heroId).break_level
		var_22_3 = var_22_0.params[1]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1011 or var_22_0.type == 5002 then
		local var_22_9 = BattleStageData:GetStageData()[var_22_0.params[1]]

		var_22_2 = var_22_9 and var_22_9.clear_times > 0 and 1 or 0
		var_22_3 = 1
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1012 then
		local var_22_10 = HeroTools.GetHeroOntologyID(arg_22_1.heroId)
		local var_22_11 = ArchiveData:GetArchive(var_22_10).lv

		var_22_1 = var_22_3 <= var_22_11
		var_22_2 = var_22_11
	elseif var_22_0.type == 1013 then
		local var_22_12 = HeroTools.GetHeroOntologyID(arg_22_1.heroId)
		local var_22_13 = HeroRecordCfg[var_22_12].gift_like_id1[1]

		var_22_2 = ArchiveData:GetArchive(var_22_12).gift_list[var_22_13] or 0
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1014 then
		var_22_2 = PlayerData:GetPlayerInfo().userLevel
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1015 then
		local var_22_14 = HeroData:GetHeroData(var_22_0.params[1])

		var_22_2 = var_22_14 and var_22_14.level or 0
		var_22_3 = var_22_0.params[2]
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 1016 then
		local var_22_15 = HeroTools.GetHeroOntologyID(arg_22_1.heroId)
		local var_22_16 = ArchiveData:GetArchive(var_22_15).lv

		var_22_1 = var_22_3 <= var_22_16
		var_22_2 = var_22_16
	elseif var_22_0.type == 1019 then
		local var_22_17 = ArchiveData:GetTrustLevel(arg_22_1.heroId)

		var_22_1 = var_22_3 <= var_22_17
		var_22_2 = var_22_17
	elseif var_22_0.type == 2001 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 2002 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 2003 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 2004 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 2005 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 1

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 2101 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 2201 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 2202 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 2301 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 2401 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 3001 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 3002 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3003 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3004 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 3005 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3006 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3007 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3008 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 3009 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 5001 then
		local var_22_18 = var_22_0.params[1]
		local var_22_19 = HeroTools.GetHeroOntologyID(var_22_18)
		local var_22_20 = HeroRecordCfg[var_22_19].plot_id

		for iter_22_2, iter_22_3 in ipairs(var_22_20) do
			if not ArchiveData:IsStoryRead(var_22_19, iter_22_3) then
				return false
			end
		end

		return true
	elseif var_22_0.type == 1017 then
		var_22_3 = 1

		local var_22_21 = var_22_0.params[1]
		local var_22_22 = var_22_0.params[2]

		if HeroTools.IsSkinUnlock(var_22_21) and HomeSceneSettingData:IsHaveScene(var_22_22) then
			var_22_2 = 1
			var_22_1 = true
		end
	elseif var_22_0.type == 1018 then
		var_22_3 = 1

		local var_22_23 = var_22_0.params[1]

		if HeroTools.IsSkinUnlock(var_22_23) then
			var_22_2 = 1
			var_22_1 = true
		end
	elseif var_22_0.type == 9001 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9002 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9003 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9004 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 9005 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 9011 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9012 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 9013 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9014 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 9015 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 9016 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 9017 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 1101 then
		local var_22_24 = var_22_0.params[1]
		local var_22_25 = var_22_0.params[2]

		var_22_2 = nullable(ShopData.GetGoodInfo(var_22_24, var_22_25), "buy_times") or 0

		return var_22_2 >= var_22_0.params[3], var_22_2, var_22_0.params[3]
	elseif var_22_0.type == 1102 then
		local var_22_26 = var_22_0.params[1]
		local var_22_27 = var_22_0.params[2]

		return TowerData:CheckIsOverStage(var_22_26, var_22_27)
	elseif var_22_0.type == 8013 then
		var_22_2 = CanteenData:GetFurnitureLevel(var_22_0.params[1]) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 8014 then
		var_22_2 = CanteenData:GetCurEarning() or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 8021 then
		local var_22_28 = arg_22_1.heroId
		local var_22_29 = HeroTools.GetHeroOntologyID(var_22_28)
		local var_22_30 = DormRoomTools:GetDormIDViaArchive(var_22_29)

		var_22_2 = DormRoomTools:GetGiftNumByRoomID(var_22_30) or 0
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 8022 then
		local var_22_31 = arg_22_1.heroId
		local var_22_32 = HeroTools.GetHeroOntologyID(var_22_31)

		var_22_2 = DormHeroTools:GetDormLevelByHeroID(var_22_32)
		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 8023 then
		local var_22_33 = arg_22_1.heroId
		local var_22_34 = DormData:GetHeroTemplateInfo(var_22_33)

		if var_22_34 then
			var_22_2 = var_22_34:GetHeroTotalFeedTime() or 0
		else
			var_22_2 = 0
		end

		var_22_1 = var_22_3 <= var_22_2
	elseif var_22_0.type == 8101 then
		var_22_2 = DormRoomTools:GetUnlockRoomNum() or 0

		return var_22_2 >= var_22_0.params[1], var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 5003 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[3], var_22_2, var_22_0.params[3]
	elseif var_22_0.type == 11200 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 > 0, var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 11201 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 > 0, var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 11202 then
		var_22_2 = ActivityData:GetActivityIsOpen(var_22_0.params[1]) and 1 or 0

		return var_22_2 > 0, var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 11203 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 11204 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 > 0, var_22_2, var_22_0.params[1]
	elseif var_22_0.type == 11205 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 > 0, var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 11206 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= var_22_0.params[2], var_22_2, var_22_0.params[2]
	elseif var_22_0.type == 11501 then
		var_22_2 = HistoryData:GetHistoryData(var_22_0.id) or 0

		return var_22_2 >= 1, var_22_2, 1
	elseif var_22_0.type == 11503 then
		var_22_2 = ActivityRhythmGameData:GetStageDataList()
		var_22_3 = var_22_0.params[1]

		local var_22_35 = false

		for iter_22_4, iter_22_5 in pairs(var_22_2) do
			if iter_22_4 == var_22_3 then
				var_22_35 = true

				break
			end
		end

		var_22_1 = var_22_35
	elseif var_22_0.type == 11502 then
		local var_22_36 = MonsterCosplayData:GetDataByPara("monsterData")
		local var_22_37 = false

		for iter_22_6, iter_22_7 in pairs(var_22_36) do
			if iter_22_7.finishedStage[var_22_0.params[1]] then
				var_22_37 = true
			end
		end

		return var_22_37, var_22_2, 1
	elseif var_22_0.type == 12001 then
		local var_22_38 = var_22_0.params

		var_22_2 = ChallengeRogueTeamData:GetHistoryDifficultyClearCnt(var_22_38[1], var_22_38[2])

		return var_22_2 >= var_22_38[3], var_22_2, var_22_38[3]
	elseif var_22_0.type == 12002 then
		return ChallengeRogueTeamData:GetHistoryEndingPassCnt(arg_22_1[1], arg_22_1[2]) >= arg_22_1[2]
	end

	return var_22_1, var_22_2, var_22_3
end

function GetConditionProgressText(arg_23_0, arg_23_1, arg_23_2)
	if ConditionCfg[arg_23_0].progress_show == 1 then
		return string.format("%s/%s", arg_23_1, arg_23_2)
	else
		return ""
	end
end

function isMeetAllCondition(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0) do
		if not isMeetCondition(iter_24_1) then
			return false
		end
	end

	return true
end

function isMeetCondition(arg_25_0)
	if arg_25_0[1] == 101 then
		return ChapterTools.IsClearStage(arg_25_0[2])
	elseif arg_25_0[1] == 102 then
		local var_25_0 = arg_25_0[2]

		return ChapterTools.IsClearChapter(var_25_0)
	else
		return false
	end
end

function getConditionText(arg_26_0)
	if arg_26_0[1] == 101 then
		local var_26_0 = arg_26_0[2]
		local var_26_1 = getChapterIDByStageID(var_26_0)
		local var_26_2 = BattleStageTools.GetStageCfg(ChapterCfg[var_26_1].type, var_26_0)

		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(var_26_2.name))
	elseif arg_26_0[1] == 102 then
		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(ChapterCfg[arg_26_0[2]].subhead))
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

function isBagFull(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0) do
		if ItemCfg[iter_28_1[1]].type == ItemConst.ITEM_TYPE.EQUIP and EquipTools.GetEquipNum() >= GameSetting.max_equip.value[1] then
			return true
		end
	end

	return false
end

function showEquipSendMail(arg_29_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("EQUIP_SEND_MAIL"),
		OkCallback = function()
			if arg_29_0 then
				arg_29_0()
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

function showVitalitySendMail(arg_35_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("VITALITY_FULL"),
		OkCallback = function()
			if arg_35_0 then
				arg_35_0()
			end
		end
	})
end

function canAddVitalityByProp(arg_37_0)
	if table.keyof(GameSetting.vitality_exchange_id_list.value, arg_37_0) then
		return not isVitalityFull()
	else
		return true
	end
end

function hasVitalityProp()
	for iter_38_0, iter_38_1 in ipairs(GameSetting.vitality_exchange_id_list.value) do
		if ItemTools.getItemNum(iter_38_1) > 0 then
			return true
		end
	end

	return false
end

function isOpenMission(arg_39_0)
	local var_39_0 = BattleStageData:GetStageData()
	local var_39_1 = getChapterIDByStageID(arg_39_0)

	if ChapterTools.IsFinishPreChapter(var_39_1) and var_39_0[arg_39_0] then
		if arg_39_0 == GameSetting.travel_skuld_new_ending_stage_id.value[1] and var_39_0[arg_39_0].clear_times < 1 then
			return false
		end

		return true
	end

	return false
end

function getMaxOpenSection(arg_40_0)
	local var_40_0 = getChapterIDByStageID(arg_40_0)

	if isOpenMission(arg_40_0) then
		return arg_40_0, var_40_0
	end

	for iter_40_0 = ChapterCfg[var_40_0].difficulty, 1, -1 do
		local var_40_1 = getChapterListByDifficulty(BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT, iter_40_0)

		for iter_40_1 = table.keyof(var_40_1, var_40_0), 1, -1 do
			local var_40_2 = ChapterCfg[var_40_1[iter_40_1]]

			for iter_40_2 = table.keyof(var_40_2.section_id_list, arg_40_0) or #var_40_2.section_id_list, 1, -1 do
				local var_40_3 = var_40_2.section_id_list[iter_40_2]

				if isOpenMission(var_40_3) then
					return var_40_3, var_40_1[iter_40_1]
				end
			end
		end
	end

	return arg_40_0, var_40_0
end

function getHeroAffixs(arg_41_0)
	if type(arg_41_0) ~= "table" then
		return {}
	end

	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0) do
		if iter_41_1[3] and iter_41_1[3] == 3 then
			table.insert(var_41_0, iter_41_1)
		end
	end

	return var_41_0
end

function getMosterAffix(arg_42_0)
	if type(arg_42_0) ~= "table" then
		return {}
	end

	local var_42_0 = {}

	for iter_42_0, iter_42_1 in pairs(arg_42_0) do
		if iter_42_1[3] and iter_42_1[3] ~= 3 then
			table.insert(var_42_0, iter_42_1)
		end
	end

	return var_42_0
end

function getAffixName(arg_43_0)
	local var_43_0 = arg_43_0[1]

	if var_43_0 == nil then
		return ""
	end

	local var_43_1 = AffixTypeCfg[var_43_0]

	if var_43_1 == nil then
		-- block empty
	end

	return GetI18NText(var_43_1.name)
end

function getAffixDesc(arg_44_0)
	local var_44_0 = arg_44_0[1]
	local var_44_1 = arg_44_0[2]
	local var_44_2 = ""

	if var_44_0 == nil then
		return var_44_2
	end

	local var_44_3 = {}
	local var_44_4 = AffixTypeCfg[var_44_0]

	if var_44_4 == nil then
		-- block empty
	end

	local var_44_5 = GetCfgDescription(var_44_4.description[1], var_44_1)

	return GetI18NText(var_44_5)
end

function getAffixSprite(arg_45_0)
	local var_45_0 = arg_45_0[1]

	if var_45_0 == nil then
		return ""
	end

	local var_45_1 = AffixTypeCfg[var_45_0]

	if var_45_1 == nil then
		-- block empty
	end

	local var_45_2 = PublicBuffCfg[var_45_1.affix_buff_id].icon

	if var_45_2 == "" then
		-- block empty
	end

	return getSpriteWithoutAtlas(SpritePathCfg.AffixIcon.path .. var_45_2)
end

function getEquipSkillSprite(arg_46_0)
	if arg_46_0 == nil then
		return ""
	end

	local var_46_0 = EquipSkillCfg[arg_46_0]

	if var_46_0 == nil then
		-- block empty
	end

	local var_46_1 = var_46_0.icon

	return getSpriteWithoutAtlas("TextureConfig/Equip/EquipSkillIcon/" .. var_46_1)
end

function getAttributeAffix(arg_47_0, arg_47_1)
	local var_47_0 = clone(EquipBreakThroughMaterialItemCfg[arg_47_0].params)
	local var_47_1 = PublicBuffCfg[AffixTypeCfg[var_47_0[1]].buffid[1]]

	if arg_47_1 > var_47_1.max_level then
		var_47_0[2] = var_47_1.max_level
	else
		var_47_0[2] = arg_47_1
	end

	return var_47_0
end

function getAttributeAffixValue(arg_48_0, arg_48_1)
	local var_48_0 = clone(EquipBreakThroughMaterialItemCfg[arg_48_0].params)
	local var_48_1 = PublicBuffCfg[AffixTypeCfg[var_48_0[1]].buffid[1]]

	if arg_48_1 > var_48_1.max_level then
		arg_48_1 = var_48_1.max_level
	end

	return var_48_1.buffparam_base[2] + var_48_1.buffparam_factor[2] * (arg_48_1 - 1)
end

function MergeActivityID(arg_49_0, arg_49_1)
	if arg_49_0 then
		local var_49_0 = ActivityCfg[arg_49_0]

		if var_49_0 and var_49_0.activity_template == ActivityTemplateConst.STORY_STAGE then
			for iter_49_0, iter_49_1 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STORY]) do
				if table.keyof(ActivityCfg[iter_49_1].sub_activity_list, arg_49_0) then
					return iter_49_1
				end
			end
		elseif var_49_0 and var_49_0.activity_template == ActivityTemplateConst.ACTIVITY_AFFIX_SELECT_SUBMODULE then
			for iter_49_2, iter_49_3 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_AFFIX_SELECT]) do
				if table.keyof(ActivityCfg[iter_49_3].sub_activity_list, arg_49_0) then
					return iter_49_3
				end
			end
		end
	end

	return arg_49_0
end

function GetTrialHeroList(arg_50_0, arg_50_1, arg_50_2)
	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or arg_50_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT then
		local var_50_0 = getChapterIDByStageID(arg_50_1)
		local var_50_1 = ChapterCfg[var_50_0]
		local var_50_2 = var_50_1.activity_id

		if var_50_2 ~= 0 and ActivityTools.GetActivityStatus(var_50_2) ~= 1 then
			return {}
		end

		return type(var_50_1.trial_list) == "table" and var_50_1.trial_list or {}
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS then
		if GetChessLevelIDByStageID(arg_50_1) then
			local var_50_3 = WarchessLevelCfg[GetChessLevelIDByStageID(arg_50_1)]

			return type(var_50_3.trial_list) == "table" and var_50_3.trial_list or {}
		else
			return {}
		end
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS then
		local var_50_4 = {}
		local var_50_5 = NewWarChessData:GetHeroInfoList()

		for iter_50_0, iter_50_1 in pairs(var_50_5) do
			if iter_50_1[2] > 0 then
				table.insert(var_50_4, NewWarChessHeroCfg[iter_50_1[1]].temp_id)
			end
		end

		return var_50_4
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON then
		local var_50_6 = SoloHeartDemonData:GetDataByPara("openEditor")
		local var_50_7 = SoloHeartDemonCfg[var_50_6]

		if SoloHeartDemonData:GetDataByPara("stageToDifficulty")[arg_50_1] < 3 then
			return var_50_7.trial_hero
		end

		return {}
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.AREA_BATTLE then
		return ActivityAreaBattleCfg[arg_50_2].hero
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME then
		local var_50_8 = DestroyBoxGameCfg.get_id_list_by_activity_id[arg_50_2][1]
		local var_50_9 = DestroyBoxGameCfg[var_50_8].main_activity_id
		local var_50_10 = DestroyBoxGameData:GetSelectID(var_50_9)

		return DestroyBoxGameCfg[var_50_10].trial_hero
	end

	if arg_50_0 == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		return ChallengeRogueTeamData:GetTrialHeroList()
	end

	local var_50_11 = GetHeroTeamActivityID(arg_50_0, arg_50_2, true)

	return BattleTeamData:GetHeroTrial(var_50_11) or {}
end

function SetHeroTeam(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5, arg_51_6, arg_51_7, arg_51_8)
	local var_51_0 = ReserveParams.New(nil, arg_51_7, arg_51_8, {
		stageType = arg_51_0,
		stageID = arg_51_1,
		activityID = arg_51_2
	})
	local var_51_1 = arg_51_6.mimir_id or 0
	local var_51_2 = arg_51_6.chip_list or {}

	ReserveTools.SetTeam(var_51_0, arg_51_3, arg_51_4, arg_51_5, var_51_1, var_51_2)
end

function GetHeroTeamActivityID(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_0 == BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON then
		if DemonChallengeCfg[arg_52_1] then
			return DemonChallengeCfg[arg_52_1].activity_id
		else
			return arg_52_1
		end
	elseif arg_52_1 and arg_52_1 ~= 0 then
		return arg_52_2 and arg_52_1 or MergeActivityID(arg_52_1)
	elseif arg_52_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or arg_52_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE or arg_52_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or arg_52_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE or arg_52_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE or arg_52_0 == BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL or arg_52_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY or arg_52_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY_SP or arg_52_0 == BattleConst.STAGE_TYPE_NEW.SURVIVE_SOLO or arg_52_0 == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		return arg_52_0
	else
		return 0
	end
end

function GetLocalHeroTeam(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	local var_53_0 = {
		0,
		0,
		0
	}
	local var_53_1 = {
		false,
		false,
		false
	}
	local var_53_2 = {}
	local var_53_3 = {
		0,
		0,
		0
	}
	local var_53_4 = false

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_53_0 then
		var_53_0 = MatrixData:GetMatrixBattleHeroTeam()

		local var_53_5 = not MatrixData:GetCanChangeCaptain()

		var_53_1 = {
			var_53_5,
			var_53_5,
			var_53_5
		}
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == arg_53_0 then
		var_53_0 = ActivityMatrixData:GetMatrixBattleHeroTeam(arg_53_2)

		local var_53_6 = not ActivityMatrixData:GetCanChangeCaptain(arg_53_2)

		var_53_1 = {
			var_53_6,
			var_53_6,
			var_53_6
		}
	elseif BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX == arg_53_0 then
		var_53_0 = StrategyMatrixData:GetMatrixBattleHeroTeam(arg_53_2)

		local var_53_7 = not StrategyMatrixData:GetCanChangeCaptain(arg_53_2)

		var_53_1 = {
			var_53_7,
			var_53_7,
			var_53_7
		}
	else
		local var_53_8 = ReserveParams.New(nil, arg_53_3, arg_53_4, {
			stageType = arg_53_0,
			stageID = arg_53_1,
			activityID = arg_53_2
		})

		return ReserveTools.GetHeroList(var_53_8)
	end

	return var_53_0, var_53_1, var_53_2, var_53_3, var_53_4
end

function getShopCfg(arg_54_0)
	return ShopCfg[arg_54_0]
end

function getGoodListByGiveID(arg_55_0)
	return ShopCfg.get_id_list_by_give_id[arg_55_0] or {}
end

function getShopIDListByShopID(arg_56_0)
	return ShopCfg.get_id_list_by_shop_id[arg_56_0] or {}
end

function getShopIDListByCurrency(arg_57_0)
	return ShopCfg.get_id_list_by_cost_id[arg_57_0] or {}
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

function StartDormMode(arg_80_0)
	SetForceShowQuanquan(true)
	DormLuaBridge.Launcher(arg_80_0 or GetDormDataForExcehange(), function()
		SetForceShowQuanquan(false)
		DestroyLua()
	end)

	_G.DormDataForExcehangeVar = nil
end

_G.GuildActivityDataForExchangeVar = nil

function GetGuildActivityDataForExchange(arg_82_0, arg_82_1)
	if _G.GuildActivityDataForExchangeVar == nil then
		_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
	end

	if arg_82_0 ~= nil and arg_82_0 > 0 then
		_G.GuildActivityDataForExchangeVar.nodeId = arg_82_0
		_G.GuildActivityDataForExchangeVar.level = arg_82_1
	else
		_G.GuildActivityDataForExchangeVar.nodeId = 11001
		_G.GuildActivityDataForExchangeVar.level = 1
	end

	return _G.GuildActivityDataForExchangeVar
end

function ResetGuildActivityDataForExchange()
	_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
end

function StartGuildActivity(arg_84_0)
	SetForceShowQuanquan(true)

	local var_84_0

	if arg_84_0 ~= nil and arg_84_0 > 0 then
		local var_84_1 = ActivityClubCfg[arg_84_0].map_id

		var_84_0 = table.indexof(ActivityClubMapCfg.all, var_84_1)
	else
		var_84_0 = 1
	end

	GuildActivityLuaBridge.Launcher(GetGuildActivityDataForExchange(arg_84_0, var_84_0), function()
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
				level = var_84_0
			})
			GuildActivityLuaBridge.StartGuildActivity(arg_84_0)
		end)
	end)

	_G.GuildActivityDataForExchangeVar = nil
end

_G.GuildActivitySPDataForExchangeVar = nil

function GetGuildSPActivityDataForExchange(arg_88_0, arg_88_1)
	if _G.GuildActivitySPDataForExchangeVar == nil then
		_G.GuildActivitySPDataForExchangeVar = GuildActivitySPDataForExchange.New()
	end

	if arg_88_0 ~= nil and arg_88_0 > 0 then
		_G.GuildActivitySPDataForExchangeVar.nodeId = arg_88_0
		_G.GuildActivitySPDataForExchangeVar.level = arg_88_1
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

function StartGuildActivitySP(arg_90_0)
	SetForceShowQuanquan(true)

	local var_90_0

	if arg_90_0 ~= nil and arg_90_0 > 0 then
		local var_90_1 = ActivityClubSPCfg[arg_90_0].map_id
		local var_90_2 = GuildActivitySPData:GetCurRunActivityID()
		local var_90_3 = ActivityClubSPMapCfg.get_id_list_by_activity[var_90_2]

		var_90_0 = table.indexof(var_90_3, var_90_1)
	else
		var_90_0 = 1
	end

	if type(var_90_0) ~= "number" then
		SetForceShowQuanquan(false)
		print("未找到当前点位对应的地图索引,节点id为" .. arg_90_0)

		return
	end

	GuildActivitySPLuaBridge.Launcher(GetGuildSPActivityDataForExchange(arg_90_0, var_90_0), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		manager.windowBar:SetWhereTag("guildActivitySP")
		DestroyLua()
		gameContext:SetSystemLayer("guildActivitySP")
	end, function()
		manager.uiInit()
		GuildActivitySPAction.EnterGuildWarField(function()
			GuildActivitySPLuaBridge.StartGuildActivity(arg_90_0)

			local var_93_0 = GuildActivitySPData:GetCurRunActivityID()

			JumpTools.OpenPageByJump("/guildActivitySPWarField", {
				nodeID = arg_90_0,
				activityID = var_93_0,
				level = var_90_0,
				totalActivityID = var_93_0
			})
		end)
	end)

	_G.GuildActivitySPDataForExchangeVar = nil
end

function StartCaptureGameMode(arg_94_0)
	SetForceShowQuanquan(true)
	Capture.Runtime.CaptureGameLuaBridge.Launcher(arg_94_0, function()
		SetForceShowQuanquan(false)
		DestroyLua()
		gameContext:SetSystemLayer("battle")
	end)
end

function getRewardFromDropCfg(arg_96_0, arg_96_1)
	if arg_96_0 == nil then
		return {}
	end

	local var_96_0 = DropCfg[arg_96_0]

	if arg_96_0 == 0 then
		return {}
	end

	if var_96_0 == nil then
		return {}
	end

	local var_96_1 = {}

	if arg_96_1 and #var_96_0.base_drop >= 1 then
		if var_96_0.base_drop ~= "" then
			for iter_96_0, iter_96_1 in pairs(var_96_0.base_drop) do
				table.insert(var_96_1, formatReward(iter_96_1))
			end
		end
	else
		if var_96_0.random_drop ~= "" then
			for iter_96_2, iter_96_3 in pairs(var_96_0.random_drop) do
				table.insert(var_96_1, formatReward(iter_96_3))
			end
		end

		if var_96_0.weight_drop ~= "" then
			for iter_96_4, iter_96_5 in pairs(var_96_0.weight_drop) do
				table.insert(var_96_1, formatReward(iter_96_5))
			end
		end
	end

	local var_96_2 = mergeReward(var_96_1)

	return (sortReward(var_96_2))
end

function checkGold(arg_97_0, arg_97_1)
	if arg_97_1 == nil then
		arg_97_1 = true
	end

	if arg_97_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) then
		if arg_97_1 then
			local var_97_0 = false
			local var_97_1 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.PROPS_BOND]

			for iter_97_0, iter_97_1 in ipairs(var_97_1 or {}) do
				if ItemTools.getItemNum(iter_97_1) > 0 then
					var_97_0 = true

					break
				end
			end

			if CurrencyData:GetGoldBuyTimes() >= GameSetting.coin_max_buy_time.value[1] and not var_97_0 then
				ShowTips("ERROR_ITEM_NOT_ENOUGH_GOLD")
			else
				JumpTools.OpenPopUp("currencyBuyGold")
			end
		end

		return false
	end

	return true
end

function checkMaterial(arg_98_0, arg_98_1)
	if arg_98_0 == nil then
		arg_98_0 = {}
	end

	if arg_98_1 == nil then
		arg_98_1 = true
	end

	for iter_98_0, iter_98_1 in ipairs(arg_98_0) do
		local var_98_0 = iter_98_1[1]

		if iter_98_1[2] > ItemTools.getItemNum(var_98_0) then
			if arg_98_1 then
				ShowPopItem(POP_SOURCE_ITEM, {
					var_98_0
				})
			end

			return false
		end
	end

	return true
end

function checkMoney(arg_99_0, arg_99_1)
	if arg_99_1 == nil then
		arg_99_1 = true
	end

	if arg_99_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND) then
		if arg_99_1 then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_DIAMOND")
		end

		return false
	end

	return true
end

function checkVitality(arg_100_0, arg_100_1)
	if arg_100_1 == nil then
		arg_100_1 = true
	end

	if arg_100_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY) then
		if arg_100_1 then
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

function setTextColor(arg_101_0, arg_101_1, arg_101_2, arg_101_3, arg_101_4)
	local var_101_0 = "<color=#%s>" .. arg_101_2 .. "</color>"
	local var_101_1

	arg_101_4 = arg_101_4 or function(arg_102_0, arg_102_1)
		return arg_102_0 <= arg_102_1
	end

	if arg_101_4(arg_101_2, arg_101_3) then
		var_101_1 = string.format(var_101_0, arg_101_0)
	else
		var_101_1 = string.format(var_101_0, arg_101_1)
	end

	return var_101_1
end

function GetServerTime()
	return manager.time:GetServerTime()
end

function formatText(arg_104_0)
	arg_104_0 = GetI18NText(arg_104_0)

	return (string.gsub(arg_104_0, "#{(%w+)}#", function(arg_105_0)
		if arg_105_0 == "nickname" then
			return PlayerData:GetPlayerInfo().nick
		else
			return arg_105_0
		end
	end))
end

function GetMonsterName(arg_106_0)
	local var_106_0

	if type(arg_106_0) ~= "table" then
		return var_106_0
	end

	for iter_106_0, iter_106_1 in pairs(arg_106_0) do
		if var_106_0 == nil then
			var_106_0 = GetI18NText(CharactorParamCfg[iter_106_1].Name)
		elseif SDKTools.GetIsOverSea() then
			var_106_0 = var_106_0 .. "& " .. GetI18NText(CharactorParamCfg[iter_106_1].Name)
		else
			var_106_0 = var_106_0 .. "&" .. string.match(GetI18NText(CharactorParamCfg[iter_106_1].Name), "<.*>")
		end
	end

	return var_106_0
end

function GetMonsterSkillDesList(arg_107_0)
	local var_107_0 = {}

	if type(arg_107_0) ~= "table" then
		return var_107_0
	end

	for iter_107_0, iter_107_1 in pairs(arg_107_0) do
		for iter_107_2 = 1, 6 do
			if string.len(MonsterCfg[iter_107_1]["skill" .. iter_107_2]) ~= 0 then
				table.insert(var_107_0, {
					name = MonsterCfg[iter_107_1]["skill" .. iter_107_2],
					info = MonsterCfg[iter_107_1]["skill_desc" .. iter_107_2]
				})
			end
		end
	end

	return var_107_0
end

function SetFile(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	local var_108_0 = arg_108_2
	local var_108_1 = PlayerPrefs.GetString("naive_angle_mode_key", "naive")
	local var_108_2

	for iter_108_0 in string.gmatch(arg_108_2, "[^/]+$") do
		var_108_2 = iter_108_0
	end

	local var_108_3 = VideoTrackCfg[var_108_2]

	if var_108_1 ~= "" and var_108_3 and var_108_3.has_non_native == 1 then
		var_108_0 = string.gsub(var_108_0, ".usm", "_alt.usm")
	end

	if not arg_108_3 then
		arg_108_0:SetFile(arg_108_1, var_108_0)
	else
		arg_108_0:SetFile(arg_108_1, var_108_0, arg_108_3)
	end
end

function ColorToHex(arg_109_0)
	local function var_109_0(arg_110_0)
		return string.format("%02X", arg_110_0)
	end

	return var_109_0(math.floor(arg_109_0.r * 255)) .. var_109_0(math.floor(arg_109_0.g * 255)) .. var_109_0(math.floor(arg_109_0.b * 255))
end
