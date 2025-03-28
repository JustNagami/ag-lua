local var_0_0 = class("RechargeMainView", ReduxView)
local var_0_1 = 2
local var_0_2 = {
	[ShopConst.SHOP_ID.MIGRATION_OBSERVATIONS] = true,
	[ShopConst.SHOP_ID.SKIN_TARGET] = true
}

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Recharge/RechargeSystemUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.prefabList_ = ShopConst.prefabList
	arg_3_0.ClassList_ = {
		[ShopConst.SHOP_ID.LIMIT_SUPPLY] = RechargeGiftPageView,
		[ShopConst.SHOP_ID.DAILY_SUPPLY] = RechargeGiftPageView,
		[ShopConst.SHOP_ID.NEWBIE_SHOP] = RechargeGiftPageView,
		[ShopConst.SHOP_ID.DRAW_SHOP] = RechargeVoucherPageView,
		[ShopConst.SHOP_ID.SKIN_SHOP] = RechargeSkinDlcPageView,
		[ShopConst.SHOP_ID.DIRECT_SHOP] = RechargeSkinPageView,
		[ShopConst.SHOP_ID.REPURCHASE_SHOP] = RechargeSkinPageView,
		[ShopConst.SHOP_ID.SKIN_TARGET] = RechargeGiftPageView,
		[ShopConst.SHOP_ID.CONSTANT_OBSERVATIONS] = RechargeMonthCardPageView,
		[ShopConst.SHOP_ID.MIGRATION_OBSERVATIONS] = RechargeRechargePageView,
		[ShopConst.SHOP_ID.SIX_SHOP] = RechargeFirstRechargePageView,
		[ShopConst.SHOP_ID.EIGHT_SHOP] = RechargeFirstRechargePageView,
		[ShopConst.SHOP_ID.OBSERVATION_SHOP] = RechargeFirstMonthlyCardPageView,
		[ShopConst.SHOP_ID.CONTRACT_BENEFITS] = RechargeFirstBpPageView
	}
	arg_3_0.SpecialClassList_ = {
		[ShopConst.SPECIAL_ID.SKIN_LIST] = RechargeSkinListPageView
	}

	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.pages_ = {}
	arg_4_0.specialPages_ = {}
	arg_4_0.tree_ = LuaTree.New(arg_4_0.treeGo_)
	arg_4_0.titleList = {
		RechargeTitleItem.New(arg_4_0.tag01_),
		RechargeTitleItem.New(arg_4_0.tag02_),
		RechargeTitleItem.New(arg_4_0.tag03_),
		(RechargeTitleItem.New(arg_4_0.tag04_))
	}
	arg_4_0.redBindingGroupIndex_ = 0
	arg_4_0.enterTimerDic = {}
	arg_4_0.skinTabController_ = arg_4_0.mainControllerEx_:GetController("skinTab")
	arg_4_0.hideTopController_ = arg_4_0.mainControllerEx_:GetController("hideTop")
	arg_4_0.btnTwoController_ = arg_4_0.mainControllerEx_:GetController("btn_two")
	arg_4_0.tabChooseController_ = arg_4_0.tabControllerEx_:GetController("tab")
	arg_4_0.filterBtnController_ = arg_4_0.skinListFiltetControllerEx_:GetController("color")
	arg_4_0.skinDiscountController_ = arg_4_0.mainControllerEx_:GetController("skinEvent")

	arg_4_0.filterBtnController_:SetSelectedState("normal")

	arg_4_0.skinPageState_ = 0
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.cumulativeBtn_, nil, function()
		manager.redPoint:setTip(RedPointConst.TOTAL_CHARGE_BONUS, 0, RedPointStyle.SHOW_NEW_TAG)
		JumpTools.OpenPageByJump("/rechargeTotalRecharge")
	end)
	arg_5_0:AddBtnListener(arg_5_0.tabBtn_, nil, function()
		arg_5_0:ChangeSkinPage()
	end)
	arg_5_0:AddBtnListener(arg_5_0.skinListFiltetBtn_, nil, function()
		if arg_5_0.skinPageState_ == 1 then
			local var_8_0 = ShopConst.SPECIAL_ID.SKIN_LIST
			local var_8_1 = arg_5_0.specialPages_[var_8_0]

			if var_8_1.OpenFilterView then
				var_8_1:OpenFilterView()
			end
		end
	end)
	arg_5_0:AddBtnListener(arg_5_0.skinDiscountBtn_, nil, function()
		local var_9_0 = SkinDiscountGiftTools.HasGiftActivityID()

		if var_9_0 then
			OperationRecorder.RecordButtonTouch({
				button_name = "shop_recharge_activity_" .. var_9_0
			})
			JumpTools.GoToSystem("/skinDiscountGiftMain", {
				activityID = var_9_0
			}, ViewConst.SYSTEM_ID.SKIN_DISCOUNT_GIFT)
		end
	end)
