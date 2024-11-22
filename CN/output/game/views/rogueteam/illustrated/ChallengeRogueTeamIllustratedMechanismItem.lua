﻿local var_0_0 = class("ChallengeRogueTeamIllustratedMechanismItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()

	arg_1_0.selectController_ = arg_1_0.controller_:GetController("select")
	arg_1_0.lockController_ = arg_1_0.controller_:GetController("empty")
end

function var_0_0.Dispose(arg_2_0)
	var_0_0.super.Dispose(arg_2_0)
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btn_, nil, function()
		if arg_3_0.callBack_ then
			arg_3_0.callBack_(arg_3_0.id_)
		end
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.index_ = arg_5_1
	arg_5_0.id_ = arg_5_2

	local var_5_0 = RogueTeamItemCfg[arg_5_0.id_]

	arg_5_0.icon_.sprite = getSpriteWithoutAtlas(ChallengeRogueTeamTools.GetItemIcon(arg_5_2))

	local var_5_1 = not ChallengeRogueTeamData:IsIllustratedObtained(ChallengeRogueTeamData:GetCacheTemplateID(), ChallengeRogueTeamConst.COLLECTION_TYPE.SEASON, arg_5_2)

	arg_5_0.name_.text = var_5_1 and "???" or var_5_0.name

	arg_5_0.lockController_:SetSelectedState(tostring(var_5_1))
end

function var_0_0.SetClickCallBack(arg_6_0, arg_6_1)
	arg_6_0.callBack_ = arg_6_1
end

function var_0_0.RefreshSelect(arg_7_0, arg_7_1)
	arg_7_0.selectController_:SetSelectedState(tostring(arg_7_0.id_ == arg_7_1))
end

return var_0_0
