local var_0_0 = class("NewHeroSkinView", ReduxView)
local var_0_1 = {
	NURSE = 1,
	DLC_ACTIVITY = 2
}

function var_0_0.isDlcOwned(arg_1_0)
	local var_1_0 = false

	if arg_1_0.dlcID_ and arg_1_0.dlcID_ ~= 0 then
		var_1_0 = ShopTools.CheckDlcPurchased(arg_1_0.dlcID_)
	else
		var_1_0 = ShopTools.CheckDlcPurchasedByItemID(arg_1_0.dlcItemID_)
	end

	return var_1_0
end

function var_0_0.isUnlock(arg_2_0, arg_2_1)
	return HeroTools.GetHasOwnedSkin(arg_2_1)
end

function var_0_0.isUnlockOrCanChange(arg_3_0, arg_3_1)
	return arg_3_0:isUnlock(arg_3_1) or HeroTools.CanChangeSkin(arg_3_1)
end

function var_0_0.isSelect(arg_4_0, arg_4_1)
	if HeroTools.HeroUsingSkinInfo(SkinCfg[arg_4_1].hero).id == arg_4_1 then
		return true
	end

	return false
end

function var_0_0.UIName(arg_5_0)
	return "Widget/System/Hero/HeroSkinUI_new"
end

function var_0_0.UIParent(arg_6_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_7_0)
	arg_7_0.skinIdList_ = {}
	arg_7_0.skinItemList_ = {}
	arg_7_0.descInfoList_ = {}
	arg_7_0.btnState_ = nil
	arg_7_0.skinID_ = 1
	arg_7_0.selectIndex_ = 1
	arg_7_0.isCanUnlock_ = false
	arg_7_0.dlcMovie_ = nil
	arg_7_0.dlcPlayer_ = nil
	arg_7_0.dlcBgMovie_ = nil
	arg_7_0.dlcBgPlayer_ = nil

	arg_7_0:InitUI()
	arg_7_0:AddUIListener()
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0:UpdateBar()
	arg_8_0:RefreshUIWithOutScroll()

	if arg_8_0.showDlcState_ == 1 then
		arg_8_0:RefreshDlcMovie()
	end
end

function var_0_0.OnBehind(arg_9_0)
	if arg_9_0.showDlcState_ == 1 then
		arg_9_0:PauseDlcMovie()
	end
end

function var_0_0.CameraEnter(arg_10_0)
	if not arg_10_0.params_.isBack then
		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
			1,
			4
		}, arg_10_0.displayGo_)
	elseif arg_10_0.showDlcState_ == 1 then
		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.null)
	else
		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
			1,
			4
		}, arg_10_0.displayGo_)
	end
end

function var_0_0.OnExit(arg_11_0)
	arg_11_0.dlcHideMovieController_:SetSelectedIndex(0)

	if arg_11_0.delayPlayTimer_ then
		arg_11_0.delayPlayTimer_:Stop()

		arg_11_0.delayPlayTimer_ = nil
	end

	arg_11_0:StopMovieStopTimer()
	arg_11_0:StopMovieTimer()
	arg_11_0:StopMoveTimer()
	arg_11_0:CleanMessage()
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()
	arg_11_0:RemoveAllEventListener()
	arg_11_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_11_0.eventTriggerListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)

	if arg_11_0.dlcMovie_ then
		arg_11_0.dlcMovie_:Stop()
	end

	if arg_11_0.dlcBgMovie_ then
		arg_11_0.dlcBgMovie_:Stop()
	end

	if arg_11_0.dlcPlayer_ then
		arg_11_0.dlcPlayer_.statusChangeCallback = nil
	end

	if arg_11_0.dlcBgPlayer_ then
		arg_11_0.dlcBgPlayer_.statusChangeCallback = nil
	end

	arg_11_0.dlcPlayer_ = nil
	arg_11_0.dlcMovie_ = nil
	arg_11_0.dlcBgMovie_ = nil
	arg_11_0.dlcBgPlayer_ = nil
	arg_11_0.movieSkinId_ = 0

	local var_11_0 = {
		heroID = arg_11_0.heroID_,
		skinID = arg_11_0.skinID_
	}

	HeroSkinRouteData:SaveRoute(var_11_0)
end

function var_0_0.Dispose(arg_12_0)
	if arg_12_0.delayPlayTimer_ then
		arg_12_0.delayPlayTimer_:Stop()

		arg_12_0.delayPlayTimer_ = nil
	end

	arg_12_0:StopMovieStopTimer()
	arg_12_0:StopMovieTimer()
	arg_12_0:StopMoveTimer()
	arg_12_0:RemoveAllListeners()
	arg_12_0:CleanMessage()

	if arg_12_0.plotItemList_ then
		for iter_12_0, iter_12_1 in ipairs(arg_12_0.plotItemList_) do
			iter_12_1:Dispose()
		end

		arg_12_0.plotItemList_ = nil
	end

	if arg_12_0.skinItemList_ then
		for iter_12_2, iter_12_3 in ipairs(arg_12_0.skinItemList_) do
			iter_12_3:Dispose()
		end

		arg_12_0.skinItemList_ = nil
	end

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.InitUI(arg_13_0)
	arg_13_0:BindCfgUI()
	arg_13_0:InitBtnState()
	arg_13_0:InitDescBtn()

	arg_13_0.haveDLCController_ = arg_13_0.controllerEx_:GetController("haveDLC")
	arg_13_0.timeController_ = arg_13_0.controllerEx_:GetController("Time")
	arg_13_0.giftController_ = arg_13_0.controllerEx_:GetController("Gift")
	arg_13_0.plotController_ = arg_13_0.controllerEx_:GetController("Plot")
	arg_13_0.infoController_ = arg_13_0.controllerEx_:GetController("Info")
	arg_13_0.statusController_ = arg_13_0.controllerEx_:GetController("Btn")
	arg_13_0.dlcController_ = arg_13_0.controllerEx_:GetController("DLC")
	arg_13_0.dlcBtnController_ = arg_13_0.controllerEx_:GetController("dlcBtn")
	arg_13_0.dlcHideMovieController_ = arg_13_0.controllerEx_:GetController("dlcMovieHide")
	arg_13_0.unlockController_ = arg_13_0.lockControllerEx_:GetController("clear")
	arg_13_0.taskController_1 = arg_13_0.lockControllerEx_:GetController("task01")
	arg_13_0.taskController_2 = arg_13_0.lockControllerEx_:GetController("task02")
	arg_13_0.dlc_skinController_ = arg_13_0.dlc_skinControllerEx_:GetController("get")
	arg_13_0.dlc_dlcController_ = arg_13_0.dlc_dlcControllerEx_:GetController("get")
	arg_13_0.buyBtnController_ = arg_13_0.goBtnControllerEx_:GetController("gift")
end

function var_0_0.InitBtnState(arg_14_0)
	arg_14_0.btnState = {
		"btn_now",
		"btn_replace",
		"btn_go",
		"sourcetext",
		"btn_change",
		"unlockinfo",
		"hero_donthave",
		"btn_now_shop",
		"hide",
		"limit_equipped",
		"limit_unequipped",
		"pc_cant_rmb"
	}
end

function var_0_0.InitDescBtn(arg_15_0)
	arg_15_0.descBtn_ = {
		arg_15_0.descBtn_1,
		arg_15_0.descBtn_2,
		arg_15_0.descBtn_3,
		arg_15_0.descBtn_4,
		arg_15_0.descBtn_5,
		arg_15_0.descBtn_6,
		arg_15_0.descBtn_7
	}
	arg_15_0.descBtnGo_ = {}

	for iter_15_0 = 1, 7 do
		arg_15_0.descBtnGo_[iter_15_0] = arg_15_0["descBtnGo_" .. iter_15_0]
	end
