return {
	GetCfgStageImage = function(arg_1_0)
		local var_1_0 = "TextureBg/Version/SummerUI_3_3/SummerUI_3_3_PreheatUI/"
		local var_1_1 = arg_1_0.pic_name

		return getSpriteWithoutAtlas(var_1_0 .. var_1_1)
	end,
	GetCfgMainActivityId = function(arg_2_0)
		return ActivityTools.GetMainActivityId(arg_2_0.activity_id)
	end,
	GetCfgIdList = function(arg_3_0)
		local var_3_0 = {}

		if ActivitySummerSwimsuitPreheatCfg then
			local var_3_1 = ActivitySummerSwimsuitPreheatCfg.get_id_list_by_activity_id[arg_3_0]

			for iter_3_0, iter_3_1 in ipairs(var_3_1 or {}) do
				table.insert(var_3_0, iter_3_1)
			end

			local var_3_2 = ActivityCfg[arg_3_0]

			for iter_3_2, iter_3_3 in ipairs(var_3_2.sub_activity_list) do
				local var_3_3 = ActivitySummerSwimsuitPreheatCfg.get_id_list_by_activity_id[iter_3_3]

				table.insert(var_3_0, var_3_3[1])
			end
		end

		return var_3_0
	end
}