end

function var_0_0.OnGroupSelect(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	arg_10_0.groupInfo = arg_10_0.groups_[arg_10_1]

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.titleList) do
		if iter_10_0 <= #arg_10_0.groupInfo.itemIndexes_ then
			local var_10_0 = arg_10_0.groupInfo[iter_10_0].id

			SetActive(iter_10_1.gameObject_, true)
			iter_10_1:SetData(arg_10_0.groupInfo[iter_10_0], iter_10_0, handler(arg_10_0, arg_10_0.ClickTitle), var_10_0)
			SetActive(arg_10_0["newGo" .. iter_10_0 .. "_"], arg_10_0:CheckShopRedPoint(var_10_0))
			SetActive(arg_10_0["redGo" .. iter_10_0 .. "_"], arg_10_0:SpecialShop(var_10_0))
		else
			SetActive(iter_10_1.gameObject_, false)
		end
	end

	for iter_10_2 = 1, 3 do
		SetActive(arg_10_0["line" .. iter_10_2 .. "Go_"], iter_10_2 < #arg_10_0.groupInfo.itemIndexes_)
	end

	arg_10_0.params_.page = arg_10_1

	if arg_10_0.currentGroupIndex_ == arg_10_1 then
		arg_10_0:ClickTitle(arg_10_0.itemToSelect_ or arg_10_0.currentItemIndex_)
	else
		arg_10_0:ClickTitle(arg_10_0.itemToSelect_ or 1)
	end

	arg_10_0.itemToSelect_ = nil
	arg_10_0.currentGroupIndex_ = arg_10_1

	arg_10_0:EnterSendMgr(arg_10_1)
end

function var_0_0.ClickTitle(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.groupInfo[arg_11_1].id

	OperationRecorder.RecordButtonTouch("shop_recharge_gifts" .. arg_11_0.params_.page .. "_type" .. arg_11_1)

	if ShopConst.PC_LOCK_SHOP[var_11_0] and ShopTools.IsLimitRecharge() then
		ShowTips("PC_SHOP_TIPS1")

		return
	end

	if arg_11_0.currentGroupIndex_ == 4 and arg_11_0.currentItemIndex_ == 3 and arg_11_1 ~= 3 then
		saveData("FirstGear", "hasView", true)
		manager.redPoint:setTip(RedPointConst.FIRST_GEAR, 0)
	end

	arg_11_0.currentItemIndex_ = arg_11_1

	arg_11_0:EnterSendMgr(nil, arg_11_1)

	arg_11_0.params_.childShopIndex = arg_11_1

	arg_11_0:SwitchToShop(var_11_0)

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.titleList) do
		iter_11_1.controller:SetSelectedState(iter_11_0 == arg_11_1 and "false" or "true")
	end

	if ShopData.GetRedPointData()[var_11_0] then
		ShopAction.RemoveShopRedPoint(var_11_0)
		SetActive(arg_11_0["newGo" .. arg_11_1 .. "_"], false)
		SetActive(arg_11_0["redGo" .. arg_11_1 .. "_"], arg_11_0:SpecialShop(var_11_0))
	end

	if var_11_0 == ShopConst.SHOP_ID.MIGRATION_OBSERVATIONS then
		RedPointAction.HandleRedPoint(RED_POINT_ID.RECHARGE)
		manager.redPoint:setTip(RED_POINT_ID.RECHARGE, 0)
		SetActive(arg_11_0.redGo2_, false)
	end

	if var_11_0 == ShopConst.SHOP_ID.OBSERVATION_SHOP and ActivityNoobData:GetFirstMonthlyCardStatus().newTagSignFlag then
		ActivityNoobAction.UpdateFirstSign()
	end

	if var_11_0 == ShopConst.SHOP_ID.CONSTANT_OBSERVATIONS and ActivityNoobData:GetFirstMonthlyCardStatus().newTagRoleFlag then
		ActivityNoobAction.UpdateFirstRecharge()
	end

	if var_11_0 == ShopConst.SHOP_ID.SIX_SHOP and ActivityNoobData:GetFirstRechargeStatus().firstGearNewTag then
		ActivityNoobAction.UpdateFirstGearNewTag()
	end

	if var_11_0 == ShopConst.SHOP_ID.EIGHT_SHOP and ActivityNoobData:GetFirstRechargeStatus().secondGearNewTag then
		ActivityNoobAction.UpdateSecondGearNewTag()
	end

	if var_11_0 == ShopConst.SHOP_ID.CONTRACT_BENEFITS and ActivityNoobData:GetBattlePassStatus().battlePassNewTag then
		ActivityNoobAction.UpdateBattlePassNewTag()
	end
end

function var_0_0.ChangeSkinPage(arg_12_0)
	if arg_12_0.skinPageState_ == 0 then
		arg_12_0:SwitchToSkinList()
	else
		arg_12_0:SwitchToShop(arg_12_0.shopListId_, true)
	end
end

function var_0_0.SwitchToSkinList(arg_13_0)
	arg_13_0.skinPageState_ = 1

	arg_13_0.hideTopController_:SetSelectedState("state1")
	arg_13_0.btnTwoController_:SetSelectedState("state1")
	arg_13_0.tabChooseController_:SetSelectedState("select2")

	if arg_13_0.shopListId_ then
		local var_13_0 = arg_13_0.pages_[arg_13_0.shopListId_]

		if var_13_0 then
			var_13_0:Hide()
		end
	end

	local var_13_1 = ShopConst.SPECIAL_ID.SKIN_LIST

	arg_13_0:UpdateBar()

	if not arg_13_0.specialPages_[var_13_1] then
		local var_13_2 = Object.Instantiate(Asset.Load(ShopConst.SPRCIAL_PREFAB[var_13_1]), arg_13_0.container_)

		arg_13_0.specialPages_[var_13_1] = arg_13_0.SpecialClassList_[var_13_1].New(var_13_2)

		arg_13_0.specialPages_[var_13_1]:Show()
	else
		arg_13_0.specialPages_[var_13_1]:Show()
	end
end

function var_0_0.UpdateBar(arg_14_0)
	if arg_14_0.skinPageState_ == 1 then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_SKIN,
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId(),
			53014
		})
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, true)
		manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, true)
		manager.windowBar:SetBarCanClick(53014, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)

		return
	end

	if arg_14_0.shopListId_ == ShopConst.SHOP_ID.SKIN_SHOP or arg_14_0.shopListId_ == ShopConst.SHOP_ID.SKIN_TARGET then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_SKIN
		}, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_SKIN, var_0_2[arg_14_0.shopListId_] ~= true)
		manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_SKIN, var_0_2[arg_14_0.shopListId_] ~= true)
	else
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
		manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), var_0_2[arg_14_0.shopListId_] ~= true)
	end
