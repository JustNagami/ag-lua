return {
	GetFurList = function(arg_1_0)
		local var_1_0 = {}

		for iter_1_0 = 1, #BackHomeFurnitureThemeCfg[arg_1_0].theme_id do
			local var_1_1 = BackHomeFurnitureThemeCfg[arg_1_0].theme_id[iter_1_0]

			for iter_1_1, iter_1_2 in ipairs(BackHomeFurniture.get_id_list_by_theme[var_1_1]) do
				if BackHomeFurniture[iter_1_2].is_hide == 1 then
					if DormData:GetFurNumInfo(iter_1_2).num > 0 then
						table.insert(var_1_0, iter_1_2)
					end
				else
					table.insert(var_1_0, iter_1_2)
				end
			end
		end

		for iter_1_3 = #var_1_0, 1, -1 do
			if BackHomeFurniture[var_1_0[iter_1_3]].scene_id[1] == 1 then
				table.remove(var_1_0, iter_1_3)
			end
		end

		return var_1_0
	end
}
