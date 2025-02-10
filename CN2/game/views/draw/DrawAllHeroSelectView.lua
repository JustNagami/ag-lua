local var_0_0 = class("DrawAllHeroSelectView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Pool/pool_3000304_SelectPop"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddUIListener()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.tapBtn_ = {}
	arg_5_0.tapSort_ = {}
	arg_5_0.tapType_ = {
		[1] = -1,
		[2] = HeroConst.HERO_ATTACK_TYPE.PYISICS,
		[3] = HeroConst.HERO_ATTACK_TYPE.WIND,
		[4] = HeroConst.HERO_ATTACK_TYPE.FLAME,
		[5] = HeroConst.HERO_ATTACK_TYPE.THUNDER,
		[6] = HeroConst.HERO_ATTACK_TYPE.DARK,
		[7] = HeroConst.HERO_ATTACK_TYPE.LIGHT,
		[8] = HeroConst.HERO_ATTACK_TYPE.FREEZE,
		[9] = HeroConst.HERO_ATTACK_TYPE.WATER
	}

	for iter_5_0 = 1, 9 do
		arg_5_0.tapBtn_[iter_5_0] = arg_5_0["tapBtn_" .. iter_5_0]
	end

	arg_5_0.btnCon_ = arg_5_0.collection_:GetController("btn")
	arg_5_0.tapCon_ = arg_5_0.collection_:GetController("tap")
	arg_5_0.tipCon_ = arg_5_0.collection_:GetController("tips")
	arg_5_0.scrollHelper_ = LuaList.New(handler(arg_5_0, arg_5_0.indexItem), arg_5_0.uilistGo_, DrawAllHeroSelectItem)
end

function var_0_0.indexItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.curList_[arg_6_1]

	arg_6_2.gameObject_.name = tostring(var_6_0)

	arg_6_2:SetHeroID(var_6_0, arg_6_0.type_)
	arg_6_2:SetSelected(arg_6_2.heroID_ == arg_6_0.curHeroId_)
	arg_6_2:RegisterClickListener(handler(arg_6_0, arg_6_0.OnHeroClick))
end

function var_0_0.OnHeroClick(arg_7_0, arg_7_1)
	arg_7_0.curHeroId_ = arg_7_1

	arg_7_0:UpdateBtnState()
	arg_7_0.scrollHelper_:Refresh()
end

function var_0_0.AddUIListener(arg_8_0)
	arg_8_0:AddBtnListener(arg_8_0.btnLock_, nil, function()
		ShowTips("DRAW_NOT_SELECT_TIPS")
	end)
	arg_8_0:AddBtnListener(arg_8_0.btnrenewalBtn_, nil, function()
		if arg_8_0.curHeroId_ == nil or arg_8_0.curHeroId_ == 0 then
			return
		end

		if arg_8_0.curHeroId_ == arg_8_0.params_.heroId then
			arg_8_0:Back()
		else
			if arg_8_0.params_.isFirst then
				local var_10_0 = DrawPoolCfg[arg_8_0.params_.poolId]
				local var_10_1 = table.indexof(var_10_0.optional_detail, arg_8_0.curHeroId_)
				local var_10_2 = var_10_0.optional_lists_poolId[var_10_1]

				DrawAction.SetPollUpID(arg_8_0.params_.poolId, var_10_2)

				return
			end

			ShowMessageBox({
				isTop = true,
				title = GetTips("PROMPT"),
				content = GetTips("DRAW_SWITCH_LIMIT_CONFIRM_TIP"),
				SecondTip = string.format(GetTips("DRAW_REMAIN_UP_TIMES"), ""),
				SecondValue = DrawData:GetUpRemainTime(arg_8_0.params_.poolId),
				OkCallback = function()
					local var_11_0 = DrawPoolCfg[arg_8_0.params_.poolId]
					local var_11_1 = table.indexof(var_11_0.optional_detail, arg_8_0.curHeroId_)
					local var_11_2 = var_11_0.optional_lists_poolId[var_11_1]

					DrawAction.SetPollUpID(arg_8_0.params_.poolId, var_11_2)
				end,
				CancelCallback = function()
					return
				end
			})
		end
	end)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.tapBtn_) do
		arg_8_0:AddBtnListener(iter_8_1, nil, function()
			arg_8_0:RefreshList(arg_8_0.tapType_[iter_8_0], iter_8_0)
		end)
	end