end

function var_0_0.RefreshTree(arg_15_0)
	local var_15_0 = arg_15_0.tree_

	var_15_0:SetSelectedHandler(nil, nil)

	local var_15_1 = arg_15_0:GetTreeDataByParams()

	var_15_0:SetData(var_15_1)
	var_15_0:SetSelectedHandler(handler(arg_15_0, arg_15_0.OnGroupSelect))

	arg_15_0.treeData_ = var_15_1

	arg_15_0:BindRedPoint()
end

function var_0_0.SwitchToShop(arg_16_0, arg_16_1, arg_16_2)
	if arg_16_1 == arg_16_0.shopListId_ and not arg_16_2 then
		return
	end

	if arg_16_0.skinPageState_ == 1 then
		arg_16_0.skinPageState_ = 0

		arg_16_0.hideTopController_:SetSelectedState("state0")
		arg_16_0.btnTwoController_:SetSelectedState("state0")
		arg_16_0.tabChooseController_:SetSelectedState("select1")

		local var_16_0 = ShopConst.SPECIAL_ID.SKIN_LIST
		local var_16_1 = arg_16_0.specialPages_[var_16_0]

		if var_16_1 then
			var_16_1:Hide()
		end
	end

	if arg_16_0.shopListId_ then
		local var_16_2 = arg_16_0.pages_[arg_16_0.shopListId_]

		if var_16_2 then
			var_16_2:Hide()
		end
	end

	arg_16_0.shopListId_ = arg_16_1
	arg_16_0.params_.shopListId = arg_16_1

	if not arg_16_0.pages_[arg_16_1] then
		local var_16_3 = Object.Instantiate(Asset.Load(arg_16_0.prefabList_[arg_16_1]), arg_16_0.container_)

		arg_16_0.pages_[arg_16_1] = arg_16_0.ClassList_[arg_16_1].New(var_16_3, {
			ShopConst.SIX_EIGHT[arg_16_1]
		}, arg_16_1)

		arg_16_0:CheckPageEnter(arg_16_1)
	else
		arg_16_0.pages_[arg_16_1]:Show()
	end

	if arg_16_0.pages_[arg_16_1].SwitchPage then
		arg_16_0.pages_[arg_16_1]:SwitchPage(arg_16_1)
	end

	if ShopConst.SKIN_SHOP_LIST[arg_16_1] then
		arg_16_0.skinTabController_:SetSelectedIndex(1)
	else
		arg_16_0.skinTabController_:SetSelectedIndex(0)
	end

	if arg_16_1 == ShopConst.SHOP_ID.SKIN_SHOP then
		arg_16_0:RefreshSkinDiscountGift()
	else
		arg_16_0.skinDiscountController_:SetSelectedState("state0")
	end

	arg_16_0:UpdateBar()
