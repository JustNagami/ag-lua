local var_0_0 = singletonClass("HeroRaceCollectData")
local var_0_1 = {}
local var_0_2 = {}
local var_0_3 = {}

function var_0_0.Init(arg_1_0)
	var_0_1 = {}
	var_0_2 = {}
	var_0_3 = {}

	local var_1_0 = RaceEffectCfg.all

	for iter_1_0, iter_1_1 in pairs(var_1_0) do
		var_0_1[iter_1_1] = 0
	end
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_1.hero_race_collect) do
		table.insert(var_0_2, iter_2_1)
	end

	var_0_0:RefreshHeroRaceCounts()
	var_0_0:RefreshTasksState()
end

function var_0_0.RefreshHeroRaceCounts(arg_3_0)
	local var_3_0 = RaceEffectCfg.all

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		var_0_1[iter_3_1] = 0
	end

	local var_3_1 = HeroData:GetUnlockHeros()

	for iter_3_2, iter_3_3 in pairs(var_3_1) do
		local var_3_2 = HeroCfg[iter_3_3].race

		var_0_1[var_3_2] = var_0_1[var_3_2] + 1
	end
end

function var_0_0.NewHeroUnlock(arg_4_0, arg_4_1)
	arg_4_0:RefreshHeroRaceCounts()
	var_0_0:RefreshTasksState()
end

function var_0_0.GetHeroRaceCount(arg_5_0, arg_5_1)
	if var_0_1[arg_5_1] then
		return var_0_1[arg_5_1]
	end
end

function var_0_0.RefreshTasksState(arg_6_0)
	local var_6_0 = CollectHeroRaceCfg.all

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		local var_6_1 = CollectHeroRaceCfg[iter_6_1]

		if var_0_1[var_6_1.hero_race] < var_6_1.need then
			var_0_0:SetTaskState(iter_6_1, 0)
		elseif table.indexof(var_0_2, iter_6_1) then
			var_0_0:SetTaskState(iter_6_1, 2)
		else
			var_0_0:SetTaskState(iter_6_1, 1)
		end
	end

	var_0_0:UpdateRedPoint()
end

function var_0_0.GetTaskState(arg_7_0, arg_7_1)
	return var_0_3[arg_7_1]
end

function var_0_0.SetTaskState(arg_8_0, arg_8_1, arg_8_2)
	var_0_3[arg_8_1] = arg_8_2
end

function var_0_0.GetAllCanReceiveTasks(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(var_0_3) do
		if iter_9_1 == 1 then
			table.insert(var_9_0, iter_9_0)
		end
	end

	return var_9_0
end

function var_0_0.SetTasksReceived(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_1) do
		table.insert(var_0_2, iter_10_1)
	end

	var_0_0:RefreshTasksState()
end

function var_0_0.GetTasksReceivedCount(arg_11_0)
	local var_11_0 = 0

	for iter_11_0, iter_11_1 in pairs(var_0_3) do
		if iter_11_1 == 2 then
			var_11_0 = var_11_0 + 1
		end
	end

	return var_11_0
end

function var_0_0.GetCanGetRewardIndex(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(var_0_3) do
		if iter_12_1 == 1 then
			local var_12_0 = CollectHeroRaceCfg[iter_12_0].race

			return table.indexof(RaceEffectCfg.all, var_12_0)
		end
	end

	return 1
end

function var_0_0.UpdateRedPoint(arg_13_0)
	local var_13_0 = var_0_0:HasRewardReceive()

	manager.redPoint:setTip(RedPointConst.HERO_RACE_COLLECT_REWARD, var_13_0 and 1 or 0)
end

function var_0_0.HasRewardReceive(arg_14_0)
	local var_14_0 = false

	for iter_14_0, iter_14_1 in pairs(var_0_3) do
		if iter_14_1 == 1 then
			var_14_0 = true

			break
		end
	end

	return var_14_0
end

return var_0_0
