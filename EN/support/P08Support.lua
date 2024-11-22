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

function getReward(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if type(arg_5_2) ~= "function" then
		arg_5_2 = nil
	end

	if arg_5_0 and #arg_5_0 > 0 then
		showRewardUI(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	end
end

getReward2 = getReward

function sortMergeGetReward(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	arg_6_0 = mergeReward(arg_6_0)

	sortReward(arg_6_0, true)
	getReward(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
end

function showRewardUI(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = {}
	local var_7_1 = {}
	local var_7_2 = arg_7_2
	local var_7_3 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		local var_7_4 = ItemWillConvert(iter_7_1) and iter_7_1.convert_from.id or iter_7_1.id
		local var_7_5 = ItemCfg[var_7_4]

		if arg_7_1 ~= nil and #arg_7_1 > 0 and table.indexof(arg_7_1, var_7_5.type) then
			if ItemConst.ITEM_TYPE.WEAPON_SERVANT == var_7_5.type then
				if var_7_5.display_rare > 3 or IllustratedData:GetNewObtainedServant(var_7_4) then
					table.insert(var_7_1, iter_7_1)
				end
			else
				table.insert(var_7_1, iter_7_1)
			end
		end

		if var_7_5.type == 8 and var_7_5.id ~= var_7_5.param[1] then
			function var_7_2()
				if arg_7_2 then
					arg_7_2()
				end

				PlayerAction.RefreshSkinGiftRedPoint()
			end

			table.insert(var_7_1, iter_7_1)
		end

		if var_7_5.type == 21 then
			var_7_3.HasDlc = true
			var_7_3.dlcCfg = var_7_5
		end
	end

	local var_7_6
	local var_7_7 = 0

	for iter_7_2, iter_7_3 in ipairs(arg_7_0) do
		if ItemCfg[iter_7_3.id].sub_type == ItemConst.ITEM_SUB_TYPE.LIMIT_TIME_SKIN_ITEM then
			var_7_6 = iter_7_3
			var_7_7 = var_7_7 + 1
		end
	end

	if var_7_7 == 1 then
		local var_7_8 = deepClone(var_7_2)

		function var_7_2()
			if var_7_8 then
				var_7_8()
			end

			JumpTools.OpenPageByJump("limitTimeSkinUsePop", {
				itemData = var_7_6
			})
		end
	end

	IllustratedData:ConsumeNewObtainedServant()

	if #var_7_1 > 0 then
		local function var_7_9()
			JumpTools.OpenPageByJump("switchHeroReward", {
				list = arg_7_0,
				needShowVitalityBox = needShowVitalityFullBox(),
				needShowEquipBox = needShowBagFullBox(),
				callBack = var_7_2,
				lateCallback = arg_7_3
			})
		end

		local var_7_10 = {
			doNextHandler = var_7_9,
			itemList = var_7_1,
			obtainsParams = var_7_3
		}

		gameContext:Go("obtainView", var_7_10)
	else
		JumpTools.OpenPageByJump("switchHeroReward", {
			list = arg_7_0,
			needShowVitalityBox = needShowVitalityFullBox(),
			needShowEquipBox = needShowBagFullBox(),
			callBack = var_7_2,
			lateCallback = arg_7_3
		})
	end
end

function rewardSortFunc(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.id
	local var_11_1 = arg_11_1.id
	local var_11_2 = ItemCfg[var_11_0]
	local var_11_3 = ItemCfg[var_11_1]
	local var_11_4 = var_11_2.rare
	local var_11_5 = var_11_3.rare

	if var_11_4 ~= var_11_5 then
		return var_11_5 < var_11_4
	end

	local var_11_6 = var_11_2.type
	local var_11_7 = var_11_3.type

	if var_11_6 ~= var_11_7 then
		return var_11_6 < var_11_7
	elseif var_11_6 == ItemConst.ITEM_TYPE.EQUIP then
		local var_11_8 = 0
		local var_11_9 = 0
		local var_11_10 = EquipCfg[var_11_0].starlevel
		local var_11_11 = EquipCfg[var_11_1].starlevel

		if var_11_10 == var_11_11 then
			return var_11_1 < var_11_0
		else
			return var_11_11 < var_11_10
		end
	else
		return var_11_1 < var_11_0
	end
end

function sortReward(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1 and arg_12_0 or clone(arg_12_0)

	table.sort(var_12_0, rewardSortFunc)

	return var_12_0
end

function getItemStar(arg_13_0)
	local var_13_0 = ItemCfg[arg_13_0]
	local var_13_1 = 0

	if var_13_0.type == ItemConst.ITEM_TYPE.EQUIP then
		var_13_1 = EquipCfg[arg_13_0].starlevel
	end

	if var_13_1 > 6 then
		var_13_1 = 6
	end

	return var_13_1
end

function ItemWillConvert(arg_14_0)
	return (nullable(arg_14_0, "convert_from", "id") or 0) ~= 0
end

local function var_0_0(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.id
	local var_15_1 = arg_15_1.num
	local var_15_2 = arg_15_1.time_valid
	local var_15_3 = ItemCfg[var_15_0]

	if var_15_3.type == ItemConst.ITEM_TYPE.EQUIP or var_15_3.type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		return false
	elseif var_15_0 ~= arg_15_0.id then
		return false
	elseif var_15_2 ~= arg_15_0.time_valid then
		return false
	elseif ItemWillConvert(arg_15_0) or ItemWillConvert(arg_15_1) then
		return false
	end

	return true
end

function mergeRewardList(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		local var_16_0 = false

		for iter_16_2, iter_16_3 in ipairs(arg_16_0) do
			if var_0_0(iter_16_3, iter_16_1) then
				iter_16_3.num = iter_16_1.num + iter_16_3.num
				var_16_0 = true

				break
			end
		end

		if var_16_0 == false then
			table.insert(arg_16_0, iter_16_1)
		end
	end

	return arg_16_0
end

function mergeReward(arg_17_0)
	return mergeRewardList({}, arg_17_0)
end

mergeReward2 = mergeReward

function IsConditionAchieved(arg_18_0, arg_18_1)
	local var_18_0 = ConditionCfg[arg_18_0]

	if var_18_0 == nil then
		return true, 0, 0
	end

	local var_18_1 = false
	local var_18_2 = 0
	local var_18_3 = var_18_0.params[1]

	if var_18_0.type == 1001 then
		var_18_2 = HeroData:GetHeroData(arg_18_1.heroId).level
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1004 then
		var_18_2 = HeroTools.GetHeroProficiency(arg_18_1.heroId)
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1002 then
		var_18_2 = HeroTools.CountHeroTotalSkilllv(arg_18_1.heroId)
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1003 then
		var_18_2 = HeroData:GetHeroData(arg_18_1.heroId).star / 100
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1024 then
		var_18_2 = HeroData:GetHeroData(arg_18_1.heroId).star
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1005 then
		var_18_2 = #HeroData:GetHeroData(arg_18_1.heroId).unlocked_astrolabe
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1006 then
		local var_18_4 = HeroData:GetHeroData(arg_18_1.heroId)

		var_18_3 = 1

		for iter_18_0, iter_18_1 in pairs(var_18_0.params) do
			if table.keyof(var_18_4.clear_mission_list, iter_18_1) then
				var_18_2 = 1
				var_18_1 = true

				break
			end
		end
	elseif var_18_0.type == 1007 then
		var_18_2 = HeroData:GetHeroData(arg_18_1.heroId).weapon_info.level or 0
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1008 then
		var_18_3 = 1

		local var_18_5 = HeroCfg[arg_18_1.heroId].study_stage[1]

		if BattleTeachData:GetHeroTeachInfo(arg_18_1.heroId, var_18_5) > 0 then
			var_18_2 = 1
			var_18_1 = true
		end
	elseif var_18_0.type == 1009 then
		local var_18_6 = HeroTools.GetExSkillId(arg_18_1.heroId)
		local var_18_7 = HeroTools.GetSkillLv(arg_18_1.heroId, var_18_6)
		local var_18_8 = HeroData:GetHeroData(arg_18_1.heroId)

		var_18_2 = var_18_7 + HeroTools.GetHeroSkillAddLevel(var_18_8, var_18_6)
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1010 then
		var_18_2 = HeroData:GetHeroData(arg_18_1.heroId).break_level
		var_18_3 = var_18_0.params[1]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1011 or var_18_0.type == 5002 then
		local var_18_9 = BattleStageData:GetStageData()[var_18_0.params[1]]

		var_18_2 = var_18_9 and var_18_9.clear_times > 0 and 1 or 0
		var_18_3 = 1
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1012 then
		local var_18_10 = HeroTools.GetHeroOntologyID(arg_18_1.heroId)
		local var_18_11 = ArchiveData:GetArchive(var_18_10).lv

		var_18_1 = var_18_3 <= var_18_11
		var_18_2 = var_18_11
	elseif var_18_0.type == 1013 then
		local var_18_12 = HeroTools.GetHeroOntologyID(arg_18_1.heroId)
		local var_18_13 = HeroRecordCfg[var_18_12].gift_like_id1[1]

		var_18_2 = ArchiveData:GetArchive(var_18_12).gift_list[var_18_13] or 0
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1014 then
		var_18_2 = PlayerData:GetPlayerInfo().userLevel
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1015 then
		local var_18_14 = HeroData:GetHeroData(var_18_0.params[1])

		var_18_2 = var_18_14 and var_18_14.level or 0
		var_18_3 = var_18_0.params[2]
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 1016 then
		local var_18_15 = HeroTools.GetHeroOntologyID(arg_18_1.heroId)
		local var_18_16 = ArchiveData:GetArchive(var_18_15).lv

		var_18_1 = var_18_3 <= var_18_16
		var_18_2 = var_18_16
	elseif var_18_0.type == 1019 then
		local var_18_17 = ArchiveData:GetTrustLevel(arg_18_1.heroId)

		var_18_1 = var_18_3 <= var_18_17
		var_18_2 = var_18_17
	elseif var_18_0.type == 2001 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 2002 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 2003 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 2004 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 2005 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 1

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 2101 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 2201 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 2202 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 2301 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 2401 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 3001 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 3002 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3003 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3004 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 3005 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3006 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3007 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3008 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 3009 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 5001 then
		local var_18_18 = var_18_0.params[1]
		local var_18_19 = HeroTools.GetHeroOntologyID(var_18_18)
		local var_18_20 = HeroRecordCfg[var_18_19].plot_id

		for iter_18_2, iter_18_3 in ipairs(var_18_20) do
			if not ArchiveData:IsStoryRead(var_18_19, iter_18_3) then
				return false
			end
		end

		return true
	elseif var_18_0.type == 1017 then
		var_18_3 = 1

		local var_18_21 = var_18_0.params[1]
		local var_18_22 = var_18_0.params[2]

		if HeroTools.IsSkinUnlock(var_18_21) and HomeSceneSettingData:IsHaveScene(var_18_22) then
			var_18_2 = 1
			var_18_1 = true
		end
	elseif var_18_0.type == 1018 then
		var_18_3 = 1

		local var_18_23 = var_18_0.params[1]

		if HeroTools.IsSkinUnlock(var_18_23) then
			var_18_2 = 1
			var_18_1 = true
		end
	elseif var_18_0.type == 9001 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9002 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9003 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9004 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 9005 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 9011 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9012 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 9013 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9014 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 9015 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= 1, var_18_2, 1
	elseif var_18_0.type == 9016 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 9017 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 1101 then
		local var_18_24 = var_18_0.params[1]
		local var_18_25 = var_18_0.params[2]

		var_18_2 = nullable(ShopData.GetGoodInfo(var_18_24, var_18_25), "buy_times") or 0

		return var_18_2 >= var_18_0.params[3], var_18_2, var_18_0.params[3]
	elseif var_18_0.type == 1102 then
		local var_18_26 = var_18_0.params[1]
		local var_18_27 = var_18_0.params[2]

		return TowerData:CheckIsOverStage(var_18_26, var_18_27)
	elseif var_18_0.type == 8013 then
		var_18_2 = CanteenData:GetFurnitureLevel(var_18_0.params[1]) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 8014 then
		var_18_2 = CanteenData:GetCurEarning() or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 8021 then
		local var_18_28 = arg_18_1.heroId
		local var_18_29 = HeroTools.GetHeroOntologyID(var_18_28)
		local var_18_30 = DormRoomTools:GetDormIDViaArchive(var_18_29)

		var_18_2 = DormRoomTools:GetGiftNumByRoomID(var_18_30) or 0
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 8022 then
		local var_18_31 = arg_18_1.heroId
		local var_18_32 = HeroTools.GetHeroOntologyID(var_18_31)

		var_18_2 = DormHeroTools:GetDormLevelByHeroID(var_18_32)
		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 8023 then
		local var_18_33 = arg_18_1.heroId
		local var_18_34 = DormData:GetHeroTemplateInfo(var_18_33)

		if var_18_34 then
			var_18_2 = var_18_34:GetHeroTotalFeedTime() or 0
		else
			var_18_2 = 0
		end

		var_18_1 = var_18_3 <= var_18_2
	elseif var_18_0.type == 8101 then
		var_18_2 = DormRoomTools:GetUnlockRoomNum() or 0

		return var_18_2 >= var_18_0.params[1], var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 5003 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[3], var_18_2, var_18_0.params[3]
	elseif var_18_0.type == 11200 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 > 0, var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 11201 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 > 0, var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 11202 then
		var_18_2 = ActivityData:GetActivityIsOpen(var_18_0.params[1]) and 1 or 0

		return var_18_2 > 0, var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 11203 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 11204 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 > 0, var_18_2, var_18_0.params[1]
	elseif var_18_0.type == 11205 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 > 0, var_18_2, var_18_0.params[2]
	elseif var_18_0.type == 11206 then
		var_18_2 = HistoryData:GetHistoryData(var_18_0.id) or 0

		return var_18_2 >= var_18_0.params[2], var_18_2, var_18_0.params[2]
	end

	return var_18_1, var_18_2, var_18_3
end

function GetConditionProgressText(arg_19_0, arg_19_1, arg_19_2)
	if ConditionCfg[arg_19_0].progress_show == 1 then
		return string.format("%s/%s", arg_19_1, arg_19_2)
	else
		return ""
	end
end

function isMeetAllCondition(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0) do
		if not isMeetCondition(iter_20_1) then
			return false
		end
	end

	return true
end

function isMeetCondition(arg_21_0)
	if arg_21_0[1] == 101 then
		return ChapterTools.IsClearStage(arg_21_0[2])
	elseif arg_21_0[1] == 102 then
		local var_21_0 = arg_21_0[2]

		return ChapterTools.IsClearChapter(var_21_0)
	else
		return false
	end
end

function getConditionText(arg_22_0)
	if arg_22_0[1] == 101 then
		local var_22_0 = arg_22_0[2]
		local var_22_1 = getChapterIDByStageID(var_22_0)
		local var_22_2 = BattleStageTools.GetStageCfg(ChapterCfg[var_22_1].type, var_22_0)

		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(var_22_2.name))
	elseif arg_22_0[1] == 102 then
		return string.format(GetTips("NOTE_TASK_UNLOCK"), GetI18NText(ChapterCfg[arg_22_0[2]].subhead))
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

function isBagFull(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0) do
		if ItemCfg[iter_24_1[1]].type == ItemConst.ITEM_TYPE.EQUIP and EquipTools.GetEquipNum() >= GameSetting.max_equip.value[1] then
			return true
		end
	end

	return false
end

function showEquipSendMail(arg_25_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("EQUIP_SEND_MAIL"),
		OkCallback = function()
			if arg_25_0 then
				arg_25_0()
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

function showVitalitySendMail(arg_31_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("VITALITY_FULL"),
		OkCallback = function()
			if arg_31_0 then
				arg_31_0()
			end
		end
	})
end

function canAddVitalityByProp(arg_33_0)
	if table.keyof(GameSetting.vitality_exchange_id_list.value, arg_33_0) then
		return not isVitalityFull()
	else
		return true
	end
end

function hasVitalityProp()
	for iter_34_0, iter_34_1 in ipairs(GameSetting.vitality_exchange_id_list.value) do
		if ItemTools.getItemNum(iter_34_1) > 0 then
			return true
		end
	end

	return false
end

function isOpenMission(arg_35_0)
	local var_35_0 = BattleStageData:GetStageData()
	local var_35_1 = getChapterIDByStageID(arg_35_0)

	if ChapterTools.IsFinishPreChapter(var_35_1) and var_35_0[arg_35_0] then
		if arg_35_0 == GameSetting.travel_skuld_new_ending_stage_id.value[1] and var_35_0[arg_35_0].clear_times < 1 then
			return false
		end

		return true
	end

	return false
end

function getMaxOpenSection(arg_36_0)
	local var_36_0 = getChapterIDByStageID(arg_36_0)

	if isOpenMission(arg_36_0) then
		return arg_36_0, var_36_0
	end

	for iter_36_0 = ChapterCfg[var_36_0].difficulty, 1, -1 do
		local var_36_1 = getChapterListByDifficulty(BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT, iter_36_0)

		for iter_36_1 = table.keyof(var_36_1, var_36_0), 1, -1 do
			local var_36_2 = ChapterCfg[var_36_1[iter_36_1]]

			for iter_36_2 = table.keyof(var_36_2.section_id_list, arg_36_0) or #var_36_2.section_id_list, 1, -1 do
				local var_36_3 = var_36_2.section_id_list[iter_36_2]

				if isOpenMission(var_36_3) then
					return var_36_3, var_36_1[iter_36_1]
				end
			end
		end
	end

	return arg_36_0, var_36_0
end

function getHeroAffixs(arg_37_0)
	if type(arg_37_0) ~= "table" then
		return {}
	end

	local var_37_0 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0) do
		if iter_37_1[3] and iter_37_1[3] == 3 then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function getMosterAffix(arg_38_0)
	if type(arg_38_0) ~= "table" then
		return {}
	end

	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0) do
		if iter_38_1[3] and iter_38_1[3] ~= 3 then
			table.insert(var_38_0, iter_38_1)
		end
	end

	return var_38_0
end

function getAffixName(arg_39_0)
	local var_39_0 = arg_39_0[1]

	if var_39_0 == nil then
		return ""
	end

	local var_39_1 = AffixTypeCfg[var_39_0]

	if var_39_1 == nil then
		-- block empty
	end

	return GetI18NText(var_39_1.name)
end

function getAffixDesc(arg_40_0)
	local var_40_0 = arg_40_0[1]
	local var_40_1 = arg_40_0[2]
	local var_40_2 = ""

	if var_40_0 == nil then
		return var_40_2
	end

	local var_40_3 = {}
	local var_40_4 = AffixTypeCfg[var_40_0]

	if var_40_4 == nil then
		-- block empty
	end

	local var_40_5 = GetCfgDescription(var_40_4.description[1], var_40_1)

	return GetI18NText(var_40_5)
end

function getAffixSprite(arg_41_0)
	local var_41_0 = arg_41_0[1]

	if var_41_0 == nil then
		return ""
	end

	local var_41_1 = AffixTypeCfg[var_41_0]

	if var_41_1 == nil then
		-- block empty
	end

	local var_41_2 = PublicBuffCfg[var_41_1.affix_buff_id].icon

	if var_41_2 == "" then
		-- block empty
	end

	return getSpriteWithoutAtlas(SpritePathCfg.AffixIcon.path .. var_41_2)
end

function getEquipSkillSprite(arg_42_0)
	if arg_42_0 == nil then
		return ""
	end

	local var_42_0 = EquipSkillCfg[arg_42_0]

	if var_42_0 == nil then
		-- block empty
	end

	local var_42_1 = var_42_0.icon

	return getSpriteWithoutAtlas("TextureConfig/Equip/EquipSkillIcon/" .. var_42_1)
end

function getAttributeAffix(arg_43_0, arg_43_1)
	local var_43_0 = clone(EquipBreakThroughMaterialItemCfg[arg_43_0].params)
	local var_43_1 = PublicBuffCfg[AffixTypeCfg[var_43_0[1]].buffid[1]]

	if arg_43_1 > var_43_1.max_level then
		var_43_0[2] = var_43_1.max_level
	else
		var_43_0[2] = arg_43_1
	end

	return var_43_0
end

function getAttributeAffixValue(arg_44_0, arg_44_1)
	local var_44_0 = clone(EquipBreakThroughMaterialItemCfg[arg_44_0].params)
	local var_44_1 = PublicBuffCfg[AffixTypeCfg[var_44_0[1]].buffid[1]]

	if arg_44_1 > var_44_1.max_level then
		arg_44_1 = var_44_1.max_level
	end

	return var_44_1.buffparam_base[2] + var_44_1.buffparam_factor[2] * (arg_44_1 - 1)
end

function MergeActivityID(arg_45_0, arg_45_1)
	if arg_45_0 then
		local var_45_0 = ActivityCfg[arg_45_0]

		if var_45_0 and var_45_0.activity_template == ActivityTemplateConst.STORY_STAGE then
			for iter_45_0, iter_45_1 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.STORY]) do
				if table.keyof(ActivityCfg[iter_45_1].sub_activity_list, arg_45_0) then
					return iter_45_1
				end
			end
		elseif var_45_0 and var_45_0.activity_template == ActivityTemplateConst.ACTIVITY_AFFIX_SELECT_SUBMODULE then
			for iter_45_2, iter_45_3 in pairs(ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.ACTIVITY_AFFIX_SELECT]) do
				if table.keyof(ActivityCfg[iter_45_3].sub_activity_list, arg_45_0) then
					return iter_45_3
				end
			end
		end
	end

	return arg_45_0
end

function GetTrialHeroList(arg_46_0, arg_46_1, arg_46_2)
	if arg_46_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or arg_46_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT then
		local var_46_0 = getChapterIDByStageID(arg_46_1)
		local var_46_1 = ChapterCfg[var_46_0]
		local var_46_2 = var_46_1.activity_id

		if var_46_2 ~= 0 and ActivityTools.GetActivityStatus(var_46_2) ~= 1 then
			return {}
		end

		return type(var_46_1.trial_list) == "table" and var_46_1.trial_list or {}
	end

	if arg_46_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_CHESS then
		if GetChessLevelIDByStageID(arg_46_1) then
			local var_46_3 = WarchessLevelCfg[GetChessLevelIDByStageID(arg_46_1)]

			return type(var_46_3.trial_list) == "table" and var_46_3.trial_list or {}
		else
			return {}
		end
	end

	if arg_46_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_NEWWARCHESS then
		local var_46_4 = {}
		local var_46_5 = NewWarChessData:GetHeroInfoList()

		for iter_46_0, iter_46_1 in pairs(var_46_5) do
			if iter_46_1[2] > 0 then
				table.insert(var_46_4, NewWarChessHeroCfg[iter_46_1[1]].temp_id)
			end
		end

		return var_46_4
	end

	if arg_46_0 == BattleConst.STAGE_TYPE_NEW.SOLO_HEART_DEMON then
		local var_46_6 = SoloHeartDemonData:GetDataByPara("openEditor")
		local var_46_7 = SoloHeartDemonCfg[var_46_6]

		if SoloHeartDemonData:GetDataByPara("stageToDifficulty")[arg_46_1] < 3 then
			return var_46_7.trial_hero
		end

		return {}
	end

	if arg_46_0 == BattleConst.STAGE_TYPE_NEW.DESTROY_BOX_GAME then
		local var_46_8 = DestroyBoxGameCfg.get_id_list_by_activity_id[arg_46_2][1]
		local var_46_9 = DestroyBoxGameCfg[var_46_8].main_activity_id
		local var_46_10 = DestroyBoxGameData:GetSelectID(var_46_9)

		return DestroyBoxGameCfg[var_46_10].trial_hero
	end

	local var_46_11 = GetHeroTeamActivityID(arg_46_0, arg_46_2, true)

	return BattleTeamData:GetHeroTrial(var_46_11) or {}
end

function SetHeroTeam(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4, arg_47_5, arg_47_6, arg_47_7, arg_47_8)
	local var_47_0 = ReserveParams.New(nil, arg_47_7, arg_47_8, {
		stageType = arg_47_0,
		stageID = arg_47_1,
		activityID = arg_47_2
	})
	local var_47_1 = arg_47_6.mimir_id or 0
	local var_47_2 = arg_47_6.chip_list or {}

	ReserveTools.SetTeam(var_47_0, arg_47_3, arg_47_4, arg_47_5, var_47_1, var_47_2)
end

function GetHeroTeamActivityID(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_0 == BattleConst.STAGE_TYPE_NEW.OSIRIS_DEMON then
		if DemonChallengeCfg[arg_48_1] then
			return DemonChallengeCfg[arg_48_1].activity_id
		else
			return arg_48_1
		end
	elseif arg_48_1 and arg_48_1 ~= 0 then
		return arg_48_2 and arg_48_1 or MergeActivityID(arg_48_1)
	elseif arg_48_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE or arg_48_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BOSS_CHALLENGE_ADVANCE or arg_48_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX or arg_48_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_PREPARE or arg_48_0 == BattleConst.STAGE_TYPE_NEW.GUILD_BOSS_CHALLENGE or arg_48_0 == BattleConst.STAGE_TYPE_NEW.EQUIP_BREAK_THROUGH_MATERIAL or arg_48_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY or arg_48_0 == BattleConst.STAGE_TYPE_NEW.GUILD_ACTIVITY_SP or arg_48_0 == BattleConst.STAGE_TYPE_NEW.SURVIVE_SOLO or arg_48_0 == BattleConst.STAGE_TYPE_NEW.POLYHEDRON then
		return arg_48_0
	else
		return 0
	end
end

function GetLocalHeroTeam(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	local var_49_0 = {
		0,
		0,
		0
	}
	local var_49_1 = {
		false,
		false,
		false
	}
	local var_49_2 = {}
	local var_49_3 = {
		0,
		0,
		0
	}
	local var_49_4 = false

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == arg_49_0 then
		var_49_0 = MatrixData:GetMatrixBattleHeroTeam()

		local var_49_5 = not MatrixData:GetCanChangeCaptain()

		var_49_1 = {
			var_49_5,
			var_49_5,
			var_49_5
		}
	elseif BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == arg_49_0 then
		var_49_0 = ActivityMatrixData:GetMatrixBattleHeroTeam(arg_49_2)

		local var_49_6 = not ActivityMatrixData:GetCanChangeCaptain(arg_49_2)

		var_49_1 = {
			var_49_6,
			var_49_6,
			var_49_6
		}
	elseif BattleConst.STAGE_TYPE_NEW.STRATEGY_MATRIX == arg_49_0 then
		var_49_0 = StrategyMatrixData:GetMatrixBattleHeroTeam(arg_49_2)

		local var_49_7 = not StrategyMatrixData:GetCanChangeCaptain(arg_49_2)

		var_49_1 = {
			var_49_7,
			var_49_7,
			var_49_7
		}
	else
		local var_49_8 = ReserveParams.New(nil, arg_49_3, arg_49_4, {
			stageType = arg_49_0,
			stageID = arg_49_1,
			activityID = arg_49_2
		})

		return ReserveTools.GetHeroList(var_49_8)
	end

	return var_49_0, var_49_1, var_49_2, var_49_3, var_49_4
end

function getShopCfg(arg_50_0)
	return ShopCfg[arg_50_0]
end

function getGoodListByGiveID(arg_51_0)
	return ShopCfg.get_id_list_by_give_id[arg_51_0] or {}
end

function getShopIDListByShopID(arg_52_0)
	return ShopCfg.get_id_list_by_shop_id[arg_52_0] or {}
end

function getShopIDListByCurrency(arg_53_0)
	return ShopCfg.get_id_list_by_cost_id[arg_53_0] or {}
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

function StartDormMode(arg_73_0)
	SetForceShowQuanquan(true)
	DormLuaBridge.Launcher(arg_73_0 or GetDormDataForExcehange(), function()
		SetForceShowQuanquan(false)
		DestroyLua()
	end)

	_G.DormDataForExcehangeVar = nil
end

_G.GuildActivityDataForExchangeVar = nil

function GetGuildActivityDataForExchange(arg_75_0, arg_75_1)
	if _G.GuildActivityDataForExchangeVar == nil then
		_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
	end

	if arg_75_0 ~= nil and arg_75_0 > 0 then
		_G.GuildActivityDataForExchangeVar.nodeId = arg_75_0
		_G.GuildActivityDataForExchangeVar.level = arg_75_1
	else
		_G.GuildActivityDataForExchangeVar.nodeId = 11001
		_G.GuildActivityDataForExchangeVar.level = 1
	end

	return _G.GuildActivityDataForExchangeVar
end

function ResetGuildActivityDataForExchange()
	_G.GuildActivityDataForExchangeVar = GuildActivityDataForExchange.New()
end

function StartGuildActivity(arg_77_0)
	SetForceShowQuanquan(true)

	local var_77_0

	if arg_77_0 ~= nil and arg_77_0 > 0 then
		local var_77_1 = ActivityClubCfg[arg_77_0].map_id

		var_77_0 = table.indexof(ActivityClubMapCfg.all, var_77_1)
	else
		var_77_0 = 1
	end

	GuildActivityLuaBridge.Launcher(GetGuildActivityDataForExchange(arg_77_0, var_77_0), function()
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
				level = var_77_0
			})
			GuildActivityLuaBridge.StartGuildActivity(arg_77_0)
		end)
	end)

	_G.GuildActivityDataForExchangeVar = nil
end

_G.GuildActivitySPDataForExchangeVar = nil

function GetGuildSPActivityDataForExchange(arg_81_0, arg_81_1)
	if _G.GuildActivitySPDataForExchangeVar == nil then
		_G.GuildActivitySPDataForExchangeVar = GuildActivitySPDataForExchange.New()
	end

	if arg_81_0 ~= nil and arg_81_0 > 0 then
		_G.GuildActivitySPDataForExchangeVar.nodeId = arg_81_0
		_G.GuildActivitySPDataForExchangeVar.level = arg_81_1
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

function StartGuildActivitySP(arg_83_0)
	SetForceShowQuanquan(true)

	local var_83_0

	if arg_83_0 ~= nil and arg_83_0 > 0 then
		local var_83_1 = ActivityClubSPCfg[arg_83_0].map_id
		local var_83_2 = GuildActivitySPData:GetCurRunActivityID()
		local var_83_3 = ActivityClubSPMapCfg.get_id_list_by_activity[var_83_2]

		var_83_0 = table.indexof(var_83_3, var_83_1)
	else
		var_83_0 = 1
	end

	if type(var_83_0) ~= "number" then
		SetForceShowQuanquan(false)
		print("未找到当前点位对应的地图索引,节点id为" .. arg_83_0)

		return
	end

	GuildActivitySPLuaBridge.Launcher(GetGuildSPActivityDataForExchange(arg_83_0, var_83_0), function()
		SetForceShowQuanquan(false)

		_G.BATTLE_SERVER_ERROR_TIME = 0

		manager.windowBar:SetWhereTag("guildActivitySP")
		DestroyLua()
		gameContext:SetSystemLayer("guildActivitySP")
	end, function()
		manager.uiInit()
		GuildActivitySPAction.EnterGuildWarField(function()
			GuildActivitySPLuaBridge.StartGuildActivity(arg_83_0)

			local var_86_0 = GuildActivitySPData:GetCurRunActivityID()

			JumpTools.OpenPageByJump("/guildActivitySPWarField", {
				nodeID = arg_83_0,
				activityID = var_86_0,
				level = var_83_0,
				totalActivityID = var_86_0
			})
		end)
	end)

	_G.GuildActivitySPDataForExchangeVar = nil
end

function getRewardFromDropCfg(arg_87_0, arg_87_1)
	if arg_87_0 == nil then
		return {}
	end

	local var_87_0 = DropCfg[arg_87_0]

	if arg_87_0 == 0 then
		return {}
	end

	if var_87_0 == nil then
		return {}
	end

	local var_87_1 = {}

	if arg_87_1 and #var_87_0.base_drop >= 1 then
		if var_87_0.base_drop ~= "" then
			for iter_87_0, iter_87_1 in pairs(var_87_0.base_drop) do
				table.insert(var_87_1, formatReward(iter_87_1))
			end
		end
	else
		if var_87_0.random_drop ~= "" then
			for iter_87_2, iter_87_3 in pairs(var_87_0.random_drop) do
				table.insert(var_87_1, formatReward(iter_87_3))
			end
		end

		if var_87_0.weight_drop ~= "" then
			for iter_87_4, iter_87_5 in pairs(var_87_0.weight_drop) do
				table.insert(var_87_1, formatReward(iter_87_5))
			end
		end
	end

	local var_87_2 = mergeReward(var_87_1)

	return (sortReward(var_87_2))
end

function checkGold(arg_88_0, arg_88_1)
	if arg_88_1 == nil then
		arg_88_1 = true
	end

	if arg_88_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_GOLD) then
		if arg_88_1 then
			local var_88_0 = false
			local var_88_1 = ItemCfg.get_id_list_by_sub_type[ItemConst.ITEM_SUB_TYPE.PROPS_BOND]

			for iter_88_0, iter_88_1 in ipairs(var_88_1 or {}) do
				if ItemTools.getItemNum(iter_88_1) > 0 then
					var_88_0 = true

					break
				end
			end

			if CurrencyData:GetGoldBuyTimes() >= GameSetting.coin_max_buy_time.value[1] and not var_88_0 then
				ShowTips("ERROR_ITEM_NOT_ENOUGH_GOLD")
			else
				JumpTools.OpenPopUp("currencyBuyGold")
			end
		end

		return false
	end

	return true
end

function checkMaterial(arg_89_0, arg_89_1)
	if arg_89_0 == nil then
		arg_89_0 = {}
	end

	if arg_89_1 == nil then
		arg_89_1 = true
	end

	for iter_89_0, iter_89_1 in ipairs(arg_89_0) do
		local var_89_0 = iter_89_1[1]

		if iter_89_1[2] > ItemTools.getItemNum(var_89_0) then
			if arg_89_1 then
				ShowPopItem(POP_SOURCE_ITEM, {
					var_89_0
				})
			end

			return false
		end
	end

	return true
end

function checkMoney(arg_90_0, arg_90_1)
	if arg_90_1 == nil then
		arg_90_1 = true
	end

	if arg_90_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND) then
		if arg_90_1 then
			ShowTips("ERROR_ITEM_NOT_ENOUGH_DIAMOND")
		end

		return false
	end

	return true