end

function var_0_0.SwitchPageByParams(arg_17_0)
	arg_17_0.currentGroupIndex_, arg_17_0.currentItemIndex_ = 1, 1

	local var_17_0 = 1

	if arg_17_0.params_.page then
		local var_17_1 = arg_17_0.params_.page

		arg_17_0.currentGroupIndex_ = var_17_1

		local var_17_2 = arg_17_0.groups_[var_17_1]
		local var_17_3 = arg_17_0.params_.shopId_ or arg_17_0.params_.shopListId

		for iter_17_0, iter_17_1 in ipairs(var_17_2.itemIndexes_) do
			local var_17_4 = var_17_2[iter_17_1]

			if var_17_3 and var_17_3 == var_17_4.id then
				arg_17_0.itemToSelect_ = iter_17_0

				break
			end
		end

		if arg_17_0.itemToSelect_ == nil and arg_17_0.params_.childShopIndex then
			arg_17_0.itemToSelect_ = arg_17_0.params_.childShopIndex
		end

		arg_17_0.tree_:SelectGroup(arg_17_0.currentGroupIndex_)

		if var_17_3 and arg_17_0.params_.goodId_ then
			local var_17_5 = arg_17_0.params_.goodId_

			if ShopTools.IsGoodCanBuyInShop(var_17_3, var_17_5) and ShopTools.CheckSoldOut(var_17_5) == false then
				if ShopTools.CheckGiftSkinOwn(var_17_5) then
					ShowTips("ALREADY_GET")
				elseif ShopTools.IsPC() then
					ShowTips("PC_SHOP_TIPS2")
				else
					JumpTools.OpenPageByJump("rechargeGiftPopLink", {
						goodId = var_17_5,
						shopId = var_17_3
					})
				end
			else
				ShowTips("SELL_OUT")
			end

			arg_17_0.params_.goodId_ = nil
		end

		arg_17_0.params_.shopId_ = nil
	end
end

function var_0_0.CheckPageEnter(arg_18_0, arg_18_1)
	if not arg_18_0.enteredPage_[arg_18_1] then
		arg_18_0.enterTimerDic[arg_18_1] = TimeTools.StartAfterSeconds(0.05, function()
			if arg_18_0.enterTimerDic[arg_18_1] == nil then
				return
			end

			arg_18_0.pages_[arg_18_1]:OnEnter()

			arg_18_0.enteredPage_[arg_18_1] = true
			arg_18_0.enterTimerDic[arg_18_1] = nil
		end, {})
	end
