return {
	CheckLevel = function(arg_1_0)
		local var_1_0 = ActivityH5GameOverseaCfg.get_id_list_by_activity_id[arg_1_0][1]
		local var_1_1 = ActivityH5GameOverseaCfg[var_1_0].limit_level

		if var_1_1 > PlayerData:GetPlayerInfo().userLevel then
			ShowTips(string.format(GetTips("PLAYER_LEVEL_UNLOCK"), var_1_1))

			return false
		else
			return true
		end
	end
}
