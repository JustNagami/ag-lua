﻿local var_0_0 = class("ActivityMatrixClueItem", ReduxView)

function var_0_0.OnCtor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:InitUI()
	arg_2_0:AddUIListener()
end

function var_0_0.InitUI(arg_3_0)
	arg_3_0:BindCfgUI()
end

function var_0_0.AddUIListener(arg_4_0)
	return
end

function var_0_0.SetData(arg_5_0, arg_5_1)
	local var_5_0 = ActivityMatrixClueCfg[arg_5_1]

	arg_5_0.m_name.text = GetI18NText(var_5_0.name)
	arg_5_0.m_node.text = GetI18NText(var_5_0.note)
	arg_5_0.m_des.text = GetI18NText(var_5_0.desc)
	arg_5_0.m_icon.sprite = getSpriteWithoutAtlas("I18NImg/TextureConfig/VolumeIIIUI/icon/" .. var_5_0.icon)
end

function var_0_0.Dispose(arg_6_0)
	var_0_0.super.Dispose(arg_6_0)
end

return var_0_0