end

function var_0_0.CheckIsSpecial(arg_16_0)
	if not arg_16_0.dlcID_ then
		arg_16_0:SetCurDlcID()
	end

	arg_16_0.shopDlcCfg = getShopCfg(arg_16_0.dlcID_)

	if arg_16_0.shopDlcCfg and arg_16_0.shopDlcCfg.shop_id == ShopConst.SHOP_ID.PASSPORT_SHOP then
		return 1
	end

	if not arg_16_0.shopDlcCfg and arg_16_0.dlcItemID_ and arg_16_0.showDlcState_ == 1 then
		return 2
	end

	return 0
end

function var_0_0.SwitchInfoController(arg_17_0, arg_17_1)
	arg_17_0.infoController_:SetSelectedState(arg_17_1)
end

function var_0_0.IndexPlotItem(arg_18_0)
	if not arg_18_0.plotItemList_ then
		arg_18_0.plotItemList_ = {}
	end

	local var_18_0 = SkinCfg[arg_18_0.skinID_]
	local var_18_1 = var_18_0.plot_title
	local var_18_2 = var_18_0.plot_id

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.plotItemList_) do
		SetActive(iter_18_1.gameObject_, false)
	end

	for iter_18_2 = 1, #var_18_1 do
		if not arg_18_0.plotItemList_[iter_18_2] then
			local var_18_3 = Object.Instantiate(arg_18_0.plotTalkBtn_.gameObject)
			local var_18_4 = PlotTalkItem.New(var_18_3)

			var_18_3.transform:SetParent(arg_18_0.plotTalkBasePanelGo_.transform, false)
			var_18_4:SetCallBack(function()
				arg_18_0.plotController_:SetSelectedState("off")

				arg_18_0.isOpenPlotTalk = false
			end)
			table.insert(arg_18_0.plotItemList_, var_18_4)
		end

		arg_18_0.plotItemList_[iter_18_2]:RefreshUI(var_18_1[iter_18_2], var_18_2[iter_18_2])
		SetActive(arg_18_0.plotItemList_[iter_18_2].gameObject_, true)
	end
end

function var_0_0.RefreshCurrencyToken(arg_20_0, arg_20_1)
	SetActive(arg_20_0.tokenGo_, arg_20_1)
	SetActive(arg_20_0.dlctokenGo_, arg_20_1)
	SetActive(arg_20_0.tokenNumGo_, arg_20_1)
end

function var_0_0.RefreshUI(arg_21_0)
	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_21_0.skinID_, 0, RedPointStyle.SHOW_NEW_TAG)
	arg_21_0:RefreshInfo()
	arg_21_0:RefreshDlcBtn()
	arg_21_0:SetButtonActive(arg_21_0:SkinState(arg_21_0.skinID_))
	arg_21_0:RefreshDescBtn()
	arg_21_0:RefreshGiftBtn()
	arg_21_0:HideMessage()
	arg_21_0:RefreshItemData()
	arg_21_0:RefreshSkinItemList()
	SetActive(arg_21_0.plotBtn_, #SkinCfg[arg_21_0.skinID_].plot_title > 0)

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.skinItemList_) do
		if iter_21_1.isActive and iter_21_1:GetSkinID() == arg_21_0.skinID_ then
			arg_21_0.selectIndex_ = iter_21_0
		end
	end
end

function var_0_0.RefreshSkinItemList(arg_22_0)
	if arg_22_0.skinIdList_ and #arg_22_0.skinIdList_ > 0 then
		for iter_22_0, iter_22_1 in pairs(arg_22_0.skinItemList_) do
			iter_22_1:SetActive(false)
		end

		for iter_22_2, iter_22_3 in ipairs(arg_22_0.skinIdList_) do
			local var_22_0

			if arg_22_0.skinItemList_[iter_22_2] then
				var_22_0 = arg_22_0.skinItemList_[iter_22_2]
			else
				var_22_0 = arg_22_0:GetSkinItem()

				table.insert(arg_22_0.skinItemList_, var_22_0)
				var_22_0:SetDelegate(handler(arg_22_0, arg_22_0.RefreshButton))
			end

			var_22_0:Show(arg_22_0.skinIdList_[iter_22_2], iter_22_2)
			var_22_0:ShowSelect(arg_22_0.selectIndex_ == iter_22_2)
			var_22_0:CheckDLC(arg_22_0:JudgeDLC(arg_22_0.skinIdList_[iter_22_2]))
			var_22_0:SetActive(true)
		end
	end

	arg_22_0:Scroll2SelectItem(5)
end

function var_0_0.RefreshDlcBtn(arg_23_0)
	arg_23_0.dlc_skinImage_.sprite = HeroTools.GetHeadSprite(arg_23_0.skinID_)

	if arg_23_0:JudgeDLC(arg_23_0.skinID_) then
		arg_23_0:SetCurDlcID()

		local var_23_0 = getShopCfg(arg_23_0.dlcID_)

		if var_23_0 then
			local var_23_1 = var_23_0.give_id or var_23_0.description

			if var_23_1 then
				arg_23_0.dlc_dlcImage_.sprite = ItemTools.getItemSprite(var_23_1)
			end
		else
			arg_23_0.dlc_dlcImage_.sprite = ItemTools.getItemSprite(arg_23_0.dlcItemID_)
		end
	else
		arg_23_0:SetCurDlcID()
	end
end

function var_0_0.RefreshLimitTime(arg_24_0, arg_24_1)
	local var_24_0 = HeroData:GetHeroData(arg_24_0.heroID_)
	local var_24_1 = 0
	local var_24_2 = 0

	for iter_24_0, iter_24_1 in ipairs(var_24_0.unlocked_skin) do
		if iter_24_1.skin_id == arg_24_1 then
			var_24_1 = iter_24_1.time

			if arg_24_0:JudgeDLC(arg_24_1) then
				local var_24_3 = HeroTools.GetShopIdBySkinId(arg_24_1)

				if not var_24_3 then
					return false
				end

				local var_24_4 = getShopCfg(var_24_3)
				local var_24_5 = var_24_4 and var_24_4.dlc

				if var_24_5 and var_24_5 ~= 0 then
					var_24_2 = HomeSceneSettingData:GetSceneTimeStamp(ShopCfg[var_24_5].description) or 0
				end
			end
		end
	end

	if var_24_1 ~= 0 then
		arg_24_0.skinLimitTimeText_.text = string.format(GetTips("TIME_DISPLAY_12"), os.date("%Y/%m/%d %H:%M", var_24_1) .. " ")
	else
		arg_24_0.skinLimitTimeText_.text = string.format(GetTips("TIME_DISPLAY_12"), os.date("%Y/%m/%d %H:%M", var_24_2) .. " ")
	end

	SetActive(arg_24_0.LimitTimeGo_, var_24_1 ~= 0 or var_24_2 ~= 0)
	SetActive(arg_24_0.skinLimitTimeGo_, var_24_1 ~= 0)
	SetActive(arg_24_0.dlcLimitTimeGo_, var_24_2 ~= 0)
end

