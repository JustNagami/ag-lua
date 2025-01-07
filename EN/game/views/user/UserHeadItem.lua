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
	arg_3_0.commonPortrait_ = CommonHeadPortrait.New(arg_3_0.portraitHead_)
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0.commonPortrait_:RegisteClickCallback(function()
		if arg_4_0.clickFunc_ then
			arg_4_0.clickFunc_()
		end
	end)
	arg_4_0:AddBtnListener(arg_4_0.iconBtn_, nil, function()
		if arg_4_0.clickFunc_ then
			arg_4_0.clickFunc_()
		end
	end)
end

function var_0_0.RefreshItem(arg_7_0, arg_7_1, arg_7_2)
	manager.redPoint:unbindUIandKey(arg_7_0.transform_)

	arg_7_0.itemID_ = arg_7_1

	if arg_7_2 == "portrait" then
		arg_7_0.info_ = PlayerData:GetPortrait(arg_7_0.itemID_)

		arg_7_0.typeCon_:SetSelectedState("portrait")
		arg_7_0.commonPortrait_:RenderHead(arg_7_0.itemID_)
		arg_7_0.commonPortrait_:RenderFrame(nil)
	elseif arg_7_2 == "frame" then
		arg_7_0.info_ = PlayerData:GetFrame(arg_7_0.itemID_)

		arg_7_0.typeCon_:SetSelectedState("frame")
		arg_7_0.commonPortrait_:RenderHead(nil)
		arg_7_0.commonPortrait_:RenderFrame(arg_7_0.itemID_)
	elseif arg_7_2 == "cardBg" then
		arg_7_0.info_ = PlayerData:GetCardBg(arg_7_0.itemID_)

		arg_7_0.typeCon_:SetSelectedState("cardBg")

		arg_7_0.cardBgIcon_.sprite = ItemTools.getItemSprite(arg_7_0.itemID_)

		arg_7_0.cardBgIcon_:SetNativeSize()
	elseif arg_7_2 == "chatBubble" then
		arg_7_0.info_ = {
			unlock = table.keyof(PlayerData:GetUnlockChatBubbleIDList(), arg_7_0.itemID_) and 1 or 0
		}

		arg_7_0.typeCon_:SetSelectedState("chatBubble")

		arg_7_0.chatBubbleImg_.sprite = ItemTools.getItemSprite(arg_7_0.itemID_)

		local var_7_0 = ChatBubbleCfg[arg_7_0.itemID_].color1

		arg_7_0.chatBubbleTxt_.color = Color(var_7_0[1], var_7_0[2], var_7_0[3])

		manager.redPoint:bindUIandKey(arg_7_0.transform_, string.format("%s_%s", RedPointConst.CHAT_BUBBLE, arg_7_0.itemID_))
	end

	arg_7_0.lockCon_:SetSelectedState(arg_7_0.info_.unlock == 0 and "lock" or "default")
	SetActive(arg_7_0.timeCntGo_, arg_7_0.info_.lasted_time and arg_7_0.info_.lasted_time > 0)
	arg_7_0:RefreshTime()
end

function var_0_0.RefreshTime(arg_8_0)
	arg_8_0:StopTimer()

	if not arg_8_0.info_.lasted_time or arg_8_0.info_.lasted_time == 0 then
		return
	end

	if arg_8_0.info_.lasted_time - manager.time:GetServerTime() <= 0 then
		arg_8_0.timeCntText_.text = GetTips("TIP_EXPIRED")
	else
		arg_8_0.timeCntText_.text = manager.time:GetLostTimeStr2(arg_8_0.info_.lasted_time)
	end

	arg_8_0.timer_ = Timer.New(function()
		if arg_8_0.info_.lasted_time - manager.time:GetServerTime() > 0 then
			arg_8_0.timeCntText_.text = manager.time:GetLostTimeStr2(arg_8_0.info_.lasted_time)
		else
			arg_8_0.timeCntText_.text = GetTips("TIP_EXPIRED")

			if arg_8_0.info_.unlock == 1 then
				if curPage == "frame" then
					PlayerData:LockFrame(arg_8_0.itemID_)

					if PlayerData:GetCurFrame() == arg_8_0.itemID_ then
						local var_9_0 = GameSetting.profile_avatar_frame_default.value[1]

						PlayerAction.ChangeFrameIcon(var_9_0)
					end
				elseif curPage == "cardBg" then
					PlayerData:LockCardBg(arg_8_0.itemID_)

					if PlayerData:GetCurCardBg() == arg_8_0.itemID_ then
						local var_9_1 = GameSetting.profile_business_card_default.value[1]

						PlayerAction.ChangeCardBg(var_9_1)
					end
				end
			end

			arg_8_0:StopTimer()
		end
	end, -1, 1)

	arg_8_0.timer_:Start()
end

function var_0_0.SetUsed(arg_10_0, arg_10_1)
	arg_10_0.useCon_:SetSelectedState(arg_10_1 and "used" or "default")
end

function var_0_0.SetSelected(arg_11_0, arg_11_1)
	arg_11_0.selectCon_:SetSelectedState(arg_11_1 and "select" or "default")
end

function var_0_0.RegisterClickListener(arg_12_0, arg_12_1)
	arg_12_0.clickFunc_ = arg_12_1
end

function var_0_0.StopTimer(arg_13_0)
	if arg_13_0.timer_ then
		arg_13_0.timer_:Stop()

		arg_13_0.timer_ = nil
	end
end

function var_0_0.OnExit(arg_14_0)
	arg_14_0:StopTimer()
end

function var_0_0.Dispose(arg_15_0)
	manager.redPoint:unbindUIandKey(arg_15_0.transform_)
	arg_15_0.commonPortrait_:Dispose()
	arg_15_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
