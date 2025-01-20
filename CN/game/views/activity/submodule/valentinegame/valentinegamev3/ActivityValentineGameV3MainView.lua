ActivityMainBasePanel = import("game.views.activity.Main.toggle.ActivityMainBasePanel")

local var_0_0 = class("ActivityValentineGameV3MainView", ActivityMainBasePanel)
local var_0_1 = "ACTIVITY_VALENTINE_V3_DES"

function var_0_0.GetUIName(arg_1_0)
	return "Widget/Version/CORGUI_Com/CORGUI_3_10_ValentineUI/CORGUI_3_10_ValentineEntranceUI"
end

function var_0_0.Init(arg_2_0)
	var_0_0.super.Init(arg_2_0)

	arg_2_0.btnController_ = arg_2_0.btnControllerEx_:GetController("statelock01")
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btn_, nil, function()
		JumpTools.OpenPageByJump("/valentineGameV3SelectHeroView", {
			activityID = ActivityConst.ACTIVITY_VALENTINE_V3
		})
	end)
	arg_3_0:BindHelpBtn(var_0_1)
end

function var_0_0.OnEnter(arg_5_0)
	var_0_0.super.OnEnter(arg_5_0)

	arg_5_0.btnText_.text = GetTips("ACTIVITY_VALENTINE_V3_BTN")

	local var_5_0 = ActivityToggleCfg.get_id_list_by_activity_id[ActivityConst.ACTIVITY_VALENTINE_V3_SHOW]
	local var_5_1

	if var_5_0 then
		var_5_1 = var_5_0[1]
	end

	if not var_5_1 then
		return
	end

	local var_5_2 = ActivityToggleCfg[var_5_1]

	arg_5_0.titleTxt_.text = var_5_2.name
	arg_5_0.descText_.text = var_5_2.desc

	arg_5_0:UpdatePreview()
	manager.redPoint:bindUIandKey(arg_5_0.btn_.transform, RedPointConst.VALENTINE_GAME_ENTER .. "_" .. arg_5_0.activityID_)
end

function var_0_0.OnExit(arg_6_0)
	var_0_0.super.OnExit(arg_6_0)
	manager.redPoint:unbindUIandKey(arg_6_0.btn_.transform, RedPointConst.VALENTINE_GAME_ENTER .. "_" .. arg_6_0.activityID_)
end

function var_0_0.isHasLeftTimeDes(arg_7_0)
	return true
end

function var_0_0.RefreshAcvanceStatus(arg_8_0, arg_8_1)
	if arg_8_1 then
		arg_8_0.btnController_:SetSelectedState("normal01")
	else
		arg_8_0.btnController_:SetSelectedState("lock01")
	end
end

return var_0_0
