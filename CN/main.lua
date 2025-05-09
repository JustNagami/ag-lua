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
	if GameToSDK.IsEditorOrPcPlatform() then
		print("pc disable srp batching")

		UnityEngine.Rendering.GraphicsSettings.useScriptableRenderPipelineBatching = false
	else
		print("enabled srp batching")

		UnityEngine.Rendering.GraphicsSettings.useScriptableRenderPipelineBatching = true
	end

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

	return PlayGameBGMID(var_11_0)
end

function PlayGameBGMID(arg_12_0)
	if arg_12_0 == nil or arg_12_0 == 0 then
		return nil
	end

	local var_12_0 = MusicRecordCfg[arg_12_0]

	if not var_12_0 then
		return nil
	end

	local var_12_1 = MusicData:GetAisacSet(arg_12_0)

	for iter_12_0, iter_12_1 in pairs(var_12_1) do
		AudioManager.Instance:SetAisacControlOfCategory("music", iter_12_0, iter_12_1)
	end

	manager.audio:PlayBGM(var_12_0.cuesheet, var_12_0.cueName, var_12_0.awbName)

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
	ChapterResidentTools.InitRedPoint()

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

	if GameLocalData:GetValueFromCommonModule("LoginConceptGuideData", "watched") then
		gameContext:Go("/login", {
			isAutoLogin = arg_27_0
		})
	else
		gameContext:Go("/loginConceptGuild", {
			isAutoLogin = arg_27_0
		})
		GameLocalData:SaveToCommonModule("LoginConceptGuideData", "watched", true)
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

