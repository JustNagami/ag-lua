local var_0_0 = import("game.reserve.template.ReserveBaseTemplate")
local var_0_1 = class("ReserveBossChallengeTemplate", var_0_0)

function var_0_1.FilterInvalidTeamData(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = 1
	local var_1_1 = clone(arg_1_2.resultHeroList)

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		if iter_1_1 ~= 0 and not table.keyof(arg_1_2.lockHeroList, iter_1_1) then
			arg_1_2.resultHeroList[var_1_0] = iter_1_1
			var_1_0 = var_1_0 + 1
		elseif table.keyof(arg_1_2.lockHeroList, iter_1_1) then
			arg_1_2.isInVaild = true
			arg_1_2.resultHeroList[var_1_0] = 0
		end
	end
end

function var_0_1.GetLockHero(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1.customData.bossIndex
	local var_2_1 = BossTools.GetLockHero()

	for iter_2_0, iter_2_1 in pairs(var_2_1) do
		if iter_2_0 ~= var_2_0 then
			table.insertto(arg_2_2.lockHeroList, iter_2_1)
		end
	end
end

return var_0_1
