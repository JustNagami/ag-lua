local var_0_0 = {
	ExitGame = function()
		DestroyLua()
		LuaExchangeHelper.GoToMain()
	end,
	GetSubActiveID = function(arg_2_0)
		return ActivityCfg[arg_2_0] and ActivityCfg[arg_2_0].sub_activity_list or nil
	end,
	ReStartGame = function(arg_3_0)
		BlisterGameLuaBridge.ReStartGame()
	end
}

function var_0_0.GetSessionIsLock(arg_4_0, arg_4_1)
	local var_4_0 = ActivitySummerChessConditionCfg.get_id_list_by_activity_id[arg_4_0]

	if var_4_0 then
		local var_4_1 = var_4_0[arg_4_1]

		return var_0_0.GetSessionIsLockByID(var_4_1)
	end

	return false
end

function var_0_0.GetSessionIsLockByID(arg_5_0)
	local var_5_0 = ActivitySummerChessConditionCfg[arg_5_0]

	return not IsConditionAchieved(var_5_0 and var_5_0.condition or 0)
end

function var_0_0.GetSession(arg_6_0, arg_6_1)
	local var_6_0 = ActivitySummerChessConditionCfg.get_id_list_by_activity_id[arg_6_0]

	if var_6_0 then
		return var_6_0[arg_6_1]
	end

	return 0
end

return var_0_0
