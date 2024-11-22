local var_0_0 = import("game.views.activity.Main.toggle.ActivityMainBasePanel")
local var_0_1 = class("ActivityAttributeArenaEnterView", var_0_0)

function var_0_1.GetUIName(arg_1_0)
	return AttributeArenaTools.GetEnterUI(arg_1_0.activityID_)
end

function var_0_1.AddListeners(arg_2_0)
	arg_2_0:AddBtnListener(arg_2_0.goBtn_, nil, function()
		JumpTools.GoToSystem("/activityAttributeArena", {
			activityID = arg_2_0.activityID_
		})
	end)
	arg_2_0:AddBtnListener(nil, arg_2_0.descBtn_, function()
		local var_4_0 = "ACTIVITY_ATTRIBUTE_GAME_TIP"

		JumpTools.OpenPageByJump("gameHelp", {
			content = GetTips(var_4_0),
			key = var_4_0
		})
	end)
end

function var_0_1.OnEnter(arg_5_0)
	var_0_1.super.OnEnter(arg_5_0)

	local var_5_0 = string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, arg_5_0.activityID_)

	manager.redPoint:bindUIandKey(arg_5_0.goBtn_.transform, var_5_0)

	arg_5_0.descTxt_.text = GetTips("ACTIVITY_ATTRIBUTE_ENTER_TIP")
end

function var_0_1.OnExit(arg_6_0)
	var_0_1.super.OnExit(arg_6_0)

	local var_6_0 = string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, arg_6_0.activityID_)

	manager.redPoint:unbindUIandKey(arg_6_0.goBtn_.transform, var_6_0)
end

return var_0_1
