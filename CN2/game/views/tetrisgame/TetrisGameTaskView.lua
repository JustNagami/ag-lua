﻿local var_0_0 = class("TetrisGameTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGameRewardPopup"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.taskList_ = {}
	arg_4_0.taskListModule = CommonTaskListModule.New(arg_4_0.comTaskList_)
	arg_4_0.awardController = arg_4_0.controller:GetController("oneClick")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgmaskBtn_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.allBtn, nil, function()
		TaskTools:GetAllCanReciveTaskByActivityID(arg_5_0.params_.activityID)
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.taskListModule:OnEnter()

	local var_8_0 = arg_8_0.params_.activityID

	if var_8_0 then
		arg_8_0.taskListModule:RenderActivityTaskList(var_8_0)
	end
end

function var_0_0.OnTop(arg_9_0)
	arg_9_0:RefreshReciveBtn()
end

function var_0_0.RefreshReciveBtn(arg_10_0)
	if #TaskTools:GetCanGetActivityTaskList(arg_10_0.params_.activityID) > 0 then
		arg_10_0.awardController:SetSelectedState("on")
	else
		arg_10_0.awardController:SetSelectedState("off")
	end
end

function var_0_0.OnExit(arg_11_0)
	arg_11_0.taskListModule:OnExit()
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0.taskListModule:Dispose()
	arg_12_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
