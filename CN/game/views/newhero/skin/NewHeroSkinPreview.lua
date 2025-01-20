local var_0_0 = import("game.views.newHero.skin.NewHeroSkinView")
local var_0_1 = class("NewHeroSkinPreview", var_0_0)

function var_0_1.RefreshShop(arg_1_0)
	arg_1_0:RefreshCurrencyToken(true)
end

function var_0_1.GetSkinItem(arg_2_0)
	return NewHeroSkinPreviewItem.New(arg_2_0.itemGo_, arg_2_0.contentTf_)
end

function var_0_1.OnSelectSkin(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SetButtonActive(8)
end

function var_0_1.OnEnter(arg_4_0)
	ShopTools.FilterShopDataList(ShopConst.SHOP_ID.SKIN_SHOP)

	arg_4_0.descList_ = {}
	arg_4_0.showDlc_ = false

	local var_4_0 = HeroSkinRouteData:GetRoute()

	if not arg_4_0.params_.heroID then
		arg_4_0.heroID_ = var_4_0.heroID
	else
		arg_4_0.heroID_ = arg_4_0.params_.heroID
	end

	if not arg_4_0.params_.isBack then
		if not arg_4_0.params_.skinID then
			arg_4_0.skinID_ = HeroTools.HeroUsingSkinInfo(arg_4_0.heroID_).id
		else
			arg_4_0.skinID_ = arg_4_0.params_.skinID
		end
	end

	arg_4_0.plotController_:SetSelectedState("off")

	arg_4_0.isOpenPlotTalk = false

	manager.heroRaiseTrack:SetModelState(arg_4_0.skinID_)
	arg_4_0:RefreshShop()
	arg_4_0:RegistEventListener(GET_SKIN_GIFT, handler(arg_4_0, arg_4_0.OnGetSkinGift))
	arg_4_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_5_0)
		arg_4_0:RefreshUI()
	end)
	arg_4_0:RefreshUI()

	if arg_4_0.params_.isDlc then
		arg_4_0:ChangeShowDlcState(1)
	elseif not arg_4_0.params_.isBack then
		arg_4_0:ChangeShowDlcState(0)
	else
		arg_4_0:ChangeShowDlcState(arg_4_0.showDlcState_)
	end

	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.BeginDragFun)))
	arg_4_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_4_0, arg_4_0.EndDragFun)))
	arg_4_0:Scroll2SelectItem(100)
end

function var_0_1.RefreshUIWithOutScroll(arg_6_0)
	arg_6_0:RefreshInfo()
	arg_6_0:RefreshCost()
	arg_6_0:SetButtonActive(arg_6_0:SkinState(arg_6_0.skinID_))
end

function var_0_1.RefreshButton(arg_7_0, arg_7_1)
	arg_7_0.selectIndex_ = arg_7_1.index_

	local var_7_0 = arg_7_1:SkinState()
	local var_7_1 = arg_7_1.skinID_

	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_7_1.skinID_, 0, RedPointStyle.SHOW_NEW_TAG)

	if var_7_1 == arg_7_0.skinID_ then
		arg_7_0:Scroll2SelectItem(5)

		return
	end

	OperationRecorder.RecordButtonTouch("hero_skin_" .. var_7_1)

	arg_7_0.skinID_ = var_7_1

	local var_7_2 = SkinCfg[var_7_1]

	arg_7_0:SetButtonActive(var_7_0)
	manager.heroRaiseTrack:SetModelState(arg_7_0.skinID_)
	SetActive(arg_7_0.plotBtn_, #var_7_2.plot_title > 0)
	arg_7_0.plotController_:SetSelectedState("off")

	arg_7_0.isOpenPlotTalk = false

	arg_7_0:RefreshInfo()
	arg_7_0:RefreshCost()
	arg_7_0:CheckDlc(var_7_1, var_7_0)
	arg_7_0:RefreshDlcBtn()
	arg_7_0:ChangeShowDlcState(0)
	arg_7_0:RefreshDescBtn()
	arg_7_0:RefreshGiftBtn()
	arg_7_0:HideMessage()
	arg_7_0:RefreshUI()
	arg_7_0:Scroll2SelectItem(5)
end

function var_0_1.UpdateBar(arg_8_0)
	if arg_8_0.btnState_ == 3 or arg_8_0.dlcBtnController_:GetSelectedState() == "buyDlc" then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId(),
			CurrencyConst.CURRENCY_TYPE_SKIN
		})
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, true)
		manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, true)
	else
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
	end
end

