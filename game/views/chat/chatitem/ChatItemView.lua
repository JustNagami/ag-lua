local var_0_0 = import("game.views.chat.loopScrollView.LoopScrollViewBaseItem")
local var_0_1 = class("ChatItemView", var_0_0)

var_0_1.bgExtendHeight = 40
var_0_1.contentMaxWidth = 540

function var_0_1.OnCtor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.scrollView_ = arg_1_3

	arg_1_0:BindCfgUI()

	arg_1_0.contentSizeFitter_ = arg_1_0.textContent_:GetComponent("ContentSizeFitter")

	arg_1_0:AddListeners()
	arg_1_0:Show(true)
end

function var_0_1.Dispose(arg_2_0)
	var_0_1.super.Dispose(arg_2_0)
	arg_2_0:DestroySticker()
	Object.Destroy(arg_2_0.gameObject_)

	arg_2_0.gameObject_ = nil
	arg_2_0.transform_ = nil
end

function var_0_1.GetUserID(arg_3_0)
	return arg_3_0.itemData_.id
end

function var_0_1.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.buttonHead_, nil, function()
		if CooperationData:CheckInRoom() then
			return
		end

		ForeignInfoAction:TryToCheckForeignDetailInfo(arg_4_0:GetUserID())
	end)
	arg_4_0:AddBtnListener(arg_4_0.buttonContent_, nil, function()
		if arg_4_0.itemData_.id == USER_ID then
			return
		end

		manager.notify:Invoke(CHAT_REPORT, {
			reportData = {
				nick = arg_4_0:GetNick(),
				msgID = arg_4_0.itemData_.msgID
			},
			parentRect = arg_4_0.rectReportParent_,
			x = arg_4_0:CalcOffsetX(),
			y = arg_4_0:CalcOffsetY()
		})
	end)
end

function var_0_1.GetNick(arg_7_0)
	return arg_7_0.itemData_.nick
end

function var_0_1.SetText(arg_8_0, arg_8_1)
	if arg_8_1.id == USER_ID then
		local var_8_0 = PlayerData:GetPlayerInfo()

		arg_8_0.textName_.text = GetI18NText(var_8_0.nick)
		arg_8_0.imageIcon_.sprite = ItemTools.getItemSprite(var_8_0.portrait)
		arg_8_0.imageFrame_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. var_8_0.icon_frame)

		local var_8_1 = PlayerData:GetCurChatBubbleID() or GameSetting.profile_chat_bubble_default.value[1]
		local var_8_2 = ChatBubbleCfg[var_8_1]

		if not var_8_2 then
			-- block empty
		end

		local var_8_3 = var_8_2.color2

		arg_8_0.textContent_.color = Color(var_8_3[1], var_8_3[2], var_8_3[3])
		arg_8_0.imageBubble_.sprite = getSpriteWithoutAtlas("TextureConfig/ChatBubble/" .. var_8_2.image2)
	else
		arg_8_0.textName_.text = GetI18NText(arg_8_1.nick)
		arg_8_0.imageIcon_.sprite = getSpriteViaConfig("HeroLittleIcon", ItemCfg[arg_8_1.icon].icon)
		arg_8_0.imageFrame_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. arg_8_1.iconFrame)

		local var_8_4 = arg_8_1.bubbleID or GameSetting.profile_chat_bubble_default.value[1]
		local var_8_5 = ChatBubbleCfg[var_8_4]
		local var_8_6 = var_8_5.color1

		arg_8_0.textContent_.color = Color(var_8_6[1], var_8_6[2], var_8_6[3])
		arg_8_0.imageBubble_.sprite = getSpriteWithoutAtlas("TextureConfig/ChatBubble/" .. var_8_5.image1)
	end
end

