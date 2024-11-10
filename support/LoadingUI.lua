local var_0_0 = {}

function var_0_0.LoadingShow(arg_1_0, arg_1_1)
	if LoadingUIType.Battle == arg_1_1 then
		local var_1_0 = false
		local var_1_1 = BattleController.GetInstance():GetBattleStageData()

		if not var_1_1 then
			LoadingUIManager.inst:UpdateLoadingInfo("", "", nil)
		end

		local var_1_2 = var_1_1:GetStageId()
		local var_1_3 = var_1_1:GetType()

		if BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MYTHIC == var_1_3 then
			local var_1_4 = var_1_1:GetDest()

			var_1_0 = MythicData:GetIsFirstClear(var_1_4)
		elseif BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_TOWER == var_1_3 then
			var_1_0 = true
		else
			local var_1_5 = BattleStageData:GetStageData()[var_1_2]

			if var_1_5 then
				var_1_0 = var_1_5.clear_times <= 0
			end
		end

		if var_1_0 and LoadingTipsStage[var_1_2] then
			LoadingUIManager.inst:UpdateLoadingInfo(GetI18NText(LoadingTipsStage[var_1_2].title), GetI18NText(LoadingTipsStage[var_1_2].tips), LoadingTipsStage[var_1_2].loading_picture)
		else
			var_0_0:ChooseRandom()
		end
	elseif LoadingUIType.Main == arg_1_1 then
		var_0_0:ChooseRandom()
	elseif LoadingUIType.GameStart == arg_1_1 then
		LoadingUIManager.inst:UpdateLoadingInfo("", "", nil)
	else
		var_0_0:ChooseRandom()
	end
end

function var_0_0.ChooseRandom(arg_2_0)
	local var_2_0, var_2_1, var_2_2, var_2_3 = IllustratedData:GetRandomTips()

	if var_2_3 then
		LoadingUIManager.inst:UpdateLoadingInfo(var_2_0, var_2_1, var_2_2)
	else
		LoadingUIManager.inst:UpdateLoadingInfo2(var_2_0, var_2_1, var_2_2)
	end
end

function var_0_0.GetRandomTips(arg_3_0)
	local var_3_0 = math.random(1, #LoadingTipsPoolCfg.all)
	local var_3_1 = LoadingTipsPoolCfg.all[var_3_0]
	local var_3_2 = LoadingTipsPoolCfg[var_3_1]
	local var_3_3 = var_3_2.loading_picture

	if not var_3_3 or var_3_3 == "" then
		local var_3_4 = math.random(1, #LoadingTipsPicturePoolCfg.all)
		local var_3_5 = LoadingTipsPicturePoolCfg.all[var_3_4]

		var_3_3 = LoadingTipsPicturePoolCfg[var_3_5].loading_picture
	end

	return var_3_2.title, var_3_2.tips, var_3_3
end

function var_0_0.GetRandomTips2(arg_4_0)
	local var_4_0 = IllustratedData:GetAllLoadingSet()
	local var_4_1 = math.random(1, #var_4_0)
	local var_4_2 = CollectPictureCfg[var_4_0[var_4_1]]

	return var_4_2.name, var_4_2.desc, var_4_2.picture
end

LoadingUIManager.inst:SetLoadingShowAction(handler(var_0_0, var_0_0.LoadingShow))

return var_0_0
