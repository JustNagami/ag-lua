local var_0_0 = import("game.views.shop.base.ShopItemBase")
local var_0_1 = class("RechargeSkinNewItem", var_0_0)

function var_0_1.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()

	arg_1_0.icon_.immediate = true
	arg_1_0.costTypeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "costType")
	arg_1_0.isLimitTimeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "isLimitTime")
	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "status")
	arg_1_0.levelController_ = ControllerUtil.GetController(arg_1_0.transform_, "level")
	arg_1_0.giftController_ = ControllerUtil.GetController(arg_1_0.transform_, "gift")
	arg_1_0.dlcController_ = ControllerUtil.GetController(arg_1_0.transform_, "dlc")
end

function var_0_1.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.bgBtn_, nil, function()
		local var_3_0 = SkinDiscountGiftTools.HasDiscountGoodsID(arg_2_0.goodID)

		if var_3_0 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = GetTips("ACTIVITY_SKIN_DISCOUNT_HIGH_COST_EFFECTIVENESS_TIPS_1"),
				OkCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_enter", var_3_0),
						source = SkinDiscountGiftConst.EXIST_GIFT_AND_JUMP_TIPS
					})
					SkinDiscountGiftAction.JumpToSkinDiscountGiftWindow(arg_2_0.goodID)
				end,
				CancelCallback = function()
					OperationRecorder.RecordButtonTouch({
						button_name = string.format("message_push_activity_%s_close", var_3_0),
						source = SkinDiscountGiftConst.EXIST_GIFT_AND_JUMP_TIPS
					})
					arg_2_0:OnClickItem()
				end
			})
		else
			arg_2_0:OnClickItem()
		end
	end)
	arg_2_0:AddBtnListener(arg_2_0.bottomBtn_, nil, function()
		SendMessageManagerToSDK("purchase_click_skin")
		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_skin = arg_2_0.skinCfg.id
		})
		arg_2_0:Go("/heroSkinPreview", {
			isShop = true,
			heroID = arg_2_0.skinCfg.hero,
			skinID = arg_2_0.skinCfg.id,
			goodId = arg_2_0.goodID,
			shopID = arg_2_0.shopID
		})
		OperationRecorder.RecordButtonTouch("buy_skin_button_" .. arg_2_0.skinCfg.id)
	end)
	arg_2_0:AddBtnListener(arg_2_0.pcBtn_, nil, function()
		ShowTips("PC_SHOP_TIPS2")
	end)
end

function var_0_1.OnClickItem(arg_8_0)
	SendMessageManagerToSDK("purchase_click_skin")
	SDKTools.SendPaymentMessageToSDK("payment_touch", {
		payment_skin = arg_8_0.skinCfg.id
	})
	arg_8_0:Go("/heroSkinPreview", {
		isShop = true,
		heroID = arg_8_0.skinCfg.hero,
		skinID = arg_8_0.skinCfg.id,
		goodId = arg_8_0.goodID,
		shopID = arg_8_0.shopID
	})
	OperationRecorder.RecordButtonTouch("buy_skin_button_" .. arg_8_0.skinCfg.id)

	if arg_8_0.callback_ then
		arg_8_0.callback_(arg_8_0.index_)
	end
end

function var_0_1.SetOutOfDateHandler(arg_9_0, arg_9_1)
	arg_9_0.outOfDateHandler_ = arg_9_1
end