function var_0_0.RefreshItemData(arg_25_0)
	arg_25_0.skinIdList_ = {}

	if arg_25_0.params_.showOnly and arg_25_0.params_.skinID then
		table.insert(arg_25_0.skinIdList_, arg_25_0.params_.skinID)
	else
		for iter_25_0, iter_25_1 in ipairs(SkinCfg.get_id_list_by_hero[arg_25_0.heroID_]) do
			if not HeroTools.GetIsSkinHide(iter_25_1) then
				if arg_25_0:isUnlock(iter_25_1) then
					table.insert(arg_25_0.skinIdList_, iter_25_1)
				elseif HeroTools.CanChangeSkin(iter_25_1) then
					table.insert(arg_25_0.skinIdList_, iter_25_1)
				elseif HeroTools.GetIsLimitTimeSkin(iter_25_1) then
					table.insert(arg_25_0.skinIdList_, iter_25_1)
				elseif SDKTools.GetIsOverSea() then
					table.insert(arg_25_0.skinIdList_, iter_25_1)
				elseif SkinCfg[iter_25_1].display_type == 1 then
					table.insert(arg_25_0.skinIdList_, iter_25_1)
				end
			end
		end

		if arg_25_0.params_.skinID and not table.indexof(arg_25_0.skinIdList_, arg_25_0.params_.skinID) then
			table.insert(arg_25_0.skinIdList_, arg_25_0.params_.skinID)
		end
	end
end

function var_0_0.CheckDlc(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.haveDLCController_:SetSelectedIndex(0)

	if arg_26_0:JudgeDLC(arg_26_1) then
		arg_26_0.haveDLCController_:SetSelectedIndex(1)
	end
end

function var_0_0.JudgeDLC(arg_27_0, arg_27_1)
	if arg_27_1 == nil then
		return false
	end

	local var_27_0 = HeroTools.GetShopIdBySkinId(arg_27_1)

	if not var_27_0 then
		return false
	end

	local var_27_1 = getShopCfg(var_27_0)
	local var_27_2 = var_27_1 and var_27_1.dlc

	if var_27_2 and var_27_2 ~= 0 then
		return true
	end

	local var_27_3 = SkinSceneActionCfg[arg_27_1]

	if var_27_3 and var_27_3.special_scene_id then
		arg_27_0.dlcItemID_ = var_27_3.special_scene_id

		local var_27_4 = HomeSceneSettingCfg[var_27_3.special_scene_id]

		if var_27_4 and var_27_4.limit_display == 0 then
			return true
		end
	end

	return false
end

function var_0_0.SetCurDlcID(arg_28_0)
	local var_28_0 = HeroTools.GetShopIdBySkinId(arg_28_0.skinID_)
	local var_28_1 = getShopCfg(var_28_0)

	arg_28_0.dlcID_ = var_28_1 and var_28_1.dlc

	if arg_28_0.dlcID_ and arg_28_0.dlcID_ ~= 0 then
		local var_28_2 = ShopTools.GetDiscount(arg_28_0.dlcID_)
		local var_28_3, var_28_4, var_28_5 = ShopTools.IsOnDiscountArea(arg_28_0.dlcID_)

		if var_28_2 == 0 and var_28_3 and var_28_5 then
			arg_28_0.buyBtnController_:SetSelectedIndex(1)
		else
			arg_28_0.buyBtnController_:SetSelectedIndex(0)
		end
	else
		arg_28_0.buyBtnController_:SetSelectedIndex(0)
	end

	local var_28_6 = SkinSceneActionCfg[arg_28_0.skinID_]

	if var_28_6 and var_28_6.special_scene_id then
		arg_28_0.dlcItemID_ = var_28_6.special_scene_id
	end
end

function var_0_0.CheckSpecicalTable(arg_29_0, arg_29_1, arg_29_2)
	for iter_29_0 = 1, #arg_29_1 do
		if arg_29_1[iter_29_0] ~= arg_29_2[iter_29_0] then
			return false
		end
	end

	return true
end

function var_0_0.ChangeDlcBtnSpecial(arg_30_0)
	local var_30_0 = arg_30_0:isUnlock(arg_30_0.skinID_) and 1 or 0
	local var_30_1 = arg_30_0:isDlcOwned() and 1 or 0
	local var_30_2 = arg_30_0.showDlcState_
	local var_30_3 = {
		var_30_0,
		var_30_1,
		var_30_2
	}

	if arg_30_0:CheckSpecicalTable(var_30_3, {
		0,
		0,
		0
	}) then
		arg_30_0:SetButtonActive(3)
		arg_30_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		0,
		0,
		1
	}) then
		arg_30_0:SetButtonActive(3)
		arg_30_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		0,
		1,
		0
	}) then
		arg_30_0:SetButtonActive(3)
		arg_30_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		0,
		1,
		1
	}) then
		arg_30_0:SetButtonActive(3)
		arg_30_0.dlcBtnController_:SetSelectedIndex(3)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		1,
		0,
		0
	}) then
		arg_30_0:SetButtonActive(8)
		arg_30_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		1,
		0,
		1
	}) then
		arg_30_0:SetButtonActive(9)
		arg_30_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		1,
		1,
		0
	}) then
		arg_30_0:SetButtonActive(8)
		arg_30_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_30_0:CheckSpecicalTable(var_30_3, {
		1,
		1,
		1
	}) then
		arg_30_0:SetButtonActive(8)
		arg_30_0.dlcBtnController_:SetSelectedIndex(0)
	end
end

function var_0_0.HaveMaterial(arg_31_0)
	local var_31_0 = getShopCfg(HeroTools.GetShopIdBySkinId(arg_31_0.skinID_))

	return ItemCfg[var_31_0.cost_id], ItemTools.getItemNum(var_31_0.cost_id)
end

function var_0_0.RefreshDescBtn(arg_32_0)
	arg_32_0.typeNum_ = 0
	arg_32_0.typeDes_ = {}

	local var_32_0 = SkinTagCfg[arg_32_0.skinID_]

	SetActive(arg_32_0.battleBtn_.gameObject, var_32_0 ~= nil)

	if arg_32_0.params_.showOnly then
		SetActive(arg_32_0.battleBtn_.gameObject, false)
	end

	if not var_32_0 then
		for iter_32_0, iter_32_1 in ipairs(arg_32_0.descBtnGo_) do
			SetActive(iter_32_1, false)
			arg_32_0:SwitchInfoController("description")
			SetActive(arg_32_0.switchInfoIconGo_, false)

			arg_32_0.switchInfoBtn_.interactable = false

			return
		end
	end

	local var_32_1 = var_32_0.tag

	for iter_32_2, iter_32_3 in ipairs(var_32_1) do
		local var_32_2 = SkinTagDescCfg[iter_32_3].type

		if not arg_32_0.typeDes_[var_32_2] then
			arg_32_0.typeDes_[var_32_2] = {}
			arg_32_0.typeNum_ = arg_32_0.typeNum_ + 1
		end

		table.insert(arg_32_0.typeDes_[var_32_2], iter_32_3)
	end

	for iter_32_4, iter_32_5 in ipairs(arg_32_0.descBtnGo_) do
		local var_32_3 = arg_32_0.typeDes_[iter_32_4] ~= nil

		SetActive(iter_32_5, var_32_3)
	end

	if arg_32_0.typeNum_ == 0 then
		arg_32_0:SwitchInfoController("description")
		SetActive(arg_32_0.switchInfoIconGo_, false)

		arg_32_0.switchInfoBtn_.interactable = false
	else
		arg_32_0:SwitchInfoController("tag")
		SetActive(arg_32_0.switchInfoIconGo_, true)

		arg_32_0.switchInfoBtn_.interactable = true
	end
end

