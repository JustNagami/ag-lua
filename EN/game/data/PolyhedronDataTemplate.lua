PolyhedronConst = {
	HERO_ATTRIBUTE_ICON_PATH = "TextureConfig/PolyhedronItem/Attribute/",
	ARTIFACT_ICON_PATH = "TextureConfig/PolyhedronItem/Artifact/",
	TERMINAL_ICON_PATH = "TextureConfig/PolyhedronItem/Terminal/",
	EFFECT_ATTRIBUTE_ICON_PATH = "TextureConfig/PolyhedronItem/Effect/",
	BEACON_ICON_PATH = "TextureConfig/PolyhedronItem/Beacon/",
	SAVE_POINT_TYPE = {
		OPTION = 3,
		REWARD = 2,
		UNDEFINED = 0,
		BATTLE = 1
	},
	STATE_TYPE = {
		SETTLEMENT = 3,
		STARTED = 2,
		NOTSTARTED = 1
	},
	ITEM_TYPE = {
		BLOOD = 7,
		ARTIFACT_UP_LEVEL = 5,
		BUFF = 4,
		COIN = 1,
		HERO = 3,
		ARTIFACT = 6
	},
	REWARD_TYEP = {
		TEAMMATE = 2,
		ARTIFACT_1 = 3001,
		ARTIFACT_2 = 3002,
		ARTIFACT_4 = 3004,
		CURRENCY = 1,
		ARTIFACT_3 = 3003,
		ARTIFACT_SPEC = 3007,
		ARTIFACT_6 = 3006,
		EMPTY = 6,
		ARTIFACT_5 = 3005,
		SHOP = 5,
		ARTIFACT_STRENGTH = 7,
		HERO_ATTRIBUTE = 4,
		ARTIFACT = 3
	},
	ENLIST_TYPE = {
		GIVE_UP = 0,
		PAY = 2,
		FREE = 3,
		BATTLE = 1
	},
	RANK_TYPE = {
		ALL = 1,
		GUILD = 2
	},
	RANK_SUB_TYPE = {
		SCORE = 1,
		HERO = 2
	},
	EFFECT_ACTION = {
		AFFIX = 4,
		ATTRIBUTE_MULTIPLE_ARTIFACT_NUM = 5,
		ATTRIBUTE = 2
	},
	EFFECT_MOMENT = {
		FOREVER = 2
	},
	AFFIX_TYPE = {
		MATRIX_BEACON = 806
	},
	REVIVE_COIN_EFFECT = {
		BEACON = {
			[5] = true
		},
		TERMINAL = {
			[1101] = true
		}
	},
	POLYHEDRON_SETTING_ID = {
		SHOP_RECOVER = 15
	}
}
PolyhedronConst.SPECIAL_ATTR_DESC = {}

local var_0_0 = GameSetting.polyhedron_difficulty_affixes.value

for iter_0_0, iter_0_1 in ipairs(var_0_0) do
	PolyhedronConst.SPECIAL_ATTR_DESC[iter_0_1[1]] = iter_0_1
end

PolyhedronTools = {}

function PolyhedronTools.PolyhedronPolicyExpToLevel()
	local var_1_0 = PolyhedronData:GetActivityID()
	local var_1_1 = ActivityCfg[var_1_0] and ActivityCfg[var_1_0].policy_activity_id

	if var_1_1 == nil then
		return 0, 0
	end

	local var_1_2 = PolyhedronPolicyCfg.get_id_list_by_activity_id[var_1_1]
	local var_1_3 = #var_1_2
	local var_1_4 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_SHIFTING_EXP)
	local var_1_5 = 0
	local var_1_6 = var_1_4

	for iter_1_0, iter_1_1 in ipairs(var_1_2) do
		if var_1_4 < PolyhedronPolicyCfg[iter_1_1].exp then
			return var_1_5, var_1_6
		else
			var_1_5 = iter_1_0

			if iter_1_0 < var_1_3 then
				var_1_6 = var_1_4 - PolyhedronPolicyCfg[iter_1_1].exp
			end
		end
	end

	return var_1_5, var_1_6
end

