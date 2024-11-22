local var_0_0 = class("ActivityHeroEnhanceTalentDetailView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddUIListener()

	arg_2_0.talentItem_ = ActivityHeroEnhanceTalentItem.New(arg_2_0.talentGo_)
	arg_2_0.useController_ = arg_2_0.controller_:GetController("use")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.useBtn_, nil, function()
		if arg_3_0.onClickBtnHandler_ then
			arg_3_0.onClickBtnHandler_(true, arg_3_0.talentId_)
		end
	end)
	arg_3_0:AddBtnListener(arg_3_0.dropBtn_, nil, function()
		if arg_3_0.onClickBtnHandler_ then
			arg_3_0.onClickBtnHandler_(false, arg_3_0.talentId_)
		end
	end)
end

function var_0_0.OnEnter(arg_6_0)
	return
end

function var_0_0.OnExit(arg_7_0)
	return
end

function var_0_0.SetData(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.activityId_ = arg_8_1
	arg_8_0.talentId_ = arg_8_2
end

function var_0_0.SetClickBtnHandler(arg_9_0, arg_9_1)
	arg_9_0.onClickBtnHandler_ = arg_9_1
end

function var_0_0.RefreshUI(arg_10_0)
	local var_10_0 = arg_10_0.activityId_
	local var_10_1 = arg_10_0.talentId_

	arg_10_0.talentItem_:SetData(var_10_0, var_10_1)
	arg_10_0.talentItem_:RefreshUI()

	local var_10_2 = TalentTreeCfg[var_10_1]

	arg_10_0.descText_.text = GetI18NText(var_10_2.desc)

	local var_10_3 = ActivityHeroEnhanceTools.GetTalentLockConditionId(var_10_0, var_10_1)

	if var_10_3 then
		arg_10_0.useController_:SetSelectedState("lock")

		local var_10_4 = ConditionCfg[var_10_3]

		arg_10_0.lockText_.text = var_10_4.desc
	else
		local var_10_5 = ActivityHeroEnhanceData:IsTalentActivated(var_10_0, var_10_1)

		arg_10_0.useController_:SetSelectedState(var_10_5 and "used" or "use")
	end
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.talentItem_:Dispose()
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
