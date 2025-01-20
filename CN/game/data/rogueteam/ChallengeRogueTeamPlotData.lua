local var_0_0 = class("ChallengeRogueTeamPlotData")

function var_0_0.ExportMethod(arg_1_0)
	return {
		"PlotResetData",
		"PlotSetWorldLineID",
		"PlotGetWorldLineID",
		"PlotSetEndingData",
		"PlotGetEndingID",
		"PlotSetEndingPlayState",
		"PlotGetEndingPlayState"
	}
end

function var_0_0.Init(arg_2_0)
	arg_2_0:PlotResetData()
end

function var_0_0.PlotResetData(arg_3_0)
	arg_3_0.worldLineID_ = 0
	arg_3_0.endingPlotID_ = 0
	arg_3_0.endingPlayState_ = ChallengeRogueTeamConst.ENDING_PLOT_STATE.UN_PLAYED
end

function var_0_0.PlotSetWorldLineID(arg_4_0, arg_4_1)
	arg_4_0.worldLineID_ = arg_4_1
end

function var_0_0.PlotGetWorldLineID(arg_5_0)
	return arg_5_0.worldLineID_
end

function var_0_0.PlotSetEndingData(arg_6_0, arg_6_1)
	arg_6_0.endingPlotID_ = arg_6_1.id
	arg_6_0.endingPlayState_ = arg_6_1.state
end

function var_0_0.PlotGetEndingID(arg_7_0)
	return arg_7_0.endingPlotID_
end

function var_0_0.PlotSetEndingPlayState(arg_8_0, arg_8_1)
	arg_8_0.endingPlayState_ = arg_8_1
end

function var_0_0.PlotGetEndingPlayState(arg_9_0)
	return arg_9_0.endingPlayState_
end

return var_0_0
