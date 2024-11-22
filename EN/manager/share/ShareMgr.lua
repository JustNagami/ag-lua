local var_0_0 = require("cjson")
local var_0_1 = import("manager.share.ShareLogoView")
local var_0_2 = class("ShareMgr")

function var_0_2.Ctor(arg_1_0)
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
	local var_2_2 = Asset.Load(var_2_1, true)
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

function var_0_2.AddListeners(arg_6_0)
	arg_6_0.buttonCancel_.onClick:AddListener(function()
		arg_6_0:OnClickClose()
	end)

	if arg_6_0.buttonQQ_ then
		arg_6_0.buttonQQ_.onClick:AddListener(function()
			arg_6_0:OnClickShare("QQ")
		end)
	end

	if arg_6_0.buttonQQZone_ then
		arg_6_0.buttonQQZone_.onClick:AddListener(function()
			arg_6_0:OnClickShare("QZone")
		end)
	end

	if arg_6_0.buttonWechat_ then
		arg_6_0.buttonWechat_.onClick:AddListener(function()
			arg_6_0:OnClickShare("Wechat")
		end)
	end

	if arg_6_0.buttonWechatMoments_ then
		arg_6_0.buttonWechatMoments_.onClick:AddListener(function()
			arg_6_0:OnClickShare("WechatMoments")
		end)
	end

	if arg_6_0.buttonWeibo_ then
		arg_6_0.buttonWeibo_.onClick:AddListener(function()
			arg_6_0:OnClickShare("SinaWeibo")
		end)
	end

	if arg_6_0.buttonTwiiter_ then
		arg_6_0.buttonTwiiter_.onClick:AddListener(function()
			arg_6_0:OnClickShare(nil)
		end)
	end

	arg_6_0.buttonSave_.onClick:AddListener(function()
		if GameToSDK.IsEditorOrPcPlatform() then
			LuaForUtil.SaveScreenShot(arg_6_0.screenSnapPath_)
		else
			LuaForUtil.SavePhotoToAlbum(arg_6_0.screenSnapPath_)
		end
	end)
	arg_6_0.buttonPath_.onClick:AddListener(function()
		LuaForUtil.OpenScreenShotFolder()
	end)
end

function var_0_2.RemoveListeners(arg_16_0)
	arg_16_0.buttonCancel_.onClick:RemoveAllListeners()
	arg_16_0.buttonQQ_.onClick:RemoveAllListeners()
	arg_16_0.buttonQQZone_.onClick:RemoveAllListeners()
	arg_16_0.buttonWechat_.onClick:RemoveAllListeners()
	arg_16_0.buttonWechatMoments_.onClick:RemoveAllListeners()
	arg_16_0.buttonWeibo_.onClick:RemoveAllListeners()
	arg_16_0.buttonTwiiter_.onClick:RemoveAllListeners()
	arg_16_0.buttonSave_.onClick:RemoveAllListeners()
	arg_16_0.buttonPath_.onClick:RemoveAllListeners()
end

function var_0_2.OnClickClose(arg_17_0)
	SetActive(arg_17_0.gameObject_, false)

	arg_17_0.screenSnap_ = nil
	arg_17_0.screenSnap2_ = nil
	arg_17_0.shareCallback_ = nil
end

function var_0_2.OnClickShare(arg_18_0, arg_18_1)
	if GameToSDK.IsEditorOrPcPlatform() then
		ShowTips("USE_MOBILE")

		return
	end

	local var_18_0 = GetTips("SHARE_TITLE")
	local var_18_1 = GetTips("SHARE_CONTENT")
	local var_18_2 = GetTips("SHARE_URL")
	local var_18_3 = {}
	local var_18_4
	local var_18_5 = arg_18_1 == nil and "Share" or "ShareWithPlatform"
	local var_18_6 = {
		imageUrl = "",
		messageType = var_18_5,
		url = var_18_2,
		title = var_18_0,
		content = var_18_1,
		imagePath = arg_18_0.screenSnapPath_,
		platform = arg_18_1
	}

	arg_18_0.paltform_ = arg_18_1

	local var_18_7 = var_0_0.encode(var_18_6)

	SendMessageToSDK(var_18_7)
end

function var_0_2.ShareCallback(arg_19_0, arg_19_1)
	if arg_19_1 == 0 then
		if arg_19_0.shareCallback_ then
			arg_19_0.shareCallback_()
		end
	elseif arg_19_1 == 2 then
		-- block empty
	end
end

function var_0_2.Dispose(arg_20_0)
	if arg_20_0.shareLogoView_ then
		arg_20_0.shareLogoView_:Dispose()

		arg_20_0.shareLogoView_ = nil
	end

	if arg_20_0.gameObject_ then
		manager.notify:RemoveListener(SHARE_CALLBACK, arg_20_0.shareCallbackHandler_)

		arg_20_0.shareCallbackHandler_ = nil

		arg_20_0:RemoveListeners()
		Object.Destroy(arg_20_0.gameObject_)

		arg_20_0.gameObject_ = nil
		arg_20_0.transform_ = nil
	end
end

return var_0_2
