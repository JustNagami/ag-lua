local var_0_0 = import("game.views.astrolabe.BaseAstrolabe")
local var_0_1 = class("NormalAstrolabe", var_0_0)

function var_0_1.InitItem(arg_1_0)
	if (HeroTools.IsSpHero(arg_1_0.heroID) and arg_1_0.lastHeroID and HeroTools.IsSpHero(arg_1_0.lastHeroID)) == false then
		arg_1_0:ClearItem()

		arg_1_0.itemS_ = {}
	end

	local var_1_0 = HeroTools.IsSpHero(arg_1_0.heroID) and AstrolabeConst.AstrolabeListCfg2 or AstrolabeConst.AstrolabeListCfg1

	for iter_1_0 = 1, #var_1_0 do
		if not arg_1_0.itemS_[iter_1_0] then
			arg_1_0.itemS_[iter_1_0] = {}
		end

		local var_1_1 = var_1_0[iter_1_0]

		for iter_1_1 = 1, var_1_1 do
			local var_1_2 = arg_1_0[string.format("item%d_%dGo_", iter_1_0, iter_1_1)]

			if not arg_1_0.itemS_[iter_1_0][iter_1_1] then
				local var_1_3 = arg_1_0:GetItemName(arg_1_0.heroID, iter_1_0)
				local var_1_4 = Object.Instantiate(Asset.Load(var_1_3), var_1_2.transform)

				arg_1_0.itemS_[iter_1_0][iter_1_1] = AstrolabeNode.New(arg_1_0, var_1_4, iter_1_0)

				local var_1_5 = var_1_2.transform:Find("line_star")

				arg_1_0.itemS_[iter_1_0][iter_1_1].lineStar = var_1_5

				local var_1_6 = var_1_2.transform:Find("line_star_01")

				if var_1_6 then
					arg_1_0.itemS_[iter_1_0][iter_1_1].lineStar2 = var_1_6
				end
			end

			arg_1_0.itemS_[iter_1_0][iter_1_1]:SetParent(var_1_2.transform)
		end
	end

	arg_1_0:ProcessNameTextAnchor()
end

function var_0_1.ProcessNameTextAnchor(arg_2_0)
	local var_2_0 = arg_2_0.gameObject.name
	local var_2_1 = HeroTools.IsSpHero(arg_2_0.heroID) and AstrolabeConst.AstrolabeListCfg2 or AstrolabeConst.AstrolabeListCfg1

	for iter_2_0 = 1, #var_2_1 do
		local var_2_2 = var_2_1[iter_2_0]

		for iter_2_1 = 1, var_2_2 do
			local var_2_3 = AstrolabeTools.GetAstrolableNameTextAnchor(var_2_0, iter_2_0, iter_2_1)

			if var_2_3 then
				arg_2_0.itemS_[iter_2_0][iter_2_1]:SetNameTextAnchor(var_2_3)
			end
		end
	end
end

function var_0_1.GetItemName(arg_3_0, arg_3_1, arg_3_2)
	if HeroTools.IsSpHero(arg_3_0.heroID) then
		if arg_3_2 == 1 then
			return "UI/HeroGodHood/item_SP_02"
		end

		return "UI/HeroGodHood/item_SP_01"
	else
		return "UI/HeroGodHood/item"
	end
end

function var_0_1.RegistCallBack(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.itemS_ or {}) do
		for iter_4_2, iter_4_3 in ipairs(iter_4_1) do
			iter_4_3:RegistCallBack(arg_4_1)
		end
	end
end

function var_0_1.RefreshData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.heroInfo_ = arg_5_1
	arg_5_0.astrolabeInfo_ = arg_5_2

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.itemS_ or {}) do
		local var_5_0 = arg_5_0.astrolabeInfo_[iter_5_0]

		for iter_5_2, iter_5_3 in ipairs(iter_5_1) do
			local var_5_1 = var_5_0.astrolabe[iter_5_2]

			iter_5_3:SetNodeNameIsHide(arg_5_0.isHideNodeName)
			iter_5_3:SetProxy(arg_5_0.heroViewProxy_)
			iter_5_3:RefreshUI(var_5_1, arg_5_0.heroInfo_)
			iter_5_3:ResetEffect()

			if HeroTools.IsSpHero(arg_5_0.heroInfo_.id) then
				iter_5_3:ShowSelfEffect()
				iter_5_3:ShowNextSpEffect()
			else
				iter_5_3:ShowNextEffect()
			end
		end
	end
end

function var_0_1.SetNodeNameIsHide(arg_6_0, arg_6_1)
	arg_6_0.isHideNodeName = arg_6_1
end

function var_0_1.RefreshRedPoint(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.itemS_) do
		for iter_7_2, iter_7_3 in ipairs(iter_7_1) do
			local var_7_0 = iter_7_3:GetItemInfo()

			if arg_7_0.heroViewProxy_ and (arg_7_0.heroViewProxy_.viewDataType == HeroConst.HERO_DATA_TYPE.PREVIEW or arg_7_0.heroViewProxy_.viewDataType == HeroConst.HERO_DATA_TYPE.POLYHEDRON or arg_7_0.heroViewProxy_.viewDataType == HeroConst.HERO_DATA_TYPE.FOREIGN) then
				iter_7_3:SetRedPoint(false)
			else
				local var_7_1 = AstrolabeTools.GetIsCanUnlock(var_7_0.id, var_7_0.heroId)

				if HeroTools.IsSpHero(var_7_0.heroId) then
					local var_7_2 = AstrolabeTools.GetSpAstrolabeNodeCanEquiped(var_7_0.id, var_7_0.heroId)

					iter_7_3:SetRedPoint(var_7_2)
				else
					iter_7_3:SetRedPoint(var_7_1)
				end
			end
		end
	end
end

function var_0_1.GetFirstSelectItem(arg_8_0)
	if arg_8_0.heroInfo_ and arg_8_0.astrolabeInfo_ then
		local var_8_0 = arg_8_0.heroInfo_.using_astrolabe[#arg_8_0.heroInfo_.using_astrolabe]

		if var_8_0 then
			for iter_8_0, iter_8_1 in ipairs(arg_8_0.itemS_ or {}) do
				for iter_8_2, iter_8_3 in ipairs(iter_8_1) do
					if iter_8_3:GetItemInfo().id == var_8_0 then
						return iter_8_3
					end
				end
			end
		end
	end

	return arg_8_0:GetItem(1, 1)
end

function var_0_1.GetItem(arg_9_0, arg_9_1, arg_9_2)
	return arg_9_0.itemS_[arg_9_1][arg_9_2]
end

function var_0_1.ClearItem(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.itemS_) do
		for iter_10_2, iter_10_3 in pairs(iter_10_1) do
			if iter_10_3 and iter_10_3.Dispose then
				iter_10_3:Dispose()
			end
		end
	end
end

function var_0_1.Dispose(arg_11_0)
	arg_11_0.super.Dispose(arg_11_0)
end

return var_0_1
