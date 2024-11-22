local var_0_0 = singletonClass("DormLinkGameData")
local var_0_1 = require("cjson")
local var_0_2 = import("game.data.DormLinkGameTemplate")
local var_0_3
local var_0_4
local var_0_5
local var_0_6
local var_0_7
local var_0_8
local var_0_9
local var_0_10
local var_0_11
local var_0_12

function var_0_0.Init(arg_1_0)
	var_0_3 = nil
	var_0_8 = nil
	var_0_12 = nil
end

function var_0_0.CheckToEnterDormLinkScene(arg_2_0, arg_2_1)
	var_0_8 = arg_2_1

	if not ActivityLinkGameCfg[var_0_8] then
		var_0_8 = nil

		return
	end

	arg_2_0:InitGameInfo()
	DormMinigame.Launch("HZ07_lianliankan")
end

function var_0_0.GetCurLevelID(arg_3_0)
	if var_0_8 then
		return var_0_8
	end
end

function var_0_0.InitLevelInfo(arg_4_0, arg_4_1)
	var_0_3 = arg_4_1.activity_id
	var_0_10 = {}
	var_0_11 = {}

	for iter_4_0, iter_4_1 in ipairs(ActivityLinkGameCfg.all) do
		local var_4_0 = {
			clear = false,
			activityID = iter_4_1,
			difficultyLevel = ActivityLinkGameCfg[iter_4_1].difficult
		}

		var_0_10[iter_4_1] = var_4_0
	end

	for iter_4_2, iter_4_3 in ipairs(arg_4_1.link_game) do
		if var_0_10[iter_4_3.id] then
			var_0_10[iter_4_3.id].maxPoint = iter_4_3.point
		end
	end

	for iter_4_4, iter_4_5 in ipairs(arg_4_1.receive_reward) do
		arg_4_0:SetRewardInfo(iter_4_5, true)
	end

	arg_4_0:CheckUnCompleteLevel()
	arg_4_0:CheckUnReciveLevelReward()
	var_0_0.InitRedPoint(var_0_3)
end

local function var_0_13(arg_5_0, arg_5_1)
	return string.format("%s_%d", arg_5_0, arg_5_1)
end

function var_0_0.RedPointKey(arg_6_0, arg_6_1)
	return var_0_13(arg_6_1, var_0_3)
end

var_0_0.LIANLIANKAN_IN_GAME = "LINKGAME_INGAME"
var_0_0.LIANLIANKAN_LEVEL_REWARD = "LINKGAME_LEVEL_REWARD"
var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL = "LINKGAME_UNCOMPLETE_LEVEL"
var_0_0.LIANLIANKAN_TASK_REWARD = "LINKGAME_TASK_REWARD"

function var_0_0.InitRedPoint(arg_7_0)
	var_0_12 = nil

	local var_7_0 = ActivityTools.GetAllTaskSubActivityID(arg_7_0)
	local var_7_1 = var_0_13(var_0_0.LIANLIANKAN_IN_GAME, arg_7_0)
	local var_7_2 = var_0_13(var_0_0.LIANLIANKAN_TASK_REWARD, arg_7_0)
	local var_7_3 = var_0_13(var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL, arg_7_0)
	local var_7_4 = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		table.insert(var_7_4, var_0_13(RedPointConst.ACTIVITY_TASK, iter_7_1))
	end

	manager.redPoint:addGroup(var_7_2, var_7_4)

	local var_7_5 = {}

	for iter_7_2, iter_7_3 in ipairs(DormLinkGameTools:GetLevelActivityList(arg_7_0)) do
		table.insert(var_7_5, var_0_13(var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL, iter_7_3))
	end

	manager.redPoint:addGroup(var_7_3, var_7_5)
	manager.redPoint:addGroup(var_7_1, {
		var_0_13(var_0_0.LIANLIANKAN_LEVEL_REWARD, arg_7_0),
		var_7_3
	})
	manager.redPoint:addGroup(var_0_13(RedPointConst.LIANLIANKAN, arg_7_0), {
		var_7_2,
		var_7_1
	})
end

function var_0_0.GetAwardInfo(arg_8_0, arg_8_1)
	if var_0_11 then
		return var_0_11[arg_8_1]
	end
