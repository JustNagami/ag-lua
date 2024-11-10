local var_0_0 = class("DestroyBoxGameRewardPanel", ReduxView)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.gameObject_ = arg_1_1
	arg_1_0.transform_ = arg_1_1.transform

	arg_1_0:BindCfgUI()

	arg_1_0.uiList_ = LuaList.New(handler(arg_1_0, arg_1_0.IndexItem), arg_1_0.m_list, DestroyBoxGameRewardItem)
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.activityID_ = arg_2_1
	arg_2_0.rewardIDList_ = arg_2_2

	arg_2_0.uiList_:StartScroll(#arg_2_0.rewardIDList_)
	arg_2_0:RefreshUI()
end

function var_0_0.Dispose(arg_3_0)
	if arg_3_0.uiList_ then
		arg_3_0.uiList_:Dispose()

		arg_3_0.uiList_ = nil
	end

	var_0_0.super.Dispose(arg_3_0)
end

function var_0_0.RefreshUI(arg_4_0)
	arg_4_0.m_title.text = ActivityCfg[arg_4_0.activityID_].remark
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.rewardIDList_[arg_5_1]

	arg_5_2:SetData(var_5_0)
end

return var_0_0
