local var_0_0 = class("NewComboSkillInfoView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_skill/HeroSkillPopUPUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.comboSkillList = {}
end

function var_0_0.AddListeners(arg_4_0)
	arg_4_0:AddBtnListener(nil, arg_4_0.backBtn_, function()
		JumpTools.Back()
	end)
end

function var_0_0.CreatComboSkill(arg_6_0, arg_6_1)
	local var_6_0

	if arg_6_1 == 1 then
		var_6_0 = arg_6_0.empoweringskillGo_
	else
		var_6_0 = Object.Instantiate(arg_6_0.empoweringskillGo_, arg_6_0.contentTrs_)
	end

	arg_6_0.comboSkillList[arg_6_1] = NewComboSkillItem.New(var_6_0)

	return arg_6_0.comboSkillList[arg_6_1]
end

function var_0_0.OnEnter(arg_7_0)
	arg_7_0.heroId = arg_7_0.params_.heroID

	arg_7_0:UpdateSkillList()
end

function var_0_0.UpdateSkillList(arg_8_0)
	arg_8_0.comboSkillList_ = ComboSkillTools.GetHeroComboSkill(arg_8_0.params_.heroID)

	for iter_8_0, iter_8_1 in pairs(arg_8_0.comboSkillList) do
		SetActive(iter_8_1.gameObject_, false)
	end

	for iter_8_2, iter_8_3 in pairs(arg_8_0.comboSkillList_) do
		local var_8_0 = arg_8_0.comboSkillList[iter_8_2] or arg_8_0:CreatComboSkill(iter_8_2)

		SetActive(var_8_0.gameObject_, true)
		var_8_0:RefreshUI(iter_8_3, arg_8_0.heroId)
	end
end

function var_0_0.OnExit(arg_9_0)
	return
end

function var_0_0.Dispose(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.comboSkillList) do
		if iter_10_1 then
			iter_10_1:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
