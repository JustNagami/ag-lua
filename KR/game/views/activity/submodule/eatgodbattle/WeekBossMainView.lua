local var_0_0 = class("WeekBossMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Monster/V4_2_GodEaterUI_Monster_BossUI"
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

	arg_4_0.rewardList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.rewardListGo_, CommonItemView)
	arg_4_0.diffController_ = arg_4_0.transCon_:GetController("diff")
	arg_4_0.rightController_ = arg_4_0.transCon_:GetController("right")
	arg_4_0.btnController_ = arg_4_0.btnCon_:GetController("btn")
	arg_4_0.diffBtn_ = {}
	arg_4_0.diffBtnController_ = {}
	arg_4_0.animList_ = {}

	for iter_4_0 = 1, 3 do
		arg_4_0.diffBtn_[iter_4_0] = arg_4_0["diffBtn_" .. iter_4_0]
		arg_4_0.diffBtnController_[iter_4_0] = arg_4_0["diffBtnCon_" .. iter_4_0]:GetController("status")
		arg_4_0.animList_[iter_4_0] = arg_4_0["anim_" .. iter_4_0]
	end

	arg_4_0.splineProgress_ = arg_4_0.splineGo_:GetComponent("SplineProgressBar")
	arg_4_0.bossModel_ = {}
	arg_4_0.loadIndexList_ = {}
	arg_4_0.bossAnimatorList_ = {}
	arg_4_0.cacheRootMotionList_ = {}
	arg_4_0.animatorTimer_ = {}
	arg_4_0.skillList_ = {}
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.rewardData_[arg_5_1]
	local var_5_1 = clone(ItemTemplateData)

	var_5_1.id = var_5_0.id
	var_5_1.number = var_5_0.num
	var_5_1.completedFlag = arg_5_0.isComplete_

	function var_5_1.clickFun()
		ShowPopItem(POP_ITEM, {
			var_5_1.id,
			var_5_1.number
		})
	end

	arg_5_2:SetData(var_5_1)
end

