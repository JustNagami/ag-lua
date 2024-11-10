local var_0_0 = class("SectionInfoBaseView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Operation/ChapterSectionInfoUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0.rewardItems_ = {}

	arg_3_0:InitUI()
	arg_3_0:AddListeners()

	arg_3_0.multiple_ = 1
	arg_3_0.uiList_ = LuaList.New(handler(arg_3_0, arg_3_0.RefreshRewardItem), arg_3_0.rewardUIListGo_, CommonItemView)
	arg_3_0.hideStageNumController_ = arg_3_0.controllerEx_:GetController("hideStageNum")
	arg_3_0.hideThreeStarController_ = arg_3_0.controllerEx_:GetController("hideThreeStar")
	arg_3_0.hideDropPanelController_ = arg_3_0.controllerEx_:GetController("hideDropPanel")
	arg_3_0.hideStageDescController_ = arg_3_0.controllerEx_:GetController("hideStageDesc")
	arg_3_0.hideMultiplePanelController_ = arg_3_0.controllerEx_:GetController("hideMultiplePanel")
	arg_3_0.hideAffixController_ = arg_3_0.controllerEx_:GetController("hideAffixPanel")
	arg_3_0.hideBattleAffixController_ = arg_3_0.controllerEx_:GetController("hideBattleAffixPanel")
	arg_3_0.guildStateController_ = arg_3_0.controllerEx_:GetController("guildstate")
	arg_3_0.hideSmallAffixController_ = arg_3_0.controllerEx_:GetController("hideSmallAffix")
	arg_3_0.hideFatigueController_ = arg_3_0.controllerEx_:GetController("hideFatigue")
	arg_3_0.challengeTimeController_ = arg_3_0.controllerEx_:GetController("challengeTime")
	arg_3_0.refreshTimeController_ = arg_3_0.controllerEx_:GetController("refreshTime")
	arg_3_0.btnWebController_ = arg_3_0.controllerEx_:GetController("btnWeb")
	arg_3_0.btnController_ = arg_3_0.btnControllerEx_:GetController("lock")
	arg_3_0.showTipsController_ = arg_3_0.controllerEx_:GetController("showTips")
	arg_3_0.titleDesController_ = arg_3_0.describeControllerexcollection_:GetController("text")

	arg_3_0.hideStageNumController_:SetSelectedState("true")
	arg_3_0.hideThreeStarController_:SetSelectedState("true")
	arg_3_0.hideDropPanelController_:SetSelectedState("true")
	arg_3_0.hideStageDescController_:SetSelectedState("true")
	arg_3_0.hideMultiplePanelController_:SetSelectedState("true")
	arg_3_0.hideAffixController_:SetSelectedState("true")
	arg_3_0.hideBattleAffixController_:SetSelectedState("true")
	arg_3_0.guildStateController_:SetSelectedState("common")
	arg_3_0.hideSmallAffixController_:SetSelectedState("true")

	arg_3_0.btnController_ = arg_3_0.btnControllerEx_:GetController("lock")

	arg_3_0.hideFatigueController_:SetSelectedState("show")
	arg_3_0.challengeTimeController_:SetSelectedState("close")
	arg_3_0.refreshTimeController_:SetSelectedState("close")
	arg_3_0.btnWebController_:SetSelectedState("notshow")
	arg_3_0.showTipsController_:SetSelectedState("false")

	arg_3_0.currencyUpdateHandle_ = handler(arg_3_0, arg_3_0.OnCurrencyChange)
end

function var_0_0.OnEnter(arg_4_0)
	arg_4_0.stageID_ = arg_4_0.params_.section
	arg_4_0.stageType_ = arg_4_0.params_.sectionType or BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_UNDEFINED

	manager.notify:RegistListener(CURRENCY_UPDATE, arg_4_0.currencyUpdateHandle_)
	arg_4_0:RefreshData()
	arg_4_0:RefreshUI()
	arg_4_0:RefreshTitleDesc()
	arg_4_0:RefreshRebuilder()
	arg_4_0:UpdateBar()
end

function var_0_0.RefreshRebuilder(arg_5_0)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.myAffixTsf_)
	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_5_0.enemyAffixTsf_)
end

