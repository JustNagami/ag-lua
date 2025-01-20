local var_0_0 = class("GuideManager")

function var_0_0.Ctor(arg_1_0)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0.view = GuideView.New()
	arg_2_0.weakView = GuideWeakView.New()
	arg_2_0._guides = {}
	arg_2_0._gorupTimes = {}
	arg_2_0._timer = FrameTimer.New(handler(arg_2_0, arg_2_0.Process), 1, -1)
	arg_2_0.stuckTime_ = GameSetting.newbie_stuck_time.value[1]
	arg_2_0.startCheckTime_ = nil
end

function var_0_0.IsPlaying(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0._guides) do
		if iter_3_1:IsPlaying() then
			return true, iter_3_1:GetId()
		end
	end

	return false
end

function var_0_0.AddGuide(arg_4_0, arg_4_1)
	local var_4_0 = GuideBaseCfg[arg_4_1]

	if not var_4_0 then
		return
	end

	if GuideData:IsFinish(arg_4_1) then
		return
	end

	if var_4_0.skip_condition[1] ~= nil and GuideTool.SatisfyCondition(var_4_0.skip_condition) then
		return
	end

	local var_4_1

	if arg_4_1 == 3 then
		var_4_1 = Guide_3.New(arg_4_1)
	elseif arg_4_1 == 8 then
		var_4_1 = Guide_8.New(arg_4_1)
	elseif arg_4_1 == 1101 then
		var_4_1 = Guide_1101.New(arg_4_1)
	elseif arg_4_1 == 14 then
		var_4_1 = Guide_14.New(arg_4_1)
	elseif arg_4_1 == 15 then
		var_4_1 = Guide_15.New(arg_4_1)
	elseif arg_4_1 == 17 then
		var_4_1 = Guide_17.New(arg_4_1)
	elseif arg_4_1 == 19 then
		var_4_1 = Guide_19.New(arg_4_1)
	elseif arg_4_1 == 27 or arg_4_1 == 29 then
		var_4_1 = Guide_skuld.New(arg_4_1)
	elseif arg_4_1 == 28 then
		var_4_1 = Guide_28.New(arg_4_1)
	elseif arg_4_1 == 4601 then
		var_4_1 = Guide_4601.New(arg_4_1)
	elseif arg_4_1 == 53 then
		var_4_1 = Guide_53.New(arg_4_1)
	elseif arg_4_1 == 60 then
		var_4_1 = Guide_60.New(arg_4_1)
	elseif arg_4_1 == 73 then
		var_4_1 = Guide_73.New(arg_4_1)
	elseif arg_4_1 == 74 then
		var_4_1 = Guide_74.New(arg_4_1)
	elseif arg_4_1 == 76 then
		var_4_1 = Guide_76.New(arg_4_1)
	elseif arg_4_1 == 93 then
		var_4_1 = Guide_93.New(arg_4_1)
	elseif arg_4_1 == 94 then
		var_4_1 = Guide_94.New(arg_4_1)
	elseif arg_4_1 == 95 then
		var_4_1 = Guide_95.New(arg_4_1)
	elseif arg_4_1 == 96 then
		var_4_1 = Guide_96.New(arg_4_1)
	elseif arg_4_1 == 98 then
		var_4_1 = Guide_98.New(arg_4_1)
	elseif arg_4_1 == 108 then
		var_4_1 = Guide_108.New(arg_4_1)
	elseif arg_4_1 == 109 then
		var_4_1 = Guide_109.New(arg_4_1)
	elseif arg_4_1 == 111 then
		var_4_1 = Guide_111.New(arg_4_1)
	else
		var_4_1 = BaseGuide.New(arg_4_1)
	end

	if var_4_1 ~= nil then
		var_4_1:ClearSteps()
		table.insert(arg_4_0._guides, var_4_1)
	end
end

function var_0_0.InitGuide(arg_5_0)
	if PlayerPrefs.GetInt("OpenGuide", 0) == 1 then
		return true
	end

	arg_5_0._guides = {}

	for iter_5_0, iter_5_1 in ipairs(GuideBaseCfg.all) do
		arg_5_0:AddGuide(iter_5_1)
	end

	if table.length(arg_5_0._guides) > 0 then
		arg_5_0:Process()
		arg_5_0._timer:Start()
	end
end

function var_0_0.Process(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0._guides) do
		if iter_6_1:IsPlaying() then
			if iter_6_1:Check() then
				arg_6_0:onStepStart(iter_6_1)
				iter_6_1:Play()
				arg_6_0:ClearStuck()
			else
				arg_6_0:CheckStuck(iter_6_1)
			end

			return
		end
	end

	for iter_6_2, iter_6_3 in ipairs(arg_6_0._guides) do
		if iter_6_3:Check() and manager.story.player_ == nil and not manager.posterGirl:IsPlayingDebut() and not gameContext:GetOpenPageHandler("assetPendPop") then
			iter_6_3:InitSteps()
			GuideTool.Log("GuideBase Start id :" .. iter_6_3:GetId())

			if arg_6_0.weakView:GetIsInWeakGuide() then
				arg_6_0.weakView:Hide(true)
			end

			if GuideBaseCfg[iter_6_3:GetId()].is_no_home then
				manager.audio:PlayEffect("ui_battle", "ui_battle_stopbgm")
			end

			manager.notify:Invoke(GUIDE_START)

			return
		end
	end
end

function var_0_0.onStepStart(arg_7_0)
	arg_7_0._timer:Stop()
end

local function var_0_1(arg_8_0)
	local var_8_0 = GuideBaseCfg.get_id_list_by_not_skip_guide[1]

	if var_8_0 == nil then
		return false
	end

	return table.indexof(var_8_0, arg_8_0:GetId())
end

