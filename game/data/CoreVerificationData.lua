local var_0_0 = singletonClass("CoreVerificationData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = 0
local var_0_4 = 0
local var_0_5 = 0
local var_0_6 = {}
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_9 = {}
	var_0_2 = {}
	var_0_6 = {}
	var_0_7 = {}
	var_0_8 = {}
	var_0_3 = 1
	var_0_4 = 2

	for iter_1_0, iter_1_1 in pairs(CoreVerificationInfoCfg.get_id_list_by_cycle) do
		var_0_1[iter_1_0] = {}
		var_0_1[iter_1_0][1] = {}
		var_0_1[iter_1_0][2] = {}

		for iter_1_2, iter_1_3 in ipairs(iter_1_1) do
			local var_1_0 = CoreVerificationInfoCfg[iter_1_3]

			var_0_1[iter_1_0][var_1_0.boss_type][var_1_0.difficult] = iter_1_3
		end
	end

	var_0_2[1] = {}
	var_0_2[2] = {}
	var_0_2[3] = {}
	var_0_2[4] = {}

	for iter_1_4, iter_1_5 in pairs(CoreVerificationRewardCfg.all) do
		local var_1_1 = CoreVerificationRewardCfg[iter_1_5]

		if var_1_1.reward_type == 1 or var_1_1.reward_type == 2 then
			if not var_0_2[var_1_1.reward_type][var_1_1.cycle] then
				var_0_2[var_1_1.reward_type][var_1_1.cycle] = {}
			end

			table.insert(var_0_2[var_1_1.reward_type][var_1_1.cycle], iter_1_5)
		else
			table.insert(var_0_2[var_1_1.reward_type], iter_1_5)
		end
	end

	arg_1_0:SetUpdateCycleCallBack()
end

function var_0_0.ResetStage(arg_2_0)
	var_0_7[1] = {}
	var_0_7[2] = {}

	for iter_2_0, iter_2_1 in ipairs(var_0_8) do
		if CoreVerificationRewardCfg[iter_2_1] and CoreVerificationRewardCfg[iter_2_1].reward_type ~= 4 then
			CoreVerificationRewardCfg[iter_2_1] = false
		end
	end

	for iter_2_2, iter_2_3 in pairs(var_0_6) do
		iter_2_3.passState = false
	end

	var_0_9 = {
		0,
		0
	}
end

function var_0_0.UpdateCycleInfo(arg_3_0, arg_3_1)
	var_0_3 = arg_3_1.now_cycle
	var_0_4 = arg_3_1.next_cycle
	var_0_5 = arg_3_1.refresh_timestamp

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.stage_info) do
		var_0_6[iter_3_1.id] = {}
		var_0_6[iter_3_1.id].passState = iter_3_1.sign == 1
		var_0_6[iter_3_1.id].passTime = iter_3_1.sign == 1 and iter_3_1.min_time / 1000 or 3600
	end

	var_0_8 = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_1.reward_list) do
		var_0_8[iter_3_3] = true
	end

	var_0_7[1] = {}
	var_0_7[2] = {}

	for iter_3_4, iter_3_5 in ipairs(arg_3_1.lock_list) do
		for iter_3_6, iter_3_7 in ipairs(iter_3_5.hero_list) do
			table.insert(var_0_7[iter_3_5.boss_type], iter_3_7)
		end
	end

	var_0_9 = {
		0,
		0
	}

	Debug.Log("初始化")

	local var_3_0 = var_0_1[var_0_3][1]
	local var_3_1 = var_0_1[var_0_3][2]

	for iter_3_8, iter_3_9 in ipairs(var_3_0) do
		if var_0_6[iter_3_9] and var_0_6[iter_3_9].passState then
			var_0_9[1] = iter_3_8
		end
	end

	for iter_3_10, iter_3_11 in ipairs(var_3_1) do
		if var_0_6[iter_3_11] and var_0_6[iter_3_11].passState then
			var_0_9[2] = iter_3_10
		end
	end
