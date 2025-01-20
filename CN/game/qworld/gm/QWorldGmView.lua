local var_0_0 = class("QWorldGmView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "QWWorld/UI/Quest/QWorldGmUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.addMainBtn_, nil, function()
		arg_5_0:SendGM(string.format("xt zrw add %s", arg_5_0.input_.text))
	end)
	arg_5_0:AddBtnListener(arg_5_0.finishMainBtn_, nil, function()
		arg_5_0:SendGM(string.format("xt zrw pass %s", arg_5_0.input_.text))
	end)
	arg_5_0:AddBtnListener(arg_5_0.addSubBtn_, nil, function()
		arg_5_0:SendGM(string.format("xt rw add %s", arg_5_0.input_.text))
	end)
	arg_5_0:AddBtnListener(arg_5_0.finishSubBtn_, nil, function()
		arg_5_0:SendGM(string.format("xt rw pass %s", arg_5_0.input_.text))
	end)
	arg_5_0:AddBtnListener(arg_5_0.switchTimeBtn_, nil, function()
		QWorldLuaBridge.Launcher("X510a")
	end)
	arg_5_0:AddBtnListener(arg_5_0.switchSceneBtn_, nil, function()
		QWorldLuaBridge.Restart(arg_5_0.input_.text)
	end)
	arg_5_0:AddBtnListener(arg_5_0.teleportBtn_, nil, function()
		local var_12_0 = tonumber(arg_5_0.input_.text)

		if var_12_0 then
			QWorldTeleport(var_12_0)
		else
			QWorldLuaBridge.TeleportToStageOrigin()
		end
	end)
end

function var_0_0.OnEnter(arg_13_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	arg_13_0:RefreshUI()
end

function var_0_0.OnExit(arg_14_0)
	manager.windowBar:HideBar()
end

function var_0_0.RefreshUI(arg_15_0)
	return
end

function var_0_0.SendGM(arg_16_0, arg_16_1)
	arg_16_1 = "$ " .. arg_16_1

	local var_16_0 = {
		content = arg_16_1
	}

	print(arg_16_1)
	manager.net:SendWithLoadingNew(27100, var_16_0, 27101, function(arg_17_0, arg_17_1)
		print("Send Msg Return:", arg_17_0.result)
		ShowTips(arg_17_0.result)
	end)
end

function var_0_0.Dispose(arg_18_0)
	var_0_0.super.Dispose(arg_18_0)
end

return var_0_0
