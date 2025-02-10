local var_0_0 = class("TetrisGameChooseStageView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGameORDChapterUI"
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

	local var_6_0 = arg_6_0.params_.stageID or arg_6_0.stageIDList[1]

	arg_6_0.params_.stageID = nil

	arg_6_0:ChooseStage(var_6_0)
end

function var_0_0.OnTop(arg_7_0)
	arg_7_0:RefreshStageState()
	arg_7_0:RefreshStageInfo()
	arg_7_0:RefreshBar()
end

function var_0_0.RefreshBar(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})

	local var_8_0 = GameSetting.tetris_game_describe1 and GameSetting.tetris_game_describe1.value or {}

	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_8_0
		})
	end)
end

function var_0_0.OnExit(arg_10_0)
	manager.windowBar:HideBar()
	arg_10_0.scrollMoveView_.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.BeginDrag)
	arg_10_0.scrollMoveView_.scrollViewEvent_:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.EndDrag)
	arg_10_0:RemoveAllEventListener()
	arg_10_0.scrollMoveView_:OnExit()
	arg_10_0:DisposeStageInfo()

	arg_10_0.selStageID = nil
	arg_10_0.stageID = nil
end

function var_0_0.AddUIListener(arg_11_0)
	arg_11_0:AddBtnListener(arg_11_0.skillBtn, nil, function()
		if #arg_11_0.skillList > 0 then
			JumpTools.OpenPageByJump("tetrisGameGetSkillView", {
				stageID = arg_11_0.stageID
			})
		end
	end)
end

function var_0_0.BeginDragFun(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.beginMousePos = Input.mousePosition
end

function var_0_0.EndDragFun(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = Input.mousePosition
	local var_14_1 = 0

	if arg_14_0.beginMousePos.x - var_14_0.x > 0 then
		var_14_1 = 1
	elseif arg_14_0.beginMousePos.x - var_14_0.x < 0 then
		var_14_1 = -1
	end

	local var_14_2

	for iter_14_0, iter_14_1 in pairs(arg_14_0.stageIDList) do
		if iter_14_1 == arg_14_0.selStageID then
			var_14_2 = iter_14_0 + var_14_1
		end
	end

	local var_14_3 = arg_14_0.stageIDList[var_14_2]

	if var_14_3 then
		arg_14_0:ChooseStage(var_14_3)
	end
end

function var_0_0.Dispose(arg_15_0)
	var_0_0.super.Dispose(arg_15_0)
	arg_15_0.scrollMoveView_:Dispose()

	arg_15_0.scrollMoveView_ = nil

	arg_15_0:DisposeStageInfo()
end

function var_0_0.RefreshStageState(arg_16_0)
	arg_16_0.chapterName.text = ActivityTetrisGameChapterCfg[arg_16_0.chapterID].name
end

function var_0_0.ChooseStage(arg_17_0, arg_17_1)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.ACTIVITY_TETIRS_GAME_STAGE, arg_17_1), 0)

	arg_17_0.stageID = arg_17_1

	if arg_17_1 == arg_17_0.selStageID then
		TetrisGameTools:EnterStage(arg_17_1)

		return
	end

	local var_17_0 = arg_17_0.selStageID

	arg_17_0.selStageID = arg_17_1

	if var_17_0 then
		arg_17_0.stageItemList[var_17_0]:PlayAni(false)
	end

	local var_17_1 = arg_17_0.stageItemList[arg_17_1]

	var_17_1:PlayAni(true)
	var_17_1:UpdataRedPoint()
	arg_17_0:ScrollList(arg_17_0.selStageID)

	arg_17_0.skillList = ActivityTetrisGameStageCfg[arg_17_1].skill_list

	if arg_17_0.skillList and #arg_17_0.skillList > 0 then
		arg_17_0.skillController:SetSelectedState("true")
	else
		arg_17_0.skillController:SetSelectedState("false")
	end

	if arg_17_0.chapterIndex == 1 then
		manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ui_a", "")
	else
		manager.audio:PlayEffect("minigame_activity_3_6", "minigame_activity_3_6_block_ui_b", "")
	end

	arg_17_0:RefreshStageInfo()
end

function var_0_0.InitStageInfo(arg_18_0)
	if not arg_18_0.stageItemList then
		arg_18_0.stageItemList = {}
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.stageIDList) do
		local var_18_0 = Object.Instantiate(arg_18_0.stageGo, arg_18_0.scrollMoveView_.content_.transform)
		local var_18_1 = TetrisGameChooseStageItem.New(var_18_0)

		var_18_1:RegisterClick(handler(arg_18_0, arg_18_0.ChooseStage))

		arg_18_0.stageItemList[iter_18_1] = var_18_1
	end

	LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_0.scrollMoveView_.content_.transform)
end

function var_0_0.RefreshStageInfo(arg_19_0)
	if arg_19_0.stageItemList then
		for iter_19_0, iter_19_1 in pairs(arg_19_0.stageItemList) do
			iter_19_1:RefreshUI(iter_19_0, arg_19_0.selStageID, arg_19_0.chapterIndex)
		end
	end
end

function var_0_0.DisposeStageInfo(arg_20_0)
	if arg_20_0.stageItemList then
		for iter_20_0, iter_20_1 in pairs(arg_20_0.stageItemList) do
			iter_20_1:Dispose()
		end

		arg_20_0.stageItemList = nil
	end
end

function var_0_0.ScrollList(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetScrollPos(arg_21_1)

	arg_21_0.scrollMoveView_.needInitScroll_ = false

	arg_21_0.scrollMoveView_:ScrollPosition(var_21_0, false, -200)
end

function var_0_0.GetScrollPos(arg_22_0, arg_22_1)
	return arg_22_0.stageItemList[arg_22_1].rectTransform.anchoredPosition.x
end

function var_0_0.IsOpenSectionInfo(arg_23_0)
	return true
end

return var_0_0