function var_0_0.OnShopBuyResult(arg_33_0)
	arg_33_0:RefreshUI()
end

function var_0_0.OnGetSkinGift(arg_34_0)
	arg_34_0:RefreshUI()
end

function var_0_0.RefreshGiftBtn(arg_35_0)
	local var_35_0 = (SkinCfg[arg_35_0.skinID_] or {}).gift or {}

	if #var_35_0 > 0 and PlayerData:IsNotReceived(arg_35_0.skinID_) then
		SetActive(arg_35_0.giftBtn_, true)
	else
		SetActive(arg_35_0.giftBtn_, false)
	end

	SetActive(arg_35_0.giftRedGo_, #var_35_0 > 0 and arg_35_0:isUnlock(arg_35_0.skinID_) and PlayerData:IsNotReceived(arg_35_0.skinID_))
	arg_35_0.giftController_:SetSelectedState(arg_35_0:isUnlock(arg_35_0.skinID_) and "take" or "check")
end

function var_0_0.HideMessage(arg_36_0)
	SetActive(arg_36_0.descPanel_, false)
end

function var_0_0.ShowMessage(arg_37_0)
	if #arg_37_0.descInfoList_ == 0 then
		for iter_37_0, iter_37_1 in pairs(arg_37_0.typeDes_) do
			local var_37_0 = Object.Instantiate(arg_37_0.descContent_, arg_37_0.descTipsContent_)

			arg_37_0.descInfoList_[iter_37_0] = SkinDescInfoItem.New(var_37_0, iter_37_1, iter_37_0)

			arg_37_0.descInfoList_[iter_37_0]:RefreshUI()
			arg_37_0.descInfoList_[iter_37_0]:Show(true)
			LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_0.descPanelRect_)
		end
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_0.descPanelRect_)
	SetActive(arg_37_0.descPanel_, true)
	SetActive(arg_37_0.hideMessageGo_, true)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_0.descPanelRect_)
end

function var_0_0.CleanMessage(arg_38_0)
	for iter_38_0, iter_38_1 in pairs(arg_38_0.descInfoList_) do
		iter_38_1:Dispose()
	end

	arg_38_0.descInfoList_ = {}
end

function var_0_0.PlayVoice(arg_39_0)
	if arg_39_0.delayPlayTimer_ then
		return
	end

	HeroTools.PlayVoice(arg_39_0.heroID_, "cloth")

	arg_39_0.delayPlayTimer_ = Timer.New(function()
		if arg_39_0.delayPlayTimer_ then
			arg_39_0.delayPlayTimer_:Stop()

			arg_39_0.delayPlayTimer_ = nil
		end
	end, 10, -1)

	arg_39_0.delayPlayTimer_:Start()
end

function var_0_0.SetReturnBtn(arg_41_0, arg_41_1)
	SetActive(arg_41_0.hideMessageGo_, true)
	arg_41_0:RemoveBtnListener(nil, arg_41_0.hideMessageBtn_.transform)
	arg_41_0:AddBtnListener(arg_41_0.hideMessageBtn_, nil, function()
		arg_41_1()
		SetActive(arg_41_0.hideMessageGo_, false)
	end)
end

function var_0_0.AdjustItem(arg_43_0)
	local var_43_0 = arg_43_0:GetNearestItem()

	arg_43_0:RefreshButton(var_43_0)
end

function var_0_0.RefreshItemScale(arg_44_0)
	for iter_44_0, iter_44_1 in pairs(arg_44_0.skinItemList_) do
		if iter_44_1.isActive then
			iter_44_1:RefreshShow()
		end
	end
end

function var_0_0.BeginDragFun(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0:StopMoveTimer()
	arg_45_0:StopScrollTimer()
	arg_45_0.scrollView_:OnBeginDrag(arg_45_2)
end

function var_0_0.EndDragFun(arg_46_0, arg_46_1, arg_46_2)
	arg_46_0.scrollView_:OnEndDrag(arg_46_2)
	arg_46_0:AddScrollTimer()
end

function var_0_0.Scroll2SelectItem(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.skinItemList_) do
		if iter_47_1.isActive then
			local var_47_0 = iter_47_1:GetSkinID() == arg_47_0.skinID_

			if var_47_0 then
				arg_47_0:AddMoveTimer(iter_47_1, arg_47_1)
			end

			iter_47_1:ShowSelect(var_47_0)
		end
	end
end

function var_0_0.GetNearestItem(arg_48_0)
	local var_48_0 = 9999
	local var_48_1
	local var_48_2 = arg_48_0.scrollTf_.rect.width / 2

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.skinItemList_) do
		if iter_48_1.isActive then
			local var_48_3 = math.abs(arg_48_0.contentTf_.localPosition.x + iter_48_1:GetLocalPosition().x - var_48_2)

			if var_48_3 < var_48_0 then
				var_48_0 = var_48_3
				var_48_1 = iter_48_1
			end
		end
	end

	return var_48_1
end

function var_0_0.AddScrollTimer(arg_49_0)
	arg_49_0:StopScrollTimer()

	arg_49_0.scrollTimer_ = nil
	arg_49_0.scrollTimer_ = FrameTimer.New(function()
		if math.abs(arg_49_0.scrollView_.velocity.x) <= 100 then
			arg_49_0.scrollTimer_:Stop()
			arg_49_0:AdjustItem()
		end
	end, 1, -1)

	arg_49_0.scrollTimer_:Start()
end

