local var_0_0 = class("ActivityGodEaterGameMainView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Main/V4_2_GodEaterUI_MainUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:InitBtnCfg()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.giftController_ = arg_4_0.giftControllerEx_:GetController("gift")
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0.activity_id = arg_5_0.params_ and arg_5_0.params_activity_id or ActivityConst.ACTIVITY_GODEATER_MAIN_KEY

	arg_5_0:RegistEventListener(ACTIVITY_GODEATER_LV_INFO, function()
		arg_5_0:RefreshUI()
	end)
	arg_5_0:ResetAnimation()

	local var_5_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[ActivityConst.ACTIVITY_GODEATER_HERO_GIFT][1]

	if GodEaterData:GetHeroGiftIsGet(var_5_0) then
		arg_5_0.giftController_:SetSelectedState("received")
	else
		arg_5_0.giftController_:SetSelectedState("receive")
	end

	for iter_5_0, iter_5_1 in pairs(arg_5_0.btnCfg) do
		local var_5_1 = iter_5_1.router
		local var_5_2 = iter_5_1.param_
		local var_5_3 = iter_5_1.animation

		if iter_5_1 and iter_5_1.redPointKey ~= "" then
			manager.redPoint:bindUIandKey(arg_5_0[iter_5_1.key].transform, iter_5_1.redPointKey)
		end
	end

	manager.redPoint:bindUIandKey(arg_5_0.taskBtn_.transform, RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL)
	GodEaterData:UpdateHudLevel()
end

function var_0_0.ResetAnimation(arg_7_0)
	arg_7_0.root_doorAni_:Play("idle", 0, 0)

	arg_7_0.isAnimation = false
end

function var_0_0.OnTop(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR,
		INFO_BAR
	})
	manager.windowBar:SetGameHelpKey("GOD_EATER_GAME_TIPS_1")
	arg_8_0:RefreshUI()
	arg_8_0:UpdateBtn()
	arg_8_0:ResetAnimation()

	local var_8_0 = ActivityPointRewardCfg.get_id_list_by_activity_id[ActivityConst.ACTIVITY_GODEATER_HERO_GIFT][1]

	if GodEaterData:GetHeroGiftIsGet(var_8_0) then
		arg_8_0.giftController_:SetSelectedState("received")
	else
		arg_8_0.giftController_:SetSelectedState("receive")
	end
end

function var_0_0.RefreshUI(arg_9_0)
	local var_9_0, var_9_1, var_9_2 = GodEaterTool.HubExpToLevel(GodEaterData.totalExp)

	arg_9_0.lvtextText_.text = var_9_0
	arg_9_0.processText_.text = string.format(GetTips("GODEATER_DES_1"), var_9_1, var_9_2)
	arg_9_0.slider_yellowTrs_.localScale = Vector3.New(var_9_2 == 0 and 1 or var_9_1 / var_9_2, 1, 1)
	arg_9_0.iconImg_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.ACTIVITY_GOD_EATER_HUB_EXP)

	if not arg_9_0.lastLv then
		-- block empty
	elseif arg_9_0.lastLv ~= var_9_0 then
		JumpTools.OpenPageByJump("ActivityGodEaterLvUpView", {
			lastlV = arg_9_0.lastLv,
			nowlV = var_9_0
		})
	end

	arg_9_0.lastLv = var_9_0
end

function var_0_0.InitBtnCfg(arg_10_0)
	arg_10_0.btnCfg = {
		{
			redPointKey = "",
			router = "/goldMinerSelectLevelView",
			key = "button1Btn_",
			activityID = ActivityConst.ACTIVITY_GOLDMINER,
			param_ = {
				activityID = ActivityConst.ACTIVITY_GOLDMINER
			},
			animation = {
				arg_10_0.root_doorAni_,
				"Door_open"
			}
		},
		{
			redPointKey = "",
			controller = "namebg02Controllerexcollection_",
			router = "/civilizationGameMainView",
			key = "button2Btn_",
			activityID = 0,
			animation = {
				arg_10_0.root_doorAni_,
				"Root_left"
			},
			condition = function()
				return GameSetting.godeater_subactivity_unlock1.value[1] <= GodEaterData.hubLv
			end,
			lockTips = string.format(GetTips("GODEATER_DES_5"), GameSetting.godeater_subactivity_unlock1.value[1])
		},
		{
			router = "/ActivityGodEaterGameTaskView",
			key = "button3Btn_",
			activityID = 0,
			animation = {
				arg_10_0.root_doorAni_,
				"Root_desk"
			},
			redPointKey = RedPointConst.ACTIVITY_GODEATER_TASK_REWARD_1
		},
		{
			router = "/eatGodBattleEnterView",
			key = "button4Btn_",
			activityID = 0,
			animation = {
				arg_10_0.root_doorAni_,
				"Root_right"
			},
			redPointKey = RedPointConst.ACTIVITY_GODEATER_BOSS_BATTLE
		}
	}
