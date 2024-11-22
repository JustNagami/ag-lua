local var_0_0 = import("game.views.sectionSelectHero.SelectHeroProxy.SelectHeroBaseProxy")
local var_0_1 = class("AdvanceTestSelectHeroProxy", var_0_0)

function var_0_1.InitCustomParams(arg_1_0, arg_1_1)
	arg_1_0.dest = arg_1_1.dest
	arg_1_0.stageDifficult = arg_1_1.stageDifficult
	arg_1_0.heroDataType_ = HeroConst.HERO_DATA_TYPE.ADVANCETEST

	arg_1_0:SetHeroDataType(arg_1_0.heroDataType_)
end

function var_0_1.GetStageData(arg_2_0)
	return (BattleStageFactory.Produce(arg_2_0.stageType, arg_2_0.stageID, {
		dest = arg_2_0.dest,
		activityID = arg_2_0.activityID
	}))
end

function var_0_1.GetHeroTeamInfoRoute(arg_3_0)
	return "/advanceTestTeamInfo"
end

function var_0_1.GetCustomeTeamInfoParams(arg_4_0, arg_4_1)
	return {
		stageDifficult = arg_4_0.stageDifficult
	}
end

return var_0_1
