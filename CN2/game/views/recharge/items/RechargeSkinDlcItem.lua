local var_0_0 = import("game.views.shop.base.ShopItemBase")
local var_0_1 = class("RechargeSkinDlcItem", var_0_0)

function var_0_1.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()

	arg_1_0.dlcImg_.immediate = true
	arg_1_0.isLimitTimeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "isLimitTime")
	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "status")
	arg_1_0.btnController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "btn")
	arg_1_0.btn2Controller_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "btn2")
end

function var_0_1.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.bgBtn_, nil, function()
		SendMessageManagerToSDK("purchase_click_skin")
		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_skin = arg_2_0.skinCfg.id
		})

		if ShopConst.SHOP_ID.DLC_SHOP ~= arg_2_0.shopCfg.shop_id then
			if ShopTools.HaveSkin(arg_2_0.skinId) then
				ShowMessageBox({
					content = string.format(GetTips("SHOP_DLC_LINK"), ItemTools.getItemName(arg_2_0.shopCfg.give_id)),
					OkCallback = function()
						JumpTools.GoToSystem("/shop", {
							shopId = arg_2_0.shopID,
							goodId = arg_2_0.goodID
						}, ViewConst.SYSTEM_ID.SHOP)
					end
				})

				return
			end

			arg_2_0:Go("/heroSkinPreview", {
				isShop = true,
				isDlc = true,
				heroID = arg_2_0.skinCfg.hero,
				skinID = arg_2_0.skinCfg.id,
				shopID = arg_2_0.shopID
			})
			OperationRecorder.RecordButtonTouch("buy_skin_button_" .. arg_2_0.goodID)
		else
			arg_2_0:Go("/heroSkinPreview", {
				isShop = true,
				isDlc = true,
				heroID = arg_2_0.skinCfg.hero,
				skinID = arg_2_0.skinCfg.id,
				shopID = arg_2_0.shopID
			})
			OperationRecorder.RecordButtonTouch("buy_skin_button_" .. arg_2_0.goodID)
		end
	end)
end

function var_0_1.SetOutOfDateHandler(arg_5_0, arg_5_1)
	arg_5_0.outOfDateHandler_ = arg_5_1
end

function var_0_1.SetData(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.shopCfg = getShopCfg(arg_6_1)
	arg_6_0.goodID = arg_6_1
	arg_6_0.skinGoodId = arg_6_3
	arg_6_0.shopID = arg_6_0.shopCfg.shop_id
	arg_6_0.skinId = arg_6_2
	arg_6_0.skinCfg = SkinCfg[arg_6_2]
	arg_6_0.canBuyDlc = ShopConst.SHOP_ID.DLC_SHOP == arg_6_0.shopCfg.shop_id and ShopTools.CheckDlcPurchased(arg_6_1) == false
	arg_6_0.itemCfg = RechargeShopDescriptionCfg[arg_6_0.shopCfg.description]

	if arg_6_0.itemCfg == nil then
		arg_6_0.itemCfg = ItemCfg[arg_6_0.shopCfg.give_id]
	end

	arg_6_0:UpdateView()
	arg_6_0:UpdateTimerView()
end

function var_0_1.UpdateTimerView(arg_7_0)
	arg_7_0.isLimitTimeController_:SetSelectedState("false")
	arg_7_0:RefreshCommonUI()
	arg_7_0:RefreshPriceUI()
end

function var_0_1.UpdateView(arg_8_0)
	arg_8_0:RefreshPriceUI()
	arg_8_0:RefreshCommonUI()

	local var_8_0 = ItemCfg[arg_8_0.skinCfg.hero]

	arg_8_0.nameLabel_.text = string.format("%s", arg_8_0.itemCfg.name)
	arg_8_0.titleLabel_.text = ItemTools.getItemName(var_8_0.id)
	arg_8_0.dlcPriceTxt_.text = ShopTools.GetPrice(arg_8_0.goodID)
	arg_8_0.dlcImg_.spriteSync = "TextureConfig/Character/Icon/" .. arg_8_0.itemCfg.id
	arg_8_0.costIcon_.sprite = ItemTools.getItemSprite(arg_8_0.shopCfg.cost_id)

	if ShopTools.IsPC() then
		SetActive(arg_8_0.pcBtn_.gameObject, ShopTools.IsRMB(arg_8_0.goodID))
	end
end

function var_0_1.RefreshCommonUI(arg_9_0)
	SetActive(arg_9_0.discountGo_, false)
	SetActive(arg_9_0.limitGiveGo_, false)
	SetActive(arg_9_0.superValueGo_, arg_9_0.shopCfg.tag == ShopConst.TAGS.SUPER_VALUE)

	local var_9_0, var_9_1, var_9_2 = ShopTools.IsOnDiscountArea(arg_9_0.goodID)
	local var_9_3 = ShopTools.GetDiscount(arg_9_0.goodID)

	if var_9_0 and var_9_2 and #arg_9_0.shopCfg.cheap_close_time > 0 then
		SetActive(arg_9_0.limitDiscountGo_, arg_9_0.shopCfg.is_limit_time_discount == 1)
	else
		SetActive(arg_9_0.limitDiscountGo_, false)
	end

	arg_9_0.btn2Controller_:SetSelectedState("false")

	if var_9_3 == 0 and var_9_0 and var_9_2 then
		SetActive(arg_9_0.limitDiscountGo_, false)
		SetActive(arg_9_0.limitGiveGo_, true)
		arg_9_0.btn2Controller_:SetSelectedState("true")
	end

	arg_9_0.btnController_:SetSelectedState(tostring(ShopTools.HaveSkin(arg_9_0.skinCfg.id) and HomeSceneSettingData:GetUsedState(arg_9_0.itemCfg.id) ~= SceneConst.HOME_SCENE_TYPE.UNLOCK))
end

function var_0_1.RefreshPriceUI(arg_10_0, arg_10_1)
	if ShopConst.SHOP_ID.DLC_SHOP == arg_10_0.shopCfg.shop_id and ShopTools.CheckDlcPurchased(arg_10_0.goodID) == false then
		arg_10_0.statusController_:SetSelectedState(arg_10_0.shopCfg.give_back_list and #arg_10_0.shopCfg.give_back_list > 0 and "back" or "normal")
	elseif ShopTools.CheckDlcPurchased(arg_10_0.goodID) == false then
		arg_10_0.statusController_:SetSelectedState("normal")
	else
		arg_10_0.statusController_:SetSelectedState("sellout")
	end

	if arg_10_0.shopCfg.give_back_list and #arg_10_0.shopCfg.give_back_list > 0 then
		arg_10_0.rebackTxt_.text = arg_10_0.shopCfg.give_back_list[1].num
	end
end

return var_0_1