end

function var_0_0.OnTop(arg_20_0)
	arg_20_0:UpdateBar()

	if arg_20_0.currentGroupIndex_ ~= arg_20_0.params_.page or arg_20_0.currentItemIndex_ ~= arg_20_0.params_.childShopIndex then
		arg_20_0:SwitchPageByParams()
	end

	if arg_20_0.groupInfo[arg_20_0.currentItemIndex_] then
		local var_20_0 = arg_20_0.groupInfo[arg_20_0.currentItemIndex_].id

		if var_20_0 == ShopConst.SHOP_ID.CONTRACT_BENEFITS and arg_20_0.pages_[var_20_0] then
			arg_20_0.pages_[var_20_0]:Show()
		end
	end
end

function var_0_0.OnEnter(arg_21_0)
	arg_21_0.enteredPage_ = {}

	for iter_21_0, iter_21_1 in pairs(arg_21_0.pages_) do
		arg_21_0:CheckPageEnter(iter_21_0)
	end

	arg_21_0:RefreshTree()
	arg_21_0:SwitchPageByParams()
	arg_21_0:RegistEventListener(SHOP_BUY_SUCCESS, function(arg_22_0, arg_22_1)
		for iter_22_0, iter_22_1 in pairs(arg_21_0.pages_) do
			if iter_22_1 ~= nil and iter_22_1.OnBuySuccess then
				iter_22_1:OnBuySuccess(arg_22_0, arg_22_1)
			end
		end
	end)
	arg_21_0:RegistEventListener(RECHARGE_SKIN_LIST_FILTER_APPLY, function(arg_23_0)
		arg_21_0:OnSkinListFilterApply(arg_23_0)
	end)

	if arg_21_0.pages_[arg_21_0.shopListId_] and arg_21_0.pages_[arg_21_0.shopListId_].RefreshList then
		arg_21_0.pages_[arg_21_0.shopListId_]:RefreshList()
	end

	if arg_21_0.skinPageState_ == 1 then
		local var_21_0 = ShopConst.SPECIAL_ID.SKIN_LIST

		if arg_21_0.specialPages_[var_21_0] and arg_21_0.specialPages_[var_21_0].RefreshList then
			arg_21_0.specialPages_[var_21_0]:RefreshList()
		end
	end
end

function var_0_0.OnExit(arg_24_0)
	arg_24_0:RemoveAllEventListener()

	for iter_24_0, iter_24_1 in pairs(arg_24_0.pages_) do
		if iter_24_1 ~= nil then
			iter_24_1:OnExit()
		end
	end

	for iter_24_2, iter_24_3 in pairs(arg_24_0.specialPages_) do
		if iter_24_3 ~= nil then
			iter_24_3:OnExit()
		end
	end

	arg_24_0.enterTimer = nil

	for iter_24_4, iter_24_5 in pairs(arg_24_0.enterTimerDic) do
		iter_24_5:Stop()
	end

	arg_24_0.enterTimerDic = {}

	arg_24_0:UnbindRedPoint()
	manager.windowBar:HideBar()
	arg_24_0:ExitUITime()
end

