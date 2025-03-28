local var_0_0 = class("DrawView", ReduxView)
local var_0_1 = {
	"DRAW_POOL_TYPE_6",
	"DRAW_POOL_TYPE_3",
	"DRAW_POOL_TYPE_7",
	"DRAW_POOL_TYPE_8",
	"DRAW_POOL_TYPE_1",
	"DRAW_POOL_TYPE_2",
	"DRAW_POOL_TYPE_9"
}
local var_0_2 = {
	5,
	6,
	2,
	nil,
	5,
	1,
	3,
	4,
	7
}
local var_0_3 = {
	[1] = "90",
	[4] = "40"
}
local var_0_4 = {
	[200003] = "WEAPON_DRAW_POOL_RACE_3",
	[200001] = "WEAPON_DRAW_POOL_RACE_1",
	[200009] = "WEAPON_DRAW_POOL_RACE_9",
	[200005] = "WEAPON_DRAW_POOL_RACE_5",
	[200004] = "WEAPON_DRAW_POOL_RACE_4",
	[200002] = "WEAPON_DRAW_POOL_RACE_2"
}

function var_0_0.OnCtor(arg_1_0)
	arg_1_0.moviePaths = {
		"SofdecAsset/function/blue.usm",
		"SofdecAsset/function/purple.usm",
		"SofdecAsset/function/glod.usm"
	}
end

function var_0_0.UIName(arg_2_0)
	return "Widget/System/Pool/PoolUI"
end

