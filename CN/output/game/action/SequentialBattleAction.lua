local var_0_0 = {}

manager.net:Bind(61071, function(arg_1_0)
	SequentialBattleData:InitData(arg_1_0)
	var_0_0.UpdateRedPoint(arg_1_0.activity_id)
end)

function var_0_0.SaveAllTeam(arg_2_0, arg_2_1)
	ReserveAction.SaveContData(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, arg_2_0, arg_2_1)
end

function var_0_0.ResetTeam(arg_3_0, arg_3_1)
	ReserveAction.ResetContData(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE, arg_3_0, arg_3_1)
end

function var_0_0.ReceiveReward(arg_4_0, arg_4_1, arg_4_2)
	manager.net:SendWithLoadingNew(61072, {
		activty_id = arg_4_0,
		award_id = arg_4_1
	}, 61073, function(arg_5_0)
		arg_4_2(arg_5_0)
	end)
end

var_0_0.initActivityIDList_ = {}
var_0_0.refreshActivityIDList_ = {}

function var_0_0.InitRedPoint(arg_6_0)
	if table.keyof(var_0_0.initActivityIDList_, arg_6_0) then
		return
	end

	table.insert(var_0_0.initActivityIDList_, arg_6_0)

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(ActivityCfg[arg_6_0].sub_activity_list) do
		local var_6_1 = string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE, iter_6_1)

		manager.redPoint:addGroup(var_6_1, {
			string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_DAY, iter_6_1),
			string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_REWARD, iter_6_1)
		})
		table.insert(var_6_0, var_6_1)
	end

	manager.redPoint:addGroup(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE, arg_6_0), var_6_0)
end

function var_0_0.UpdateRedPoint(arg_7_0)
	var_0_0.InitRedPoint(SequentialBattleChapterCfg[arg_7_0].main_id)

	if table.keyof(var_0_0.refreshActivityIDList_, arg_7_0) == nil then
		table.insert(var_0_0.refreshActivityIDList_, arg_7_0)
	end

	local var_7_0 = ActivityData:GetActivityData(arg_7_0).stopTime
	local var_7_1 = manager.time:GetServerTime()

	if var_7_1 < var_7_0 and var_7_1 > (getData("sequentialBattle", "activityID_" .. arg_7_0) or 0) and #SequentialBattleData:GetChapterData(arg_7_0).historyFinishStage < #SequentialBattleChapterCfg[arg_7_0].stage_id then
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_DAY, arg_7_0), 1)
	else
		manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_DAY, arg_7_0), 0)
	end
end

function var_0_0.StopRedPoint(arg_8_0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_DAY, arg_8_0), 0)
	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_REWARD, arg_8_0), 0)
end

function var_0_0.ClickDayRedPoint(arg_9_0)
	local var_9_0 = string.format("%s_%s", RedPointConst.SEQUENTIAL_BATTLE_DAY, arg_9_0)

	if manager.redPoint:getTipValue(var_9_0) ~= 0 then
		manager.redPoint:setTip(var_9_0, 0)
		saveData("sequentialBattle", "activityID_" .. arg_9_0, _G.gameTimer:GetNextDayFreshTime())
	end
end

function var_0_0.ResetData(arg_10_0)
	var_0_0.initActivityIDList_ = {}
	var_0_0.refreshActivityIDList_ = {}
end

manager.notify:RegistListener(ZERO_REFRESH, function()
	for iter_11_0, iter_11_1 in pairs(var_0_0.refreshActivityIDList_) do
		var_0_0.UpdateRedPoint(iter_11_1)
	end
end)

return var_0_0
