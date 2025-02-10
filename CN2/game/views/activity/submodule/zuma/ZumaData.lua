local var_0_0 = singletonClass("ZumaData")
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = 0
local var_0_4 = {}
local var_0_5 = 0
local var_0_6 = 0
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = {}
local var_0_11 = {}
local var_0_12 = {}
local var_0_13 = false
local var_0_14 = 0
local var_0_15 = -1

function var_0_0.GetZumaRead(arg_1_0, arg_1_1)
	return table.indexof(var_0_10, arg_1_1)
end

function var_0_0.SetZumaRead(arg_2_0, arg_2_1)
	local var_2_0 = ActivityData:GetActivityData(arg_2_1)

	if not var_2_0 or not var_2_0:IsActivitying() then
		return
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_2_1), 0)

	if not table.indexof(var_0_10, arg_2_1) then
		table.insert(var_0_10, arg_2_1)
	end
end

function var_0_0.GetZumaIdByActId(arg_3_0, arg_3_1)
	if not var_0_9[arg_3_1] then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0:GetZumaLevelIDList() or {}) do
			local var_3_0 = ActivityZumaLevelCfg[iter_3_1]

			if var_3_0 then
				var_0_9[var_3_0.activity_id] = iter_3_1
			end
		end
	end

	return var_0_9[arg_3_1]
end

var_0_0.ZUMA_DIFFICULT = {
	NIGHT = 3,
	ESAY = 1,
	HARD = 2
}

function var_0_0.Init(arg_4_0)
	var_0_1 = 0
	var_0_2 = 0
	var_0_3 = 0
	var_0_5 = 0
	var_0_6 = 0
	var_0_7 = {}
	var_0_8 = {}
	var_0_10 = {}
	var_0_11 = {}
	var_0_12 = {}
	var_0_13 = false
	var_0_14 = 0
	var_0_15 = -1
end

function var_0_0.InitZumaData(arg_5_0, arg_5_1)
	arg_5_0:SetZumaCoin(arg_5_1.value)

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.talent_list) do
		var_0_7[iter_5_1] = true
	end

	arg_5_0:OpenDefaultUnlockTalent()

	for iter_5_2, iter_5_3 in ipairs(arg_5_1.finish_mission or {}) do
		var_0_8[iter_5_3.id] = {
			id = iter_5_3.id,
			score = iter_5_3.score
		}
	end

	var_0_14 = arg_5_1.endless_all_score
end

function var_0_0.GetZumaCoin(arg_6_0)
	return var_0_5
end

function var_0_0.UpdateZumaCoin(arg_7_0, arg_7_1)
	var_0_5 = var_0_5 + arg_7_1
end

function var_0_0.SetZumaCoin(arg_8_0, arg_8_1)
	var_0_5 = arg_8_1
end

function var_0_0.GetZumaTaskData(arg_9_0)
	return TaskData2:GetActivityTaskSortList(arg_9_0:GetZumaActivityID())
end

function var_0_0.GetZumaStageData(arg_10_0, arg_10_1)
	return var_0_8[arg_10_1]
end

