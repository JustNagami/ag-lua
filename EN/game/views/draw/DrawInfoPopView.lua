local var_0_0 = class("DrawInfoPopView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Pool/PoolInfoPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.probabilityCfgList = {}
	arg_4_0.items = {}
	arg_4_0.stateCon_ = arg_4_0.transform_:GetComponent("ControllerExCollection"):GetController("state")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.bgMask_, nil, function()
		arg_5_0.stateCon_:SetSelectedState("info")
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnInfo_, nil, function()
		arg_5_0.stateCon_:SetSelectedState("info")
	end)
	arg_5_0:AddBtnListener(arg_5_0.btnMessage_, nil, function()
		arg_5_0.stateCon_:SetSelectedState("message")
	end)
end

function var_0_0.OnEnter(arg_9_0)
	local var_9_0 = arg_9_0.params_.poolId
	local var_9_1 = DrawData:GetPoolData(var_9_0)

	arg_9_0:RefreshInfo(var_9_0, var_9_1)
	arg_9_0:RefreshMessage(var_9_0, var_9_1)
	TimeTools.StartAfterSeconds(0.033, function()
		arg_9_0.contentTrs_.localPosition = Vector3.New(0, 0, 0)
	end, {})
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.contentTrs_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.layout_1)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.layout_2)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.layout_3)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_0.layout_4)
end

