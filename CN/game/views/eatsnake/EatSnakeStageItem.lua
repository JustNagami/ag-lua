local var_0_0 = class("EatSnakeStageItem", ReduxView)

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

	arg_3_0.greedController = arg_3_0.greedController_:GetController("status")
	arg_3_0.redController = arg_3_0.redController_:GetController("status")
	arg_3_0.blueController = arg_3_0.blueController_:GetController("status")
	arg_3_0.lockController = arg_3_0.controller_:GetController("lock")
	arg_3_0.selectController = arg_3_0.controller_:GetController("select")
	arg_3_0.redPointController = arg_3_0.controller_:GetController("red")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.button_, nil, function()
		if arg_4_0.isNextStage then
			manager.redPoint:setTip(RedPointConst.EAT_SNAKE_STAGE .. "_" .. arg_4_0.index, 0)
		end

		arg_4_0.callback(arg_4_0.index, arg_4_0)
	end)
end

function var_0_0.SetData(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5, arg_6_6)
	arg_6_0.index = arg_6_1
	arg_6_0.cfg = arg_6_5
	arg_6_0.parent = arg_6_4
	arg_6_0.stageTxt_.text = arg_6_1
	arg_6_0.callback = arg_6_6

	arg_6_0.selectController:SetSelectedState("off")
	arg_6_0:BindRedPoint()

	arg_6_0.isNextStage = arg_6_1 == arg_6_3 + 1

	if arg_6_0.isNextStage or arg_6_2 ~= nil then
		arg_6_0.lockController:SetSelectedState("unlock")
	else
		arg_6_0.lockController:SetSelectedState("lock")
	end

	if arg_6_2 == nil then
		arg_6_0.greedController:SetSelectedState("notpass")
		arg_6_0.redController:SetSelectedState("notpass")
		arg_6_0.blueController:SetSelectedState("notpass")
	elseif arg_6_2.target == 1 then
		arg_6_0.greedController:SetSelectedState("pass")
	elseif arg_6_2.target == 2 then
		arg_6_0.greedController:SetSelectedState("pass")
		arg_6_0.redController:SetSelectedState("pass")
	else
		arg_6_0.redController:SetSelectedState("pass")
		arg_6_0.greedController:SetSelectedState("pass")
		arg_6_0.blueController:SetSelectedState("pass")
	end
end

function var_0_0.Dispose(arg_7_0)
	var_0_0.super.Dispose(arg_7_0)
	arg_7_0:UnbindRedPoint()
end

function var_0_0.BindRedPoint(arg_8_0)
	manager.redPoint:bindUIandKey(arg_8_0.transform_, RedPointConst.EAT_SNAKE_STAGE .. "_" .. arg_8_0.index)
end

function var_0_0.UnbindRedPoint(arg_9_0)
	manager.redPoint:bindUIandKey(arg_9_0.transform_, RedPointConst.EAT_SNAKE_STAGE .. "_" .. arg_9_0.index)
end

return var_0_0
