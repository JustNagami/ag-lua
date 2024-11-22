local var_0_0 = class("SPHeroChallengeTrainStageView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SPHeroChallenge/SPHeroChallengeTrainStageUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.offsetController = arg_5_0.controller:GetController("offset")
	arg_5_0.stateController = arg_5_0.controller:GetController("state")
	arg_5_0.affixItem = {}

	for iter_5_0 = 1, 3 do
		arg_5_0.affixItem[iter_5_0] = SPHeroChallengeAffixItem.New(arg_5_0["progressdesc" .. iter_5_0 .. "Go_"])
	end
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.trainType = arg_6_0.params_.trainType

	if arg_6_0.params_.playAnimation then
		arg_6_0.animator:Play("Fx_SPHeroChallengeTrainStageUI_cx", 0, 0)

		arg_6_0.params_.playAnimation = nil
	end

	arg_6_0.activityID = SPHeroChallengeData:GetActivityID()
	arg_6_0.info = SPHeroChallengeData:GetCurActivityInfo()

	arg_6_0:RefreshProficiency()
	arg_6_0:RefreshTrainEffectDesc()
	arg_6_0:RefreshStageInfo()
	arg_6_0:RefreshBar()
	arg_6_0:RefreshBackBtnState()
	arg_6_0:RefreshTrainIconAndName()
end

function var_0_0.OnTop(arg_7_0)
	return
end

function var_0_0.OnBehind(arg_8_0)
	arg_8_0:RefreshBackBtnState()
end

function var_0_0.RefreshBar(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.windowBar:RegistBackCallBack(function()
		JumpTools.OpenPageByJump("/spHeroChallengeBattleToggleView", {
			groupIndex = SpHeroChallengeConst.ChapterType.train
		})
	end)
end

function var_0_0.OnExit(arg_11_0)
	manager.windowBar:HideBar()
	arg_11_0:RemoveAllEventListener()
end

function var_0_0.AddUIListener(arg_12_0)
	arg_12_0:AddBtnListener(arg_12_0.backBtn_, nil, function()
		if arg_12_0:IsOpenSectionView() then
			arg_12_0:Back()
			arg_12_0:RefreshBackBtnState()
		end
	end)
end

function var_0_0.RegisterEvents(arg_14_0)
	return
end

function var_0_0.Dispose(arg_15_0)
	if arg_15_0.stageInfoList then
		for iter_15_0, iter_15_1 in pairs(arg_15_0.stageInfoList) do
			iter_15_1:Dispose()
		end
	end

	if arg_15_0.affixItem then
		for iter_15_2, iter_15_3 in ipairs(arg_15_0.affixItem) do
			iter_15_3:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.RefreshProficiency(arg_16_0)
	if arg_16_0.info then
		local var_16_0, var_16_1 = arg_16_0.info:GetTrainNumByType(arg_16_0.trainType)
		local var_16_2 = string.format("%.2f", var_16_0 / var_16_1)

		arg_16_0.sliderSlr_.value = var_16_2
		arg_16_0.curNumText_.text = math.min(var_16_0, var_16_1)
	end
end

function var_0_0.RefreshTrainEffectDesc(arg_17_0)
	if arg_17_0.affixItem then
		for iter_17_0, iter_17_1 in ipairs(arg_17_0.affixItem) do
			iter_17_1:RefreshUI(arg_17_0.trainType, iter_17_0)
		end
	end
end

function var_0_0.RefreshStageInfo(arg_18_0)
	local var_18_0 = BattleVerthandiExclusiveCfg.get_id_list_by_sub_type[arg_18_0.trainType]

	if not arg_18_0.stageInfoList then
		arg_18_0.stageInfoList = {}

		for iter_18_0 = 1, #var_18_0 do
			arg_18_0.stageInfoList[iter_18_0] = SPHeroChallengeTrainStageItem.New(arg_18_0["trainstageitem" .. iter_18_0 .. "Go_"])
		end
	end

	for iter_18_1 = 1, #var_18_0 do
		arg_18_0.stageInfoList[iter_18_1]:RefreshUI(var_18_0[iter_18_1], arg_18_0.stageID, iter_18_1)
		arg_18_0.stageInfoList[iter_18_1]:RegisterClickCallBack(handler(arg_18_0, arg_18_0.ClickStageHandle))
	end
end

function var_0_0.ClickStageHandle(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.stageID = arg_19_1
	arg_19_0.selectIndex = arg_19_2

	JumpTools.OpenPageByJump("spHeroChallengeSectionView", {
		section = arg_19_0.stageID,
		sectionType = BattleConst.STAGE_TYPE_NEW.SP_HERO_CHALLENGE_BATTLE_3_1,
		activityId = arg_19_0.params_.activityId,
		challengeType = SpHeroChallengeConst.ChapterType.train
	})
	arg_19_0:RefreshBackBtnState(arg_19_2)
	arg_19_0:RefreshStageInfo()
end

function var_0_0.IsOpenSectionView(arg_20_0)
	return arg_20_0:IsOpenRoute("spHeroChallengeSectionView")
end

function var_0_0.RefreshBackBtnState(arg_21_0)
	if arg_21_0:IsOpenSectionView() then
		SetActive(arg_21_0.backBtn_.gameObject, true)

		if arg_21_0.selectIndex then
			arg_21_0.offsetController:SetSelectedState(tostring(arg_21_0.selectIndex))
		end
	else
		SetActive(arg_21_0.backBtn_.gameObject, false)
		arg_21_0.offsetController:SetSelectedState("ori")
	end
end

function var_0_0.RefreshTrainIconAndName(arg_22_0)
	local var_22_0, var_22_1 = SPHeroChallengeTools:GetTrainNameAndIcon(arg_22_0.trainType)

	arg_22_0.name.text = var_22_0
	arg_22_0.icon.sprite = var_22_1
	arg_22_0.descText_.text = var_22_0 .. GetTips("TIP_CLEARTIMES")

	arg_22_0.stateController:SetSelectedState(tostring(arg_22_0.trainType))
end

return var_0_0
