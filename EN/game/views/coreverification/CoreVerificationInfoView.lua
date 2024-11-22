local var_0_0 = class("CoreVerificationInfoView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Core_Verification/CoreVerificationInfo"
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

	arg_4_0.bossModel_ = {}
	arg_4_0.loadIndexList_ = {}
	arg_4_0.bossAnimatorList_ = {}
	arg_4_0.cacheRootMotionList_ = {}
	arg_4_0.animatorTimer_ = {}
	arg_4_0.affixGoList_ = {
		arg_4_0.affix1Go_,
		arg_4_0.affix2Go_,
		arg_4_0.affix3Go_
	}
	arg_4_0.affixImgList_ = {
		arg_4_0.affix1Img_,
		arg_4_0.affix2Img_,
		arg_4_0.affix3Img_
	}
	arg_4_0.affixTextList_ = {
		arg_4_0.affix1Text_,
		arg_4_0.affix2Text_,
		arg_4_0.affix3Text_
	}
	arg_4_0.tabList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexTabItem), arg_4_0.tabUilist_, CoreVerificationInfoTabItem)
	arg_4_0.heroHeadItem_ = {}

	for iter_4_0 = 1, 6 do
		arg_4_0.heroHeadItem_[iter_4_0] = CoreVerificationRoleIcon.New(arg_4_0["hero" .. iter_4_0 .. "Go_"])
	end

	arg_4_0.passController_ = arg_4_0.mainControllerEx_:GetController("passState")
end

function var_0_0.IndexTabItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(arg_5_0.bossType_, arg_5_1, arg_5_0.curTab_, function()
		local var_6_0 = CoreVerificationData:GetInfoCfgByTypeAndDiff(arg_5_0.bossType_, arg_5_1)
		local var_6_1 = CoreVerificationData:GetStageInfoByTypeAndDiff(arg_5_0.bossType_, arg_5_1 - 1)

		if PlayerData:GetPlayerInfo().userLevel < var_6_0.unlock_level then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), var_6_0.unlock_level))

			return
		end

		if arg_5_1 > 1 and not var_6_1 then
			ShowTips(string.format(GetTips("SOLO_HEART_DEMON_LOCK"), var_6_0.unlock_level))

			return
		end

		local var_6_2 = arg_5_0.tabList_:GetItemByIndex(arg_5_0.curTab_)

		if var_6_2 then
			var_6_2:Select(false)
		end

		arg_5_2:Select(true)

		arg_5_0.curTab_ = arg_5_1

		arg_5_0:UpdateView()
	end)
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.battleBtn_, nil, function()
		local var_8_0 = ReserveParams.New(ReserveConst.RESERVE_TYPE.CORE_VERIFICATION, arg_7_0.bossType_, nil, {
			stageType = BattleConst.STAGE_TYPE_NEW.CORE_VERIFICATION,
			stageID = arg_7_0.curStageID_
		})

		arg_7_0:Go("/sectionSelectHero", {
			section = arg_7_0.curStageID_,
			sectionType = BattleConst.STAGE_TYPE_NEW.CORE_VERIFICATION,
			reserveParams = var_8_0,
			activityID = arg_7_0.infoID_
		})
	end)
end

