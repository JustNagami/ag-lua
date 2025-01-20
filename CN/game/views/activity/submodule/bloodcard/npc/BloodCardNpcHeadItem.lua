local var_0_0 = class("BloodCardNpcHeadItem", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_0.gameObject_.transform
	arg_1_0.index_ = arg_1_2

	arg_1_0:BindCfgUI()
	arg_1_0:AddListeners()
	arg_1_0:InitUI()
end

function var_0_0.InitUI(arg_2_0)
	arg_2_0.stateController_ = arg_2_0.controller_:GetController("HeadNPC")
end

function var_0_0.AddListeners(arg_3_0)
	arg_3_0:AddBtnListener(arg_3_0.btn_, nil, function()
		if arg_3_0.clickCallBack_ then
			arg_3_0.clickCallBack_(arg_3_0.npcID_)
		end
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1)
	arg_5_0.npcID_ = arg_5_1
	arg_5_0.cfg_ = BloodCardGameNPCCfg[arg_5_0.npcID_]
	arg_5_0.activityID_ = BloodCardGameStageCfg[arg_5_0.cfg_.stage_list[1]].activity_id

	arg_5_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_6_0, arg_6_1)
	arg_6_0.nameText_.text = arg_6_0.cfg_.name
	arg_6_0.numText_.text = #arg_6_0.cfg_.stage_list
	arg_6_0.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/BackHouseUI/RoleHead/" .. arg_6_0.cfg_.icon)
end

function var_0_0.SetClickCallBack(arg_7_0, arg_7_1)
	arg_7_0.clickCallBack_ = arg_7_1
end

function var_0_0.RefreshState(arg_8_0, arg_8_1)
	local var_8_0 = BloodCardData:GetNpcUnlock(arg_8_0.npcID_, arg_8_0.activityID_)
	local var_8_1 = arg_8_0.npcID_ == arg_8_1

	if not var_8_0 then
		arg_8_0.stateController_:SetSelectedState("lock")
	elseif var_8_1 then
		arg_8_0.stateController_:SetSelectedState("select")
	else
		arg_8_0.stateController_:SetSelectedState("normal")
	end

	if not var_8_0 and arg_8_0.npcID_ == 105 then
		arg_8_0.stateController_:SetSelectedState("gengchen")

		arg_8_0.nameText_.text = GetTips("ACTIVITY_BLOOD_CARD_SCRETE_NPC")
	end
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0.clickCallBack_ = nil

	var_0_0.super.Dispose(arg_9_0)
end

return var_0_0
