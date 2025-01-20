local var_0_0 = {}
local var_0_1 = {}

function var_0_0.Inject(arg_1_0, arg_1_1)
	function arg_1_1.PlayTimelineAction(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 then
			arg_2_1()
		end

		if arg_2_2 then
			arg_2_2()
		end
	end

	function arg_1_1.EnableCameraCutAction(arg_3_0, arg_3_1)
		arg_3_0.blackboard:EnableCameraCut(arg_3_1)
	end

	function arg_1_1.EnableCameraByTagAction(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		arg_4_0.blackboard:EnableCameraByTag(arg_4_1, arg_4_2, arg_4_3)
	end

	function arg_1_1.EnableCameraShakeAction(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4, arg_5_5)
		if arg_5_1 then
			arg_5_0.blackboard:StartCameraShake(arg_5_2, arg_5_3, arg_5_4)

			local var_5_0 = Time.time
			local var_5_1 = {
				id = -1
			}

			local function var_5_2(arg_6_0)
				if Time.time - var_5_0 >= arg_5_5 then
					arg_5_0:RemoveUpdateAction(var_5_1.id)
					arg_5_0.blackboard:StopCameraShake()
				end
			end

			var_5_1.id = arg_5_0:RegisterUpdateAction(var_5_2)
		else
			arg_5_0.blackboard:StopCameraShake()
		end
	end

	function arg_1_1.CameraMoveAction(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
		arg_7_0.blackboard:CameraMove(arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
	end

	function arg_1_1.EventAction(arg_8_0, arg_8_1)
		arg_8_1()
	end

	function arg_1_1.PlayActorAnimationAction(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4, arg_9_5)
		local var_9_0 = arg_9_0:LoadActor(arg_9_1)

		if arg_9_5 then
			function var_9_0.OnAnimatorEnd()
				arg_9_5()
			end
		end

		var_9_0:PlayAnimaton(arg_9_2, arg_9_3, arg_9_4)
	end

	function arg_1_1.PlayActorEmoteAction(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5, arg_11_6, arg_11_7)
		local var_11_0 = arg_11_0:LoadActor(arg_11_1)

		if arg_11_6 then
			if arg_11_5 then
				function var_11_0.OnEmoteEnd()
					arg_11_5()
				end
			end

			var_11_0:PlayEmote(arg_11_2, arg_11_3, arg_11_4, arg_11_7)
		else
			if arg_11_5 then
				function var_11_0.OnEmoteEnd()
					arg_11_5()
				end
			end

			var_11_0:EndEmote()
		end
	end

	function arg_1_1.EnableRootMotionAction(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
		arg_14_0:LoadActor(arg_14_1):EnableRootmotion(arg_14_2)

		if arg_14_3 then
			arg_14_3()
		end
	end

	function arg_1_1.SetCharToTagAction(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		local var_15_0 = arg_15_0:LoadActor(arg_15_1)
		local var_15_1 = arg_15_0.blackboard:GetPoint(arg_15_2)

		if not isNil(var_15_1) then
			var_15_0:SetTransform(var_15_1)
		end

		if arg_15_3 then
			arg_15_3()
		end
	end

	function arg_1_1.DestroyCharAction(arg_16_0, arg_16_1)
		arg_16_0:UnloadActor(arg_16_1)
	end

	function arg_1_1.ActorSeekerAction(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
		local var_17_0 = arg_17_0:LoadActor(arg_17_1)
		local var_17_1 = {}

		for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
			local var_17_2 = arg_17_0.blackboard:GetPoint(iter_17_1)

			if not isNil(var_17_2) then
				table.insert(var_17_1, var_17_2.position)
			end
		end

		var_17_0:StartSeeker(var_17_1, arg_17_3, function()
			if arg_17_4 then
				arg_17_4()
			end
		end)
	end

	function arg_1_1.LookAtAction(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		local var_19_0 = arg_19_0:LoadActor(arg_19_2)

		if arg_19_1 then
			local var_19_1 = arg_19_0.blackboard:GetPoint(arg_19_3)

			var_19_0:EnableLookAt(arg_19_1, var_19_1)
		else
			var_19_0:EnableLookAt(false, nil)
		end
	end

	function arg_1_1.LookAtRoleAction(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		local var_20_0 = arg_20_0:LoadActor(arg_20_2)

		if arg_20_2 == arg_20_3 or not arg_20_1 then
			var_20_0:EnableLookAt(false, nil)
		end

		local var_20_1 = arg_20_0:LoadActor(arg_20_3)

		var_20_0:EnableLookAt(arg_20_1, var_20_1:GetHeadTrans())
	end

	function arg_1_1.SetLookAtParamsAction(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
		arg_21_0:LoadActor(arg_21_1):SetLookAtParams(arg_21_2, arg_21_3, arg_21_4)
	end

	function arg_1_1.DelayTimeAction(arg_22_0, arg_22_1, arg_22_2)
		local var_22_0 = Time.time
		local var_22_1 = {
			id = -1
		}

		local function var_22_2(arg_23_0)
			if Time.time - var_22_0 >= arg_22_1 then
				arg_22_0:RemoveUpdateAction(var_22_1.id)

				if arg_22_2 then
					arg_22_2()
				end
			end
		end

		var_22_1.id = arg_22_0:RegisterUpdateAction(var_22_2)
	end

	function arg_1_1.HideAllDynamicAction(arg_24_0, arg_24_1, arg_24_2)
		QWorldLuaBridge.HidePlayer(arg_24_2 or false)
		QWorldLuaBridge.CullingAllDynamic(arg_24_1)
	end
end

return var_0_0