function var_0_0.OnEnter(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("CORE_VERIFICATION_DES")
	manager.ui:SetMainCamera("bossChallenge")

	arg_9_0.exitView_ = false
	arg_9_0.bossType_ = arg_9_0.params_.bossType
	arg_9_0.curTab_ = CoreVerificationData:GetMaxUnlockByBossType(arg_9_0.bossType_)

	arg_9_0:UpdateView()

	local var_9_0 = CoreVerificationData:GetDiffListByBossType(arg_9_0.bossType_)

	arg_9_0.tabList_:StartScroll(#var_9_0)
	arg_9_0.tabList_:ScrollToIndex(arg_9_0.curTab_)

	local var_9_1 = CoreVerificationData:GetBossUICfgByBossType(arg_9_0.bossType_)

	arg_9_0.nameText_.text = GetI18NText(var_9_1.main_name)

	local var_9_2 = CoreVerificationData:GetRecommendByBossType(arg_9_0.bossType_)

	if var_9_2[1] then
		SetActive(arg_9_0.recommend1Img_.gameObject, true)

		arg_9_0.recommend1Img_.sprite = HeroTools.GetSkillAttributeIcon(var_9_2[1])
	else
		SetActive(arg_9_0.recommend1Img_.gameObject, false)
	end

	if var_9_2[2] then
		SetActive(arg_9_0.recommend2Img_.gameObject, true)

		arg_9_0.recommend2Img_.sprite = HeroTools.GetSkillAttributeIcon(var_9_2[2])
	else
		SetActive(arg_9_0.recommend2Img_.gameObject, false)
	end

	arg_9_0:LoadModel()
	arg_9_0:LoadBackScene()
end

function var_0_0.OnExit(arg_10_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()

	arg_10_0.exitView_ = true

	arg_10_0:UnloadModel()
	arg_10_0:UnloadBackScene()
end

function var_0_0.UpdateView(arg_11_0)
	local var_11_0 = CoreVerificationData:GetAffixByTypeAndDiff(arg_11_0.bossType_, arg_11_0.curTab_)
	local var_11_1 = getMosterAffix(var_11_0) or getHeroAffixs(var_11_0)

	for iter_11_0 = 1, 3 do
		if var_11_1[iter_11_0] then
			SetActive(arg_11_0.affixGoList_[iter_11_0], true)

			arg_11_0.affixImgList_[iter_11_0].sprite = getAffixSprite(var_11_1[iter_11_0])
			arg_11_0.affixTextList_[iter_11_0].text = GetI18NText(getAffixDesc(var_11_1[iter_11_0]))
		else
			SetActive(arg_11_0.affixGoList_[iter_11_0], false)
		end
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_0.affixRoot_)

	local var_11_2 = CoreVerificationData:GetInfoCfgByTypeAndDiff(arg_11_0.bossType_, arg_11_0.curTab_)

	arg_11_0.curStageID_ = var_11_2.stage_id
	arg_11_0.infoID_ = var_11_2.id
	arg_11_0.lockHero_ = CoreVerificationData:GetLockHeroByBossType(arg_11_0.bossType_)

	local var_11_3 = CoreVerificationData:GetStageInfoByTypeAndDiff(arg_11_0.bossType_, arg_11_0.curTab_)

	if var_11_3 and var_11_3.passState then
		arg_11_0.passController_:SetSelectedState("complete")

		arg_11_0.timeText_.text = manager.time:DescCdTime2(var_11_3.passTime)

		for iter_11_1 = 1, 6 do
			arg_11_0.heroHeadItem_[iter_11_1]:SetData(arg_11_0.lockHero_[iter_11_1])
		end
	elseif var_11_3 then
		arg_11_0.passController_:SetSelectedState("empty")
	elseif arg_11_0.curTab_ == 1 or CoreVerificationData:GetStageInfoByTypeAndDiff(arg_11_0.bossType_, arg_11_0.curTab_ - 1) then
		arg_11_0.passController_:SetSelectedState("empty")
	else
		arg_11_0.passController_:SetSelectedState("lock")
	end
end

function var_0_0.Dispose(arg_12_0)
	for iter_12_0 = 1, 6 do
		if arg_12_0.heroHeadItem_[iter_12_0] then
			arg_12_0.heroHeadItem_[iter_12_0]:Dispose()

			arg_12_0.heroHeadItem_[iter_12_0] = nil
		end
	end

	if arg_12_0.tabList_ then
		arg_12_0.tabList_:Dispose()

		arg_12_0.tabList_ = nil
	end

	var_0_0.super.Dispose(arg_12_0)
end

function var_0_0.LoadModel(arg_13_0)
	arg_13_0:UnloadModel()

	local var_13_0 = CoreVerificationData:GetBossUICfgByBossType(arg_13_0.bossType_)

	for iter_13_0, iter_13_1 in pairs(var_13_0.boss_id_list) do
		arg_13_0.loadIndexList_[iter_13_0] = manager.resourcePool:AsyncLoad("Char/" .. MonsterCfg[iter_13_1].model_name, ASSET_TYPE.TPOSE, function(arg_14_0)
			if arg_13_0.exitView_ then
				manager.resourcePool:DestroyOrReturn(arg_14_0, ASSET_TYPE.TPOSE)

				return
			end

			local var_14_0 = var_13_0.model_pos[iter_13_0]
			local var_14_1 = var_13_0.model_rot[iter_13_0]
			local var_14_2 = var_13_0.model_scale[iter_13_0]

			arg_13_0.bossModel_[iter_13_0] = arg_14_0
			arg_13_0.bossModel_[iter_13_0].transform.localPosition = Vector3(var_14_0[1], var_14_0[2], var_14_0[3])
			arg_13_0.bossModel_[iter_13_0].transform.localEulerAngles = Vector3(var_14_1[1], var_14_1[2], var_14_1[3])
			arg_13_0.bossModel_[iter_13_0].transform.localScale = Vector3(var_14_2[1], var_14_2[2], var_14_2[3])
			arg_13_0.bossAnimatorList_[iter_13_0] = arg_13_0.bossModel_[iter_13_0]:GetComponent(typeof(Animator))

			arg_13_0:PlayAppearAnimation(iter_13_0, function()
				arg_13_0.bossAnimatorList_[iter_13_0]:CrossFadeInFixedTime("stand", 0.01)
			end)
		end)
	end
end

function var_0_0.UnloadModel(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.bossModel_) do
		arg_16_0.bossAnimatorList_[iter_16_0].applyRootMotion = arg_16_0.cacheRootMotionList_[iter_16_0]

		manager.resourcePool:DestroyOrReturn(iter_16_1, ASSET_TYPE.TPOSE)
	end

	arg_16_0.bossModel_ = {}
	arg_16_0.bossAnimatorList_ = {}

	for iter_16_2, iter_16_3 in pairs(arg_16_0.loadIndexList_) do
		manager.resourcePool:StopAsyncQuest(iter_16_3)
	end

	arg_16_0.loadIndexList_ = {}

	arg_16_0:StopAllAnimatorTimer()
end

function var_0_0.PlayAppearAnimation(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = CoreVerificationData:GetBossUICfgByBossType(arg_17_0.bossType_)
	local var_17_1 = arg_17_0.bossAnimatorList_[arg_17_1]

	arg_17_0.cacheRootMotionList_[arg_17_1] = arg_17_0.bossAnimatorList_[arg_17_1].applyRootMotion
	arg_17_0.bossAnimatorList_[arg_17_1].applyRootMotion = false

	if type(var_17_0.appear_ani) == "table" and var_17_0.appear_ani[arg_17_1] ~= "" then
		arg_17_0.bossAnimatorList_[arg_17_1]:Play(var_17_0.appear_ani[arg_17_1])

		local var_17_2

		var_17_2 = FrameTimer.New(function()
			if var_17_1:GetCurrentAnimatorStateInfo(0).normalizedTime >= 1 then
				var_17_2:Stop()
				table.removebyvalue(arg_17_0.animatorTimer_, var_17_2)

				var_17_2 = nil

				arg_17_2()
			end
		end, 1, -1)

		table.insert(arg_17_0.animatorTimer_, var_17_2)
		var_17_2:Start()
	else
		arg_17_2()
	end
end

function var_0_0.StopAllAnimatorTimer(arg_19_0)
	for iter_19_0 = #arg_19_0.animatorTimer_, 1, -1 do
		arg_19_0.animatorTimer_[iter_19_0]:Stop()

		arg_19_0.animatorTimer_[iter_19_0] = nil
	end
end

function var_0_0.LoadBackScene(arg_20_0)
	local var_20_0 = "UI/Common/BackgroundQuad"

	arg_20_0.backGround_ = manager.resourcePool:Get(var_20_0, ASSET_TYPE.SCENE)
	arg_20_0.backGroundTrs_ = arg_20_0.backGround_.transform

	arg_20_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

	local var_20_1 = GameDisplayCfg.boss_background_pos.value

	arg_20_0.backGroundTrs_.localPosition = Vector3(var_20_1[1], var_20_1[2], var_20_1[3])
	arg_20_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)

	local var_20_2 = GameDisplayCfg.boss_background_pos.scale

	arg_20_0.backGroundTrs_.localScale = Vector3(2, 2, 2)
	arg_20_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureBg/Core_Verification/bg2")
end

function var_0_0.UnloadBackScene(arg_21_0)
	if arg_21_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_21_0.backGround_, ASSET_TYPE.SCENE)

		arg_21_0.backGround_ = nil
	end
end

return var_0_0
