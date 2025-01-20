local var_0_0 = import("game.reserve.template.ReserveBaseTemplate")
local var_0_1 = class("ReserveAreaBattleTemplate", var_0_0)

function var_0_1.GetLockHero(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1.customData.data
	local var_1_1 = arg_1_1.customData.difficult

	if var_1_0.difficultList[var_1_1] and var_1_0.difficultList[var_1_1][arg_1_1.customData.stageID] then
		-- block empty
	else
		for iter_1_0, iter_1_1 in pairs(arg_1_1.customData.data.difficultList[arg_1_1.customData.difficult] or {}) do
			if iter_1_1.stageID ~= arg_1_1.customData.stageID then
				for iter_1_2, iter_1_3 in ipairs(iter_1_1.usedHeroList) do
					table.insert(arg_1_2.lockHeroList, iter_1_3)

					if iter_1_3 > 10000 then
						table.insert(arg_1_2.lockHeroList, iter_1_3 % 10000)
					end
				end
			end
		end
	end
end

return var_0_1
