local var_0_0 = class("RechargeGiftPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeGiftPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.immeRewardItemList_ = {}
	arg_3_0.immeRewardItemList2_ = {}
	arg_3_0.dailyRewardItemList_ = {}

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.rewardTypeController_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "rewardType")
	arg_4_0.costTypeController_ = ControllerUtil.GetController(arg_4_0.gameObject_.transform, "costType")
	arg_4_0.list_ = LuaList.New(handler(arg_4_0, arg_4_0.indexItem), arg_4_0.listGo_, RechargeGiftPopItem)
end

function var_0_0.indexItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(arg_5_0.itemDesCfg.param[arg_5_1][1], arg_5_0.itemDesCfg.param[arg_5_1][2], arg_5_0.selectNum)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.bgBtn_, nil, function()
		arg_6_0:Back()
	end)
	arg_6_0:AddBtnListener(arg_6_0.cancelBtn_, nil, function()
		arg_6_0:Back()
	end)
	arg_6_0:AddBtnListener(arg_6_0.buyBtn_, nil, function()
		SendMessageManagerToSDK("purchase_click_gp_once")
		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_giftbox_buy = arg_6_0.goodID
		})

		local var_9_0 = ShopListCfg[arg_6_0.shopID]

		if OperationData:IsFunctionStoped(var_9_0.operation_stop_id) then
			ShowTips("ERROR_FUNCTION_STOP")

			return
		end

		local function var_9_1()
			if ShopTools.IsRMB(arg_6_0.goodID) then
				local var_10_0

				if arg_6_0:IsOnDiscountArea() then
					var_10_0 = PaymentCfg[arg_6_0.shopCfg.cheap_cost_id]
				else
					var_10_0 = PaymentCfg[arg_6_0.shopCfg.cost_id]
				end

				local var_10_1 = arg_6_0.params_.buy_source or 0

				PayAction.RequestGSPay(var_10_0.id, arg_6_0.selectNum, arg_6_0.shopCfg.shop_id, arg_6_0.shopCfg.goods_id, nil, var_10_1)
			else
				local var_10_2 = arg_6_0.params_.buy_source or 0

				if ShopTools.GetPrice(arg_6_0.goodID) == 0 then
					arg_6_0:Back()
					ShopAction.BuyItem({
						{
							goodID = arg_6_0.goodID,
							buyNum = arg_6_0.selectNum
						}
					}, nil, var_10_2)

					return
				end

				ShopTools.ConfirmBuyItem(arg_6_0.goodID, arg_6_0.selectNum, function()
					SDKTools.SendPaymentMessageToSDK("payment_touch", {
						payment_giftbox_check = 0
					})
					arg_6_0:Back()
				end, function()
					SDKTools.SendPaymentMessageToSDK("payment_touch", {
						payment_giftbox_check = 1
					})
					arg_6_0:UpdateRealtimePrice()
					arg_6_0:UpdatePreview()
				end, var_10_2)
			end
		end

		local var_9_2, var_9_3 = ShopTools.rewertReward(arg_6_0.goodID, arg_6_0.selectNum)

		if #var_9_3 ~= 0 then
			JumpTools.OpenPageByJump("rechargeRevertPop", {
				goodID = arg_6_0.goodID,
				callBack = var_9_1,
				buyNumber = arg_6_0.selectNum
			})
		else
			var_9_1()
		end
	end)
	arg_6_0.useNumSlider_.onValueChanged:AddListener(function()
		arg_6_0.selectNum = arg_6_0.useNumSlider_.value

		if arg_6_0.selectNum < 1 then
			arg_6_0.selectNum = 1

			arg_6_0:UpdateSliderPositionBySelectNum()
		end

		arg_6_0:UpdateDelAddBtn()
		arg_6_0:UpdatePreview()
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.delBtn_.gameObject, 3, 0.5, 0.2, function()
		if arg_6_0.selectNum > 1 then
			arg_6_0.selectNum = arg_6_0.selectNum - 1

			arg_6_0:UpdateSliderPositionBySelectNum()
			arg_6_0:UpdateDelAddBtn()
			arg_6_0:UpdatePreview()

			return true
		end

		return false
	end)
	arg_6_0:AddPressingByTimeListener(arg_6_0.addBtn_.gameObject, 3, 0.5, 0.2, function()
		if arg_6_0.selectNum < arg_6_0.canUseMaxNum_ then
			arg_6_0.selectNum = arg_6_0.selectNum + 1

			arg_6_0:UpdateSliderPositionBySelectNum()
			arg_6_0:UpdateDelAddBtn()
			arg_6_0:UpdatePreview()

			return true
		end

		return false
	end)
	arg_6_0:AddBtnListener(arg_6_0.infoBtn_, nil, function()
		JumpTools.OpenPageByJump("gameHelp", {
			title = GetTips("SHOP_GIFT_DESCRIBE"),
			content = arg_6_0.itemDesCfg.desc2
		})
	end)
