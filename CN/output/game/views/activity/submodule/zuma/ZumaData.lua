local var_0_0 = singletonClass("ZumaData")
local var_0_1 = 0
local var_0_2 = 0
local var_0_3 = {}
local var_0_4 = 0
local var_0_5 = 0
local var_0_6 = {}
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = {}
local var_0_10 = {}
local var_0_11 = {}

function var_0_0.GetZumaRead(arg_1_0, arg_1_1)
	return table.indexof(var_0_9, arg_1_1)
end

function var_0_0.SetZumaRead(arg_2_0, arg_2_1)
	local var_2_0 = ActivityData:GetActivityData(arg_2_1)

	if not var_2_0 or not var_2_0:IsActivitying() then
		return
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ZUMA_OPEN, arg_2_1), 0)

	if not table.indexof(var_0_9, arg_2_1) then
		table.insert(var_0_9, arg_2_1)
	end
end

function var_0_0.GetZumaIdByActId(arg_3_0, arg_3_1)
	if not var_0_8[arg_3_1] then
		for iter_3_0, iter_3_1 in ipairs(ActivityZumaLevelCfg.all) do
			local var_3_0 = ActivityZumaLevelCfg[iter_3_1]

			if var_3_0 then
				var_0_8[var_3_0.activity_id] = iter_3_1
			end
		end
	end

	return var_0_8[arg_3_1]
end

var_0_0.ZUMA_DIFFICULT = {
	NIGHT = 3,
	ESAY = 1,
	HARD = 2
}

function var_0_0.Init(arg_4_0)
	var_0_1 = 0
	var_0_2 = 0
	var_0_4 = 0
	var_0_5 = 0
	var_0_6 = {}
	var_0_7 = {}
	var_0_9 = {}
	var_0_10 = {}
	var_0_11 = {}
end

function var_0_0.InitZumaData(arg_5_0, arg_5_1)
	arg_5_0:SetZumaCoin(arg_5_1.value)

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.talent_list) do
		var_0_6[iter_5_1] = true
	end

	for iter_5_2, iter_5_3 in ipairs(arg_5_1.finish_mission or {}) do
		var_0_7[iter_5_3.id] = {
			id = iter_5_3.id,
			score = iter_5_3.score
		}
	end
end

function var_0_0.GetZumaCoin(arg_6_0)
	return var_0_4
end

function var_0_0.UpdateZumaCoin(arg_7_0, arg_7_1)
	var_0_4 = var_0_4 + arg_7_1
end

function var_0_0.SetZumaCoin(arg_8_0, arg_8_1)
	var_0_4 = arg_8_1
end

function var_0_0.GetZumaTaskData(arg_9_0)
	return TaskData2:GetActivityTaskSortList(arg_9_0:GetZumaActivityID())
end

function var_0_0.GetZumaStageData(arg_10_0, arg_10_1)
	return var_0_7[arg_10_1]
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

	if not var_0_7[var_13_0] then
		var_0_7[var_13_0] = {}
		var_0_7[var_13_0].id = var_13_0
		var_0_7[var_13_0].score = 0
	end

	if arg_13_1.score > var_0_7[var_13_0].score then
		var_0_7[var_13_0].score = arg_13_1.score
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
	for iter_16_0, iter_16_1 in pairs(ActivityZumaLevelCfg.all) do
		local var_16_0 = ActivityZumaLevelCfg[iter_16_1]

		if var_16_0 then
			if not var_0_3[var_16_0.difficult] then
				var_0_3[var_16_0.difficult] = {}
			end

			table.insert(var_0_3[var_16_0.difficult], var_16_0)
		end
	end
end

function var_0_0.GetZumaCfgData(arg_17_0)
	if #var_0_3 == 0 then
		arg_17_0:InitZumaCfgData()
	end

	return var_0_3
end

function var_0_0.GetZumaTalentIsOpen(arg_18_0, arg_18_1)
	return var_0_6[arg_18_1]
end

function var_0_0.SetUseZumaTalent(arg_19_0, arg_19_1)
	var_0_6[arg_19_1] = true
end

function var_0_0.ResetTalentList(arg_20_0)
	var_0_6 = {}
	var_0_10 = {}
	var_0_11 = {}
end

function var_0_0.GetTalentList(arg_21_0)
	return var_0_6
end

function var_0_0.GetZumaTalentIsCanOpen(arg_22_0, arg_22_1)
	local var_22_0 = ActivityZumaTalentCfg[arg_22_1].pre_id

	if var_22_0 == 0 or arg_22_0:GetZumaTalentIsOpen(var_22_0) then
		return true
	end

	return false
end

function var_0_0.GetTalentTreeCfg(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(ActivityZumaTalentCfg.all) do
		local var_23_1 = ActivityZumaTalentCfg[iter_23_1]

		if var_23_1 then
			if not var_23_0[var_23_1.pre_id] then
				var_23_0[var_23_1.pre_id] = {}
			end

			table.insert(var_23_0[var_23_1.pre_id], var_23_1.id)
		end
	end

	return var_23_0
end

function var_0_0.SetTalentRedList(arg_24_0, arg_24_1, arg_24_2)
	var_0_10[arg_24_1] = arg_24_2
end

function var_0_0.GetTalentRedList(arg_25_0, arg_25_1)
	return var_0_10[arg_25_1]
end

function var_0_0.SetTalentReadList(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(var_0_10) do
		if iter_26_1 then
			arg_26_0:SetZumaTalentRead(iter_26_0)
		end
	end

	local var_26_0 = ZumaData:GetZumaCoin()

	for iter_26_2 = #var_0_11, 1, -1 do
		local var_26_1 = var_0_11[iter_26_2]
		local var_26_2 = ActivityZumaTalentCfg[var_26_1]

		if var_26_2 and var_26_0 < var_26_2.need then
			table.remove(var_0_11, iter_26_2)
		end
	end

	manager.redPoint:setTip(RedPointConst.ZUMA_TALENT, 0)
end

function var_0_0.GetZumaTalentRead(arg_27_0, arg_27_1)
	return table.indexof(var_0_11, arg_27_1)
end

function var_0_0.SetZumaTalentRead(arg_28_0, arg_28_1)
	if not table.indexof(var_0_11, arg_28_1) then
		table.insert(var_0_11, arg_28_1)
	end
end

function var_0_0.SetZumaActivityID(arg_29_0, arg_29_1)
	arg_29_0.useActivityID = arg_29_1
end

function var_0_0.GetZumaActivityID(arg_30_0)
	return arg_30_0.useActivityID
end

function var_0_0.SetZumaGameId(arg_31_0, arg_31_1)
	var_0_1 = arg_31_1
end

function var_0_0.GetZumaGameId(arg_32_0)
	return var_0_1
end

function var_0_0.ResetZumaGameData(arg_33_0)
	var_0_2 = 0
end

function var_0_0.SetZumaScore(arg_34_0, arg_34_1)
	var_0_2 = arg_34_1
end

function var_0_0.GetZumaScore(arg_35_0)
	return var_0_2
end

function var_0_0.SetZumaBallCount(arg_36_0, arg_36_1)
	var_0_5 = arg_36_1
end

function var_0_0.GetZumaBallCount(arg_37_0)
	return var_0_5
end

return var_0_0
