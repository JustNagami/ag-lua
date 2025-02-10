local var_0_0 = {}

local function var_0_1()
	if PinballSkillCfg.SkillCfgEx ~= nil then
		return
	end

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(PinballSkillCfg.all) do
		local var_1_1 = PinballSkillCfg[iter_1_1]
		local var_1_2 = PinballRoleSkillData.New()

		var_1_2.sType = var_1_1.effect_type

		local var_1_3 = {
			var_1_1.cost
		}

		for iter_1_2, iter_1_3 in ipairs(var_1_1.effect) do
			table.insert(var_1_3, iter_1_3)
		end

		var_1_2.sValue = var_1_3
		var_1_2.cooldown = var_1_1.cd
		var_1_2.remainCD = 0
		var_1_2.icon = var_1_1.icon
		var_1_2.animName = var_1_1.action
		var_1_2.effectName = var_1_1.special_effects
		var_1_2.desc = var_1_1.description
		var_1_0[iter_1_1] = var_1_2
	end

	PinballSkillCfg.SkillCfgEx = var_1_0
end

function var_0_0.PlayerPinballGame(arg_2_0, arg_2_1)
	var_0_1()

	var_0_0.PlayingStageID = arg_2_0
	var_0_0.PlayingRoleID = arg_2_1

	local var_2_0 = GetPinballDataForExchange()
	local var_2_1 = var_2_0.playerData
	local var_2_2 = var_2_0.enemyData
	local var_2_3 = var_2_0.mapData
	local var_2_4 = PinballPlayerCfg[arg_2_1]

	var_2_1.model = var_2_4.model
	var_2_1.maxHealth = PinballTools.CalcRoleProp(arg_2_1, 1)
	var_2_1.health = PinballTools.CalcRoleProp(arg_2_1, 1)
	var_2_1.attack = PinballTools.CalcRoleProp(arg_2_1, 2)
	var_2_1.abilityPower = PinballTools.CalcRoleProp(arg_2_1, 3)
	var_2_1.maxSkillPoint = PinballTools.CalcRoleProp(arg_2_1, 4)
	var_2_1.skillPoint = PinballTools.CalcRoleProp(arg_2_1, 6)
	var_2_1.skillPointRestore = PinballTools.CalcRoleProp(arg_2_1, 5)

	local var_2_5 = {}

	for iter_2_0, iter_2_1 in ipairs(var_2_4.skill_list) do
		local var_2_6 = PinballSkillCfg.SkillCfgEx[iter_2_1]

		table.insert(var_2_5, var_2_6)
	end

	var_2_1.skillList = var_2_5

	local var_2_7 = PinballStageCfg[arg_2_0]

	var_2_3.blockNumberStart = var_2_7.initial_bricks[1]
	var_2_3.blockRowStartB = var_2_7.initial_bricks[2]
	var_2_3.blockRowStartU = var_2_7.initial_bricks[3] or 0
	var_2_3.blockTypeWeight = clone(var_2_7.bricks_weight)
	var_2_3.blockNumberRound = clone(var_2_7.bricks_num)
	var_2_3.gainBallItemLimit = var_2_7.max_marbles

	local var_2_8 = PinballPlayerCfg[var_2_7.monster_list[1]]

	var_2_2.model = var_2_8.model
	var_2_2.maxHealth = var_2_8.base_attributes[1]
	var_2_2.health = var_2_8.base_attributes[1]
	var_2_2.attack = var_2_8.base_attributes[2]
	var_2_2.abilityPower = var_2_8.base_attributes[3]
	var_2_2.maxSkillPoint = var_2_8.base_attributes[4]
	var_2_2.skillPoint = var_2_8.base_attributes[6]
	var_2_2.skillPointRestore = var_2_8.base_attributes[5]

	local var_2_9 = {}

	for iter_2_2, iter_2_3 in ipairs(var_2_8.skill_list) do
		if iter_2_3 ~= 30903 then
			local var_2_10 = PinballSkillCfg.SkillCfgEx[iter_2_3]

			table.insert(var_2_9, var_2_10)
		end
	end

	var_2_2.skillList = var_2_9
	var_2_2.actionLoop = {}

	DormMinigame.Launch("HZ07_pinball")
