local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("HeroTeamInfoBossView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0.bossIndex_ = arg_1_0.params_.bossIndex

	var_0_1.super.OnEnter(arg_1_0)
end

function var_0_1.HeadRenderer(arg_2_0, arg_2_1, arg_2_2)
	var_0_1.super.HeadRenderer(arg_2_0, arg_2_1, arg_2_2)

	local var_2_0 = arg_2_0.heroDataList_[arg_2_1].id

	arg_2_2:SetHeroLock(table.keyof(arg_2_0.lockHeroList_, var_2_0) ~= nil)
	arg_2_2:SetChallengeFlag(arg_2_0:IsCurrentBossLock(var_2_0))
end

function var_0_1.GetDefaultHeroData(arg_3_0)
	local var_3_0 = SectionSelectHeroTools.GetCurSelectHeroData()

	if var_3_0 and var_3_0.id ~= 0 then
		return var_3_0
	end

	local var_3_1 = arg_3_0.heroTeam_[arg_3_0.params_.selectHeroPos] or 0

	if var_3_1 == 0 then
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.heroDataList_) do
			local var_3_2 = iter_3_1.id

			if not arg_3_0:IsInTeam(var_3_2, iter_3_1.trialID) and not table.keyof(arg_3_0.lockHeroList_, var_3_2) then
				return iter_3_1
			end
		end
	end

	if var_3_1 == 0 and #arg_3_0.heroDataList_ > 0 then
		return arg_3_0.heroDataList_[1]
	end

	return {
		trialID = 0,
		id = var_3_1,
		type = HeroConst.HERO_DATA_TYPE.DEFAULT,
		heroViewProxy = arg_3_0:GetHeroViewProxy(HeroConst.HERO_DATA_TYPE.DEFAULT)
	}
end

function var_0_1.GetHeroList(arg_4_0)
	local var_4_0 = HeroTools.Sort(HeroData:GetHeroList())
	local var_4_1 = {}
	local var_4_2 = {}
	local var_4_3 = {}
	local var_4_4 = BossTools.GetLockHero()[arg_4_0.bossIndex_]

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		if table.keyof(var_4_4, iter_4_1) then
			table.insert(var_4_1, iter_4_1)
		elseif table.keyof(arg_4_0.lockHeroList_, iter_4_1) then
			table.insert(var_4_2, iter_4_1)
		else
			table.insert(var_4_3, iter_4_1)
		end
	end

	table.insertto(var_4_1, var_4_3)
	table.insertto(var_4_1, var_4_2)

	for iter_4_2 = 3, 1, -1 do
		if arg_4_0.heroTeam_[iter_4_2] ~= 0 then
			table.removebyvalue(var_4_1, arg_4_0.heroTeam_[iter_4_2])
			table.insert(var_4_1, 1, arg_4_0.heroTeam_[iter_4_2])
		end
	end

	return var_4_1
end

function var_0_1.IsCurrentBossLock(arg_5_0, arg_5_1)
	local var_5_0 = BossTools.GetLockHero()[arg_5_0.bossIndex_]

	return table.keyof(var_5_0, arg_5_1) ~= nil
end

return var_0_1
