local var_0_0 = class("SectionSelectHeroInfoItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.pos_ = arg_1_2

	SetActive(arg_1_0.gameObject_, true)
	arg_1_0:Init()

	local var_1_0 = arg_1_0.dragEventListener_.transform

	arg_1_0.originalDragPosition_ = var_1_0:GetLocalPosition()
	arg_1_0.originalDragScreenPos_ = manager.ui.uiCamera:WorldToScreenPoint(var_1_0.position)
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:InitController()
	arg_2_0:AddUIListener()
end

function var_0_0.InitController(arg_3_0)
	arg_3_0.trialController_ = arg_3_0.controllerExCollection_:GetController("trial")
	arg_3_0.heroLockController_ = arg_3_0.controllerExCollection_:GetController("heroLock")
	arg_3_0.postController_ = arg_3_0.controllerExCollection_:GetController("post")
	arg_3_0.emptyController_ = arg_3_0.controllerExCollection_:GetController("empty")
	arg_3_0.hpController_ = arg_3_0.controllerExCollection_:GetController("HP")
	arg_3_0.assistantController_ = arg_3_0.controllerExCollection_:GetController("assistant")
	arg_3_0.powerController_ = arg_3_0.controllerExCollection_:GetController("power")
	arg_3_0.energyController_ = arg_3_0.controllerExCollection_:GetController("energy")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0.dragEventListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(function(arg_5_0, arg_5_1)
		arg_4_0.canDrag_ = not arg_4_0:IsEmpty()

		if not arg_4_0.canDrag_ then
			return
		end

		if arg_4_0.beginDragCallback_ then
			arg_4_0.beginDragCallback_(arg_4_0.pos_, arg_5_0, arg_5_1)
		end
	end))
	arg_4_0.dragEventListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.Drag, LuaHelper.EventTriggerAction1(function(arg_6_0, arg_6_1)
		if not arg_4_0.canDrag_ then
			return
		end

		if arg_4_0.dragCallback_ then
			arg_4_0.dragCallback_(arg_4_0.pos_, arg_6_0, arg_6_1)
		end
	end))
	arg_4_0.dragEventListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(function(arg_7_0, arg_7_1)
		if not arg_4_0.canDrag_ then
			return
		end

		if arg_4_0.endDragCallback_ then
			arg_4_0.endDragCallback_(arg_4_0.pos_, arg_7_0, arg_7_1)
		end
	end))
	arg_4_0.dragEventListener_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerUp, LuaHelper.EventTriggerAction1(function(arg_8_0, arg_8_1)
		if arg_4_0.clickCallback_ then
			arg_4_0.clickCallback_(arg_4_0.pos_, arg_8_0, arg_8_1)
		end
	end))
end

function var_0_0.RegisterBeginDrag(arg_9_0, arg_9_1)
	arg_9_0.beginDragCallback_ = arg_9_1
end

function var_0_0.RegisterDrag(arg_10_0, arg_10_1)
	arg_10_0.dragCallback_ = arg_10_1
end

function var_0_0.RegisterEndDrag(arg_11_0, arg_11_1)
	arg_11_0.endDragCallback_ = arg_11_1
end

function var_0_0.RegistClick(arg_12_0, arg_12_1)
	arg_12_0.clickCallback_ = arg_12_1
end

function var_0_0.GetOriginalDragPosition(arg_13_0)
	return arg_13_0.originalDragPosition_
end

function var_0_0.GetOriginalDragScreenPosition(arg_14_0)
	return arg_14_0.originalDragScreenPos_
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:RemoveTriggerListeners()

	arg_15_0.originalDragPosition_ = nil

	var_0_0.super.Dispose(arg_15_0)
end

function var_0_0.RemoveTriggerListeners(arg_16_0)
	arg_16_0.dragEventListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_16_0.dragEventListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.Drag)
	arg_16_0.dragEventListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_16_0.dragEventListener_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerUp)
end

