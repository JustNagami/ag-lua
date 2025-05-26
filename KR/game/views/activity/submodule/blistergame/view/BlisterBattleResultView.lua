local var_0_0 = class("BlisterBattleResultView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/System/Summer2024/Summer2024_Bubble/BubbleresultPopUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiPop.transform
end

function var_0_0.OnCtor(arg_3_0)
	return
end

function var_0_0.Init(arg_4_0)
	arg_4_0:InitUI()
	arg_4_0:AddListeners()
end

function var_0_0.InitUI(arg_5_0)
	arg_5_0:BindCfgUI()

	arg_5_0.battleControl = arg_5_0.bubbleresultpopuiControllerexcollection_:GetController("battleStatede")
	arg_5_0.btnControl = arg_5_0.bubbleresultpopuiControllerexcollection_:GetController("btnState")
	arg_5_0.panelControllerexcollection_ = arg_5_0.panelControllerexcollection_:GetController("Tittle")
	arg_5_0.nodeList = {}
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddBtnListener(arg_6_0.suminibtn02Btn_, nil, function()
		arg_6_0:OnCancel()
	end)
	arg_6_0:AddBtnListener(arg_6_0.suminibtn01Btn_, nil, function()
		arg_6_0:OnOk()
	end)
end

function var_0_0.ChangeBar(arg_9_0)
	return
end

function var_0_0.OnTop(arg_10_0)
	return
end

function var_0_0.OnOk(arg_11_0)
	if manager.ChessBoardManager and manager.ChessBoardManager:IsBattleBack() then
		local var_11_0 = arg_11_0.params_ and arg_11_0.params_.isWin
		local var_11_1 = arg_11_0.params_ and arg_11_0.params_.score or 0

		ChessBoardAction.GoBackFromSmallGame(var_11_0 and 0 or 1, var_11_1)
	else
		BlisterGameTool.ExitGame()
	end
end

function var_0_0.OnCancel(arg_12_0)
	BlisterGameTool.ReStartGame()
	arg_12_0:Back()
end

function var_0_0.Cacheable(arg_13_0)
	return false
end

function var_0_0.OnEnter(arg_14_0)
	var_0_0.super.OnEnter(arg_14_0)

	local var_14_0 = arg_14_0.params_ and arg_14_0.params_.id or 1
	local var_14_1 = arg_14_0.params_ and arg_14_0.params_.score or 0
	local var_14_2 = arg_14_0.params_ and arg_14_0.params_.star or 0
	local var_14_3 = ActivityBubbleCfg[var_14_0]
	local var_14_4 = arg_14_0.params_ and arg_14_0.params_.isWin

	arg_14_0.battleControl:SetSelectedState(var_14_4 and "win" or "fail")

	if manager.ChessBoardManager and manager.ChessBoardManager:IsBattleBack() then
		arg_14_0.btnControl:SetSelectedState("chess")
	else
		arg_14_0.btnControl:SetSelectedState("normal")
	end

	arg_14_0.panelControllerexcollection_:SetSelectedState(var_14_4 and "win" or "lose")

	if var_14_3 then
		arg_14_0.textcheckpointText_.text = var_14_3.name
		arg_14_0.textpointsText_.text = var_14_1

		for iter_14_0 = 1, 3 do
			if not arg_14_0.nodeList[iter_14_0] then
				arg_14_0.nodeList[iter_14_0] = BlisterGoalItem.New(arg_14_0[string.format("nd0%sGo_", iter_14_0)])
			end

			isGet = iter_14_0 <= var_14_2 or false

			arg_14_0.nodeList[iter_14_0]:SetData(isGet, var_14_3.score_level[iter_14_0] or 0)
		end
	end

	UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_14_0.btncontentTrs_)
end

function var_0_0.OnExit(arg_15_0)
	var_0_0.super.OnExit(arg_15_0)
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)
end

return var_0_0
