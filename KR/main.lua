print(string.format("LUA VM MEMORY USED: %0.2f KB", collectgarbage("count")))
require("include")

local var_0_0 = require("cjson")

RECONNECT_RETRY_COUNT = 3
loginRetryCount = 0

local var_0_1 = true

function setScreenOrientation(arg_1_0)
	var_0_1 = arg_1_0
end

function getScreenOrientation()
	return var_0_1
end

debugger = import("game.debugger.debugger")

local var_0_2 = import("game.RoutesConfig")
local var_0_3 = import("game.GameContext")

function __G__TRACKBACK__(arg_3_0)
	local var_3_0 = (("----- Lua error begin -----\n" .. "Lua error: " .. tostring(arg_3_0) .. "\n") .. debug.traceback("", 2)) .. "----- Lua error end -----"

	print(var_3_0)
	Debugger.LogError(var_3_0)
end

function PrepareAdaptData()
	local var_4_0 = _G.SCREEN_WIDTH / _G.SCREEN_HEIGHT

	ReduxView.NEED_ADAPT = var_4_0 > ReduxView.ADAPT_RAITO
end

function DeploySetting(arg_5_0)
	local var_5_0 = tonumber(arg_5_0.pic.resolution)
	local var_5_1, var_5_2 = SettingTools.GetSettingScreenSize(var_5_0)

	Screen.SetResolution(var_5_1, var_5_2, true)

	local var_5_3 = manager.ui.cameraExtension

	if SDKTools.GetIsEnglish() then
		var_5_3.hdr = arg_5_0.pic.hdr == 1
	else
		var_5_3.hdr = true

		PlayerPrefs.SetInt("allowHDR", 1)
	end

	if PlayerPrefs.GetInt("allowMSAA") == 0 then
		UnityEngine.Pipelines.SimPipeline.SimPipelineSettings.AliasingEnable = false
	else
		UnityEngine.Pipelines.SimPipeline.SimPipelineSettings.AliasingEnable = true
	end

	Application.targetFrameRate = arg_5_0.pic.frame == 0 and 30 or arg_5_0.pic.frame == 1 and 60 or 120

	SettingAction.DeploySoundSetting("allData", arg_5_0.sound)

	ReduxView.VIEW_ADAPT_DISTANCE = arg_5_0.game.adapter_value

	PlayerPrefs.SetString("text_language", arg_5_0.sound.text_language)
end

function EnterGame()
	_G.gameContext = var_0_3.New(var_0_2, {
		"home"
	})

	_G.gameContext:RegistPreLoadFunc(ViewTools.PreDealWithAsset)
	_G.gameContext:SetSystemLayer("login")

	_G.CHANNEL_MASTER_ID = GameToSDK.GetChannelMasterId()

	if _G.CHANNEL_MASTER_ID == -1 then
		_G.CHANNEL_MASTER_ID = 0
	end

	print("GameToSDK ", _G.CHANNEL_MASTER_ID)
	manager.uiInit()

	_G.GlobalCall = require("library/GlobalCall")

	if _G.SCREEN_WIDTH == nil or _G.SCREEN_HEIGHT == nil then
		_G.SCREEN_WIDTH = Screen.width
		_G.SCREEN_HEIGHT = Screen.height
	end

	PrepareAdaptData()
	DeploySetting(SettingData:GetSettingData())

	_G.gameListener = GameListener.New()
	_G.gameTimer = GameTimer.GetInstance()
	_G.AnalyticsPresetProperties = GameToSDK.GetData("{\"dataType\" : \"GetAnalyticsPresetProperties\"}")

	if _G.AnalyticsPresetProperties == nil or _G.AnalyticsPresetProperties == "" then
		_G.AnalyticsPresetProperties = "{}"
	end

	_G.AnalyticsPresetProperties = var_0_0.decode(_G.AnalyticsPresetProperties)

	SendMessageToSDKWithCallBack("{\"messageType\" : \"GetDeviceInfo\"}", "DeviceInfoGet", function()
		GotoLoginView()
	end)
	LuaForUtil.InitSavePhoto()
