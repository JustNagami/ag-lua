local var_0_0 = import("game.views.activity.Main.toggle.ActivityMainBasePanel")
local var_0_1 = class("MultHeartDemonEnterView", var_0_0)

function var_0_1.GetUIName(arg_1_0)
	return "Widget/System/Activity_Resident/Acitvity_SoloHeartDemon/SoloHeartDemon_MultMain"
end

function var_0_1.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()

	arg_2_0.preRewardList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexPreviewItem), arg_2_0.rewardListGo_, CommonItemView)
end

function var_0_1.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.Controller = ControllerUtil.GetController(arg_3_0.gameObject_.transform, "lock")
end

function var_0_1.OnEnter(arg_4_0)
	var_0_1.super.OnEnter(arg_4_0)
	manager.redPoint:bindUIandKey(arg_4_0.goBtn_.transform, RedPointConst.MULT_HEART_DEMON)
	arg_4_0:UpdateView()
	arg_4_0:HideRedPoint()
	arg_4_0:AddTimer()
	arg_4_0:OnUpdateView()
end

function var_0_1.HideRedPoint(arg_5_0)
	MultHeartDemonAction.UpdateEnterRedPoint(arg_5_0.activityId)
end

function var_0_1.RefreshTimeText(arg_6_0)
	local var_6_0, var_6_1 = arg_6_0:CheckAdvanceOpenTime()

	arg_6_0.remainTxt_.text = var_6_1
end

function var_0_1.UpdateView(arg_7_0)
	arg_7_0.titleTxt_.text = GetTips("MULTI_HEART_DEMON_NAME")
	arg_7_0.describeTxt_.text = GetTips("MULTI_HEART_DEMON_DESC")

	arg_7_0.Controller:SetSelectedState(JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.SOLO_HEART_DEMON) and "lock" or "unlock")
end

function var_0_1.HideRedPoint(arg_8_0)
	MultHeartDemonAction.UpdateEnterRedPoint(arg_8_0.activityId)
end

function var_0_1.OnExit(arg_9_0)
	var_0_1.super.OnExit(arg_9_0)
	arg_9_0:StopTimer()
	manager.redPoint:unbindUIandKey(arg_9_0.goBtn_.transform, RedPointConst.MULT_HEART_DEMON)
end

function var_0_1.AddUIListener(arg_10_0)
	arg_10_0:AddBtnListener(arg_10_0.goBtn_, nil, function()
		if JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.MULT_HEART_DEMON) then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), JumpTools.IsSystemLocked(ViewConst.SYSTEM_ID.MULT_HEART_DEMON)[2]))
		else
			JumpTools.GoToSystem("/multHeartDemonMain", {
				activityId = arg_10_0.activityId
			})
			MultHeartDemonAction.UpdateViewRedPoint()
		end
	end)
	arg_10_0:AddBtnListener(arg_10_0.descBtn_, nil, function()
		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = GetTips("MULTI_HEART_DEMON_GAMEPLAY_DESC")
		})
	end)
end

function var_0_1.CheckAdvanceOpenTime(arg_13_0)
	local var_13_0 = 0
	local var_13_1 = 0
	local var_13_2 = ActivityData:GetActivityData(arg_13_0.activityID_)

	if arg_13_0.isAdvanceActivity_ then
		var_13_1 = var_13_2.startTime
		var_13_0 = var_13_1 - manager.time:GetServerTime()
	end

	local var_13_3 = arg_13_0.isAdvanceActivity_ and var_13_0 > 0

	arg_13_0.stopTime_ = var_13_3 and var_13_2.startTime or var_13_2.stopTime

	local var_13_4 = var_13_3 and string.format(GetTips("AFTER_TIME"), manager.time:GetLostTimeStrWith2Unit(var_13_1)) or manager.time:GetLostTimeStrWith2UnitWithPrefix(var_13_2.stopTime)

	return var_13_3, var_13_4
end

function var_0_1.OnUpdateView(arg_14_0)
	local var_14_0 = ActivityCfg[arg_14_0.activityID_]

	if var_14_0 and var_14_0.reward_show and var_14_0.reward_show ~= "" then
		local var_14_1 = {}

		for iter_14_0, iter_14_1 in ipairs(var_14_0.reward_show) do
			table.insert(var_14_1, rewardToItemTemplate({
				id = iter_14_1
			}, nil, true))
		end

		arg_14_0.preRewards_ = ItemTools.SortRewardItemList(var_14_1)

		arg_14_0.preRewardList_:StartScroll(#arg_14_0.preRewards_)
	end
end

function var_0_1.IndexPreviewItem(arg_15_0, arg_15_1, arg_15_2)
	arg_15_2:SetData(arg_15_0.preRewards_[arg_15_1])
end

return var_0_1
