local var_0_0 = class("WeekBossHeroView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Monster/V4_2_GodEaterUI_Monster_SelectroleUI"
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

	arg_4_0.selectController_ = arg_4_0.transCon_:GetController("select")
	arg_4_0.tipBtnController_ = arg_4_0.tipsCon_:GetController("btn")
	arg_4_0.tipStatusController_ = arg_4_0.tipsCon_:GetController("status")
	arg_4_0.groupStatusController_ = {}
	arg_4_0.skillAnim_ = {}
	arg_4_0.bigTalentAnim_ = {}

	for iter_4_0 = 1, 2 do
		arg_4_0.groupStatusController_[iter_4_0] = arg_4_0["groupCon_" .. iter_4_0]:GetController("status")
		arg_4_0.skillAnim_[iter_4_0] = arg_4_0["skillAnim_" .. iter_4_0]
		arg_4_0.bigTalentAnim_[iter_4_0] = arg_4_0["bigTalentAnim_" .. iter_4_0]
	end

	arg_4_0.showIndex_ = nil
	arg_4_0.talentList_ = {}

	for iter_4_1 = 1, 6 do
		local var_4_0 = {}

		ComponentBinder.GetInstance():BindCfgUI(var_4_0, arg_4_0["talent_" .. iter_4_1])

		var_4_0.lockCon = var_4_0.statusCon_:GetController("lock")
		var_4_0.selectCon = var_4_0.statusCon_:GetController("select")
		var_4_0.index = iter_4_1

		arg_4_0:AddBtnListener(var_4_0.btnClick_, nil, function()
			arg_4_0:OnSelectTalent(var_4_0, var_4_0.talentId)
		end)

		arg_4_0.talentList_[iter_4_1] = var_4_0
	end

	arg_4_0.talent2Item_ = {}
	arg_4_0.talentUpdateHandler_ = handler(arg_4_0, arg_4_0.OnTalentUpdate)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btnBattle_, nil, function()
		local var_7_0 = arg_6_0.params_.stageId
		local var_7_1 = arg_6_0.params_.activityId
		local var_7_2 = arg_6_0.params_.type
		local var_7_3 = BattleStageFactory.Produce(BattleConst.STAGE_TYPE_NEW.GOD_EATER_BATTLE, var_7_0, {
			heroList = {
				HeroStandardSystemCfg[arg_6_0.selectHero_].hero_id,
				0,
				0
			},
			heroTrialList = {
				arg_6_0.selectHero_,
				0,
				0
			},
			viewType = var_7_2,
			activityId = var_7_1
		})

		BattleController.GetInstance():LaunchBattle(var_7_3)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnHero_1, nil, function()
		if arg_6_0.selectIndex_ == 1 then
			return
		end

		arg_6_0:ChangeSelectHero(1)
		arg_6_0:RefreshTalent()
		arg_6_0:PlayTalentAnim()
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnHero_2, nil, function()
		if arg_6_0.selectIndex_ == 2 then
			return
		end

		arg_6_0:ChangeSelectHero(2)
		arg_6_0:RefreshTalent()
		arg_6_0:PlayTalentAnim()
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnBigSkill_1, nil, function()
		arg_6_0:ShowAnim(1)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnBigSkill_2, nil, function()
		arg_6_0:ShowAnim(2)
	end)
	arg_6_0:AddBtnListener(arg_6_0.equipBtn_, nil, function()
		WeekBossAction.ActiveTalent(arg_6_0.nowSelectIndex_, arg_6_0.nowTalentId_, arg_6_0.selectIndex_, arg_6_0.selectHero_)
	end)
	arg_6_0:AddBtnListener(arg_6_0.unloadBtn_, nil, function()
		WeekBossAction.ActiveTalent(arg_6_0.nowSelectIndex_, 0, arg_6_0.selectIndex_, arg_6_0.selectHero_)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btnMask_, nil, function()
		arg_6_0:ResetStatus()
	end)
end

