local var_0_0 = class("CustomDesItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.AddUIListeners(arg_4_0)
	return
end

function var_0_0.OnEnter(arg_5_0)
	return
end

function var_0_0.RefreshUI(arg_6_0, arg_6_1)
	local var_6_0 = ActivityAffixPoolCfg[arg_6_1].affix
	local var_6_1 = {
		"Ⅰ",
		"Ⅱ",
		"Ⅲ",
		"Ⅳ",
		"Ⅴ",
		"Ⅵ",
		"Ⅶ",
		"Ⅷ",
		"Ⅸ"
	}

	arg_6_0.text_.text = string.format("<size=28>%s</size>", GetI18NText(AffixTypeCfg[var_6_0[1]].name) .. var_6_1[var_6_0[2]]) .. "\n" .. string.format("<size=22>%s</size>", getAffixDesc(var_6_0))
	arg_6_0.icon_.sprite = getAffixSprite(var_6_0)
end

function var_0_0.OnExit(arg_7_0)
	return
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
