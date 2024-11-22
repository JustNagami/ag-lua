local var_0_0 = class("RestaurantMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/canteen/EmptyDreamCanteenMainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

local function var_0_1(arg_3_0)
	if arg_3_0 == "back" then
		JumpTools.OpenPageByJump("/dormChooseRoomView")
	elseif arg_3_0 == "main" then
		BackHomeTools:BackHomeGotoMain()
	end
end

local function var_0_2(arg_4_0)
	var_0_0:UnUsualExitManualMode()
	var_0_1(arg_4_0)
end

function var_0_0.Init(arg_5_0)
	arg_5_0:InitUI()
	arg_5_0:AddUIListener()
	arg_5_0:InitAwardBubble()
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0:BindCfgUI()
	arg_6_0:InitController()
	arg_6_0:InitAnimation()
	arg_6_0:InitAutoAward()

	arg_6_0.signFoodListScroll_ = LuaList.New(handler(arg_6_0, arg_6_0.indexSignFoodList), arg_6_0.signfoodlistUilist_, NeedCookFoodItem)
	arg_6_0.autoScrollTime = GameDisplayCfg.canteen_roller_speed.value[1]
	arg_6_0.quickView = BackHomeQuickJumpView.New(arg_6_0.tempquickGo_)
end

function var_0_0.InitController(arg_7_0)
	arg_7_0.stateController = ControllerUtil.GetController(arg_7_0.statusGo_.transform, "state")
	arg_7_0.manualViewController = ControllerUtil.GetController(arg_7_0.transform_, "mode")
	arg_7_0.switchBtnController = ControllerUtil.GetController(arg_7_0.switchTrs_, "state")
	arg_7_0.hideButtonController = ControllerUtil.GetController(arg_7_0.transform_, "hide")
end

function var_0_0.InitAnimation(arg_8_0)
	arg_8_0.moneyAnimator = arg_8_0:FindCom(typeof(Animator), "", arg_8_0.emptydreamcanteenitemTrs_)
	arg_8_0.leableAnimator = arg_8_0:FindCom(typeof(Animator), "", arg_8_0.labelTrs_)
	arg_8_0.tipsAnimation = arg_8_0.deficiencytipsGo_:GetComponent("Animation")
end

function var_0_0.InitAutoAward(arg_9_0)
	arg_9_0.offset = 200
	arg_9_0.currencyiconImg_.sprite = ItemTools.getItemSprite(CurrencyIdMapCfg.CURRENCY_TYPE_DORM_GOLD.item_id)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0:RefreshBar()
	arg_10_0:BindRedPoint()
	arg_10_0:RegisterEvents()
	arg_10_0:UpdateView()

	arg_10_0.canJump = true

	arg_10_0.moneyAnimator:Update(0)
	arg_10_0.quickView:OnEnter()
	arg_10_0.tempquickGo_.transform:SetAsLastSibling()
	arg_10_0.quickView:ShowView(false)
end

function var_0_0.RefreshBar(arg_11_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		CurrencyConst.CURRENCY_TYPE_DORM_GOLD
	})
	manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_DORM_GOLD, true)

	local var_11_0 = GameSetting.canteen_festival_info_describe.value

	if #var_11_0 > 0 then
		manager.windowBar:SetGameHelpKey({
			view = "/gameHelpPro",
			type = "jump",
			params = {
				hideHomeBtn = 1,
				isPrefab = true,
				pages = var_11_0
			}
		})
	end

	manager.windowBar:RegistBackCallBack(function()
		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
			ShowMessageBox({
				isTop = true,
				content = GetTips("CANTEEN_QUIT_CONFIRM"),
				OkCallback = function()
					var_0_2("back")
				end,
				CancelCallback = function()
					return
				end
			})
		else
			var_0_1("back")
		end
	end)
	manager.windowBar:RegistHomeCallBack(function()
		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
			ShowMessageBox({
				isTop = true,
				content = GetTips("CANTEEN_QUIT_CONFIRM"),
				OkCallback = function()
					var_0_2("main")
				end,
				CancelCallback = function()
					return
				end
			})
		else
			var_0_1("main")
		end
	end)
end

