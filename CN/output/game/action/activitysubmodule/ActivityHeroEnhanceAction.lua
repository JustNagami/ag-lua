local var_0_0 = {}
local var_0_1 = {}

manager.net:Bind(83027, function(arg_1_0)
	ActivityHeroEnhanceData:InitData(arg_1_0)
	Timer.New(function()
		ActivityHeroEnhanceAction.InitRedPoint(arg_1_0)
	end, 1, 0):Start()
end)

function var_0_0.ActivateTalent(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	manager.net:SendWithLoadingNew(83028, {
		activity_id = arg_3_0,
		hero_id = arg_3_1,
		talent_id = arg_3_2
	}, 83029, function(arg_4_0, arg_4_1)
		var_0_0.OnActivateTalent(arg_4_0, arg_4_1, arg_3_3)
	end)
end

function var_0_0.OnActivateTalent(arg_5_0, arg_5_1, arg_5_2)
	if not isSuccess(arg_5_0.result) then
		ShowTips(arg_5_0.result)

		return
	end

	ActivityHeroEnhanceData:ActivateTalent(arg_5_1.activity_id, arg_5_1.talent_id)
	arg_5_2(arg_5_1.activity_id, arg_5_1.talent_id)
end

function var_0_0.DeactivateTalent(arg_6_0, arg_6_1, arg_6_2)
	manager.net:SendWithLoadingNew(83030, {
		activity_id = arg_6_0,
		talent_id = arg_6_1
	}, 83031, function(arg_7_0, arg_7_1)
		var_0_0.OnDeactivateTalent(arg_7_0, arg_7_1, arg_6_2)
	end)
end

function var_0_0.OnDeactivateTalent(arg_8_0, arg_8_1, arg_8_2)
	if not isSuccess(arg_8_0.result) then
		ShowTips(arg_8_0.result)

		return
	end

	ActivityHeroEnhanceData:DeactivateTalent(arg_8_1.activity_id, arg_8_1.talent_id)
	arg_8_2(arg_8_1.activity_id, arg_8_1.talent_id)
end

function var_0_0.InitRedPoint(arg_9_0)
	var_0_1[arg_9_0.activity_id] = {}

	var_0_0.UpdateRedPoint(arg_9_0.activity_id)
end

local function var_0_2(arg_10_0)
	if ActivityHeroEnhanceTools.IsCfgHeroLock(arg_10_0) then
		return false
	end

	local var_10_0 = arg_10_0.activity_id

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.stage_list) do
		if not ActivityHeroEnhanceData:IsStageClear(var_10_0, iter_10_1) and ActivityHeroEnhanceTools.IsCfgStageUnlock(arg_10_0, iter_10_1) then
			return true
		end
	end

	return false
end

function var_0_0.UpdateRedPoint(arg_11_0)
	local var_11_0 = ActivityTools.GetRedPointKey(arg_11_0) .. arg_11_0
	local var_11_1 = string.format("%s_%s", RedPointConst.ACTIVITY_HERO_ENHANCE_STAGE_REWARD, var_11_0)

	manager.redPoint:addGroup(var_11_0, {
		var_11_1
	})

	local var_11_2 = ActivityHeroEnhanceCfg.get_id_list_by_activity_id[arg_11_0]

	if var_11_2 == nil then
		return
	end

	var_0_1[arg_11_0] = var_0_1[arg_11_0] or {}

	local var_11_3 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_2) do
		local var_11_4 = ActivityHeroEnhanceCfg[iter_11_1]
		local var_11_5 = var_11_4.hero_id
		local var_11_6 = string.format("%s_%d_%s", RedPointConst.ACTIVITY_HERO_ENHANCE_STAGE_REWARD, var_11_5, var_11_0)

		if var_0_1[arg_11_0][var_11_6] then
			manager.redPoint:setTip(var_11_6, 0)
		else
			local var_11_7 = var_0_2(var_11_4)

			manager.redPoint:setTip(var_11_6, var_11_7 and 1 or 0)
		end

		table.insert(var_11_3, var_11_6)
	end

	manager.redPoint:addGroup(var_11_1, var_11_3)
end

function var_0_0.BanRedPoint(arg_12_0, arg_12_1)
	if var_0_1[arg_12_0] then
		var_0_1[arg_12_0][arg_12_1] = true

		var_0_0.UpdateRedPoint(arg_12_0)
	end
end

manager.notify:RegistListener(ACTIVITY_UPDATE, function(arg_13_0)
	if ActivityTools.GetActivityType(arg_13_0) == ActivityTemplateConst.ACTIVITY_HERO_ENHANCE then
		var_0_0.UpdateRedPoint(arg_13_0)
	end
end)

return var_0_0
