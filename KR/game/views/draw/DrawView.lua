local var_0_0 = class("DrawView", ReduxView)
local var_0_1 = {
	"DRAW_POOL_TYPE_6",
	"DRAW_POOL_TYPE_3",
	"DRAW_POOL_TYPE_7",
	"DRAW_POOL_TYPE_8",
	"DRAW_POOL_TYPE_1",
	"DRAW_POOL_TYPE_2"
}
local var_0_2 = {
	5,
	6,
	2,
	nil,
	5,
	1,
	3,
	4
}
local var_0_3 = {
	[1] = "90",
	[4] = "40"
}
local var_0_4 = {
	[200003] = "WEAPON_DRAW_POOL_RACE_3",
	[200001] = "WEAPON_DRAW_POOL_RACE_1",
	[200009] = "WEAPON_DRAW_POOL_RACE_9",
	[2550996] = "WEAPON_DRAW_POOL_RACE_GODEATER_1",
	[200005] = "WEAPON_DRAW_POOL_RACE_5",
	[200004] = "WEAPON_DRAW_POOL_RACE_4",
	[200002] = "WEAPON_DRAW_POOL_RACE_2",
	[2550997] = "WEAPON_DRAW_POOL_RACE_GODEATER_2"
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
	arg_4_0.leftGroupItemList_ = {}
	arg_4_0.leftToggleItemList_ = {}

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
		if DrawPoolCfg[arg_6_0.selectPoolId_].pool_type == 8 then
			arg_6_0:DrawCheck(math.min(40 - DrawData:GetPoolDrawTimes(arg_6_0.selectPoolId_), 10))
		else
			arg_6_0:DrawCheck(DrawConst.DRAW_TYPE.TEN)
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnSkip_, nil, function()
		manager.audio:PlayEffect("ui_system_search", "search_skip", "")
		arg_6_0:SkipMovie()
	end)
	arg_6_0:AddBtnListener(arg_6_0.chooseBtn_, nil, function()
		local var_12_0 = DrawPoolCfg[arg_6_0.selectPoolId_]

		if arg_6_0.selectPoolId_ == 31010 then
			arg_6_0:Go("/drawAllHeroSelect", {
				isFirst = true,
				poolId = arg_6_0.selectPoolId_,
				heroIdList = var_12_0.optional_detail
			})
		elseif var_12_0.pool_selected_type == 2 then
			if var_12_0.pool_type == 1 then
				local var_12_1 = table.indexof(var_12_0.optional_lists_poolId, arg_6_0.showId)
				local var_12_2 = var_12_0.optional_detail[var_12_1]

				arg_6_0:Go("/newbieDrawHeroSelect", {
					poolId = arg_6_0.selectPoolId_,
					heroIdList = var_12_0.optional_detail,
					heroId = var_12_2
				})
			else
				arg_6_0:Go("/drawAllHeroSelect", {
					isFirst = true,
					poolId = arg_6_0.selectPoolId_,
					heroIdList = var_12_0.optional_detail
				})
			end
		elseif var_12_0.pool_selected_type == 8 then
			local var_12_3 = table.indexof(var_12_0.optional_lists_poolId, arg_6_0.showId)
			local var_12_4 = var_12_0.optional_detail[var_12_3]

			arg_6_0:Go("/newbieDrawHeroSelect", {
				poolId = arg_6_0.selectPoolId_,
				heroIdList = var_12_0.optional_detail,
				heroId = var_12_4
			})
		elseif var_12_0.pool_selected_type == 9 and arg_6_0.selectPoolId_ == DrawConst.WEAPON_SERVANT_POOL_ID then
			arg_6_0:Go("/drawSelect", {
				poolID = arg_6_0.selectPoolId_
			})
		elseif var_12_0.pool_selected_type == 9 and arg_6_0.selectPoolId_ ~= DrawConst.WEAPON_SERVANT_POOL_ID then
			arg_6_0:Go("/drawGodEaterSelect", {
				poolID = arg_6_0.selectPoolId_
			})
		elseif var_12_0.pool_selected_type == 1 then
			local var_12_5 = table.indexof(var_12_0.optional_lists_poolId, arg_6_0.showId)
			local var_12_6 = var_12_0.optional_detail[var_12_5]

			arg_6_0:Go("/newbieDrawHeroSelect", {
				poolId = arg_6_0.selectPoolId_,
				heroIdList = var_12_0.optional_detail,
				heroId = var_12_6
			})
		end
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
	arg_15_0:AddBonusTimer()
end

function var_0_0.AddBonusTimer(arg_16_0)
	arg_16_0:StopBonusTimer()

	if arg_16_0.bonusView_ then
		arg_16_0.bonusView_:PrePlayAnimator()
	end

	arg_16_0.bonusTimer_ = FrameTimer.New(function()
		arg_16_0:StopBonusTimer()

		if arg_16_0:IsTop() and not arg_16_0.drawProcessFlag_ then
			local var_17_0 = arg_16_0.selectPoolId_
			local var_17_1 = DrawTools.GetDrawBonusActivityIDList()

			if DrawTools.HasDrawBonusPoolID(var_17_1, var_17_0) and arg_16_0.bonusView_ then
				arg_16_0.bonusView_:PlayAnimator()
			end
		end
	end, 2, 1)

	arg_16_0.bonusTimer_:Start()
end

function var_0_0.StopBonusTimer(arg_18_0)
	if arg_18_0.bonusTimer_ then
		arg_18_0.bonusTimer_:Stop()

		arg_18_0.bonusTimer_ = nil
	end
end

function var_0_0.OnEnter(arg_19_0)
	if arg_19_0.bonusView_ then
		arg_19_0.bonusView_:OnEnter()
	end

	if arg_19_0.params_.isFirst then
		arg_19_0:DestroyPoolGo()

		arg_19_0.params_.isFirst = nil
	end

	arg_19_0:SetupActivityPool()

	if arg_19_0.params_.poolType then
		for iter_19_0, iter_19_1 in ipairs(arg_19_0.poolToggles_) do
			if DrawPoolCfg[iter_19_1].pool_type == arg_19_0.params_.poolType then
				arg_19_0.params_.poolId = iter_19_1
				arg_19_0.params_.poolType = nil
			end
		end
	end

	local var_19_0 = arg_19_0.enterPoolId

	if arg_19_0.params_.poolId then
		local var_19_1 = arg_19_0.poolActivitys_[arg_19_0.params_.poolId]

		if var_19_1 and ActivityData:GetActivityIsOpen(var_19_1) then
			var_19_0 = arg_19_0.params_.poolId
		end
	end

	arg_19_0.tree_.tree_.data.groupDatas[arg_19_0.poolIDToIndexTable[var_19_0][1] - 1].defaultIndex = arg_19_0.poolIDToIndexTable[var_19_0][2] - 1

	arg_19_0.tree_:SelectItem(arg_19_0.poolIDToIndexTable[var_19_0][1], arg_19_0.poolIDToIndexTable[var_19_0][2])
	DrawTools:LoadDrawLevel()
	manager.ui:SetMainCamera("draw")

	arg_19_0.panel_.transform.localPosition = Vector2(0, 0)

	manager.notify:RegistListener(CURRENCY_UPDATE, arg_19_0.currencyModifyHandler_)
	manager.ui:SetMainCameraCom("CinemachineBrain", false)

	if ShopListCfg[ShopConst.SHOP_ID.DRAW_EXCHANGE_ASSET_SHOP] then
		arg_19_0.shopText_.text = GetI18NText(ShopListCfg[ShopConst.SHOP_ID.DRAW_EXCHANGE_ASSET_SHOP].remark)
	end

	DrawAction.ClickDrawBonusRedPoint()
end

function var_0_0.OnExit(arg_20_0)
	arg_20_0:StopBonusTimer()

	if arg_20_0.bonusView_ then
		arg_20_0.bonusView_:OnExit()
	end

	arg_20_0.drawProcessFlag_ = false

	manager.notify:RemoveListener(CURRENCY_UPDATE, arg_20_0.currencyModifyHandler_)

	if arg_20_0.selectPoolId_ and arg_20_0.selectPoolId_ ~= 0 and arg_20_0.selectPoolId_ ~= -1 and manager.net ~= nil and manager.net.tcpConnection_ ~= nil then
		local var_20_0 = manager.net.tcpConnection_:GetMachineState()

		if var_20_0 and (var_20_0 == "connected" or var_20_0 == "connecting") then
			arg_20_0:HidePoolNewTag(arg_20_0.selectPoolId_, true)
		end
	end

	manager.windowBar:HideBar()
	arg_20_0:StopMovie()
	arg_20_0.criMovie_:Stop()

	if arg_20_0.curPoolObject then
		arg_20_0.curPoolObject:SetActive(false)
	end

	arg_20_0.curPoolObject = nil
	arg_20_0.selectPoolId_ = -1
	arg_20_0.timer = nil
	arg_20_0.one_cost_type = nil
	arg_20_0.ten_cost_type = nil

	if arg_20_0.interactTimer then
		arg_20_0.interactTimer:Stop()

		arg_20_0.interactTimer = nil
	end

	manager.ui:SetMainCameraCom("CinemachineBrain", false)
	arg_20_0:RemoveCountDownTimer()
	DrawTools:UnLoadDrawLevel()
end

function var_0_0.InitTree(arg_21_0)
	local var_21_0 = UITreeData.New()
	local var_21_1 = {}

	arg_21_0.poolIDToIndexTable = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.poolToggles_) do
		local var_21_2 = DrawPoolCfg[iter_21_1]
		local var_21_3 = var_0_2[var_21_2.pool_show_type]

		if var_21_1[var_21_3] == nil then
			var_21_1[var_21_3] = 1
		end

		arg_21_0.poolIDToIndexTable[iter_21_1] = {
			var_21_3,
			var_21_1[var_21_3]
		}
		var_21_1[var_21_3] = var_21_1[var_21_3] + 1
	end

	local var_21_4 = {}
	local var_21_5 = 1

	for iter_21_2 = 1, 8 do
		if var_21_1[iter_21_2] then
			var_21_4[iter_21_2] = var_21_5
			var_21_5 = var_21_5 + 1
		end
	end

	local var_21_6 = {}

	for iter_21_3, iter_21_4 in ipairs(var_0_1) do
		var_21_6[iter_21_3] = UITreeGroupData.New()
		var_21_6[iter_21_3].text = GetTips(iter_21_4)
	end

	for iter_21_5, iter_21_6 in ipairs(arg_21_0.poolToggles_) do
		local var_21_7 = DrawPoolCfg[iter_21_6]
		local var_21_8 = var_0_2[var_21_7.pool_show_type]

		arg_21_0.poolIDToIndexTable[iter_21_6][1] = var_21_4[var_21_8]
		var_21_6[var_21_8].id = var_21_4[var_21_8]

		local var_21_9 = UITreeItemData.New()

		var_21_9.id = var_21_7.id
		var_21_9.text = GetI18NText(var_21_7.name)

		if var_21_7.pool_show_type == 2 then
			local var_21_10 = DrawData:GetPollUpID(iter_21_6)

			var_21_9.text = GetI18NText(var_21_7.name)

			if var_21_10 ~= 0 then
				var_21_9.text = GetTips(var_0_4[var_21_10])
			end
		elseif var_21_7.pool_show_type == 8 or var_21_7.pool_show_type == 3 and var_21_7.pool_selected_type == 2 then
			local var_21_11 = DrawData:GetPollUpID(iter_21_6)

			var_21_9.text = GetI18NText(var_21_7.name)

			if var_21_11 ~= 0 then
				local var_21_12 = DrawData:ConvertUpId(iter_21_6, var_21_11, 0)

				var_21_9.text = GetI18NText(HeroCfg[var_21_12].name) or ""
			end
		elseif var_21_7.pool_show_type == 1 then
			local var_21_13 = DrawData:GetPollUpID(iter_21_6)

			var_21_9.text = GetI18NText(var_21_7.name)

			if var_21_13 ~= 0 then
				var_21_9.text = GetI18NText(HeroCfg[var_21_13].name) or ""
			end
		end

		if arg_21_0.poolIDToIndexTable[iter_21_6][1] == 1 and arg_21_0.poolIDToIndexTable[iter_21_6][2] == 1 then
			arg_21_0.enterPoolId = iter_21_6
		end

		var_21_6[var_21_8].itemDatas:Add(var_21_9)
	end

	for iter_21_7 = 1, 6 do
		if var_21_6[iter_21_7].itemDatas.Count > 0 then
			var_21_0.groupDatas:Add(var_21_6[iter_21_7])
		end
	end

	arg_21_0.isFirst = nil

	arg_21_0.tree_:SetData(var_21_0)

	arg_21_0.isFirst = true
