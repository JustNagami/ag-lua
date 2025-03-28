local var_0_0 = class("SkinDiscountGiftShopView", ReduxView)

var_0_0.TIPS_STATE = {
	INFO = 2,
	NULL = 0,
	NORMAL = 1
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeSkinEventShopUI_new"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	local var_3_0 = arg_3_0.viewTrs_.rect.width
	local var_3_1 = arg_3_0.contTrs_:GetComponent("HorizontalLayoutGroup").spacing

	arg_3_0.loopScrollView_ = LoopScrollView.New(arg_3_0, arg_3_0.scrollEx_, arg_3_0.contTrs_, arg_3_0.viewTrs_, var_3_0, var_3_1, nil, true)
	arg_3_0.item1Pool = {}
	arg_3_0.item2Pool = {}
	arg_3_0.maxCntController_ = arg_3_0.controllerEx_:GetController("maxCnt")
	arg_3_0.stateController_ = arg_3_0.controllerEx_:GetController("state")
	arg_3_0.btnStateController_ = arg_3_0.controllerEx_:GetController("btnState")
	arg_3_0.OnSelectSkinGoodsHandler_ = handler(arg_3_0, arg_3_0.OnSelectSkinGoods)
	arg_3_0.OnSelectSceneHandler_ = handler(arg_3_0, arg_3_0.OnSelectScene)
	arg_3_0.skinCommonItem1_ = SkinDiscountGiftShopCommonItem.New(arg_3_0.skinItem1_, true)
	arg_3_0.sceneCommonItem1_ = SkinDiscountGiftShopCommonItem.New(arg_3_0.sceneItem1_, true)
	arg_3_0.skinCommonItem2_ = SkinDiscountGiftShopCommonItem.New(arg_3_0.skinItem2_, true)
	arg_3_0.sceneCommonItem2_ = SkinDiscountGiftShopCommonItem.New(arg_3_0.sceneItem2_, true)
end

function var_0_0.OnTop(arg_4_0)
	if SkinDiscountGiftData:GetUsedTimes(arg_4_0.giftID_) >= ActivitySkinDiscountCfg[arg_4_0.giftID_].limit_num then
		arg_4_0:Back()
	end
end

function var_0_0.OnEnter(arg_5_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		CurrencyConst.CURRENCY_TYPE_SKIN
	})
	manager.windowBar:SetGameHelpKey("SKIN_DISCOUNT_GIFT_DESC")
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, true)
	manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, true)
	manager.notify:RegistListener(SKIN_DISCOUNT_GIFT_SELECT_GOODS, arg_5_0.OnSelectSkinGoodsHandler_)
	manager.notify:RegistListener(SKIN_DISCOUNT_FIGT_SELECT_SCENE, arg_5_0.OnSelectSceneHandler_)

	arg_5_0.giftID_ = arg_5_0.params_.giftID

	local var_5_0 = ActivitySkinDiscountCfg[arg_5_0.giftID_]

	arg_5_0.activityID_ = var_5_0.activity_id
	arg_5_0.goodsList_ = SkinDiscountGiftTools.GetGoodsList(arg_5_0.giftID_, var_5_0.discount / 100)

	arg_5_0.loopScrollView_:NavigateIndex(1)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.loopScrollView_.rectGrid_)

	arg_5_0.loopScrollView_.scrollView_.horizontalNormalizedPosition = 0

	arg_5_0:RefreshMaxCnt()
	arg_5_0:RefreshUI()
end

