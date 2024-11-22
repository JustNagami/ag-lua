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

	arg_4_0.skinPoolItem_ = {}
	arg_4_0.scenePoolItem_ = {}
	arg_4_0.drawCon_ = arg_4_0.controllerEx_:GetController("draw")
	arg_4_0.rewardCon_ = arg_4_0.controllerEx_:GetController("reward")
	arg_4_0.scenePreviewCon_ = arg_4_0.controllerEx_:GetController("scenePreview")
	arg_4_0.poolList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.poolListGo_, ActivitySkinDrawPoolItem)
	arg_4_0.criMovie_ = arg_4_0.movieGo_:GetComponent("CriManaMovieControllerForUI")
	arg_4_0.criplayer_ = arg_4_0.criMovie_.player

	arg_4_0.criplayer_:SetMaxPictureDataSize(300000)

	arg_4_0.sceneReward_ = ActivitySkinDrawItem.New(arg_4_0.sceneReward_1)
	arg_4_0.skinRewardList_ = {}

	for iter_4_0 = 1, 2 do
		arg_4_0.skinRewardList_[iter_4_0] = ActivitySkinDrawItem.New(arg_4_0["skinReward_" .. iter_4_0])
	end

	arg_4_0.storyList_ = {}

	for iter_4_1 = 1, 4 do
		arg_4_0.storyList_[iter_4_1] = {}

		ComponentBinder.GetInstance():BindCfgUI(arg_4_0.storyList_[iter_4_1], arg_4_0["storyGo_" .. iter_4_1])

		arg_4_0.storyList_[iter_4_1].lockController = arg_4_0.storyList_[iter_4_1].tranCon_:GetController("Story")
	end

	arg_4_0.storyIdList_ = {}
end

