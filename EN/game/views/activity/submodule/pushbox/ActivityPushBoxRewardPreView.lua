local var_0_0 = class("ActivityPushBoxRewardPreView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/V3_5_9_CustomizeUI/V3_5_9_AnniversaryUI/V3_5_9_AnniversaryRewardPopup"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListeners()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	arg_4_0.scrollHelper_ = LuaList.New(handler(arg_4_0, arg_4_0.IndexItem), arg_4_0.listGo_, CommonItemView)
	arg_4_0.itemDataList_ = {}
end

function var_0_0.IndexItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.list_[arg_5_1]
	local var_5_1 = ActivityCelebrationCakeCfg[var_5_0].award_list[1]

	if not arg_5_0.itemDataList_[arg_5_1] then
		arg_5_0.itemDataList_[arg_5_1] = clone(ItemTemplateData)
		arg_5_0.itemDataList_[arg_5_1].clickFun = function(arg_6_0)
			ShowPopItem(POP_ITEM, {
				arg_6_0.id,
				arg_6_0.number
			})
		end
	end

	arg_5_0.itemDataList_[arg_5_1].id = var_5_1[1]
	arg_5_0.itemDataList_[arg_5_1].number = var_5_1[2]
	arg_5_0.itemDataList_[arg_5_1].completedFlag = arg_5_1 <= arg_5_0.curIndex_

	arg_5_2:SetData(arg_5_0.itemDataList_[arg_5_1])
end

function var_0_0.AddUIListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.bgBtn_, nil, function()
		arg_7_0:Back()
	end)
end

function var_0_0.OnEnter(arg_9_0)
	arg_9_0.activityID_ = arg_9_0.params_.activityID
	arg_9_0.curIndex_ = ActivityPushBoxData:GetCurIndex(arg_9_0.activityID_)
	arg_9_0.list_ = ActivityCelebrationCakeCfg.get_id_list_by_activity_id[arg_9_0.activityID_]

	arg_9_0.scrollHelper_:StartScroll(#arg_9_0.list_)
end

function var_0_0.OnExit(arg_10_0)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.scrollHelper_:GetItemList()) do
		iter_10_1:OnExit()
	end
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:RemoveAllListeners()
	arg_11_0.scrollHelper_:Dispose()
	arg_11_0.super.Dispose(arg_11_0)
end

return var_0_0
