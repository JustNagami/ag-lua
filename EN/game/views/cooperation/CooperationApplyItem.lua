local var_0_0 = class("CooperationApplyItem", ReduxView)

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

	arg_3_0.stateController = ControllerUtil.GetController(arg_3_0.transform_, "state")
	arg_3_0.onlineController = ControllerUtil.GetController(arg_3_0.transform_, "online")
end

function var_0_0.AddUIListener(arg_4_0)
	arg_4_0:AddBtnListener(nil, arg_4_0.m_agreeBtn, function()
		CooperationAction.ReceiveInvite(arg_4_0.uid)
	end)
	arg_4_0:AddBtnListener(nil, arg_4_0.m_refuseBtn, function()
		CooperationAction.DelectInvite({
			arg_4_0.uid
		})
	end)
end

function var_0_0.SetData(arg_7_0, arg_7_1)
	arg_7_0.data = arg_7_1
	arg_7_0.dest = arg_7_1.dest
	arg_7_0.uid = arg_7_1.uid
	arg_7_0.room_id = arg_7_1.room_id
	arg_7_0.m_name.text = GetI18NText(arg_7_1.nick)
	arg_7_0.m_lvLab.text = "LV." .. arg_7_1.level
	arg_7_0.m_icon.sprite = ItemTools.getItemSprite(arg_7_1.icon)
	arg_7_0.m_frame.sprite = getSpriteWithoutAtlas("TextureConfig/Frame/" .. arg_7_1.icon_frame)
	arg_7_0.m_timeLab.text = arg_7_0:GetOnLineText(arg_7_1.timestamp)
	arg_7_0.m_destName.text = CooperationTools.GetCooperationRoomName(arg_7_1.battle_type, arg_7_1.dest, arg_7_1.activity_id)

	arg_7_0:UpdateState()
end

function var_0_0.GetOnLineText(arg_8_0, arg_8_1)
	if arg_8_1 == 0 then
		return GetTips("ONLINE")
	end

	local var_8_0 = manager.time:GetServerTime() - arg_8_1

	if var_8_0 < 60 then
		return GetTips("FRIEND_ONLINE_TIME_ONE_MINUTE")
	elseif var_8_0 < 300 then
		return GetTips("FRIEND_ONLINE_TIME_FIVE_MINUTE")
	elseif var_8_0 < 3600 then
		return GetTips("FRIEND_ONLINE_TIME_WITHIN_AN_HOUR")
	elseif var_8_0 < 86400 then
		return GetTips("FRIEND_ONLINE_TIME_IN_ONE_DAY")
	elseif var_8_0 < 2592000 then
		local var_8_1 = var_8_0 / 86400

		return string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), math.floor(var_8_1))
	else
		return string.format(GetTips("FRIEND_ONLINE_TIME_ONE_DAY_AGO"), 30)
	end
end

function var_0_0.UpdateState(arg_9_0)
	local var_9_0 = arg_9_0.data.refuse

	arg_9_0.stateController:SetSelectedIndex(var_9_0 and 1 or 0)
end

function var_0_0.Dispose(arg_10_0)
	var_0_0.super.Dispose(arg_10_0)
end

return var_0_0
