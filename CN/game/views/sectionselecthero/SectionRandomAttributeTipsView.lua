local var_0_0 = class("SectionRandomAttributeTipsView", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:BindCfgUI()
	arg_2_0:UpdateTips()

	arg_2_0.attributeItemList_ = {}
end

function var_0_0.SetData(arg_3_0, arg_3_1)
	arg_3_0.sectionProxy_ = arg_3_1

	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_4_0)
	arg_4_0:UpdateAttributeList()
end

function var_0_0.UpdateTips(arg_5_0)
	arg_5_0.titleText_.text = GetTips("RANDOM_ATTRIBUTE_DESC")
	arg_5_0.descText_.text = GetTips("RANDOM_ATTRIBUTE_DESC_1")
	arg_5_0.randomTitleText_.text = GetTips("RANDOM_ATTRUBUTE_TITLE")
end

function var_0_0.UpdateAttributeList(arg_6_0)
	local var_6_0 = arg_6_0:GetAttributeIDList()

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_1 = arg_6_0.attributeItemList_[iter_6_0]

		if not var_6_1 then
			var_6_1 = arg_6_0:CreateAttributeItem()
			arg_6_0.attributeItemList_[iter_6_0] = var_6_1
		end

		var_6_1:SetData(iter_6_1)
		var_6_1:Show(true)
	end

	for iter_6_2 = #var_6_0 + 1, #arg_6_0.attributeItemList_ do
		arg_6_0.attributeItemList_[iter_6_2]:Show(false)
	end
end

function var_0_0.GetAttributeIDList(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = arg_7_0.sectionProxy_:GetHeroIDList()

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if iter_7_1 ~= 0 then
			local var_7_2 = HeroCfg[iter_7_1]

			if type(var_7_2.ATK_attribute) == "table" then
				for iter_7_2, iter_7_3 in ipairs(var_7_2.ATK_attribute) do
					if HeroTools.IsNormalAtkAttributeId(iter_7_3) then
						table.insert(var_7_0, iter_7_3)
					end
				end
			end
		end
	end

	if #var_7_0 == 0 then
		var_7_0 = CommonFilterConst.GetDefaultHeroAttributeIdList({
			HeroConst.HERO_ATTACK_TYPE.RANDOM
		})
	end

	return var_7_0
end

function var_0_0.CreateAttributeItem(arg_8_0)
	local var_8_0 = GameObject.Instantiate(arg_8_0.attributeItemPrefab_, arg_8_0.attributeItemParent_)

	return (HeroSkillAttributeItem.New(var_8_0))
end

function var_0_0.Dispose(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.attributeItemList_) do
		iter_9_1:Dispose()
	end

	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
