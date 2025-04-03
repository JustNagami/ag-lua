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
	arg_3_0:InitSubViewCfg()
	arg_3_0:InitCallback()
end

function var_0_0.InitSubViewCfg(arg_4_0)
	arg_4_0.dragPosition_ = {}
	arg_4_0.prepareToDrag_ = false
	arg_4_0.heroInfoItemList_ = {}
end

function var_0_0.InitCallback(arg_5_0)
	arg_5_0.cameraTransitionEndHandler_ = handler(arg_5_0, arg_5_0.OnCameraTransitionEnd)
	arg_5_0.heroModelLoadedHandler_ = handler(arg_5_0, arg_5_0.OnHeroModelLoaded)
	arg_5_0.changeHeroTeamHandler_ = handler(arg_5_0, arg_5_0.OnChangeHeroTeam)
end

function var_0_0.SetProxy(arg_6_0, arg_6_1)
	arg_6_0.sectionProxy_ = arg_6_1
	arg_6_0.canSwitchResctrictHeroList_ = {
		0,
		0,
		0
	}

	if arg_6_0.sectionProxy_.stageType and arg_6_0.sectionProxy_.stageID and arg_6_0.sectionProxy_.stageID ~= 0 then
		local var_6_0, var_6_1 = BattleStageTools.GetRestrictHeroList(arg_6_0.sectionProxy_.stageType, arg_6_0.sectionProxy_.stageID)

		if type(var_6_1) == "table" then
			arg_6_0.canSwitchResctrictHeroList_ = var_6_1
		end
	end

	arg_6_0.reserveParams_ = arg_6_1:GetReserveParams()

	arg_6_0:ProcessSubView()
end

function var_0_0.ProcessSubView(arg_7_0)
	arg_7_0:InitSubView()
	arg_7_0:TryReloadSubView()
	arg_7_0:ProcessSubViewParams()
end

function var_0_0.ProcessSubViewParams(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.heroInfoItemList_) do
		iter_8_1:SetProxy(arg_8_0.sectionProxy_)
	end
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:AddEventListener()
	arg_9_0:ResetTempData()
	arg_9_0:ResetUpdatePosFlag()
	arg_9_0:SubViewOnEnter()
end

function var_0_0.AddEventListener(arg_10_0)
	arg_10_0:RegistEventListener(RESERVE_CAMERA_SWITCH_END, arg_10_0.cameraTransitionEndHandler_)
	arg_10_0:RegistEventListener(SECTION_HERO_MODEL_LOADED, arg_10_0.heroModelLoadedHandler_)
	arg_10_0:RegistEventListener(SECTION_CHANGE_HERO_TEAM, arg_10_0.changeHeroTeamHandler_)
end

function var_0_0.ResetTempData(arg_11_0)
	arg_11_0.heroModel_ = {}
	arg_11_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}
	arg_11_0.cacheHeroTeam_ = {}
	arg_11_0.heroTrialList_ = {}
	arg_11_0.needUpdatePosition_ = true
end

function var_0_0.SubViewOnEnter(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0.heroInfoItemList_) do
		iter_12_1:OnEnter(iter_12_0)
	end
end

function var_0_0.OnExit(arg_13_0)
	arg_13_0:RemoveAllEventListener()
	arg_13_0:SubViewOnExit()

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.heroInfoItemList_) do
		iter_13_1:OnExit()
	end

	arg_13_0:DestroyHeroModels()
	arg_13_0:StopUpdatePosTimer()
end

function var_0_0.SubViewOnExit(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.heroInfoItemList_) do
		iter_14_1:OnExit()
	end
end

function var_0_0.Dispose(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.heroInfoItemList_) do
		iter_15_1:Dispose()
	end

	arg_15_0.heroInfoItemList_ = nil
	arg_15_0.dragPosition_ = nil

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.AddListener(arg_16_0)
	return
end