function var_0_0.GetZumaStageScore(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetZumaStageData(arg_11_1)

	return var_11_0 and var_11_0.score or nil
end

function var_0_0.GetZumaFinishPointList(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {}
	local var_12_1 = 0

	for iter_12_0, iter_12_1 in pairs(arg_12_2) do
		local var_12_2 = ActivityPointRewardCfg[iter_12_1]

		if arg_12_1 >= var_12_2.need then
			table.insert(var_12_0, var_12_2)

			var_12_1 = var_12_1 + var_12_2.reward_item_list[1][2]
		end
	end

	return var_12_0, var_12_1
end

function var_0_0.UpdateZumaStageData(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.id
	local var_13_1 = ActivityZumaLevelCfg[var_13_0]

	if not var_0_8[var_13_0] then
		var_0_8[var_13_0] = {}
		var_0_8[var_13_0].id = var_13_0
		var_0_8[var_13_0].score = 0
	end

	if arg_13_1.score > var_0_8[var_13_0].score then
		var_0_8[var_13_0].score = arg_13_1.score
	end

	if var_13_1.difficult == ZumaConst.ZUMA_DIFFICULT.ENDLESS then
		var_0_14 = var_0_14 + arg_13_1.score
	end
end

function var_0_0.GetZumaStageOpenTime(arg_14_0, arg_14_1)
	local var_14_0 = ActivityZumaLevelCfg[arg_14_1]
	local var_14_1 = ActivityData:GetActivityData(var_14_0.activity_id)

	if (var_14_1 and var_14_1.startTime or 0) >= manager.time:GetServerTime() then
		local var_14_2 = GetTips("OPEN_TIME")

		return string.format(var_14_2, manager.time:GetLostTimeStr(var_14_1.startTime, false, true))
	end

	return nil
end

function var_0_0.GetZumaBeforeIsFinish(arg_15_0, arg_15_1)
	local var_15_0 = ActivityZumaLevelCfg[arg_15_1].pre_id

	if var_15_0 == 0 or arg_15_0:GetZumaStageScore(var_15_0) then
		return true
	end

	return false
end

function var_0_0.InitZumaCfgData(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0:GetZumaLevelIDList() or {}) do
		local var_16_0 = ActivityZumaLevelCfg[iter_16_1]

		if var_16_0 then
			if not var_0_4[var_16_0.difficult] then
				var_0_4[var_16_0.difficult] = {}
			end

			table.insert(var_0_4[var_16_0.difficult], var_16_0)
		end
	end
end

function var_0_0.GetZumaLevelIDList(arg_17_0)
	return ActivityZumaLevelCfg.get_id_list_by_main_activity_id[arg_17_0:GetZumaActivityID()]
end

function var_0_0.GetZumaCfgData(arg_18_0)
	if #var_0_4 == 0 then
		arg_18_0:InitZumaCfgData()
	end

	return var_0_4
end

function var_0_0.OpenDefaultUnlockTalent(arg_19_0)
	if not var_0_7[2002] and arg_19_0:GetZumaActivityID() == ActivityConst.ACTIVITY_3_11_ZUMA then
		ZumaAction.OpenZumaTalent(2002, arg_19_0:GetZumaActivityID())
	end
end

function var_0_0.GetZumaTalentIDList(arg_20_0)
	local var_20_0 = {}
	local var_20_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_20_0:GetZumaActivityID()]

	for iter_20_0, iter_20_1 in pairs(var_20_1 or {}) do
		if ActivityZumaTalentCfg[iter_20_1].type == 1 then
			table.insert(var_20_0, iter_20_1)
		end
	end

	return var_20_0
end

function var_0_0.GetZumaTalentIsOpen(arg_21_0, arg_21_1)
	return var_0_7[arg_21_1]
end

function var_0_0.SetUseZumaTalent(arg_22_0, arg_22_1)
	var_0_7[arg_22_1] = true
end

function var_0_0.ResetTalentList(arg_23_0)
	var_0_7 = {}
	var_0_11 = {}
	var_0_12 = {}

	arg_23_0:OpenDefaultUnlockTalent()
end

function var_0_0.GetTalentList(arg_24_0)
	return var_0_7
end

function var_0_0.GetTalentListBySort(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(var_0_7) do
		table.insert(var_25_0, iter_25_0)
	end

	table.sort(var_25_0)

	return var_25_0
end

function var_0_0.GetZumaTalentIsCanOpen(arg_26_0, arg_26_1)
	local var_26_0 = ActivityZumaTalentCfg[arg_26_1].pre_id_list

	for iter_26_0, iter_26_1 in pairs(var_26_0) do
		if iter_26_1 ~= 0 and not arg_26_0:GetZumaTalentIsOpen(iter_26_1) then
			return false
		end
	end

	return true
end

function var_0_0.GetTalentTreeCfg(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0:GetZumaTalentIDList() or {}) do
		local var_27_1 = ActivityZumaTalentCfg[iter_27_1]

		if var_27_1 then
			local var_27_2 = var_27_1.pre_id_list

			for iter_27_2, iter_27_3 in pairs(var_27_2) do
				if not var_27_0[iter_27_3] then
					var_27_0[iter_27_3] = {}
				end

				table.insert(var_27_0[iter_27_3], var_27_1.id)
			end
		end
	end

	return var_27_0
end

function var_0_0.SetTalentRedList(arg_28_0, arg_28_1, arg_28_2)
	var_0_11[arg_28_1] = arg_28_2
end

function var_0_0.GetTalentRedList(arg_29_0, arg_29_1)
	return var_0_11[arg_29_1]
end

function var_0_0.SetTalentReadList(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(var_0_11) do
		if iter_30_1 then
			arg_30_0:SetZumaTalentRead(iter_30_0)
		end
	end

	local var_30_0 = ZumaData:GetZumaCoin()

	for iter_30_2 = #var_0_12, 1, -1 do
		local var_30_1 = var_0_12[iter_30_2]
		local var_30_2 = ActivityZumaTalentCfg[var_30_1]

		if var_30_2 and var_30_0 < var_30_2.need then
			table.remove(var_0_12, iter_30_2)
		end
	end

	manager.redPoint:setTip(RedPointConst.ZUMA_TALENT, 0)
end

function var_0_0.GetZumaTalentRead(arg_31_0, arg_31_1)
	return table.indexof(var_0_12, arg_31_1)
end

function var_0_0.SetZumaTalentRead(arg_32_0, arg_32_1)
	if not table.indexof(var_0_12, arg_32_1) then
		table.insert(var_0_12, arg_32_1)
	end
end

function var_0_0.GetSkillBaseTalentIDList(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_33_0:GetZumaActivityID()]

	for iter_33_0, iter_33_1 in ipairs(var_33_1 or {}) do
		local var_33_2 = ActivityZumaTalentCfg[iter_33_1]

		if var_33_2 and var_33_2.type == 1 and var_33_2.pre_id_list[1] and var_33_2.pre_id_list[1] == 0 then
			table.insert(var_33_0, iter_33_1)
		end
	end

	return var_33_0
end

function var_0_0.GetSkillGroupList(arg_34_0, arg_34_1)
	local var_34_0 = {}

	table.insert(var_34_0, arg_34_1)

	local var_34_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_34_0:GetZumaActivityID()]

	for iter_34_0, iter_34_1 in ipairs(var_34_1 or {}) do
		local var_34_2 = ActivityZumaTalentCfg[iter_34_1]

		if #var_34_2.pre_id_list == 1 and var_34_2.pre_id_list[1] and var_34_2.pre_id_list[1] == arg_34_1 then
			table.insert(var_34_0, iter_34_1)
		end
	end

	return var_34_0
end

function var_0_0.GetFinallyTalentID(arg_35_0)
	return ZumaConst.ZUMA_FINALLY_ID
end

function var_0_0.GetRandomTalentList(arg_36_0)
	local var_36_0 = {}
	local var_36_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_36_0:GetZumaActivityID()]

	for iter_36_0, iter_36_1 in ipairs(var_36_1 or {}) do
		if ActivityZumaTalentCfg[iter_36_1].type == 3 then
			table.insert(var_36_0, iter_36_1)
		end
	end

	return var_36_0
end

function var_0_0.SetEndlessMapRandIndex(arg_37_0, arg_37_1)
	var_0_15 = arg_37_1
end

function var_0_0.GetEndlessMapRandIndex(arg_38_0)
	return var_0_15
end

function var_0_0.SetZumaEndless(arg_39_0, arg_39_1)
	var_0_13 = arg_39_1
end

function var_0_0.GetZumaIsUseEndless(arg_40_0)
	return var_0_13
end

function var_0_0.GetEndlessEffectList(arg_41_0)
	local var_41_0 = {}
	local var_41_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_41_0:GetZumaActivityID()]

	for iter_41_0, iter_41_1 in pairs(var_41_1 or {}) do
		local var_41_2 = ActivityZumaTalentCfg[iter_41_1]

		if var_41_2.type == 2 and var_0_14 >= var_41_2.need then
			for iter_41_2, iter_41_3 in pairs(ActivityZumaTalentCfg[iter_41_1].effect_list) do
				table.insert(var_41_0, iter_41_3)
			end
		end
	end

	return var_41_0
end

function var_0_0.GetEndlessTalentList(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = ActivityZumaTalentCfg.get_id_list_by_activity_id[arg_42_0:GetZumaActivityID()]

	for iter_42_0, iter_42_1 in ipairs(var_42_1 or {}) do
		if ActivityZumaTalentCfg[iter_42_1].type == 2 then
			table.insert(var_42_0, iter_42_1)
		end
	end

	table.sort(var_42_0, function(arg_43_0, arg_43_1)
		local var_43_0 = ActivityZumaTalentCfg[arg_43_0]
		local var_43_1 = ActivityZumaTalentCfg[arg_43_1]

		if var_43_0.need < var_43_1.need then
			return true
		else
			return false
		end
	end)

	return var_42_0
end

function var_0_0.GetEndlessScore(arg_44_0)
	return var_0_14
end

function var_0_0.SetZumaSkillID(arg_45_0, arg_45_1)
	var_0_2 = arg_45_1 or 0
end

function var_0_0.GetZumaSkillID(arg_46_0)
	return var_0_2
end

function var_0_0.GetZumaSkillTypeID(arg_47_0)
	if ZumaConst.ZUMA_TALENT_TO_SKILL[var_0_2] then
		return ZumaConst.ZUMA_TALENT_TO_SKILL[var_0_2]
	else
		return 0
	end
end

function var_0_0.SetZumaActivityID(arg_48_0, arg_48_1)
	arg_48_0.useActivityID = arg_48_1
end

function var_0_0.GetZumaActivityID(arg_49_0)
	return arg_49_0.useActivityID or ActivityConst.ACTIVITY_3_11_ZUMA
end

function var_0_0.SetZumaGameId(arg_50_0, arg_50_1)
	var_0_1 = arg_50_1
end

function var_0_0.GetZumaGameId(arg_51_0)
	return var_0_1
end

function var_0_0.ResetZumaGameData(arg_52_0)
	var_0_3 = 0
end

function var_0_0.SetZumaScore(arg_53_0, arg_53_1)
	var_0_3 = arg_53_1
end

function var_0_0.GetZumaScore(arg_54_0)
	return var_0_3
end

function var_0_0.SetZumaBallCount(arg_55_0, arg_55_1)
	var_0_6 = arg_55_1
end

function var_0_0.GetZumaBallCount(arg_56_0)
	return var_0_6
end

local var_0_16 = 0
local var_0_17 = {}

function var_0_0.InitGamePointData(arg_57_0)
	var_0_16 = 0
	var_0_17 = {}
end

function var_0_0.RecordEndlessPointMapNameToList(arg_58_0, arg_58_1)
	table.insert(var_0_17, {
		arg_58_1
	})
end

function var_0_0.RecordEndlessPointScoreToList(arg_59_0)
	local var_59_0 = var_0_3
	local var_59_1 = 0
	local var_59_2 = 0

	for iter_59_0, iter_59_1 in pairs(var_0_17) do
		local var_59_3 = iter_59_1[2]

		if not score then
			var_59_2 = iter_59_0

			break
		else
			var_59_1 = var_59_3
		end
	end

	table.insert(var_0_17[var_59_2], var_59_0 - var_59_1)
end

function var_0_0.RecordPointSkillUseTimes(arg_60_0, arg_60_1)
	var_0_16 = arg_60_1
end

function var_0_0.GetRecordPointData(arg_61_0)
	return var_0_17, var_0_16
end

return var_0_0