end

function var_0_0.RecordStartTime()
	var_0_0.GameStartTime = manager.time:GetServerTime()
end

function var_0_0.EndAndGetTime()
	if not var_0_0.GameStartTime then
		return 0
	end

	return manager.time:GetServerTime() - var_0_0.GameStartTime
end

function var_0_0.SendResultToSdk(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5, arg_5_6)
	local var_5_0 = PinballStageCfg[var_0_0.PlayingStageID]
	local var_5_1 = var_0_0.EndAndGetTime()
	local var_5_2 = {
		id = var_0_0.PlayingRoleID,
		level = PinballData:GetRoleLevel(var_0_0.PlayingRoleID)
	}
	local var_5_3 = 0

	for iter_5_0 = 1, 3 do
		if PinballData:GetStageTargetClear(var_0_0.PlayingStageID, var_5_0.target_list[iter_5_0]) then
			var_5_3 = var_5_3 + 1
		end
	end

	local var_5_4 = "[" .. arg_5_3 .. ", " .. arg_5_4 .. "]"

	SDKTools.SendMessageToSDK("activity_combat_over", {
		activity_id = var_5_0.activity_id,
		stage_id = var_0_0.PlayingStageID,
		result = arg_5_0,
		use_seconds = var_5_1,
		battle_times = arg_5_1,
		hero_list = var_5_2,
		skill_num = arg_5_2,
		combat_star = var_5_3,
		battle_hurt = var_5_4,
		boss_hp = arg_5_5,
		hero_hp = arg_5_6
	})
end

function var_0_0.InitFromServer(arg_6_0)
	PinballData.activityID = arg_6_0.activity_id
	PinballData.stageInfo = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.stage_list) do
		PinballData:SetStageTargets(iter_6_1.id, true, iter_6_1.target_list)
	end

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.role_list) do
		PinballData:SetRoleLevel(iter_6_3.id, iter_6_3.grade)
	end

	PinballData:AddIllustrasionCollection(arg_6_0.monster_illustrations)
	var_0_0.UpdateStageRedPoint()
	var_0_0.UpdateRoleUpgradeRedPoint()
	var_0_0.InitRedPoint()
	manager.notify:CallUpdateFunc(PINBALL_SETTMENT_UPDATE_TARGET_STAR)
end

manager.net:Bind(79411, var_0_0.InitFromServer)
manager.notify:RegistListener(CURRENCY_UPDATE, function(arg_7_0)
	if PinballData.activityID == nil or not PinballTools.IsActivityCoin(arg_7_0) then
		return
	end

	var_0_0.UpdateRoleUpgradeRedPoint()
end)
manager.notify:RegistListener(ACTIVITY_UPDATE, function(arg_8_0)
	if PinballData.activityID == nil then
		return
	end

	if PinballStageCfg.get_id_list_by_activity_id[arg_8_0] then
		var_0_0.UpdateRoleUpgradeRedPoint()
	end
end)

function var_0_0.UpgradeRoleLevel(arg_9_0, arg_9_1, arg_9_2)
	manager.net:SendWithLoadingNew(79412, {
		activity_id = arg_9_0,
		role_id = arg_9_1,
		grade = arg_9_2
	}, 79413, var_0_0.OnUpgradeRoleLevel)
end

function var_0_0.OnUpgradeRoleLevel(arg_10_0, arg_10_1)
	if isSuccess(arg_10_0.result) then
		PinballData:SetRoleLevel(arg_10_0.role_id, arg_10_0.new_grade)
		var_0_0.UpdateRoleUpgradeRedPoint()
	else
		ShowTips(arg_10_0.result)
	end
end

function var_0_0.SendLevelFinish(arg_11_0, arg_11_1)
	local var_11_0 = var_0_0.PlayingStageID
	local var_11_1 = PinballData.activityID

	manager.net:SendWithLoadingNew(79414, {
		is_success = 1,
		activity_id = var_11_1,
		stage_id = var_11_0,
		heap = arg_11_0,
		stage_round = arg_11_1
	}, 79415, var_0_0.OnSendLevelFinish)
