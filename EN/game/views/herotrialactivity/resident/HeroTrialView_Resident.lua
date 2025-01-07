local var_0_0 = class("HeroTrialView_Resident", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = Asset.Load(arg_1_0:UIName(arg_1_2))

	arg_1_0.gameObject_ = Object.Instantiate(var_1_0, arg_1_1.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.activityID_ = arg_1_2

	arg_1_0:Init()
end

function var_0_0.UIName(arg_2_0, arg_2_1)
	return HeroTrialTools.GetMainUIName(arg_2_1)
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.heroItemList_ = {}
	arg_4_0.onClickTrialHandler_ = handler(arg_4_0, arg_4_0.OnClickTrial)
	arg_4_0.onActivityUpdateHandler_ = handler(arg_4_0, arg_4_0.OnActivityUpdate)
	arg_4_0.heroImage_.immediate = true

	arg_4_0:InitController()
	arg_4_0:InitStaticText()
	arg_4_0:InitRewardItem()
end

function var_0_0.InitController(arg_5_0)
	arg_5_0.rewardController_ = arg_5_0.rewardControllerEx_:GetController("reward")
end

function var_0_0.InitStaticText(arg_6_0)
	arg_6_0.activityTitle_.text = GetTips("ACTIVITY_HERO_TRIAL_TITLE")
	arg_6_0.previewText_.text = GetTips("ACTIVITY_HERO_TRIAL_PREVIEW")
	arg_6_0.battleBtnText_.text = GetTips("ACTIVITY_HERO_TRIAL_START")
end

function var_0_0.InitRewardItem(arg_7_0)
	arg_7_0.rewardItemList_ = {}
	arg_7_0.itemDataList_ = {}

	local var_7_0 = arg_7_0.rewardPanelTrans_.childCount

	for iter_7_0 = 1, var_7_0 do
		arg_7_0.rewardItemList_[iter_7_0] = CommonItemView.New(arg_7_0.rewardPanelTrans_:GetChild(iter_7_0 - 1).gameObject, true)
		arg_7_0.itemDataList_[iter_7_0] = clone(ItemTemplateData)
		arg_7_0.itemDataList_[iter_7_0].clickFun = function(arg_8_0)
			ShowPopItem(POP_ITEM, {
				arg_8_0.id,
				arg_8_0.number
			})
		end
	end
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.receiveBtn_, nil, function()
		HeroTrialAction.GetTrialReward(arg_9_0.activityID_, arg_9_0.selectActivityHeroID_, function(arg_11_0)
			if isSuccess(arg_11_0.result) then
				getReward(formatRewardCfgList(ActivityHeroTrialCfg[arg_9_0.selectActivityHeroID_].reward_list))
				arg_9_0:RefreshReward()
			else
				ShowTips(arg_11_0.result)
			end
		end)
	end)
	arg_9_0:AddBtnListener(arg_9_0.previewBtn_, nil, function()
		local var_12_0 = {}

		for iter_12_0, iter_12_1 in ipairs(arg_9_0.activityHeroIDList_) do
			local var_12_1 = HeroTrialTools.GetHeroStandardID(iter_12_1)

			table.insert(var_12_0, var_12_1)
		end

		arg_9_0:Go("/newHero", {
			isEnter = true,
			hid = HeroTrialTools.GetHeroStandardID(arg_9_0.selectActivityHeroID_),
			type = HeroConst.HERO_DATA_TYPE.TRIAL,
			tempHeroList = var_12_0
		})
	end)
	arg_9_0:AddBtnListener(arg_9_0.battleBtn_, nil, function()
		HeroTrialData:SaveStageID(arg_9_0.selectActivityHeroID_)
		HeroTrialData:SetBattleWay(ActivityHeroTrialConst.BATTLE_WAY.ACTIVITY)
		arg_9_0:Go("/sectionSelectHero", {
			section = ActivityHeroTrialCfg[arg_9_0.selectActivityHeroID_].stage_id,
			sectionType = BattleConst.STAGE_TYPE_NEW.HERO_TRIAL,
			activityID = arg_9_0.activityID_
		})
	end)
	arg_9_0:AddBtnListener(arg_9_0.descBtn_, nil, function()
		local var_14_0 = GetTips("ACTIVITY_HERO_TRIAL_DESCRIPE")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "ACTIVITY_HERO_TRIAL_DESCRIPE",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_14_0
		})
	end)
