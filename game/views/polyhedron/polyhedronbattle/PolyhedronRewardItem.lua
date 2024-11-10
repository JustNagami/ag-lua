local var_0_0 = class("PolyhedronRewardItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.typeController = ControllerUtil.GetController(arg_3_0.transform_, "type")
	arg_3_0.selectController = ControllerUtil.GetController(arg_3_0.transform_, "select")
	arg_3_0.artifactFrameController = ControllerUtil.GetController(arg_3_0.transform_, "artifactFrame")
	arg_3_0.shopControlle = ControllerUtil.GetController(arg_3_0.transform_, "shop")
	arg_3_0.shopDiscountControlle = ControllerUtil.GetController(arg_3_0.transform_, "shopDiscount")
	arg_3_0.attackTypeController = ControllerUtil.GetController(arg_3_0.transform_, "attackType")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.m_btn, nil, function()
		if arg_4_0.clickFunc then
			arg_4_0.clickFunc(arg_4_0.index)
		end
	end)
	arg_4_0.m_eventTrigger:AddListenerType1(UnityEngine.EventSystems.EventTriggerType.PointerClick, LuaHelper.EventTriggerAction1(function()
		if arg_4_0.clickFunc then
			arg_4_0.clickFunc(arg_4_0.index)
		end
	end))
end

