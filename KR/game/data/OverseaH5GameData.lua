local var_0_0 = singletonClass("OverseaH5GameData")

function var_0_0.Init(arg_1_0)
	arg_1_0.activityID_ = 0
	arg_1_0.sign_uid = ""
end

function var_0_0.InitData(arg_2_0, arg_2_1)
	arg_2_0.activityID_ = arg_2_1.activity_id
	arg_2_0.sign_uid = arg_2_1.sign_uid
end

function var_0_0.GetActivityID(arg_3_0)
	return arg_3_0.activityID_
end

function var_0_0.GetIsOpen(arg_4_0)
	if arg_4_0.activityID_ == 0 then
		return false
	end

	return ActivityData:GetActivityIsOpen(arg_4_0.activityID_)
end

function var_0_0.GetUrl(arg_5_0)
	local var_5_0 = ActivityH5GameOverseaCfg.get_id_list_by_activity_id[arg_5_0.activityID_][1]
	local var_5_1 = ActivityH5GameOverseaCfg[var_5_0]
	local var_5_2 = var_5_1.url
	local var_5_3 = var_5_1.url_open
	local var_5_4

	if SDKTools.GetIsTw() then
		var_5_4 = PlayerData:GetPlayerInfo().signUserId
	else
		var_5_4 = arg_5_0.sign_uid
	end

	return string.format(var_5_2, PlayerData:GetPlayerInfo().userID, var_5_4), var_5_3, var_5_1.screenOrientation
end

function var_0_0.SetEntered(arg_6_0, arg_6_1)
	saveData("oversea_H5_game", string.format("oversea_H5_game_enter_%s", arg_6_1), true)
end

function var_0_0.GetEntered(arg_7_0, arg_7_1)
	return getData("oversea_H5_game", string.format("oversea_H5_game_enter_%s", arg_7_1))
end

return var_0_0