end

function GetInitAssetList()
	return {
		"Fonts/SourceHanSansBlod",
		"Fonts/OykoRegular",
		"Fonts/FontEditor",
		"Atlas/PopUI",
		"Atlas/Common",
		"Atlas/Hero",
		"Atlas/BattleSelectHero",
		"Atlas/Shop",
		"Atlas/Draw",
		"Atlas/Currency",
		"Atlas/Item",
		"Atlas/ItemSmall",
		"Atlas/ChapterMap",
		"Atlas/Home"
	}, nil
end

function InitGameSetBGM(arg_9_0)
	manager.audio:PlayBGM("ui_skip", "ui_reset_filter")
	AudioManager.Instance:SetAisacControlOfCategory("music", "phase_controller", 0)
	AudioManager.Instance:SetAisacControlOfCategory("music", "bgm_volume", 0)
	AudioManager.Instance:SetAisacControlOfCategory("music", "bgm_speed", 1)
	AudioManager.Instance:SetAisacControlOfCategory("music", "music_Control", 1)
	AudioManager.Instance:SetAisacControlOfCategory("sfx", "sfx_Control", 1)
	AudioManager.Instance:SetAisacControlOfCategory("vocal", "vocal_Control", 1)
end

function GetHomeMusicID()
	local var_10_0 = IllustratedData:GetBgm()

	if SettingData:GetHomeSceneSettingData().home_scene_scene_bgm == 1 then
		local var_10_1 = HomeSceneSettingData:GetCurScene()
		local var_10_2 = HomeSceneSettingCfg[var_10_1]
		local var_10_3 = var_10_2.scene_setting
		local var_10_4 = var_10_2.default_music

		if var_10_4 ~= 0 and table.indexof(var_10_3, HomeSceneSettingConst.SETTING.SCENE_BGM) then
			var_10_0 = var_10_4
		end
	end

	return var_10_0
end

function PlayGameSetBGM()
	local var_11_0 = GetHomeMusicID()

	if var_11_0 == nil or var_11_0 == 0 then
		return nil
	end

	local var_11_1 = MusicRecordCfg[var_11_0]

	if not var_11_1 then
		return nil
	end

	local var_11_2 = MusicData:GetAisacSet(var_11_0)

	for iter_11_0, iter_11_1 in pairs(var_11_2) do
		AudioManager.Instance:SetAisacControlOfCategory("music", iter_11_0, iter_11_1)
	end

	manager.audio:PlayBGM(var_11_1.cuesheet, var_11_1.cueName, var_11_1.awbName)

	return true
end

function GameInit()
	pcall(debugger.Start)
	Asset.Load("Fonts/SourceHanSans", true)
	SettingData:InitSetting()
	manager.init()
	LoadingUIManager.inst:ShowLoadUI(LoadingUIType.GameStart)
	LeanTween.init(800)
	EnterGame()
end

function PreLoadAssetByPlayer()
	LoadingUIManager.inst:ShowLoadUI()

	local var_13_0 = {}
	local var_13_1 = HeroTools.GetNeedPreLoadHeroId()

	for iter_13_0, iter_13_1 in pairs(var_13_1) do
		local var_13_2 = HeroTools.HeroUsingSkinInfo(iter_13_0).modelId

		var_13_0["Char/" .. var_13_2] = 20
	end

	PreLoadAsset(var_13_0, 0, function()
		for iter_14_0, iter_14_1 in pairs(var_13_1) do
			local var_14_0 = HeroCfg[iter_14_0]
			local var_14_1 = manager.resourcePool:Get("Char/" .. HeroTools.HeroUsingSkinInfo(iter_14_0).modelId, ASSET_TYPE.TPOSE)

			manager.resourcePool:DestroyOrReturn(var_14_1, ASSET_TYPE.TPOSE)
		end

		gameContext:Go("/home", {
			isFirstCheck = true
		}, false, true)
	end)