end

function var_0_0.SetRewardInfo(arg_9_0, arg_9_1, arg_9_2)
	if not var_0_11 then
		var_0_11 = {}
	end

	var_0_11[arg_9_1] = arg_9_2
end

function var_0_0.GetMainActivityID(arg_10_0)
	return var_0_3
end

function var_0_0.GetLevelActivityIDList(arg_11_0)
	return DormLinkGameTools:GetLevelActivityList(var_0_3)
end

function var_0_0.GetLevelControlledByActivity(arg_12_0, arg_12_1)
	local var_12_0
	local var_12_1
	local var_12_2

	for iter_12_0, iter_12_1 in ipairs(ActivityLinkGameCfg.get_id_list_by_activity_id[arg_12_1]) do
		local var_12_3 = ActivityLinkGameCfg[iter_12_1]

		if var_12_0 == nil and var_12_3.difficult == 1 then
			var_12_0 = iter_12_1
		elseif var_12_1 == nil and var_12_3.difficult == 2 then
			var_12_1 = iter_12_1
		elseif var_12_2 == nil and var_12_3.diffcult ~= 1 and var_12_3.diffcult ~= 2 then
			var_12_2 = iter_12_1
		end

		if var_12_0 and var_12_1 or var_12_2 then
			break
		end
	end

	return var_12_0, var_12_1, var_12_2
end

function var_0_0.GetLevelInfoList(arg_13_0)
	if var_0_10 then
		return var_0_10
	end
end

function var_0_0.CheckLevelIsClear(arg_14_0, arg_14_1)
	local var_14_0 = {
		arg_14_1 * 2 - 1,
		arg_14_1 * 2
	}

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		if var_0_10[iter_14_1] and var_0_10[iter_14_1].maxPoint then
			return true
		end
	end

	return false
end

function var_0_0.CheckLevelRewardState(arg_15_0, arg_15_1)
	if var_0_11 and var_0_11[arg_15_1] then
		return DormLinkGameConst.RewardItemState.received
	end

	local var_15_0 = ActivityLinkGameRewardCfg[arg_15_1].condition
	local var_15_1 = ConditionCfg[var_15_0]

	if var_15_1.type == DormLinkGameConst.AwardCondition.Point then
		local var_15_2 = var_15_1.params[1]
		local var_15_3 = var_15_1.params[2]
		local var_15_4 = ActivityLinkGameRewardCfg[arg_15_1].activity_id
		local var_15_5
		local var_15_6 = 0

		if var_15_2 == 0 then
			local var_15_7 = 0

			for iter_15_0, iter_15_1 in ipairs(ActivityLinkGameCfg.all) do
				if ActivityLinkGameCfg[iter_15_1].activity_id == var_15_4 and var_0_10[iter_15_1] then
					var_15_7 = math.max(var_15_7, var_0_10[iter_15_1].maxPoint or 0)
				end
			end

			var_15_6 = var_15_7
		else
			local var_15_8 = DormLinkGameTools:GetLevelIDByDiffAndActivityID(var_15_4, var_15_2)

			if var_0_10[var_15_8] then
				var_15_6 = var_0_10[var_15_8].maxPoint or 0
			else
				var_15_6 = 0
			end
		end

		if var_15_3 <= var_15_6 then
			return DormLinkGameConst.RewardItemState.complete
		else
			return DormLinkGameConst.RewardItemState.unComplete
		end
	end
end

function var_0_0.GetAllLevelTopPoint(arg_16_0)
	local var_16_0 = 0

	if var_0_10 then
		for iter_16_0, iter_16_1 in pairs(var_0_10) do
			if iter_16_1.maxPoint then
				var_16_0 = math.max(var_16_0, iter_16_1.maxPoint)
			end
		end
	end

	return var_16_0
end

function var_0_0.CheckActivityComplete(arg_17_0, arg_17_1)
	local var_17_0 = ActivityLinkGameCfg.get_id_list_by_activity_id[arg_17_1]

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if var_0_10[iter_17_1].maxPoint then
			return true
		end
	end

	return false
end

