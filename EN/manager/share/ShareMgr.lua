local var_0_0 = require("cjson")
local var_0_1 = import("manager.share.ShareLogoView")
local var_0_2 = class("ShareMgr")

function var_0_2.Init(arg_1_0)
	if arg_1_0.isInit then
		return
	end

	arg_1_0.isInit = true

	arg_1_0:InitUI()
	arg_1_0:AddListeners()
	SetActive(arg_1_0.gameObject_, false)

	arg_1_0.shareCallbackHandler_ = handler(arg_1_0, arg_1_0.ShareCallback)

	manager.notify:RegistListener(SHARE_CALLBACK, arg_1_0.shareCallbackHandler_)
end

function var_0_2.InitUI(arg_2_0)
	arg_2_0.screenSnapPath_ = Application.persistentDataPath .. "/screen_snap/picture_for_share" .. manager.time:GetServerTime() .. ".jpg"

	local var_2_0 = GameObject.Find("UICamera_DontDestroy/Canvas/UIMessage/Canvas")
	local var_2_1 = "Atlas/Share"
	local var_2_2 = Asset.Load(var_2_1)
	local var_2_3 = "UI/Common/ShareUI"
	local var_2_4 = Asset.Load(var_2_3)

	arg_2_0.gameObject_ = GameObject.Instantiate(var_2_4, var_2_0.transform)
	arg_2_0.transform_ = arg_2_0.gameObject_.transform

	ComponentBinder.GetInstance():BindCfgUI(arg_2_0, arg_2_0.gameObject_)

	arg_2_0.shareLogoView_ = var_0_1.New(arg_2_0.goSnapPanel_)

	if not SDKTools.GetIsOverSea() then
		if arg_2_0.buttonTwiiter_ then
			SetActive(arg_2_0.buttonTwiiter_.transform.gameObject, false)
		end
	else
		SetActive(arg_2_0.buttonQQ_.transform.gameObject, false)
		SetActive(arg_2_0.buttonQQZone_.transform.gameObject, false)
		SetActive(arg_2_0.buttonWechat_.transform.gameObject, false)
		SetActive(arg_2_0.buttonWeibo_.transform.gameObject, false)
		SetActive(arg_2_0.buttonWechatMoments_.transform.gameObject, false)

		if arg_2_0.buttonTwiiter_ then
			SetActive(arg_2_0.buttonTwiiter_.transform.gameObject, true)
		end

		if SDKTools.GetIsThisServer({
			"kr"
		}) and arg_2_0.buttonTwiiter_ then
			SetActive(arg_2_0.buttonTwiiter_.transform.gameObject, false)
		end
	end

	if not GameToSDK.IsEditorOrPcPlatform() then
		SetActive(arg_2_0.buttonPath_.transform.gameObject, false)
	end
end

