local var_0_0 = singletonClass("PinballData")
local var_0_1 = {}

function var_0_0.Init(arg_1_0)
	for iter_1_0, iter_1_1 in ipairs(PinballPlayerCfg.all) do
		local var_1_0 = PinballPlayerCfg[iter_1_1]

		if var_1_0.type == 1 then
			var_0_1[iter_1_1] = {}
			var_0_1[iter_1_1].level = 1
			var_0_1[iter_1_1].health = var_1_0.base_attributes[1] + var_1_0.growth_attributes[1] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].attack = var_1_0.base_attributes[2] + var_1_0.growth_attributes[2] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].abilityPower = var_1_0.base_attributes[3] + var_1_0.growth_attributes[3] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].maxSkillPoint = var_1_0.base_attributes[4] + var_1_0.growth_attributes[4] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].skillPointRestore = var_1_0.base_attributes[5] + var_1_0.growth_attributes[5] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].startSkillPoint = var_1_0.base_attributes[6] + var_1_0.growth_attributes[6] * var_0_1[iter_1_1].level
			var_0_1[iter_1_1].skillList = clone(var_1_0.skill_list)
		end
	end

	arg_1_0.activityID = nil
	arg_1_0.lastEnterLevelCategory = nil
	arg_1_0.roleLevelInfo = {}
	arg_1_0.stageInfo = {}
	arg_1_0.collection = {}
	arg_1_0.viewedUnlockedLevel = {}
end

function var_0_0.GetPlayerRoleDataByID(arg_2_0, arg_2_1)
	return var_0_1[arg_2_1]
end

function var_0_0.SetRoleLevel(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.roleLevelInfo[arg_3_1] = arg_3_2

	manager.notify:Invoke("PINBALL_ROLE_LEVEL_CHANGE", arg_3_1, arg_3_2)
end

function var_0_0.GetRoleLevel(arg_4_0, arg_4_1)
	local var_4_0

	if PinballTools.CheckRoleUnlocked(arg_4_1) then
		var_4_0 = 1
	end

	return nullable(arg_4_0.roleLevelInfo, arg_4_1) or var_4_0
end

function var_0_0.GetLastEnterStageCategory(arg_5_0)
	return arg_5_0.lastEnterLevelCategory or 1
end

function var_0_0.SetLastEnterStageCategory(arg_6_0, arg_6_1)
	arg_6_0.lastEnterLevelCategory = arg_6_1
end

function var_0_0.GetStageCategoryActivityList(arg_7_0)
	return ActivityTools.GetAllSubActivityByTemplate(arg_7_0.activityID, 349)
end

function var_0_0.SetStageTargets(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_2 then
		local var_8_0 = arg_8_0.stageInfo[arg_8_1] or {}

		arg_8_0.stageInfo[arg_8_1] = var_8_0

		if arg_8_3 then
			for iter_8_0, iter_8_1 in ipairs(arg_8_3) do
				var_8_0[iter_8_1] = true
			end
		end
	else
		arg_8_0.stageInfo[arg_8_1] = nil
	end
end

function var_0_0.AddIllustrasionCollection(arg_9_0, arg_9_1)
	if arg_9_1 then
		for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
			arg_9_0.collection[iter_9_1] = true
		end
	end
end

function var_0_0.GetStageComplete(arg_10_0, arg_10_1)
	return arg_10_0.stageInfo[arg_10_1] ~= nil
end

function var_0_0.GetStageUnlocked(arg_11_0, arg_11_1)
	local var_11_0 = true
	local var_11_1
	local var_11_2 = nullable(PinballStageCfg, arg_11_1, "activity_id")

	if var_11_2 then
		local var_11_3, var_11_4 = ActivityTools.GetActivityStatusWithTips(var_11_2)

		var_11_0, var_11_1 = var_11_3 == 1, var_11_4
	end

	local var_11_5 = nullable(PinballStageCfg, arg_11_1, "pre_stage") or 0

	if var_11_5 ~= 0 and not arg_11_0:GetStageComplete(var_11_5) then
		var_11_0, var_11_1 = false, var_11_1 or GetTipsF("PINBALL_STAGE_UNLOCK_TIPS", nullable(PinballStageCfg, var_11_5, "name") or "")
	end

	return var_11_0, var_11_1
end

function var_0_0.GetStageTargetClear(arg_12_0, arg_12_1, arg_12_2)
	return nullable(arg_12_0.stageInfo, arg_12_1, arg_12_2)
end

function var_0_0.GetStageState(arg_13_0, arg_13_1)
	if arg_13_0:GetStageComplete(arg_13_1) then
		return "complete"
	else
		local var_13_0, var_13_1 = arg_13_0:GetStageUnlocked(arg_13_1)

		if var_13_0 then
			return "unlock"
		else
			return "lock", var_13_1
		end
	end
end

return var_0_0
