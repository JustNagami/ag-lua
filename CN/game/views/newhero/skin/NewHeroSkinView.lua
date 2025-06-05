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
			var_18_4:SetStoryCallBack(function()
				manager.ui:SetMainCamera("heroSkin")
				manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
					1,
					4
				}, arg_18_0.displayGo_)
				manager.heroRaiseTrack:SetModelState(arg_18_0.skinID_)
			end)
			table.insert(arg_18_0.plotItemList_, var_18_4)
		end

		arg_18_0.plotItemList_[iter_18_2]:RefreshUI(var_18_1[iter_18_2], var_18_2[iter_18_2])
		SetActive(arg_18_0.plotItemList_[iter_18_2].gameObject_, true)
	end
end

function var_0_0.RefreshCurrencyToken(arg_21_0, arg_21_1)
	SetActive(arg_21_0.tokenGo_, arg_21_1)
	SetActive(arg_21_0.dlctokenGo_, arg_21_1)
	SetActive(arg_21_0.tokenNumGo_, arg_21_1)
end

function var_0_0.RefreshUI(arg_22_0)
	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_22_0.skinID_, 0, RedPointStyle.SHOW_NEW_TAG)
	arg_22_0:RefreshInfo()
	arg_22_0:RefreshDlcBtn()
	arg_22_0:SetButtonActive(arg_22_0:SkinState(arg_22_0.skinID_))
	arg_22_0:RefreshDescBtn()
	arg_22_0:RefreshGiftBtn()
	arg_22_0:HideMessage()
	arg_22_0:RefreshItemData()
	arg_22_0:RefreshSkinItemList()
	SetActive(arg_22_0.plotBtn_, #SkinCfg[arg_22_0.skinID_].plot_title > 0)

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.skinItemList_) do
		if iter_22_1.isActive and iter_22_1:GetSkinID() == arg_22_0.skinID_ then
			arg_22_0.selectIndex_ = iter_22_0
		end
	end
end

function var_0_0.RefreshSkinItemList(arg_23_0)
	if arg_23_0.skinIdList_ and #arg_23_0.skinIdList_ > 0 then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.skinItemList_) do
			iter_23_1:SetActive(false)
		end

		for iter_23_2, iter_23_3 in ipairs(arg_23_0.skinIdList_) do
			local var_23_0

			if arg_23_0.skinItemList_[iter_23_2] then
				var_23_0 = arg_23_0.skinItemList_[iter_23_2]
			else
				var_23_0 = arg_23_0:GetSkinItem()

				table.insert(arg_23_0.skinItemList_, var_23_0)
				var_23_0:SetDelegate(handler(arg_23_0, arg_23_0.RefreshButton))
			end

			var_23_0:Show(arg_23_0.skinIdList_[iter_23_2], iter_23_2)
			var_23_0:ShowSelect(arg_23_0.selectIndex_ == iter_23_2)
			var_23_0:CheckDLC(arg_23_0:JudgeDLC(arg_23_0.skinIdList_[iter_23_2]))
			var_23_0:SetActive(true)
		end
	end

	arg_23_0:Scroll2SelectItem(5)
end

function var_0_0.RefreshDlcBtn(arg_24_0)
	arg_24_0.dlc_skinImage_.sprite = HeroTools.GetHeadSprite(arg_24_0.skinID_)

	if arg_24_0:JudgeDLC(arg_24_0.skinID_) then
		arg_24_0:SetCurDlcID()

		local var_24_0 = getShopCfg(arg_24_0.dlcID_)

		if var_24_0 then
			local var_24_1 = var_24_0.give_id or var_24_0.description

			if var_24_1 then
				arg_24_0.dlc_dlcImage_.sprite = ItemTools.getItemSprite(var_24_1)
			end
		else
			arg_24_0.dlc_dlcImage_.sprite = ItemTools.getItemSprite(arg_24_0.dlcItemID_)
		end
	else
		arg_24_0:SetCurDlcID()
	end
end

function var_0_0.RefreshLimitTime(arg_25_0, arg_25_1)
	local var_25_0 = HeroData:GetHeroData(arg_25_0.heroID_)
	local var_25_1 = 0
	local var_25_2 = 0

	for iter_25_0, iter_25_1 in ipairs(var_25_0.unlocked_skin) do
		if iter_25_1.skin_id == arg_25_1 then
			var_25_1 = iter_25_1.time

			if arg_25_0:JudgeDLC(arg_25_1) then
				local var_25_3 = HeroTools.GetShopIdBySkinId(arg_25_1)

				if not var_25_3 then
					return false
				end

				local var_25_4 = getShopCfg(var_25_3)
				local var_25_5 = var_25_4 and var_25_4.dlc

				if var_25_5 and var_25_5 ~= 0 then
					var_25_2 = HomeSceneSettingData:GetSceneTimeStamp(ShopCfg[var_25_5].description) or 0
				end
			end
		end
	end

	if var_25_1 ~= 0 then
		arg_25_0.skinLimitTimeText_.text = string.format(GetTips("TIME_DISPLAY_12"), os.date("%Y/%m/%d %H:%M", var_25_1) .. " ")
	else
		arg_25_0.skinLimitTimeText_.text = string.format(GetTips("TIME_DISPLAY_12"), os.date("%Y/%m/%d %H:%M", var_25_2) .. " ")
	end

	SetActive(arg_25_0.LimitTimeGo_, var_25_1 ~= 0 or var_25_2 ~= 0)
	SetActive(arg_25_0.skinLimitTimeGo_, var_25_1 ~= 0)
	SetActive(arg_25_0.dlcLimitTimeGo_, var_25_2 ~= 0)
end

function var_0_0.RefreshItemData(arg_26_0)
	arg_26_0.skinIdList_ = {}

	if arg_26_0.params_.showOnly and arg_26_0.params_.skinID then
		table.insert(arg_26_0.skinIdList_, arg_26_0.params_.skinID)
	else
		for iter_26_0, iter_26_1 in ipairs(SkinCfg.get_id_list_by_hero[arg_26_0.heroID_]) do
			if not HeroTools.GetIsSkinHide(iter_26_1) then
				if arg_26_0:isUnlock(iter_26_1) then
					table.insert(arg_26_0.skinIdList_, iter_26_1)
				elseif HeroTools.CanChangeSkin(iter_26_1) then
					table.insert(arg_26_0.skinIdList_, iter_26_1)
				elseif HeroTools.GetIsLimitTimeSkin(iter_26_1) then
					table.insert(arg_26_0.skinIdList_, iter_26_1)
				elseif SDKTools.GetIsOverSea() then
					table.insert(arg_26_0.skinIdList_, iter_26_1)
				elseif SkinCfg[iter_26_1].display_type == 1 then
					table.insert(arg_26_0.skinIdList_, iter_26_1)
				end
			end
		end

		if arg_26_0.params_.skinID and not table.indexof(arg_26_0.skinIdList_, arg_26_0.params_.skinID) then
			table.insert(arg_26_0.skinIdList_, arg_26_0.params_.skinID)
		end
	end