end

function checkVitality(arg_91_0, arg_91_1)
	if arg_91_1 == nil then
		arg_91_1 = true
	end

	if arg_91_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY) then
		if arg_91_1 then
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

function setTextColor(arg_92_0, arg_92_1, arg_92_2, arg_92_3, arg_92_4)
	local var_92_0 = "<color=#%s>" .. arg_92_2 .. "</color>"
	local var_92_1

	arg_92_4 = arg_92_4 or function(arg_93_0, arg_93_1)
		return arg_93_0 <= arg_93_1
	end

	if arg_92_4(arg_92_2, arg_92_3) then
		var_92_1 = string.format(var_92_0, arg_92_0)
	else
		var_92_1 = string.format(var_92_0, arg_92_1)
	end

	return var_92_1
end

function GetServerTime()
	return manager.time:GetServerTime()
end

function formatText(arg_95_0)
	arg_95_0 = GetI18NText(arg_95_0)

	return (string.gsub(arg_95_0, "#{(%w+)}#", function(arg_96_0)
		if arg_96_0 == "nickname" then
			return PlayerData:GetPlayerInfo().nick
		else
			return arg_96_0
		end
	end))
end

function GetMonsterName(arg_97_0)
	local var_97_0

	if type(arg_97_0) ~= "table" then
		return var_97_0
	end

	for iter_97_0, iter_97_1 in pairs(arg_97_0) do
		if var_97_0 == nil then
			var_97_0 = GetI18NText(CharactorParamCfg[iter_97_1].Name)
		else
			var_97_0 = var_97_0 .. "&" .. string.match(GetI18NText(CharactorParamCfg[iter_97_1].Name), "<.*>")
		end
	end

	return var_97_0
end

function GetMonsterSkillDesList(arg_98_0)
	local var_98_0 = {}

	if type(arg_98_0) ~= "table" then
		return var_98_0
	end

	for iter_98_0, iter_98_1 in pairs(arg_98_0) do
		for iter_98_2 = 1, 6 do
			if string.len(MonsterCfg[iter_98_1]["skill" .. iter_98_2]) ~= 0 then
				table.insert(var_98_0, {
					name = MonsterCfg[iter_98_1]["skill" .. iter_98_2],
					info = MonsterCfg[iter_98_1]["skill_desc" .. iter_98_2]
				})
			end
		end
	end

	return var_98_0
end