function var_0_0.BeginDragHero(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not arg_17_0.prepareToDrag_ then
		return
	end

	if arg_17_0.selectIndex_ then
		return
	end

	if SectionSelectHeroScene.GetInstance():IsLoadingModel() then
		return
	end

	if arg_17_0.lockStateList_[arg_17_1] or arg_17_0.sectionProxy_.canChangeTeam ~= nil and arg_17_0.sectionProxy_.canChangeTeam == false then
		ShowTips("CAN_NOT_CHANGE_HERO")

		return
	end

	if arg_17_0.canSwitchResctrictHeroList_[arg_17_1] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
		ShowTips("TEAM_ERROR_CHANGE")

		return
	end

	arg_17_0.selectIndex_ = arg_17_1
	arg_17_0.cacheSelectIndex_ = arg_17_1
	arg_17_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}

	manager.notify:Invoke(SECTION_BEGIN_DRAG_HERO)
end

function var_0_0.DragHero(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if not arg_18_0.prepareToDrag_ then
		return
	end

	if arg_18_0.selectIndex_ ~= arg_18_1 then
		return
	end

	if SectionSelectHeroScene.GetInstance():IsLoadingModel() then
		return
	end

	local var_18_0 = arg_18_3.delta * manager.ui.canvasRate
	local var_18_1 = Vector3(var_18_0.x, 0, 0)
	local var_18_2 = arg_18_2.transform
	local var_18_3 = var_18_2:GetLocalPosition()

	var_18_2:SetLocalPosition(var_18_3 + var_18_1)

	local var_18_4 = manager.ui.uiCamera:WorldToScreenPoint(arg_18_2:GetPosition())
	local var_18_5 = false

	if var_18_4.x < arg_18_0.secondHeroScreenPos_.x then
		var_18_4.x = arg_18_0.secondHeroScreenPos_.x
		var_18_5 = true
	elseif var_18_4.x > arg_18_0.thirdHeroScreenPos_.x then
		var_18_4.x = arg_18_0.thirdHeroScreenPos_.x
		var_18_5 = true
	end

	if var_18_5 then
		local var_18_6, var_18_7 = UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(var_18_2.parent, var_18_4, manager.ui.uiCamera, nil)

		var_18_2:SetLocalPosition(var_18_7)
	end

	if not arg_18_0.lockStateList_[arg_18_1] or arg_18_0.sectionProxy_.canChangeTeam ~= nil and arg_18_0.sectionProxy_.canChangeTeam == true or arg_18_0.canSwitchResctrictHeroList_[arg_18_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
		local var_18_8 = manager.ui.uiCamera:WorldToScreenPoint(arg_18_2:GetPosition())
		local var_18_9 = arg_18_0:GetTargetDragDistance(var_18_8)
		local var_18_10 = SectionSelectHeroTools.GetModelOffesetPosition(var_18_8, arg_18_0.firstHeroScreenPos_, var_18_9)

		SectionSelectHeroScene.GetInstance():SetModelLocalPosition(arg_18_1, SectionSelectHeroConst.HeroModelTransform[1].position + var_18_10)
		arg_18_0:TryModifyHeroPos()
	end
end

function var_0_0.EndDragHero(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if not arg_19_0.prepareToDrag_ then
		return
	end

	if arg_19_0.selectIndex_ ~= arg_19_1 then
		return
	end

	if SectionSelectHeroScene.GetInstance():IsLoadingModel() then
		return
	end

	arg_19_2.transform.localPosition = arg_19_0.dragPosition_[arg_19_1]

	if not arg_19_0.lockStateList_[arg_19_1] or arg_19_0.sectionProxy_.canChangeTeam ~= nil and arg_19_0.sectionProxy_.canChangeTeam == true or arg_19_0.canSwitchResctrictHeroList_[arg_19_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
		arg_19_0:EndDrag(arg_19_1)
	end

	arg_19_0.selectIndex_ = nil
end

function var_0_0.TryModifyHeroPos(arg_20_0)
	local var_20_0 = SectionSelectHeroScene.GetInstance():GetModelLocalPosition(arg_20_0.selectIndex_)

	for iter_20_0 = 1, 3 do
		if math.abs(SectionSelectHeroConst.HeroModelTransform[iter_20_0].position.x - var_20_0.x) <= 0.6 and iter_20_0 ~= arg_20_0.cacheSelectIndex_ then
			if arg_20_0.cacheHeroTeam_[arg_20_0.cacheHeroNumber_[iter_20_0]] == 0 or arg_20_0.canSwitchResctrictHeroList_[arg_20_0.cacheHeroNumber_[iter_20_0]] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
				break
			end

			if arg_20_0.lockStateList_[arg_20_0.selectIndex_] or arg_20_0.lockStateList_[iter_20_0] then
				return
			end

			local var_20_1 = SectionSelectHeroScene.GetInstance():GetModel(arg_20_0.cacheHeroNumber_[iter_20_0])

			SectionSelectHeroScene.GetInstance():InitModelTransform(var_20_1, arg_20_0.cacheSelectIndex_)

			local var_20_2 = arg_20_0.cacheHeroNumber_[iter_20_0]

			arg_20_0.cacheHeroNumber_[iter_20_0] = arg_20_0.cacheHeroNumber_[arg_20_0.cacheSelectIndex_]
			arg_20_0.cacheHeroNumber_[arg_20_0.cacheSelectIndex_] = var_20_2
			arg_20_0.cacheSelectIndex_ = iter_20_0

			break
		end
	end
end

function var_0_0.EndDrag(arg_21_0, arg_21_1)
	local var_21_0 = {}

	for iter_21_0 = 1, 3 do
		var_21_0[iter_21_0] = arg_21_0.cacheHeroTeam_[arg_21_0.cacheHeroNumber_[iter_21_0]]
	end

	local var_21_1 = {}

	for iter_21_1, iter_21_2 in pairs(var_21_0) do
		local var_21_2 = 1

		for iter_21_3 = 1, 3 do
			if arg_21_0.cacheHeroTeam_[iter_21_3] == iter_21_2 then
				var_21_2 = iter_21_3

				break
			end
		end

		var_21_1[iter_21_1] = var_21_2
	end

	SectionSelectHeroScene.GetInstance():ReorderModelByPosList(var_21_1)
	arg_21_0:ChangeHeroTeam(var_21_0)
	arg_21_0:RefreshHeroTeam()
	arg_21_0:StartUpdateHeorInfoItemPos()
	OperationRecorder.Record(arg_21_0.class.__cname, "endDrag")
end

function var_0_0.ClickHero(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	if not arg_22_3.dragging then
		if arg_22_0.selectIndex_ then
			return
		end

		if SectionSelectHeroScene.GetInstance():IsLoadingModel() then
			return
		end

		arg_22_0:RrocessClickHero(arg_22_1)
	end
end

function var_0_0.RrocessClickHero(arg_23_0, arg_23_1)
	manager.notify:Invoke(SECTION_CLICK_HERO, arg_23_1)
end

function var_0_0.Refresh(arg_24_0)
	arg_24_0:RefreshHeroTeam()
	arg_24_0:LoadHeroModels()
end

function var_0_0.RefreshHeroTeam(arg_25_0)
	arg_25_0:GetHeroTeam()
	arg_25_0:RefreshHeroInfoItem()
end

function var_0_0.RefreshHeroInfoItem(arg_26_0)
	for iter_26_0 = 1, 3 do
		arg_26_0.heroInfoItemList_[iter_26_0]:Refresh(iter_26_0)
	end
end

function var_0_0.ChangeHeroTeam(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1
	local var_27_1 = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
		local var_27_2 = table.keyof(arg_27_0.cacheHeroTeam_, iter_27_1)

		var_27_1[iter_27_0] = arg_27_0.heroTrialList_[var_27_2]
	end

	arg_27_0.sectionProxy_:ChangeHeroTeam(var_27_0, var_27_1)
end

function var_0_0.LoadHeroModels(arg_28_0)
	local var_28_0 = {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.cacheHeroTeam_) do
		if iter_28_1 == 0 then
			var_28_0[iter_28_0] = 0
		else
			var_28_0[iter_28_0] = arg_28_0:GetSkinCfg(iter_28_0).id
		end
	end

	SectionSelectHeroScene.GetInstance():LoadHeroModels(var_28_0)
end

function var_0_0.DestroyHeroModels(arg_29_0)
	SectionSelectHeroScene.GetInstance():DestroyModels()
end

function var_0_0.GetHeroTeam(arg_30_0)
	arg_30_0.cacheHeroTeam_, arg_30_0.lockStateList_, arg_30_0.lockList_, arg_30_0.heroTrialList_ = arg_30_0.sectionProxy_:GetHeroTeam()
end

function var_0_0.GetRaceEffect(arg_31_0)
	return arg_31_0.sectionProxy_:GetRaceEffect()
end

function var_0_0.CheckCanStartBattle(arg_32_0)
	local var_32_0 = true
	local var_32_1

	if SectionSelectHeroScene.GetInstance():IsLoadingModel() then
		var_32_0 = false
	end

	return var_32_0, var_32_1
end

function var_0_0.GetSkinCfg(arg_33_0, arg_33_1)
	return arg_33_0.sectionProxy_:CustomGetSkinCfg(arg_33_1, arg_33_0.cacheHeroTeam_[arg_33_1], arg_33_0.heroTrialList_[arg_33_1])
end

function var_0_0.GetHeroInfoItemClass(arg_34_0)
	return arg_34_0.sectionProxy_:GetHeroInfoItemClass()
end

function var_0_0.InitSubView(arg_35_0)
	if not arg_35_0.createdSubview_ then
		arg_35_0.createdSubview_ = true
		arg_35_0.heroInfoItemList_ = {}

		local var_35_0 = arg_35_0.heroInfoItemContentTrans_.childCount

		for iter_35_0 = 1, var_35_0 do
			local var_35_1 = arg_35_0.heroInfoItemContentTrans_:GetChild(iter_35_0 - 1).gameObject
			local var_35_2 = var_35_1.name
			local var_35_3 = string.split(var_35_2, "_")
			local var_35_4 = tonumber(var_35_3[#var_35_3])

			arg_35_0.heroInfoItemList_[var_35_4] = arg_35_0:GetHeroInfoItemClass().New(var_35_1, var_35_4)

			arg_35_0:InitHeroInfoItem(var_35_4)
		end
	end
end

function var_0_0.InitHeroInfoItem(arg_36_0, arg_36_1)
	arg_36_0.heroInfoItemList_[arg_36_1]:RegisterBeginDrag(handler(arg_36_0, arg_36_0.BeginDragHero))
	arg_36_0.heroInfoItemList_[arg_36_1]:RegisterDrag(handler(arg_36_0, arg_36_0.DragHero))
	arg_36_0.heroInfoItemList_[arg_36_1]:RegisterEndDrag(handler(arg_36_0, arg_36_0.EndDragHero))
	arg_36_0.heroInfoItemList_[arg_36_1]:RegistClick(handler(arg_36_0, arg_36_0.ClickHero))
end

function var_0_0.GetTargetDragDistance(arg_37_0, arg_37_1)
	local var_37_0

	if arg_37_1.x <= arg_37_0.firstHeroScreenPos_.x then
		var_37_0 = arg_37_0.f2SHeroScreenDistance_
	else
		var_37_0 = arg_37_0.f2THeroScreenDistance_
	end

	return var_37_0
end

function var_0_0.ResetUpdatePosFlag(arg_38_0)
	arg_38_0.isCameraTransitionEnd_ = false
	arg_38_0.isHeroModelLoaded_ = false
end

function var_0_0.OnCameraTransitionEnd(arg_39_0)
	arg_39_0.isCameraTransitionEnd_ = true

	if arg_39_0:CanUpdatePosition() then
		arg_39_0:UpdatePosition()
	end
end

function var_0_0.OnHeroModelLoaded(arg_40_0)
	arg_40_0.isHeroModelLoaded_ = true

	if arg_40_0:CanUpdatePosition() then
		arg_40_0:UpdatePosition()
	end
end

function var_0_0.OnChangeHeroTeam(arg_41_0)
	if arg_41_0:CanUpdatePosition() then
		arg_41_0:UpdatePosition()
	end
end

function var_0_0.CanUpdatePosition(arg_42_0)
	return arg_42_0.isCameraTransitionEnd_ and arg_42_0.isHeroModelLoaded_ and arg_42_0.needUpdatePosition_
end

function var_0_0.UpdatePosition(arg_43_0)
	arg_43_0:StopUpdatePosTimer()
	arg_43_0:StartUpdatePosTimer()
end

function var_0_0.StopUpdatePosTimer(arg_44_0)
	if arg_44_0.updatePosTimer_ then
		arg_44_0.updatePosTimer_:Stop()

		arg_44_0.updatePisTimer_ = nil
	end
end

function var_0_0.StartUpdatePosTimer(arg_45_0)
	arg_45_0.updatePosTimer_ = FrameTimer.New(handler(arg_45_0, arg_45_0.OnUpdatePosTimerEnd), 1, 1)

	arg_45_0.updatePosTimer_:Start()
end

function var_0_0.OnUpdatePosTimerEnd(arg_46_0)
	arg_46_0:StartUpdateHeorInfoItemPos()

	arg_46_0.needUpdatePosition_ = false
end

function var_0_0.StartUpdateHeorInfoItemPos(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.heroInfoItemList_) do
		if not iter_47_1:UpdatePosition() then
			Debug.LogError("Culculate hero pos error, reculculate at next frame")
			arg_47_0:StartUpdatePosTimer()

			return
		end
	end

	arg_47_0:UpdateDragParams()
end

function var_0_0.UpdateDragParams(arg_48_0)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.heroInfoItemList_) do
		arg_48_0.dragPosition_[iter_48_0] = iter_48_1:GetOriginalDragPosition()
	end

	arg_48_0.firstHeroScreenPos_ = arg_48_0.heroInfoItemList_[1]:GetOriginalDragScreenPosition()
	arg_48_0.secondHeroScreenPos_ = arg_48_0.heroInfoItemList_[2]:GetOriginalDragScreenPosition()
	arg_48_0.thirdHeroScreenPos_ = arg_48_0.heroInfoItemList_[3]:GetOriginalDragScreenPosition()
	arg_48_0.f2SHeroScreenDistance_ = math.abs(arg_48_0.firstHeroScreenPos_.x - arg_48_0.secondHeroScreenPos_.x)
	arg_48_0.f2THeroScreenDistance_ = math.abs(arg_48_0.firstHeroScreenPos_.x - arg_48_0.thirdHeroScreenPos_.x)
	arg_48_0.prepareToDrag_ = true
end

function var_0_0.TryReloadSubView(arg_49_0)
	for iter_49_0, iter_49_1 in ipairs(arg_49_0.heroInfoItemList_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_49_1, arg_49_0.sectionProxy_:GetHeroInfoItemClass()) then
			iter_49_1 = SectionSelectHeroTools.ReloadView(iter_49_1, arg_49_0.sectionProxy_:GetHeroInfoItemClass())

			arg_49_0:InitHeroInfoItem(iter_49_0)
		end
	end

	arg_49_0:RebindController()
end

function var_0_0.RebindController(arg_50_0)
	for iter_50_0, iter_50_1 in ipairs(arg_50_0.heroInfoItemList_) do
		iter_50_1:RebindController()
	end
end

return var_0_0
