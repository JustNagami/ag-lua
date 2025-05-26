local var_0_0 = class("AdvanceMonsterAffixView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/BossTestUI/BossTestAffixUI"
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

	arg_4_0.customScrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.CustomIndexItem), arg_4_0.customListGo_, CustomBox)
	arg_4_0.customDesScrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.CustomDesIndexItem), arg_4_0.customDesListGo_, CustomDesItem)
end

function var_0_0.CustomIndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.customTable_.all[arg_5_1]
	local var_5_1 = arg_5_0:GetSelectCustom(var_5_0)

	arg_5_2:RefreshUI(var_5_0, arg_5_0.customTable_[var_5_0], var_5_1)
	arg_5_2:RegisterClickListener(function(arg_6_0)
		local var_6_0 = ActivityAffixPoolCfg[arg_6_0].affix[1]

		if arg_5_0:GetSelectCustom(var_6_0) ~= arg_6_0 then
			arg_5_0:SetSelectCustom(var_6_0, arg_6_0)
		else
			arg_5_0:SetSelectCustom(var_6_0)
		end

		arg_5_2:RefreshUI(var_6_0, arg_5_0.customTable_[var_6_0], arg_5_0:GetSelectCustom(var_6_0))
		arg_5_0:CalculatePoint()
		arg_5_0:RefreshDesList(false, arg_6_0)
	end)
end

function var_0_0.CustomDesIndexItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = #arg_7_0.defaultStageList_

	if arg_7_1 <= var_7_0 then
		arg_7_2:RefreshUI(arg_7_0.defaultStageList_[arg_7_1], true)
	else
		local var_7_1 = arg_7_0.customSelectList_[arg_7_1 - var_7_0]
		local var_7_2 = ActivityAffixPoolCfg[var_7_1].affix

		arg_7_2:RefreshUI(var_7_2, false)
	end
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.startBtn_, nil, function()
		if not ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_ADVANCE_MONSTER_TEST) then
			ShowTips("TIME_OVER")

			return
		end

		AdvanceMonsterTestAction:SaveCustomList(arg_8_0.stageID_, arg_8_0.customSelectList_)
		AdvanceMonsterTestData:SetCurStageID(arg_8_0.stageID_)
		arg_8_0:Go("/sectionSelectHero", {
			section = ActivityAdvanceMonsterTestCfg[arg_8_0.stageID_].stage_id,
			sectionType = BattleConst.STAGE_TYPE_NEW.ADVANCE_MONSTER_TEST,
			activityID = ActivityConst.ACTIVITY_ADVANCE_MONSTER_TEST
		})
	end)
end

function var_0_0.OnEnter(arg_10_0)
	arg_10_0.stageID_ = arg_10_0.params_.stageID
	arg_10_0.customSelectList_ = AdvanceMonsterTestData:GetCustomList(arg_10_0.stageID_)

	local var_10_0 = ActivityAdvanceMonsterTestCfg[arg_10_0.stageID_]
	local var_10_1 = BattleActivityAdvanceMonsterTestCfg[var_10_0.stage_id]

	arg_10_0.defaultStageList_ = var_10_1.affix_type == "" and {} or var_10_1.affix_type

	arg_10_0:CreatCustomTable()
	arg_10_0:CreatCustomSelectTable()
	arg_10_0:RefreshUI()

	arg_10_0.pages = {}

	if ActivityAdvanceMonsterTestCfg[arg_10_0.stageID_].level_describe ~= "" then
		arg_10_0.pages = ActivityAdvanceMonsterTestCfg[arg_10_0.stageID_].level_describe
	end

	local var_10_2 = AdvanceMonsterTestData:GetCurStageID()
	local var_10_3 = 1

	if var_10_2 > 0 then
		var_10_3 = ActivityAdvanceMonsterTestCfg[var_10_2].type
	end

	if getData("monsterTest", "monsterTestStage_" .. arg_10_0.stageID_) ~= "1" and #arg_10_0.pages > 0 and var_10_3 == var_10_0.type then
		saveData("monsterTest", "monsterTestStage_" .. arg_10_0.stageID_, "1")
		TimeTools.StartAfterSeconds(0.1, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				isPrefab = true,
				pages = arg_10_0.pages
			})
		end, {})
	end
end

