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
	local var_5_0
	local var_5_1

	if GameToSDK.PLATFORM_ID == 3 then
		local var_5_2 = arg_5_0.pic.pc_resolution[1]
		local var_5_3 = arg_5_0.pic.pc_resolution[2]

		Screen.SetResolution(var_5_2, var_5_3, Screen.fullScreenMode)
	else
		local var_5_4 = tonumber(arg_5_0.pic.resolution)
		local var_5_5, var_5_6 = SettingTools.GetSettingScreenSize(var_5_4)

		Screen.SetResolution(var_5_5, var_5_6, true)
	end

	manager.ui.cameraExtension.hdr = true

	PlayerPrefs.SetInt("allowHDR", 1)

	if PlayerPrefs.GetInt("allowMSAA") == 0 then
		UnityEngine.Pipelines.SimPipeline.SimPipelineSettings.AliasingEnable = false
	else
		UnityEngine.Pipelines.SimPipeline.SimPipelineSettings.AliasingEnable = true
	end

	local var_5_7 = nullable(SettingConst.TARGET_FRAME_RATE, arg_5_0.pic.frame) or 60

	Application.targetFrameRate = var_5_7

	if GameToSDK.PLATFORM_ID == 3 then
		manager.IngameGraphic:ChangeVerticalSync(arg_5_0.pic.vertical_sync)
		manager.IngameGraphic:ChangeShadowQuality(arg_5_0.pic.shadow)
		manager.IngameGraphic:ChangePostProcessQuality(arg_5_0.pic.post_process)
		manager.IngameGraphic:ChangeRenderScale(arg_5_0.pic.render_scale)
	end

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
	gameContext:Go("/home", {
		isFirstCheck = true
	}, false, true)
end