function var_0_0.SetData(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.index = arg_7_3
	arg_7_0.data = arg_7_2
	arg_7_0.polyhedronInfo = arg_7_1

	arg_7_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_8_0)
	local var_8_0 = arg_8_0.data.class
	local var_8_1 = arg_8_0.data.params

	if var_8_0 == PolyhedronConst.ITEM_TYPE.ARTIFACT then
		arg_8_0.typeController:SetSelectedState("Artifact")

		local var_8_2 = var_8_1[1]
		local var_8_3 = PolyhedronArtifactCfg[var_8_2]
		local var_8_4 = var_8_3.affix_id

		arg_8_0.m_name.text = getAffixName({
			var_8_4,
			1
		})
		arg_8_0.m_desLab.text = getAffixDesc({
			var_8_4,
			1
		})
		arg_8_0.m_ArtifactIcon.sprite = getSpriteWithoutAtlas(PolyhedronConst.ARTIFACT_ICON_PATH .. var_8_3.icon)

		if var_8_3.exclusive_hero_id ~= 0 then
			arg_8_0.artifactFrameController:SetSelectedIndex(1)
		else
			arg_8_0.artifactFrameController:SetSelectedIndex(0)
		end
	elseif var_8_0 == PolyhedronConst.ITEM_TYPE.ARTIFACT_UP_LEVEL then
		arg_8_0.typeController:SetSelectedState("ArtifactLv")

		local var_8_5 = var_8_1[1]
		local var_8_6 = PolyhedronArtifactCfg[var_8_5]
		local var_8_7 = arg_8_0.polyhedronInfo:GetArtifact(var_8_5)
		local var_8_8 = var_8_7 and var_8_7.level or 1
		local var_8_9 = var_8_8 + 1

		arg_8_0.m_curLv.text = "LV." .. var_8_8
		arg_8_0.m_nextLv.text = "LV." .. var_8_9

		local var_8_10 = var_8_6.affix_id

		arg_8_0.m_name.text = getAffixName({
			var_8_10,
			1
		})
		arg_8_0.m_desLab.text = PolyhedronTools.getAffixUpLvDes(var_8_10, var_8_8, var_8_9)
		arg_8_0.m_ArtifactIcon.sprite = getSpriteWithoutAtlas(PolyhedronConst.ARTIFACT_ICON_PATH .. var_8_6.icon)

		if var_8_6.exclusive_hero_id ~= 0 then
			arg_8_0.artifactFrameController:SetSelectedIndex(1)
		else
			arg_8_0.artifactFrameController:SetSelectedIndex(0)
		end
	elseif var_8_0 == PolyhedronConst.ITEM_TYPE.BUFF then
		arg_8_0.typeController:SetSelectedState("buff")

		local var_8_11 = var_8_1[1]
		local var_8_12 = PolyhedronEffectCfg[var_8_11]

		arg_8_0.m_name.text = GetI18NText(var_8_12.name)
		arg_8_0.m_desLab.text = GetI18NText(var_8_12.desc)

		arg_8_0.artifactFrameController:SetSelectedIndex(0)

		arg_8_0.m_effectIcon.sprite = getSpriteWithoutAtlas(PolyhedronConst.EFFECT_ATTRIBUTE_ICON_PATH .. var_8_12.icon)
	elseif var_8_0 == PolyhedronConst.ITEM_TYPE.COIN then
		arg_8_0.typeController:SetSelectedState("coin")

		local var_8_13 = var_8_1[1]
		local var_8_14 = var_8_1[2]
		local var_8_15 = arg_8_0.polyhedronInfo:GetPolyhedronCoinId()
		local var_8_16 = ItemCfg[var_8_15]

		arg_8_0.m_name.text = ItemTools.getItemName(var_8_15)
		arg_8_0.m_desLab.text = string.format(GetTips("MATRIX_GET"), var_8_14, ItemTools.getItemName(var_8_15))

		arg_8_0.artifactFrameController:SetSelectedIndex(0)
	elseif var_8_0 == PolyhedronConst.ITEM_TYPE.HERO then
		arg_8_0.typeController:SetSelectedState("hero")

		local var_8_17 = var_8_1[1]
		local var_8_18 = HeroCfg[var_8_17]

		arg_8_0.m_heroName.text = GetI18NText(var_8_18.name)

		local var_8_19 = PolyhedronData:GetHeroUsingSkinInfo(var_8_17).id

		arg_8_0.m_heroIcon.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Icon/" .. var_8_19)

		local var_8_20 = var_8_18.mechanism_type[1]

		if var_8_20 == HeroConst.HERO_CHARGE_TYPE.RAGE then
			arg_8_0.m_heroDes2.text = GetTips("NOTE_ENERGYTYPE_1")
		elseif var_8_20 == HeroConst.HERO_CHARGE_TYPE.ENERGY then
			arg_8_0.m_heroDes2.text = GetTips("NOTE_ENERGYTYPE_2")
		elseif var_8_20 == HeroConst.HERO_CHARGE_TYPE.TRACES then
			arg_8_0.m_heroDes2.text = GetTips("NOTE_ENERGYTYPE_3")
		elseif var_8_20 == HeroConst.HERO_CHARGE_TYPE.DIVINE_GRACE then
			arg_8_0.m_heroDes2.text = GetTips("NOTE_ENERGYTYPE_4")
		end

		if #var_8_18.ATK_attribute > 1 then
			arg_8_0.attackTypeController:SetSelectedState(-1)
		else
			local var_8_21 = var_8_18.ATK_attribute[1]

			arg_8_0.attackTypeController:SetSelectedState(var_8_21)
		end

		local var_8_22 = PolyhedronHeroCfg[var_8_17].standard_id
		local var_8_23 = HeroStandardSystemCfg[var_8_22]

		arg_8_0.m_heroDes1.text = GetI18NText(var_8_23.hero_desc)

		local var_8_24 = RaceEffectCfg[var_8_18.race]

		arg_8_0.m_campIcon.sprite = getSprite("Atlas/CampItemAtlas", var_8_24.icon)

		arg_8_0.artifactFrameController:SetSelectedIndex(0)
	elseif var_8_0 == PolyhedronConst.ITEM_TYPE.BLOOD then
		arg_8_0.typeController:SetSelectedState("blood")

		local var_8_25 = var_8_1[1]

		if var_8_25 > 1000 then
			var_8_25 = 1000
		end

		arg_8_0.m_name.text = ""
		arg_8_0.m_desLab.text = string.format(GetTips("POLYHEDRON_HP_REWARD_TIP"), math.floor(var_8_25 / 10) .. "%")

		arg_8_0.artifactFrameController:SetSelectedIndex(0)
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.m_desTrs)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_0.m_desContentTrs)
end

function var_0_0.SetSelected(arg_9_0, arg_9_1)
	arg_9_0.selectController:SetSelectedIndex(arg_9_1 == arg_9_0.index and 1 or 0)
end

function var_0_0.RegistCallBack(arg_10_0, arg_10_1)
	arg_10_0.clickFunc = arg_10_1
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0.m_eventTrigger:RemoveListenerType(UnityEngine.EventSystems.EventTriggerType.PointerClick)
	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
