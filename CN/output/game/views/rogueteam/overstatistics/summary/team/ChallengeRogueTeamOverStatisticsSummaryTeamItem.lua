﻿local var_0_0 = class("ChallengeRogueTeamOverStatisticsSummaryTeamItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = Object.Instantiate(arg_1_1, arg_1_2.transform)
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()
end

function var_0_0.Dispose(arg_2_0)
	var_0_0.super.Dispose(arg_2_0)
	Object.Destroy(arg_2_0.gameObject_)

	arg_2_0.transform_ = nil
	arg_2_0.gameObject_ = nil
end

function var_0_0.AddListeners(arg_3_0)
	return
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1.heroID
	local var_4_1 = arg_4_1.trialID
	local var_4_2

	if var_4_1 ~= 0 then
		var_4_2 = HeroStandardSystemCfg[var_4_1].skin_id
	else
		var_4_2 = ChallengeRogueTeamData:GetHeroUsingSkinInfo(var_4_0).id
	end

	arg_4_0.icon_.sprite = getSpriteViaConfig("HeroIcon", var_4_2)

	arg_4_0:Show(true)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	SetActive(arg_5_0.gameObject_, arg_5_1)
end

return var_0_0