function PolyhedronTools.PolyhedronTerminalExpToLevel(arg_2_0)
	local var_2_0 = PolyhedronTerminalLevelCfg.all
	local var_2_1 = 1
	local var_2_2 = #var_2_0
	local var_2_3 = -1

	while var_2_1 <= var_2_2 do
		local var_2_4 = var_2_1 + math.floor((var_2_2 - var_2_1) / 2)

		if arg_2_0 < PolyhedronTerminalLevelCfg[var_2_0[var_2_4]].exp then
			var_2_2 = var_2_4 - 1
		else
			var_2_3 = var_2_4
			var_2_1 = var_2_4 + 1
		end
	end

	local var_2_5 = arg_2_0 - PolyhedronTerminalLevelCfg[var_2_0[var_2_3]].exp

	return var_2_0[var_2_3], var_2_5
end

function PolyhedronTools.GetRaceEffect(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = 0
	local var_3_2 = false
	local var_3_3 = 3
	local var_3_4 = PolyhedronData:GetPolyhedronInfo():GetTotalAffix()

	for iter_3_0, iter_3_1 in ipairs(var_3_4) do
		if iter_3_1[1] == PolyhedronConst.AFFIX_TYPE.MATRIX_BEACON then
			var_3_3 = 2
		end
	end

	for iter_3_2, iter_3_3 in pairs(arg_3_0) do
		if iter_3_3 ~= 0 then
			local var_3_5 = HeroCfg[iter_3_3].race

			var_3_0[var_3_5] = (var_3_0[var_3_5] or 0) + 1

			if var_3_0[var_3_5] == 2 then
				var_3_1 = var_3_5
			end

			if var_3_3 <= var_3_0[var_3_5] then
				var_3_2 = true
			end
		end
	end

	return var_3_1, var_3_2, var_3_0[var_3_1] or 1
end

function PolyhedronTools.GetBeaconIsUnlockCondition(arg_4_0)
	local var_4_0 = PolyhedronBeaconCfg[arg_4_0]

	if var_4_0 and var_4_0.condition ~= 0 then
		return IsConditionAchieved(var_4_0.condition)
	end

	return true
end

function PolyhedronTools.CalPolyhedronDifficultyAttr(arg_5_0, arg_5_1)
	for iter_5_0 = 1, arg_5_1 do
		local var_5_0 = PolyhedronDifficultyCfg[iter_5_0].params

		for iter_5_1, iter_5_2 in ipairs(var_5_0) do
			if iter_5_2[1] == 2 then
				local var_5_1 = iter_5_2[2]
				local var_5_2 = iter_5_2[3]

				arg_5_0[var_5_1] = HeroTools.AttributeAdd(var_5_1, arg_5_0[var_5_1], var_5_2)
			end
		end
	end

	return arg_5_0
end

function PolyhedronTools.GetPolyhedronDifficultyAffixDir(arg_6_0)
	local var_6_0 = {}

	for iter_6_0 = 1, arg_6_0 do
		local var_6_1 = PolyhedronDifficultyCfg[iter_6_0].params

		for iter_6_1, iter_6_2 in ipairs(var_6_1) do
			if iter_6_2[1] == 1 then
				local var_6_2 = iter_6_2[2]
				local var_6_3 = iter_6_2[3]
				local var_6_4 = iter_6_2[4]

				var_6_0[var_6_2] = {
					var_6_2,
					var_6_3,
					var_6_4
				}
			end
		end
	end

	return var_6_0
end

function PolyhedronTools.GetPolyhedronTerminalClassifyDes(arg_7_0)
	return GetTips("POLYHEDRON_TERMINAL_CLASSIFY_" .. arg_7_0)
end

function PolyhedronTools.GetPolyhedronArtifactSubTypeDes(arg_8_0)
	return GetTips("POLYHEDRON_ARTIFACT_SUB_TYPE_" .. arg_8_0)
end

function PolyhedronTools.GetGateCfg(arg_9_0, arg_9_1)
	local var_9_0 = PolyhedronEventCfg[arg_9_0]

	for iter_9_0, iter_9_1 in ipairs(PolyhedronGateCfg.all) do
		local var_9_1 = PolyhedronGateCfg[iter_9_1]

		if (var_9_1.event_type == 0 or var_9_0.event_type == var_9_1.event_type) and (var_9_1.reward_type == 0 or arg_9_1 == var_9_1.reward_type) then
			return var_9_1
		end
	end

	print("polyhedron error cant find gate index by" .. arg_9_0 .. ":" .. arg_9_1)

	return {
		reward_type = 0,
		gate_index = 999,
		event_type = 0,
		gate_des = ""
	}
end

function PolyhedronTools.getAffixUpLvDes(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = AffixTypeCfg[arg_10_0]

	if var_10_0 == nil then
		-- block empty
	end

	local var_10_1 = var_10_0.description[1]
	local var_10_2 = DescriptionCfg[var_10_1]

	if not var_10_2 then
		return ""
	end

	local function var_10_3(arg_11_0, arg_11_1)
		if arg_11_1 then
			return math.floor(arg_11_0 * 10^arg_11_1 + 0.5) / 10^arg_11_1
		else
			return math.floor(arg_11_0 + 0.5)
		end
	end

	local var_10_4 = GetI18NText(var_10_2.description)

	if var_10_2.type == 1 then
		if arg_10_2 > var_10_2.maxLv or arg_10_2 < 1 then
			return ""
		end

		if arg_10_1 > var_10_2.maxLv or arg_10_1 < 1 then
			return ""
		end

		local var_10_5 = var_10_2.param

		if #var_10_5 >= 1 then
			local var_10_6 = {
				"0"
			}

			for iter_10_0, iter_10_1 in ipairs(var_10_5) do
				local var_10_7 = iter_10_1[1]
				local var_10_8 = iter_10_1[2]
				local var_10_9 = iter_10_1[4]
				local var_10_10 = var_10_3(var_10_7 + var_10_8 * (arg_10_1 - 1), 1)

				if var_10_10 % 1 == 0 then
					var_10_10 = string.format("%.0f", var_10_10) .. var_10_9
				else
					var_10_10 = string.format("%.1f", var_10_10) .. var_10_9
				end

				local var_10_11 = var_10_3(var_10_7 + var_10_8 * (arg_10_2 - 1), 1)

				if var_10_11 % 1 == 0 then
					var_10_11 = string.format("%.0f", var_10_11) .. var_10_9
				else
					var_10_11 = string.format("%.1f", var_10_11) .. var_10_9
				end

				if var_10_10 ~= var_10_11 then
					table.insert(var_10_6, var_10_10 .. "->" .. var_10_11)
				else
					table.insert(var_10_6, var_10_10)
				end
			end

			return LuaExchangeHelper.GetDescription(var_10_4, var_10_6)
		else
			return var_10_4
		end
	else
		local var_10_12 = var_10_2.param[arg_10_1]
		local var_10_13 = var_10_2.param[arg_10_2]

		if not var_10_12 or not var_10_13 then
			return ""
		end

		local var_10_14 = {}
		local var_10_15 = #var_10_12

		for iter_10_2 = 1, var_10_15 do
			local var_10_16

			if var_10_12[iter_10_2] ~= var_10_13[iter_10_2] then
				var_10_16 = var_10_12[iter_10_2] .. "->" .. var_10_13[iter_10_2]
			else
				var_10_16 = var_10_12[iter_10_2]
			end

			table.insert(var_10_14, var_10_16)
		end

		if #var_10_14 > 1 then
			return LuaExchangeHelper.GetDescription(var_10_4, var_10_14)
		else
			return var_10_4
		end
	end
end

function PolyhedronTools.ArtifactSubTypeSorter(arg_12_0, arg_12_1)
	local var_12_0 = 3007

	if arg_12_0 == var_12_0 or arg_12_1 == var_12_0 then
		return arg_12_0 == var_12_0
	end

	return arg_12_1 < arg_12_0
end

PolyhedronTemplate = class("PolyhedronProcessTemplate")

function PolyhedronTemplate.Ctor(arg_13_0, arg_13_1)
	arg_13_0:UpdateGame(arg_13_1)
end

function PolyhedronTemplate.UpdateGame(arg_14_0, arg_14_1)
	arg_14_0.state = arg_14_1.state

	local var_14_0 = arg_14_1.start_info

	arg_14_0.leader = PolyhedronSnapShotTemplate.New(var_14_0.leader)
	arg_14_0.beacon_id_list = {}

	for iter_14_0, iter_14_1 in ipairs(var_14_0.beacon_id_list) do
		table.insert(arg_14_0.beacon_id_list, iter_14_1)
	end

	arg_14_0.difficulty = var_14_0.difficulty
	arg_14_0.terminal_id_list = {}

	for iter_14_2, iter_14_3 in ipairs(var_14_0.terminal_id_list) do
		table.insert(arg_14_0.terminal_id_list, iter_14_3)
	end

	arg_14_0:UpdatePocess(arg_14_1.progress)
end

function PolyhedronTemplate.UpdatePocess(arg_15_0, arg_15_1)
	arg_15_0.tier_id = arg_15_1.tier_id
	arg_15_0.event = PolyhedronEventTemplate.New(arg_15_1.event)
	arg_15_0.stage = PolyhedronStageTemplate.New(arg_15_1.stage)
	arg_15_0.hero_list = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_1.hero_list) do
		arg_15_0.hero_list[iter_15_1.hero_id] = PolyhedronHeroTemplate.New(iter_15_1)
	end

	arg_15_0.fight_hero_id_list = {}

	for iter_15_2, iter_15_3 in ipairs(arg_15_1.fight_hero_id_list) do
		table.insert(arg_15_0.fight_hero_id_list, iter_15_3)
	end

	arg_15_0.artifact_list = {}

	for iter_15_4, iter_15_5 in ipairs(arg_15_1.artifact_list) do
		table.insert(arg_15_0.artifact_list, {
			id = iter_15_5.id,
			level = iter_15_5.level
		})
	end

	arg_15_0.effect_list = {}

	for iter_15_6, iter_15_7 in ipairs(arg_15_1.effect_list) do
		table.insert(arg_15_0.effect_list, {
			id = iter_15_7.id
		})
	end

	arg_15_0.attribute_list = {}

	for iter_15_8, iter_15_9 in ipairs(arg_15_1.attribute_list) do
		local var_15_0 = iter_15_9.id
		local var_15_1 = iter_15_9.value

		arg_15_0.attribute_list[var_15_0] = var_15_1
	end

	arg_15_0.stackable_item_list = {}

	for iter_15_10, iter_15_11 in ipairs(arg_15_1.stackable_item_list) do
		local var_15_2 = iter_15_11.id
		local var_15_3 = iter_15_11.num

		arg_15_0.stackable_item_list[var_15_2] = var_15_3
	end
end

function PolyhedronTemplate.GetState(arg_16_0)
	return arg_16_0.state
end

function PolyhedronTemplate.GetTierId(arg_17_0)
	return arg_17_0.tier_id
end

function PolyhedronTemplate.GetDifficulty(arg_18_0)
	return arg_18_0.difficulty
end

function PolyhedronTemplate.GetArtifact(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.artifact_list) do
		if iter_19_1.id == arg_19_1 then
			return iter_19_1
		end
	end
end

function PolyhedronTemplate.GetBeaconList(arg_20_0)
	return arg_20_0.beacon_id_list
end

function PolyhedronTemplate.GetArtifactList(arg_21_0)
	return arg_21_0.artifact_list
end

function PolyhedronTemplate.GetTerminalIdList(arg_22_0)
	return arg_22_0.terminal_id_list
end

function PolyhedronTemplate.GetSavePoint(arg_23_0)
	return arg_23_0.stage.save_point
end

function PolyhedronTemplate.GetStageId(arg_24_0)
	return arg_24_0.stage.stage_id
end

function PolyhedronTemplate.GetGateData(arg_25_0, arg_25_1)
	return arg_25_0.stage.gate_list[arg_25_1]
end

function PolyhedronTemplate.GetRewardList(arg_26_0)
	return arg_26_0.stage:GetRewardList()
end

function PolyhedronTemplate.GetTipsList(arg_27_0)
	return arg_27_0.stage:GetTipsList()
end

function PolyhedronTemplate.GetEnlistHeroList(arg_28_0)
	local var_28_0 = arg_28_0.stage.params
	local var_28_1 = math.floor(#var_28_0 / 2)
	local var_28_2 = {}

	for iter_28_0 = 1, var_28_1 do
		table.insert(var_28_2, {
			heroId = var_28_0[iter_28_0 * 2 - 1],
			enlist_type = var_28_0[iter_28_0 * 2]
		})
	end

	return var_28_2
end

function PolyhedronTemplate.GetShopItemList(arg_29_0)
	return arg_29_0.stage.shop_item_list
end

function PolyhedronTemplate.GetShopRefreshTimes(arg_30_0)
	return arg_30_0.stage.refresh_times
end

function PolyhedronTemplate.GetShopRecoverTimes(arg_31_0)
	return arg_31_0.stage.recover_times
end

function PolyhedronTemplate.GetRewardType(arg_32_0)
	return arg_32_0.event.reward_type
end

function PolyhedronTemplate.GetPolyhedronLeader(arg_33_0)
	return arg_33_0.leader
end

function PolyhedronTemplate.GetLeaderHeroId(arg_34_0)
	return arg_34_0.leader:GetHeroId()
end

function PolyhedronTemplate.GetFightHeroList(arg_35_0)
	return arg_35_0.fight_hero_id_list
end

function PolyhedronTemplate.GetHeroList(arg_36_0)
	return table.keys(arg_36_0.hero_list)
end

function PolyhedronTemplate.GetHeroPolyData(arg_37_0, arg_37_1)
	return arg_37_0.hero_list[arg_37_1]
end

function PolyhedronTemplate.GetCoinCount(arg_38_0)
	return arg_38_0.stackable_item_list[1] or 0
end

function PolyhedronTemplate.GetAttribulteValue(arg_39_0, arg_39_1)
	local var_39_0 = PolyhedronAttributeIdCfg[arg_39_1]

	return arg_39_0.attribute_list[var_39_0.id]
end

function PolyhedronTemplate.GetReviveCount(arg_40_0)
	local var_40_0 = 3

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.beacon_id_list) do
		if PolyhedronConst.REVIVE_COIN_EFFECT.BEACON[iter_40_1] == true then
			var_40_0 = var_40_0 + 1
		end
	end

	for iter_40_2, iter_40_3 in ipairs(arg_40_0.terminal_id_list) do
		if PolyhedronConst.REVIVE_COIN_EFFECT.TERMINAL[iter_40_3] == true then
			var_40_0 = var_40_0 + 1
		end
	end

	return arg_40_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_LEADER_REBORN_TIMES") or 0, var_40_0
end

function PolyhedronTemplate.GetReviveHp(arg_41_0)
	local var_41_0 = arg_41_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_REBORN_HEALTH_PERCENT")

	if var_41_0 then
		return var_41_0 / 10
	else
		return 100
	end
end

function PolyhedronTemplate.ReviveMaxCount(arg_42_0)
	return arg_42_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_LEADER_REBORN_MAX_TIMES") or 0
end

function PolyhedronTemplate.GetRollGateCount(arg_43_0)
	return arg_43_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_RE_ROLL_GATE_TIMES") or 0
end

function PolyhedronTemplate.GetRollRewardCount(arg_44_0)
	return arg_44_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_RE_ROLL_ARTIFACT_REWARD_TIMES") or 0
end

function PolyhedronTemplate.GetShopFressRefreshTimes(arg_45_0)
	return arg_45_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_SHOP_FREE_REFRESH_TIME") or 0
end

function PolyhedronTemplate.GetShopMaxRefreshTimes(arg_46_0)
	return arg_46_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_SHOP_REFRESH_TIME") or 0
end

function PolyhedronTemplate.GetShopRecoverMaxTimes(arg_47_0)
	return arg_47_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_SHOP_RECOVER_TIME") or 0
end

function PolyhedronTemplate.GetRewardGiveUpCoinAdd(arg_48_0)
	return arg_48_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_GIVE_UP_ADD_COIN_NUM") or 0
end

function PolyhedronTemplate.GetTeamateRebornMaxColdDown(arg_49_0)
	return arg_49_0:GetAttribulteValue("GAME_POLYHEDRON_ATTRIBUTE_TEAMMATE_REBORN_MAX_COLD_DOWN") or 0
end

function PolyhedronTemplate.GetPolyhedronCoinId(arg_50_0)
	return 26
end

function PolyhedronTemplate.GetShopRefreshCost(arg_51_0, arg_51_1)
	local var_51_0 = PolyhedronSettingCfg[14]

	for iter_51_0, iter_51_1 in ipairs(var_51_0.value) do
		if iter_51_1[1] == arg_51_1 then
			return iter_51_1[2]
		end
	end

	local var_51_1 = #var_51_0.value

	return var_51_0.value[var_51_1][2]
end

function PolyhedronTemplate.GetRewardGiveUpCoin(arg_52_0)
	return PolyhedronSettingCfg[21].value[1] + arg_52_0:GetRewardGiveUpCoinAdd()
end

function PolyhedronTemplate.GetShopOriginalPrice(arg_53_0, arg_53_1)
	local var_53_0 = PolyhedronSettingCfg[13]

	for iter_53_0, iter_53_1 in ipairs(var_53_0.value) do
		if iter_53_1[1] == arg_53_1 then
			return iter_53_1[2]
		end
	end

	return 0
end

function PolyhedronTemplate.GetTotalAffix(arg_54_0)
	local var_54_0 = {}
	local var_54_1 = PolyhedronTools.GetPolyhedronDifficultyAffixDir(arg_54_0.difficulty)

	for iter_54_0, iter_54_1 in pairs(var_54_1) do
		table.insert(var_54_0, iter_54_1)
	end

	for iter_54_2, iter_54_3 in ipairs(arg_54_0.effect_list) do
		local var_54_2 = PolyhedronEffectCfg[iter_54_3.id]

		if PolyhedronConst.EFFECT_ACTION.AFFIX == var_54_2.action then
			for iter_54_4, iter_54_5 in ipairs(var_54_2.params) do
				table.insert(var_54_0, iter_54_5)
			end
		end
	end

	local var_54_3 = arg_54_0:GetCoinCount()

	for iter_54_6, iter_54_7 in ipairs(arg_54_0.artifact_list) do
		local var_54_4 = iter_54_7.id
		local var_54_5 = iter_54_7.level

		if var_54_4 >= 70701 and var_54_4 <= 70750 then
			var_54_5 = var_54_5 * var_54_3
		end

		local var_54_6 = PolyhedronArtifactCfg[var_54_4]

		table.insert(var_54_0, {
			var_54_6.affix_id,
			var_54_5,
			var_54_6.affix_target
		})
	end

	return var_54_0
end

function PolyhedronTemplate.CalPolyhedronAttribute(arg_55_0, arg_55_1)
	local var_55_0 = {}
	local var_55_1 = #arg_55_0.artifact_list

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.effect_list) do
		if iter_55_1.id == 2014 then
			CustomLog.Log(debug.traceback(string.format("2014")))
		end

		local var_55_2 = PolyhedronEffectCfg[iter_55_1.id]

		if PolyhedronConst.EFFECT_MOMENT.FOREVER == var_55_2.moment then
			if PolyhedronConst.EFFECT_ACTION.ATTRIBUTE == var_55_2.action then
				for iter_55_2, iter_55_3 in ipairs(var_55_2.params) do
					local var_55_3 = iter_55_3[1]
					local var_55_4 = iter_55_3[2]

					var_55_0[var_55_3] = HeroTools.AttributeAdd(var_55_3, var_55_0[var_55_3], var_55_4)
				end
			elseif PolyhedronConst.EFFECT_ACTION.ATTRIBUTE_MULTIPLE_ARTIFACT_NUM == var_55_2.action then
				for iter_55_4, iter_55_5 in ipairs(var_55_2.params) do
					local var_55_5 = iter_55_5[1]
					local var_55_6 = iter_55_5[2] * var_55_1

					var_55_0[var_55_5] = HeroTools.AttributeAdd(var_55_5, var_55_0[var_55_5], var_55_6)
				end
			end
		end
	end

	local var_55_7 = arg_55_0.hero_list[arg_55_1]

	if var_55_7 then
		for iter_55_6, iter_55_7 in ipairs(var_55_7.difference_attribute_list) do
			local var_55_8 = iter_55_7.id
			local var_55_9 = iter_55_7.value

			var_55_0[var_55_8] = HeroTools.AttributeAdd(var_55_8, var_55_0[var_55_8], var_55_9)
		end
	end

	return var_55_0
