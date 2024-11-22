local var_0_0 = class("CoreVerificationMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Core_Verification/CoreVerificationMain"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.updateInfoHandler = handler(arg_4_0, arg_4_0.UpdateCoreVerification)
	arg_4_0.mainBossItem_ = CoreVerificationBossItem.New(arg_4_0.boss1Go_, 1)
	arg_4_0.subBossItem_ = CoreVerificationBossItem.New(arg_4_0.boss2Go_, 2)
end

function var_0_0.AddUIListeners(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.rewardBtn_, nil, function()
		JumpTools.OpenPageByJump("/coreVerificationReward", {})
	end)
	arg_5_0:AddBtnListener(arg_5_0.shopBtn_, nil, function()
		JumpTools.GoToSystem("/shop", {
			shopId = ShopConst.SHOP_ID.CORE_VERIFICATION
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
	arg_5_0:AddBtnListener(arg_5_0.previewBtn_, nil, function()
		JumpTools.OpenPageByJump("/coreVerificationPre", {})
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_flushedBtn_, nil, function()
		ShowMessageBox({
			isTop = true,
			content = GetTips("CORE_VERIFICATION_RESETTIPS1"),
			OkCallback = function()
				CoreVerificationAction.ResetChallenge(0)
			end
		})
	end)

	if arg_5_0.rewardDescBtn_ then
		arg_5_0:AddBtnListener(arg_5_0.rewardDescBtn_, nil, function()
			arg_5_0:GetToRewardDesc()
		end)
	end
end

function var_0_0.UpdateCoreVerification(arg_12_0)
	CoreVerificationAction.UpdateChallengeRedPoints()
	arg_12_0:RefreshTitle()
end

function var_0_0.OnEnter(arg_13_0)
	saveData("CoreVerification", "click_time", _G.gameTimer:GetNextDayFreshTime())
	CoreVerificationAction.UpdateChallengeRedPoints()
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("CORE_VERIFICATION_DES")
	manager.redPoint:bindUIandKey(arg_13_0.rewardBtn_.transform, RedPointConst.CORE_VERIFICATION_REWARD)
	arg_13_0:RefreshTitle()
	manager.notify:RegistListener(CORE_VERIFICATION_CYCLE_UPDATE, arg_13_0.updateInfoHandler)

	if arg_13_0.rewardDescBtn_ and ActivityData:GetActivityIsOpen(112) then
		SetActive(arg_13_0.rewardDescBtn_.gameObject, true)

		if not CoreVerificationData:GetIsFirstEnter() then
			arg_13_0:GetToRewardDesc()
			CoreVerificationData:SetIsFirstEnter(true)
		end
	else
		SetActive(arg_13_0.rewardDescBtn_.gameObject, false)
	end
end

function var_0_0.GetToRewardDesc(arg_14_0)
	JumpTools.OpenPageByJump("gameHelp", {
		icon = "icon_i",
		key = "CORE_VERIFICATION_CHALLENGE",
		iconColor = Color(1, 1, 1),
		title = GetTips("CORE_VERIFICATION_CHALLENGE_TITLE"),
		content = GetTips("CORE_VERIFICATION_CHALLENGE")
	})
end

function var_0_0.OnExit(arg_15_0)
	manager.redPoint:unbindUIandKey(arg_15_0.rewardBtn_.transform, RedPointConst.CORE_VERIFICATION_REWARD)
	manager.notify:RemoveListener(CORE_VERIFICATION_CYCLE_UPDATE, arg_15_0.updateInfoHandler)
	manager.windowBar:HideBar()
end

function var_0_0.RefreshTitle(arg_16_0)
	arg_16_0.timeText_.text = manager.time:GetLostTimeStrWith2Unit(CoreVerificationData:GetRefreshTime())

	arg_16_0.mainBossItem_:RefreshUI()
	arg_16_0.subBossItem_:RefreshUI()
	SetActive(arg_16_0.btn_flushedBtn_.gameObject, CoreVerificationData:GetCanReset())
end

function var_0_0.Dispose(arg_17_0)
	if arg_17_0.subBossItem_ then
		arg_17_0.subBossItem_:Dispose()

		arg_17_0.subBossItem_ = nil
	end

	if arg_17_0.mainBossItem_ then
		arg_17_0.mainBossItem_:Dispose()

		arg_17_0.mainBossItem_ = nil
	end

	var_0_0.super.Dispose(arg_17_0)
end

return var_0_0
