local var_0_0 = class("SequentialBattleFactoryTeamView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "UI/MardukUI/continuousBattle/MardukContinuousBattleTeamUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.teamUIList_ = LuaList.New(handler(arg_3_0, arg_3_0.RefreshItem), arg_3_0.uiList_, SequentialBattleFactoryTeamItem)
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})

	arg_4_0.activityID_ = arg_4_0.params_.activityID

	arg_4_0.teamUIList_:StartScroll(#SequentialBattleChapterCfg[arg_4_0.activityID_].stage_id)
end

function var_0_0.OnExit(arg_5_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)
	arg_6_0.teamUIList_:Dispose()

	arg_6_0.teamUIList_ = nil
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.buffBtn_, nil, function()
		JumpTools.OpenPageByJump("sequentialBattleBuffInfo", {
			activityID = arg_7_0.activityID_
		})
	end)
	arg_7_0:AddBtnListener(arg_7_0.resetBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("SEQUENTIAL_BATTLE_RESET_TEAM"),
			OkCallback = function()
				SequentialBattleAction.ResetTeam(arg_7_0.activityID_, function(arg_11_0)
					if isSuccess(arg_11_0.result) then
						ReserveTools.ResetContData(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, arg_7_0.activityID_)
						arg_7_0.teamUIList_:StartScroll(#SequentialBattleChapterCfg[arg_7_0.activityID_].stage_id)
					else
						ShowTips(arg_11_0.result)
					end
				end)
			end
		})
	end)
	arg_7_0:AddBtnListener(arg_7_0.battleBtn_, nil, function()
		for iter_12_0 = 1, #SequentialBattleChapterCfg[arg_7_0.activityID_].stage_id do
			local var_12_0 = SequentialBattleChapterCfg[arg_7_0.activityID_].stage_id[iter_12_0]
			local var_12_1 = ReserveParams.New(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, arg_7_0.activityID_, iter_12_0, {
				stageType = BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE,
				stageID = var_12_0,
				activityID = arg_7_0.activityID_
			})

			if ReserveTools.GetHeroList(var_12_1)[1] == 0 then
				ShowTips("SEQUENTIAL_BATTLE_TEAM_IS_NULL")

				return
			end
		end

		SequentialBattleAction.SaveAllTeam(arg_7_0.activityID_, function(arg_13_0)
			if isSuccess(arg_13_0.result) then
				local var_13_0 = arg_7_0.activityID_
				local var_13_1 = 1
				local var_13_2 = ReserveParams.New(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, var_13_0, var_13_1, {
					stageType = BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE,
					stageID = SequentialBattleChapterCfg[arg_7_0.activityID_].stage_id[1],
					activityID = arg_7_0.activityID_
				})
				local var_13_3 = BattleStageFactory.Produce(BattleConst.STAGE_TYPE_NEW.SEQUENTIAL_BATTLE, SequentialBattleChapterCfg[arg_7_0.activityID_].stage_id[1], arg_7_0.activityID_, var_13_2)

				BattleController.GetInstance():LaunchBattle(var_13_3)
			else
				ShowTips(arg_13_0.result)
			end
		end)
	end)
end

function var_0_0.RefreshItem(arg_14_0, arg_14_1, arg_14_2)
	arg_14_2:SetData(arg_14_0.activityID_, arg_14_1)
end

return var_0_0
