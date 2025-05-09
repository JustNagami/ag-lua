local var_0_0 = class("TetrisGameSkillView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/Alone_TetrisGameUI/TetrisGamechapterUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()

	arg_4_0.skillScroll = LuaList.New(handler(arg_4_0, arg_4_0.indexskillItem), arg_4_0.skillListGo_, TetrisGameSkillItem)
	arg_4_0.skillCountShowController = arg_4_0.controller_:GetController("skillCountShow")
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()
end

function var_0_0.OnEnter(arg_6_0)
	arg_6_0.activityID = TetrisGameData:GetCurActivityID()

	TetrisGameAction:SaveNewSkill()
	arg_6_0:RefreshBar()
	arg_6_0:RefreshSkillList()
	arg_6_0:RefreshViewInfo()

	arg_6_0.texttittleText_.text = ActivityTetrisGameChapterCfg[1].name

	RankAction.QueryActivityRank(TetrisGameData:GetCurRankActivityID(), nil, function()
		arg_6_0:RefreshViewInfo()
	end)
end

function var_0_0.OnTop(arg_8_0)
	arg_8_0:RefreshBar()
end

function var_0_0.RefreshBar(arg_9_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})

	local var_9_0 = GameSetting.tetris_game_describe1 and GameSetting.tetris_game_describe1.value or {}

	manager.windowBar:RegistInfoCallBack(function()
		JumpTools.OpenPageByJump("gameHelpPro", {
			isPrefab = true,
			pages = var_9_0
		})
	end)
end

function var_0_0.OnExit(arg_11_0)
	TetrisGameAction:UpdataNewSkill()
	manager.windowBar:HideBar()
	arg_11_0:RemoveAllEventListener()
end

function var_0_0.GetCanUseSkillCount(arg_12_0)
	local var_12_0 = 0

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.skillList) do
		if TetrisGameTools:CheckSkillIsUnlock(iter_12_1) then
			var_12_0 = var_12_0 + 1
		end
	end

	return var_12_0
end

function var_0_0.CheckIsNumLimit(arg_13_0)
	local var_13_0 = true
	local var_13_1 = arg_13_0:GetCanUseSkillCount()
	local var_13_2 = #TetrisGameData:GetSkillList()
	local var_13_3 = GameSetting.tetris_game_skill_max.value[1]

	if var_13_3 <= var_13_1 and var_13_2 < var_13_3 then
		ShowTips("TETRIS_GAME_SKILL_NUM_TIPS")

		var_13_0 = false
	end

	return var_13_0
end

function var_0_0.AddUIListener(arg_14_0)
	arg_14_0:AddBtnListener(arg_14_0.startBtn_, nil, function()
		if not arg_14_0:CheckIsNumLimit() then
			return
		end

		local var_15_0 = TetrisGameTools:GetEndLessStageIDByActivityID(arg_14_0.activityID)

		if var_15_0 then
			TetrisGameTools:EnterStage(var_15_0)
		end
	end)
	arg_14_0:AddBtnListener(arg_14_0.btnrankBtn_, nil, function()
		JumpTools.OpenPageByJump("/tetrisGameRankView", {
			rankActivityID = TetrisGameData:GetCurRankActivityID()
		})
	end)
end

function var_0_0.RegisterEvents(arg_17_0)
	return
end

function var_0_0.OnSkillUpdate(arg_18_0)
	arg_18_0.skillScroll:Refresh()
	arg_18_0:RefreshViewInfo()
end

function var_0_0.Dispose(arg_19_0)
	if arg_19_0.skillScroll then
		arg_19_0.skillScroll:Dispose()

		arg_19_0.skillScroll = nil
	end

	var_0_0.super.Dispose(arg_19_0)
end

function var_0_0.GetTargetMoveIndex(arg_20_0)
	local var_20_0 = -1

	for iter_20_0 = 1, #arg_20_0.skillList do
		local var_20_1 = arg_20_0.skillList[iter_20_0]

		if manager.redPoint:getTipBoolean(string.format("%s_%s", RedPointConst.ACTIVITY_TETIRS_GAME_NEW_SKILL, var_20_1)) then
			var_20_0 = iter_20_0

			break
		end
	end

	if var_20_0 < 0 then
		for iter_20_1 = 1, #arg_20_0.skillList do
			local var_20_2 = arg_20_0.skillList[iter_20_1]

			if TetrisGameTools:CheckSkillInList(var_20_2) then
				var_20_0 = iter_20_1

				break
			end
		end
	end

	return var_20_0
end

function var_0_0.RefreshSkillList(arg_21_0)
	local var_21_0 = TetrisGameTools:GetEndLessStageIDByActivityID(arg_21_0.activityID)

	arg_21_0.skillList = ActivityTetrisGameStageCfg[var_21_0].skill_list

	local var_21_1 = arg_21_0:GetTargetMoveIndex()

	if var_21_1 > 0 then
		arg_21_0.skillScroll:StartScroll(#arg_21_0.skillList, var_21_1)
	else
		arg_21_0.skillScroll:StartScroll(#arg_21_0.skillList)
	end

	local var_21_2 = TetrisGameConst.ultimateID
	local var_21_3 = ActivityTetrisGameSkillCfg[var_21_2]

	if var_21_2 and var_21_3 then
		arg_21_0.ultimateNameTxt_.text = var_21_3.name
		arg_21_0.ultimateDescTxt_.text = var_21_3.desc
		arg_21_0.ultimateIcon_.sprite = TetrisGameTools:GetSkillIcon(var_21_2)
	end
end

function var_0_0.indexskillItem(arg_22_0, arg_22_1, arg_22_2)
	arg_22_2:RefreshUI(arg_22_0.skillList[arg_22_1])
end

function var_0_0.RefreshViewInfo(arg_23_0)
	local var_23_0 = arg_23_0:GetCanUseSkillCount()

	if var_23_0 > 0 then
		arg_23_0.skillCountShowController:SetSelectedState("show")
	else
		arg_23_0.skillCountShowController:SetSelectedState("hide")
	end

	local var_23_1 = GameSetting.tetris_game_skill_max.value[1]
	local var_23_2 = math.min(var_23_1, var_23_0)
	local var_23_3 = #TetrisGameData:GetSkillList()

	arg_23_0.skillNum.text = string.format("%s/%s", tostring(var_23_3 or 0), var_23_2)

	local var_23_4 = RankData:GetActivityRank(TetrisGameData:GetCurRankActivityID())
	local var_23_5
	local var_23_6

	if var_23_4 then
		local var_23_7

		var_23_7, var_23_6 = var_23_4:GetCurRankDes()
	else
		var_23_6 = GetTips("MATRIX_RANK_NO_INFO")
	end

	arg_23_0.rankScore.text = var_23_6
end

return var_0_0