function var_0_0.BindRedPoint(arg_25_0)
	manager.redPoint:bindUIandKey(arg_25_0.totalRechargeNoticeContainer_, RedPointConst.TOTAL_CHARGE_BONUS)

	for iter_25_0, iter_25_1 in pairs(arg_25_0.groups_) do
		local var_25_0 = arg_25_0.tree_:GetGroupRedPointContainerById(iter_25_0)

		if var_25_0 then
			SetActive(var_25_0, true)

			local var_25_1 = false
			local var_25_2 = false
			local var_25_3 = var_25_0.transform:Find("notice_img/Default")
			local var_25_4 = var_25_0.transform:Find("notice_img/NewRed")

			for iter_25_2, iter_25_3 in pairs(iter_25_1) do
				if arg_25_0:CheckShopRedPoint(iter_25_3.id) then
					var_25_1 = true
				end

				if arg_25_0:SpecialShop(iter_25_3.id) then
					var_25_2 = true
				end
			end

			SetActive(var_25_4, var_25_1)
			SetActive(var_25_3, var_25_2)
		end
	end

	arg_25_0.updateTimer_ = Timer.New(function()
		for iter_26_0, iter_26_1 in ipairs(arg_25_0.titleList) do
			if iter_26_0 <= #arg_25_0.groupInfo.itemIndexes_ then
				local var_26_0 = arg_25_0.groupInfo[arg_25_0.groupInfo.itemIndexes_[iter_26_0]].id

				SetActive(arg_25_0["newGo" .. iter_26_0 .. "_"], arg_25_0:CheckShopRedPoint(var_26_0))
				SetActive(arg_25_0["redGo" .. iter_26_0 .. "_"], arg_25_0:SpecialShop(var_26_0))
			end
		end

		for iter_26_2, iter_26_3 in pairs(arg_25_0.groups_) do
			local var_26_1 = arg_25_0.tree_:GetGroupRedPointContainerById(iter_26_2)

			if var_26_1 then
				SetActive(var_26_1, true)

				local var_26_2 = false
				local var_26_3 = false
				local var_26_4 = var_26_1.transform:Find("notice_img/Default")
				local var_26_5 = var_26_1.transform:Find("notice_img/NewRed")

				for iter_26_4, iter_26_5 in pairs(iter_26_3) do
					if arg_25_0:CheckShopRedPoint(iter_26_5.id) then
						var_26_2 = true
					end

					if arg_25_0:SpecialShop(iter_26_5.id) then
						var_26_3 = true
					end
				end

				SetActive(var_26_5, var_26_2)
				SetActive(var_26_4, var_26_3)
			end
		end
	end, 1, -1, 1)

	arg_25_0.updateTimer_:Start()
	manager.redPoint:bindUIandKey(arg_25_0.skinDiscountBtn_.transform, RedPointConst.SKIN_DISCOUNT_GIFT)
end

function var_0_0.UnbindRedPoint(arg_27_0)
	manager.redPoint:unbindUIandKey(arg_27_0.totalRechargeNoticeContainer_, RedPointConst.TOTAL_CHARGE_BONUS, {
		x = 0,
		y = 0
	})

	if arg_27_0.updateTimer_ then
		arg_27_0.updateTimer_:Stop()

		arg_27_0.updateTimer_ = nil
	end

	manager.redPoint:unbindUIandKey(arg_27_0.skinDiscountBtn_.transform, RedPointConst.SKIN_DISCOUNT_GIFT)
end