function var_0_0.GetLevelInfoByIndexAndDiff(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_2 == 2 then
		return arg_18_1 * 2
	else
		return arg_18_1 * 2 - 1
	end
end

function var_0_0.GetIndexAndDiffByLevelInfo(arg_19_0, arg_19_1)
	local var_19_0
	local var_19_1 = ActivityLinkGameCfg[arg_19_1].difficult

	if arg_19_1 % 2 == 0 then
		var_19_0 = arg_19_1 / 2
	else
		var_19_0 = (arg_19_1 + 1) / 2
	end

	return var_19_0, var_19_1
end

function var_0_0.GetLevelScore(arg_20_0, arg_20_1)
	if var_0_10[arg_20_1] then
		return var_0_10[arg_20_1].maxPoint
	end
end

function var_0_0.GetCurCnaUseTokenNum(arg_21_0)
	local var_21_0 = DormLinkGameTools:GetCurrencyID(var_0_3)
	local var_21_1 = ItemTools.getItemNum(var_21_0)

	if var_0_5 then
		return var_21_1 - var_0_5.costTokenNum
	else
		return var_21_1
	end
end

local var_0_14

function var_0_0.InitGameInfo(arg_22_0)
	arg_22_0:InitSceneData()
	arg_22_0:InitCacheData()

	var_0_14 = false
end

function var_0_0.InitSceneData(arg_23_0)
	if var_0_8 then
		var_0_4 = {}
		var_0_4 = {
			levelID = var_0_8,
			difficultyLevel = ActivityLinkGameCfg[var_0_8].difficult,
			canUseItem = ActivityLinkGameCfg[var_0_8].property_limit,
			limitTime = ActivityLinkGameCfg[var_0_8].time_limit
		}
	end
end

function var_0_0.GetSceneData(arg_24_0)
	return var_0_4
end

function var_0_0.InitCacheData(arg_25_0)
	if var_0_8 then
		var_0_5 = {}
		var_0_5 = {
			basePoint = 0,
			drainPoint = 0,
			drainMaterialNum = 0,
			batterNum = 0,
			costTokenNum = 0,
			eliminateNum = 0,
			highestBatterNum = 0,
			gameTime = 0,
			customerAddition = 0,
			batterAddition = 0,
			batterMaterial = {},
			generateInterval = ActivityLinkGameCfg[var_0_8].time_interval / 100,
			extendPoint = ActivityLinkGameCfg[var_0_8].extra_score,
			useItemList = {}
		}
		var_0_6 = false
		var_0_9 = true
	end
end

function var_0_0.DisposeGameCacheInfo(arg_26_0)
	var_0_5 = nil
end

function var_0_0.GetGameCacheInfo(arg_27_0)
	if var_0_5 then
		return var_0_5
	end
end

function var_0_0.GetGameCurLevel(arg_28_0)
	if var_0_5 then
		return var_0_5.levelID
	end
end

function var_0_0.InitCustomerInfo(arg_29_0)
	if var_0_8 then
		var_0_7 = {}

		local var_29_0 = DormUtils.EIdNamespace(DormEnum.CharacterType.RestaurantNormalCustomer)

		for iter_29_0, iter_29_1 in Dorm.storage:ForeachData(var_29_0, pairs) do
			local var_29_1 = DormUtils.GetEntityData(iter_29_1).cfgID
			local var_29_2 = {
				customerID = var_29_1,
				customerEID = iter_29_1,
				posIndex = iter_29_0
			}

			var_0_7[var_29_1] = var_0_2.New(var_29_2)
		end
	end
end

function var_0_0.GetCustomerList(arg_30_0)
	return var_0_7
end

function var_0_0.GetCustomerInfo(arg_31_0, arg_31_1)
	if var_0_7[arg_31_1] then
		return var_0_7[arg_31_1]
	else
		print("未找到食客信息")
	end
end

local var_0_15

function var_0_0.RunGameTimer(arg_32_0)
	if not var_0_15 then
		var_0_15 = {}
	end

	if not var_0_15.gameTimer then
		local var_32_0 = var_0_4.limitTime

		var_0_15.gameTimer = Timer.New(function()
			var_0_5.gameTime = var_0_5.gameTime + 1
			var_32_0 = var_32_0 - 1

			if var_32_0 <= 0 then
				arg_32_0:StopGame(DormLinkGameConst.StopGameType.success)
			else
				manager.notify:Invoke(DORM_LINK_REFRESH_GAME_TIME, var_32_0)
			end

			local var_33_0 = {
				num = var_32_0
			}

			DormLinkGameTools:PlaySpecialVoice(DormLinkGameConst.SpecialVoiceType.LastTime, var_33_0)
		end, 1, -1)

		var_0_15.gameTimer:Start()
	end

	if not var_0_15.customerTimer then
		var_0_15.customerTimer = Timer.New(function()
			for iter_34_0, iter_34_1 in pairs(var_0_7) do
				local var_34_0 = ActivityLinkGameCustomerCfg[iter_34_1.ID].satiety_descend_rate

				iter_34_1:ReviseSatiety(-var_34_0)
			end
		end, 1, -1)

		var_0_15.customerTimer:Start()
	end

	if not var_0_15.startGenerateTimer then
		local var_32_1 = GameSetting.linkgame_count_down.value[1]

		var_0_15.startGenerateTimer = Timer.New(function()
			if var_0_9 then
				var_32_1 = var_32_1 - DormLinkGameConst.GenerateTick

				if var_32_1 <= 0 then
					arg_32_0:RefreshMaterialGenerateTimer()
				else
					manager.notify:Invoke(DORM_LINK_REFRESH_MATERIAL_TIME, var_32_1 + var_0_5.generateInterval)
				end
			end
		end, DormLinkGameConst.GenerateTick, -1)

		var_0_15.startGenerateTimer:Start()
	end
end

function var_0_0.RefreshMaterialGenerateTimer(arg_36_0)
	local var_36_0 = var_0_5.generateInterval

	if not var_0_15.generateTimer then
		var_0_15.generateTimer = Timer.New(function()
			if var_0_9 then
				var_36_0 = var_36_0 - DormLinkGameConst.GenerateTick

				if var_36_0 <= 0 then
					arg_36_0:GenerateMaterialList()

					var_36_0 = var_0_5.generateInterval
				end

				manager.notify:Invoke(DORM_LINK_REFRESH_MATERIAL_TIME, var_36_0)
			end
		end, DormLinkGameConst.GenerateTick, -1)

		var_0_15.generateTimer:Start()
	end
end

function var_0_0.PauseMaterialGenerate(arg_38_0, arg_38_1)
	if var_0_15.pauseTimer then
		var_0_15.pauseTimer:Stop()

		var_0_15.pauseTimer = nil
	end

	if var_0_15.generateTimer then
		var_0_9 = false
		var_0_15.pauseTimer = Timer.New(function()
			var_0_9 = true
		end, arg_38_1, 1)

		var_0_15.pauseTimer:Start()
	elseif var_0_15.startGenerateTimer then
		var_0_9 = false
		var_0_15.pauseTimer = Timer.New(function()
			var_0_9 = true
		end, arg_38_1, 1)

		var_0_15.pauseTimer:Start()
	end
end

function var_0_0.ReSetBatterTimer(arg_41_0)
	if var_0_15.batterTimer and var_0_6 then
		var_0_15.batterTimer:Reset()
	else
		local var_41_0 = GameSetting.linkgame_hit_time.value[1]

		var_0_15.batterTimer = Timer.New(function()
			var_0_6 = false

			arg_41_0:ClearBatterNum()
		end, var_41_0, 1)
	end

	var_0_15.batterTimer:Start()
end

function var_0_0.StopTimer(arg_43_0)
	if var_0_15 then
		for iter_43_0, iter_43_1 in pairs(var_0_15) do
			iter_43_1:Stop()
		end
	end
end

function var_0_0.DisposeTimer(arg_44_0)
	if var_0_15 then
		for iter_44_0, iter_44_1 in pairs(var_0_15) do
			iter_44_1:Stop()

			iter_44_1 = nil
			var_0_15[iter_44_0] = nil
		end
	end
end

local var_0_16

function var_0_0.PlayerStartGame(arg_45_0)
	var_0_16 = true

	arg_45_0:RunGameTimer()
	manager.notify:Invoke(DORM_LINK_START_PLAY)

	if var_0_4 then
		local var_45_0 = ActivityLinkGameCfg[var_0_4.levelID].activity_id

		if var_0_4.difficultyLevel and var_45_0 then
			local var_45_1 = 1

			if not var_0_14 then
				var_45_1 = 2
			end

			SDKTools.SendMessageToSDK("activity_linkgame_end", {
				difficulty_id = var_0_4.difficultyLevel,
				activity_id = var_45_0,
				end_type = var_45_1
			})
		end
	end
end

function var_0_0.StopGame(arg_46_0, arg_46_1)
	manager.audio:Stop("effect")

	if var_0_16 then
		manager.audio:PlayEffect("minigame_activity_2_2", "minigame_activity_2_2_flip_enter", "")
		manager.audio:PlayEffect("minigame_activity_2_8", "minigame_activity_2_8_dati_bingo", "")

		var_0_16 = nil
	else
		manager.audio:PlayEffect("minigame_activity_2_1", "minigame_activity_2_1_connect_end02", "")
	end

	arg_46_0:StopTimer()

	if arg_46_1 == DormLinkGameConst.StopGameType.success then
		DormLinkGameAction:ClearanceLevel(var_0_4.levelID, var_0_5)
	elseif arg_46_1 == DormLinkGameConst.StopGameType.fail then
		arg_46_0:FailedClear()
	end
end

local function var_0_17(arg_47_0)
	local var_47_0 = 0

	for iter_47_0, iter_47_1 in ipairs(arg_47_0) do
		var_47_0 = var_47_0 + ActivityLinkGameGoodsCfg[iter_47_1.id].coin_num * iter_47_1.num
	end

	return var_47_0
end

local function var_0_18(arg_48_0)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_0) do
		table.insert(var_48_0, {
			id = iter_48_1.id,
			num = iter_48_1.num
		})
	end

	return var_0_1.encode(var_48_0)