function var_0_0.StopScrollTimer(arg_51_0)
	if arg_51_0.scrollTimer_ then
		arg_51_0.scrollTimer_:Stop()

		arg_51_0.scrollTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_52_0, arg_52_1, arg_52_2)
	arg_52_0:StopMoveTimer()

	arg_52_0.moveTimer_ = FrameTimer.New(function()
		local var_53_0 = arg_52_0.contentTf_.rect.width / 2
		local var_53_1 = arg_52_0.scrollTf_.rect.width / 2
		local var_53_2 = arg_52_0.contentTf_.localPosition
		local var_53_3 = arg_52_1:GetLocalPosition().x * -1 + var_53_1
		local var_53_4 = arg_52_2 * math.pow(arg_52_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_52_0.contentTf_.localPosition = Vector3.Lerp(var_53_2, Vector3.New(var_53_3, var_53_2.y, var_53_2.z), var_53_4)

		if math.abs(var_53_2.x - var_53_3) <= 1 then
			arg_52_0.contentTf_.localPosition = Vector3(var_53_3, var_53_2.y, var_53_2.z)

			arg_52_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_52_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_54_0)
	if arg_54_0.moveTimer_ then
		arg_54_0.moveTimer_:Stop()

		arg_54_0.moveTimer_ = nil
	end
end

function var_0_0.RefreshDlcMovie(arg_55_0)
	manager.audio:StopVoice()

	if isNil(arg_55_0.dlcMovie_) or isNil(arg_55_0.dlcPlayer_) then
		arg_55_0.dlcMovie_ = arg_55_0.dlcMovieGo_:GetComponent("CriManaMovieControllerForUI")
		arg_55_0.dlcPlayer_ = arg_55_0.dlcMovie_.player

		arg_55_0.dlcPlayer_:SetMaxPictureDataSize(300000)

		arg_55_0.dlcPlayer_.uiRenderMode = true
	end

	if isNil(arg_55_0.dlcBgMovie_) or isNil(arg_55_0.dlcBgPlayer_) then
		arg_55_0.dlcBgMovie_ = arg_55_0.bgMovieGo_:GetComponent("CriManaMovieControllerForUI")
		arg_55_0.dlcBgPlayer_ = arg_55_0.dlcBgMovie_.player

		arg_55_0.dlcBgPlayer_:SetMaxPictureDataSize(300000)

		arg_55_0.dlcBgPlayer_.uiRenderMode = true
	end

	if tostring(arg_55_0.dlcPlayer_.status) == "Playing" and arg_55_0.dlcPlayer_.IsPaused and tostring(arg_55_0.dlcBgPlayer_.status) == "Playing" and arg_55_0.dlcBgPlayer_.IsPaused and arg_55_0.skinID_ == arg_55_0.movieSkinId_ then
		arg_55_0.dlcMovie_:Pause(false)
		arg_55_0.dlcBgMovie_:Pause(false)
		arg_55_0.dlcHideMovieController_:SetSelectedIndex(1)

		return
	end

	if arg_55_0.movieSkinId_ and arg_55_0.movieSkinId_ ~= 0 and arg_55_0.skinID_ ~= arg_55_0.movieSkinId_ then
		arg_55_0.dlcMovie_:Stop()
		arg_55_0.dlcBgMovie_:Stop()

		arg_55_0.mainMovieRaw_.material = nil
		arg_55_0.bgMovieRaw_.material = nil

		arg_55_0:StopMovieStopTimer()

		arg_55_0.stopTimer_ = Timer.New(function()
			if tostring(arg_55_0.dlcPlayer_.status) == "Stop" and tostring(arg_55_0.dlcBgPlayer_.status) == "Stop" then
				arg_55_0:StartMovie()
				arg_55_0:StopMovieStopTimer()

				return
			end
		end, 0.033, -1)

		arg_55_0.stopTimer_:Start()
	else
		arg_55_0:StartMovie()
	end
end

function var_0_0.StartMovie(arg_57_0)
	local var_57_0 = getShopCfg(arg_57_0.dlcID_)
	local var_57_1
	local var_57_2

	if var_57_0 then
		local var_57_3

		var_57_1, var_57_3 = var_57_0.give_id or var_57_0.description, var_57_0.give or 1
	end

	local var_57_4
	local var_57_5

	if var_57_0 then
		if var_57_0.description then
			local var_57_6 = var_57_0.description

			var_57_5 = RechargeShopDescriptionCfg[var_57_6]
		else
			var_57_5 = ItemCfg[var_57_1]
		end
	else
		var_57_5 = ItemCfg[arg_57_0.dlcItemID_]
	end

	local var_57_7 = true

	for iter_57_0, iter_57_1 in ipairs(SkinSceneActionCfg.all) do
		local var_57_8 = SkinSceneActionCfg[iter_57_1]

		if var_57_8.special_scene_id == var_57_5.param[1] then
			arg_57_0.start_path = var_57_8.start_path

			arg_57_0:Play()
			arg_57_0:StopMovieTimer()

			arg_57_0.timer_ = Timer.New(function()
				if arg_57_0.dlcMovie_.isMaterialAvailable and arg_57_0.dlcBgMovie_.isMaterialAvailable then
					arg_57_0.dlcHideMovieController_:SetSelectedIndex(1)
					arg_57_0:StopMovieTimer()

					if not arg_57_0:IsTop() then
						arg_57_0:PauseDlcMovie()
					end

					return
				end
			end, 0.033, -1)

			arg_57_0.timer_:Start()

			break
		end
	end
end

function var_0_0.PauseDlcMovie(arg_59_0)
	if arg_59_0.dlcMovie_ and arg_59_0.dlcPlayer_ and arg_59_0.dlcBgMovie_ and arg_59_0.dlcBgPlayer_ then
		arg_59_0.dlcMovie_:Pause(true)
		arg_59_0.dlcBgMovie_:Pause(true)
	end
end

function var_0_0.StopMovieTimer(arg_60_0)
	if arg_60_0.timer_ then
		arg_60_0.timer_:Stop()

		arg_60_0.timer_ = nil
	end
end

function var_0_0.StopMovieStopTimer(arg_61_0)
	if arg_61_0.stopTimer_ then
		arg_61_0.stopTimer_:Stop()

		arg_61_0.stopTimer_ = nil
	end
end

function var_0_0.Play(arg_62_0)
	SetFile(arg_62_0.dlcPlayer_, nil, arg_62_0.start_path, CriMana.Player.SetMode.New)
	arg_62_0.dlcPlayer_:Prepare()
	SetFile(arg_62_0.dlcBgPlayer_, nil, arg_62_0.start_path, CriMana.Player.SetMode.New)
	arg_62_0.dlcBgPlayer_:Prepare()

	local var_62_0 = manager.audio:GetMusicVolume()

	arg_62_0.dlcPlayer_:SetVolume(var_62_0)
	arg_62_0:SetVideoTrack(arg_62_0.dlcPlayer_, arg_62_0.start_path)
	arg_62_0:SetVideoTrack(arg_62_0.dlcBgPlayer_, arg_62_0.start_path)

	arg_62_0.movieSkinId_ = arg_62_0.skinID_

	arg_62_0.dlcMovie_:Play()
	arg_62_0.dlcBgMovie_:Play()
	arg_62_0.dlcHideMovieController_:SetSelectedIndex(1)
end

function var_0_0.SetVideoTrack(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = manager.audio:GetLocalizationFlag()
	local var_63_1 = 0
	local var_63_2

	for iter_63_0 in string.gmatch(arg_63_2, "[^/]+$") do
		var_63_2 = iter_63_0
	end

	local var_63_3 = VideoTrackCfg[var_63_2]

	if var_63_3 and var_63_3.has_tracks == 1 then
		if var_63_0 == "zh" then
			var_63_1 = 0
		elseif var_63_0 == "ja" then
			var_63_1 = 1
		elseif var_63_0 == "en" then
			var_63_1 = 2
		elseif var_63_0 == "kr" then
			var_63_1 = 3
		end
	end

	arg_63_1:SetAudioTrack(var_63_1)
	arg_63_1:SetSubtitleChannel(var_63_1)
end

function var_0_0.RefreshShop(arg_64_0)
	arg_64_0:RefreshCurrencyToken(false)
end

function var_0_0.GetSkinItem(arg_65_0)
	return NewHeroSkinItem.New(arg_65_0.itemGo_, arg_65_0.contentTf_)
end

function var_0_0.OnSelectSkin(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0:SetButtonActive(1)
end

function var_0_0.OnEnter(arg_67_0)
	ShopTools.FilterShopDataList(ShopConst.SHOP_ID.SKIN_SHOP)

	arg_67_0.descList_ = {}
	arg_67_0.showDlc_ = false

	local var_67_0 = HeroSkinRouteData:GetRoute()

	if not arg_67_0.params_.heroID then
		arg_67_0.heroID_ = var_67_0.heroID
	else
		arg_67_0.heroID_ = arg_67_0.params_.heroID
	end

	if not arg_67_0.params_.isBack then
		if not arg_67_0.params_.skinID then
			arg_67_0.skinID_ = HeroTools.HeroUsingSkinInfo(arg_67_0.heroID_).id
		else
			arg_67_0.skinID_ = arg_67_0.params_.skinID
		end

		arg_67_0:ChangeShowDlcState(0)
	else
		arg_67_0:ChangeShowDlcState(arg_67_0.showDlcState_)
	end

	arg_67_0.plotController_:SetSelectedState("off")

	arg_67_0.isOpenPlotTalk = false

	manager.heroRaiseTrack:SetModelState(arg_67_0.skinID_)
	arg_67_0:RefreshShop()
	arg_67_0:RegistEventListener(GET_SKIN_GIFT, handler(arg_67_0, arg_67_0.OnGetSkinGift))
	arg_67_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_68_0)
		arg_67_0:RefreshUI()
	end)
	arg_67_0:RefreshUI()

	if arg_67_0.params_.isDlc then
		arg_67_0:ChangeShowDlcState(1)
	elseif not arg_67_0.params_.isBack then
		arg_67_0:ChangeShowDlcState(0)
	else
		arg_67_0:ChangeShowDlcState(arg_67_0.showDlcState_)
	end

	arg_67_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_67_0, arg_67_0.BeginDragFun)))
	arg_67_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_67_0, arg_67_0.EndDragFun)))
	arg_67_0:Scroll2SelectItem(100)
