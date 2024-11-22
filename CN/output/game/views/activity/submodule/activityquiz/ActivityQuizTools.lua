local var_0_0 = {}
local var_0_1
local var_0_2 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = "UI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/IndiaPreheatMainUI"
}

function var_0_0.GetEnterUIName(arg_1_0)
	return var_0_2[arg_1_0]
end

local var_0_3 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = "UI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/IndiaPopUI"
}

function var_0_0.GetMatchPopUIName(arg_2_0)
	return var_0_3[arg_2_0]
end

local var_0_4 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = "UI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/IndiaShowUI"
}

function var_0_0.GetResultUIName(arg_3_0)
	return var_0_4[arg_3_0]
end

local var_0_5 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = ActivityConst.ACTIVITY_2_8_QUIZ_TASK
}

function var_0_0.GetTaskActivityID(arg_4_0)
	return var_0_5[arg_4_0]
end

local var_0_6 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = "ACTIVITY_QUIZ_DESCRIBE"
}

function var_0_0.GetHelpKey(arg_5_0)
	return var_0_6[arg_5_0] or ""
end

;({})[ActivityConst.ACTIVITY_2_8_QUIZ] = ""

function var_0_0.GetActivitySceneName(arg_6_0)
	return ActivityQuizCfg[ActivityQuizCfg.get_id_list_by_activity_id[arg_6_0][1]].scene
end

local var_0_7 = {
	[ActivityConst.ACTIVITY_2_8_QUIZ] = "UI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/IndiaHallUI"
}

function var_0_0.GetActivitySceneUIName(arg_7_0)
	return var_0_7[arg_7_0]
end

function var_0_0.SetCurActivityID(arg_8_0)
	var_0_1 = arg_8_0
end

function var_0_0.GetCurActivityID()
	if var_0_1 then
		return var_0_1
	else
		error("未设置活动id")
	end
end

function var_0_0.ClearCurActivityID()
	var_0_1 = nil
end

function var_0_0.GetLastSelectedPlayer(arg_11_0)
	local var_11_0 = ActivityQuizCfg[ActivityQuizCfg.get_id_list_by_activity_id[arg_11_0][1]]

	return getData("activityQuiz", "lastSelectedPlayer_" .. arg_11_0) or var_11_0.character_list[1]
end

return var_0_0
