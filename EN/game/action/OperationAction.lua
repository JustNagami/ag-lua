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

function var_0_0.GetCurServeTimestampAndSign(arg_4_0)
	manager.net:SendWithLoadingNew(10700, {}, 10701, function(arg_5_0)
		arg_4_0(arg_5_0.timestamp, arg_5_0.timestamp_sign)
	end)
end

function var_0_0.GetOperationUrl(arg_6_0)
	local var_6_0 = GameToSDK.clientInfo.configS

	if not var_6_0 then
		print("error GameToSDK.clientInfo empty configS")

		return nil
	end

	if not var_6_0:ContainsKey(arg_6_0) then
		print("error GameToSDK.clientInfo empty configS by key : " .. arg_6_0)

		return nil
	end

	return var_6_0:get_Item(arg_6_0)
end

function var_0_0.OpenOperationUrl(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = var_0_0.GetOperationUrl(arg_7_0)

	if not var_7_0 then
		return
	end

	local var_7_1 = ""

	if arg_7_0 == "INQUERY_URL" then
		var_7_1 = string.format(var_7_0, arg_7_1.userId, arg_7_1.signUserId)
	elseif arg_7_0 == "FORUM_URL" or arg_7_0 == "OFFICIAL_SUGGEST_URL" or arg_7_0 == "PC_SHOP" then
		var_7_1 = string.format(var_7_0, arg_7_1.userId, arg_7_1.signUserId, arg_7_1.gameAppId, arg_7_1.token)
	elseif arg_7_0 == "FORUM_URL_HERO" then
		var_7_1 = string.format(var_7_0, arg_7_1.userId, arg_7_1.signUserId, arg_7_1.gameAppId, arg_7_1.token, arg_7_1.heroName)
	elseif arg_7_0 == "OFFICIAL_DISCUSS_URL" then
		var_7_1 = string.format(var_7_0, arg_7_1.gameAppId, arg_7_1.token)
	elseif arg_7_0 == "ACTIVITY_URL" then
		var_7_1 = string.format(var_7_0, arg_7_1.userId, arg_7_1.signUserId)
	elseif arg_7_0 == "GUIDE_URL" or arg_7_0 == "INFORMATION_URL" then
		var_7_1 = string.format(var_7_0, arg_7_1.userId, arg_7_1.signUserId)
	else
		var_7_1 = var_7_0
	end

	local var_7_2 = EncodeURL(var_7_1)

	print("url : ", var_7_2)

	local var_7_3

	if GameToSDK.IsEditorOrPcPlatform() then
		var_7_3 = OperationConst.URL_OPEN_WAY.NORMAL
	elseif GameToSDK.PLATFORM_ID == 1 and (arg_7_0 == "FORUM_URL" or arg_7_0 == "PC_SHOP" or arg_7_0 == "FORUM_URL_HOME" or arg_7_0 == "FORUM_URL_HERO" or arg_7_0 == "OFFICIAL_SUGGEST_URL") then
		var_7_3 = OperationConst.URL_OPEN_WAY.NORMAL
	else
		var_7_3 = OperationConst.URL_OPEN_WAY.INTERNAL
	end

	var_0_0.OpenUrl(var_7_2, var_7_3, arg_7_2)
end

function var_0_0.OpenUrl(arg_8_0, arg_8_1, arg_8_2)
	print(string.format("OpenUrl, url: %s, openWay : %s", arg_8_0, arg_8_1))

	if arg_8_1 == OperationConst.URL_OPEN_WAY.NORMAL then
		if GameToSDK.IsIOSPlatform() then
			LuaForUtil.LinkThirdApp(arg_8_0)
		else
			Application.OpenURL(arg_8_0)
		end
	elseif arg_8_1 == OperationConst.URL_OPEN_WAY.INTERNAL then
		FrameTimer.New(function()
			arg_8_2 = arg_8_2 or OperationConst.SCREEN_ORIENTATION.FREE

			LuaForUtil.OpenWebView(arg_8_0, true, function()
				print("--->> open webView to portrait")
			end, function()
				print("====>>> close webView recover")
			end, arg_8_2)
		end, 6, 1):Start()
	else
		Debug.LogError(string.format("undefind openWay"))
	end
end

function var_0_0.OnApplicationBack()
	local var_12_0 = SurveyData:GetCacheFollowTip()

	if var_12_0 then
		ShowTips(var_12_0)
	end
end

function var_0_0.GetUnreadMsgResult()
	local var_13_0 = var_0_0.GetOperationUrl("BBS_BASE_URL")

	if var_13_0 then
		local var_13_1 = PlayerData:GetPlayerInfo()
		local var_13_2 = var_13_1.userID .. "_" .. var_13_1.signUserId

		LuaForUtil.GetUnreadMsg(var_13_0, var_13_2, 1, function(arg_14_0)
			if arg_14_0 > 0 then
				manager.redPoint:setTip(RedPointConst.FORUM_UNREAD, 1)
			end
		end)
	end
end

local var_0_1
local var_0_2 = false

function var_0_0.ChangeScreenSettingToPortrait()
	var_0_1 = Screen.orientation

	local var_15_0 = tonumber(SettingData:GetSettingData().pic.resolution)
	local var_15_1, var_15_2 = SettingTools.GetSettingScreenSize(var_15_0)

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
			Screen.SetResolution(var_15_2, var_15_1, true)

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
							Screen.SetResolution(var_15_2, var_15_1, true)

							var_0_2 = true
						end, 1, 1):Start()
					end, 1, 1):Start()
				end, 1, 1):Start()
			else
				FrameTimer.New(function()
					UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(true)
					U3DHud.mInstance:SetWidthAndHeight(1080, 1920)
					Screen.SetResolution(var_15_2, var_15_1, true)
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

		local var_24_0 = tonumber(SettingData:GetSettingData().pic.resolution)
		local var_24_1, var_24_2 = SettingTools.GetSettingScreenSize(var_24_0)

		UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(false)
		U3DHud.mInstance:SetWidthAndHeight(1920, 1080)
		FrameTimer.New(function()
			Screen.SetResolution(var_24_1, var_24_2, true)
		end, 2, 1):Start()
	end, 1, 1):Start()
	FrameTimer.New(function()
		SetActive(manager.ui.mainCamera, true)
	end, 4, 1):Start()
end

function var_0_0.GetDiscordAuthUrl()
	local var_27_0
	local var_27_1 = GameToSDK.IsPCPlatform() and "Discord_AuthUrl_PC" or "Discord_AuthUrl"

	return OperationAction.GetOperationUrl(var_27_1)
end

function var_0_0.OpenTransferCode()
	OperationAction.GetCurServeTimestampAndSign(function(arg_29_0, arg_29_1)
		local var_29_0 = var_0_0.GetOperationUrl("ACCOUNT_TRANSFER_URL")
		local var_29_1 = PlayerData:GetPlayerInfo().userID
		local var_29_2 = _G.TMP_CHANNELID
		local var_29_3 = GetSDKLoginToken()
		local var_29_4 = string.format(var_29_0, var_29_1, var_29_2, var_29_3, arg_29_0, arg_29_1)

		var_0_0.OpenUrl(var_29_4, OperationConst.URL_OPEN_WAY.NORMAL)
	end)
end

return var_0_0