end

function var_0_0.OnGroupSelect(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	arg_22_0.tree_.tree_.data.groupDatas[arg_22_1 - 1].defaultIndex = 0
end

function var_0_0.OnItemSelect(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	if arg_23_0.isFirst == nil then
		return
	end

	arg_23_0:HidePoolNewTag(arg_23_2)
	arg_23_0:SetSelectPool(arg_23_2)

	local var_23_0 = DrawPoolCfg[arg_23_2]
	local var_23_1 = var_0_2[var_23_0.pool_show_type]

	arg_23_0.infoController:SetSelectedState("info_1")

	if var_23_1 == 1 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_5")
	elseif var_23_1 == 2 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_23_1 == 3 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_23_1 == 4 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_8")

		arg_23_0.infoController:SetSelectedState("info_3")
	elseif var_23_1 == 5 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_S_4")
	elseif var_23_1 == 6 then
		arg_23_0.upTips_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
		arg_23_0.upTips1_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
		arg_23_0.upTips2_.text = GetTips("DRAW_POOL_PROBABILITY_FIVE_WEAPON_4")
	end

	if DrawData:GetPollUpID(arg_23_0.selectPoolId_) == 0 and DrawData:GetPoolIsNew(arg_23_0.selectPoolId_) == 1 then
		local var_23_2 = DrawPoolCfg[arg_23_0.selectPoolId_]

		if var_23_2.pool_selected_type == 2 then
			if var_23_2.pool_type == 1 then
				local var_23_3 = table.indexof(var_23_2.optional_lists_poolId, arg_23_0.showId)
				local var_23_4 = var_23_2.optional_detail[var_23_3]

				arg_23_0:Go("/newbieDrawHeroSelect", {
					poolId = arg_23_0.selectPoolId_,
					heroIdList = var_23_2.optional_detail,
					heroId = var_23_4
				})
			else
				arg_23_0:Go("/drawAllHeroSelect", {
					isFirst = true,
					poolId = arg_23_0.selectPoolId_,
					heroIdList = var_23_2.optional_detail
				})
			end
		elseif var_23_2.pool_selected_type == 8 then
			local var_23_5 = table.indexof(var_23_2.optional_lists_poolId, arg_23_0.showId)
			local var_23_6 = var_23_2.optional_detail[var_23_5]

			arg_23_0:Go("/newbieDrawHeroSelect", {
				poolId = arg_23_0.selectPoolId_,
				heroIdList = var_23_2.optional_detail,
				heroId = var_23_6
			})
		elseif var_23_2.pool_selected_type == 9 and arg_23_0.selectPoolId_ == DrawConst.WEAPON_SERVANT_POOL_ID then
			arg_23_0:Go("/drawSelect", {
				poolID = arg_23_0.selectPoolId_
			})
		elseif var_23_2.pool_selected_type == 9 and arg_23_0.selectPoolId_ ~= DrawConst.WEAPON_SERVANT_POOL_ID then
			arg_23_0:Go("/drawGodEaterSelect", {
				poolID = arg_23_0.selectPoolId_
			})
		elseif var_23_2.pool_selected_type == 1 then
			local var_23_7 = table.indexof(var_23_2.optional_lists_poolId, arg_23_0.showId)

			if var_23_7 == false then
				return
			end

			local var_23_8 = var_23_2.optional_detail[var_23_7]

			arg_23_0:Go("/newbieDrawHeroSelect", {
				poolId = arg_23_0.selectPoolId_,
				heroIdList = var_23_2.optional_detail,
				heroId = var_23_8
			})
		end
	end
end

function var_0_0.SetupActivityPool(arg_24_0)
	arg_24_0.poolToggles_ = {}

	local var_24_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.DRAW] or {}

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if ActivityData:GetActivityIsOpen(iter_24_1) then
			local var_24_1 = ActivityDrawPoolCfg[iter_24_1]

			if var_24_1 then
				for iter_24_2, iter_24_3 in ipairs(var_24_1.config_list) do
					if DrawPoolCfg[iter_24_3].pool_show_type == 8 then
						if not DrawData:GetNewbieChooseDrawFlag() then
							table.insert(arg_24_0.poolToggles_, iter_24_3)

							arg_24_0.poolActivitys_[iter_24_3] = iter_24_1
						end
					else
						table.insert(arg_24_0.poolToggles_, iter_24_3)

						arg_24_0.poolActivitys_[iter_24_3] = iter_24_1
					end
				end
			end
		end
	end

	if #arg_24_0.poolToggles_ == 0 then
		Debugger.LogError("draw error pools is empty")
	end

	table.sort(arg_24_0.poolToggles_, function(arg_25_0, arg_25_1)
		return DrawPoolCfg[arg_25_0].order < DrawPoolCfg[arg_25_1].order
	end)
	arg_24_0:ClearLeftToggle()
	arg_24_0:InitTree()
	arg_24_0:InitPoolNew()
	arg_24_0:InitLeftToggle()
end

function var_0_0.InitPoolNew(arg_26_0)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.poolToggles_) do
		if DrawData:GetPoolIsNew(iter_26_1) == 1 then
			arg_26_0:SetNewTag(true, iter_26_1)
		end
	end
