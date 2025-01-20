ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("QWActivityMainUI", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return "Widget/Version/CORGUI_SandPlay_Com/SandPlay_MainUI/SandPlay_MainUI"
end

local var_0_1 = {
	[10107] = {
		activityId = 313581,
		hint = 313641001
	},
	[10110] = {
		activityId = 311462,
		hint = 313641002
	}
}
local var_0_2 = 313581001

function var_0_0.isHasLeftTimeDes(arg_2_0)
	return true
end

function var_0_0.OnEnter(arg_3_0)
	var_0_0.super.OnEnter(arg_3_0)
	arg_3_0:AddEventListeners()
	arg_3_0:UpdatePreview()
	arg_3_0:RefreshUI()
	manager.redPoint:bindUIandKey(arg_3_0.m_entrustBtn.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_3_0.activityID_), arg_3_0.activityID_))
end

function var_0_0.OnExit(arg_4_0)
	var_0_0.super.OnExit(arg_4_0)
	arg_4_0:RemoveAllEventListener()
	manager.redPoint:unbindUIandKey(arg_4_0.m_entrustBtn.transform, string.format("%s%s", ActivityTools.GetRedPointKey(arg_4_0.activityID_), arg_4_0.activityID_))
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.m_entrustBtn, nil, function()
		for iter_6_0, iter_6_1 in pairs(var_0_1) do
			if (QWorldQuestTool.GetMainQuestStatus(iter_6_0) == QWorldQuestConst.MAIN_QUEST_STATUS.FINISH or QWorldQuestTool.GetMainQuestStatus(iter_6_0) == QWorldQuestConst.MAIN_QUEST_STATUS.IN_PROGRESS) and not getData("qworld", "main_view_quest_" .. iter_6_0) and ActivityData:GetActivityIsOpen(iter_6_1.activityId) then
				saveData("qworld", "main_view_quest_" .. iter_6_0, true)
			end
		end

		arg_5_0:EnterQWorld()
	end)
	arg_5_0:BindHelpBtn("ACTIVITY_SPRING_SANDPLAY_TIP_1")
end

function var_0_0.AddEventListeners(arg_7_0)
	arg_7_0:RegistEventListener(ACTIVITY_RED_ENVELOPE_NEW_DAY, function()
		arg_7_0:RefreshUI()
	end)
end

function var_0_0.UpdateBar(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.RefreshUI(arg_10_0)
	arg_10_0.entrustBtnTxt_.text = GetTips("BATTLE_READY_2")

	local var_10_0 = false

	for iter_10_0, iter_10_1 in pairs(var_0_1) do
		if QWorldQuestTool.GetMainQuestStatus(iter_10_0) == QWorldQuestConst.MAIN_QUEST_STATUS.IN_PROGRESS and not getData("qworld", "main_view_quest_" .. iter_10_0) and ActivityData:GetActivityIsOpen(iter_10_1.activityId) then
			var_10_0 = true
			arg_10_0.activityTxt_.text = SandPlayHintCfg[iter_10_1.hint].desc
			arg_10_0.activityIcon.sprite = getSpriteWithoutAtlas("TextureConfig/SandPlay/MiniIcon/" .. SandPlayHintCfg[iter_10_1.hint].icon)
		end
	end

	if not var_10_0 and RedEnvelopeData:IsCanGetReward() and QWorldTools.CheckTagCanOpen(313581) then
		arg_10_0.activityTxt_.text = SandPlayHintCfg[var_0_2].desc
		arg_10_0.activityIcon.sprite = getSpriteWithoutAtlas("TextureConfig/SandPlay/MiniIcon/" .. SandPlayHintCfg[var_0_2].icon)
		var_10_0 = true
	end

	SetActive(arg_10_0.hintRoot_, var_10_0)
end

function var_0_0.EnterQWorld(arg_11_0)
	local var_11_0 = ActivitySandplayCfg[arg_11_0.activityID_]
	local var_11_1 = var_11_0 and var_11_0.story_id

	if not var_11_1 or var_11_1 == 0 or manager.story:IsStoryPlayed(var_11_1) then
		LaunchQWorld()
	else
		manager.story:StartStoryById(var_11_1, function()
			LaunchQWorld()
		end)
	end
end

return var_0_0