function var_0_0.RefreshInfo(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = DrawPoolCfg[arg_11_1]

	arg_11_0:SetInfoText(var_11_0, arg_11_2)
end

function var_0_0.RefreshMessage(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0:GetProbabilityList(arg_12_1, arg_12_2)
	local var_12_1 = #var_12_0

	for iter_12_0 = 1, var_12_1 do
		if not arg_12_0.items[iter_12_0] then
			local var_12_2 = Object.Instantiate(arg_12_0.msgItem_, arg_12_0.contentTrs_)

			arg_12_0.items[iter_12_0] = DrawInfoMessageItem.New(var_12_2)
		end

		local var_12_3 = var_12_0[iter_12_0]

		arg_12_0.items[iter_12_0]:RefreshData(var_12_3)
	end

	for iter_12_1 = var_12_1 + 1, #arg_12_0.items do
		arg_12_0.items[iter_12_1]:Show(false)
	end
end

function var_0_0.GetProbabilityList(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = DrawPoolCfg[arg_13_1].pool_type
	local var_13_1 = {}

	if var_13_0 == 2 then
		local var_13_2 = {}

		var_13_2.define = "DRAW_POOL_PROBABILITY_FIVE_WEAPON"
		var_13_2.poolId = arg_13_1
		var_13_2.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FIVE_WEAPON_1].desc
		var_13_2.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FIVE_WEAPON_2].desc
		var_13_2.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FIVE_WEAPON_3].desc
		var_13_2.s_up_servant = {}
		var_13_2.s_all_servant = {}

		if arg_13_2.s_up_item then
			for iter_13_0, iter_13_1 in ipairs(arg_13_2.s_up_item) do
				table.insert(var_13_2.s_up_servant, iter_13_1)
				table.insert(var_13_2.s_all_servant, iter_13_1)
			end

			if arg_13_2.s_other_item then
				for iter_13_2, iter_13_3 in ipairs(arg_13_2.s_other_item) do
					table.insert(var_13_2.s_all_servant, iter_13_3)
				end
			end
		else
			for iter_13_4, iter_13_5 in ipairs(arg_13_2.s_other_item) do
				table.insert(var_13_2.s_all_servant, iter_13_5)
			end
		end

		table.insert(var_13_1, var_13_2)

		local var_13_3 = {}

		var_13_3.define = "DRAW_POOL_PROBABILITY_FOUR_WEAPON"
		var_13_3.poolId = arg_13_1
		var_13_3.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FOUR_WEAPON_1].desc
		var_13_3.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FOUR_WEAPON_2].desc
		var_13_3.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_FOUR_WEAPON_3].desc
		var_13_3.a_up_servant = {}
		var_13_3.a_all_servant = {}

		if arg_13_2.a_up_item then
			for iter_13_6, iter_13_7 in ipairs(arg_13_2.a_up_item) do
				table.insert(var_13_3.a_up_servant, iter_13_7)
				table.insert(var_13_3.a_all_servant, iter_13_7)
			end

			if arg_13_2.a_other_item then
				for iter_13_8, iter_13_9 in ipairs(arg_13_2.a_other_item) do
					table.insert(var_13_3.a_all_servant, iter_13_9)
				end
			end
		else
			for iter_13_10, iter_13_11 in ipairs(arg_13_2.a_other_item) do
				table.insert(var_13_3.a_all_servant, iter_13_11)
			end
		end

		table.insert(var_13_1, var_13_3)

		local var_13_4 = {}

		var_13_4.define = "DRAW_POOL_PROBABILITY_THREE_WEAPON"
		var_13_4.poolId = arg_13_1
		var_13_4.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_THREE_WEAPON_1].desc
		var_13_4.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_THREE_WEAPON_2].desc
		var_13_4.b_servant = {}

		if arg_13_2.b_item then
			for iter_13_12, iter_13_13 in ipairs(arg_13_2.b_item) do
				if DrawItemCfg[iter_13_13].pool_id ~= 301 then
					table.insert(var_13_4.b_servant, iter_13_13)
				end
			end
		end

		table.insert(var_13_1, var_13_4)
	elseif var_13_0 == 8 then
		local var_13_5 = {}

		var_13_5.define = "DRAW_POOL_PROBABILITY_S"
		var_13_5.poolId = arg_13_1
		var_13_5.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_1].desc
		var_13_5.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_2].desc
		var_13_5.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_6].desc
		var_13_5.s_up_probability = arg_13_2.s_up_probability
		var_13_5.s_up_hero = {}
		var_13_5.s_all_hero = {}

		if arg_13_2.s_up_item then
			for iter_13_14, iter_13_15 in ipairs(arg_13_2.s_up_item) do
				table.insert(var_13_5.s_up_hero, iter_13_15)
				table.insert(var_13_5.s_all_hero, iter_13_15)
			end

			if arg_13_2.s_other_item then
				for iter_13_16, iter_13_17 in ipairs(arg_13_2.s_other_item) do
					table.insert(var_13_5.s_all_hero, iter_13_17)
				end
			end
		else
			for iter_13_18, iter_13_19 in ipairs(arg_13_2.s_other_item) do
				table.insert(var_13_5.s_all_hero, iter_13_19)
			end
		end

		table.insert(var_13_1, var_13_5)

		local var_13_6 = {}

		var_13_6.define = "DRAW_POOL_PROBABILITY_A"
		var_13_6.poolId = arg_13_1
		var_13_6.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_1].desc
		var_13_6.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_2].desc
		var_13_6.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_3].desc
		var_13_6.a_up_probability = arg_13_2.a_up_probability
		var_13_6.a_up_hero = {}
		var_13_6.a_all_hero = {}

		if arg_13_2.a_up_item then
			for iter_13_20, iter_13_21 in ipairs(arg_13_2.a_up_item) do
				table.insert(var_13_6.a_up_hero, iter_13_21)
				table.insert(var_13_6.a_all_hero, iter_13_21)
			end

			if arg_13_2.a_other_item then
				for iter_13_22, iter_13_23 in ipairs(arg_13_2.a_other_item) do
					table.insert(var_13_6.a_all_hero, iter_13_23)
				end
			end
		else
			for iter_13_24, iter_13_25 in ipairs(arg_13_2.a_other_item) do
				table.insert(var_13_6.a_all_hero, iter_13_25)
			end
		end

		table.insert(var_13_1, var_13_6)

		local var_13_7 = {}

		var_13_7.define = "DRAW_POOL_PROBABILITY_B"
		var_13_7.poolId = arg_13_1
		var_13_7.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_B_1].desc
		var_13_7.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_B_2].desc
		var_13_7.b_hero = {}

		if arg_13_2.b_item then
			for iter_13_26, iter_13_27 in ipairs(arg_13_2.b_item) do
				if DrawItemCfg[iter_13_27].pool_id == 301 then
					table.insert(var_13_7.b_hero, iter_13_27)
				end
			end
		end

		table.insert(var_13_1, var_13_7)

		local var_13_8 = {}

		var_13_8.define = "DRAW_POOL_PROBABILITY_C"
		var_13_8.poolId = arg_13_1
		var_13_8.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_C_1].desc
		var_13_8.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_C_2].desc
		var_13_8.b_servant = {}

		if arg_13_2.b_item then
			for iter_13_28, iter_13_29 in ipairs(arg_13_2.b_item) do
				if DrawItemCfg[iter_13_29].pool_id ~= 301 then
					table.insert(var_13_8.b_servant, iter_13_29)
				end
			end
		end

		table.insert(var_13_1, var_13_8)
	else
		local var_13_9 = {}

		var_13_9.define = "DRAW_POOL_PROBABILITY_S"
		var_13_9.poolId = arg_13_1
		var_13_9.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_1].desc
		var_13_9.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_2].desc
		var_13_9.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_S_3].desc
		var_13_9.s_up_probability = arg_13_2.s_up_probability
		var_13_9.s_up_hero = {}
		var_13_9.s_all_hero = {}

		if arg_13_2.s_up_item then
			for iter_13_30, iter_13_31 in ipairs(arg_13_2.s_up_item) do
				table.insert(var_13_9.s_up_hero, iter_13_31)
				table.insert(var_13_9.s_all_hero, iter_13_31)
			end

			if arg_13_2.s_other_item then
				for iter_13_32, iter_13_33 in ipairs(arg_13_2.s_other_item) do
					table.insert(var_13_9.s_all_hero, iter_13_33)
				end
			end
		else
			for iter_13_34, iter_13_35 in ipairs(arg_13_2.s_other_item) do
				table.insert(var_13_9.s_all_hero, iter_13_35)
			end
		end

		table.insert(var_13_1, var_13_9)

		local var_13_10 = {}

		var_13_10.define = "DRAW_POOL_PROBABILITY_A"
		var_13_10.poolId = arg_13_1
		var_13_10.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_1].desc
		var_13_10.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_2].desc
		var_13_10.probability2 = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_A_3].desc
		var_13_10.a_up_probability = arg_13_2.a_up_probability
		var_13_10.a_up_hero = {}
		var_13_10.a_all_hero = {}

		if arg_13_2.a_up_item then
			for iter_13_36, iter_13_37 in ipairs(arg_13_2.a_up_item) do
				table.insert(var_13_10.a_up_hero, iter_13_37)
				table.insert(var_13_10.a_all_hero, iter_13_37)
			end

			if arg_13_2.a_other_item then
				for iter_13_38, iter_13_39 in ipairs(arg_13_2.a_other_item) do
					table.insert(var_13_10.a_all_hero, iter_13_39)
				end
			end
		else
			for iter_13_40, iter_13_41 in ipairs(arg_13_2.a_other_item) do
				table.insert(var_13_10.a_all_hero, iter_13_41)
			end
		end

		table.insert(var_13_1, var_13_10)

		local var_13_11 = {}

		var_13_11.define = "DRAW_POOL_PROBABILITY_B"
		var_13_11.poolId = arg_13_1
		var_13_11.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_B_1].desc
		var_13_11.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_B_2].desc
		var_13_11.b_hero = {}

		if arg_13_2.b_item then
			for iter_13_42, iter_13_43 in ipairs(arg_13_2.b_item) do
				if DrawItemCfg[iter_13_43].pool_id == 301 then
					table.insert(var_13_11.b_hero, iter_13_43)
				end
			end
		end

		table.insert(var_13_1, var_13_11)

		local var_13_12 = {}

		var_13_12.define = "DRAW_POOL_PROBABILITY_C"
		var_13_12.poolId = arg_13_1
		var_13_12.name = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_C_1].desc
		var_13_12.probability = TipsCfg[TipsCfg.get_id_list_by_define.DRAW_POOL_PROBABILITY_C_2].desc
		var_13_12.b_servant = {}

		if arg_13_2.b_item then
			for iter_13_44, iter_13_45 in ipairs(arg_13_2.b_item) do
				if DrawItemCfg[iter_13_45].pool_id ~= 301 then
					table.insert(var_13_12.b_servant, iter_13_45)
				end
			end
		end

		table.insert(var_13_1, var_13_12)
	end

	arg_13_0.probabilityCfgList[arg_13_1] = var_13_1

	return var_13_1
