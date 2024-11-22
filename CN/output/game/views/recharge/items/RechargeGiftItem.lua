local var_0_0 = import("game.views.shop.base.ShopItemBase")
local var_0_1 = class("RechargeGiftItem", var_0_0)

function var_0_1.InitUI(arg_1_0)
	arg_1_0:BindCfgUI()

	arg_1_0.haveTimeLimitController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "haveTimeLimit")
	arg_1_0.costTypeController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "costType")
	arg_1_0.tipController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "tip")
	arg_1_0.statusController_ = ControllerUtil.GetController(arg_1_0.gameObject_.transform, "status")
end

function var_0_1.AddUIListener(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.bgBtn_, nil, function()
		if ShopTools.IsPC() and ShopTools.IsRMB(arg_2_0.goodID) then
			if ShopTools.IsLimitRecharge() and ShopConst.PC_LOCK_SHOP[arg_2_0.shopID] ~= true then
				ShowTips("PC_SHOP_TIPS2")

				return
			end

			ShopTools.OpenWebRecharge()

			return
		end

		SendMessageManagerToSDK("purchase_click_gp_once")

		if arg_2_0.statusController_:GetSelectedState() == "normal" then
			if arg_2_0.itemCfg.type == ItemConst.ITEM_TYPE.GIFT and arg_2_0.itemCfg.sub_type == ItemConst.ITEM_SUB_TYPE.FUKUBUKURO then
				JumpTools.OpenPageByJump("rechargeFukubukuro", {
					goodID = arg_2_0.goodID,
					shopID = arg_2_0.shopID
				})
			else
				JumpTools.OpenPageByJump("rechargeGiftPop", {
					goodId = arg_2_0.goodID,
					buyTime = arg_2_0.buyTime,
					itemCfg = ItemCfg[arg_2_0.shopCfg.give_id],
					shopId = arg_2_0.shopID,
					shopCfg = arg_2_0.shopCfg,
					itemDesCfg_ = arg_2_0.itemCfg
				})
			end
		end

		SDKTools.SendPaymentMessageToSDK("payment_touch", {
			payment_giftbox = arg_2_0.goodID
		})
	end)

	if arg_2_0.buttonBtn_ then
		arg_2_0:AddBtnListener(arg_2_0.buttonBtn_, nil, function()
			if ShopTools.IsPC() and ShopTools.IsRMB(arg_2_0.goodID) then
				if ShopConst.PC_LOCK_SHOP[arg_2_0.shopID] ~= true then
					ShowTips("PC_SHOP_TIPS2")

					return
				end

				ShopTools.OpenWebRecharge()

				return
			end

			SendMessageManagerToSDK("purchase_click_gp_once")

			if arg_2_0.statusController_:GetSelectedState() == "normal" then
				if arg_2_0.itemCfg.type == ItemConst.ITEM_TYPE.GIFT and arg_2_0.itemCfg.sub_type == ItemConst.ITEM_SUB_TYPE.FUKUBUKURO then
					JumpTools.OpenPageByJump("rechargeFukubukuro", {
						goodID = arg_2_0.goodID,
						shopID = arg_2_0.shopID
					})
				else
					JumpTools.OpenPageByJump("rechargeGiftPop", {
						goodId = arg_2_0.goodID,
						buyTime = arg_2_0.buyTime,
						itemCfg = ItemCfg[arg_2_0.shopCfg.give_id],
						shopId = arg_2_0.shopID,
						shopCfg = arg_2_0.shopCfg,
						itemDesCfg_ = arg_2_0.itemCfg
					})
				end
			end

			SDKTools.SendPaymentMessageToSDK("payment_touch", {
				payment_giftbox = arg_2_0.goodID
			})
		end)
	end
end

function var_0_1.UpdateTimerView(arg_5_0)
	if #arg_5_0.shopCfg.close_time > 0 and arg_5_0.restNum ~= 0 then
		arg_5_0.haveTimeLimitController_:SetSelectedState("true")

		local var_5_0 = TimeMgr.GetInstance():GetServerTime()
		local var_5_1 = TimeMgr.GetInstance():parseTimeFromConfig(arg_5_0.shopCfg.close_time)

		if var_5_1 <= var_5_0 then
			arg_5_0.lastTimeLabel_.text = GetTips("TIP_EXPIRED")

			if arg_5_0.outOfDateHandler_ ~= nil then
				arg_5_0.outOfDateHandler_(arg_5_0.goodID)
			end
		else
			arg_5_0.lastTimeLabel_.text = string.format(GetTips("TIME_DISPLAY_5"), manager.time:GetLostTimeStr(var_5_1))
		end
	else
		arg_5_0.haveTimeLimitController_:SetSelectedState("false")

		arg_5_0.lastTimeLabel_.text = ""
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.countdownTransform_)
	arg_5_0:UpdatePrice(arg_5_0.goodID)
end

function var_0_1.SetOutOfDateHandler(arg_6_0, arg_6_1)
	arg_6_0.outOfDateHandler_ = arg_6_1
