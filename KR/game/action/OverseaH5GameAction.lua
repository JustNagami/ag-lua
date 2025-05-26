local var_0_0 = {}
local var_0_1 = false

manager.net:Bind(72999, function(arg_1_0)
	OverseaH5GameData:InitData(arg_1_0)

	if not var_0_1 then
		var_0_1 = true

		var_0_0.InitRedpointConst()
	end

	var_0_0.UpdateRedpoint(arg_1_0.activity_id)
end)

function var_0_0.EnterGame(arg_2_0)
	local var_2_0 = OverseaH5GameData:GetActivityID()

	if not OverseaH5GameTools.CheckLevel(var_2_0) then
		return
	end

	local var_2_1, var_2_2, var_2_3 = OverseaH5GameData:GetUrl()

	if var_2_1 then
		OperationAction.OpenUrl(var_2_1, var_2_2, var_2_3)
	end

	var_0_0.SetEntered(var_2_0)
	SDKTools.SendMessageToSDK("oversea_H5_game_enter", {
		way = arg_2_0
	})
end

function var_0_0.SetEntered(arg_3_0)
	local var_3_0 = {
		activity_id = arg_3_0
	}

	manager.net:Push(72998, var_3_0)
	OverseaH5GameData:SetEntered(arg_3_0)
	var_0_0.UpdateRedpoint(arg_3_0)
end

function var_0_0.UpdateRedpoint(arg_4_0)
	local var_4_0 = 0

	if not OverseaH5GameData:GetEntered(arg_4_0) then
		var_4_0 = 1
	end

	manager.redPoint:setTip(string.format("%s_%s", RedPointConst.OVERSEA_H5_GAME, arg_4_0), var_4_0)
end

function var_0_0.InitRedpointConst()
	local var_5_0 = ActivityCfg.get_id_list_by_activity_template[ActivityTemplateConst.OVERSEA_H5_GAME]
	local var_5_1 = {}

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		var_5_1[#var_5_1 + 1] = string.format("%s_%s", RedPointConst.OVERSEA_H5_GAME, iter_5_1)
	end

	manager.redPoint:addGroup(RedPointConst.OVERSEA_H5_GAME, var_5_1)
end

return var_0_0