end

function var_0_0.SuccessClear(arg_49_0, arg_49_1)
	local var_49_0, var_49_1 = arg_49_0:GetLastPoint()

	var_0_10[var_0_8].maxPoint = var_0_10[var_0_8].maxPoint or 0
	var_0_10[var_0_8].maxPoint = math.max(var_0_10[var_0_8].maxPoint, var_49_0)
	var_0_5.highestBatterNum = math.max(var_0_5.highestBatterNum, var_0_5.batterNum)

	local var_49_2 = {
		totalPoint = var_49_0,
		extendPoint = var_49_1,
		time = var_0_5.gameTime
	}
	local var_49_3 = ActivityLinkGameCfg[var_0_4.levelID].activity_id

	if var_0_4.difficultyLevel and var_49_3 then
		SDKTools.SendMessageToSDK("activity_linkgame_finish", {
			hit_num = var_0_5.highestBatterNum,
			cell_num = var_0_5.eliminateNum,
			activity_id = var_49_3,
			difficulty_id = var_0_4.difficultyLevel,
			score = arg_49_1.point,
			use_time = var_0_5.gameTime,
			use_coin_num = var_0_17(arg_49_1.item_list),
			skill_num = var_0_18(arg_49_1.item_list)
		})
	end

	arg_49_0:DisposeRunGameInfo()
	arg_49_0:SaveDefaultLevelAndDiff(var_0_8)
	arg_49_0:CheckUnReciveLevelReward()
	manager.notify:Invoke(DORM_LINK_END_GAME, DormLinkGameConst.StopGameType.success, var_49_2)
