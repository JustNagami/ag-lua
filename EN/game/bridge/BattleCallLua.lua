BattleCooperationCallLua = require("game/bridge/BattleCooperationCallLua")

local var_0_0 = require("game/bridge/BattleSettlementStrategy/BattleResultGotoHandler")

var_0_0:Init()

local var_0_1 = false

function ShowBattlePausePage(arg_1_0, arg_1_1)
	local var_1_0 = BattleController.GetInstance():GetBattleStageData()

	if not BattleFieldData:IsInBattle() and BattleConst.STAGE_TYPE_NEW.POLYHEDRON ~= var_1_0:GetType() then
		return
	end

	CheckManagers()

	if BattleConst.STAGE_TYPE_NEW.POLYHEDRON ~= var_1_0:GetType() then
		gameContext.oldRoutes_ = {}
	end

	local var_1_1 = BattleInstance.CaculateStarMission(var_1_0, arg_1_0)
	local var_1_2 = var_1_0:GetStageId()
	local var_1_3 = var_1_0:GetType()
	local var_1_4 = SettingConst.SETTING_TYPE.BATTLE_OTHER

	if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT == var_1_3 then
		var_1_4 = SettingConst.SETTING_TYPE.BATTLE_MAIN
	end

	LuaForCursor.SwitchCursor(true)
	gameContext:Go("/setting", {
		setType = var_1_4,
		section = var_1_2,
		result = arg_1_0,
		starMissionData = var_1_1,
		newbie = arg_1_1,
		stageData = var_1_0
	})
	OperationRecorder.Record("BattleCallLua", "combat_pause")
end

local var_0_2 = 202005
local var_0_3 = 200005

_G.BATTLE_SERVER_ERROR_TIME = 0

function BattleServerConnectError(arg_2_0)
	pcall(function()
		local var_3_0 = BattleFieldData:GetServerBattleID() or 0

		Debug.LogError("BattleServerConnectError by errorCode : " .. arg_2_0 .. "  serverBattleID : " .. var_3_0)

		local var_3_1 = string.format("{\"messageType\" : \"SubmitEvent\", \"eventId\" : \"battle_server_connect_error\", \"errorCode\" : \"%s\", \"battleId\" : \"%s\", \"#device_id\" : \"%s\", \"user_id\" : \"%s\"}", tostring(arg_2_0), tostring(var_3_0), _G.TMP_MAC_ADDRESS or "", tostring(USER_ID))

		GameToSDK.SendMessage(var_3_1)
	end)

	if arg_2_0 == var_0_3 then
		LuaExchangeHelper.EndWaitReadyAck()
		CheckManagers()
		ShowMessageBox({
			ButtonType = "SingleBtn",
			isTop = true,
			content = GetTips("COOPERATION_NOT_JOIN_AFTER_OTHERS_READY"),
			OkCallback = function()
				gameContext:DestroyCurRoutes()

				local var_4_0 = BattleFieldData:GetServerBattleID()

				CooperationAction.LeaveCooperationBattle(function(arg_5_0)
					local var_5_0 = BattleController.GetInstance():GetBattleStageData()

					BattleInstance.QuitBattle(var_5_0, true)
				end, var_4_0)
			end
		})

		return
	end

	if arg_2_0 ~= var_0_2 then
		CheckManagers()

		function BattleCallLuaCallBack()
			print("与战斗服连接出现错误，玩家白打，返回登录界面")
		end
	end

	_G.BATTLE_SERVER_ERROR_TIME = _G.BATTLE_SERVER_ERROR_TIME + 1

	ConnectionHelper.OnBattleServerConnectError(arg_2_0, _G.BATTLE_SERVER_ERROR_TIME)
end

