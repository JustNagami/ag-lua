StrategyMatrixConst = {
	NODE_STATE = {
		COMPLETE = 2,
		INVALID = 3,
		CURRENT = 1,
		SELECT = 4,
		STATELESS = 5
	}
}
StrategyMatrixTools = {}

function StrategyMatrixTools.GetCoinItem(arg_1_0)
	local var_1_0 = StrategyMatrixCfg[arg_1_0]
	local var_1_1 = var_1_0 and var_1_0.setting_template_id
	local var_1_2 = ActivityMatrixSettingTemplateCfg.get_id_list_by_template_id[var_1_1]

	if var_1_2 then
		for iter_1_0, iter_1_1 in ipairs(var_1_2) do
			if ActivityMatrixSettingTemplateCfg[iter_1_1].type == 15 then
				return ActivityMatrixSettingTemplateCfg[iter_1_1].value[1] or 0
			end
		end
	end

	return 26
end

function StrategyMatrixTools.GetGameTipKey(arg_2_0)
	local var_2_0 = ActivityTools.GetActivityTheme(arg_2_0)

	if var_2_0 == ActivityConst.THEME.VOLUME_DOWN then
		return "ACTIVITY_STRATEGY_MATRIX_DESCRIBE"
	elseif var_2_0 == ActivityConst.THEME.DREAM then
		return "ACTIVITY_THOR_STRATEGY_MATRIX_DESCRIBE"
	elseif var_2_0 == ActivityConst.THEME.ACTIVITY_2_1 then
		return "ACTIVITY_ROGUELIKE_DESCRIBE_" .. ActivityConst.ACTIVITY_ROGUELIKE_DIFFICULT_2_1
	elseif var_2_0 == ActivityConst.THEME.ACTIVITY_2_6 then
		return "ACTIVITY_ROGUELIKE_DESCRIBE_" .. ActivityConst.ACTIVITY_ROGUELIKE_NORMAL_2_6
	end

	return ""
end

StrategyMatrixHeroTemplate = class("StrategyMatrixHeroTemplate", MatrixHeroTemplate)

