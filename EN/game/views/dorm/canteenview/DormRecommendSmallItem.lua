local var_0_0 = class("DormRecommendSmallItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()

	arg_2_0.statusController_ = ControllerUtil.GetController(arg_2_0.transform_, "state")
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.RefreshUI(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1.type

	if var_4_0 == 1 then
		for iter_4_0, iter_4_1 in ipairs(GameDisplayCfg.hero_range_type_white_tag.value) do
			if iter_4_1[1] == arg_4_1.tag then
				arg_4_0.recIcon_.sprite = getSprite("Atlas/Hero_arrtAtlas", iter_4_1[2])
			end
		end
	elseif var_4_0 == 2 then
		for iter_4_2, iter_4_3 in ipairs(GameDisplayCfg.hero_race_type_white_tag.value) do
			if iter_4_3[1] == arg_4_1.tag then
				arg_4_0.recIcon_.sprite = getSprite("Atlas/SystemGroupAtlas", iter_4_3[2])
			end
		end
	elseif var_4_0 == 3 then
		for iter_4_4, iter_4_5 in ipairs(GameDisplayCfg.hero_atack_type_white_tag.value) do
			if iter_4_5[1] == arg_4_1.tag then
				arg_4_0.recIcon_.sprite = getSprite("Atlas/Hero_arrtAtlas", iter_4_5[2])
			end
		end
	elseif var_4_0 == 4 then
		for iter_4_6, iter_4_7 in ipairs(GameDisplayCfg.hero_mechanism_type_white_tag.value) do
			if iter_4_7[1] == arg_4_1.tag then
				arg_4_0.recIcon_.sprite = getSprite("Atlas/Hero_arrtAtlas", iter_4_7[2])
			end
		end
	end

	local var_4_1 = CanteenEntrustData:GetCurDispatchTask().pos
	local var_4_2 = CanteenEntrustData:GetEntrustByPos(var_4_1).tags

	for iter_4_8, iter_4_9 in ipairs(var_4_2) do
		if iter_4_9.type == var_4_0 and iter_4_9.tag == arg_4_1.tag then
			arg_4_0.statusController_:SetSelectedState("lightup")

			return
		end
	end

	arg_4_0.statusController_:SetSelectedState("normal")
end

function var_0_0.Dispose(arg_5_0)
	var_0_0.super.Dispose(arg_5_0)
end

return var_0_0
