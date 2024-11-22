local var_0_0 = class("CooperationSearchRoomView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/Cooperation/CooperationSearchRoomUI"
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
	arg_4_0.m_inputField.textComponent:RegisterDirtyVerticesCallback(function()
		local var_5_0 = string.match(arg_4_0.m_inputField.text, "%d+")

		arg_4_0.m_inputField.text = var_5_0
		arg_4_0.m_inputField.textComponent.text = var_5_0
	end)
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.m_searchBtn, nil, function()
		local var_7_0 = tonumber(arg_6_0.m_inputField.text)

		if var_7_0 == nil then
			ShowTips("ACTIVITY_STRONGHOLD_ROOM_NUM_TIPS")

			return
		end

		local var_7_1, var_7_2 = textLimit(arg_6_0.m_inputField.text, 10)

		if not var_7_2 then
			ShowTips("ACTIVITY_STRONGHOLD_CORRECT_ROOM_NUM_TIPS")

			return
		end

		CooperationAction.JoinRoom(var_7_0, nil, CooperationConst.JOIN_ROOM_SOURCE.ROOM_ID)
	end)
	arg_6_0:AddBtnListener(arg_6_0.m_mask, nil, function()
		arg_6_0:Back()
	end)
end

function var_0_0.OnTop(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnEnter(arg_10_0)
	return
end

function var_0_0.OnExit(arg_11_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_12_0)
	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