end

PolyhedronSnapShotTemplate = class("PolyhedronSnapShotTemplate")

function PolyhedronSnapShotTemplate.Ctor(arg_56_0, arg_56_1)
	arg_56_0.hero_id = arg_56_1.hero_id
	arg_56_0.astrolabe_list = {}

	for iter_56_0, iter_56_1 in ipairs(arg_56_1.astrolabe_list) do
		table.insert(arg_56_0.astrolabe_list, iter_56_1)
	end
end

function PolyhedronSnapShotTemplate.GetHeroId(arg_57_0)
	return arg_57_0.hero_id
end

function PolyhedronSnapShotTemplate.GetVirtualData(arg_58_0)
	local var_58_0 = PolyhedronHeroCfg[arg_58_0.hero_id].standard_id
	local var_58_1 = deepClone(TempHeroData:GetTempHeroDataByTempID(var_58_0))
	local var_58_2 = var_58_1.equip_list

	var_58_1.using_astrolabe = arg_58_0.astrolabe_list
	var_58_1.using_skin = PolyhedronData:GetHeroUsingSkinInfo(arg_58_0.hero_id).id

	for iter_58_0, iter_58_1 in ipairs(var_58_1.skill) do
		local var_58_3 = HeroTools.GetHeroSkillAddLevel(var_58_1, iter_58_1.skill_id)

		iter_58_1.skill_level = iter_58_1.skill_level + var_58_3
	end

	return var_58_1, var_58_2
