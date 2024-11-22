local var_0_0 = class("TransitionSkillView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:BuildContext()
	arg_2_0:AddUIListeners()
end

function var_0_0.BuildContext(arg_3_0)
	arg_3_0.context = {
		curTabIdx = 1,
		tabModule = TransitionSkillListTabModule.New(arg_3_0.tabModuleObj_)
	}
	arg_3_0.scrollHelper_ = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.uiListObj_, TransitionSkillItem)
end

function var_0_0.InitContext(arg_4_0)
	arg_4_0.data = {
		curGiftPt = 0,
		curSelectID = 0,
		index = 1,
		heroID = 0,
		leftPt = 0,
		type = HeroConst.HERO_DATA_TYPE.DEFAULT,
		heroDataProxy = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT),
		list = {},
		useList = {},
		curUseList = {}
	}
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
end

function var_0_0.IndexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.data.list[arg_6_1]
	local var_6_1 = arg_6_0.data.curUseList[var_6_0] or 1

	arg_6_2:RefreshUI(var_6_0, var_6_1)
	arg_6_2:SetUsed(arg_6_0:IsUsed(var_6_0))
	arg_6_2:SetSelect(arg_6_0.data.curSelectID == var_6_0)
	arg_6_2:RegistCallBack(function()
		arg_6_0:OnItemClick(var_6_0)
	end)
end

function var_0_0.AddUIListeners(arg_8_0)
	arg_8_0.context.tabModule:RegisterClickCallback(handler(arg_8_0, arg_8_0.OnTabClick))

	arg_8_0.tryToImproveTransitionGiftPtHandler_ = handler(arg_8_0, arg_8_0.OnTryToImproveTransitionGiftPt)

	manager.notify:RegistListener(IMPROVE_TRANSITION_GIFT_PT, arg_8_0.tryToImproveTransitionGiftPtHandler_)
end

function var_0_0.RenderView(arg_9_0, arg_9_1)
	arg_9_0:InitContext()

	arg_9_0.data.index = arg_9_1.index or 1
	arg_9_0.data.heroID = arg_9_1.heroID
	arg_9_0.data.type = arg_9_1.type or HeroConst.HERO_DATA_TYPE.DEFAULT
	arg_9_0.data.heroDataProxy = HeroViewDataProxy.New(arg_9_0.data.type)

	arg_9_0.context.tabModule:OnTabClick(arg_9_0.data.index)
end

function var_0_0.GetData(arg_10_0)
	arg_10_0:GetUseList()
	arg_10_0:GetCurUseList()
end

