local var_0_0 = class("PinballTurnBasedGameView", ReduxView)

function var_0_0.UIName(arg_1_0)
	return "Widget/Version/BaichaoUI_3_9/BaichaoUI_3_9_PinballUI/BaichaoUI_3_9_PinballTurnBasedUI"
end

function var_0_0.UIParent(arg_2_0)
	return manager.ui.uiMain.transform
end

function var_0_0.Init(arg_3_0)
	arg_3_0:InitUI()
end

function var_0_0.InitUI(arg_4_0)
	arg_4_0:BindCfgUI()
	arg_4_0:AddBtnListener(arg_4_0.backBtn_, nil, function()
		ShowMessageBox({
			title = GetTips("PROMPT"),
			content = GetTips("PINBALL_STAGE_GIVE_UP"),
			OkCallback = function()
				PinballLuaBridge.InterruptExitGame()
				DestroyLua()
				LuaExchangeHelper.GoToMain()
				OpenPageUntilLoaded("/pinballStage")
			end,
			CancelCallback = function()
				return
			end
		})
	end)
	arg_4_0:AddBtnListener(arg_4_0.infoBtn_, nil, function()
		local var_8_0 = {
			isPrefab = true,
			pages = {
				"Widget/Version/BaichaoUI_3_9/BaichaoUI_3_9_PinballUI/BaichaoUI_3_9_PinballDescription_01",
				"Widget/Version/BaichaoUI_3_9/BaichaoUI_3_9_PinballUI/BaichaoUI_3_9_PinballDescription_02",
				"Widget/Version/BaichaoUI_3_9/BaichaoUI_3_9_PinballUI/BaichaoUI_3_9_PinballDescription_03"
			}
		}

		JumpTools.OpenPageByJump("gameHelpPro", var_8_0)
	end)

	local var_4_0 = GetPinballDataForExchange()

	PinballLuaBridge.InitTurnBasedPinballGame(arg_4_0.UIRootGo_, var_4_0)
	PinballAction.RecordStartTime()
end

function var_0_0.OnEnter(arg_9_0)
	return
end

function var_0_0.OnExit(arg_10_0)
	return
end

function var_0_0.OnExitInput(arg_11_0)
	ShowMessageBox({
		title = GetTips("PROMPT"),
		content = GetTips("PINBALL_STAGE_GIVE_UP"),
		OkCallback = function()
			PinballLuaBridge.InterruptExitGame()
			DestroyLua()
			LuaExchangeHelper.GoToMain()
			OpenPageUntilLoaded("/pinballStage")
		end,
		CancelCallback = function()
			return
		end
	})

	return true
end

function var_0_0.Dispose(arg_14_0)
	var_0_0.super.Dispose(arg_14_0)
end

return var_0_0