end

PolyhedronHeroTemplate = class("PolyhedronHeroTemplate")

function PolyhedronHeroTemplate.Ctor(arg_59_0, arg_59_1)
	arg_59_0.hero_id = arg_59_1.hero_id
	arg_59_0.template_id = arg_59_1.template_id
	arg_59_0.health = arg_59_1.health
	arg_59_0.max_health = arg_59_1.max_health
	arg_59_0.reborn_cold_down = arg_59_1.reborn_cold_down
	arg_59_0.difference_attribute_list = {}

	for iter_59_0, iter_59_1 in ipairs(arg_59_1.difference_attribute_list) do
		local var_59_0 = iter_59_1.id
		local var_59_1 = iter_59_1.value

		table.insert(arg_59_0.difference_attribute_list, {
			id = var_59_0,
			value = var_59_1
		})
	end

	arg_59_0.injured = arg_59_1.injured
	arg_59_0.heal = arg_59_1.heal
	arg_59_0.damage = arg_59_1.damage
end

function PolyhedronHeroTemplate.IsDead(arg_60_0)
	return arg_60_0.health <= 0
end

function PolyhedronHeroTemplate.GetHeroMaxHP(arg_61_0)
	return arg_61_0.max_health
end

function PolyhedronHeroTemplate.GetHeroHP(arg_62_0)
	return math.ceil(arg_62_0.health)