end

function PreLoadAsset(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = 0
	local var_15_1 = arg_15_1

	if not arg_15_3 then
		LoadingUIManager.inst:SetUIText(string.format(GetTips("LOADING")))
	end

	local function var_15_2(arg_16_0)
		return function()
			var_15_1 = var_15_1 + arg_16_0

			if not arg_15_3 then
				LoadingUIManager.inst:SetUIProgress(var_15_1)
			end

			if var_15_1 > 99 and arg_15_2 then
				arg_15_2()

				arg_15_2 = nil
			end
		end
	end

	for iter_15_0, iter_15_1 in pairs(arg_15_0) do
		var_15_0 = var_15_0 + iter_15_1
	end

	for iter_15_2, iter_15_3 in pairs(arg_15_0) do
		Asset.LoadAsync(iter_15_2, var_15_2(math.ceil(iter_15_3 / var_15_0 * (100 - arg_15_1))))
	end
end

function CheckManagers()
	if LuaExchangeHelper.GetSceneIsHanding() then
		return false
	end

	if not manager.managerInit then
		manager.uiInit()
	end

	return true
end

function CheckNewGuide()
	manager.guide:InitGuide()

	if manager.guide:IsGoToHome() then
		if (GameToSDK.PLATFORM_ID ~= 2 or PlayerPrefs.GetInt("ShowBrahmaBouns", 0) == 1) and ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_LOGIN_BONUS) and not LoginBonusData:GetIsFinish() then
			gameContext:Go("/loginBrahmaBonus", nil, true, true)
		else
			PreLoadAssetByPlayer()
		end
	else
		gameContext:ClearHistory()
	end
end

local var_0_4

function LateInitData()
	PlayerAction.InitChatBubbleRedPoint()
	ChatAction.FriendChatInitData()
	ChatAction.GuildChatInitData()
	ChatAction.LoadChannelChatData()
	FriendsAction:ChatInit()
	ShopAction.LateInitLua()
	WarChessAction.UpdateSummerChessPlotRedPoint()
	WarChessData:InitRedPoint()
	BattleStageAction.AddActivityTimer()
	BattleStageAction.UpdateActivityRedPoint()
	BattleStageAction.UpdateSubPlotRedPoint()
	EquipSeizureAction.InitRedPointEveryDay()
	GuildActivitySPAction.UpdateRedPoint()
	ActivityAction.InitLoginShopRedPoint()
	ActivitySummerChessBoardAction.BindEvent()
	ActivitySummerChessBoardAction.InitRedPoint()
	ActivityPointAction.InitRedPoint()

	if var_0_4 then
		var_0_4:Stop()
	end

	local var_20_0 = GameSetting.refresh_time1.value[1][1]
	local var_20_1 = manager.time:GetNextTime(var_20_0, 0, 0)
	local var_20_2 = TimeMgr.GetInstance():GetNextWeekTime(1, var_20_0, 0, 0)

	var_0_4 = Timer.New(function()
		if manager.time:GetServerTime() >= var_20_1 then
			var_20_1 = manager.time:GetNextTime(var_20_0, 0, 0)

			manager.notify:Invoke(ZERO_REFRESH)
		end

		if TimeMgr.GetInstance():GetServerTime() - var_20_2 > 0 then
			var_20_2 = TimeMgr.GetInstance():GetNextWeekTime(1, var_20_0, 0, 0)

			manager.notify:Invoke(WEEK_ZERO_REFRESH)
		end
	end, 1, -1)

	var_0_4:Start()
end

function DisposeData()
	BattleStageAction.RemoveActivityTimer()
	SequentialBattleAction.ResetData()
	SpringFestivalRiddleAction.Dispose()
	ActivityTools.ClearAllActivityTimer()
	ActivitySummerChessBoardAction.UnbindEvent()
	BulletinData.OnLogout()
	manager.rollTips:OnLogout()

	if var_0_4 then
		var_0_4:Stop()

		var_0_4 = nil
	end