end

function var_0_0.OnEnter(arg_14_0)
	arg_14_0.upID = DrawData:GetPollUpID(arg_14_0.params_.poolId)
	arg_14_0.upHeroID = DrawData:ConvertUpId(arg_14_0.params_.poolId, arg_14_0.upID, 0)
	arg_14_0.curHeroId_ = arg_14_0.upHeroID

	arg_14_0:RefreshData()
	arg_14_0:UpdateBtnState()
	arg_14_0:UpdateTipState()
	arg_14_0:RefreshList(-1, 1)
	arg_14_0:AddEventListeners()

	if arg_14_0.curHeroId_ == 0 then
		arg_14_0.btnCon_:SetSelectedState("false")
	else
		arg_14_0.btnCon_:SetSelectedState("current")
	end
end

function var_0_0.RefreshData(arg_15_0)
	if arg_15_0.poolID_ ~= arg_15_0.params_.poolId then
		arg_15_0.allHeroList_ = arg_15_0.params_.heroIdList
		arg_15_0.poolID_ = arg_15_0.params_.poolId
		arg_15_0.tapSort_ = {}
	end
end

function var_0_0.UpdateBtnState(arg_16_0)
	local var_16_0 = DrawData:GetPollUpID(arg_16_0.params_.poolId)
	local var_16_1 = DrawData:ConvertUpId(arg_16_0.params_.poolId, var_16_0, 0)

	arg_16_0.btnCon_:SetSelectedState(arg_16_0.curHeroId_ ~= var_16_1 and "true" or "current")
end

function var_0_0.UpdateTipState(arg_17_0)
	if DrawPoolCfg[arg_17_0.params_.poolId].pool_change == 0 or arg_17_0.params_.isFirst then
		arg_17_0.tipCon_:SetSelectedState("true")
	else
		arg_17_0.tipCon_:SetSelectedState("false")

		local var_17_0 = DrawData:GetPoolUpTimes(arg_17_0.params_.poolId)
		local var_17_1 = DrawPoolCfg[arg_17_0.params_.poolId].pool_change - var_17_0

		arg_17_0.timesText_.text = string.format(GetTips("DRAW_REMAIN_UP_TIMES"), tostring(var_17_1))
	end
end

function var_0_0.RefreshList(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_1 == -1 then
		arg_18_0.curList_ = arg_18_0.allHeroList_
	else
		if not arg_18_0.tapSort_[arg_18_1] then
			local var_18_0 = {}

			for iter_18_0, iter_18_1 in ipairs(arg_18_0.allHeroList_) do
				if arg_18_1 == HeroCfg[iter_18_1].ATK_attribute[1] then
					table.insert(var_18_0, iter_18_1)
				end
			end

			arg_18_0.tapSort_[arg_18_1] = var_18_0
		end

		arg_18_0.curList_ = arg_18_0.tapSort_[arg_18_1]
	end

	arg_18_0.tapCon_:SetSelectedState(arg_18_2)
	arg_18_0.scrollHelper_:StartScroll(#arg_18_0.curList_)
end

function var_0_0.AddEventListeners(arg_19_0)
	return
end

function var_0_0.OnSetPollUpID(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0:Back()
end

function var_0_0.OnTop(arg_21_0)
	arg_21_0:UpdateBar()
end

function var_0_0.OnBehind(arg_22_0)
	manager.windowBar:HideBar()
end

function var_0_0.UpdateBar(arg_23_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
end

function var_0_0.OnExit(arg_24_0)
	arg_24_0:RemoveAllEventListener()
	manager.windowBar:HideBar()
end

function var_0_0.OnMainHomeViewTop(arg_25_0)
	return
end

function var_0_0.Dispose(arg_26_0)
	if arg_26_0.scrollHelper_ then
		arg_26_0.scrollHelper_:Dispose()

		arg_26_0.scrollHelper_ = nil
	end

	var_0_0.super.Dispose(arg_26_0)
end

return var_0_0
