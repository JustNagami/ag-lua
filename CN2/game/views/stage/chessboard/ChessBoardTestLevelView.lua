﻿local var_0_0 = class("ChessBoardTestLevelView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/NewWarChess/NewWarChessEntryUI"
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

	arg_4_0.newChessList_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, ChessBoardTestLevelItem)
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = ChessBoardLevelCfg.all[arg_5_1]

	arg_5_2:SetData(var_5_0)
end

function var_0_0.AddUIListener(arg_6_0)
	return
end

function var_0_0.OnEnter(arg_7_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	arg_8_0.newChessList_:StartScroll(#ChessBoardLevelCfg.all)
end

function var_0_0.OnExit(arg_9_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_10_0)
	if arg_10_0.newChessList_ then
		arg_10_0.newChessList_:Dispose()

		arg_10_0.newChessList_ = nil
	end

	arg_10_0.super.Dispose(arg_10_0)
end

return var_0_0
