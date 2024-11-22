local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("NewMythicHeroTeamInfoView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0.teamLength_ = arg_1_0.params_.teamLength

	var_0_1.super.OnEnter(arg_1_0)
end

function var_0_1.GetHeroHeadClass(arg_2_0)
	return NewMythicHeroTeamHeadItem
end

function var_0_1.HeadRenderer(arg_3_0, arg_3_1, arg_3_2)
	var_0_1.super.HeadRenderer(arg_3_0, arg_3_1, arg_3_2)
	arg_3_2:RefreshTeamTag(arg_3_0.params_.reserveParams.teamIndex, arg_3_0.teamLength_)
end

function var_0_1.IsInTeam(arg_4_0, arg_4_1)
	for iter_4_0 = 1, #arg_4_0.heroTeam_ do
		if arg_4_0.heroTeam_[iter_4_0] == arg_4_1 then
			return true
		end
	end

	return false
end

function var_0_1.OnJoinClick(arg_5_0)
	local var_5_0 = clone(arg_5_0.heroTeam_)
	local var_5_1 = clone(arg_5_0.heroTrialList_)
	local var_5_2 = arg_5_0:IsSameHeroInTeam(arg_5_0.selectHeroData_.id)

	if arg_5_0.selectHeroData_.id == var_5_0[arg_5_0.params_.selectHeroPos] and arg_5_0.selectHeroData_.trialID == var_5_1[arg_5_0.params_.selectHeroPos] and var_5_2 then
		var_5_0[arg_5_0.params_.selectHeroPos] = 0
		var_5_1[arg_5_0.params_.selectHeroPos] = 0
	elseif var_5_2 then
		local var_5_3 = 1

		for iter_5_0, iter_5_1 in pairs(var_5_0) do
			if iter_5_1 == arg_5_0.selectHeroData_.id then
				var_5_3 = iter_5_0

				break
			end
		end

		if var_5_0[var_5_3] == arg_5_0.selectHeroData_.id and var_5_1[var_5_3] ~= arg_5_0.selectHeroData_.trialID then
			var_5_0[var_5_3] = arg_5_0.selectHeroData_.id
			var_5_1[var_5_3] = arg_5_0.selectHeroData_.trialID
		end

		local var_5_4 = var_5_0[var_5_3]

		var_5_0[var_5_3] = var_5_0[arg_5_0.params_.selectHeroPos]
		var_5_0[arg_5_0.params_.selectHeroPos] = var_5_4

		local var_5_5 = var_5_1[var_5_3]

		var_5_1[var_5_3] = var_5_1[arg_5_0.params_.selectHeroPos]
		var_5_1[arg_5_0.params_.selectHeroPos] = var_5_5

		HeroTools.PlayTalk(arg_5_0.selectHeroData_.id, "team")
	else
		var_5_0[arg_5_0.params_.selectHeroPos] = arg_5_0.selectHeroData_.id
		var_5_1[arg_5_0.params_.selectHeroPos] = arg_5_0.selectHeroData_.trialID

		HeroTools.PlayTalk(arg_5_0.selectHeroData_.id, "team")
	end

	if arg_5_0.params_.reorder == nil or arg_5_0.params_.reorder == true then
		for iter_5_2 = 3, 1, -1 do
			if var_5_0[iter_5_2] == 0 then
				table.remove(var_5_0, iter_5_2)
				table.remove(var_5_1, iter_5_2)
			end
		end

		for iter_5_3 = 1, 3 do
			if not var_5_0[iter_5_3] then
				var_5_0[iter_5_3] = 0
				var_5_1[iter_5_3] = 0
			end
		end
	end

	arg_5_0:ExitFunc(var_5_0, var_5_1)
end

function var_0_1.ExitFunc(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0:ChangeTeam(arg_6_1, arg_6_2)

	if arg_6_0.heroAvatarView_ then
		arg_6_0.heroAvatarView_:RemoveTween()
	end

	arg_6_0:Back()
end

function var_0_1.ChangeTeam(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}

	for iter_7_0 = 1, 3 do
		if arg_7_1[iter_7_0] ~= 0 then
			var_7_0[#var_7_0 + 1] = arg_7_1[iter_7_0]
		end
	end

	for iter_7_1 = #var_7_0 + 1, 3 do
		var_7_0[iter_7_1] = 0
	end

	local var_7_1 = ComboSkillTools.GetRecommendSkillID(var_7_0, true)
	local var_7_2, var_7_3 = ReserveTools.GetMimirData(arg_7_0.params_.reserveParams)

	ReserveTools.SetTeam(arg_7_0.params_.reserveParams, var_7_0, arg_7_2 or {}, var_7_1, var_7_2, var_7_3)
end

return var_0_1
