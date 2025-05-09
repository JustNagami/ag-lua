BattleCooperationCallLua = require("game/bridge/BattleCooperationCallLua")

local var_0_0 = require("game/bridge/BattleSettlementStrategy/BattleResultGotoHandler")

var_0_0:Init()

local var_0_1 = false
local var_0_2

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

	if var_1_3 == BattleConst.STAGE_TYPE_NEW.SEA_WARFARE then
		gameContext:Go("/qWorldComfirmView_4_0", {
			title = GetTips("PROMPT"),
			content = GetTips("SEA_WARFARE_QUIT_TIPS"),
			cancelCallback = function()
				gameContext:DestroyCurRoutes()
				LuaExchangeHelper.ContinueGame()
			end,
			comfirmCallback = function()
				LuaExchangeHelper.GameOver(3)
			end
		})
	else
		local var_1_5 = "/setting"

		if var_1_3 == BattleConst.STAGE_TYPE_NEW.POLYHEDRON and #gameContext:GetCurHistory() <= 0 then
			var_1_5 = "/polyhedronBlank/polyhedronBattle" .. var_1_5
		end

		gameContext:Go(var_1_5, {
			setType = var_1_4,
			section = var_1_2,
			result = arg_1_0,
			starMissionData = var_1_1,
			newbie = arg_1_1,
			stageData = var_1_0
		})
	end

	OperationRecorder.Record("BattleCallLua", "combat_pause")
end

local var_0_3 = 202005
local var_0_4 = 200005

_G.BATTLE_SERVER_ERROR_TIME = 0

function BattleServerConnectError(arg_4_0, arg_4_1)
	BattleServerConnectErrorLog(arg_4_0, arg_4_1)

	if arg_4_0 == var_0_4 then
		LuaExchangeHelper.EndWaitReadyAck()
		CheckManagers()
		ShowMessageBox({
			ButtonType = "SingleBtn",
			isTop = true,
			content = GetTips("COOPERATION_NOT_JOIN_AFTER_OTHERS_READY"),
			OkCallback = function()
				gameContext:DestroyCurRoutes()

				local var_5_0 = BattleFieldData:GetServerBattleID()

				CooperationAction.LeaveCooperationBattle(function(arg_6_0)
					local var_6_0 = BattleController.GetInstance():GetBattleStageData()

					BattleInstance.QuitBattle(var_6_0, true)
				end, var_5_0)
			end
		})

		return
	end

	if arg_4_0 ~= var_0_3 then
		CheckManagers()

		function BattleCallLuaCallBack()
			print("与战斗服连接出现错误，玩家白打，返回登录界面")
		end
	end

	_G.BATTLE_SERVER_ERROR_TIME = _G.BATTLE_SERVER_ERROR_TIME + 1

	ConnectionHelper.OnBattleServerConnectError(arg_4_0, _G.BATTLE_SERVER_ERROR_TIME)
end

function BattleServerConnectErrorLog(arg_8_0, arg_8_1)
	pcall(function()
		local var_9_0 = BattleFieldData:GetServerBattleID() or 0

		arg_8_1 = arg_8_1 or 0

		Debug.LogError("BattleServerConnectError by errorCode : " .. arg_8_0 .. "  serverBattleID : " .. var_9_0 .. "  localConn : " .. arg_8_1)

		local var_9_1, var_9_2 = BattleFieldData:GetBattleServerIPAndPort()
		local var_9_3 = string.format("{\"messageType\" : \"SubmitEvent\", \"eventId\" : \"battle_server_connect_error\", \"errorCode\" : \"%s\", \"battle_id_str\" : \"%s\", \"#device_id\" : \"%s\", \"#account_id\" : \"%s\", \"localConn\" : \"%s\", \"battle_server_ip\" : \"%s\", \"battle_server_port\" : \"%s\", \"#os\" : \"%s\", \"#server_time\" : \"%s\", \"#zone_offset\" : \"%s\", \"#device_model\" : \"%s\", \"#manufacturer\" : \"%s\", \"#os_version\" : \"%s\", \"#carrier\" : \"%s\", \"client_vs\" : \"%s\", \"resource_vs\" : \"%s\"}", tostring(arg_8_0), tostring(var_9_0), _G.TMP_MAC_ADDRESS or "", tostring(USER_ID), tostring(arg_8_1), tostring(var_9_1), tostring(var_9_2), _G.AnalyticsPresetProperties["#os"], tostring(manager.time:GetServerTime()), _G.AnalyticsPresetProperties["#zone_offset"], _G.AnalyticsPresetProperties["#device_model"], _G.AnalyticsPresetProperties["#manufacturer"], _G.AnalyticsPresetProperties["#os_version"], _G.AnalyticsPresetProperties["#carrier"], tostring(LuaForUtil.GetClientVersion()), tostring(LuaForUtil.GetResourceVersion()))

		print(var_9_3)
		GameToSDK.SendMessage(var_9_3)
	end)
