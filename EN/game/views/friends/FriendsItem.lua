local var_0_0 = class("FriendsItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.friendType_ = {
		myFriends = FriendsConst.FRIEND_TYPE.MY_FRIENDS,
		newFriends = FriendsConst.FRIEND_TYPE.NEW_FRIENDS,
		friendsRequest = FriendsConst.FRIEND_TYPE.FRIEND_REQUESTS,
		blackList = FriendsConst.FRIEND_TYPE.BLACKLIST,
		search = FriendsConst.FRIEND_TYPE.SEARCH
	}
	arg_1_0.typeCon_ = ControllerUtil.GetController(arg_1_0.transform_, "friendType")
	arg_1_0.stateCon_ = ControllerUtil.GetController(arg_1_0.transform_, "online")
	arg_1_0.newFriendCon_ = ControllerUtil.GetController(arg_1_0.transform_, "newFriend")

	arg_1_0:InitUI()
	arg_1_0:AddUIListeners()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()

	arg_2_0.textLimit_ = arg_2_0.chatText_.gameObject:GetComponent("TextExtension")
end

function var_0_0.AddUIListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.headBtn_, nil, function()
		ForeignInfoAction:TryToCheckForeignDetailInfo(arg_3_0.userID)
	end)
	arg_3_0:AddBtnListener(arg_3_0.chatBtn_, nil, function()
		ChatFriendData:AddCacheFriend(arg_3_0.userID)
		JumpTools.OpenPageByJump("chat", {
			ignoreBG = true,
			chatToggleID = ChatConst.CHAT_CHANNEL_FRIEND,
			friendID = arg_3_0.userID
		}, ViewConst.SYSTEM_ID.CHAT)
	end)
	arg_3_0:AddBtnListener(arg_3_0.addFriendBtn_, nil, function()
		if FriendsData:IsCanBeFriend(arg_3_0.userID) then
			FriendsAction:TryToRequestToFriend(arg_3_0.userID, FriendConst.ADD_FRIEND_SOURCE.FIREND_VIEW)
		end
	end)
	arg_3_0:AddBtnListener(arg_3_0.requestAcceptBtn_, nil, function()
		FriendsAction:TryToDealRequest(arg_3_0.userID, 1)
	end)
	arg_3_0:AddBtnListener(arg_3_0.requestIgnoreBtn_, nil, function()
		FriendsAction:TryToDealRequest(arg_3_0.userID, 2)
	end)
	arg_3_0:AddBtnListener(arg_3_0.shiftoutBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("BLACKLIST_REMOVE_QUEST"), arg_3_0.data_.nick),
			OkCallback = function()
				FriendsAction:TryToDelectFromBlackList(arg_3_0.userID, 2)
			end
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.reportBtn_, nil, function()
		JumpTools.OpenPageByJump("chatReport", {
			reportType = ChatConst.CHAT_REPORT_TYPE.USER,
			reportData = {
				nick = arg_3_0.data_.nick,
				userID = arg_3_0.data_.user_id
			}
		}, ViewConst.SYSTEM_ID.CHAT_REPORT)
	end)
	arg_3_0:AddBtnListener(arg_3_0.copyBtn_, nil, function()
		UnityEngine.GUIUtility.systemCopyBuffer = arg_3_0.userID

		ShowTips("COPY_SUCCESS")
	end)
end

function var_0_0.OnEnter(arg_13_0)
	arg_13_0.data_ = {}
end

function var_0_0.RefreshUI(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_1 == nil then
		return
	end

	arg_14_0.data_ = arg_14_1
	arg_14_0.curType_ = arg_14_2

	arg_14_0.typeCon_:SetSelectedState(arg_14_0.curType_)

	arg_14_0.userID = arg_14_1.user_id
	arg_14_0.idTxt_.text = arg_14_1.user_id
	arg_14_0.nameText_.text = GetI18NText(arg_14_1.nick)
	arg_14_0.headIcon_.sprite = ItemTools.getItemSprite(arg_14_1.icon)

	arg_14_0.headIcon_:SetNativeSize()

	arg_14_0.data_.icon_frame = arg_14_0.data_.icon_frame ~= 0 and arg_14_0.data_.icon_frame or 2001
	arg_14_0.frameIcon_.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. arg_14_0.data_.icon_frame)
	arg_14_0.bg_.sprite = getSpriteWithoutAtlas("TextureConfig/Friends/" .. arg_14_0.data_.bg .. "_s")

	if arg_14_0.curType_ ~= arg_14_0.friendType_.friendsRequest and arg_14_0.curType_ ~= arg_14_0.friendType_.blackList then
		local var_14_0 = arg_14_1.online_state or -1

		if var_14_0 == 0 then
			arg_14_0.stateCon_:SetSelectedState("on")

			arg_14_0.offlineText_.text = GetTips("ONLINE")
		else
			local var_14_1 = manager.time:GetServerTime() - var_14_0

			if var_14_1 < 3600 then
				arg_14_0.offlineText_.text = GetTips("FRIEND_ONLINE_TIME_WITHIN_AN_HOUR")
			elseif var_14_1 < 86400 then
				arg_14_0.offlineText_.text = GetTips("FRIEND_ONLINE_TIME_IN_ONE_DAY")
			elseif var_14_1 < 2592000 then
				local var_14_2 = var_14_1 / 86400

				arg_14_0.offlineText_.text = string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), math.floor(var_14_2))
			else
				arg_14_0.offlineText_.text = string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), 30)
			end

			arg_14_0.stateCon_:SetSelectedState("off")
		end
	end

	if arg_14_0.curType_ == arg_14_0.friendType_.myFriends then
		arg_14_0.textLimit_:SetText(arg_14_1.sign)
	elseif arg_14_0.curType_ == arg_14_0.friendType_.newFriends or arg_14_0.curType_ == arg_14_0.friendType_.search then
		arg_14_0.newFriendsSign_.text = GetI18NText(arg_14_1.sign)

		arg_14_0.newFriendCon_:SetSelectedState(arg_14_1.isDeal and 1 or 0)
	elseif arg_14_0.curType_ == arg_14_0.friendType_.friendsRequest then
		arg_14_0.friendsRequestSign_.text = GetI18NText(arg_14_1.sign)
	elseif arg_14_0.curType_ == arg_14_0.friendType_.blackList then
		-- block empty
	else
		print("未确认类型")
	end
end

function var_0_0.OnExit(arg_15_0)
	return
end

function var_0_0.Dispose(arg_16_0)
	arg_16_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_16_0)
end

return var_0_0
