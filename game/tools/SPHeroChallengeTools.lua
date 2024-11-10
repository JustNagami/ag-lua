local var_0_0 = {
	CloseActivity = function(arg_1_0, arg_1_1)
		SPHeroChallengeData:ExitCurSystem()
		SPHeroChallengeData:DisposeActivityInfo(arg_1_1)
	end,
	CheckActivityCanClose = function(arg_2_0, arg_2_1)
		local var_2_0 = true

		for iter_2_0, iter_2_1 in ipairs(GameSetting.activity_hero_challenge_close_condition.value) do
			if not IsConditionAchieved(iter_2_1) then
				var_2_0 = false

				break
			end
		end

		return var_2_0
	end,
	CheckActivityCloseWithTips = function(arg_3_0)
		local var_3_0 = SPHeroChallengeData:GetActivityID()

		if arg_3_0:CheckActivityCanClose(var_3_0) then
			ShowTips("TIME_OVER")
		end

		return arg_3_0:CheckActivityCanClose(var_3_0)
	end,
	GetOpenActivityID = function(arg_4_0)
		local var_4_0 = SPHeroChallengeData:GetTotalInfo()
		local var_4_1 = {}

		if var_4_0 then
			for iter_4_0, iter_4_1 in pairs(var_4_0) do
				table.insert(var_4_1, iter_4_0)
			end
		end

		return var_4_1
	end,
	CheckActivityIsOpen = function(arg_5_0, arg_5_1)
		if arg_5_1 then
			local var_5_0 = arg_5_0:GetOpenActivityID()

			return table.indexof(var_5_0, arg_5_1)
		end
	end,
	EnterSystem = function(arg_6_0, arg_6_1)
		if arg_6_0:CheckActivityIsOpen(arg_6_1) then
			if arg_6_0:CheckActivityCanClose(arg_6_1) then
				ShowTips("ACTIVITY_COMBINE_GAME_DRAW_POOL_FINISH")

				return
			end

			local var_6_0 = SPHeroChallengeData.activityCfg[arg_6_1]

			if var_6_0 then
				local var_6_1 = var_6_0.enterView

				SPHeroChallengeData:SetCurActivityID(arg_6_1)
				JumpTools.OpenPageByJump(var_6_1)
			end
		else
			ShowTips("SOLO_NOT_OPEN")
		end
	end,
	JumpSystemByScheduleType = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		if not arg_7_0:CheckActivityCloseWithTips() then
			if arg_7_1 == SpHeroChallengeConst.ScheduleSubType.story then
				JumpTools.OpenPageByJump("/spHeroChallengeBattleToggleView", {
					groupIndex = 1,
					isDetailJump = arg_7_2
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.train1 then
				JumpTools.OpenPageByJump("/spHeroChallengeTrainStageView", {
					playAnimation = true,
					trainType = arg_7_1
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.train2 then
				JumpTools.OpenPageByJump("/spHeroChallengeTrainStageView", {
					playAnimation = true,
					trainType = arg_7_1
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.train3 then
				JumpTools.OpenPageByJump("/spHeroChallengeTrainStageView", {
					playAnimation = true,
					trainType = arg_7_1
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.boss then
				JumpTools.OpenPageByJump("/spHeroChallengeBattleToggleView", {
					groupIndex = 3
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.decode then
				JumpTools.OpenPageByJump("/colorPuzzleSelectLevel", {
					isDetailJump = arg_7_2
				})
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.barbuce then
				SPHeroChallengeAction:OnEnterBarbuceScene()
				SPHeroChallengeData:SavePageState(arg_7_3)
			elseif arg_7_1 == SpHeroChallengeConst.ScheduleSubType.entrust then
				JumpTools.OpenPageByJump("/spHeroChallengeEntrustView")
			end
		end
	end,
	AutoChooseSchedule = function(arg_8_0)
		local var_8_0 = SPHeroChallengeData:GetCurActivityInfo()

		var_8_0:ClearScheduleDailyList()

		local var_8_1 = SPHeroChallengeData:GetActivityID()
		local var_8_2 = arg_8_0:GetCanChooseSchedule(var_8_1)
		local var_8_3 = GameSetting.activity_hero_challenge_schedule_limit.value[1]
		local var_8_4 = {}
		local var_8_5 = {
			0.5,
			0.25,
			0.25
		}

		for iter_8_0, iter_8_1 in ipairs(var_8_2) do
			if not var_8_4[ActivityHeroChallengeScheduleCfg[iter_8_1].type] then
				var_8_4[ActivityHeroChallengeScheduleCfg[iter_8_1].type] = {}
			end

			table.insert(var_8_4[ActivityHeroChallengeScheduleCfg[iter_8_1].type], iter_8_1)
		end

		for iter_8_2, iter_8_3 in pairs(var_8_4) do
			CommonTools.UniversalSortEx(iter_8_3, {
				ascend = true,
				map = function(arg_9_0)
					return ActivityHeroChallengeScheduleCfg[arg_9_0].priority
				end
			})
		end

		for iter_8_4, iter_8_5 in pairs(var_8_4) do
			local var_8_6 = 0
			local var_8_7 = 0

			for iter_8_6 = iter_8_4, #var_8_5 do
				var_8_7 = var_8_5[iter_8_6] + var_8_7
			end

			local var_8_8 = var_8_5[iter_8_4] / var_8_7
			local var_8_9 = math.ceil(var_8_3 * var_8_8)

			for iter_8_7, iter_8_8 in ipairs(iter_8_5) do
				while true do
					if arg_8_0:CheckScheduleCanAddInlist(iter_8_8) then
						var_8_0:AddScheduleInDailyList(iter_8_8)

						var_8_9 = var_8_9 - 1
						var_8_3 = var_8_3 - 1

						if var_8_9 <= 0 then
							break
						end
					else
						break
					end
				end

				if var_8_9 <= 0 then
					break
				end
			end

			if var_8_3 <= 0 then
				break
			end
		end
	end,
	ShowAutoScheduleTips = function(arg_10_0, arg_10_1)
		local var_10_0 = true

		for iter_10_0 = SpHeroChallengeConst.BattleSubType.train1, SpHeroChallengeConst.BattleSubType.train3 do
			local var_10_1, var_10_2 = SPHeroChallengeData:GetCurActivityInfo():GetTrainNumByType(iter_10_0)

			if var_10_1 < var_10_2 then
				var_10_0 = false

				return
			end
		end

		local var_10_3, var_10_4 = arg_10_0:GetScheduleProgress(SpHeroChallengeConst.ScheduleID.Decode)

		if var_10_3 < var_10_4 then
			var_10_0 = false
		end

		local var_10_5 = SPHeroChallengeData:GetCurActivityInfo()

		if var_10_5 and var_10_5.curScheduleList[1] then
			var_10_0 = false
		end

		return var_10_0
	end,
	GetCanChooseSchedule = function(arg_11_0, arg_11_1)
		local var_11_0 = ActivityHeroChallengeScheduleCfg.all
		local var_11_1 = {}

		for iter_11_0, iter_11_1 in ipairs(var_11_0) do
			if arg_11_0:CheckScheduleCanAddInlist(iter_11_1) then
				table.insert(var_11_1, iter_11_1)
			end
		end

		return var_11_1
	end,
	GetScheduleProgress = function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = SPHeroChallengeData:GetCurActivityInfo()

		if arg_12_1 == SpHeroChallengeConst.ScheduleID.Entrust or arg_12_1 == SpHeroChallengeConst.ScheduleID.Barbecue or arg_12_1 == SpHeroChallengeConst.ScheduleID.Boss then
			return -1, -1
		elseif arg_12_1 == SpHeroChallengeConst.ScheduleID.Awake then
			local var_12_1 = #var_12_0.storyFinStageList
			local var_12_2 = var_12_0.activityID
			local var_12_3 = #ChapterCfg[SPHeroChallengeData.activityCfg[var_12_2].storyChapter].section_id_list
			local var_12_4 = 0

			if arg_12_2 then
				var_12_4 = arg_12_0:GetSameScheduleNum(arg_12_1)
			end

			return var_12_1 + var_12_4, var_12_3
		elseif arg_12_1 == SpHeroChallengeConst.ScheduleID.Endurance or arg_12_1 == SpHeroChallengeConst.ScheduleID.Deter or arg_12_1 == SpHeroChallengeConst.ScheduleID.Explode then
			return -1, -1
		elseif arg_12_1 == SpHeroChallengeConst.ScheduleID.Decode then
			local var_12_5 = #ActivityHeroChallengeColor.all
			local var_12_6 = ColorPuzzleData:GetClearedLevelCount() or 0
			local var_12_7 = 0

			if arg_12_2 then
				var_12_7 = arg_12_0:GetSameScheduleNum(arg_12_1)
			end

			return var_12_6 + var_12_7, var_12_5
		end

		return 0, 100
	end,
	CheckScheduleIsUnlock = function(arg_13_0, arg_13_1)
		local var_13_0 = ActivityHeroChallengeScheduleCfg[arg_13_1]

		if var_13_0 then
			local var_13_1 = true

			for iter_13_0, iter_13_1 in ipairs(var_13_0.pre_condition) do
				if not IsConditionAchieved(iter_13_1) then
					local var_13_2 = false
					local var_13_3 = SPHeroChallengeTools:GetConditionDesc(iter_13_1)

					return var_13_2, var_13_3
				end
			end

			return true
		else
			Debug.LogError("未获取到日程配置" .. arg_13_1)
		end
	end,
	CheckScheduleIsRemove = function(arg_14_0, arg_14_1)
		local var_14_0 = ActivityHeroChallengeScheduleCfg[arg_14_1]

		if var_14_0 then
			local var_14_1 = true

			if var_14_0.remove_condition then
				if not next(var_14_0.remove_condition) then
					var_14_1 = false
				end

				for iter_14_0, iter_14_1 in ipairs(var_14_0.remove_condition) do
					if not IsConditionAchieved(iter_14_1) then
						var_14_1 = false

						local var_14_2 = SPHeroChallengeTools:GetConditionDesc(iter_14_1)

						return var_14_1, var_14_2
					end
				end
			end

			return var_14_1
		else
			Debug.LogError("未获取到日程配置" .. arg_14_1)
		end
	end,
	GetSameScheduleNum = function(arg_15_0, arg_15_1)
		local var_15_0 = SPHeroChallengeData:GetCurActivityInfo():GetScheduleDailyList()
		local var_15_1 = 0

		for iter_15_0, iter_15_1 in ipairs(var_15_0) do
			if iter_15_1 == arg_15_1 then
				var_15_1 = var_15_1 + 1
			end
		end

		return var_15_1
	end,
	CheckScheduleCanAddInlist = function(arg_16_0, arg_16_1)
		local var_16_0 = true
		local var_16_1 = ""
		local var_16_2 = "unlock"

		if not arg_16_0:CheckScheduleIsUnlock(arg_16_1) then
			var_16_0 = false

			local var_16_3 = ActivityHeroChallengeScheduleCfg[arg_16_1].pre_condition[1]

			var_16_1 = SPHeroChallengeTools:GetConditionDesc(var_16_3)
			var_16_2 = "lock"
		end

		local var_16_4 = ActivityHeroChallengeScheduleCfg[arg_16_1].activity_id

		if not ActivityData:GetActivityIsOpen(var_16_4) then
			var_16_1 = GetTips("SOLO_NOT_OPEN")
			var_16_2 = "lock"
		end

		if arg_16_1 == SpHeroChallengeConst.ScheduleID.Boss and not SPHeroChallengeData:GetCurActivityInfo().bossStart then
			var_16_0 = false
			var_16_1 = GetTips("SOLO_NOT_OPEN")
			var_16_2 = "lock"
		end

		local var_16_5, var_16_6 = arg_16_0:GetScheduleProgress(arg_16_1, true)

		if var_16_5 >= 0 and var_16_6 <= var_16_5 then
			var_16_0 = false
			var_16_1 = GetTips("ACTIVITY_HERO_CHALLENGE_SCHEDULE_FINISH")
			var_16_2 = "finish"
		end

		if arg_16_0:CheckScheduleIsRemove(arg_16_1) then
			var_16_0 = false
			var_16_2 = "finish"
			var_16_1 = GetTips("ACTIVITY_HERO_CHALLENGE_SCHEDULE_FINISH")
		end

		return var_16_0, var_16_1, var_16_2
	end,
	GetNextCanBattleStageID = function(arg_17_0, arg_17_1)
		if arg_17_1 == SpHeroChallengeConst.ScheduleSubType.story then
			return SPHeroChallengeData:GetCurActivityInfo():GetNextStoryStageIDList()
		elseif arg_17_1 == SpHeroChallengeConst.ScheduleSubType.decode then
			return ColorPuzzleData:GetNextStage()
		end
	end
}

local function var_0_1(arg_18_0, arg_18_1)
	local var_18_0 = SPHeroChallengeData.activityCfg[arg_18_1]

	if var_18_0 then
		local var_18_1 = GameSetting[var_18_0.operationEntrustNum].value

		if arg_18_0 <= var_18_1[#var_18_1][1] then
			if arg_18_0 <= var_0_0:GetCanOperationEntrustNum(arg_18_1) then
				return true
			end
		else
			return var_0_0:CheckEntrustWaitListOpen(arg_18_1, arg_18_0)
		end
	end
end

function var_0_0.GetEntrustPosState(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0:CheckActivityIsOpen(arg_19_1) then
		if not var_0_1(arg_19_2, arg_19_1) then
			return SpHeroChallengeConst.EntrustPosState.lock
		end

		local var_19_0 = SPHeroChallengeData:GetActivityData(arg_19_1)
		local var_19_1 = var_19_0:GetEntrustInfoByIndex(arg_19_2)

		if not var_19_1 or not next(var_19_1) then
			return SpHeroChallengeConst.EntrustPosState.empty
		end

		if var_19_0:GetEntrustEndTime(arg_19_2) then
			return SpHeroChallengeConst.EntrustPosState.fin
		else
			return SpHeroChallengeConst.EntrustPosState.start
		end
	end
end

function var_0_0.GetCanWaitEntrustNum(arg_20_0, arg_20_1)
	local var_20_0 = SPHeroChallengeData.activityCfg[arg_20_1]
	local var_20_1 = 0

	if var_20_0 then
		local var_20_2 = var_20_0.waitEntrustListOpenCondition

		for iter_20_0 = #var_20_2, 1, -1 do
			if IsConditionAchieved(var_20_2[iter_20_0][2]) then
				var_20_1 = math.max(var_20_1, var_20_2[iter_20_0][1])

				break
			end
		end
	end

	return var_20_1
end

function var_0_0.GetCanOperationEntrustNum(arg_21_0, arg_21_1)
	local var_21_0 = SPHeroChallengeData.activityCfg[arg_21_1]

	if var_21_0 then
		local var_21_1 = GameSetting[var_21_0.operationEntrustNum].value
		local var_21_2 = 1

		for iter_21_0 = #var_21_1, 1, -1 do
			if IsConditionAchieved(var_21_1[iter_21_0][2]) then
				var_21_2 = math.max(var_21_2, var_21_1[iter_21_0][1])

				break
			end
		end

		return var_21_2
	else
		Debug.LogError("未获取到对应活动的配置数据" .. arg_21_1)
	end
end

function var_0_0.CheckCanStartEntrust(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = true
	local var_22_1
	local var_22_2 = ActivityHeroChallengeTaskCfg[arg_22_1]

	if var_22_2 then
		if arg_22_0:GetCanStartEntrustNum(arg_22_2) <= 0 then
			var_22_0 = false
			var_22_1 = GetTips("ACTIVITY_HERO_CHALLENGE_ENTRUST_FULL")
		end

		for iter_22_0, iter_22_1 in ipairs(var_22_2.cost) do
			if (ItemTools.getItemNum(iter_22_1[1]) or 0) < iter_22_1[2] then
				var_22_0 = false
				var_22_1 = GetTips("ACTIVITY_HERO_CHALLENGE_ENTRUST_NONE_MATERIAL")

				break
			end
		end

		return var_22_0, var_22_1
	end
end

function var_0_0.GetEntrustLockDesc(arg_23_0, arg_23_1)
	local var_23_0 = SPHeroChallengeData:GetActivityID()
	local var_23_1 = SPHeroChallengeData:GetCurActivityInfo()

	if arg_23_1 > arg_23_0:GetCanOperationEntrustNum(var_23_0) then
		local var_23_2 = GameSetting.activity_hero_challenge_task_condition.value

		for iter_23_0, iter_23_1 in ipairs(var_23_2) do
			if arg_23_1 == iter_23_1[1] then
				if IsConditionAchieved(iter_23_1[2]) then
					return true, arg_23_0:GetConditionDesc(iter_23_1[2])
				else
					return false, arg_23_0:GetConditionDesc(iter_23_1[2])
				end
			end
		end
	end
end

function var_0_0.GetCanStartEntrustNum(arg_24_0)
	local var_24_0 = SPHeroChallengeData:GetActivityID()
	local var_24_1 = SPHeroChallengeData:GetCurActivityInfo()
	local var_24_2 = arg_24_0:GetCanWaitEntrustNum(var_24_0)
	local var_24_3 = arg_24_0:GetCanOperationEntrustNum(var_24_0)
	local var_24_4 = var_24_1:GetReceiveEntrustNum()

	return (math.max(var_24_2 + var_24_3 - var_24_4, 0))
end

function var_0_0.GetAcceleratorNumByIndex(arg_25_0, arg_25_1)
	local var_25_0, var_25_1 = SPHeroChallengeData:GetCurActivityInfo():GetEntrustEndTime(arg_25_1)
	local var_25_2 = 0

	if not var_25_0 then
		var_25_2 = math.ceil(var_25_1 / 3600)
	end

	return var_25_2
end

function var_0_0.CheckEntrustWaitListOpen(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = SPHeroChallengeData.activityCfg[arg_26_1]

	if var_26_0 then
		local var_26_1 = var_26_0.waitEntrustListOpenCondition
		local var_26_2 = GameSetting[var_26_0.operationEntrustNum].value
		local var_26_3 = var_26_2[#var_26_2][1]

		for iter_26_0, iter_26_1 in ipairs(var_26_1) do
			if iter_26_1[1] == arg_26_2 - var_26_3 then
				return IsConditionAchieved(iter_26_1[2])
			end
		end

		return false
	end
end

function var_0_0.GetOpenWaitEntrustListNum(arg_27_0, arg_27_1)
	local var_27_0 = SPHeroChallengeData.activityCfg[arg_27_1]
	local var_27_1 = 0

	if var_27_0 then
		local var_27_2 = var_27_0.waitEntrustListOpenCondition

		for iter_27_0, iter_27_1 in ipairs(var_27_2) do
			if IsConditionAchieved(iter_27_1[2]) then
				var_27_1 = var_27_1 + 1
			end
		end
	end

	return var_27_1
end

function var_0_0.GetMaxStartEntrustPosNum(arg_28_0, arg_28_1)
	local var_28_0 = SPHeroChallengeData.activityCfg[arg_28_1]

	if var_28_0 then
		local var_28_1 = GameSetting[var_28_0.operationEntrustNum].value

		return var_28_1[#var_28_1][1]
	end
end

function var_0_0.GetMaxWaitEntrustPosNum(arg_29_0, arg_29_1)
	local var_29_0 = SPHeroChallengeData.activityCfg[arg_29_1]

	if var_29_0 then
		return #var_29_0.waitEntrustListOpenCondition
	end
end

function var_0_0.GetMaxTotleEntrustPosNum(arg_30_0, arg_30_1)
	if SPHeroChallengeData.activityCfg[arg_30_1] then
		return arg_30_0:GetMaxStartEntrustPosNum(arg_30_1) + arg_30_0:GetMaxWaitEntrustPosNum(arg_30_1)
	end
end

function var_0_0.CheckNeedRefreshEntrust(arg_31_0)
	local var_31_0 = SPHeroChallengeData:GetActivityID()
	local var_31_1 = SPHeroChallengeData:GetActivityData(var_31_0)

	if var_31_1 then
		local var_31_2 = var_31_1:GetCanGetRewardEntrustIndexList()
		local var_31_3 = arg_31_0:GetMaxStartEntrustPosNum(var_31_0)

		for iter_31_0, iter_31_1 in ipairs(var_31_2) do
			if iter_31_1 <= var_31_3 then
				return true
			end
		end
	end

	return false
end

local function var_0_2(arg_32_0, arg_32_1)
	local var_32_0 = {}

	if arg_32_0 and arg_32_1 then
		for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
			if arg_32_0 >= iter_32_1[1] then
				table.insert(var_32_0, iter_32_1[2])
			end
		end
	end

	return var_32_0
end

function var_0_0.GetUnlockAffix(arg_33_0)
	local var_33_0 = SPHeroChallengeData:GetActivityID()
	local var_33_1 = SPHeroChallengeData:GetCurActivityInfo()
	local var_33_2 = {}

	for iter_33_0 = SpHeroChallengeConst.BattleSubType.train1, SpHeroChallengeConst.BattleSubType.train3 do
		local var_33_3 = ActivityHeroChallengeCfg[var_33_0]["affix_group_" .. iter_33_0 - 1]
		local var_33_4 = var_33_1:GetTrainNumByType(iter_33_0)
		local var_33_5 = var_0_2(var_33_4, var_33_3)

		for iter_33_1, iter_33_2 in ipairs(var_33_5) do
			table.insert(var_33_2, iter_33_2)
		end
	end

	return var_33_2
end

function var_0_0.GetUnlockChapterAffix(arg_34_0)
	local var_34_0 = {}
	local var_34_1 = SPHeroChallengeData:GetActivityID()

	for iter_34_0 = SpHeroChallengeConst.BattleSubType.train1, SpHeroChallengeConst.BattleSubType.train3 do
		if arg_34_0:CheckBattleRouteIsOpen(iter_34_0) then
			table.insert(var_34_0, ActivityHeroChallengeCfg[var_34_1].affix_unlock[iter_34_0 - 1])
		end
	end

	return var_34_0
end

function var_0_0.CheckStageIsOpen(arg_35_0, arg_35_1)
	local var_35_0 = BattleVerthandiExclusiveCfg[arg_35_1]

	if var_35_0 then
		local var_35_1 = false
		local var_35_2 = ""
		local var_35_3 = var_35_0.sub_type
		local var_35_4 = SpHeroChallengeConst.chapterID[var_35_3]
		local var_35_5 = ChapterCfg[var_35_4].unlock_activity_id

		if var_35_5 > 0 and not ActivityData:GetActivityIsOpen(var_35_5) then
			var_35_1 = true

			local var_35_6 = ActivityData:GetActivityData(var_35_5)
			local var_35_7 = manager.time:GetServerTime()

			if var_35_6 and var_35_7 < var_35_6.startTime then
				var_35_2 = GetTips(string.format(GetTips("OPEN_TIME"), manager.time:GetLostTimeStr(var_35_6.startTime)))
			else
				var_35_2 = GetTips("TIME_OVER")
			end
		end

		for iter_35_0, iter_35_1 in ipairs(BattleVerthandiExclusiveCfg.all) do
			if arg_35_1 == BattleVerthandiExclusiveCfg[iter_35_1].next_unlock_id_list[1] and not arg_35_0:IsClearStage(iter_35_1) then
				var_35_1 = true
				var_35_2 = GetTips("ERROR_ACTIVITY_ZM_GAME_PRE_MISSION_UNLOCK")
			end
		end

		if var_35_3 ~= SpHeroChallengeConst.BattleSubType.story then
			local var_35_8 = SpHeroChallengeConst.scheduleIndex[var_35_0.sub_type]
			local var_35_9, var_35_10 = arg_35_0:CheckScheduleIsUnlock(var_35_8)

			if not var_35_9 then
				var_35_1 = true
				var_35_2 = var_35_10
			end
		end

		return var_35_1, var_35_2
	else
		Debug.LogError("未获取到关卡配置信息" .. arg_35_1)
	end
end

function var_0_0.CheckStoryStageCanBattle(arg_36_0, arg_36_1)
	local var_36_0 = BattleVerthandiExclusiveCfg[arg_36_1]

	if var_36_0 then
		local var_36_1 = false
		local var_36_2 = ""

		if var_36_0.sub_type == SpHeroChallengeConst.BattleSubType.story and not arg_36_0:IsClearStage(arg_36_1) then
			local var_36_3, var_36_4 = SPHeroChallengeData:GetCurActivityInfo():GetStartBattelScheduleByType(var_36_0.sub_type)

			if var_36_3 <= var_36_4 then
				var_36_1 = true
				var_36_2 = GetTips("ACTIVITY_HERO_CHALLENGE_TIME_NULL")
			end
		end

		return var_36_1, var_36_2
	end
end

function var_0_0.CheckScheduleNeedCostTime(arg_37_0, arg_37_1)
	local var_37_0 = BattleVerthandiExclusiveCfg[arg_37_1]

	if var_37_0 then
		local var_37_1 = false
		local var_37_2 = ""

		if var_37_0.sub_type == SpHeroChallengeConst.BattleSubType.story then
			return arg_37_0:IsClearStage(arg_37_1)
		else
			return false
		end
	end
end

function var_0_0.IsClearStage(arg_38_0, arg_38_1)
	local var_38_0 = BattleVerthandiExclusiveCfg[arg_38_1]

	if var_38_0 then
		local var_38_1 = SPHeroChallengeData:GetCurActivityInfo()

		if var_38_0.sub_type == SpHeroChallengeConst.ScheduleSubType.story then
			return table.indexof(var_38_1.storyFinStageList, arg_38_1)
		elseif var_38_0.sub_type == SpHeroChallengeConst.ScheduleSubType.train1 or var_38_0.sub_type == SpHeroChallengeConst.ScheduleSubType.train2 or var_38_0.sub_type == SpHeroChallengeConst.ScheduleSubType.train3 then
			if var_38_1.trainInfo[var_38_0.sub_type] then
				return table.indexof(var_38_1.trainInfo[var_38_0.sub_type].passStageList, arg_38_1)
			else
				return false
			end
		end

		return true
	else
		Debug.LogError("未获取到关卡配置信息" .. arg_38_1)
	end
end

function var_0_0.CalStageScore(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = GameSetting.activity_hero_challenge_boss_basescore.value[1]
	local var_39_1 = GameSetting.activity_hero_challenge_boss_timescore.value[1]

	return var_39_0 - math.max(GameSetting.activity_hero_challenge_boss_timescore.value[2] - var_39_1 * arg_39_3, 0)
end

function var_0_0.GetTrainTypeName(arg_40_0, arg_40_1)
	return GetTips("ACTIVITY_HERO_CHALLENGE_BATTLE_TYPE_" .. arg_40_1)
end

function var_0_0.GetTrainPercentByStage(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = BattleVerthandiExclusiveCfg[arg_41_1].sub_type

	if SPHeroChallengeData:GetCurActivityInfo() then
		local var_41_1 = arg_41_0:GetTrainScoreByStage(arg_41_1, arg_41_2)
		local var_41_2 = 0
		local var_41_3 = GameSetting.activity_hero_challenge_base_num.value[1]

		return var_41_1, math.ceil(var_41_1 / var_41_3 * 100)
	end
end

function var_0_0.GetTrainScoreByStage(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = GameSetting["activity_hero_challenge_train_num_" .. arg_42_2].value
	local var_42_1 = BattleVerthandiExclusiveCfg[arg_42_1].sub_type
	local var_42_2 = SPHeroChallengeData:GetCurActivityInfo()

	if var_42_2 then
		local var_42_3 = var_42_2:GetTrainNumByType(var_42_1)
		local var_42_4 = -1

		for iter_42_0, iter_42_1 in ipairs(var_42_0) do
			if var_42_3 <= iter_42_1[1] then
				var_42_4 = iter_42_1[2]

				break
			end
		end

		if var_42_4 < 0 then
			var_42_4 = var_42_0[#var_42_0][2]
		end

		return var_42_4
	end
end

function var_0_0.GetChapterIsOpen(arg_43_0, arg_43_1)
	local var_43_0 = ChapterCfg[arg_43_1]

	if var_43_0 then
		local var_43_1 = var_43_0.unlock_activity_id

		if var_43_1 and var_43_1 > 0 and not ActivityTools.GetActivityIsOpenWithTip(var_43_1, false) then
			return false, "SOLO_NOT_OPEN"
		end

		local var_43_2 = SPHeroChallengeData:GetActivityID()

		if var_43_2 and var_43_1 == SPHeroChallengeData.activityCfg[var_43_2].bossActivityID and not SPHeroChallengeData:GetCurActivityInfo().bossStart then
			return false, "ACTIVITY_HERO_CHALLENGE_BOSS_OPEN_TIME"
		end

		local var_43_3 = {}
		local var_43_4 = var_43_0.group

		if var_43_4 == SpHeroChallengeConst.ChapterType.story then
			local var_43_5 = SpHeroChallengeConst.ScheduleID.Awake

			var_43_3 = ActivityHeroChallengeScheduleCfg[var_43_5].pre_condition
		elseif var_43_4 == SpHeroChallengeConst.ChapterType.train then
			local var_43_6 = SpHeroChallengeConst.ScheduleID.Endurance

			var_43_3 = ActivityHeroChallengeScheduleCfg[var_43_6].pre_condition
		elseif var_43_4 == SpHeroChallengeConst.ChapterType.boss then
			local var_43_7 = SpHeroChallengeConst.ScheduleID.Boss

			var_43_3 = ActivityHeroChallengeScheduleCfg[var_43_7].pre_condition
		end

		local var_43_8 = true
		local var_43_9 = ""

		for iter_43_0, iter_43_1 in ipairs(var_43_3) do
			if not IsConditionAchieved(iter_43_1) then
				local var_43_10 = false
				local var_43_11 = arg_43_0:GetConditionDesc(iter_43_1)

				return var_43_10, var_43_11
			end
		end

		return true
	else
		Debug.LogError("未获取到章节配置" .. arg_43_1)
	end
end

function var_0_0.CheckBattleRouteIsOpen(arg_44_0, arg_44_1)
	local var_44_0 = ActivityHeroChallengeScheduleCfg.get_id_list_by_server_type[arg_44_1]

	if var_44_0[1] then
		local var_44_1 = var_44_0[1]
		local var_44_2 = ActivityHeroChallengeScheduleCfg[var_44_1].pre_condition
		local var_44_3 = true
		local var_44_4 = ""

		for iter_44_0, iter_44_1 in ipairs(var_44_2) do
			if not IsConditionAchieved(iter_44_1) then
				var_44_3 = false

				local var_44_5 = arg_44_0:GetConditionDesc(iter_44_1)

				return var_44_3, var_44_5
			end
		end

		return var_44_3
	else
		Debug.LogError("未获取到战斗类型对应的日程" .. arg_44_1)
	end
end

function var_0_0.GetStoryOpenStageList(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = SPHeroChallengeData:GetCurActivityInfo().storyFinStageList or {}
	local var_45_1 = ChapterCfg[arg_45_1].section_id_list
	local var_45_2 = {}

	table.insert(var_45_2, var_45_1[1])

	for iter_45_0, iter_45_1 in ipairs(var_45_1) do
		local var_45_3 = arg_45_2[iter_45_1].next_show_id_list

		if var_45_3 == "" then
			var_45_3 = {}
		end

		if table.indexof(var_45_0, iter_45_1) then
			table.insert(var_45_2, iter_45_1)

			for iter_45_2, iter_45_3 in ipairs(var_45_3) do
				if not table.keyof(var_45_2, iter_45_3) then
					table.insert(var_45_2, iter_45_3)
				end
			end
		end
	end

	return var_45_2
end

function var_0_0.GetConditionDesc(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = ConditionCfg[arg_46_1]

	if var_46_0 then
		if var_46_0.type == 11200 or var_46_0.type == 11201 or var_46_0.type == 11202 or var_46_0.type == 11204 or var_46_0.type == 11205 then
			return var_46_0.desc
		elseif var_46_0.type == 11203 then
			local var_46_1 = BattleVerthandiExclusiveCfg[var_46_0.params[1]].name
			local var_46_2 = GetI18NText(var_46_0.desc)

			return (string.format(var_46_2, var_46_0.params[2]))
		elseif var_46_0.type == 11206 then
			local var_46_3 = var_46_0.desc

			return string.format(var_46_3, var_46_0.params[2]), var_46_0.params[1], var_46_0.params[2]
		end
	end
end

function var_0_0.GetScheduleIcon(arg_47_0, arg_47_1)
	return getSpriteViaConfig("ActivityHeroChallengeScheduleIcon", arg_47_1)
end

function var_0_0.GetScheduleTypeName(arg_48_0, arg_48_1)
	local var_48_0

	if arg_48_1 == 1 then
		var_48_0 = SpHeroChallengeConst.ScheduleTypeName.Battle
	elseif arg_48_1 == 2 then
		var_48_0 = SpHeroChallengeConst.ScheduleTypeName.MiniGame
	elseif arg_48_1 == 3 then
		var_48_0 = SpHeroChallengeConst.ScheduleTypeName.Entrust
	end

	if var_48_0 then
		return GetTips(var_48_0)
	end
end

function var_0_0.GetTrainNameAndIcon(arg_49_0, arg_49_1)
	arg_49_1 = arg_49_1 - 1

	local var_49_0 = GetTips("ACTIVITY_HERO_CHALLENGE_TRAIN_NAME_" .. arg_49_1)
	local var_49_1 = getSpriteViaConfig("ActivityHeroChallengeTrain", "heroChallenge_icon_potential" .. arg_49_1)

	return var_49_0, var_49_1
end

function var_0_0.GetBarbuceGameAwardRefreshTime(arg_50_0)
	local var_50_0 = manager.time:GetNextFreshTime()

	return string.format(GetTips("CANTEEN_TASK_REFRESH_COOLDOWN"), manager.time:GetLostTimeStrWith2Unit(var_50_0))
end

function var_0_0.GetBarbuceStageIDByDiff(arg_51_0, arg_51_1, arg_51_2)
	for iter_51_0, iter_51_1 in ipairs(ActivityHeroChallengeBarbecueCfg.all) do
		local var_51_0 = ActivityHeroChallengeBarbecueCfg[iter_51_1]

		if var_51_0.difficult == arg_51_1 and arg_51_2 == var_51_0.activity_id then
			return iter_51_1
		end
	end
end

function var_0_0.GetBarbecueAwardIndex(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = ActivityHeroChallengeBarbecueCfg[arg_52_1]

	if var_52_0 then
		local var_52_1 = 0

		for iter_52_0, iter_52_1 in ipairs(var_52_0.reward_list_coin) do
			if arg_52_2 <= iter_52_1[2] then
				var_52_1 = iter_52_0
			end
		end

		if var_52_1 == 0 then
			var_52_1 = #var_52_0.reward_list_coin
		end

		return var_52_1
	else
		Debug.LogError("未获取到烤肉关卡配置信息" .. arg_52_1)
	end
end

function var_0_0.CheckBossActivityIsOpen(arg_53_0)
	local var_53_0 = SPHeroChallengeData:GetActivityID()
	local var_53_1 = SPHeroChallengeData.activityCfg[var_53_0].bossActivityID

	if var_53_0 then
		local var_53_2 = SPHeroChallengeData:GetCurActivityInfo()

		if ActivityTools.GetActivityIsOpenWithTip(var_53_1, false) and var_53_2.bossStart then
			return true
		end
	end
end

return var_0_0
