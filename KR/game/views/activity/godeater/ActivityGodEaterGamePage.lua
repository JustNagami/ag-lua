ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("ActivityGodEaterGamePage", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Entrance/V4_2_GodEaterUI_EntranceUI"
end

function var_0_0.OnEnter(arg_2_0)
	var_0_0.super.OnEnter(arg_2_0)

	arg_2_0.preRewardList_ = LuaList.New(handler(arg_2_0, arg_2_0.IndexPreviewItem), arg_2_0.rewardListGo_, CommonItemView)

	arg_2_0:OnUpdateView()
	manager.redPoint:bindUIandKey(arg_2_0.btn01Btn_.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_2_0.activityID_), arg_2_0.activityID_))
end

function var_0_0.OnExit(arg_3_0)
	var_0_0.super.OnExit(arg_3_0)
	manager.redPoint:unbindUIandKey(arg_3_0.btn01Btn_.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_3_0.activityID_), arg_3_0.activityID_))
end

function var_0_0.OnTop(arg_4_0)
	arg_4_0:OnUpdateView()
end

function var_0_0.OnUpdateView(arg_5_0)
	local var_5_0 = ActivityCfg[arg_5_0.activityID_]

	if var_5_0 and var_5_0.reward_show and var_5_0.reward_show ~= "" then
		local var_5_1 = {}

		for iter_5_0, iter_5_1 in ipairs(var_5_0.reward_show) do
			table.insert(var_5_1, rewardToItemTemplate({
				id = iter_5_1
			}, nil, true))
		end

		arg_5_0.preRewards_ = ItemTools.SortRewardItemList(var_5_1)

		arg_5_0.preRewardList_:StartScroll(#arg_5_0.preRewards_)
	end
end

function var_0_0.IndexPreviewItem(arg_6_0, arg_6_1, arg_6_2)
	arg_6_2:SetData(arg_6_0.preRewards_[arg_6_1])
end

function var_0_0.RefreshTimeText(arg_7_0)
	arg_7_0.m_timeLab.text = manager.time.WrapTimeStrWithTips(manager.time:GetLostTimeStrWith2Unit(arg_7_0.stopTime_))
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.btn01Btn_, nil, function()
		JumpTools.OpenPageByJump("/ActivityGodEaterGameMainView", {
			activity_id = arg_8_0.activityID_
		})
	end)
	arg_8_0:AddBtnListener(arg_8_0.m_descBtn, nil, function()
		JumpTools.OpenPageByJump("gameHelp", {
			icon = "icon_i",
			key = "GOD_EATER_GAME_TIPS_1",
			iconColor = Color(1, 1, 1),
			title = GetTips("STAGE_DESCRIPE"),
			content = GetTips("GOD_EATER_GAME_TIPS_1")
		})
	end)
end

function var_0_0.Dispose(arg_11_0)
	if arg_11_0.preRewardList_ then
		arg_11_0.preRewardList_:Dispose()

		arg_11_0.preRewardList_ = nil
	end

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
