require("game.data.ActivitySubmodule.StrategyMatrixDataTemplata")

local var_0_0 = singletonClass("StrategyMatrixData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}
local var_0_4

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_3 = {}
	var_0_4 = nil
end

function var_0_0.InitMatrixUser(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.activity_id

	if var_0_1[var_2_0] then
		var_0_1[var_2_0]:SetData(arg_2_1)
	else
		var_0_1[var_2_0] = StrategyMartixUserTemplata.New(arg_2_1)
	end

	manager.notify:Invoke(ACTIVITY_MATRIX_PROCESS_CHANGE)
end

function var_0_0.UpdateMatrixProcess(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not var_0_1[arg_3_1] then
		return
	end

	var_0_1[arg_3_1].game_state = arg_3_2

	var_0_1[arg_3_1]:UpdateProcess(arg_3_3)
	manager.notify:Invoke(ACTIVITY_MATRIX_PROCESS_CHANGE)
end

function var_0_0.InitMatrixOver(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.activity_id

	if var_0_2[var_4_0] then
		var_0_2[var_4_0]:SetData(arg_4_1)

		return
	end

	var_0_2[var_4_0] = ActivityMartixOverTemplata.New(arg_4_1)
end

function var_0_0.GetMatrixData(arg_5_0, arg_5_1)
	return var_0_1[arg_5_1]
end

function var_0_0.GetGameState(arg_6_0, arg_6_1)
	return var_0_1[arg_6_1].game_state
end

function var_0_0.GetMatrixPhaseData(arg_7_0, arg_7_1)
	return var_0_1[arg_7_1].phase
end

function var_0_0.GetIsClearance(arg_8_0, arg_8_1)
	if not var_0_1[arg_8_1] then
		return false
	end

	return var_0_1[arg_8_1]:GetIsClearance()
end

function var_0_0.GetMatrixHeroTeam(arg_9_0, arg_9_1)
	return var_0_1[arg_9_1].matrix_hero_id_net_rec
end

function var_0_0.GetMatrixBattleHeroTeam(arg_10_0, arg_10_1)
	return var_0_1[arg_10_1].battle_hero_id_list_cache or var_0_1[arg_10_1].matrix_hero_id_net_rec
end

function var_0_0.SetMatrixBattleHeroTeam(arg_11_0, arg_11_1, arg_11_2)
	var_0_1[arg_11_1].battle_hero_id_list_cache = arg_11_2
end

function var_0_0.GetHeroData(arg_12_0, arg_12_1, arg_12_2)
	return var_0_1[arg_12_1].matrix_hero_net_rec[arg_12_2]
end

function var_0_0.GetTierID(arg_13_0, arg_13_1)
	return var_0_1[arg_13_1].tier_id
end

function var_0_0.GetArtifactList(arg_14_0, arg_14_1)
	return var_0_1[arg_14_1].artifact_list
end

function var_0_0.GetCustomAffix(arg_15_0, arg_15_1)
	return var_0_1[arg_15_1].custom_affix_id_list
end

function var_0_0.GetHeroSkin(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = HeroData:GetHeroData(arg_16_2)
	local var_16_1 = var_16_0 and var_16_0.using_skin or 0

	if var_16_1 == 0 then
		var_16_1 = arg_16_2
	end

	return var_16_1
end

function var_0_0.GetCurrentClearTime(arg_17_0, arg_17_1)
	return var_0_2[arg_17_1].currentClearTime_
end

function var_0_0.GetMinClearTime(arg_18_0, arg_18_1)
	return var_0_2[arg_18_1].minClearTime_
end

function var_0_0.GetMatrixCurrencyList(arg_19_0, arg_19_1)
	return var_0_2[arg_19_1].currencyList_
end

function var_0_0.GetMatrixOverPoint(arg_20_0, arg_20_1)
	return var_0_2[arg_20_1].point
end

function var_0_0.GetMatrixIsFirstClear(arg_21_0, arg_21_1)
	return not var_0_2[arg_21_1].success_times == 0
end

function var_0_0.GetWeaponServantLevel(arg_22_0, arg_22_1)
	return var_0_1[arg_22_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.WEAPON_LEVEL] or 0
end

function var_0_0.GetHeroEquipMaxCount(arg_23_0, arg_23_1)
	return var_0_1[arg_23_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.MAX_EQUIP_COUNT] or 0
end

function var_0_0.GetAstrolabeMaxCount(arg_24_0, arg_24_1)
	return var_0_1[arg_24_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.MAX_ASTROLABE_COUNT] or 0
end

function var_0_0.GetShoRefreshTimes(arg_25_0, arg_25_1)
	return var_0_1[arg_25_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.SHOP_REFRESH_TIMES] or 0
end

function var_0_0.GetShopFressRefreshTimes(arg_26_0, arg_26_1)
	return var_0_1[arg_26_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.SHOP_FRESS_REFRESH_TIMES] or 0
end

function var_0_0.GetFirstGoodsDiscount(arg_27_0, arg_27_1)
	return var_0_1[arg_27_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.SHOP_FIRST_GOODS_DISCOUNT] or 1
end

function var_0_0.GetCanChangeCaptain(arg_28_0, arg_28_1)
	if var_0_1[arg_28_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.CHANGE_TEAM_LEADER] == 1 then
		return true
	end

	return false
end

function var_0_0.GetScoreAddition(arg_29_0, arg_29_1)
	local var_29_0 = var_0_1[arg_29_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.SCORE_ADDITION]

	if not var_29_0 then
		return 0
	end

	return var_29_0 / 1000
end

function var_0_0.GetGiveUpRewardAddition(arg_30_0, arg_30_1)
	local var_30_0 = var_0_1[arg_30_1].attribute_list[MatrixConst.MATRIX_ATTRIBUTE_TYPE.GIVE_UP_REWARD_ADDITION]

	if not var_30_0 then
		return 0
	end

	return var_30_0 / 1000
end

function var_0_0.GetRaceEffect(arg_31_0, arg_31_1)
	return false
end

function var_0_0.GetAffixList(arg_32_0, arg_32_1)
	if var_0_1[arg_32_1] then
		local var_32_0 = {}
		local var_32_1 = var_0_1[arg_32_1].custom_affix_id_list

		for iter_32_0, iter_32_1 in ipairs(var_32_1) do
			local var_32_2 = ActivityAffixPoolCfg[iter_32_1]

			if var_32_2 then
				table.insert(var_32_0, var_32_2.affix)
			end
		end

		return var_32_0
	end

	return {}
end

function var_0_0.GetArtifactAffixList(arg_33_0, arg_33_1)
	if var_0_1[arg_33_1] then
		local var_33_0 = {}
		local var_33_1 = var_0_1[arg_33_1].artifact_list

		for iter_33_0, iter_33_1 in ipairs(var_33_1) do
			local var_33_2 = iter_33_1.id
			local var_33_3 = iter_33_1.wins
			local var_33_4 = MatrixItemCfg[var_33_2]

			if var_33_4 then
				local var_33_5 = var_33_4.params[1]
				local var_33_6 = MatrixTools.GetAffixByEffectId(var_33_5, var_33_3)

				if var_33_6 then
					table.insert(var_33_0, var_33_6)
				end
			end
		end

		return var_33_0
	end

	return {}
end

function var_0_0.GetInitAffixList(arg_34_0, arg_34_1)
	local var_34_0 = {}

	if var_0_1[arg_34_1] then
		local var_34_1 = var_0_1[arg_34_1]:GetEffectList()

		for iter_34_0, iter_34_1 in ipairs(var_34_1) do
			local var_34_2 = MatrixTools.GetAffixByEffectId(iter_34_1.id, iter_34_1.level)

			if var_34_2 then
				table.insert(var_34_0, var_34_2)
			end
		end
	end

	return var_34_0
end

function var_0_0.GetTotalAffix(arg_35_0, arg_35_1)
	local var_35_0 = {}

	table.insertto(var_35_0, arg_35_0:GetAffixList(arg_35_1))
	table.insertto(var_35_0, arg_35_0:GetInitAffixList(arg_35_1))

	return var_35_0
end

function var_0_0.CalMatrixAttribute(arg_36_0, arg_36_1)
	local var_36_0 = {}

	if var_0_1[arg_36_1] then
		local var_36_1 = var_0_1[arg_36_1]:GetEffectList()

		for iter_36_0, iter_36_1 in ipairs(var_36_1) do
			MatrixTools.GetAttrByEffectId(var_36_0, iter_36_1.id)
		end
	end

	return var_36_0
end

function var_0_0.GetMatrixCoint(arg_37_0, arg_37_1)
	return var_0_1[arg_37_1] and var_0_1[arg_37_1]:GetMatrixCoint() or 0
end

function var_0_0.GetMatrixScore(arg_38_0, arg_38_1)
	return var_0_1[arg_38_1] and var_0_1[arg_38_1]:GetMapId() or 0
end

function var_0_0.GetRoguelikeScore(arg_39_0, arg_39_1)
	return var_0_1[arg_39_1] and var_0_1[arg_39_1]:RoguelikeScore() or 0
end

function var_0_0.GetMapId(arg_40_0, arg_40_1)
	return var_0_1[arg_40_1]:GetMapId()
end

function var_0_0.GetNodeList(arg_41_0, arg_41_1)
	return var_0_1[arg_41_1]:GetNodeList()
end

function var_0_0.GetRead(arg_42_0, arg_42_1)
	return getData("STRATEGY_MATRIX_OPEN_RECORD", tostring(arg_42_1)) == 1
end

function var_0_0.SetRead(arg_43_0, arg_43_1)
	saveData("STRATEGY_MATRIX_OPEN_RECORD", tostring(arg_43_1), 1)
end

function var_0_0.SetDifficultySelect(arg_44_0, arg_44_1)
	var_0_4 = arg_44_1

	saveData("StrategyMatrix", "difficulty", var_0_4)
end

function var_0_0.GetDifficultySelect(arg_45_0)
	if var_0_4 then
		return var_0_4
	else
		var_0_4 = getData("StrategyMatrix", "difficulty") or 1

		return var_0_4
	end
end

return var_0_0
