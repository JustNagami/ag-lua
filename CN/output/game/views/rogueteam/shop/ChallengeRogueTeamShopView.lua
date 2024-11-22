local var_0_0 = class("ChallengeRogueTeamShopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Activity_Roulike/RoulikeTreasureshopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.treasureItemList_ = {}
	arg_3_0.relicItemList_ = {}
	arg_3_0.onBuyItemSuccessHandler_ = handler(arg_3_0, arg_3_0.OnBuyItemSuccess)
	arg_3_0.updateOperateHandler_ = handler(arg_3_0, arg_3_0.OnUpdateOperate)
	arg_3_0.onWindowUpdateHandler_ = handler(arg_3_0, arg_3_0.OnWindowUpdate)
	arg_3_0.onSelectedItemHandler_ = handler(arg_3_0, arg_3_0.OnSelectedItem)
	arg_3_0.rogueTeamSureBtnView_ = ChallengeRogueTeamButton.New(arg_3_0.sureBtnGo_, handler(arg_3_0, arg_3_0.OnClickBtn))
	arg_3_0.itemPopView_ = ChallengeRogueTeamShopPopItemView.New(arg_3_0.shopPopItemGo_)
	arg_3_0.popControllerEx_ = arg_3_0.controllerEx_:GetController("pop")
	arg_3_0.camcelControllerEx_ = arg_3_0.controllerEx_:GetController("cancel")
	arg_3_0.expressionController_ = arg_3_0.expressionControllerEx_:GetController("face")
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	ChallengeRogueTeamTools.RegistWindowBarClick()
	ChallengeRogueTeamTools.ShowBarList()
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_BUY_SUCCESS, arg_4_0.onBuyItemSuccessHandler_)
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_UPDATE_OPERATE_WINDOW, arg_4_0.updateOperateHandler_)
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW, arg_4_0.onWindowUpdateHandler_)
	manager.notify:RegistListener(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_SELECTED, arg_4_0.onSelectedItemHandler_)
	arg_4_0:RefreshItemList()

	if arg_4_0.params_.isBack ~= true then
		arg_4_0:RefrshShopText(ChallengeRogueTeamConst.SHOP_TEXT_TYPE.WELCOM)
	end

	arg_4_0.confirmExitFlag_ = false
	arg_4_0.selectItemData_ = nil
	arg_4_0.popFlag_ = false

	arg_4_0:RefreshPopWindow()
	arg_4_0:RefreshBGM()
end

function var_0_0.OnExit(arg_5_0)
	manager.windowBar:HideBar()
	ChallengeRogueTeamTools.HideBarList()
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_BUY_SUCCESS, arg_5_0.onBuyItemSuccessHandler_)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_UPDATE_OPERATE_WINDOW, arg_5_0.updateOperateHandler_)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_UPDATE_WINDOW, arg_5_0.onWindowUpdateHandler_)
	manager.notify:RemoveListener(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_SELECTED, arg_5_0.onSelectedItemHandler_)
end

function var_0_0.OnTop(arg_6_0)
	manager.rogueTeamMapPreviewBtnBar:ShowState(ChallengeRogueTeamConst.MAP_BTN_WINDOW.OTHER)
end

function var_0_0.Dispose(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.treasureItemList_) do
		iter_7_1:Dispose()
	end

	arg_7_0.treasureItemList_ = nil

	for iter_7_2, iter_7_3 in ipairs(arg_7_0.relicItemList_) do
		iter_7_3:Dispose()
	end

	arg_7_0.relicItemList_ = nil

	arg_7_0.rogueTeamSureBtnView_:Dispose()

	arg_7_0.rogueTeamSureBtnView_ = nil

	arg_7_0.itemPopView_:Dispose()

	arg_7_0.itemPopView_ = nil
	arg_7_0.onBuyItemSuccessHandler_ = nil
	arg_7_0.updateOperateHandler_ = nil
	arg_7_0.onWindowUpdateHandler_ = nil
	arg_7_0.onSelectedItemHandler_ = nil

	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.npcBtn_, nil, function()
		arg_8_0:RefrshShopText(ChallengeRogueTeamConst.SHOP_TEXT_TYPE.CLICK_MERCHANT, 1)
	end)
	arg_8_0:AddBtnListener(arg_8_0.cancelBtn_, nil, function()
		arg_8_0.confirmExitFlag_ = false

		arg_8_0:RefreshPopWindow()
	end)
end

function var_0_0.OnClickBtn(arg_11_0)
	if arg_11_0.selectItemData_ then
		local var_11_0 = ChallengeRogueTeamTools.GetWindowBarText(ChallengeRogueTeamConst.ATTRIBUTE_ENUM.GOLD)
		local var_11_1 = arg_11_0.selectItemData_

		if var_11_0 < math.ceil(ChallengeRogueTeamTools.GetShopItemDefaultPrice(var_11_1.id, var_11_1.rare) * var_11_1.discount / 100) then
			ShowTips(string.format(GetTips("CURRENCY_NO_ENOUGH"), GetTips("ROGUE_TEAM_GOLD")))

			return
		end

		local var_11_2 = var_11_1.discount

		ChallengeRogueTeamAction.ShopBuyItem(var_11_1.index, function()
			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_SELECTED)
			manager.notify:Invoke(CHALLENGE_ROGUE_TEAM_SHOP_ITEM_BUY_SUCCESS, var_11_2)
		end)
	else
		if arg_11_0.confirmExitFlag_ ~= true then
			arg_11_0.confirmExitFlag_ = true

			arg_11_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.CONFIRM_EXIT, ChallengeRogueTeamButton.BUTTON_TEXT.CONFIRM_EXIT)
			arg_11_0.camcelControllerEx_:SetSelectedState("true")

			return
		end

		ChallengeRogueTeamAction.ShopBuyItem(0, function()
			arg_11_0:Back()
		end)
	end