function var_0_0.AddUIListeners(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.storyList_) do
		arg_5_0:AddBtnListener(iter_5_1.btn_, nil, function()
			if iter_5_0 <= arg_5_0.openStoryIndex_ then
				gameContext:Go("/blank")

				local var_6_0 = ActivitySkinDrawData:GetStoryActivityId()

				ActivitySkinDrawAction.FinishStory(var_6_0, arg_5_0.storyIdList_[iter_5_0])
				manager.story:StartStoryById(arg_5_0.storyIdList_[iter_5_0], function()
					manager.redPoint:setTip(RedPointConst.ACTIVITY_SKIN_DRAW, 0, RedPointStyle.SHOW_NEW_TAG)
					gameContext:Back()
				end)
			else
				ShowTips(GetTips("SKIN_DRAE_STORY_LOCK_TIPS"))
			end
		end)
	end

	arg_5_0:AddBtnListener(arg_5_0.taskBtn_, nil, function()
		JumpTools.OpenPageByJump("/activitySkinDrawTask", {
			activityID = arg_5_0.activityID_,
			taskActivityID = arg_5_0.taskActiivtyID_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.shopBtn_, nil, function()
		local var_9_0 = ActivitySkinDrawTools.GetActivityShopID(arg_5_0.activityID_)

		if not ShopTools.IsShopOpen(var_9_0) then
			ShowTips("TIME_OVER")

			return
		end

		JumpTools.GoToSystem("/activityShop", {
			shopId = var_9_0,
			showShops = {
				var_9_0
			}
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnAnim_1, nil, function()
		arg_5_0:JumpToVideo(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnAnim_2, nil, function()
		arg_5_0:JumpToVideo(2)
	end)
	arg_5_0:AddBtnListener(arg_5_0.previewBtn_, nil, function()
		local var_12_0 = arg_5_0.sceneIDList_[arg_5_0.curPoolID_]
		local var_12_1 = HomeSceneSettingData:SetPreviewScene(var_12_0)

		HomeSceneSettingData:SetPreviewSceneParams(var_12_1)
		OpenPageUntilLoaded("/homePreview", var_12_1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnInfo_, nil, function()
		JumpTools.OpenPageByJump("skinDrawInfo", {
			poolID = arg_5_0.curPoolID_,
			mainActivity = arg_5_0.activityID_,
			poolActivityID = arg_5_0.curPoolActivityId_
		})
	end)
	arg_5_0:AddBtnListener(arg_5_0.oneBtn_, nil, function()
		arg_5_0:DrawCheck(1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.tenBtn_, nil, function()
		arg_5_0:DrawCheck(10)
	end)
end

function var_0_0.OnEnter(arg_16_0)
	arg_16_0:InitData()
	arg_16_0:BindRedPoint()
	arg_16_0:RefreshUI()
	arg_16_0:CheckHadDrawed()
	arg_16_0:CheckSceneDrawed()
end

function var_0_0.InitData(arg_17_0)
	arg_17_0.activityID_ = arg_17_0.params_.activityID
	arg_17_0.activityData_ = ActivityData:GetActivityData(arg_17_0.activityID_)
	arg_17_0.startTime_ = arg_17_0.activityData_.startTime
	arg_17_0.stopTime_ = arg_17_0.activityData_.stopTime
	arg_17_0.taskActiivtyID_ = ActivitySkinDrawTools.GetTaskActivityID(arg_17_0.activityID_)
	arg_17_0.poolIdList_ = ActivitySkinDrawTools.GetPoolIdList(arg_17_0.activityID_)
	arg_17_0.sceneIDList_ = {}

	arg_17_0:InitPoolData()

	arg_17_0.lastCount_ = {}
	arg_17_0.totalCount_ = {}
	arg_17_0.mainReward_ = {}
end

function var_0_0.InitPoolData(arg_18_0)
	arg_18_0.poolDataList_ = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.poolIdList_) do
		arg_18_0.poolDataList_[#arg_18_0.poolDataList_ + 1] = clone(ActivityLimitedDrawPoolListCfg[iter_18_1])
	end
end

function var_0_0.RefreshUI(arg_19_0)
	arg_19_0:RefreshTime()
	arg_19_0:RefreshPool()
end

function var_0_0.RefreshTime(arg_20_0)
	local var_20_0
	local var_20_1 = manager.time:GetServerTime()

	arg_20_0:StopTimer()

	if var_20_1 < arg_20_0.stopTime_ then
		arg_20_0.timeText_.text = GetTips("REMAINING_TIME") .. GetI18NText(manager.time:GetLostTimeStrWith2Unit(arg_20_0.stopTime_))
		arg_20_0.timer_ = Timer.New(function()
			arg_20_0.timeText_.text = GetTips("REMAINING_TIME") .. GetI18NText(manager.time:GetLostTimeStrWith2Unit(arg_20_0.stopTime_))
			var_20_0 = arg_20_0.stopTime_ - manager.time:GetServerTime()

			if var_20_0 <= 0 then
				arg_20_0:StopTimer()
				arg_20_0:RefreshTime()
			end
		end, 1, -1)

		arg_20_0.timer_:Start()
	else
		arg_20_0.timeText_.text = GetI18NText(GetTips("TIME_OVER"))
	end
end

function var_0_0.StopTimer(arg_22_0)
	if arg_22_0.timer_ then
		arg_22_0.timer_:Stop()

		arg_22_0.timer_ = nil
	end
end

function var_0_0.RefreshStroy(arg_23_0)
	local var_23_0 = SkinCfg[arg_23_0.skinID_]
	local var_23_1 = ActivitySkinDrawData:GetFinishedStory()

	arg_23_0.openStoryIndex_ = #var_23_1 + 1

	for iter_23_0, iter_23_1 in ipairs(var_23_0.plot_title) do
		arg_23_0.storyList_[iter_23_0].titleText_.text = iter_23_1
		arg_23_0.storyIdList_[iter_23_0] = var_23_0.plot_id[iter_23_0]

		local var_23_2 = iter_23_0 <= arg_23_0.openStoryIndex_

		arg_23_0.storyList_[iter_23_0].lockController:SetSelectedState(tostring(var_23_2))

		if var_23_2 and not table.indexof(var_23_1, var_23_0.plot_id[iter_23_0]) then
			manager.redPoint:setTip(RedPointConst.ACTIVITY_SKIN_DRAW .. iter_23_0, 1, RedPointStyle.SHOW_NEW_TAG)
		else
			manager.redPoint:setTip(RedPointConst.ACTIVITY_SKIN_DRAW .. iter_23_0, 0, RedPointStyle.SHOW_NEW_TAG)
		end
	end
end

function var_0_0.RefreshPool(arg_24_0)
	arg_24_0:RefreshPoolData(arg_24_0.poolIdList_)

	arg_24_0.curPoolID_ = ActivitySkinDrawData:GetCurDrawPool(arg_24_0.activityID_) or arg_24_0.poolIdList_[1]
	arg_24_0.curPoolActivityId_ = ActivityLimitedDrawPoolListCfg[arg_24_0.curPoolID_].activity_id[1]

	arg_24_0:RefreshCurPool()
	arg_24_0.poolList_:StartScroll(#arg_24_0.poolDataList_)
end

function var_0_0.RefreshPoolData(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		local var_25_0 = ActivityLimitedDrawPoolListCfg[iter_25_1]
		local var_25_1 = var_25_0.activity_id[1]

		arg_25_0.lastCount_[iter_25_1] = arg_25_0.lastCount_[iter_25_1] or {}
		arg_25_0.lastCount_[iter_25_1] = arg_25_0:CaculateCount(iter_25_1, var_25_1)

		local var_25_2 = var_25_0.main_icon_info

		arg_25_0.mainReward_[iter_25_1] = arg_25_0.mainReward_[iter_25_1] or {}

		for iter_25_2, iter_25_3 in ipairs(var_25_2) do
			local var_25_3 = iter_25_3[1]
			local var_25_4 = ActivityLimitedDrawPoolCfg[var_25_3]
			local var_25_5 = ActivitySkinDrawData:GetDrawInfo(var_25_1, var_25_3)
			local var_25_6 = var_25_4.reward[1][1]

			table.insert(arg_25_0.mainReward_[iter_25_1], {
				itemId = var_25_6,
				count = var_25_5 and var_25_5.num or var_25_4.total
			})

			if ItemCfg[var_25_6].type == ItemConst.ITEM_TYPE.FRAME then
				arg_25_0.frameID_ = var_25_6
			elseif ItemCfg[var_25_6].type == ItemConst.ITEM_TYPE.HERO_SKIN then
				arg_25_0.skinID_ = var_25_6
			elseif ItemCfg[var_25_6].type == ItemConst.ITEM_TYPE.SCENE then
				arg_25_0.sceneIDList_[iter_25_1] = var_25_6
			end
		end
	end

	local var_25_7 = PlayerData:GetFrame(arg_25_0.frameID_)

	arg_25_0.frameUnlock_ = var_25_7 and var_25_7.unlock == 1 and var_25_7.lasted_time == 0
	arg_25_0.skinUnlock_ = HeroTools.GetHasOwnedSkin(arg_25_0.skinID_)
	arg_25_0.sceneUnlock_ = arg_25_0:IsSceneHad()
end

function var_0_0.CaculateCount(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = 0
	local var_26_1 = 0
	local var_26_2 = ActivityLimitedDrawPoolCfg.get_id_list_by_pool_id[arg_26_1] or {}

	for iter_26_0, iter_26_1 in ipairs(var_26_2) do
		local var_26_3 = ActivityLimitedDrawPoolCfg[iter_26_1]
		local var_26_4 = ActivitySkinDrawData:GetDrawInfo(arg_26_2, iter_26_1)

		var_26_0 = var_26_4 and var_26_0 + var_26_4.num or var_26_0 + var_26_3.total
		var_26_1 = var_26_1 + var_26_3.total
	end

	arg_26_0.totalCount_[arg_26_1] = var_26_1

	return var_26_0
end

function var_0_0.RefreshCurPool(arg_27_0)
	ActivitySkinDrawData:SetCurDrawPool(arg_27_0.activityID_, arg_27_0.curPoolID_)

	local var_27_0 = ActivityLimitedDrawPoolListCfg[arg_27_0.curPoolID_]
	local var_27_1 = arg_27_0.lastCount_[arg_27_0.curPoolID_]

	if var_27_1 >= 10 then
		arg_27_0.drawCon_:SetSelectedState("ten")
	elseif var_27_1 > 0 then
		arg_27_0.drawCon_:SetSelectedState("one")
	else
		arg_27_0.drawCon_:SetSelectedState("none")
	end

	arg_27_0.textDrawDesc_.text = string.format(GetTips("SKIN_DRAE_DESC"), arg_27_0.totalCount_[arg_27_0.curPoolID_], var_27_0.pool_name)
	arg_27_0.textDrawTimes_.text = string.format("%s/%s", arg_27_0.totalCount_[arg_27_0.curPoolID_] - var_27_1, arg_27_0.totalCount_[arg_27_0.curPoolID_])
	arg_27_0.isSkinPool_ = var_27_0.pool_type == 1

	arg_27_0.scenePreviewCon_:SetSelectedState(arg_27_0.isSkinPool_ and "hide" or "show")

	local var_27_2 = var_27_0.cost_once[1]

	arg_27_0.drawIcon_1.sprite = ItemTools.getItemSprite(var_27_2)
	arg_27_0.drawIcon_2.sprite = ItemTools.getItemSprite(var_27_2)
	arg_27_0.curIndex_ = arg_27_0.selectItem_ and arg_27_0.selectItem_:GetItemIndex() or 1

	arg_27_0.rewardCon_:SetSelectedIndex(arg_27_0.curIndex_ - 1)
	arg_27_0:RefreshMainReward()
	arg_27_0:RefreshMovie()
end

function var_0_0.RefreshMovie(arg_28_0)
	arg_28_0.criMovie_:Stop()

	local var_28_0 = ObtainSkinBackgroundMovieCfg[arg_28_0.curPoolActivityId_]
	local var_28_1 = deepClone(var_28_0.start_path)
	local var_28_2
	local var_28_3 = ActivitySkinDrawData:GetLastFile(arg_28_0.activityID_)

	if var_28_3 then
		local var_28_4 = math.random(#var_28_1 - 1)
		local var_28_5 = table.indexof(var_28_1, var_28_3)

		if var_28_5 and var_28_5 <= var_28_4 then
			var_28_4 = var_28_4 + 1
		end

		var_28_2 = var_28_1[var_28_4] or var_28_1[1]
	else
		var_28_2 = var_28_1[math.random(#var_28_1)] or var_28_1[1]
	end

	arg_28_0:StopFrameTimer()

	arg_28_0.frameTimer_ = FrameTimer.New(function()
		if tostring(arg_28_0.criplayer_.status) == "Stop" then
			SetFile(arg_28_0.criplayer_, nil, var_28_2, CriMana.Player.SetMode.New)
			ActivitySkinDrawData:SetLastFile(arg_28_0.activityID_, var_28_2)
			arg_28_0.criMovie_:Play()
			arg_28_0:StopFrameTimer()
		end
	end, 1, -1)

	arg_28_0.frameTimer_:Start()
end

function var_0_0.StopFrameTimer(arg_30_0)
	if arg_30_0.frameTimer_ then
		arg_30_0.frameTimer_:Stop()

		arg_30_0.frameTimer_ = nil
	end
end

function var_0_0.RefreshMainReward(arg_31_0)
	if arg_31_0.isSkinPool_ then
		for iter_31_0, iter_31_1 in ipairs(arg_31_0.mainReward_[arg_31_0.curPoolID_]) do
			arg_31_0.skinRewardList_[iter_31_0]:RefreshData(iter_31_1, arg_31_0.isSkinPool_)
		end
	else
		arg_31_0.sceneReward_:RefreshData(arg_31_0.mainReward_[arg_31_0.curPoolID_][1], arg_31_0.isSkinPool_)
	end
end

function var_0_0.CheckHadDrawed(arg_32_0)
	if not arg_32_0.params_.checkReward then
		return
	end

	if (getData("activity_check_had", "activity_" .. tostring(arg_32_0.activityID_)) or 0) == 0 and arg_32_0:CheckReward() then
		ShowMessageBox({
			ButtonType = "SingleBtn",
			title = GetTips("PROMPT"),
			content = GetTips("GENGCHEN_SWIMWEAR_DES_1"),
			OkCallback = function()
				saveData("activity_check_had", "activity_" .. tostring(arg_32_0.activityID_), 1)
			end
		})
	end
end

function var_0_0.CheckReward(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.mainReward_[arg_34_0.curPoolID_]) do
		local var_34_0
		local var_34_1
		local var_34_2
		local var_34_3 = iter_34_1.itemId

		if ItemCfg[var_34_3].type == ItemConst.ITEM_TYPE.FRAME then
			var_34_0 = arg_34_0.frameUnlock_ and iter_34_1.count > 0
		elseif ItemCfg[var_34_3].type == ItemConst.ITEM_TYPE.HERO_SKIN then
			var_34_1 = arg_34_0.skinUnlock_ and iter_34_1.count > 0
		elseif ItemCfg[var_34_3].type == ItemConst.ITEM_TYPE.SCENE then
			var_34_2 = arg_34_0.sceneUnlock_ and iter_34_1.count > 0
		end

		if var_34_0 or var_34_1 or var_34_2 then
			return true
		end
	end

	return false
end

function var_0_0.IsSceneHad(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.sceneIDList_) do
		if HomeSceneSettingData:IsUnlockScene(iter_35_1) then
			return true
		end
	end

	return false
end

function var_0_0.CheckSceneDrawed(arg_36_0)
	local var_36_0 = arg_36_0.sceneIDList_[arg_36_0.curPoolID_]

	if arg_36_0.params_.isSceneDrawed and var_36_0 == arg_36_0.params_.sceneDrawedId then
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("GENGCHEN_SWIMWEAR_CHANGE_SCENE"), ItemTools.getItemName(var_36_0)),
			OkCallback = function()
				JumpTools.OpenPageByJump("/scenePreview", {
					sceneID = var_36_0
				})
			end
		})
	end

	arg_36_0.params_.isSceneDrawed = false
	arg_36_0.params_.sceneDrawedId = 0
end

function var_0_0.JumpToVideo(arg_38_0, arg_38_1)
	local var_38_0 = SkinCfg[arg_38_0.skinID_].video_url[arg_38_1]

	if not var_38_0 or var_38_0 == "" then
		return
	end

	Application.OpenURL(var_38_0)
end

function var_0_0.DrawCheck(arg_39_0, arg_39_1)
	if not arg_39_0.activityData_:IsActivitying() then
		ShowTips("TIME_OVER")

		return
	end

	if not _G.SkipTip.SkipActivitySkinDrawTip then
		local var_39_0 = {}
		local var_39_1 = false
		local var_39_2 = false
		local var_39_3 = false

		if arg_39_0.isSkinPool_ then
			var_39_0[#var_39_0 + 1] = arg_39_0.skinID_
			var_39_1 = arg_39_0.skinUnlock_
			var_39_2 = arg_39_0.frameUnlock_

			if var_39_2 then
				var_39_0[#var_39_0 + 1] = arg_39_0.frameID_
			end
		else
			var_39_0[#var_39_0 + 1] = arg_39_0.sceneIDList_[arg_39_0.curPoolID_]
			var_39_3 = HomeSceneSettingData:IsUnlockScene(arg_39_0.sceneIDList_[arg_39_0.curPoolID_])
		end

		if var_39_3 or var_39_2 and var_39_1 then
			local var_39_4

			if var_39_3 then
				var_39_4 = string.format(GetTips("GENGCHEN_SWIMWEAR_CONTINUE"), ItemTools.getItemName(var_39_0[1]))
			else
				var_39_4 = string.format(GetTips("GENGCHEN_SWIMWEAR_CONTINUE2"), ItemTools.getItemName(var_39_0[1]), ItemTools.getItemName(var_39_0[2]))
			end

			ShowMessageBox({
				title = GetTips("PROMPT"),
				content = var_39_4,
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
		ActivitySkinDrawAction.StartDraw(arg_42_0.curPoolActivityId_, arg_42_0.curPoolID_, arg_42_1)
	else
		local var_42_2 = getShopCfg(var_42_0.payment_free[1])
		local var_42_3 = {}
		local var_42_4 = {}

		table.insert(var_42_3, var_42_0.payment_free[1])
		table.insert(var_42_4, var_42_2.discount)

		local var_42_5 = var_42_2.shop_id
		local var_42_6 = ShopData.GetShop(var_42_5)[var_42_0.payment_free[1]]
		local var_42_7 = var_42_2.limit_num - (var_42_6.buy_times or 0)
		local var_42_8 = var_42_0.payment

		for iter_42_0, iter_42_1 in ipairs(var_42_8) do
			local var_42_9 = getShopCfg(iter_42_1)
			local var_42_10 = var_42_9.shop_id
			local var_42_11 = ShopData.GetShop(var_42_10)[iter_42_1]

			if var_42_11 then
				local var_42_12 = var_42_9.limit_num - (var_42_11.buy_times or 0)

				if arg_42_1 <= var_42_12 and arg_42_1 <= var_42_7 then
					table.insert(var_42_3, iter_42_1)
					table.insert(var_42_4, var_42_9.discount)
					JumpTools.OpenPageByJump("activitySkinDrawPop", {
						mainActivity = arg_42_0.activityID_,
						poolActivityID = arg_42_0.curPoolActivityId_,
						poolID = arg_42_0.curPoolID_,
						cnt = arg_42_1,
						goods = var_42_3,
						discount = var_42_4
					})

					break
				elseif var_42_12 > 0 then
					JumpTools.GoToSystem("/activityShop", {
						goodId = iter_42_1,
						shopId = var_42_10,
						showShops = {
							var_42_10
						}
					}, ViewConst.SYSTEM_ID.SHOP)

					break
				end
			end
		end
	end
end

function var_0_0.GetDiscount(arg_43_0)
	return
end

function var_0_0.BindRedPoint(arg_44_0)
	manager.redPoint:bindUIandKey(arg_44_0.taskBtn_.transform, RedPointConst.ACTIVITY_TASK .. "_" .. arg_44_0.taskActiivtyID_)

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.storyList_) do
		manager.redPoint:bindUIandKey(iter_44_1.noticeTrans_, RedPointConst.ACTIVITY_SKIN_DRAW .. iter_44_0)
	end
end

function var_0_0.UnbindRedPoint(arg_45_0)
	manager.redPoint:unbindUIandKey(arg_45_0.taskBtn_.transform, RedPointConst.ACTIVITY_TASK .. "_" .. arg_45_0.taskActiivtyID_)

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.storyList_) do
		manager.redPoint:unbindUIandKey(iter_45_1.noticeTrans_, RedPointConst.ACTIVITY_SKIN_DRAW .. iter_45_0)
	end
end

function var_0_0.IndexItem(arg_46_0, arg_46_1, arg_46_2)
	arg_46_2:SetData(arg_46_0.poolDataList_[arg_46_1], arg_46_1)
	arg_46_2:RegisterClickFunc(handler(arg_46_0, arg_46_0.OnPoolItemClick))

	if arg_46_1 == arg_46_0.curIndex_ then
		arg_46_2:SelectItem(true)

		arg_46_0.selectItem_ = arg_46_2
	else
		arg_46_2:SelectItem(false)
	end
end

function var_0_0.OnPoolItemClick(arg_47_0, arg_47_1)
	if arg_47_0.selectItem_ then
		if arg_47_0.selectItem_ == arg_47_1 then
			return
		end

		arg_47_0.selectItem_:SelectItem(false)
	end

	arg_47_0.selectItem_ = arg_47_1

	arg_47_0.selectItem_:SelectItem(true)

	arg_47_0.curPoolID_ = arg_47_1.poolId_
	arg_47_0.curPoolActivityId_ = ActivityLimitedDrawPoolListCfg[arg_47_0.curPoolID_].activity_id[1]

	arg_47_0:RefreshCurPool()
end

function var_0_0.RefreshBar(arg_48_0)
	local var_48_0 = {
		BACK_BAR,
		HOME_BAR
	}
	local var_48_1 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.poolDataList_) do
		local var_48_2 = iter_48_1.cost_once[1]

		if not table.indexof(var_48_0, var_48_2) then
			table.insert(var_48_1, var_48_2)
		end
	end

	table.insertto(var_48_0, var_48_1)
	table.insertto(var_48_0, {
		CurrencyConst.CURRENCY_TYPE_DIAMOND,
		CurrencyConst.GetPlatformDiamondId()
	})
	manager.windowBar:SwitchBar(var_48_0)

	for iter_48_2, iter_48_3 in ipairs(var_48_1) do
		manager.windowBar:SetBarCanClick(iter_48_3, true)
	end

	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.GetPlatformDiamondId(), true)
end

function var_0_0.OnTop(arg_49_0)
	arg_49_0:RefreshBar()
	arg_49_0:RefreshStroy()
end

function var_0_0.OnExit(arg_50_0)
	arg_50_0:StopTimer()
	arg_50_0:UnbindRedPoint()
	manager.windowBar:HideBar()
	arg_50_0:RemoveAllEventListener()

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.skinPoolItem_) do
		iter_50_1:OnExit()
	end

	for iter_50_2, iter_50_3 in ipairs(arg_50_0.scenePoolItem_) do
		iter_50_3:OnExit()
	end
end

function var_0_0.Dispose(arg_51_0)
	arg_51_0:RemoveAllListeners()

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.skinRewardList_) do
		iter_51_1:Dispose()
	end

	arg_51_0.skinRewardList_ = {}

	if arg_51_0.sceneReward_ then
		arg_51_0.sceneReward_:Dispose()

		arg_51_0.sceneReward_ = {}
	end

	if arg_51_0.poolList_ then
		arg_51_0.poolList_:Dispose()

		arg_51_0.poolList_ = nil
	end

	arg_51_0.super.Dispose(arg_51_0)
end

return var_0_0