end

function var_0_0.OnSendLevelFinish(arg_12_0, arg_12_1)
	if isSuccess(arg_12_0.result) then
		var_0_0.LastRewardList = arg_12_0.reward_list
	else
		ShowTips(arg_12_0.result)
	end
end

function var_0_0.CheckRewardPop()
	if var_0_0.LastRewardList then
		getReward(mergeReward(var_0_0.LastRewardList))

		var_0_0.LastRewardList = nil
	end
end

local function var_0_2(arg_14_0, arg_14_1)
	return string.format("%s_%d", arg_14_0, arg_14_1)
end

function var_0_0.InitRedPoint()
	local var_15_0 = PinballData.activityID
	local var_15_1 = PinballTools.RedPointKey(var_15_0)
	local var_15_2 = var_15_1 .. "_SubMain"
	local var_15_3 = ActivityTools.GetAllTaskSubActivityID(var_15_0)
	local var_15_4 = var_0_2(RedPointConst.ACTIVITY_PINBALL_TASKS, var_15_0)
	local var_15_5 = {}

	for iter_15_0, iter_15_1 in ipairs(var_15_3) do
		table.insert(var_15_5, var_0_2(RedPointConst.ACTIVITY_TASK, iter_15_1))
	end

	manager.redPoint:addGroup(var_15_4, var_15_5)

	local var_15_6 = {}

	for iter_15_2, iter_15_3 in ipairs(PinballPlayerCfg.get_id_list_by_type[1]) do
		local var_15_7 = PinballPlayerCfg[iter_15_3]
		local var_15_8 = var_15_6[var_15_7.activity_id] or {}

		table.insert(var_15_8, PinballTools.UpgradeRedPoint(iter_15_3))

		var_15_6[var_15_7.activity_id] = var_15_8
	end

	local var_15_9 = var_0_2(RedPointConst.ACTIVITY_PINBALL_STAGE, var_15_0)
	local var_15_10 = {}

	for iter_15_4, iter_15_5 in pairs(PinballStageCfg.get_id_list_by_activity_id) do
		local var_15_11 = PinballTools.StageCatRedPoint(iter_15_4)
		local var_15_12 = {}

		for iter_15_6, iter_15_7 in ipairs(iter_15_5) do
			table.insert(var_15_12, PinballTools.StageRedPoint(iter_15_7))
		end

		local var_15_13 = var_15_6[iter_15_4]

		if var_15_13 then
			table.insertto(var_15_12, var_15_13)
		end

		manager.redPoint:addGroup(var_15_11, var_15_12)
		table.insert(var_15_10, var_15_11)
	end

	manager.redPoint:addGroup(var_15_9, var_15_10)
	manager.redPoint:addGroup(var_15_2, {
		var_15_4,
		var_15_9
	}, true)
	manager.redPoint:appendGroup(var_15_1, var_15_2)
end

function var_0_0.UpdateStageRedPoint()
	for iter_16_0, iter_16_1 in ipairs(PinballStageCfg.all) do
		local var_16_0 = PinballTools.StageRedPoint(iter_16_1)
		local var_16_1 = PinballData:GetStageState(iter_16_1) == "unlock"
		local var_16_2 = PinballData.viewedUnlockedLevel[iter_16_1]
		local var_16_3 = var_16_1 and not var_16_2

		manager.redPoint:setTip(var_16_0, var_16_3 and 1 or 0)
	end
end

function var_0_0.UpdateRoleUpgradeRedPoint()
	for iter_17_0, iter_17_1 in ipairs(PinballPlayerCfg.get_id_list_by_type[1]) do
		local var_17_0 = PinballTools.UpgradeRedPoint(iter_17_1)
		local var_17_1 = PinballTools.CheckRoleUnlocked(iter_17_1)
		local var_17_2 = PinballTools.CheckRoleCanUpgrade(iter_17_1)
		local var_17_3 = var_17_1 and var_17_2

		manager.redPoint:setTip(var_17_0, var_17_3 and 1 or 0)
	end
end

return var_0_0