function var_0_0.OnExit(arg_6_0)
	manager.notify:RemoveListener(SKIN_DISCOUNT_GIFT_SELECT_GOODS, arg_6_0.OnSelectSkinGoodsHandler_)
	manager.notify:RemoveListener(SKIN_DISCOUNT_FIGT_SELECT_SCENE, arg_6_0.OnSelectSceneHandler_)

	arg_6_0.tipsState_ = var_0_0.TIPS_STATE.NORMAL

	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0.loopScrollView_:Dispose()

	arg_7_0.loopScrollView_ = nil

	arg_7_0.skinCommonItem1_:Dispose()

	arg_7_0.skinCommonItem1_ = nil

	arg_7_0.sceneCommonItem1_:Dispose()

	arg_7_0.sceneCommonItem1_ = nil

	arg_7_0.skinCommonItem2_:Dispose()

	arg_7_0.skinCommonItem2_ = nil

	arg_7_0.sceneCommonItem2_:Dispose()

	arg_7_0.sceneCommonItem2_ = nil
	arg_7_0.OnSelectSkinGoodsHandler_ = nil
	arg_7_0.OnSelectSceneHandler_ = nil

	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.buyBtn_, nil, function()
		local var_9_0 = ActivitySkinDiscountCfg[arg_8_0.giftID_]

		if not ActivityData:GetActivityIsOpen(var_9_0.activity_id) then
			ShopTips("TIME_OVER")

			return
		end

		if #SkinDiscountGiftData:GetGoodsIDList() < var_9_0.optional_skin_num then
			ShowTips("PLEASE_SELECT_SKIN_GOODS")

			return
		end

		if SkinDiscountGiftTools.HasCheapGoodsList(arg_8_0.giftID_) then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("ACTIVITY_SKIN_DISCOUNT_HIGH_COST_EFFECTIVENESS_TIPS_2"),
				OkCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_enter", var_9_0.activity_id),
						source = SkinDiscountGiftConst.EXIST_MORE_CHEAP_SKIN_TIPS
					})
					arg_8_0:OnBuyItem()
				end,
				CancelCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_close", var_9_0.activity_id),
						source = SkinDiscountGiftConst.EXIST_MORE_CHEAP_SKIN_TIPS
					})
				end
			})
		elseif arg_8_0:IsNotSelectScene() then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("ACTIVITY_SKIN_DISCOUNT_HIGH_COST_EFFECTIVENESS_TIPS_3"),
				OkCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_enter", var_9_0.activity_id),
						source = SkinDiscountGiftConst.BUY_SCENE_TIPS
					})
					arg_8_0:OnBuyItem()
				end,
				CancelCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_close", var_9_0.activity_id),
						source = SkinDiscountGiftConst.BUY_SCENE_TIPS
					})
				end
			})
		else
			arg_8_0:OnBuyItem()
		end
	end)
	arg_8_0:AddBtnListener(arg_8_0.infoBtn_, nil, function()
		SetActive(arg_8_0.mask_, true)

		arg_8_0.tipsState_ = var_0_0.TIPS_STATE.INFO

		arg_8_0.stateController_:SetSelectedState("state1")
	end)
	arg_8_0:AddBtnListener(arg_8_0.maskBtn_, nil, function()
		SetActive(arg_8_0.mask_, false)

		arg_8_0.tipsState_ = var_0_0.TIPS_STATE.NORMAL

		arg_8_0.stateController_:SetSelectedState("state2")
	end)
end

