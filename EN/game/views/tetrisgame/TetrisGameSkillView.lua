local var_0_0 = class("TetrisGameSkillView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/BackHouseUI/TetrisGame/TetrisGamechapterUI"
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

	RankAction.QueryActivityRank(ActivityConst.ACTIVITY_TETRIS_GAME_RANK, nil, function()
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

function var_0_0.AddUIListener(arg_12_0)
	arg_12_0:AddBtnListener(arg_12_0.startBtn_, nil, function()
		local var_13_0 = TetrisGameTools:GetEndLessStageIDByActivityID(arg_12_0.activityID)

		if var_13_0 then
			TetrisGameTools:EnterStage(var_13_0)
		end
	end)
	arg_12_0:AddBtnListener(arg_12_0.btnrankBtn_, nil, function()
		JumpTools.OpenPageByJump("/tetrisGameRankView", {
			rankActivityID = ActivityConst.ACTIVITY_TETRIS_GAME_RANK
		})
	end)
end

function var_0_0.RegisterEvents(arg_15_0)
	return
end

function var_0_0.OnSkillUpdate(arg_16_0)
	arg_16_0.skillScroll:Refresh()
	arg_16_0:RefreshViewInfo()
end

function var_0_0.Dispose(arg_17_0)
	if arg_17_0.skillScroll then
		arg_17_0.skillScroll:Dispose()

		arg_17_0.skillScroll = nil
	end

	var_0_0.super.Dispose(arg_17_0)
end

function var_0_0.RefreshSkillList(arg_18_0)
	arg_18_0.skillList = ActivityTetrisGameSkillCfg.all

	arg_18_0.skillScroll:StartScroll(#arg_18_0.skillList)
end

function var_0_0.indexskillItem(arg_19_0, arg_19_1, arg_19_2)
	arg_19_2:RefreshUI(arg_19_0.skillList[arg_19_1])
end

function var_0_0.RefreshViewInfo(arg_20_0)
	local var_20_0 = #TetrisGameData:GetSkillList()

	arg_20_0.skillNum.text = string.format("%s/%s", tostring(var_20_0 or 0), tostring(GameSetting.tetris_game_skill_max.value[1]))

	local var_20_1 = RankData:GetActivityRank(ActivityConst.ACTIVITY_TETRIS_GAME_RANK)
	local var_20_2
	local var_20_3

	if var_20_1 then
		local var_20_4

		var_20_4, var_20_3 = var_20_1:GetCurRankDes()
	else
		var_20_3 = GetTips("MATRIX_RANK_NO_INFO")
	end

	arg_20_0.rankScore.text = var_20_3
end

return var_0_0
