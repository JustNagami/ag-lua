local var_0_0 = class("LoginRender", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/LoginInterface/LoginInterface"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
end

local var_0_1 = false

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	local var_4_0 = GameToSDK.CURRENT_SERVER

	arg_4_0.isOverSeas_ = var_4_0 ~= nil and var_4_0 ~= "" and var_4_0 ~= "zh_cn"
	arg_4_0.myID = PlayerPrefs.GetString("AccountID")

	arg_4_0:UpdateAccount(arg_4_0.myID)

	_G.isLogining = false
	arg_4_0.serverList_ = {
		{
			port = 8102,
			text = "本地服",
			host = "127.0.0.1"
		}
	}
	arg_4_0.currentServerIndex_ = 1

	if not SDKTools.IsSDK() then
		arg_4_0.serverList_ = require("lua_exclude/innerLoginList"):GetLoginList()

		arg_4_0:AddBtnListener(arg_4_0.btn_innerServer, nil, function()
			gameContext:Go("LoginInnerServer", {
				list = arg_4_0.serverList_
			})
		end)

		arg_4_0.currentServerIndex_ = tonumber(PlayerPrefs.GetString("SelectServer")) or 1

		if not arg_4_0.serverList_[arg_4_0.currentServerIndex_] then
			arg_4_0.currentServerIndex_ = table.keys(arg_4_0.serverList_)[1]
		end

		arg_4_0:UpdateInnerServer()
	end

	arg_4_0:RefreshState()

	arg_4_0.versionName_.text = "VersionName: " .. LuaForUtil.GetResourceVersionName()
	arg_4_0.clientVersion_.text = "ClientVersion: " .. LuaForUtil.GetClientVersion()
	arg_4_0.resourceVersion_.text = "ResourceVersion: " .. LuaForUtil.GetResourceVersion()
	arg_4_0.battleVersion_.text = "BattleVersion: " .. LuaForUtil.GetBattleVersion()
	_G.bulletinInfoGetted = false

	GameToSDK.SendMessage("{\"messageType\" : \"GetAgeTip\"}")
	arg_4_0:WaitForBulletin()

	arg_4_0.criMovie_ = arg_4_0.movieGo_:GetComponent("CriManaMovieControllerForUI")
	arg_4_0.criplayer_ = arg_4_0.criMovie_.player

	local var_4_1 = manager.audio:GetEffectVolume()

	arg_4_0.criplayer_:SetVolume(var_4_1)
	print("server", GameToSDK.CURRENT_SERVER)
	print("serverList", GameToSDK.SERVER_LIST)

	local var_4_2 = GameToSDK.SERVER_LIST.Length

	SetActive(arg_4_0.selectRegion_.gameObject, var_4_2 > 1)
	arg_4_0:AddOperationListener()
	arg_4_0:AddBtnListenerScale(arg_4_0.startupBtn_, nil, handler(arg_4_0, arg_4_0.TryToLoginIn))
	arg_4_0:AddBtnListener(arg_4_0.deleteFolderBtn_, nil, function()
		if _G.isLogining then
			return
		end

		ShowMessageBox({
			isTop = true,
			title = GetTips("PROMPT"),
			content = GetTips("VERIFY_ASSETS_BEFORE_CONFIRM"),
			OkCallback = function()
				JumpTools.OpenPageByJump("repairAssetsView")
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_4_0:AddBtnListener(nil, arg_4_0.btn_exit, function()
		ShowQuitConfirm()
	end)
	arg_4_0:AddBtnListener(arg_4_0.levelBtn_, nil, function()
		manager.ui:SetUISeparateRender(false)
		SetActive(arg_4_0.ageLimitGo_, true)
	end)
	arg_4_0:AddBtnListener(arg_4_0.ageLimitOkBtn_, nil, function()
		SetActive(arg_4_0.ageLimitGo_, false)
	end)
	arg_4_0:AddBtnListener(arg_4_0.ageLimitBgBtn_, nil, function()
		SetActive(arg_4_0.ageLimitGo_, false)
	end)

	if var_4_2 > 1 then
		local var_4_3 = 0

		for iter_4_0 = 0, var_4_2 - 1 do
			if GameToSDK.CURRENT_SERVER == GameToSDK.SERVER_LIST[iter_4_0] then
				var_4_3 = iter_4_0
			end

			local var_4_4 = AreaDifferenceCfg[GameToSDK.SERVER_LIST[iter_4_0]]

			arg_4_0.selectRegion_.options:Add(UnityEngine.UI.Dropdown.OptionData.New(var_4_4.name))
		end

		arg_4_0.selectRegion_:RefreshShownValue()

		arg_4_0.selectRegion_.value = var_4_3

		arg_4_0.selectRegion_.onValueChanged:AddListener(function(arg_13_0)
			if arg_13_0 ~= var_4_3 then
				ShowMessageBox({
					content = GetTips("CHANGE_SERVER"),
					OkCallback = function()
						PlayerPrefs.SetInt("SERVER_DEFAULT_SELECT_INDEX", arg_13_0)
						Quit()
					end,
					CancelCallback = function()
						arg_4_0.selectRegion_.value = var_4_3
					end
				})
			end
		end)
	end

	arg_4_0.serverMaintainController = arg_4_0.m_controller:GetController("serverMaintain")
	arg_4_0.serverShowController = arg_4_0.m_controller:GetController("serverShow")
	arg_4_0.serverNewTagController = arg_4_0.m_controller:GetController("serverNewTag")

	arg_4_0.serverShowController:SetSelectedIndex(0)
	arg_4_0:AddBtnListener(arg_4_0.m_serverBtn, nil, function()
		JumpTools.OpenPageByJump("loginSeverSelectPop")
	end)
end

function var_0_0.AddOperationListener(arg_17_0)
	arg_17_0:AddBtnListener(arg_17_0.suggestBtn_, nil, function()
		if GameToSDK.IsPCPlatform() and not SDKTools.GetIsOverSea() then
			OperationAction.OpenOperationUrl("PC_FEEDBACK")
		else
			SendMessageToSDK("{\"messageType\" : \"StartCustomerService\"}")
		end
	end)
	arg_17_0:AddBtnListener(arg_17_0.sdkBtn_, nil, function()
		NeedGameUserInfo()
		GameToSDK.GoUserCenter()
	end)
	arg_17_0:AddBtnListener(arg_17_0.anncBtn_, nil, function()
		if _G.bulletinInfoGetted then
			arg_17_0:ShowWebView()
		end
	end)
	arg_17_0:AddBtnListener(arg_17_0.forumBtn_, nil, function()
		if _G.ChannelLoginInfo and _G.ChannelLoginInfo.channelToken then
			local var_21_0 = {
				gameAppId = _G.ChannelLoginInfo.channelAppId,
				token = _G.ChannelLoginInfo.channelToken
			}

			OperationAction.OpenOperationUrl("FORUM_URL", var_21_0)
		else
			OperationAction.OpenOperationUrl("FORUM_URL_HOME")
		end

		SDKTools.SendMessageToSDK("direction", {
			direction_type = 8,
			direction_channel = 1
		})
	end)
end

function var_0_0.OnEnter(arg_22_0)
	gameContext:SetSystemLayer("login")

	_G.isLogining = false
	arg_22_0.params_.isAutoLogin = true

	LoadingUIManager.inst:CloseLoadUI()
	Timer.New(function()
		GameToSDK.SendMessage("{\"messageType\" : \"GetBulletin\"}")
	end, 1, 1):Start()
	arg_22_0:RegistEventListener(AGE_TIP_CALLBACK, function(arg_24_0)
		print("AGE_TIP_CALLBACK")

		arg_22_0.ageLimitText_.text = arg_24_0
	end)
end

function var_0_0.OnExit(arg_25_0)
	LuaForCursor.UseSystemCursor(false)
	arg_25_0.selectRegion_.onValueChanged:RemoveAllListeners()
	arg_25_0:RemoveAllEventListener()

	var_0_1 = false
end

function var_0_0.WaitForBulletin(arg_26_0)
	print("WaitForBulletin 开始监听公告信息返回")

	if SDKTools.IsSDK() then
		print("SDK 环境")

		local var_26_0 = 0
		local var_26_1

		var_26_1 = Timer.New(function()
			var_26_0 = var_26_0 + 1

			if _G.bulletinInfoGetted or var_26_0 > 30 then
				var_26_1:Stop()
				Timer.New(function()
					arg_26_0:ShowWebView()
					arg_26_0:SDKLogin()
					arg_26_0:AddUIListener()
				end, 0.6, 1):Start()
			end
		end, 0.1, -1)

		var_26_1:Start()
	end
end

function var_0_0.AddUIListener(arg_29_0)
	arg_29_0:AddBtnListener(arg_29_0.imageBtn_, nil, function()
		if _G.SELECT_REGION_SEVER_ID == nil then
			arg_29_0:QueryRegionSeverInfo()

			return
		end

		if not EvokeGateWayLogin(_G.SELECT_REGION_SEVER_ID) then
			arg_29_0:SDKLogin()
		end
	end)
end

function var_0_0.SDKLogin(arg_31_0)
	if _G.isLogining or _G.clickCDing_ then
		return
	end

	_G.clickCDing_ = true

	Debug.Log("唤起SDK登录")
	GameToSDK.Login("{}")
	SendMessageManagerToSDK("SDKLogin")
	TimeTools.StartAfterSeconds(5, function()
		_G.clickCDing_ = false
	end, {})
	LuaForCursor.UseSystemCursor(true)
end

function var_0_0.QueryRegionSeverInfo(arg_33_0)
	if var_0_1 then
		print("RegionServerLog QueryRegionSeverInfo fail by repeat")

		return
	end

	var_0_1 = true

	print("RegionServerLog QueryRegionSeverInfo start")
	RegionServerMgr.instance:UpdateRegionServerInfo(_G.TMP_ACCOUNT_ID or "", function(arg_34_0, arg_34_1)
		var_0_1 = false

		if arg_34_0 then
			print("RegionServerLog QueryRegionSeverInfo success")

			if isNil(arg_33_0.gameObject_) then
				return
			end

			arg_33_0:UpdateRegionServer()
		else
			print("RegionServerLog QueryRegionSeverInfo fail")
			ShowTips(arg_34_1)
		end
	end)
end

function var_0_0.UpdateRegionServer(arg_35_0)
	local var_35_0 = RegionServerMgr.instance:GetRegionServerInfoList()
	local var_35_1 = var_35_0.Count

	if var_35_1 == 0 then
		arg_35_0.serverShowController:SetSelectedIndex(0)
		Debug.LogError("RegionServerLog server list count = 0")

		return
	end

	if _G.SELECT_REGION_SEVER_ID and isNil(RegionServerMgr.instance:GetRegionServerInfo(_G.SELECT_REGION_SEVER_ID)) then
		_G.SELECT_REGION_SEVER_ID = nil
	end

	if var_35_1 == 1 then
		_G.SELECT_REGION_SEVER_ID = var_35_0[0].serverId

		arg_35_0.serverShowController:SetSelectedIndex(0)
	else
		if GetSDKLoginInfo() == nil then
			arg_35_0.serverShowController:SetSelectedIndex(0)
		else
			arg_35_0.serverShowController:SetSelectedIndex(1)
		end

		if _G.SELECT_REGION_SEVER_ID == nil then
			local var_35_2 = PlayerPrefs.GetString("RegionServerId", "")

			if var_35_2 == "" or isNil(RegionServerMgr.instance:GetRegionServerInfo(var_35_2)) then
				local var_35_3
				local var_35_4
				local var_35_5 = RegionServerMgr.instance:GetRegionServerInfoList()
				local var_35_6 = var_35_5.Count

				for iter_35_0 = 0, var_35_6 - 1 do
					local var_35_7 = var_35_5[iter_35_0]
					local var_35_8 = var_35_7.serverId
					local var_35_9 = var_35_7.newServerFlag

					if var_35_7.gameUserInfoList.Count > 0 then
						var_35_4 = var_35_8
					end

					if var_35_9 == 1 then
						var_35_3 = var_35_8
					end
				end

				if var_35_4 ~= nil then
					_G.SELECT_REGION_SEVER_ID = var_35_4
				elseif var_35_3 ~= nil then
					_G.SELECT_REGION_SEVER_ID = var_35_3
				else
					_G.SELECT_REGION_SEVER_ID = var_35_5[0].serverId
				end
			else
				_G.SELECT_REGION_SEVER_ID = var_35_2
			end
		end
	end

	local var_35_10 = RegionServerMgr.instance:GetRegionServerInfo(_G.SELECT_REGION_SEVER_ID)

	arg_35_0.m_serverName.text = var_35_10 and var_35_10.serverName or "null"

	if var_35_10 and not var_35_10.maintain then
		arg_35_0.serverMaintainController:SetSelectedIndex(0)
	else
		arg_35_0.serverMaintainController:SetSelectedIndex(1)
	end

	if var_35_10 and var_35_10.newServerFlag ~= 1 then
		arg_35_0.serverNewTagController:SetSelectedIndex(0)
	else
		arg_35_0.serverNewTagController:SetSelectedIndex(1)
	end
end

function var_0_0.ShowWebView(arg_36_0)
	return
end

function var_0_0.RefreshState(arg_37_0)
	local var_37_0 = GameToSDK.CURRENT_SDK_ID == SDK_PLATFORM.DEV

	SetActive(arg_37_0.btn_server_, var_37_0)
	SetActive(arg_37_0.btn_account_, var_37_0)
	SetActive(arg_37_0.btn_start_, var_37_0)

	local var_37_1 = GameToSDK.CURRENT_SDK_ID == SDK_PLATFORM.DEV or _G.CHANNEL_MASTER_ID == 1 or _G.CHANNEL_MASTER_ID == 0

	if arg_37_0.isOverSeas_ then
		SetActive(arg_37_0.levelBtn_.gameObject, false)
		SetActive(arg_37_0.forumGo_, true)

		if SDKTools.GetIsThisServer({
			"tw",
			"jp",
			"en"
		}) then
			SetActive(arg_37_0.forumGo_, false)
		end

		if SDKTools.GetIsThisServer({
			"tw"
		}) then
			-- block empty
		end
	else
		SetActive(arg_37_0.levelBtn_.gameObject, true)
		SetActive(arg_37_0.suggestGo_, var_37_1)
		SetActive(arg_37_0.sdkGo_, var_37_1)
		SetActive(arg_37_0.forumGo_, var_37_1)
	end
end

function var_0_0.TryToLoginIn(arg_38_0)
	local var_38_0 = tostring(arg_38_0:GetAccount())

	if string.len(var_38_0) < 1 then
		ShowTips("IF_ACCOUNT_NIL")

		return
	end

	GATEWAY_ADDR = arg_38_0.serverList_[arg_38_0.currentServerIndex_].ip
	GATEWAY_PORT = arg_38_0.serverList_[arg_38_0.currentServerIndex_].port

	PlayerPrefs.SetString("SelectServer", arg_38_0.currentServerIndex_)
	PlayerPrefs.SetString("AccountID", arg_38_0:GetAccount())
	CheckVersion(function()
		manager.net.gateWayConnection_.netStatus = "none"

		LoginAction.GateWayLogin(arg_38_0:GetAccount(), arg_38_0:GetPassword())
	end)
end

function var_0_0.PlayOut(arg_40_0)
	manager.audio:StopEffect()
	manager.messageBox:HideAll()
	arg_40_0:CheckDefaultSetting()
end

function var_0_0.SetSDKId(arg_41_0)
	if arg_41_0.isOverSeas_ and _G.TMP_ACCOUNT_ID then
		arg_41_0.sdkIdText_.text = "SDKID:" .. _G.TMP_ACCOUNT_ID
	end

	LuaForCursor.UseSystemCursor(false)
	print("RegionServerLog query info")
	arg_41_0:QueryRegionSeverInfo()
end

function var_0_0.CheckDefaultSetting(arg_42_0)
	PlayerTools.UpdateRandomDataAfterLogin(HomeSceneSettingConst.RANDOM_MODE.EACH_LOGIN)

	if SettingData:NewDevice() then
		arg_42_0:Go("/graphicRecommend", {
			callback = handler(arg_42_0, arg_42_0.OnGraphicQualitySelect)
		})
	else
		arg_42_0:AwakeName()
	end
end

function var_0_0.OnGraphicQualitySelect(arg_43_0, arg_43_1, arg_43_2)
	SettingData:SetQualitied()
	SettingAction.ChangePicSetting("picOptionId", arg_43_2)
	arg_43_0:AwakeName()
end

function var_0_0.AwakeName(arg_44_0)
	if PlayerData:GetPlayerInfo().is_changed_nick < 1 then
		arg_44_0:Go("/awakeName")
	else
		CheckNewGuide()
		manager.uiTime:StartUITimer()
	end
end

function var_0_0.UpdateAccount(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0.txtAccount_.text = arg_45_1
	arg_45_0.pwd_ = arg_45_2
end

function var_0_0.GetAccount(arg_46_0)
	return arg_46_0.txtAccount_.text
end

function var_0_0.GetPassword(arg_47_0)
	return arg_47_0.pwd_ or PlayerPrefs.GetString("UserPwd")
end

function var_0_0.UpdateInnerServer(arg_48_0)
	local var_48_0 = arg_48_0.serverList_[arg_48_0.currentServerIndex_]

	arg_48_0.m_innerServerLab.text = var_48_0 and var_48_0.name
end

function var_0_0.Cacheable(arg_49_0)
	return false
end

function var_0_0.Dispose(arg_50_0)
	arg_50_0:RemoveAllListeners()

	var_0_1 = false

	var_0_0.super.Dispose(arg_50_0)
end

function var_0_0.OnExitInput(arg_51_0)
	if GameToSDK.IsSDKUIShowing() then
		return false
	end

	ShowQuitConfirm()

	return true
end

function var_0_0.OnLoginSeverUpdate(arg_52_0)
	arg_52_0:UpdateRegionServer()
end

return var_0_0
