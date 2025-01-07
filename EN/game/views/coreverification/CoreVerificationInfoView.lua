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
	arg_4_0.suffixList = {}
	arg_4_0.suffixIndex = {}
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
	arg_4_0.sufffixList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexSuffixItem), arg_4_0.suffixuilistGo_, CoreVerificationInfoSuffIxItem)
	arg_4_0.heroHeadItem_ = {}

	for iter_4_0 = 1, 6 do
		arg_4_0.heroHeadItem_[iter_4_0] = CoreVerificationRoleIcon.New(arg_4_0["hero" .. iter_4_0 .. "Go_"])
	end

	arg_4_0.passController_ = arg_4_0.mainControllerEx_:GetController("passState")
	arg_4_0.SelectSuffixController_ = arg_4_0.mainControllerEx_:GetController("isSelectSuffix")
end

function var_0_0.IndexTabItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(arg_5_0.bossType_, arg_5_1, arg_5_0.curTab_, function()
		local var_6_0 = CoreVerificationData:GetInfoCfgByTypeAndDiff(arg_5_0.bossType_, arg_5_1)
		local var_6_1 = CoreVerificationData:GetStageInfoByTypeAndDiff(arg_5_0.bossType_, arg_5_1 - 1)
		local var_6_2 = PlayerData:GetPlayerInfo().userLevel
		local var_6_3 = CoreVerificationData:IsOpenChallgeByType(1)
		local var_6_4 = CoreVerificationData:IsOpenChallgeByType(2)

		if CoreVerificationData:IsChallengeType(var_6_0.id) and (not var_6_3 or not var_6_4) then
			ShowTips(GetTips("CORE_VERIFICATION_TAB_DES_3"))

			return
		end

		if var_6_2 < var_6_0.unlock_level then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), var_6_0.unlock_level))

			return
		end

		if arg_5_1 > 1 and not var_6_1 then
			ShowTips(string.format(GetTips("SOLO_HEART_DEMON_LOCK"), var_6_0.unlock_level))

			return
		end

		local var_6_5 = arg_5_0.tabList_:GetItemByIndex(arg_5_0.curTab_)

		if var_6_5 then
			var_6_5:Select(false)
		end

		arg_5_2:Select(true)

		arg_5_0.curTab_ = arg_5_1

		arg_5_0:UpdateView()
	end)
end

function var_0_0.IndexSuffixItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.suffixList[arg_7_1]
	local var_7_1 = arg_7_0.suffixIndex[arg_7_1]

	arg_7_2:SetData(var_7_0, var_7_1, arg_7_1, function(arg_8_0, arg_8_1)
		arg_7_0.suffixIndex[arg_8_0] = arg_8_1

		arg_7_0:UpdateSuffixScore()
	end)
end

function var_0_0.AddUIListeners(arg_9_0)
	arg_9_0:AddBtnListener(arg_9_0.battleBtn_, nil, function()
		if CoreVerificationData:IsChallengeType(arg_9_0.infoID_) then
			if arg_9_0.IsOnSelectSuffix then
				CoreVerificationAction.SelectSuffix(arg_9_0.infoID_, arg_9_0:GetSelectSuffixList())
				CoreVerificationTool.GotoFightSelect(arg_9_0.curStageID_, arg_9_0.infoID_, arg_9_0.bossType_)

				return
			end

			arg_9_0.IsOnSelectSuffix = true

			arg_9_0.SelectSuffixController_:SetSelectedState("true")
			manager.ui:SetUISeparateRender(true)
			arg_9_0:ShowSuffix(arg_9_0.infoID_)
		else
			CoreVerificationTool.GotoFightSelect(arg_9_0.curStageID_, arg_9_0.infoID_, arg_9_0.bossType_)
		end
	end)
end

