local var_0_0 = class("ActivityHeroEnhanceTalentItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:AddUIListener()

	arg_2_0.selController_ = arg_2_0.controller_:GetController("select")
	arg_2_0.lockController_ = arg_2_0.controller_:GetController("lock")
	arg_2_0.addController_ = arg_2_0.controller_:GetController("add")
	arg_2_0.useController_ = arg_2_0.controller_:GetController("use")
	arg_2_0.effectController_ = arg_2_0.controller_:GetController("effect")
end

function var_0_0.AddUIListener(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btn_, nil, function()
		if arg_3_0.onClickHandler_ then
			arg_3_0.onClickHandler_(arg_3_0.talentId_)
		end
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.activityId_ = arg_5_1
	arg_5_0.talentId_ = arg_5_2
end

function var_0_0.SetSelected(arg_6_0, arg_6_1)
	arg_6_0.selected_ = arg_6_1
end

function var_0_0.SetUsed(arg_7_0, arg_7_1)
	arg_7_0.used_ = arg_7_1
end

function var_0_0.SetLock(arg_8_0, arg_8_1)
	arg_8_0.locked_ = arg_8_1
end

function var_0_0.SetFirstAddFlag(arg_9_0, arg_9_1)
	arg_9_0.isFirstAdd_ = arg_9_1
end

function var_0_0.SetClickHandler(arg_10_0, arg_10_1)
	arg_10_0.onClickHandler_ = arg_10_1
end

local var_0_1 = {
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

function var_0_0.RefreshUI(arg_11_0)
	local var_11_0 = arg_11_0.talentId_

	if var_11_0 then
		local var_11_1 = TalentTreeCfg[var_11_0]

		arg_11_0.affixImage_.sprite = getAffixSprite({
			var_11_1.affix_id
		})

		if arg_11_0.affixNameText_ then
			arg_11_0.affixNameText_.text = GetI18NText(var_11_1.name)
		end

		local var_11_2 = ActivityHeroEnhanceTools.GetCfgByTalentId(arg_11_0.activityId_, var_11_0)
		local var_11_3 = ActivityHeroEnhanceTools.GetCfgTalentListByStage(var_11_2, var_11_1.stage)
		local var_11_4 = table.indexof(var_11_3, var_11_0)

		arg_11_0.affixLevelText_.text = var_0_1[var_11_4]

		SetActive(arg_11_0.affixLevelGo_, true)
		arg_11_0.addController_:SetSelectedState("false")
	else
		if arg_11_0.affixNameText_ then
			arg_11_0.affixNameText_.text = ""
		end

		SetActive(arg_11_0.affixLevelGo_, false)
		arg_11_0.addController_:SetSelectedState("true")
	end

	if arg_11_0.effectController_ then
		if arg_11_0.isFirstAdd_ then
			arg_11_0.effectController_:SetSelectedState("firstAdd")
		else
			arg_11_0.effectController_:SetSelectedState("none")
		end
	end

	arg_11_0.selController_:SetSelectedState(arg_11_0.selected_ and "true" or "false")
	arg_11_0.lockController_:SetSelectedState(arg_11_0.locked_ and "true" or "false")
	arg_11_0.useController_:SetSelectedState(arg_11_0.used_ and "true" or "false")
end

function var_0_0.Dispose(arg_12_0)
	var_0_0.super.Dispose(arg_12_0)
end

return var_0_0