function SetHIDButtonEnabled(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.transform:Find("BindingNotice")

	if var_29_0 == nil then
		var_29_0 = P08.Gamepad.HIDInputPage.AddBindingNoticeGo(arg_29_0)

		SetActive(var_29_0.gameObject, false)
	end

	local var_29_1 = var_29_0:GetComponent("ControllerExCollection")

	if var_29_1 == nil then
		return
	end

	local var_29_2 = var_29_1:GetController("enabled")

	if var_29_2 == nil then
		return
	end

	var_29_2:SetSelectedState(tostring(arg_29_1))
end

function isSuccess(arg_30_0)
	return arg_30_0 == TipsCfg.get_id_list_by_define.SUCCESS
end

function ShowQuanquan(arg_31_0)
	manager.loadui:ShowLoad(arg_31_0)
end

function SetForceShowQuanquan(arg_32_0)
	manager.loadui:ForceShowLoad(arg_32_0)
end

function RegistChangeSceneClearHandler(arg_33_0)
	if not ChangeSceneClearHandlerList then
		ChangeSceneClearHandlerList = {}

		function SceneForLua.clearLuaMemoryHandler()
			pcall(function()
				for iter_35_0, iter_35_1 in ipairs(ChangeSceneClearHandlerList) do
					iter_35_1()
				end
			end)
		end
	end

	table.insert(ChangeSceneClearHandlerList, arg_33_0)
end

function ShowMessageBox(arg_36_0)
	if LuaExchangeHelper.GetSceneIsHanding() then
		local var_36_0
		local var_36_1 = FrameTimer.New(function()
			if LuaExchangeHelper.GetSceneIsHanding() then
				return
			end

			var_36_0:Stop()
			CheckManagers()
			manager.messageBox:ShowMessage(arg_36_0)
		end, 1, -1)

		var_36_0 = var_36_1

		var_36_1:Start()
	else
		manager.messageBox:ShowMessage(arg_36_0)
	end
end

function cfgToItemTemplate(arg_38_0)
	if arg_38_0 and arg_38_0[1] then
		local var_38_0 = clone(ItemTemplateData)

		var_38_0.id = arg_38_0[1]
		var_38_0.number = arg_38_0[2]
		var_38_0.timeValid = arg_38_0[4]

		return var_38_0
	end

	return arg_38_0
end

function ShowPopItem(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_1 = cfgToItemTemplate(arg_39_1)

	local var_39_0 = arg_39_1.id
	local var_39_1 = ItemCfg[var_39_0].type
	local var_39_2 = deepClone(arg_39_1)

	var_39_2.grayFlag = false

	if var_39_1 == ItemConst.ITEM_TYPE.EQUIP then
		local var_39_3 = arg_39_2 and arg_39_2.page or 1
		local var_39_4 = var_39_2.equip_id and var_39_2.equip_id ~= 0 and var_39_2.equip_id or nil

		JumpTools.OpenPageByJump("/equipCultureView", {
			equipId = var_39_4,
			prefabId = var_39_0,
			pageIndex = var_39_3
		})
	elseif var_39_1 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		if whereami == "battleResult" then
			JumpTools.OpenPageByJump("showServantView", {
				state = "onlydetail",
				id = var_39_0,
				gameContext:SetSystemLayer("battleResult")
			})
		elseif whereami ~= "home" then
			JumpTools.OpenPageByJump("/showServantView", {
				state = "onlydetail",
				id = var_39_0
			})
		else
			ShowPopItemOnly(arg_39_0, var_39_2, arg_39_2)
		end
	elseif var_39_1 == ItemConst.ITEM_TYPE.DORM_FURNITURE then
		JumpTools.OpenPageByJump("dormItemPopView", {
			id = var_39_0
		})
	else
		ShowPopItemOnly(arg_39_0, var_39_2, arg_39_2)
	end
end

function ShowPopItemOnly(arg_40_0, arg_40_1, arg_40_2)
	arg_40_1 = cfgToItemTemplate(arg_40_1)

	if arg_40_0 == POP_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	elseif arg_40_0 == POP_SOURCE_ITEM then
		JumpTools.OpenPageByJump("popSourceItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	elseif arg_40_0 == POP_OPERATE_ITEM then
		JumpTools.OpenPageByJump("popOperateItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	elseif arg_40_0 == POP_MERGE_ITEM then
		JumpTools.OpenPageByJump("popMergeItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	elseif arg_40_0 == POP_SOURCE_DES_ITEM then
		JumpTools.OpenPageByJump("popSourceDesItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	elseif arg_40_0 == POP_OTHER_ITEM then
		JumpTools.OpenPageByJump("popItem", {
			popItemInfo = arg_40_1,
			extraInfo = arg_40_2
		})
	end
end

function ShowPopItemSource(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0

	if arg_41_2 then
		for iter_41_0, iter_41_1 in ipairs(EquipCfg.get_id_list_by_suit[arg_41_2]) do
			if EquipCfg[iter_41_1].starlevel == 5 then
				arg_41_0 = iter_41_1

				break
			end
		end
	end

	local var_41_1 = EquipStruct.New(0, arg_41_0)

	JumpTools.OpenPageByJump("popEquipSourceView", {
		popItemInfo = {
			id = arg_41_0
		},
		equip_info = var_41_1,
		suitID = arg_41_2
	})
end

function ShowPopEquipSuit(arg_42_0, arg_42_1)
	JumpTools.OpenPageByJump("popEquipSuitView", {
		suitId = arg_42_0,
		hideBtn = arg_42_1
	})
end

function saveData(arg_43_0, arg_43_1, arg_43_2)
	GameLocalData:SaveToTargetModule(arg_43_0, arg_43_1, arg_43_2)
end

function getData(arg_44_0, arg_44_1)
	return GameLocalData:GetValueFromTargetModule(arg_44_0, arg_44_1)
end

function saveModule(arg_45_0, arg_45_1)
	local var_45_0 = GameLocalData:GetTargetModule(arg_45_0)

	for iter_45_0, iter_45_1 in pairs(arg_45_1) do
		var_45_0[iter_45_0] = iter_45_1
	end

	GameLocalData:SaveTargetModule(arg_45_0, var_45_0)
end

function getModule(arg_46_0)
	return GameLocalData:GetTargetModule(arg_46_0)
end

function getCommonData(arg_47_0, arg_47_1)
	return GameLocalData:GetValueFromCommonModule(arg_47_0, arg_47_1)
end

function cleanProtoTable(arg_48_0, arg_48_1)
	local var_48_0 = {}

	if arg_48_0 then
		for iter_48_0, iter_48_1 in ipairs(arg_48_0) do
			if arg_48_1 and type(arg_48_1) == "table" then
				var_48_0[iter_48_0] = {}

				for iter_48_2, iter_48_3 in ipairs(arg_48_1) do
					var_48_0[iter_48_0][iter_48_3] = iter_48_1[iter_48_3]
				end
			else
				var_48_0[iter_48_0] = iter_48_1
			end
		end
	end

	return var_48_0
end

function OpenPageUntilLoaded(arg_49_0, arg_49_1, arg_49_2)
	JumpTools.OpenPageUntilLoaded(arg_49_0, arg_49_1, arg_49_2)
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

function OnApplicationQuit(arg_51_0)
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
	manager.notify:Invoke(ON_DESTROY_LUA)
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

function OnApplicationFocus(arg_52_0)
	OnAppFocusPauseStateChange(arg_52_0, var_0_6)
end

function OnApplicationPause(arg_53_0)
	OnAppFocusPauseStateChange(var_0_5, arg_53_0)
end

function OnAppFocusPauseStateChange(arg_54_0, arg_54_1)
	local var_54_0 = var_0_5
	local var_54_1 = var_0_6

	var_0_5 = arg_54_0
	var_0_6 = arg_54_1

	if (var_54_1 == false and arg_54_1 == true or var_54_0 == true and arg_54_0 == false) and var_54_1 == false and arg_54_1 == true then
		GameToSDK.UpUserEvent("{\"eventType\" : \"End\"}")
		FatigueReminder()
		DailyFatigueReminder()
		CatExploreReminder()
		CanteenDispatchReminder()
		CanteenFullReminder()
	end

	if var_54_1 == true and arg_54_1 == false then
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
		manager.notify:Invoke(GAME_FOCUS_CHANGE, arg_54_0, arg_54_1)
	end
end

function CanteenFullReminder()
	if manager == nil then
		return
	end

	local var_55_0 = SettingData:GetRemindSettingData()

	if var_55_0 ~= nil and (var_55_0.canteen_full_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_FULL)
	end
end

function CanteenDispatchReminder()
	if manager == nil then
		return
	end

	local var_56_0 = SettingData:GetRemindSettingData()

	if var_56_0 ~= nil and (var_56_0.canteen_dispatch_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CANTEEN_DISPATCH)
	end
end

function CatExploreReminder()
	if manager == nil then
		return
	end

	local var_57_0 = SettingData:GetRemindSettingData()

	if var_57_0 ~= nil and (var_57_0.cat_explore_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.CAT_EXPLORE)
	end
end

function DailyFatigueReminder()
	if manager == nil then
		return
	end

	local var_58_0 = SettingData:GetRemindSettingData()

	if var_58_0 ~= nil and (var_58_0.daily_fatigue_reminder or 0) == 1 then
		TimerReminderData:SetReminder(TimerReminderConst.DAILYFATIGUE)
	end
end

function FatigueReminder()
	if manager == nil then
		return
	end

	local var_59_0 = SettingData:GetRemindSettingData()

	if var_59_0 ~= nil then
		local var_59_1 = var_59_0.fatigue_full_reminder or 0
		local var_59_2 = CurrencyData:GetFatigueCallFlag()

		if var_59_1 == 1 and var_59_2 == 1 then
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

function RefreshUI(arg_65_0)
	if arg_65_0 then
		gameContext:SetSystemLayer(arg_65_0)
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
	manager.notify:Invoke(ON_DESTROY_LUA)
	manager.destroy()
end

function StatUILoadTimeToServer(arg_67_0)
	return
end

function LuaGcCollect()
	collectgarbage("collect")
end

function SpliceI18NText(arg_69_0)
	local var_69_0 = #arg_69_0

	if var_69_0 < 2 then
		return arg_69_0
	end

	local var_69_1 = arg_69_0[1]
	local var_69_2 = ""

	if SettingData:GetCurrentLanguage() == "en" then
		var_69_2 = " "
	end

	for iter_69_0 = 2, var_69_0 do
		var_69_1 = string.format("%s%s%s", var_69_1, var_69_2, arg_69_0[iter_69_0])
	end

	return var_69_1
end

function GetI18NText(arg_70_0)
	local var_70_0 = I18NRuntimeManager.Instance:GetI18NText(arg_70_0)

	if var_70_0 then
		return var_70_0
	end

	return arg_70_0
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

function GetTranslateCfg(arg_71_0)
	for iter_71_0, iter_71_1 in ipairs(var_0_7) do
		if iter_71_1 and iter_71_1[arg_71_0] then
			return iter_71_1[arg_71_0]
		end
	end

	return nil
end

function GetAllTranslateCfg()
	local var_72_0 = {}

	print("GetAllTranslateCfg")

	for iter_72_0, iter_72_1 in ipairs(var_0_7) do
		if iter_72_1 then
			for iter_72_2, iter_72_3 in pairs(iter_72_1) do
				local var_72_1 = TranslateData.New()

				var_72_1.zh_cn = iter_72_2
				var_72_1.en = iter_72_3.translate_en
				var_72_1.jp = iter_72_3.translate_jp
				var_72_1.kr = iter_72_3.translate_kr
				var_72_1.tc = iter_72_3.translate_tc
				var_72_0[iter_72_2] = var_72_1
			end
		end
	end

	return var_72_0
end

function OpenDownLoadPage(arg_73_0, arg_73_1, arg_73_2)
	if gameContext:IsOpenRoute("downLoadPage") then
		return
	end

	JumpTools.OpenPageByJump("downLoadPage", {
		title = arg_73_0,
		abbr = arg_73_1,
		needSetParent = arg_73_2
	})
end

function SetDownLoadPageProgress(arg_74_0, arg_74_1)
	if not gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.OpenPageByJump("downLoadPage")
	end

	local var_74_0 = gameContext:GetOpenPageHandler(routeName)

	if var_74_0 then
		var_74_0:SetProgress(arg_74_0, arg_74_1)
	end
end

function CloseDownLoadPage()
	if gameContext:IsOpenRoute("downLoadPage") then
		JumpTools.Back()
	end
end

function EncodeURL(arg_76_0)
	arg_76_0 = string.gsub(arg_76_0, "([^%w%p ])", function(arg_77_0)
		return string.format("%%%02X", string.byte(arg_77_0))
	end)

	return arg_76_0
end

function OnHomeVoiceStart(arg_78_0, arg_78_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_START, arg_78_0, arg_78_1)
end

function OnHomeVoiceStop(arg_79_0, arg_79_1)
	manager.notify:CallUpdateFunc(HOME_WORD_DISPLAY_STOP, arg_79_0, arg_79_1)
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
		local var_83_0 = gameContext:GetLastOpenPage()

		if var_83_0 == "home" then
			ShowQuitConfirm()

			return
		end

		local var_83_1 = gameContext:GetOpenPageHandler(var_83_0)

		if var_83_1 and var_83_1.OnExitInput and var_83_1:OnExitInput() then
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