end

function var_0_0.HidePoolNewTag(arg_27_0, arg_27_1, arg_27_2)
	if arg_27_0.selectPoolId_ ~= -1 and arg_27_0.selectPoolId_ ~= nil and arg_27_0.selectPoolId_ ~= arg_27_1 and DrawData:GetPoolIsNew(arg_27_0.selectPoolId_) == 1 or arg_27_2 then
		DrawAction.HidePoolNewTag(arg_27_0.selectPoolId_, handler(arg_27_0, arg_27_0.SetNewTag))
	end
end

function var_0_0.SetNewTag(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0.poolIDToIndexTable[arg_28_2] then
		return
	end

	if not arg_28_0.tree_ then
		return
	end

	local var_28_0 = arg_28_0.poolIDToIndexTable[arg_28_2][1]
	local var_28_1 = arg_28_0.poolIDToIndexTable[arg_28_2][2]
	local var_28_2 = arg_28_0.tree_:GetGroupRedPointContainerById(var_28_0)
	local var_28_3 = arg_28_0.tree_:GetItemRedPointContainerById(var_28_0, arg_28_2)

	if var_28_2 == nil or var_28_3 == nil then
		return
	end

	if arg_28_1 then
		arg_28_0.groupRedPoint[var_28_0] = arg_28_0.groupRedPoint[var_28_0] or {}
		arg_28_0.groupRedPoint[var_28_0][var_28_1] = arg_28_2
	else
		arg_28_0.groupRedPoint[var_28_0][var_28_1] = nil

		if not next(arg_28_0.groupRedPoint[var_28_0]) then
			arg_28_0.groupRedPoint[var_28_0] = nil
		end

		if not next(arg_28_0.groupRedPoint) then
			manager.redPoint:setTip(RedPointConst.DRAW, 0, RedPointStyle.SHOW_NEW_TAG)

			arg_28_0.groupRedPoint = {}
		end
	end

	local var_28_4 = arg_28_0.groupRedPoint[var_28_0] and next(arg_28_0.groupRedPoint[var_28_0])

	manager.redPoint:setRedPoint({
		display = var_28_2
	}, var_28_4, RedPointStyle.SHOW_NEW_TAG)
	manager.redPoint:setRedPoint({
		display = var_28_3
	}, arg_28_1, RedPointStyle.SHOW_NEW_TAG)
end

function var_0_0.InitLeftToggle(arg_29_0)
	local var_29_0 = arg_29_0.tree_:GetData().groupDatas
	local var_29_1 = 1

	for iter_29_0 = 0, var_29_0.Count - 1 do
		local var_29_2 = var_29_0[iter_29_0].id
		local var_29_3 = arg_29_0.tree_:GetGroupGameObjectById(var_29_2)

		arg_29_0.leftGroupItemList_[iter_29_0 + 1] = arg_29_0.leftGroupItemList_[iter_29_0 + 1] or DrawLeftToggleGroupItem.New(var_29_3)

		local var_29_4 = {}
		local var_29_5 = var_29_0[iter_29_0].itemDatas

		for iter_29_1 = 0, var_29_5.Count - 1 do
			local var_29_6 = var_29_5[iter_29_1].id
			local var_29_7 = arg_29_0.tree_:GetItemGameObjectById(var_29_2, var_29_6)

			arg_29_0.leftToggleItemList_[var_29_1] = arg_29_0.leftToggleItemList_[var_29_1] or DrawLeftToggleItem.New(var_29_7)

			arg_29_0.leftToggleItemList_[var_29_1]:SetData(var_29_6)

			var_29_1 = var_29_1 + 1

			table.insert(var_29_4, var_29_6)
		end

		arg_29_0.leftGroupItemList_[iter_29_0 + 1]:SetData(var_29_4)
	end
end

function var_0_0.ClearLeftToggle(arg_30_0)
	for iter_30_0 = #arg_30_0.leftToggleItemList_, 1, -1 do
		arg_30_0.leftToggleItemList_[iter_30_0]:Dispose()

		arg_30_0.leftToggleItemList_[iter_30_0] = nil
	end

	for iter_30_1 = #arg_30_0.leftGroupItemList_, 1, -1 do
		arg_30_0.leftGroupItemList_[iter_30_1]:Dispose()

		arg_30_0.leftGroupItemList_[iter_30_1] = nil
	end
end

function var_0_0.RefreshActivityPool(arg_31_0)
	arg_31_0:SetupActivityPool()

	if not table.indexof(arg_31_0.poolToggles_, arg_31_0.selectPoolId_) then
		arg_31_0.selectPoolId_ = arg_31_0.poolToggles_[1]

		arg_31_0:RefreshUI()
	end
end

function var_0_0.SetSelectPool(arg_32_0, arg_32_1)
	if not table.indexof(arg_32_0.poolToggles_, arg_32_1) then
		return
	end

	if arg_32_1 == arg_32_0.selectPoolId_ then
		return
	end

	arg_32_0.selectPoolId_ = arg_32_1
	arg_32_0.params_.poolId = arg_32_1

	arg_32_0:RefreshUI()
end

function var_0_0.ShowBar(arg_33_0)
	local var_33_0 = DrawTools.GetCostTicketList(arg_33_0.selectPoolId_)
	local var_33_1 = DrawTools.GetActivityCostTicket(arg_33_0.selectPoolId_)
	local var_33_2 = {
		BACK_BAR,
		HOME_BAR,
		NAVI_BAR
	}

	if var_33_1 == 0 or ItemTools.IsItemExpiredByItemId(var_33_1) then
		for iter_33_0, iter_33_1 in ipairs(var_33_0) do
			table.insert(var_33_2, iter_33_1)
		end

		table.insertto(var_33_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_33_2)
	elseif var_33_1 == InviteData:GetDataByPara("drawItemId") then
		for iter_33_2, iter_33_3 in ipairs(var_33_0) do
			table.insert(var_33_2, iter_33_3)
		end

		table.insertto(var_33_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_33_2)
	else
		if ItemTools.getItemNum(var_33_1) > 0 then
			table.insert(var_33_2, var_33_1)
		end

		for iter_33_4, iter_33_5 in ipairs(var_33_0) do
			table.insert(var_33_2, iter_33_5)
		end

		table.insertto(var_33_2, {
			CurrencyConst.CURRENCY_TYPE_DIAMOND,
			CurrencyConst.GetPlatformDiamondId()
		})
		manager.windowBar:SwitchBar(var_33_2)

		if ItemTools.getItemNum(var_33_1) > 0 then
			manager.windowBar:SetBarCanAdd(var_33_1, false)
			manager.windowBar:SetBarCanClick(var_33_1, true)
		end
	end

	manager.windowBar:RegistBackCallBack(function()
		DrawData:ResetServantRedPoint()
		arg_33_0:Back()
	end)
	manager.windowBar:RegistHomeCallBack(function()
		DrawData:ResetServantRedPoint()
		gameContext:Go("/home", nil, nil, true)
	end)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)

	for iter_33_6, iter_33_7 in pairs(var_33_0) do
		manager.windowBar:SetBarCanAdd(iter_33_7, false)
		manager.windowBar:SetBarCanClick(iter_33_7, true)
	end
