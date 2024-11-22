local var_0_0 = class("StoreEquipFilterPanel", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.sortController_ = arg_1_0.sortControllerEx_:GetController("sort")
	arg_1_0.colorController_ = arg_1_0.filterControllerEx_:GetController("color")
end

function var_0_0.Dispose(arg_2_0)
	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.decomposeBtn_, nil, function()
		JumpTools.GoToSystem("/equipDecompose", {}, ViewConst.SYSTEM_ID.BAG)
	end)
	arg_3_0:AddBtnListener(arg_3_0.filterBtn_, nil, function()
		arg_3_0:Go("equipFilter", {
			filterParams = arg_3_0.filterParams_,
			equipPosition = arg_3_0.equipPosition_
		})
	end)
	arg_3_0:AddBtnListener(arg_3_0.sortBtn_, nil, function()
		manager.notify:Invoke(SWITCH_SORT)
	end)
	arg_3_0:AddToggleListener(arg_3_0.sortDropdown_, function(arg_7_0)
		manager.notify:Invoke(SWITCH_SORT_RARE, arg_7_0)
	end)
end

function var_0_0.RefreshUI(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.filterParams_ = arg_8_1
	arg_8_0.equipPosition_ = arg_8_2
	arg_8_0.cntText_.text = string.format("%d/%d", EquipTools.GetEquipNum(), GameSetting.max_equip.value[1])

	if arg_8_1.order == ItemConst.SORT_TYPE.DOWN then
		arg_8_0.sortController_:SetSelectedState("down")
	else
		arg_8_0.sortController_:SetSelectedState("up")
	end

	if #arg_8_1.suit > 0 or #arg_8_1.skill > 0 then
		arg_8_0.colorController_:SetSelectedState("orange")
	else
		arg_8_0.colorController_:SetSelectedState("normal")
	end
end

return var_0_0
