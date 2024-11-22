local var_0_0 = import("game.reserve.template.ReserveBaseTemplate")
local var_0_1 = class("ReserveSequentialBattleTemplate", var_0_0)

function var_0_1.GetLockHero(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.contID
	local var_1_1 = arg_1_1.teamIndex

	for iter_1_0 = 1, #SequentialBattleChapterCfg[var_1_0].stage_id do
		if iter_1_0 ~= var_1_1 then
			local var_1_2 = arg_1_0:GetContDataTemplateById(arg_1_1.contID):GetHeroList(iter_1_0)

			for iter_1_1, iter_1_2 in ipairs(var_1_2) do
				local var_1_3 = iter_1_2:GetHeroID()

				if var_1_3 ~= 0 then
					table.insert(arg_1_2.lockHeroList, var_1_3)
				end
			end
		end
	end
end

function var_0_1.CheckHeroTeam(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1
	local var_2_1 = arg_2_2
	local var_2_2 = arg_2_0:GetContDataTemplateById(var_2_0):GetHeroList(var_2_1)
	local var_2_3 = GetTrialHeroList(_, _, arg_2_1)
	local var_2_4 = false

	for iter_2_0, iter_2_1 in pairs(var_2_2) do
		local var_2_5 = iter_2_1:GetTrialID()

		if var_2_5 ~= 0 and not table.keyof(var_2_3, var_2_5) then
			iter_2_1:SetHeroID(0)
			iter_2_1:SetTrialID(0)

			var_2_4 = true
		end
	end

	if var_2_4 then
		arg_2_0:SaveEnabledBuff(arg_2_1, arg_2_2)
	end
end

function var_0_1.SaveEnabledBuff(arg_3_0, arg_3_1, arg_3_2)
	for iter_3_0 = 1, #SequentialBattleChapterCfg[arg_3_1].stage_id do
		arg_3_0:RefreshEnabeldBuff(arg_3_1, arg_3_2)
	end
end

function var_0_1.RefreshEnabeldBuff(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1
	local var_4_1 = arg_4_2
	local var_4_2 = arg_4_0:GetContDataTemplateById(var_4_0)
	local var_4_3 = var_4_2:GetHeroList(var_4_1)
	local var_4_4 = SequentialBattleChapterCfg[arg_4_1].main_id
	local var_4_5 = SequentialBattleBuffCfg.get_id_list_by_activity_id[var_4_4]
	local var_4_6 = {}

	for iter_4_0, iter_4_1 in pairs(var_4_3) do
		local var_4_7 = iter_4_1:GetHeroID()

		if var_4_7 and var_4_7 ~= 0 then
			table.insert(var_4_6, var_4_7)
		end
	end

	local var_4_8 = {}

	for iter_4_2, iter_4_3 in ipairs(var_4_5) do
		local var_4_9 = SequentialBattleBuffCfg[iter_4_3].type
		local var_4_10 = SequentialBattleTools.GetConditionStatus(var_4_6, var_4_9)
		local var_4_11 = true

		for iter_4_4, iter_4_5 in ipairs(var_4_9) do
			if var_4_10[iter_4_4] < iter_4_5[3] then
				var_4_11 = false

				break
			end
		end

		if var_4_11 then
			table.insert(var_4_8, iter_4_3)
		end
	end

	var_4_2:SetAffixList(var_4_1, var_4_8)
end

return var_0_1