end

function var_0_0.RefreshUIWithOutScroll(arg_69_0)
	arg_69_0:RefreshInfo()
	arg_69_0:SetButtonActive(arg_69_0:SkinState(arg_69_0.skinID_))
end

function var_0_0.RefreshButton(arg_70_0, arg_70_1)
	arg_70_0.selectIndex_ = arg_70_1.index_

	local var_70_0 = arg_70_1:SkinState()
	local var_70_1 = arg_70_1.skinID_
	local var_70_2 = SkinCfg[arg_70_1.skinID_].hero

	if var_70_1 == arg_70_0.skinID_ then
		arg_70_0:Scroll2SelectItem(5)

		return
	end

	OperationRecorder.RecordButtonTouch("hero_skin_" .. var_70_1)

	arg_70_0.skinID_ = var_70_1

	local var_70_3 = SkinCfg[var_70_1]

	arg_70_0:SetButtonActive(var_70_0)
	manager.heroRaiseTrack:SetModelState(arg_70_0.skinID_)
	SetActive(arg_70_0.plotBtn_, #var_70_3.plot_title > 0)
	arg_70_0.plotController_:SetSelectedState("off")

	arg_70_0.isOpenPlotTalk = false

	arg_70_0:RefreshInfo()
	arg_70_0:CheckDlc(var_70_1, var_70_0)
	arg_70_0:RefreshDlcBtn()
	arg_70_0:ChangeShowDlcState(0)
	arg_70_0:RefreshDescBtn()
	arg_70_0:RefreshGiftBtn()
	arg_70_0:HideMessage()
	arg_70_0:RefreshUI()
	arg_70_0:Scroll2SelectItem(5)
	arg_70_0:RefreshLimitTime(arg_70_0.skinID_)
end

function var_0_0.UpdateBar(arg_71_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.SetButtonActive(arg_72_0, arg_72_1)
	arg_72_0:CheckDlc(arg_72_0.skinID_, arg_72_1)

	if arg_72_0:JudgeDLC(arg_72_0.skinID_) then
		local var_72_0 = arg_72_0:isDlcOwned()

		arg_72_0.dlc_dlcController_:SetSelectedState(tostring(var_72_0))
	end

	arg_72_0.dlc_skinController_:SetSelectedState(tostring(HeroTools.GetHasOwnedSkin(arg_72_0.skinID_)))

	if arg_72_0.btnState_ == arg_72_1 then
		return
	end

	arg_72_0.statusController_:SetSelectedIndex(arg_72_1 - 1)

	arg_72_0.btnState_ = arg_72_1

	arg_72_0:UpdateBar()
end

function var_0_0.SkinState(arg_73_0, arg_73_1)
	arg_73_0:ChangeDlcBtn()

	if arg_73_0:isUnlock(arg_73_1) then
		if arg_73_0.params_.showOnly then
			return 8
		end

		if arg_73_0:isSelect(arg_73_1) then
			return 1
		end

		return 2
	else
		if HeroTools.GetIsLimitTimeSkin(arg_73_1) then
			if arg_73_0:isSelect(arg_73_1) then
				if HeroTools.IsSkinOutOfDate(arg_73_1) or arg_73_0.showDlcState_ == 1 then
					return 1
				else
					return 10
				end
			elseif HeroTools.IsSkinOutOfDate(arg_73_1) or arg_73_0.showDlcState_ == 1 then
				return 2
			else
				return 11
			end
		end

		if HeroTools.CanChangeSkin(arg_73_1) then
			return 5
		end

		if HeroTools.GetSkinIsCanUnLock(arg_73_1) then
			return 6
		end

		if HeroTools.IsSkinOutOfDate(arg_73_1) then
			if arg_73_0.showDlcState_ == 1 and not arg_73_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_73_0.skinID_) then
				return 3
			end

			return 4
		end

		if ShopTools.IsPC() then
			local var_73_0 = HeroTools.GetShopIdBySkinId(arg_73_0.skinID_)

			if ShopTools.IsRMB(var_73_0) then
				return 12
			end
		end

		return 3
	end
end

function var_0_0.ChangeDlcBtn(arg_74_0)
	arg_74_0.dlcBtnController_:SetSelectedIndex(0)
	SetActive(arg_74_0.sourceDlcGo_, false)

	if arg_74_0:CheckIsSpecial() == 1 then
		arg_74_0:ChangeDlcBtnSpecial()

		return
	end

	if arg_74_0:CheckIsSpecial() == 2 then
		arg_74_0.sourceDlcText_.text = GetI18NText(ItemCfg[arg_74_0.dlcItemID_].desc_source) or ""

		if arg_74_0:isDlcOwned() then
			arg_74_0.dlcBtnController_:SetSelectedIndex(0)
		else
			SetActive(arg_74_0.sourceDlcGo_, true)
		end

		return
	end

	if arg_74_0.showDlcState_ == 1 then
		if arg_74_0:isUnlock(arg_74_0.skinID_) or HeroTools.GetIsLimitTimeSkin(arg_74_0.skinID_) then
			if arg_74_0:JudgeDLC(arg_74_0.skinID_) and not arg_74_0:isDlcOwned() then
				local var_74_0 = getShopCfg(arg_74_0.dlcID_)

				if ShopTools.CheckShopIsUnLock(var_74_0.shop_id) and var_74_0 and ShopTools.IsGoodCanDisplay(var_74_0.shop_id, var_74_0.goods_id) then
					arg_74_0.dlcBtnController_:SetSelectedIndex(1)
				end
			end
		elseif not arg_74_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_74_0.skinID_) then
			arg_74_0.dlcBtnController_:SetSelectedIndex(1)
		end
	end
end

function var_0_0.SaveRoute(arg_75_0)
	local var_75_0 = {
		name = "heroSkin",
		skinID = arg_75_0.skinID_,
		heroID = arg_75_0.heroID_
	}

	SkinTrialData:SaveRoute(var_75_0)
end