function var_0_1.SetButtonActive(arg_9_0, arg_9_1)
	arg_9_0:CheckDlc(arg_9_0.skinID_, arg_9_1)

	if arg_9_0:JudgeDLC(arg_9_0.skinID_) then
		if not arg_9_0:isDlcOwned() then
			arg_9_0.dlc_dlcController_:SetSelectedIndex(0)
		else
			arg_9_0.dlc_dlcController_:SetSelectedIndex(1)
		end
	end

	if arg_9_1 == 8 and HeroTools.GetHasOwnedSkin(arg_9_0.skinID_) or arg_9_1 == 7 and arg_9_0.skinID_ ~= arg_9_0.heroID_ or arg_9_1 == 9 and HeroTools.GetHasOwnedSkin(arg_9_0.skinID_) then
		arg_9_0.dlc_skinController_:SetSelectedIndex(1)
	else
		arg_9_0.dlc_skinController_:SetSelectedIndex(0)
	end

	if arg_9_0.btnState_ == arg_9_1 then
		return
	end

	arg_9_0.statusController_:SetSelectedIndex(arg_9_1 - 1)

	arg_9_0.btnState_ = arg_9_1

	arg_9_0:UpdateBar()
end

function var_0_1.SkinState(arg_10_0, arg_10_1)
	arg_10_0:ChangeDlcBtn()

	if arg_10_0:isUnlockOrCanChange(arg_10_1) then
		if HeroTools.GetHeroIsUnlock(SkinCfg[arg_10_0.skinID_].hero) == false and arg_10_0.skinID_ == SkinCfg[arg_10_0.skinID_].hero then
			return 7
		end

		if arg_10_0.showDlcState_ == 1 and not arg_10_0:isDlcOwned() then
			return 9
		end

		return 8
	else
		if HeroTools.IsSkinOutOfDate(arg_10_1) then
			if arg_10_0.showDlcState_ == 1 and not arg_10_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_10_0.skinID_) then
				return 9
			end

			if arg_10_0.showDlcState_ == 1 and arg_10_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_10_0.skinID_) then
				return 8
			end

			return 4
		end

		if ShopTools.IsPC() then
			local var_10_0 = HeroTools.GetShopIdBySkinId(arg_10_0.skinID_)

			if ShopTools.IsRMB(var_10_0) then
				return 12
			end
		end

		return 3
	end
end

function var_0_1.ChangeDlcBtn(arg_11_0)
	arg_11_0.dlcBtnController_:SetSelectedIndex(0)

	if arg_11_0:CheckIsSpecial() == 1 then
		arg_11_0:ChangeDlcBtnSpecial()

		return
	end

	if arg_11_0:CheckIsSpecial() == 2 then
		arg_11_0.sourceDlcText_.text = GetI18NText(ItemCfg[arg_11_0.dlcItemID_].desc_source) or ""

		if arg_11_0:isDlcOwned() then
			arg_11_0.dlcBtnController_:SetSelectedIndex(0)
		else
			arg_11_0.dlcBtnController_:SetSelectedIndex(4)
		end

		return
	end

	if arg_11_0:isUnlock(arg_11_0.skinID_) then
		if arg_11_0:JudgeDLC(arg_11_0.skinID_) and not arg_11_0:isDlcOwned() then
			local var_11_0 = getShopCfg(arg_11_0.dlcID_)

			if ShopTools.CheckShopIsUnLock(var_11_0.shop_id) and ShopTools.IsGoodCanDisplay(var_11_0.shop_id, var_11_0.goods_id) then
				arg_11_0.dlcBtnController_:SetSelectedIndex(1)
			end
		end
	elseif not arg_11_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_11_0.skinID_) then
		arg_11_0.dlcBtnController_:SetSelectedIndex(1)
	end
end

function var_0_1.SaveRoute(arg_12_0)
	local var_12_0 = {
		name = "heroSkinPreview",
		skinID = arg_12_0.skinID_,
		heroID = arg_12_0.heroID_
	}

	SkinTrialData:SaveRoute(var_12_0)
end

function var_0_1.AddBtnListenerOther(arg_13_0)
	arg_13_0:AddBtnListener(arg_13_0.btn_dlcSpecialExchangeBtn_, nil, function()
		local var_14_0 = getShopCfg(arg_13_0.dlcID_)

		ShowMessageBox({
			content = string.format(GetTips("SHOP_DLC_LINK"), ItemTools.getItemName(var_14_0.give_id)),
			OkCallback = function()
				if var_14_0 then
					JumpTools.GoToSystem("/shop", {
						shopId = var_14_0.shop_id
					}, ViewConst.SYSTEM_ID.SHOP)
				end
			end,
			CancelCallback = function()
				return
			end
		})
	end)
end

function var_0_1.OnTryToUseItemOther(arg_17_0, arg_17_1)
	arg_17_0:SetButtonActive(8)
end

function var_0_1.ChangeShowDlcStateOther(arg_18_0)
	arg_18_0:RefreshCost()
	arg_18_0:ChangeDlcBtn()
	arg_18_0:RefreshInfo()
	arg_18_0:SetButtonActive(arg_18_0:SkinState(arg_18_0.skinID_))
	arg_18_0:RefreshInfo()
