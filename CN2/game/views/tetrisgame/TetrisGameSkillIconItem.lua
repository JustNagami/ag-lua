local var_0_0 = class("TetrisGameSkillIconItem", ReduxView)

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
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn, nil, function()
		if arg_4_0.clickFunc then
			arg_4_0.clickFunc(arg_4_0.skillID)
		end
	end)
end

function var_0_0.RefreshUI(arg_6_0, arg_6_1)
	arg_6_0.skillID = arg_6_1
	arg_6_0.icon.sprite = TetrisGameTools:GetSkillIcon(arg_6_1)
end

function var_0_0.Dispose(arg_7_0)
	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.RegisterClickFunc(arg_8_0, arg_8_1)
	if arg_8_1 then
		arg_8_0.clickFunc = arg_8_1
	end
end

return var_0_0