end

function ShowStory(arg_10_0, arg_10_1, arg_10_2)
	CheckManagers()

	gameContext.oldRoutes_ = {}

	manager.gc:Collect()
	Resources.UnloadUnusedAssets()
	manager.story:StartBattleStory(arg_10_0, function()
		gameContext:DestroyCurRoutes()
		LuaExchangeHelper.ActionInvoke(arg_10_2)
		manager.gc:Collect()
		DestroyLua()
		gameContext:SetSystemLayer("battle")
		Resources.UnloadUnusedAssets()
	end, arg_10_1)
end

function GetMardukePlane()
	return TowerGameData:GetCanUsePlane()
end

function SendQuitBattle(arg_13_0, arg_13_1)
	var_0_1 = arg_13_1

	manager.uiInit()

	gameContext.oldRoutes_ = {}

	print("客户端战斗结束，准备向服务端请求战斗结果")

	local var_13_0 = BattleController.GetInstance():GetBattleStageData()

	if BattleConst.STAGE_TYPE_NEW.POLYHEDRON ~= var_13_0:GetType() then
		BattleInstance.hideBattlePanel()
	end

	gameContext:SetSystemLayer("battleResult")

	_G.PrintAllOpen_ = true

	print("开启心跳包打印，用于监测网络状态")
	print("网络连接状态是否可用：", Application.internetReachability ~= UnityEngine.NetworkReachability.NotReachable)
	print("网络连接状态是否为局域网：", Application.internetReachability == UnityEngine.NetworkReachability.ReachableViaLocalAreaNetwork)

	local var_13_1 = BattleFieldData:GetServerBattleID()
	local var_13_2 = var_13_0:GetStageId()
	local var_13_3 = arg_13_0.loadMilliseconds

	SDKTools.SendMessageToSDK("load_time_before_battle", {
		combat_id = var_13_2,
		battle_id = var_13_1,
		use_milliseconds = var_13_3,
		battle_version = LuaForUtil.GetBattleVersion()
	})
	manager.achievementTips:FliteAchievementType({
		AchievementConst.AchievementType.MISSION,
		AchievementConst.AchievementType.BATTLE
	})

	local var_13_4 = GetOldPlayerExp()

	if var_13_0:GetIsCooperation() then
		manager.net:SendWithLoadingNew(54110, {
			battle_id = var_13_1
		}, 54111, function(arg_14_0, arg_14_1)
			BattleFieldData:FishCooperationBattle(arg_14_0)
			gameContext:DestroyCurRoutes()
			BattleCooperationCallLua.GotoTeam(var_13_1, arg_14_0.battle_result, arg_14_0.result, var_13_4)
		end)
	else
		manager.net:SendWithLoadingNew(54032, {
			battle_id = var_13_1
		}, 54033, function(arg_15_0, arg_15_1)
			BattleFieldData:FinishBattle(arg_15_0)
			gameContext:DestroyCurRoutes()
			GotoTeam(var_13_1, arg_15_0.battle_result, arg_15_0.result, var_13_4)
		end)
	end

	BattleCallLuaWaitLoading = true

	local var_13_5 = {
		["Atlas/BattleSettlement"] = 20,
		["Atlas/NewBattleSettlement"] = 20
	}

	PreLoadAsset(var_13_5, 0, function()
		for iter_16_0, iter_16_1 in pairs(var_13_5) do
			LuaForUtil.PreLoadAtlas(iter_16_0)
		end

		BattleCallLuaWaitLoading = false

		if BattleCallLuaCallBack and not BattleCallLuaCallBackWait then
			BattleCallLuaCallBack()

			BattleCallLuaCallBack = nil
		end
	end, true)
