local var_0_0 = class("ActivitySkinDrawMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return ActivitySkinDrawTools.GetMainUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.skinFloorRewardItem_ = {}
	arg_4_0.sceneFloorRewardItem_ = {}
	arg_4_0.typeCon_ = ControllerUtil.GetController(arg_4_0.transform_, "type")
	arg_4_0.drawCon_ = ControllerUtil.GetController(arg_4_0.transform_, "draw")

	arg_4_0:InitActivityData()

	arg_4_0.skinPoolCon_ = {}
	arg_4_0.skinPoolBtn_ = {}
	arg_4_0.skinPoolSelectIcon_ = {}
	arg_4_0.skinPoolUnelectIcon_ = {}

	for iter_4_0, iter_4_1 in ipairs(ActivityLimitedDrawPoolListCfg[arg_4_0.skinPoolID_].main_icon_info) do
		arg_4_0.skinPoolBtn_[iter_4_0] = arg_4_0["skinPoolBtn_" .. iter_4_0]
		arg_4_0.skinPoolSelectIcon_[iter_4_0] = arg_4_0["skinPoolSelectIcon_" .. iter_4_0]
		arg_4_0.skinPoolUnelectIcon_[iter_4_0] = arg_4_0["skinPoolUnelectIcon_" .. iter_4_0]
		arg_4_0.skinPoolCon_[iter_4_0] = ControllerUtil.GetController(arg_4_0.transform_, "skin_" .. iter_4_0)
	end

	arg_4_0.sceneCon_ = ControllerUtil.GetController(arg_4_0.transform_, "scene")
	arg_4_0.criMovie_ = arg_4_0.movieGo_:GetComponent("CriManaMovieControllerForUI")
	arg_4_0.criplayer_ = arg_4_0.criMovie_.player

	arg_4_0.criplayer_:SetMaxPictureDataSize(300000)
end

function var_0_0.InitActivityData(arg_5_0)
	arg_5_0.activityID_ = arg_5_0.params_.activityID
	arg_5_0.activityData_ = ActivityData:GetActivityData(arg_5_0.activityID_)
	arg_5_0.startTime_ = arg_5_0.activityData_.startTime
	arg_5_0.stopTime_ = arg_5_0.activityData_.stopTime
	arg_5_0.cfg_ = ActivityCfg[arg_5_0.activityID_]

	local var_5_0 = arg_5_0.cfg_.sub_activity_list

	arg_5_0.skinDrawActivityID_ = var_5_0[1]
	arg_5_0.sceneDrawActivityID_ = var_5_0[2]
	arg_5_0.taskActiivtyID_ = ActivitySkinDrawTools.GetTaskActivityID(arg_5_0.activityID_)
	arg_5_0.skinPoolID_ = arg_5_0:GetPoolID(arg_5_0.skinDrawActivityID_)
	arg_5_0.scenePoolID_ = arg_5_0:GetPoolID(arg_5_0.sceneDrawActivityID_)
end

function var_0_0.AddUIListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.storyBtn_, nil, function()
		local var_7_0 = ActivitySkinDrawTools.GetStoryID(arg_6_0.activityID_)

		manager.story:StartStoryById(var_7_0, function()
			return
		end)
	end)
	arg_6_0:AddBtnListener(arg_6_0.taskBtn_, nil, function()
		JumpTools.OpenPageByJump("/activitySkinDrawTask", {
			activityID = arg_6_0.activityID_,
			taskActivityID = arg_6_0.taskActiivtyID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.shopBtn_, nil, function()
		local var_10_0 = ActivitySkinDrawTools.GetActivityShopID(arg_6_0.activityID_)

		if not ShopTools.IsShopOpen(var_10_0) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.GoToSystem("/shop", {
			shopId = var_10_0,
			showShops = {
				var_10_0
			}
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
	arg_6_0:AddBtnListener(arg_6_0.pvBtn_, nil, function()
		local var_11_0 = SkinCfg[arg_6_0.skinID_].video_url

		if not var_11_0 or var_11_0 == "" then
			return
		end

		if not SDKTools.IsSDK() then
			Application.OpenURL(var_11_0)
		else
			LuaForUtil.OpenWebView(var_11_0, true, function()
				manager.audio:PauseAll(true)
				print("--->> open webView")
			end, function()
				print("====>>> close webView")
				manager.audio:PauseAll(false)
			end)
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.sceneTrailBtn_, nil, function()
		JumpTools.OpenPageByJump("/scenePreview", {
			sceneID = arg_6_0.sceneID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.infoSkinBtn_, nil, function()
		JumpTools.OpenPageByJump("skinDrawInfo", {
			poolID = arg_6_0.skinPoolID_,
			poolActivityID = arg_6_0.skinDrawActivityID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.infoSceneBtn_, nil, function()
		JumpTools.OpenPageByJump("skinDrawInfo", {
			poolID = arg_6_0.scenePoolID_,
			poolActivityID = arg_6_0.sceneDrawActivityID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.skinSelectBtn_, nil, function()
		arg_6_0.curPoolID_ = arg_6_0.skinPoolID_

		arg_6_0:RefreshCurPool()
	end)
	arg_6_0:AddBtnListener(arg_6_0.sceneSelectBtn_, nil, function()
		arg_6_0.curPoolID_ = arg_6_0.scenePoolID_

		arg_6_0:RefreshCurPool()
	end)
	arg_6_0:AddBtnListener(arg_6_0.oneBtn_, nil, function()
		arg_6_0:DrawCheck(1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.tenBtn_, nil, function()
		arg_6_0:DrawCheck(10)
	end)
	arg_6_0:AddBtnListener(arg_6_0.sceneBtn_, nil, function()
		ShowPopItem(POP_ITEM, {
			arg_6_0.sceneID_
		})
	end)

	for iter_6_0, iter_6_1 in ipairs(ActivityLimitedDrawPoolListCfg[arg_6_0.skinPoolID_].main_icon_info) do
		local var_6_0 = iter_6_1[1]
		local var_6_1 = ActivityLimitedDrawPoolCfg[var_6_0].reward[1][1]

		arg_6_0:AddBtnListener(arg_6_0["skinPoolBtn_" .. iter_6_0], nil, function()
			ShowPopItem(POP_ITEM, {
				var_6_1
			})
		end)
	end
end

function var_0_0.OnEnter(arg_23_0)
	arg_23_0:RefreshUI()
	arg_23_0:RefreshBar()
	arg_23_0:BindRedPoint()
	arg_23_0:CheckSceneDrawed()
end

function var_0_0.RefreshUI(arg_24_0)
	arg_24_0:RefreshMovie()
	arg_24_0:RefreshTime()
	arg_24_0:RefreshPool()
end

function var_0_0.RefreshMovie(arg_25_0)
	arg_25_0.criMovie_:Stop()

	local var_25_0 = ObtainSkinBackgroundMovieCfg[arg_25_0.activityID_]
	local var_25_1 = deepClone(var_25_0.start_path)
	local var_25_2 = ActivitySkinDrawData:GetLastFile(arg_25_0.activityID_)

	if var_25_2 then
		table.remove(var_25_1, table.indexof(var_25_1, var_25_2))
	end

	local var_25_3 = var_25_1[math.random(#var_25_1)]
	local var_25_4 = manager.audio:GetMusicVolume()

	arg_25_0.criplayer_:SetVolume(var_25_4)
	arg_25_0:StopFrameTimer()

	arg_25_0.frameTimer_ = FrameTimer.New(function()
		if tostring(arg_25_0.criplayer_.status) == "Stop" then
			arg_25_0.criplayer_:SetFile(nil, var_25_3, CriMana.Player.SetMode.New)
			ActivitySkinDrawData:SetLastFile(arg_25_0.activityID_, var_25_3)
			arg_25_0.criMovie_:Play()
			arg_25_0:StopFrameTimer()
		end
	end, 1, -1)

	arg_25_0.frameTimer_:Start()
end

function var_0_0.StopFrameTimer(arg_27_0)
	if arg_27_0.frameTimer_ then
		arg_27_0.frameTimer_:Stop()

		arg_27_0.frameTimer_ = nil
	end
end

function var_0_0.RefreshTime(arg_28_0)
	local var_28_0
	local var_28_1 = manager.time:GetServerTime()

	arg_28_0:StopTimer()

	if var_28_1 < arg_28_0.stopTime_ then
		arg_28_0.timeText_.text = manager.time:GetLostTimeStr2(arg_28_0.stopTime_)
		arg_28_0.timer_ = Timer.New(function()
			var_28_0 = arg_28_0.stopTime_ - manager.time:GetServerTime()

			if var_28_0 <= 0 then
				arg_28_0:StopTimer()
				arg_28_0:RefreshTime()
			end
		end, 1, -1)

		arg_28_0.timer_:Start()
	else
		arg_28_0.timeText_.text = GetTips("TIME_OVER")
	end
end

function var_0_0.StopTimer(arg_30_0)
	if arg_30_0.timer_ then
		arg_30_0.timer_:Stop()

		arg_30_0.timer_ = nil
	end
end

function var_0_0.RefreshPool(arg_31_0)
	arg_31_0:RefreshSkinPool()
	arg_31_0:RefreshScenePool()
	arg_31_0:GetCurPoolID()
	arg_31_0:RefreshCurPool()
end

function var_0_0.RefreshSkinPool(arg_32_0)
	arg_32_0.skinLastRewardCnt_ = 0
	arg_32_0.skinTotalRewardCnt_ = 0

	local var_32_0 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[arg_32_0.skinPoolID_] or {}

	for iter_32_0, iter_32_1 in ipairs(var_32_0) do
		local var_32_1 = ActivityLimitedDrawPoolCfg[iter_32_1]

		arg_32_0.skinTotalRewardCnt_ = arg_32_0.skinTotalRewardCnt_ + var_32_1.total

		local var_32_2 = ActivitySkinDrawData:GetDrawInfo(arg_32_0.skinDrawActivityID_, iter_32_1)

		if var_32_2 then
			arg_32_0.skinLastRewardCnt_ = arg_32_0.skinLastRewardCnt_ + var_32_2.num
		else
			arg_32_0.skinLastRewardCnt_ = arg_32_0.skinLastRewardCnt_ + var_32_1.total
		end
	end

	local var_32_3 = ActivityLimitedDrawPoolListCfg[arg_32_0.skinPoolID_].main_icon_info

	for iter_32_2, iter_32_3 in ipairs(var_32_3) do
		local var_32_4 = iter_32_3[1]
		local var_32_5 = ActivityLimitedDrawPoolCfg[var_32_4]
		local var_32_6 = ActivitySkinDrawData:GetDrawInfo(arg_32_0.skinDrawActivityID_, var_32_4)
		local var_32_7 = var_32_6 and var_32_6.num or var_32_5.total

		arg_32_0.skinPoolCon_[iter_32_2]:SetSelectedState(var_32_7 > 0 and "on" or "off")

		local var_32_8 = iter_32_3[2]

		arg_32_0.skinPoolSelectIcon_[iter_32_2].sprite = ItemTools.getItemSprite(var_32_8)
		arg_32_0.skinPoolUnelectIcon_[iter_32_2].sprite = ItemTools.getItemSprite(var_32_8)

		local var_32_9 = var_32_5.reward[1][1]

		if ItemCfg[var_32_9].type == ItemConst.ITEM_TYPE.HERO_SKIN then
			arg_32_0.skinID_ = var_32_9
		end
	end

	local var_32_10 = ActivityLimitedDrawPoolListCfg[arg_32_0.skinPoolID_].icon_info

	for iter_32_4, iter_32_5 in ipairs(var_32_10) do
		if not arg_32_0.skinFloorRewardItem_[iter_32_4] then
			local var_32_11 = Object.Instantiate(arg_32_0.templateItem_, arg_32_0.skinRewardContent_)

			arg_32_0.skinFloorRewardItem_[iter_32_4] = ActivitySkinDrawItem.New(var_32_11)
		end

		SetActive(arg_32_0.skinFloorRewardItem_[iter_32_4].gameObject_, true)
		arg_32_0.skinFloorRewardItem_[iter_32_4]:SetData(arg_32_0.skinDrawActivityID_, iter_32_5)
	end

	for iter_32_6 = #var_32_10 + 1, #arg_32_0.skinFloorRewardItem_ do
		SetActive(arg_32_0.skinFloorRewardItem_[iter_32_6].gameObject_, false)
	end
end

function var_0_0.RefreshScenePool(arg_33_0)
	arg_33_0.sceneLastRewardCnt_ = 0
	arg_33_0.sceneTotalRewardCnt_ = 0

	local var_33_0 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[arg_33_0.scenePoolID_] or {}

	for iter_33_0, iter_33_1 in ipairs(var_33_0) do
		local var_33_1 = ActivityLimitedDrawPoolCfg[iter_33_1]

		arg_33_0.sceneTotalRewardCnt_ = arg_33_0.sceneTotalRewardCnt_ + var_33_1.total

		local var_33_2 = ActivitySkinDrawData:GetDrawInfo(arg_33_0.sceneDrawActivityID_, iter_33_1)

		if var_33_2 then
			arg_33_0.sceneLastRewardCnt_ = arg_33_0.sceneLastRewardCnt_ + var_33_2.num
		else
			arg_33_0.sceneLastRewardCnt_ = arg_33_0.sceneLastRewardCnt_ + var_33_1.total
		end
	end

	local var_33_3 = ActivityLimitedDrawPoolListCfg[arg_33_0.scenePoolID_].main_icon_info[1][1]
	local var_33_4 = ActivitySkinDrawData:GetDrawInfo(arg_33_0.sceneDrawActivityID_, var_33_3)
	local var_33_5 = var_33_4 and var_33_4.num or ActivityLimitedDrawPoolCfg[var_33_3].total

	arg_33_0.sceneCon_:SetSelectedState(var_33_5 > 0 and "on" or "off")

	arg_33_0.sceneID_ = ActivityLimitedDrawPoolCfg[var_33_3].reward[1][1]

	local var_33_6 = ActivityLimitedDrawPoolListCfg[arg_33_0.scenePoolID_].icon_info

	for iter_33_2, iter_33_3 in ipairs(var_33_6) do
		if not arg_33_0.sceneFloorRewardItem_[iter_33_2] then
			local var_33_7 = Object.Instantiate(arg_33_0.templateItem_, arg_33_0.sceneRewardContent_)

			arg_33_0.sceneFloorRewardItem_[iter_33_2] = ActivitySkinDrawItem.New(var_33_7)
		end

		SetActive(arg_33_0.sceneFloorRewardItem_[iter_33_2].gameObject_, true)
		arg_33_0.sceneFloorRewardItem_[iter_33_2]:SetData(arg_33_0.sceneDrawActivityID_, iter_33_3)
	end

	for iter_33_4 = #var_33_6 + 1, #arg_33_0.sceneFloorRewardItem_ do
		SetActive(arg_33_0.sceneFloorRewardItem_[iter_33_4].gameObject_, false)
	end
end

function var_0_0.GetPoolID(arg_34_0, arg_34_1)
	local var_34_0 = ActivityLimitedDrawPoolListCfg.all

	for iter_34_0, iter_34_1 in ipairs(var_34_0) do
		local var_34_1 = ActivityLimitedDrawPoolListCfg[iter_34_1].activity_id

		if table.indexof(var_34_1, arg_34_1) then
			return iter_34_1
		end
	end

	return 0
end

function var_0_0.GetCurPoolID(arg_35_0)
	arg_35_0.curPoolID_ = ActivitySkinDrawData:GetCurDrawPool(arg_35_0.activityID_)

	if not arg_35_0.curPoolID_ then
		arg_35_0.curPoolID_ = arg_35_0.skinPoolID_
	end
end

function var_0_0.RefreshCurPool(arg_36_0)
	local var_36_0 = 0

	if arg_36_0.curPoolID_ == arg_36_0.skinPoolID_ then
		arg_36_0.typeCon_:SetSelectedState("skin")

		var_36_0 = arg_36_0.skinLastRewardCnt_
	elseif arg_36_0.curPoolID_ == arg_36_0.scenePoolID_ then
		arg_36_0.typeCon_:SetSelectedState("scene")

		var_36_0 = arg_36_0.sceneLastRewardCnt_
	end

	if var_36_0 >= 10 then
		arg_36_0.drawCon_:SetSelectedState("ten")
	elseif var_36_0 > 0 then
		arg_36_0.drawCon_:SetSelectedState("one")
	else
		arg_36_0.drawCon_:SetSelectedState("none")
	end

	local var_36_1 = ActivityLimitedDrawPoolListCfg[arg_36_0.curPoolID_].cost_once[1]

	arg_36_0.drawIcon_1.sprite = ItemTools.getItemSprite(var_36_1)
	arg_36_0.drawIcon_2.sprite = ItemTools.getItemSprite(var_36_1)

	arg_36_0.btnAni_:Play("btn_show", -1, 0)
end

function var_0_0.CheckSceneDrawed(arg_37_0)
	if arg_37_0.params_.isSceneDrawed then
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("GENGCHEN_SWIMWEAR_CHANGE_SCENE"), ItemTools.getItemName(arg_37_0.sceneID_)),
			OkCallback = function()
				JumpTools.OpenPageByJump("/scenePreview", {
					sceneID = arg_37_0.sceneID_
				})
			end
		})
	end

	arg_37_0.params_.isSceneDrawed = false
end

function var_0_0.DrawCheck(arg_39_0, arg_39_1)
	if not arg_39_0.activityData_:IsActivitying() then
		ShowTips("TIME_OVER")
	end

	if not _G.SkipTip.SkipActivitySkinDrawTip then
		local var_39_0
		local var_39_1 = true

		if arg_39_0.curPoolID_ == arg_39_0.skinPoolID_ then
			var_39_0 = arg_39_0.skinID_
			var_39_1 = HeroTools.IsSkinUnlock(arg_39_0.skinID_)
		else
			var_39_0 = arg_39_0.sceneID_
			var_39_1 = HomeSceneSettingData:IsUnlockScene(arg_39_0.sceneID_)
		end

		if var_39_1 then
			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = string.format(GetTips("GENGCHEN_SWIMWEAR_CONTINUE"), ItemTools.getItemName(var_39_0)),
				OkCallback = function()
					_G.SkipTip.SkipActivitySkinDrawTip = arg_39_0.SkipActivitySkinDrawTip_

					arg_39_0:AfterCheck(arg_39_1)
				end,
				ToggleCallback = function(arg_41_0)
					arg_39_0.SkipActivitySkinDrawTip_ = arg_41_0
				end
			})
		else
			arg_39_0:AfterCheck(arg_39_1)
		end
	else
		arg_39_0:AfterCheck(arg_39_1)
	end
end

function var_0_0.AfterCheck(arg_42_0, arg_42_1)
	local var_42_0 = ActivityLimitedDrawPoolListCfg[arg_42_0.curPoolID_]
	local var_42_1 = var_42_0.cost_once[1]

	if arg_42_1 <= ItemTools.getItemNum(var_42_1) then
		arg_42_0:StartDraw(arg_42_1)
	else
		local var_42_2 = {}

		table.insert(var_42_2, var_42_0.payment_free[1])

		local var_42_3 = getShopCfg(var_42_0.payment_free[1])
		local var_42_4 = var_42_3.shop_id
		local var_42_5 = ShopData.GetShop(var_42_4)[var_42_0.payment_free[1]]
		local var_42_6 = var_42_3.limit_num - (var_42_5.buy_times or 0)
		local var_42_7 = var_42_0.payment

		for iter_42_0, iter_42_1 in ipairs(var_42_7) do
			local var_42_8 = getShopCfg(iter_42_1)
			local var_42_9 = var_42_8.shop_id
			local var_42_10 = ShopData.GetShop(var_42_9)[iter_42_1]

			if var_42_10 then
				local var_42_11 = var_42_8.limit_num - (var_42_10.buy_times or 0)

				if arg_42_1 <= var_42_11 and arg_42_1 <= var_42_6 then
					table.insert(var_42_2, iter_42_1)
					arg_42_0:GoPopView(arg_42_1, var_42_2)

					break
				elseif var_42_11 > 0 then
					arg_42_0:GoToShop(iter_42_1, var_42_9)

					break
				end
			end
		end
	end
end

function var_0_0.StartDraw(arg_43_0, arg_43_1)
	if arg_43_0.curPoolID_ == arg_43_0.skinPoolID_ then
		ActivitySkinDrawAction.StartDraw(arg_43_0.skinDrawActivityID_, arg_43_0.skinPoolID_, arg_43_1)
	elseif arg_43_0.curPoolID_ == arg_43_0.scenePoolID_ then
		ActivitySkinDrawAction.StartDraw(arg_43_0.sceneDrawActivityID_, arg_43_0.scenePoolID_, arg_43_1)
	end
end

function var_0_0.GoPopView(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.curPoolID_ == arg_44_0.skinPoolID_ and arg_44_0.skinDrawActivityID_ or arg_44_0.sceneDrawActivityID_

	JumpTools.OpenPageByJump("activitySkinDrawPop", {
		mainActivity = arg_44_0.activityID_,
		poolActivityID = var_44_0,
		poolID = arg_44_0.curPoolID_,
		cnt = arg_44_1,
		goods = arg_44_2
	})
end

function var_0_0.GoToShop(arg_45_0, arg_45_1, arg_45_2)
	JumpTools.GoToSystem("/shop", {
		goodId = arg_45_1,
		shopId = arg_45_2,
		showShops = {
			arg_45_2
		}
	}, ViewConst.SYSTEM_ID.SHOP)
end

function var_0_0.BindRedPoint(arg_46_0)
	manager.redPoint:bindUIandKey(arg_46_0.sceneTrailBtn_.transform, RedPointConst.SCENE .. "_" .. arg_46_0.sceneID_)
	manager.redPoint:bindUIandKey(arg_46_0.taskBtn_.transform, RedPointConst.ACTIVITY_TASK .. "_" .. arg_46_0.taskActiivtyID_)
end

function var_0_0.UnbindRedPoint(arg_47_0)
	manager.redPoint:unbindUIandKey(arg_47_0.sceneTrailBtn_.transform, RedPointConst.SCENE .. "_" .. arg_47_0.sceneID_)
	manager.redPoint:unbindUIandKey(arg_47_0.taskBtn_.transform, RedPointConst.ACTIVITY_TASK .. "_" .. arg_47_0.taskActiivtyID_)
end

function var_0_0.RefreshBar(arg_48_0)
	local var_48_0 = {
		BACK_BAR,
		HOME_BAR
	}
	local var_48_1 = ActivityLimitedDrawPoolListCfg[arg_48_0.skinPoolID_].cost_once[1]

	table.insert(var_48_0, var_48_1)

	local var_48_2 = ActivityLimitedDrawPoolListCfg[arg_48_0.scenePoolID_].cost_once[1]

	table.insert(var_48_0, var_48_2)
	table.insertto(var_48_0, {
		CurrencyConst.CURRENCY_TYPE_DIAMOND,
		CurrencyConst.GetPlatformDiamondId()
	})
	manager.windowBar:SwitchBar(var_48_0)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
	manager.windowBar:SetBarCanAdd(var_48_1, true)
	manager.windowBar:SetBarCanAdd(var_48_2, true)
end

function var_0_0.OnTop(arg_49_0)
	if arg_49_0.skinPoolID_ and arg_49_0.scenePoolID_ then
		arg_49_0:RefreshBar()
	end
end

function var_0_0.OnExit(arg_50_0)
	arg_50_0:StopTimer()
	arg_50_0:UnbindRedPoint()
	manager.windowBar:HideBar()
	arg_50_0:RemoveAllEventListener()

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.skinFloorRewardItem_) do
		arg_50_0.skinFloorRewardItem_[iter_50_0]:OnExit()
	end

	for iter_50_2, iter_50_3 in ipairs(arg_50_0.sceneFloorRewardItem_) do
		arg_50_0.sceneFloorRewardItem_[iter_50_2]:OnExit()
	end

	ActivitySkinDrawData:SetCurDrawPool(arg_50_0.activityID_, arg_50_0.curPoolID_)
end

function var_0_0.Dispose(arg_51_0)
	arg_51_0:RemoveAllListeners()

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.skinFloorRewardItem_) do
		arg_51_0.skinFloorRewardItem_[iter_51_0]:Dispose()
	end

	for iter_51_2, iter_51_3 in ipairs(arg_51_0.sceneFloorRewardItem_) do
		arg_51_0.sceneFloorRewardItem_[iter_51_2]:Dispose()
	end

	arg_51_0.super.Dispose(arg_51_0)
end

return var_0_0
