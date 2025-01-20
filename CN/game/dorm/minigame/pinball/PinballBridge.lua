return {
	Enter = function(arg_1_0, arg_1_1, arg_1_2)
		arg_1_0:CameraAdaptive()
		gameContext:Go("pinballTurnBasedGame")
	end,
	CameraAdaptive = function(arg_2_0)
		manager.ui:SetMainCamera("pinball")

		local var_2_0 = UnityEngine.Camera.main
		local var_2_1 = _G.SCREEN_WIDTH
		local var_2_2 = _G.SCREEN_HEIGHT / var_2_1 * 21.33 - 12
		local var_2_3 = math.max(var_2_2, -1)

		var_2_0.transform.position = Vector3(0, 0.8, var_2_3)
	end,
	GameSettlement = function(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4, arg_3_5)
		JumpTools.OpenPageByJump("pinballSettlement", {
			remainHp = arg_3_1,
			allRound = arg_3_0,
			remainEHp = arg_3_2,
			BH = arg_3_3,
			EH = arg_3_4,
			SC = arg_3_5
		})
	end,
	GameInterrupt = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
		PinballAction.SendResultToSdk(3, arg_4_0, arg_4_5, arg_4_3, arg_4_4, arg_4_2, arg_4_1)
	end
}
