local var_0_0 = class("DormSuitRelievePopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/Dorm/DormRedactPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
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
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.suitEid = arg_6_0.params_.suitEid
end

function var_0_0.OnExit(arg_7_0)
	arg_7_0.suitEid = nil
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.maskBtn, nil, function()
		JumpTools.Back()
	end)
	arg_8_0:AddBtnListener(arg_8_0.cancelBtn, nil, function()
		JumpTools.Back()
	end)
	arg_8_0:AddBtnListener(arg_8_0.confirmBtn, nil, function()
		if arg_8_0.suitEid then
			DormSuitTools:RelieveSuit(arg_8_0.suitEid)
			JumpTools.Back(2)
		end
	end)
end

return var_0_0
