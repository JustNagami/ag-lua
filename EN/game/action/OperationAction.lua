local var_0_0 = {}

manager.net:Bind(40021, function(arg_1_0)
	OperationData:InitOperationOpenList(arg_1_0)
end)
manager.net:Bind(40031, function(arg_2_0)
	OperationData:SetFunctionStopIdList(arg_2_0.id_list)
end)
manager.net:Bind(40033, function(arg_3_0)
	OperationData:InitFollowOpenList(arg_3_0)
end)

function var_0_0.GetCurServerTimestampAndSign(arg_4_0)
	manager.net:SendWithLoadingNew(10700, {}, 10701, function(arg_5_0)
		_G.SERVER_TIMESTAMP = arg_5_0.timestamp
		_G.SERVER_TIMESTAMP_SIGN = arg_5_0.timestamp_sign

		if arg_4_0 then
			arg_4_0()
		end
	end)
end

function var_0_0.UpdateUrlContext(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	local var_6_0 = {
		key = arg_6_0,
		params = arg_6_2 or {},
		url = arg_6_1 or var_0_0.GetOperationUrl(arg_6_0),
		urlOpenWay = arg_6_3 or var_0_0.InitUrlOpenWay(arg_6_0)
	}

	if arg_6_4 == nil then
		var_6_0.screenOrientation = OperationConst.SCREEN_ORIENTATION.FREE
	else
		var_6_0.screenOrientation = arg_6_4
	end

	if arg_6_5 == nil then
		var_6_0.isNeedCloseBtn = true
	else
		var_6_0.isNeedCloseBtn = arg_6_5
	end

	var_0_0.curUrlContext = var_6_0
end

function var_0_0.OpenOperationUrl(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	var_0_0.UpdateUrlContext(arg_7_0, nil, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	var_0_0.PrepareToOpenUrl()
end

function var_0_0.OpenOperationUrlDirectly(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	var_0_0.UpdateUrlContext(nil, arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	var_0_0.PrepareToOpenUrl()
end

function var_0_0.PrepareToOpenUrl()
	if not var_0_0.curUrlContext.url then
		return
	end

	var_0_0.GetCurServerTimestampAndSign(function()
		local var_10_0 = var_0_0.ParseUrl(var_0_0.curUrlContext.url, var_0_0.curUrlContext.params, var_0_0.curUrlContext.key)

		var_0_0.OpenUrl(var_10_0, var_0_0.curUrlContext.urlOpenWay, var_0_0.curUrlContext.screenOrientation, var_0_0.curUrlContext.isNeedCloseBtn)
	end)
end

function var_0_0.GetOperationUrl(arg_11_0)
	local var_11_0 = GameToSDK.clientInfo.configS

	if not var_11_0 then
		Debug.LogError("error GameToSDK.clientInfo empty configS")

		return nil
	end

	if not var_11_0:ContainsKey(arg_11_0) then
		Debug.LogError("error GameToSDK.clientInfo empty configS by key : " .. arg_11_0)

		return nil
	end

	return var_11_0:get_Item(arg_11_0)
end

function var_0_0.InitUrlOpenWay(arg_12_0)
	local var_12_0

	if not arg_12_0 or GameToSDK.IsEditorOrPcPlatform() then
		var_12_0 = OperationConst.URL_OPEN_WAY.NORMAL
	elseif GameToSDK.PLATFORM_ID == 1 and (arg_12_0 == "FORUM_URL" or arg_12_0 == "PC_SHOP" or arg_12_0 == "FORUM_URL_HOME" or arg_12_0 == "FORUM_URL_HERO" or arg_12_0 == "OFFICIAL_SUGGEST_URL") then
		var_12_0 = OperationConst.URL_OPEN_WAY.NORMAL
	else
		var_12_0 = OperationConst.URL_OPEN_WAY.INTERNAL
	end

	return var_12_0
end

function var_0_0.OpenUrl(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	print(string.format("OpenUrl, url: %s, openWay : %s, screenOrientation: %s, isNeedCloseBtn: %s", arg_13_0, arg_13_1, arg_13_2, arg_13_3))

	if arg_13_1 == OperationConst.URL_OPEN_WAY.NORMAL then
		var_0_0.OpenNormalUrl(arg_13_0)
	elseif arg_13_1 == OperationConst.URL_OPEN_WAY.INTERNAL then
		var_0_0.OpenInternalUrl(arg_13_0, arg_13_2, arg_13_3)
	end
end

function var_0_0.OpenNormalUrl(arg_14_0)
	if GameToSDK.PLATFORM_ID == 1 then
		LuaForUtil.LinkThirdApp(arg_14_0)
	else
		Application.OpenURL(arg_14_0)
	end
end

function var_0_0.OpenInternalUrl(arg_15_0, arg_15_1, arg_15_2)
	if arg_15_1 == nil then
		arg_15_1 = OperationConst.SCREEN_ORIENTATION.FREE
	end

	if arg_15_2 == nil then
		arg_15_2 = true
	end

	FrameTimer.New(function()
		LuaForUtil.OpenWebView(arg_15_0, arg_15_2, function()
			print("--->> open webView to portrait")
		end, function()
			print("====>>> close webView recover")
		end, arg_15_1)
	end, 6, 1):Start()
end

function var_0_0.ParseUrl(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0

	if var_0_0.ContainsParamHolder(arg_19_0, arg_19_1) then
		var_19_0 = var_0_0.ReplaceUrlParamHolders(arg_19_0, arg_19_1)
	else
		var_19_0 = var_0_0.ParseUrlParams(arg_19_0, arg_19_1, arg_19_2)
	end

	return (EncodeURL(var_19_0))
end

function var_0_0.ContainsParamHolder(arg_20_0)
	return string.find(arg_20_0, "{(.-)}") ~= nil
end

function var_0_0.ReplaceUrlParamHolders(arg_21_0, arg_21_1)
	return arg_21_0:gsub("{(.-)}", function(arg_22_0)
		if OperationConst.URL_PARAM_MARK[arg_22_0] then
			return OperationConst.URL_PARAM_MARK[arg_22_0].getFunc(arg_21_1)
		end
	end)
end

function var_0_0.ParseUrlParams(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0

	if arg_23_2 == "INQUERY_URL" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId)
	elseif arg_23_2 == "FORUM_URL" or arg_23_2 == "OFFICIAL_SUGGEST_URL" or arg_23_2 == "PC_SHOP" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId, arg_23_1.gameAppId, arg_23_1.token)
	elseif arg_23_2 == "FORUM_URL_HERO" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId, arg_23_1.gameAppId, arg_23_1.token, arg_23_1.heroName)
	elseif arg_23_2 == "OFFICIAL_DISCUSS_URL" then
		var_23_0 = string.format(arg_23_0, arg_23_1.gameAppId, arg_23_1.token)
	elseif arg_23_2 == "ACTIVITY_URL" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId)
	elseif arg_23_2 == "GUIDE_URL" or arg_23_2 == "INFORMATION_URL" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId)
	elseif arg_23_2 == "PC_FEEDBACK" then
		var_23_0 = string.format(arg_23_0, arg_23_1.userId, arg_23_1.signUserId)
	else
		var_23_0 = arg_23_0
	end

	return var_23_0
end

function var_0_0.OnApplicationBack()
	local var_24_0 = SurveyData:GetCacheFollowTip()

	if var_24_0 then
		ShowTips(var_24_0)
	end
end

function var_0_0.GetUnreadMsgResult()
	local var_25_0 = var_0_0.GetOperationUrl("BBS_BASE_URL")

	if var_25_0 then
		local var_25_1 = PlayerData:GetPlayerInfo()
		local var_25_2 = var_25_1.userID .. "_" .. var_25_1.signUserId

		LuaForUtil.GetUnreadMsg(var_25_0, var_25_2, 1, function(arg_26_0)
			if arg_26_0 > 0 then
				manager.redPoint:setTip(RedPointConst.FORUM_UNREAD, 1)
			end
		end)
	end
end

local var_0_1
local var_0_2 = false

function var_0_0.ChangeScreenSettingToPortrait()
	var_0_1 = Screen.orientation

	local var_27_0 = tonumber(SettingData:GetSettingData().pic.resolution)
	local var_27_1, var_27_2 = SettingTools.GetSettingScreenSize(var_27_0)

	SetActive(manager.ui.mainCamera, false)
	FrameTimer.New(function()
		if not var_0_2 then
			ScreenRotateUtil.ChangeScreenOrientation(UnityEngine.ScreenOrientation.AutoRotation)

			Screen.autorotateToPortrait = true
			Screen.autorotateToPortraitUpsideDown = false
			Screen.autorotateToLandscapeLeft = false
			Screen.autorotateToLandscapeRight = false
		else
			ScreenRotateUtil.ChangeScreenOrientation(UnityEngine.ScreenOrientation.Portrait)
		end

		UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(true)
		setScreenOrientation(false)
		U3DHud.mInstance:SetWidthAndHeight(1080, 1920)
		FrameTimer.New(function()
			Screen.SetResolution(var_27_2, var_27_1, true)

			if not var_0_2 then
				FrameTimer.New(function()
					ScreenRotateUtil.ChangeScreenOrientation(UnityEngine.ScreenOrientation.AutoRotation)

					Screen.autorotateToPortrait = false
					Screen.autorotateToPortraitUpsideDown = false
					Screen.autorotateToLandscapeLeft = true
					Screen.autorotateToLandscapeRight = true

					FrameTimer.New(function()
						ScreenRotateUtil.ChangeScreenOrientation(UnityEngine.ScreenOrientation.Portrait)
						FrameTimer.New(function()
							UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(true)
							U3DHud.mInstance:SetWidthAndHeight(1080, 1920)
							Screen.SetResolution(var_27_2, var_27_1, true)

							var_0_2 = true
						end, 1, 1):Start()
					end, 1, 1):Start()
				end, 1, 1):Start()
			else
				FrameTimer.New(function()
					UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(true)
					U3DHud.mInstance:SetWidthAndHeight(1080, 1920)
					Screen.SetResolution(var_27_2, var_27_1, true)
				end, 1, 1):Start()
			end
		end, 1, 1):Start()
	end, 1, 1):Start()
	FrameTimer.New(function()
		SetActive(manager.ui.mainCamera, true)
	end, 6, 1):Start()
end

function var_0_0.RecoverScreenSetting()
	SetActive(manager.ui.mainCamera, false)
	FrameTimer.New(function()
		ScreenRotateUtil.ChangeScreenOrientation(var_0_1)
		ScreenRotateUtil.ChangeScreenOrientation(UnityEngine.ScreenOrientation.AutoRotation)

		Screen.autorotateToPortrait = false
		Screen.autorotateToPortraitUpsideDown = false
		Screen.autorotateToLandscapeLeft = true
		Screen.autorotateToLandscapeRight = true

		setScreenOrientation(true)

		local var_36_0 = tonumber(SettingData:GetSettingData().pic.resolution)
		local var_36_1, var_36_2 = SettingTools.GetSettingScreenSize(var_36_0)

		UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(false)
		U3DHud.mInstance:SetWidthAndHeight(1920, 1080)
		FrameTimer.New(function()
			Screen.SetResolution(var_36_1, var_36_2, true)
		end, 2, 1):Start()
	end, 1, 1):Start()
	FrameTimer.New(function()
		SetActive(manager.ui.mainCamera, true)
	end, 4, 1):Start()
end

function var_0_0.GetDiscordAuthUrl()
	local var_39_0
	local var_39_1 = GameToSDK.IsPCPlatform() and "Discord_AuthUrl_PC" or "Discord_AuthUrl"

	return OperationAction.GetOperationUrl(var_39_1)
end

return var_0_0