function var_0_0.UpdateBar(arg_6_0)
	local var_6_0 = BattleStageTools.GetStageCfg(arg_6_0.stageType_, arg_6_0.stageID_)

	if type(var_6_0.extra_cost) == "table" and var_6_0.extra_cost[1] then
		local var_6_1 = var_6_0.extra_cost[1]

		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			var_6_1,
			CurrencyConst.CURRENCY_TYPE_VITALITY,
			CurrencyConst.CURRENCY_TYPE_GOLD,
			CurrencyConst.CURRENCY_TYPE_DIAMOND
		})
		manager.windowBar:SetBarCanClick(var_6_1, true)
	else
		manager.windowBar:SwitchBar({
			BACK_BAR,
			HOME_BAR,
			CurrencyConst.CURRENCY_TYPE_VITALITY,
			CurrencyConst.CURRENCY_TYPE_GOLD,
			CurrencyConst.CURRENCY_TYPE_DIAMOND
		})
	end

	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_VITALITY, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_GOLD, true)
	manager.windowBar:SetBarCanAdd(CurrencyConst.CURRENCY_TYPE_DIAMOND, true)
end

function var_0_0.OnUpdate(arg_7_0)
	if arg_7_0.stageID_ == arg_7_0.params_.section then
		return
	end

	arg_7_0.stageID_ = arg_7_0.params_.section

	arg_7_0:RefreshData()
	arg_7_0:RefreshUI()
end

function var_0_0.OnExit(arg_8_0)
	manager.windowBar:SwitchBar({
		BACK_BAR,
		HOME_BAR
	})
	manager.notify:RemoveListener(CURRENCY_UPDATE, arg_8_0.currencyUpdateHandle_)
end

function var_0_0.InitUI(arg_9_0)
	arg_9_0:BindCfgUI()
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddBtnListener(arg_10_0.battleBtn_, nil, function()
		local var_11_0 = arg_10_0.stageID_
		local var_11_1 = ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY)
		local var_11_2 = BattleStageTools.GetStageCfg(arg_10_0.stageType_, arg_10_0.stageID_)

		if arg_10_0.lock_ then
			ShowTips(arg_10_0.lockTips_)
		elseif type(var_11_2.extra_cost) == "table" and var_11_2.extra_cost[1] then
			local var_11_3 = var_11_2.extra_cost[1]

			if arg_10_0.cost_ > ItemTools.getItemNum(var_11_2.extra_cost[1]) then
				arg_10_0:PopCurrencyWindow()
			else
				arg_10_0:OnClickBtn()
			end
		elseif var_11_1 < arg_10_0.cost_ * arg_10_0.multiple_ then
			if CurrencyData:GetFatigueBuyTimes() < GameSetting.fatigue_max_buy_time.value[1] or hasVitalityProp() then
				JumpTools.OpenPopUp("currencyBuyFatigue", arg_10_0.params_, ViewConst.SYSTEM_ID.BUY_FATIGUE)
			else
				ShowTips("ERROR_ITEM_NOT_ENOUGH_FATIGUE")
			end
		else
			arg_10_0:OnClickBtn()
		end
	end)
end

function var_0_0.PopCurrencyWindow(arg_12_0)
	local var_12_0 = arg_12_0.params_.chapterID
	local var_12_1 = ChapterCfg[var_12_0].cost_exchange_id

	if var_12_1 == 0 then
		return
	end

	local var_12_2 = BattleStageTools.GetStageCfg(arg_12_0.stageType_, arg_12_0.stageID_)
	local var_12_3 = ItemExchangeCfg[var_12_1]

	if ActivityTools.GetActivityStatus(var_12_3.activity_id) == 1 then
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = string.format(GetTips("CURRENCY_NO_ENOUGH_ADN_GOT"), ItemTools.getItemName(var_12_2.extra_cost[1]), ActivityCfg[var_12_3.activity_id].remark),
			OkCallback = function()
				JumpTools.JumpToPage2(var_12_3.jump_system)
			end
		})
	else
		JumpTools.OpenPageByJump("itemExchange", {
			exchangeID = var_12_1,
			maxCnt = ChapterTools.GetUnclearStageCnt(var_12_0)
		})
	end
end

function var_0_0.OnCurrencyChange(arg_14_0)
	arg_14_0:RefreshData()
	arg_14_0:RefreshCost()
end

function var_0_0.RefreshData(arg_15_0)
	arg_15_0.lock_ = false
	arg_15_0.lockTips_ = ""
	arg_15_0.cost_ = 0
	arg_15_0.isFirstClear_ = false
	arg_15_0.dropLibID_ = 0
end

function var_0_0.RefreshUI(arg_16_0)
	arg_16_0:RefreshStageInfo()
	arg_16_0:RefreshReward()
	arg_16_0:RefreshCost()
	arg_16_0:RefreshBtn()

	if arg_16_0.lock_ then
		arg_16_0.btnLockText_.text = arg_16_0.lockTips_

		arg_16_0.btnController_:SetSelectedState("true")
	else
		arg_16_0.btnController_:SetSelectedState("false")
	end
end

