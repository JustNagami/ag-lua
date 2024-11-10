local var_0_0 = class("SelectHeroBaseView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.drag_ = {}
	arg_3_0.dragPosition_ = {}

	for iter_3_0 = 1, 3 do
		arg_3_0.drag_[iter_3_0] = arg_3_0[string.format("drag_%s", iter_3_0)]

		arg_3_0:CreateDragListeners(iter_3_0)

		arg_3_0.dragPosition_[iter_3_0] = arg_3_0.drag_[iter_3_0].transform.localPosition
	end

	arg_3_0.heroInfoItemList_ = {}
	arg_3_0.comboSkillView_ = nil
	arg_3_0.mimirInfoView_ = nil
	arg_3_0.raceEffectController_ = arg_3_0.controllerExCollection_:GetController("raceEffect")
	arg_3_0.raceActiveController_ = arg_3_0.controllerExCollection_:GetController("raceActive")
	arg_3_0.comboActiveController_ = arg_3_0.controllerExCollection_:GetController("comboActive")
	arg_3_0.mimirActiveController_ = arg_3_0.controllerExCollection_:GetController("mimirActive")
	arg_3_0.selectComboSkillHandler_ = handler(arg_3_0, arg_3_0.OnComboSkillSelect)
end

function var_0_0.SetProxy(arg_4_0, arg_4_1)
	arg_4_0.sectionProxy_ = arg_4_1
	arg_4_0.canSwitchResctrictHeroList_ = {
		0,
		0,
		0
	}

	if arg_4_0.sectionProxy_.stageType and arg_4_0.sectionProxy_.stageID and arg_4_0.sectionProxy_.stageID ~= 0 then
		local var_4_0, var_4_1 = BattleStageTools.GetRestrictHeroList(arg_4_0.sectionProxy_.stageType, arg_4_0.sectionProxy_.stageID)

		if type(var_4_1) == "table" then
			arg_4_0.canSwitchResctrictHeroList_ = var_4_1
		end
	end

	arg_4_0.reserveParams_ = arg_4_1:GetReserveParams()

	arg_4_0:TryReload()
	arg_4_0:UpdateSubViewParams()
end

function var_0_0.UpdateSubViewParams(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.heroInfoItemList_) do
		iter_5_1:SetProxy(arg_5_0.sectionProxy_)
	end

	arg_5_0.comboSkillView_:SetProxy(arg_5_0.sectionProxy_)
	arg_5_0.mimirInfoView_:SetProxy(arg_5_0.sectionProxy_)
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0:RegistEventListener(COMBO_SKILL_SELECT, arg_6_0.selectComboSkillHandler_)
	arg_6_0:SubViewOnEnter()
	arg_6_0:RefreshUI()
end

function var_0_0.SubViewOnEnter(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.heroInfoItemList_) do
		iter_7_1:OnEnter(iter_7_0)
	end

	arg_7_0.comboSkillView_:OnEnter()
	arg_7_0.mimirInfoView_:OnEnter()
end

function var_0_0.OnExit(arg_8_0)
	arg_8_0:RemoveAllEventListener()
	arg_8_0:SubViewOnExit()

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.heroInfoItemList_) do
		iter_8_1:OnExit()
	end

	if arg_8_0.talkTimer_ then
		arg_8_0.talkTimer_:Stop()

		arg_8_0.talkTimer_ = nil
	end

	if arg_8_0.talkCDTimer_ then
		arg_8_0.talkCDTimer_:Stop()

		arg_8_0.talkCDTimer_ = nil
	end

	HeroTools.StopTalk()
	arg_8_0:DestroyHeroModels()
end

function var_0_0.SubViewOnExit(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.heroInfoItemList_) do
		iter_9_1:OnExit()
	end

	arg_9_0.comboSkillView_:OnExit()
	arg_9_0.mimirInfoView_:OnExit()
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:RemoveTriggerListeners()

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.heroInfoItemList_) do
		iter_10_1:Dispose()
	end

	arg_10_0.heroInfoItemList_ = nil

	arg_10_0.comboSkillView_:Dispose()

	arg_10_0.comboSkillView_ = nil

	arg_10_0.mimirInfoView_:Dispose()

	arg_10_0.mimirInfoView_ = nil

	var_0_0.super.Dispose(arg_10_0)
end

function var_0_0.AddListener(arg_11_0)
	arg_11_0:AddBtnListener(arg_11_0.raceBtn_, nil, function()
		JumpTools.OpenPageByJump("sectionSelectRaceDescription", {
			raceID = arg_11_0.maxRaceID_,
			sameCamp = arg_11_0.sameCamp_
		})
	end)