function ShowStory(arg_7_0, arg_7_1, arg_7_2)
	CheckManagers()

	gameContext.oldRoutes_ = {}

	manager.gc:Collect()
	Resources.UnloadUnusedAssets()
	manager.story:StartBattleStory(arg_7_0, function()
		gameContext:DestroyCurRoutes()
		LuaExchangeHelper.ActionInvoke(arg_7_2)
		manager.gc:Collect()
		Resources.UnloadUnusedAssets()
	end, arg_7_1)
end

function GetMardukePlane()
	return TowerGameData:GetCanUsePlane()
end

function SendQuitBattle(arg_10_0, arg_10_1)
	var_0_1 = arg_10_1

	manager.uiInit()

	gameContext.oldRoutes_ = {}

	print("客户端战斗结束，准备向服务端请求战斗结果")

	local var_10_0 = BattleController.GetInstance():GetBattleStageData()

	if BattleConst.STAGE_TYPE_NEW.POLYHEDRON ~= var_10_0:GetType() then
		BattleInstance.hideBattlePanel()
	end

	gameContext:SetSystemLayer("battleResult")

	_G.PrintAllOpen_ = true

	print("开启心跳包打印，用于监测网络状态")
	print("网络连接状态是否可用：", Application.internetReachability ~= UnityEngine.NetworkReachability.NotReachable)
	print("网络连接状态是否为局域网：", Application.internetReachability == UnityEngine.NetworkReachability.ReachableViaLocalAreaNetwork)

	local var_10_1 = BattleFieldData:GetServerBattleID()
	local var_10_2 = var_10_0:GetStageId()
	local var_10_3 = arg_10_0.loadMilliseconds

	SDKTools.SendMessageToSDK("load_time_before_battle", {
		combat_id = var_10_2,
		battle_id = var_10_1,
		use_milliseconds = var_10_3,
		battle_version = LuaForUtil.GetBattleVersion()
	})
	manager.achievementTips:FliteAchievementType({
		AchievementConst.AchievementType.MISSION,
		AchievementConst.AchievementType.BATTLE
	})

	local var_10_4 = GetOldPlayerExp()

	if var_10_0:GetIsCooperation() then
		manager.net:SendWithLoadingNew(54110, {
			battle_id = var_10_1
		}, 54111, function(arg_11_0, arg_11_1)
			BattleFieldData:FishCooperationBattle(arg_11_0)
			gameContext:DestroyCurRoutes()
			BattleCooperationCallLua.GotoTeam(var_10_1, arg_11_0.battle_result, arg_11_0.result, var_10_4)
		end)
	else
		manager.net:SendWithLoadingNew(54032, {
			battle_id = var_10_1
		}, 54033, function(arg_12_0, arg_12_1)
			BattleFieldData:FinishBattle(arg_12_0)
			gameContext:DestroyCurRoutes()
			GotoTeam(var_10_1, arg_12_0.battle_result, arg_12_0.result, var_10_4)
		end)
	end

	BattleCallLuaWaitLoading = true

	local var_10_5 = {
		["Atlas/BattleSettlement"] = 20,
		["Atlas/NewBattleSettlement"] = 20
	}

	PreLoadAsset(var_10_5, 0, function()
		for iter_13_0, iter_13_1 in pairs(var_10_5) do
			LuaForUtil.PreLoadAtlas(iter_13_0)
		end

		BattleCallLuaWaitLoading = false

		if BattleCallLuaCallBack and not BattleCallLuaCallBackWait then
			BattleCallLuaCallBack()

			BattleCallLuaCallBack = nil
		end
	end, true)
end