end

function var_0_0.SetInfoText(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1.draw_pool_desc

	for iter_14_0 = 1, 15 do
		if var_14_0 == "DRAW_POOL_DESC_TEMP_FIXED_" .. iter_14_0 then
			arg_14_0.infoTxt_.text = GetTips(var_14_0)
		end
	end

	if var_14_0 == "DRAW_POOL_DESC_TEMP_1" then
		local var_14_1 = arg_14_2.s_up_item[1]
		local var_14_2 = DrawItemCfg[var_14_1].item_id
		local var_14_3 = HeroTools.GetHeroFullName(var_14_2)

		arg_14_0.infoTxt_.text = string.format(GetTips(var_14_0), var_14_3, var_14_3)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_2" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_3" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_4" or var_14_0 == "DRAW_POOL_DESC_TEMP_8" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_5" or var_14_0 == "DRAW_POOL_DESC_TEMP_10" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_6" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_11" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	elseif var_14_0 == "DRAW_POOL_DESC_TEMP_7" or var_14_0 == "DRAW_POOL_DESC_TEMP_9" then
		arg_14_0:DescModule(arg_14_1, arg_14_2)

		return
	end
end

function var_0_0.DescModule(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_2.s_up_probability .. "%"
	local var_15_1 = arg_15_1.draw_pool_desc
	local var_15_2 = GetI18NText(arg_15_1.name)
	local var_15_3 = arg_15_2.s_up_item[1]
	local var_15_4 = DrawItemCfg[var_15_3].item_id
	local var_15_5 = HeroTools.GetHeroFullName(var_15_4)

	if var_15_1 == "DRAW_POOL_DESC_TEMP_11" then
		local var_15_6 = DrawPoolCfg[arg_15_0.params_.poolId]
		local var_15_7 = ""

		for iter_15_0 = 1, #var_15_6.optional_detail do
			var_15_7 = var_15_7 .. string.format("<color=#E78300>「%s」</color>", HeroTools.GetHeroFullName(var_15_6.optional_detail[iter_15_0]))

			if iter_15_0 ~= #var_15_6.optional_detail then
				var_15_7 = var_15_7 .. "、"
			end
		end

		arg_15_0.infoTxt_.text = string.format(GetTips(var_15_1), var_15_7, var_15_0)

		return
	end

	if arg_15_2.a_up_item[1] ~= nil then
		local var_15_8 = arg_15_2.a_up_item[1]
		local var_15_9 = DrawItemCfg[var_15_8].item_id
		local var_15_10 = HeroTools.GetHeroFullName(var_15_9)
		local var_15_11 = arg_15_2.a_up_item[2]
		local var_15_12 = DrawItemCfg[var_15_11].item_id
		local var_15_13 = HeroTools.GetHeroFullName(var_15_12)
		local var_15_14 = arg_15_2.a_up_item[3]
		local var_15_15 = DrawItemCfg[var_15_14].item_id
		local var_15_16 = HeroTools.GetHeroFullName(var_15_15)
		local var_15_17 = arg_15_2.a_up_probability .. "%"

		arg_15_0.infoTxt_.text = string.format(GetTips(var_15_1), var_15_2, var_15_5, var_15_10, var_15_13, var_15_16, var_15_2, var_15_0, var_15_5, var_15_17, var_15_10, var_15_13, var_15_16, var_15_2)
	else
		arg_15_0.infoTxt_.text = string.format(GetTips(var_15_1), var_15_2, var_15_5, var_15_2, var_15_0, var_15_5, var_15_2)
	end
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)

	if arg_16_0.items then
		for iter_16_0, iter_16_1 in ipairs(arg_16_0.items) do
			iter_16_1:Dispose()
		end

		arg_16_0.items = nil
	end

	if arg_16_0.probabilityCfgList then
		for iter_16_2, iter_16_3 in ipairs(arg_16_0.probabilityCfgList) do
			iter_16_3 = nil
		end
	end
end

return var_0_0