function var_0_0.OnBuyItem(arg_16_0)
	local var_16_0 = 24
	local var_16_1 = {}
	local var_16_2 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_16_0, iter_16_1 in ipairs(var_16_2) do
		local var_16_3 = iter_16_1.skinGoodsID
		local var_16_4 = iter_16_1.isSelectSceneID and iter_16_1.sceneGoodsID

		var_16_0 = getShopCfg(var_16_3).cost_id

		if not SkinDiscountGiftTools.HasSkin(var_16_3) then
			table.insert(var_16_1, var_16_3)
		end

		if var_16_4 and not SkinDiscountGiftTools.HasScene(var_16_4) then
			table.insert(var_16_1, var_16_4)
		end
	end

	local var_16_5 = ActivitySkinDiscountCfg[arg_16_0.giftID_]

	totalPrice = SkinDiscountGiftTools.GetTotalDiscountPrice(var_16_5.discount / 100)

	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = string.format(GetI18NText(GetTips("SKIN_GIFT_BUY_TIPS")), ItemTools.getItemName(var_16_0), totalPrice, var_16_5.goods_name),
		OkCallback = function()
			if ItemTools.getItemNum(var_16_0) >= totalPrice then
				SkinDiscountGiftAction.BuySkinDiscountGift(var_16_5.activity_id, arg_16_0.giftID_, var_16_1, function(arg_18_0)
					arg_16_0.loopScrollView_:NavigateIndex(1)
					arg_16_0:RefreshUI()
				end)
			else
				ShowMessageBox({
					title = GetTips("PROMPT"),
					content = GetTips("ERROR_ITEM_NOT_SKIN_TICKET_C"),
					OkCallback = function()
						JumpTools.GoToSystem("/rechargeMain", {
							childShopIndex = 4,
							page = 2
						}, ViewConst.SYSTEM_ID.RECHARGE_MAIN)
					end
				})
			end
		end
	})
end

function var_0_0.RefreshMaxCnt(arg_20_0)
	local var_20_0 = ActivitySkinDiscountCfg[arg_20_0.giftID_]
	local var_20_1 = var_20_0.discount

	arg_20_0.discountText_.text = string.format("%.1f%s", var_20_1 / 10, GetI18NText(GetTips("LABEL_DISCOUNT")))

	if var_20_0.optional_skin_num == 1 then
		arg_20_0.maxCntController_:SetSelectedState("false")
	else
		arg_20_0.maxCntController_:SetSelectedState("true")
	end
end

function var_0_0.OnSelectSkinGoods(arg_21_0, arg_21_1, arg_21_2)
	if SkinDiscountGiftTools.IsSelectSkinGoodsID(arg_21_1) then
		SkinDiscountGiftData:RemoveGoodsIDList(arg_21_1)
	else
		if SkinDiscountGiftTools.IsFullSkinGoodsID(ActivitySkinDiscountCfg[arg_21_0.giftID_].optional_skin_num) then
			ShowTips("ACTIVITY_SKIN_DISCOUNT_SKIN_NUM_LIMIT_TIPS")

			return
		end

		local var_21_0 = true

		if SkinDiscountGiftTools.HasScene(arg_21_2) then
			var_21_0 = false
		end

		SkinDiscountGiftData:AddGoodsIDList(arg_21_1, arg_21_2, var_21_0)
	end

	arg_21_0.loopScrollView_:RefreshScrollView(true, true)
	arg_21_0:RefreshUI()
end

function var_0_0.OnSelectScene(arg_22_0, arg_22_1)
	SkinDiscountGiftData:UpdateGoodsIDList(arg_22_1)
	arg_22_0.loopScrollView_:RefreshScrollView(true, true)
	arg_22_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_23_0)
	arg_23_0:RefreshSelectPanel()
	arg_23_0:RefreshTotalCost()
end