end

function GotoTeam(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	print("服务端战斗数据返回")
	print("收到服务器的消息，获取到新的战斗结果(0:战斗进行中,1:胜利,2:失败,3：主动退出):", arg_17_1.result)

	if arg_17_1.result > BattleConst.BATTLE_RESULT.UNFINISHED and arg_17_1.result <= BattleConst.BATTLE_RESULT.QUIT then
		local var_17_0 = BattleController.GetInstance():GetBattleStageData()

		print("BattleCallLua.进入目标结算stage: " .. var_17_0:GetType())

		local var_17_1, var_17_2 = CollectHeroExpChange(var_17_0)

		if isSuccess(arg_17_1.result - 1) and not var_0_1 then
			CheckBattleResultNeedAddHeroExp()
		end

		goToResult(arg_17_1.result - 1, arg_17_1.star_list, {
			challengedNumber = arg_17_1.clear_times,
			clear_times = arg_17_1.clear_times,
			oldPlayerEXPInfo = arg_17_3,
			heroDataCollect = var_17_1,
			errorCode = arg_17_2
		}, var_17_0)
		GetBattleResultNeedAddHeroExp()
	end
end

function goToResult(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	_G.PrintAllOpen_ = false

	print("关闭心跳包打印，用于监测网络状态")
	SetForceShowQuanquan(false)

	if _G.CannotConnectTimer then
		_G.CannotConnectTimer:Stop()

		_G.CannotConnectTimer = nil
	end

	ViewAnimationManager.isReturnFromBattle = true

	var_0_0:GotoResult(arg_18_3, arg_18_0, arg_18_1, arg_18_2, var_0_1)

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
	local var_22_0 = {}
	local var_22_1 = {}
	local var_22_2 = {}

	for iter_22_0, iter_22_1 in ipairs(BattleFieldData:GetBattleResultData().dropList) do
		var_22_1[iter_22_1.battleTimes] = {}
		var_22_2[iter_22_1.battleTimes] = {}

		for iter_22_2, iter_22_3 in ipairs(iter_22_1.rewardItems) do
			print(string.format("服务端发下第%s次物品数据id:", iter_22_1.battleTimes), iter_22_3.id, "num:", iter_22_3.num)
			table.insert(var_22_1[iter_22_1.battleTimes], {
				iter_22_3.id,
				iter_22_3.num
			})
			table.insert(var_22_0, {
				iter_22_3.id,
				iter_22_3.num
			})
		end

		for iter_22_4, iter_22_5 in ipairs(iter_22_1.extraReward) do
			print(string.format("服务端发下第%s次物品数据id:", iter_22_1.battleTimes), iter_22_5.id, "num:", iter_22_5.num)
			table.insert(var_22_2[iter_22_1.battleTimes], {
				iter_22_5.id,
				iter_22_5.num
			})
			table.insert(var_22_0, {
				iter_22_5.id,
				iter_22_5.num
			})
		end
	end

	return var_22_0, var_22_1, var_22_2
end

function EndBattleLogic(arg_23_0)
	manager.guide:OnBattleFinish(arg_23_0)
	manager.achievementTips:FliteAchievementType({})
end

function GetAbyssBossPhase()
	return AbyssData:GetCurrentBossPhase()
end

function OnQuitBattleSuccess()
	manager.notify:Invoke(BULLETIN_QUITBATTLE)
end

function GetOldPlayerExp()
	local var_26_0 = PlayerData:GetPlayerInfo()

	if var_26_0 then
		return {
			userLevel = var_26_0.userLevel or 0,
			remain_exp = var_26_0.remain_exp or 0,
			total_exp = var_26_0.total_exp or 0
		}
	else
		return {
			userLevel = 0,
			total_exp = 0,
			remain_exp = 0
		}
	end
end

function CollectHeroExpChange(arg_27_0)
	local var_27_0, var_27_1 = arg_27_0:GetHeroTeam()
	local var_27_2 = arg_27_0:GetSystemHeroTeam()
	local var_27_3 = arg_27_0:GetAssistHeroOwnerList()
	local var_27_4 = {}
	local var_27_5 = {}

	if var_27_0[2] == 0 then
		table.remove(var_27_0, 2)
		table.remove(var_27_1, 2)
		table.insert(var_27_0, 0)
		table.insert(var_27_1, 0)
	end

	for iter_27_0 = 1, 3 do
		var_27_5[iter_27_0] = {}

		if not var_27_0[iter_27_0] or var_27_0[iter_27_0] == 0 then
			var_27_5[iter_27_0] = nil
		else
			local var_27_6 = arg_27_0:GetHeroDataByPos(iter_27_0)
			local var_27_7 = not var_27_2[iter_27_0] and (var_27_1[iter_27_0] == 0 or table.isEmpty(var_27_1)) and (var_27_3 and (var_27_3[iter_27_0] == "0" or var_27_3[iter_27_0] ~= "0" and var_27_3[iter_27_0] == PlayerData:GetPlayerInfo().userID) or table.isEmpty(var_27_3))

			if var_27_6 and var_27_7 and NeedAddExpWithoutBlack(arg_27_0) then
				local var_27_8 = var_27_6.level
				local var_27_9 = var_27_6.exp - LvTools.LevelToExp(var_27_8, "hero_level_exp1")
				local var_27_10 = LvTools.GetMaxTotalExp("hero_level_exp1") - var_27_6.exp

				if var_27_10 < 0 then
					var_27_10 = 0
				end

				local var_27_11 = arg_27_0:GetMultiple()
				local var_27_12 = arg_27_0:GetAddHeroExp() * var_27_11
				local var_27_13 = arg_27_0:GetActivityID()
				local var_27_14 = ActivityData:GetActivityData(var_27_13)

				if var_27_13 ~= 0 and (not var_27_14 or not var_27_14:IsActivitying()) then
					var_27_12 = 0
				end

				local var_27_15 = math.min(var_27_12, var_27_10)
				local var_27_16 = HeroTools.GetHeroCurrentMaxLevel(var_27_6)
				local var_27_17, var_27_18, var_27_19, var_27_20, var_27_21 = LvTools.CheckHeroExp(var_27_8, var_27_6.exp + var_27_15, var_27_16)
				local var_27_22 = var_27_15 - var_27_21
				local var_27_23 = {
					id = var_27_6.id,
					newLv = var_27_17,
					newExp = var_27_6.exp + var_27_22
				}

				table.insert(var_27_4, var_27_23)

				local var_27_24 = math.min(math.floor(var_27_9 / GameLevelSetting[var_27_8].hero_level_exp1 * 1000) / 1000, 0.9999)
				local var_27_25 = math.min(math.floor(var_27_18 / GameLevelSetting[var_27_17].hero_level_exp1 * 1000) / 1000, 0.9999)

				var_27_5[iter_27_0] = {
					oldLv = var_27_8,
					newLv = var_27_17,
					oldPersent = var_27_24,
					newPersent = var_27_25
				}
			else
				var_27_5[iter_27_0] = nil
			end
		end
	end

	var_0_2 = var_27_4

	return var_27_5 or {}
end

function CheckBattleResultNeedAddHeroExp()
	if var_0_2 then
		for iter_28_0, iter_28_1 in ipairs(var_0_2) do
			HeroAction.AddHeroExpSuccess(iter_28_1.id, iter_28_1.newLv, iter_28_1.newExp)
		end

		var_0_2 = nil
	end
end

function GetBattleResultNeedAddHeroExp()
	local var_29_0 = var_0_2

	var_0_2 = nil

	return var_29_0
end

function NeedAddExpWithoutBlack(arg_30_0)
	if not arg_30_0 then
		return false
	end

	local var_30_0 = arg_30_0:GetType()

	if var_30_0 == BattleConst.STAGE_TYPE_NEW.CHALLENGE_ROGUE_TEAM then
		return false
	end

	if var_30_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT or var_30_0 == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT then
		return BattleInstance.NeedAddExp(arg_30_0)
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
