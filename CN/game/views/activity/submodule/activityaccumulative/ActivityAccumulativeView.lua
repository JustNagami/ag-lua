ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("ActivityAccumulativeView", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return "Widget/Version/NorseUI_3_0/NorseUI_3_0_AccumulateUI/NorseUI_3_0_AccumulateUI"
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)

	arg_2_0.nodeList = {}
	arg_2_0.drawIndex = 0
	arg_2_0.taskUpdateHandler_ = handler(arg_2_0, arg_2_0.TaskUpdate)
	arg_2_0.controller_ = arg_2_0.lastControllerexcollection_:GetController("default0")
	arg_2_0.taskScroll_ = LuaList.New(handler(arg_2_0, arg_2_0.RefreshItem), arg_2_0.uilistUilist_, AccumulativeGachaItem)
end

function var_0_0.RefreshItem(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2:SetData(arg_3_0.tasklist[arg_3_1], arg_3_1)

	if not arg_3_0.tasklist[arg_3_1] or not arg_3_0.tasklist[arg_3_1].state then
		local var_3_0 = 0
	end
end

function var_0_0.OnEnter(arg_4_0)
	var_0_0.super.OnEnter(arg_4_0)
	arg_4_0:TaskUpdate()

	arg_4_0.contentTrs_.localPosition = Vector3.New(-222 * arg_4_0.drawIndex, 0, 0)

	manager.notify:RegistListener(ACCUMULATIVEGACHA_UPDATE, arg_4_0.taskUpdateHandler_)
end

function var_0_0.OnExit(arg_5_0)
	var_0_0.super.OnExit(arg_5_0)
	manager.notify:RemoveListener(ACCUMULATIVEGACHA_UPDATE, arg_5_0.taskUpdateHandler_)
end

function var_0_0.Dispose(arg_6_0)
	arg_6_0.taskUpdateHandler_ = nil

	arg_6_0.taskScroll_:Dispose()

	for iter_6_0, iter_6_1 in pairs(arg_6_0.nodeList) do
		iter_6_1:Dispose()
	end

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.goBtn_, nil, function()
		JumpTools.GoToSystem("/draw", nil, ViewConst.SYSTEM_ID.DRAW)
	end)
	arg_7_0:AddBtnListener(arg_7_0.descbtnBtn_, nil, function()
		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "ACTIVITY_ACCUMULATIVE_INSTRUCTIONS",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = GetTips("ACTIVITY_ACCUMULATIVE_INSTRUCTIONS")
		})
	end)
end

function var_0_0.RefreshTimeText(arg_10_0)
	arg_10_0.texttimeText_.text = manager.time:GetLostTimeStrWith2Unit(arg_10_0.stopTime_)
end

function var_0_0.TaskUpdate(arg_11_0)
	arg_11_0.tasklist = ActivityAccumulativeData:GetList(arg_11_0.activityID_)

	arg_11_0.taskScroll_:StartScroll(#arg_11_0.tasklist)

	local var_11_0 = 0

	arg_11_0.descTxt_.text = ActivityAccumulativeData:GetNum()
	arg_11_0.textText_.text = GetTips("ACTIVITY_ACCUMULATIVE_INTRODUCE")

	local var_11_1 = {
		0.08,
		0.18,
		0.3,
		0.42,
		0.54,
		0.66,
		0.78,
		0.9,
		1,
		1
	}
	local var_11_2 = 1425
	local var_11_3 = 0
	local var_11_4 = 0.1
	local var_11_5 = 0
	local var_11_6 = 0
	local var_11_7 = 9999

	for iter_11_0 = 1, #arg_11_0.tasklist do
		if not arg_11_0.nodeList[iter_11_0] then
			local var_11_8 = arg_11_0[string.format("point%sGo_", iter_11_0)]

			arg_11_0.nodeList[iter_11_0] = AccumulativeGachaPoint.New(var_11_8)
		end

		local var_11_9 = arg_11_0.tasklist[iter_11_0]
		local var_11_10 = ActivityPointRewardCfg[var_11_9.id]

		if var_11_10 then
			var_11_3 = math.max(var_11_3, var_11_10.need)

			local var_11_11 = var_11_9.state

			arg_11_0.drawIndex = math.max(var_11_11 == 2 and iter_11_0 or 0, arg_11_0.drawIndex)

			if ActivityAccumulativeData:GetNum() >= var_11_10.need then
				var_11_4 = 0.12
				var_11_5 = var_11_1[iter_11_0]

				arg_11_0.nodeList[iter_11_0]:SetIsDraw(true)

				var_11_6 = math.max(var_11_6, var_11_10.need)
			else
				var_11_7 = math.min(var_11_7, var_11_10.need)

				arg_11_0.nodeList[iter_11_0]:SetIsDraw(false)
			end
		end
	end

	local var_11_12 = var_11_5 + (ActivityAccumulativeData:GetNum() - var_11_6) / (var_11_7 - var_11_6) * var_11_4

	arg_11_0.sliderSlr_.value = var_11_12
end

return var_0_0