end

function var_0_0.CheckDlc(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.haveDLCController_:SetSelectedIndex(0)

	if arg_27_0:JudgeDLC(arg_27_1) then
		arg_27_0.haveDLCController_:SetSelectedIndex(1)
	end
end

function var_0_0.JudgeDLC(arg_28_0, arg_28_1)
	if arg_28_1 == nil then
		return false
	end

	local var_28_0 = HeroTools.GetShopIdBySkinId(arg_28_1)

	if not var_28_0 then
		return false
	end

	local var_28_1 = getShopCfg(var_28_0)
	local var_28_2 = var_28_1 and var_28_1.dlc

	if var_28_2 and var_28_2 ~= 0 then
		return true
	end

	local var_28_3 = SkinSceneActionCfg[arg_28_1]

	if var_28_3 and var_28_3.special_scene_id then
		arg_28_0.dlcItemID_ = var_28_3.special_scene_id

		local var_28_4 = HomeSceneSettingCfg[var_28_3.special_scene_id]

		if var_28_4 and var_28_4.limit_display == 0 then
			return true
		end
	end

	return false
end

function var_0_0.SetCurDlcID(arg_29_0)
	local var_29_0 = HeroTools.GetShopIdBySkinId(arg_29_0.skinID_)
	local var_29_1 = getShopCfg(var_29_0)

	arg_29_0.dlcID_ = var_29_1 and var_29_1.dlc

	if arg_29_0.dlcID_ and arg_29_0.dlcID_ ~= 0 then
		local var_29_2 = ShopTools.GetDiscount(arg_29_0.dlcID_)
		local var_29_3, var_29_4, var_29_5 = ShopTools.IsOnDiscountArea(arg_29_0.dlcID_)

		if var_29_2 == 0 and var_29_3 and var_29_5 then
			arg_29_0.buyBtnController_:SetSelectedIndex(1)
		else
			arg_29_0.buyBtnController_:SetSelectedIndex(0)
		end
	else
		arg_29_0.buyBtnController_:SetSelectedIndex(0)
	end

	local var_29_6 = SkinSceneActionCfg[arg_29_0.skinID_]

	if var_29_6 and var_29_6.special_scene_id then
		arg_29_0.dlcItemID_ = var_29_6.special_scene_id
	end
end

function var_0_0.CheckSpecicalTable(arg_30_0, arg_30_1, arg_30_2)
	for iter_30_0 = 1, #arg_30_1 do
		if arg_30_1[iter_30_0] ~= arg_30_2[iter_30_0] then
			return false
		end
	end

	return true
end

function var_0_0.ChangeDlcBtnSpecial(arg_31_0)
	local var_31_0 = arg_31_0:isUnlock(arg_31_0.skinID_) and 1 or 0
	local var_31_1 = arg_31_0:isDlcOwned() and 1 or 0
	local var_31_2 = arg_31_0.showDlcState_
	local var_31_3 = {
		var_31_0,
		var_31_1,
		var_31_2
	}

	if arg_31_0:CheckSpecicalTable(var_31_3, {
		0,
		0,
		0
	}) then
		arg_31_0:SetButtonActive(3)
		arg_31_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		0,
		0,
		1
	}) then
		arg_31_0:SetButtonActive(3)
		arg_31_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		0,
		1,
		0
	}) then
		arg_31_0:SetButtonActive(3)
		arg_31_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		0,
		1,
		1
	}) then
		arg_31_0:SetButtonActive(3)
		arg_31_0.dlcBtnController_:SetSelectedIndex(3)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		1,
		0,
		0
	}) then
		arg_31_0:SetButtonActive(8)
		arg_31_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		1,
		0,
		1
	}) then
		arg_31_0:SetButtonActive(9)
		arg_31_0.dlcBtnController_:SetSelectedIndex(2)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		1,
		1,
		0
	}) then
		arg_31_0:SetButtonActive(8)
		arg_31_0.dlcBtnController_:SetSelectedIndex(0)
	elseif arg_31_0:CheckSpecicalTable(var_31_3, {
		1,
		1,
		1
	}) then
		arg_31_0:SetButtonActive(8)
		arg_31_0.dlcBtnController_:SetSelectedIndex(0)
	end
end

function var_0_0.HaveMaterial(arg_32_0)
	local var_32_0 = getShopCfg(HeroTools.GetShopIdBySkinId(arg_32_0.skinID_))

	return ItemCfg[var_32_0.cost_id], ItemTools.getItemNum(var_32_0.cost_id)
end

function var_0_0.RefreshDescBtn(arg_33_0)
	arg_33_0.typeNum_ = 0
	arg_33_0.typeDes_ = {}

	local var_33_0 = SkinTagCfg[arg_33_0.skinID_]

	SetActive(arg_33_0.battleBtn_.gameObject, var_33_0 ~= nil)

	if arg_33_0.params_.showOnly then
		SetActive(arg_33_0.battleBtn_.gameObject, false)
	end

	if not var_33_0 then
		for iter_33_0, iter_33_1 in ipairs(arg_33_0.descBtnGo_) do
			SetActive(iter_33_1, false)
			arg_33_0:SwitchInfoController("description")
			SetActive(arg_33_0.switchInfoIconGo_, false)

			arg_33_0.switchInfoBtn_.interactable = false

			return
		end
	end

	local var_33_1 = var_33_0.tag

	for iter_33_2, iter_33_3 in ipairs(var_33_1) do
		local var_33_2 = SkinTagDescCfg[iter_33_3].type

		if not arg_33_0.typeDes_[var_33_2] then
			arg_33_0.typeDes_[var_33_2] = {}
			arg_33_0.typeNum_ = arg_33_0.typeNum_ + 1
		end

		table.insert(arg_33_0.typeDes_[var_33_2], iter_33_3)
	end

	for iter_33_4, iter_33_5 in ipairs(arg_33_0.descBtnGo_) do
		local var_33_3 = arg_33_0.typeDes_[iter_33_4] ~= nil

		SetActive(iter_33_5, var_33_3)
	end

	if arg_33_0.typeNum_ == 0 then
		arg_33_0:SwitchInfoController("description")
		SetActive(arg_33_0.switchInfoIconGo_, false)

		arg_33_0.switchInfoBtn_.interactable = false
	else
		arg_33_0:SwitchInfoController("tag")
		SetActive(arg_33_0.switchInfoIconGo_, true)

		arg_33_0.switchInfoBtn_.interactable = true
	end