end

function var_0_1.RefreshInfoOther(arg_19_0)
	arg_19_0:RefreshLimitTime(arg_19_0.skinID_)
end

function var_0_1.RefreshCost(arg_20_0)
	local var_20_0 = getShopCfg(HeroTools.GetShopIdBySkinId(arg_20_0.skinID_))

	SetActive(arg_20_0.tokenPlusGo_, false)

	if var_20_0 then
		local var_20_1 = 0
		local var_20_2 = 0
		local var_20_3
		local var_20_4 = var_20_0.dlc or nil

		if var_20_4 and var_20_4 ~= 0 and getShopCfg(var_20_4) then
			var_20_1 = ShopTools.GetPrice(var_20_4)
		end

		local var_20_5 = ShopTools.GetPrice(var_20_0.goods_id, var_20_0.shop_id)

		if arg_20_0:CheckIsSpecial() == 0 and arg_20_0.showDlcState_ == 1 then
			SetActive(arg_20_0.tokenPlusGo_, true)

			var_20_5 = var_20_5 + var_20_1
		end

		if var_20_0.cost_type == 1 then
			arg_20_0.currencyImage_.sprite = nil
			arg_20_0.currencyText_.text = ShopTools.GetMoneySymbol(var_20_0.goods_id) .. var_20_5

			SetActive(arg_20_0.currencyGo_, false)
		else
			arg_20_0.currencyImage_.sprite = ItemTools.getItemLittleSprite(var_20_0.cost_id)
			arg_20_0.currencyText_.text = var_20_5

			SetActive(arg_20_0.currencyGo_, true)
		end

		if var_20_1 and var_20_1 ~= 0 then
			SetActive(arg_20_0.dlctokenGo_, true)

			if ShopTools.IsRMB(var_20_4) then
				arg_20_0.dlccurrencyImage_.sprite = nil
				arg_20_0.dlccurrencyText_.text = ShopTools.GetMoneySymbol(var_20_4) .. var_20_1

				SetActive(arg_20_0.dlccurrencyGo_, false)
			else
				arg_20_0.dlccurrencyImage_.sprite = ItemTools.getItemLittleSprite(var_20_0.cost_id)
				arg_20_0.dlccurrencyText_.text = var_20_1

				SetActive(arg_20_0.dlccurrencyGo_, true)
			end
		elseif var_20_4 and var_20_4 ~= 0 and var_20_1 == 0 then
			local var_20_6

			_, var_20_6 = ShopTools.GetPrice(var_20_4)
			arg_20_0.dlccurrencyImage_.sprite = ItemTools.getItemLittleSprite(var_20_0.cost_id)
			arg_20_0.dlccurrencyText_.text = var_20_6
		end
	end

	arg_20_0:RefreshTokenNumText()
end

function var_0_1.RefreshTokenNumText(arg_21_0)
	if ShopTools.IsPC() then
		SetActive(arg_21_0.tokenNum1Go_, false)
		SetActive(arg_21_0.tokenNum2Go_, false)

		return
	end

	if arg_21_0:CheckIsSpecial() == 1 then
		SetActive(arg_21_0.tokenNum1Go_, false)
		SetActive(arg_21_0.tokenNum2Go_, false)

		return
	end

	if HeroTools.IsSkinOnlySellDLC(arg_21_0.skinID_) then
		if arg_21_0:isDlcOwned() then
			SetActive(arg_21_0.tokenNum1Go_, false)
			SetActive(arg_21_0.tokenNum2Go_, false)

			return
		else
			SetActive(arg_21_0.tokenNum1Go_, true)
			SetActive(arg_21_0.tokenNum2Go_, false)

			return
		end
	end

	if HeroTools.IsSkinOutOfDate(arg_21_0.skinID_) then
		SetActive(arg_21_0.tokenNum1Go_, false)
		SetActive(arg_21_0.tokenNum2Go_, false)

		return
	end

	if arg_21_0.showDlcState_ == 1 and not arg_21_0:isUnlock(arg_21_0.skinID_) then
		SetActive(arg_21_0.tokenNum1Go_, false)
		SetActive(arg_21_0.tokenNum2Go_, true)

		return
	end

	if arg_21_0.showDlcState_ == 0 and not arg_21_0:isUnlockOrCanChange(arg_21_0.skinID_) or arg_21_0.showDlcState_ == 1 and arg_21_0:isUnlockOrCanChange(arg_21_0.skinID_) and not arg_21_0:isDlcOwned() then
		SetActive(arg_21_0.tokenNum1Go_, true)
		SetActive(arg_21_0.tokenNum2Go_, false)

		return
	end

	SetActive(arg_21_0.tokenNum1Go_, false)
	SetActive(arg_21_0.tokenNum2Go_, false)
end

return var_0_1
