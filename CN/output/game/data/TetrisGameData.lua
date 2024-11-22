local var_0_0 = singletonClass("TetrisGameData")
local var_0_1
local var_0_2
local var_0_3

local function var_0_4(arg_1_0)
	return {
		isClear = false,
		topScore = 0,
		stageID = arg_1_0
	}
end

function var_0_0.Init(arg_2_0)
	var_0_1 = nil
	var_0_2 = {}
	var_0_3 = {}
end

function var_0_0.InitServerData(arg_3_0, arg_3_1)
	var_0_1 = arg_3_1.activity_id

	for iter_3_0, iter_3_1 in ipairs(ActivityTetrisGameStageCfg.all) do
		var_0_2[iter_3_1] = var_0_4(iter_3_1)
	end

	if arg_3_1.finish_mission then
		var_0_0:InitClearStageList(arg_3_1.finish_mission)
	end

	var_0_0:InitEndLessScore(arg_3_1.endless_max_score)
	var_0_0:InitSkillList(arg_3_1.used_skill_list)
end

function var_0_0.InitClearStageList(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		if not var_0_2[iter_4_1] then
			var_0_2[iter_4_1] = var_0_4(iter_4_1)
		end

		var_0_2[iter_4_1].isClear = true
	end
end

function var_0_0.InitEndLessScore(arg_5_0, arg_5_1)
	local var_5_0 = TetrisGameTools:GetEndLessStageIDByActivityID(var_0_1)

	var_0_2[var_5_0].topScore = arg_5_1
end

function var_0_0.InitSkillList(arg_6_0, arg_6_1)
	var_0_3 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		table.insert(var_0_3, iter_6_1)
	end
end

function var_0_0.GetStageInfoList(arg_7_0)
	if var_0_2 then
		return var_0_2
	end
end

function var_0_0.GetStageInfoByStageID(arg_8_0, arg_8_1)
	if var_0_2 then
		return var_0_2[arg_8_1]
	end
end

function var_0_0.GetCurActivityID(arg_9_0)
	return var_0_1
end

function var_0_0.GetCurTaskActivityID(arg_10_0)
	return ActivityConst.ACTIVITY_TETRIS_GAME_TASK
end

function var_0_0.GetSkillList(arg_11_0)
	return var_0_3
end

function var_0_0.GetSpecialStageInfo(arg_12_0)
	local var_12_0 = TetrisGameTools:GetEndLessStageIDByActivityID(var_0_1)

	return var_0_2[var_12_0]
end

function var_0_0.GetChapterIsClear(arg_13_0, arg_13_1)
	if arg_13_1 and ActivityTetrisGameChapterCfg[arg_13_1] then
		local var_13_0 = ActivityTetrisGameChapterCfg[arg_13_1].tetris_stage_list

		for iter_13_0, iter_13_1 in ipairs(var_13_0) do
			if not var_0_2[iter_13_1].isClear then
				return false
			end
		end

		return true
	end
end

return var_0_0
