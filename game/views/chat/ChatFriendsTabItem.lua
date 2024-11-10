local var_0_0 = class("ChatFriendsTabItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.selectStateController_ = arg_3_0.itemControllerEx_:GetController("selectState")
	arg_3_0.onlineStateController_ = arg_3_0.itemControllerEx_:GetController("onlineState")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.itemBtn_, nil, function()
		if arg_4_0.click_ then
			arg_4_0.click_()
		end
	end)
end

function var_0_0.SetData(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	arg_6_0.friendID_ = arg_6_1
	arg_6_0.index_ = arg_6_2
	arg_6_0.click_ = arg_6_4

	arg_6_0:SetSelectState(arg_6_1 == arg_6_3)

	if arg_6_1 == USER_ID then
		local var_6_0 = PlayerData:GetPlayerInfo()

		arg_6_0.nickText_.text = GetI18NText(var_6_0.nick)
		arg_6_0.headImg_.sprite = getSpriteViaConfig("HeroLittleIcon", ItemCfg[var_6_0.portrait].icon)
		arg_6_0.frameImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. var_6_0.icon_frame)
	else
		local var_6_1 = FriendsData:GetInfoByID(arg_6_1)

		if var_6_1 == false then
			print("unfind friend data", arg_6_1)
			arg_6_0:Show(false)

			return
		end

		arg_6_0.nickText_.text = GetI18NText(var_6_1.nick)
		arg_6_0.headImg_.sprite = getSpriteViaConfig("HeroLittleIcon", ItemCfg[var_6_1.icon].icon)
		arg_6_0.frameImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. var_6_1.icon_frame)

		arg_6_0.onlineStateController_:SetSelectedState(var_6_1.online_state == 0 and "on" or "off")
	end
end

function var_0_0.SetSelectState(arg_7_0, arg_7_1)
	arg_7_0.selectStateController_:SetSelectedState(arg_7_1 and "select" or "cancel")
	arg_7_0:RefreshRedPoint(arg_7_1)
end

function var_0_0.Show(arg_8_0, arg_8_1)
	SetActive(arg_8_0.gameObject_, arg_8_1)
end

function var_0_0.RefreshRedPoint(arg_9_0, arg_9_1)
	local var_9_0 = ChatFriendData:GetUnreadMsgCnt(arg_9_0.friendID_)

	if var_9_0 <= 0 or arg_9_1 then
		SetActive(arg_9_0.goNotice_, false)
	else
		SetActive(arg_9_0.goNotice_, true)

		arg_9_0.textNoticeCnt_.text = var_9_0
	end
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