end

function var_0_0.OnShopBuyResult(arg_34_0)
	arg_34_0:RefreshUI()
end

function var_0_0.OnGetSkinGift(arg_35_0)
	arg_35_0:RefreshUI()
end

function var_0_0.RefreshGiftBtn(arg_36_0)
	local var_36_0 = (SkinCfg[arg_36_0.skinID_] or {}).gift or {}

	if #var_36_0 > 0 and PlayerData:IsNotReceived(arg_36_0.skinID_) then
		SetActive(arg_36_0.giftBtn_, true)
	else
		SetActive(arg_36_0.giftBtn_, false)
	end

	SetActive(arg_36_0.giftRedGo_, #var_36_0 > 0 and arg_36_0:isUnlock(arg_36_0.skinID_) and PlayerData:IsNotReceived(arg_36_0.skinID_))
	arg_36_0.giftController_:SetSelectedState(arg_36_0:isUnlock(arg_36_0.skinID_) and "take" or "check")
end

function var_0_0.HideMessage(arg_37_0)
	SetActive(arg_37_0.descPanel_, false)
end

function var_0_0.ShowMessage(arg_38_0)
	local var_38_0 = 0

	for iter_38_0, iter_38_1 in pairs(arg_38_0.descInfoList_) do
		var_38_0 = var_38_0 + 1
	end

	if var_38_0 == 0 then
		for iter_38_2, iter_38_3 in pairs(arg_38_0.typeDes_) do
			local var_38_1 = Object.Instantiate(arg_38_0.descContent_, arg_38_0.descTipsContent_)

			arg_38_0.descInfoList_[iter_38_2] = SkinDescInfoItem.New(var_38_1, iter_38_3, iter_38_2)

			arg_38_0.descInfoList_[iter_38_2]:RefreshUI()
			arg_38_0.descInfoList_[iter_38_2]:Show(true)
			LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_0.descPanelRect_)
		end
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_0.descPanelRect_)
	SetActive(arg_38_0.descPanel_, true)
	SetActive(arg_38_0.hideMessageGo_, true)
	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_0.descPanelRect_)
end

function var_0_0.CleanMessage(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.descInfoList_) do
		iter_39_1:Dispose()
	end

	arg_39_0.descInfoList_ = {}
end

function var_0_0.PlayVoice(arg_40_0)
	if arg_40_0.delayPlayTimer_ then
		return
	end

	HeroTools.PlayVoice(arg_40_0.heroID_, "cloth")

	arg_40_0.delayPlayTimer_ = Timer.New(function()
		if arg_40_0.delayPlayTimer_ then
			arg_40_0.delayPlayTimer_:Stop()

			arg_40_0.delayPlayTimer_ = nil
		end
	end, 10, -1)

	arg_40_0.delayPlayTimer_:Start()
end

function var_0_0.SetReturnBtn(arg_42_0, arg_42_1)
	SetActive(arg_42_0.hideMessageGo_, true)
	arg_42_0:RemoveBtnListener(nil, arg_42_0.hideMessageBtn_.transform)
	arg_42_0:AddBtnListener(arg_42_0.hideMessageBtn_, nil, function()
		arg_42_1()
		SetActive(arg_42_0.hideMessageGo_, false)
	end)
end

function var_0_0.AdjustItem(arg_44_0)
	local var_44_0 = arg_44_0:GetNearestItem()

	arg_44_0:RefreshButton(var_44_0)
end

function var_0_0.RefreshItemScale(arg_45_0)
	for iter_45_0, iter_45_1 in pairs(arg_45_0.skinItemList_) do
		if iter_45_1.isActive then
			iter_45_1:RefreshShow()
		end
	end
end

function var_0_0.BeginDragFun(arg_46_0, arg_46_1, arg_46_2)
	arg_46_0:StopMoveTimer()
	arg_46_0:StopScrollTimer()
	arg_46_0.scrollView_:OnBeginDrag(arg_46_2)
end

function var_0_0.EndDragFun(arg_47_0, arg_47_1, arg_47_2)
	arg_47_0.scrollView_:OnEndDrag(arg_47_2)
	arg_47_0:AddScrollTimer()
end

function var_0_0.Scroll2SelectItem(arg_48_0, arg_48_1)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.skinItemList_) do
		if iter_48_1.isActive then
			local var_48_0 = iter_48_1:GetSkinID() == arg_48_0.skinID_

			if var_48_0 then
				arg_48_0:AddMoveTimer(iter_48_1, arg_48_1)
			end

			iter_48_1:ShowSelect(var_48_0)
		end
	end
end

function var_0_0.GetNearestItem(arg_49_0)
	local var_49_0 = 9999
	local var_49_1
	local var_49_2 = arg_49_0.scrollTf_.rect.width / 2

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.skinItemList_) do
		if iter_49_1.isActive then
			local var_49_3 = math.abs(arg_49_0.contentTf_.localPosition.x + iter_49_1:GetLocalPosition().x - var_49_2)

			if var_49_3 < var_49_0 then
				var_49_0 = var_49_3
				var_49_1 = iter_49_1
			end
		end
	end

	return var_49_1
end

function var_0_0.AddScrollTimer(arg_50_0)
	arg_50_0:StopScrollTimer()

	arg_50_0.scrollTimer_ = nil
	arg_50_0.scrollTimer_ = FrameTimer.New(function()
		if math.abs(arg_50_0.scrollView_.velocity.x) <= 100 then
			arg_50_0.scrollTimer_:Stop()
			arg_50_0:AdjustItem()
		end
	end, 1, -1)

	arg_50_0.scrollTimer_:Start()
end

function var_0_0.StopScrollTimer(arg_52_0)
	if arg_52_0.scrollTimer_ then
		arg_52_0.scrollTimer_:Stop()

		arg_52_0.scrollTimer_ = nil
	end
end

