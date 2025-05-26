local var_0_0 = class("MailBoxView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Mail/MailUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	arg_3_0.letterContentItems_ = {}
	arg_3_0.letterContentClass_ = {
		MailImageItemView,
		MailTextItemView,
		MailRewardItemView,
		MailTitleItemView
	}
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.letterTemplate_ = {
		arg_4_0.imageTemplate_,
		arg_4_0.textTemplate_,
		arg_4_0.rewardTemplate_,
		arg_4_0.titleTemplate_
	}
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.letterUiList_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexLetterItem), arg_5_0.mailListGo_, MailBoxListItem)
	arg_5_0.rewardUiList_ = LuaList.New(handler(arg_5_0, arg_5_0.IndexRewardItem), arg_5_0.rewardListGo_, MailBoxRewardItem)
	arg_5_0.allReceiveCon_ = arg_5_0.conExCollection_:GetController("Receive_All")
	arg_5_0.emptyController_ = arg_5_0.conExCollection_:GetController("empty")
	arg_5_0.rewardController_ = arg_5_0.conExCollection_:GetController("reward")
	arg_5_0.starController_ = ControllerUtil.GetController(arg_5_0.starBtn_.transform, "star")
	arg_5_0.modeController_ = arg_5_0.conExCollection_:GetController("mode")
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.delBtn_, nil, function()
		if MailData.GetTotal() <= MailData.GetUnread() then
			ShowTips("NO_MAIL_CAN_BE_DELETED")

			return
		end

		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("MAIL_DELETE_CONFIRM"),
			SecondTip = GetTips("MAIL_DELETE_CONFIRM_NOTICE"),
			OkCallback = function()
				MailAction.TryToDeteleMail(0)
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.letterBtn_, nil, function()
		JumpTools.GoToSystem("/letterBox")
	end)
	arg_6_0:AddBtnListener(arg_6_0.allReceiveBtn_, nil, function()
		if MailData.GetTotal() == 0 then
			ShowTips("ERROR_NO_MAIL_CAN_RECEIVE")

			return
		end

		MailAction.ReceiveAllMails()
	end)
	arg_6_0:AddBtnListener(arg_6_0.receiveBtn_, nil, function()
		if MailData.GetMail(arg_6_0.curMailId_).attach_flag == 2 then
			return
		end

		arg_6_0:OnClickReceiveBtn()
	end)
	arg_6_0:AddBtnListener(arg_6_0.removeBtn_, nil, function()
		if MailData.GetMail(arg_6_0.curMailId_).attach_flag == 1 then
			return
		end

		arg_6_0:OnClickDeleteBtn()
	end)
	arg_6_0:AddBtnListener(arg_6_0.starBtn_, nil, function()
		local var_14_0 = MailData.GetMail(arg_6_0.curMailId_).star_state

		MailAction.SetMailStar(arg_6_0.curMailId_, var_14_0 == 1 and 0 or 1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.dlcBtn_, nil, function()
		arg_6_0:OnClickGotoPurchase()
	end)
end

function var_0_0.AddEventListener(arg_16_0)
	arg_16_0:RegistEventListener(MAIL_BRIEF_UPDATE, handler(arg_16_0, arg_16_0.OnBriefUpdate))
	arg_16_0:RegistEventListener(MAIL_LIST_UPDATE, handler(arg_16_0, arg_16_0.OnMailListUpdate))
	arg_16_0:RegistEventListener(MAIL_INFO_UPDATE, handler(arg_16_0, arg_16_0.OnMailInfoUpdate))
	arg_16_0:RegistEventListener(MAIL_STAR_UPDATE, handler(arg_16_0, arg_16_0.OnMailStarUpdate))
end

function var_0_0.IndexRewardItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = MailData.GetMail(arg_17_0.curMailId_)

	arg_17_2:SetRewardData(var_17_0.rewardList[arg_17_1], var_17_0.attach_flag == 2)
end

function var_0_0.IndexLetterItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:GetMailSortedList()[arg_18_1]
	local var_18_1 = MailData.GetMail(var_18_0)

	arg_18_2:SetMailData(var_18_1)
	arg_18_2:SetClickHandler(function()
		arg_18_0:OnClickLetter(arg_18_1, arg_18_2)
	end)

	if arg_18_0.curMailId_ then
		if arg_18_0.curMailId_ == var_18_0 then
			arg_18_2:SetSelected(true)
		else
			arg_18_2:SetSelected(false)
		end
	elseif arg_18_1 == 1 then
		arg_18_0:SelectItem(1)
	end

	arg_18_2:UpdateView()
end

function var_0_0.OnEnter(arg_20_0)
	MailAction.SortMailManual()
	arg_20_0:AddEventListener()
	manager.redPoint:bindUIandKey(arg_20_0.letterTrans_, RedPointConst.LETTER_UNREAD)
	arg_20_0:RefreshUI()
	arg_20_0:StartTimer()
end

function var_0_0.OnTop(arg_21_0)
	arg_21_0:ShowDefaultBar()
end

function var_0_0.OnExit(arg_22_0)
	manager.windowBar:HideBar()
	arg_22_0:RemoveAllEventListener()
	arg_22_0:RemoveTimer()
	manager.redPoint:unbindUIandKey(arg_22_0.letterTrans_)
	arg_22_0:SelectItem(nil)
end

function var_0_0.RefreshUI(arg_23_0)
	arg_23_0:UpdateList(true)
	arg_23_0:RefreshLeftUI()
end

function var_0_0.OnMailInfoUpdate(arg_24_0, arg_24_1)
	if arg_24_0.curMailId_ ~= nil and arg_24_1.id == arg_24_0.curMailId_ then
		arg_24_0:RefreshLetterUI(arg_24_1.id, true)
	end
end

function var_0_0.OnMailStarUpdate(arg_25_0, arg_25_1)
	if arg_25_1.id == arg_25_0.curMailId_ then
		arg_25_0:RefreshStarUI()

		if arg_25_1.star_state == 1 then
			arg_25_0:UpdateList(false)
		end
	end
end

function var_0_0.OnBriefUpdate(arg_26_0)
	arg_26_0:RefreshLeftUI()
end

function var_0_0.OnMailListUpdate(arg_27_0)
	MailData.GetMailListFromServer(handler(arg_27_0, function()
		MailAction.SortMailManual()
		arg_27_0:UpdateList()
		arg_27_0:RefreshLeftUI()
	end))
end

function var_0_0.DeleteCurrentMail(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1 or arg_29_0.curMailId_

	if var_29_0 == nil then
		return
	end

	if table.indexof(arg_29_0:GetMailSortedList(), var_29_0) == false then
		return
	end

	MailAction.DeleteOneMail(var_29_0)
end

function var_0_0.SelectItem(arg_30_0, arg_30_1)
	if arg_30_1 == nil then
		arg_30_0.curIndex_ = nil
		arg_30_0.curMailId_ = nil

		if arg_30_0.curLetterItem_ then
			arg_30_0.curLetterItem_:SetSelected(false)
			arg_30_0.curLetterItem_:UpdateView()

			arg_30_0.curLetterItem_ = nil
		end

		return
	end

	local var_30_0 = arg_30_0:GetMailSortedList()[arg_30_1]

	if var_30_0 == 0 then
		return
	end

	if arg_30_0.curLetterItem_ then
		arg_30_0.curLetterItem_:SetSelected(false)
		arg_30_0.curLetterItem_:UpdateView()
	end

	local var_30_1 = arg_30_0.letterUiList_:GetItemByIndex(arg_30_1)

	arg_30_0.curIndex_ = arg_30_1
	arg_30_0.curMailId_ = var_30_0
	arg_30_0.curLetterItem_ = var_30_1

	var_30_1:SetSelected(true)
	MailAction.ReadMail(var_30_0)
	arg_30_0:RefreshLetterUI(var_30_0)
end

function var_0_0.OnClickLetter(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0:SelectItem(arg_31_1)
end

function var_0_0.OnClickDeleteBtn(arg_32_0)
	local var_32_0 = arg_32_0.curMailId_

	if var_32_0 ~= nil and var_32_0 ~= 0 then
		if MailData.GetMail(var_32_0).star_state == 1 then
			ShowMessageBox({
				isTop = true,
				title = GetTips("PROMPT"),
				content = string.format(GetTips("MAIL_STAR_DELETE_TIP")),
				OkCallback = function()
					arg_32_0:DeleteCurrentMail(var_32_0)
				end,
				CancelCallback = function()
					return
				end
			})
		else
			arg_32_0:DeleteCurrentMail()
		end
	end
end

function var_0_0.OnClickReceiveBtn(arg_35_0)
	MailAction.TryToGetMailAttachment(arg_35_0.curMailId_)
end

function var_0_0.OnClickGotoPurchase(arg_36_0)
	local var_36_0 = MailData.GetMail(arg_36_0.curMailId_)

	if var_36_0 and MailTools.CheckIsPurchaseTemplate(var_36_0.mail_template_id) then
		if var_36_0.mail_template_id == MailConst.MAIL_ID_CONST.SKIN_DLC_EXPIRE and var_36_0.link_param[1] and var_36_0.link_param[2] and var_36_0.link_param[3] then
			ShopTools.JumpToSkinShop(var_36_0.link_param[2], true, var_36_0.link_param[1], var_36_0.link_param[3])
		elseif var_36_0.mail_template_id == MailConst.MAIL_ID_CONST.SKIN_EXPIRE and var_36_0.link_param[1] then
			ShopTools.JumpToSkinShop(var_36_0.link_param[1], false)
		end
	end
end

function var_0_0.RefreshLetterUI(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = MailData.GetMail(arg_37_1)
	local var_37_1 = MailData.GetMailTitle(arg_37_1)
	local var_37_2 = GameSetting.admin_mail_title_max_len.value[1]

	arg_37_0.titleText_.text = utf8.sub(var_37_1, 1, var_37_2 + 1)
	arg_37_0.dateText_.text = manager.time:STimeDescS(var_37_0.date, "!%Y-%m-%d")

	if not arg_37_2 then
		SetActive(arg_37_0.itemParent_.gameObject, false)
		MailData.TryToGetMailDetail(var_37_0.id, handler(arg_37_0, function()
			arg_37_0:UpdateMailContentView(var_37_0)
			TimeTools.StartAfterSeconds(0.1, function()
				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_0.itemParent_.transform)
				SetActive(arg_37_0.itemParent_.gameObject, true)
			end, {})
		end))
	else
		SetActive(arg_37_0.itemParent_.gameObject, true)
	end

	arg_37_0.rewardUiList_:StartScroll(#var_37_0.rewardList)
	arg_37_0:RenderRewardState(var_37_0)
end

function var_0_0.RenderRewardState(arg_40_0, arg_40_1)
	if MailTools.CheckIsPurchaseTemplate(arg_40_1.mail_template_id) then
		arg_40_0.rewardController_:SetSelectedState("dlc")
		arg_40_0.modeController_:SetSelectedState("delete")

		return
	end

	if arg_40_1.attach_flag == 0 then
		arg_40_0.rewardController_:SetSelectedState("false")
		arg_40_0.modeController_:SetSelectedState("delete")
	elseif arg_40_1.attach_flag == 2 then
		arg_40_0.rewardController_:SetSelectedState("true")
		arg_40_0.modeController_:SetSelectedState("delete")
	else
		arg_40_0.rewardController_:SetSelectedState("true")
		arg_40_0.modeController_:SetSelectedState("reward")
	end
end

function var_0_0.RefreshStarUI(arg_41_0)
	if MailData.GetMail(arg_41_0.curMailId_).star_state == 1 then
		arg_41_0.starController_:SetSelectedState("true")
	else
		arg_41_0.starController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshLeftUI(arg_42_0)
	local var_42_0 = GameSetting.max_mail_count.value[1]

	arg_42_0.mailNumText_.text = string.format("%d/%d", MailData.GetTotal(), var_42_0)

	arg_42_0:RefreshAllReceiveUI()
end

function var_0_0.RefreshCountdownUI(arg_43_0)
	for iter_43_0, iter_43_1 in pairs(arg_43_0.letterUiList_:GetItemList()) do
		if iter_43_1 then
			iter_43_1:UpdateCountdown()
		end
	end
end

function var_0_0.RefreshAllReceiveUI(arg_44_0)
	local var_44_0 = arg_44_0:GetMailSortedList()
	local var_44_1 = false

	for iter_44_0, iter_44_1 in pairs(var_44_0) do
		local var_44_2 = MailData.GetMail(iter_44_1)

		if var_44_2 and var_44_2.attach_flag == 1 then
			var_44_1 = true

			break
		end
	end

	arg_44_0.allReceiveCon_:SetSelectedState(var_44_1 and "true" or "false")
end

function var_0_0.UpdateMailContentView(arg_45_0, arg_45_1)
	arg_45_0.senderText_.text = MailData.GetMailSender(arg_45_1.id)

	arg_45_0:RefreshStarUI()
	arg_45_0:ClearLetterContent()

	local var_45_0 = MailData.GetMailContent(arg_45_1.id)

	for iter_45_0, iter_45_1 in ipairs(var_45_0) do
		arg_45_0:CreateContent(iter_45_1)
	end
end

function var_0_0.CreateContent(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.content_type
	local var_46_1 = arg_46_0.letterContentClass_[var_46_0]
	local var_46_2 = arg_46_0.letterTemplate_[var_46_0]
	local var_46_3 = Object.Instantiate(var_46_2, arg_46_0.itemParent_.transform)
	local var_46_4 = var_46_1.New(var_46_3)

	var_46_4:SetData(arg_46_1)
	table.insert(arg_46_0.letterContentItems_, var_46_4)
end

function var_0_0.UpdateList(arg_47_0, arg_47_1)
	local var_47_0 = MailData.GetTotal()

	arg_47_0.emptyController_:SetSelectedState(var_47_0 <= 0 and "true" or "false")

	if var_47_0 <= 0 then
		arg_47_0.letterUiList_:StartScroll(0)
		arg_47_0:SelectItem(nil)
	else
		local var_47_1 = arg_47_0:GetMailSortedList()

		if arg_47_0.curMailId_ then
			local var_47_2 = table.indexof(var_47_1, arg_47_0.curMailId_)

			if var_47_2 then
				arg_47_0.curIndex_ = var_47_2
			else
				arg_47_0.curIndex_ = math.min(arg_47_0.curIndex_, #var_47_1)
			end

			arg_47_0.letterUiList_:StartScroll(#var_47_1, arg_47_0.curIndex_, not arg_47_1)
			arg_47_0:SelectItem(arg_47_0.curIndex_)
		else
			arg_47_0.letterUiList_:StartScroll(#var_47_1)
		end
	end
end

function var_0_0.StartTimer(arg_48_0)
	if not arg_48_0.timer_ then
		arg_48_0.timer_ = Timer.New(function()
			local var_49_0 = MailData.GetTimeoutMailIdList()

			if #var_49_0 > 0 then
				MailData.DeleteMail(var_49_0)
				ShowTips("MAIL_EXPIRED")
			end

			arg_48_0:RefreshCountdownUI()
		end, 1, -1)
	end

	arg_48_0.timer_:Start()
end

function var_0_0.RemoveTimer(arg_50_0)
	if arg_50_0.timer_ then
		arg_50_0.timer_:Stop()

		arg_50_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_51_0)
	if arg_51_0.letterUiList_ then
		arg_51_0.letterUiList_:Dispose()

		arg_51_0.letterUiList_ = nil
	end

	if arg_51_0.rewardUiList_ then
		arg_51_0.rewardUiList_:Dispose()

		arg_51_0.rewardUiList_ = nil
	end

	arg_51_0:ClearLetterContent()

	arg_51_0.letterContentItems_ = nil

	manager.classPool:DisposeOnePool(MailBoxListItem)
	var_0_0.super.Dispose(arg_51_0)
end

function var_0_0.ClearLetterContent(arg_52_0)
	for iter_52_0 = #arg_52_0.letterContentItems_, 1, -1 do
		arg_52_0.letterContentItems_[iter_52_0]:Dispose()

		arg_52_0.letterContentItems_[iter_52_0] = nil
	end
end

function var_0_0.GetMailSortedList(arg_53_0)
	return MailData.GetMailSort()
end

return var_0_0
