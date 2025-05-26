local var_0_0 = class("XH3rdFlipCardClueView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return XH3rdFlipCardTool.GetClueUI()
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
	arg_3_0:AddUIListener()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()

	if arg_4_0.clueListTrans_ ~= nil then
		local var_4_0 = arg_4_0.clueListTrans_.childCount

		arg_4_0.clueItemList = {}

		for iter_4_0 = 0, var_4_0 - 1 do
			local var_4_1 = arg_4_0.clueListTrans_:GetChild(iter_4_0)

			table.insert(arg_4_0.clueItemList, XH3rdFlipCardClueItem.New(var_4_1.gameObject, iter_4_0 + 1))
		end
	end

	arg_4_0.checkController_ = ControllerUtil.GetController(arg_4_0.transform_, "check")
end

function var_0_0.AddUIListener(arg_5_0)
	arg_5_0:AddBtnListener(arg_5_0.backMask_, nil, function()
		arg_5_0:Back()
	end)
	arg_5_0:AddBtnListener(arg_5_0.detailMask_, nil, function()
		arg_5_0.checkController_:SetSelectedState("false")
	end)
end

function var_0_0.OnEnter(arg_8_0)
	arg_8_0.activityId = arg_8_0.params_.activityId
	arg_8_0.titleText_ = arg_8_0.titleText_
	arg_8_0.descText_ = arg_8_0.descText_

	local var_8_0 = FlipCardCfg[arg_8_0.activityId].details

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		local var_8_1 = FlipCardClueCfg[iter_8_1]

		arg_8_0.clueItemList[iter_8_0]:SetData(var_8_1, arg_8_0.activityId)
	end

	arg_8_0.receiveHandler_ = handler(arg_8_0, arg_8_0.OpenClueDetailView)

	manager.notify:RegistListener(FLIP_CARD_VIEW_CLUE_RESULT, arg_8_0.receiveHandler_)
end

function var_0_0.OpenClueDetailView(arg_9_0, arg_9_1)
	arg_9_0.checkController_:SetSelectedState("true")

	local var_9_0 = FlipCardClueCfg[arg_9_1]

	arg_9_0.titleText_.text = var_9_0.name
	arg_9_0.descText_.text = var_9_0.description
end

function var_0_0.OnExit(arg_10_0)
	manager.notify:RemoveListener(FLIP_CARD_VIEW_CLUE_RESULT, arg_10_0.receiveHandler_)
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.clueItemList) do
		iter_11_1:Dispose()
	end

	arg_11_0.clueListTrans_ = nil

	var_0_0.super.Dispose(arg_11_0)
end

return var_0_0