function GotoTeam(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	print("服务端战斗数据返回")
	print("收到服务器的消息，获取到新的战斗结果(0:战斗进行中,1:胜利,2:失败,3：主动退出):", arg_14_1.result)

	if arg_14_1.result > BattleConst.BATTLE_RESULT.UNFINISHED and arg_14_1.result <= BattleConst.BATTLE_RESULT.QUIT then
		local var_14_0 = BattleController.GetInstance():GetBattleStageData()

		print("BattleCallLua.进入目标结算stage: " .. var_14_0:GetType())

		local var_14_1 = CollectHeroExpChange(var_14_0)

		goToResult(arg_14_1.result - 1, arg_14_1.star_list, {
			challengedNumber = arg_14_1.clear_times,
			clear_times = arg_14_1.clear_times,
			oldPlayerEXPInfo = arg_14_3,
			heroDataCollect = var_14_1,
			errorCode = arg_14_2
		}, var_14_0)
	end
end

function goToResult(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	_G.PrintAllOpen_ = false

	print("关闭心跳包打印，用于监测网络状态")
	SetForceShowQuanquan(false)

	if _G.CannotConnectTimer then
		_G.CannotConnectTimer:Stop()

		_G.CannotConnectTimer = nil
	end

	ViewAnimationManager.isReturnFromBattle = true

	var_0_0:GotoResult(arg_15_3, arg_15_0, arg_15_1, arg_15_2, var_0_1)

	if not BattleCallLuaCallBackWait and not BattleCallLuaWaitLoading then
		BattleCallLuaCallBack()

		BattleCallLuaCallBack = nil
	end
end

function ShowSettlement()
	print("收到允许弹出结算界面通知（因为可能在播放胜利动作中）")

	if _G.CannotConnectTimer then
		_G.CannotConnectTimer:Stop()

		_G.CannotConnectTimer = nil
	end

	BattleCallLuaCallBackWait = false

	if BattleCallLuaCallBack and not BattleCallLuaWaitLoading then
		manager.achievementTips:Hide(true)
		var_0_0:SnapShot()

		if var_0_0.shotTimer then
			var_0_0.shotTimer:Stop()

			var_0_0.shotTimer = nil
		end

		var_0_0.shotTimer = FrameTimer.New(function()
			BattleCallLuaCallBack()

			BattleCallLuaCallBack = nil

			manager.achievementTips:Hide(false)
		end, 1, 1)

		var_0_0.shotTimer:Start()
	else
		CheckManagers()

		if not ConnectionHelper.GetIsDealWithError() then
			SetForceShowQuanquan(true)
		end

		_G.CannotConnectTimer = Timer.New(function()
			ConnectionHelper.ShowReturnToLoginTip()
		end, 600, 1)

		_G.CannotConnectTimer:Start()
	end
end

function GetResultReward()
	local var_19_0 = {}
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in ipairs(BattleFieldData:GetBattleResultData().dropList) do
		var_19_1[iter_19_1.battleTimes] = {}

		for iter_19_2, iter_19_3 in ipairs(iter_19_1.rewardItems) do
			print(string.format("服务端发下第%s次物品数据id:", iter_19_1.battleTimes), iter_19_3.id, "num:", iter_19_3.num)
			table.insert(var_19_1[iter_19_1.battleTimes], {
				iter_19_3.id,
				iter_19_3.num
			})
			table.insert(var_19_0, {
				iter_19_3.id,
				iter_19_3.num
			})
		end
	end

	return var_19_0, var_19_1
end

function EndBattleLogic(arg_20_0)
	manager.guide:OnBattleFinish(arg_20_0)
	manager.achievementTips:FliteAchievementType({})
end

function GetAbyssBossPhase()
	return AbyssData:GetCurrentBossPhase()
end

function OnQuitBattleSuccess()
	manager.notify:Invoke(BULLETIN_QUITBATTLE)
end

function GetOldPlayerExp()
	local var_23_0 = PlayerData:GetPlayerInfo()

	if var_23_0 then
		return {
			userLevel = var_23_0.userLevel or 0,
			remain_exp = var_23_0.remain_exp or 0,
			total_exp = var_23_0.total_exp or 0
		}
	else
		return {
			userLevel = 0,
			total_exp = 0,
			remain_exp = 0
		}
	end
end

function CollectHeroExpChange(arg_24_0)
	local var_24_0, var_24_1 = arg_24_0:GetHeroTeam()
	local var_24_2 = arg_24_0:GetSystemHeroTeam()
	local var_24_3 = arg_24_0:GetAssistHeroOwnerList()
	local var_24_4 = {}
	local var_24_5 = {}

	if var_24_0[2] == 0 then
		table.remove(var_24_0, 2)
		table.remove(var_24_1, 2)
		table.insert(var_24_0, 0)
		table.insert(var_24_1, 0)
	end

	for iter_24_0 = 1, 3 do
		var_24_5[iter_24_0] = {}

		if not var_24_0[iter_24_0] or var_24_0[iter_24_0] == 0 then
			var_24_5[iter_24_0] = nil
		else
			local var_24_6 = arg_24_0:GetHeroDataByPos(iter_24_0)
			local var_24_7 = not var_24_2[iter_24_0] and (var_24_1[iter_24_0] == 0 or table.isEmpty(var_24_1)) and (var_24_3 and (var_24_3[iter_24_0] == "0" or var_24_3[iter_24_0] ~= "0" and var_24_3[iter_24_0] == PlayerData:GetPlayerInfo().userID) or table.isEmpty(var_24_3))

			if var_24_6 and var_24_7 and NeedAddExpWithoutBlack(arg_24_0) then
				local var_24_8 = var_24_6.level
				local var_24_9 = var_24_6.exp - LvTools.LevelToExp(var_24_8, "hero_level_exp1")
				local var_24_10 = LvTools.GetMaxTotalExp("hero_level_exp1") - var_24_6.exp

				if var_24_10 < 0 then
					var_24_10 = 0
				end

				local var_24_11 = arg_24_0:GetMultiple()
				local var_24_12 = arg_24_0:GetAddHeroExp() * var_24_11
				local var_24_13 = arg_24_0:GetActivityID()
				local var_24_14 = ActivityData:GetActivityData(var_24_13)

				if var_24_13 ~= 0 and (not var_24_14 or not var_24_14:IsActivitying()) then
					var_24_12 = 0
				end

				local var_24_15 = math.min(var_24_12, var_24_10)
				local var_24_16 = HeroTools.GetHeroCurrentMaxLevel(var_24_6)
				local var_24_17, var_24_18, var_24_19, var_24_20, var_24_21 = LvTools.CheckHeroExp(var_24_8, var_24_6.exp + var_24_15, var_24_16)
				local var_24_22 = var_24_15 - var_24_21
				local var_24_23 = {
					id = var_24_6.id,
					newLv = var_24_17,
					newExp = var_24_6.exp + var_24_22
				}

				table.insert(var_24_4, var_24_23)

				local var_24_24 = math.min(math.floor(var_24_9 / GameLevelSetting[var_24_8].hero_level_exp1 * 1000) / 1000, 0.9999)
				local var_24_25 = math.min(math.floor(var_24_18 / GameLevelSetting[var_24_17].hero_level_exp1 * 1000) / 1000, 0.9999)

				var_24_5[iter_24_0] = {
					oldLv = var_24_8,
					newLv = var_24_17,
					oldPersent = var_24_24,
					newPersent = var_24_25
				}
			else
				var_24_5[iter_24_0] = nil
			end
		end
	end

	if var_24_4 then
		for iter_24_1, iter_24_2 in ipairs(var_24_4) do
			HeroAction.AddHeroExpSuccess(iter_24_2.id, iter_24_2.newLv, iter_24_2.newExp)
		end
	end

	return var_24_5 or {}
end

function NeedAddExpWithoutBlack(arg_25_0)
	if not arg_25_0 then
		return false
	end

	local var_25_0 = arg_25_0:GetType()

	if var_25_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or var_25_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT then
		return BattleInstance.NeedAddExp(arg_25_0)
	end

	return true
end

function GetBattleResultSnapShot()
	return var_0_0:GetSnapShot()
end

function ReleaseBattleResultSnapshot()
	pcall(function()
		if var_0_0 ~= nil then
			var_0_0:ReleaseSnapShot()
		end
	end)
end