function var_0_1.SetData(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.itemData_ = arg_9_1
	arg_9_0.index_ = arg_9_2

	arg_9_0:SetText(arg_9_0.itemData_)
	arg_9_0:Show(true)
	arg_9_0:DestroySticker()

	if arg_9_0.itemData_.contentType == ChatConst.CHAT_CONTENT_TYPE.TEXT then
		arg_9_0.textContent_.text = GetI18NText(arg_9_0.itemData_.content)

		SetActive(arg_9_0.goImage_, false)
		SetActive(arg_9_0.goContent_, true)
		arg_9_0:Adaption()
		LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.rectText_)

		arg_9_0.imageBubble_.enabled = true
	else
		local var_9_0 = tonumber(arg_9_0.itemData_.content)
		local var_9_1 = ChatStickerCfg[var_9_0] or ChatStickerCfg[1]
		local var_9_2 = var_9_1.icon

		if var_9_1.type == 1 then
			arg_9_0.imageSticker_.enabled = true
			arg_9_0.imageSticker_.sprite = getSpriteViaConfig("ChatSticker", var_9_2)
		else
			arg_9_0.imageSticker_.enabled = false
			arg_9_0.dynamicStickerGo_ = Object.Instantiate(Asset.Load(var_9_2), arg_9_0.imageSticker_.transform)
		end

		SetActive(arg_9_0.goImage_, true)
		SetActive(arg_9_0.goContent_, false)

		arg_9_0.imageBubble_.enabled = false
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.rectBg_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.rectContent_)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.rectGo_)
	arg_9_0:SetIP(arg_9_0.itemData_)
end

function var_0_1.SetIP(arg_10_0, arg_10_1)
	if not arg_10_0.ipGo_ then
		return
	end

	arg_10_0.ip_.text = arg_10_1.ip

	SetActive(arg_10_0.ipGo_, GameToSDK.CURRENT_SERVER == AreaConst.CHINA)

	if arg_10_0.gameObject_.activeSelf then
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_10_0.ipGo_.transform)
	end
end

function var_0_1.Adaption(arg_11_0)
	local var_11_0 = arg_11_0.rectText_

	var_11_0.sizeDelta = Vector2(var_0_1.contentMaxWidth, var_0_1.bgExtendHeight)

	if arg_11_0.textContent_.preferredWidth > var_0_1.contentMaxWidth then
		arg_11_0.contentSizeFitter_.horizontalFit = ContentSizeFitter.FitMode.Unconstrained
	else
		arg_11_0.contentSizeFitter_.horizontalFit = ContentSizeFitter.FitMode.PreferredSize
	end

	arg_11_0.contentSizeFitter_.verticalFit = ContentSizeFitter.FitMode.PreferredSize
	var_11_0.sizeDelta = Vector2(var_0_1.contentMaxWidth, var_11_0.sizeDelta.y)
end

function var_0_1.SetAsLastSibling(arg_12_0)
	arg_12_0.transform_:SetAsLastSibling()
end

function var_0_1.SetAsFirstSibling(arg_13_0)
	arg_13_0.transform_:SetAsFirstSibling()
end

function var_0_1.Show(arg_14_0, arg_14_1)
	if arg_14_0.gameObject_.activeSelf == false and arg_14_1 == true then
		manager.notify:Invoke(CHAT_REPORT_HIDE)
	end

	SetActive(arg_14_0.gameObject_, arg_14_1)
end

function var_0_1.CalcOffsetX(arg_15_0)
	local var_15_0 = arg_15_0.rectBg_.rect.width

	return arg_15_0.rectReportParent_:InverseTransformPoint(arg_15_0.rectBg_:TransformPoint(Vector3(var_15_0 / 2, 0, 0))).x
end

function var_0_1.CalcOffsetY(arg_16_0)
	local var_16_0 = arg_16_0.rectReportParent_:InverseTransformPoint(arg_16_0.rectScrollView_:TransformPoint(Vector3.zero))
	local var_16_1 = arg_16_0.rectReportParent_.rect.height / 2

	if var_16_1 > var_16_0.y then
		return var_16_0.y + var_16_1 - arg_16_0.rectReportParent_:TransformPoint(Vector3(0, var_16_0.y + var_16_1, 0)).y - 20
	else
		return 0
	end
end

function var_0_1.DestroySticker(arg_17_0)
	if arg_17_0.dynamicStickerGo_ then
		Object.Destroy(arg_17_0.dynamicStickerGo_)

		arg_17_0.dynamicStickerGo_ = nil
	end
end

return var_0_1
