﻿local var_0_0 = {}

function var_0_0.GetJumpDataByEquipSpecialType(arg_1_0, arg_1_1)
	local var_1_0 = SystemLinkActivityCfg.all or {}

	if #var_1_0 == 0 then
		return {}
	end

	print(arg_1_1, "  GetJumpDataByEquipSpecialType")

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		local var_1_1, var_1_2 = var_0_0.CheckRouletteHasEquip(arg_1_1, iter_1_1)

		if var_1_1 then
			return var_1_2
		end
	end
end

function var_0_0.CheckRouletteHasEquip(arg_2_0, arg_2_1)
	if ActivityData:GetActivityIsOpen(arg_2_1) then
		local var_2_0 = ActivityPtRouletteStageCfg.get_id_list_by_activity_id[arg_2_1] or {}

		for iter_2_0, iter_2_1 in ipairs(var_2_0) do
			if ActivityPtRouletteStageCfg[iter_2_1] then
				local var_2_1 = ActivityPtRouletteStageCfg[iter_2_1].roulette_id

				for iter_2_2, iter_2_3 in ipairs(var_2_1) do
					local var_2_2 = ActivityPtRouletteRandomCfg[iter_2_3] and ActivityPtRouletteRandomCfg[iter_2_3].equip_suit_list or {}

					if EquipCfg[arg_2_0] then
						local var_2_3 = EquipCfg[arg_2_0].suit

						if table.indexof(var_2_2, var_2_3) then
							local var_2_4 = SystemLinkActivityCfg[arg_2_1].system_link_data

							return true, var_2_4
						end
					end
				end
			end
		end
	end

	return false, {}
end

function var_0_0.GetJumpDataByHeroSpecialType(arg_3_0)
	local var_3_0 = DrawTools.GetNowAllRolePool()
	local var_3_1 = {
		ViewConst.JUMP_SPECIAL_ID.HERO_NORMAL_SOURCE,
		[3] = ViewConst.JUMP_SPECIAL_ID.HERO_LIMIT_SOURCE,
		[5] = ViewConst.JUMP_SPECIAL_ID.NEW_PLAYER_DRAW,
		[6] = ViewConst.JUMP_SPECIAL_ID.LIMIT_MUST_DRAW,
		[7] = ViewConst.JUMP_SPECIAL_ID.HERO_AGAIN,
		[8] = ViewConst.JUMP_SPECIAL_ID.NEW_PLAYER_DRAW
	}
	local var_3_2 = {}

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		local var_3_3 = DrawPoolCfg[iter_3_1]
		local var_3_4 = var_3_3.excluded_group

		if var_3_3 then
			local var_3_5 = var_3_3.pool_type
			local var_3_6 = var_3_3.pool_show_type
			local var_3_7 = var_3_3.pool_draw_range_type
			local var_3_8 = DrawSettingCfg[var_3_7]

			if var_3_8 then
				local var_3_9 = var_3_8.pool_id

				if var_3_9 ~= "" then
					for iter_3_2, iter_3_3 in pairs(var_3_9) do
						local var_3_10 = DrawItemCfg.get_id_list_by_pool_id[iter_3_3] or {}

						for iter_3_4, iter_3_5 in ipairs(var_3_10) do
							local var_3_11 = DrawItemCfg[iter_3_5] and DrawItemCfg[iter_3_5].item_id or 0

							if (ItemCfg[arg_3_0] and ItemCfg[arg_3_0].hero_id or 0) == var_3_11 and not var_3_2[var_3_6] and SystemLinkCfg[var_3_1[var_3_6]] then
								if var_3_5 == 8 then
									if not DrawData:GetNewbieChooseDrawFlag() then
										var_3_2[var_3_6] = {
											var_3_1[var_3_6],
											iter_3_1
										}
									end
								elseif var_3_4[1][1] and var_3_4[1][1] == var_3_11 then
									-- block empty
								else
									var_3_2[var_3_6] = {
										var_3_1[var_3_6],
										iter_3_1
									}
								end
							end
						end
					end
				end
			end
		end
	end

	local var_3_12 = {}

	for iter_3_6, iter_3_7 in pairs(var_3_2) do
		table.insert(var_3_12, iter_3_7)
	end

	return #var_3_12 > 0, var_3_12
end

function var_0_0.GetJumpDataByServantSpecialType(arg_4_0)
	local var_4_0 = DrawTools.GetNowAllServantPool()
	local var_4_1 = {
		[2] = ViewConst.JUMP_SPECIAL_ID.SERVANT_NORMAL_SOURCE
	}
	local var_4_2 = {}

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		local var_4_3 = DrawPoolCfg[iter_4_1]

		if var_4_3 then
			local var_4_4 = var_4_3.pool_type
			local var_4_5 = var_4_3.pool_show_type
			local var_4_6 = var_4_3.pool_draw_range_type
			local var_4_7 = DrawSettingCfg[var_4_6]

			if var_4_7 then
				local var_4_8 = var_4_7.pool_id

				if var_4_8 ~= "" then
					for iter_4_2, iter_4_3 in pairs(var_4_8) do
						local var_4_9 = DrawItemCfg.get_id_list_by_pool_id[iter_4_3] or {}

						for iter_4_4, iter_4_5 in ipairs(var_4_9) do
							if DrawItemCfg[iter_4_5] and DrawItemCfg[iter_4_5].item_id == arg_4_0 and not var_4_2[var_4_5] and SystemLinkCfg[var_4_1[var_4_5]] then
								var_4_2[var_4_5] = {
									var_4_1[var_4_5],
									iter_4_1
								}
							end
						end
					end
				end
			end
		end
	end

	local var_4_10 = {}

	for iter_4_6, iter_4_7 in pairs(var_4_2) do
		table.insert(var_4_10, iter_4_7)
	end

	return #var_4_10 > 0, var_4_10
end

function var_0_0.GetGodEaterSourece(arg_5_0)
	if not ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_GODEATER_SERVANT) then
		return false, {}
	end

	local var_5_0 = DrawTools.GetNowAllServantPool()
	local var_5_1 = {
		[9] = ViewConst.JUMP_SPECIAL_ID.GODEATER_SPECIAL_SERVANT
	}
	local var_5_2 = {}

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		local var_5_3 = DrawPoolCfg[iter_5_1]

		if var_5_3 then
			local var_5_4 = var_5_3.pool_type
			local var_5_5 = var_5_3.pool_show_type
			local var_5_6 = var_5_3.pool_draw_range_type
			local var_5_7 = var_5_3.pool_selected_type
			local var_5_8 = DrawSettingCfg[var_5_6]

			if var_5_4 == 2 and var_5_7 == 9 and iter_5_1 ~= 10002 and not var_5_2[var_5_7] and SystemLinkCfg[var_5_1[var_5_7]] then
				var_5_2[var_5_7] = {
					var_5_1[var_5_7],
					iter_5_1
				}
			end
		end
	end

	if not var_5_2[9] then
		var_5_2[9] = {
			var_5_1[9],
			1001
		}
	end

	local var_5_9 = {}

	for iter_5_2, iter_5_3 in pairs(var_5_2) do
		table.insert(var_5_9, iter_5_3)
	end

	return #var_5_9 > 0, var_5_9
end

return var_0_0
