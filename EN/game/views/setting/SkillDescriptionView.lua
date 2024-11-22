local var_0_0 = class("SkillDescriptionView", ReduxView)

function var_0_0.SetActive(arg_1_0, arg_1_1)
	if arg_1_0.gameObject_ then
		SetActive(arg_1_0.gameObject_, arg_1_1)
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.hander_ = arg_2_1
	arg_2_0.transform_ = arg_2_2.transform
	arg_2_0.gameObject_ = arg_2_2
	arg_2_0.stageData = arg_2_3

	arg_2_0:Init()
end

function var_0_0.IsInTable(arg_3_0, arg_3_1, arg_3_2)
	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		if iter_3_1 == arg_3_1 then
			return true, iter_3_0
		end
	end

	return false
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
	arg_4_0:OnEnter()
end

function var_0_0.GetSkills(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = HeroCfg[arg_5_1]
	local var_5_1 = arg_5_2.weaponEffectID
	local var_5_2 = arg_5_2.astrolabe
	local var_5_3 = {}

	for iter_5_0, iter_5_1 in ipairs(var_5_0.equip_orange_skill) do
		if arg_5_0:IsInTable(var_5_1, WeaponServantCfg[iter_5_1[2]].effect) then
			var_5_3[iter_5_1[1]] = iter_5_1[3]
		end
	end

	for iter_5_2, iter_5_3 in ipairs(var_5_0.astrolabe_skill) do
		for iter_5_4 = 0, var_5_2.Length - 1 do
			if iter_5_3[2] == var_5_2[iter_5_4] then
				var_5_3[iter_5_3[1]] = iter_5_3[3]

				break
			end
		end
	end

	local var_5_4 = arg_5_0.stageData:GetType()
	local var_5_5 = {}
	local var_5_6 = {}

	if var_5_4 and (BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_MATRIX == var_5_4 or BattleConst.STAGE_TYPE_NEW.ACTIVITY_MATRIX == var_5_4 or BattleConst.STAGE_TYPE_NEW.POLYHEDRON == var_5_4) then
		var_5_5 = arg_5_0.stageData:GetSystemHeroTeam()
		var_5_6 = var_5_5
	else
		var_5_5, var_5_6 = arg_5_0.stageData:GetHeroTeam()
	end

	local var_5_7

	if var_5_6[1] ~= nil and var_5_6[1] > 0 then
		var_5_7 = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.TRIAL)

		var_5_7:SetTempHeroList({
			var_5_6[1]
		})
	elseif var_5_5[1] ~= nil and var_5_5[1] > 0 then
		var_5_7 = HeroViewDataProxy.New(HeroConst.HERO_DATA_TYPE.DEFAULT)

		var_5_7:SetTempHeroList({
			var_5_5[1]
		})
	end

	local var_5_8 = {}

	for iter_5_5, iter_5_6 in ipairs(var_5_0.skills) do
		if iter_5_6 ~= 0 then
			local var_5_9 = {
				id = iter_5_6
			}

			if var_5_3[iter_5_6] then
				var_5_9.id = var_5_3[iter_5_6]
			end

			local var_5_10 = SkillTools.GetIsDodgeSkill(var_5_9.id)
			local var_5_11 = 1

			if not var_5_10 then
				var_5_11 = arg_5_2.skillLevel[iter_5_5 - 1]
			end

			var_5_9.desc = var_5_7:GetSkillDesc(var_5_9.id, var_5_11, true)
			var_5_9.desc = string.gsub(var_5_9.desc, "\n\n", "\n")

			if not HeroSkillCfg[var_5_9.id] then
				CustomLog.Log(debug.traceback(string.format("nil")))
			end

			var_5_9.name = GetI18NText(HeroSkillCfg[var_5_9.id].name)
			var_5_9.ele = HeroSkillCfg[var_5_9.id].element_type
			var_5_9.sprite = getSprite("Atlas/" .. arg_5_1, var_5_9.id)
			var_5_9.subType = PublicSkillCfg[var_5_9.id].skill_sub_type

			if var_5_9.subType == nil then
				var_5_9.subType = 0
			end

			local var_5_12 = SkillSubTypeCfg.get_id_list_by_value[var_5_9.subType]

			var_5_9.subType = SkillSubTypeCfg[var_5_12[1]].annotation
			var_5_9.type = GetI18NText(var_5_0.skill_subhead[iter_5_5])

			table.insert(var_5_8, var_5_9)
		end
	end

	return var_5_8
