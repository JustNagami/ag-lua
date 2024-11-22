local var_0_0 = {}

manager.net:Bind(72201, function(arg_1_0)
	local var_1_0 = arg_1_0.activity_id

	if not HeroClueData:IsInited(var_1_0) then
		var_0_0.InitRedConst(var_1_0)
	end

	HeroClueData:InitData(arg_1_0)
	var_0_0.UpdateDrawRedPoint(var_1_0)
	var_0_0.UpdateNewClueRedPoint(var_1_0)
end)

function var_0_0.Draw(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = {
		clue_pool_id = arg_2_1,
		open_num = arg_2_2
	}

	manager.net:SendWithLoadingNew(72202, var_2_0, 72203, function(arg_3_0)
		if isSuccess(arg_3_0.result) then
			local var_3_0 = arg_3_0.clue_list

			for iter_3_0, iter_3_1 in ipairs(var_3_0) do
				HeroClueData:SetUnlockClue(iter_3_1, 1)
			end

			var_0_0.UpdateDrawRedPoint(arg_2_0)
			var_0_0.UpdateNewClueRedPoint(arg_2_0)
			manager.notify:CallUpdateFunc(HERO_CLUE_DRAW, var_3_0)
		else
			ShowTips(arg_3_0.result)
		end
	end)
end

function var_0_0.InitRedConst(arg_4_0)
	local var_4_0 = HeroClueTools.GetTaskActivityID(arg_4_0)
	local var_4_1 = HeroClueTools.GetPlayTaskActivityID(arg_4_0)
	local var_4_2 = string.format("%s_%d", RedPointConst.ACTIVITY_TASK, var_4_0)
	local var_4_3 = string.format("%s_%d", RedPointConst.ACTIVITY_TASK, var_4_1)
	local var_4_4 = string.format("%s_%d", RedPointConst.HERO_CLUE_DRAW, arg_4_0)
	local var_4_5 = string.format("%s_%d", RedPointConst.HERO_CLUE_PLAY, arg_4_0)

	manager.redPoint:addGroup(var_4_5, {
		var_4_3,
		var_4_4
	})
	manager.redPoint:addGroup(string.format("%s_%d", RedPointConst.HERO_CLUE, arg_4_0), {
		var_4_2,
		var_4_5
	})
end

function var_0_0.UpdateDrawRedPoint(arg_5_0)
	local var_5_0 = 0
	local var_5_1 = HeroCluePoolCfg.get_id_list_by_activity_id[arg_5_0][1]
	local var_5_2 = HeroClueCfg.get_id_list_by_clue_pool[var_5_1]
	local var_5_3 = HeroClueData:GetUnlockClueDataDic()
	local var_5_4 = HeroCluePoolCfg[var_5_1].item_id

	if ItemTools.getItemNum(var_5_4) >= 1 then
		for iter_5_0, iter_5_1 in ipairs(var_5_2) do
			local var_5_5 = var_5_3[iter_5_1]

			if var_5_5 ~= nil then
				if #HeroClueCfg[iter_5_1].level > var_5_5.level then
					var_5_0 = 1

					break
				end
			else
				var_5_0 = 1

				break
			end
		end
	end

	manager.redPoint:setTip(string.format("%s_%d", RedPointConst.HERO_CLUE_DRAW, arg_5_0), var_5_0)
end

function var_0_0.UpdateNewClueRedPoint(arg_6_0)
	local var_6_0 = HeroCluePoolCfg.get_id_list_by_activity_id[arg_6_0][1]
	local var_6_1 = HeroClueCfg.get_id_list_by_clue_pool[var_6_0]
	local var_6_2 = HeroClueData:GetNewClueDic()

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_3 = var_6_2[iter_6_1] == true
		local var_6_4 = HeroClueData:GetSelectedClue(arg_6_0, iter_6_1) == true
		local var_6_5 = 0
		local var_6_6 = var_6_3 and (not var_6_4 and 1 or 0) or 0

		manager.redPoint:setTip(string.format("%s_%s_%s", RedPointConst.HERO_CLUE_NEW, arg_6_0, iter_6_1), var_6_6)
	end
end

return var_0_0