function var_0_0.OnShopBuyResult(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	if arg_28_0.pages_[var_0_1] then
		arg_28_0.pages_[var_0_1]:OnShopBuyResult(arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	end
end

function var_0_0.SpecialShop(arg_29_0, arg_29_1)
	if ShopConst.PC_LOCK_SHOP[arg_29_1] == true and ShopTools.IsLimitRecharge() then
		return false
	end

	if ShopConst.SHOP_ID_TO_RED_CONST[arg_29_1] then
		return manager.redPoint:getTipValue(ShopConst.SHOP_ID_TO_RED_CONST[arg_29_1]) >= 1
	end

	return false
end

function var_0_0.CheckShopRedPoint(arg_30_0, arg_30_1)
	local var_30_0 = ShopData.GetRedPointData()

	if arg_30_1 == ShopConst.SHOP_ID.CONSTANT_OBSERVATIONS then
		return var_30_0[arg_30_1] == true or ActivityNoobData:GetFirstMonthlyCardStatus().newTagRoleFlag
	elseif arg_30_1 == ShopConst.SHOP_ID.OBSERVATION_SHOP then
		return var_30_0[arg_30_1] == true or ActivityNoobData:GetFirstMonthlyCardStatus().newTagSignFlag
	elseif arg_30_1 == ShopConst.SHOP_ID.SIX_SHOP then
		return var_30_0[arg_30_1] == true or ActivityNoobData:GetFirstRechargeStatus().firstGearNewTag
	elseif arg_30_1 == ShopConst.SHOP_ID.EIGHT_SHOP then
		return var_30_0[arg_30_1] == true or ActivityNoobData:GetFirstRechargeStatus().secondGearNewTag
	elseif arg_30_1 == ShopConst.SHOP_ID.CONTRACT_BENEFITS then
		return var_30_0[arg_30_1] == true or ActivityNoobData:GetBattlePassStatus().battlePassNewTag
	else
		return var_30_0[arg_30_1] == true
	end
end

function var_0_0.OnTryToUseItem(arg_31_0, arg_31_1, arg_31_2)
	if isSuccess(arg_31_1.result) then
		local var_31_0 = arg_31_2.use_item_list[1].item_id
		local var_31_1 = ItemCfg[var_31_0].param[1]

		getReward({
			{
				num = 1,
				id = var_31_1
			}
		}, {
			ItemConst.ITEM_TYPE.HERO_SKIN
		})

		local var_31_2 = SkinCfg[var_31_1].hero

		HeroAction.UpdateSkinCouponRedPoint(var_31_2)
		HeroAction.SkinAdd(var_31_1)
	else
		ShowTips(arg_31_1.result)
	end
end

function var_0_0.HaveActivityGift(arg_32_0)
	local var_32_0 = getShopIDListByShopID(ShopConst.SHOP_ID.LIMIT_SUPPLY)

	for iter_32_0, iter_32_1 in ipairs(var_32_0) do
		if not ShopData.IsGoodOutOfDate(iter_32_1, ShopConst.SHOP_ID.LIMIT_SUPPLY) then
			return true
		end
	end

	return false
end

function var_0_0.HaveNewbieGift(arg_33_0)
	local var_33_0 = ShopConst.SHOP_ID.NEWBIE_SHOP
	local var_33_1 = ShopData.GetShop(var_33_0)

	for iter_33_0, iter_33_1 in pairs(var_33_1.shopItemIDs) do
		if ShopTools.IsGoodCanDisplay(var_33_0, iter_33_1) and not ShopData.IsSoldout(var_33_0, iter_33_1) then
			return true
		end
	end

	return false
end

function var_0_0.OnMainHomeViewTop(arg_34_0)
	arg_34_0.params_.childShopIndex = 1
	arg_34_0.params_.page = 1
end

function var_0_0.OnSkinListFilterApply(arg_35_0, arg_35_1)
	if arg_35_0.skinPageState_ == 1 then
		local var_35_0 = ShopConst.SPECIAL_ID.SKIN_LIST
		local var_35_1 = arg_35_0.specialPages_[var_35_0]

		if var_35_1.OnSkinListFilterApply then
			var_35_1:OnSkinListFilterApply(arg_35_1)
		end
	end

	if #arg_35_1.heroIDList > 0 or arg_35_1.goodType ~= ShopConst.FILTER_HERO_TYPE.ALL or arg_35_1.stateType ~= ShopConst.FILTER_STATE_TYPE.ALL then
		arg_35_0.filterBtnController_:SetSelectedState("orange")
	else
		arg_35_0.filterBtnController_:SetSelectedState("normal")
	end
end

function var_0_0.Dispose(arg_36_0)
	arg_36_0.firstRechargeGroupGoList_ = nil

	if arg_36_0.tree_ then
		arg_36_0.tree_:Dispose()

		arg_36_0.tree_ = nil
	end

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.titleList) do
		iter_36_1:Dispose()
	end

	if arg_36_0.pages_ then
		for iter_36_2, iter_36_3 in pairs(arg_36_0.pages_) do
			iter_36_3:Dispose()
		end

		arg_36_0.pages_ = nil
	end

	if arg_36_0.specialPages_ then
		for iter_36_4, iter_36_5 in pairs(arg_36_0.specialPages_) do
			iter_36_5:Dispose()
		end

		arg_36_0.specialPages_ = nil
	end

	var_0_0.super.Dispose(arg_36_0)
end

function var_0_0.RefreshFirstRechargeGroup(arg_37_0)
	arg_37_0.firstRechargeGroupGoList_ = {}
	arg_37_0.firstRechargeGroupGoList_[1] = arg_37_0.tree_:GetGroupGameObjectById(ShopConst.SHOP_ID.SIX_SHOP)
	arg_37_0.firstRechargeGroupGoList_[2] = arg_37_0.tree_:GetGroupGameObjectById(ShopConst.SHOP_ID.EIGHT_SHOP)
	arg_37_0.firstRechargeGroupGoList_[3] = arg_37_0.tree_:GetGroupGameObjectById(ShopConst.SHOP_ID.OBSERVATION_SHOP)

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.firstRechargeGroupGoList_) do
		SetActive(iter_37_1, ActivityNewbieTools.GetRechargeIsOpen(iter_37_0))
	end

	local var_37_0 = ActivityNewbieTools.GetFirstRechargeStatus()

	if var_37_0 and var_37_0.firstGearStatus == 2 then
		arg_37_0.tree_:GetData().groupDatas[5].defaultIndex = 1
	end