function var_0_0.BindRedPoint(arg_18_0)
	manager.redPoint:bindUIandKey(arg_18_0.taskbtnBtn_.transform, RedPointConst.CANTEEN_DISPATCH)
	manager.redPoint:bindUIandKey(arg_18_0.jobSetBtn_.transform, RedPointConst.CANTEEN_JOB_AVAILABLE)
	manager.redPoint:bindUIandKey(arg_18_0.cookBtn_.transform, RedPointConst.CANTEEN_UPGRADE_AVAILABLE)
	manager.redPoint:bindUIandKey(arg_18_0.recipebtnBtn_.transform, RedPointConst.CANTEEN_UNLOCK_FOOD)
end

function var_0_0.UpdateView(arg_19_0)
	arg_19_0:UpdataPopularity()
	arg_19_0:UpdataSignFoodList()
	CanteenData:ChooseCanteenAutoState()
end

function var_0_0.UpdataPopularity(arg_20_0)
	arg_20_0.popnumText_.text = CanteenData:GetPopularityNum()
end

function var_0_0.UpdataSignFoodList(arg_21_0)
	arg_21_0.signFoodList = {}

	local var_21_0 = 1
	local var_21_1 = CanteenFoodData:GetChooseFoodList()

	if #var_21_1 > 2 then
		while var_21_0 <= 2 do
			for iter_21_0, iter_21_1 in ipairs(var_21_1) do
				table.insert(arg_21_0.signFoodList, iter_21_1)
			end

			var_21_0 = var_21_0 + 1
		end
	else
		for iter_21_2, iter_21_3 in ipairs(var_21_1) do
			table.insert(arg_21_0.signFoodList, iter_21_3)
		end
	end

	arg_21_0.signFoodListScroll_:StartScroll(#arg_21_0.signFoodList)
	arg_21_0:UpdateFoodScroll()
end

function var_0_0.indexSignFoodList(arg_22_0, arg_22_1, arg_22_2)
	arg_22_2:RefreshUI(arg_22_0.signFoodList[arg_22_1])
end

function var_0_0.UpdateFoodScroll(arg_23_0)
	arg_23_0.index = 1

	if #arg_23_0.signFoodList >= 6 then
		arg_23_0:StartAutoScroll()

		if not arg_23_0.AutoScrollTimer then
			arg_23_0.AutoScrollTimer = Timer.New(handler(arg_23_0, arg_23_0.StartAutoScroll), arg_23_0.autoScrollTime, -1)

			arg_23_0.AutoScrollTimer:Start()
		end
	end
end

function var_0_0.StartAutoScroll(arg_24_0)
	local var_24_0 = #arg_24_0.signFoodList

	arg_24_0.index = arg_24_0.index + 1

	if var_24_0 - 1 == arg_24_0.index then
		arg_24_0.index = var_24_0 / 2 - 2

		arg_24_0.signFoodListScroll_:ScrollToIndex(arg_24_0.index, false, false)

		arg_24_0.index = arg_24_0.index + 1

		arg_24_0.signFoodListScroll_:ScrollToIndex(arg_24_0.index, false, true, arg_24_0.autoScrollTime)
	else
		arg_24_0.signFoodListScroll_:ScrollToIndex(arg_24_0.index, false, true, arg_24_0.autoScrollTime)
	end

	arg_24_0.signfoodlistUilist_:GetComponent("ScrollRectEx").horizontal = false
end

function var_0_0.EndAutoScroll(arg_25_0)
	if arg_25_0.AutoScrollTimer then
		arg_25_0.AutoScrollTimer:Stop()

		arg_25_0.AutoScrollTimer = nil

		arg_25_0.signFoodListScroll_:RemoveTween()
	end
end

function var_0_0.InitAwardBubble(arg_26_0)
	arg_26_0:UpdataAwardBubble()

	arg_26_0.atuoAwardTrsTimer = FrameTimer.New(function()
		arg_26_0:UpdataAwardBubbleTrs()
		arg_26_0:UpdataAwardBubble()
	end, 0.03333333333333333, -1)

	arg_26_0.atuoAwardTrsTimer:Start()
end

function var_0_0.AddUIListener(arg_28_0)
	arg_28_0:AddBtnListenerScale(arg_28_0.startautomoduleBtn_, nil, function()
		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
			CanteenData:SetCanteenState(DormEnum.RestaurantMode.RestaurantAuto)

			return
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.manualbtnBtn_, nil, function()
		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
			return
		end

		if not CanteenTools:AutoModeReadyForBusiness() then
			return
		end

		ShowMessageBox({
			isTop = true,
			content = GetTips("CANTEEN_MANNUALLY_OPT"),
			OkCallback = function()
				CanteenData:SetCanteenState(DormEnum.RestaurantMode.RestaurantManual)
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.shopbtnBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.GoToSystem("/activityShop", {
				hideHomeBtn = 1,
				shopId = ShopConst.SHOP_ID.CANTEEN_SHOP,
				showShops = {
					ShopConst.SHOP_ID.CANTEEN_SHOP
				}
			}, ViewConst.SYSTEM_ID.SHOP)
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.taskbtnBtn_, nil, function()
		if arg_28_0.canJump then
			DormRedPointTools:ConsumeNotification(RedPointConst.CANTEEN_DISPATCH_NONE, DormRedPointTools.RedPointType.Session)
			JumpTools.OpenPageByJump("/dormTaskDispatchView")
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.signfoodBtn_, nil, function()
		if arg_28_0.canJump then
			if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
				return
			end

			JumpTools.OpenPageByJump("/chooseSignFoodView")
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.recipebtnBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.OpenPageByJump("/restaurantFoodMenuView", {
				state = DormEnum.MenuType.foodMenu
			})
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.warehousebtnBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.OpenPageByJump("/restaurantFoodMenuView", {
				state = DormEnum.MenuType.bag
			})
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.hidebtnBtn_, nil, function()
		if arg_28_0.hideButtonController:GetSelectedState() == "false" then
			arg_28_0.hideButtonController:SetSelectedState("true")
		else
			arg_28_0.hideButtonController:SetSelectedState("false")
			arg_28_0.leableAnimator:SetFloat("speed", 1)
			arg_28_0.leableAnimator:Play("ShowLabel")
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.autoAwardBtn_, nil, function()
		local var_39_0, var_39_1 = CanteenData:GetAutoNextAwardTime()

		if var_39_0 < 0 and var_39_1 < 0 then
			if CanteenData:GetAutoAwardNum() == 0 then
				ShowTips("CANTEEN_ADMITTED_NULL")

				return
			end

			local var_39_2 = DormData:GetCurrectSceneID()

			if var_39_2 then
				CanteenAction:ReceiveCanteenAutoAward(var_39_2)
			end

			arg_28_0.moneyAnimator:Play("GetMoney", 0, 0)
			manager.audio:PlayEffect("minigame_activity_spring_festival", "minigame_activity_spring_festival_coin", "")

			arg_28_0.canJump = false

			if arg_28_0.canJumpTimer then
				arg_28_0.canJumpTimer:Stop()

				arg_28_0.canJumpTimer = nil
			end

			arg_28_0.canJumpTimer = Timer.New(function()
				arg_28_0.canJump = true
			end, 0.3, 1)

			arg_28_0.canJumpTimer:Start()
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.jobSetBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.OpenPageByJump("/restaurantJobSetView")
			DormRedPointTools:ConsumeNotification(RedPointConst.CANTEEN_JOB_AVAILABLE, DormRedPointTools.RedPointType.Session)
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.cookBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.OpenPageByJump("/restaurantCookUpView")
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.lackBtn_, nil, function()
		if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantAuto then
			if BackHomeNpcData:CheckNpsIsWorkInCanteen() then
				local var_43_0

				for iter_43_0, iter_43_1 in ipairs(DormNpcTools.BackHomeNpcType) do
					if DormNpcTools:CheckHasNpcWorkOnJob(iter_43_1) then
						var_43_0 = iter_43_1
					end
				end

				JumpTools.OpenPageByJump("/restaurantJobSetView", {
					jobType = var_43_0
				})
			end
		elseif CanteenData:GetCanteenState() == DormEnum.RestaurantMode.Close then
			if not CanteenTools:CheckSignFoodNumCanOpen() then
				JumpTools.OpenPageByJump("/chooseSignFoodView", {
					type = DormEnum.FurnitureTypeNum.Pan1
				})
			elseif not CanteenTools:CheckCanteenJobCanOpen() then
				JumpTools.OpenPageByJump("/restaurantJobSetView")
				DormRedPointTools:ConsumeNotification(RedPointConst.CANTEEN_JOB_AVAILABLE, DormRedPointTools.RedPointType.Session)
			end
		end
	end)
	arg_28_0:AddBtnListenerScale(arg_28_0.canteenInfoBtn_, nil, function()
		if arg_28_0.canJump then
			JumpTools.OpenPageByJump("/canteenAutoInfoView")
		end
	end)
	arg_28_0.quickView:AddClickCallBack(function()
		manager.windowBar:SwitchBar({
			CurrencyConst.CURRENCY_TYPE_DORM_GOLD
		})
	end)
	arg_28_0.quickView:CloseCallBack(function()
		arg_28_0:RefreshBar()
	end)
end

function var_0_0.RegisterEvents(arg_47_0)
	arg_47_0:RegistEventListener(DORM_REFRESH_RESTAURANT_STATUS_EVENT, function(arg_48_0)
		arg_47_0:UpdataCanteenState()
	end)
	arg_47_0:RegistEventListener(CANTEEN_UPDATE_STATE, function()
		arg_47_0:UpdateView()
	end)
	arg_47_0:RegistEventListener(CANTEEN_SIGN_FOOD_NUM_CHANGE, function()
		arg_47_0.signFoodListScroll_:Refresh()
	end)
	arg_47_0:RegistEventListener(CANTEEN_MANUAL_REWARD_CALLBACK, function()
		JumpTools.OpenPageByJump("/canteenManualRewardView")
	end)
	arg_47_0:RegistEventListener(DORM_LOGIC_TICK, handler(arg_47_0, arg_47_0.UpdataTimeBar))
	arg_47_0:RegistEventListener(DORM_REFRESH_POPULAR_EVENT, function()
		arg_47_0:UpdataPopularity()
	end)
	arg_47_0:RegistEventListener(CANTEEN_FUR_LEVEL, function(arg_53_0)
		if arg_47_0.canJump then
			local var_53_0 = BackHomeCanteenFurnitureIDCfg[arg_53_0].type_id

			JumpTools.OpenPageByJump("/restaurantCookUpView", {
				type = BackHomeCanteenFurnitureCfg[var_53_0].type,
				furEID = arg_53_0
			})
		end
	end)
end

function var_0_0.UpdataCanteenState(arg_54_0)
	if CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantAuto then
		arg_54_0.manualViewController:SetSelectedState("auto")

		if BackHomeNpcData:CheckNpsIsWorkInCanteen() then
			arg_54_0.stateController:SetSelectedState("npcmode")

			arg_54_0.closeText_.text = GetTips("CANTEEN_NPC_IS_WORK")
		else
			arg_54_0.stateController:SetSelectedState("business")
		end

		arg_54_0.switchBtnController:SetSelectedState("automatic")
		SetActive(arg_54_0.emptydreamcanteenitemGo_1, true)
	elseif CanteenData:GetCanteenState() == DormEnum.RestaurantMode.RestaurantManual then
		arg_54_0.stateController:SetSelectedState("ManualOperating")
		arg_54_0.manualViewController:SetSelectedState("manual")
		arg_54_0.switchBtnController:SetSelectedState("manual")
		SetActive(arg_54_0.emptydreamcanteenitemGo_1, false)
	elseif CanteenData:GetCanteenState() == DormEnum.RestaurantMode.Close then
		arg_54_0.stateController:SetSelectedState("closed")
		arg_54_0.tipsAnimation:Play()

		if not CanteenTools:CheckSignFoodNumCanOpen() then
			arg_54_0.closeText_.text = GetTips("CANTEEN_FOOD_NOT_SUFFICIENT")
		elseif not CanteenTools:CheckCanteenJobCanOpen() then
			arg_54_0.closeText_.text = GetTips("CANTEEN_JOB_NOT_FIT")
		end
	end
end

function var_0_0.UpdataAwardBubble(arg_55_0)
	local var_55_0, var_55_1, var_55_2 = CanteenData:GetAutoNextAwardTime()
	local var_55_3 = CanteenData:GetAutoAwardNum() or 0
	local var_55_4 = DormSkillData:GetInComeStorageMax()

	if var_55_0 < 0 or var_55_1 < 0 then
		arg_55_0.awardtimetextText_.text = GetTips("CANTEEN_MONEY_TIPS2")

		if var_55_3 == 0 then
			arg_55_0.awardtimetextText_.text = GetTips("CANTEEN_MONEY_TIPS3")
		end
	else
		local var_55_5 = ""

		if var_55_0 > 0 then
			var_55_5 = string.format("%d", var_55_0) .. GetTips("HOUR") .. string.format("%d", var_55_1) .. GetTips("MINUTE")
		elseif var_55_0 == 0 and var_55_1 > 0 then
			var_55_5 = string.format("%d", var_55_1) .. GetTips("MINUTE")
		elseif var_55_1 == 0 and var_55_2 > 0 then
			var_55_5 = string.format("%d", var_55_2) .. GetTips("SECOND")
		end

		arg_55_0.awardtimetextText_.text = string.format(GetTips("CANTEEN_MONEY_TIPS1"), var_55_5)
	end

	arg_55_0.awardtotaltextText_.text = string.format("%d<size=26><color=#767878>/%d</color></size>", var_55_3, var_55_4)
end

function var_0_0.UpdataAwardBubbleTrs(arg_56_0)
	local var_56_0 = CanteenItemManager.ItemEIdNamespace(DormEnum.ItemType.CashierTable)
	local var_56_1 = CanteenAIFunction:GetAllEIDNameSpace(var_56_0)[1]
	local var_56_2 = manager.ui.mainCameraCom_
	local var_56_3 = Dorm.DormEntityManager.QueryPosition(var_56_1)
	local var_56_4 = UnityEngine.RectTransformUtility.WorldToScreenPoint(var_56_2, var_56_3)
	local var_56_5 = manager.ui.canvas:GetComponent(typeof(Canvas)).worldCamera
	local var_56_6 = {}
	local var_56_7, var_56_8 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(arg_56_0.transform_, var_56_4, var_56_5, var_56_6)

	if var_56_8 == nil then
		print("未找到对应的视口坐标")

		return
	end

	var_56_8.y = var_56_8.y + arg_56_0.offset
	arg_56_0.emptydreamcanteenitemTrs_.localPosition = var_56_8
end

function var_0_0.UpdataTimeBar(arg_57_0)
	local var_57_0 = Dorm.storage:GetData(DormEnum.Namespace.RestaurantBusiness, "timer")
	local var_57_1 = 1

	if var_57_0 and var_57_0:IsRunning() then
		var_57_1 = var_57_0:QueryTime() / var_57_0.duration
	end

	arg_57_0.timebarImg_.fillAmount = 1 - var_57_1
end

function var_0_0.OnExit(arg_58_0)
	manager.windowBar:HideBar()
	manager.redPoint:unbindUIandKey(arg_58_0.taskbtnBtn_.transform, RedPointConst.CANTEEN_DISPATCH)
	manager.redPoint:unbindUIandKey(arg_58_0.jobSetBtn_.transform, RedPointConst.CANTEEN_JOB_AVAILABLE)
	manager.redPoint:unbindUIandKey(arg_58_0.cookBtn_.transform, RedPointConst.CANTEEN_UPGRADE_AVAILABLE)
	manager.redPoint:unbindUIandKey(arg_58_0.recipebtnBtn_.transform, RedPointConst.CANTEEN_UNLOCK_FOOD)
	arg_58_0:RemoveAllEventListener()
	arg_58_0:EndAutoScroll()
	arg_58_0.quickView:OnExit()
end

function var_0_0.UnUsualExitManualMode(arg_59_0)
	CharacterBubbleManager:Dispose()

	local var_59_0 = CanteenData:GetCanteenState()

	CanteenAction:ChangeCanteenMode(var_59_0, DormEnum.RestaurantMode.RestaurantAuto, true)
end

function var_0_0.Dispose(arg_60_0)
	if arg_60_0.signFoodListScroll_ then
		arg_60_0.signFoodListScroll_:Dispose()

		arg_60_0.signFoodListScroll_ = nil
	end

	if arg_60_0.atuoAwardTrsTimer then
		arg_60_0.atuoAwardTrsTimer:Stop()

		arg_60_0.atuoAwardTrsTimer = nil
	end

	if arg_60_0.canJumpTimer then
		arg_60_0.canJumpTimer:Stop()

		arg_60_0.canJumpTimer = nil
	end

	arg_60_0.moneyAnimator = nil

	arg_60_0.quickView:Dispose()
	var_0_0.super.Dispose(arg_60_0)
end

return var_0_0
