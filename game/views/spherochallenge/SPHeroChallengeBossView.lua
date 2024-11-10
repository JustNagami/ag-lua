local var_0_0 = class("SPHeroChallengeBossView", import(".SPHeroChallengeBattleStageBaseView"))

function var_0_0.UIName(arg_1_0)
	return "Widget/System/SPHeroChallenge/SPHeroChallengeBossUI"
end

function var_0_0.Init(arg_2_0)
	arg_2_0.super.Init(arg_2_0)

	arg_2_0.lockController = arg_2_0.controller:GetController("lock")
	arg_2_0.openController = arg_2_0.controller:GetController("open")
	arg_2_0.stageInfoController = arg_2_0.controller:GetController("stageInfo")
	arg_2_0.buttonItem = {}

	for iter_2_0 = 1, 2 do
		arg_2_0.buttonItem[iter_2_0] = SPHeroChallengeBossStageItem.New(arg_2_0["bossitem" .. iter_2_0 .. "Go_"])

		arg_2_0.buttonItem[iter_2_0]:RegisterClickCallBack(handler(arg_2_0, arg_2_0.ShowStageInfoView))
	end

	arg_2_0:AddListeners()
end

function var_0_0.OnEnter(arg_3_0)
	arg_3_0:RegisterEvents()
	arg_3_0:RefreshView()
end

function var_0_0.RegisterEvents(arg_4_0)
	arg_4_0:RegistEventListener(SP_HERO_CHALLENGE_UPDATE_BOSS, function()
		local var_5_0 = SPHeroChallengeData:GetActivityID()
		local var_5_1 = SPHeroChallengeData.activityCfg[var_5_0].bossChapter
		local var_5_2, var_5_3 = SPHeroChallengeTools:GetChapterIsOpen(var_5_1)

		arg_4_0.params_.showFlag = var_5_2

		arg_4_0:RefreshView()
	end)
end

function var_0_0.OnExit(arg_6_0)
	arg_6_0.selectStage = nil

	arg_6_0:RemoveAllEventListener()
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.equiptipBtn_, nil, function()
		if arg_7_0.equipSuit then
			ShowPopEquipSuit(arg_7_0.equipSuit, true)
		end
	end)
end

function var_0_0.ShowStageInfoView(arg_9_0, arg_9_1)
	if SPHeroChallengeTools:CheckBossActivityIsOpen() then
		JumpTools.OpenPageByJump("spHeroChallengeSectionView", {
			section = arg_9_1,
			sectionType = BattleConst.STAGE_TYPE_NEW.SP_HERO_CHALLENGE_BATTLE_3_1,
			activityId = arg_9_0.activityID,
			challengeType = SpHeroChallengeConst.ChapterType.boss
		})

		arg_9_0.selectStage = arg_9_1

		arg_9_0:RefreshStageItem()
	else
		ShowTips("SOLO_NOT_OPEN")
	end
end

function var_0_0.RefreshView(arg_10_0)
	arg_10_0.info = SPHeroChallengeData:GetCurActivityInfo()
	arg_10_0.activityID = SPHeroChallengeData:GetActivityID()

	arg_10_0:RefreshLockState()
	arg_10_0:RefreshOpenState()
	arg_10_0:RefreshErosion()
	arg_10_0:RefreshStageItem()
	arg_10_0:RefreshEquipInfo()

	if arg_10_0:IsOpenSectionView() then
		arg_10_0.stageInfoController:SetSelectedState("open")
	else
		arg_10_0.stageInfoController:SetSelectedState("close")
	end
end

function var_0_0.OnUpdate(arg_11_0)
	if arg_11_0:IsOpenSectionView() then
		arg_11_0.stageInfoController:SetSelectedState("open")
	else
		arg_11_0.stageInfoController:SetSelectedState("close")
	end
end

function var_0_0.IsOpenSectionView(arg_12_0)
	return arg_12_0:IsOpenRoute("spHeroChallengeSectionView")
end

function var_0_0.RefreshErosion(arg_13_0)
	local var_13_0 = arg_13_0.info:GetBossErosiveness()

	arg_13_0.percenttextText_.text = var_13_0 .. "%"
	arg_13_0.sliderImg_.fillAmount = var_13_0 / 100
end

function var_0_0.RefreshOpenState(arg_14_0)
	arg_14_0.bossActivityID = SPHeroChallengeData.activityCfg[arg_14_0.activityID].bossActivityID

	if ActivityData:GetActivityIsOpen(arg_14_0.bossActivityID) and arg_14_0.info.bossStart then
		arg_14_0.openController:SetSelectedState("unlock")
	else
		arg_14_0.openController:SetSelectedState("lock")

		arg_14_0.lockdescText_.text = GetTips("ACTIVITY_HERO_CHALLENGE_BOSS_OPEN_TIME")
	end
end

function var_0_0.RefreshLockState(arg_15_0)
	if not arg_15_0.params_.showFlag then
		arg_15_0.lockController:SetSelectedState("not")

		if arg_15_0.params_.reason then
			if not arg_15_0.info.bossStart then
				arg_15_0.lockText.text = GetTips("SOLO_NOT_OPEN")
			else
				arg_15_0.lockText.text = GetTips(arg_15_0.params_.reason)
			end
		end
	else
		arg_15_0.lockController:SetSelectedState("open")
	end
end

function var_0_0.RefreshStageItem(arg_16_0)
	if arg_16_0.buttonItem then
		local var_16_0 = BattleVerthandiExclusiveCfg.get_id_list_by_sub_type[SpHeroChallengeConst.BattleSubType.boss]

		for iter_16_0, iter_16_1 in ipairs(arg_16_0.buttonItem) do
			iter_16_1:RefreshUI(var_16_0[iter_16_0], arg_16_0.selectStage)
		end
	end
end

function var_0_0.RefreshEquipInfo(arg_17_0)
	local var_17_0 = ActivityRewardPoolCfg.get_id_list_by_activity_id[arg_17_0.bossActivityID][1]

	if var_17_0 then
		local var_17_1 = ActivityRewardPoolItemCfg.get_id_list_by_activity_id[var_17_0]
		local var_17_2 = 0
		local var_17_3 = SPHeroChallengeData:GetCurActivityInfo()
		local var_17_4 = 0

		if var_17_3.equipList then
			var_17_4 = #var_17_3.equipList
		end

		local var_17_5 = 1

		for iter_17_0, iter_17_1 in ipairs(var_17_1) do
			var_17_2 = var_17_2 + ActivityRewardPoolItemCfg[iter_17_1].reward[2] * ActivityRewardPoolItemCfg[iter_17_1].total
			var_17_5 = ActivityRewardPoolItemCfg[iter_17_1].reward[1]
		end

		arg_17_0.numText_.text = string.format(GetTips("ACTIVITY_HERO_CHALLENGE_EQUIP_NUM"), var_17_4, var_17_2)
		arg_17_0.equipSuit = EquipCfg[var_17_5].suit

		local var_17_6 = EquipSuitCfg[arg_17_0.equipSuit]

		if var_17_6 then
			SetSpriteWithoutAtlasAsync(arg_17_0.iconImg_, SpritePathCfg.EquipIcon_s.path .. var_17_6.equip_skill_icon)

			arg_17_0.nameText_.text = var_17_6.name
		end
	end
end

function var_0_0.Dispose(arg_18_0)
	if arg_18_0.buttonItem then
		for iter_18_0, iter_18_1 in pairs(arg_18_0.buttonItem) do
			iter_18_1:Dispose()
		end

		arg_18_0.buttonItem = nil
	end

	arg_18_0.super.Dispose(arg_18_0)
end

return var_0_0