end

function var_0_0.AddUIListeners(arg_12_0)
	arg_12_0:AddBtnListener(arg_12_0.taskBtn_, nil, function()
		return
	end)

	for iter_12_0, iter_12_1 in pairs(arg_12_0.btnCfg) do
		local var_12_0 = iter_12_1.router
		local var_12_1 = iter_12_1.param_
		local var_12_2 = iter_12_1.animation
		local var_12_3 = iter_12_1.condition
		local var_12_4 = iter_12_1.lockTips

		arg_12_0:AddBtnListener(arg_12_0[iter_12_1.key], nil, function(arg_14_0)
			if arg_12_0.isAnimation then
				return
			end

			if var_12_3 and not var_12_3() or false then
				ShowTips(var_12_4)

				return
			end

			arg_12_0.isAnimation = true

			if var_12_2 then
				AnimatorTools.PlayAnimationWithCallback(var_12_2[1], var_12_2[2], function()
					JumpTools.OpenPageByJump(var_12_0, var_12_1)
				end)
			else
				JumpTools.OpenPageByJump(var_12_0, var_12_1)
			end
		end)
	end

	arg_12_0:AddBtnListener(arg_12_0.shopBtn_, nil, function()
		JumpTools.GoToSystem("/activityShop", {
			shopId = ShopConst.SHOP_ID.GODEARTER_SHOP_1,
			showShops = {
				ShopConst.SHOP_ID.GODEARTER_SHOP_1
			}
		}, ViewConst.SYSTEM_ID.SHOP)
	end)
	arg_12_0:AddBtnListener(arg_12_0.giftBtn_, nil, function()
		if ActivityData:GetActivityIsOpen(ActivityConst.ACTIVITY_GODEATER_HERO_GIFT) then
			JumpTools.OpenPageByJump("activityGodEaterGiftPopView")
		end
	end)
end

function var_0_0.UpdateBtn(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.btnCfg) do
		local var_18_0 = iter_18_1.router
		local var_18_1 = iter_18_1.param_
		local var_18_2 = iter_18_1.controller
		local var_18_3 = iter_18_1.param_
		local var_18_4 = iter_18_1.condition

		if activityID and activityID ~= 0 then
			SetActive(arg_18_0[iter_18_1.key].gameObject, ActivityData:GetActivityIsOpen(activityID))
		end

		if var_18_2 and var_18_4 then
			print(arg_18_0[var_18_2], var_18_4())
			arg_18_0[var_18_2]:GetController("unlock"):SetSelectedState(var_18_4() and "true" or "false")
		end
	end
end

function var_0_0.OnBehind(arg_19_0)
	manager.windowBar:HideBar()
end

function var_0_0.OnExit(arg_20_0)
	var_0_0.super.OnExit(arg_20_0)
	manager.windowBar:HideBar()
	arg_20_0:StopTimer()
	arg_20_0:RemoveTween()
	manager.redPoint:unbindUIandKey(arg_20_0.taskBtn_.transform, RedPointConst.ACTIVITY_GODEATER_HUB_REWARD_ALL)

	for iter_20_0, iter_20_1 in pairs(arg_20_0.btnCfg) do
		if iter_20_1 and iter_20_1.redPointKey ~= "" then
			manager.redPoint:unbindUIandKey(arg_20_0[iter_20_1.key].transform, iter_20_1.redPointKey)
		end
	end
end

function var_0_0.RemoveTween(arg_21_0)
	return
end

function var_0_0.StopTimer(arg_22_0)
	if arg_22_0.timer_ then
		arg_22_0.timer_:Stop()

		arg_22_0.timer_ = nil
	end
end

function var_0_0.Dispose(arg_23_0)
	var_0_0.super.Dispose(arg_23_0)
end

return var_0_0