function var_0_0.AddUIListener(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.btnGo_, nil, function()
		if arg_7_0.isComplete_ then
			ShowTips("ERROR_USER_COMPLETED")

			return
		end

		arg_7_0.reserveBack_ = true

		JumpTools.OpenPageByJump("/weekBossHeroView", {
			isBoss = true,
			type = "weekBoss",
			stageId = arg_7_0.selectStageId_,
			activityId = WeekBossData:GetActivityId()
		})
	end)

	for iter_7_0 = 1, 3 do
		arg_7_0:AddBtnListener(arg_7_0.diffBtn_[iter_7_0], nil, function()
			if arg_7_0.selectDiff_ ~= iter_7_0 and arg_7_0.canClick_ then
				if table.indexof(arg_7_0.unLockStageList_, iter_7_0) then
					arg_7_0:OnSelectDiff(iter_7_0)
				elseif arg_7_0.isComplete_ then
					ShowTips(string.format(GetTips("GODEATER_DES_5"), iter_7_0))
				else
					ShowTips("ACTIVITY_MONSTER_COSPLAY_STAGE_CONDITION")
				end
			end
		end)
	end
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0.enterTimer_ = FrameTimer.New(function()
		arg_10_0.trackGo_, arg_10_0.virtualCameras_ = EatGodBattleTools.GetVirtualCameras()

		if arg_10_0.trackGo_ and arg_10_0.virtualCameras_ then
			arg_10_0:SetCamera()
			arg_10_0.enterTimer_:Stop()

			arg_10_0.enterTimer_ = nil
		end
	end, 1, -1)

	arg_10_0.enterTimer_:Start()
	manager.windowBar:SwitchBar({
		BACK_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("GOD_EATER_GAME_TIPS_4")

	arg_10_0.activityId_ = WeekBossData:GetActivityId()
	arg_10_0.bossChallengeCfg_ = WeekBossData:GetBossChallengeCfg()
	arg_10_0.exitView_ = false
	arg_10_0.reserveBack_ = false
	arg_10_0.canClick_ = true

	arg_10_0:RefreshStageStatus()
	arg_10_0:LoadModel()
	arg_10_0:RefreshBossInfo()
	EatGodBattleTools.SetBackGroundStatus("show", arg_10_0.selectDiff_)
	arg_10_0:BindRedPoint()
end

function var_0_0.SetCamera(arg_12_0)
	arg_12_0.cinemachineBrain_ = manager.ui.mainCamera:GetComponent("CinemachineBrain")

	if not arg_12_0.cinemachineBrain_ then
		arg_12_0.cinemachineBrain_ = manager.ui:AddMainCameraCom(typeof(CinemachineBrain))
	end

	arg_12_0.cinemachineBrain_.m_CustomBlends = Asset.Load("UI/HeroCamera/CameraData/I19_MainCamera_Blends")
	arg_12_0.cinemachineBrain_.enabled = true
	arg_12_0.virtualCameras_[1].Priority = 100
	arg_12_0.virtualCameras_[2].Priority = 0
end

function var_0_0.RefreshStageStatus(arg_13_0)
	arg_13_0.selectDiff_ = WeekBossData:GetDefaultDiff()

	arg_13_0.diffController_:SetSelectedState(arg_13_0.selectDiff_)
	manager.redPoint:bindUIandKey(arg_13_0.btnGo_.transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. arg_13_0.selectDiff_)

	arg_13_0.unLockStageList_ = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.diffBtnController_) do
		if iter_13_0 < arg_13_0.selectDiff_ then
			iter_13_1:SetSelectedState("normal")
			table.insert(arg_13_0.unLockStageList_, iter_13_0)
		elseif iter_13_0 == arg_13_0.selectDiff_ then
			iter_13_1:SetSelectedState("select")
			table.insert(arg_13_0.unLockStageList_, iter_13_0)
		else
			iter_13_1:SetSelectedState("lock")
		end
	end
end

function var_0_0.RefreshBossInfo(arg_14_0)
	arg_14_0:RemoveTimer()

	local var_14_0 = ActivityData:GetActivityData(arg_14_0.activityId_).stopTime

	arg_14_0.bossTotalHp_ = WeekBossData:GetBossTotalHp(arg_14_0.selectDiff_)
	arg_14_0.bossRemainHp_ = math.max(arg_14_0.bossTotalHp_ - WeekBossData:GetBossConsumeHp(arg_14_0.selectDiff_), 0)
	arg_14_0.selectStageId_ = WeekBossData:GetStageId(arg_14_0.selectDiff_)
	arg_14_0.isComplete_ = arg_14_0.bossRemainHp_ <= 0
	arg_14_0.remianHpText_.text = arg_14_0.bossRemainHp_
	arg_14_0.totalHpText_.text = "/" .. arg_14_0.bossTotalHp_

	arg_14_0.splineProgress_:SetValue(arg_14_0.bossRemainHp_ / arg_14_0.bossTotalHp_)
	arg_14_0.btnController_:SetSelectedState(arg_14_0.isComplete_ and "complete" or "normal")

	arg_14_0.nameText_.text = arg_14_0.bossChallengeCfg_.main_name

	arg_14_0:RefreshSkill()
	arg_14_0:RefreshReward()
end

function var_0_0.LoadModel(arg_15_0)
	arg_15_0:UnloadModel()

	local var_15_0 = arg_15_0.bossChallengeCfg_

	for iter_15_0, iter_15_1 in pairs(var_15_0.boss_id_list) do
		arg_15_0.loadIndexList_[iter_15_0] = manager.resourcePool:AsyncLoad("Char/" .. MonsterCfg[iter_15_1].model_name, ASSET_TYPE.TPOSE, function(arg_16_0)
			if arg_15_0.exitView_ then
				manager.resourcePool:DestroyOrReturn(arg_16_0, ASSET_TYPE.TPOSE)

				return
			end

			local var_16_0 = var_15_0.model_pos[iter_15_0]
			local var_16_1 = var_15_0.model_rot[iter_15_0]
			local var_16_2 = var_15_0.model_scale[iter_15_0]

			arg_15_0.bossModel_[iter_15_0] = arg_16_0
			arg_15_0.bossModel_[iter_15_0].transform.localPosition = Vector3(var_16_0[1], var_16_0[2], var_16_0[3])
			arg_15_0.bossModel_[iter_15_0].transform.localEulerAngles = Vector3(var_16_1[1], var_16_1[2], var_16_1[3])
			arg_15_0.bossModel_[iter_15_0].transform.localScale = Vector3(var_16_2[1], var_16_2[2], var_16_2[3])
			arg_15_0.bossAnimatorList_[iter_15_0] = arg_15_0.bossModel_[iter_15_0]:GetComponent(typeof(Animator))

			arg_15_0:PlayAppearAnimation(iter_15_0, function()
				arg_15_0.bossAnimatorList_[iter_15_0]:CrossFadeInFixedTime("stand", 0.01)
			end)
		end)
	end
end

function var_0_0.UnloadModel(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.bossModel_) do
		arg_18_0.bossAnimatorList_[iter_18_0].applyRootMotion = arg_18_0.cacheRootMotionList_[iter_18_0]

		manager.resourcePool:DestroyOrReturn(iter_18_1, ASSET_TYPE.TPOSE)
	end

	arg_18_0.bossModel_ = {}
	arg_18_0.bossAnimatorList_ = {}

	for iter_18_2, iter_18_3 in pairs(arg_18_0.loadIndexList_) do
		manager.resourcePool:StopAsyncQuest(iter_18_3)
	end

	arg_18_0.loadIndexList_ = {}

	arg_18_0:StopAllAnimatorTimer()
end

function var_0_0.PlayAppearAnimation(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.bossChallengeCfg_
	local var_19_1 = arg_19_0.bossAnimatorList_[arg_19_1]

	arg_19_0.cacheRootMotionList_[arg_19_1] = arg_19_0.bossAnimatorList_[arg_19_1].applyRootMotion
	arg_19_0.bossAnimatorList_[arg_19_1].applyRootMotion = false

	if type(var_19_0.appear_ani) == "table" and var_19_0.appear_ani[arg_19_1] ~= "" then
		arg_19_0.bossAnimatorList_[arg_19_1]:Play(var_19_0.appear_ani[arg_19_1])

		local var_19_2

		var_19_2 = FrameTimer.New(function()
			if var_19_1:GetCurrentAnimatorStateInfo(0).normalizedTime >= 1 then
				var_19_2:Stop()
				table.removebyvalue(arg_19_0.animatorTimer_, var_19_2)

				var_19_2 = nil

				arg_19_2()
			end
		end, 1, -1)

		table.insert(arg_19_0.animatorTimer_, var_19_2)
		var_19_2:Start()
	else
		arg_19_2()
	end
end

function var_0_0.StopAllAnimatorTimer(arg_21_0)
	for iter_21_0 = #arg_21_0.animatorTimer_, 1, -1 do
		arg_21_0.animatorTimer_[iter_21_0]:Stop()

		arg_21_0.animatorTimer_[iter_21_0] = nil
	end
end

function var_0_0.RefreshSkill(arg_22_0)
	local var_22_0 = 1
	local var_22_1 = arg_22_0.bossChallengeCfg_.boss_id_list[1]
	local var_22_2 = MonsterCfg[var_22_1]
	local var_22_3 = GetMonsterSkillDesList({
		var_22_1
	})

	for iter_22_0, iter_22_1 in ipairs(var_22_3) do
		if not arg_22_0.skillList_[var_22_0] then
			local var_22_4 = Object.Instantiate(arg_22_0.skillGo_, arg_22_0.skillParent_)
			local var_22_5 = {}

			ComponentBinder.GetInstance():BindCfgUI(var_22_5, var_22_4)

			var_22_5.gameObject = var_22_4
			arg_22_0.skillList_[var_22_0] = var_22_5
		end

		arg_22_0.skillList_[var_22_0].titleText_.text = iter_22_1.name
		arg_22_0.skillList_[var_22_0].descText_.text = iter_22_1.info

		SetActive(arg_22_0.skillList_[var_22_0].gameObject, true)
	end

	for iter_22_2 = #var_22_3 + 1, #arg_22_0.skillList_ do
		SetActive(arg_22_0.skillList_[iter_22_2].gameObject, false)
	end
end

function var_0_0.RefreshReward(arg_23_0)
	arg_23_0.rewardData_ = getRewardFromDropCfg(BattleGodEaterDailyMonsterCfg[arg_23_0.selectStageId_].drop_lib_id, true)

	arg_23_0.rewardList_:StartScroll(#arg_23_0.rewardData_)
end

function var_0_0.RemoveTimer(arg_24_0)
	if arg_24_0.timer_ then
		arg_24_0.timer_:Stop()

		arg_24_0.timer_ = nil
	end
end

function var_0_0.OnSelectDiff(arg_25_0, arg_25_1)
	if arg_25_0.selectDiff_ then
		arg_25_0.diffBtnController_[arg_25_0.selectDiff_]:SetSelectedState("normal")
		manager.redPoint:unbindUIandKey(arg_25_0.btnGo_.transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. arg_25_1)
	end

	manager.redPoint:bindUIandKey(arg_25_0.btnGo_.transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. arg_25_1)
	arg_25_0.rightController_:SetSelectedState("hide")
	arg_25_0.rightController_:SetSelectedState("show")

	arg_25_0.canClick_ = false

	AnimatorTools.PlayAnimatorWithCallback(arg_25_0.animList_[arg_25_0.selectDiff_], "UI_bgmask_xs", function()
		arg_25_0.diffController_:SetSelectedState(arg_25_1)

		arg_25_0.canClick_ = true
	end)

	arg_25_0.selectDiff_ = arg_25_1

	arg_25_0.diffBtnController_[arg_25_1]:SetSelectedState("select")
	EatGodBattleTools.SetBackGroundStatus("show", arg_25_1)
	arg_25_0:RefreshBossInfo()
end

function var_0_0.BindRedPoint(arg_27_0)
	for iter_27_0 = 1, 3 do
		manager.redPoint:bindUIandKey(arg_27_0.diffBtn_[iter_27_0].transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. iter_27_0)
	end
end

function var_0_0.UnBindRedPoint(arg_28_0)
	for iter_28_0 = 1, 3 do
		manager.redPoint:unbindUIandKey(arg_28_0.diffBtn_[iter_28_0].transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. iter_28_0)
	end

	manager.redPoint:unbindUIandKey(arg_28_0.btnGo_.transform, RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE .. arg_28_0.selectDiff_)
end

function var_0_0.OnExit(arg_29_0)
	arg_29_0.exitView_ = true

	manager.windowBar:HideBar()
	arg_29_0:RemoveTimer()
	arg_29_0:UnloadModel()
	arg_29_0:UnBindRedPoint()

	if arg_29_0.enterTimer_ then
		arg_29_0.enterTimer_:Stop()

		arg_29_0.enterTimer_ = nil
	end

	if not arg_29_0.reserveBack_ then
		EatGodBattleTools.ResetCamera()
		EatGodBattleTools.UnloadBackScene()
	end
end

function var_0_0.Dispose(arg_30_0)
	if arg_30_0.rewardList_ then
		arg_30_0.rewardList_:Dispose()
	end

	var_0_0.super.Dispose(arg_30_0)
end

return var_0_0
