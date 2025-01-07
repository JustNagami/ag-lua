local var_0_0 = class("PosterDlcDebutState", PosterDlcTimelineState)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_0.Enter(arg_2_0)
	var_0_0.super.Enter(arg_2_0)
	arg_2_0.actor:SetSelfCamera(-1)
	arg_2_0:PlayAniWithParams("debut")
end

function var_0_0.Exit(arg_3_0, arg_3_1)
	var_0_0.super.Exit(arg_3_0, arg_3_1)

	local var_3_0 = arg_3_0.actor:GetSkinId()

	HomeSceneSettingData:SetIsPlay(var_3_0)
	manager.notify:CallUpdateFunc(HOME_DEBUT_OVER)
	arg_3_0.actor:SetSelfCamera(0)
end

return var_0_0