end

function var_0_0.CreateDragListeners(arg_13_0, arg_13_1)
	arg_13_0.drag_[arg_13_1]:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_14_0, arg_14_1)
		if arg_13_0.selectIndex_ then
			return
		end

		if #arg_13_0.loadingList_ > 0 then
			return
		end

		if arg_13_0.lockStateList_[arg_13_1] or arg_13_0.sectionProxy_.canChangeTeam ~= nil and arg_13_0.sectionProxy_.canChangeTeam == false then
			ShowTips("CAN_NOT_CHANGE_HERO")

			return
		end

		if arg_13_0.canSwitchResctrictHeroList_[arg_13_1] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
			ShowTips("TEAM_ERROR_CHANGE")

			return
		end

		arg_13_0.selectIndex_ = arg_13_1
		arg_13_0.cacheSelectIndex_ = arg_13_1
		arg_13_0.cacheHeroNumber_ = {
			1,
			2,
			3
		}
	end))
	arg_13_0.drag_[arg_13_1]:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_15_0, arg_15_1)
		if arg_13_0.selectIndex_ ~= arg_13_1 then
			return
		end

		if #arg_13_0.loadingList_ > 0 then
			return
		end

		local var_15_0 = arg_15_1.delta * manager.ui.canvasRate
		local var_15_1 = Vector3(var_15_0.x, 0, 0)
		local var_15_2 = arg_15_0.transform.localPosition + var_15_1

		if var_15_2.x > 530 then
			var_15_2.x = 530
		elseif var_15_2.x < -273 then
			var_15_2.x = -273
		end

		arg_15_0.transform.localPosition = var_15_2

		local var_15_3 = SectionSelectHeroTools.GetModelOffesetPosition(arg_13_0.dragPosition_[1], arg_15_0.transform.localPosition)

		if arg_13_0.heroModel_[arg_13_1] then
			arg_13_0.heroModel_[arg_13_1].transform.localPosition = SectionSelectHeroTools.HeroTransform[1].position + var_15_3

			if not arg_13_0.lockStateList_[arg_13_1] or arg_13_0.sectionProxy_.canChangeTeam ~= nil and arg_13_0.sectionProxy_.canChangeTeam == true or arg_13_0.canSwitchResctrictHeroList_[arg_13_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
				arg_13_0:TryModifyHeroPos()
			end
		end
	end))
	arg_13_0.drag_[arg_13_1]:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_16_0, arg_16_1)
		if arg_13_0.selectIndex_ ~= arg_13_1 then
			return
		end

		if #arg_13_0.loadingList_ > 0 then
			return
		end

		arg_16_0.transform.localPosition = arg_13_0.dragPosition_[arg_13_1]

		if not arg_13_0.lockStateList_[arg_13_1] or arg_13_0.sectionProxy_.canChangeTeam ~= nil and arg_13_0.sectionProxy_.canChangeTeam == true or arg_13_0.canSwitchResctrictHeroList_[arg_13_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
			arg_13_0:EndDrag(arg_13_1)
		end

		arg_13_0.selectIndex_ = nil
	end))
	arg_13_0.drag_[arg_13_1]:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(handlerArg1(arg_13_0, arg_13_0.ClickHero, arg_13_1)))
end

function var_0_0.RemoveTriggerListeners(arg_17_0)
	for iter_17_0 = 1, 3 do
		arg_17_0.drag_[iter_17_0]:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
		arg_17_0.drag_[iter_17_0]:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
		arg_17_0.drag_[iter_17_0]:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
		arg_17_0.drag_[iter_17_0]:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
	end
end

function var_0_0.ClickHero(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if not arg_18_3.dragging then
		if arg_18_0.selectIndex_ then
			return
		end

		if #arg_18_0.loadingList_ > 0 then
			return
		end

		BattleFieldData:SetCurrentSelectHeroData(arg_18_0.cacheHeroTeam_[arg_18_1], arg_18_0.heroTrialList_[arg_18_1])
		OperationRecorder.Record(arg_18_0.class.__cname, "click_add")
		manager.notify:CallUpdateFunc(SECTION_CLICK_HERO, arg_18_1)
	end
end

function var_0_0.ResetTempData(arg_19_0)
	arg_19_0.heroModel_ = {}
	arg_19_0.loadAsyncIndex_ = {}
	arg_19_0.loadingList_ = {}
	arg_19_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}
	arg_19_0.cacheHeroTeam_ = {}
	arg_19_0.heroTrialList_ = {}