function var_0_0.RefreshSelectPanel(arg_24_0)
	local var_24_0 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_24_0 = 1, 2 do
		local var_24_1 = var_24_0[iter_24_0]

		if iter_24_0 == 1 then
			local var_24_2 = var_24_1 and var_24_1.skinGoodsID
			local var_24_3 = var_24_1 and var_24_1.sceneGoodsID

			if var_24_2 == nil then
				arg_24_0.skinCommonItem1_:SetData(nil)
			else
				local var_24_4 = clone(ItemTemplateData)

				var_24_4.id = SkinDiscountGiftTools.GetItemIDByGoodsID(var_24_2)
				var_24_4.number = nil
				var_24_4.skinGiftSelect = true

				function var_24_4.clickFun()
					arg_24_0:OnSelectSkinGoods(var_24_2, var_24_3)
				end

				arg_24_0.skinCommonItem1_:SetData(var_24_4)
			end

			if var_24_3 == nil then
				arg_24_0.sceneCommonItem1_:SetData(nil)
				arg_24_0.sceneCommonItem1_:Show(var_24_2 == nil)
			else
				arg_24_0.sceneCommonItem1_:Show(true)

				local var_24_5 = clone(ItemTemplateData)

				var_24_5.id = SkinDiscountGiftTools.GetItemIDByGoodsID(var_24_3)
				var_24_5.number = nil
				var_24_5.skinGiftSelect = var_24_1.isSelectSceneID

				function var_24_5.clickFun()
					arg_24_0:OnSelectScene(var_24_2)
				end

				arg_24_0.sceneCommonItem1_:SetData(var_24_5)
			end
		else
			local var_24_6 = var_24_1 and var_24_1.skinGoodsID
			local var_24_7 = var_24_1 and var_24_1.sceneGoodsID

			if var_24_6 == nil then
				arg_24_0.skinCommonItem2_:SetData(nil)
			else
				local var_24_8 = clone(ItemTemplateData)

				var_24_8.id = SkinDiscountGiftTools.GetItemIDByGoodsID(var_24_6)
				var_24_8.number = nil
				var_24_8.skinGiftSelect = true

				function var_24_8.clickFun()
					arg_24_0:OnSelectSkinGoods(var_24_6, var_24_7)
				end

				arg_24_0.skinCommonItem2_:SetData(var_24_8)
			end

			if var_24_7 == nil then
				arg_24_0.sceneCommonItem2_:SetData(nil)
				arg_24_0.sceneCommonItem2_:Show(var_24_6 == nil)
			else
				arg_24_0.sceneCommonItem2_:Show(true)

				local var_24_9 = clone(ItemTemplateData)

				var_24_9.id = SkinDiscountGiftTools.GetItemIDByGoodsID(var_24_7)
				var_24_9.number = nil
				var_24_9.skinGiftSelect = var_24_1.isSelectSceneID

				function var_24_9.clickFun()
					arg_24_0:OnSelectScene(var_24_6)
				end

				arg_24_0.sceneCommonItem2_:SetData(var_24_9)
			end
		end
	end
end

function var_0_0.RefreshTotalCost(arg_29_0)
	local var_29_0 = 0
	local var_29_1 = {}
	local var_29_2 = {}
	local var_29_3 = SkinDiscountGiftData:GetGoodsIDList()
	local var_29_4 = ActivitySkinDiscountCfg[arg_29_0.giftID_].discount / 100

	for iter_29_0 = 1, 2 do
		local var_29_5 = var_29_3[iter_29_0]
		local var_29_6 = 0
		local var_29_7 = 0

		if var_29_5 then
			local var_29_8, var_29_9 = ShopTools.GetPrice(var_29_5.skinGoodsID)

			if var_29_5.isSelectSceneID and var_29_5.sceneGoodsID then
				local var_29_10, var_29_11 = ShopTools.GetPrice(var_29_5.sceneGoodsID)

				arg_29_0[string.format("priceText%s_", iter_29_0)].text = iter_29_0 > 1 and string.format("+%s+%s", var_29_8, var_29_10) or string.format("%s+%s", var_29_8, var_29_10)
				var_29_7 = var_29_9 + var_29_11
				var_29_6 = var_29_8 + var_29_10
			else
				arg_29_0[string.format("priceText%s_", iter_29_0)].text = iter_29_0 > 1 and string.format("+%s", var_29_8) or string.format("%s", var_29_8)
				var_29_7 = var_29_9
				var_29_6 = var_29_8
			end

			arg_29_0[string.format("originPriceText%s_", iter_29_0)].text = iter_29_0 > 1 and string.format("+%s", var_29_7) or var_29_7
		end

		SetActive(arg_29_0[string.format("originPriceText%s_", iter_29_0)].gameObject, var_29_7 ~= 0 and var_29_7 ~= var_29_6)
		SetActive(arg_29_0[string.format("priceText%s_", iter_29_0)].gameObject, var_29_5 ~= nil)

		var_29_0 = var_29_0 + var_29_6
	end

	arg_29_0.priceText_.text = SkinDiscountGiftTools.GetTotalDiscountPrice(var_29_4)
	arg_29_0.originPriceText_.text = var_29_0
	arg_29_0.returnText_.text = SkinDiscountGiftTools.GetReturePrice()

	if #var_29_3 == 0 then
		arg_29_0.tipsState_ = var_0_0.TIPS_STATE.NULL
	elseif arg_29_0.tipsState_ == var_0_0.TIPS_STATE.NULL then
		arg_29_0.tipsState_ = var_0_0.TIPS_STATE.NORMAL
	end

	if arg_29_0.tipsState_ == var_0_0.TIPS_STATE.NULL then
		arg_29_0.stateController_:SetSelectedState("state0")
	elseif arg_29_0.tipsState_ == var_0_0.TIPS_STATE.NORMAL then
		arg_29_0.stateController_:SetSelectedState("state2")
	else
		arg_29_0.stateController_:SetSelectedState("state1")
	end

	arg_29_0:RefreshBtnState()