end

function var_0_0.FailedClear(arg_50_0)
	arg_50_0:DisposeRunGameInfo()
	manager.notify:Invoke(DORM_LINK_END_GAME, DormLinkGameConst.StopGameType.fail)
end

function var_0_0.DisposeRunGameInfo(arg_51_0)
	arg_51_0:DisposeGameCacheInfo()
	arg_51_0:DisposeTimer()

	var_0_7 = nil
end

function var_0_0.ResetRunGameInfo(arg_52_0)
	var_0_14 = true

	arg_52_0:InitCacheData()
	arg_52_0:InitCustomerInfo()
end

function var_0_0.DisposeGameInfo(arg_53_0)
	var_0_4 = nil
	var_0_6 = nil
end

function var_0_0.EliminateMaterial(arg_54_0, arg_54_1)
	arg_54_0:ReSetBatterTimer()

	var_0_6 = true

	if not var_0_5.batterMaterial[arg_54_1] then
		var_0_5.batterMaterial[arg_54_1] = 0
	end

	var_0_5.eliminateNum = var_0_5.eliminateNum + 1
	var_0_5.batterMaterial[arg_54_1] = var_0_5.batterMaterial[arg_54_1] + 1

	local var_54_0 = {}

	arg_54_0:UpdataCustomerNeed(var_54_0)

	if var_0_7 then
		for iter_54_0, iter_54_1 in pairs(var_0_7) do
			local var_54_1 = var_54_0[iter_54_0]

			manager.notify:Invoke(DORM_LINK_REFRESH_CUSTOMER_BUBBLE, iter_54_0, var_54_1)
		end
	end

	arg_54_0:AddBatterNum()
	arg_54_0:RefreshBasePoint(arg_54_1)