end

function var_0_0.RefreshUI(arg_20_0)
	arg_20_0:RefreshHeroTeam()
	arg_20_0:LoadHeroModels()
	arg_20_0:RefreshMimir()
end

function var_0_0.RefreshHeroTeam(arg_21_0)
	arg_21_0:GetHeroTeam()
	arg_21_0:RefreshHeroInfoItem()
	arg_21_0:RefreshRace()
	arg_21_0:RefreshCombo()
end

function var_0_0.RefreshHeroInfoItem(arg_22_0)
	for iter_22_0 = 1, 3 do
		arg_22_0.heroInfoItemList_[iter_22_0]:SetData(iter_22_0)
	end
end

function var_0_0.ChangeHeroTeam(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1
	local var_23_1 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		local var_23_2 = table.keyof(arg_23_0.cacheHeroTeam_, iter_23_1)

		var_23_1[iter_23_0] = arg_23_0.heroTrialList_[var_23_2]
	end

	if var_23_0[1] ~= arg_23_0.cacheHeroTeam_[1] then
		arg_23_0:PlayHeroTalk(var_23_0[1])
	end

	arg_23_0.sectionProxy_:ChangeHeroTeam(var_23_0, var_23_1)
	manager.notify:Invoke(SECTION_CHANGE_HERO_TEAM, var_23_0, var_23_1)
end

function var_0_0.TryModifyHeroPos(arg_24_0)
	local var_24_0 = arg_24_0.heroModel_[arg_24_0.selectIndex_].transform.localPosition

	for iter_24_0 = 1, 3 do
		if math.abs(SectionSelectHeroTools.HeroTransform[iter_24_0].position.x - var_24_0.x) <= 0.6 and iter_24_0 ~= arg_24_0.cacheSelectIndex_ then
			if arg_24_0.cacheHeroTeam_[arg_24_0.cacheHeroNumber_[iter_24_0]] == 0 or arg_24_0.canSwitchResctrictHeroList_[arg_24_0.cacheHeroNumber_[iter_24_0]] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
				break
			end

			if arg_24_0.lockStateList_[arg_24_0.selectIndex_] or arg_24_0.lockStateList_[iter_24_0] then
				return
			end

			if arg_24_0.heroModel_[arg_24_0.cacheHeroNumber_[iter_24_0]] then
				arg_24_0.heroModel_[arg_24_0.cacheHeroNumber_[iter_24_0]].transform.localPosition = SectionSelectHeroTools.HeroTransform[arg_24_0.cacheSelectIndex_].position
				arg_24_0.heroModel_[arg_24_0.cacheHeroNumber_[iter_24_0]].transform.localEulerAngles = SectionSelectHeroTools.HeroTransform[arg_24_0.cacheSelectIndex_].rotation
			end

			local var_24_1 = arg_24_0.cacheHeroNumber_[iter_24_0]

			arg_24_0.cacheHeroNumber_[iter_24_0] = arg_24_0.cacheHeroNumber_[arg_24_0.cacheSelectIndex_]
			arg_24_0.cacheHeroNumber_[arg_24_0.cacheSelectIndex_] = var_24_1
			arg_24_0.cacheSelectIndex_ = iter_24_0

			break
		end
	end
end

function var_0_0.EndDrag(arg_25_0, arg_25_1)
	local var_25_0 = {}

	for iter_25_0 = 1, 3 do
		var_25_0[iter_25_0] = arg_25_0.cacheHeroTeam_[arg_25_0.cacheHeroNumber_[iter_25_0]]
	end

	local var_25_1 = {}

	for iter_25_1, iter_25_2 in pairs(var_25_0) do
		local var_25_2 = 1

		for iter_25_3 = 1, 3 do
			if arg_25_0.cacheHeroTeam_[iter_25_3] == iter_25_2 then
				var_25_2 = iter_25_3

				break
			end
		end

		var_25_1[iter_25_1] = arg_25_0.heroModel_[var_25_2]

		if var_25_1[iter_25_1] then
			var_25_1[iter_25_1].transform.localPosition = SectionSelectHeroTools.HeroTransform[iter_25_1].position
			var_25_1[iter_25_1].transform.localEulerAngles = SectionSelectHeroTools.HeroTransform[iter_25_1].rotation
		end
	end

	arg_25_0.heroModel_ = var_25_1

	arg_25_0:ChangeHeroTeam(var_25_0)
	arg_25_0:RefreshHeroTeam()
	OperationRecorder.Record(arg_25_0.class.__cname, "endDrag")
end

function var_0_0.LoadHeroModels(arg_26_0)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0.cacheHeroTeam_) do
		if iter_26_1 ~= 0 and iter_26_1 then
			local var_26_0 = arg_26_0:GetSkinCfg(iter_26_0)

			table.insert(arg_26_0.loadingList_, iter_26_1)

			arg_26_0.loadAsyncIndex_[iter_26_0] = manager.resourcePool:AsyncLoad("Char/" .. var_26_0.ui_modelId, ASSET_TYPE.TPOSE, function(arg_27_0)
				arg_26_0.heroModel_[iter_26_0] = arg_27_0
				arg_26_0.heroModel_[iter_26_0].transform.localEulerAngles = SectionSelectHeroTools.HeroTransform[iter_26_0].rotation
				arg_26_0.heroModel_[iter_26_0].transform.localPosition = SectionSelectHeroTools.HeroTransform[iter_26_0].position
				arg_26_0.heroModel_[iter_26_0].transform.localScale = SectionSelectHeroTools.HeroTransform[iter_26_0].scale

				local var_27_0 = table.keyof(arg_26_0.loadingList_, iter_26_1)

				if var_27_0 then
					table.remove(arg_26_0.loadingList_, var_27_0)
				end
			end)
		end
	end
