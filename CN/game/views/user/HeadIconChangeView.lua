local var_0_0 = class("HeadIconChangeView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/UserInfor/AvatarSystemUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.page_ = {
		"portrait",
		"frame",
		"cardBg",
		"chatBubble"
	}
	arg_4_0.lockCon_ = ControllerUtil.GetController(arg_4_0.transform_, "lock")
	arg_4_0.pageCon_ = ControllerUtil.GetController(arg_4_0.transform_, "page")
	arg_4_0.btnCon_1 = arg_4_0.btn_1.transform:GetComponent("ControllerExCollection"):GetController("status")
	arg_4_0.btnCon_2 = arg_4_0.btn_2.transform:GetComponent("ControllerExCollection"):GetController("status")
	arg_4_0.btnCon_3 = arg_4_0.btn_3.transform:GetComponent("ControllerExCollection"):GetController("status")
	arg_4_0.btnCon_4 = arg_4_0.btn_4.transform:GetComponent("ControllerExCollection"):GetController("status")
	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, UserHeadItem)
	arg_4_0.portraitModule = CommonHeadPortrait.New(arg_4_0.portraitObj_)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.curList_[arg_5_1].id
	local var_5_1 = arg_5_0:IsUsed(var_5_0)

	arg_5_2:SetUsed(var_5_1)
	arg_5_2:SetSelected(arg_5_0.curID_ == var_5_0)
	arg_5_2:RefreshItem(var_5_0, arg_5_0.curPage_)
	arg_5_2:RegisterClickListener(function()
		arg_5_0:SetCurID(var_5_0)

		if arg_5_0.curPage_ == "chatBubble" and not RedPointData:GetIsRedPointOpen(RedPointConst.CHAT_BUBBLE_RANGE + var_5_0) and table.keyof(PlayerData:GetUnlockChatBubbleIDList(), var_5_0) then
			RedPointAction.HandleRedPoint(RedPointConst.CHAT_BUBBLE_RANGE + var_5_0)
			manager.redPoint:setTip(string.format("%s_%s", RedPointConst.CHAT_BUBBLE, var_5_0), 0)
		end

		arg_5_0.scrollHelper_:Refresh()
	end)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.useBtn_, nil, function()
		if arg_7_0.curPage_ == "portrait" then
			PlayerAction.ChangePortrait(arg_7_0.curID_)
		elseif arg_7_0.curPage_ == "frame" then
			PlayerAction.ChangeFrameIcon(arg_7_0.curID_)
		elseif arg_7_0.curPage_ == "cardBg" then
			PlayerAction.ChangeCardBg(arg_7_0.curID_)
		elseif arg_7_0.curPage_ == "chatBubble" then
			PlayerAction.ChangeChatBubble(arg_7_0.curID_, function()
				ShowTips("DORM_CANTEEN_HERO_CHANGE_SUCCESS")

				arg_7_0.chatBubbleID_ = PlayerData:GetCurChatBubbleID()

				arg_7_0:SetCurID(arg_7_0.curID_)
				arg_7_0.scrollHelper_:Refresh()
			end)
		end
	end)
	arg_7_0:AddBtnListener(arg_7_0.bgBtn_, nil, function()
		arg_7_0:Back()
	end)
	arg_7_0:AddBtnListener(arg_7_0.previewBtn_, nil, function()
		if arg_7_0.curPage_ == "cardBg" then
			JumpTools.OpenPageByJump("/newUserInfoPreviewPop", {
				previewID = arg_7_0.curID_
			})
		end
	end)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.page_) do
		arg_7_0:AddBtnListener(arg_7_0["btn_" .. iter_7_0], nil, function()
			arg_7_0.index_ = iter_7_0
			arg_7_0.curPage_ = arg_7_0.page_[iter_7_0]

			if arg_7_0.curPage_ == "portrait" then
				arg_7_0:SetCurID(arg_7_0.portraitID_)
			elseif arg_7_0.curPage_ == "frame" then
				arg_7_0:SetCurID(arg_7_0.frameID_)
			elseif arg_7_0.curPage_ == "cardBg" then
				arg_7_0:SetCurID(arg_7_0.cardBgID_)
			elseif arg_7_0.curPage_ == "chatBubble" then
				arg_7_0:SetCurID(arg_7_0.chatBubbleID_)
			end

			arg_7_0:ChangeBtnController(iter_7_0)
			OperationRecorder.RecordButtonTouch("userinfo_headportrait_" .. arg_7_0.index_)
			arg_7_0.scrollHelper_:StartScroll(#arg_7_0.curList_)
		end)
	end
end

function var_0_0.ChangeBtnController(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.page_) do
		arg_13_0["btnCon_" .. iter_13_0]:SetSelectedIndex(iter_13_0 == arg_13_1 and 1 or 0)
	end
end

function var_0_0.OnEnter(arg_14_0)
	arg_14_0.curList_ = {}

	if arg_14_0.params_.isEnter then
		arg_14_0.index_ = 1
		arg_14_0.params_.isEnter = nil
	end

	arg_14_0.index_ = arg_14_0.index_ or 1
	arg_14_0.curPage_ = arg_14_0.page_[arg_14_0.index_]

	arg_14_0:ChangeBtnController(arg_14_0.index_)
	arg_14_0:RefreshUI()

	if arg_14_0.curPage_ == "portrait" then
		arg_14_0:SetCurID(arg_14_0.portraitID_)
	elseif arg_14_0.curPage_ == "frame" then
		arg_14_0:SetCurID(arg_14_0.frameID_)
	elseif arg_14_0.curPage_ == "cardBg" then
		arg_14_0:SetCurID(arg_14_0.cardBgID_)
	elseif arg_14_0.curPage_ == "chatBubble" then
		arg_14_0:SetCurID(arg_14_0.chatBubbleID_)
	end

	arg_14_0.scrollHelper_:StartScroll(#arg_14_0.curList_)
	arg_14_0:BindRedPoint()
end

function var_0_0.RefreshUI(arg_15_0)
	arg_15_0:RefreshData()
	arg_15_0:RefreshCurID()
end

function var_0_0.RefreshData(arg_16_0)
	arg_16_0:GetPortraitList()
	arg_16_0:GetFrameList()
	arg_16_0:GetCardBgList()
	arg_16_0:GetChatBubbleList()
end

function var_0_0.RefreshCurID(arg_17_0)
	arg_17_0.portraitID_ = PlayerData:GetCurPortrait()
	arg_17_0.frameID_ = PlayerData:GetCurFrame()
	arg_17_0.cardBgID_ = PlayerData:GetCurCardBg()
	arg_17_0.chatBubbleID_ = PlayerData:GetCurChatBubbleID()
end

function var_0_0.SetCurID(arg_18_0, arg_18_1)
	arg_18_0.curID_ = arg_18_1

	arg_18_0.pageCon_:SetSelectedState(arg_18_0.curPage_)

	local var_18_0 = arg_18_0:IsUsed(arg_18_0.curID_)

	if arg_18_0.curPage_ ~= "chatBubble" then
		arg_18_0.portraitModule:RenderHead(arg_18_0.curPage_ == "portrait" and arg_18_0.curID_ or arg_18_0.portraitID_)

		local var_18_1 = arg_18_0.curPage_ == "frame" and arg_18_0.curID_ or arg_18_0.frameID_

		arg_18_0.portraitModule:RenderFrame(var_18_1)

		arg_18_0.cardBgIcon_.sprite = ItemTools.getItemSprite(arg_18_0.curPage_ == "cardBg" and arg_18_0.curID_ or arg_18_0.cardBgID_)

		arg_18_0.cardBgIcon_:SetNativeSize()
	else
		local var_18_2 = arg_18_0.curPage_ == "chatBubble" and arg_18_0.curID_ or arg_18_0.chatBubbleID_

		arg_18_0.chatBubbleImg_.sprite = ItemTools.getItemSprite(var_18_2)

		local var_18_3 = ChatBubbleCfg[var_18_2].color1

		arg_18_0.chatBubbleTxt_.color = LuaHelper.StringToColor("#" .. var_18_3)
	end

	arg_18_0.itemCfg_ = ItemCfg[arg_18_0.curID_]
	arg_18_0.nameTxt_.text = ItemTools.getItemName(arg_18_0.itemCfg_.id)
	arg_18_0.descTxt_.text = ItemTools.getItemDesc(arg_18_0.itemCfg_.id)
	arg_18_0.wayTxt_.text = GetI18NText(arg_18_0.itemCfg_.desc_source) or ""

	local var_18_4

	if arg_18_0.curPage_ == "portrait" then
		arg_18_0.curList_ = arg_18_0.portraitList_
		var_18_4 = PlayerData:GetPortrait(arg_18_0.curID_)
	elseif arg_18_0.curPage_ == "frame" then
		arg_18_0.curList_ = arg_18_0.frameList_
		var_18_4 = PlayerData:GetFrame(arg_18_0.curID_)

		PlayerData:DealOverdueFrame()
	elseif arg_18_0.curPage_ == "cardBg" then
		arg_18_0.curList_ = arg_18_0.cardBgList_
		var_18_4 = PlayerData:GetCardBg(arg_18_0.curID_)

		PlayerData:DealOverdueCardBgList()
		PlayerData:ClearCardBgRed()
	elseif arg_18_0.curPage_ == "chatBubble" then
		arg_18_0.curList_ = arg_18_0.chatBubbleList_
		var_18_4 = {
			unlock = table.keyof(PlayerData:GetUnlockChatBubbleIDList(), arg_18_0.curID_) and 1 or 0
		}
	end

	if var_18_4.lasted_time and var_18_4.lasted_time > 0 then
		arg_18_0.timeCntText_.text = manager.time:STimeDescS(var_18_4.lasted_time, "!%Y/%m/%d %H:%M")

		SetActive(arg_18_0.timeCntGo_, true)
	else
		SetActive(arg_18_0.timeCntGo_, false)
	end

	arg_18_0.lockCon_:SetSelectedState(var_18_4.unlock == 0 and "lock" or "default")

	if var_18_0 then
		arg_18_0.useBtn_.interactable = false

		arg_18_0.lockCon_:SetSelectedState("value_2")
	else
		arg_18_0.useBtn_.interactable = true
		arg_18_0.btnTxt_.text = GetTips("TIP_USE")
	end
end

function var_0_0.GetPortraitList(arg_19_0)
	arg_19_0.portraitList_ = {}

	local var_19_0 = PlayerData:GetPortraitList()
	local var_19_1 = HideInfoData:GetHeadIconHideList()

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		if not var_19_1[iter_19_1] then
			table.insert(arg_19_0.portraitList_, PlayerData:GetPortrait(iter_19_1))
		end
	end

	table.sort(arg_19_0.portraitList_, function(arg_20_0, arg_20_1)
		if arg_20_0.unlock ~= arg_20_1.unlock then
			return arg_20_0.unlock > arg_20_1.unlock
		end

		return arg_20_0.id < arg_20_1.id
	end)
end

function var_0_0.GetFrameList(arg_21_0)
	arg_21_0.frameList_ = {}

	local var_21_0 = PlayerData:GetFrameList()

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		local var_21_1 = ItemCfg[iter_21_1]
		local var_21_2 = PlayerData:GetFrame(iter_21_1)

		if var_21_1.sub_type ~= ItemConst.ITEM_SUB_TYPE.FRAME_LINK then
			table.insert(arg_21_0.frameList_, var_21_2)
		elseif var_21_2.unlock == 1 or var_21_2.lasted_time > 0 then
			table.insert(arg_21_0.frameList_, var_21_2)
		end
	end

	table.sort(arg_21_0.frameList_, function(arg_22_0, arg_22_1)
		if arg_22_0.unlock ~= arg_22_1.unlock then
			return arg_22_0.unlock > arg_22_1.unlock
		end

		return arg_22_0.id < arg_22_1.id
	end)
end

function var_0_0.GetCardBgList(arg_23_0)
	arg_23_0.cardBgList_ = {}

	local var_23_0 = PlayerData:GetCardBgList()

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		local var_23_1 = ItemCfg[iter_23_1]
		local var_23_2 = PlayerData:GetCardBg(iter_23_1)

		if var_23_1.sub_type ~= ItemConst.ITEM_SUB_TYPE.CARD_BG_LIMIT then
			table.insert(arg_23_0.cardBgList_, var_23_2)
		elseif var_23_2.unlock == 1 or var_23_2.lasted_time > 0 then
			table.insert(arg_23_0.cardBgList_, var_23_2)
		end
	end

	table.sort(arg_23_0.cardBgList_, function(arg_24_0, arg_24_1)
		if arg_24_0.unlock ~= arg_24_1.unlock then
			return arg_24_0.unlock > arg_24_1.unlock
		end

		return arg_24_0.id < arg_24_1.id
	end)
end

function var_0_0.GetChatBubbleList(arg_25_0)
	local var_25_0 = clone(ItemCfg.get_id_list_by_type[ItemConst.ITEM_TYPE.CHAT_BUBBLE])
	local var_25_1 = PlayerData:GetUnlockChatBubbleIDList()

	table.sort(var_25_0, function(arg_26_0, arg_26_1)
		local var_26_0 = table.keyof(var_25_1, arg_26_0)
		local var_26_1 = table.keyof(var_25_1, arg_26_1)

		if var_26_0 and var_26_1 then
			return arg_26_0 < arg_26_1
		elseif var_26_0 then
			return true
		elseif var_26_1 then
			return false
		else
			return arg_26_0 < arg_26_1
		end
	end)

	arg_25_0.chatBubbleList_ = {}

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if ItemCfg[iter_25_1].sub_type ~= ItemConst.ITEM_SUB_TYPE.CHAT_BUBBLE_LIMIT then
			table.insert(arg_25_0.chatBubbleList_, {
				id = iter_25_1
			})
		end
	end
end

function var_0_0.IsUsed(arg_27_0, arg_27_1)
	return arg_27_1 == arg_27_0.portraitID_ or arg_27_1 == arg_27_0.frameID_ or arg_27_1 == arg_27_0.cardBgID_ or arg_27_1 == arg_27_0.chatBubbleID_
end

function var_0_0.OnChangePortrait(arg_28_0)
	arg_28_0:RefreshCurID()
	arg_28_0:SetCurID(arg_28_0.curID_)
	arg_28_0.scrollHelper_:Refresh()
end

function var_0_0.OnChangeFrame(arg_29_0)
	arg_29_0:RefreshCurID()
	arg_29_0:SetCurID(arg_29_0.curID_)
	arg_29_0.scrollHelper_:Refresh()
end

function var_0_0.OnChangeCardBg(arg_30_0)
	arg_30_0:RefreshCurID()
	arg_30_0:SetCurID(arg_30_0.curID_)
	arg_30_0.scrollHelper_:Refresh()
end

function var_0_0.BindRedPoint(arg_31_0)
	manager.redPoint:bindUIandKey(arg_31_0.btn_3.transform, RedPointConst.CARD_BG)
	manager.redPoint:bindUIandKey(arg_31_0.btn_4.transform, RedPointConst.CHAT_BUBBLE)
end

function var_0_0.UnbindRedPoint(arg_32_0)
	manager.redPoint:unbindUIandKey(arg_32_0.btn_3.transform, RedPointConst.CARD_BG)
	manager.redPoint:unbindUIandKey(arg_32_0.btn_4.transform, RedPointConst.CHAT_BUBBLE)
end

function var_0_0.OnExit(arg_33_0)
	arg_33_0:UnbindRedPoint()

	for iter_33_0, iter_33_1 in pairs(arg_33_0.scrollHelper_:GetItemList()) do
		iter_33_1:OnExit()
	end
end

function var_0_0.Dispose(arg_34_0)
	arg_34_0:RemoveAllListeners()
	arg_34_0.portraitModule:Dispose()

	for iter_34_0, iter_34_1 in pairs(arg_34_0.scrollHelper_:GetItemList()) do
		iter_34_1:Dispose()
	end

	arg_34_0.scrollHelper_:Dispose()
	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