function var_0_0.UIParent(arg_3_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_4_0)
	arg_4_0.poolToggles_ = {}
	arg_4_0.poolObjects_ = {}
	arg_4_0.poolActivitys_ = {}
	arg_4_0.groupRedPoint = {}
	arg_4_0.drawHandler_ = handler(arg_4_0, arg_4_0.DrawCheck)

	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.currencyModifyHandler_ = handler(arg_4_0, arg_4_0.CurrencyModify)
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.criMovie_ = arg_5_0.movie_:GetComponent("CriManaMovieControllerForUI")
	arg_5_0.criplayer_ = arg_5_0.criMovie_.player

	arg_5_0.criMovie_:Stop()

	arg_5_0.moviePlaying = false

	SetActive(arg_5_0.movieGo_, false)

	arg_5_0.drawInteract = arg_5_0.drawInteractGo_:GetComponent("DrawController")

	SetActive(arg_5_0.drawInteractGo_, false)

	arg_5_0.showRightController = ControllerUtil.GetController(arg_5_0.transform_, "showRight")
	arg_5_0.rechargeShopGiftController = ControllerUtil.GetController(arg_5_0.transform_, "recharge_shop_gift")
	arg_5_0.infoController = arg_5_0.infoController_:GetController("info")
	arg_5_0.tree_ = LuaTree.New(arg_5_0.uitreeGo_)

	arg_5_0.tree_:SetSelectedHandler(handler(arg_5_0, arg_5_0.OnGroupSelect), handler(arg_5_0, arg_5_0.OnItemSelect))
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btnInfo_, nil, function()
		local var_7_0 = DrawPoolCfg[arg_6_0.selectPoolId_]

		if (var_7_0.pool_selected_type == 2 or var_7_0.pool_selected_type == 8) and DrawData:GetPollUpID(arg_6_0.selectPoolId_) == 0 then
			ShowTips("DRAW_NOT_SELECT_TIPS")

			return
		end

		if var_7_0.pool_selected_type == 9 and DrawData:GetPollUpID(arg_6_0.selectPoolId_) == 0 then
			ShowTips("DRAW_NOT_SELECT_WEAPON_TIPS")

			return
		end

		DrawAction.GetPoolData(arg_6_0.selectPoolId_)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnShop_, nil, function()
		JumpTools.GoToSystem("/shop", {
			shopId = ShopConst.SHOP_ID.DRAW_EXCHANGE_ASSET_SHOP
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnOnce_, nil, function()
		arg_6_0:DrawCheck(DrawConst.DRAW_TYPE.ONE)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnTenth_, nil, function()
		local var_10_0 = DrawPoolCfg[arg_6_0.selectPoolId_]

		if var_10_0.pool_type == 8 then
			arg_6_0:DrawCheck(math.min(40 - DrawData:GetPoolDrawTimes(arg_6_0.selectPoolId_), 10))
		elseif var_10_0.pool_type == 9 then
			arg_6_0:DrawCheck(math.min(70 - DrawData:GetPoolDrawTimes(arg_6_0.selectPoolId_), 10))
		else
			arg_6_0:DrawCheck(DrawConst.DRAW_TYPE.TEN)
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnSkip_, nil, function()
		manager.audio:PlayEffect("ui_system_search", "search_skip", "")
		arg_6_0:SkipMovie()
	end)
	arg_6_0:AddBtnListener(arg_6_0.chooseBtn_, nil, function()
		DrawTools:GoToSelectUpHeroView(arg_6_0.selectPoolId_, arg_6_0.showId, true)
	end)
	arg_6_0:AddBtnListener(arg_6_0.skipInteractBtn_, nil, function()
		manager.audio:PlayEffect("ui_system_search", "search_skip", "")
		arg_6_0:SkipInteract()
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_giftBtn, nil, function()
		local var_14_0 = DrawPoolCfg[arg_6_0.selectPoolId_]
		local var_14_1 = 0

		if var_14_0.pool_type == 3 then
			var_14_1 = 1
		elseif var_14_0.pool_type == 1 then
			var_14_1 = 2
		elseif var_14_0.pool_type == 2 then
			var_14_1 = 3
		elseif var_14_0.pool_type == 6 then
			var_14_1 = 4
		end

		if var_14_1 ~= 0 then
			OperationRecorder.RecordButtonTouch("draw_gifts_type" .. var_14_1)
		end

		JumpTools.OpenPageByJump("rechargeDrawGift", {
			poolId = arg_6_0.selectPoolId_
		})
	end)
end

function var_0_0.OnTop(arg_15_0)
	arg_15_0:StopMovie()
	arg_15_0:ShowBar()
end

function var_0_0.OnEnter(arg_16_0)
	if arg_16_0.params_.isFirst then
		arg_16_0:DestroyPoolGo()

		arg_16_0.params_.isFirst = nil
	end

	arg_16_0:SetupActivityPool()

	if arg_16_0.params_.poolType then
		for iter_16_0, iter_16_1 in ipairs(arg_16_0.poolToggles_) do
			if DrawPoolCfg[iter_16_1].pool_type == arg_16_0.params_.poolType then
				arg_16_0.params_.poolId = iter_16_1
				arg_16_0.params_.poolType = nil
			end
		end
	end

	local var_16_0 = arg_16_0.enterPoolId

	if arg_16_0.params_.poolId then
		local var_16_1 = arg_16_0.poolActivitys_[arg_16_0.params_.poolId]

		if var_16_1 and ActivityData:GetActivityIsOpen(var_16_1) then
			var_16_0 = arg_16_0.params_.poolId
		end
	end

	arg_16_0.tree_.tree_.data.groupDatas[arg_16_0.poolIDToIndexTable[var_16_0][1] - 1].defaultIndex = arg_16_0.poolIDToIndexTable[var_16_0][2] - 1

	arg_16_0.tree_:SelectItem(arg_16_0.poolIDToIndexTable[var_16_0][1], arg_16_0.poolIDToIndexTable[var_16_0][2])
	DrawTools:LoadDrawLevel()
	manager.ui:SetMainCamera("draw")

	arg_16_0.panel_.transform.localPosition = Vector2(0, 0)

	manager.notify:RegistListener(CURRENCY_UPDATE, arg_16_0.currencyModifyHandler_)
	manager.ui:SetMainCameraCom("CinemachineBrain", false)

	if ShopListCfg[ShopConst.SHOP_ID.DRAW_EXCHANGE_ASSET_SHOP] then
		arg_16_0.shopText_.text = GetI18NText(ShopListCfg[ShopConst.SHOP_ID.DRAW_EXCHANGE_ASSET_SHOP].remark)
	end
end

function var_0_0.OnExit(arg_17_0)
	manager.notify:RemoveListener(CURRENCY_UPDATE, arg_17_0.currencyModifyHandler_)

	if arg_17_0.selectPoolId_ and arg_17_0.selectPoolId_ ~= 0 and arg_17_0.selectPoolId_ ~= -1 and manager.net ~= nil and manager.net.tcpConnection_ ~= nil then
		local var_17_0 = manager.net.tcpConnection_:GetMachineState()

		if var_17_0 and (var_17_0 == "connected" or var_17_0 == "connecting") then
			arg_17_0:HidePoolNewTag(arg_17_0.selectPoolId_, true)
		end
	end

	manager.windowBar:HideBar()
	arg_17_0:StopMovie()
	arg_17_0.criMovie_:Stop()

	if arg_17_0.curPoolObject then
		arg_17_0.curPoolObject:SetActive(false)
	end

	arg_17_0.curPoolObject = nil
	arg_17_0.selectPoolId_ = -1
	arg_17_0.timer = nil
	arg_17_0.one_cost_type = nil
	arg_17_0.ten_cost_type = nil

	if arg_17_0.interactTimer then
		arg_17_0.interactTimer:Stop()

		arg_17_0.interactTimer = nil
	end

	manager.ui:SetMainCameraCom("CinemachineBrain", false)
	arg_17_0:RemoveCountDownTimer()
	DrawTools:UnLoadDrawLevel()
end

function var_0_0.InitTree(arg_18_0)
	local var_18_0 = UITreeData.New()
	local var_18_1 = {}

	arg_18_0.poolIDToIndexTable = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.poolToggles_) do
		local var_18_2 = DrawPoolCfg[iter_18_1]
		local var_18_3 = var_0_2[var_18_2.pool_show_type]

		if var_18_1[var_18_3] == nil then
			var_18_1[var_18_3] = 1
		end

		arg_18_0.poolIDToIndexTable[iter_18_1] = {
			var_18_3,
			var_18_1[var_18_3]
		}
		var_18_1[var_18_3] = var_18_1[var_18_3] + 1
	end

	local var_18_4 = {}
	local var_18_5 = 1

	for iter_18_2 = 1, 8 do
		if var_18_1[iter_18_2] then
			var_18_4[iter_18_2] = var_18_5
			var_18_5 = var_18_5 + 1
		end
	end

	local var_18_6 = {}

	for iter_18_3, iter_18_4 in ipairs(var_0_1) do
		var_18_6[iter_18_3] = UITreeGroupData.New()
		var_18_6[iter_18_3].text = GetTips(iter_18_4)
	end

	for iter_18_5, iter_18_6 in ipairs(arg_18_0.poolToggles_) do
		local var_18_7 = DrawPoolCfg[iter_18_6]
		local var_18_8 = var_0_2[var_18_7.pool_show_type]

		arg_18_0.poolIDToIndexTable[iter_18_6][1] = var_18_4[var_18_8]
		var_18_6[var_18_8].id = var_18_4[var_18_8]

		local var_18_9 = UITreeItemData.New()

		var_18_9.id = var_18_7.id
		var_18_9.text = GetI18NText(var_18_7.name)

		if var_18_7.pool_show_type == 2 then
			local var_18_10 = DrawData:GetPollUpID(iter_18_6)

			var_18_9.text = GetI18NText(var_18_7.name)

			if var_18_10 ~= 0 then
				var_18_9.text = GetTips(var_0_4[var_18_10])
			end
		elseif var_18_7.pool_show_type == 8 or var_18_7.pool_show_type == 9 or var_18_7.pool_show_type == 3 and var_18_7.pool_selected_type == 2 then
			local var_18_11 = DrawData:GetPollUpID(iter_18_6)

			var_18_9.text = GetI18NText(var_18_7.name)

			if var_18_11 ~= 0 then
				local var_18_12 = DrawData:ConvertUpId(iter_18_6, var_18_11, 0)

				var_18_9.text = HeroCfg[var_18_12].name or ""
			end
		elseif var_18_7.pool_show_type == 1 then
			local var_18_13 = DrawData:GetPollUpID(iter_18_6)

			var_18_9.text = GetI18NText(var_18_7.name)

			if var_18_13 ~= 0 then
				var_18_9.text = HeroCfg[var_18_13].name or ""
			end
		end

		if arg_18_0.poolIDToIndexTable[iter_18_6][1] == 1 and arg_18_0.poolIDToIndexTable[iter_18_6][2] == 1 then
			arg_18_0.enterPoolId = iter_18_6
		end

		var_18_6[var_18_8].itemDatas:Add(var_18_9)
	end

	for iter_18_7 = 1, 7 do
		if var_18_6[iter_18_7].itemDatas.Count > 0 then
			var_18_0.groupDatas:Add(var_18_6[iter_18_7])
		end
	end

	arg_18_0.isFirst = nil

	arg_18_0.tree_:SetData(var_18_0)

	arg_18_0.isFirst = true
end

