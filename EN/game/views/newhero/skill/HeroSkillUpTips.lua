local var_0_0 = class("HeroSkillUpTips", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Hero_skill/HeroSkillPopUI"
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

	arg_4_0.costItemList = {}
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.fullscreenBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_noBtn_, nil, function()
		JumpTools.Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.btn_yesBtn_, nil, function()
		if arg_5_0.isAttr then
			local var_8_0 = SkillTools.GetSkillIdIndex(arg_5_0.skillId)

			HeroAction.HeroSkillAttrUpgrade(arg_5_0.heroId, var_8_0, arg_5_0.maxUpLv - arg_5_0.nowLv)
		else
			HeroAction.HeroSkillUpgrade(arg_5_0.heroId, arg_5_0.skillId, arg_5_0.maxUpLv - arg_5_0.nowLv)
		end

		JumpTools.Back()
	end)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0:InitData()
	arg_9_0:RefreshUI()
end

function var_0_0.InitData(arg_10_0)
	arg_10_0.skillId = arg_10_0.params_.skillId
	arg_10_0.nowLv = arg_10_0.params_.nowLv
	arg_10_0.maxUpLv = arg_10_0.params_.maxUpLv
	arg_10_0.heroId = arg_10_0.params_.heroId
	arg_10_0.isAttr = arg_10_0.params_.isAttr or false

	local var_10_0 = arg_10_0.params_.costDataList

	arg_10_0.costDataList = {}

	for iter_10_0, iter_10_1 in pairs(var_10_0) do
		table.insert(arg_10_0.costDataList, {
			id = iter_10_0,
			num = iter_10_1
		})
	end
end

function var_0_0.RefreshUI(arg_11_0)
	arg_11_0.leftLvTxt_.text = arg_11_0.nowLv
	arg_11_0.rightLvTxt_.text = arg_11_0.maxUpLv

	for iter_11_0, iter_11_1 in pairs(arg_11_0.costItemList or {}) do
		iter_11_1.gameObject_:SetActive(false)
	end

	for iter_11_2, iter_11_3 in pairs(arg_11_0.costDataList) do
		local var_11_0 = arg_11_0.costItemList[iter_11_2]

		if not var_11_0 then
			var_11_0 = arg_11_0:CreateCostItem()
			arg_11_0.costItemList[iter_11_2] = var_11_0
		end

		var_11_0.gameObject_:SetActive(true)

		local var_11_1 = clone(ItemTemplateData)

		var_11_1.id = iter_11_3.id

		function var_11_1.clickFun(arg_12_0)
			ShowPopItem(POP_SOURCE_ITEM, {
				arg_12_0.id,
				arg_12_0.number
			})
		end

		local var_11_2 = ItemTools.getItemNum(iter_11_3.id)

		var_11_0:SetData(var_11_1)
		var_11_0:RefreshBottomText({
			var_11_2,
			iter_11_3.num
		})
		var_11_0:RefreshBottomRightText(true)
	end
end

function var_0_0.CreateCostItem(arg_13_0)
	local var_13_0 = GameObject.Instantiate(arg_13_0.commonitemGo_, arg_13_0.rewardpanelTrs_)

	return CommonItemView.New(var_13_0)
end

function var_0_0.OnExit(arg_14_0)
	return
end

function var_0_0.Dispose(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.costItemList or {}) do
		if iter_15_1 then
			iter_15_1:Dispose()
		end
	end

	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
