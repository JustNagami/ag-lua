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

function var_0_0.GetOperationUrl(arg_4_0)
	local var_4_0 = GameToSDK.clientInfo.configS

	if not var_4_0 then
		print("error GameToSDK.clientInfo empty configS")

		return nil
	end

	if not var_4_0:ContainsKey(arg_4_0) then
		print("error GameToSDK.clientInfo empty configS by key : " .. arg_4_0)

		return nil
	end

	return var_4_0:get_Item(arg_4_0)
end

function var_0_0.OpenOperationUrl(arg_5_0, arg_5_1)
	local var_5_0 = GameToSDK.clientInfo.configS

	if not var_5_0 then
		print("error GameToSDK.clientInfo empty configS")

		return
	end

	if not var_5_0:ContainsKey(arg_5_0) then
		print("error GameToSDK.clientInfo empty configS by key : " .. arg_5_0)

		return
	end

	local var_5_1 = var_5_0:get_Item(arg_5_0)
	local var_5_2 = ""

	if arg_5_0 == "INQUERY_URL" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId)
	elseif arg_5_0 == "FORUM_URL" or arg_5_0 == "OFFICIAL_SUGGEST_URL" or arg_5_0 == "PC_SHOP" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId, arg_5_1.gameAppId, arg_5_1.token)
	elseif arg_5_0 == "FORUM_URL_HERO" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId, arg_5_1.gameAppId, arg_5_1.token, arg_5_1.heroName)
	elseif arg_5_0 == "OFFICIAL_DISCUSS_URL" then
		var_5_2 = string.format(var_5_1, arg_5_1.gameAppId, arg_5_1.token)
	elseif arg_5_0 == "ACTIVITY_URL" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId)
	elseif arg_5_0 == "GUIDE_URL" or arg_5_0 == "INFORMATION_URL" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId)
	elseif arg_5_0 == "PC_FEEDBACK" then
		var_5_2 = string.format(var_5_1, arg_5_1.userId, arg_5_1.signUserId)
	else
		var_5_2 = var_5_1
	end

	local var_5_3 = EncodeURL(var_5_2)

	print("url : ", var_5_3)

	if (GameToSDK.PLATFORM_ID == 1 or GameToSDK.IsEditorOrPcPlatform()) and (arg_5_0 == "FORUM_URL" or arg_5_0 == "PC_SHOP" or arg_5_0 == "FORUM_URL_HOME" or arg_5_0 == "FORUM_URL_HERO" or arg_5_0 == "OFFICIAL_SUGGEST_URL") or GameToSDK.IsEditorOrPcPlatform() then
		Application.OpenURL(var_5_3)
	else
		local var_5_4 = true
		local var_5_5 = -1

		if arg_5_0 == "ACTIVITY_URL" then
			var_5_4 = false
			var_5_5 = 0
		end

		FrameTimer.New(function()
			LuaForUtil.OpenWebView(var_5_3, var_5_4, function()
				print("--->> open webView to portrait")
				LuaForUtil.EnableAudioSessionRestoration_IOS(false)
			end, function()
				print("====>>> close webView recover")
				LuaForUtil.EnableAudioSessionRestoration_IOS(true)
			end, var_5_5)
		end, 6, 1):Start()
	end
end

function var_0_0.OnApplicationBack()
	local var_9_0 = SurveyData:GetCacheFollowTip()

	if var_9_0 then
		ShowTips(var_9_0)
	end
end

function var_0_0.GetUnreadMsgResult()
	local var_10_0 = var_0_0.GetOperationUrl("BBS_BASE_URL")

	if var_10_0 then
		local var_10_1 = PlayerData:GetPlayerInfo()
		local var_10_2 = var_10_1.userID .. "_" .. var_10_1.signUserId

		LuaForUtil.GetUnreadMsg(var_10_0, var_10_2, 1, function(arg_11_0)
			if arg_11_0 > 0 then
				manager.redPoint:setTip(RedPointConst.FORUM_UNREAD, 1)
			end
		end)
	end
end

local var_0_1
local var_0_2 = false

function var_0_0.ChangeScreenSettingToPortrait()
	var_0_1 = Screen.orientation

	local var_12_0 = tonumber(SettingData:GetSettingData().pic.resolution)
	local var_12_1, var_12_2 = SettingTools.GetSettingScreenSize(var_12_0)

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
			Screen.SetResolution(var_12_2, var_12_1, true)

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
							Screen.SetResolution(var_12_2, var_12_1, true)

							var_0_2 = true
						end, 1, 1):Start()
					end, 1, 1):Start()
				end, 1, 1):Start()
			else
				FrameTimer.New(function()
					UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(true)
					U3DHud.mInstance:SetWidthAndHeight(1080, 1920)
					Screen.SetResolution(var_12_2, var_12_1, true)
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

		local var_21_0 = tonumber(SettingData:GetSettingData().pic.resolution)
		local var_21_1, var_21_2 = SettingTools.GetSettingScreenSize(var_21_0)

		UnityEngine.Pipelines.SimPipeline.CanvasManager.Instance:RotateScreen(false)
		U3DHud.mInstance:SetWidthAndHeight(1920, 1080)
		FrameTimer.New(function()
			Screen.SetResolution(var_21_1, var_21_2, true)
		end, 2, 1):Start()
	end, 1, 1):Start()
	FrameTimer.New(function()
		SetActive(manager.ui.mainCamera, true)
	end, 4, 1):Start()
end

return var_0_0
