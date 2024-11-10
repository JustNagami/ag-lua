local var_0_0 = class("JumpToStep", BaseStep)

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0.team = GuideStepCfg[arg_1_0._stepId].params
end

function var_0_0.Play(arg_2_0)
	local var_2_0 = ComboSkillTools.GetRecommendSkillID(arg_2_0.team, true)
	local var_2_1 = ReserveParams.New(ReserveConst.RESERVE_TYPE.PLOT, nil, nil)

	ReserveTools.SetHeroList(var_2_1, arg_2_0.team, {
		0,
		0,
		0
	})
	ReserveTools.SetComboSkillID(var_2_1, var_2_0)
	arg_2_0:OnStepEnd()
end

function var_0_0.GetShowMask(arg_3_0)
	if arg_3_0._stepId == 405 then
		return true
	end

	return false
end

return var_0_0
