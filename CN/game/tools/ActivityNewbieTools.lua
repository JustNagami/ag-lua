local var_0_0 = {}

var_0_0.initedConst_ = false

function var_0_0.InitConst()
	var_0_0.advanceTaskCfgDic_ = {}

	for iter_1_0, iter_1_1 in ipairs(NoobVersionCfg.all) do
		local var_1_0 = NoobVersionCfg[iter_1_1]

		if type(var_1_0.noob_advance_task_type) == "table" then
			for iter_1_2, iter_1_3 in ipairs(var_1_0.noob_advance_task_type) do
				var_0_0.advanceTaskCfgDic_[iter_1_3] = {}
				var_0_0.advanceTaskCfgDic_[iter_1_3].versionID = iter_1_1
				var_0_0.advanceTaskCfgDic_[iter_1_3].index = iter_1_2
			end
		end
	end
end

function var_0_0.GetAdvanceTaskCfg(arg_2_0)
	if not var_0_0.initedConst_ then
		var_0_0.InitConst()

		var_0_0.initedConst_ = true
	end

	return var_0_0.advanceTaskCfgDic_[arg_2_0] or {}
end

function var_0_0.GetVersionID()
	return var_0_0.GetCurData():GetVersionID()
end

function var_0_0.GetSignCfg()
	local var_4_0 = var_0_0.GetVersionID()

	return NoobVersionCfg[var_4_0].noob_sign
end

function var_0_0.GetNoobPorgressRewardList()
	local var_5_0 = var_0_0.GetVersionID()

	return NoobVersionCfg[var_5_0].noob_task_progress_reward
end

function var_0_0.GetNoobTaskType()
	local var_6_0 = var_0_0.GetVersionID()

	return NoobVersionCfg[var_6_0].noob_task_type
end

function var_0_0.IsDataInited()
	return var_0_0.GetCurData() ~= nil
end

function var_0_0.GetCurData()
	local var_8_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_8_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_8_0 = ActivityNewbieData
	end

	return var_8_0
end

function var_0_0.CheckAdvanceTaskOpen()
	local var_9_0 = false
	local var_9_1
	local var_9_2 = var_0_0.GetVersionID()
	local var_9_3 = NoobVersionCfg[var_9_2].noob_advance_task_type
	local var_9_4 = NoobVersionCfg[var_9_2].noob_advance_task_open

	if type(var_9_4) == "table" then
		local var_9_5 = #var_9_4

		for iter_9_0 = var_9_5, 1, -1 do
			if var_0_0.CheckAdvanceTaskTypeOpen(var_9_3[iter_9_0]) then
				if iter_9_0 == var_9_5 and TaskTools:IsCompletedAllNoobAdvanceTask(var_9_3[iter_9_0]) then
					var_9_0 = false
				else
					var_9_0 = true
					var_9_1 = var_9_3[iter_9_0]
				end

				return var_9_0, var_9_1
			end
		end
	end

	return var_9_0, var_9_1
end

function var_0_0.CheckAdvanceTaskTypeOpen(arg_10_0)
	local var_10_0 = PlayerData:GetPlayerInfo().userLevel
	local var_10_1 = var_0_0.GetVersionID()
	local var_10_2 = NoobVersionCfg[var_10_1].noob_advance_task_open
	local var_10_3 = var_0_0.GetAdvanceTaskCfg(arg_10_0)
	local var_10_4 = var_10_3.index
	local var_10_5 = var_10_2[var_10_3.index]

	if var_10_4 == 1 then
		return var_10_5 <= var_10_0
	else
		local var_10_6 = NoobVersionCfg[var_10_1].noob_advance_task_type

		if TaskTools:IsCompletedAllNoobAdvanceTask(var_10_6[var_10_4 - 1]) then
			return var_10_5 <= var_10_0
		end
	end
end

function var_0_0.GotoNoobAdvanceTaskView()
	local var_11_0 = ""
	local var_11_1 = var_0_0.GetVersionID() <= 2 and "/noobAdvanceTask" or "/noobAdvanceTaskNew"

	JumpTools.OpenPageByJump(var_11_1, {
		isEnter = true
	})
end

function var_0_0.GotoMainView()
	local var_12_0 = ""

	if ActivityNoobData:IsOpenCurVersion() then
		var_12_0 = "/activityNoob"
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_12_0 = "/activityNewbie"
	end

	JumpTools.OpenPageByJump(var_12_0, nil, ViewConst.SYSTEM_ID.NEWBIE_ACTIVITY)