function var_0_0.CheckStuck(arg_9_0, arg_9_1)
	arg_9_0.startCheckTime_ = arg_9_0.startCheckTime_ or Time.time

	if Time.time - arg_9_0.startCheckTime_ > arg_9_0.stuckTime_ and not arg_9_0.ignoreStuck_ and arg_9_1 ~= nil and not var_0_1(arg_9_1) then
		arg_9_0.view:ShowBreakStuck(arg_9_1, true)

		arg_9_0.ignoreStuck_ = true

		GuideTool.Log("GuideBase Stuck id :" .. arg_9_1:GetId())
	end
end

function var_0_0.SetIgnoreStuck(arg_10_0, arg_10_1)
	arg_10_0.ignoreStuck_ = arg_10_1
end

function var_0_0.ClearStuck(arg_11_0)
	arg_11_0.startCheckTime_ = nil

	arg_11_0.view:ShowBreakStuck(nil, false)

	arg_11_0.ignoreStuck_ = false
end

function var_0_0.OnStepEnd(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_2 then
		arg_12_0.view:Hide()
	else
		arg_12_0.view:HideButton()
	end

	if arg_12_1:IsPlaying() then
		arg_12_0._timer:Start()
	else
		arg_12_0:OnGuideEnd(arg_12_1)

		local var_12_0 = table.indexof(arg_12_0._guides, arg_12_1)

		if var_12_0 then
			table.remove(arg_12_0._guides, var_12_0)
		end

		if table.length(arg_12_0._guides) > 0 then
			arg_12_0._timer:Start()
		else
			SendMessageManagerToSDK("tutorial_complete")
		end
	end
end

function var_0_0.OnGuideFinish(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:GetId()

	NewPlayerGuideAction.GuideUpdateID(var_13_0)
	SendMessageManagerToSDK("tutorial", {
		guideId = var_13_0
	})

	if var_13_0 == 8 then
		SendMessageManagerToSDK("tutorial_complete")
	end

	GuideTool.Log("GuideBase Finish id :" .. arg_13_1:GetId())
end

function var_0_0.OnGuideEnd(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:GetId()
	local var_14_1 = arg_14_1:GetStarTime()
	local var_14_2 = Time.realtimeSinceStartup - var_14_1

	NewPlayerGuideAction.GuideUpdateIDEnd(var_14_0, var_14_2)
	GuideTool.Log("GuideBase End id :" .. arg_14_1:GetId() .. "  useTime : " .. var_14_2)

	local var_14_3 = GuideBaseCfg[var_14_0]

	arg_14_0:UpdateGroupLastTime(var_14_3.group)
end

function var_0_0.SkipGuide(arg_15_0, arg_15_1)
	arg_15_0:ClearStuck()
	arg_15_0:OnGuideFinish(arg_15_1)

	local var_15_0 = table.indexof(arg_15_0._guides, arg_15_1)

	if var_15_0 then
		table.remove(arg_15_0._guides, var_15_0)
	end
end

function var_0_0.PaseGuide(arg_16_0, arg_16_1)
	local var_16_0 = table.indexof(arg_16_0._guides, arg_16_1)

	if var_16_0 then
		table.remove(arg_16_0._guides, var_16_0)
	end
end

function var_0_0.SkipAll(arg_17_0)
	return
end

function var_0_0.OnComponentClick(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0._guides) do
		if iter_18_1:IsPlaying() then
			iter_18_1:Click()
		end
	end
end

function var_0_0.OnEventTrigger(arg_19_0, arg_19_1, arg_19_2)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0._guides) do
		if iter_19_1:IsPlaying() then
			iter_19_1:EventTrigger(arg_19_1, arg_19_2)
		end
	end
end

function var_0_0.OnBattleFinish(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0._guides) do
		if iter_20_1:IsPlaying() then
			iter_20_1:BattleFinish(arg_20_1)
		end
	end
end

function var_0_0.IsGoToHome(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0._guides) do
		if iter_21_1:IsPlaying() then
			return iter_21_1:IsGoToHome()
		end
	end

	return true
end

function var_0_0.OnLogout(arg_22_0)
	arg_22_0._timer:Stop()

	for iter_22_0, iter_22_1 in ipairs(arg_22_0._guides) do
		iter_22_1:Dispose()
	end

	arg_22_0._guides = {}
	arg_22_0._gorupTimes = {}

	arg_22_0.view:Dispose()
	arg_22_0.weakView:Dispose()
end

function var_0_0.Dispose(arg_23_0)
	arg_23_0:OnLogout()
end

local var_0_2

function var_0_0.GetIntervalTime(arg_24_0)
	if var_0_2 ~= nil then
		return var_0_2
	end

	var_0_2 = GameSetting.guide_base_time and GameSetting.guide_base_time.value[1] or 0

	return var_0_2
end

function var_0_0.UpdateGroupLastTime(arg_25_0, arg_25_1)
	if arg_25_1 == 0 then
		return
	end

	arg_25_0._gorupTimes[arg_25_1] = os.time()
end

function var_0_0.CheckGroupLastTime(arg_26_0, arg_26_1)
	if arg_26_1 == 0 then
		return true
	else
		local var_26_0 = arg_26_0._gorupTimes[arg_26_1] or 0

		return arg_26_0:GetIntervalTime() < os.time() - var_26_0
	end
end

function var_0_0.ShowWeakView(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_0.weakView:Init()
	arg_27_0.weakView:UpdateView(arg_27_1, arg_27_2, arg_27_3)
end

function var_0_0.GetCurrentGuideStepID(arg_28_0)
	for iter_28_0, iter_28_1 in ipairs(arg_28_0._guides) do
		if iter_28_1:IsPlaying() then
			return iter_28_1._steps[1]._stepId
		end
	end

	return 0
end

return var_0_0
