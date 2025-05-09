local var_0_0 = class("TetrisGameChooseStageView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/Alone_TetrisGameUI/TetrisGameORDChapterUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.scrollMoveView_ = ScrollMoveView.New(arg_5_0, arg_5_0.scrollViewGo_)
	arg_5_0.skillController = arg_5_0.controller:GetController("skill")
	arg_5_0.stageItemList = {}
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.scrollMoveView_.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.BeginDrag, LuaHelper.EventTriggerAction1(handler(arg_6_0, arg_6_0.BeginDragFun)))
	arg_6_0.scrollMoveView_.scrollViewEvent_:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.EndDrag, LuaHelper.EventTriggerAction1(handler(arg_6_0, arg_6_0.EndDragFun)))

	arg_6_0.activityID = TetrisGameData:GetCurActivityID()
	arg_6_0.chapterID = arg_6_0.params_.chapterID or arg_6_0.chapterID
	arg_6_0.chapterIndex = table.keyof(ActivityTetrisGameChapterCfg.get_id_list_by_type[TetrisGameConst.stageType.normal], arg_6_0.chapterID)
	arg_6_0.stageIDList = ActivityTetrisGameChapterCfg[arg_6_0.chapterID].tetris_stage_list

	arg_6_0:InitStageInfo()

	local var_6_0 = arg_6_0.params_.stageID or arg_6_0:GetTargetSelectStageID()

	arg_6_0.params_.stageID = nil

	arg_6_0:ChooseStage(var_6_0)
end

function var_0_0.GetTargetSelectStageID(arg_7_0)
	local var_7_0 = 0

	for iter_7_0 = 1, #arg_7_0.stageIDList do
		local var_7_1 = arg_7_0.stageIDList[iter_7_0]
		local var_7_2 = TetrisGameData:GetStageInfoByStageID(var_7_1)

		if var_7_2 and var_7_2.isClear then
			var_7_0 = iter_7_0
		end
	end

	if var_7_0 + 1 <= #arg_7_0.stageIDList then
		var_7_0 = var_7_0 + 1
	end

	return arg_7_0.stageIDList[var_7_0]
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0:RefreshStageState()
	arg_8_0:RefreshStageInfo()
	arg_8_0:RefreshBar()
end

function var_0_0.RefreshBar(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})

	local var_9_0 = GameSetting.tetris_game_describe1 and GameSetting.tetris_game_describe1.value or {}

	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_9_0
		})
	end)
end

function var_0_0.OnExit(arg_11_0)
	manager.windowBar:HideBar()
	arg_11_0.scrollMoveView_.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_11_0.scrollMoveView_.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_11_0:RemoveAllEventListener()
	arg_11_0.scrollMoveView_:OnExit()
	arg_11_0:DisposeStageInfo()

	arg_11_0.selStageID = nil
	arg_11_0.stageID = nil
end

function var_0_0.AddUIListener(arg_12_0)
	arg_12_0:AddBtnListener(arg_12_0.skillBtn, nil, function()
		if #arg_12_0.skillList > 0 then
			JumpTools.OpenPageByJump("tetrisGameGetSkillView", {
				stageID = arg_12_0.stageID
			})
		end
	end)
end

function var_0_0.BeginDragFun(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.beginMousePos = Input.mousePosition
end

function var_0_0.EndDragFun(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = Input.mousePosition
	local var_15_1 = 0

	if arg_15_0.beginMousePos.x - var_15_0.x > 0 then
		var_15_1 = 1
	elseif arg_15_0.beginMousePos.x - var_15_0.x < 0 then
		var_15_1 = -1
	end

	local var_15_2

	for iter_15_0, iter_15_1 in pairs(arg_15_0.stageIDList) do
		if iter_15_1 == arg_15_0.selStageID then
			var_15_2 = iter_15_0 + var_15_1
		end
	end

	local var_15_3 = arg_15_0.stageIDList[var_15_2]

	if var_15_3 then
		arg_15_0:ChooseStage(var_15_3)
	end
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)
	arg_16_0.scrollMoveView_:Dispose()

	arg_16_0.scrollMoveView_ = nil

	arg_16_0:DisposeStageInfo()
end

function var_0_0.RefreshStageState(arg_17_0)
	arg_17_0.chapterName.text = ActivityTetrisGameChapterCfg[arg_17_0.chapterID].name
end

function var_0_0.ChooseStage(arg_18_0, arg_18_1)
	if TetrisGameTools.GetChapterState(arg_18_1) ~= "lock" then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ACTIVITY_TETIRS_GAME_STAGE, arg_18_1), 0)
	end

	arg_18_0.stageID = arg_18_1

	if arg_18_1 == arg_18_0.selStageID then
		TetrisGameTools:EnterStage(arg_18_1)

		return
	end

	local var_18_0 = arg_18_0.selStageID

	arg_18_0.selStageID = arg_18_1

	if var_18_0 then
		arg_18_0.stageItemList[var_18_0]:PlayAni(false)
	end

	local var_18_1 = arg_18_0.stageItemList[arg_18_1]

	var_18_1:PlayAni(true)
	var_18_1:UpdataRedPoint()
	arg_18_0:ScrollList(arg_18_0.selStageID)

	arg_18_0.skillList = ActivityTetrisGameStageCfg[arg_18_1].skill_list

	arg_18_0.skillController:SetSelectedState("false")

	if arg_18_0.chapterIndex == 1 then
		manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ui_a", "")
	else
		manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ui_b", "")
	end

	arg_18_0:RefreshStageInfo()
end

function var_0_0.InitStageInfo(arg_19_0)
	if not arg_19_0.stageItemList then
		arg_19_0.stageItemList = {}
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.stageIDList) do
		local var_19_0 = Object.Instantiate(arg_19_0.stageGo, arg_19_0.scrollMoveView_.content_.transform)
		local var_19_1 = TetrisGameChooseStageItem.New(var_19_0)

		var_19_1:RegisterClick(handler(arg_19_0, arg_19_0.ChooseStage))

		arg_19_0.stageItemList[iter_19_1] = var_19_1
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_0.scrollMoveView_.content_.transform)
end

function var_0_0.RefreshStageInfo(arg_20_0)
	if arg_20_0.stageItemList then
		for iter_20_0, iter_20_1 in pairs(arg_20_0.stageItemList) do
			iter_20_1:RefreshUI(iter_20_0, arg_20_0.selStageID, arg_20_0.chapterIndex)
		end
	end
end

function var_0_0.DisposeStageInfo(arg_21_0)
	if arg_21_0.stageItemList then
		for iter_21_0, iter_21_1 in pairs(arg_21_0.stageItemList) do
			iter_21_1:Dispose()
		end

		arg_21_0.stageItemList = nil
	end
end

function var_0_0.ScrollList(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0:GetScrollPos(arg_22_1)

	arg_22_0.scrollMoveView_.needInitScroll_ = false

	arg_22_0.scrollMoveView_:ScrollPosition(var_22_0, false, -200)
end

function var_0_0.GetScrollPos(arg_23_0, arg_23_1)
	return arg_23_0.stageItemList[arg_23_1].rectTransform.anchoredPosition.x
end

function var_0_0.IsOpenSectionInfo(arg_24_0)
	return true
end

return var_0_0