function var_0_0.OnGroupSelect(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	arg_19_0.tree_.tree_.data.groupDatas[arg_19_1 - 1].defaultIndex = 0
end

function var_0_0.OnItemSelect(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	if arg_20_0.isFirst == nil then
		return
	end

	arg_20_0:HidePoolNewTag(arg_20_2)
	arg_20_0:SetSelectPool(arg_20_2)

	local var_20_0 = DrawPoolCfg[arg_20_2]
	local var_20_1 = var_0_2[var_20_0.pool_show_type]

	arg_20_0.infoController:SetSelectedState("info_1")

	if var_20_1 == 1 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
	elseif var_20_1 == 2 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_20_1 == 3 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_20_1 == 4 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")

		arg_20_0.infoController:SetSelectedState("info_3")
	elseif var_20_1 == 5 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_20_1 == 6 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
	elseif var_20_1 == 7 then
		arg_20_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")
		arg_20_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_20_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")

		arg_20_0.infoController:SetSelectedState("info_3")
	end

	if DrawData:GetPollUpID(arg_20_0.selectPoolId_) == 0 and DrawData:GetPoolIsNew(arg_20_0.selectPoolId_) == 1 then
		DrawTools:GoToSelectUpHeroView(arg_20_0.selectPoolId_, arg_20_0.showId, true)
	end
end

function var_0_0.SetupActivityPool(arg_21_0)
	arg_21_0.poolToggles_ = {}

	local var_21_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		if ActivityData:GetActivityIsOpen(iter_21_1) then
			local var_21_1 = ActivityDrawPoolCfg[iter_21_1]

			if var_21_1 then
				for iter_21_2, iter_21_3 in ipairs(var_21_1.config_list) do
					local var_21_2 = DrawPoolCfg[iter_21_3]

					if var_21_2.pool_show_type == 8 then
						if not DrawData:GetNewbieChooseDrawFlag() then
							table.insert(arg_21_0.poolToggles_, iter_21_3)

							arg_21_0.poolActivitys_[iter_21_3] = iter_21_1
						end
					elseif var_21_2.pool_show_type == 9 then
						if RegressionDataNew:CheckIsOpenRuturnPool() then
							table.insert(arg_21_0.poolToggles_, iter_21_3)

							arg_21_0.poolActivitys_[iter_21_3] = iter_21_1
						end
					else
						table.insert(arg_21_0.poolToggles_, iter_21_3)

						arg_21_0.poolActivitys_[iter_21_3] = iter_21_1
					end
				end
			end
		end
	end

	if #arg_21_0.poolToggles_ == 0 then
		Debugger.LogError("draw error pools is empty")
	end

	table.sort(arg_21_0.poolToggles_, function(arg_22_0, arg_22_1)
		if DrawPoolCfg[arg_22_0].order == DrawPoolCfg[arg_22_1].order then
			return arg_22_1 < arg_22_0
		else
			return DrawPoolCfg[arg_22_0].order < DrawPoolCfg[arg_22_1].order
		end
	end)
	arg_21_0:InitTree()
	arg_21_0:InitPoolNew()
end

function var_0_0.InitPoolNew(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.poolToggles_) do
		if DrawData:GetPoolIsNew(iter_23_1) == 1 then
			arg_23_0:SetNewTag(true, iter_23_1)
		end
	end
end

function var_0_0.HidePoolNewTag(arg_24_0, arg_24_1, arg_24_2)
	if arg_24_0.selectPoolId_ ~= -1 and arg_24_0.selectPoolId_ ~= nil and arg_24_0.selectPoolId_ ~= arg_24_1 and DrawData:GetPoolIsNew(arg_24_0.selectPoolId_) == 1 or arg_24_2 then
		DrawAction.HidePoolNewTag(arg_24_0.selectPoolId_, handler(arg_24_0, arg_24_0.SetNewTag))
	end
end

function var_0_0.SetNewTag(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_0.poolIDToIndexTable[arg_25_2] then
		return
	end

	if not arg_25_0.tree_ then
		return
	end

	local var_25_0 = arg_25_0.poolIDToIndexTable[arg_25_2][1]
	local var_25_1 = arg_25_0.poolIDToIndexTable[arg_25_2][2]
	local var_25_2 = arg_25_0.tree_:GetGroupRedPointContainerById(var_25_0)
	local var_25_3 = arg_25_0.tree_:GetItemRedPointContainerById(var_25_0, arg_25_2)

	if var_25_2 == nil or var_25_3 == nil then
		return
	end

	if arg_25_1 then
		arg_25_0.groupRedPoint[var_25_0] = arg_25_0.groupRedPoint[var_25_0] or {}
		arg_25_0.groupRedPoint[var_25_0][var_25_1] = arg_25_2
	else
		arg_25_0.groupRedPoint[var_25_0][var_25_1] = nil

		if not next(arg_25_0.groupRedPoint[var_25_0]) then
			arg_25_0.groupRedPoint[var_25_0] = nil
		end

		if not next(arg_25_0.groupRedPoint) then
			manager.redPoint:setTip(RedPointConst.DRAW, 0, RedPointStyle.SHOW_NEW_TAG)

			arg_25_0.groupRedPoint = {}
		end
	end

	local var_25_4 = arg_25_0.groupRedPoint[var_25_0] and next(arg_25_0.groupRedPoint[var_25_0])

	manager.redPoint:setRedPoint({
		display = var_25_2
	}, var_25_4, RedPointStyle.SHOW_NEW_TAG)
	manager.redPoint:setRedPoint({
		display = var_25_3
	}, arg_25_1, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.RefreshActivityPool(arg_26_0)
	arg_26_0:SetupActivityPool()

	if not table.indexof(arg_26_0.poolToggles_, arg_26_0.selectPoolId_) then
		arg_26_0.selectPoolId_ = arg_26_0.poolToggles_[1]

		arg_26_0:RefreshUI()
	end
end

function var_0_0.SetSelectPool(arg_27_0, arg_27_1)
	if not table.indexof(arg_27_0.poolToggles_, arg_27_1) then
		return
	end

	if arg_27_1 == arg_27_0.selectPoolId_ then
		return
	end

	arg_27_0.selectPoolId_ = arg_27_1
	arg_27_0.params_.poolId = arg_27_1

	arg_27_0:RefreshUI()
end

function var_0_0.ShowBar(arg_28_0)
	local var_28_0 = DrawTools.GetCostTicketList(arg_28_0.selectPoolId_)
	local var_28_1 = DrawTools.GetActivityCostTicket(arg_28_0.selectPoolId_)
	local var_28_2 = {
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	}

	if var_28_1 == 0 or ItemTools.IsItemExpiredByItemId(var_28_1) then
		for iter_28_0, iter_28_1 in ipairs(var_28_0) do
			table.insert(var_28_2, iter_28_1)
		end

		table.insertto(var_28_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_28_2)
	elseif var_28_1 == InviteData:GetDataByPara("drawItemId") then
		for iter_28_2, iter_28_3 in ipairs(var_28_0) do
			table.insert(var_28_2, iter_28_3)
		end

		table.insertto(var_28_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_28_2)
	else
		if ItemTools.getItemNum(var_28_1) > 0 then
			table.insert(var_28_2, var_28_1)
		end

		for iter_28_4, iter_28_5 in ipairs(var_28_0) do
			table.insert(var_28_2, iter_28_5)
		end

		table.insertto(var_28_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_28_2)

		if ItemTools.getItemNum(var_28_1) > 0 then
			manager.windowBar:SetBarCanAdd(var_28_1, false)
			manager.windowBar:SetBarCanClick(var_28_1, true)
		end
	end

	manager.windowBar:RegistBackCallBack(function()
		DrawData:ResetServantRedPoint()
		arg_28_0:Back()
	end)
	manager.windowBar:RegistHomeCallBack(function()
		DrawData:ResetServantRedPoint()
		gameContext:Go("/home", nil, nil, true)
	end)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)

	for iter_28_6, iter_28_7 in pairs(var_28_0) do
		manager.windowBar:SetBarCanAdd(iter_28_7, false)
		manager.windowBar:SetBarCanClick(iter_28_7, true)
	end
end

function var_0_0.RefreshUI(arg_31_0)
	local var_31_0 = arg_31_0.selectPoolId_
	local var_31_1 = DrawPoolCfg[var_31_0]
	local var_31_2 = var_31_0

	arg_31_0:UpdateFirstSelectButton(true)

	if var_31_1.pool_selected_type == 9 then
		local var_31_3 = DrawData:GetPollUpID(var_31_0)

		if var_31_3 == 0 then
			arg_31_0:UpdateFirstSelectButton(false)

			var_31_2 = -1
		else
			var_31_2 = var_31_3
		end
	elseif var_31_1.pool_selected_type == 2 or var_31_1.pool_selected_type == 8 then
		if DrawData:GetPollUpID(var_31_0) == 0 then
			local var_31_4 = var_31_1.pool_change
			local var_31_5 = DrawData:GetPoolUpTimes(var_31_0)

			if var_31_4 == 0 or var_31_5 < var_31_4 then
				arg_31_0.timer = TimeTools.StartAfterSeconds(0.02, function(arg_32_0)
					if arg_31_0.timer == nil then
						return
					end

					if DrawData:IsOnePrefabPool(arg_32_0) then
						arg_31_0:UpdateFirstSelectButton(false)
					else
						arg_31_0:Go("/drawHeroSelect", {
							poolId = arg_31_0.selectPoolId_
						})
					end

					arg_31_0.timer = nil
				end, {
					var_31_0
				})
			end
		end
	elseif var_31_1.pool_selected_type == 1 and DrawData:GetPollUpID(var_31_0) == 0 then
		arg_31_0.timer = TimeTools.StartAfterSeconds(0.02, function(arg_33_0)
			if arg_31_0.timer == nil then
				return
			end

			if DrawData:IsOnePrefabPool(arg_33_0) then
				arg_31_0:UpdateFirstSelectButton(false)
			end

			arg_31_0.timer = nil
		end, {
			var_31_0
		})
	end

	if var_31_1.pool_type == 8 then
		arg_31_0.tenOneKeyGetText_.text = string.format(GetTips("DRAW_POOL_SCREEN_TYPE_2"), string.format(GetTips("NUM_" .. math.min(40 - DrawData:GetPoolDrawTimes(var_31_0), 10))))
		arg_31_0.tips3Text_.text = GetTips("DRAW_POOL_SCREEN_TYPE_3")
		arg_31_0.tenIconText_.text = "x" .. math.min(40 - DrawData:GetPoolDrawTimes(var_31_0), 10)
	elseif var_31_1.pool_type == 9 then
		arg_31_0.tenOneKeyGetText_.text = string.format(GetTips("DRAW_POOL_SCREEN_TYPE_2"), string.format(GetTips("NUM_" .. math.min(70 - DrawData:GetPoolDrawTimes(var_31_0), 10))))
		arg_31_0.tips3Text_.text = GetTips("NEW_REGRESSION__POOL_SCREEN_TYPE_1")
		arg_31_0.tenIconText_.text = "x" .. math.min(70 - DrawData:GetPoolDrawTimes(var_31_0), 10)
	else
		arg_31_0.tenOneKeyGetText_.text = string.format(GetTips("DRAW_POOL_SCREEN_TYPE_2"), GetTips("NUM_10"))
		arg_31_0.tenIconText_.text = "x10"
	end

	if arg_31_0.curPoolObject then
		if arg_31_0.curPoolObject:GetShowId() == var_31_2 then
			arg_31_0.curPoolObject:Refresh(var_31_2)
			arg_31_0:RefreshRightPanel()

			return
		else
			arg_31_0.curPoolObject:SetActive(false)
		end
	end

	arg_31_0.showId = var_31_2

	if not arg_31_0.poolObjects_[var_31_2] then
		if var_31_1.pool_type == 1 then
			if DrawData:IsOnePrefabPool(var_31_0) then
				arg_31_0.poolObjects_[var_31_2] = DrawRolePoolContainer.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
			else
				arg_31_0.poolObjects_[var_31_2] = DrawNormalPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
			end
		elseif var_31_1.pool_selected_type == 2 or var_31_1.pool_selected_type == 8 then
			if DrawData:IsOnePrefabPool(var_31_0) then
				if var_31_1.pool_type == 9 then
					arg_31_0.poolObjects_[var_31_2] = ReturnDrawSelectPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
				elseif var_31_1.pool_selected_type == 8 then
					arg_31_0.poolObjects_[var_31_2] = NewbieDrawSelectPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
				else
					arg_31_0.poolObjects_[var_31_2] = DrawSelectPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
				end
			else
				arg_31_0.poolObjects_[var_31_2] = DrawUpPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
			end
		elseif var_31_1.pool_selected_type == 9 then
			if DrawData:GetPollUpID(var_31_0) == var_31_2 then
				arg_31_0.poolObjects_[var_31_2] = DrawServantPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
			else
				arg_31_0.poolObjects_[var_31_2] = DrawServantNormalPool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
			end
		else
			arg_31_0.poolObjects_[var_31_2] = DrawBasePool.New(arg_31_0.poolcontentTrs_, var_31_0, var_31_2)
		end
	end

	arg_31_0.curPoolObject = arg_31_0.poolObjects_[var_31_2]

	arg_31_0.curPoolObject:Refresh(var_31_2)
	arg_31_0.curPoolObject:SetActive(true)
	arg_31_0:OnRequestRecord()
	arg_31_0:RefreshRightPanel()

	local var_31_6 = arg_31_0.poolActivitys_[var_31_0]

	if var_31_6 and ActivityData:GetActivityData(var_31_6) then
		local var_31_7 = ActivityData:GetActivityData(var_31_6).stopTime

		arg_31_0:SetCountDown(true, var_31_7)
	else
		arg_31_0:SetCountDown(false)
	end

	arg_31_0:ShowBar()

	if #DrawTools.GetRechargeDrawGiftList(var_31_0) == 0 then
		arg_31_0.rechargeShopGiftController:SetSelectedIndex(0)
	else
		arg_31_0.rechargeShopGiftController:SetSelectedIndex(1)
	end

	arg_31_0:UpdateFreeDraw()
end

function var_0_0.OnRequestRecord(arg_34_0)
	local var_34_0 = DrawData:GetDrawRecord(arg_34_0.selectPoolId_)
	local var_34_1 = DrawPoolCfg[arg_34_0.selectPoolId_]

	if var_34_0 then
		local var_34_2 = var_34_0.ssr_draw_times
		local var_34_3 = var_0_2[var_34_1.pool_show_type]
		local var_34_4 = var_0_3[var_34_3] or "70"

		arg_34_0.drawOutLineTxt_.text = var_34_2
		arg_34_0.drawTxt_.text = "/" .. var_34_4
		arg_34_0.drawAllTxt_.text = var_34_2
		arg_34_0.drawOutLineTxt1_.text = var_34_2
		arg_34_0.drawTxt1_.text = "/" .. var_34_4
		arg_34_0.drawAllTxt1_.text = var_34_2
	else
		DrawAction.RequestRecord(arg_34_0.selectPoolId_)
	end
end

function var_0_0.UpdateFreeDraw(arg_35_0)
	local var_35_0 = InviteData:GetDataByPara("poolID")
	local var_35_1 = InviteData:GetDataByPara("drawItemId")
	local var_35_2 = DrawPoolCfg[var_35_0]

	SetActive(arg_35_0.freeGo_, arg_35_0.selectPoolId_ == var_35_0 and ItemTools.getItemNum(var_35_1) > 0)

	if var_35_2 == nil then
		return
	end

	local var_35_3 = arg_35_0.tree_:GetGroupRedPointContainerById(var_0_2[var_35_2.pool_show_type])

	if var_35_3 == nil then
		return
	end

	manager.redPoint:setRedPoint({
		display = var_35_3
	}, ItemTools.getItemNum(var_35_1) > 0)

	local var_35_4 = arg_35_0.tree_:GetItemRedPointContainerById(var_0_2[var_35_2.pool_show_type], var_35_0)

	if var_35_4 == nil then
		return
	end

	manager.redPoint:setRedPoint({
		display = var_35_4
	}, ItemTools.getItemNum(var_35_1) > 0)
end

function var_0_0.RefreshRightPanel(arg_36_0)
	if not arg_36_0.curPoolObject then
		return
	end

	if arg_36_0.curPoolObject:ShowRightPanel() then
		local var_36_0 = DrawTools.GetActivityCostTicket(arg_36_0.selectPoolId_)

		if var_36_0 == 0 or ItemTools.IsItemExpiredByItemId(var_36_0) or ItemTools.getItemNum(var_36_0) == 0 then
			local var_36_1 = DrawTools.GetCostTicket(arg_36_0.selectPoolId_, 1)

			arg_36_0.iconOnce_.sprite = ItemTools.getItemSprite(var_36_1)

			local var_36_2 = DrawTools.GetCostTicket(arg_36_0.selectPoolId_, 10)

			arg_36_0.iconTenth_.sprite = ItemTools.getItemSprite(var_36_2)
			arg_36_0.one_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
			arg_36_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
		else
			arg_36_0.iconOnce_.sprite = ItemTools.getItemSprite(var_36_0)
			arg_36_0.one_cost_type = DrawConst.DRAW_COST_TYPE.ACTIVITY

			if ItemTools.getItemNum(var_36_0) < 10 then
				local var_36_3 = DrawTools.GetCostTicket(arg_36_0.selectPoolId_, 10)

				arg_36_0.iconTenth_.sprite = ItemTools.getItemSprite(var_36_3)
				arg_36_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
			else
				arg_36_0.iconTenth_.sprite = ItemTools.getItemSprite(var_36_0)
				arg_36_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.ACTIVITY
			end
		end

		arg_36_0.showRightController:SetSelectedIndex(1)
	else
		arg_36_0.showRightController:SetSelectedIndex(0)
	end
end

function var_0_0.DestroyPoolGo(arg_37_0)
	for iter_37_0, iter_37_1 in pairs(arg_37_0.poolObjects_) do
		iter_37_1:Dispose()
		Object.Destroy(iter_37_1.gameObject_)
	end

	arg_37_0.poolObjects_ = {}
end

function var_0_0.SetCountDown(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.activityEndTime_ = arg_38_2

	if arg_38_1 then
		if not arg_38_0.activityTimer_ then
			arg_38_0.activityTimer_ = Timer.New(handler(arg_38_0, arg_38_0.UpdateCountDownText), 1, -1)
		end

		arg_38_0:UpdateCountDownText()
		arg_38_0.curPoolObject:ShowCountDownText(true)
		arg_38_0.activityTimer_:Start()
	else
		arg_38_0.curPoolObject:ShowCountDownText(false)

		if arg_38_0.activityTimer_ then
			arg_38_0.activityTimer_:Stop()
		end
	end
end

function var_0_0.UpdateCountDownText(arg_39_0)
	arg_39_0.curPoolObject:SetCountDownText(arg_39_0.activityEndTime_)
end

function var_0_0.RemoveCountDownTimer(arg_40_0)
	if arg_40_0.activityTimer_ then
		arg_40_0.activityTimer_:Stop()

		arg_40_0.activityTimer_ = nil
	end
end

function var_0_0.DrawCheck(arg_41_0, arg_41_1)
	if WeaponServantData:GetServantNum() >= GameSetting.max_weapon_servant.value[1] then
		ShowMessageBox({
			content = GetTips("SERVANT_NUM_MAX"),
			BtnText = {
				nil,
				GetTips("SCAN_TIPS_1"),
				GetTips("SCAN_TIPS_2")
			},
			OkCallback = function()
				JumpTools.OpenPageByJump("/weaponServantList")
			end,
			CancelCallback = function()
				arg_41_0:StartDraw(arg_41_1)
			end
		})
	else
		arg_41_0:StartDraw(arg_41_1)
	end
end

function var_0_0.StartDraw(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0.selectPoolId_
	local var_44_1 = DrawPoolCfg[var_44_0]
	local var_44_2
	local var_44_3
	local var_44_4
	local var_44_5

	if DrawConst.DRAW_TYPE.ONE == arg_44_1 then
		var_44_2 = arg_44_0.one_cost_type
		var_44_3 = 1
		var_44_5 = 1
	elseif DrawConst.DRAW_TYPE.TEN == arg_44_1 then
		var_44_2 = arg_44_0.ten_cost_type
		var_44_3 = 10

		if var_44_1.discount > 0 then
			var_44_3 = var_44_3 * var_44_1.discount / 100
		end

		var_44_5 = 10
	else
		var_44_2 = arg_44_0.ten_cost_type
		var_44_3 = arg_44_1

		if var_44_1.discount > 0 then
			var_44_3 = var_44_3 * var_44_1.discount / 100
		end

		var_44_5 = arg_44_1
	end

	local var_44_6 = 0

	if DrawConst.DRAW_COST_TYPE.COMMON == var_44_2 then
		var_44_6 = DrawTools.GetCostTicket(var_44_0, var_44_3)

		local var_44_7 = ItemTools.getItemNum(var_44_6)

		if var_44_7 < var_44_3 then
			local var_44_8 = var_44_3 - var_44_7

			arg_44_0.shopDrawInfo = {
				poolId = var_44_0,
				draw_type = arg_44_1,
				cost_id = var_44_6,
				cost_num = var_44_3
			}

			SDKTools.SendPaymentMessageToSDK("payment_touch", {
				payment_gacha_diamond = "{" .. ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND) .. "," .. CurrencyData:GetRechargeDiamond()
			})
			arg_44_0:ShowBuyView(var_44_8, var_44_1)

			return
		end
	elseif DrawConst.DRAW_COST_TYPE.ACTIVITY == var_44_2 then
		var_44_6 = DrawTools.GetActivityCostTicket(var_44_0)

		if ItemTools.IsItemExpiredByItemId(var_44_6) then
			ShowTips("TIP_EXPIRED")
			arg_44_0:RefreshActivityPool()
			arg_44_0:RefreshUI()

			return
		end

		if var_44_3 > ItemTools.getItemNum(var_44_6) then
			error("draw activity tick num error")

			return
		end
	end

	if not SDKTools.GetIsOverSea() and var_44_5 + DrawData:GetTodayDrawTimes() > GameSetting.draw_num_max.value[1] then
		ShowTips("DRAW_NUM_MAX")

		return
	end

	DrawData:SetNewHeroFlag(false)

	local var_44_9 = InviteData:GetDataByPara("drawItemId")

	if _G.SkipTip["DrawSkipTip" .. arg_44_0.selectPoolId_] or var_44_9 == var_44_6 then
		manager.achievementTips:SetShowFlag(false)
		DrawAction.GoToDraw(arg_44_0.selectPoolId_, arg_44_1, var_44_6, var_44_3)
	else
		JumpTools.OpenPageByJump("popCostItem", {
			costId = var_44_6,
			itemId = MaterialConst.MYTHIC_REFRESH_ITEM_ID,
			popCostCallBack = function()
				manager.achievementTips:SetShowFlag(false)
				DrawAction.GoToDraw(arg_44_0.selectPoolId_, arg_44_1, var_44_6, var_44_3)
			end,
			ToggleCallback = function(arg_46_0)
				_G.SkipTip["DrawSkipTip" .. arg_44_0.selectPoolId_] = arg_46_0
			end,
			content = string.format(GetTips("DRAW_TIMES"), ItemTools.getItemName(var_44_6), var_44_3, var_44_3)
		})
	end
end

function var_0_0.ShowBuyView(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = getShopCfg(arg_47_2.exchange_id)
	local var_47_1 = var_47_0.cost * arg_47_1
	local var_47_2 = {
		id = DrawTools.GetCostTicket(arg_47_2.id, arg_47_1),
		num = arg_47_1
	}
	local var_47_3 = {}
	local var_47_4 = {}
	local var_47_5 = math.min(ItemTools.getItemNum(var_47_0.cost_id), var_47_1)

	if var_47_5 > 0 then
		var_47_3 = {
			id = var_47_0.cost_id,
			num = var_47_5
		}
	end

	local var_47_6 = var_47_1 - var_47_5

	if var_47_6 > 0 then
		var_47_4 = {
			id = CurrencyConst.GetPlatformDiamondId(),
			num = var_47_6
		}
	end

	if not var_47_3.id and var_47_4.id then
		var_47_3 = var_47_4
		var_47_4 = {}
	end

	JumpTools.OpenPageByJump("itemBuy", {
		title = GetTips("TREASURE_TICKET_TO_BUY"),
		item1 = var_47_2,
		item2 = var_47_3,
		item3 = var_47_4,
		OkCallback = function()
			local var_48_0 = CurrencyData:GetRechargeDiamond()

			if var_47_6 > 0 and var_48_0 < var_47_6 then
				if AreaDifferenceCfg[GameToSDK.CURRENT_SERVER].payment == 1 then
					ShopTools.DiamondEnoughMessageBox()
				else
					ShowTips("ERROR_ITEM_NOT_ENOUGH_CURRENCY")
				end

				return
			end

			ShopAction.BuyItem({
				{
					goodID = arg_47_2.exchange_id,
					buyNum = arg_47_1
				}
			}, nil, PayConst.BUY_SOURCE_DRAW_POPUP)
		end,
		CancelCallback = function()
			arg_47_0.shopDrawInfo = nil
		end
	})
end

function var_0_0.OnShopBuyResult(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	if arg_50_1 == 0 then
		if arg_50_0.shopDrawInfo == nil then
			return
		end

		arg_50_0:Back()
		manager.achievementTips:SetShowFlag(false)

		local var_50_0 = arg_50_0.shopDrawInfo.poolId
		local var_50_1 = arg_50_0.poolActivitys_[var_50_0]

		if var_50_1 and ActivityData:GetActivityIsOpen(var_50_1) then
			DrawAction.GoToDraw(arg_50_0.shopDrawInfo.poolId, arg_50_0.shopDrawInfo.draw_type, arg_50_0.shopDrawInfo.cost_id, arg_50_0.shopDrawInfo.cost_num)
		end

		arg_50_0.shopDrawInfo = nil
	else
		if arg_50_1 then
			ShowTips(arg_50_1)
		end

		arg_50_0.shopDrawInfo = nil
	end
end

function var_0_0.OnGoToDraw(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_1.result == 0 then
		local var_51_0 = {}
		local var_51_1 = 0
		local var_51_2 = arg_51_1.item

		for iter_51_0, iter_51_1 in ipairs(var_51_2) do
			DrawData:TodayDrawTimesChange(1)
			table.insert(var_51_0, formatReward(iter_51_1))

			local var_51_3 = ItemCfg[iter_51_1.id]
			local var_51_4 = var_51_3 and var_51_3.display_rare or 0

			if var_51_1 < var_51_4 then
				var_51_1 = var_51_4
			end
		end

		arg_51_0:RefreshUI()
		manager.windowBar:HideBar()

		arg_51_0.itemList_ = var_51_0

		arg_51_0:CheckInteract(var_51_1)
	else
		ShowTips(arg_51_1.result)
		arg_51_0:RefreshActivityPool()
		arg_51_0.tree_:SelectItem(arg_51_0.poolIDToIndexTable[arg_51_0.selectPoolId_][1], arg_51_0.poolIDToIndexTable[arg_51_0.selectPoolId_][2])
		manager.achievementTips:SetShowFlag(true)
	end

	arg_51_0.shopDrawInfo = nil
end

function var_0_0.JumpToReward(arg_52_0)
	manager.achievementTips:SetShowFlag(true)

	local var_52_0 = #arg_52_0.itemList_

	if var_52_0 > 0 then
		local var_52_1 = {}
		local var_52_2 = {}

		for iter_52_0, iter_52_1 in ipairs(arg_52_0.itemList_) do
			local var_52_3 = setmetatable({
				index = iter_52_0
			}, {
				__index = iter_52_1
			})

			if ItemCfg[iter_52_1.id].type == ItemConst.ITEM_TYPE.HERO then
				var_52_3.newTag = true
				var_52_2[iter_52_1.id] = true

				DrawData:SetNewHeroFlag(true)
			elseif ItemCfg[iter_52_1.id].type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
				var_52_3.newTag = IllustratedData:GetNewObtainedServant(iter_52_1.id) ~= nil

				if var_52_3.newTag and ItemCfg[iter_52_1.id].rare >= 5 then
					DrawData:SetServantRedPoint(arg_52_0.selectPoolId_, 1)
				end
			end

			table.insert(var_52_1, var_52_3)
		end

		local var_52_4 = 0

		for iter_52_2, iter_52_3 in ipairs(arg_52_0.itemList_) do
			local var_52_5 = iter_52_3.id

			if ItemCfg[var_52_5].type == ItemConst.ITEM_TYPE.HERO or ItemCfg[var_52_5].type == ItemConst.ITEM_TYPE.WEAPON_SERVANT or ItemCfg[var_52_5].type == ItemConst.ITEM_TYPE.HERO_PIECE then
				local var_52_6 = var_52_5

				if ItemWillConvert(iter_52_3) then
					var_52_6 = iter_52_3.convert_from.id
				end

				local var_52_7 = ItemCfg[var_52_6].rare

				for iter_52_4, iter_52_5 in ipairs(GameSetting.currency_for_draw.value) do
					if var_52_7 == iter_52_5[1] then
						var_52_4 = var_52_4 + iter_52_5[2]
					end
				end
			end
		end

		if var_52_0 ~= 1 then
			gameContext:Go("drawTenTimesReward", {
				reward = var_52_1,
				callBack_afterTen = function()
					getReward({
						{
							id = ItemConst.CURRENCY_FOR_DRAW,
							num = var_52_4
						}
					}, nil, function()
						local var_54_0 = DrawPoolCfg[arg_52_0.selectPoolId_]

						if var_54_0.pool_type == 8 and DrawData:GetNewbieChooseDrawFlag() or var_54_0.pool_type == 9 and not RegressionDataNew:CheckIsOpenRuturnPool() then
							if var_54_0.pool_type == 9 then
								ShowTips("NEW_REGRESSION__POOL_SCREEN_TYPE_4")
							else
								ShowTips("DRAW_POOL_SCREEN_TYPE_1")
							end

							arg_52_0:SetupActivityPool()

							arg_52_0.tree_.tree_.data.groupDatas[1].defaultIndex = 1

							arg_52_0.tree_:SelectItem(1, 1)
						end
					end)
					arg_52_0:ShowBar()
				end
			})
		else
			local var_52_8 = DrawPoolCfg[arg_52_0.selectPoolId_]

			if var_52_8.pool_type == 8 and DrawData:GetNewbieChooseDrawFlag() or var_52_8.pool_type == 9 and not RegressionDataNew:CheckIsOpenRuturnPool() then
				if var_52_8.pool_type == 9 then
					ShowTips("NEW_REGRESSION__POOL_SCREEN_TYPE_4")
				else
					ShowTips("DRAW_POOL_SCREEN_TYPE_1")
				end

				arg_52_0:SetupActivityPool()

				arg_52_0.tree_.tree_.data.groupDatas[1].defaultIndex = 1

				arg_52_0.tree_:SelectItem(1, 1)
			end

			arg_52_0:ShowBar()
		end
	end

	arg_52_0:UpdateFreeDraw()
	arg_52_0:OnRequestRecord()
end

function var_0_0.SkipMovie(arg_55_0)
	arg_55_0.criplayer_.statusChangeCallback = nil

	if arg_55_0.moviePlaying then
		arg_55_0.criMovie_:Stop()
	end

	arg_55_0:DoNextNode(true)
end

local function var_0_5(arg_56_0)
	local var_56_0 = {
		__index = arg_56_0
	}
	local var_56_1 = ItemWillConvert(arg_56_0) and arg_56_0.convert_from.id or arg_56_0.id

	print("BuildShowItemInfo", arg_56_0.convert_from.id, arg_56_0.id)

	local var_56_2 = ItemCfg[var_56_1]
	local var_56_3 = var_56_2.type
	local var_56_4 = {}

	if var_56_3 == ItemConst.ITEM_TYPE.HERO or var_56_3 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_56_5 = var_56_2.rare

		for iter_56_0, iter_56_1 in ipairs(GameSetting.currency_for_draw.value) do
			if var_56_5 == iter_56_1[1] then
				var_56_4.draw_rebate = iter_56_1[2]
			end
		end
	end

	return setmetatable(var_56_4, var_56_0)
end

function var_0_0.DoNextNode(arg_57_0, arg_57_1)
	arg_57_0.panel_.transform.localPosition = Vector2(0, 0)

	local var_57_0 = #arg_57_0.itemList_

	if arg_57_1 and var_57_0 > 1 then
		local var_57_1 = {}

		for iter_57_0, iter_57_1 in ipairs(arg_57_0.itemList_) do
			if ItemCfg[iter_57_1.id].type == ItemConst.ITEM_TYPE.HERO and ObtainHeroMovieCfg[iter_57_1.id] and not (getData(DrawConst.WATCH_TAG, tostring(iter_57_1.id)) or false) then
				table.insert(var_57_1, var_0_5(iter_57_1))
			end
		end

		if #var_57_1 == 0 then
			arg_57_0:JumpToReward()
		else
			local var_57_2 = handler(arg_57_0, arg_57_0.JumpToReward)
			local var_57_3 = {
				doNextHandler = var_57_2,
				skipHandler = var_57_2,
				itemList = var_57_1
			}

			arg_57_0:Go("obtainView", var_57_3)
		end

		return
	end

	if var_57_0 > 0 then
		local var_57_4 = {}

		for iter_57_2, iter_57_3 in ipairs(arg_57_0.itemList_) do
			local var_57_5 = ItemWillConvert(iter_57_3) and iter_57_3.convert_from.id or iter_57_3.id
			local var_57_6 = ItemCfg[var_57_5].type

			if var_57_0 == 1 and var_57_6 == ItemConst.ITEM_TYPE.HERO and ItemWillConvert(iter_57_3) then
				DrawData:SetNewHeroFlag(true)
			end

			table.insert(var_57_4, var_0_5(iter_57_3))
		end

		local var_57_7 = {
			doNextHandler = handler(arg_57_0, arg_57_0.JumpToReward),
			skipHandler = handler(arg_57_0, arg_57_0.JumpToReward),
			itemList = var_57_4
		}

		arg_57_0:Go("obtainView", var_57_7)
	else
		arg_57_0:JumpToReward()
	end
end

function var_0_0.PlayMovie(arg_58_0, arg_58_1)
	local var_58_0 = manager.audio:GetMusicVolume()

	arg_58_0.criplayer_:SetVolume(var_58_0)
	arg_58_0.criMovie_:Play()

	arg_58_0.criplayer_.statusChangeCallback = handler(arg_58_0, arg_58_0.CirMovieStatusChange)
	arg_58_0.moviePlaying = true

	if arg_58_1 >= 5 then
		manager.audio:SetObtainGoldSelectorLabel()
	elseif arg_58_1 >= 4 then
		manager.audio:SetObtainPurpleSelectorLabel()
	else
		manager.audio:SetObtainBlueSelectorLabel()
	end

	manager.audio:PlayEffect("ui_system_search", "search_animation", "")
	SetActive(arg_58_0.movieGo_, true)
end

function var_0_0.CirMovieStatusChange(arg_59_0, arg_59_1)
	local var_59_0 = tostring(arg_59_1)

	if var_59_0 == "PlayEnd" or var_59_0 == "Stop" then
		arg_59_0:DoNextNode(false)
	end
end

function var_0_0.StopMovie(arg_60_0)
	arg_60_0.criplayer_.statusChangeCallback = nil
	arg_60_0.moviePlaying = false

	SetActive(arg_60_0.movieGo_, false)
end

function var_0_0.SkipInteract(arg_61_0)
	SetActive(arg_61_0.drawInteractGo_, false)

	if arg_61_0.drawInteract.timeline then
		arg_61_0.drawInteract.timeline:Stop()
	end

	arg_61_0:DoNextNode(true)
end

function var_0_0.CheckInteract(arg_62_0, arg_62_1)
	arg_62_0.maxRare = arg_62_1

	if not DrawTools:LevelIsDone() then
		SetForceShowQuanquan(true)

		if arg_62_0.interactTimer then
			arg_62_0.interactTimer:Stop()

			arg_62_0.interactTimer = nil
		end

		arg_62_0.interactTimer = FrameTimer.New(handler(arg_62_0, arg_62_0.WaitInteract), 1, -1)

		arg_62_0.interactTimer:Start()
	else
		arg_62_0:StarInteract()
	end
end

function var_0_0.WaitInteract(arg_63_0)
	if DrawTools:LevelIsDone() then
		SetForceShowQuanquan(false)

		if arg_63_0.interactTimer then
			arg_63_0.interactTimer:Stop()

			arg_63_0.interactTimer = nil
		end

		arg_63_0:StarInteract()
	end
end

function var_0_0.StarInteract(arg_64_0)
	local var_64_0 = arg_64_0.maxRare or 0

	if var_64_0 >= 5 then
		SetFile(arg_64_0.criplayer_, nil, arg_64_0.moviePaths[3])
	elseif var_64_0 >= 4 then
		SetFile(arg_64_0.criplayer_, nil, arg_64_0.moviePaths[2])
	else
		SetFile(arg_64_0.criplayer_, nil, arg_64_0.moviePaths[1])
	end

	local var_64_1

	if var_64_0 >= 5 then
		var_64_1 = GameObject.Find("X102/TC/directors/director_gold")
	elseif var_64_0 >= 4 then
		var_64_1 = GameObject.Find("X102/TC/directors/director_purple")
	else
		var_64_1 = GameObject.Find("X102/TC/directors/director_blue")
	end

	if var_64_1 then
		local var_64_2 = var_64_1:GetComponent("PlayableDirector")

		arg_64_0.drawInteract:Init(var_64_2, handler(arg_64_0, arg_64_0.StopInteract))
		arg_64_0.drawInteract:Reset()

		arg_64_0.panel_.transform.localPosition = Vector2(9999, 9999)

		SetActive(arg_64_0.drawInteractGo_, true)
	else
		arg_64_0:StopInteract()
	end

	if arg_64_0.selectPoolId_ and arg_64_0.selectPoolId_ ~= 0 and arg_64_0.selectPoolId_ ~= -1 then
		arg_64_0:HidePoolNewTag(arg_64_0.selectPoolId_, true)
	end
end

function var_0_0.StopInteract(arg_65_0)
	SetActive(arg_65_0.drawInteractGo_, false)
	arg_65_0:PlayMovie(arg_65_0.maxRare or 0)
end

function var_0_0.Dispose(arg_66_0)
	arg_66_0.currencyModifyHandler_ = nil
	arg_66_0.timer = nil

	arg_66_0:DestroyPoolGo()
	arg_66_0.tree_:Dispose()

	arg_66_0.drawHandler_ = nil

	var_0_0.super.Dispose(arg_66_0)
end

function var_0_0.CurrencyModify(arg_67_0)
	arg_67_0:RefreshRightPanel()
end

function var_0_0.UpdateFirstSelectButton(arg_68_0, arg_68_1)
	SetActive(arg_68_0.chooseBtn_.gameObject, not arg_68_1)
	SetActive(arg_68_0.btnOnce_.gameObject, arg_68_1)
	SetActive(arg_68_0.btnTenth_.gameObject, arg_68_1)

	local var_68_0 = DrawPoolCfg[arg_68_0.selectPoolId_]

	arg_68_0.chooseText_.text = GetTips(var_68_0.pool_selected_type == 9 and "DRAW_WEAPON_BUTTON" or "DRAW_CHARACTER_BUTTON")
end

function var_0_0.OnInviteDrawUpdate(arg_69_0)
	arg_69_0:UpdateFreeDraw()
end

function var_0_0.AdaptRight(arg_70_0)
	var_0_0.super.AdaptRight(arg_70_0)

	if var_0_0.VIEW_ADAPT_DISTANCE == arg_70_0.lastAdaptDistance_ then
		return
	end

	if not var_0_0.NEED_ADAPT then
		arg_70_0.btnSkip_.transform.anchoredPosition = Vector3(0, 0, 0)
		arg_70_0.skipInteractBtn_.transform.anchoredPosition = Vector3(0, 0, 0)
	else
		arg_70_0.btnSkip_.transform.anchoredPosition = Vector3(-1 * var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)
		arg_70_0.skipInteractBtn_.transform.anchoredPosition = Vector3(-1 * var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)
	end
end

return var_0_0
