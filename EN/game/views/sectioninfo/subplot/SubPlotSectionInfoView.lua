local var_0_0 = class("SubPlotSectionInfoView", import("..SectionInfoBaseView"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)
	arg_1_0.hideStageNumController_:SetSelectedState("true")
	arg_1_0.hideStageDescController_:SetSelectedState("false")
	arg_1_0.hideDropPanelController_:SetSelectedState("false")
end

function var_0_0.OnTop(arg_2_0)
	arg_2_0:UpdateBar()
end

function var_0_0.OnClickBtn(arg_3_0)
	local var_3_0 = BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_SUB_PLOT
	local var_3_1 = BattleActivityStoryStageCfg[arg_3_0.stageID_]

	if StageTools.NeedShowContinueBattleWindow(var_3_0, arg_3_0.stageID_) then
		JumpTools.OpenPopUp("continueBattleCostPop", {
			stageType = var_3_0,
			stageID = arg_3_0.stageID_,
			callback = function()
				ChapterTools.DoReadyBattle(var_3_0, arg_3_0.stageID_)
			end
		})
	else
		ChapterTools.DoReadyBattle(var_3_0, arg_3_0.stageID_)
	end
end

function var_0_0.RefreshData(arg_5_0)
	local var_5_0 = BattleActivityStoryStageCfg[arg_5_0.stageID_]

	arg_5_0.lock_ = PlayerData:GetPlayerInfo().userLevel < var_5_0.level
	arg_5_0.lockTips_ = string.format(GetTips("PLAYER_LEVEL_UNLOCK"), var_5_0.level)

	local var_5_1 = arg_5_0.params_.chapterID
	local var_5_2 = ChapterCfg[var_5_1].activity_id

	if var_5_2 ~= 0 then
		local var_5_3 = ActivityData:GetActivityData(var_5_2)
		local var_5_4 = manager.time:GetServerTime()

		if var_5_4 > var_5_3.startTime and var_5_4 <= var_5_3.stopTime then
			arg_5_0.dropLibID_ = var_5_0.drop_lib_id_list[1]
		else
			arg_5_0.dropLibID_ = var_5_0.drop_lib_id_list[2]
		end
	else
		arg_5_0.dropLibID_ = var_5_0.drop_lib_id_list[2]
	end

	local var_5_5 = BattleStageData:GetStageData()[arg_5_0.stageID_]

	if var_5_5 then
		arg_5_0.isFirstClear_ = var_5_5.clear_times <= 0
	else
		arg_5_0.isFirstClear_ = true
	end

	if arg_5_0.isFirstClear_ then
		local var_5_6 = BattleStageTools.GetStageCfg(arg_5_0.stageType_, arg_5_0.stageID_)

		if type(var_5_6.extra_cost) == "table" and var_5_6.extra_cost[1] then
			arg_5_0.cost_ = var_5_6.extra_cost[2] or 0
		else
			arg_5_0.cost_ = var_5_6.cost or 0
		end
	else
		arg_5_0.cost_ = 0
	end

	local var_5_7 = getChapterAndSectionID(arg_5_0.stageID_)

	BattleFieldData:SetCacheStage(var_5_7, arg_5_0.stageID_)
end

function var_0_0.RefreshStageInfo(arg_6_0)
	local var_6_0 = BattleActivityStoryStageCfg[arg_6_0.stageID_]

	if arg_6_0.oldCfgID_ ~= var_6_0.id then
		arg_6_0.sectionText_.text = ""
		arg_6_0.sectionName_.text = GetI18NText(var_6_0.name)
		arg_6_0.sectionImage_.sprite = getSpriteWithoutAtlas(string.format("%s%s", SpritePathCfg.Stage.path, var_6_0.background_1))
		arg_6_0.oldCfgID_ = var_6_0.id
		arg_6_0.storyText_.text = GetI18NText(var_6_0.tips)
	end
end

return var_0_0
