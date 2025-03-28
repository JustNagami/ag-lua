local var_0_0 = class("CustomCenterSceneDetailView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/CustomCenter/CustomCenterDetailUI"
end

local var_0_1 = {
	DESC = 1,
	TAG = 2
}

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:BindCfgUI()
	arg_3_0:AddListeners()

	arg_3_0.itemList_ = {}
	arg_3_0.typeController_ = arg_3_0.controllerEx_:GetController("type")
end

function var_0_0.OnEnter(arg_4_0)
	manager.windowBar:SwitchBar({
		BACK_BAR
	})

	arg_4_0.sceneID_ = arg_4_0.params_.sceneID
	arg_4_0.curType_ = var_0_1.DESC

	arg_4_0:RefreshUI()
end

function var_0_0.OnExit(arg_5_0)
	manager.windowBar:HideBar()
end

function var_0_0.Dispose(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.itemList_) do
		iter_6_1:Dispose()
	end

	arg_6_0.itemList_ = {}

	var_0_0.super.Dispose(arg_6_0)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddBtnListener(arg_7_0.typeBtn_, nil, function()
		if arg_7_0.curType_ == var_0_1.DESC then
			arg_7_0.curType_ = var_0_1.TAG
		else
			arg_7_0.curType_ = var_0_1.DESC
		end

		arg_7_0:SwitchType()
	end)
end

function var_0_0.RefreshUI(arg_9_0)
	local var_9_0 = HomeSceneSettingCfg[arg_9_0.sceneID_]

	arg_9_0.titleText_.text = var_9_0.title
	arg_9_0.descText_.text = var_9_0.desc

	arg_9_0:SwitchType()
	arg_9_0:RefreshItemList(var_9_0.scene_tag)
end

function var_0_0.SwitchType(arg_10_0)
	if arg_10_0.curType_ == var_0_1.DESC then
		arg_10_0.typeController_:SetSelectedState("desc")
	else
		arg_10_0.typeController_:SetSelectedState("tag")
	end
end

function var_0_0.RefreshItemList(arg_11_0, arg_11_1)
	for iter_11_0 = 1, #arg_11_1 do
		arg_11_0.itemList_[iter_11_0] = arg_11_0.itemList_[iter_11_0] or CustomCenterSceneDetailTagItem.New(arg_11_0.itemGo_, arg_11_0.itemParent_)

		arg_11_0.itemList_[iter_11_0]:SetData(arg_11_1[iter_11_0])
	end

	for iter_11_1 = #arg_11_1 + 1, #arg_11_0.itemList_ do
		arg_11_0.itemList_[iter_11_1]:Show(false)
	end
end

return var_0_0