end

function var_0_0.UpdateBar(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)

	for iter_16_0, iter_16_1 in pairs(arg_16_0.rewardItemList_) do
		iter_16_1:Dispose()
	end

	arg_16_0.rewardItemList_ = nil
	arg_16_0.itemDataList_ = nil

	for iter_16_2, iter_16_3 in pairs(arg_16_0.heroItemList_) do
		iter_16_3:Dispose()
	end

	arg_16_0.heroItemList_ = nil
end

function var_0_0.Show(arg_17_0, arg_17_1)
	SetActive(arg_17_0.gameObject_, arg_17_1)

	if arg_17_1 == true then
		arg_17_0:OnEnable()
	else
		arg_17_0:OnDisable()
	end
end

function var_0_0.OnEnable(arg_18_0)
	arg_18_0:InitActivityList()

	if #arg_18_0.activityHeroIDList_ == 0 then
		ShowTips("TIME_OVER")
		arg_18_0:Back()

		return
	end

	arg_18_0:InitSelectActivityHeroID()
	arg_18_0:ScrollToLastPos()
	arg_18_0:RefreshHeroItem()
	arg_18_0:RefreshUI()
	arg_18_0:UpdateStopTime()
	arg_18_0:AddTimer()
	arg_18_0:RegistEventListener(HERO_TRIAL_CLICK, arg_18_0.onClickTrialHandler_)
	arg_18_0:RegistEventListener(ACTIVITY_UPDATE, arg_18_0.onActivityUpdateHandler_)
end

function var_0_0.OnDisable(arg_19_0)
	arg_19_0:StopTimer()
	arg_19_0:RemoveAllEventListener()
	arg_19_0:SaveLastScrollPos()
end