end

function var_0_0.UpdateDelAddBtn(arg_17_0)
	arg_17_0.delBtn_.interactable = arg_17_0.selectNum > 1
	arg_17_0.addBtn_.interactable = arg_17_0.selectNum < arg_17_0.canUseMaxNum_
end

function var_0_0.UpdateSliderPositionBySelectNum(arg_18_0)
	arg_18_0.useNumSlider_.value = arg_18_0.selectNum
end

function var_0_0.UpdateRealtimePrice(arg_19_0)
	arg_19_0.price_, arg_19_0.oldPrice_, arg_19_0.pricePercent_ = ShopTools.GetPrice(arg_19_0.goodID)
end

function var_0_0.UpdatePreview(arg_20_0)
	arg_20_0.buyNumLabel_.text = tostring(arg_20_0.selectNum)

	local var_20_0 = arg_20_0.price_ * arg_20_0.selectNum

	if var_20_0 <= 0 then
		arg_20_0.costTypeController_:SetSelectedState("free")
	elseif ShopTools.IsRMB(arg_20_0.goodID) then
		arg_20_0.costTypeController_:SetSelectedState("money")

		arg_20_0.totleLabel_.text = var_20_0
		arg_20_0.rmbLabel_.text = ShopTools.GetMoneySymbol(arg_20_0.goodID)
	else
		arg_20_0.costTypeController_:SetSelectedState("currency")

		arg_20_0.costIcon_.sprite = ItemTools.getItemLittleSprite(arg_20_0.shopCfg.cost_id)
		arg_20_0.totleLabel_.text = var_20_0

		if var_20_0 > ItemTools.getItemNum(arg_20_0.shopCfg.cost_id) then
			arg_20_0.totleLabel_.text = "<color=#FF000B>" .. var_20_0 .. "</color>"
		end
	end

	if arg_20_0.itemDesCfg.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		arg_20_0.list_:StartScrollWithoutAnimator(#arg_20_0.itemDesCfg.param)
	end
end

function var_0_0.UpdateBar(arg_21_0)
	if arg_21_0.shopID == 1050 then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_SKIN
		}, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, true)
		manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, true)
	else
		manager.windowBar:SwitchBar({
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
	end
end

function var_0_0.OnTop(arg_22_0)
	arg_22_0:UpdateBar()
	manager.windowBar:SetAsLastSibling()
	arg_22_0:UpdateView()
	arg_22_0:UpdatePreview()
end

function var_0_0.OnEnter(arg_23_0)
	arg_23_0.itemCfg = arg_23_0.params_.itemCfg
	arg_23_0.goodID = arg_23_0.params_.goodId
	arg_23_0.buyTime = arg_23_0.params_.buyTime
	arg_23_0.shopID = arg_23_0.params_.shopId
	arg_23_0.shopCfg = arg_23_0.params_.shopCfg
	arg_23_0.itemDesCfg = arg_23_0.params_.itemDesCfg_
	arg_23_0.selectNum = 1
	arg_23_0.multipleScrollRect_.verticalNormalizedPosition = 1

	arg_23_0:UpdateRealtimePrice()

	arg_23_0.canUseMaxNum_ = arg_23_0:GetMaxNum()

	arg_23_0:UpdateView()
	arg_23_0:UpdateTimer()

	if arg_23_0.timer_ == nil then
		arg_23_0.timer_ = Timer.New(function()
			arg_23_0:UpdateTimer()
		end, 1, -1)
	end

	arg_23_0.useNumSlider_.value = 1

	arg_23_0.timer_:Start()
	arg_23_0:UpdateDelAddBtn()
	arg_23_0:UpdatePreview()
	arg_23_0:AddEventListeners()
end

function var_0_0.UpdateTimer(arg_25_0)
	if #arg_25_0.shopCfg.close_time > 0 then
		SetActive(arg_25_0.remainTimeGo_, true)

		local var_25_0 = TimeMgr.GetInstance():GetServerTime()
		local var_25_1 = TimeMgr.GetInstance():parseTimeFromConfig(arg_25_0.shopCfg.close_time)

		if var_25_1 <= var_25_0 then
			arg_25_0.remainTimeTxt_.text = GetTips("TIP_EXPIRED")
		else
			arg_25_0.remainTimeTxt_.text = manager.time:GetLostTimeStr(var_25_1)
		end
	else
		SetActive(arg_25_0.remainTimeGo_, false)
	end

	if arg_25_0:IsOnDiscountArea() then
		SetActive(arg_25_0.discountGo_, true)

		arg_25_0.tipLabel_.text = ShopTools.GetDiscountLabel(arg_25_0.shopCfg.goods_id)

		if #arg_25_0.shopCfg.cheap_close_time > 0 then
			arg_25_0.lastLabel_.text = manager.time:GetLostTimeStr(TimeMgr.GetInstance():parseTimeFromConfig(arg_25_0.shopCfg.cheap_close_time))

			SetActive(arg_25_0.limitTimeGo_, arg_25_0.shopCfg.is_limit_time_discount == 1)
			SetActive(arg_25_0.discountLimitTimeGo_, arg_25_0.shopCfg.is_limit_time_discount == 1)
		else
			SetActive(arg_25_0.limitTimeGo_, false)
			SetActive(arg_25_0.discountLimitTimeGo_, false)
		end
	else
		SetActive(arg_25_0.limitTimeGo_, false)
		SetActive(arg_25_0.discountGo_, false)
		SetActive(arg_25_0.limitTimeGo_, false)
		SetActive(arg_25_0.discountLimitTimeGo_, false)
	end
end

function var_0_0.UpdateView(arg_26_0)
	arg_26_0.useNumSlider_.maxValue = arg_26_0.canUseMaxNum_
	arg_26_0.nameLabel_.text = GetI18NText(arg_26_0.itemDesCfg.name)

	SetActive(arg_26_0.ownGo_, ShopTools.CheckGoodsOwen(arg_26_0.goodID))

	arg_26_0.image_.sprite = getSpriteWithoutAtlas("TextureConfig/PrizeItem/" .. arg_26_0.itemDesCfg.icon)

	arg_26_0.image_:SetNativeSize()

	if arg_26_0.shopCfg.limit_num ~= nil and arg_26_0.shopCfg.limit_num ~= -1 then
		local var_26_0 = arg_26_0.shopCfg.limit_num - arg_26_0.buyTime

		arg_26_0.limitLabel_.text = string.format("%d/%d", var_26_0, arg_26_0.shopCfg.limit_num)
		arg_26_0.limitTitle_.text = GetTips(ShopConst.SHOP_LIMIT_TEXT[arg_26_0.shopCfg.refresh_cycle])
	else
		arg_26_0.limitLabel_.text = " "
		arg_26_0.limitTitle_.text = " "
	end

	SetActive(arg_26_0.limitGo_, arg_26_0.shopCfg.limit_num ~= nil and arg_26_0.shopCfg.limit_num ~= -1)
	SetActive(arg_26_0.surperValue, arg_26_0.shopCfg.tag == ShopConst.TAGS.SUPER_VALUE)

	if arg_26_0.itemDesCfg.desc2 ~= "" then
		arg_26_0.rewardTypeController_:SetSelectedState("value_2")

		arg_26_0.descText_.text = arg_26_0.itemDesCfg.desc

		local var_26_1 = arg_26_0.itemDesCfg.param[1] or {}

		for iter_26_0, iter_26_1 in ipairs(var_26_1) do
			if iter_26_0 <= #arg_26_0.immeRewardItemList2_ then
				arg_26_0.immeRewardItemList2_[iter_26_0]:SetData(iter_26_1[1], iter_26_1[2])
			else
				local var_26_2 = Object.Instantiate(arg_26_0.GiftPopItemPrefab_, arg_26_0.itemParent2_)
				local var_26_3 = RechargeGiftPopItem.New(var_26_2)

				var_26_3:SetData(iter_26_1[1], iter_26_1[2])
				table.insert(arg_26_0.immeRewardItemList2_, var_26_3)
			end
		end

		while #var_26_1 < #arg_26_0.immeRewardItemList2_ do
			arg_26_0.immeRewardItemList2_[#arg_26_0.immeRewardItemList2_]:Dispose()
			table.remove(arg_26_0.immeRewardItemList2_, #arg_26_0.immeRewardItemList2_)
		end
	elseif arg_26_0.itemDesCfg.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_PACKS then
		arg_26_0.rewardTypeController_:SetSelectedState("normal")
		arg_26_0.list_:StartScroll(#arg_26_0.itemDesCfg.param)
	elseif arg_26_0.itemDesCfg.sub_type == ItemConst.ITEM_SUB_TYPE.SHOP_SEVEN_PACKS then
		arg_26_0.rewardTypeController_:SetSelectedState("multiple")

		local var_26_4 = arg_26_0.itemDesCfg.param[1] or {}

		if #var_26_4 > 0 then
			for iter_26_2, iter_26_3 in ipairs(var_26_4) do
				if iter_26_2 <= #arg_26_0.immeRewardItemList_ then
					arg_26_0.immeRewardItemList_[iter_26_2]:SetData(iter_26_3[1], iter_26_3[2])
				else
					local var_26_5 = Object.Instantiate(arg_26_0.GiftPopItemPrefab_, arg_26_0.immeList_)
					local var_26_6 = RechargeGiftPopItem.New(var_26_5)

					var_26_6:SetData(iter_26_3[1], iter_26_3[2] * arg_26_0.shopCfg.give)
					table.insert(arg_26_0.immeRewardItemList_, var_26_6)
				end
			end

			SetActive(arg_26_0.immeLabelGo_, true)
		else
			SetActive(arg_26_0.immeLabelGo_, false)
		end

		while #var_26_4 < #arg_26_0.immeRewardItemList_ do
			arg_26_0.immeRewardItemList_[#arg_26_0.immeRewardItemList_]:Dispose()
			table.remove(arg_26_0.immeRewardItemList_, #arg_26_0.immeRewardItemList_)
		end

		local var_26_7 = arg_26_0.itemDesCfg.param[3]

		arg_26_0.dailyLabel_.text = string.format(GetTips("CONSECUTIVE_DAYS"), tostring(var_26_7))

		local var_26_8 = arg_26_0.itemDesCfg.param[2]

		for iter_26_4, iter_26_5 in ipairs(var_26_8) do
			if iter_26_4 <= #arg_26_0.dailyRewardItemList_ then
				arg_26_0.dailyRewardItemList_[iter_26_4]:SetData(iter_26_5[1], iter_26_5[2])
			else
				local var_26_9 = Object.Instantiate(arg_26_0.GiftPopItemPrefab_, arg_26_0.dailyList_)
				local var_26_10 = RechargeGiftPopItem.New(var_26_9)

				var_26_10:SetData(iter_26_5[1], iter_26_5[2])
				table.insert(arg_26_0.dailyRewardItemList_, var_26_10)
			end
		end

		while #var_26_8 < #arg_26_0.dailyRewardItemList_ do
			arg_26_0.dailyRewardItemList_[#arg_26_0.dailyRewardItemList_]:Dispose()
			table.remove(arg_26_0.dailyRewardItemList_, #arg_26_0.dailyRewardItemList_)
		end

		if arg_26_0.layoutTimer_ == nil then
			arg_26_0.layoutTimer_ = Timer.New(function()
				LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.multipleContainer_)
				arg_26_0.layoutTimer_:Stop()

				arg_26_0.layoutTimer_ = nil
			end, 0.05)
		end

		arg_26_0.layoutTimer_:Start()
	end

	arg_26_0.useNumSlider_.minValue = 0

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_0.dailyList_)
end

function var_0_0.GetMaxNum(arg_28_0)
	local var_28_0 = 1

	if arg_28_0.shopCfg.limit_num ~= nil and arg_28_0.shopCfg.limit_num ~= -1 then
		var_28_0 = arg_28_0.shopCfg.limit_num - arg_28_0.buyTime
	end

	if var_28_0 < 1 then
		var_28_0 = 1
	end

	return var_28_0
end

function var_0_0.OnShopBuyResult(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_1 == 0 then
		local var_29_0 = getShopCfg(arg_29_2)
		local var_29_1 = var_29_0.goods_id
		local var_29_2 = var_29_0.give
		local var_29_3 = RechargeShopDescriptionCfg[var_29_0.description].type

		arg_29_0:Back()

		if var_29_3 == ItemConst.ITEM_TYPE.HERO_SKIN then
			getReward({
				{
					id = var_29_1,
					num = var_29_2
				}
			}, {
				ItemConst.ITEM_TYPE.HERO_SKIN
			})
		elseif var_29_3 == ItemConst.ITEM_TYPE.EQUIP then
			if EquipData:GetEquipBagFull() then
				showEquipSendMail(nil)
				EquipAction.EquipBagFull(false)
			else
				ShowTips("TRANSACTION_SUCCESS")
			end
		else
			ShowTips("TRANSACTION_SUCCESS")
		end
	elseif arg_29_1 == 899 then
		ShowMessageBox({
			content = GetTips("EQUIP_NUM_MAX"),
			OkCallback = function()
				JumpTools.GoToSystem("/bag", {
					type = "equip"
				}, ViewConst.SYSTEM_ID.BAG)
			end
		})
	elseif arg_29_1 == 406 then
		ShowTips("ITEM_INVALID")
	elseif arg_29_1 then
		ShowTips(arg_29_1)
	end
end

function var_0_0.AddEventListeners(arg_31_0)
	arg_31_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_32_0)
		local var_32_0

		if arg_31_0:IsOnDiscountArea() then
			local var_32_1 = PaymentCfg[arg_31_0.shopCfg.cheap_cost_id]
		else
			local var_32_2 = PaymentCfg[arg_31_0.shopCfg.cost_id]
		end

		if arg_32_0 == arg_31_0.shopCfg.cheap_cost_id or arg_32_0 == arg_31_0.shopCfg.cost_id then
			arg_31_0:Back()
		end
	end)
	arg_31_0:RegistEventListener(CURRENCY_UPDATE, function(arg_33_0)
		arg_31_0:UpdateView()
	end)
end

function var_0_0.IsOnDiscountArea(arg_34_0)
	local var_34_0, var_34_1, var_34_2 = ShopTools.IsOnDiscountArea(arg_34_0.shopCfg.goods_id)

	if var_34_0 and var_34_2 then
		return true
	else
		return false
	end
end

function var_0_0.OnExit(arg_35_0)
	arg_35_0:RemoveAllEventListener()
	manager.windowBar:HideBar()

	if arg_35_0.timer_ then
		arg_35_0.timer_:Stop()

		arg_35_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_36_0)
	if arg_36_0.list_ then
		arg_36_0.list_:Dispose()

		arg_36_0.list_ = nil
	end

	if arg_36_0.immeRewardItemList_ then
		for iter_36_0, iter_36_1 in ipairs(arg_36_0.immeRewardItemList_) do
			iter_36_1:Dispose()
		end

		arg_36_0.immeRewardItemList_ = nil
	end

	if arg_36_0.immeRewardItemList2_ then
		for iter_36_2, iter_36_3 in ipairs(arg_36_0.immeRewardItemList2_) do
			iter_36_3:Dispose()
		end

		arg_36_0.immeRewardItemList2_ = nil
	end

	if arg_36_0.dailyRewardItemList_ then
		for iter_36_4, iter_36_5 in ipairs(arg_36_0.dailyRewardItemList_) do
			iter_36_5:Dispose()
		end

		arg_36_0.dailyRewardItemList_ = nil
	end

	arg_36_0.useNumSlider_.onValueChanged:RemoveAllListeners()
	var_0_0.super.Dispose(arg_36_0)
end

return var_0_0