function StrategyMatrixHeroTemplate.Ctor(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0.activity_id = arg_3_1

	StrategyMatrixHeroTemplate.super.Ctor(arg_3_0, arg_3_2, arg_3_3)
end

function StrategyMatrixHeroTemplate.GetWeaponServantEffectLevel(arg_4_0)
	return StrategyMatrixData:GetWeaponServantLevel(arg_4_0.activity_id) or 1
end

StrategyMatrixPhaseTemplate = class("StrategyMatrixPhaseTemplate")

function StrategyMatrixPhaseTemplate.Ctor(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.activity_id = arg_5_1
	arg_5_0.phase_id = arg_5_2.phase_id

	local var_5_0 = arg_5_2.event

	arg_5_0.cur_event_id = var_5_0.event_id
	arg_5_0.envent_params = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_0.params) do
		table.insert(arg_5_0.envent_params, iter_5_1)
	end

	local var_5_1 = arg_5_2.reward

	arg_5_0.reward_items = {}

	for iter_5_2, iter_5_3 in ipairs(var_5_1.matrix_item_id_list) do
		table.insert(arg_5_0.reward_items, iter_5_3)
	end

	arg_5_0.give_up_item_id = var_5_1.give_up_matrix_item_id
end

function StrategyMatrixPhaseTemplate.GetPhase(arg_6_0)
	return arg_6_0.phase_id
end

function StrategyMatrixPhaseTemplate.GetParams(arg_7_0)
	if MatrixConst.PHASE_TYPE.ACTION == arg_7_0.phase_id then
		return {
			arg_7_0.cur_event_id
		}
	elseif MatrixConst.PHASE_TYPE.REWARD == arg_7_0.phase_id then
		return arg_7_0.reward_items
	else
		return {}
	end
end

function StrategyMatrixPhaseTemplate.GetData(arg_8_0)
	local var_8_0 = StrategyMatrixEventTemplateCfg[arg_8_0.cur_event_id]

	if MatrixConst.EVENT_TYPE.SHOP == var_8_0.event_type then
		local var_8_1 = arg_8_0.envent_params[1]
		local var_8_2 = {}
		local var_8_3 = #arg_8_0.envent_params

		for iter_8_0 = 2, var_8_3 do
			local var_8_4 = arg_8_0.envent_params[iter_8_0]

			if var_8_4 and var_8_4 ~= 0 then
				local var_8_5 = MatrixItemCfg[var_8_4].price[1]
				local var_8_6 = var_8_5[1]
				local var_8_7 = var_8_5[2]
				local var_8_8 = 1
				local var_8_9 = iter_8_0 - 1

				if var_8_9 == 1 then
					var_8_8 = 1 - StrategyMatrixData:GetFirstGoodsDiscount(arg_8_0.activity_id) / 1000

					local var_8_10 = var_8_7 * StrategyMatrixData:GetFirstGoodsDiscount(arg_8_0.activity_id) / 1000

					var_8_7 = math.floor(var_8_7 - var_8_10)
				end

				table.insert(var_8_2, {
					index = var_8_9,
					id = var_8_4,
					discount = var_8_8,
					priceId = var_8_6,
					priceNum = var_8_7,
					priceOriginal = var_8_5[2]
				})
			end
		end

		return var_8_1, var_8_2
	else
		return arg_8_0.envent_params[1] or 0
	end
end

function StrategyMatrixPhaseTemplate.GetShops(arg_9_0)
	return {}
end

function StrategyMatrixPhaseTemplate.GetGiveUpItemId(arg_10_0)
	return arg_10_0.give_up_item_id or 0
end

StrategyMartixUserTemplata = class("StrategyMartixUserTemplata")

function StrategyMartixUserTemplata.Ctor(arg_11_0, arg_11_1)
	arg_11_0:SetData(arg_11_1)

	arg_11_0.battle_hero_id_list_cache = nil
end

function StrategyMartixUserTemplata.SetData(arg_12_0, arg_12_1)
	arg_12_0.activity_id = arg_12_1.activity_id
	arg_12_0.roguelike_score = arg_12_1.score

	local var_12_0 = arg_12_1.matrix

	arg_12_0.game_state = var_12_0.game_state

	local var_12_1 = var_12_0.best_performance

	arg_12_0.success_times = var_12_1.success_times
	arg_12_0.min_clear_time = var_12_1.min_clear_time

	local var_12_2 = var_12_0.progress

	arg_12_0:UpdateProcess(var_12_2)
end

function StrategyMartixUserTemplata.UpdateProcess(arg_13_0, arg_13_1)
	if MatrixConst.STATE_TYPE.NOTSTARTED == arg_13_0.game_state then
		return
	end

	arg_13_0.tier_id = arg_13_1.tier_id
	arg_13_0.artifact_list = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_1.artifact_list) do
		local var_13_0 = iter_13_1.id
		local var_13_1 = iter_13_1.wins

		table.insert(arg_13_0.artifact_list, {
			id = var_13_0,
			wins = var_13_1
		})
	end

	arg_13_0.phase = StrategyMatrixPhaseTemplate.New(arg_13_0.activity_id, arg_13_1.phase)
	arg_13_0.matrix_hero_net_rec = {}
	arg_13_0.matrix_hero_id_net_rec = {}

	for iter_13_2, iter_13_3 in ipairs(arg_13_1.hero_list) do
		local var_13_2 = iter_13_3.hero_id
		local var_13_3 = HeroStandardSystemCfg[var_13_2]

		if var_13_3 then
			local var_13_4 = var_13_3.hero_id
			local var_13_5 = StrategyMatrixHeroTemplate.New(arg_13_0.activity_id, var_13_4, var_13_2)

			var_13_5:InitData(iter_13_3)

			arg_13_0.matrix_hero_net_rec[var_13_4] = var_13_5

			table.insert(arg_13_0.matrix_hero_id_net_rec, var_13_4)
		end
	end

	arg_13_0.custom_affix_id_list = {}

	for iter_13_4, iter_13_5 in ipairs(arg_13_1.custom_affix_id_list) do
		table.insert(arg_13_0.custom_affix_id_list, iter_13_5)
	end

	arg_13_0.attribute_list = {}

	for iter_13_6, iter_13_7 in ipairs(arg_13_1.attribute_list) do
		local var_13_6 = iter_13_7.id
		local var_13_7 = iter_13_7.value

		arg_13_0.attribute_list[var_13_6] = var_13_7
	end

	arg_13_0.stackable_item_list = {}

	for iter_13_8, iter_13_9 in ipairs(arg_13_1.stackable_item_list) do
		arg_13_0.stackable_item_list[iter_13_9.stackable_item_type] = iter_13_9.stackable_item_num
	end

	local var_13_8 = arg_13_1.map

	arg_13_0.map_id = var_13_8.map_id
	arg_13_0.node_list = {}

	for iter_13_10, iter_13_11 in ipairs(var_13_8.node_list) do
		local var_13_9 = iter_13_11.id

		arg_13_0.node_list[var_13_9] = {
			event_id = iter_13_11.event_id,
			state = iter_13_11.state
		}
	end

	arg_13_0.effect_list = {}

	for iter_13_12, iter_13_13 in ipairs(arg_13_1.effect_list) do
		local var_13_10 = iter_13_13.id
		local var_13_11 = iter_13_13.level

		table.insert(arg_13_0.effect_list, {
			id = var_13_10,
			level = var_13_11
		})
	end
end

function StrategyMartixUserTemplata.GetMatrixCoint(arg_14_0)
	return arg_14_0.stackable_item_list and arg_14_0.stackable_item_list[1] or 0
end

function StrategyMartixUserTemplata.GetIsClearance(arg_15_0)
	if arg_15_0.success_times == nil then
		return false
	end

	return arg_15_0.success_times > 0
end

function StrategyMartixUserTemplata.GetMapId(arg_16_0)
	return arg_16_0.map_id
end

function StrategyMartixUserTemplata.GetNodeList(arg_17_0)
	return arg_17_0.node_list
end

function StrategyMartixUserTemplata.GetEffectList(arg_18_0)
	return arg_18_0.effect_list or {}
end

function StrategyMartixUserTemplata.RoguelikeScore(arg_19_0)
	return arg_19_0.roguelike_score or 0
end