function var_0_1.SetCallBack(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.callback_ = arg_10_1
	arg_10_0.index_ = arg_10_2
end

function var_0_1.UpdateTimerView(arg_11_0)
	local var_11_0 = arg_11_0.shopCfg

	if #var_11_0.close_time > 0 then
		arg_11_0.isLimitTimeController_:SetSelectedState("true")

		arg_11_0.lastTimeLabel_.text = TimeMgr.GetInstance():parseTimeFromConfig(var_11_0.close_time)

		local var_11_1 = TimeMgr.GetInstance():GetServerTime()
		local var_11_2 = TimeMgr.GetInstance():parseTimeFromConfig(var_11_0.close_time)

		if var_11_2 <= var_11_1 then
			arg_11_0.lastTimeLabel_.text = GetTips("TIP_EXPIRED")

			if arg_11_0.outOfDateHandler_ ~= nil then
				arg_11_0.outOfDateHandler_(var_11_0.goods_id)
			end
		else
			arg_11_0.lastTimeLabel_.text = string.format("%s", manager.time:GetLostTimeStr(var_11_2))
		end
	else
		arg_11_0.isLimitTimeController_:SetSelectedState("false")

		arg_11_0.lastTimeLabel_.text = ""
	end

	if arg_11_0.dlcID ~= 0 then
		local var_11_3 = ShopTools.GetDiscount(arg_11_0.dlcID)
		local var_11_4, var_11_5, var_11_6 = ShopTools.IsOnDiscountArea(arg_11_0.dlcID)

		arg_11_0.giftController_:SetSelectedState(var_11_4 and var_11_6 and var_11_3 == 0 and "true" or "false")
	end

	arg_11_0:RefreshPriceUI(arg_11_0.goodID)
end

function var_0_1.UpdateView(arg_12_0)
	arg_12_0.levelController_:SetSelectedState(tostring(arg_12_0.skinCfg.skin_level))

	if ShopTools.HaveSkin(arg_12_0.skinCfg.id) or HeroTools.CanChangeSkin(arg_12_0.skinCfg.id) then
		arg_12_0.bgBtn_.interactable = false
	else
		arg_12_0.bgBtn_.interactable = true
	end

	arg_12_0:RefreshCommonUI()
	arg_12_0:RefreshPriceUI(arg_12_0.goodID)
end

function var_0_1.RefreshCommonUI(arg_13_0)
	local var_13_0 = ItemCfg[arg_13_0.skinCfg.hero]

	arg_13_0.nameLabel_.text = string.format("%s", arg_13_0.skinCfg.name)
	arg_13_0.titleLabel_.text = ItemTools.getItemName(var_13_0.id)
	arg_13_0.icon_.spriteSync = "TextureConfig/Character/Icon/" .. arg_13_0.skinCfg.picture_id

	if arg_13_0.goodID < 0 then
		arg_13_0.soldTxt_.text = GetTips("ALREADY_GET")
	else
		arg_13_0.soldTxt_.text = GetTips("SELL_OUT")
	end
end

function var_0_1.RefreshPriceUI(arg_14_0, arg_14_1)
	arg_14_0:UpdatePrice(arg_14_1)

	if ShopTools.HaveSkin(arg_14_0.skinCfg.id) or HeroTools.CanChangeSkin(arg_14_0.skinCfg.id) then
		arg_14_0.statusController_:SetSelectedState("sellout")
	else
		arg_14_0.statusController_:SetSelectedState(arg_14_0.shopCfg.give_back_list and #arg_14_0.shopCfg.give_back_list > 0 and "back" or "normal")
	end

	if arg_14_0.shopCfg.give_back_list and #arg_14_0.shopCfg.give_back_list > 0 then
		arg_14_0.rebackTxt_.text = arg_14_0.shopCfg.give_back_list[1].num
		arg_14_0.rebackSkinIcon_.sprite = ItemTools.getItemSprite(arg_14_0.shopCfg.give_back_list[1].id)
	end
end

function var_0_1.UpdatePrice(arg_15_0, arg_15_1)
	local var_15_0 = getShopCfg(arg_15_1)
	local var_15_1, var_15_2, var_15_3 = ShopTools.GetPrice(arg_15_1)

	arg_15_0.moneyTxt_.text = ShopTools.GetMoneySymbol(arg_15_1)

	if var_15_1 <= 0 then
		arg_15_0.costTypeController_:SetSelectedState("free")
	else
		if ShopTools.IsRMB(arg_15_1) then
			arg_15_0.priceText_.text = var_15_1

			if ShopTools.IsPC() then
				arg_15_0.priceText_.text = GetTips("PC_SHOP_TIPS3")
			end
		else
			arg_15_0:SetCostIcon()
			arg_15_0:SetPriceText(arg_15_1)
		end

		arg_15_0.costTypeController_:SetSelectedState(ShopTools.IsRMB(arg_15_1) and "money" or "currency")
	end

	if arg_15_0.goodID < 0 then
		arg_15_0.costTypeController_:SetSelectedState("Events")
	end

	SetActive(arg_15_0.superValueGo_, var_15_0.tag == ShopConst.TAGS.SUPER_VALUE)

	arg_15_0.oldPriceLabel_.text = var_15_2

	local var_15_4, var_15_5, var_15_6 = ShopTools.IsOnDiscountArea(arg_15_0.goodID)

	if var_15_4 and var_15_6 then
		SetActive(arg_15_0.limitDiscountGo_, arg_15_0.shopCfg.is_limit_time_discount == 1)
		SetActive(arg_15_0.oldPriceLabel_.gameObject, var_15_1 ~= var_15_2 and var_15_5 and ShopTools.IsPC() == false)
	else
		SetActive(arg_15_0.limitDiscountGo_, false)
		SetActive(arg_15_0.oldPriceLabel_.gameObject, false)
	end

	if ShopTools.IsRMB(arg_15_1) and ShopTools.IsPC() then
		arg_15_0.priceText_.text = GetTips("PC_SHOP_TIPS3")
		arg_15_0.moneyTxt_.text = ""
	end

	SetActive(arg_15_0.discountGo_, false)
end

return var_0_1
