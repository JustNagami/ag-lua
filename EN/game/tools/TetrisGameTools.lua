local var_0_0 = {}

function var_0_0.EnterStage(arg_1_0, arg_1_1)
	local var_1_0, var_1_1 = var_0_0:CheckStageIsUnlock(arg_1_1)

	if var_1_0 then
		local var_1_2 = {
			stageID = arg_1_1
		}
		local var_1_3 = gameContext:GetOpenPageHandler("tetrisGameStageView")

		if var_1_3 then
			TetrisGameRunTimeManager:Init(var_1_2, var_1_3.stageGo)
		else
			JumpTools.OpenPageByJump("/tetrisGameStageView", {
				stageID = arg_1_1,
				callBack = function(arg_2_0)
					TetrisGameRunTimeManager:Init(var_1_2, arg_2_0)
				end
			})
		end
	else
		ShowTips(var_1_1)
	end
end

function var_0_0.CheckStageIsUnlock(arg_3_0, arg_3_1)
	local var_3_0 = ActivityTetrisGameStageCfg[arg_3_1]

	if var_3_0 then
		local var_3_1 = ActivityTetrisGameChapterCfg.get_id_list_by_tetris_stage_list[arg_3_1][1]
		local var_3_2 = ActivityTetrisGameChapterCfg[var_3_1].activityID

		if not ActivityData:GetActivityIsOpen(var_3_2) then
			local var_3_3 = ActivityData:GetActivityData(var_3_2)

			return false, string.format(GetTips("UNLOCK"), manager.time:GetLostTimeStr(var_3_3.startTime, false, true))
		end

		if var_3_0.pre_chapter and var_3_0.pre_chapter > 0 then
			local var_3_4 = string.format(GetTips("TETRIS_GAME_SKILL_UNLOCK_CONDITION"), ActivityTetrisGameStageCfg[var_3_0.pre_chapter].desc)

			if not TetrisGameData:GetStageInfoByStageID(var_3_0.pre_chapter).isClear then
				return false, var_3_4
			end
		end

		return true
	end
end

function var_0_0.GetStageState(arg_4_0, arg_4_1)
	if ActivityTetrisGameStageCfg[arg_4_1] then
		local var_4_0, var_4_1 = var_0_0:CheckStageIsUnlock(arg_4_1)

		if not var_4_0 then
			return "lock", var_4_1
		end

		if TetrisGameData:GetStageInfoByStageID(arg_4_1).isClear then
			return "finish"
		else
			return "unlock"
		end
	end
end

function var_0_0.GetChapterState(arg_5_0, arg_5_1)
	local var_5_0 = ActivityTetrisGameChapterCfg[arg_5_1]

	if var_5_0 then
		local var_5_1 = var_5_0.activityID
		local var_5_2, var_5_3 = ActivityTools.GetActivityStatusWithTips(var_5_1)

		if var_5_2 == 1 then
			return "open"
		elseif var_5_2 == 0 then
			return "lock", var_5_3
		elseif var_5_2 == 2 then
			return "finish", var_5_3
		end
	end
end

function var_0_0.GetEndLessStageIDByActivityID(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(ActivityTetrisGameStageCfg.all) do
		if ActivityTetrisGameStageCfg[iter_6_1].type == TetrisGameConst.stageType.endLess then
			return iter_6_1
		end
	end
end

function var_0_0.GetSimpleChapterIDListByActivityID(arg_7_0, arg_7_1)
	local var_7_0 = ActivityCfg[arg_7_1].sub_activity_list
	local var_7_1 = {}
	local var_7_2 = ActivityTetrisGameChapterCfg.get_id_list_by_type[TetrisGameConst.stageType.normal]

	for iter_7_0, iter_7_1 in ipairs(var_7_2) do
		local var_7_3 = ActivityTetrisGameChapterCfg[iter_7_1].activityID

		if table.keyof(var_7_0, var_7_3) then
			table.insert(var_7_1, iter_7_1)
		end
	end

	return var_7_1
end

function var_0_0.CheckSkillIsUnlock(arg_8_0, arg_8_1)
	local var_8_0 = ActivityTetrisGameSkillCfg[arg_8_1]

	if var_8_0 then
		local var_8_1 = var_8_0.unlock_stage_id

		for iter_8_0, iter_8_1 in ipairs(var_8_1) do
			if var_0_0:GetStageState(iter_8_1) ~= "finish" then
				return false, "STAGE_LOCK"
			end
		end

		return true
	end
end

function var_0_0.AddOrReduceSkill(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = TetrisGameData:GetCurActivityID()

	if var_9_0 then
		local var_9_1 = deepClone(TetrisGameData:GetSkillList())

		if not var_0_0:CheckSkillInList(arg_9_1) then
			table.insert(var_9_1, arg_9_1)
		else
			local var_9_2 = table.keyof(var_9_1, arg_9_1)

			table.remove(var_9_1, var_9_2)
		end

		if arg_9_2 then
			local var_9_3 = table.keyof(var_9_1, arg_9_2)

			table.remove(var_9_1, var_9_3)
		end

		if #var_9_1 > GameSetting.tetris_game_skill_max.value[1] then
			ShowTips("PROFILE_LABEL_MAX_NUM")

			return
		end

		TetrisGameAction:AskEquipSkill(var_9_0, var_9_1)
	end
end

function var_0_0.CheckSkillInList(arg_10_0, arg_10_1)
	local var_10_0 = TetrisGameData:GetSkillList()

	if var_10_0 then
		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			if iter_10_1 == arg_10_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.CheckSkillIsConflict(arg_11_0, arg_11_1)
	local var_11_0 = TetrisGameData:GetSkillList()

	if var_11_0 then
		for iter_11_0, iter_11_1 in ipairs(var_11_0) do
			local var_11_1 = ActivityTetrisGameSkillCfg[iter_11_1]

			for iter_11_2, iter_11_3 in ipairs(var_11_1.exclusion) do
				if iter_11_3 == arg_11_1 then
					return true, iter_11_1
				end
			end
		end
	end

	return false
end

function var_0_0.GetSkillIcon(arg_12_0, arg_12_1)
	if arg_12_1 then
		return getSpriteViaConfig("TetrisGameSkill", arg_12_1)
	end
end

return var_0_0
