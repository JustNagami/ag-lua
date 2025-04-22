local var_0_0 = class("DrawLeftToggleGroupItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()
end

function var_0_0.Dispose(arg_2_0)
	if arg_2_0.rewardItemView_ then
		arg_2_0.rewardItemView_:Dispose()

		arg_2_0.rewardItemView_ = nil
	end

	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	arg_4_0.activityID_ = DrawTools.HasDrawBonusPoolList(arg_4_1)

	if arg_4_0.activityID_ then
		arg_4_0.rewardItemView_ = arg_4_0.rewardItemView_ or DrawLeftToggleRewardItem.New(arg_4_0.bonusGo_)

		arg_4_0.rewardItemView_:SetData(arg_4_0.activityID_)
	elseif arg_4_0.rewardItemView_ then
		arg_4_0.rewardItemView_:Show(false)
	end
end

return var_0_0
