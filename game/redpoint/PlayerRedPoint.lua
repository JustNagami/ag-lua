return {
	Init = function(arg_1_0)
		arg_1_0.palyerPrefsPrefix = "playerRedPoint"
	end,
	SetStickerUnlock = function(arg_2_0, arg_2_1)
		local var_2_0 = getData(arg_2_0.palyerPrefsPrefix, "stickerUnlock") or {}
		local var_2_1 = {}

		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			var_2_1[iter_2_1] = iter_2_0
		end

		if not var_2_1[arg_2_1] then
			table.insert(var_2_0, arg_2_1)
			saveData(arg_2_0.palyerPrefsPrefix, "stickerUnlock", var_2_0)
			manager.redPoint:setTip(RedPointConst.STICKER_UNLOCK .. "_" .. arg_2_1, 1)
		end
	end,
	CancelStickerUnlock = function(arg_3_0, arg_3_1)
		local var_3_0 = getData(arg_3_0.palyerPrefsPrefix, "stickerUnlock") or {}
		local var_3_1 = {}

		for iter_3_0, iter_3_1 in ipairs(var_3_0) do
			var_3_1[iter_3_1] = iter_3_0
		end

		if var_3_1[arg_3_1] then
			table.remove(var_3_0, var_3_1[arg_3_1])
			saveData(arg_3_0.palyerPrefsPrefix, "stickerUnlock", var_3_0)
			manager.redPoint:setTip(RedPointConst.STICKER_UNLOCK .. "_" .. arg_3_1, 0)
		end
	end,
	DispatchAllStickerUnlock = function(arg_4_0)
		local var_4_0 = getData(arg_4_0.palyerPrefsPrefix, "stickerUnlock") or {}

		for iter_4_0, iter_4_1 in ipairs(var_4_0) do
			manager.redPoint:setTip(RedPointConst.STICKER_UNLOCK .. "_" .. iter_4_1, 1)
		end
	end
}