function var_0_0.SetProxy(arg_17_0, arg_17_1)
	arg_17_0.sectionProxy_ = arg_17_1
end

function var_0_0.OnEnter(arg_18_0, arg_18_1)
	arg_18_0:BindRedPoint()
end

function var_0_0.OnExit(arg_19_0)
	arg_19_0:UnBindRedPoint()
end

function var_0_0.Refresh(arg_20_0, arg_20_1)
	arg_20_0.pos_ = arg_20_1
	arg_20_0.isCaptain_ = arg_20_1 == 1
	arg_20_0.heroID_ = arg_20_0.sectionProxy_.heroInfoList[arg_20_0.pos_].heroID
	arg_20_0.trialID_ = arg_20_0.sectionProxy_.heroInfoList[arg_20_0.pos_].trialID
	arg_20_0.isPosLock_ = arg_20_0.sectionProxy_.heroInfoList[arg_20_0.pos_].isPosLock
	arg_20_0.isHeroLock_ = arg_20_0.sectionProxy_.heroInfoList[arg_20_0.pos_].isHeroLock

	arg_20_0:RefreshUI()
	arg_20_0:RefreshCustomUI()
end

function var_0_0.RefreshUI(arg_21_0)
	if not arg_21_0.stateController_ then
		arg_21_0:RebindController()
	end

	arg_21_0:RefreshAddBtn()

	if arg_21_0:IsEmpty() then
		arg_21_0.emptyController_:SetSelectedState("true")

		return
	else
		arg_21_0.emptyController_:SetSelectedState("false")
	end

	arg_21_0:RefreshTrial()
	arg_21_0:RefreshHeroLock()
	arg_21_0:RefershPower()
	arg_21_0:RefreshRace()
	arg_21_0:RefreshPost()
	arg_21_0:RefreshAttackType()
	arg_21_0:RefreshHP()
	arg_21_0:RefreshAssistant()
	arg_21_0:RefreshEnergy()
end

function var_0_0.RefreshTrial(arg_22_0)
	local var_22_0 = not arg_22_0.isPosLock_ and not arg_22_0.isHeroLock_ and arg_22_0.trialID_ and arg_22_0.trialID_ ~= 0

	arg_22_0.trialController_:SetSelectedState(tostring(var_22_0))
end

function var_0_0.RefreshHeroLock(arg_23_0)
	local var_23_0 = arg_23_0.isHeroLock_ or arg_23_0.isPosLock_

	arg_23_0.heroLockController_:SetSelectedState(tostring(var_23_0))
end

function var_0_0.RefreshAddBtn(arg_24_0)
	if arg_24_0.stateController_ then
		if not arg_24_0:IsEmpty() then
			arg_24_0.stateController_:SetSelectedState("selected")
		elseif arg_24_0.isPosLock_ == true or not arg_24_0.sectionProxy_.canChangeTeam then
			arg_24_0.stateController_:SetSelectedState("lock")
		else
			arg_24_0.stateController_:SetSelectedState("empty")
		end
	end
end

function var_0_0.RebindController(arg_25_0)
	local var_25_0 = GameObject.Find(string.format("X104/X104_SceneSteps/X104_Formation_HeroPos_%s", arg_25_0.pos_))

	if var_25_0 then
		arg_25_0.stateController_ = var_25_0:GetComponent("ControllerExCollection"):GetController("state")
	end
end

function var_0_0.IsEmpty(arg_26_0)
	return not arg_26_0.heroID_ or arg_26_0.heroID_ == 0
end

function var_0_0.RefershPower(arg_27_0)
	arg_27_0.powerController_:SetSelectedState(tostring(arg_27_0.sectionProxy_.needHeroPower))

	if arg_27_0.sectionProxy_.needHeroPower then
		arg_27_0:RefreshPowerUI()
	end
end

function var_0_0.RefreshPowerUI(arg_28_0)
	arg_28_0.powerText_.text = arg_28_0:GetHeroPower()
end