function PreLoadAsset(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = 0
	local var_14_1 = arg_14_1

	if not arg_14_3 then
		LoadingUIManager.inst:SetUIText(string.format(GetTips("LOADING")))
	end

	local function var_14_2(arg_15_0)
		return function()
			var_14_1 = var_14_1 + arg_15_0

			if not arg_14_3 then
				LoadingUIManager.inst:SetUIProgress(var_14_1)
			end

			if var_14_1 > 99 and arg_14_2 then
				arg_14_2()

				arg_14_2 = nil
			end
		end
	end

	for iter_14_0, iter_14_1 in pairs(arg_14_0) do
		var_14_0 = var_14_0 + iter_14_1
	end

	for iter_14_2, iter_14_3 in pairs(arg_14_0) do
		Asset.LoadAsync(iter_14_2, var_14_2(math.ceil(iter_14_3 / var_14_0 * (100 - arg_14_1))))
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

	local var_19_0 = GameSetting.refresh_time1.value[1][1]
	local var_19_1 = manager.time:GetNextTime(var_19_0, 0, 0)
	local var_19_2 = TimeMgr.GetInstance():GetNextWeekTime(1, var_19_0, 0, 0)

	var_0_4 = Timer.New(function()
		if manager.time:GetServerTime() >= var_19_1 then
			var_19_1 = manager.time:GetNextTime(var_19_0, 0, 0)

			manager.notify:Invoke(ZERO_REFRESH)
		end

		if TimeMgr.GetInstance():GetServerTime() - var_19_2 > 0 then
			var_19_2 = TimeMgr.GetInstance():GetNextWeekTime(1, var_19_0, 0, 0)

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

function GetTips(arg_22_0)
	local var_22_0

	if type(arg_22_0) == "number" then
		var_22_0 = arg_22_0
	elseif type(arg_22_0) == "string" then
		var_22_0 = TipsCfg.get_id_list_by_define[arg_22_0]
	end

	local var_22_1

	if var_22_0 and TipsCfg[var_22_0] then
		if TipsCfg[var_22_0] then
			var_22_1 = GetI18NText(TipsCfg[var_22_0].desc)
		else
			var_22_1 = GetTips("ERROR_CODE") .. var_22_0
		end
	elseif arg_22_0 ~= nil then
		var_22_1 = "" .. arg_22_0
	end

	return var_22_1, var_22_0
end

function GetTipsF(arg_23_0, ...)
	local var_23_0 = {
		...
	}
	local var_23_1, var_23_2 = GetTips(arg_23_0)

	return string.format(var_23_1, unpack(var_23_0)), var_23_2
end

function ShowTips(arg_24_0, arg_24_1)
	if LuaExchangeHelper.GetSceneIsHanding() then
		return
	end

	local var_24_0, var_24_1 = GetTips(arg_24_0)

	manager.tips:ShowTips(var_24_0, var_24_1, arg_24_1)
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

function GotoLoginView(arg_26_0)
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

	local var_26_0 = GameLocalData:GetValueFromCommonModule("LoginConceptGuideData", "watched")

	if true or var_26_0 then
		gameContext:Go("/login", {
			isAutoLogin = arg_26_0
		})
	else
		gameContext:Go("/loginConceptGuild", {
			isAutoLogin = arg_26_0
		})
	end

	ReduxFactory.GetInstance():ClearCacheViews()
	_G.gameTimer:Dispose()
end

function SetActive(arg_27_0, arg_27_1)
	arg_27_1 = arg_27_1 or false

	if isNil(arg_27_0) then
		return
	end

	local var_27_0 = arg_27_0:GetComponent("UIPanel")

	if var_27_0 then
		var_27_0:SetActive(arg_27_1)
	else
		arg_27_0:SetActive(arg_27_1)
	end
end

function isSuccess(arg_28_0)
	return arg_28_0 == TipsCfg.get_id_list_by_define.SUCCESS
end

function ShowQuanquan(arg_29_0)
	manager.loadui:ShowLoad(arg_29_0)
end

function SetForceShowQuanquan(arg_30_0)
	manager.loadui:ForceShowLoad(arg_30_0)
end

function RegistChangeSceneClearHandler(arg_31_0)
	if not ChangeSceneClearHandlerList then
		ChangeSceneClearHandlerList = {}

		function SceneForLua.clearLuaMemoryHandler()
			pcall(function()
				for iter_33_0, iter_33_1 in ipairs(ChangeSceneClearHandlerList) do
					iter_33_1()
				end
			end)
		end
	end

	table.insert(ChangeSceneClearHandlerList, arg_31_0)
end

function ShowMessageBox(arg_34_0)
	if LuaExchangeHelper.GetSceneIsHanding() then
		local var_34_0
		local var_34_1 = FrameTimer.New(function()
			if LuaExchangeHelper.GetSceneIsHanding() then
				return
			end

			var_34_0:Stop()
			CheckManagers()
			manager.messageBox:ShowMessage(arg_34_0)
		end, 1, -1)

		var_34_0 = var_34_1

		var_34_1:Start()
	else
		manager.messageBox:ShowMessage(arg_34_0)
	end
end

function cfgToItemTemplate(arg_36_0)
	if arg_36_0 and arg_36_0[1] then
		local var_36_0 = clone(ItemTemplateData)

		var_36_0.id = arg_36_0[1]
		var_36_0.number = arg_36_0[2]
		var_36_0.timeValid = arg_36_0[4]

		return var_36_0
	end

	return arg_36_0
end

function ShowPopItem(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_1 = cfgToItemTemplate(arg_37_1)

	local var_37_0 = arg_37_1.id
	local var_37_1 = ItemCfg[var_37_0].type
	local var_37_2 = deepClone(arg_37_1)

	var_37_2.grayFlag = false

	if var_37_1 == ItemConst.ITEM_TYPE.EQUIP then
		local var_37_3 = arg_37_2 and arg_37_2.page or 1
		local var_37_4 = var_37_2.equip_id and var_37_2.equip_id ~= 0 and var_37_2.equip_id or nil

		JumpTools.OpenPageByJump("/equipCultureView", {
			equipId = var_37_4,
			prefabId = var_37_0,
			pageIndex = var_37_3
		})
	elseif var_37_1 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		if whereami == "battleResult" then
			JumpTools.OpenPageByJump("showServantView", {
				state = "onlydetail",
				id = var_37_0,
				gameContext:SetSystemLayer("battleResult")
			})
		elseif whereami ~= "home" then
			JumpTools.OpenPageByJump("/showServantView", {
				state = "onlydetail",
				id = var_37_0
			})
		else
			ShowPopItemOnly(arg_37_0, var_37_2, arg_37_2)
		end
	elseif var_37_1 == ItemConst.ITEM_TYPE.DORM_FURNITURE then
		JumpTools.OpenPageByJump("dormItemPopView", {
			id = var_37_0
		})
	else
		ShowPopItemOnly(arg_37_0, var_37_2, arg_37_2)
	end
end

function ShowPopItemOnly(arg_38_0, arg_38_1, arg_38_2)
	arg_38_1 = cfgToItemTemplate(arg_38_1)

	if arg_38_0 == POP_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	elseif arg_38_0 == POP_SOURCE_ITEM then
		JumpTools.OpenPageByJump("popSourceItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	elseif arg_38_0 == POP_OPERATE_ITEM then
		JumpTools.OpenPageByJump("popOperateItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	elseif arg_38_0 == POP_MERGE_ITEM then
		JumpTools.OpenPageByJump("popMergeItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	elseif arg_38_0 == POP_SOURCE_DES_ITEM then
		JumpTools.OpenPageByJump("popSourceDesItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	elseif arg_38_0 == POP_OTHER_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_38_1,
			extraInfo = arg_38_2
		})
	end
end

function ShowPopItemSource(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0

	if arg_39_2 then
		for iter_39_0, iter_39_1 in ipairs(EquipCfg.get_id_list_by_suit[arg_39_2]) do
			if EquipCfg[iter_39_1].starlevel == 5 then
				arg_39_0 = iter_39_1

				break
			end
		end
	end

	local var_39_1 = EquipStruct.New(0, arg_39_0)

	JumpTools.OpenPageByJump("popEquipSourceView", {
		popItemInfo = {
			id = arg_39_0
		},
		equip_info = var_39_1,
		suitID = arg_39_2
	})
end

function ShowPopEquipSuit(arg_40_0, arg_40_1)
	JumpTools.OpenPageByJump("popEquipSuitView", {
		suitId = arg_40_0,
		hideBtn = arg_40_1
	})
end

function saveData(arg_41_0, arg_41_1, arg_41_2)
	GameLocalData:SaveToTargetModule(arg_41_0, arg_41_1, arg_41_2)
end

function getData(arg_42_0, arg_42_1)
	return GameLocalData:GetValueFromTargetModule(arg_42_0, arg_42_1)
end

function saveModule(arg_43_0, arg_43_1)
	local var_43_0 = GameLocalData:GetTargetModule(arg_43_0)

	for iter_43_0, iter_43_1 in pairs(arg_43_1) do
		var_43_0[iter_43_0] = iter_43_1
	end

	GameLocalData:SaveTargetModule(arg_43_0, var_43_0)
end

function getModule(arg_44_0)
	return GameLocalData:GetTargetModule(arg_44_0)
end

function getCommonData(arg_45_0, arg_45_1)
	return GameLocalData:GetValueFromCommonModule(arg_45_0, arg_45_1)
end

function cleanProtoTable(arg_46_0, arg_46_1)
	local var_46_0 = {}

	if arg_46_0 then
		for iter_46_0, iter_46_1 in ipairs(arg_46_0) do
			if arg_46_1 and type(arg_46_1) == "table" then
				var_46_0[iter_46_0] = {}

				for iter_46_2, iter_46_3 in ipairs(arg_46_1) do
					var_46_0[iter_46_0][iter_46_3] = iter_46_1[iter_46_3]
				end
			else
				var_46_0[iter_46_0] = iter_46_1
			end
		end
	end

	return var_46_0
end

function OpenPageUntilLoaded(arg_47_0, arg_47_1, arg_47_2)
	JumpTools.OpenPageUntilLoaded(arg_47_0, arg_47_1, arg_47_2)
end

function Quit()
	manager.audio:PauseAll(true)
	NeedGameUserInfo()
	GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
	GameToSDK.UpUserInfo(PlayerTools.PackUserData("ExitGame"))
	pcall(debugger.Stop)
	LuaHelper.Quit()
	SendMessageManagerToSDK("role_logout")
end

function OnApplicationQuit(arg_49_0)
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

function OnApplicationFocus(arg_50_0)
	OnAppFocusPauseStateChange(arg_50_0, var_0_6)
end

function OnApplicationPause(arg_51_0)
	OnAppFocusPauseStateChange(var_0_5, arg_51_0)
end

function OnAppFocusPauseStateChange(arg_52_0, arg_52_1)
	local var_52_0 = var_0_5
	local var_52_1 = var_0_6

	var_0_5 = arg_52_0
	var_0_6 = arg_52_1

	if (var_52_1 == false and arg_52_1 == true or var_52_0 == true and arg_52_0 == false) and var_52_1 == false and arg_52_1 == true then
		GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
		FatigueReminder()
		DailyFatigueReminder()
		CatExploreReminder()
		CanteenDispatchReminder()
		CanteenFullReminder()
	end

	if var_52_1 == true and arg_52_1 == false then
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
		manager.notify:Invoke(GAME_FOCUS_CHANGE, arg_52_0, arg_52_1)
	end
end

function CanteenFullReminder()
	if manager == nil then
		return
	end

	local var_53_0 = SettingData:GetRemindSettingData()

	if var_53_0 ~= nil and (var_53_0.canteen_full_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_FULL)
	end
end

function CanteenDispatchReminder()
	if manager == nil then
		return
	end

	local var_54_0 = SettingData:GetRemindSettingData()

	if var_54_0 ~= nil and (var_54_0.canteen_dispatch_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_DISPATCH)
	end
end

function CatExploreReminder()
	if manager == nil then
		return
	end

	local var_55_0 = SettingData:GetRemindSettingData()

	if var_55_0 ~= nil and (var_55_0.cat_explore_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CAT_EXPLORE)
	end
end

function DailyFatigueReminder()
	if manager == nil then
		return
	end

	local var_56_0 = SettingData:GetRemindSettingData()

	if var_56_0 ~= nil and (var_56_0.daily_fatigue_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.DAILYFATIGUE)
	end
end

function FatigueReminder()
	if manager == nil then
		return
	end

	local var_57_0 = SettingData:GetRemindSettingData()

	if var_57_0 ~= nil then
		local var_57_1 = var_57_0.fatigue_full_reminder or 0
		local var_57_2 = CurrencyData:GetFatigueCallFlag()

		if var_57_1 == 1 and var_57_2 == 1 then
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

function RefreshUI(arg_63_0)
	if arg_63_0 then
		gameContext:SetSystemLayer(arg_63_0)
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

function StatUILoadTimeToServer(arg_65_0)
	return
end

function LuaGcCollect()
	collectgarbage("collect")
end

function SpliceI18NText(arg_67_0)
	local var_67_0 = #arg_67_0

	if var_67_0 < 2 then
		return arg_67_0
	end

	local var_67_1 = arg_67_0[1]
	local var_67_2 = ""

	if SettingData:GetCurrentLanguage() == "en" then
		var_67_2 = " "
	end

	for iter_67_0 = 2, var_67_0 do
		var_67_1 = string.format("%s%s%s", var_67_1, var_67_2, arg_67_0[iter_67_0])
	end

	return var_67_1
end

function GetI18NText(arg_68_0)
	local var_68_0 = I18NRuntimeManager.Instance:GetI18NText(arg_68_0)

	if var_68_0 then
		return var_68_0
	end

	return arg_68_0
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

function GetTranslateCfg(arg_69_0)
	for iter_69_0, iter_69_1 in ipairs(var_0_7) do
		if iter_69_1 and iter_69_1[arg_69_0] then
			return iter_69_1[arg_69_0]
		end
	end

	return nil
end

function GetAllTranslateCfg()
	local var_70_0 = {}

	print("GetAllTranslateCfg")

	for iter_70_0, iter_70_1 in ipairs(var_0_7) do
		if iter_70_1 then
			for iter_70_2, iter_70_3 in pairs(iter_70_1) do
				local var_70_1 = TranslateData.New()

				var_70_1.zh_cn = iter_70_2
				var_70_1.en = iter_70_3.translate_en
				var_70_1.jp = iter_70_3.translate_jp
				var_70_1.kr = iter_70_3.translate_kr
				var_70_1.tc = iter_70_3.translate_tc
				var_70_0[iter_70_2] = var_70_1
			end
		end
	end

	return var_70_0
end

function OpenDownLoadPage(arg_71_0, arg_71_1)
	if gameContext:IsOpenRoute("downLoadPage") then
		return
	end

	JumpTools.OpenPageByJump("downLoadPage", {
		title = arg_71_0,
		abbr = arg_71_1
	})
end

function SetDownLoadPageProgress(arg_72_0, arg_72_1)
	if not gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.OpenPageByJump("downLoadPage")
	end

	local var_72_0 = gameContext:GetOpenPageHandler(routeName)

	if var_72_0 then
		var_72_0:SetProgress(arg_72_0, arg_72_1)
	end
end

function CloseDownLoadPage()
	if gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.Back()
	end
end

function EncodeURL(arg_74_0)
	arg_74_0 = string.gsub(arg_74_0, "([^%w%p ])", function(arg_75_0)
		return string.format("%%%02X", string.byte(arg_75_0))
	end)

	return arg_74_0
end

function OnHomeVoiceStart(arg_76_0, arg_76_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_START, arg_76_0, arg_76_1)
end

function OnHomeVoiceStop(arg_77_0, arg_77_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_STOP, arg_77_0, arg_77_1)
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
		local var_81_0 = gameContext:GetLastOpenPage()

		if var_81_0 == "home" then
			ShowQuitConfirm()

			return
		end

		local var_81_1 = gameContext:GetOpenPageHandler(var_81_0)

		if var_81_1 and var_81_1.OnExitInput and var_81_1:OnExitInput() then
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
