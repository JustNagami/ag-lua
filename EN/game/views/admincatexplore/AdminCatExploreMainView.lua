local var_0_0 = class("AdminCatExploreMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/ExploreUI/ExploreHome"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.itemViewList = {}
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.cultureBtn_, nil, function()
		JumpTools.GoToSystem("/adminCatExploreCatCultivate", {})
	end)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		JumpTools.GoToSystem("adminCatExploreReward", {})
	end)
	arg_5_0:AddBtnListener(arg_5_0.storeBtn_, nil, function()
		JumpTools.GoToSystem("/shop", {
			shopId = ShopConst.SHOP_ID.ADMIN_CAT_SHOP,
			showShops = {
				ShopConst.SHOP_ID.ADMIN_CAT_SHOP
			}
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
end

function var_0_0.UpdateBar(arg_9_0)
	return
end

function var_0_0.UpdateView(arg_10_0)
	if arg_10_0.updateTimer_ then
		arg_10_0.updateTimer_:Stop()

		arg_10_0.updateTimer_ = nil
	end

	for iter_10_0 = 1, 5 do
		if arg_10_0.itemViewList[iter_10_0] == nil then
			arg_10_0.itemViewList[iter_10_0] = AdminCatExploreRegionItem:New(arg_10_0["regionItem" .. iter_10_0 .. "_"])
		end

		arg_10_0.itemViewList[iter_10_0]:SetData(nil, iter_10_0)
		arg_10_0.itemViewList[iter_10_0]:OnEnter()
	end

	arg_10_0.level = AdminCatExploreData:GetDataByPara("level")
	arg_10_0.exploreLevelImg_.sprite = getSpriteWithoutAtlas("TextureBg/ExploreUI/icon_" .. arg_10_0.level)

	local var_10_0 = ExploreLevelCfg[arg_10_0.level]
	local var_10_1 = AdminCatExploreData:GetDataByPara("exp")
	local var_10_2 = AdminCatExploreData:GetDataByPara("maxLevel")
	local var_10_3 = AdminCatExploreData:GetDataByPara("exploringCount")

	arg_10_0.queueTxt_.text = var_10_3 .. "/" .. var_10_0.amount
	arg_10_0.expImage_.fillAmount = var_10_2 == arg_10_0.level and 1 or var_10_1 / var_10_0.exp
	arg_10_0.exploreDay = AdminCatExploreData:GetDataByPara("exploreDay")
	arg_10_0.exportFill_.fillAmount = arg_10_0.exploreDay / 7

	local var_10_4 = AdminCatExploreData:GetDataByPara("rate")

	arg_10_0.rateTxt_.text = "x" .. var_10_4[arg_10_0.exploreDay]
	arg_10_0.expTxt_.text = var_10_2 == arg_10_0.level and "0/0" or var_10_1 .. "/" .. var_10_0.exp
	arg_10_0.updateTimer_ = Timer.New(function()
		AdminCatExploreData:UpdateRegionRedPoint()
	end, 1, -1, 1)

	arg_10_0.updateTimer_:Start()
end

function var_0_0.OnGetWeeklyReward(arg_12_0)
	arg_12_0:UpdateView()
end

function var_0_0.OnEnter(arg_13_0)
	if AdminCatExploreData:GetDataByPara("isFirstOpen") == 0 and GuideData:IsFinish(56) then
		JumpTools.OpenPageByJump("adminCatExploreFirstPop", {})
		AdminCatExploreAction.WeeklyFirstOpen()
	end

	manager.ui.cameraExtension.uiFov = 2

	arg_13_0:UpdateView()
	arg_13_0:BindRedPoint()
	AdminCatExploreData:UpdateQueueRedPoint()
end

function var_0_0.BindRedPoint(arg_14_0)
	manager.redPoint:bindUIandKey(arg_14_0.rewardBtn_.transform, RedPointConst.EXPLORE_REWARD, {
		x = 70,
		y = 70
	})
	manager.redPoint:bindUIandKey(arg_14_0.cultureBtn_.transform, RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT, {
		x = 155,
		y = 60
	})
end

function var_0_0.UnbindRedPoint(arg_15_0)
	manager.redPoint:unbindUIandKey(arg_15_0.rewardBtn_.transform, RedPointConst.EXPLORE_REWARD)
	manager.redPoint:unbindUIandKey(arg_15_0.cultureBtn_.transform, RedPointConst.EXPLORE_UNLOCK_ADMIN_CAT)
end

function var_0_0.OnExploreUpdate(arg_16_0)
	arg_16_0:UpdateView()
end

function var_0_0.OnExit(arg_17_0)
	arg_17_0:UnbindRedPoint()

	manager.ui.cameraExtension.uiFov = 30

	if arg_17_0.itemViewList then
		for iter_17_0, iter_17_1 in pairs(arg_17_0.itemViewList) do
			iter_17_1:OnExit()
		end
	end

	if arg_17_0.updateTimer_ then
		arg_17_0.updateTimer_:Stop()

		arg_17_0.updateTimer_ = nil
	end

	manager.windowBar:HideBar()
end

function var_0_0.Hide(arg_18_0)
	SetActive(arg_18_0.gameObject_, false)
end

function var_0_0.Show(arg_19_0)
	SetActive(arg_19_0.gameObject_, true)
end

function var_0_0.OnTop(arg_20_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR,
		NAVI_BAR,
		54,
		55,
		56
	})
	manager.windowBar:SetBarCanClick(54, true)
	manager.windowBar:SetBarCanClick(55, true)
	manager.windowBar:SetBarCanClick(56, true)
	manager.windowBar:SetGameHelpKey("EXPLORE_EXPLAIN")
end

function var_0_0.Dispose(arg_21_0)
	if arg_21_0.itemViewList then
		for iter_21_0, iter_21_1 in pairs(arg_21_0.itemViewList) do
			iter_21_1:Dispose()
		end

		arg_21_0.itemViewList = nil
	end

	var_0_0.super.Dispose(arg_21_0)
	Object.Destroy(arg_21_0.gameObject_)
end

return var_0_0