end

function var_0_0.RefrshShopText(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = ChallengeRogueTeamTools.GetShopVoiceID(arg_14_1, arg_14_2, arg_14_0.lastVoiceID_)

	arg_14_0.lastVoiceID_ = var_14_0

	local var_14_1 = RogueTeamShopVoiceCfg[var_14_0]

	arg_14_0.npcText_.text = var_14_1.desc

	arg_14_0.expressionController_:SetSelectedState(var_14_1.expression_name)
end

function var_0_0.OnBuyItemSuccess(arg_15_0, arg_15_1)
	arg_15_0:RefreshItemList()
	arg_15_0:RefrshShopText(ChallengeRogueTeamConst.SHOP_TEXT_TYPE.BUY_SUCCESS, arg_15_1 >= 100 and ChallengeRogueTeamConst.SHOP_BUY_ITEM_TYPE.BUY_ORIGIN or ChallengeRogueTeamConst.SHOP_BUY_ITEM_TYPE.BUY_DISCOUNT)
end

function var_0_0.OnUpdateOperate(arg_16_0)
	arg_16_0:RefreshItemList()
end

function var_0_0.OnWindowUpdate(arg_17_0)
	if not arg_17_0:IsTop() then
		return
	end

	arg_17_0:PopWindowProcess()
	arg_17_0:RefreshItemList()
end

function var_0_0.PopWindowProcess(arg_18_0)
	if ChallengeRogueTeamAction.PopWindowProcessSystem() == false then
		ChallengeRogueTeamAction.PopOperateWindowProcessSystem()
	end
end

function var_0_0.OnSelectedItem(arg_19_0, arg_19_1)
	arg_19_0.selectItemData_ = arg_19_1
	arg_19_0.popFlag_ = arg_19_1 ~= nil

	arg_19_0:RefreshPopWindow()
end

function var_0_0.RefreshItemList(arg_20_0)
	local var_20_0 = ChallengeRogueTeamTools.GetShopItemList()

	for iter_20_0 = 1, 4 do
		arg_20_0.treasureItemList_[iter_20_0] = arg_20_0.treasureItemList_[iter_20_0] or ChallengeRogueTeamShopItem.New(arg_20_0.item_, arg_20_0.treasureParent_, ChallengeRogueTeamConst.ITEM_TYPE.TREASURE, iter_20_0)

		arg_20_0.treasureItemList_[iter_20_0]:SetData(var_20_0[ChallengeRogueTeamConst.ITEM_TYPE.TREASURE][iter_20_0])
	end

	for iter_20_1 = 1, 4 do
		arg_20_0.relicItemList_[iter_20_1] = arg_20_0.relicItemList_[iter_20_1] or ChallengeRogueTeamShopItem.New(arg_20_0.item_, arg_20_0.relicParent_, ChallengeRogueTeamConst.ITEM_TYPE.RELIC, iter_20_1)

		arg_20_0.relicItemList_[iter_20_1]:SetData(var_20_0[ChallengeRogueTeamConst.ITEM_TYPE.RELIC][iter_20_1])
	end
end

function var_0_0.RefreshPopWindow(arg_21_0)
	if arg_21_0.popFlag_ then
		arg_21_0.confirmExitFlag_ = false

		arg_21_0.itemPopView_:SetData(arg_21_0.selectItemData_)
		arg_21_0.popControllerEx_:SetSelectedState("state1")
		arg_21_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.GOLD_COLOR, ChallengeRogueTeamButton.BUTTON_TEXT.CONFIRM_ORDER)
		arg_21_0:RefrshShopText(ChallengeRogueTeamConst.SHOP_TEXT_TYPE.SELECT_ITEM, arg_21_0.selectItemData_.discount >= 100 and ChallengeRogueTeamConst.SHOP_SELECT_ITEM_TYPE.SELECT_ORIGIN or ChallengeRogueTeamConst.SHOP_SELECT_ITEM_TYPE.SELECT_DISCOUNT)
	else
		arg_21_0.popControllerEx_:SetSelectedState("state0")
		arg_21_0.rogueTeamSureBtnView_:RefreshBtnState(ChallengeRogueTeamButton.CANCLE, ChallengeRogueTeamButton.BUTTON_TEXT.EXIT)
		arg_21_0.camcelControllerEx_:SetSelectedState("false")
	end
end

function var_0_0.RefreshBGM(arg_22_0)
	local var_22_0 = ChallengeRogueTeamData:GetCacheTemplateID()
	local var_22_1 = RogueTeamCfg[var_22_0].room_temp
	local var_22_2 = RogueTeamRoomTypeCfg.get_id_list_by_temp_id_id[var_22_1][ChallengeRogueTeamConst.NODE_TYPE.SHOP][1]
	local var_22_3 = RogueTeamRoomTypeCfg[var_22_2]

	if var_22_3.cue_sheet ~= "" then
		manager.audio:PlayBGM(var_22_3.cue_sheet, var_22_3.cue_name, var_22_3.awb)
	end
end

return var_0_0