end

function var_0_0.RefreshBtnState(arg_30_0)
	local var_30_0 = ActivitySkinDiscountCfg[arg_30_0.giftID_]

	if #SkinDiscountGiftData:GetGoodsIDList() < var_30_0.optional_skin_num then
		arg_30_0.btnStateController_:SetSelectedState("false")
	else
		arg_30_0.btnStateController_:SetSelectedState("true")
	end
end

function var_0_0.IsNotSelectScene(arg_31_0)
	local var_31_0 = SkinDiscountGiftData:GetGoodsIDList()

	for iter_31_0, iter_31_1 in ipairs(var_31_0) do
		local var_31_1 = iter_31_1.sceneGoodsID

		if var_31_1 ~= 0 and not SkinDiscountGiftTools.HasScene(var_31_1) and iter_31_1.isSelectSceneID == false then
			return true
		end
	end

	return false
end

function var_0_0.IndexItem(arg_32_0, arg_32_1, arg_32_2)
	arg_32_2:SetData(arg_32_0.goodsList_[arg_32_1])
end

function var_0_0.LsRemoveItem(arg_33_0, arg_33_1)
	arg_33_1.itemView:Show(false)

	arg_33_1.isFree = true
end

function var_0_0.GetFreeItem(arg_34_0, arg_34_1, arg_34_2)
	for iter_34_0, iter_34_1 in pairs(arg_34_1) do
		if iter_34_1.isFree == true then
			iter_34_1.isFree = false

			return iter_34_1
		end
	end

	local var_34_0 = {
		isFree = false,
		itemView = arg_34_2()
	}

	table.insert(arg_34_1, var_34_0)

	return var_34_0
end

function var_0_0.LsAddItem(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0

	if SkinDiscountGiftTools.IsSelectSkinGoodsID(arg_35_1[1]) and arg_35_1[2] then
		var_35_0 = arg_35_0:GetFreeItem(arg_35_0.item1Pool, function()
			return SkinDiscountGiftShopSkinDLCItem.New(arg_35_0.itemDLCGo_, arg_35_0.contTrs_.gameObject)
		end)
	else
		var_35_0 = arg_35_0:GetFreeItem(arg_35_0.item2Pool, function()
			return SkinDiscountGiftShopItem.New(arg_35_0.itemGo_, arg_35_0.contTrs_.gameObject)
		end)
	end

	var_35_0.itemView:SetData(arg_35_1, arg_35_2)

	return var_35_0
end

function var_0_0.LsGetItemData(arg_38_0)
	return arg_38_0.goodsList_
end

function var_0_0.LsUpdateItem(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_1.itemView:SetData(arg_39_2, arg_39_3)
end

return var_0_0
