NewBattleSettlementView = import("game.views.battleResult.newBattleSettlement.NewBattleSettlementView")

local var_0_0 = class("AreaBattleSettleView", NewBattleSettlementView)

function var_0_0.ShowContent(arg_1_0)
	local var_1_0 = "Widget/Version/ShashwatUI_3_7/ShashwatUI_3_7_SeizuresUI/BattleResultNormalContent_New"
	local var_1_1 = Object.Instantiate(Asset.Load(var_1_0), arg_1_0.contentContainer_)

	arg_1_0.areaCfg = {}

	arg_1_0:BindCfgUI(var_1_1, arg_1_0.areaCfg)

	arg_1_0.controller = {
		arg_1_0.areaCfg.targetController1_:GetController("clear"),
		arg_1_0.areaCfg.targetController2_:GetController("clear"),
		(arg_1_0.areaCfg.targetController3_:GetController("clear"))
	}

	local var_1_2 = arg_1_0.stageData:GetActivityID()
	local var_1_3 = ActivityCfg.get_id_list_by_sub_activity_list[var_1_2][1]
	local var_1_4 = ActivityAreaBattleData:GetDataByActivityID(var_1_3)[var_1_2]
	local var_1_5 = arg_1_0.stageData:GetStageId()
	local var_1_6

	for iter_1_0, iter_1_1 in pairs(var_1_4.difficultList) do
		for iter_1_2, iter_1_3 in pairs(iter_1_1) do
			if iter_1_2 == var_1_5 then
				var_1_6 = iter_1_3
			end
		end
	end

	for iter_1_4 = 1, 3 do
		arg_1_0.areaCfg[string.format("targetText%d_", iter_1_4)].text = string.format(GetTips("ACTIVITY_AREA_BATTLE_STAGE_CONDITION"), GameSetting.activity_area_battle_point_arg.value[4 - iter_1_4][1])

		if iter_1_4 <= var_1_6.point - 3 then
			arg_1_0.controller[iter_1_4]:SetSelectedState("state1")

			arg_1_0.areaCfg[string.format("targetText%d_", iter_1_4)].color = Color.New(0.9102, 0.9351, 0.9408, 1)
		else
			arg_1_0.controller[iter_1_4]:SetSelectedState("state0")

			arg_1_0.areaCfg[string.format("targetText%d_", iter_1_4)].color = Color.New(0.6768, 0.6853, 0.6882, 1)
		end
	end

	arg_1_0.areaCfg.scoreTxt_.text = var_1_6.point
end

return var_0_0
