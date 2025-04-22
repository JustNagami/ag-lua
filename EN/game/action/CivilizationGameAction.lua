local var_0_0 = {}

manager.net:Bind(79511, function(arg_1_0)
	Debug.Log("79511ok")
	CivilizationGameData:InitServerData(arg_1_0)
end)

local function var_0_1(arg_2_0)
	local var_2_0 = {}

	for iter_2_0 = 0, arg_2_0.Count - 1 do
		table.insert(var_2_0, arg_2_0[iter_2_0])
	end

	return var_2_0
end

function var_0_0.GameOver(arg_3_0, arg_3_1)
	local var_3_0 = CivilizationGameTools.GetNewIlluList(arg_3_1)
	local var_3_1 = {
		activity_id = ActivityConst.ACTIVITY_CIVILIZATION,
		stage_id = arg_3_1.stageID,
		hero_id = arg_3_1.heroID,
		collect_skill = var_0_1(arg_3_1.techList),
		hero_materials = var_0_1(arg_3_1.hexList),
		illustrations_list = var_3_0,
		sign = arg_3_0
	}

	manager.net:SendWithLoadingNew(79512, var_3_1, 79513, function(arg_4_0, arg_4_1)
		var_0_0.GameOverCallBack(arg_4_0, arg_4_1)
	end)
end

function var_0_0.GameOverCallBack(arg_5_0, arg_5_1)
	if isSuccess(arg_5_0.result) then
		CivilizationGameData:UpdateData(arg_5_1.illustrations_list, arg_5_1.stage_id, arg_5_1.sign)
		JumpTools.OpenPageByJump("/civilizationGameOverView", {
			isWin = arg_5_1.sign,
			stageID = arg_5_1.stage_id
		})
	else
		ShowTips(arg_5_0.result)
	end
end

function var_0_0.SendMessage(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = {
		activity_id = arg_6_0.activityID,
		stage_id = arg_6_0.stageID,
		result = arg_6_0.result,
		hero_id = arg_6_0.heroID,
		use_seconds = arg_6_0.seconds,
		sequence_id = arg_6_0.stageID,
		battle_times = arg_6_0.turn,
		point_list = table.toString(arg_6_0.buryBlockData),
		use_skill_list = table.toString(arg_6_0.useSkillData),
		params_list = table.toString(arg_6_0.sourceData),
		skill_list = table.toString(arg_6_0.burySkillData)
	}

	SDKTools.SendMessageToSDK("activity_combat_over", var_6_1)
end

return var_0_0
