local var_0_0 = {}

function var_0_0.SortChatSticker(arg_1_0)
	local var_1_0 = clone(ChatStickerCfg.get_id_list_by_category[arg_1_0])

	return var_0_0.SortFunction(var_1_0)
end

function var_0_0.SortAllChatSticker()
	local var_2_0 = clone(ChatStickerCfg.all)

	table.removebyvalue(var_2_0, 0)

	return var_0_0.SortFunction(var_2_0)
end

function var_0_0.SortFunction(arg_3_0)
	if arg_3_0 == nil then
		return {}
	end

	table.sort(arg_3_0, function(arg_4_0, arg_4_1)
		local var_4_0 = ChatStickerCfg[arg_4_0]
		local var_4_1 = ChatStickerCfg[arg_4_1]
		local var_4_2 = var_4_0.free == 0 and ChatStickerData:IsLockSticker(arg_4_0)
		local var_4_3 = var_4_1.free == 0 and ChatStickerData:IsLockSticker(arg_4_1)

		if var_4_2 == var_4_3 then
			return arg_4_0 < arg_4_1
		end

		return var_4_3 and true or false
	end)

	return arg_3_0
end

return var_0_0