function var_0_0.InitActivityList(arg_20_0)
	arg_20_0.activityHeroIDList_ = {}

	for iter_20_0, iter_20_1 in ipairs(ActivityCfg[arg_20_0.activityID_].sub_activity_list) do
		if ActivityData:GetActivityIsOpen(iter_20_1) then
			local var_20_0 = ActivityHeroTrialCfg.get_id_list_by_activity_id[iter_20_1]

			for iter_20_2, iter_20_3 in ipairs(var_20_0) do
				arg_20_0.activityHeroIDList_[#arg_20_0.activityHeroIDList_ + 1] = iter_20_3
			end
		end
	end

	local var_20_1 = HeroTrialData:GetHeroTrialStateList()

	table.sort(arg_20_0.activityHeroIDList_, function(arg_21_0, arg_21_1)
		local var_21_0 = var_20_1[arg_21_0]
		local var_21_1 = var_20_1[arg_21_1]

		if var_21_0 ~= var_21_1 then
			return var_21_0 < var_21_1
		else
			return arg_21_0 < arg_21_1
		end
	end)
end

function var_0_0.InitSelectActivityHeroID(arg_22_0)
	local var_22_0 = HeroTrialData:GetSelectActivityHeroID(arg_22_0.activityID_)

	if not var_22_0 or not table.indexof(arg_22_0.activityHeroIDList_, var_22_0) then
		var_22_0 = arg_22_0.activityHeroIDList_[1]
	end

	arg_22_0.selectActivityHeroID_ = var_22_0

	HeroTrialData:SetSelectActivityHeroID(arg_22_0.activityID_, arg_22_0.selectActivityHeroID_)
end

function var_0_0.ScrollToLastPos(arg_23_0)
	local var_23_0 = HeroTrialData:GetLastContentPosX(arg_23_0.activityID_)

	if var_23_0 then
		arg_23_0.goItemParentTrans_:SetAnchoredPositionX(var_23_0)
	end
end

function var_0_0.SaveLastScrollPos(arg_24_0)
	local var_24_0 = arg_24_0.goItemParentTrans_:GetAnchoredPositionX(nil)

	HeroTrialData:SetLastContentPosX(arg_24_0.activityID_, var_24_0)
end

function var_0_0.RefreshHeroItem(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.activityHeroIDList_) do
		if arg_25_0.heroItemList_[iter_25_0] then
			arg_25_0.heroItemList_[iter_25_0]:SetActivityHeroID(arg_25_0.activityID_, iter_25_1)
		else
			arg_25_0.heroItemList_[iter_25_0] = arg_25_0:GetHeroTrialSelectItemClass().New(arg_25_0.heroItemGo_, arg_25_0.goItemParentTrans_, iter_25_1, arg_25_0.activityID_)
		end
	end

	for iter_25_2 = #arg_25_0.heroItemList_, #arg_25_0.activityHeroIDList_ + 1, -1 do
		arg_25_0.heroItemList_[iter_25_2]:Dispose()

		arg_25_0.heroItemList_[iter_25_2] = nil
	end

	arg_25_0:RefreshSelectActivityHero()
end

function var_0_0.RefreshSelectActivityHero(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.heroItemList_) do
		iter_26_1:OnSelect(arg_26_0.selectActivityHeroID_)
	end
end

function var_0_0.OnClickTrial(arg_27_0, arg_27_1)
	arg_27_0.selectActivityHeroID_ = arg_27_1

	HeroTrialData:SetSelectActivityHeroID(arg_27_0.activityID_, arg_27_0.selectActivityHeroID_)
	arg_27_0:RefreshUI()
	arg_27_0:RefreshSelectActivityHero()
	arg_27_0:UpdateStopTime()
end

function var_0_0.OnActivityUpdate(arg_28_0, arg_28_1)
	if ActivityCfg[arg_28_1].activity_template == ActivityTemplateConst.SUB_HERO_TRIAL then
		arg_28_0:InitActivityList()

		if #arg_28_0.activityHeroIDList_ == 0 then
			ShowTips("TIME_OVER")
			arg_28_0:Back()

			return
		end

		arg_28_0:InitSelectActivityHeroID()
		arg_28_0:RefreshHeroItem()
		arg_28_0:RefreshUI()
	end
end

function var_0_0.GetHeroTrialSelectItemClass(arg_29_0)
	return HeroTrialSelectItem_Resident
end

function var_0_0.RefreshUI(arg_30_0)
	arg_30_0:RefreshHeroUI()
	arg_30_0:RefreshReward()
end

function var_0_0.RefreshHeroUI(arg_31_0)
	arg_31_0:GetHeroCfg()
	arg_31_0:RefreshHeroImage()
	arg_31_0:RefreshHeroName()
	arg_31_0:RefreshRangeType()
	arg_31_0:RefreshChargeType()
	arg_31_0:RefreshAttackType()
	arg_31_0:RefreshRace()
	arg_31_0:RefreshRare()
end

function var_0_0.GetHeroCfg(arg_32_0)
	local var_32_0 = HeroTrialTools.GetHeroStandardID(arg_32_0.selectActivityHeroID_)

	arg_32_0.heroID_ = HeroStandardSystemCfg[var_32_0].hero_id
	arg_32_0.heroCfg_ = HeroCfg[arg_32_0.heroID_]
end

function var_0_0.RefreshHeroImage(arg_33_0)
	local var_33_0 = HeroTrialTools.GetHeroStandardID(arg_33_0.selectActivityHeroID_)

	arg_33_0.heroImage_.spriteSync = "TextureConfig/Character/Portrait/" .. SkinCfg[HeroStandardSystemCfg[var_33_0].skin_id].picture_id
end

function var_0_0.RefreshHeroName(arg_34_0)
	arg_34_0.heroName_.text = arg_34_0.heroCfg_.name
	arg_34_0.heroSuffixName_.text = arg_34_0.heroCfg_.suffix
	arg_34_0.rewardTitle_.text = string.format(GetTips("COMPLETE_TRAIL_STAGE"), HeroTools.GetHeroFullName(arg_34_0.heroID_))
end

function var_0_0.RefreshRangeType(arg_35_0)
	arg_35_0.rangeTypeText_.text = CharactorParamCfg[arg_35_0.heroID_].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")
end

function var_0_0.RefreshChargeType(arg_36_0)
	local var_36_0 = arg_36_0.heroCfg_.mechanism_type[1]

	if var_36_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_36_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_36_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_36_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_36_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_36_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_36_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_36_0.chargeTypeText_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.RefreshAttackType(arg_37_0)
	if arg_37_0.atackTypeIcon_ then
		arg_37_0.atackTypeIcon_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_37_0.heroID_)
	end