function var_0_0.CreatCustomTable(arg_12_0)
	local var_12_0 = ActivityAdvanceMonsterTestCfg[arg_12_0.stageID_].pool

	arg_12_0.customTable_ = {
		all = {}
	}

	local var_12_1

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_2 = ActivityAffixPoolCfg[iter_12_1]

		if var_12_2 then
			if not arg_12_0.customTable_[var_12_2.affix[1]] then
				arg_12_0.customTable_[var_12_2.affix[1]] = {}

				table.insert(arg_12_0.customTable_.all, var_12_2.affix[1])
			end

			table.insert(arg_12_0.customTable_[var_12_2.affix[1]], iter_12_1)
		end
	end
end

function var_0_0.CreatCustomSelectTable(arg_13_0)
	local var_13_0

	arg_13_0.customSelectTable_ = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.customSelectList_) do
		local var_13_1 = ActivityAffixPoolCfg[iter_13_1]

		arg_13_0.customSelectTable_[var_13_1.affix[1]] = iter_13_1
	end
end

function var_0_0.GetSelectCustom(arg_14_0, arg_14_1)
	if arg_14_0.customSelectTable_[arg_14_1] then
		return arg_14_0.customSelectTable_[arg_14_1]
	end

	return nil
end

function var_0_0.SetSelectCustom(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.customSelectTable_[arg_15_1]

	if var_15_0 then
		table.remove(arg_15_0.customSelectList_, table.indexof(arg_15_0.customSelectList_, var_15_0))
	end

	if arg_15_2 then
		arg_15_0.customSelectTable_[arg_15_1] = arg_15_2

		table.insert(arg_15_0.customSelectList_, arg_15_2)
	else
		arg_15_0.customSelectTable_[arg_15_1] = nil
	end
end

function var_0_0.RefreshUI(arg_16_0)
	arg_16_0:CalculatePoint()
	arg_16_0:RefreshDesList(true)
	arg_16_0.customScrollHelper_:StartScroll(#arg_16_0.customTable_.all)
end

function var_0_0.CalculatePoint(arg_17_0)
	local var_17_0
	local var_17_1 = ActivityAdvanceMonsterTestCfg[arg_17_0.stageID_].base_point

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.customSelectList_) do
		var_17_1 = var_17_1 + ActivityAffixPoolCfg[iter_17_1].point
	end

	arg_17_0.pointText_.text = string.format("<color=#FE972E>%d</color>", var_17_1)
end

function var_0_0.RefreshDesList(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_1 then
		arg_18_0.customDesScrollHelper_:StartScroll(#arg_18_0.defaultStageList_ + #arg_18_0.customSelectList_)
	else
		local var_18_0 = table.indexof(arg_18_0.customSelectList_, arg_18_2)

		if var_18_0 then
			arg_18_0.customDesScrollHelper_:StartScroll(#arg_18_0.defaultStageList_ + #arg_18_0.customSelectList_, #arg_18_0.defaultStageList_ + var_18_0)
		else
			arg_18_0.customDesScrollHelper_:StartScrollByPosition(#arg_18_0.defaultStageList_ + #arg_18_0.customSelectList_, arg_18_0.customDesScrollHelper_:GetScrolledPosition())
		end
	end
end

function var_0_0.OnTop(arg_19_0)
	if #arg_19_0.pages > 0 then
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			INFO_BAR
		})
	else
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR
		})
	end

	manager.windowBar:RegistHomeCallBack(function()
		AdvanceMonsterTestAction:SaveCustomList(arg_19_0.stageID_, arg_19_0.customSelectList_)
		arg_19_0:Go("/home", nil, nil, true)
	end)
	manager.windowBar:RegistBackCallBack(function()
		AdvanceMonsterTestAction:SaveCustomList(arg_19_0.stageID_, arg_19_0.customSelectList_)
		arg_19_0:Back()
	end)
	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = arg_19_0.pages
		})
	end)
end

function var_0_0.OnExit(arg_23_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_24_0)
	var_0_0.super.Dispose(arg_24_0)

	if arg_24_0.customScrollHelper_ then
		arg_24_0.customScrollHelper_:Dispose()

		arg_24_0.customScrollHelper_ = nil
	end

	if arg_24_0.customDesScrollHelper_ then
		arg_24_0.customDesScrollHelper_:Dispose()

		arg_24_0.customDesScrollHelper_ = nil
	end
end

return var_0_0
