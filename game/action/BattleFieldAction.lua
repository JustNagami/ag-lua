manager.net:Bind(11071, function(arg_1_0)
	BattleTeamData:UpdateHeroTrial(arg_1_0)
end)
manager.net:Bind(54007, function(arg_2_0)
	local var_2_0 = arg_2_0.battle_start.result

	if isSuccess(var_2_0) then
		if WaitStartBattle then
			print("已经存在战斗")

			return
		end

		local var_2_1 = arg_2_0.battle_start.battle_id
		local var_2_2 = arg_2_0.battle_start.battle_server_ip
		local var_2_3 = arg_2_0.battle_start.battle_server_port

		WaitStartBattle = true

		print("战斗开始", var_2_1, var_2_2, var_2_3)
		BattleFieldData:SetServerBattleParams(var_2_1, var_2_2, var_2_3)
		BattleController.GetInstance():StartBattle()
	else
		if var_2_0 == TipsCfg.get_id_list_by_define.ERROR_NO_TEMPLATE then
			JumpTools.Back()
			ShowTips("STAGE_REFRESH_DATA")
		else
			ShowTips(var_2_0)
		end

		WaitStartBattle = false
	end
end)
manager.net:Bind(54107, function(arg_3_0)
	local var_3_0 = arg_3_0.battle_start.result

	if isSuccess(var_3_0) then
		local var_3_1 = arg_3_0.battle_start.battle_id
		local var_3_2 = arg_3_0.battle_start.battle_server_ip
		local var_3_3 = arg_3_0.battle_start.battle_server_port

		print("联机战斗开始", var_3_1, var_3_2, var_3_3)
		manager.notify:Invoke(START_COOPERATION_BATTLE)

		local var_3_4 = CooperationData:GetRoomData()
		local var_3_5 = BattleStageFactory.ProduceCooperation(var_3_4.type, var_3_4.dest, var_3_4.activity_id)

		BattleController.GetInstance():SetBattleStageData(var_3_5)
		var_3_5:UpdateRoleDatas()
		BattleFieldData:SetServerBattleParams(var_3_1, var_3_2, var_3_3)
		BattleController.GetInstance():StartBattle(true)
	elseif var_3_0 == TipsCfg.get_id_list_by_define.ERROR_NO_TEMPLATE then
		JumpTools.Back()
		ShowTips("STAGE_REFRESH_DATA")
	else
		ShowTips(var_3_0)
	end
end)
manager.net:Bind(54003, function(arg_4_0)
	local var_4_0 = BattleTeamPlayerTemplate.New(arg_4_0.player_info)

	BattleController.GetInstance():UpdateHeroTeam(var_4_0)
end)

local var_0_0 = {}

function var_0_0.SetComboInfo(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if BattleConst.STAGE_TYPE_NEW.POLYHEDRON == arg_5_0 then
		manager.net:Send(66038, {
			cooperate_unique_skill_id = arg_5_2
		}, 66039):next(function(arg_6_0)
			return
		end)

		arg_5_1 = PolyhedronData:GetActivityID()
	end

	BattleTeamData:SetComboInfo(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	var_0_0.PushTeamsByParams(arg_5_0, arg_5_1, arg_5_3, arg_5_4)
end

function var_0_0.PushTeamsByParams(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0, var_7_1 = BattleTeamData:GetSingleTeam(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_2, var_7_3 = BattleTeamData:GetMimirInfo(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_4 = BattleTeamData:GetComboInfo(arg_7_0, arg_7_1, arg_7_2, arg_7_3)

	var_0_0.PushTeams(arg_7_1, arg_7_0, var_7_0, var_7_1, var_7_4, {
		id = var_7_2,
		chip = var_7_3
	}, arg_7_2, arg_7_3)
end

function var_0_0.PushTeams(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5, arg_8_6, arg_8_7)
	local var_8_0 = {}
	local var_8_1 = {}
	local var_8_2 = arg_8_4 or 0
	local var_8_3 = arg_8_5 or {
		id = 0,
		chip = {}
	}
	local var_8_4 = true

	for iter_8_0 = 1, 3 do
		if arg_8_3[iter_8_0] ~= 0 then
			var_8_0[iter_8_0] = {
				hero_type = 2,
				owner_id = BattleTeamData.NO_OWNER,
				hero_id = arg_8_3[iter_8_0] or 0
			}
		else
			var_8_0[iter_8_0] = {
				hero_type = 1,
				owner_id = BattleTeamData.NO_OWNER,
				hero_id = arg_8_2[iter_8_0] or 0
			}
		end

		if var_8_0[iter_8_0].hero_id ~= 0 then
			var_8_4 = false
		end
	end

	if var_8_4 then
		return
	end

	var_0_0.PushTeamsToServer(arg_8_1, var_8_0, arg_8_0, var_8_2, var_8_3, arg_8_6, arg_8_7)
end

function var_0_0.PushTeamsToServer(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5, arg_9_6)
	local var_9_0 = arg_9_0 or 0
	local var_9_1 = GetHeroTeamActivityID(var_9_0, arg_9_2)
	local var_9_2 = arg_9_3 or 0
	local var_9_3 = {}

	if not arg_9_4 then
		var_9_3.mimir_id = 0
		var_9_3.chip_list = {}
	else
		var_9_3.mimir_id = arg_9_4.id or 0
		var_9_3.chip_list = arg_9_4.chip or {}
	end

	local var_9_4 = {
		cont_id = arg_9_5,
		teams = {
			{
				id = arg_9_6,
				hero_list = arg_9_1,
				cooperate_unique_skill_id = var_9_2 or 0,
				mimir_info = var_9_3
			}
		}
	}
	local var_9_5 = {
		stage_type = var_9_0,
		activity_id = var_9_1,
		teams_info_list = var_9_4,
		data = {
			chess_data_info_1 = {},
			chess_data_info_2 = {}
		}
	}

	manager.net:Push(63006, var_9_5)
end

function var_0_0.ChangeSelectChapterID(arg_10_0)
	local var_10_0 = getChapterClientCfgByChapterID(arg_10_0)
	local var_10_1 = getChapterToggle(var_10_0.id)

	BattleFieldData:SetCacheChapterClient(var_10_1, var_10_0.id)
	BattleFieldData:SetCacheChapter(var_10_0.id, arg_10_0)

	if var_10_1 == BattleConst.TOGGLE.PLOT or var_10_1 == BattleConst.TOGGLE.SUB_PLOT then
		manager.notify:Invoke(CHANGE_PLOT_SELECT_CHAPTER)
	end
end

function var_0_0.ChangePlotHardLevel(arg_11_0)
	BattleFieldData:ChangePlotHardLevel(arg_11_0)
	manager.notify:Invoke(CHANGE_PLOT_HARD_LEVEL)
end

return var_0_0
