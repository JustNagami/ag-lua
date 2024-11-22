local var_0_0 = import("game.views.battleResult.BattleResultBaseView")
local var_0_1 = class("BattleScoreWithMaxScoreResultView", var_0_0)

function var_0_1.UIName(arg_1_0)
	return "UI/BattleResult/BattleResultSlayerUI"
end

function var_0_1.RefreshUI(arg_2_0)
	arg_2_0:SetLevelTitle()
	arg_2_0:RefreshMyExpS()
	arg_2_0:RefreshHeroS()
	arg_2_0:RefreshCommonUI()
	arg_2_0:RefreshBattleTime()
	SetActive(arg_2_0.repulsionQuantity_, false)

	local var_2_0 = arg_2_0.params_.maxScore
	local var_2_1 = arg_2_0.params_.score

	arg_2_0.m_slayerCur.text = var_2_1

	if var_2_0 < var_2_1 then
		SetActive(arg_2_0.m_slayerNew, true)

		arg_2_0.m_slayerMax.text = var_2_1
	else
		SetActive(arg_2_0.m_slayerNew, false)

		arg_2_0.m_slayerMax.text = var_2_0
	end
end

return var_0_1
