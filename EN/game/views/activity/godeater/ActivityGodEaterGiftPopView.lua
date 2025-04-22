local var_0_0 = class("ActivityGodEaterGiftPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V4_2_GodEaterUI/V4_2_GodEaterUI_Main/V4_2_GodEaterUI_GiftPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.controller_ = arg_4_0.controllerEx_:GetController("isGet")
end

function var_0_0.OnEnter(arg_5_0)
	arg_5_0.activityID_ = ActivityConst.ACTIVITY_GODEATER_HERO_GIFT
	arg_5_0.giftID_ = ActivityPointRewardCfg.get_id_list_by_activity_id[arg_5_0.activityID_][1]
	arg_5_0.desText_.text = GetTips("ACTIVITY_GODEATER_HERO_GIFT_DES")

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.contentTrans_)

	if GodEaterData:GetHeroGiftIsGet(arg_5_0.giftID_) then
		arg_5_0.controller_:SetSelectedState("received")
	else
		arg_5_0.controller_:SetSelectedState("receive")
	end
end

function var_0_0.AddUIListener(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.btn_, nil, function()
		if ActivityData:GetActivityIsOpen(arg_6_0.activityID_) then
			if GodEaterData:GetHeroGiftIsGet(arg_6_0.giftID_) then
				ShowTips("ACTIVITY_GODEATER_HERO_GIFT_IS_GET")
			else
				ActivityAction.ReceivePointRewardWithCallBack({
					arg_6_0.giftID_
				}, function()
					GodEaterData:SetHeroGiftIsGet(arg_6_0.giftID_)
					arg_6_0.controller_:SetSelectedState("received")
				end)
			end
		else
			ShowTips("TIME_OVER")
		end
	end)
	arg_6_0:AddBtnListener(arg_6_0.bgBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_6_0:AddBtnListener(arg_6_0.bgBtn2_, nil, function()
		JumpTools.Back()
	end)
end

return var_0_0
