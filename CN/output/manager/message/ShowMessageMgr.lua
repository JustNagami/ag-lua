local var_0_0 = import("manager.message.MessageBoxItem")
local var_0_1 = class("ShowMessageMgr", import("game.extend.BaseView"))

function var_0_1.Ctor(arg_1_0)
	arg_1_0:OnCtor()
end

function var_0_1.OnCtor(arg_2_0)
	print("initializing show message manager ...")

	arg_2_0.itemList_ = {}
end

function var_0_1.ShowMessage(arg_3_0, arg_3_1)
	if manager.ui.uiMessage == nil then
		return
	end

	if arg_3_1.boxType == nil or arg_3_1.boxType == NORMAL_MESSAGE_BOX then
		arg_3_0:ShowNormalBox(arg_3_1)
	end
end

function var_0_1.ShowNormalBox(arg_4_0, arg_4_1)
	arg_4_0:GetFreeItem():SetData(arg_4_1)
end

function var_0_1.GetFreeItem(arg_5_0)
	if arg_5_0.itemList_ == nil then
		print("弹窗已经被销毁，被调用")

		arg_5_0.itemList_ = {}
	end

	for iter_5_0, iter_5_1 in pairs(arg_5_0.itemList_) do
		if iter_5_1:IsFree() then
			return iter_5_1
		end
	end

	if not arg_5_0.gameObject_ then
		arg_5_0.gameObject_ = Object.Instantiate(Asset.Load("Widget/Common/Pop/UIInquirepopup12"), manager.ui.uiMessage.transform)

		SetActive(arg_5_0.gameObject_, false)
	end

	local var_5_0 = var_0_0.New(arg_5_0.gameObject_)

	table.insert(arg_5_0.itemList_, var_5_0)

	return var_5_0
end

function var_0_1.HideAll(arg_6_0)
	if arg_6_0.itemList_ then
		for iter_6_0, iter_6_1 in pairs(arg_6_0.itemList_) do
			iter_6_1:Hide()
		end
	end
end

function var_0_1.GetItemList(arg_7_0)
	return arg_7_0.itemList_
end

function var_0_1.GetIsAllFree(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.itemList_) do
		if not iter_8_1:IsFree() then
			return false
		end
	end

	return true
end

function var_0_1.Dispose(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.itemList_) do
		iter_9_1:Dispose()
	end

	arg_9_0.itemList_ = nil

	if arg_9_0.gameObject_ then
		Object.Destroy(arg_9_0.gameObject_)

		arg_9_0.gameObject_ = nil
	end

	var_0_1.super.Dispose(arg_9_0)
end

return var_0_1