function var_0_0.OnEnter(arg_11_0)
	arg_11_0.gameObject_.layer = 5

	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("CORE_VERIFICATION_DES")
	manager.ui:SetMainCamera("bossChallenge")
	manager.windowBar:RegistBackCallBack(function()
		arg_11_0:Back()
	end)

	arg_11_0.exitView_ = false
	arg_11_0.bossType_ = arg_11_0.params_.bossType
	arg_11_0.curTab_ = CoreVerificationData:GetMaxUnlockByBossType(arg_11_0.bossType_)

	arg_11_0:UpdateView()

	local var_11_0 = CoreVerificationData:GetDiffListByBossType(arg_11_0.bossType_)

	arg_11_0.tabList_:StartScroll(#var_11_0)
	arg_11_0.tabList_:ScrollToIndex(arg_11_0.curTab_)

	local var_11_1 = CoreVerificationData:GetBossUICfgByBossType(arg_11_0.bossType_)

	arg_11_0.nameText_.text = GetI18NText(var_11_1.main_name)

	local var_11_2 = CoreVerificationData:GetRecommendByBossType(arg_11_0.bossType_)

	if var_11_2[1] then
		SetActive(arg_11_0.recommend1Img_.gameObject, true)

		arg_11_0.recommend1Img_.sprite = HeroTools.GetSkillAttributeIcon(var_11_2[1])
	else
		SetActive(arg_11_0.recommend1Img_.gameObject, false)
	end

	if var_11_2[2] then
		SetActive(arg_11_0.recommend2Img_.gameObject, true)

		arg_11_0.recommend2Img_.sprite = HeroTools.GetSkillAttributeIcon(var_11_2[2])
	else
		SetActive(arg_11_0.recommend2Img_.gameObject, false)
	end

	if table.isEmpty(var_11_2) then
		SetActive(arg_11_0.recommend1Img_.gameObject, true)

		arg_11_0.recommend1Img_.sprite = HeroTools.GetSkillAttributeIcon()
	end

	arg_11_0:LoadModel()
	arg_11_0:LoadBackScene()
	arg_11_0:OnSelfAdapt()
end

function var_0_0.OnSelfAdapt(arg_13_0)
	local var_13_0 = arg_13_0.left_2Trs_.sizeDelta

	arg_13_0.left_2Trs_.anchoredPosition = Vector3(var_0_0.VIEW_ADAPT_DISTANCE, 0, 0)
	arg_13_0.left_2Trs_.sizeDelta = Vector2.New(var_13_0.x - var_0_0.VIEW_ADAPT_DISTANCE * 2, var_13_0.y)
end

function var_0_0.GetSelectSuffixList(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.suffixList) do
		local var_14_1 = arg_14_0.sufffixList_:GetItemByIndex(iter_14_0)

		if var_14_1.nowID then
			table.insert(var_14_0, var_14_1.nowID)
		end
	end

	return var_14_0
end

function var_0_0.ShowChanllengeView(arg_15_0, arg_15_1)
	arg_15_0.gameObject_.layer = 18
	arg_15_0.maskImg_.enabled = true

	arg_15_0.SelectSuffixController_:SetSelectedState(arg_15_1 and "true" or "false")

	arg_15_0.IsOnSelectSuffix = arg_15_1

	manager.ui:SetUISeparateRender(arg_15_1)
end

function var_0_0.Back(arg_16_0)
	manager.ui:SetUISeparateRender(false)

	if arg_16_0.IsOnSelectSuffix then
		arg_16_0.SelectSuffixController_:SetSelectedState("false")

		arg_16_0.IsOnSelectSuffix = false
	else
		arg_16_0.super:Back()
	end
end

function var_0_0.ShowSuffix(arg_17_0, arg_17_1)
	arg_17_0.sufffixList_:StartScroll(#arg_17_0.suffixList)
	arg_17_0:UpdateSuffixScore()

	local var_17_0 = CoreVerificationData:GetMaxScoreHeroInfo(arg_17_0.bossType_)

	arg_17_0.historyText_.text = var_17_0.score
end

function var_0_0.UpdateSuffixScore(arg_18_0)
	local var_18_0 = 0

	for iter_18_0, iter_18_1 in pairs(arg_18_0.suffixList) do
		local var_18_1 = iter_18_1[arg_18_0.suffixIndex[iter_18_0]]
		local var_18_2 = ActivityAffixPoolCfg[var_18_1]

		var_18_0 = var_18_0 + (var_18_2 and var_18_2.point or 0)
	end

	arg_18_0.suffixText_.text = var_18_0
end

function var_0_0.OnExit(arg_19_0)
	manager.windowBar:HideBar()
	manager.ui:ResetMainCamera()

	arg_19_0.exitView_ = true

	arg_19_0:UnloadModel()
	arg_19_0:UnloadBackScene()
end

function var_0_0.UpdateView(arg_20_0)
	local var_20_0 = CoreVerificationData:GetAffixByTypeAndDiff(arg_20_0.bossType_, arg_20_0.curTab_)
	local var_20_1 = getMosterAffix(var_20_0) or getHeroAffixs(var_20_0)

	for iter_20_0 = 1, 3 do
		if var_20_1[iter_20_0] then
			SetActive(arg_20_0.affixGoList_[iter_20_0], true)

			arg_20_0.affixImgList_[iter_20_0].sprite = getAffixSprite(var_20_1[iter_20_0])
			arg_20_0.affixTextList_[iter_20_0].text = GetI18NText(getAffixDesc(var_20_1[iter_20_0]))
		else
			SetActive(arg_20_0.affixGoList_[iter_20_0], false)
		end
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_0.affixRoot_)

	local var_20_2 = CoreVerificationData:GetInfoCfgByTypeAndDiff(arg_20_0.bossType_, arg_20_0.curTab_)

	arg_20_0.curStageID_ = var_20_2.stage_id
	arg_20_0.infoID_ = var_20_2.id
	arg_20_0.suffixList = CoreVerificationData:GetSuffixList(var_20_2.id)
	arg_20_0.suffixIndex = CoreVerificationData:GetRecordSuffixIndexList(var_20_2.id)
	arg_20_0.lockHero_ = CoreVerificationData:GetLockHeroByBossType(arg_20_0.bossType_)

	local var_20_3 = CoreVerificationData:GetStageInfoByTypeAndDiff(arg_20_0.bossType_, arg_20_0.curTab_)

	if var_20_3 and var_20_3.passState then
		arg_20_0.passController_:SetSelectedState("complete")

		arg_20_0.timeText_.text = manager.time:DescCdTime2(var_20_3.passTime)

		for iter_20_1 = 1, 6 do
			arg_20_0.heroHeadItem_[iter_20_1]:SetData(arg_20_0.lockHero_[iter_20_1])
		end
	elseif var_20_3 then
		arg_20_0.passController_:SetSelectedState("empty")
	elseif arg_20_0.curTab_ == 1 or CoreVerificationData:GetStageInfoByTypeAndDiff(arg_20_0.bossType_, arg_20_0.curTab_ - 1) then
		arg_20_0.passController_:SetSelectedState("empty")
	else
		arg_20_0.passController_:SetSelectedState("lock")
	end
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0.gameObject_.layer = 5

	for iter_21_0 = 1, 6 do
		if arg_21_0.heroHeadItem_[iter_21_0] then
			arg_21_0.heroHeadItem_[iter_21_0]:Dispose()

			arg_21_0.heroHeadItem_[iter_21_0] = nil
		end
	end

	if arg_21_0.tabList_ then
		arg_21_0.tabList_:Dispose()

		arg_21_0.tabList_ = nil
	end

	if arg_21_0.sufffixList_ then
		arg_21_0.sufffixList_:Dispose()

		arg_21_0.sufffixList_ = nil
	end

	var_0_0.super.Dispose(arg_21_0)
end

function var_0_0.LoadModel(arg_22_0)
	arg_22_0:UnloadModel()

	local var_22_0 = CoreVerificationData:GetBossUICfgByBossType(arg_22_0.bossType_)

	for iter_22_0, iter_22_1 in pairs(var_22_0.boss_id_list) do
		arg_22_0.loadIndexList_[iter_22_0] = manager.resourcePool:AsyncLoad("Char/" .. MonsterCfg[iter_22_1].model_name, ASSET_TYPE.TPOSE, function(arg_23_0)
			if arg_22_0.exitView_ then
				manager.resourcePool:DestroyOrReturn(arg_23_0, ASSET_TYPE.TPOSE)

				return
			end

			local var_23_0 = var_22_0.model_pos[iter_22_0]
			local var_23_1 = var_22_0.model_rot[iter_22_0]
			local var_23_2 = var_22_0.model_scale[iter_22_0]

			arg_22_0.bossModel_[iter_22_0] = arg_23_0
			arg_22_0.bossModel_[iter_22_0].transform.localPosition = Vector3(var_23_0[1], var_23_0[2], var_23_0[3])
			arg_22_0.bossModel_[iter_22_0].transform.localEulerAngles = Vector3(var_23_1[1], var_23_1[2], var_23_1[3])
			arg_22_0.bossModel_[iter_22_0].transform.localScale = Vector3(var_23_2[1], var_23_2[2], var_23_2[3])
			arg_22_0.bossAnimatorList_[iter_22_0] = arg_22_0.bossModel_[iter_22_0]:GetComponent(typeof(Animator))

			arg_22_0:PlayAppearAnimation(iter_22_0, function()
				arg_22_0.bossAnimatorList_[iter_22_0]:CrossFadeInFixedTime("stand", 0.01)
			end)
		end)
	end
end

function var_0_0.UnloadModel(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.bossModel_) do
		arg_25_0.bossAnimatorList_[iter_25_0].applyRootMotion = arg_25_0.cacheRootMotionList_[iter_25_0]

		manager.resourcePool:DestroyOrReturn(iter_25_1, ASSET_TYPE.TPOSE)
	end

	arg_25_0.bossModel_ = {}
	arg_25_0.bossAnimatorList_ = {}

	for iter_25_2, iter_25_3 in pairs(arg_25_0.loadIndexList_) do
		manager.resourcePool:StopAsyncQuest(iter_25_3)
	end

	arg_25_0.loadIndexList_ = {}

	arg_25_0:StopAllAnimatorTimer()
end

function var_0_0.PlayAppearAnimation(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = CoreVerificationData:GetBossUICfgByBossType(arg_26_0.bossType_)
	local var_26_1 = arg_26_0.bossAnimatorList_[arg_26_1]

	arg_26_0.cacheRootMotionList_[arg_26_1] = arg_26_0.bossAnimatorList_[arg_26_1].applyRootMotion
	arg_26_0.bossAnimatorList_[arg_26_1].applyRootMotion = false

	if type(var_26_0.appear_ani) == "table" and var_26_0.appear_ani[arg_26_1] ~= "" then
		arg_26_0.bossAnimatorList_[arg_26_1]:Play(var_26_0.appear_ani[arg_26_1])

		local var_26_2

		var_26_2 = FrameTimer.New(function()
			if var_26_1:GetCurrentAnimatorStateInfo(0).normalizedTime >= 1 then
				var_26_2:Stop()
				table.removebyvalue(arg_26_0.animatorTimer_, var_26_2)

				var_26_2 = nil

				arg_26_2()
			end
		end, 1, -1)

		table.insert(arg_26_0.animatorTimer_, var_26_2)
		var_26_2:Start()
	else
		arg_26_2()
	end
end

function var_0_0.StopAllAnimatorTimer(arg_28_0)
	for iter_28_0 = #arg_28_0.animatorTimer_, 1, -1 do
		arg_28_0.animatorTimer_[iter_28_0]:Stop()

		arg_28_0.animatorTimer_[iter_28_0] = nil
	end
end

function var_0_0.LoadBackScene(arg_29_0)
	local var_29_0 = "UI/Common/BackgroundQuad"

	arg_29_0.backGround_ = manager.resourcePool:Get(var_29_0, ASSET_TYPE.SCENE)
	arg_29_0.backGroundTrs_ = arg_29_0.backGround_.transform

	arg_29_0.backGroundTrs_:SetParent(manager.ui.mainCamera.transform)

	local var_29_1 = GameDisplayCfg.boss_background_pos.value

	arg_29_0.backGroundTrs_.localPosition = Vector3(var_29_1[1], var_29_1[2], var_29_1[3])
	arg_29_0.backGroundTrs_.localEulerAngles = Vector3(0, 0, 0)

	local var_29_2 = GameDisplayCfg.boss_background_pos.scale

	arg_29_0.backGroundTrs_.localScale = Vector3(2, 2, 2)
	arg_29_0.backGroundTrs_:Find("pic_background1"):GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureBg/Core_Verification/bg2")
end

function var_0_0.UnloadBackScene(arg_30_0)
	if arg_30_0.backGround_ then
		manager.resourcePool:DestroyOrReturn(arg_30_0.backGround_, ASSET_TYPE.SCENE)

		arg_30_0.backGround_ = nil
	end
end

function var_0_0.OnTop(arg_31_0)
	return
end

function var_0_0.OnBehind(arg_32_0)
	arg_32_0.gameObject_.layer = 5
	arg_32_0.maskImg_.enabled = false
end

return var_0_0
