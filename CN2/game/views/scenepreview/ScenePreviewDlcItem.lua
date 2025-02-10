﻿local var_0_0 = class("ScenePreviewDlcItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListeners()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()

	arg_3_0.icon_.immediate = true
	arg_3_0.typeCon_ = ControllerUtil.GetController(arg_3_0.transform_, "type")
	arg_3_0.selectCon_ = ControllerUtil.GetController(arg_3_0.transform_, "select")
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		if arg_4_0.clickFunc_ then
			arg_4_0.clickFunc_()
		end
	end)
end

function var_0_0.RefreshData(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.id_ = arg_6_1
	arg_6_0.cfg_ = HomeSceneSettingCfg[arg_6_0.id_]
	arg_6_0.title_.text = arg_6_0.cfg_.title
	arg_6_0.source_.text = arg_6_0.cfg_.obtain_word

	local var_6_0 = SkinSceneActionCfg.get_id_list_by_special_scene_id[arg_6_0.id_][1]

	arg_6_0.icon_.spriteSync = "TextureConfig/SceneChangeUI/item/" .. var_6_0

	arg_6_0:RefreshType(arg_6_2, arg_6_3)
	manager.redPoint:bindUIandKey(arg_6_0.transform_, RedPointConst.SCENE .. "_" .. arg_6_0.id_)
end

function var_0_0.RefreshType(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.selectCon_:SetSelectedState(arg_7_2 and "true" or "false")

	local var_7_0 = HomeSceneSettingData:GetCurScene()

	if arg_7_1 == 0 then
		arg_7_0.typeCon_:SetSelectedState("ban")
	elseif var_7_0 == arg_7_0.id_ and not HomeSceneSettingData:IsRandomScene() then
		if arg_7_1 == 1 then
			arg_7_0.typeCon_:SetSelectedState("trial")
		elseif arg_7_1 == 2 then
			arg_7_0.typeCon_:SetSelectedState("using")
		end
	else
		arg_7_0.typeCon_:SetSelectedState("normal")
	end

	if arg_7_1 == 1 then
		SetActive(arg_7_0.timeGo_, true)
		arg_7_0:RefreshTime()
	else
		SetActive(arg_7_0.timeGo_, false)
		arg_7_0:StopTimer()
	end
end

function var_0_0.StopTimer(arg_8_0)
	if arg_8_0.timer_ then
		arg_8_0.timer_:Stop()

		arg_8_0.timer_ = nil
	end
end

function var_0_0.RefreshTime(arg_9_0)
	arg_9_0:StopTimer()

	local var_9_0 = manager.time:GetServerTime()
	local var_9_1 = HomeSceneSettingData:GetSceneTimeStamp(arg_9_0.id_)

	arg_9_0.time_.text = manager.time:GetLostTimeStr2(var_9_1, nil, false)
	arg_9_0.timer_ = Timer.New(function()
		if var_9_1 and var_9_0 <= var_9_1 then
			arg_9_0.time_.text = manager.time:GetLostTimeStr2(var_9_1, nil, false)
		else
			arg_9_0:RefreshUI()
		end
	end, 1, -1)

	arg_9_0.timer_:Start()
end

function var_0_0.RegistClickFunc(arg_11_0, arg_11_1)
	arg_11_0.clickFunc_ = arg_11_1
end

function var_0_0.OnExit(arg_12_0)
	arg_12_0:StopTimer()
	manager.redPoint:unbindUIandKey(arg_12_0.transform_)
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:StopTimer()
	arg_13_0:RemoveAllListeners()
	var_0_0.super.Dispose(arg_13_0)
end

return var_0_0
