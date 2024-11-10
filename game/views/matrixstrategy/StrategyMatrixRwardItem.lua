local var_0_0 = class("StrategyMatrixRwardItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.list = LuaList.New(handler(arg_3_0, arg_3_0.IndexItem), arg_3_0.m_list, CommonItem)
	arg_3_0.buttonController = ControllerUtil.GetController(arg_3_0.m_btnController, "stateBtn")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.m_receiveBtn, nil, function()
		TaskAction:SubmitTask(arg_4_0.taskID_)
	end)
end

function var_0_0.SetData(arg_6_0, arg_6_1)
	arg_6_0.taskID_ = arg_6_1.id
	arg_6_0.taskProgress = arg_6_1.progress
	arg_6_0.taskComplete_ = arg_6_1.complete_flag >= 1

	arg_6_0:RefreshUI()
	arg_6_0:RefreshProgress()
end

function var_0_0.RefreshUI(arg_7_0)
	arg_7_0.rewards = AssignmentCfg[arg_7_0.taskID_].reward or {}

	arg_7_0.list:StartScroll(#arg_7_0.rewards)
end

function var_0_0.RefreshProgress(arg_8_0)
	local var_8_0 = AssignmentCfg[arg_8_0.taskID_]
	local var_8_1 = arg_8_0.taskProgress

	if arg_8_0.taskProgress > var_8_0.need then
		var_8_1 = var_8_0.need
	end

	local var_8_2 = AssignmentCfg[arg_8_0.taskID_]

	arg_8_0.m_pointLab.text = GetI18NText(var_8_2.desc) .. string.format("(%s/%s)", var_8_1, var_8_2.need)

	local var_8_3 = arg_8_0.taskProgress >= var_8_2.need

	if arg_8_0.taskComplete_ then
		arg_8_0.buttonController:SetSelectedIndex("2")
	elseif var_8_3 then
		arg_8_0.buttonController:SetSelectedIndex("0")
	else
		arg_8_0.buttonController:SetSelectedIndex("1")
	end
end

function var_0_0.IndexItem(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.rewards[arg_9_1]

	arg_9_2:RefreshData(formatReward(var_9_0))
	arg_9_2:RegistCallBack(function()
		ShowPopItem(POP_ITEM, var_9_0)
	end)
end

function var_0_0.Dispose(arg_11_0)
	if arg_11_0.list then
		arg_11_0.list:Dispose()

		arg_11_0.list = nil
	end

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
