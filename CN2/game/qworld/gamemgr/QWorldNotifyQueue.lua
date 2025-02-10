return {
	Init = function(arg_1_0)
		arg_1_0.rewardListQueue_ = {}
		arg_1_0.criticalRewardListQueue_ = {}
		arg_1_0.mainQuestIdFinishQueue_ = {}
		arg_1_0.mainQuestIdNewQueue_ = {}
		arg_1_0.mainQuestIdUpdateQueue_ = {}
		arg_1_0.openFunctionIdQueue_ = {}
		arg_1_0.nextNotifyTime_ = -1
		arg_1_0.questUnlockView_ = QWorldQuestUnlockView.New()
		arg_1_0.questFinishView_ = QWorldQuestFinishView.New()
		arg_1_0.rewardView_ = QWorldRewardView.New()
		arg_1_0.openFunctionView_ = QWorldFunctionOpenView.New()
	end,
	Dispose = function(arg_2_0)
		arg_2_0.questUnlockView_:Dispose()

		arg_2_0.questUnlockView_ = nil

		arg_2_0.questFinishView_:Dispose()

		arg_2_0.questFinishView_ = nil

		arg_2_0.rewardView_:Dispose()

		arg_2_0.rewardView_ = nil

		arg_2_0.openFunctionView_:Dispose()

		arg_2_0.openFunctionView_ = nil
	end,
	HasNotifies = function(arg_3_0)
		return arg_3_0.isShowing_ or #arg_3_0.rewardListQueue_ > 0 or #arg_3_0.criticalRewardListQueue_ > 0 or #arg_3_0.mainQuestIdFinishQueue_ > 0 or #arg_3_0.mainQuestIdNewQueue_ > 0 or #arg_3_0.openFunctionIdQueue_ > 0 or #arg_3_0.mainQuestIdUpdateQueue_ > 0
	end,
	HasQuestFinishOrNew = function(arg_4_0)
		return #arg_4_0.mainQuestIdFinishQueue_ > 0 or #arg_4_0.mainQuestIdNewQueue_ > 0
	end,
	UpdateNotifies = function(arg_5_0)
		if arg_5_0.nextNotifyTime_ > Time.time or manager.guide:IsPlaying() then
			return
		end

		if arg_5_0.rewardView_.gameObject_ and arg_5_0.rewardView_.gameObject_.activeSelf then
			return
		end

		if QWorldMgr:GetQWorldQuestMgr():IsSendingQuestParamUpdateOrFinish() then
			return
		end

		local var_5_0 = gameContext:GetOpenPageHandler("qworldMainHome")

		if not var_5_0 then
			return
		end

		local var_5_1 = var_5_0.questSideView_
		local var_5_2 = var_5_0.rewardSideView_

		arg_5_0.questUnlockView_:Hide()
		arg_5_0.questFinishView_:Hide()
		arg_5_0.rewardView_:Hide()
		arg_5_0.openFunctionView_:Hide()

		arg_5_0.isShowing_ = false

		if #arg_5_0.criticalRewardListQueue_ > 0 then
			arg_5_0.rewardView_:SetData(arg_5_0.criticalRewardListQueue_)
			arg_5_0.rewardView_:Show()

			arg_5_0.nextNotifyTime_ = Time.time + SandplaySettingCfg.pop_reward.value[1] / 1000
			arg_5_0.isShowing_ = true

			return
		end

		while #arg_5_0.openFunctionIdQueue_ > 0 do
			local var_5_3 = SandPlayFunctionOpenCfg.get_id_list_by_task_id[arg_5_0.openFunctionIdQueue_[1]]
			local var_5_4 = var_5_3 and var_5_3[1]
			local var_5_5 = var_5_4 and SandPlayFunctionOpenCfg[var_5_4]

			table.remove(arg_5_0.openFunctionIdQueue_, 1)

			if var_5_5 and (var_5_5.map_id == 0 or var_5_5.map_id == QWorldData:GetCurMapId()) and IsConditionAchieved(var_5_5.condition_id) and not QWorldData:IsUnlockFunction(var_5_4) then
				arg_5_0.openFunctionView_:SetData(var_5_5)
				arg_5_0.openFunctionView_:Show()

				arg_5_0.nextNotifyTime_ = Time.time + SandplaySettingCfg.pop_unlock.value[1] / 1000
				arg_5_0.isShowing_ = true

				return
			end
		end

		if #arg_5_0.rewardListQueue_ > 0 then
			var_5_2:InsertRewards(arg_5_0.rewardListQueue_)

			arg_5_0.nextNotifyTime_ = Time.time + SandplaySettingCfg.pop_reward.value[1] / 1000
			arg_5_0.isShowing_ = true
		end

		while #arg_5_0.mainQuestIdFinishQueue_ > 0 do
			local var_5_6 = arg_5_0.mainQuestIdFinishQueue_[1]

			table.remove(arg_5_0.mainQuestIdFinishQueue_, 1)

			local var_5_7 = SandplayTaskMainCfg[var_5_6]

			if var_5_7.hide_task ~= 1 then
				if var_5_7.chapter_task_id ~= 0 then
					local var_5_8 = SandplayTaskMainCfg.get_id_list_by_chapter_task_id[var_5_7.chapter_task_id]

					if var_5_8[#var_5_8] == var_5_6 then
						arg_5_0.questFinishView_:SetData(var_5_6)
						arg_5_0.questFinishView_:Show()
					end
				end

				var_5_1:ShowMainQuestsFinish(var_5_6)

				arg_5_0.nextNotifyTime_ = Time.time + SandplaySettingCfg.pop_task_complete.value[1] / 1000
				arg_5_0.isShowing_ = true

				break
			end
		end

		if arg_5_0.isShowing_ then
			return
		end

		if var_5_2:IsShowing() then
			return
		end

		while #arg_5_0.mainQuestIdNewQueue_ > 0 do
			local var_5_9 = arg_5_0.mainQuestIdNewQueue_[1]

			table.remove(arg_5_0.mainQuestIdNewQueue_, 1)

			if SandplayTaskMainCfg[var_5_9].hide_task ~= 1 then
				var_5_1:ShowMainQuestsNew(var_5_9)

				arg_5_0.nextNotifyTime_ = Time.time + SandplaySettingCfg.pop_task_new.value[1] / 1000
				arg_5_0.isShowing_ = true

				return
			end
		end

		while #arg_5_0.mainQuestIdUpdateQueue_ > 0 do
			local var_5_10 = arg_5_0.mainQuestIdUpdateQueue_[1]

			table.remove(arg_5_0.mainQuestIdUpdateQueue_, 1)

			local var_5_11 = SandplayTaskMainCfg[var_5_10]

			if var_5_10 == -1 or var_5_11.hide_task ~= 1 then
				var_5_1:OnQWorldMainQuestUpdate(var_5_10)

				arg_5_0.isShowing_ = true

				return
			end
		end

		var_5_1:OnNotifyQueueEnd()
	end,
	ImmediatelyNextNotifies = function(arg_6_0)
		arg_6_0.nextNotifyTime_ = Time.time
	end,
	HideNotifies = function(arg_7_0)
		arg_7_0.questUnlockView_:Hide()
		arg_7_0.questFinishView_:Hide()
		arg_7_0.openFunctionView_:Hide()

		arg_7_0.nextNotifyTime_ = -1
	end,
	OnQueueUpdate = function(arg_8_0)
		manager.notify:CallUpdateFunc("OnQWorldMainQueueUpdate")
	end,
	GetRewards = function(arg_9_0, arg_9_1)
		table.insertto(arg_9_0.rewardListQueue_, arg_9_1)

		arg_9_0.rewardListQueue_ = mergeReward(arg_9_0.rewardListQueue_)

		arg_9_0:OnQueueUpdate()
	end,
	GetCriticalRewards = function(arg_10_0, arg_10_1)
		table.insertto(arg_10_0.criticalRewardListQueue_, arg_10_1)

		arg_10_0.criticalRewardListQueue_ = mergeReward(arg_10_0.criticalRewardListQueue_)

		arg_10_0:OnQueueUpdate()
	end,
	MainQuestsFinish = function(arg_11_0, arg_11_1)
		table.insertto(arg_11_0.mainQuestIdFinishQueue_, arg_11_1)
		table.insertto(arg_11_0.openFunctionIdQueue_, arg_11_1)
		arg_11_0:OnQueueUpdate()
	end,
	MainQuestsNew = function(arg_12_0, arg_12_1)
		table.insert(arg_12_0.mainQuestIdNewQueue_, arg_12_1)
		table.sort(arg_12_0.mainQuestIdNewQueue_, function(arg_13_0, arg_13_1)
			local var_13_0 = SandplayTaskMainCfg[arg_13_0]
			local var_13_1 = SandplayTaskMainCfg[arg_13_1]

			if var_13_0.main_task_type ~= var_13_1.main_task_type then
				return var_13_0.main_task_type < var_13_1.main_task_type
			end

			if var_13_0.chapter_task_id ~= var_13_1.chapter_task_id then
				return var_13_0.chapter_task_id ~= 0
			end

			if var_13_0.priority ~= var_13_1.priority then
				return var_13_0.priority < var_13_1.priority
			end

			return var_13_0.main_task_id < var_13_1.main_task_id
		end)
		arg_12_0:OnQueueUpdate()
	end,
	MainQuestUpdate = function(arg_14_0, arg_14_1)
		table.removebyvalue(arg_14_0.mainQuestIdUpdateQueue_, arg_14_1)
		table.insert(arg_14_0.mainQuestIdUpdateQueue_, arg_14_1)
		arg_14_0:OnQueueUpdate()
	end,
	ClearQuestNewQueue = function(arg_15_0)
		arg_15_0.mainQuestIdNewQueue_ = {}
	end,
	ClearInsignificantQueue = function(arg_16_0)
		arg_16_0.mainQuestIdNewQueue_ = {}
		arg_16_0.mainQuestIdFinishQueue_ = {}
		arg_16_0.rewardListQueue_ = {}
	end,
	ResetNotifyTime = function(arg_17_0)
		arg_17_0.nextNotifyTime_ = Time.time
	end,
	SubQuestFinish = function(arg_18_0, arg_18_1)
		table.insert(arg_18_0.openFunctionIdQueue_, arg_18_1)
		arg_18_0:OnQueueUpdate()
	end
}