function var_0_0.RefreshTitleDesc(arg_17_0)
	if arg_17_0.stageType_ == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_BASE_TEACHING or arg_17_0.stageType_ == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_HERO_TEACHING then
		arg_17_0.titleDesController_:SetSelectedState("state1")
	elseif arg_17_0.stageType_ == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_PLOT then
		arg_17_0.titleDesController_:SetSelectedState("state0")
	else
		arg_17_0.titleDesController_:SetSelectedState("state2")
	end
end

function var_0_0.HaveCostCntFlag(arg_18_0)
	local var_18_0 = arg_18_0.cost_ * arg_18_0.multiple_
	local var_18_1 = BattleStageTools.GetStageCfg(arg_18_0.stageType_, arg_18_0.stageID_)
	local var_18_2 = true

	if type(var_18_1.extra_cost) == "table" and var_18_1.extra_cost[1] then
		local var_18_3 = var_18_1.extra_cost[1]

		arg_18_0.costImage_.sprite = ItemTools.getItemLittleSprite(var_18_3)

		if var_18_0 > ItemTools.getItemNum(var_18_1.extra_cost[1]) then
			var_18_2 = false
		end
	else
		arg_18_0.costImage_.sprite = ItemTools.getItemLittleSprite(CurrencyConst.CURRENCY_TYPE_VITALITY)

		if var_18_0 > ItemTools.getItemNum(CurrencyConst.CURRENCY_TYPE_VITALITY) then
			var_18_2 = false
		end
	end

	return var_18_2
end

function var_0_0.RefreshCost(arg_19_0)
	local var_19_0 = arg_19_0:HaveCostCntFlag()
	local var_19_1 = arg_19_0.cost_ * arg_19_0.multiple_

	if var_19_0 then
		arg_19_0.costText_.text = string.format("<color=#%s>%s</color>", ColorConst.BLACK_HEX, var_19_1)
	else
		arg_19_0.costText_.text = string.format("<color=#%s>%s</color>", ColorConst.RED_HEX, var_19_1)
	end
end

function var_0_0.RefreshBtn(arg_20_0)
	local var_20_0 = arg_20_0:HaveCostCntFlag()

	arg_20_0.btnController_:SetSelectedState(tostring(arg_20_0.lock_))
end

function var_0_0.RefreshStageInfo(arg_21_0)
	local var_21_0 = BattleStageTools.GetStageCfg(arg_21_0.stageType_, arg_21_0.stageID_)

	if arg_21_0.oldCfgID_ ~= var_21_0.id then
		local var_21_1, var_21_2 = BattleStageTools.GetChapterSectionIndex(arg_21_0.stageType_, arg_21_0.stageID_)

		arg_21_0.sectionText_.text = string.format("%s-%s", GetI18NText(var_21_1), GetI18NText(var_21_2))
		arg_21_0.sectionName_.text = GetI18NText(var_21_0.name)
		arg_21_0.sectionImage_.sprite = getSpriteWithoutAtlas(string.format("%s%s", SpritePathCfg.Stage.path, var_21_0.background_1))
		arg_21_0.oldCfgID_ = var_21_0.id
	end
end

function var_0_0.RefreshReward(arg_22_0)
	local var_22_0 = arg_22_0.dropLibID_

	arg_22_0.rewardList_ = getRewardFromDropCfg(var_22_0, arg_22_0.isFirstClear_)

	local var_22_1 = arg_22_0.rewardList_

	if arg_22_0.isFirstClear_ and DropCfg[var_22_0] and #DropCfg[var_22_0].base_drop >= 1 then
		arg_22_0.rewardTitleText_.text = GetTips("FIRST_DROP")
	else
		arg_22_0.rewardTitleText_.text = GetTips("MAYBE_DROP")
	end

	if #var_22_1 > 0 then
		arg_22_0.hideDropPanelController_:SetSelectedState("false")
	else
		arg_22_0.hideDropPanelController_:SetSelectedState("true")
	end

	arg_22_0.uiList_:StartScroll(#var_22_1)
end

function var_0_0.RefreshRewardItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.rewardList_[arg_23_1]
	local var_23_1

	if var_23_0 then
		var_23_1 = rewardToItemTemplate(var_23_0)
		var_23_1.number = arg_23_0.isFirstClear_ and var_23_0.num or nil

		function var_23_1.clickFun(arg_24_0)
			ShowPopItem(POP_ITEM, arg_24_0)
		end
	end

	arg_23_2:SetData(var_23_1)
end

function var_0_0.Dispose(arg_25_0)
	arg_25_0.uiList_:Dispose()

	arg_25_0.uiList_ = nil
	arg_25_0.currencyUpdateHandle_ = nil

	var_0_0.super.Dispose(arg_25_0)
end

return var_0_0
