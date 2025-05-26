local var_0_0 = import("game.views.heroTeamInfo.NewHeroTeamInfoBaseView")
local var_0_1 = class("HeroTeamInfoSequentailBattleView", var_0_0)

function var_0_1.OnEnter(arg_1_0)
	arg_1_0.cacheSorterExtraHeroList_ = {}

	var_0_1.super.OnEnter(arg_1_0)
end

function var_0_1.GetCacheSorterExtraHeroList(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.cacheSorterExtraHeroList_[arg_2_2] then
		return arg_2_0.cacheSorterExtraHeroList_[arg_2_2]
	end

	local var_2_0 = arg_2_1
	local var_2_1 = arg_2_2
	local var_2_2 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE):GetContDataTemplateById(var_2_0)

	arg_2_0.cacheSorterExtraHeroList_[arg_2_2] = var_2_2:GetHeroList(var_2_1)

	return arg_2_0.cacheSorterExtraHeroList_[arg_2_2]
end

function var_0_1.ExtraSorter(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = arg_3_0.heroTeam_
	local var_3_1 = arg_3_0.heroTrialList_
	local var_3_2 = table.keyof(SequentialBattleChapterCfg[arg_3_0.params_.activityID].stage_id, arg_3_0.params_.stageID)
	local var_3_3 = {}

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		var_3_3[iter_3_0] = {
			id = iter_3_1,
			trialID = var_3_1[iter_3_0]
		}
	end

	local var_3_4 = false
	local var_3_5 = false

	for iter_3_2 = 1, #SequentialBattleChapterCfg[arg_3_0.params_.activityID].stage_id do
		if iter_3_2 ~= var_3_2 then
			local var_3_6 = arg_3_0:GetCacheSorterExtraHeroList(arg_3_0.params_.activityID, iter_3_2)

			for iter_3_3, iter_3_4 in pairs(var_3_6) do
				local var_3_7 = iter_3_4:GetHeroID()

				if arg_3_1.id == var_3_7 then
					var_3_4 = true
				end

				if arg_3_2.id == var_3_7 then
					var_3_5 = true
				end
			end
		end
	end

	if var_3_4 ~= var_3_5 then
		return true, var_3_5 and true or false
	end

	local var_3_8 = arg_3_0:indexof(var_3_3, arg_3_1)
	local var_3_9 = arg_3_0:indexof(var_3_3, arg_3_2)

	if var_3_8 ~= var_3_9 then
		return true, var_3_8 < var_3_9
	end

	if arg_3_1.trialID ~= 0 or arg_3_2.trialID ~= 0 then
		if arg_3_1.trialID ~= 0 and arg_3_2.trialID ~= 0 then
			if arg_3_3 == 0 and arg_3_1.star ~= arg_3_2.star then
				if arg_3_0.curOrder_ == "desc" then
					return true, arg_3_1.star > arg_3_2.star
				else
					return true, arg_3_1.star < arg_3_2.star
				end
			end

			local var_3_10 = getHeroPower(arg_3_1.trialID, true)
			local var_3_11 = getHeroPower(arg_3_2.trialID, true)

			if var_3_10 ~= var_3_11 then
				if arg_3_4 == "desc" then
					return true, var_3_11 < var_3_10
				else
					return true, var_3_10 < var_3_11
				end
			else
				return true, arg_3_1.trialID > arg_3_2.trialID
			end
		else
			return true, arg_3_1.trialID > arg_3_2.trialID
		end
	end

	return false, false
end

function var_0_1.HeadRenderer(arg_4_0, arg_4_1, arg_4_2)
	var_0_1.super.HeadRenderer(arg_4_0, arg_4_1, arg_4_2)

	local var_4_0 = arg_4_0.heroDataList_[arg_4_1].id

	arg_4_2:SetHeroLock(table.keyof(arg_4_0.lockHeroList_, var_4_0) ~= nil)
end

function var_0_1.GetTextAndImage(arg_5_0)
	if arg_5_0:IsSameHeroInTeam(arg_5_0.selectID_) and not arg_5_0:IsInTeam(arg_5_0.selectID_, arg_5_0.selectTrialID_) then
		if arg_5_0.heroTeam_[arg_5_0.params_.selectHeroPos] ~= arg_5_0.selectID_ then
			return string.format("<color=#222222>%s</color>", GetTips("CHANGE_MEMBER")), "0"
		else
			return string.format("<color=#222222>%s</color>", GetTips("CHANGE_MEMBER")), "0"
		end
	end

	if arg_5_0.heroTeam_[arg_5_0.params_.selectHeroPos] == 0 then
		if arg_5_0:IsInTeam(arg_5_0.selectID_, arg_5_0.selectTrialID_) then
			return string.format("<color=#222222>%s</color>", GetTips("CHANGE_MEMBER")), "0"
		else
			return string.format("<color=#222222>%s</color>", GetTips("JOIN_TEAM")), "0"
		end
	end

	if arg_5_0.selectID_ == arg_5_0.heroTeam_[arg_5_0.params_.selectHeroPos] then
		return string.format("<color=#EBEBEB>%s</color>", GetTips("REMOVE_FROM_TEAM")), "2"
	end

	return string.format("<color=#222222>%s</color>", GetTips("CHANGE_MEMBER")), "0"
end

function var_0_1.OnJoinClick(arg_6_0)
	if table.keyof(arg_6_0.lockHeroList_, arg_6_0.selectID_) then
		local var_6_0 = arg_6_0.params_.activityID
		local var_6_1 = GetTips("HERO_IN_OTHER_TEAM")
		local var_6_2 = SequentialBattleData:GetHeroTeamData(var_6_0)
		local var_6_3 = table.keyof(SequentialBattleChapterCfg[var_6_0].stage_id, arg_6_0.params_.stageID)
		local var_6_4 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.SEQUENTIAL_BATTLE):GetContDataTemplateById(var_6_0)
		local var_6_5 = ""

		for iter_6_0 = 1, #SequentialBattleChapterCfg[var_6_0].stage_id do
			if iter_6_0 ~= var_6_3 then
				local var_6_6 = var_6_4:GetHeroList(iter_6_0)

				for iter_6_1, iter_6_2 in ipairs(var_6_6) do
					if iter_6_2:GetHeroID() == arg_6_0.selectID_ then
						var_6_5 = GetTips(string.format("TEAM_%s", iter_6_0))
					end
				end
			end
		end

		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(var_6_1, var_6_5),
			OkCallback = function()
				var_0_1.super.OnJoinClick(arg_6_0)
			end
		})

		return
	end

	var_0_1.super.OnJoinClick(arg_6_0)
end

function var_0_1.ChangeTeam(arg_8_0, arg_8_1, arg_8_2)
	ReserveTools.SetHeroList(arg_8_0.params_.reserveParams, arg_8_1, arg_8_2)

	local var_8_0 = table.keyof(SequentialBattleChapterCfg[arg_8_0.params_.activityID].stage_id, arg_8_0.params_.stageID)

	SequentialBattleTools.SaveEnabledBuff(arg_8_0.params_.activityID, var_8_0)
end

return var_0_1