end

function var_0_0.IsFinishAllActivity()
	local var_13_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_13_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_13_0 = ActivityNewbieData
	end

	return var_13_0:IsFinishAllActivity()
end

function var_0_0.GetRechargeIsOpen(arg_14_0)
	local var_14_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_14_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_14_0 = ActivityNewbieData
	end

	if var_14_0 == nil then
		return false
	end

	if arg_14_0 == 1 then
		local var_14_1 = var_14_0:GetFirstRechargeStatus()

		return var_14_1.signTimes < 3 or var_14_1.firstGearStatus < 1
	elseif arg_14_0 == 2 then
		return not var_14_0:GetFirstMonthlyCardStatus().heroRewardFlag
	else
		return var_14_0:GetBpRewardStatus() <= 1
	end
end

function var_0_0.ReceiveRechargeReward(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0
	local var_15_1

	if ActivityNoobData:IsOpenCurVersion() then
		var_15_0 = ActivityNoobAction
		var_15_1 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_15_0 = ActivityNewbieAction
		var_15_1 = ActivityNewbieData
	end

	var_15_0.ReceiveRechargeReward(arg_15_0, arg_15_1, function(arg_16_0)
		if isSuccess(arg_16_0.result) then
			if arg_15_0 == 1 then
				if arg_15_1 == 0 then
					var_15_1:ReceiveFirstRecharge(0)
				else
					var_15_1:ReceiveFirstRecharge(1)
				end

				var_0_0.RefreshFirstRechargeRedPoint()
			elseif arg_15_0 == 2 then
				if arg_15_1 == 0 then
					var_15_1:ReceiveMonthlyCard(0)
				else
					var_15_1:ReceiveMonthlyCard(1)
				end

				var_0_0.RefreshMonthlyCardRedPoint()
			elseif arg_15_0 == 3 then
				var_15_1:SetBpRewardStatus()
				var_0_0.RefreshBpRedPoint()
			end

			getReward2(arg_16_0.reward_list, {
				ItemConst.ITEM_TYPE.HERO,
				ItemConst.ITEM_TYPE.HERO_SKIN
			})

			if arg_15_2 then
				arg_15_2(arg_16_0)
			end
		else
			ShowTips(arg_16_0.result)
		end
	end)
end

function var_0_0.GetFirstRechargeStatus()
	if ActivityNoobData:IsOpenCurVersion() then
		return ActivityNoobData:GetFirstRechargeStatus()
	elseif ActivityNewbieData:IsOpenCurVersion() then
		return ActivityNewbieData:GetFirstRechargeStatus()
	end

	return nil
end

function var_0_0.RefreshFirstRechargeRedPoint()
	local var_18_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_18_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_18_0 = ActivityNewbieData
	end

	local var_18_1 = var_18_0:GetFirstRechargeStatus()
	local var_18_2 = var_0_0.GetSelectFirstRecharge(1)
	local var_18_3 = 0

	if not var_0_0.GetRechargeIsOpen(1) then
		var_18_3 = 0
	elseif not var_18_2 or var_18_1.firstGearStatus == 1 then
		var_18_3 = 1
	end

	manager.redPoint:setTip(RedPointConst.NOOB_FIRST_RECHARGE_1, var_18_3)

	local var_18_4 = #GameSetting.newbie_first_charge_reward_18.value[3]
	local var_18_5 = var_18_1.secondGearStatus
	local var_18_6 = var_18_1.signTimes
	local var_18_7 = var_18_1.lastSignTimestamp
	local var_18_8 = var_0_0.GetSelectFirstRecharge(2)
	local var_18_9 = 0

	if not var_0_0.GetRechargeIsOpen(1) then
		var_18_9 = 0
	elseif not var_18_8 then
		var_18_9 = 1
	elseif not var_18_5 then
		var_18_9 = 0
	elseif var_18_6 < var_18_4 and var_18_7 < manager.time:GetTodayFreshTime() then
		var_18_9 = 1
	end

	manager.redPoint:setTip(RedPointConst.NOOB_FIRST_RECHARGE_2, var_18_9)
end

function var_0_0.SetSelectFirstRecharge(arg_19_0)
	saveData(string.format("newbie_first_recharge_%d", arg_19_0), "select", true)
	var_0_0.RefreshFirstRechargeRedPoint()
end

function var_0_0.GetSelectFirstRecharge(arg_20_0)
	return getData(string.format("newbie_first_recharge_%d", arg_20_0), "select")
end

function var_0_0.GetFirstMonthlyCardStatus()
	if ActivityNoobData:IsOpenCurVersion() then
		return ActivityNoobData:GetFirstMonthlyCardStatus()
	elseif ActivityNewbieData:IsOpenCurVersion() then
		return ActivityNewbieData:GetFirstMonthlyCardStatus()
	end

	return nil
end

function var_0_0.SetMonthlyCardSign()
	local var_22_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_22_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_22_0 = ActivityNewbieData
	end

	if var_22_0 == nil then
		return
	end

	var_22_0:SetMonthlyCardSign()
	var_0_0.RefreshMonthlyCardRedPoint()
end

function var_0_0.RefreshMonthlyCardRedPoint()
	local var_23_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_23_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_23_0 = ActivityNewbieData
	end

	local var_23_1 = var_23_0:GetFirstMonthlyCardStatus()
	local var_23_2 = var_0_0.GetSelectMonthlyRecharge()

	if GameSetting.newbie_first_monthly_card_cumulative.value[1] <= var_23_1.signTimes and var_23_1.signRewardFlag == false then
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE_SIGN, 1)
	else
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE_SIGN, 0)
	end

	if not var_0_0.GetRechargeIsOpen(2) then
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE, 0)
	elseif not var_23_2 then
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE, 1)
	elseif var_23_1.isRecharged and not var_23_1.heroRewardFlag then
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE, 1)
	else
		manager.redPoint:setTip(RedPointConst.NOOB_MONTHLY_RECHARGE, 0)
	end

	if not getData("FirstGear", "hasView") then
		manager.redPoint:setTip(RedPointConst.FIRST_GEAR, 1)
	else
		manager.redPoint:setTip(RedPointConst.FIRST_GEAR, 0)
	end