end

PolyhedronEventTemplate = class("PolyhedronHeroTemplate")

function PolyhedronEventTemplate.Ctor(arg_63_0, arg_63_1)
	arg_63_0.id = arg_63_1.id
	arg_63_0.stage_id = arg_63_1.stage_id
	arg_63_0.reward_type = arg_63_1.reward_type
end

PolyhedronStageTemplate = class("PolyhedronStageTemplate")

function PolyhedronStageTemplate.Ctor(arg_64_0, arg_64_1)
	arg_64_0.stage_id = arg_64_1.stage_id
	arg_64_0.save_point = arg_64_1.save_point

	print("更新保存点" .. arg_64_0.save_point)

	local var_64_0 = arg_64_1.reward

	arg_64_0.rewardRound = var_64_0.round
	arg_64_0.item_list = {}

	for iter_64_0, iter_64_1 in ipairs(var_64_0.item_list) do
		local var_64_1 = {}

		for iter_64_2, iter_64_3 in ipairs(iter_64_1.params) do
			table.insert(var_64_1, iter_64_3)
		end

		table.insert(arg_64_0.item_list, {
			class = iter_64_1.class,
			params = var_64_1
		})
	end

	arg_64_0.params = {}

	for iter_64_4, iter_64_5 in ipairs(arg_64_1.params) do
		table.insert(arg_64_0.params, iter_64_5)
	end

	arg_64_0.gate_list = {}

	for iter_64_6, iter_64_7 in ipairs(arg_64_1.gate_list) do
		local var_64_2 = iter_64_7.index
		local var_64_3 = PolyhedronEventTemplate.New(iter_64_7.event)

		arg_64_0.gate_list[var_64_2] = var_64_3
	end

	local var_64_4 = arg_64_1.shop

	if var_64_4 then
		arg_64_0.refresh_times = var_64_4.refresh_times
		arg_64_0.recover_times = var_64_4.recover_times
		arg_64_0.shop_item_list = {}

		for iter_64_8, iter_64_9 in ipairs(var_64_4.item_list) do
			local var_64_5 = {}
			local var_64_6 = iter_64_9.item

			for iter_64_10, iter_64_11 in ipairs(var_64_6.params) do
				table.insert(var_64_5, iter_64_11)
			end

			local var_64_7 = var_64_6.class
			local var_64_8 = iter_64_9.price

			if iter_64_9.is_available == 1 then
				table.insert(arg_64_0.shop_item_list, {
					class = var_64_7,
					params = var_64_5,
					price = var_64_8,
					shop_index = iter_64_8
				})
			end
		end
	else
		arg_64_0.refresh_times = 0
		arg_64_0.recover_times = 0
		arg_64_0.shop_item_list = {}
	end

	arg_64_0.attribute_modify_list = {}

	for iter_64_12, iter_64_13 in ipairs(arg_64_1.attribute_modify_list) do
		local var_64_9 = {
			attribute_id = iter_64_13.attribute_id
		}

		if iter_64_13.target_id then
			var_64_9.target_id = iter_64_13.target_id
		end

		if iter_64_13.delta then
			var_64_9.delta = iter_64_13.delta
		end

		table.insert(arg_64_0.attribute_modify_list, var_64_9)
	end
