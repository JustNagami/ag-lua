local var_0_0 = class("SkinTrialSelectView_2_0", ReduxView)

function var_0_0.UIName(arg_1_0)
	return SkinTrialTools.GetSelectViewUIName(arg_1_0.params_.activityID)
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.skinImage_.immediate = true
	arg_3_0.popType_ = POP_ITEM
	arg_3_0.receivedControllerList_ = {}
	arg_3_0.itemList_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.itemListGo_, arg_3_0:GetRewardItem())

	arg_3_0:AddListeners()

	arg_3_0.specialRoleController_ = ControllerUtil.GetController(arg_3_0.transform_, "specialRole")
	arg_3_0.styleController_ = ControllerUtil.GetController(arg_3_0.transform_, "style")
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		arg_4_0:OnBackBtnClick()
	end)

	arg_4_0.activityID_ = arg_4_0.params_.activityID
	arg_4_0.skinTrialID_ = arg_4_0.params_.skinTrialID
	arg_4_0.startTime_ = ActivityData:GetActivityData(arg_4_0.activityID_).startTime
	arg_4_0.stopTime_ = ActivityData:GetActivityData(arg_4_0.activityID_).stopTime

	arg_4_0:RefreshUI()
	arg_4_0:AddTimer()
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btnBattle_, nil, function()
		SkinTrialData:SaveStageID(arg_6_0.skinTrialID_)

		if not ActivityData:GetActivityData(arg_6_0.activityID_):IsActivitying() then
			ShowTips("TIME_OVER")

			return
		end

		arg_6_0:SaveRoute()
		arg_6_0:Go("/sectionSelectHero", {
			section = ActivitySkinTrialCfg[arg_6_0.skinTrialID_].stage_id,
			sectionType = BattleConst.STAGE_TYPE_NEW.SKIN_TRIAL,
			activityID = arg_6_0.activityID_
		})
	end)
	arg_6_0:AddBtnListener(arg_6_0.sourceBtn_, nil, function()
		if not ActivityData:GetActivityData(arg_6_0.activityID_):IsActivitying() then
			ShowTips("TIME_OVER")

			return
		end

		local var_8_0 = ActivitySkinTrialCfg[arg_6_0.skinTrialID_].source

		JumpTools.JumpToPage2(var_8_0)
	end)
end

function var_0_0.OnBackBtnClick(arg_9_0)
	local var_9_0 = SkinTrialData:GetSkinTrialMainScrollPos("Global")

	SkinTrialData:SaveSkinTrialMainScrollPos(var_9_0, "Back")
	arg_9_0:Back()
end

function var_0_0.OnExit(arg_10_0)
	var_0_0.super.OnExit(arg_10_0)
	arg_10_0:StopTimer()
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:RemoveAllListeners()
	arg_11_0:RemoveAllEventListener()
	var_0_0.super.Dispose(arg_11_0)
	arg_11_0.itemList_:Dispose()

	arg_11_0.itemList_ = nil
end

function var_0_0.RefreshUI(arg_12_0)
	local var_12_0 = arg_12_0.skinTrialID_
	local var_12_1 = SkinTrialTools.GetHeroStandardID(var_12_0)
	local var_12_2 = HeroStandardSystemCfg[var_12_1].skin_id
	local var_12_3 = HeroStandardSystemCfg[var_12_1].hero_id

	arg_12_0.heroNameText_.text = string.format("%s·%s", GetI18NText(HeroCfg[var_12_3].name), GetI18NText(HeroCfg[var_12_3].suffix))
	arg_12_0.skinDescText_.text = GetI18NText(SkinCfg[var_12_2].desc)
	arg_12_0.skinNameText_.text = GetI18NText(SkinCfg[var_12_2].name)

	arg_12_0:RefreshRoleImage()
	arg_12_0:RefreshReward()
	arg_12_0.specialRoleController_:SetSelectedState("none")

	if arg_12_0.styleController_ then
		local var_12_4 = ActivityTools.GetActivityTheme(arg_12_0.activityID_)

		if var_12_4 == ActivityConst.THEME.ACTIVITY_2_2 or var_12_4 == ActivityConst.THEME.ACTIVITY_2_4 then
			arg_12_0.styleController_:SetSelectedState("V2_2")
		end
	end
end

function var_0_0.RefreshRoleImage(arg_13_0)
	local var_13_0 = SkinTrialTools.GetHeroStandardID(arg_13_0.skinTrialID_)

	arg_13_0.skinImage_.spriteSync = "TextureConfig/Character/Portrait/" .. SkinCfg[HeroStandardSystemCfg[var_13_0].skin_id].picture_id
end

function var_0_0.RefreshReward(arg_14_0)
	arg_14_0.rewardCfg_ = ActivitySkinTrialCfg[arg_14_0.skinTrialID_].reward

	arg_14_0.itemList_:StartScroll(#arg_14_0.rewardCfg_)
end

function var_0_0.GetRewardItem(arg_15_0)
	return CommonItem
end

function var_0_0.GetCommonItem(arg_16_0, arg_16_1)
	return arg_16_1
end

function var_0_0.IndexItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.rewardCfg_[arg_17_1]
	local var_17_1 = arg_17_0:GetCommonItem(arg_17_2)

	var_17_1:RefreshData(formatReward(var_17_0))
	var_17_1:RegistCallBack(function(arg_18_0)
		if arg_17_0.clickCallback_ then
			if arg_17_0.clickCallback_() then
				ShowPopItem(arg_17_0.popType_, arg_18_0)
			end
		else
			ShowPopItem(arg_17_0.popType_, arg_18_0)
		end
	end)

	if arg_17_0.receivedControllerList_[arg_17_1] == nil then
		arg_17_0.receivedControllerList_[arg_17_1] = ControllerUtil.GetController(var_17_1.transform_, "received")
	end

	arg_17_0.receivedControllerList_[arg_17_1]:SetSelectedState(tostring(SkinTrialData:IsCompleted(arg_17_0.skinTrialID_)))
end

function var_0_0.AddTimer(arg_19_0)
	if manager.time:GetServerTime() >= arg_19_0.stopTime_ then
		arg_19_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_19_0.textTime_.text = manager.time:GetLostTimeStr(arg_19_0.stopTime_)
	arg_19_0.timer_ = Timer.New(function()
		if manager.time:GetServerTime() >= arg_19_0.stopTime_ then
			arg_19_0:StopTimer()

			arg_19_0.textTime_.text = GetTips("TIME_OVER")

			return
		end

		arg_19_0.textTime_.text = manager.time:GetLostTimeStr(arg_19_0.stopTime_)
	end, 1, -1)

	arg_19_0.timer_:Start()
end

function var_0_0.StopTimer(arg_21_0)
	if arg_21_0.timer_ then
		arg_21_0.timer_:Stop()

		arg_21_0.timer_ = nil
	end
end

function var_0_0.SaveRoute(arg_22_0)
	local var_22_0 = {
		name = "skinTrialSelectView_2_0",
		activityID = arg_22_0.activityID_,
		skinTrialID = arg_22_0.skinTrialID_
	}

	SkinTrialData:SaveRoute(var_22_0)
end

return var_0_0