end

function var_0_0.GetTreeDataByParams(arg_38_0)
	local var_38_0 = {}

	if arg_38_0.params_.showShops then
		var_38_0 = arg_38_0.params_.showShops
	else
		local var_38_1 = ShopListCfg.get_id_list_by_system[2]

		for iter_38_0, iter_38_1 in ipairs(var_38_1) do
			if ShopListCfg[iter_38_1].show_in_shop == 1 then
				table.insert(var_38_0, iter_38_1)
			end
		end
	end

	local var_38_2 = {}

	for iter_38_2, iter_38_3 in ipairs(var_38_0) do
		table.insert(var_38_2, iter_38_3)
	end

	arg_38_0.groups_ = {}
	arg_38_0.groupIndexes_ = {}

	local var_38_3 = UITreeData.New()

	for iter_38_4, iter_38_5 in ipairs(var_38_2) do
		local var_38_4 = ShopListCfg[iter_38_5]

		if not arg_38_0.groups_[var_38_4.display_group] then
			arg_38_0.groups_[var_38_4.display_group] = {
				itemIndexes_ = {}
			}

			table.insert(arg_38_0.groupIndexes_, var_38_4.display_group)
		end

		arg_38_0.groups_[var_38_4.display_group][var_38_4.display_index] = var_38_4

		table.insert(arg_38_0.groups_[var_38_4.display_group].itemIndexes_, var_38_4.display_index)
	end

	for iter_38_6, iter_38_7 in pairs(arg_38_0.groups_) do
		table.sort(iter_38_7.itemIndexes_, function(arg_39_0, arg_39_1)
			return arg_39_0 < arg_39_1
		end)
	end

	table.sort(arg_38_0.groupIndexes_, function(arg_40_0, arg_40_1)
		return arg_40_0 < arg_40_1
	end)

	for iter_38_8, iter_38_9 in pairs(arg_38_0.groupIndexes_) do
		local var_38_5 = UITreeGroupData.New()

		var_38_5.text = GetI18NText(ShopListCfg.get_id_list_by_system_and_group[2][iter_38_9][1].group_name)
		var_38_5.controllerStateValue = tostring(iter_38_9)
		var_38_5.id = iter_38_9

		var_38_3.groupDatas:Add(var_38_5)
	end

	return var_38_3
end

function var_0_0.EnterSendMgr(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0.groupIndex_ = arg_41_1 or arg_41_0.groupIndex_
	arg_41_0.titleIndex_ = arg_41_2 or arg_41_0.titleIndex_

	local var_41_0 = string.format("%s_%s_%s", UITimeConst.shopRechargeGifts, arg_41_0.groupIndex_, arg_41_0.titleIndex_)

	if arg_41_0.groupIndex_ and arg_41_0.titleIndex_ and var_41_0 ~= arg_41_0.lastShopId_ then
		arg_41_0:ExitSendMgr()
		manager.uiTime:OnEnterRoute(var_41_0, true)

		arg_41_0.lastShopId_ = var_41_0
	end
end

function var_0_0.ExitSendMgr(arg_42_0)
	if arg_42_0.lastShopId_ then
		manager.uiTime:OnExitRoute(arg_42_0.lastShopId_, true)
	end
end

function var_0_0.ExitUITime(arg_43_0)
	arg_43_0:ExitSendMgr()

	arg_43_0.lastShopId_ = nil
	arg_43_0.groupIndex_ = nil
	arg_43_0.titleIndex_ = nil
end

function var_0_0.RefreshSkinDiscountGift(arg_44_0)
	if SkinDiscountGiftTools.HasGiftActivityID() then
		arg_44_0.skinDiscountController_:SetSelectedState("state1")
	else
		arg_44_0.skinDiscountController_:SetSelectedState("state0")
	end
end

return var_0_0