end

function var_0_0.RefreshBasePoint(arg_55_0, arg_55_1)
	local var_55_0 = 0

	for iter_55_0, iter_55_1 in pairs(var_0_7) do
		var_55_0 = var_55_0 + iter_55_1.satietyAddition
	end

	var_0_5.customerAddition = var_55_0

	if ActivityLinkGameCellCfg[arg_55_1] then
		var_0_5.basePoint = var_0_5.basePoint + ActivityLinkGameCellCfg[arg_55_1].complete_score * (100 + var_0_5.batterAddition + var_55_0) / 100
	end
end

function var_0_0.AddBatterNum(arg_56_0)
	var_0_5.batterNum = var_0_5.batterNum + 1

	arg_56_0:RefreshExtendAddition()
	arg_56_0:RefreshGenerateInterval()

	local var_56_0 = {
		oldNum = var_0_5.batterNum - 1,
		newNum = var_0_5.batterNum
	}

	DormLinkGameTools:PlaySpecialVoice(DormLinkGameConst.SpecialVoiceType.SuccssBatterNum, var_56_0)
	manager.notify:Invoke(DORM_LINK_REFRESH_BATTER_NUM)
end

function var_0_0.ClearBatterNum(arg_57_0)
	var_0_5.highestBatterNum = math.max(var_0_5.highestBatterNum, var_0_5.batterNum)

	local var_57_0 = {
		num = var_0_5.batterNum
	}

	DormLinkGameTools:PlaySpecialVoice(DormLinkGameConst.SpecialVoiceType.FaileBatterNum, var_57_0)

	var_0_5.batterNum = 0

	arg_57_0:RefreshGenerateInterval()
	arg_57_0:RefreshExtendAddition()
	manager.notify:Invoke(DORM_LINK_REFRESH_BATTER_NUM)
end

function var_0_0.GetBatterNum(arg_58_0)
	return var_0_5.batterNum
end

function var_0_0.GetExtendAddition(arg_59_0)
	return var_0_5.batterAddition + var_0_5.customerAddition
end

function var_0_0.RefreshExtendAddition(arg_60_0)
	local var_60_0 = ActivityLinkGameCfg[var_0_8].hit_score_up
	local var_60_1 = arg_60_0:GetExtendAddition()
	local var_60_2 = var_0_5.batterNum

	var_0_5.batterAddition = 0

	if var_60_0 then
		for iter_60_0, iter_60_1 in ipairs(var_60_0) do
			if var_60_2 >= iter_60_1[1] then
				var_0_5.batterAddition = 0 + iter_60_1[2]

				if var_0_5.batterAddition <= 0 then
					print("连击加成错误")
				end
			end
		end
	end

	if var_60_1 ~= arg_60_0:GetExtendAddition() then
		manager.notify:Invoke(DORM_LINK_REFRESH_EXTEND_ADDITION)
	end
end

