local var_0_0 = class("UserHeadItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.selectCon_ = ControllerUtil.GetController(arg_3_0.iconGo_.transform, "select")
	arg_3_0.lockCon_ = ControllerUtil.GetController(arg_3_0.iconGo_.transform, "lock")
	arg_3_0.useCon_ = ControllerUtil.GetController(arg_3_0.iconGo_.transform, "use")
	arg_3_0.typeCon_ = ControllerUtil.GetController(arg_3_0.iconGo_.transform, "type")
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.iconBtn_, nil, function()
		if arg_4_0.clickFunc_ then
			arg_4_0.clickFunc_()
		end
	end)
end

function var_0_0.RefreshItem(arg_6_0, arg_6_1, arg_6_2)
	manager.redPoint:unbindUIandKey(arg_6_0.transform_)

	arg_6_0.itemID_ = arg_6_1

	if arg_6_2 == "portrait" then
		arg_6_0.info_ = PlayerData:GetPortrait(arg_6_0.itemID_)

		arg_6_0.typeCon_:SetSelectedState("portrait")

		arg_6_0.icon_.sprite = ItemTools.getItemSprite(arg_6_0.itemID_)

		arg_6_0.icon_:SetNativeSize()
	elseif arg_6_2 == "frame" then
		arg_6_0.info_ = PlayerData:GetFrame(arg_6_0.itemID_)

		arg_6_0.typeCon_:SetSelectedState("frame")

		arg_6_0.frame_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. arg_6_0.itemID_)
	elseif arg_6_2 == "cardBg" then
		arg_6_0.info_ = PlayerData:GetCardBg(arg_6_0.itemID_)

		arg_6_0.typeCon_:SetSelectedState("cardBg")

		arg_6_0.cardBgIcon_.sprite = ItemTools.getItemSprite(arg_6_0.itemID_)

		arg_6_0.cardBgIcon_:SetNativeSize()
	elseif arg_6_2 == "chatBubble" then
		arg_6_0.info_ = {
			unlock = table.keyof(PlayerData:GetUnlockChatBubbleIDList(), arg_6_0.itemID_) and 1 or 0
		}

		arg_6_0.typeCon_:SetSelectedState("chatBubble")

		arg_6_0.chatBubbleImg_.sprite = ItemTools.getItemSprite(arg_6_0.itemID_)

		local var_6_0 = ChatBubbleCfg[arg_6_0.itemID_].color1

		arg_6_0.chatBubbleTxt_.color = Color(var_6_0[1], var_6_0[2], var_6_0[3])

		manager.redPoint:bindUIandKey(arg_6_0.transform_, string.format("%s_%s", RedPointConst.CHAT_BUBBLE, arg_6_0.itemID_))
	end

	arg_6_0.lockCon_:SetSelectedState(arg_6_0.info_.unlock == 0 and "lock" or "default")
	SetActive(arg_6_0.timeCntGo_, arg_6_0.info_.lasted_time and arg_6_0.info_.lasted_time > 0)
	arg_6_0:RefreshTime()
end

function var_0_0.RefreshTime(arg_7_0)
	arg_7_0:StopTimer()

	if not arg_7_0.info_.lasted_time or arg_7_0.info_.lasted_time == 0 then
		return
	end

	if arg_7_0.info_.lasted_time - manager.time:GetServerTime() <= 0 then
		arg_7_0.timeCntText_.text = GetTips("TIP_EXPIRED")
	else
		arg_7_0.timeCntText_.text = manager.time:GetLostTimeStr2(arg_7_0.info_.lasted_time)
	end

	arg_7_0.timer_ = Timer.New(function()
		if arg_7_0.info_.lasted_time - manager.time:GetServerTime() > 0 then
			arg_7_0.timeCntText_.text = manager.time:GetLostTimeStr2(arg_7_0.info_.lasted_time)
		else
			arg_7_0.timeCntText_.text = GetTips("TIP_EXPIRED")

			if arg_7_0.info_.unlock == 1 then
				if curPage == "frame" then
					PlayerData:LockFrame(arg_7_0.itemID_)

					if PlayerData:GetCurFrame() == arg_7_0.itemID_ then
						local var_8_0 = GameSetting.profile_avatar_frame_default.value[1]

						PlayerAction.ChangeFrameIcon(var_8_0)
					end
				elseif curPage == "cardBg" then
					PlayerData:LockCardBg(arg_7_0.itemID_)

					if PlayerData:GetCurCardBg() == arg_7_0.itemID_ then
						local var_8_1 = GameSetting.profile_business_card_default.value[1]

						PlayerAction.ChangeCardBg(var_8_1)
					end
				end
			end

			arg_7_0:StopTimer()
		end
	end, -1, 1)

	arg_7_0.timer_:Start()
end

function var_0_0.SetUsed(arg_9_0, arg_9_1)
	arg_9_0.useCon_:SetSelectedState(arg_9_1 and "used" or "default")
end

function var_0_0.SetSelected(arg_10_0, arg_10_1)
	arg_10_0.selectCon_:SetSelectedState(arg_10_1 and "select" or "default")
end

function var_0_0.RegisterClickListener(arg_11_0, arg_11_1)
	arg_11_0.clickFunc_ = arg_11_1
end

function var_0_0.StopTimer(arg_12_0)
	if arg_12_0.timer_ then
		arg_12_0.timer_:Stop()

		arg_12_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_13_0)
	arg_13_0:StopTimer()
end

function var_0_0.Dispose(arg_14_0)
	manager.redPoint:unbindUIandKey(arg_14_0.transform_)
	arg_14_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_14_0)
end

return var_0_0
