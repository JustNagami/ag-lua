﻿local var_0_0 = class("SectionStageInfoView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Show(true)
	arg_1_0:BindCfgUI()
end

function var_0_0.SetData(arg_2_0, arg_2_1)
	arg_2_0.icon_.sprite = HeroTools.GetSkillAttributeIcon(arg_2_1)
end

function var_0_0.Show(arg_3_0, arg_3_1)
	SetActive(arg_3_0.gameObject_, arg_3_1)
end

return var_0_0