function var_0_0.RefreshCustomerExtendAddition(arg_61_0)
	local var_61_0 = arg_61_0:GetExtendAddition()

	var_0_5.customerAddition = 0

	for iter_61_0, iter_61_1 in pairs(var_0_7) do
		var_0_5.customerAddition = var_0_5.customerAddition + iter_61_1.satietyAddition
	end

	if var_61_0 ~= arg_61_0:GetExtendAddition() then
		manager.notify:Invoke(DORM_LINK_REFRESH_EXTEND_ADDITION)
	end
end

function var_0_0.RefreshGenerateInterval(arg_62_0)
	if not var_0_5 then
		print("操作数据不存在")
	end

	local var_62_0 = var_0_5.batterNum
	local var_62_1 = ActivityLinkGameCfg[var_0_8].hit_interval_cut

	var_0_5.generateInterval = ActivityLinkGameCfg[var_0_8].time_interval / 100

	if var_62_1 then
		for iter_62_0, iter_62_1 in ipairs(var_62_1) do
			if var_62_0 >= iter_62_1[1] then
				var_0_5.generateInterval = (ActivityLinkGameCfg[var_0_8].time_interval - iter_62_1[2]) / 100

				if var_0_5.generateInterval <= 0 then
					print("生成间隔时间错误")
				end
			end
		end
	end
end

function var_0_0.GetDisposeMaterialNum(arg_63_0, arg_63_1)
	return var_0_5.batterMaterial[arg_63_1] or 0
end

function var_0_0.UpdataCustomerNeed(arg_64_0, arg_64_1)
	if var_0_7 then
		for iter_64_0, iter_64_1 in pairs(var_0_7) do
			local var_64_0 = iter_64_1.curPreference
			local var_64_1 = true

			for iter_64_2, iter_64_3 in ipairs(ActivityLinkGameComposeCfg[var_64_0].compose_list) do
				local var_64_2 = iter_64_3[1]

				if iter_64_3[2] > arg_64_0:GetDisposeMaterialNum(var_64_2) then
					var_64_1 = false

					break
				end
			end

			if var_64_1 then
				for iter_64_4, iter_64_5 in ipairs(ActivityLinkGameComposeCfg[var_64_0].compose_list) do
					local var_64_3 = iter_64_5[1]
					local var_64_4 = iter_64_5[2]

					var_0_5.batterMaterial[var_64_3] = var_0_5.batterMaterial[var_64_3] - var_64_4
				end

				iter_64_1:FoodComplate()
			end

			if arg_64_1 then
				arg_64_1[iter_64_0] = var_64_1
			end
		end
	end
end

function var_0_0.GetCurMaterialState(arg_65_0)
	if var_0_5 then
		return var_0_5.materialstate
	end
end

function var_0_0.GenerateMaterialList(arg_66_0)
	manager.notify:Invoke(LIANLIANKAN_PREVIEW_APPEAR)
end

function var_0_0.ClearConveyorMaterial(arg_67_0, arg_67_1)
	manager.notify:Invoke(LIANLIANKAN_PREVIEW_REMOVE_ALL, arg_67_1, true)
end

function var_0_0.DrainMaterial(arg_68_0, arg_68_1)
	local var_68_0 = 0

	for iter_68_0, iter_68_1 in ipairs(arg_68_1) do
		var_0_5.drainMaterialNum = var_0_5.drainMaterialNum + 1
		var_68_0 = var_68_0 + ActivityLinkGameCellCfg[iter_68_1].waste_score
	end

	var_0_5.drainPoint = var_0_5.drainPoint + var_68_0

	if var_68_0 > 0 then
		manager.notify:Invoke(DORM_LINK_REFRESH_DRAIN_MATERIAL, var_68_0)
	end
end

function var_0_0.GetLastPoint(arg_69_0)
	local var_69_0 = var_0_5.basePoint
	local var_69_1 = var_0_5.extendPoint - var_0_5.drainPoint

	if var_69_1 < 0 then
		var_69_1 = 0
	end

	local var_69_2 = var_0_5.gameTime
	local var_69_3 = ActivityLinkGameCfg[var_0_8].time_limit - var_69_2

	if var_69_3 < 0 then
		var_69_3 = 0
	end

	local var_69_4 = var_69_3 * GameSetting.linkgame_time_score.value[1]

	return var_69_0 + var_69_1 + var_69_4, var_69_1 + var_69_4