function var_0_0.OnTop(arg_15_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("GOD_EATER_GAME_TIPS_4")
	manager.windowBar:RegistBackCallBack(function()
		if arg_15_0.params_.backCb then
			arg_15_0.params_.backCb()
		end

		arg_15_0.isBackMain_ = true

		arg_15_0:Back()
	end)
end

function var_0_0.OnEnter(arg_17_0)
	arg_17_0.trackGo_, arg_17_0.virtualCameras_ = EatGodBattleTools.GetVirtualCameras()

	arg_17_0:SetCamera()

	arg_17_0.heroList_ = WeekBossData:GetHeroList()

	arg_17_0:LoadHeroModels()
	arg_17_0:ChangeSelectHero(2)
	arg_17_0:RefreshTalent()

	local var_17_0 = arg_17_0.params_.isBoss and "hideEffect" or "hide"

	EatGodBattleTools.SetBackGroundStatus(var_17_0, 1)

	arg_17_0.animTimer = Timer.New(function()
		arg_17_0:PlayTalentAnim()
	end, 0.45, 1)

	arg_17_0.animTimer:Start()
	manager.notify:RegistListener(TALENT_UPDATE, arg_17_0.talentUpdateHandler_)
end

function var_0_0.SetCamera(arg_19_0)
	arg_19_0.cinemachineBrain_ = manager.ui.mainCamera:GetComponent("CinemachineBrain")

	if not arg_19_0.cinemachineBrain_ then
		arg_19_0.cinemachineBrain_ = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))
	end

	arg_19_0.cinemachineBrain_.m_CustomBlends = Asset.Load("UI/HeroCamera/CameraData/I19_MainCamera_Blends")
	arg_19_0.cinemachineBrain_.enabled = true
	arg_19_0.virtualCameras_[1].Priority = 0
	arg_19_0.virtualCameras_[2].Priority = 100
end

function var_0_0.LoadHeroModels(arg_20_0)
	arg_20_0.loadAsyncIndex_ = {}
	arg_20_0.heroModel_ = {}

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.heroList_) do
		if iter_20_1 ~= 0 and HeroStandardSystemCfg[iter_20_1] then
			local var_20_0 = HeroStandardSystemCfg[iter_20_1].hero_id
			local var_20_1 = SkinCfg[var_20_0]

			arg_20_0.loadAsyncIndex_[iter_20_0] = manager.resourcePool:AsyncLoad("Char/" .. var_20_1.ui_modelId, ASSET_TYPE.TPOSE, function(arg_21_0)
				arg_20_0.heroModel_[iter_20_0] = arg_21_0
			end)
		end
	end
end

function var_0_0.DestroyHeroModels(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.heroModel_) do
		manager.resourcePool:DestroyOrReturn(iter_22_1, ASSET_TYPE.TPOSE)
	end

	for iter_22_2, iter_22_3 in pairs(arg_22_0.loadAsyncIndex_) do
		manager.resourcePool:StopAsyncQuest(arg_22_0.loadAsyncIndex_[iter_22_2])
	end

	arg_22_0.loadAsyncIndex_ = nil
	arg_22_0.heroModel_ = nil
end

function var_0_0.OnSelectTalent(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_0.nowTalentId_ == arg_23_2 then
		return
	end

	if arg_23_0.selectTalent_ then
		arg_23_0.selectTalent_.selectCon:SetSelectedState("off")
	end

	arg_23_0.selectTalent_ = arg_23_1
	arg_23_0.nowTalentId_ = arg_23_2

	arg_23_0.selectTalent_.selectCon:SetSelectedState("on")
	arg_23_0:RefreshTips(arg_23_2)
end

function var_0_0.ChangeSelectHero(arg_24_0, arg_24_1)
	arg_24_0.selectController_:SetSelectedState(arg_24_1)

	arg_24_0.selectHero_ = arg_24_0.heroList_[arg_24_1]
	arg_24_0.selectIndex_ = arg_24_1

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.heroModel_) do
		if iter_24_0 == arg_24_1 then
			iter_24_1.transform.localEulerAngles = WeekBossConst.HeroModelTransform[2].rotation
			iter_24_1.transform.localPosition = WeekBossConst.HeroModelTransform[2].position
			iter_24_1.transform.localScale = SectionSelectHeroConst.HeroModelTransform[2].scale
		else
			iter_24_1.transform.localEulerAngles = WeekBossConst.HeroModelTransform[1].rotation
			iter_24_1.transform.localPosition = WeekBossConst.HeroModelTransform[1].position
			iter_24_1.transform.localScale = SectionSelectHeroConst.HeroModelTransform[1].scale
		end
	end

	arg_24_0:PlayEffect()
end

function var_0_0.PlayEffect(arg_25_0)
	manager.audio:PlayUIAudioByVoice("hero_change")
	LuaForUtil.PlayEffect(arg_25_0.heroModel_[arg_25_0.selectIndex_].transform, "Effect/tongyong/fx_appear_UI", Vector3(0, 0, 0), Vector3(1, 1, 1), Vector3(0, 0, 0), Vector3(0, 0, 0), false, 1, 0, 0.8)
end