function var_0_2.Share(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
	arg_3_0:Init()
	SetActive(arg_3_0.gameObject_, true)

	arg_3_0.shareCallback_ = arg_3_3

	manager.ui:EventEnabled(false)
	manager.tips:Show(false)
	arg_3_1()
	arg_3_0.shareLogoView_:HideLogo()
	manager.ui:ShowScreenTap(false)
	SetActive(arg_3_0.goSharePanel_, false)
	manager.achievementTips:Hide(true)
	WaitRenderFrameUtil.inst.StartScreenShot(function()
		local var_4_0 = tonumber(SettingData:GetSettingData().pic.resolution)
		local var_4_1, var_4_2 = SettingTools.GetSettingScreenSize(var_4_0)

		if not SDKTools.IsSDK() then
			var_4_1, var_4_2 = Screen.width, Screen.height
		end

		if arg_3_4 then
			arg_3_0.screenSnap_ = ScreenSnap.New(var_4_2, var_4_1)
			arg_3_0.screenSnap2_ = ScreenSnap.New(var_4_2, var_4_1)
		else
			arg_3_0.screenSnap_ = ScreenSnap.New(var_4_1, var_4_2)
			arg_3_0.screenSnap2_ = ScreenSnap.New(var_4_1, var_4_2)
		end

		arg_3_0.screenSnap_:Take()

		local var_4_3 = arg_3_0.screenSnap_:GetSprite()

		arg_3_0.imageBg_.sprite = var_4_3

		arg_3_0.shareLogoView_:ShowLogo(arg_3_5)
		WaitRenderFrameUtil.inst.StartScreenShot(function()
			arg_3_0.screenSnap2_:Take()
			arg_3_0.shareLogoView_:HideLogo()
			SetActive(arg_3_0.goSharePanel_, true)
			manager.achievementTips:Hide(false)
			manager.ui:ShowScreenTap(true)
			arg_3_2()
			manager.tips:Show(true)
			manager.ui:EventEnabled(true)

			var_4_3 = arg_3_0.screenSnap2_:GetSprite()
			arg_3_0.imageShot_.sprite = var_4_3
			arg_3_0.screenSnapPath_ = Application.persistentDataPath .. "/screen_snap/picture_for_share" .. manager.time:GetServerTime() .. ".jpg"

			arg_3_0.screenSnap2_:SaveSnap(arg_3_0.screenSnapPath_)
		end)
	end)
end

function var_0_2.ShareWithSprite(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	SetActive(arg_6_0.gameObject_, true)

	arg_6_0.shareCallback_ = arg_6_2
	arg_6_0.imageBg_.sprite = arg_6_3

	arg_6_0.shareLogoView_:HideLogo()
	SetActive(arg_6_0.goSharePanel_, true)
	arg_6_1()

	arg_6_0.imageShot_.sprite = arg_6_3
	arg_6_0.screenSnapPath_ = arg_6_0:SaveTexture(arg_6_3.texture)
end

function var_0_2.SaveTexture(arg_7_0, arg_7_1)
	if not isNil(arg_7_1) then
		local var_7_0 = Application.persistentDataPath .. "/screen_snap/picture_for_share" .. manager.time:GetServerTime() .. ".jpg"

		ScreenSnap.SaveTexture(var_7_0, arg_7_1)

		return var_7_0
	end

	return Application.persistentDataPath .. "/screen_snap/picture_for_share" .. manager.time:GetServerTime() .. ".jpg"
end

function var_0_2.SaveRenderTextureByModule(arg_8_0, arg_8_1, arg_8_2)
	if not isNil(arg_8_2) then
		local var_8_0 = Application.persistentDataPath .. "/" .. arg_8_1 .. "/picture_" .. manager.time:GetServerTime() .. ".jpg"

		ScreenSnap.SaveRenderTexture(var_8_0, arg_8_2)

		return var_8_0
	end

	return Application.persistentDataPath .. "/" .. arg_8_1 .. "/picture_" .. manager.time:GetServerTime() .. ".jpg"
end

function var_0_2.GetSavePathByModule(arg_9_0, arg_9_1)
	return Application.persistentDataPath .. "/" .. arg_9_1 .. "/"
end

function var_0_2.AddListeners(arg_10_0)
	arg_10_0.buttonCancel_.onClick:AddListener(function()
		arg_10_0:OnClickClose()
	end)

	if arg_10_0.buttonQQ_ then
		arg_10_0.buttonQQ_.onClick:AddListener(function()
			arg_10_0:OnClickShare("QQ")
		end)
	end

	if arg_10_0.buttonQQZone_ then
		arg_10_0.buttonQQZone_.onClick:AddListener(function()
			arg_10_0:OnClickShare("QZone")
		end)
	end

	if arg_10_0.buttonWechat_ then
		arg_10_0.buttonWechat_.onClick:AddListener(function()
			arg_10_0:OnClickShare("Wechat")
		end)
	end

	if arg_10_0.buttonWechatMoments_ then
		arg_10_0.buttonWechatMoments_.onClick:AddListener(function()
			arg_10_0:OnClickShare("WechatMoments")
		end)
	end

	if arg_10_0.buttonWeibo_ then
		arg_10_0.buttonWeibo_.onClick:AddListener(function()
			arg_10_0:OnClickShare("SinaWeibo")
		end)
	end

	if arg_10_0.buttonTwiiter_ then
		arg_10_0.buttonTwiiter_.onClick:AddListener(function()
			arg_10_0:OnClickShare(nil)
		end)
	end

	arg_10_0.buttonSave_.onClick:AddListener(function()
		if GameToSDK.IsEditorOrPcPlatform() then
			LuaForUtil.SaveScreenShot(arg_10_0.screenSnapPath_)
		else
			LuaForUtil.SavePhotoToAlbum(arg_10_0.screenSnapPath_)
		end

		if CaptureGameMgr:IsInCaptureGame() then
			CaptureGameTools:SendShareSdk(6, 2)
		end
	end)
	arg_10_0.buttonPath_.onClick:AddListener(function()
		LuaForUtil.OpenScreenShotFolder()
	end)
	arg_10_0.buttonPath_.onClick:AddListener(function()
		LuaForUtil.OpenScreenShotFolder()
	end)
end

function var_0_2.RemoveListeners(arg_21_0)
	arg_21_0.buttonCancel_.onClick:RemoveAllListeners()
	arg_21_0.buttonQQ_.onClick:RemoveAllListeners()
	arg_21_0.buttonQQZone_.onClick:RemoveAllListeners()
	arg_21_0.buttonWechat_.onClick:RemoveAllListeners()
	arg_21_0.buttonWechatMoments_.onClick:RemoveAllListeners()
	arg_21_0.buttonWeibo_.onClick:RemoveAllListeners()
	arg_21_0.buttonTwiiter_.onClick:RemoveAllListeners()
	arg_21_0.buttonSave_.onClick:RemoveAllListeners()
	arg_21_0.buttonPath_.onClick:RemoveAllListeners()
end

function var_0_2.OnClickClose(arg_22_0)
	SetActive(arg_22_0.gameObject_, false)

	arg_22_0.screenSnap_ = nil
	arg_22_0.screenSnap2_ = nil
	arg_22_0.shareCallback_ = nil
end

function var_0_2.OnClickShare(arg_23_0, arg_23_1)
	if GameToSDK.IsEditorOrPcPlatform() then
		ShowTips("USE_MOBILE")

		return
	end

	local var_23_0 = GetTips("SHARE_TITLE")
	local var_23_1 = GetTips("SHARE_CONTENT")
	local var_23_2 = GetTips("SHARE_URL")
	local var_23_3 = {}
	local var_23_4
	local var_23_5 = arg_23_1 == nil and "Share" or "ShareWithPlatform"

	if CaptureGameMgr:IsInCaptureGame() then
		local var_23_6 = arg_23_1

		arg_23_0.paltform_ = arg_23_1

		local var_23_7 = SDKTools.PlatformStrToId(var_23_6)
		local var_23_8 = 1

		CaptureGameTools:SendShareSdk(var_23_7, var_23_8)
	else
		local var_23_9 = {
			imageUrl = "",
			messageType = var_23_5,
			url = var_23_2,
			title = var_23_0,
			content = var_23_1,
			imagePath = arg_23_0.screenSnapPath_,
			platform = arg_23_1
		}

		arg_23_0.paltform_ = arg_23_1

		local var_23_10 = var_0_0.encode(var_23_9)

		SendMessageToSDK(var_23_10)
	end
end

function var_0_2.ShareCallback(arg_24_0, arg_24_1)
	if arg_24_1 == 0 then
		if arg_24_0.shareCallback_ then
			arg_24_0.shareCallback_()
		end
	elseif arg_24_1 == 2 then
		-- block empty
	end
end

function var_0_2.Dispose(arg_25_0)
	arg_25_0.isInit = false

	if arg_25_0.shareLogoView_ then
		arg_25_0.shareLogoView_:Dispose()

		arg_25_0.shareLogoView_ = nil
	end

	if arg_25_0.gameObject_ then
		manager.notify:RemoveListener(SHARE_CALLBACK, arg_25_0.shareCallbackHandler_)

		arg_25_0.shareCallbackHandler_ = nil

		arg_25_0:RemoveListeners()
		Object.Destroy(arg_25_0.gameObject_)

		arg_25_0.gameObject_ = nil
		arg_25_0.transform_ = nil
	end
end

return var_0_2
