local var_0_0 = class("CommunityTaskView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Club/ClubCtivityUI"
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

	arg_4_0.taskList_ = {}
	arg_4_0.taskListModule = CommonTaskListModule.New(arg_4_0.comTaskList_)
	arg_4_0.guildExitHandler_ = handler(arg_4_0, arg_4_0.ExitGuild)
end

function var_0_0.AddUIListener(arg_5_0)
	return
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.taskListModule:OnEnter()
	arg_6_0.taskListModule:RenderTypeTaskList(TaskConst.TASK_TYPE.CLUB_TASK)
	arg_6_0:RefreshUI()
	manager.notify:RegistListener(GUILD_EXIT, arg_6_0.guildExitHandler_)
end

function var_0_0.RefreshUI(arg_7_0)
	arg_7_0.identity_ = CommunityData:GetIdentity()

	arg_7_0:RefreshBar()
end

function var_0_0.RefreshBar(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		CurrencyConst.CURRENCY_TYPE_CLUB_COIN_B
	})
	manager.windowBar:SetBarCanClick(CurrencyConst.CURRENCY_TYPE_CLUB_COIN_B, true)
end

function var_0_0.ExitGuild(arg_9_0)
	arg_9_0:Go("/home")
end

function var_0_0.OnExit(arg_10_0)
	arg_10_0.taskListModule:OnExit()
	manager.notify:RemoveListener(GUILD_EXIT, arg_10_0.guildExitHandler_)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.taskListModule:Dispose()
	arg_11_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
