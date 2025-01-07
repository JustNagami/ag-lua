local var_0_0 = class("AdvanceMonsterTestMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/BossTestUI/BossTestMainUI"
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

	arg_4_0.stageList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, AdvanceMonsterTestMainViewItem)
	arg_4_0.btnController_ = arg_4_0.btnControllerEx_:GetController("btnStatus")
	arg_4_0.curType_ = 1
	arg_4_0.lastType_ = nil
	arg_4_0.lastScrollPos_ = nil
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2:SetData(arg_5_0.stageIDList_[arg_5_1])
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.curBtn_, nil, function()
		if arg_6_0.curType_ == 1 then
			return
		else
			arg_6_0.curType_ = 1

			arg_6_0:RefreshUI()
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.beforeBtn_, nil, function()
		if arg_6_0.curType_ == 0 then
			return
		else
			arg_6_0.curType_ = 0

			arg_6_0:RefreshUI()
		end
	end)
end

function var_0_0.OnEnter(arg_9_0)
	local var_9_0 = AdvanceMonsterTestData:GetCurStageID()

	if var_9_0 > 0 then
		arg_9_0.curType_ = ActivityAdvanceMonsterTestCfg[var_9_0].type
	end

	arg_9_0:RefreshUI()

	if arg_9_0.curType_ == arg_9_0.lastType_ then
		arg_9_0.stageList_:SetScrolledPosition(arg_9_0.lastScrollPos_)
	else
		arg_9_0.lastType_ = nil
		arg_9_0.lastScrollPos_ = nil
	end

	if getData("monsterTest", "monsterTest") ~= "1" and #arg_9_0.page > 0 then
		saveData("monsterTest", "monsterTest", "1")
		TimeTools.StartAfterSeconds(0.1, function()
			JumpTools.OpenPageByJump("gameHelpPro", {
				isPrefab = true,
				pages = arg_9_0.page
			})
		end, {})
	end
end

function var_0_0.RefreshUI(arg_11_0)
	if arg_11_0.curType_ == 1 then
		arg_11_0.btnController_:SetSelectedState("cur")
	elseif arg_11_0.curType_ == 0 then
		arg_11_0.btnController_:SetSelectedState("history")
	end

	arg_11_0.stageIDList_ = ActivityAdvanceMonsterTestCfg.get_id_list_by_type[arg_11_0.curType_]

	if arg_11_0.stageIDList_ then
		arg_11_0.stageList_:StartScroll(#arg_11_0.stageIDList_)
	else
		arg_11_0.stageList_:StartScroll(0)
	end

	arg_11_0.page = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.stageIDList_) do
		local var_11_0 = ActivityAdvanceMonsterTestCfg[iter_11_1]

		if var_11_0.level_describe ~= "" then
			table.insert(arg_11_0.page, var_11_0.level_describe[1])
		end
	end

	arg_11_0:OnTop()
end

function var_0_0.OnTop(arg_12_0)
	if #arg_12_0.page > 0 then
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

	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = arg_12_0.page
		})
	end)
end

function var_0_0.OnExit(arg_14_0)
	manager.windowBar:HideBar()

	arg_14_0.lastType_ = arg_14_0.curType_
	arg_14_0.lastScrollPos_ = arg_14_0.stageList_:GetScrolledPosition()
end

function var_0_0.Dispose(arg_15_0)
	var_0_0.super.Dispose(arg_15_0)

	if arg_15_0.stageList_ then
		arg_15_0.stageList_:Dispose()

		arg_15_0.stageList_ = nil
	end
end

return var_0_0