function var_0_0.AddMoveTimer(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0:StopMoveTimer()

	arg_53_0.moveTimer_ = FrameTimer.New(function()
		local var_54_0 = arg_53_0.contentTf_.rect.width / 2
		local var_54_1 = arg_53_0.scrollTf_.rect.width / 2
		local var_54_2 = arg_53_0.contentTf_.localPosition
		local var_54_3 = arg_53_1:GetLocalPosition().x * -1 + var_54_1
		local var_54_4 = arg_53_2 * math.pow(arg_53_0.scrollView_.decelerationRate, UnityEngine.Time.unscaledDeltaTime) * UnityEngine.Time.unscaledDeltaTime

		arg_53_0.contentTf_.localPosition = Vector3.Lerp(var_54_2, Vector3.New(var_54_3, var_54_2.y, var_54_2.z), var_54_4)

		if math.abs(var_54_2.x - var_54_3) <= 1 then
			arg_53_0.contentTf_.localPosition = Vector3(var_54_3, var_54_2.y, var_54_2.z)

			arg_53_0:StopMoveTimer()
		end
	end, 1, -1)

	arg_53_0.moveTimer_:Start()
end

function var_0_0.StopMoveTimer(arg_55_0)
	if arg_55_0.moveTimer_ then
		arg_55_0.moveTimer_:Stop()

		arg_55_0.moveTimer_ = nil
	end
end

function var_0_0.RefreshDlcMovie(arg_56_0)
	manager.audio:StopVoice()

	if isNil(arg_56_0.dlcMovie_) or isNil(arg_56_0.dlcPlayer_) then
		arg_56_0.dlcMovie_ = arg_56_0.dlcMovieGo_:GetComponent("CriManaMovieControllerForUI")
		arg_56_0.dlcPlayer_ = arg_56_0.dlcMovie_.player

		arg_56_0.dlcPlayer_:SetMaxPictureDataSize(300000)

		arg_56_0.dlcPlayer_.uiRenderMode = true
	end

	if isNil(arg_56_0.dlcBgMovie_) or isNil(arg_56_0.dlcBgPlayer_) then
		arg_56_0.dlcBgMovie_ = arg_56_0.bgMovieGo_:GetComponent("CriManaMovieControllerForUI")
		arg_56_0.dlcBgPlayer_ = arg_56_0.dlcBgMovie_.player

		arg_56_0.dlcBgPlayer_:SetMaxPictureDataSize(300000)

		arg_56_0.dlcBgPlayer_.uiRenderMode = true
	end

	if tostring(arg_56_0.dlcPlayer_.status) == "Playing" and arg_56_0.dlcPlayer_.IsPaused and tostring(arg_56_0.dlcBgPlayer_.status) == "Playing" and arg_56_0.dlcBgPlayer_.IsPaused and arg_56_0.skinID_ == arg_56_0.movieSkinId_ then
		arg_56_0.dlcMovie_:Pause(false)
		arg_56_0.dlcBgMovie_:Pause(false)
		arg_56_0.dlcHideMovieController_:SetSelectedIndex(1)

		return
	end

	if arg_56_0.movieSkinId_ and arg_56_0.movieSkinId_ ~= 0 and arg_56_0.skinID_ ~= arg_56_0.movieSkinId_ then
		arg_56_0.dlcMovie_:Stop()
		arg_56_0.dlcBgMovie_:Stop()

		arg_56_0.mainMovieRaw_.material = nil
		arg_56_0.bgMovieRaw_.material = nil

		arg_56_0:StopMovieStopTimer()

		arg_56_0.stopTimer_ = Timer.New(function()
			if tostring(arg_56_0.dlcPlayer_.status) == "Stop" and tostring(arg_56_0.dlcBgPlayer_.status) == "Stop" then
				arg_56_0:StartMovie()
				arg_56_0:StopMovieStopTimer()

				return
			end
		end, 0.033, -1)

		arg_56_0.stopTimer_:Start()
	else
		arg_56_0:StartMovie()
	end
end

function var_0_0.StartMovie(arg_58_0)
	local var_58_0 = getShopCfg(arg_58_0.dlcID_)
	local var_58_1
	local var_58_2

	if var_58_0 then
		local var_58_3

		var_58_1, var_58_3 = var_58_0.give_id or var_58_0.description, var_58_0.give or 1
	end

	local var_58_4
	local var_58_5

	if var_58_0 then
		if var_58_0.description then
			local var_58_6 = var_58_0.description

			var_58_5 = RechargeShopDescriptionCfg[var_58_6]
		else
			var_58_5 = ItemCfg[var_58_1]
		end
	else
		var_58_5 = ItemCfg[arg_58_0.dlcItemID_]
	end

	local var_58_7 = true

	for iter_58_0, iter_58_1 in ipairs(SkinSceneActionCfg.all) do
		local var_58_8 = SkinSceneActionCfg[iter_58_1]

		if var_58_8.special_scene_id == var_58_5.param[1] then
			arg_58_0.start_path = var_58_8.start_path

			arg_58_0:Play()
			arg_58_0:StopMovieTimer()

			arg_58_0.timer_ = Timer.New(function()
				if arg_58_0.dlcPlayer_ and tostring(arg_58_0.dlcPlayer_.status) == "Stop" and arg_58_0.dlcBgPlayer_ and tostring(arg_58_0.dlcBgPlayer_.status) == "Stop" then
					arg_58_0:Play()

					return
				end

				if arg_58_0.dlcMovie_.isMaterialAvailable and arg_58_0.dlcBgMovie_.isMaterialAvailable then
					arg_58_0.dlcHideMovieController_:SetSelectedIndex(1)
					arg_58_0:StopMovieTimer()

					if not arg_58_0:IsTop() then
						arg_58_0:PauseDlcMovie()
					end

					return
				end
			end, 0.033, -1)

			arg_58_0.timer_:Start()

			break
		end
	end
end

function var_0_0.PauseDlcMovie(arg_60_0)
	if arg_60_0.dlcMovie_ and arg_60_0.dlcPlayer_ and arg_60_0.dlcBgMovie_ and arg_60_0.dlcBgPlayer_ then
		arg_60_0.dlcMovie_:Pause(true)
		arg_60_0.dlcBgMovie_:Pause(true)
	end
end

function var_0_0.StopMovieTimer(arg_61_0)
	if arg_61_0.timer_ then
		arg_61_0.timer_:Stop()

		arg_61_0.timer_ = nil
	end
end

function var_0_0.StopMovieStopTimer(arg_62_0)
	if arg_62_0.stopTimer_ then
		arg_62_0.stopTimer_:Stop()

		arg_62_0.stopTimer_ = nil
	end
end

function var_0_0.Play(arg_63_0)
	SetFile(arg_63_0.dlcPlayer_, nil, arg_63_0.start_path, CriMana.Player.SetMode.New)
	arg_63_0.dlcPlayer_:Prepare()
	SetFile(arg_63_0.dlcBgPlayer_, nil, arg_63_0.start_path, CriMana.Player.SetMode.New)
	arg_63_0.dlcBgPlayer_:Prepare()

	local var_63_0 = manager.audio:GetMusicVolume()

	arg_63_0.dlcPlayer_:SetVolume(var_63_0)
	arg_63_0.dlcBgPlayer_:SetVolume(0)
	arg_63_0:SetVideoTrack(arg_63_0.dlcPlayer_, arg_63_0.start_path)
	arg_63_0:SetVideoTrack(arg_63_0.dlcBgPlayer_, arg_63_0.start_path)

	arg_63_0.movieSkinId_ = arg_63_0.skinID_

	arg_63_0.dlcMovie_:Play()
	arg_63_0.dlcBgMovie_:Play()
	arg_63_0.dlcHideMovieController_:SetSelectedIndex(1)
end

function var_0_0.SetVideoTrack(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = manager.audio:GetLocalizationFlag()
	local var_64_1 = 0
	local var_64_2

	for iter_64_0 in string.gmatch(arg_64_2, "[^/]+$") do
		var_64_2 = iter_64_0
	end

	local var_64_3 = VideoTrackCfg[var_64_2]

	if var_64_3 and var_64_3.has_tracks == 1 then
		if var_64_0 == "zh" then
			var_64_1 = 0
		elseif var_64_0 == "ja" then
			var_64_1 = 1
		elseif var_64_0 == "en" then
			var_64_1 = 2
		elseif var_64_0 == "kr" then
			var_64_1 = 3
		end
	end

	arg_64_1:SetAudioTrack(var_64_1)
	arg_64_1:SetSubtitleChannel(var_64_1)
end

function var_0_0.RefreshShop(arg_65_0)
	arg_65_0:RefreshCurrencyToken(false)
end

function var_0_0.GetSkinItem(arg_66_0)
	return NewHeroSkinItem.New(arg_66_0.itemGo_, arg_66_0.contentTf_)
end

function var_0_0.OnSelectSkin(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0:SetButtonActive(1)
end

function var_0_0.OnEnter(arg_68_0)
	ShopTools.FilterShopDataList(ShopConst.SHOP_ID.SKIN_SHOP)

	arg_68_0.descList_ = {}
	arg_68_0.showDlc_ = false

	local var_68_0 = HeroSkinRouteData:GetRoute()

	if not arg_68_0.params_.heroID then
		arg_68_0.heroID_ = var_68_0.heroID
	else
		arg_68_0.heroID_ = arg_68_0.params_.heroID
	end

	if not arg_68_0.params_.isBack then
		if not arg_68_0.params_.skinID then
			arg_68_0.skinID_ = HeroTools.HeroUsingSkinInfo(arg_68_0.heroID_).id
		else
			arg_68_0.skinID_ = arg_68_0.params_.skinID
		end

		arg_68_0:ChangeShowDlcState(0)
	else
		arg_68_0:ChangeShowDlcState(arg_68_0.showDlcState_)
	end

	arg_68_0.plotController_:SetSelectedState("off")

	arg_68_0.isOpenPlotTalk = false

	manager.heroRaiseTrack:SetModelState(arg_68_0.skinID_)
	arg_68_0:RefreshShop()
	arg_68_0:RegistEventListener(GET_SKIN_GIFT, handler(arg_68_0, arg_68_0.OnGetSkinGift))
	arg_68_0:RegistEventListener(RECHARGE_SUCCESS, function(arg_69_0)
		arg_68_0:RefreshUI()
	end)
	arg_68_0:RefreshUI()

	if arg_68_0.params_.isDlc then
		arg_68_0.params_.isDlc = false

		arg_68_0:ChangeShowDlcState(1)
	elseif not arg_68_0.params_.isBack then
		arg_68_0:ChangeShowDlcState(0)
	else
		arg_68_0:ChangeShowDlcState(arg_68_0.showDlcState_)
	end

	arg_68_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_68_0, arg_68_0.BeginDragFun)))
	arg_68_0.eventTriggerListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_68_0, arg_68_0.EndDragFun)))
	arg_68_0:Scroll2SelectItem(100)
