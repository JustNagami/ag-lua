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
	arg_4_0.heroInfoItemList_ = {}
end

function var_0_0.InitCallback(arg_5_0)
	return
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
	arg_9_0:SubViewOnEnter()
end

function var_0_0.AddEventListener(arg_10_0)
	return
end

function var_0_0.ResetTempData(arg_11_0)
	arg_11_0.heroModel_ = {}
	arg_11_0.loadAsyncIndex_ = {}
	arg_11_0.loadingList_ = {}
	arg_11_0.cacheHeroNumber_ = {
		1,
		2,
		3
	}
	arg_11_0.cacheHeroTeam_ = {}
	arg_11_0.heroTrialList_ = {}
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

	if arg_13_0.talkTimer_ then
		arg_13_0.talkTimer_:Stop()

		arg_13_0.talkTimer_ = nil
	end

	if arg_13_0.talkCDTimer_ then
		arg_13_0.talkCDTimer_:Stop()

		arg_13_0.talkCDTimer_ = nil
	end

	HeroTools.StopTalk()
	arg_13_0:DestroyHeroModels()
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
	if arg_17_0.selectIndex_ then
		return
	end

	if #arg_17_0.loadingList_ > 0 then
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
end

function var_0_0.DragHero(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_0.selectIndex_ ~= arg_18_1 then
		return
	end

	if #arg_18_0.loadingList_ > 0 then
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

	local var_18_8 = manager.ui.uiCamera:WorldToScreenPoint(arg_18_2:GetPosition())
	local var_18_9 = SectionSelectHeroTools.GetModelOffesetPosition(var_18_8, arg_18_0.firstHeroScreenPos_, arg_18_0.heroScreenDistance_)

	if arg_18_0.heroModel_[arg_18_1] then
		arg_18_0.heroModel_[arg_18_1].transform.localPosition = SectionSelectHeroConst.HeroModelTransform[1].position + var_18_9

		if not arg_18_0.lockStateList_[arg_18_1] or arg_18_0.sectionProxy_.canChangeTeam ~= nil and arg_18_0.sectionProxy_.canChangeTeam == true or arg_18_0.canSwitchResctrictHeroList_[arg_18_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
			arg_18_0:TryModifyHeroPos()
		end
	end
end

function var_0_0.EndDragHero(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if arg_19_0.selectIndex_ ~= arg_19_1 then
		return
	end

	if #arg_19_0.loadingList_ > 0 then
		return
	end

	arg_19_2.transform.localPosition = arg_19_0.dragPosition_[arg_19_1]

	if not arg_19_0.lockStateList_[arg_19_1] or arg_19_0.sectionProxy_.canChangeTeam ~= nil and arg_19_0.sectionProxy_.canChangeTeam == true or arg_19_0.canSwitchResctrictHeroList_[arg_19_1] == ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
		arg_19_0:EndDrag(arg_19_1)
	end

	arg_19_0.selectIndex_ = nil
end

function var_0_0.ClickHero(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if not arg_20_3.dragging then
		if arg_20_0.selectIndex_ then
			return
		end

		if #arg_20_0.loadingList_ > 0 then
			return
		end

		arg_20_0:RrocessClickHero(arg_20_1)
	end
end

function var_0_0.RrocessClickHero(arg_21_0, arg_21_1)
	manager.notify:Invoke(SECTION_CLICK_HERO, arg_21_1)
end

function var_0_0.Refresh(arg_22_0)
	arg_22_0:RefreshHeroTeam()
	arg_22_0:LoadHeroModels()
end

function var_0_0.RefreshHeroTeam(arg_23_0)
	arg_23_0:GetHeroTeam()
	arg_23_0:RefreshHeroInfoItem()
end

function var_0_0.RefreshHeroInfoItem(arg_24_0)
	for iter_24_0 = 1, 3 do
		arg_24_0.heroInfoItemList_[iter_24_0]:Refresh(iter_24_0)
	end
end

function var_0_0.ChangeHeroTeam(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		local var_25_2 = table.keyof(arg_25_0.cacheHeroTeam_, iter_25_1)

		var_25_1[iter_25_0] = arg_25_0.heroTrialList_[var_25_2]
	end

	if var_25_0[1] ~= arg_25_0.cacheHeroTeam_[1] then
		arg_25_0:PlayHeroTalk(var_25_0[1])
	end

	arg_25_0.sectionProxy_:ChangeHeroTeam(var_25_0, var_25_1)
	manager.notify:Invoke(SECTION_CHANGE_HERO_TEAM, var_25_0, var_25_1)
end

function var_0_0.TryModifyHeroPos(arg_26_0)
	local var_26_0 = arg_26_0.heroModel_[arg_26_0.selectIndex_].transform.localPosition

	for iter_26_0 = 1, 3 do
		if math.abs(SectionSelectHeroConst.HeroModelTransform[iter_26_0].position.x - var_26_0.x) <= 0.6 and iter_26_0 ~= arg_26_0.cacheSelectIndex_ then
			if arg_26_0.cacheHeroTeam_[arg_26_0.cacheHeroNumber_[iter_26_0]] == 0 or arg_26_0.canSwitchResctrictHeroList_[arg_26_0.cacheHeroNumber_[iter_26_0]] ~= ReserveConst.RESTRICT_HERO_SWITCH_MODE.FORBID then
				break
			end

			if arg_26_0.lockStateList_[arg_26_0.selectIndex_] or arg_26_0.lockStateList_[iter_26_0] then
				return
			end

			if arg_26_0.heroModel_[arg_26_0.cacheHeroNumber_[iter_26_0]] then
				arg_26_0.heroModel_[arg_26_0.cacheHeroNumber_[iter_26_0]].transform.localPosition = SectionSelectHeroConst.HeroModelTransform[arg_26_0.cacheSelectIndex_].position
				arg_26_0.heroModel_[arg_26_0.cacheHeroNumber_[iter_26_0]].transform.localEulerAngles = SectionSelectHeroConst.HeroModelTransform[arg_26_0.cacheSelectIndex_].rotation
			end

			local var_26_1 = arg_26_0.cacheHeroNumber_[iter_26_0]

			arg_26_0.cacheHeroNumber_[iter_26_0] = arg_26_0.cacheHeroNumber_[arg_26_0.cacheSelectIndex_]
			arg_26_0.cacheHeroNumber_[arg_26_0.cacheSelectIndex_] = var_26_1
			arg_26_0.cacheSelectIndex_ = iter_26_0

			break
		end
	end
end

function var_0_0.EndDrag(arg_27_0, arg_27_1)
	local var_27_0 = {}

	for iter_27_0 = 1, 3 do
		var_27_0[iter_27_0] = arg_27_0.cacheHeroTeam_[arg_27_0.cacheHeroNumber_[iter_27_0]]
	end

	local var_27_1 = {}

	for iter_27_1, iter_27_2 in pairs(var_27_0) do
		local var_27_2 = 1

		for iter_27_3 = 1, 3 do
			if arg_27_0.cacheHeroTeam_[iter_27_3] == iter_27_2 then
				var_27_2 = iter_27_3

				break
			end
		end

		var_27_1[iter_27_1] = arg_27_0.heroModel_[var_27_2]

		if var_27_1[iter_27_1] then
			var_27_1[iter_27_1].transform.localPosition = SectionSelectHeroConst.HeroModelTransform[iter_27_1].position
			var_27_1[iter_27_1].transform.localEulerAngles = SectionSelectHeroConst.HeroModelTransform[iter_27_1].rotation
		end
	end

	arg_27_0.heroModel_ = var_27_1

	arg_27_0:ChangeHeroTeam(var_27_0)
	arg_27_0:RefreshHeroTeam()
	OperationRecorder.Record(arg_27_0.class.__cname, "endDrag")
end

function var_0_0.LoadHeroModels(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0.cacheHeroTeam_) do
		if iter_28_1 ~= 0 and iter_28_1 then
			local var_28_0 = arg_28_0:GetSkinCfg(iter_28_0)

			table.insert(arg_28_0.loadingList_, iter_28_1)

			arg_28_0.loadAsyncIndex_[iter_28_0] = manager.resourcePool:AsyncLoad("Char/" .. var_28_0.ui_modelId, ASSET_TYPE.TPOSE, function(arg_29_0)
				arg_28_0.heroModel_[iter_28_0] = arg_29_0
				arg_28_0.heroModel_[iter_28_0].transform.localEulerAngles = SectionSelectHeroConst.HeroModelTransform[iter_28_0].rotation
				arg_28_0.heroModel_[iter_28_0].transform.localPosition = SectionSelectHeroConst.HeroModelTransform[iter_28_0].position
				arg_28_0.heroModel_[iter_28_0].transform.localScale = SectionSelectHeroConst.HeroModelTransform[iter_28_0].scale

				local var_29_0 = table.keyof(arg_28_0.loadingList_, iter_28_1)

				if var_29_0 then
					table.remove(arg_28_0.loadingList_, var_29_0)
				end
			end)
		end
	end
end

function var_0_0.DestroyHeroModels(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.heroModel_) do
		manager.resourcePool:DestroyOrReturn(iter_30_1, ASSET_TYPE.TPOSE)
	end

	for iter_30_2, iter_30_3 in pairs(arg_30_0.loadAsyncIndex_) do
		manager.resourcePool:StopAsyncQuest(arg_30_0.loadAsyncIndex_[iter_30_2])
	end

	arg_30_0.loadAsyncIndex_ = nil
	arg_30_0.heroModel_ = nil
end

function var_0_0.GetSkinCfg(arg_31_0, arg_31_1)
	return arg_31_0.sectionProxy_:CustomGetSkinCfg(arg_31_1, arg_31_0.cacheHeroTeam_[arg_31_1], arg_31_0.heroTrialList_[arg_31_1])
end

function var_0_0.PlayHeroTalk(arg_32_0, arg_32_1)
	if arg_32_0.talkTimer_ then
		arg_32_0.talkTimer_:Stop()

		arg_32_0.talkTimer_ = nil
	end

	HeroTools.StopTalk()

	if arg_32_0.talkCDTimer_ then
		return
	end

	arg_32_0.talkTimer_ = Timer.New(function()
		HeroTools.PlayTalk(arg_32_1, "leader")

		arg_32_0.talkTimer_ = nil
		arg_32_0.talkCDTimer_ = Timer.New(function()
			arg_32_0.talkCDTimer_:Stop()

			arg_32_0.talkCDTimer_ = nil
		end, HeroConst.SET_LEADER_VOICE_CD, 1)

		arg_32_0.talkCDTimer_:Start()
	end, HeroConst.TALK_DELAY_TIME, 1)

	arg_32_0.talkTimer_:Start()
end

function var_0_0.GetHeroTeam(arg_35_0)
	arg_35_0.cacheHeroTeam_, arg_35_0.lockStateList_, arg_35_0.lockList_, arg_35_0.heroTrialList_ = arg_35_0.sectionProxy_:GetHeroTeam()
end

function var_0_0.GetRaceEffect(arg_36_0)
	return arg_36_0.sectionProxy_:GetRaceEffect()
end

function var_0_0.CheckCanStartBattle(arg_37_0)
	local var_37_0 = true
	local var_37_1

	if #arg_37_0.loadingList_ > 0 then
		var_37_0 = false
	end

	return var_37_0, var_37_1
end

function var_0_0.GetHeroInfoItemClass(arg_38_0)
	return arg_38_0.sectionProxy_:GetHeroInfoItemClass()
end

function var_0_0.InitSubView(arg_39_0)
	if not arg_39_0.createdSubview_ then
		arg_39_0.createdSubview_ = true
		arg_39_0.heroInfoItemList_ = {}

		local var_39_0 = arg_39_0.heroInfoItemContentTrans_.childCount

		for iter_39_0 = 1, var_39_0 do
			local var_39_1 = arg_39_0.heroInfoItemContentTrans_:GetChild(iter_39_0 - 1).gameObject

			arg_39_0.heroInfoItemList_[iter_39_0] = arg_39_0:GetHeroInfoItemClass().New(var_39_1, iter_39_0)

			arg_39_0:InitHeroInfoItem(iter_39_0)
		end

		arg_39_0:InitDragParams()
	end
end

function var_0_0.TryReloadSubView(arg_40_0)
	for iter_40_0, iter_40_1 in ipairs(arg_40_0.heroInfoItemList_) do
		if SectionSelectHeroTools.IsDiffViewClass(iter_40_1, arg_40_0.sectionProxy_:GetHeroInfoItemClass()) then
			iter_40_1 = SectionSelectHeroTools.ReloadView(iter_40_1, arg_40_0.sectionProxy_:GetHeroInfoItemClass())

			arg_40_0:InitHeroInfoItem(iter_40_0)
		end
	end

	arg_40_0:RebindController()
	arg_40_0:InitDragParams()
end

function var_0_0.RebindController(arg_41_0)
	for iter_41_0, iter_41_1 in ipairs(arg_41_0.heroInfoItemList_) do
		iter_41_1:RebindController()
	end
end

function var_0_0.InitHeroInfoItem(arg_42_0, arg_42_1)
	arg_42_0.heroInfoItemList_[arg_42_1]:RegisterBeginDrag(handler(arg_42_0, arg_42_0.BeginDragHero))
	arg_42_0.heroInfoItemList_[arg_42_1]:RegisterDrag(handler(arg_42_0, arg_42_0.DragHero))
	arg_42_0.heroInfoItemList_[arg_42_1]:RegisterEndDrag(handler(arg_42_0, arg_42_0.EndDragHero))
	arg_42_0.heroInfoItemList_[arg_42_1]:RegistClick(handler(arg_42_0, arg_42_0.ClickHero))

	arg_42_0.dragPosition_[arg_42_1] = arg_42_0.heroInfoItemList_[arg_42_1]:GetOriginalDragPosition()
end

function var_0_0.InitDragParams(arg_43_0)
	arg_43_0.firstHeroScreenPos_ = arg_43_0.heroInfoItemList_[1]:GetOriginalDragScreenPosition()
	arg_43_0.secondHeroScreenPos_ = arg_43_0.heroInfoItemList_[2]:GetOriginalDragScreenPosition()
	arg_43_0.thirdHeroScreenPos_ = arg_43_0.heroInfoItemList_[3]:GetOriginalDragScreenPosition()
	arg_43_0.heroScreenDistance_ = math.abs(arg_43_0.firstHeroScreenPos_.x - arg_43_0.secondHeroScreenPos_.x)
end

return var_0_0