end

function var_0_0.RefreshUI(arg_36_0)
	local var_36_0 = arg_36_0.selectPoolId_
	local var_36_1 = DrawPoolCfg[var_36_0]
	local var_36_2 = var_36_0

	arg_36_0:UpdateFirstSelectButton(true)

	if var_36_1.pool_selected_type == 9 then
		local var_36_3 = DrawData:GetPollUpID(var_36_0)

		if var_36_3 == 0 then
			arg_36_0:UpdateFirstSelectButton(false)

			var_36_2 = -1
		else
			var_36_2 = var_36_3
		end
	elseif var_36_1.pool_selected_type == 2 or var_36_1.pool_selected_type == 8 then
		if DrawData:GetPollUpID(var_36_0) == 0 then
			local var_36_4 = var_36_1.pool_change
			local var_36_5 = DrawData:GetPoolUpTimes(var_36_0)

			if var_36_4 == 0 or var_36_5 < var_36_4 then
				arg_36_0.timer = TimeTools.StartAfterSeconds(0.02, function(arg_37_0)
					if arg_36_0.timer == nil then
						return
					end

					if DrawData:IsOnePrefabPool(arg_37_0) then
						arg_36_0:UpdateFirstSelectButton(false)
					else
						arg_36_0:Go("/drawHeroSelect", {
							poolId = arg_36_0.selectPoolId_
						})
					end

					arg_36_0.timer = nil
				end, {
					var_36_0
				})
			end
		end
	elseif var_36_1.pool_selected_type == 1 and DrawData:GetPollUpID(var_36_0) == 0 then
		arg_36_0.timer = TimeTools.StartAfterSeconds(0.02, function(arg_38_0)
			if arg_36_0.timer == nil then
				return
			end

			if DrawData:IsOnePrefabPool(arg_38_0) then
				arg_36_0:UpdateFirstSelectButton(false)
			end

			arg_36_0.timer = nil
		end, {
			var_36_0
		})
	end

	if var_36_1.pool_type == 8 then
		arg_36_0.tenOneKeyGetText_.text = string.format(GetTips("DRAW_POOL_SCREEN_TYPE_2"), string.format(GetTips("NUM_" .. math.min(40 - DrawData:GetPoolDrawTimes(var_36_0), 10))))
		arg_36_0.tips3Text_.text = GetTips("DRAW_POOL_SCREEN_TYPE_3")
		arg_36_0.tenIconText_.text = "x" .. math.min(40 - DrawData:GetPoolDrawTimes(var_36_0), 10)
	else
		arg_36_0.tenOneKeyGetText_.text = string.format(GetTips("DRAW_POOL_SCREEN_TYPE_2"), GetTips("NUM_10"))
		arg_36_0.tenIconText_.text = "x10"
	end

	if arg_36_0.curPoolObject then
		if arg_36_0.curPoolObject:GetShowId() == var_36_2 then
			arg_36_0.curPoolObject:Refresh(var_36_2)
			arg_36_0:RefreshRightPanel()

			return
		else
			arg_36_0.curPoolObject:SetActive(false)
		end
	end

	arg_36_0.showId = var_36_2

	if not arg_36_0.poolObjects_[var_36_2] then
		if var_36_0 == 31010 then
			arg_36_0.poolObjects_[var_36_2] = DrawSelectPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
		elseif var_36_1.pool_type == 1 then
			if DrawData:IsOnePrefabPool(var_36_0) then
				arg_36_0.poolObjects_[var_36_2] = DrawNormalSelectPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			else
				arg_36_0.poolObjects_[var_36_2] = DrawNormalPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			end
		elseif var_36_1.pool_selected_type == 2 or var_36_1.pool_selected_type == 8 then
			if DrawData:IsOnePrefabPool(var_36_0) then
				if var_36_1.pool_selected_type == 8 then
					arg_36_0.poolObjects_[var_36_2] = NewbieDrawSelectPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
				else
					arg_36_0.poolObjects_[var_36_2] = DrawSelectPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
				end
			else
				arg_36_0.poolObjects_[var_36_2] = DrawUpPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			end
		elseif var_36_1.pool_selected_type == 9 and arg_36_0.selectPoolId_ == DrawConst.WEAPON_SERVANT_POOL_ID then
			if DrawData:GetPollUpID(var_36_0) == var_36_2 then
				arg_36_0.poolObjects_[var_36_2] = DrawServantPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			else
				arg_36_0.poolObjects_[var_36_2] = DrawServantNormalPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			end
		elseif var_36_1.pool_selected_type == 9 and arg_36_0.selectPoolId_ ~= DrawConst.WEAPON_SERVANT_POOL_ID then
			if DrawData:GetPollUpID(var_36_0) == var_36_2 then
				arg_36_0.poolObjects_[var_36_2] = GodEaterDrawServantPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			else
				arg_36_0.poolObjects_[var_36_2] = GodEaterDrawServantNormalPool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
			end
		else
			arg_36_0.poolObjects_[var_36_2] = DrawBasePool.New(arg_36_0.poolcontentTrs_, var_36_0, var_36_2)
		end
	end

	arg_36_0.curPoolObject = arg_36_0.poolObjects_[var_36_2]

	arg_36_0.curPoolObject:Refresh(var_36_2)
	arg_36_0.curPoolObject:SetActive(true)
	arg_36_0:OnRequestRecord()
	arg_36_0:RefreshRightPanel()

	local var_36_6 = arg_36_0.poolActivitys_[var_36_0]

	if var_36_6 and ActivityData:GetActivityData(var_36_6) then
		local var_36_7 = ActivityData:GetActivityData(var_36_6).stopTime

		arg_36_0:SetCountDown(true, var_36_7)
	else
		arg_36_0:SetCountDown(false)
	end

	arg_36_0:ShowBar()

	if #DrawTools.GetRechargeDrawGiftList(var_36_0) == 0 then
		arg_36_0.rechargeShopGiftController:SetSelectedIndex(0)
	else
		arg_36_0.rechargeShopGiftController:SetSelectedIndex(1)
	end

	arg_36_0:UpdateFreeDraw()
	arg_36_0:UpdateBonus()
