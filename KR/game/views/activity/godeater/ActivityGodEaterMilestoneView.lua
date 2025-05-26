CommonTaskPopView = import("game.views.task.pop.CommonTaskPopView")

local var_0_0 = class("ActivityGodEaterMilestoneView", CommonTaskPopView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Bounty/V4_2_GodEaterUI_Bounty_QuestPopUI"
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)

	arg_2_0.btnControlller = arg_2_0.v4_2_godeaterui_bounty_questpopuiControllerexcollection_:GetController("onekey")
end

function var_0_0.OnEnter(arg_3_0)
	var_0_0.super.OnEnter(arg_3_0)
	arg_3_0:UpdateOnekey()
end

function var_0_0.UpdateOnekey(arg_4_0)
	local var_4_0 = TaskData2:GetActivityTaskSortList(arg_4_0.data.activityId)

	arg_4_0.oneKeyList = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_1 = AssignmentCfg[iter_4_1.id]

		if iter_4_1.progress >= var_4_1.need and iter_4_1.complete_flag == 0 then
			table.insert(arg_4_0.oneKeyList, iter_4_1.id)
		end
	end

	arg_4_0.btnControlller:SetSelectedState(#arg_4_0.oneKeyList > 0 and "on" or "off")
end

function var_0_0.OnExit(arg_5_0)
	var_0_0.super.OnExit(arg_5_0)
end

function var_0_0.AddUIListener(arg_6_0)
	var_0_0.super.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btn01Btn_, nil, function()
		TaskAction.SubmitTaskList(arg_6_0.oneKeyList)
	end)
	arg_6_0:AddBtnListener(arg_6_0.btn_backBtn_, nil, function()
		arg_6_0:Back()
	end)
end

function var_0_0.Dispose(arg_9_0)
	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
