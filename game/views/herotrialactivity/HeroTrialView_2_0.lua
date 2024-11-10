local var_0_0 = class("HeroTrialView_2_0", ReduxView)

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
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.heroItemList_ = {}
	arg_3_0.rewardItemList_ = {}
	arg_3_0.itemDataList_ = {}
	arg_3_0.controller_ = ControllerUtil.GetController(arg_3_0.transformBtn_, "name")
	arg_3_0.onClickTrialHandler_ = handler(arg_3_0, arg_3_0.OnClickTrial)
	arg_3_0.OnActivityUpdateHandler_ = handler(arg_3_0, arg_3_0.OnActivityUpdate)
	arg_3_0.adaptImg_ = arg_3_0:FindCom("AdaptImage", nil, arg_3_0.imageIcon_.transform)
	arg_3_0.attackTypeController_ = ControllerUtil.GetController(arg_3_0.transform_, "attackType")

	if not arg_3_0.atackTypeIcon_ then
		local var_3_0 = arg_3_0.transform_:Find("right_adapt/panel/right/property/type/icon")

		if var_3_0 then
			arg_3_0.atackTypeIcon_ = var_3_0:GetComponent("Image")
		end
	end
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btnReceive_, nil, function()
		HeroTrialAction.GetTrialReward(arg_4_0.activityID_, arg_4_0.selectActivityHeroID_, function(arg_6_0)
			if isSuccess(arg_6_0.result) then
				getReward(formatRewardCfgList(ActivityHeroTrialCfg[arg_4_0.selectActivityHeroID_].reward_list))
				arg_4_0:RefreshReward()
			else
				ShowTips(arg_6_0.result)
			end
		end)
	end)
	arg_4_0:AddBtnListener(arg_4_0.btnTrial_, nil, function()
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in ipairs(arg_4_0.activityHeroIDList_) do
			local var_7_1 = HeroTrialTools.GetHeroStandardID(iter_7_1)

			table.insert(var_7_0, var_7_1)
		end

		arg_4_0:Go("/newHero", {
			isEnter = true,
			hid = HeroTrialTools.GetHeroStandardID(arg_4_0.selectActivityHeroID_),
			type = HeroConst.HERO_DATA_TYPE.TRIAL,
			tempHeroList = var_7_0
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.btnBattle_, nil, function()
		HeroTrialData:SaveStageID(arg_4_0.selectActivityHeroID_)
		HeroTrialData:SetBattleWay(ActivityHeroTrialConst.BATTLE_WAY.ACTIVITY)
		arg_4_0:Go("/sectionSelectHero", {
			section = ActivityHeroTrialCfg[arg_4_0.selectActivityHeroID_].stage_id,
			sectionType = BattleConst.STAGE_TYPE_NEW.HERO_TRIAL,
			activityID = arg_4_0.activityID_
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.descBtn_, nil, function()
		local var_9_0 = GetTips("ACTIVITY_HERO_TRIAL_DESCRIPE")

		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "ACTIVITY_HERO_TRIAL_DESCRIPE",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = var_9_0
		})
	end)
end

function var_0_0.UpdateBar(arg_10_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.Dispose(arg_11_0)
	var_0_0.super.Dispose(arg_11_0)

	for iter_11_0, iter_11_1 in pairs(arg_11_0.rewardItemList_) do
		iter_11_1:Dispose()
	end

	arg_11_0.rewardItemList_ = nil
	arg_11_0.itemDataList_ = nil

	for iter_11_2, iter_11_3 in pairs(arg_11_0.heroItemList_) do
		iter_11_3:Dispose()
	end

	arg_11_0.heroItemList_ = nil
end

function var_0_0.OnEnable(arg_12_0)
	arg_12_0:InitActivityList()
	arg_12_0:RefreshHeroItem()
	arg_12_0:RefreshUI()
	arg_12_0:UpdateStopTime()
	arg_12_0:AddTimer()
	arg_12_0:RegistEventListener(HERO_TRIAL_CLICK, arg_12_0.onClickTrialHandler_)
	arg_12_0:RegistEventListener(ACTIVITY_UPDATE, arg_12_0.OnActivityUpdateHandler_)
end

function var_0_0.OnDisable(arg_13_0)
	arg_13_0:StopTimer()
	arg_13_0:RemoveAllEventListener()
end

function var_0_0.InitActivityList(arg_14_0)
	arg_14_0.activityHeroIDList_ = {}

	for iter_14_0, iter_14_1 in ipairs(ActivityCfg[arg_14_0.activityID_].sub_activity_list) do
		if ActivityData:GetActivityIsOpen(iter_14_1) then
			local var_14_0 = ActivityHeroTrialCfg.get_id_list_by_activity_id[iter_14_1]

			for iter_14_2, iter_14_3 in ipairs(var_14_0) do
				arg_14_0.activityHeroIDList_[#arg_14_0.activityHeroIDList_ + 1] = iter_14_3
			end
		end
	end

	local var_14_1 = HeroTrialData:GetHeroTrialStateList()

	table.sort(arg_14_0.activityHeroIDList_, function(arg_15_0, arg_15_1)
		local var_15_0 = var_14_1[arg_15_0]
		local var_15_1 = var_14_1[arg_15_1]

		if var_15_0 ~= var_15_1 then
			return var_15_0 < var_15_1
		else
			return arg_15_0 < arg_15_1
		end
	end)
	arg_14_0:InitSelectActivityHeroID()
end

function var_0_0.InitSelectActivityHeroID(arg_16_0)
	local var_16_0 = HeroTrialData:GetSelectActivityHeroID(arg_16_0.activityID_)

	if not var_16_0 or not table.indexof(arg_16_0.activityHeroIDList_, var_16_0) then
		var_16_0 = arg_16_0.activityHeroIDList_[1]
	end

	arg_16_0.selectActivityHeroID_ = var_16_0

	HeroTrialData:SetSelectActivityHeroID(arg_16_0.activityID_, arg_16_0.selectActivityHeroID_)
end

function var_0_0.RefreshHeroItem(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.activityHeroIDList_) do
		if arg_17_0.heroItemList_[iter_17_0] then
			arg_17_0.heroItemList_[iter_17_0]:SetActivityHeroID(arg_17_0.activityID_, iter_17_1)
		else
			arg_17_0.heroItemList_[iter_17_0] = arg_17_0:GetHeroTrialSelectItemClass().New(arg_17_0.goItem_, arg_17_0.goItemParent_, iter_17_1, arg_17_0.activityID_)
		end
	end

	for iter_17_2 = #arg_17_0.heroItemList_, #arg_17_0.activityHeroIDList_ + 1, -1 do
		arg_17_0.heroItemList_[iter_17_2]:Dispose()

		arg_17_0.heroItemList_[iter_17_2] = nil
	end

	arg_17_0:RefreshSelectActivityHero()
end

function var_0_0.RefreshSelectActivityHero(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.heroItemList_) do
		iter_18_1:OnSelect(arg_18_0.selectActivityHeroID_)
	end
end

function var_0_0.OnClickTrial(arg_19_0, arg_19_1)
	arg_19_0.selectActivityHeroID_ = arg_19_1

	HeroTrialData:SetSelectActivityHeroID(arg_19_0.activityID_, arg_19_0.selectActivityHeroID_)
	arg_19_0:RefreshUI()
	arg_19_0:RefreshSelectActivityHero()
	arg_19_0:UpdateStopTime()
end

function var_0_0.GetHeroTrialSelectItemClass(arg_20_0)
	return HeroTrialSelectItem_2_0
end

function var_0_0.RefreshUI(arg_21_0)
	arg_21_0:GetHeroCfg()
	arg_21_0:RefreshHeroImage()
	arg_21_0:RefreshHeroName()
	arg_21_0:RefreshRangeType()
	arg_21_0:RefreshChargeType()
	arg_21_0:RefreshAttackType()
	arg_21_0:RefreshRace()
	arg_21_0:RefreshRare()
	arg_21_0:RefreshReward()
end

function var_0_0.GetHeroCfg(arg_22_0)
	local var_22_0 = HeroTrialTools.GetHeroStandardID(arg_22_0.selectActivityHeroID_)

	arg_22_0.heroID_ = HeroStandardSystemCfg[var_22_0].hero_id
	arg_22_0.heroCfg_ = HeroCfg[arg_22_0.heroID_]
end

function var_0_0.RefreshHeroImage(arg_23_0)
	local var_23_0 = HeroTrialTools.GetHeroStandardID(arg_23_0.selectActivityHeroID_)
	local var_23_1 = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. SkinCfg[HeroStandardSystemCfg[var_23_0].skin_id].picture_id)

	if var_23_1 ~= nil then
		arg_23_0.imageIcon_.sprite = var_23_1
	end

	arg_23_0.imageIcon_:SetNativeSize()

	if arg_23_0.adaptImg_ then
		arg_23_0.adaptImg_:AdaptImg()
	end
end

function var_0_0.RefreshHeroName(arg_24_0)
	local var_24_0 = HeroTools.GetHeroFullName(arg_24_0.heroID_)

	arg_24_0:RefreshTextName(var_24_0)

	local var_24_1 = GetTips("COMPLETE_TRAIL_STAGE")

	arg_24_0.textTips_.text = string.format(var_24_1, var_24_0)
end

function var_0_0.RefreshTextName(arg_25_0, arg_25_1)
	local var_25_0 = string.split(arg_25_1, "·")

	arg_25_0.textName_.text = GetI18NText(var_25_0[1])
	arg_25_0.textSubName_.text = GetI18NText(var_25_0[2])
end

function var_0_0.RefreshRangeType(arg_26_0)
	arg_26_0.rangeTypeText_.text = CharactorParamCfg[arg_26_0.heroID_].RangeType == 0 and GetTips("RANGETYPE_CLOSE") or GetTips("RANGETYPE_LONG")
end

function var_0_0.RefreshChargeType(arg_27_0)
	local var_27_0 = arg_27_0.heroCfg_.mechanism_type[1]

	if var_27_0 == HeroConst.HERO_CHARGE_TYPE.RAGE then
		arg_27_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_1")
	elseif var_27_0 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
		arg_27_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_2")
	elseif var_27_0 == HeroConst.HERO_CHARGE_TYPE.TRACES then
		arg_27_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_3")
	elseif var_27_0 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
		arg_27_0.chargeType_.text = GetTips("NOTE_ENERGYTYPE_4")
	end
end

function var_0_0.RefreshAttackType(arg_28_0)
	if arg_28_0.atackTypeIcon_ then
		arg_28_0.atackTypeIcon_.sprite = HeroTools.GetHeroSkillAttributeIcon(arg_28_0.heroCfg_.id)
	elseif arg_28_0.attackTypeController_ then
		if #arg_28_0.heroCfg_.ATK_attribute > 1 then
			arg_28_0.attackTypeController_:SetSelectedState(-1)
		else
			arg_28_0.attackTypeController_:SetSelectedState(arg_28_0.heroCfg_.ATK_attribute[1])
		end
	end
end

function var_0_0.RefreshRace(arg_29_0)
	arg_29_0.imageRace_.sprite = HeroTools.GetHeroRaceIcon(arg_29_0.heroCfg_.id)
end

function var_0_0.RefreshRare(arg_30_0)
	arg_30_0.imageLv_.sprite = HeroTools.GetHeroRareSprite(arg_30_0.heroCfg_.id)
end

function var_0_0.GetRewardItem(arg_31_0, arg_31_1)
	return HeroTrialRewardItem_2_0.New(arg_31_0.goRewardPanel_, arg_31_0.rewardItemGo_, arg_31_1, true)
end

function var_0_0.RefreshReward(arg_32_0)
	arg_32_0:RefreshRewardState()
	arg_32_0:RefreshRewardItem()
end

function var_0_0.RefreshRewardState(arg_33_0)
	arg_33_0.rewardState_ = HeroTrialData:GetHeroTrialStateList()[arg_33_0.selectActivityHeroID_]

	if arg_33_0.rewardState_ then
		if arg_33_0.rewardState_ == ActivityHeroTrialConst.REWARD_STATE.RECEIVE then
			arg_33_0.controller_:SetSelectedState("receive")
		elseif arg_33_0.rewardState_ == ActivityHeroTrialConst.REWARD_STATE.COMPLETE then
			arg_33_0.controller_:SetSelectedState("complete")
		else
			arg_33_0.controller_:SetSelectedState("not")
		end
	else
		arg_33_0.controller_:SetSelectedState("not")
	end
end

function var_0_0.RefreshRewardItem(arg_34_0)
	local var_34_0 = ActivityHeroTrialCfg[arg_34_0.selectActivityHeroID_].reward_list

	for iter_34_0 = 1, 3 do
		local var_34_1 = var_34_0[iter_34_0]

		if not arg_34_0.itemDataList_[iter_34_0] then
			arg_34_0.itemDataList_[iter_34_0] = clone(ItemTemplateData)
			arg_34_0.itemDataList_[iter_34_0].clickFun = function(arg_35_0)
				ShowPopItem(POP_ITEM, {
					arg_35_0.id,
					arg_35_0.number
				})
			end
		end

		local var_34_2 = true

		if var_34_1 then
			arg_34_0.itemDataList_[iter_34_0].id = var_34_1[1]
			arg_34_0.itemDataList_[iter_34_0].number = var_34_1[2]
			arg_34_0.itemDataList_[iter_34_0].completedFlag = arg_34_0.rewardState_ == 2
			var_34_2 = false
		end

		if arg_34_0.rewardItemList_[iter_34_0] == nil then
			arg_34_0.rewardItemList_[iter_34_0] = CommonItemPool.New(arg_34_0.goRewardPanel_, nil, true)
		end

		if not var_34_2 then
			arg_34_0.rewardItemList_[iter_34_0]:SetData(arg_34_0.itemDataList_[iter_34_0])
		else
			arg_34_0.rewardItemList_[iter_34_0]:SetData(nil)
		end
	end
end

function var_0_0.UpdateStopTime(arg_36_0)
	local var_36_0 = ActivityHeroTrialCfg[arg_36_0.selectActivityHeroID_].activity_id

	arg_36_0.stopTime_ = ActivityData:GetActivityData(var_36_0).stopTime
end

function var_0_0.AddTimer(arg_37_0)
	if manager.time:GetServerTime() >= arg_37_0.stopTime_ then
		arg_37_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_37_0:StopTimer()

	arg_37_0.textTime_.text = manager.time:GetLostTimeStrWith2Unit(arg_37_0.stopTime_)
	arg_37_0.timer_ = Timer.New(handler(arg_37_0, arg_37_0.UpdateTimer), 1, -1)

	arg_37_0.timer_:Start()
end

function var_0_0.StopTimer(arg_38_0)
	if arg_38_0.timer_ then
		arg_38_0.timer_:Stop()

		arg_38_0.timer_ = nil
	end
end

function var_0_0.UpdateTimer(arg_39_0)
	if manager.time:GetServerTime() >= arg_39_0.stopTime_ then
		arg_39_0:StopTimer()

		arg_39_0.textTime_.text = GetTips("TIME_OVER")

		return
	end

	arg_39_0.textTime_.text = manager.time:GetLostTimeStrWith2Unit(arg_39_0.stopTime_)
end

function var_0_0.OnActivityUpdate(arg_40_0, arg_40_1)
	if ActivityCfg[arg_40_1].activity_template == ActivityTemplateConst.SUB_HERO_TRIAL then
		arg_40_0:InitActivityList()
		arg_40_0:RefreshHeroItem()
		arg_40_0:RefreshUI()
	end
end

function var_0_0.Show(arg_41_0, arg_41_1)
	SetActive(arg_41_0.gameObject_, arg_41_1)

	if arg_41_1 == true then
		arg_41_0:OnEnable()
	else
		arg_41_0:OnDisable()
	end
end

return var_0_0