end

function var_0_0.OnRequestRecord(arg_39_0)
	local var_39_0 = DrawData:GetDrawRecord(arg_39_0.selectPoolId_)
	local var_39_1 = DrawPoolCfg[arg_39_0.selectPoolId_]

	if var_39_0 then
		local var_39_2 = var_39_0.ssr_draw_times
		local var_39_3 = var_0_2[var_39_1.pool_show_type]

		arg_39_0.drawOutLineTxt_.text = var_39_2
		arg_39_0.drawTxt_.text = "/" .. (var_0_3[var_39_3] or "70")
		arg_39_0.drawAllTxt_.text = var_39_2
		arg_39_0.drawOutLineTxt1_.text = var_39_2
		arg_39_0.drawTxt1_.text = "/" .. (var_0_3[var_39_3] or "70")
		arg_39_0.drawAllTxt1_.text = var_39_2
	else
		DrawAction.RequestRecord(arg_39_0.selectPoolId_)
	end
end

function var_0_0.UpdateFreeDraw(arg_40_0)
	local var_40_0 = InviteData:GetDataByPara("poolID")
	local var_40_1 = InviteData:GetDataByPara("drawItemId")
	local var_40_2 = DrawPoolCfg[var_40_0]

	SetActive(arg_40_0.freeGo_, arg_40_0.selectPoolId_ == var_40_0 and ItemTools.getItemNum(var_40_1) > 0)

	if var_40_2 == nil then
		return
	end

	local var_40_3 = arg_40_0.tree_:GetGroupRedPointContainerById(var_0_2[var_40_2.pool_show_type])

	if var_40_3 == nil then
		return
	end

	manager.redPoint:setRedPoint({
		display = var_40_3
	}, ItemTools.getItemNum(var_40_1) > 0)

	local var_40_4 = arg_40_0.tree_:GetItemRedPointContainerById(var_0_2[var_40_2.pool_show_type], var_40_0)

	if var_40_4 == nil then
		return
	end

	manager.redPoint:setRedPoint({
		display = var_40_4
	}, ItemTools.getItemNum(var_40_1) > 0)
end

function var_0_0.RefreshRightPanel(arg_41_0)
	if not arg_41_0.curPoolObject then
		return
	end

	if arg_41_0.curPoolObject:ShowRightPanel() then
		local var_41_0 = DrawTools.GetActivityCostTicket(arg_41_0.selectPoolId_)

		if var_41_0 == 0 or ItemTools.IsItemExpiredByItemId(var_41_0) or ItemTools.getItemNum(var_41_0) == 0 then
			local var_41_1 = DrawTools.GetCostTicket(arg_41_0.selectPoolId_, 1)

			arg_41_0.iconOnce_.sprite = ItemTools.getItemSprite(var_41_1)

			local var_41_2 = DrawTools.GetCostTicket(arg_41_0.selectPoolId_, 10)

			arg_41_0.iconTenth_.sprite = ItemTools.getItemSprite(var_41_2)
			arg_41_0.one_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
			arg_41_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
		else
			arg_41_0.iconOnce_.sprite = ItemTools.getItemSprite(var_41_0)
			arg_41_0.one_cost_type = DrawConst.DRAW_COST_TYPE.ACTIVITY

			if ItemTools.getItemNum(var_41_0) < 10 then
				local var_41_3 = DrawTools.GetCostTicket(arg_41_0.selectPoolId_, 10)

				arg_41_0.iconTenth_.sprite = ItemTools.getItemSprite(var_41_3)
				arg_41_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.COMMON
			else
				arg_41_0.iconTenth_.sprite = ItemTools.getItemSprite(var_41_0)
				arg_41_0.ten_cost_type = DrawConst.DRAW_COST_TYPE.ACTIVITY
			end
		end

		arg_41_0.showRightController:SetSelectedIndex(1)
	else
		arg_41_0.showRightController:SetSelectedIndex(0)
	end
end

function var_0_0.UpdateBonus(arg_42_0)
	local var_42_0 = arg_42_0.selectPoolId_
	local var_42_1 = DrawTools.GetDrawBonusActivityIDList()
	local var_42_2 = DrawTools.HasDrawBonusPoolID(var_42_1, var_42_0)

	if var_42_2 then
		if arg_42_0.bonusView_ == nil then
			arg_42_0.bonusView_ = DrawRightBonusItem.New(arg_42_0.rightGo_)

			arg_42_0.bonusView_:OnEnter()
		end

		arg_42_0.bonusView_:SetData(var_42_2, arg_42_0.selectPoolId_)
	elseif arg_42_0.bonusView_ then
		arg_42_0.bonusView_:Show(false)
	end
end

function var_0_0.DestroyPoolGo(arg_43_0)
	for iter_43_0, iter_43_1 in pairs(arg_43_0.poolObjects_) do
		iter_43_1:Dispose()
		Object.Destroy(iter_43_1.gameObject_)
	end

	arg_43_0.poolObjects_ = {}
end

