ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("ActivityPromotionalView", ActivityMainBasePanel)

function var_0_0.GetUIName(arg_1_0)
	return ActivityPromotionalCfg[arg_1_0.activityID_].prefab_name
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)

	arg_2_0.heroController_ = ControllerUtil.GetController(arg_2_0.heroTrialTf_, "name")
	arg_2_0.skinController_ = ControllerUtil.GetController(arg_2_0.heroSkinTf_, "name")
end

function var_0_0.OnEnter(arg_3_0)
	var_0_0.super.OnEnter(arg_3_0)
	arg_3_0:AddTimer()

	if arg_3_0.btnTxt_ then
		arg_3_0.btnTxt_.text = GetTips("ACTIVITY_PROMOTIONAL_GOTODRAW")
	end
end

function var_0_0.OnExit(arg_4_0)
	var_0_0.super.OnExit(arg_4_0)
	arg_4_0:StopTimer()
end

function var_0_0.Dispose(arg_5_0)
	var_0_0.super.Dispose(arg_5_0)
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.heroTrialBtn_, nil, function()
		SDKTools.SendMessageToSDK("hero_publicize_page_jump", {
			type = 1
		})

		local var_7_0 = ActivityPromotionalCfg[arg_6_0.activityID_]

		JumpTools.JumpToPage2(var_7_0.hero_trial_navigation)
	end)
	arg_6_0:AddBtnListener(arg_6_0.heroSkinBtn_, nil, function()
		SDKTools.SendMessageToSDK("hero_publicize_page_jump", {
			type = 2
		})

		local var_8_0 = ActivityPromotionalCfg[arg_6_0.activityID_]

		JumpTools.JumpToPage2(var_8_0.hero_skin_navigation)
	end)
	arg_6_0:AddBtnListener(arg_6_0.heroDrawBtn_, nil, function()
		SDKTools.SendMessageToSDK("hero_publicize_page_jump", {
			type = 3
		})
		OperationRecorder.RecordButtonTouch("activity_hero_" .. arg_6_0.activityID_)

		local var_9_0 = ActivityPromotionalCfg[arg_6_0.activityID_]

		JumpTools.JumpToPage2(var_9_0.hero_draw_navigation)
	end)

	local var_6_0 = 1

	while arg_6_0[string.format("extraJumpBtn_%s", var_6_0)] ~= nil do
		local var_6_1 = var_6_0

		arg_6_0:AddBtnListener(arg_6_0[string.format("extraJumpBtn_%s", var_6_1)], nil, function()
			local var_10_0 = ActivityPromotionalCfg[arg_6_0.activityID_]

			if type(var_10_0.extra_jump_list) == "table" and var_10_0.extra_jump_list[var_6_1] then
				JumpTools.JumpToPage2(var_10_0.extra_jump_list[var_6_1])
			else
				Debug.LogError(string.format("ActivityPromotionalCfg[%s]的extra_jump_list[%s]没有配", arg_6_0.activityID_, var_6_1))
			end
		end)

		var_6_0 = var_6_0 + 1
	end
end

function var_0_0.HideRedPoint(arg_11_0)
	local var_11_0 = arg_11_0.activityID_

	if not RedPointData:GetIsRedPointOpen(RedPointConst.ACTIVITY_RANGE + var_11_0) then
		RedPointAction.HandleRedPoint(RedPointConst.ACTIVITY_RANGE + var_11_0)
		manager.redPoint:setTip(string.format("%s%s", ActivityTools.GetRedPointKey(var_11_0), var_11_0), 0)
	end
end

function var_0_0.Show(arg_12_0, arg_12_1)
	var_0_0.super.Show(arg_12_0, arg_12_1)

	if arg_12_1 then
		arg_12_0:RefreshHeroTrialState()
		arg_12_0:RefreshHeroSkinState()
	end
end

function var_0_0.RefreshHeroTrialState(arg_13_0)
	local var_13_0 = ActivityPromotionalCfg[arg_13_0.activityID_].hero_trial_id
	local var_13_1 = HeroTrialData:GetHeroTrialStateList()[var_13_0]

	if var_13_1 == 1 or var_13_1 == 2 then
		arg_13_0.heroController_:SetSelectedState("true")
	else
		arg_13_0.heroController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshHeroSkinState(arg_14_0)
	local var_14_0 = ActivityPromotionalCfg[arg_14_0.activityID_].hero_skin_id

	if SkinTrialData:IsCompleted(var_14_0) then
		arg_14_0.skinController_:SetSelectedState("true")
	else
		arg_14_0.skinController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshTime(arg_15_0)
	local var_15_0 = ActivityData:GetActivityData(arg_15_0.activityID_)
	local var_15_1 = manager.time:GetServerTime()

	arg_15_0.timeText_.text = manager.time:GetLostTimeStr2(var_15_0.stopTime, true)
end

function var_0_0.AddTimer(arg_16_0)
	arg_16_0:StopTimer()
	arg_16_0:RefreshTime()

	arg_16_0.timer_ = Timer.New(function()
		arg_16_0:RefreshTime()
	end, 1, -1)

	arg_16_0.timer_:Start()
end

function var_0_0.StopTimer(arg_18_0)
	if arg_18_0.timer_ then
		arg_18_0.timer_:Stop()

		arg_18_0.timer_ = nil
	end
end

return var_0_0
