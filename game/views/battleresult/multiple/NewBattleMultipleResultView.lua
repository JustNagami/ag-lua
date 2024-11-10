NewBattleSettlementView = import("game.views.battleResult.newBattleSettlement.NewBattleSettlementView")

local var_0_0 = class("NewBattleMultipleResultView", NewBattleSettlementView)

function var_0_0.OnAddListner(arg_1_0)
	arg_1_0:AddBtnListener(arg_1_0.nextStageBtn_, nil, function()
		arg_1_0:OnceMoreFunc()
	end)
	SetActive(arg_1_0.costImage_.gameObject, false)
end

function var_0_0.ShowCost(arg_3_0)
	local var_3_0 = arg_3_0.stageData:GetCost()
	local var_3_1 = arg_3_0.stageData:GetMultiple()
	local var_3_2 = CurrencyData:GetCurrencyNum(CurrencyConst.CURRENCY_TYPE_VITALITY)
	local var_3_3 = CurrencyConst.CURRENCY_TYPE_VITALITY

	if arg_3_0.stageType ~= BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT2_GAME_CHALLENGE and arg_3_0.stageType ~= BattleConst.STAGE_TYPE_NEW.ACTIVITY_PT_SCROLL then
		SetActive(arg_3_0.costImage_.gameObject, true)

		if var_3_2 >= var_3_0 * var_3_1 then
			arg_3_0.vitalityCostText_.text = string.format("<color=#%s>%s</color>", ColorConst.BLACK_HEX, var_3_0 * var_3_1)
		else
			arg_3_0.vitalityCostText_.text = string.format("<color=#%s>%s</color>", ColorConst.RED_HEX, var_3_0 * var_3_1)
		end
	else
		SetActive(arg_3_0.costImage_.gameObject, false)
	end
end

function var_0_0.ShowContent(arg_4_0)
	arg_4_0:onRenderMultiResultContent()
end

function var_0_0.onRenderMultiResultContent(arg_5_0)
	if not arg_5_0.multiView then
		arg_5_0.multiView = BattleSettlementMultiResultModule.New(arg_5_0.contentContainer_)
	end

	arg_5_0.multiView:RenderView({
		stageData = arg_5_0.stageData,
		rewardList = arg_5_0.params_.rewardList,
		rewardTimes = arg_5_0.params_.multiple
	})
	arg_5_0:SetBtnOnceMore()
end

function var_0_0.SetBtnOnceMore(arg_6_0)
	if arg_6_0.stageType == BattleConst.STAGE_TYPE_NEW.STAGE_TYPE_ENCHANTMENT then
		SetActive(arg_6_0.nextStageBtn_.gameObject, false)
	else
		SetActive(arg_6_0.nextStageBtn_.gameObject, arg_6_0:NeedOnceMore())
	end
end

function var_0_0.NeedOnceMore(arg_7_0)
	if arg_7_0.params_.notOnceMore then
		return false
	end

	return true
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0.multiView:Dispose()
	var_0_0.super.Dispose(arg_8_0)
end

return var_0_0