function var_0_0.SetCountDown(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0.activityEndTime_ = arg_44_2

	if arg_44_1 then
		if not arg_44_0.activityTimer_ then
			arg_44_0.activityTimer_ = Timer.New(handler(arg_44_0, arg_44_0.UpdateCountDownText), 1, -1)
		end

		arg_44_0:UpdateCountDownText()
		arg_44_0.curPoolObject:ShowCountDownText(true)
		arg_44_0.activityTimer_:Start()
	else
		arg_44_0.curPoolObject:ShowCountDownText(false)

		if arg_44_0.activityTimer_ then
			arg_44_0.activityTimer_:Stop()
		end
	end
end

function var_0_0.UpdateCountDownText(arg_45_0)
	arg_45_0.curPoolObject:SetCountDownText(arg_45_0.activityEndTime_)
end

function var_0_0.RemoveCountDownTimer(arg_46_0)
	if arg_46_0.activityTimer_ then
		arg_46_0.activityTimer_:Stop()

		arg_46_0.activityTimer_ = nil
	end
end

function var_0_0.DrawCheck(arg_47_0, arg_47_1)
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
				arg_47_0:StartDraw(arg_47_1)
			end
		})
	else
		arg_47_0:StartDraw(arg_47_1)
	end
end

function var_0_0.StartDraw(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0.selectPoolId_
	local var_50_1 = DrawPoolCfg[var_50_0]
	local var_50_2
	local var_50_3
	local var_50_4
	local var_50_5

	if DrawConst.DRAW_TYPE.ONE == arg_50_1 then
		var_50_2 = arg_50_0.one_cost_type
		var_50_3 = 1
		var_50_5 = 1
	elseif DrawConst.DRAW_TYPE.TEN == arg_50_1 then
		var_50_2 = arg_50_0.ten_cost_type
		var_50_3 = 10

		if var_50_1.discount > 0 then
			var_50_3 = var_50_3 * var_50_1.discount / 100
		end

		var_50_5 = 10
	else
		var_50_2 = arg_50_0.ten_cost_type
		var_50_3 = arg_50_1

		if var_50_1.discount > 0 then
			var_50_3 = var_50_3 * var_50_1.discount / 100
		end

		var_50_5 = arg_50_1
	end

	local var_50_6 = 0

	if DrawConst.DRAW_COST_TYPE.COMMON == var_50_2 then
		var_50_6 = DrawTools.GetCostTicket(var_50_0, var_50_3)

		local var_50_7 = ItemTools.getItemNum(var_50_6)

		if var_50_7 < var_50_3 then
			local var_50_8 = var_50_3 - var_50_7

			arg_50_0.shopDrawInfo = {
				poolId = var_50_0,
				draw_type = arg_50_1,
				cost_id = var_50_6,
				cost_num = var_50_3
			}

			SDKTools.SendPaymentMessageToSDK("payment_touch", {
				payment_gacha_diamond = "{" .. ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_DIAMOND) .. "," .. CurrencyData:GetRechargeDiamond()
			})
			arg_50_0:ShowBuyView(var_50_8, var_50_1)

			return
		end
	elseif DrawConst.DRAW_COST_TYPE.ACTIVITY == var_50_2 then
		var_50_6 = DrawTools.GetActivityCostTicket(var_50_0)

		if ItemTools.IsItemExpiredByItemId(var_50_6) then
			ShowTips("TIP_EXPIRED")
			arg_50_0:RefreshActivityPool()
			arg_50_0:RefreshUI()

			return
		end

		if var_50_3 > ItemTools.getItemNum(var_50_6) then
			error("draw activity tick num error")

			return
		end
	end

	if not SDKTools.GetIsOverSea() and var_50_5 + DrawData:GetTodayDrawTimes() > GameSetting.draw_num_max.value[1] then
		ShowTips("DRAW_NUM_MAX")

		return
	end

	DrawData:SetNewHeroFlag(false)

	local var_50_9 = InviteData:GetDataByPara("drawItemId")

	if _G.SkipTip["DrawSkipTip" .. arg_50_0.selectPoolId_] or var_50_9 == var_50_6 then
		manager.achievementTips:SetShowFlag(false)
		DrawAction.GoToDraw(arg_50_0.selectPoolId_, arg_50_1, var_50_6, var_50_3)
	else
		JumpTools.OpenPageByJump("popCostItem", {
			costId = var_50_6,
			itemId = MaterialConst.MYTHIC_REFRESH_ITEM_ID,
			popCostCallBack = function()
				manager.achievementTips:SetShowFlag(false)
				DrawAction.GoToDraw(arg_50_0.selectPoolId_, arg_50_1, var_50_6, var_50_3)
			end,
			ToggleCallback = function(arg_52_0)
				_G.SkipTip["DrawSkipTip" .. arg_50_0.selectPoolId_] = arg_52_0
			end,
			content = string.format(GetTips("DRAW_TIMES"), ItemTools.getItemName(var_50_6), var_50_3, var_50_3)
		})
	end
end

