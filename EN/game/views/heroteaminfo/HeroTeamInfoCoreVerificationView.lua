local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("HeroTeamInfoCoreVerificationView", var_0_0)

function var_0_1.GetHeroList(arg_1_0)
	local var_1_0 = HeroTools.Sort(HeroData:GetHeroList())
	local var_1_1 = {}
	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if table.keyof(arg_1_0.lockHeroList_, iter_1_1) then
			table.insert(var_1_1, iter_1_1)
		else
			table.insert(var_1_2, iter_1_1)
		end
	end

	table.insertto(var_1_1, var_1_2)

	for iter_1_2 = 3, 1, -1 do
		if arg_1_0.heroTeam_[iter_1_2] ~= 0 then
			table.removebyvalue(var_1_1, arg_1_0.heroTeam_[iter_1_2])
			table.insert(var_1_1, 1, arg_1_0.heroTeam_[iter_1_2])
		end
	end

	return var_1_1
end

function var_0_1.OnJoinClick(arg_2_0)
	local var_2_0 = arg_2_0.heroTeam_
	local var_2_1 = arg_2_0.heroTrialList_
	local var_2_2 = arg_2_0:IsSameHeroInTeam(arg_2_0.selectHeroData_.id)

	if arg_2_0.selectHeroData_.id == var_2_0[arg_2_0.params_.selectHeroPos] and arg_2_0.selectHeroData_.trialID == var_2_1[arg_2_0.params_.selectHeroPos] and var_2_2 then
		var_2_0[arg_2_0.params_.selectHeroPos] = 0
		var_2_1[arg_2_0.params_.selectHeroPos] = 0
	elseif var_2_2 then
		local var_2_3 = 1

		for iter_2_0, iter_2_1 in pairs(var_2_0) do
			if iter_2_1 == arg_2_0.selectHeroData_.id then
				var_2_3 = iter_2_0

				break
			end
		end

		if var_2_0[var_2_3] == arg_2_0.selectHeroData_.id and var_2_1[var_2_3] ~= arg_2_0.selectHeroData_.trialID then
			var_2_0[var_2_3] = arg_2_0.selectHeroData_.id
			var_2_1[var_2_3] = arg_2_0.selectHeroData_.trialID
		end

		local var_2_4 = var_2_0[var_2_3]

		var_2_0[var_2_3] = var_2_0[arg_2_0.params_.selectHeroPos]
		var_2_0[arg_2_0.params_.selectHeroPos] = var_2_4

		local var_2_5 = var_2_1[var_2_3]

		var_2_1[var_2_3] = var_2_1[arg_2_0.params_.selectHeroPos]
		var_2_1[arg_2_0.params_.selectHeroPos] = var_2_5

		HeroTools.PlayTalk(arg_2_0.selectHeroData_.id, "team")
	else
		local var_2_6 = CoreVerificationData:GetLockHeroByInfoID(arg_2_0.params_.activityID, true)
		local var_2_7 = #var_2_6

		for iter_2_2, iter_2_3 in pairs(arg_2_0.heroTeam_) do
			if not table.keyof(var_2_6, iter_2_3) and iter_2_3 ~= 0 and iter_2_2 ~= arg_2_0.params_.selectHeroPos then
				var_2_7 = var_2_7 + 1
			end
		end

		if not table.keyof(var_2_6, arg_2_0.selectHeroData_.id) then
			var_2_7 = var_2_7 + 1
		end

		if var_2_7 > 6 then
			ShowTips(GetTips("ACTIVITY_CORE_VERIFICATION_HERO_LOCKED"))

			return
		end

		var_2_0[arg_2_0.params_.selectHeroPos] = arg_2_0.selectHeroData_.id
		var_2_1[arg_2_0.params_.selectHeroPos] = arg_2_0.selectHeroData_.trialID

		HeroTools.PlayTalk(arg_2_0.selectHeroData_.id, "team")
	end

	if arg_2_0.params_.reorder == nil or arg_2_0.params_.reorder == true then
		for iter_2_4 = 3, 1, -1 do
			if var_2_0[iter_2_4] == 0 then
				table.remove(var_2_0, iter_2_4)
				table.remove(var_2_1, iter_2_4)
			end
		end

		for iter_2_5 = 1, 3 do
			if not var_2_0[iter_2_5] then
				var_2_0[iter_2_5] = 0
				var_2_1[iter_2_5] = 0
			end
		end
	end

	arg_2_0:TryToChangeTeam(var_2_0, var_2_1)
end

return var_0_1
