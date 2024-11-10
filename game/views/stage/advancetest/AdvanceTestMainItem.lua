local var_0_0 = class("AdvanceTestMainItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.mainActivityID = AdvanceTestData:GetMainActivityID()
	arg_1_0.index_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()
	arg_1_0:InitUI()

	arg_1_0.selectController_ = ControllerUtil.GetController(arg_1_0.transform_, "status")
end

function var_0_0.InitUI(arg_2_0)
	local var_2_0

	if arg_2_0.index_ == 1 then
		var_2_0 = "SS"
	elseif arg_2_0.index_ == 2 then
		var_2_0 = "SSS"
	elseif arg_2_0.index_ == 3 then
		var_2_0 = "Ω"
	end

	arg_2_0.stageText_.text = string.format(GetTips("TEST_CHALLENGE_TIPS_6"), var_2_0)
end

function var_0_0.Dispose(arg_3_0)
	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.button_, nil, function()
		if arg_4_0.clickFunc_ then
			arg_4_0.clickFunc_(arg_4_0.index_)
		end
	end)
end

function var_0_0.RefreshUI(arg_6_0, arg_6_1)
	arg_6_0:SetSelectMode(arg_6_0.index_ == arg_6_1)

	local var_6_0 = AdvanceTestData:GetHistortyMaxScoreByIndex(arg_6_0.index_)

	if var_6_0 == -1 then
		arg_6_0.scoreText_.text = ""
	else
		arg_6_0.scoreText_.text = var_6_0
	end
end

function var_0_0.SetSelectMode(arg_7_0, arg_7_1)
	if arg_7_1 then
		arg_7_0.selectController_:SetSelectedState("selected")
	else
		arg_7_0.selectController_:SetSelectedState("normal")
	end
end

function var_0_0.RegistClickFunc(arg_8_0, arg_8_1)
	arg_8_0.clickFunc_ = arg_8_1
end

return var_0_0