end

function var_0_0.SetSelectMonthlyRecharge()
	saveData("newbie_monthly_card", "select", true)
	var_0_0.RefreshMonthlyCardRedPoint()
end

function var_0_0.GetSelectMonthlyRecharge()
	return getData("newbie_monthly_card", "select")
end

function var_0_0.GetBpRewardStatus()
	if ActivityNoobData:IsOpenCurVersion() then
		return ActivityNoobData:GetBpRewardStatus()
	elseif ActivityNewbieData:IsOpenCurVersion() then
		return ActivityNewbieData:GetBpRewardStatus()
	end

	return nil
end

function var_0_0.RefreshBpRedPoint()
	local var_27_0

	if ActivityNoobData:IsOpenCurVersion() then
		var_27_0 = ActivityNoobData
	elseif ActivityNewbieData:IsOpenCurVersion() then
		var_27_0 = ActivityNewbieData
	end

	local var_27_1 = var_27_0:GetBpRewardStatus()
	local var_27_2 = var_0_0.GetSelectBpRecharge()
	local var_27_3 = 0

	if not var_0_0.GetRechargeIsOpen(3) then
		var_27_3 = 0
	elseif not var_27_2 or var_27_1 == 1 then
		var_27_3 = 1
	end

	manager.redPoint:setTip(RedPointConst.NOOB_BP_RECHARGE, var_27_3)
end

function var_0_0.SetSelectBpRecharge()
	saveData("newbie_bp", "select", true)
	var_0_0.RefreshBpRedPoint()
end

function var_0_0.GetSelectBpRecharge()
	return getData("newbie_bp", "select")
end

function var_0_0.RefreshAdvanceTaskRedPoint()
	local var_30_0, var_30_1 = ActivityNewbieTools.CheckAdvanceTaskOpen()

	if var_30_0 then
		local var_30_2 = ActivityNewbieTools.GetAdvanceTaskCfg(var_30_1)
		local var_30_3 = var_30_2.versionID
		local var_30_4 = var_30_2.index
		local var_30_5 = NoobVersionCfg[var_30_3].noob_advance_task_phase[var_30_4]

		for iter_30_0, iter_30_1 in ipairs(NoobAdvanceTaskPhaseListCfg[var_30_5].phase_list) do
			for iter_30_2, iter_30_3 in ipairs(iter_30_1[2]) do
				TaskRedPoint:UpdateNoobAdvanceTaskRed(var_30_1, iter_30_3[1])
			end
		end
	end
end

function var_0_0.RefreshNewBPRecharge(arg_31_0)
	if arg_31_0 then
		arg_31_0:SetSelectedState(ActivityNoobData:GetBpNewRecharge() and "true" or "false")
	end
end

return var_0_0