end

function var_0_0.RefreshRace(arg_38_0)
	arg_38_0.raceImg_.sprite = HeroTools.GetHeroRaceIcon(arg_38_0.heroCfg_.id)
end

function var_0_0.RefreshRare(arg_39_0)
	arg_39_0.rareImg_.sprite = HeroTools.GetHeroRareSprite(arg_39_0.heroCfg_.id)
end

function var_0_0.RefreshReward(arg_40_0)
	arg_40_0:RefreshRewardState()
	arg_40_0:RefreshRewardItem()
end

function var_0_0.RefreshRewardState(arg_41_0)
	arg_41_0.rewardState_ = HeroTrialData:GetHeroTrialStateList()[arg_41_0.selectActivityHeroID_]

	if arg_41_0.rewardState_ then
		if arg_41_0.rewardState_ == ActivityHeroTrialConst.REWARD_STATE.RECEIVE then
			arg_41_0.rewardController_:SetSelectedState("receive")
		elseif arg_41_0.rewardState_ == ActivityHeroTrialConst.REWARD_STATE.COMPLETE then
			arg_41_0.rewardController_:SetSelectedState("clear")
		else
			arg_41_0.rewardController_:SetSelectedState("normal")
		end
	else
		arg_41_0.rewardController_:SetSelectedState("normal")
	end
end

function var_0_0.RefreshRewardItem(arg_42_0)
	local var_42_0 = ActivityHeroTrialCfg[arg_42_0.selectActivityHeroID_].reward_list

	for iter_42_0, iter_42_1 in ipairs(var_42_0) do
		arg_42_0.itemDataList_[iter_42_0].id = iter_42_1[1]
		arg_42_0.itemDataList_[iter_42_0].number = iter_42_1[2]

		arg_42_0.rewardItemList_[iter_42_0]:SetData(arg_42_0.itemDataList_[iter_42_0])
	end

	for iter_42_2 = #var_42_0 + 1, #arg_42_0.rewardItemList_ do
		arg_42_0.rewardItemList_[iter_42_2]:SetData(nil)
	end
end

function var_0_0.UpdateStopTime(arg_43_0)
	local var_43_0 = ActivityHeroTrialCfg[arg_43_0.selectActivityHeroID_].activity_id

	arg_43_0.stopTime_ = ActivityData:GetActivityData(var_43_0).stopTime
end

function var_0_0.AddTimer(arg_44_0)
	if manager.time:GetServerTime() >= arg_44_0.stopTime_ then
		arg_44_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_44_0:StopTimer()

	arg_44_0.textTime_.text = manager.time:GetLostTimeStrWith2UnitWithPrefix(arg_44_0.stopTime_)
	arg_44_0.timer_ = Timer.New(handler(arg_44_0, arg_44_0.UpdateTimer), 1, -1)

	arg_44_0.timer_:Start()
end

function var_0_0.StopTimer(arg_45_0)
	if arg_45_0.timer_ then
		arg_45_0.timer_:Stop()

		arg_45_0.timer_ = nil
	end
end

function var_0_0.UpdateTimer(arg_46_0)
	if manager.time:GetServerTime() >= arg_46_0.stopTime_ then
		arg_46_0:StopTimer()

		arg_46_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_46_0.textTime_.text = manager.time:GetLostTimeStrWith2UnitWithPrefix(arg_46_0.stopTime_)
end

return var_0_0