end

function GetTips(arg_23_0)
	local var_23_0

	if type(arg_23_0) == "number" then
		var_23_0 = arg_23_0
	elseif type(arg_23_0) == "string" then
		var_23_0 = TipsCfg.get_id_list_by_define[arg_23_0]
	end

	local var_23_1

	if var_23_0 and TipsCfg[var_23_0] then
		if TipsCfg[var_23_0] then
			var_23_1 = GetI18NText(TipsCfg[var_23_0].desc)
		else
			var_23_1 = GetTips("ERROR_CODE") .. var_23_0
		end
	elseif arg_23_0 ~= nil then
		var_23_1 = "" .. arg_23_0
	end

	return var_23_1, var_23_0
end

function GetTipsF(arg_24_0, ...)
	local var_24_0 = {
		...
	}
	local var_24_1, var_24_2 = GetTips(arg_24_0)

	return string.format(var_24_1, unpack(var_24_0)), var_24_2
end

function ShowTips(arg_25_0, arg_25_1)
	if LuaExchangeHelper.GetSceneIsHanding() then
		return
	end

	local var_25_0, var_25_1 = GetTips(arg_25_0)

	manager.tips:ShowTips(var_25_0, var_25_1, arg_25_1)
end

function ShakingMobile()
	if manager == nil then
		return
	end

	if manager.notify == nil then
		return
	end

	manager.notify:Invoke(SHAKING_MOBILE)
end

function GotoLoginView(arg_27_0)
	GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
	manager.ui:SetUIDText("")
	DisposeData()
	manager.story:Dispose()

	if manager.NewChessManager then
		manager.NewChessManager:Dispose()

		manager.NewChessManager = nil
	end

	if manager.ChessBoardManager then
		manager.ChessBoardManager:Dispose()

		manager.ChessBoardManager = nil
	end

	manager.net:Disconnect()
	manager.net:ChatDisconnect()
	manager.guide:OnLogout()
	manager.uiTime:OnLogout()
	ActivityAction.OnLogout()
	ResetSceneDataForExcehange()
	manager.achievementTips:InitData()

	_G.clickCDing_ = false
	_G.isLogining = false

	local var_27_0 = GameLocalData:GetValueFromCommonModule("LoginConceptGuideData", "watched")

	if true or var_27_0 then
		gameContext:Go("/login", {
			isAutoLogin = arg_27_0
		})
	else
		gameContext:Go("/loginConceptGuild", {
			isAutoLogin = arg_27_0
		})
	end

	ReduxFactory.GetInstance():ClearCacheViews()
	_G.gameTimer:Dispose()
end

function SetActive(arg_28_0, arg_28_1)
	arg_28_1 = arg_28_1 or false

	if isNil(arg_28_0) then
		return
	end

	local var_28_0 = arg_28_0:GetComponent("UIPanel")

	if var_28_0 then
		var_28_0:SetActive(arg_28_1)
	else
		arg_28_0:SetActive(arg_28_1)
	end
end

function isSuccess(arg_29_0)
	return arg_29_0 == TipsCfg.get_id_list_by_define.SUCCESS
end

function ShowQuanquan(arg_30_0)
	manager.loadui:ShowLoad(arg_30_0)
end

function SetForceShowQuanquan(arg_31_0)
	manager.loadui:ForceShowLoad(arg_31_0)
end

function RegistChangeSceneClearHandler(arg_32_0)
	if not ChangeSceneClearHandlerList then
		ChangeSceneClearHandlerList = {}

		function SceneForLua.clearLuaMemoryHandler()
			pcall(function()
				for iter_34_0, iter_34_1 in ipairs(ChangeSceneClearHandlerList) do
					iter_34_1()
				end
			end)
		end
	end

	table.insert(ChangeSceneClearHandlerList, arg_32_0)
end