function var_0_0.ShowBuyView(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = getShopCfg(arg_53_2.exchange_id)
	local var_53_1 = var_53_0.cost * arg_53_1
	local var_53_2 = {
		id = DrawTools.GetCostTicket(arg_53_2.id, arg_53_1),
		num = arg_53_1
	}
	local var_53_3 = {}
	local var_53_4 = {}
	local var_53_5 = math.min(ItemTools.getItemNum(var_53_0.cost_id), var_53_1)

	if var_53_5 > 0 then
		var_53_3 = {
			id = var_53_0.cost_id,
			num = var_53_5
		}
	end

	local var_53_6 = var_53_1 - var_53_5

	if var_53_6 > 0 then
		var_53_4 = {
			id = CurrencyConst.GetPlatformDiamondId(),
			num = var_53_6
		}
	end

	if not var_53_3.id and var_53_4.id then
		var_53_3 = var_53_4
		var_53_4 = {}
	end

	JumpTools.OpenPageByJump("itemBuy", {
		title = GetTips("TREASURE_TICKET_TO_BUY"),
		item1 = var_53_2,
		item2 = var_53_3,
		item3 = var_53_4,
		OkCallback = function()
			local var_54_0 = CurrencyData:GetRechargeDiamond()

			if var_53_6 > 0 and var_54_0 < var_53_6 then
				if AreaDifferenceCfg[GameToSDK.CURRENT_SERVER].payment == 1 then
					ShopTools.DiamondEnoughMessageBox()
				else
					ShowTips("ERROR_ITEM_NOT_ENOUGH_CURRENCY")
				end

				return
			end

			ShopAction.BuyItem({
				{
					goodID = arg_53_2.exchange_id,
					buyNum = arg_53_1
				}
			}, nil, PayConst.BUY_SOURCE_DRAW_POPUP)
		end,
		CancelCallback = function()
			arg_53_0.shopDrawInfo = nil
		end
	})
end

function var_0_0.OnShopBuyResult(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	if arg_56_1 == 0 then
		if arg_56_0.shopDrawInfo == nil then
			return
		end

		arg_56_0:Back()
		manager.achievementTips:SetShowFlag(false)

		local var_56_0 = arg_56_0.shopDrawInfo.poolId
		local var_56_1 = arg_56_0.poolActivitys_[var_56_0]

		if var_56_1 and ActivityData:GetActivityIsOpen(var_56_1) then
			DrawAction.GoToDraw(arg_56_0.shopDrawInfo.poolId, arg_56_0.shopDrawInfo.draw_type, arg_56_0.shopDrawInfo.cost_id, arg_56_0.shopDrawInfo.cost_num)
		end

		arg_56_0.shopDrawInfo = nil
	else
		if arg_56_1 then
			ShowTips(arg_56_1)
		end

		arg_56_0.shopDrawInfo = nil
	end
end

function var_0_0.OnGoToDraw(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_1.result == 0 then
		arg_57_0.drawProcessFlag_ = true

		local var_57_0 = {}
		local var_57_1 = 0
		local var_57_2 = arg_57_1.item

		for iter_57_0, iter_57_1 in ipairs(var_57_2) do
			DrawData:TodayDrawTimesChange(1)
			table.insert(var_57_0, formatReward(iter_57_1))

			local var_57_3 = ItemCfg[iter_57_1.id]
			local var_57_4 = var_57_3 and var_57_3.display_rare or 0

			if var_57_1 < var_57_4 then
				var_57_1 = var_57_4
			end
		end

		arg_57_0:RefreshUI()
		manager.windowBar:HideBar()

		arg_57_0.itemList_ = var_57_0

		arg_57_0:CheckInteract(var_57_1)
	else
		ShowTips(arg_57_1.result)
		arg_57_0:RefreshActivityPool()
		arg_57_0.tree_:SelectItem(arg_57_0.poolIDToIndexTable[arg_57_0.selectPoolId_][1], arg_57_0.poolIDToIndexTable[arg_57_0.selectPoolId_][2])
		manager.achievementTips:SetShowFlag(true)
	end

	arg_57_0.shopDrawInfo = nil
end

function var_0_0.JumpToReward(arg_58_0)
	arg_58_0.drawProcessFlag_ = false

	manager.achievementTips:SetShowFlag(true)

	local var_58_0 = #arg_58_0.itemList_

	if var_58_0 > 0 then
		local var_58_1 = {}
		local var_58_2 = {}

		for iter_58_0, iter_58_1 in ipairs(arg_58_0.itemList_) do
			local var_58_3 = setmetatable({
				index = iter_58_0
			}, {
				__index = iter_58_1
			})

			if ItemCfg[iter_58_1.id].type == ItemConst.ITEM_TYPE.HERO then
				var_58_3.newTag = true
				var_58_2[iter_58_1.id] = true

				DrawData:SetNewHeroFlag(true)
			elseif ItemCfg[iter_58_1.id].type == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
				var_58_3.newTag = IllustratedData:GetNewObtainedServant(iter_58_1.id) ~= nil

				if var_58_3.newTag and ItemCfg[iter_58_1.id].rare >= 5 then
					DrawData:SetServantRedPoint(arg_58_0.selectPoolId_, 1)
				end
			end

			table.insert(var_58_1, var_58_3)
		end

		local var_58_4 = 0

		for iter_58_2, iter_58_3 in ipairs(arg_58_0.itemList_) do
			local var_58_5 = iter_58_3.id

			if ItemCfg[var_58_5].type == ItemConst.ITEM_TYPE.HERO or ItemCfg[var_58_5].type == ItemConst.ITEM_TYPE.WEAPON_SERVANT or ItemCfg[var_58_5].type == ItemConst.ITEM_TYPE.HERO_PIECE then
				local var_58_6 = var_58_5

				if ItemWillConvert(iter_58_3) then
					var_58_6 = iter_58_3.convert_from.id
				end

				local var_58_7 = ItemCfg[var_58_6].rare

				for iter_58_4, iter_58_5 in ipairs(GameSetting.currency_for_draw.value) do
					if var_58_7 == iter_58_5[1] then
						var_58_4 = var_58_4 + iter_58_5[2]
					end
				end
			end
		end

		if var_58_0 ~= 1 then
			gameContext:Go("drawTenTimesReward", {
				reward = var_58_1,
				callBack_afterTen = function()
					getReward({
						{
							id = ItemConst.CURRENCY_FOR_DRAW,
							num = var_58_4
						}
					}, nil, function()
						if DrawPoolCfg[arg_58_0.selectPoolId_].pool_type == 8 and DrawData:GetNewbieChooseDrawFlag() then
							ShowTips("DRAW_POOL_SCREEN_TYPE_1")
							arg_58_0:SetupActivityPool()

							arg_58_0.tree_.tree_.data.groupDatas[1].defaultIndex = 1

							arg_58_0.tree_:SelectItem(1, 1)
						end
					end)
					arg_58_0:ShowBar()
				end
			})
		else
			if DrawPoolCfg[arg_58_0.selectPoolId_].pool_type == 8 and DrawData:GetNewbieChooseDrawFlag() then
				ShowTips("DRAW_POOL_SCREEN_TYPE_1")
				arg_58_0:SetupActivityPool()

				arg_58_0.tree_.tree_.data.groupDatas[1].defaultIndex = 1

				arg_58_0.tree_:SelectItem(1, 1)
			end

			arg_58_0:ShowBar()
		end
	end

	arg_58_0:UpdateFreeDraw()
	arg_58_0:OnRequestRecord()
end

function var_0_0.SkipMovie(arg_61_0)
	arg_61_0.criplayer_.statusChangeCallback = nil

	if arg_61_0.moviePlaying then
		arg_61_0.criMovie_:Stop()
	end

	arg_61_0:DoNextNode(true)
end

local function var_0_5(arg_62_0)
	local var_62_0 = {
		__index = arg_62_0
	}
	local var_62_1 = ItemWillConvert(arg_62_0) and arg_62_0.convert_from.id or arg_62_0.id

	print("BuildShowItemInfo", arg_62_0.convert_from.id, arg_62_0.id)

	local var_62_2 = ItemCfg[var_62_1]
	local var_62_3 = var_62_2.type
	local var_62_4 = {}

	if var_62_3 == ItemConst.ITEM_TYPE.HERO or var_62_3 == ItemConst.ITEM_TYPE.WEAPON_SERVANT then
		local var_62_5 = var_62_2.rare

		for iter_62_0, iter_62_1 in ipairs(GameSetting.currency_for_draw.value) do
			if var_62_5 == iter_62_1[1] then
				var_62_4.draw_rebate = iter_62_1[2]
			end
		end
	end

	return setmetatable(var_62_4, var_62_0)
end

function var_0_0.DoNextNode(arg_63_0, arg_63_1)
	arg_63_0.panel_.transform.localPosition = Vector2(0, 0)

	local var_63_0 = #arg_63_0.itemList_

	if arg_63_1 and var_63_0 > 1 then
		local var_63_1 = {}

		for iter_63_0, iter_63_1 in ipairs(arg_63_0.itemList_) do
			if ItemCfg[iter_63_1.id].type == ItemConst.ITEM_TYPE.HERO and ObtainHeroMovieCfg[iter_63_1.id] and not (getData(DrawConst.WATCH_TAG, tostring(iter_63_1.id)) or false) then
				table.insert(var_63_1, var_0_5(iter_63_1))
			end
		end

		if #var_63_1 == 0 then
			arg_63_0:JumpToReward()
		else
			local var_63_2 = handler(arg_63_0, arg_63_0.JumpToReward)
			local var_63_3 = {
				doNextHandler = var_63_2,
				skipHandler = var_63_2,
				itemList = var_63_1
			}

			arg_63_0:Go("obtainView", var_63_3)
		end

		return
	end

	if var_63_0 > 0 then
		local var_63_4 = {}

		for iter_63_2, iter_63_3 in ipairs(arg_63_0.itemList_) do
			local var_63_5 = ItemWillConvert(iter_63_3) and iter_63_3.convert_from.id or iter_63_3.id
			local var_63_6 = ItemCfg[var_63_5].type

			if var_63_0 == 1 and var_63_6 == ItemConst.ITEM_TYPE.HERO and ItemWillConvert(iter_63_3) then
				DrawData:SetNewHeroFlag(true)
			end

			table.insert(var_63_4, var_0_5(iter_63_3))
		end

		local var_63_7 = {
			doNextHandler = handler(arg_63_0, arg_63_0.JumpToReward),
			skipHandler = handler(arg_63_0, arg_63_0.JumpToReward),
			itemList = var_63_4
		}

		arg_63_0:Go("obtainView", var_63_7)
	else
		arg_63_0:JumpToReward()
	end
end

function var_0_0.PlayMovie(arg_64_0, arg_64_1)
	local var_64_0 = manager.audio:GetMusicVolume()

	arg_64_0.criplayer_:SetVolume(var_64_0)
	arg_64_0.criMovie_:Play()

	arg_64_0.criplayer_.statusChangeCallback = handler(arg_64_0, arg_64_0.CirMovieStatusChange)
	arg_64_0.moviePlaying = true

	if arg_64_1 >= 5 then
		manager.audio:SetObtainGoldSelectorLabel()
	elseif arg_64_1 >= 4 then
		manager.audio:SetObtainPurpleSelectorLabel()
	else
		manager.audio:SetObtainBlueSelectorLabel()
	end

	manager.audio:PlayEffect("ui_system_search", "search_animation", "")
	SetActive(arg_64_0.movieGo_, true)
end

function var_0_0.CirMovieStatusChange(arg_65_0, arg_65_1)
	local var_65_0 = tostring(arg_65_1)

	if var_65_0 == "PlayEnd" or var_65_0 == "Stop" then
		arg_65_0:DoNextNode(false)
	end
end

function var_0_0.StopMovie(arg_66_0)
	arg_66_0.criplayer_.statusChangeCallback = nil
	arg_66_0.moviePlaying = false

	SetActive(arg_66_0.movieGo_, false)
end

function var_0_0.SkipInteract(arg_67_0)
	SetActive(arg_67_0.drawInteractGo_, false)

	if arg_67_0.drawInteract.timeline then
		arg_67_0.drawInteract.timeline:Stop()
	end

	arg_67_0:DoNextNode(true)
end

function var_0_0.CheckInteract(arg_68_0, arg_68_1)
	arg_68_0.maxRare = arg_68_1

	if not DrawTools:LevelIsDone() then
		SetForceShowQuanquan(true)

		if arg_68_0.interactTimer then
			arg_68_0.interactTimer:Stop()

			arg_68_0.interactTimer = nil
		end

		arg_68_0.interactTimer = FrameTimer.New(handler(arg_68_0, arg_68_0.WaitInteract), 1, -1)

		arg_68_0.interactTimer:Start()
	else
		arg_68_0:StarInteract()
	end
end

function var_0_0.WaitInteract(arg_69_0)
	if DrawTools:LevelIsDone() then
		SetForceShowQuanquan(false)

		if arg_69_0.interactTimer then
			arg_69_0.interactTimer:Stop()

			arg_69_0.interactTimer = nil
		end

		arg_69_0:StarInteract()
	end
end

function var_0_0.StarInteract(arg_70_0)
	local var_70_0 = arg_70_0.maxRare or 0

	if var_70_0 >= 5 then
		SetFile(arg_70_0.criplayer_, nil, arg_70_0.moviePaths[3])
	elseif var_70_0 >= 4 then
		SetFile(arg_70_0.criplayer_, nil, arg_70_0.moviePaths[2])
	else
		SetFile(arg_70_0.criplayer_, nil, arg_70_0.moviePaths[1])
	end

	local var_70_1

	if var_70_0 >= 5 then
		var_70_1 = GameObject.Find("X102/TC/directors/director_gold")
	elseif var_70_0 >= 4 then
		var_70_1 = GameObject.Find("X102/TC/directors/director_purple")
	else
		var_70_1 = GameObject.Find("X102/TC/directors/director_blue")
	end

	if var_70_1 then
		local var_70_2 = var_70_1:GetComponent("PlayableDirector")

		arg_70_0.drawInteract:Init(var_70_2, handler(arg_70_0, arg_70_0.StopInteract))
		arg_70_0.drawInteract:Reset()

		arg_70_0.panel_.transform.localPosition = Vector2(9999, 9999)

		SetActive(arg_70_0.drawInteractGo_, true)
	else
		arg_70_0:StopInteract()
	end

	if arg_70_0.selectPoolId_ and arg_70_0.selectPoolId_ ~= 0 and arg_70_0.selectPoolId_ ~= -1 then
		arg_70_0:HidePoolNewTag(arg_70_0.selectPoolId_, true)
	end
end

function var_0_0.StopInteract(arg_71_0)
	SetActive(arg_71_0.drawInteractGo_, false)
	arg_71_0:PlayMovie(arg_71_0.maxRare or 0)
end

function var_0_0.Dispose(arg_72_0)
	for iter_72_0, iter_72_1 in ipairs(arg_72_0.leftToggleItemList_) do
		iter_72_1:Dispose()
	end

	arg_72_0.leftToggleItemList_ = nil

	for iter_72_2, iter_72_3 in ipairs(arg_72_0.leftGroupItemList_) do
		iter_72_3:Dispose()
	end

	arg_72_0.leftGroupItemList_ = nil

	if arg_72_0.bonusView_ then
		arg_72_0.bonusView_:Dispose()

		arg_72_0.bonusView_ = nil
	end

	arg_72_0.currencyModifyHandler_ = nil
	arg_72_0.timer = nil

	arg_72_0:DestroyPoolGo()
	arg_72_0.tree_:Dispose()

	arg_72_0.drawHandler_ = nil

	var_0_0.super.Dispose(arg_72_0)
end

function var_0_0.CurrencyModify(arg_73_0)
	arg_73_0:RefreshRightPanel()
end

function var_0_0.UpdateFirstSelectButton(arg_74_0, arg_74_1)
	SetActive(arg_74_0.chooseBtn_.gameObject, not arg_74_1)
	SetActive(arg_74_0.btnOnce_.gameObject, arg_74_1)
	SetActive(arg_74_0.btnTenth_.gameObject, arg_74_1)

	local var_74_0 = DrawPoolCfg[arg_74_0.selectPoolId_]

	arg_74_0.chooseText_.text = GetTips(var_74_0.pool_selected_type == 9 and "DRAW_WEAPON_BUTTON" or "DRAW_CHARACTER_BUTTON")
end

function var_0_0.OnInviteDrawUpdate(arg_75_0)
	arg_75_0:UpdateFreeDraw()
end

function var_0_0.AdaptRight(arg_76_0)
	var_0_0.super.AdaptRight(arg_76_0)

	if var_0_0.VIEW_ADAPT_DISTANCE == arg_76_0.lastAdaptDistance_ then
		return
	end

	if not var_0_0.NEED_ADAPT then
		arg_76_0.btnSkip_.transform.anchoredPosition = Vector3(0, 0, 0)
		arg_76_0.skipInteractBtn_.transform.anchoredPosition = Vector3(0, 0, 0)
	else
		arg_76_0.btnSkip_.transform.anchoredPosition = Vector3(-1 * var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)
		arg_76_0.skipInteractBtn_.transform.anchoredPosition = Vector3(-1 * var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)
	end
end

return var_0_0