function var_0_0.RefreshTalent(arg_26_0)
	arg_26_0.talent2Item_ = {}
	arg_26_0.equipedTalent_ = WeekBossData:GetSelectTalent(arg_26_0.selectHero_)

	local var_26_0 = ActivityGodEaterWeekBossCfg[arg_26_0.selectIndex_]

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.equipedTalent_) do
		local var_26_1 = iter_26_1 == 0

		arg_26_0.groupStatusController_[iter_26_0]:SetSelectedState(var_26_1 and "empty" or table.indexof(var_26_0.talent_list[iter_26_0], iter_26_1))
	end

	for iter_26_2, iter_26_3 in ipairs(var_26_0.talent_list) do
		for iter_26_4, iter_26_5 in ipairs(iter_26_3) do
			local var_26_2 = (iter_26_2 - 1) * 3 + iter_26_4

			arg_26_0.talentList_[var_26_2].talentId = iter_26_5

			arg_26_0.talentList_[var_26_2].lockCon:SetSelectedState(tostring(not WeekBossData:GetTalentUnlock(iter_26_5)))

			arg_26_0.talent2Item_[iter_26_5] = arg_26_0.talentList_[var_26_2]
		end
	end
end

function var_0_0.PlayTalentAnim(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.bigTalentAnim_) do
		iter_27_1:Play("UI_bigskill01_cx", -1, 0)
	end
end

function var_0_0.CheckAutoSelect(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.equipedTalent_[arg_28_1]

	arg_28_0.nowSelectIndex_ = arg_28_1

	if var_28_0 ~= 0 then
		arg_28_0.tipStatusController_:SetSelectedState(arg_28_1 == 1 and "up" or "down")
		arg_28_0:OnSelectTalent(arg_28_0.talent2Item_[var_28_0], var_28_0)
	end
end

function var_0_0.RefreshTips(arg_29_0, arg_29_1)
	arg_29_0.tipStatusController_:SetSelectedState(arg_29_0.nowSelectIndex_ == 1 and "up" or "down")

	local var_29_0 = TalentTreeCfg[arg_29_1]

	arg_29_0.talentNameText_.text = var_29_0.name
	arg_29_0.talentDescText_.text = var_29_0.desc

	if not WeekBossData:GetTalentUnlock(arg_29_1) then
		arg_29_0.tipBtnController_:SetSelectedState("lock")

		arg_29_0.lockDesc_.text = WeekBossData:GetTalentLockDesc(arg_29_1)
	elseif arg_29_0.equipedTalent_[arg_29_0.nowSelectIndex_] == arg_29_1 then
		arg_29_0.tipBtnController_:SetSelectedState("unload")
	else
		arg_29_0.tipBtnController_:SetSelectedState("equip")
	end
end

function var_0_0.OnTalentUpdate(arg_30_0)
	arg_30_0:ResetStatus()

	local var_30_0 = ActivityGodEaterWeekBossCfg[arg_30_0.selectIndex_]

	arg_30_0.equipedTalent_ = WeekBossData:GetSelectTalent(arg_30_0.selectHero_)

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.equipedTalent_) do
		local var_30_1 = iter_30_1 == 0

		arg_30_0.groupStatusController_[iter_30_0]:SetSelectedState(var_30_1 and "empty" or table.indexof(var_30_0.talent_list[iter_30_0], iter_30_1))
	end
end

function var_0_0.ShowAnim(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.showIndex_

	if var_31_0 then
		if var_31_0 == arg_31_1 then
			arg_31_0:ResetStatus()

			return
		else
			arg_31_0.tipStatusController_:SetSelectedState("hide")
			arg_31_0.skillAnim_[var_31_0]:Play("UI_smallskill_xs")
		end
	end

	arg_31_0.showIndex_ = arg_31_1

	arg_31_0.skillAnim_[arg_31_0.showIndex_]:Play("UI_smallskill_cx")
	arg_31_0:CheckAutoSelect(arg_31_1)
end

function var_0_0.ResetStatus(arg_32_0)
	arg_32_0.tipStatusController_:SetSelectedState("hide")

	if arg_32_0.showIndex_ then
		arg_32_0.skillAnim_[arg_32_0.showIndex_]:Play("UI_smallskill_xs")

		arg_32_0.showIndex_ = nil
	end
end

function var_0_0.OnExit(arg_33_0)
	arg_33_0.selectTalent_ = nil

	manager.ui:ResetMainCamera()
	manager.windowBar:HideBar()
	manager.notify:RemoveListener(TALENT_UPDATE, arg_33_0.talentUpdateHandler_)
	arg_33_0:DestroyHeroModels()
	arg_33_0:ResetStatus()

	if arg_33_0.animTimer then
		arg_33_0.animTimer:Stop()

		arg_33_0.animTimer = nil
	end

	arg_33_0.groupStatusController_[1]:SetSelectedState("hide")
	arg_33_0.groupStatusController_[2]:SetSelectedState("hide")

	if arg_33_0.isBackMain_ then
		arg_33_0.isBackMain_ = false
	else
		EatGodBattleTools.ResetCamera()
		EatGodBattleTools.UnloadBackScene()
	end
end

function var_0_0.Dispose(arg_34_0)
	var_0_0.super.Dispose(arg_34_0)
end

return var_0_0
