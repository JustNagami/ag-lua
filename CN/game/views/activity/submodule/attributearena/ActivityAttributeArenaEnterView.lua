local var_0_0 = import("game.views.activity.Main.toggle.ActivityMainBasePanel")
local var_0_1 = class("ActivityAttributeArenaEnterView", var_0_0)

function var_0_1.GetUIName(arg_1_0)
	return AttributeArenaTools.GetEnterUI(arg_1_0.activityID_)
end

function var_0_1.Init(arg_2_0)
	var_0_1.super.Init(arg_2_0)

	arg_2_0.itemDataList_ = {}
end

function var_0_1.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.goBtn_, nil, function()
		JumpTools.GoToSystem("/activityAttributeArena", {
			activityID = arg_3_0.activityID_
		})
	end)
	arg_3_0:AddBtnListener(nil, arg_3_0.descBtn_, function()
		local var_5_0 = "ACTIVITY_ATTRIBUTE_GAME_TIP"

		JumpTools.OpenPageByJump("gameHelp", {
			content = GetTips(var_5_0),
			key = var_5_0
		})
	end)
end

function var_0_1.OnEnter(arg_6_0)
	var_0_1.super.OnEnter(arg_6_0)

	local var_6_0 = string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, arg_6_0.activityID_)

	manager.redPoint:bindUIandKey(arg_6_0.goBtn_.transform, var_6_0)

	local var_6_1 = ActivityToggleCfg[ActivityToggleCfg.get_id_list_by_activity_id[arg_6_0.activityID_][1]]

	arg_6_0.titleTet_.text = var_6_1.name
	arg_6_0.descTxt_.text = var_6_1.desc
end

function var_0_1.OnExit(arg_7_0)
	var_0_1.super.OnExit(arg_7_0)

	local var_7_0 = string.format("%s_%s", RedPointConst.ACTIVITY_ATTRIBUTE_ARENA, arg_7_0.activityID_)

	manager.redPoint:unbindUIandKey(arg_7_0.goBtn_.transform, var_7_0)
end

function var_0_1.IndexItem(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_0.itemDataList_[arg_8_1] then
		arg_8_0.itemDataList_[arg_8_1] = clone(ItemTemplateData)
		arg_8_0.itemDataList_[arg_8_1].clickFun = function(arg_9_0)
			ShowPopItem(POP_ITEM, {
				arg_9_0.id
			})
		end
	end

	arg_8_0.itemDataList_[arg_8_1].id = arg_8_0.itemIDList_[arg_8_1]
	arg_8_0.itemDataList_[arg_8_1].number = nil

	arg_8_2:SetData(arg_8_0.itemDataList_[arg_8_1])
end

function var_0_1.Dispose(arg_10_0)
	var_0_1.super.Dispose(arg_10_0)
end

function var_0_1.RefreshTimeText(arg_11_0)
	if arg_11_0.timeText_ then
		arg_11_0.timeText_.text = manager.time:GetLostTimeStrWith2UnitWithPrefix(arg_11_0.stopTime_, true)
	end
end

return var_0_1