end

function var_0_0.BattleStageData(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = CoreVerificationInfoCfg[arg_4_1]
	local var_4_1 = var_4_0.boss_type
	local var_4_2 = var_4_0.difficult

	if var_4_2 > var_0_9[var_4_1] then
		var_0_9[var_4_1] = var_4_2
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		if not table.keyof(var_0_7[var_4_1], iter_4_1) then
			table.insert(var_0_7[var_4_1], iter_4_1)
		end
	end

	if var_0_6[var_4_0.id] then
		var_0_6[var_4_0.id].passState = true

		if arg_4_3 < var_0_6[var_4_0.id].passTime then
			var_0_6[var_4_0.id].passTime = arg_4_3
		end
	else
		var_0_6[var_4_0.id] = {}
		var_0_6[var_4_0.id].passState = true
		var_0_6[var_4_0.id].passTime = arg_4_3
	end

	CoreVerificationAction.UpdateRewardRedPoints()
end

function var_0_0.UpdateRewardData(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_1.reward_list) do
		var_0_8[iter_5_1] = true
	end
end

function var_0_0.GetBossUICfgByBossType(arg_6_0, arg_6_1)
	local var_6_0 = var_0_1[var_0_3][arg_6_1][1]
	local var_6_1 = CoreVerificationInfoCfg[var_6_0].stage_id

	return BossChallengeUICfg[var_6_1] or BossChallengeUICfg[3090009]
end

function var_0_0.GetRecommendByBossType(arg_7_0, arg_7_1)
	local var_7_0 = var_0_1[var_0_3][arg_7_1][1]

	return CoreVerificationInfoCfg[var_7_0].recommend
end

function var_0_0.GetLockHeroByBossType(arg_8_0, arg_8_1)
	return var_0_7[arg_8_1]
end

function var_0_0.GetDiffListByBossType(arg_9_0, arg_9_1)
	return var_0_1[var_0_3][arg_9_1]
end

function var_0_0.GetLockHeroByInfoID(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = CoreVerificationInfoCfg[arg_10_1].boss_type

	if arg_10_2 then
		return var_0_7[var_10_0]
	elseif var_10_0 == 1 then
		return var_0_7[2]
	elseif var_10_0 == 2 then
		return var_0_7[1]
	end

	return var_0_7[1]
end

function var_0_0.GetMaxPassByBossType(arg_11_0, arg_11_1)
	local var_11_0 = var_0_9[arg_11_1] > 0
	local var_11_1 = var_0_9[arg_11_1] > 0 and var_0_9[arg_11_1] or 1
	local var_11_2 = var_0_1[var_0_3][arg_11_1][var_11_1]
	local var_11_3 = var_11_0 and var_0_6[var_11_2].passTime or 0

	return var_11_0, var_11_1, var_11_3
end

function var_0_0.GetMaxUnlockByBossType(arg_12_0, arg_12_1)
	local var_12_0 = 1
	local var_12_1 = PlayerData:GetPlayerInfo().userLevel

	for iter_12_0, iter_12_1 in ipairs(var_0_1[var_0_3][arg_12_1]) do
		if var_0_6[iter_12_1 - 1] and var_12_1 >= CoreVerificationInfoCfg[iter_12_1].unlock_level then
			var_12_0 = iter_12_0
		end
	end

	return var_12_0
end

function var_0_0.GetStageInfoByTypeAndDiff(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = var_0_1[var_0_3][arg_13_1][arg_13_2]

	return var_0_6[var_13_0]
end

function var_0_0.GetInfoCfgByTypeAndDiff(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = var_0_1[var_0_3][arg_14_1][arg_14_2]

	return CoreVerificationInfoCfg[var_14_0]
end

function var_0_0.GetAffixByTypeAndDiff(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = var_0_1[var_0_3][arg_15_1][arg_15_2]

	return CoreVerificationInfoCfg[var_15_0].affix_type
end

function var_0_0.GetRewardListByType(arg_16_0, arg_16_1)
	if arg_16_1 == 1 or arg_16_1 == 2 then
		return var_0_2[arg_16_1][var_0_3]
	else
		return var_0_2[arg_16_1]
	end
end

function var_0_0.CheckFirstReward(arg_17_0)
	local var_17_0 = var_0_2[4]

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if not var_0_8[iter_17_1] then
			return "true"
		end
	end

	return "false"
end

function var_0_0.GetCanReset(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(var_0_8) do
		if CoreVerificationRewardCfg[iter_18_0].reward_type ~= 4 and iter_18_1 then
			return false
		end
	end

	return true
end

function var_0_0.CheckCycleReward(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(var_0_2) do
		for iter_19_2, iter_19_3 in pairs(iter_19_1) do
			if type(iter_19_3) == "table" and iter_19_2 == var_0_3 then
				for iter_19_4, iter_19_5 in pairs(iter_19_3) do
					if not var_0_8[iter_19_5] then
						return true
					end
				end
			elseif type(iter_19_3) == "number" and not var_0_8[iter_19_3] then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetCurCycleInfo(arg_20_0)
	return var_0_1[var_0_3]
end

function var_0_0.GetPreviewInfo(arg_21_0)
	return var_0_1[var_0_4]
end

function var_0_0.GetRefreshTime(arg_22_0)
	return var_0_5
end

function var_0_0.GetTaskProcess(arg_23_0, arg_23_1)
	local var_23_0 = CoreVerificationRewardCfg[arg_23_1].condition
	local var_23_1 = ConditionCfg[var_23_0]
	local var_23_2 = 0

	if var_23_1.type == 11300 then
		local var_23_3 = var_23_1.params[1]

		var_23_2 = var_23_1.params[2] <= var_0_9[var_23_3] and 1 or 0
	elseif var_23_1.type == 11302 then
		local var_23_4 = var_23_1.params[1]

		var_23_2 = var_23_4 <= var_0_9[1] and var_23_4 <= var_0_9[2] and 1 or 0
	elseif var_23_1.type == 11301 then
		local var_23_5 = var_23_1.params[1]
		local var_23_6 = var_0_1[var_0_3][1][var_23_5]
		local var_23_7 = var_0_1[var_0_3][2][var_23_5]

		var_23_2 = var_0_6[var_23_6] and var_0_6[var_23_7] and 1 or 0
	elseif var_23_1.type == 11303 then
		local var_23_8 = var_23_1.params[1]
		local var_23_9 = var_23_1.params[2]
		local var_23_10 = var_0_1[var_0_3][var_23_8][var_23_9]

		var_23_2 = var_0_6[var_23_10] and 1 or 0
	end

	return var_23_2, var_23_1.progress_show, var_23_2 == 1, var_0_8[arg_23_1] or false
end

function var_0_0.IsStageProcess(arg_24_0)
	Debug.Log("报错！")

	return var_0_9[1] > 0 or var_0_9[2] > 0
end

local var_0_10

function var_0_0.SetUpdateCycleCallBack(arg_25_0)
	function var_0_10()
		ShowTips("STAGE_REFRESH_DATA")
		JumpTools.GoToSystem("/coreVerificationMain", nil, ViewConst.SYSTEM_ID.CORE_VERIFICATION)
	end
end

function var_0_0.InvokeUpdateCycleCallBack(arg_27_0)
	if var_0_10 then
		var_0_10()

		var_0_10 = nil
	end
end

function var_0_0.GetIsFirstEnter(arg_28_0)
	return getData(string.format("core_verification"), "first_enter")
end

function var_0_0.SetIsFirstEnter(arg_29_0, arg_29_1)
	saveData(string.format("core_verification"), "first_enter", arg_29_1)
end

return var_0_0