end

function PolyhedronStageTemplate.GetRewardList(arg_65_0)
	if PolyhedronConst.SAVE_POINT_TYPE.REWARD == arg_65_0.save_point then
		return arg_65_0.item_list
	end

	return {}
end

function PolyhedronStageTemplate.GetTipsList(arg_66_0)
	return arg_66_0.attribute_modify_list
end

PolyhedronRankTemplate = class("PolyhedronRankTemplate")

function PolyhedronRankTemplate.Ctor(arg_67_0, arg_67_1)
	arg_67_0.user_id = arg_67_1.user_id
	arg_67_0.score = arg_67_1.score
	arg_67_0.difficulty = arg_67_1.difficulty
	arg_67_0.rank = arg_67_1.rank
	arg_67_0.timestamp = arg_67_1.timestamp

	local var_67_0 = PlayerData:GetPlayerInfo()

	if var_67_0 and arg_67_0.user_id == var_67_0.userID then
		arg_67_0.nick = var_67_0.nick
		arg_67_0.icon = var_67_0.portrait
		arg_67_0.icon_frame = var_67_0.icon_frame
	else
		arg_67_0.nick = arg_67_1.nick
		arg_67_0.icon = arg_67_1.portrait
		arg_67_0.icon_frame = arg_67_1.frame
	end

	arg_67_0.select_hero_id_list = {}

	local var_67_1 = arg_67_1.team_info[1] and arg_67_1.team_info[1].hero_info_list or {}

	for iter_67_0, iter_67_1 in ipairs(var_67_1) do
		table.insert(arg_67_0.select_hero_id_list, {
			id = iter_67_1.hero_id,
			skin_id = iter_67_1.skin_id
		})
	end
end
