local var_0_0 = class("NewSectionComboSkillView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Show(true)
	arg_1_0:Init()
end

function var_0_0.Dispose(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.heroItemList_) do
		iter_2_1:Dispose()
	end

	arg_2_0.heroItemList_ = nil

	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.stateController_ = arg_4_0.controllerExCollection_:GetController("state")
	arg_4_0.heroItemList_ = {}
end

function var_0_0.AddListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.btn_, nil, function()
		if not arg_5_0.sectionProxy_.canChangeComboSkill then
			ShowTips("CANNOT_CHANGE_COMBO_SKILL")

			return
		end

		arg_5_0:ClickComboSkillBtn()
	end)
end

function var_0_0.ClickComboSkillBtn(arg_7_0)
	JumpTools.OpenPageByJump("sectionComboSelect", {
		stageType = arg_7_0.sectionProxy_.stageType,
		stageID = arg_7_0.sectionProxy_.stageID,
		heroList = arg_7_0.sectionProxy_:GetHeroIDList(),
		trialList = arg_7_0.sectionProxy_:GetTrialIDList(),
		customComboSkillID = arg_7_0.sectionProxy_.customComboSkill,
		comboSkillID = arg_7_0.comboSkillID_,
		sectionProxy = arg_7_0.sectionProxy_
	})
end

function var_0_0.SetProxy(arg_8_0, arg_8_1)
	arg_8_0.sectionProxy_ = arg_8_1
end

function var_0_0.SetData(arg_9_0)
	arg_9_0.comboSkillID_ = arg_9_0:GetComboSkillID()

	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	if arg_10_0.comboSkillID_ == 0 then
		arg_10_0.stateController_:SetSelectedState("unEquip")
	else
		arg_10_0.stateController_:SetSelectedState("equip")

		local var_10_0 = ComboSkillCfg[arg_10_0.comboSkillID_]
		local var_10_1 = HeroSkillCfg[var_10_0.skill_id]

		arg_10_0.skillIcon_.sprite = getSpriteViaConfig("ComboSkill", var_10_0.skill_id)
		arg_10_0.titleText_.text = var_10_1.name

		for iter_10_0, iter_10_1 in ipairs(var_10_0.cooperate_role_ids) do
			if not arg_10_0.heroItemList_[iter_10_0] then
				local var_10_2 = Object.Instantiate(arg_10_0.heroItemGo_, arg_10_0.heroContentTrans_)

				arg_10_0.heroItemList_[iter_10_0] = SectionSmallHeroItem.New(var_10_2)
			end

			arg_10_0.heroItemList_[iter_10_0]:SetData(iter_10_1)
		end

		for iter_10_2 = #var_10_0.cooperate_role_ids + 1, 3 do
			if arg_10_0.heroItemList_[iter_10_2] then
				arg_10_0.heroItemList_[iter_10_2]:Show(false)
			end
		end
	end
end

function var_0_0.GetComboSkillID(arg_11_0)
	return arg_11_0.sectionProxy_:GetComboSkillID()
end

function var_0_0.GetCurComboSkill(arg_12_0)
	return arg_12_0.comboSkillID_ or 0
end

function var_0_0.Show(arg_13_0, arg_13_1)
	SetActive(arg_13_0.gameObject_, arg_13_1)
end

function var_0_0.OnComboSkillSelect(arg_14_0)
	arg_14_0.comboSkillID_ = arg_14_0:GetComboSkillID()

	arg_14_0:RefreshUI()
end

return var_0_0