end

function var_0_0.GetSaveLevelID(arg_70_0)
	local var_70_0 = USER_ID

	return getData(string.format("%s_%d", "DormLinkLevel", var_70_0), "levelID") or ActivityLinkGameCfg[ActivityLinkGameCfg.all[1]].id
end

function var_0_0.SaveDefaultLevelAndDiff(arg_71_0, arg_71_1)
	local var_71_0 = USER_ID

	saveData(string.format("%s_%d", "DormLinkLevel", var_71_0), "levelID", arg_71_1)
end

local function var_0_19()
	if var_0_12 == nil then
		var_0_12 = getData("DormLinkLevel", "unlockLevel") or {}
	end

	return var_0_12
end

local function var_0_20(arg_73_0, arg_73_1)
	arg_73_0[tostring(arg_73_1)] = 1
end

local function var_0_21(arg_74_0, arg_74_1)
	return arg_74_0[tostring(arg_74_1)] == 1
end

local function var_0_22(arg_75_0)
	saveData("DormLinkLevel", "unlockLevel", arg_75_0 or {})
end

function var_0_0.UpdateLevelActivityCompleteRedPoint(arg_76_0, arg_76_1)
	if var_0_10 == nil then
		return
	end

	local var_76_0 = var_0_13(var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL, arg_76_1)
	local var_76_1 = var_0_19()

	for iter_76_0, iter_76_1 in ipairs(ActivityLinkGameCfg.get_id_list_by_activity_id[arg_76_1]) do
		if DormLinkGameTools:ChecklevelUnLock(iter_76_1) then
			local var_76_2 = not var_0_10[iter_76_1] or not var_0_10[iter_76_1].maxPoint
			local var_76_3 = not var_0_21(var_76_1, arg_76_1)

			if var_76_2 and var_76_3 then
				manager.redPoint:setTip(var_76_0, 1)

				return
			end
		end
	end

	manager.redPoint:setTip(var_76_0, 0)
end

function var_0_0.CheckUnCompleteLevel(arg_77_0)
	if var_0_10 then
		for iter_77_0, iter_77_1 in ipairs(arg_77_0:GetLevelActivityIDList()) do
			arg_77_0:UpdateLevelActivityCompleteRedPoint(iter_77_1)
		end
	end
end

function var_0_0.HideSingleLevelRedPoint(arg_78_0, arg_78_1)
	local var_78_0 = var_0_19()
	local var_78_1 = var_0_13(var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL, arg_78_1)

	if manager.redPoint:getTipBoolean(var_78_1) then
		manager.redPoint:setTip(var_78_1, 0)
		var_0_20(var_78_0, arg_78_1)
		var_0_22(var_78_0)
	end
end

function var_0_0.HideLevelRedPoint(arg_79_0)
	local var_79_0 = var_0_19()
	local var_79_1 = false

	for iter_79_0, iter_79_1 in ipairs(arg_79_0:GetLevelActivityIDList()) do
		local var_79_2 = var_0_13(var_0_0.LIANLIANKAN_UNCOMPLETE_LEVEL, iter_79_1)

		if manager.redPoint:getTipBoolean(var_79_2) then
			manager.redPoint:setTip(var_79_2, 0)
			var_0_20(var_79_0, iter_79_1)

			var_79_1 = true
		end
	end

	if var_79_1 then
		var_0_22(var_79_0)
	end
end

function var_0_0.CheckUnReciveLevelReward(arg_80_0)
	local var_80_0 = arg_80_0:RedPointKey(var_0_0.LIANLIANKAN_LEVEL_REWARD)
	local var_80_1 = ActivityLinkGameRewardCfg.all

	for iter_80_0, iter_80_1 in ipairs(var_80_1) do
		if (not var_0_11 or var_0_11 and not var_0_11[iter_80_1]) and DormLinkGameData:CheckLevelRewardState(iter_80_1) == DormLinkGameConst.RewardItemState.complete then
			manager.redPoint:setTip(var_80_0, 1)

			return
		end
	end

	manager.redPoint:setTip(var_80_0, 0)
end

return var_0_0