function var_0_0.GetUseList(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = arg_11_0:GetHeroTransition()

	arg_11_0.data.curGiftPt = 0

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		local var_11_2 = iter_11_1.slot_id

		var_11_0[var_11_2] = deepClone(iter_11_1.skill_list)

		if var_11_2 == arg_11_0.data.index then
			arg_11_0.data.curGiftPt = iter_11_1.talent_points

			break
		end
	end

	arg_11_0.data.useList = var_11_0
end

function var_0_0.GetCurUseList(arg_12_0)
	local var_12_0 = {
		all = {}
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.data.useList[arg_12_0.data.index] or {}) do
		local var_12_1 = iter_12_1.skill_id

		var_12_0[var_12_1] = iter_12_1.skill_level

		table.insert(var_12_0.all, var_12_1)
	end

	arg_12_0.data.curUseList = var_12_0
end

function var_0_0.RefreshUI(arg_13_0)
	arg_13_0:RefreshList()
	arg_13_0:RefreshType()
end

function var_0_0.RefreshList(arg_14_0)
	local var_14_0 = HeroCfg[arg_14_0.data.heroID].hero_equip_skill[arg_14_0.data.index] or {}

	table.sort(var_14_0, function(arg_15_0, arg_15_1)
		if arg_14_0:IsUsed(arg_15_0) ~= arg_14_0:IsUsed(arg_15_1) then
			return arg_14_0:IsUsed(arg_15_0)
		end

		if arg_14_0:IsUsed(arg_15_0) and arg_14_0:IsUsed(arg_15_1) then
			local var_15_0 = arg_14_0.data.curUseList[arg_15_0]
			local var_15_1 = arg_14_0.data.curUseList[arg_15_1]

			if var_15_0 ~= var_15_1 then
				return var_15_1 < var_15_0
			end
		end

		return arg_15_0 < arg_15_1
	end)

	arg_14_0.data.list = var_14_0
	arg_14_0.data.curSelectID = arg_14_0.data.list[1]

	arg_14_0.scrollHelper_:StartScroll(#arg_14_0.data.list)
	arg_14_0:OnItemClick(arg_14_0.data.curSelectID)
end

function var_0_0.RefreshType(arg_16_0)
	arg_16_0.data.leftPt = arg_16_0.data.curGiftPt

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.data.curUseList.all) do
		arg_16_0.data.leftPt = arg_16_0.data.leftPt - arg_16_0.data.curUseList[iter_16_1]
	end

	local var_16_0 = #arg_16_0.data.curUseList.all

	arg_16_0.restrictTxt_.text = table.concat({
		GetTips("JUMP_EQUIP_UPPER_DESC"),
		var_16_0,
		"/",
		GameSetting.exclusive_skill_use_num_max.value[1]
	})

	arg_16_0:DispatchJumpElementChangeEmitter()
end

function var_0_0.IsUsed(arg_17_0, arg_17_1)
	return arg_17_0.data.curUseList[arg_17_1] ~= nil
end

function var_0_0.IsSelected(arg_18_0, arg_18_1)
	return arg_18_1 == arg_18_0.data.curSelectID
end

function var_0_0.SaveDataCheckNet(arg_19_0, arg_19_1)
	if manager.net ~= nil and manager.net.tcpConnection_ ~= nil then
		local var_19_0 = manager.net.tcpConnection_:GetMachineState()

		if var_19_0 and (var_19_0 == "connected" or var_19_0 == "connecting") then
			arg_19_0:SaveData(arg_19_1)
		end
	end
end

function var_0_0.SaveData(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if not arg_20_0.data.curUseList or not arg_20_0.data.curUseList.all then
		return
	end

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.data.curUseList.all) do
		var_20_0[iter_20_0] = {
			skill_id = iter_20_1,
			skill_level = arg_20_0.data.curUseList[iter_20_1]
		}
	end

	HeroAction.TryToSaveTransitionSkill(arg_20_0.data.heroID, arg_20_0.data.index, var_20_0, arg_20_1)
end

function var_0_0.OnTryToImproveTransitionGiftPt(arg_21_0)
	ShowTips("EXCLUSIVE_SKILL_POINT_UP")
	arg_21_0:GetUseList()
	arg_21_0.scrollHelper_:Refresh()
	arg_21_0:RefreshType()
end

function var_0_0.OnExit(arg_22_0)
	return
end

function var_0_0.Dispose(arg_23_0)
	manager.notify:RemoveListener(IMPROVE_TRANSITION_GIFT_PT, arg_23_0.tryToImproveTransitionGiftPtHandler_)
	arg_23_0:RemoveAllEventListener()
	arg_23_0:RemoveAllListeners()

	if arg_23_0.scrollHelper_ then
		arg_23_0.scrollHelper_:Dispose()

		arg_23_0.scrollHelper_ = nil
	end

	arg_23_0.context.tabModule:Dispose()

	arg_23_0.context.tabModule = nil

	var_0_0.super.Dispose(arg_23_0)
end

function var_0_0.RegisterTabListener(arg_24_0, arg_24_1)
	arg_24_0.context.tabSwitchEmitter = arg_24_1
end

function var_0_0.RegisterItemClickListener(arg_25_0, arg_25_1)
	arg_25_0.context.itemClickEmitter = arg_25_1
end

function var_0_0.RegisterRefreshJumpElement(arg_26_0, arg_26_1)
	arg_26_0.context.jumpElementChangeEmitter = arg_26_1
end

function var_0_0.RegisterRefreshJumpSlotView(arg_27_0, arg_27_1)
	arg_27_0.context.jumpSlotRefreshEmitter = arg_27_1
end

function var_0_0.OnTabClick(arg_28_0, arg_28_1)
	arg_28_0:SaveData()

	arg_28_0.data.index = arg_28_1

	arg_28_0:GetData()
	arg_28_0:RefreshUI()
	arg_28_0:DispatchTabSwitchEmitter(arg_28_1)
end

function var_0_0.OnItemClick(arg_29_0, arg_29_1)
	arg_29_0.data.curSelectID = arg_29_1

	arg_29_0.scrollHelper_:Refresh()
	arg_29_0:DispatchItemClickEmitter(arg_29_1)
end

function var_0_0.DispatchTabSwitchEmitter(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.context.tabSwitchEmitter

	if var_30_0 then
		var_30_0(arg_30_1)
	end
end

function var_0_0.DispatchItemClickEmitter(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.context.itemClickEmitter

	if var_31_0 then
		var_31_0({
			skillID = arg_31_1,
			level = arg_31_0.data.curUseList[arg_31_1] or 1,
			equipped = arg_31_0:IsUsed(arg_31_1)
		})
	end
end

function var_0_0.DispatchJumpElementChangeEmitter(arg_32_0)
	local var_32_0 = arg_32_0.context.jumpElementChangeEmitter

	if var_32_0 then
		var_32_0({
			totalElement = arg_32_0.data.curGiftPt,
			leftElement = arg_32_0.data.leftPt
		})
	end
end

function var_0_0.DispatchJumpSlotRefreshEmitter(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.context.jumpSlotRefreshEmitter

	if var_33_0 then
		var_33_0(arg_33_0:GetSlotParam(arg_33_1))
	end
end

function var_0_0.OnSkillEquip(arg_34_0)
	if #arg_34_0.data.curUseList.all >= GameSetting.exclusive_skill_use_num_max.value[1] then
		ShowTips("EXCLUSIVE_SKILL_MAX")

		return
	end

	if arg_34_0.data.leftPt <= 0 then
		JumpTools.OpenPageByJump("transitionGiftPt", {
			isEnter = true,
			giftPt = arg_34_0.data.curGiftPt,
			heroID = arg_34_0.data.heroID,
			index = arg_34_0.data.index
		})
		arg_34_0:SaveData()

		return
	end

	arg_34_0.data.curUseList[arg_34_0.data.curSelectID] = 1

	table.insert(arg_34_0.data.curUseList.all, arg_34_0.data.curSelectID)
	arg_34_0.scrollHelper_:Refresh()
	arg_34_0:RefreshType()
	arg_34_0:DispatchItemClickEmitter(arg_34_0.data.curSelectID)
	arg_34_0:DispatchJumpSlotRefreshEmitter(arg_34_0.data.index)
	ShowTips("EXCLUSIVE_SKILL_LOAD")
	OperationRecorder.RecordButtonTouch({
		button_name = "exclusive_skill_use",
		hero_id = arg_34_0.data.heroID,
		pos = arg_34_0.data.index,
		exclusive_skill_list = string.format("{%s,%s}", arg_34_0.data.curSelectID, arg_34_0.data.curUseList[arg_34_0.data.curSelectID] or 1)
	})
end

function var_0_0.OnSkillExchange(arg_35_0)
	local var_35_0 = arg_35_0.data.curUseList
	local var_35_1 = arg_35_0.data.curSelectID

	OperationRecorder.RecordButtonTouch({
		button_name = "exclusive_skill_unload",
		hero_id = arg_35_0.data.heroID,
		pos = arg_35_0.data.index,
		exclusive_skill_list = string.format("{%s,%s}", var_35_1, var_35_0[var_35_1] or 1)
	})
	table.remove(var_35_0.all, table.indexof(var_35_0.all, var_35_1))

	var_35_0[var_35_1] = nil

	arg_35_0.scrollHelper_:Refresh()
	arg_35_0:RefreshType()
	arg_35_0:DispatchItemClickEmitter(arg_35_0.data.curSelectID)
	arg_35_0:DispatchJumpSlotRefreshEmitter(arg_35_0.data.index)
	ShowTips("EXCLUSIVE_SKILL_UNLOAD")
end

function var_0_0.OnSkillLevelUp(arg_36_0)
	if arg_36_0.data.leftPt <= 0 then
		JumpTools.OpenPageByJump("transitionGiftPt", {
			isEnter = true,
			giftPt = arg_36_0.data.curGiftPt,
			heroID = arg_36_0.data.heroID,
			index = arg_36_0.data.index
		})
		arg_36_0:SaveData()

		return
	end

	local var_36_0 = arg_36_0.data.curUseList
	local var_36_1 = arg_36_0.data.curSelectID

	var_36_0[var_36_1] = var_36_0[var_36_1] + 1

	arg_36_0.scrollHelper_:Refresh()
	arg_36_0:RefreshType()
	arg_36_0:DispatchItemClickEmitter(arg_36_0.data.curSelectID)
	arg_36_0:DispatchJumpSlotRefreshEmitter(arg_36_0.data.index)
	ShowTips("EXCLUSIVE_SKILL_LEVEL_UP")
	OperationRecorder.RecordButtonTouch({
		button_name = "exclusive_skill_lv_up",
		hero_id = arg_36_0.data.heroID,
		pos = arg_36_0.data.index,
		exclusive_skill_list = string.format("{%s,%s}", var_36_1, var_36_0[var_36_1] or 1)
	})
end

function var_0_0.ResetUseList(arg_37_0)
	arg_37_0.data.curUseList = {}
	arg_37_0.data.curUseList.all = {}

	arg_37_0.scrollHelper_:Refresh()
	arg_37_0:RefreshType()
	arg_37_0:DispatchItemClickEmitter(arg_37_0.data.curSelectID)
end

function var_0_0.GetCurGiftPoint(arg_38_0)
	return arg_38_0.data.curGiftPt
end

function var_0_0.GetSlotParam(arg_39_0, arg_39_1)
	local var_39_0 = {
		slotIdx = arg_39_1,
		heroId = arg_39_0.data.heroID,
		skills = {}
	}

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.data.curUseList.all) do
		var_39_0.skills[iter_39_0] = {
			skillId = iter_39_1,
			level = arg_39_0.data.curUseList[iter_39_1]
		}
	end

	return var_39_0
end

function var_0_0.GetHeroData(arg_40_0)
	return arg_40_0.data.heroDataProxy:GetHeroData(arg_40_0.data.heroID)
end

function var_0_0.GetHeroTransition(arg_41_0)
	return arg_41_0.data.heroDataProxy:GetHeroTransitionInfoList(arg_41_0.data.heroID) or {}
end

function var_0_0.GetHeroEquip(arg_42_0)
	return arg_42_0.heroDataProxy:GetEquipInfoList(arg_42_0.data.heroID)
end

return var_0_0