end

function var_0_0.DestroyHeroModels(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.heroModel_) do
		manager.resourcePool:DestroyOrReturn(iter_28_1, ASSET_TYPE.TPOSE)
	end

	for iter_28_2, iter_28_3 in pairs(arg_28_0.loadAsyncIndex_) do
		manager.resourcePool:StopAsyncQuest(arg_28_0.loadAsyncIndex_[iter_28_2])
	end

	arg_28_0.loadAsyncIndex_ = nil
	arg_28_0.heroModel_ = nil
end

function var_0_0.GetSkinCfg(arg_29_0, arg_29_1)
	return arg_29_0.sectionProxy_:CustomGetSkinCfg(arg_29_1, arg_29_0.cacheHeroTeam_[arg_29_1], arg_29_0.heroTrialList_[arg_29_1])
end

function var_0_0.PlayHeroTalk(arg_30_0, arg_30_1)
	if arg_30_0.talkTimer_ then
		arg_30_0.talkTimer_:Stop()

		arg_30_0.talkTimer_ = nil
	end

	HeroTools.StopTalk()

	if arg_30_0.talkCDTimer_ then
		return
	end

	arg_30_0.talkTimer_ = Timer.New(function()
		HeroTools.PlayTalk(arg_30_1, "leader")

		arg_30_0.talkTimer_ = nil
		arg_30_0.talkCDTimer_ = Timer.New(function()
			arg_30_0.talkCDTimer_:Stop()

			arg_30_0.talkCDTimer_ = nil
		end, HeroConst.SET_LEADER_VOICE_CD, 1)

		arg_30_0.talkCDTimer_:Start()
	end, HeroConst.TALK_DELAY_TIME, 1)

	arg_30_0.talkTimer_:Start()
end

function var_0_0.RefreshRace(arg_33_0)
	arg_33_0.raceActiveController_:SetSelectedState(tostring(arg_33_0.sectionProxy_.needRacePanel))

	if arg_33_0.sectionProxy_.needRacePanel then
		arg_33_0:RefreshRaceUI()
	end
end

function var_0_0.RefreshRaceUI(arg_34_0)
	local var_34_0
	local var_34_1
	local var_34_2

	if arg_34_0.sectionProxy_.forceRace == -1 then
		var_34_0, var_34_1, var_34_2 = arg_34_0:GetRaceEffect()
		arg_34_0.maxRaceID_ = var_34_0
		arg_34_0.sameCamp_ = var_34_2
	else
		var_34_0 = arg_34_0.sectionProxy_.forceRace
		var_34_1 = 0

		for iter_34_0, iter_34_1 in ipairs(arg_34_0.cacheHeroTeam_) do
			if iter_34_1 ~= 0 then
				var_34_1 = var_34_1 + 1
			end
		end
	end

	arg_34_0.maxRaceID_ = var_34_0
	arg_34_0.sameCamp_ = var_34_2

	if var_34_0 == 0 then
		arg_34_0.raceEffectController_:SetSelectedState("none")
	else
		arg_34_0.raceIcon_.sprite = HeroTools.GetRaceIcon(var_34_0)

		if var_34_1 > 1 then
			var_34_1 = var_34_1 <= 3 and var_34_1 or 3

			arg_34_0.raceEffectController_:SetSelectedState(tostring(var_34_1))
		end
	end