function var_0_0.AddUIListener(arg_76_0)
	arg_76_0:AddBtnListener(arg_76_0.portraitBtn_, nil, function()
		if arg_76_0.showDlcState_ == 1 then
			arg_76_0:Go("heroPortraitFull", {
				skinID = arg_76_0.skinID_
			})
		else
			arg_76_0:Go("heroPortrait", {
				skinID = arg_76_0.skinID_
			})
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.movieBtn_, nil, function()
		if arg_76_0.showDlcState_ == 1 then
			JumpTools.OpenPageByJump("/skinDlcShow", {
				goodId = arg_76_0.dlcID_,
				dlcItemID = arg_76_0.dlcItemID_
			})
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.replaceBtn_, nil, function()
		HeroAction.SelectSkin(arg_76_0.heroID_, arg_76_0.skinID_)

		if arg_76_0.showDlcState_ ~= 1 then
			arg_76_0:PlayVoice()
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.goBtn_, nil, function()
		arg_76_0.params_.skinID = arg_76_0.skinID_

		local var_80_0 = HeroTools.GetShopIdBySkinId(arg_76_0.skinID_)
		local var_80_1 = JumpTools.IsSystemLocked(501)

		if var_80_1 then
			ShowTips(JumpTools.GetSystemLockedTip(501, var_80_1))
		else
			local var_80_2
			local var_80_3
			local var_80_4
			local var_80_5

			if arg_76_0.dlcID_ and arg_76_0.dlcID_ ~= 0 then
				var_80_2 = ShopTools.GetDiscount(arg_76_0.dlcID_) or nil

				local var_80_6

				var_80_3, var_80_6, var_80_5 = ShopTools.IsOnDiscountArea(arg_76_0.dlcID_)
			end

			if arg_76_0.showDlcState_ == 1 then
				if arg_76_0:CheckIsSpecial() == 0 then
					if var_80_2 and var_80_2 == 0 and var_80_3 and var_80_5 then
						JumpTools.OpenPageByJump("freeSkinBuyCheck", {
							onlySkin = false,
							goodID = var_80_0,
							heroID = arg_76_0.heroID_,
							skinID = arg_76_0.skinID_
						}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
					else
						JumpTools.OpenPageByJump("newSkinBuyCheck", {
							onlySkin = false,
							goodID = var_80_0,
							heroID = arg_76_0.heroID_,
							skinID = arg_76_0.skinID_
						}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
					end
				elseif arg_76_0:CheckIsSpecial() == 1 then
					JumpTools.OpenPageByJump("newSkinBuyCheck", {
						onlySkin = true,
						goodID = var_80_0,
						heroID = arg_76_0.heroID_,
						skinID = arg_76_0.skinID_
					}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
				end
			elseif var_80_2 and var_80_2 == 0 and var_80_3 and var_80_5 then
				JumpTools.OpenPageByJump("freeSkinBuyCheck", {
					onlySkin = true,
					goodID = var_80_0,
					heroID = arg_76_0.heroID_,
					skinID = arg_76_0.skinID_
				}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
			else
				JumpTools.OpenPageByJump("newSkinBuyCheck", {
					onlySkin = true,
					goodID = var_80_0,
					heroID = arg_76_0.heroID_,
					skinID = arg_76_0.skinID_
				}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
			end
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.pcRmbBtn_, nil, function()
		if ShopTools.IsPC() then
			ShowTips("PC_SHOP_TIPS2")

			return
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.changeBtn_, nil, function()
		arg_76_0.params_.skinID = arg_76_0.skinID_

		CommonAction.TryToUseItem({
			{
				item_info = {
					num = 1,
					id = HeroTools.GetSkinChangeItem(arg_76_0.skinID_)
				},
				use_list = {}
			}
		})
	end)
	arg_76_0:AddBtnListener(arg_76_0.unlockBtn_, nil, function()
		if arg_76_0.isCanUnlock_ then
			HeroAction.UnLockSkin(arg_76_0.skinID_)
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.giftBtn_, nil, function()
		if arg_76_0:isUnlock(arg_76_0.skinID_) then
			PlayerAction.ReceiveSkinGift(arg_76_0.skinID_)
		else
			local var_84_0 = (SkinCfg[arg_76_0.skinID_] or {}).gift or {}

			JumpTools.OpenPageByJump("rewardPreview", {
				is_receive = false,
				rewardList = var_84_0
			}, ViewConst.SYSTEM_ID.REWARD_PREVIEW)
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.battleBtn_, nil, function()
		arg_76_0.params_.skinID = arg_76_0.skinID_

		local var_85_0 = 0
		local var_85_1 = SkinTagCfg[arg_76_0.skinID_]
		local var_85_2 = var_85_1.trial_activity
		local var_85_3 = var_85_2[1]

		for iter_85_0, iter_85_1 in ipairs(var_85_2) do
			local var_85_4 = ActivitySkinTrialCfg[iter_85_1].activity_id

			if ActivityData:GetActivityIsOpen(var_85_4) then
				var_85_0 = var_85_4
				var_85_3 = iter_85_1

				break
			end
		end

		SkinTrialData:SaveStageID(var_85_3)
		arg_76_0:SaveRoute()
		arg_76_0:Go("/sectionSelectHero", {
			activityID = var_85_0,
			section = var_85_1.trial_stage,
			sectionType = BattleConst.STAGE_TYPE_NEW.SKIN_TRIAL
		})
	end)
	arg_76_0:AddBtnListener(arg_76_0.plotBtn_, nil, function()
		if not arg_76_0.isOpenPlotTalk then
			arg_76_0:IndexPlotItem()
			arg_76_0.plotController_:SetSelectedState("on")
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_76_0.talkStateGo_.transform)

			arg_76_0.isOpenPlotTalk = true
		else
			arg_76_0.plotController_:SetSelectedState("off")

			arg_76_0.isOpenPlotTalk = false
		end
	end)
	arg_76_0:AddBtnListener(arg_76_0.plotTalkMaskBtn_, nil, function()
		arg_76_0.plotController_:SetSelectedState("off")

		arg_76_0.isOpenPlotTalk = false
	end)

	for iter_76_0, iter_76_1 in ipairs(arg_76_0.descBtn_) do
		arg_76_0:AddBtnListener(iter_76_1, nil, function()
			arg_76_0:ShowMessage()
		end)
	end

	arg_76_0:AddBtnListener(nil, arg_76_0.hideMessageBtn_, function()
		arg_76_0:HideMessage()
		SetActive(arg_76_0.hideMessageGo_, false)
	end)
	arg_76_0:AddBtnListener(nil, arg_76_0.dlc_skinBtn_, function()
		OperationRecorder.RecordButtonTouch("skin_pre_" .. arg_76_0.skinID_)

		arg_76_0.showDlc_ = false

		arg_76_0:ChangeShowDlcState(0)
	end)
	arg_76_0:AddBtnListener(nil, arg_76_0.dlc_dlcBtn_, function()
		if arg_76_0.dlcID_ then
			local var_91_0 = getShopCfg(arg_76_0.dlcID_)

			if var_91_0 then
				local var_91_1 = var_91_0.give_id or var_91_0.description

				if var_91_1 then
					OperationRecorder.RecordButtonTouch("skin_dlc_pre_" .. var_91_1)
				end
			else
				OperationRecorder.RecordButtonTouch("skin_dlc_pre_" .. arg_76_0.dlcItemID_ss)
			end
		end

		arg_76_0.showDlc_ = true

		arg_76_0:ChangeShowDlcState(1)
	end)
	arg_76_0:AddBtnListener(nil, arg_76_0.buyDlcBtn_, function()
		arg_76_0.params_.skinID = arg_76_0.skinID_

		local var_92_0 = HeroTools.GetShopIdBySkinId(arg_76_0.skinID_)
		local var_92_1 = JumpTools.IsSystemLocked(501)

		if var_92_1 then
			ShowTips(JumpTools.GetSystemLockedTip(501, var_92_1))
		else
			local var_92_2 = getShopCfg(arg_76_0.dlcID_)

			if var_92_2 == nil then
				return
			elseif ShopConst.SHOP_ID.DLC_SHOP == var_92_2.shop_id then
				JumpTools.OpenPageByJump("newSkinBuyCheck", {
					goodID = var_92_0,
					heroID = arg_76_0.heroID_,
					skinID = arg_76_0.skinID_
				}, ViewConst.SYSTEM_ID.SHOP)
			else
				local var_92_3 = getShopCfg(arg_76_0.dlcID_)

				JumpTools.GoToSystem("/shop", {
					shopId = var_92_3.shop_id
				}, ViewConst.SYSTEM_ID.SHOP)
			end
		end
	end)
	arg_76_0.scrollView_.onValueChanged:AddListener(function()
		arg_76_0:RefreshItemScale()
	end)
	arg_76_0:AddBtnListener(arg_76_0.switchInfoBtn_, nil, function()
		if arg_76_0.infoController_:GetSelectedState() == "tag" then
			arg_76_0:SwitchInfoController("description")
		else
			arg_76_0:SwitchInfoController("tag")
		end
	end)
	arg_76_0:AddBtnListenerOther()
end

function var_0_0.AddBtnListenerOther(arg_95_0)
	arg_95_0:AddBtnListener(arg_95_0.changeBtn_, nil, function()
		arg_95_0.params_.skinID = arg_95_0.skinID_

		CommonAction.TryToUseItem({
			{
				item_info = {
					num = 1,
					id = HeroTools.GetSkinChangeItem(arg_95_0.skinID_)
				},
				use_list = {}
			}
		})
	end)
	arg_95_0:AddBtnListener(arg_95_0.btn_dlcSpecialExchangeBtn_, nil, function()
		local var_97_0 = getShopCfg(arg_95_0.dlcID_)

		ShowMessageBox({
			content = string.format(GetTips("SHOP_DLC_LINK"), ItemTools.getItemName(var_97_0.give_id)),
			OkCallback = function()
				if var_97_0 then
					JumpTools.GoToSystem("/shop", {
						shopId = var_97_0.shop_id
					}, ViewConst.SYSTEM_ID.SHOP)
				end
			end,
			CancelCallback = function()
				return
			end
		})
	end)
end

function var_0_0.OnTryToUseItem(arg_100_0, arg_100_1, arg_100_2)
	if isSuccess(arg_100_1.result) then
		local var_100_0 = arg_100_2.use_item_list[1].item_info.id
		local var_100_1 = ItemCfg[var_100_0].param[1]

		getReward({
			{
				num = 1,
				id = var_100_1
			}
		}, {
			ItemConst.ITEM_TYPE.HERO_SKIN
		})

		local var_100_2 = SkinCfg[var_100_1].hero

		HeroAction.UpdateSkinCouponRedPoint(var_100_2)
		HeroAction.SkinAdd(arg_100_0.skinID_)
		arg_100_0:OnTryToUseItemOther(var_100_1)
	else
		ShowTips(arg_100_1.result)
	end

	arg_100_0:RefreshUI()
end

function var_0_0.OnTryToUseItemOther(arg_101_0, arg_101_1)
	arg_101_0:SetButtonActive(2)
	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_101_1, 0, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.ChangeShowDlcState(arg_102_0, arg_102_1)
	arg_102_0.dlcHideMovieController_:SetSelectedIndex(0)

	arg_102_0.showDlcState_ = arg_102_1

	arg_102_0.dlcController_:SetSelectedIndex(arg_102_1)

	if arg_102_1 == 0 then
		arg_102_0.dlc_skinBtn_.interactable = false
		arg_102_0.dlc_dlcBtn_.interactable = true

		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
			1,
			4
		}, arg_102_0.displayGo_)
		manager.heroRaiseTrack:SetModelState(arg_102_0.skinID_)
		arg_102_0:PauseDlcMovie()
		SetActive(arg_102_0.movieBtn_.gameObject, false)
	elseif arg_102_1 == 1 then
		arg_102_0.dlc_skinBtn_.interactable = true
		arg_102_0.dlc_dlcBtn_.interactable = false

		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.null)
		arg_102_0:RefreshDlcMovie()
		SetActive(arg_102_0.movieBtn_.gameObject, true)
	end

	arg_102_0:ChangeShowDlcStateOther()
end

function var_0_0.ChangeShowDlcStateOther(arg_103_0)
	arg_103_0:ChangeDlcBtn()
	arg_103_0:SetButtonActive(arg_103_0:SkinState(arg_103_0.skinID_))
	arg_103_0:RefreshInfo()
end

function var_0_0.RefreshInfo(arg_104_0)
	if arg_104_0.showDlcState_ == 1 then
		local var_104_0 = getShopCfg(arg_104_0.dlcID_)
		local var_104_1

		if var_104_0 then
			var_104_1 = RechargeShopDescriptionCfg[var_104_0.description]
		else
			var_104_1 = RechargeShopDescriptionCfg[arg_104_0.dlcItemID_]
		end

		if var_104_1 == nil then
			if var_104_0 then
				var_104_1 = ItemCfg[var_104_0.give_id]
			else
				var_104_1 = ItemCfg[arg_104_0.dlcItemID_]
			end
		end

		local var_104_2 = string.format("%s", var_104_1.name)
		local var_104_3 = string.format("%s", var_104_1.desc)

		arg_104_0.nameText_.text = GetI18NText(var_104_2)
		arg_104_0.infoText_.text = GetI18NText(var_104_3)
	else
		arg_104_0.nameText_.text = GetI18NText(SkinCfg[arg_104_0.skinID_].name)
		arg_104_0.infoText_.text = GetI18NText(SkinCfg[arg_104_0.skinID_].desc)
	end

	arg_104_0:CleanMessage()

	local var_104_4 = HeroTools.GetSkinChangeItem(arg_104_0.skinID_)

	if var_104_4 then
		arg_104_0.sourcetextText_.text = GetI18NText(ItemCfg[var_104_4].desc_source) or ""
		arg_104_0.couponImg_.sprite = ItemTools.getItemLittleSprite(var_104_4)
	else
		arg_104_0.sourcetextText_.text = GetI18NText(ItemCfg[arg_104_0.skinID_].desc_source) or ""
	end

	if HeroTools.IsSkinOnlySellDLC(arg_104_0.skinID_) then
		arg_104_0.sourcetextText_.text = GetTips("ACTIVITY_REWARD_RECEIVE") or ""
	end

	arg_104_0:RefreshInfoOther()
end

function var_0_0.RefreshInfoOther(arg_105_0)
	if arg_105_0.btnState_ == 5 then
		if HeroTools.CanChangeSkin(arg_105_0.skinID_) then
			manager.redPoint:SetRedPointIndependent(arg_105_0.changeBtn_.transform, true)
		else
			manager.redPoint:SetRedPointIndependent(arg_105_0.changeBtn_.transform, false)
		end
	end

	if arg_105_0.btnState_ == 6 then
		arg_105_0.isCanUnlock_ = true

		for iter_105_0, iter_105_1 in pairs(SkinCfg[arg_105_0.skinID_].unlock_id_list) do
			local var_105_0, var_105_1, var_105_2 = IsConditionAchieved(iter_105_1, {
				heroId = arg_105_0.heroID_
			})

			if var_105_0 then
				arg_105_0["taskController_" .. iter_105_0]:SetSelectedState("true")
			else
				arg_105_0.isCanUnlock_ = false

				arg_105_0["taskController_" .. iter_105_0]:SetSelectedState("false")
			end

			arg_105_0["tasktext_" .. iter_105_0].text = GetI18NText(ConditionCfg[iter_105_1].desc)
		end

		arg_105_0.unlockController_:SetSelectedState(arg_105_0.isCanUnlock_ and "false" or "true")
	end

	arg_105_0:RefreshLimitTime(arg_105_0.skinID_)
end

return var_0_0