end

function var_0_0.RefreshSkills(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.skills) do
		local var_6_0 = Object.Instantiate(arg_6_0.explainSkillTplGo_, arg_6_0.suitcontentSkillTrs_)
		local var_6_1 = var_6_0.transform:Find("skill/bg/icon"):GetComponent("Image")
		local var_6_2 = var_6_0.transform:Find("Adaptation/name/text"):GetComponent("Text")
		local var_6_3 = var_6_0.transform:Find("Adaptation/nametext"):GetComponent("Text")
		local var_6_4 = var_6_0.transform:Find("Adaptation/describetext"):GetComponent("Text")

		var_6_1.sprite = iter_6_1.sprite
		var_6_2.text = GetI18NText(iter_6_1.type)
		var_6_3.text = GetI18NText(iter_6_1.name)
		var_6_4.text = GetI18NText(iter_6_1.desc)

		if iter_6_1.ele == "" or iter_6_1.ele == nil then
			-- block empty
		else
			for iter_6_2, iter_6_3 in pairs(iter_6_1.ele) do
				local var_6_5 = var_6_0.transform:Find("Adaptation/nametext/element_icon_" .. iter_6_2)

				if var_6_5 then
					local var_6_6 = var_6_5:GetComponent("Image")

					if var_6_6 then
						local var_6_7 = SkillElementCfg[iter_6_3].icon

						if var_6_7 and var_6_7 ~= "" then
							SetActive(var_6_5.gameObject, true)

							var_6_6.sprite = getSprite("Atlas/Hero_arrtAtlas", SkillElementCfg[iter_6_3].icon)
						end
					end
				end
			end
		end

		SetActive(var_6_0, true)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_6_0.suitcontentSkillTrs_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_6_0.suitcontentSkillTrs_)

	arg_6_0.timerSkill_ = FrameTimer.New(function()
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_6_0.suitcontentSkillTrs_)
		UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_6_0.suitcontentSkillTrs_)
	end, 1, 1)

	arg_6_0.timerSkill_:Start()
end

function var_0_0.GetRecommendCombo(arg_8_0, arg_8_1)
	local var_8_0 = HeroCfg[arg_8_1]
	local var_8_1 = {}

	for iter_8_0, iter_8_1 in ipairs(var_8_0.recommend_combo) do
		local var_8_2 = SkillComboRecommenderCfg[iter_8_1]

		table.insert(var_8_1, var_8_2)
	end

	return var_8_1
end

function var_0_0.RefreshCombos(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.combos) do
		local var_9_0 = Object.Instantiate(arg_9_0.explainComboTplGo_, arg_9_0.suitcontentComboTrs_)
		local var_9_1 = var_9_0.transform:Find("nametext"):GetComponent("Text")
		local var_9_2 = var_9_0.transform:Find("describetext"):GetComponent("Text")
		local var_9_3 = var_9_0.transform:Find("panel")
		local var_9_4 = var_9_0.transform:Find("panel/skill").gameObject

		if iter_9_1.desc and iter_9_1.desc ~= "" then
			var_9_2.text = GetI18NText(iter_9_1.desc)
		else
			var_9_2.gameObject:SetActive(false)
		end

		var_9_1.text = GetI18NText(iter_9_1.name)

		if iter_9_1.list_icon[1] then
			local var_9_5 = #iter_9_1.list_icon

			for iter_9_2, iter_9_3 in ipairs(iter_9_1.list_icon) do
				local var_9_6 = Object.Instantiate(var_9_4, var_9_3)
				local var_9_7 = var_9_6.transform:Find("bg/icon"):GetComponent("Image")
				local var_9_8 = var_9_6.transform:Find("name/text"):GetComponent("Text")

				var_9_7.sprite = getSprite("Atlas/" .. arg_9_1, iter_9_1.list_icon[iter_9_2])
				var_9_8.text = GetI18NText(iter_9_1.list_name[iter_9_2])

				SetActive(var_9_6, true)

				local var_9_9 = var_9_6.transform:Find("sign"):GetComponent("Image")
				local var_9_10 = var_9_6.transform:Find("text"):GetComponent("Text")

				if var_9_5 ~= iter_9_2 then
					if iter_9_1.combine_char[iter_9_2] == "或" then
						var_9_9.enabled = false
						var_9_10.text = GetTips("TIP_OR")

						SetActive(var_9_10.gameObject, true)
					else
						var_9_9.enabled = true
						var_9_9.sprite = getSprite("Atlas/Setting", iter_9_1.combine_char[iter_9_2])
						var_9_10.text = ""

						SetActive(var_9_10.gameObject, false)
					end
				else
					var_9_9.enabled = false
					var_9_10.text = ""

					SetActive(var_9_10.gameObject, false)
				end
			end
		else
			var_9_3.gameObject:SetActive(false)
		end

		SetActive(var_9_0, true)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.suitcontentSkillTrs_)
