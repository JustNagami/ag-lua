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
	elseif arg_4_1 == 11 then
		var_4_1 = Guide_11.New(arg_4_1)
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
	elseif arg_4_1 == 46 then
		var_4_1 = Guide_46.New(arg_4_1)
	elseif arg_4_1 == 53 then
		var_4_1 = Guide_53.New(arg_4_1)
	elseif arg_4_1 == 60 then
		var_4_1 = Guide_60.New(arg_4_1)
	else
		var_4_1 = BaseGuide.New(arg_4_1)
	end

	if var_4_1 ~= nil then
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
		if iter_6_3:Check() and manager.story.player_ == nil and not manager.posterGirl:IsPlayingDebut() then
			iter_6_3:InitSteps()
			GuideTool.Log("GuideBase Start id :" .. iter_6_3:GetId())

			if arg_6_0.weakView:GetIsInWeakGuide() then
				arg_6_0.weakView:Hide(true)
			end

			manager.notify:Invoke(GUIDE_START)

			return
		end
	end
end

function var_0_0.onStepStart(arg_7_0)
	arg_7_0._timer:Stop()
end

function var_0_0.CheckStuck(arg_8_0, arg_8_1)
	arg_8_0.startCheckTime_ = arg_8_0.startCheckTime_ or Time.time

	if Time.time - arg_8_0.startCheckTime_ > arg_8_0.stuckTime_ and not arg_8_0.hasShowStuckBtn_ and arg_8_1 ~= nil and not table.indexof(GuideBaseCfg.get_id_list_by_not_skip_guide[1], arg_8_1:GetId()) then
		arg_8_0.view:ShowBreakStuck(arg_8_1, true)

		arg_8_0.hasShowStuckBtn_ = true

		GuideTool.Log("GuideBase Stuck id :" .. arg_8_1:GetId())
	end
end

function var_0_0.ClearStuck(arg_9_0)
	arg_9_0.startCheckTime_ = nil

	arg_9_0.view:ShowBreakStuck(nil, false)

	arg_9_0.hasShowStuckBtn_ = false
end

function var_0_0.OnStepEnd(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 then
		arg_10_0.view:Hide()
	else
		arg_10_0.view:HideButton()
	end

	if arg_10_1:IsPlaying() then
		arg_10_0._timer:Start()
	else
		arg_10_0:OnGuideEnd(arg_10_1)

		local var_10_0 = table.indexof(arg_10_0._guides, arg_10_1)

		if var_10_0 then
			table.remove(arg_10_0._guides, var_10_0)
		end

		if table.length(arg_10_0._guides) > 0 then
			arg_10_0._timer:Start()
		else
			SendMessageManagerToSDK("tutorial_complete")
		end
	end
end

function var_0_0.OnGuideFinish(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1:GetId()

	NewPlayerGuideAction.GuideUpdateID(var_11_0)
	SendMessageManagerToSDK("tutorial", {
		guideId = var_11_0
	})

	if var_11_0 == 8 then
		SendMessageManagerToSDK("tutorial_complete")
	end

	GuideTool.Log("GuideBase Finish id :" .. arg_11_1:GetId())
end

function var_0_0.OnGuideEnd(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:GetId()
	local var_12_1 = arg_12_1:GetStarTime()
	local var_12_2 = Time.realtimeSinceStartup - var_12_1

	NewPlayerGuideAction.GuideUpdateIDEnd(var_12_0, var_12_2)
	GuideTool.Log("GuideBase End id :" .. arg_12_1:GetId() .. "  useTime : " .. var_12_2)

	local var_12_3 = GuideBaseCfg[var_12_0]

	arg_12_0:UpdateGroupLastTime(var_12_3.group)
end

function var_0_0.SkipGuide(arg_13_0, arg_13_1)
	arg_13_0:ClearStuck()
	arg_13_0:OnGuideFinish(arg_13_1)

	local var_13_0 = table.indexof(arg_13_0._guides, arg_13_1)

	if var_13_0 then
		table.remove(arg_13_0._guides, var_13_0)
	end
end

function var_0_0.PaseGuide(arg_14_0, arg_14_1)
	local var_14_0 = table.indexof(arg_14_0._guides, arg_14_1)

	if var_14_0 then
		table.remove(arg_14_0._guides, var_14_0)
	end
end

function var_0_0.SkipAll(arg_15_0)
	return
end

function var_0_0.OnComponentClick(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0._guides) do
		if iter_16_1:IsPlaying() then
			iter_16_1:Click()
		end
	end
end

function var_0_0.OnEventTrigger(arg_17_0, arg_17_1, arg_17_2)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0._guides) do
		if iter_17_1:IsPlaying() then
			iter_17_1:EventTrigger(arg_17_1, arg_17_2)
		end
	end
end

function var_0_0.OnBattleFinish(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0._guides) do
		if iter_18_1:IsPlaying() then
			iter_18_1:BattleFinish(arg_18_1)
		end
	end
end

function var_0_0.IsGoToHome(arg_19_0)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0._guides) do
		if iter_19_1:IsPlaying() then
			return iter_19_1:IsGoToHome()
		end
	end

	return true
end

function var_0_0.OnLogout(arg_20_0)
	arg_20_0._timer:Stop()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0._guides) do
		iter_20_1:Dispose()
	end

	arg_20_0._guides = {}
	arg_20_0._gorupTimes = {}

	arg_20_0.view:Dispose()
	arg_20_0.weakView:Dispose()
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0:OnLogout()
end

local var_0_1

function var_0_0.GetIntervalTime(arg_22_0)
	if var_0_1 ~= nil then
		return var_0_1
	end

	var_0_1 = GameSetting.guide_base_time and GameSetting.guide_base_time.value[1] or 0

	return var_0_1
end

function var_0_0.UpdateGroupLastTime(arg_23_0, arg_23_1)
	if arg_23_1 == 0 then
		return
	end

	arg_23_0._gorupTimes[arg_23_1] = os.time()
end

function var_0_0.CheckGroupLastTime(arg_24_0, arg_24_1)
	if arg_24_1 == 0 then
		return true
	else
		local var_24_0 = arg_24_0._gorupTimes[arg_24_1] or 0

		return arg_24_0:GetIntervalTime() < os.time() - var_24_0
	end
end

function var_0_0.ShowWeakView(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0.weakView:Init()
	arg_25_0.weakView:UpdateView(arg_25_1, arg_25_2, arg_25_3)
end

return var_0_0