end

function var_0_1.UpdatePrice(arg_7_0)
	local var_7_0, var_7_1, var_7_2 = ShopTools.GetPrice(arg_7_0.goodID)

	arg_7_0.moneyTxt_.text = ShopTools.GetMoneySymbol(arg_7_0.goodID)
	arg_7_0.oldPriceLabel_.text = var_7_1

	if var_7_0 <= 0 then
		arg_7_0.costTypeController_:SetSelectedState("free")
		SetActive(arg_7_0.oldPriceLabel_.gameObject, false)
	else
		if ShopTools.IsRMB(arg_7_0.goodID) then
			arg_7_0.priceText_.text = var_7_0
		else
			arg_7_0:SetCostIcon()
			arg_7_0:SetPriceText(arg_7_0.goodID)
		end

		arg_7_0.costTypeController_:SetSelectedState(ShopTools.IsRMB(arg_7_0.goodID) and "money" or "currency")
	end

	SetActive(arg_7_0.superValueGo_, arg_7_0.shopCfg.tag == ShopConst.TAGS.SUPER_VALUE and arg_7_0.restNum ~= 0)

	local var_7_3, var_7_4, var_7_5 = ShopTools.IsOnDiscountArea(arg_7_0.goodID)

	if var_7_3 and var_7_5 and arg_7_0.restNum ~= 0 then
		SetActive(arg_7_0.limitDiscountGo_, arg_7_0.shopCfg.is_limit_time_discount == 1)
		SetActive(arg_7_0.oldPriceLabel_.gameObject, var_7_0 ~= var_7_1 and var_7_4)

		arg_7_0.discountLabel_.text = ShopTools.GetDiscountLabel(arg_7_0.goodID)

		SetActive(arg_7_0.discountGo_, true)
	else
		SetActive(arg_7_0.limitDiscountGo_, false)
		SetActive(arg_7_0.oldPriceLabel_.gameObject, false)
		SetActive(arg_7_0.discountGo_, false)
	end

	if ShopTools.IsRMB(arg_7_0.goodID) and ShopTools.IsPC() and ShopConst.PC_LOCK_SHOP[arg_7_0.shopID] ~= true then
		arg_7_0.priceText_.text = GetTips("PC_SHOP_TIPS3")
		arg_7_0.moneyTxt_.text = ""
	end
end

function var_0_1.UpdateView(arg_8_0)
	arg_8_0.nameLabel_.text = string.format("%s", GetI18NText(arg_8_0.itemCfg.name))
	arg_8_0.icon_.spriteSync = "TextureConfig/PrizeItem/" .. arg_8_0.itemCfg.icon

	local var_8_0 = ShopTools.CheckSoldOut(arg_8_0.goodID)
	local var_8_1 = ShopTools.CheckLevelEnough(arg_8_0.goodID)
	local var_8_2 = false

	if arg_8_0.shopCfg.limit_num ~= nil and arg_8_0.shopCfg.limit_num ~= -1 then
		local var_8_3 = arg_8_0.shopCfg.limit_num - arg_8_0.buyTime

		arg_8_0.limitLabel_.text = string.format("%d/%d", var_8_3, arg_8_0.shopCfg.limit_num)
		arg_8_0.limitTitle_.text = GetTips(ShopConst.SHOP_LIMIT_TEXT[arg_8_0.shopCfg.refresh_cycle])
	else
		arg_8_0.limitLabel_.text = " "
		arg_8_0.limitTitle_.text = ""
	end

	if ShopTools.CheckGiftSkinOwn(arg_8_0.goodID) then
		arg_8_0.statusController_:SetSelectedState("soldout")

		arg_8_0.soldTxt_.text = GetTips("ALREADY_GET")
	elseif var_8_0 then
		arg_8_0.statusController_:SetSelectedState("soldout")

		arg_8_0.soldTxt_.text = GetTips("SELL_OUT")
	elseif not var_8_1 then
		arg_8_0.statusController_:SetSelectedState("locked")

		local var_8_4 = arg_8_0.shopCfg.level_limit[1][2] or arg_8_0.shopCfg.level_limit[1].num

		arg_8_0.lockLabel_.text = string.format(GetTips("PLAYER_LEVEL_UNLOCK_SHOP_GOODS"), var_8_4)
	else
		arg_8_0.statusController_:SetSelectedState("normal")
	end

	arg_8_0:UpdatePrice()

	local var_8_5, var_8_6, var_8_7 = ShopTools.GetPrice(arg_8_0.goodID)

	if var_8_5 <= 0 and not var_8_0 and var_8_1 then
		var_8_2 = true
	end

	local var_8_8 = arg_8_0.shopCfg.operation_stop_id
	local var_8_9 = OperationData:IsFunctionStoped(var_8_8)

	SetActive(arg_8_0.redPointGo_, var_8_2 and not var_8_9)
	SetActive(arg_8_0.ownGo_, ShopTools.CheckGoodsOwen(arg_8_0.goodID))
end

return var_0_1
