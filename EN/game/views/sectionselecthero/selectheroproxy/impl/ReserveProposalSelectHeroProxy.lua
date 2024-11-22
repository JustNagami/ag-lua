local var_0_0 = import("game.views.sectionSelectHero.SelectHeroProxy.SelectHeroBaseProxy")
local var_0_1 = class("ReserveProposalSelectHeroProxy", var_0_0)

function var_0_1.CustomSaveTeam(arg_1_0)
	local var_1_0 = arg_1_0:GetHeroIDList()
	local var_1_1 = arg_1_0:GetTrialIDList()

	ReserveTools.SetTeam(arg_1_0.reserveParams, var_1_0, var_1_1, arg_1_0.comboSkillID, arg_1_0.mimirID, arg_1_0.chipList)
end

function var_0_1.GetSelectHeroViewClass(arg_2_0)
	return ReserveProposalSelectHeroView
end

return var_0_1