end

function var_0_0.RefreshCombo(arg_35_0)
	arg_35_0.comboActiveController_:SetSelectedState(tostring(arg_35_0.sectionProxy_.needComboSkillPanel))

	if arg_35_0.sectionProxy_.needComboSkillPanel then
		arg_35_0:RefreshComboSkillUI()
	end
end

function var_0_0.RefreshComboSkillUI(arg_36_0)
	arg_36_0.comboSkillView_:SetData()
end

function var_0_0.OnComboSkillSelect(arg_37_0)
	arg_37_0.comboSkillView_:OnComboSkillSelect()
end

function var_0_0.RefreshMimir(arg_38_0)
	if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.CHIP_MANAGER) then
		arg_38_0.mimirActiveController_:SetSelectedState("false")

		return
	end

	arg_38_0.mimirActiveController_:SetSelectedState(tostring(arg_38_0.sectionProxy_.needMimirPanel))

	if arg_38_0.sectionProxy_.needMimirPanel then
		arg_38_0:RefreshMimirUI()
	end
end

function var_0_0.RefreshMimirUI(arg_39_0)
	arg_39_0.mimirInfoView_:SetData()
end

function var_0_0.GetHeroTeam(arg_40_0)
	arg_40_0.cacheHeroTeam_, arg_40_0.lockStateList_, arg_40_0.lockList_, arg_40_0.heroTrialList_ = arg_40_0.sectionProxy_:GetHeroTeam()
end

function var_0_0.GetRaceEffect(arg_41_0)
	return arg_41_0.sectionProxy_:GetRaceEffect()
end

function var_0_0.CheckCanStartBattle(arg_42_0)
	local var_42_0 = true
	local var_42_1

	if #arg_42_0.loadingList_ > 0 then
		var_42_0 = false
	end

	return var_42_0, var_42_1
end

function var_0_0.GetHeroInfoItemClass(arg_43_0)
	return arg_43_0.sectionProxy_:GetHeroInfoItemClass()
end

function var_0_0.GetMimirInfoViewClass(arg_44_0)
	return arg_44_0.sectionProxy_:GetMimirInfoViewClass()
end

function var_0_0.GetComboSkillViewClass(arg_45_0)
	return arg_45_0.sectionProxy_:GetComboSkillViewClass()
end

function var_0_0.TryReload(arg_46_0)
	if not arg_46_0.createdSubview_ then
		arg_46_0.createdSubview_ = true
		arg_46_0.heroInfoItemList_ = {}

		local var_46_0 = arg_46_0.heroInfoItemContentTrans_.childCount

		for iter_46_0 = 1, var_46_0 do
			local var_46_1 = arg_46_0.heroInfoItemContentTrans_:GetChild(iter_46_0 - 1).gameObject

			arg_46_0.heroInfoItemList_[iter_46_0] = arg_46_0:GetHeroInfoItemClass().New(var_46_1, iter_46_0)
		end

		arg_46_0.comboSkillView_ = arg_46_0:GetComboSkillViewClass().New(arg_46_0.comboSkillGo_)
		arg_46_0.mimirInfoView_ = arg_46_0:GetMimirInfoViewClass().New(arg_46_0.mimirInfoGo_)
	end

	for iter_46_1, iter_46_2 in ipairs(arg_46_0.heroInfoItemList_) do
		iter_46_2 = arg_46_0:ReloadView(iter_46_2, arg_46_0.sectionProxy_:GetHeroInfoItemClass())
	end

	arg_46_0.comboSkillView_ = SectionSelectHeroTools.ReloadView(arg_46_0.comboSkillView_, arg_46_0.sectionProxy_:GetComboSkillViewClass())
	arg_46_0.mimirInfoView_ = SectionSelectHeroTools.ReloadView(arg_46_0.mimirInfoView_, arg_46_0.sectionProxy_:GetMimirInfoViewClass())
end

function var_0_0.ReloadView(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_1.__cname ~= arg_47_2.__cname then
		local var_47_0 = arg_47_1.gameObject
		local var_47_1 = arg_47_1.transform.parent
		local var_47_2 = Object.Instantiate(var_47_0, var_47_1)
		local var_47_3 = arg_47_2.New(var_47_2, var_47_1)

		arg_47_1:Dispose()

		return var_47_3
	else
		return arg_47_1
	end
end

return var_0_0