end

function var_0_0.RefreshUIWithOutScroll(arg_70_0)
	arg_70_0:RefreshInfo()
	arg_70_0:SetButtonActive(arg_70_0:SkinState(arg_70_0.skinID_))
end

function var_0_0.RefreshButton(arg_71_0, arg_71_1)
	arg_71_0.selectIndex_ = arg_71_1.index_

	local var_71_0 = arg_71_1:SkinState()
	local var_71_1 = arg_71_1.skinID_
	local var_71_2 = SkinCfg[arg_71_1.skinID_].hero

	if var_71_1 == arg_71_0.skinID_ then
		arg_71_0:Scroll2SelectItem(5)

		return
	end

	OperationRecorder.RecordButtonTouch("hero_skin_" .. var_71_1)

	arg_71_0.skinID_ = var_71_1

	local var_71_3 = SkinCfg[var_71_1]

	arg_71_0:SetButtonActive(var_71_0)
	manager.heroRaiseTrack:SetModelState(arg_71_0.skinID_)
	SetActive(arg_71_0.plotBtn_, #var_71_3.plot_title > 0)
	arg_71_0.plotController_:SetSelectedState("off")

	arg_71_0.isOpenPlotTalk = false

	arg_71_0:RefreshInfo()
	arg_71_0:CheckDlc(var_71_1, var_71_0)
	arg_71_0:RefreshDlcBtn()
	arg_71_0:ChangeShowDlcState(0)
	arg_71_0:RefreshDescBtn()
	arg_71_0:RefreshGiftBtn()
	arg_71_0:HideMessage()
	arg_71_0:RefreshUI()
	arg_71_0:Scroll2SelectItem(5)
	arg_71_0:RefreshLimitTime(arg_71_0.skinID_)
end

function var_0_0.UpdateBar(arg_72_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.SetButtonActive(arg_73_0, arg_73_1)
	arg_73_0:CheckDlc(arg_73_0.skinID_, arg_73_1)

	if arg_73_0:JudgeDLC(arg_73_0.skinID_) then
		local var_73_0 = arg_73_0:isDlcOwned()

		arg_73_0.dlc_dlcController_:SetSelectedState(tostring(var_73_0))
	end

	arg_73_0.dlc_skinController_:SetSelectedState(tostring(HeroTools.GetHasOwnedSkin(arg_73_0.skinID_)))

	if arg_73_0.btnState_ == arg_73_1 then
		return
	end

	arg_73_0.statusController_:SetSelectedIndex(arg_73_1 - 1)

	arg_73_0.btnState_ = arg_73_1

	arg_73_0:UpdateBar()
end

function var_0_0.SkinState(arg_74_0, arg_74_1)
	arg_74_0:ChangeDlcBtn()

	if arg_74_0:isUnlock(arg_74_1) then
		if arg_74_0.params_.showOnly then
			return 8
		end

		if arg_74_0:isSelect(arg_74_1) then
			return 1
		end

		return 2
	else
		if HeroTools.GetIsLimitTimeSkin(arg_74_1) then
			if arg_74_0:isSelect(arg_74_1) then
				if HeroTools.IsSkinOutOfDate(arg_74_1) or arg_74_0.showDlcState_ == 1 then
					return 1
				else
					return 10
				end
			elseif HeroTools.IsSkinOutOfDate(arg_74_1) or arg_74_0.showDlcState_ == 1 then
				return 2
			else
				return 11
			end
		end

		if HeroTools.CanChangeSkin(arg_74_1) then
			return 5
		end

		if HeroTools.GetSkinIsCanUnLock(arg_74_1) then
			return 6
		end

		if HeroTools.IsSkinOutOfDate(arg_74_1) then
			if arg_74_0.showDlcState_ == 1 and not arg_74_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_74_0.skinID_) then
				return 3
			end

			return 4
		end

		if ShopTools.IsPC() then
			local var_74_0 = HeroTools.GetShopIdBySkinId(arg_74_0.skinID_)

			if ShopTools.IsRMB(var_74_0) then
				return 12
			end
		end

		return 3
	end
end

function var_0_0.ChangeDlcBtn(arg_75_0)
	arg_75_0.dlcBtnController_:SetSelectedIndex(0)
	SetActive(arg_75_0.sourceDlcGo_, false)

	if arg_75_0:CheckIsSpecial() == 1 then
		arg_75_0:ChangeDlcBtnSpecial()

		return
	end

	if arg_75_0:CheckIsSpecial() == 2 then
		arg_75_0.sourceDlcText_.text = GetI18NText(ItemCfg[arg_75_0.dlcItemID_].desc_source) or ""

		if arg_75_0:isDlcOwned() then
			arg_75_0.dlcBtnController_:SetSelectedIndex(0)
		else
			SetActive(arg_75_0.sourceDlcGo_, true)
		end

		return
	end

	if arg_75_0.showDlcState_ == 1 then
		if arg_75_0:isUnlock(arg_75_0.skinID_) or HeroTools.GetIsLimitTimeSkin(arg_75_0.skinID_) then
			if arg_75_0:JudgeDLC(arg_75_0.skinID_) and not arg_75_0:isDlcOwned() then
				local var_75_0 = getShopCfg(arg_75_0.dlcID_)

				if ShopTools.CheckShopIsUnLock(var_75_0.shop_id) and var_75_0 and ShopTools.IsGoodCanDisplay(var_75_0.shop_id, var_75_0.goods_id) then
					arg_75_0.dlcBtnController_:SetSelectedIndex(1)
				end
			end
		elseif not arg_75_0:isDlcOwned() and HeroTools.IsSkinOnlySellDLC(arg_75_0.skinID_) then
			arg_75_0.dlcBtnController_:SetSelectedIndex(1)
		end
	end
end

function var_0_0.SaveRoute(arg_76_0)
	local var_76_0 = {
		name = "heroSkin",
		skinID = arg_76_0.skinID_,
		heroID = arg_76_0.heroID_
	}

	SkinTrialData:SaveRoute(var_76_0)
end

function var_0_0.AddUIListener(arg_77_0)
	arg_77_0:AddBtnListener(arg_77_0.portraitBtn_, nil, function()
		if arg_77_0.showDlcState_ == 1 then
			arg_77_0:Go("heroPortraitFull", {
				skinID = arg_77_0.skinID_
			})
		else
			arg_77_0:Go("heroPortrait", {
				skinID = arg_77_0.skinID_
			})
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.movieBtn_, nil, function()
		if arg_77_0.showDlcState_ == 1 then
			JumpTools.OpenPageByJump("/skinDlcShow", {
				goodId = arg_77_0.dlcID_,
				dlcItemID = arg_77_0.dlcItemID_
			})
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.replaceBtn_, nil, function()
		HeroAction.SelectSkin(arg_77_0.heroID_, arg_77_0.skinID_)

		if arg_77_0.showDlcState_ ~= 1 then
			arg_77_0:PlayVoice()
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.goBtn_, nil, function()
		arg_77_0.params_.skinID = arg_77_0.skinID_

		local var_81_0 = HeroTools.GetShopIdBySkinId(arg_77_0.skinID_)
		local var_81_1 = JumpTools.IsSystemLocked(501)

		if var_81_1 then
			ShowTips(JumpTools.GetSystemLockedTip(501, var_81_1))
		else
			local var_81_2
			local var_81_3
			local var_81_4
			local var_81_5

			if arg_77_0.dlcID_ and arg_77_0.dlcID_ ~= 0 then
				var_81_2 = ShopTools.GetDiscount(arg_77_0.dlcID_) or nil

				local var_81_6

				var_81_3, var_81_6, var_81_5 = ShopTools.IsOnDiscountArea(arg_77_0.dlcID_)
			end

			if arg_77_0.showDlcState_ == 1 then
				if arg_77_0:CheckIsSpecial() == 0 then
					if var_81_2 and var_81_2 == 0 and var_81_3 and var_81_5 then
						JumpTools.OpenPageByJump("freeSkinBuyCheck", {
							onlySkin = false,
							goodID = var_81_0,
							heroID = arg_77_0.heroID_,
							skinID = arg_77_0.skinID_
						}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
					else
						JumpTools.OpenPageByJump("newSkinBuyCheck", {
							onlySkin = false,
							goodID = var_81_0,
							heroID = arg_77_0.heroID_,
							skinID = arg_77_0.skinID_
						}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
					end
				elseif arg_77_0:CheckIsSpecial() == 1 then
					JumpTools.OpenPageByJump("newSkinBuyCheck", {
						onlySkin = true,
						goodID = var_81_0,
						heroID = arg_77_0.heroID_,
						skinID = arg_77_0.skinID_
					}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
				end
			elseif var_81_2 and var_81_2 == 0 and var_81_3 and var_81_5 then
				JumpTools.OpenPageByJump("freeSkinBuyCheck", {
					onlySkin = true,
					goodID = var_81_0,
					heroID = arg_77_0.heroID_,
					skinID = arg_77_0.skinID_
				}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
			else
				JumpTools.OpenPageByJump("newSkinBuyCheck", {
					onlySkin = true,
					goodID = var_81_0,
					heroID = arg_77_0.heroID_,
					skinID = arg_77_0.skinID_
				}, ViewConst.SYSTEM_ID.RECHARGE_SKIN)
			end
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.pcRmbBtn_, nil, function()
		if ShopTools.IsPC() then
			ShowTips("PC_SHOP_TIPS2")

			return
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.changeBtn_, nil, function()
		arg_77_0.params_.skinID = arg_77_0.skinID_

		CommonAction.TryToUseItem({
			{
				item_info = {
					num = 1,
					id = HeroTools.GetSkinChangeItem(arg_77_0.skinID_)
				},
				use_list = {}
			}
		})
	end)
	arg_77_0:AddBtnListener(arg_77_0.unlockBtn_, nil, function()
		if arg_77_0.isCanUnlock_ then
			HeroAction.UnLockSkin(arg_77_0.skinID_)
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.giftBtn_, nil, function()
		if arg_77_0:isUnlock(arg_77_0.skinID_) then
			PlayerAction.ReceiveSkinGift(arg_77_0.skinID_)
		else
			local var_85_0 = (SkinCfg[arg_77_0.skinID_] or {}).gift or {}

			JumpTools.OpenPageByJump("rewardPreview", {
				is_receive = false,
				rewardList = var_85_0
			}, ViewConst.SYSTEM_ID.REWARD_PREVIEW)
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.battleBtn_, nil, function()
		arg_77_0.params_.skinID = arg_77_0.skinID_

		local var_86_0 = 0
		local var_86_1 = SkinTagCfg[arg_77_0.skinID_]
		local var_86_2 = var_86_1.trial_activity
		local var_86_3 = var_86_2[1]

		for iter_86_0, iter_86_1 in ipairs(var_86_2) do
			local var_86_4 = ActivitySkinTrialCfg[iter_86_1].activity_id

			if ActivityData:GetActivityIsOpen(var_86_4) then
				var_86_0 = var_86_4
				var_86_3 = iter_86_1

				break
			end
		end

		SkinTrialData:SaveStageID(var_86_3)
		arg_77_0:SaveRoute()
		arg_77_0:Go("/sectionSelectHero", {
			activityID = var_86_0,
			section = var_86_1.trial_stage,
			sectionType = BattleConst.STAGE_TYPE_NEW.SKIN_TRIAL
		})
	end)
	arg_77_0:AddBtnListener(arg_77_0.plotBtn_, nil, function()
		if not arg_77_0.isOpenPlotTalk then
			arg_77_0:IndexPlotItem()
			arg_77_0.plotController_:SetSelectedState("on")
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_0.talkStateGo_.transform)

			arg_77_0.isOpenPlotTalk = true
		else
			arg_77_0.plotController_:SetSelectedState("off")

			arg_77_0.isOpenPlotTalk = false
		end
	end)
	arg_77_0:AddBtnListener(arg_77_0.plotTalkMaskBtn_, nil, function()
		arg_77_0.plotController_:SetSelectedState("off")

		arg_77_0.isOpenPlotTalk = false
	end)

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.descBtn_) do
		arg_77_0:AddBtnListener(iter_77_1, nil, function()
			arg_77_0:ShowMessage()
		end)
	end

	arg_77_0:AddBtnListener(nil, arg_77_0.hideMessageBtn_, function()
		arg_77_0:HideMessage()
		SetActive(arg_77_0.hideMessageGo_, false)
	end)
	arg_77_0:AddBtnListener(nil, arg_77_0.dlc_skinBtn_, function()
		OperationRecorder.RecordButtonTouch("skin_pre_" .. arg_77_0.skinID_)

		arg_77_0.showDlc_ = false

		arg_77_0:ChangeShowDlcState(0)
	end)
	arg_77_0:AddBtnListener(nil, arg_77_0.dlc_dlcBtn_, function()
		if arg_77_0.dlcID_ then
			local var_92_0 = getShopCfg(arg_77_0.dlcID_)

			if var_92_0 then
				local var_92_1 = var_92_0.give_id or var_92_0.description

				if var_92_1 then
					OperationRecorder.RecordButtonTouch("skin_dlc_pre_" .. var_92_1)
				end
			else
				OperationRecorder.RecordButtonTouch("skin_dlc_pre_" .. arg_77_0.dlcItemID_ss)
			end
		end

		arg_77_0.showDlc_ = true

		arg_77_0:ChangeShowDlcState(1)
	end)
	arg_77_0:AddBtnListener(nil, arg_77_0.buyDlcBtn_, function()
		arg_77_0.params_.skinID = arg_77_0.skinID_

		local var_93_0 = HeroTools.GetShopIdBySkinId(arg_77_0.skinID_)
		local var_93_1 = JumpTools.IsSystemLocked(501)

		if var_93_1 then
			ShowTips(JumpTools.GetSystemLockedTip(501, var_93_1))
		else
			local var_93_2 = getShopCfg(arg_77_0.dlcID_)

			if var_93_2 == nil then
				return
			elseif ShopConst.SHOP_ID.DLC_SHOP == var_93_2.shop_id then
				JumpTools.OpenPageByJump("newSkinBuyCheck", {
					goodID = var_93_0,
					heroID = arg_77_0.heroID_,
					skinID = arg_77_0.skinID_
				}, ViewConst.SYSTEM_ID.SHOP)
			else
				local var_93_3 = getShopCfg(arg_77_0.dlcID_)

				JumpTools.GoToSystem("/shop", {
					shopId = var_93_3.shop_id
				}, ViewConst.SYSTEM_ID.SHOP)
			end
		end
	end)
	arg_77_0.scrollView_.onValueChanged:AddListener(function()
		arg_77_0:RefreshItemScale()
	end)
	arg_77_0:AddBtnListener(arg_77_0.switchInfoBtn_, nil, function()
		if arg_77_0.infoController_:GetSelectedState() == "tag" then
			arg_77_0:SwitchInfoController("description")
		else
			arg_77_0:SwitchInfoController("tag")
		end
	end)
	arg_77_0:AddBtnListenerOther()
end

function var_0_0.AddBtnListenerOther(arg_96_0)
	arg_96_0:AddBtnListener(arg_96_0.changeBtn_, nil, function()
		arg_96_0.params_.skinID = arg_96_0.skinID_

		CommonAction.TryToUseItem({
			{
				item_info = {
					num = 1,
					id = HeroTools.GetSkinChangeItem(arg_96_0.skinID_)
				},
				use_list = {}
			}
		})
	end)
	arg_96_0:AddBtnListener(arg_96_0.btn_dlcSpecialExchangeBtn_, nil, function()
		local var_98_0 = getShopCfg(arg_96_0.dlcID_)

		ShowMessageBox({
			content = string.format(GetTips("SHOP_DLC_LINK"), ItemTools.getItemName(var_98_0.give_id)),
			OkCallback = function()
				if var_98_0 then
					JumpTools.GoToSystem("/shop", {
						shopId = var_98_0.shop_id
					}, ViewConst.SYSTEM_ID.SHOP)
				end
			end,
			CancelCallback = function()
				return
			end
		})
	end)
end

function var_0_0.OnTryToUseItem(arg_101_0, arg_101_1, arg_101_2)
	if isSuccess(arg_101_1.result) then
		local var_101_0 = arg_101_2.use_item_list[1].item_info.id
		local var_101_1 = ItemCfg[var_101_0].param[1]

		getReward({
			{
				num = 1,
				id = var_101_1
			}
		}, {
			ItemConst.ITEM_TYPE.HERO_SKIN
		})

		local var_101_2 = SkinCfg[var_101_1].hero

		HeroAction.UpdateSkinCouponRedPoint(var_101_2)
		HeroAction.SkinAdd(arg_101_0.skinID_)
		arg_101_0:OnTryToUseItemOther(var_101_1)
	else
		ShowTips(arg_101_1.result)
	end

	arg_101_0:RefreshUI()
end

function var_0_0.OnTryToUseItemOther(arg_102_0, arg_102_1)
	arg_102_0:SetButtonActive(2)
	manager.redPoint:setTip(RedPointConst.HERO_SKIN_ROUTE_ID .. arg_102_1, 0, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.ChangeShowDlcState(arg_103_0, arg_103_1)
	arg_103_0.dlcHideMovieController_:SetSelectedIndex(0)

	arg_103_0.showDlcState_ = arg_103_1

	arg_103_0.dlcController_:SetSelectedIndex(arg_103_1)

	if arg_103_1 == 0 then
		arg_103_0.dlc_skinBtn_.interactable = false
		arg_103_0.dlc_dlcBtn_.interactable = true

		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.heroRaiseCommon, {
			1,
			4
		}, arg_103_0.displayGo_)
		manager.heroRaiseTrack:SetModelState(arg_103_0.skinID_)
		arg_103_0:PauseDlcMovie()
		SetActive(arg_103_0.movieBtn_.gameObject, false)
	elseif arg_103_1 == 1 then
		arg_103_0.dlc_skinBtn_.interactable = true
		arg_103_0.dlc_dlcBtn_.interactable = false

		manager.heroRaiseTrack:SetViewState(HeroRaiseTrackConst.ViewType.null)
		arg_103_0:RefreshDlcMovie()
		SetActive(arg_103_0.movieBtn_.gameObject, true)
	end

	arg_103_0:ChangeShowDlcStateOther()
end

function var_0_0.ChangeShowDlcStateOther(arg_104_0)
	arg_104_0:ChangeDlcBtn()
	arg_104_0:SetButtonActive(arg_104_0:SkinState(arg_104_0.skinID_))
	arg_104_0:RefreshInfo()
end

function var_0_0.RefreshInfo(arg_105_0)
	if arg_105_0.showDlcState_ == 1 then
		local var_105_0 = getShopCfg(arg_105_0.dlcID_)
		local var_105_1

		if var_105_0 then
			var_105_1 = RechargeShopDescriptionCfg[var_105_0.description]
		else
			var_105_1 = RechargeShopDescriptionCfg[arg_105_0.dlcItemID_]
		end

		if var_105_1 == nil then
			if var_105_0 then
				var_105_1 = ItemCfg[var_105_0.give_id]
			else
				var_105_1 = ItemCfg[arg_105_0.dlcItemID_]
			end
		end

		local var_105_2 = string.format("%s", var_105_1.name)
		local var_105_3 = string.format("%s", var_105_1.desc)

		arg_105_0.nameText_.text = GetI18NText(var_105_2)
		arg_105_0.infoText_.text = GetI18NText(var_105_3)
	else
		arg_105_0.nameText_.text = GetI18NText(SkinCfg[arg_105_0.skinID_].name)
		arg_105_0.infoText_.text = GetI18NText(SkinCfg[arg_105_0.skinID_].desc)
	end

	arg_105_0:CleanMessage()

	local var_105_4 = HeroTools.GetSkinChangeItem(arg_105_0.skinID_)

	if var_105_4 then
		arg_105_0.sourcetextText_.text = GetI18NText(ItemCfg[var_105_4].desc_source) or ""
		arg_105_0.couponImg_.sprite = ItemTools.getItemLittleSprite(var_105_4)
	else
		arg_105_0.sourcetextText_.text = GetI18NText(ItemCfg[arg_105_0.skinID_].desc_source) or ""
	end

	if HeroTools.IsSkinOnlySellDLC(arg_105_0.skinID_) then
		arg_105_0.sourcetextText_.text = GetTips("ACTIVITY_REWARD_RECEIVE") or ""
	end

	arg_105_0:RefreshInfoOther()
end

function var_0_0.RefreshInfoOther(arg_106_0)
	if arg_106_0.btnState_ == 5 then
		if HeroTools.CanChangeSkin(arg_106_0.skinID_) then
			manager.redPoint:SetRedPointIndependent(arg_106_0.changeBtn_.transform, true)
		else
			manager.redPoint:SetRedPointIndependent(arg_106_0.changeBtn_.transform, false)
		end
	end

	if arg_106_0.btnState_ == 6 then
		arg_106_0.isCanUnlock_ = true

		for iter_106_0, iter_106_1 in pairs(SkinCfg[arg_106_0.skinID_].unlock_id_list) do
			local var_106_0, var_106_1, var_106_2 = IsConditionAchieved(iter_106_1, {
				heroId = arg_106_0.heroID_
			})

			if var_106_0 then
				arg_106_0["taskController_" .. iter_106_0]:SetSelectedState("true")
			else
				arg_106_0.isCanUnlock_ = false

				arg_106_0["taskController_" .. iter_106_0]:SetSelectedState("false")
			end

			arg_106_0["tasktext_" .. iter_106_0].text = GetI18NText(ConditionCfg[iter_106_1].desc)
		end

		arg_106_0.unlockController_:SetSelectedState(arg_106_0.isCanUnlock_ and "false" or "true")
	end

	arg_106_0:RefreshLimitTime(arg_106_0.skinID_)
end

return var_0_0
