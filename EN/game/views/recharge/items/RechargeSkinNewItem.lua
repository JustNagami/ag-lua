local var_0_0 = import("game.views.shop.base.ShopItemBase")
local var_0_1 = class("RechargeSkinNewItem", var_0_0)

function var_0_1.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()

	arg_1_0.costTypeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "costType")
	arg_1_0.isLimitTimeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "isLimitTime")
	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "status")
	arg_1_0.levelController_ = ControllerUtil.GetController(arg_1_0.transform_, "level")
end

function var_0_1.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.bgBtn_, nil, function()
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

function var_0_1.SetOutOfDateHandler(arg_6_0, arg_6_1)
	arg_6_0.outOfDateHandler_ = arg_6_1
end

function var_0_1.UpdateTimerView(arg_7_0)
	local var_7_0 = arg_7_0.shopCfg

	if #var_7_0.close_time > 0 then
		arg_7_0.isLimitTimeController_:SetSelectedState("true")

		arg_7_0.lastTimeLabel_.text = TimeMgr.GetInstance():parseTimeFromConfig(var_7_0.close_time)

		local var_7_1 = TimeMgr.GetInstance():GetServerTime()
		local var_7_2 = TimeMgr.GetInstance():parseTimeFromConfig(var_7_0.close_time)

		if var_7_2 <= var_7_1 then
			arg_7_0.lastTimeLabel_.text = GetTips("TIP_EXPIRED")

			if arg_7_0.outOfDateHandler_ ~= nil then
				arg_7_0.outOfDateHandler_(var_7_0.goods_id)
			end
		else
			arg_7_0.lastTimeLabel_.text = string.format("%s", manager.time:GetLostTimeStr(var_7_2))
		end
	else
		arg_7_0.isLimitTimeController_:SetSelectedState("false")

		arg_7_0.lastTimeLabel_.text = ""
	end

	arg_7_0:RefreshPriceUI(arg_7_0.goodID)
end

function var_0_1.UpdateView(arg_8_0)
	arg_8_0.levelController_:SetSelectedState(tostring(arg_8_0.skinCfg.skin_level))

	if ShopTools.HaveSkin(arg_8_0.skinCfg.id) or HeroTools.CanChangeSkin(arg_8_0.skinCfg.id) then
		arg_8_0.bgBtn_.interactable = false
	else
		arg_8_0.bgBtn_.interactable = true
	end

	arg_8_0:RefreshCommonUI()
	arg_8_0:RefreshPriceUI(arg_8_0.goodID)
end

function var_0_1.RefreshCommonUI(arg_9_0)
	local var_9_0 = ItemCfg[arg_9_0.skinCfg.hero]

	arg_9_0.nameLabel_.text = string.format("%s", arg_9_0.skinCfg.name)
	arg_9_0.titleLabel_.text = ItemTools.getItemName(var_9_0.id)
	arg_9_0.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. arg_9_0.skinCfg.picture_id)
end

function var_0_1.RefreshPriceUI(arg_10_0, arg_10_1)
	arg_10_0:UpdatePrice(arg_10_1)

	if ShopTools.HaveSkin(arg_10_0.skinCfg.id) or HeroTools.CanChangeSkin(arg_10_0.skinCfg.id) then
		arg_10_0.statusController_:SetSelectedState("sellout")
	else
		arg_10_0.statusController_:SetSelectedState(arg_10_0.shopCfg.give_back_list and #arg_10_0.shopCfg.give_back_list > 0 and "back" or "normal")
	end

	if arg_10_0.shopCfg.give_back_list and #arg_10_0.shopCfg.give_back_list > 0 then
		arg_10_0.rebackTxt_.text = arg_10_0.shopCfg.give_back_list[1].num
		arg_10_0.rebackSkinIcon_.sprite = ItemTools.getItemSprite(arg_10_0.shopCfg.give_back_list[1].id)
	end
end

function var_0_1.UpdatePrice(arg_11_0, arg_11_1)
	local var_11_0 = getShopCfg(arg_11_1)
	local var_11_1, var_11_2, var_11_3 = ShopTools.GetPrice(arg_11_1)

	arg_11_0.moneyTxt_.text = ShopTools.GetMoneySymbol(arg_11_1)

	if var_11_1 <= 0 then
		arg_11_0.costTypeController_:SetSelectedState("free")
	else
		if ShopTools.IsRMB(arg_11_1) then
			arg_11_0.priceText_.text = var_11_1

			if ShopTools.IsLimitRecharge() then
				arg_11_0.priceText_.text = GetTips("PC_SHOP_TIPS3")
			end
		else
			arg_11_0:SetCostIcon()
			arg_11_0:SetPriceText(arg_11_1)
		end

		arg_11_0.costTypeController_:SetSelectedState(ShopTools.IsRMB(arg_11_1) and "money" or "currency")
	end

	SetActive(arg_11_0.superValueGo_, var_11_0.tag == ShopConst.TAGS.SUPER_VALUE)

	arg_11_0.oldPriceLabel_.text = var_11_2

	local var_11_4, var_11_5, var_11_6 = ShopTools.IsOnDiscountArea(arg_11_0.goodID)

	if var_11_4 and var_11_6 then
		SetActive(arg_11_0.limitDiscountGo_, arg_11_0.shopCfg.is_limit_time_discount == 1)
		SetActive(arg_11_0.oldPriceLabel_.gameObject, var_11_1 ~= var_11_2 and var_11_5 and ShopTools.IsLimitRecharge() == false)
	else
		SetActive(arg_11_0.limitDiscountGo_, false)
		SetActive(arg_11_0.oldPriceLabel_.gameObject, false)
	end

	if ShopTools.IsRMB(arg_11_1) and ShopTools.IsLimitRecharge() then
		arg_11_0.priceText_.text = GetTips("PC_SHOP_TIPS3")
		arg_11_0.moneyTxt_.text = ""
	end

	SetActive(arg_11_0.discountGo_, false)
end

return var_0_1
