ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("TetrisGameHomeView", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGameEntranceUI"
end

function var_0_0.AddListeners(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.btnstartBtn_, nil, function()
		JumpTools.OpenPageByJump("/tetrisGameMainView")
	end)
	arg_2_0:AddBtnListener(nil, arg_2_0.infobtn, function()
		local var_4_0 = "TETRIS_GAME_HOME_DESC"

		JumpTools.OpenPageByJump("gameHelp", {
			content = GetTips(var_4_0),
			key = var_4_0
		})
	end)
end

function var_0_0.RefreshTimeText(arg_5_0)
	if arg_5_0.timeText_ then
		arg_5_0.timeText_.text = manager.time:GetLostTimeStrWith2UnitWithPrefix(arg_5_0.stopTime_, true)
	end
end

function var_0_0.OnEnter(arg_6_0)
	var_0_0.super.OnEnter(arg_6_0)
	manager.redPoint:bindUIandKey(arg_6_0.btnstartBtn_.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_6_0.activityID_), arg_6_0.activityID_))
end

function var_0_0.OnExit(arg_7_0)
	var_0_0.super.OnExit(arg_7_0)
	manager.redPoint:unbindUIandKey(arg_7_0.btnstartBtn_.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_7_0.activityID_), arg_7_0.activityID_))
end

return var_0_0
