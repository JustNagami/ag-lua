local var_0_0 = class("HeroClueMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return HeroClueTools.GetMainViewUIName(arg_1_0.params_.activtiyID)
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

	arg_4_0.clueItemList_ = {}

	local var_4_0 = arg_4_0.clueContentTrans_.childCount
	local var_4_1

	for iter_4_0 = 1, var_4_0 do
		local var_4_2 = arg_4_0.clueContentTrans_:GetChild(iter_4_0 - 1).gameObject
		local var_4_3 = tonumber(var_4_2.name)

		arg_4_0.clueItemList_[iter_4_0] = HeroClueItem.New(var_4_2, var_4_3, arg_4_0.params_.activityID, iter_4_0)
	end
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.drawBtn_, nil, function()
		if not ActivityTools.ActivityOpenCheck(arg_5_0.activityID_) then
			return
		end

		local var_6_0 = true
		local var_6_1 = HeroClueData:GetUnlockClueDataDic()

		for iter_6_0, iter_6_1 in ipairs(arg_5_0.clueIdList_) do
			if not var_6_1[iter_6_1] then
				var_6_0 = false

				break
			elseif #HeroClueCfg[iter_6_1].level > var_6_1[iter_6_1].level then
				var_6_0 = false

				break
			end
		end

		if var_6_0 == true then
			ShowTips("ACTIVITY_HERO_CLUE_ALL_COLLECTED")

			return
		end

		local var_6_2 = HeroCluePoolCfg[arg_5_0.cluePoolID_].item_id

		if ItemTools.getItemNum(var_6_2) < 1 then
			ShowTips("ACTIVITY_HERO_CLUE_PACKAGE_NULL")

			return
		end

		HeroClueAction.Draw(arg_5_0.activityID_, arg_5_0.cluePoolID_, 1)
	end)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		if not ActivityTools.ActivityOpenCheck(arg_5_0.activityID_) then
			return
		end

		local var_7_0 = HeroClueTools.GetPlayTaskActivityID(arg_5_0.activityID_)

		JumpTools.OpenPageByJump("heroClueTask", {
			activityID = var_7_0,
			mainActivityID = arg_5_0.activityID_
		})
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.activityID_ = arg_8_0.params_.activityID
	arg_8_0.cluePoolID_ = HeroCluePoolCfg.get_id_list_by_activity_id[arg_8_0.activityID_][1]
	arg_8_0.clueIdList_ = HeroClueCfg.get_id_list_by_clue_pool[arg_8_0.cluePoolID_]

	for iter_8_0, iter_8_1 in pairs(arg_8_0.clueItemList_) do
		iter_8_1:OnEnter()
	end

	arg_8_0:RefreshUI()
	arg_8_0:BindRedPoint()
end

function var_0_0.OnTop(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		HeroCluePoolCfg[arg_9_0.cluePoolID_].item_id
	})
	manager.windowBar:SetBarCanClick(HeroCluePoolCfg[arg_9_0.cluePoolID_].item_id, true)
end

function var_0_0.OnExit(arg_10_0)
	manager.windowBar:HideBar()

	for iter_10_0, iter_10_1 in pairs(arg_10_0.clueItemList_) do
		iter_10_1:OnExit()
	end

	arg_10_0:UnBindRedPoint()
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.clueItemList_) do
		iter_11_1:Dispose()
	end

	arg_11_0.clueItemList_ = nil

	var_0_0.super.Dispose(arg_11_0)
end

function var_0_0.RefreshUI(arg_12_0)
	arg_12_0:RefreshCoin()
	arg_12_0:RefreshClue()
end

function var_0_0.RefreshClue(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.clueItemList_) do
		iter_13_1:RefreshUI()
	end
end

function var_0_0.RefreshCoin(arg_14_0)
	local var_14_0 = HeroCluePoolCfg[arg_14_0.cluePoolID_].item_id

	arg_14_0.coinNum_.text = 1
	arg_14_0.coinIcon_.sprite = ItemTools.getItemSprite(var_14_0)
end

function var_0_0.OnClueDraw(arg_15_0, arg_15_1)
	arg_15_0:RefreshUI()
	JumpTools.OpenPageByJump("heroClueDrawResult", {
		activityID = arg_15_0.activityID_,
		rewardList = arg_15_1
	})
end

function var_0_0.BindRedPoint(arg_16_0)
	local var_16_0 = ActivityCfg[arg_16_0.activityID_].sub_activity_list[2]
	local var_16_1 = string.format("%s_%d", RedPointConst.ACTIVITY_TASK, var_16_0)

	manager.redPoint:bindUIandKey(arg_16_0.rewardBtn_.transform, var_16_1)

	local var_16_2 = string.format("%s_%d", RedPointConst.HERO_CLUE_DRAW, arg_16_0.activityID_)

	manager.redPoint:bindUIandKey(arg_16_0.drawBtn_.transform, var_16_2)
end

function var_0_0.UnBindRedPoint(arg_17_0)
	local var_17_0 = ActivityCfg[arg_17_0.activityID_].sub_activity_list[2]
	local var_17_1 = string.format("%s_%d", RedPointConst.ACTIVITY_TASK, var_17_0)

	manager.redPoint:unbindUIandKey(arg_17_0.rewardBtn_.transform, var_17_1)

	local var_17_2 = string.format("%s_%d", RedPointConst.HERO_CLUE_DRAW, arg_17_0.activityID_)

	manager.redPoint:unbindUIandKey(arg_17_0.drawBtn_.transform, var_17_2)
end

return var_0_0