function ShowMessageBox(arg_35_0)
	if LuaExchangeHelper.GetSceneIsHanding() then
		local var_35_0
		local var_35_1 = FrameTimer.New(function()
			if LuaExchangeHelper.GetSceneIsHanding() then
				return
			end

			var_35_0:Stop()
			CheckManagers()
			manager.messageBox:ShowMessage(arg_35_0)
		end, 1, -1)

		var_35_0 = var_35_1

		var_35_1:Start()
	else
		manager.messageBox:ShowMessage(arg_35_0)
	end
end

function cfgToItemTemplate(arg_37_0)
	if arg_37_0[1] then
		local var_37_0 = clone(ItemTemplateData)

		var_37_0.id = arg_37_0[1]
		var_37_0.number = arg_37_0[2]
		var_37_0.timeValid = arg_37_0[4]

		return var_37_0
	end

	return arg_37_0
end

function ShowPopItem(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	arg_38_1 = cfgToItemTemplate(arg_38_1)

	local var_38_0 = arg_38_1.id
	local var_38_1 = ItemCfg[var_38_0].type
	local var_38_2 = deepClone(arg_38_1)

	var_38_2.grayFlag = false

	if var_38_1 == ItemConst.ITEM_TYPE.EQUIP then
		local var_38_3 = arg_38_2 and arg_38_2.page or 1
		local var_38_4 = var_38_2.equip_id and var_38_2.equip_id ~= 0 and var_38_2.equip_id or nil

		JumpTools.OpenPageByJump("/equipCultureView", {
			equipId = var_38_4,
			prefabId = var_38_0,
			pageIndex = var_38_3
		})
	elseif var_38_1 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		if whereami == "battleResult" then
			JumpTools.OpenPageByJump("showServantView", {
				state = "onlydetail",
				id = var_38_0,
				gameContext:SetSystemLayer("battleResult")
			})
		elseif whereami ~= "home" then
			JumpTools.OpenPageByJump("/showServantView", {
				state = "onlydetail",
				id = var_38_0
			})
		else
			ShowPopItemOnly(arg_38_0, var_38_2, arg_38_2)
		end
	elseif var_38_1 == ItemConst.ITEM_TYPE.DORM_FURNITURE then
		JumpTools.OpenPageByJump("dormItemPopView", {
			id = var_38_0
		})
	else
		ShowPopItemOnly(arg_38_0, var_38_2, arg_38_2)
	end
end

function ShowPopItemOnly(arg_39_0, arg_39_1, arg_39_2)
	arg_39_1 = cfgToItemTemplate(arg_39_1)

	if arg_39_0 == POP_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	elseif arg_39_0 == POP_SOURCE_ITEM then
		JumpTools.OpenPageByJump("popSourceItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	elseif arg_39_0 == POP_OPERATE_ITEM then
		JumpTools.OpenPageByJump("popOperateItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	elseif arg_39_0 == POP_MERGE_ITEM then
		JumpTools.OpenPageByJump("popMergeItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	elseif arg_39_0 == POP_SOURCE_DES_ITEM then
		JumpTools.OpenPageByJump("popSourceDesItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	elseif arg_39_0 == POP_OTHER_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_39_1,
			extraInfo = arg_39_2
		})
	end
end

function ShowPopItemSource(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0

	if arg_40_2 then
		for iter_40_0, iter_40_1 in ipairs(EquipCfg.get_id_list_by_suit[arg_40_2]) do
			if EquipCfg[iter_40_1].starlevel == 5 then
				arg_40_0 = iter_40_1

				break
			end
		end
	end

	local var_40_1 = EquipStruct.New(0, arg_40_0)

	JumpTools.OpenPageByJump("popEquipSourceView", {
		popItemInfo = {
			id = arg_40_0
		},
		equip_info = var_40_1,
		suitID = arg_40_2
	})
end

function ShowPopEquipSuit(arg_41_0, arg_41_1)
	JumpTools.OpenPageByJump("popEquipSuitView", {
		suitId = arg_41_0,
		hideBtn = arg_41_1
	})
end

function saveData(arg_42_0, arg_42_1, arg_42_2)
	GameLocalData:SaveToTargetModule(arg_42_0, arg_42_1, arg_42_2)
end

function getData(arg_43_0, arg_43_1)
	return GameLocalData:GetValueFromTargetModule(arg_43_0, arg_43_1)
end

function saveModule(arg_44_0, arg_44_1)
	local var_44_0 = GameLocalData:GetTargetModule(arg_44_0)

	for iter_44_0, iter_44_1 in pairs(arg_44_1) do
		var_44_0[iter_44_0] = iter_44_1
	end

	GameLocalData:SaveTargetModule(arg_44_0, var_44_0)
end

function getModule(arg_45_0)
	return GameLocalData:GetTargetModule(arg_45_0)
end

function getCommonData(arg_46_0, arg_46_1)
	return GameLocalData:GetValueFromCommonModule(arg_46_0, arg_46_1)
end

function cleanProtoTable(arg_47_0, arg_47_1)
	local var_47_0 = {}

	if arg_47_0 then
		for iter_47_0, iter_47_1 in ipairs(arg_47_0) do
			if arg_47_1 and type(arg_47_1) == "table" then
				var_47_0[iter_47_0] = {}

				for iter_47_2, iter_47_3 in ipairs(arg_47_1) do
					var_47_0[iter_47_0][iter_47_3] = iter_47_1[iter_47_3]
				end
			else
				var_47_0[iter_47_0] = iter_47_1
			end
		end
	end

	return var_47_0
end

function OpenPageUntilLoaded(arg_48_0, arg_48_1, arg_48_2)
	JumpTools.OpenPageUntilLoaded(arg_48_0, arg_48_1, arg_48_2)
end

function Quit()
	NeedGameUserInfo()
	GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
	GameToSDK.UpUserInfo(PlayerTools.PackUserData("ExitGame"))
	pcall(debugger.Stop)
	LuaHelper.Quit()
	SendMessageManagerToSDK("role_logout")
end

function OnApplicationQuit(arg_50_0)
	manager.net:Disconnect()
	manager.net:ChatDisconnect()
	gameContext:DestroyCurRoutes()

	if manager.ChessManager then
		manager.ChessManager:Dispose()

		manager.ChessManager = nil
	end

	if manager.NewChessManager then
		manager.NewChessManager:Dispose()

		manager.NewChessManager = nil
	end

	if manager.ChessBoardManager then
		manager.ChessBoardManager:Dispose()

		manager.ChessBoardManager = nil
	end

	manager.achievementTips:Dispose()
	manager.destroy()

	if manager.guide then
		manager.guide:Dispose()

		manager.guide = nil
	end

	if manager.rollTips then
		manager.rollTips:Dispose()

		manager.rollTips = nil
	end

	if manager.uiTime then
		manager.uiTime:Dispose()

		manager.uiTime = nil
	end

	SendMessageManagerToSDK("role_logout")
end

local var_0_5 = true
local var_0_6 = false

function OnApplicationFocus(arg_51_0)
	OnAppFocusPauseStateChange(arg_51_0, var_0_6)
end

function OnApplicationPause(arg_52_0)
	OnAppFocusPauseStateChange(var_0_5, arg_52_0)
end

function OnAppFocusPauseStateChange(arg_53_0, arg_53_1)
	local var_53_0 = var_0_5
	local var_53_1 = var_0_6

	var_0_5 = arg_53_0
	var_0_6 = arg_53_1

	if (var_53_1 == false and arg_53_1 == true or var_53_0 == true and arg_53_0 == false) and var_53_1 == false and arg_53_1 == true then
		GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
		FatigueReminder()
		DailyFatigueReminder()
		CatExploreReminder()
		CanteenDispatchReminder()
		CanteenFullReminder()
	end

	if var_53_1 == true and arg_53_1 == false then
		GameToSDK.UpUserEvent("{\"eventType\" : \"Begin\"}")
		StopFatigueReminder()
		StopDailyFatigueReminder()
		StopCatExploreReminder()
		StopCanteenDispatchReminder()
		StopCanteenFullReminder()

		if OperationAction ~= nil then
			OperationAction.OnApplicationBack()
		end
	end

	if manager ~= nil and manager.notify ~= nil then
		manager.notify:Invoke(GAME_FOCUS_CHANGE, arg_53_0, arg_53_1)
	end
end

function CanteenFullReminder()
	if manager == nil then
		return
	end

	local var_54_0 = SettingData:GetRemindSettingData()

	if var_54_0 ~= nil and (var_54_0.canteen_full_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_FULL)
	end
end

function CanteenDispatchReminder()
	if manager == nil then
		return
	end

	local var_55_0 = SettingData:GetRemindSettingData()

	if var_55_0 ~= nil and (var_55_0.canteen_dispatch_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_DISPATCH)
	end
end

function CatExploreReminder()
	if manager == nil then
		return
	end

	local var_56_0 = SettingData:GetRemindSettingData()

	if var_56_0 ~= nil and (var_56_0.cat_explore_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CAT_EXPLORE)
	end
end

function DailyFatigueReminder()
	if manager == nil then
		return
	end

	local var_57_0 = SettingData:GetRemindSettingData()

	if var_57_0 ~= nil and (var_57_0.daily_fatigue_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.DAILYFATIGUE)
	end
end

function FatigueReminder()
	if manager == nil then
		return
	end

	local var_58_0 = SettingData:GetRemindSettingData()

	if var_58_0 ~= nil then
		local var_58_1 = var_58_0.fatigue_full_reminder or 0
		local var_58_2 = CurrencyData:GetFatigueCallFlag()

		if var_58_1 == 1 and var_58_2 == 1 then
			TimerReminderData:SetReminder(TimerReminderConst.FATIGUE)
		end
	end
end

function StopFatigueReminder()
	TimerReminderData:CancelReminder(TimerReminderConst.FATIGUE)
end

function StopDailyFatigueReminder()
	TimerReminderData:CancelReminder(TimerReminderConst.DAILYFATIGUE)
end

function StopCatExploreReminder()
	TimerReminderData:CancelReminder(TimerReminderConst.CAT_EXPLORE)
end

function StopCanteenDispatchReminder()
	TimerReminderData:CancelReminder(TimerReminderConst.CANTEEN_DISPATCH)
end

function StopCanteenFullReminder()
	TimerReminderData:CancelReminder(TimerReminderConst.CANTEEN_FULL)
end

_G.OnLoadedCallBackPre_ = nil
_G.OnLoadedCallBack_ = nil

function RefreshUI(arg_64_0)
	if arg_64_0 then
		gameContext:SetSystemLayer(arg_64_0)
	else
		gameContext:SetSystemLayer("home")
	end

	manager.uiInit()

	if _G.OnLoadedCallBackPre_ then
		_G.OnLoadedCallBackPre_()
	end

	gameContext:RevertRoutes()
	ResetSceneDataForExcehange()

	if _G.OnLoadedCallBack_ then
		_G.OnLoadedCallBack_()

		_G.OnLoadedCallBack_ = nil
	end

	LuaForUtil.UpdateCameraSetting()
end

function DestroyLua()
	gameContext:SetSystemLayer()
	gameContext:DestroyCurRoutes()
	manager.destroy()
end

function StatUILoadTimeToServer(arg_66_0)
	return
end

function LuaGcCollect()
	collectgarbage("collect")
end

function SpliceI18NText(arg_68_0)
	local var_68_0 = #arg_68_0

	if var_68_0 < 2 then
		return arg_68_0
	end

	local var_68_1 = arg_68_0[1]
	local var_68_2 = ""

	if SettingData:GetCurrentLanguage() == "en" then
		var_68_2 = " "
	end

	for iter_68_0 = 2, var_68_0 do
		var_68_1 = string.format("%s%s%s", var_68_1, var_68_2, arg_68_0[iter_68_0])
	end

	return var_68_1
end

function GetI18NText(arg_69_0)
	local var_69_0 = I18NRuntimeManager.Instance:GetI18NText(arg_69_0)

	if var_69_0 then
		return var_69_0
	end

	return arg_69_0
end

local var_0_7 = {
	AllTranslateCfg,
	AllTranslateCfg2,
	AllTranslateCfg3,
	AllTranslateCfg4,
	AllTranslateCfg5,
	AllTranslateCfg6,
	AllTranslateCfg7,
	AllTranslateCfg8,
	AllTranslateCfg9,
	AllTranslateCfg10
}

function GetTranslateCfg(arg_70_0)
	for iter_70_0, iter_70_1 in ipairs(var_0_7) do
		if iter_70_1 and iter_70_1[arg_70_0] then
			return iter_70_1[arg_70_0]
		end
	end

	return nil
end

function GetAllTranslateCfg()
	local var_71_0 = {}

	print("GetAllTranslateCfg")

	for iter_71_0, iter_71_1 in ipairs(var_0_7) do
		if iter_71_1 then
			for iter_71_2, iter_71_3 in pairs(iter_71_1) do
				local var_71_1 = TranslateData.New()

				var_71_1.zh_cn = iter_71_2
				var_71_1.en = iter_71_3.translate_en
				var_71_1.jp = iter_71_3.translate_jp
				var_71_1.kr = iter_71_3.translate_kr
				var_71_1.tc = iter_71_3.translate_tc
				var_71_0[iter_71_2] = var_71_1
			end
		end
	end

	return var_71_0
end

function OpenDownLoadPage(arg_72_0, arg_72_1)
	if gameContext:IsOpenRoute("downLoadPage") then
		return
	end

	JumpTools.OpenPageByJump("downLoadPage", {
		title = arg_72_0,
		abbr = arg_72_1
	})
end

function SetDownLoadPageProgress(arg_73_0, arg_73_1)
	if not gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.OpenPageByJump("downLoadPage")
	end

	local var_73_0 = gameContext:GetOpenPageHandler(routeName)

	if var_73_0 then
		var_73_0:SetProgress(arg_73_0, arg_73_1)
	end
end

function CloseDownLoadPage()
	if gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.Back()
	end
end

function EncodeURL(arg_75_0)
	arg_75_0 = string.gsub(arg_75_0, "([^%w%p ])", function(arg_76_0)
		return string.format("%%%02X", string.byte(arg_76_0))
	end)

	return arg_75_0
end

function OnHomeVoiceStart(arg_77_0, arg_77_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_START, arg_77_0, arg_77_1)
end

function OnHomeVoiceStop(arg_78_0, arg_78_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_STOP, arg_78_0, arg_78_1)
end

local var_0_8 = false

function EnterMainScene()
	if ReleaseBattleResultSnapshot then
		ReleaseBattleResultSnapshot()
	end

	var_0_8 = true
end

function ExitMainScene()
	var_0_8 = false
end

function GetIsInMainScene()
	return var_0_8
end

function OnExitInput()
	if not manager or not manager.windowBar then
		return
	end

	if manager.ui and not manager.ui:GetIsUIEventEnabled() then
		return
	end

	if manager.guide and manager.guide:IsPlaying() then
		return
	end

	if manager.net and manager.net:GetMainSendingPacketNum() > 0 then
		return
	end

	if gameContext ~= nil then
		local var_82_0 = gameContext:GetLastOpenPage()

		if var_82_0 == "home" then
			ShowQuitConfirm()

			return
		end

		local var_82_1 = gameContext:GetOpenPageHandler(var_82_0)

		if var_82_1 and var_82_1.OnExitInput and var_82_1:OnExitInput() then
			return
		end
	end

	if manager.windowBar:GetBackBtnIsShow() then
		if not manager.messageBox:GetIsAllFree() then
			return
		end

		manager.windowBar:CallBackFunc()
	end
end
