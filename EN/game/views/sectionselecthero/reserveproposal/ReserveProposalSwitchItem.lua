local var_0_0 = class("ReserveProposalSwitchItem", ReduxView)

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

	arg_3_0.selectController_ = arg_3_0.controllerExCollection_:GetController("select")
	arg_3_0.tempController_ = arg_3_0.controllerExCollection_:GetController("temp")
	arg_3_0.headItemList_ = {}

	for iter_3_0 = 1, 3 do
		local var_3_0 = arg_3_0.headContentTrans_:GetChild(iter_3_0 - 1).gameObject

		arg_3_0.headItemList_[iter_3_0] = SectionSmallHeroItem.New(var_3_0)
	end
end

function var_0_0.AddUIListeners(arg_4_0)
	arg_4_0:AddBtnListener(arg_4_0.btn_, nil, function()
		manager.notify:CallUpdateFunc(RESERVE_PROPOSAL_CLICK_PROPOSAL, arg_4_0.contID_)
	end)
	arg_4_0:AddBtnListener(arg_4_0.renameBtn_, nil, function()
		manager.notify:CallUpdateFunc(RESERVE_PROPOSAL_CLICK_RENAME, arg_4_0.contID_)
	end)
end

function var_0_0.Dispose(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.headItemList_) do
		iter_7_1:Dispose()
	end

	arg_7_0.headItemList_ = nil

	var_0_0.super.Dispose(arg_7_0)
end

function var_0_0.SetProxy(arg_8_0, arg_8_1)
	arg_8_0.sectionProxy_ = arg_8_1
end

function var_0_0.SetData(arg_9_0, arg_9_1, arg_9_2)
	if not arg_9_0.reserveParams_ then
		arg_9_0.reserveParams_ = ReserveParams.New(ReserveConst.RESERVE_TYPE.PROPOSAL, arg_9_1)
	end

	arg_9_0.reserveParams_.contID = arg_9_1
	arg_9_0.contID_ = arg_9_1
	arg_9_0.isTemp_ = arg_9_2

	arg_9_0:RefreshUI()
end

function var_0_0.RefreshUI(arg_10_0)
	local var_10_0 = ReserveTools.GetReserveTemplateByReserveType(ReserveConst.RESERVE_TYPE.PROPOSAL):GetContDataTemplateById(arg_10_0.contID_)

	arg_10_0.tempController_:SetSelectedState(tostring(arg_10_0.isTemp_))

	if not arg_10_0.isTemp_ then
		arg_10_0.nameText_.text = var_10_0:GetName()
	end

	local var_10_1 = arg_10_0.sectionProxy_:GetOuterLockHeroList()

	arg_10_0.heroDataList_ = var_10_0:GetHeroList()

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.heroDataList_) do
		local var_10_2 = iter_10_1:GetHeroID()

		arg_10_0.headItemList_[iter_10_0]:SetData(var_10_2)
		arg_10_0.headItemList_[iter_10_0]:RefreshLock(table.indexof(var_10_1, var_10_2) ~= false)
	end
end

function var_0_0.SetSelect(arg_11_0, arg_11_1)
	arg_11_0.selectController_:SetSelectedState(tostring(arg_11_0.contID_ == arg_11_1))
end

return var_0_0