function var_0_0.RefreshRace(arg_29_0)
	arg_29_0.raceIcon_.sprite = HeroTools.GetHeroRaceIcon(arg_29_0.heroID_)
end

function var_0_0.RefreshPost(arg_30_0)
	arg_30_0.postController_:SetSelectedState(tostring(arg_30_0.isCaptain_))
end

function var_0_0.RefreshAttackType(arg_31_0)
	local var_31_0 = HeroTools.GetHeroSkillAttributeIcon(arg_31_0.heroID_)

	if var_31_0 then
		SetActive(arg_31_0.attackTypeIcon_.gameObject, true)

		arg_31_0.attackTypeIcon_.sprite = var_31_0
	else
		SetActive(arg_31_0.attackTypeIcon_.gameObject, false)
	end
end

function var_0_0.RefreshCustomUI(arg_32_0)
	return
end

function var_0_0.RefreshHP(arg_33_0)
	arg_33_0.hpController_:SetSelectedState(tostring(arg_33_0.sectionProxy_.needHeroHP))

	if arg_33_0.sectionProxy_.needHeroHP then
		arg_33_0:RefreshHPUI()
	end
end

function var_0_0.RefreshHPUI(arg_34_0)
	local var_34_0, var_34_1 = arg_34_0:GetHeroHP()

	arg_34_0.hpImg_.fillAmount = var_34_1 / 100
	arg_34_0.hpText_.text = var_34_1 .. "%"
end

function var_0_0.RefreshAssistant(arg_35_0)
	arg_35_0.assistantController_:SetSelectedState(tostring(arg_35_0.sectionProxy_.needHeroAssistant))

	if arg_35_0.sectionProxy_.needHeroAssistant then
		arg_35_0:RefreshAssistantUI()
	end
end

function var_0_0.RefreshAssistantUI(arg_36_0)
	local var_36_0 = arg_36_0.sectionProxy_.heroInfoList[arg_36_0.pos_].isAssistant

	arg_36_0.assistantController_:SetSelectedState(tostring(var_36_0))
end

function var_0_0.RefreshEnergy(arg_37_0)
	arg_37_0.energyController_:SetSelectedState(tostring(arg_37_0.sectionProxy_.needHeroEnergy))

	if arg_37_0.sectionProxy_.needHeroEnergy then
		arg_37_0:RefreshEnergyUI()
	end
end

function var_0_0.RefreshEnergyUI(arg_38_0)
	if arg_38_0.heroID_ ~= 0 then
		arg_38_0.energyController_:SetSelectedState("true")

		arg_38_0.energyText_.text = arg_38_0:GetHeroEnergy()

		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_0.energyBgTrans_)
	else
		arg_38_0.energyController_:SetSelectedState("false")
	end
end

function var_0_0.BindRedPoint(arg_39_0)
	arg_39_0.sectionProxy_:CustomHeroBindRedPoint(arg_39_0.pos_, arg_39_0)
end

function var_0_0.UnBindRedPoint(arg_40_0)
	arg_40_0.sectionProxy_:CustomHeroUnBindRedPoint(arg_40_0.pos_, arg_40_0)
end

function var_0_0.GetHeroPower(arg_41_0)
	return arg_41_0.sectionProxy_:CustomGetHeroPower(arg_41_0.pos_, arg_41_0.heroID_, arg_41_0.trialID_)
end

function var_0_0.GetHeroHP(arg_42_0)
	return arg_42_0.sectionProxy_:CustomGetHeroHP(arg_42_0.pos_, arg_42_0.heroID_, arg_42_0.trialID_)
end

function var_0_0.GetHeroEnergy(arg_43_0)
	return arg_43_0.sectionProxy_:CustomGetHeroEnergy(arg_43_0.pos_, arg_43_0.heroID_, arg_43_0.trialID_)
end

function var_0_0.Show(arg_44_0, arg_44_1)
	SetActive(arg_44_0.gameObject_, arg_44_1)
end

return var_0_0