end

function var_0_0.InitUI(arg_10_0)
	arg_10_0:BindCfgUI()

	arg_10_0.explainController = ControllerUtil.GetController(arg_10_0.explainGo_.transform, "name")
	arg_10_0.technicController = ControllerUtil.GetController(arg_10_0.technicGo_.transform, "name")
	arg_10_0.nType = 1

	local var_10_0 = GetSceneDataForExcehange().roleDataInLua[0]
	local var_10_1 = SkinCfg[var_10_0.ID].hero

	if var_10_1 == 10079 or var_10_1 == 10025 then
		return
	end

	if arg_10_0.stageData and arg_10_0.stageData:GetIsCooperation() then
		local var_10_2 = PlayerData:GetPlayerInfo().userID
		local var_10_3 = arg_10_0.stageData:GetRoleDatas()

		for iter_10_0, iter_10_1 in ipairs(var_10_3) do
			if tostring(iter_10_1.UID) == tostring(var_10_2) then
				var_10_1 = SkinCfg[iter_10_1.ID].hero
			end
		end
	end

	arg_10_0.skills = arg_10_0:GetSkills(var_10_1, var_10_0)

	arg_10_0:RefreshSkills()

	arg_10_0.combos = arg_10_0:GetRecommendCombo(var_10_1)

	arg_10_0:RefreshCombos(var_10_1)
end

function var_0_0.AddUIListener(arg_11_0)
	arg_11_0:AddToggleListener(arg_11_0.explainTgl_, function(arg_12_0)
		SetActive(arg_11_0.skillpanelGo_, arg_12_0)
		arg_11_0.explainController:SetSelectedIndex(arg_12_0 and 0 or 1)
		arg_11_0.technicController:SetSelectedIndex(arg_12_0 and 1 or 0)

		if arg_12_0 then
			OperationRecorder.Record("battle", "skillExplain")

			if arg_11_0.hander_.RecordStaySkill then
				arg_11_0.hander_:RecordStaySkill(2)
			end

			arg_11_0.nType = 1
		end
	end)
	arg_11_0:AddToggleListener(arg_11_0.technicTgl_, function(arg_13_0)
		SetActive(arg_11_0.recommendpanelGo_, arg_13_0)
		arg_11_0.explainController:SetSelectedIndex(arg_13_0 and 1 or 0)
		arg_11_0.technicController:SetSelectedIndex(arg_13_0 and 0 or 1)

		if arg_13_0 then
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_0.suitcontentComboTrs_)
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_0.suitcontentComboTrs_)
			OperationRecorder.Record("battle", "recommend")

			if arg_11_0.hander_.RecordStaySkill then
				arg_11_0.hander_:RecordStaySkill(1)
			end

			arg_11_0.nType = 2
		end
	end)
end

function var_0_0.OnEnter(arg_14_0)
	local var_14_0 = GetSceneDataForExcehange().roleDataInLua[0]
	local var_14_1 = SkinCfg[var_14_0.ID].hero

	arg_14_0.explainTgl_.isOn = true
end

function var_0_0.Dispose(arg_15_0)
	var_0_0.super.Dispose(arg_15_0)

	if arg_15_0.timerSkill_ then
		arg_15_0.timerSkill_:Stop()
	end

	arg_15_0.hander_ = nil
	arg_15_0.data = nil
end

return var_0_0
