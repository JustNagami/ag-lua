local var_0_0 = {}
local var_0_1 = {}

function var_0_0.Inject(arg_1_0, arg_1_1)
	function arg_1_1.EnableCameraCutAction(arg_2_0, arg_2_1)
		arg_2_0.blackboard:EnableCameraCut(arg_2_1)
	end

	function arg_1_1.EnableCameraByTagAction(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_3_0.blackboard:EnableCameraByTag(arg_3_1, arg_3_2, arg_3_3)
	end

	function arg_1_1.EnableCameraShakeAction(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
		if arg_4_1 then
			arg_4_0.blackboard:StartCameraShake(arg_4_2, arg_4_3, arg_4_4)

			local var_4_0 = Time.time
			local var_4_1 = {
				id = -1
			}
			local var_4_2 = arg_4_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.EnableCameraShake)

			local function var_4_3(arg_5_0)
				if Time.time - var_4_0 >= arg_4_5 then
					arg_4_0:RemoveUpdateAction(var_4_1.id)
					arg_4_0.blackboard:StopCameraShake()
					var_4_2.Complete()
				end
			end

			var_4_1.id = arg_4_0:RegisterUpdateAction(var_4_3)
		else
			arg_4_0.blackboard:StopCameraShake()
		end
	end

	function arg_1_1.CameraMoveAction(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
		arg_6_0.blackboard:CameraMove(arg_6_1, arg_6_2, arg_6_3, arg_6_4, arg_6_5)
	end

	function arg_1_1.EventAction(arg_7_0, arg_7_1)
		arg_7_1()
	end

	function arg_1_1.PlayActorAnimationAction(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4, arg_8_5)
		local var_8_0 = arg_8_0:LoadActor(arg_8_1)

		if arg_8_5 then
			local var_8_1 = arg_8_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.PlayActorAnimation)

			function var_8_0.OnAnimatorEnd()
				arg_8_5()
				var_8_1.Complete()
			end
		end

		var_8_0:PlayAnimaton(true, arg_8_2, arg_8_3, arg_8_4)
	end

	function arg_1_1.PlayActorEmoteAction(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6, arg_10_7)
		local var_10_0 = arg_10_0:LoadActor(arg_10_1)

		if arg_10_6 then
			if arg_10_5 then
				local var_10_1 = arg_10_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.PlayActorEmote)

				function var_10_0.OnEmoteEnd()
					arg_10_5()
					var_10_1.Complete()
				end
			end

			var_10_0:PlayEmote(arg_10_2, arg_10_3, arg_10_4, arg_10_7)
		else
			if arg_10_5 then
				local var_10_2 = arg_10_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.PlayActorEmote)

				function var_10_0.OnEmoteEnd()
					arg_10_5()
					var_10_2.Complete()
				end
			end

			var_10_0:EndEmote()
		end
	end

	function arg_1_1.EnableRootMotionAction(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		arg_13_0:LoadActor(arg_13_1):EnableRootmotion(arg_13_2)

		if arg_13_3 then
			arg_13_3()
		end
	end

	function arg_1_1.SetCharToTagAction(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
		local var_14_0 = arg_14_0:LoadActor(arg_14_1)
		local var_14_1 = arg_14_0.blackboard:GetPoint(arg_14_2)

		if not isNil(var_14_1) then
			var_14_0:SetTransform(var_14_1)
		end

		if arg_14_3 then
			arg_14_3()
		end
	end

	function arg_1_1.DestroyCharAction(arg_15_0, arg_15_1)
		arg_15_0:UnloadActor(arg_15_1)
	end

	function arg_1_1.ActorSeekerAction(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
		local var_16_0 = arg_16_0:LoadActor(arg_16_1)
		local var_16_1 = {}
		local var_16_2 = Vector3.zero

		for iter_16_0, iter_16_1 in ipairs(arg_16_2) do
			if iter_16_1 then
				local var_16_3 = arg_16_0.blackboard:GetPoint(iter_16_1)

				if not isNil(var_16_3) then
					table.insert(var_16_1, var_16_3.position)

					var_16_2 = var_16_3.forward
				end
			end
		end

		local var_16_4 = arg_16_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.ActorSeeker)

		var_16_0:StartSeeker(var_16_2, var_16_1, arg_16_3, function()
			if arg_16_4 then
				arg_16_4()
			end

			var_16_4.Complete()
		end)
	end

	function arg_1_1.LookAtAction(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
		local var_18_0 = arg_18_0:LoadActor(arg_18_2)

		if arg_18_1 then
			local var_18_1 = arg_18_0.blackboard:GetPoint(arg_18_3)

			var_18_0:EnableLookAt(arg_18_1, var_18_1)
		else
			var_18_0:EnableLookAt(false, nil)
		end
	end

	function arg_1_1.LookAtRoleAction(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		local var_19_0 = arg_19_0:LoadActor(arg_19_2)

		if arg_19_2 == arg_19_3 or not arg_19_1 then
			var_19_0:EnableLookAt(false, nil)
		end

		local var_19_1 = arg_19_0:LoadActor(arg_19_3)

		var_19_0:EnableLookAt(arg_19_1, var_19_1:GetHeadTrans())
	end

	function arg_1_1.RotateActorToAction(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4, arg_20_5, arg_20_6)
		return
	end

	function arg_1_1.SetLookAtParamsAction(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
		arg_21_0:LoadActor(arg_21_1):SetLookAtParams(arg_21_2, arg_21_3, arg_21_4)
	end

	function arg_1_1.DelayTimeAction(arg_22_0, arg_22_1, arg_22_2)
		local var_22_0 = Time.time
		local var_22_1 = {
			id = -1
		}
		local var_22_2 = arg_22_0:AddAutoTask(QWStoryConst.StoryNodeTaskType.DelayTime)

		local function var_22_3(arg_23_0)
			if Time.time - var_22_0 >= arg_22_1 then
				arg_22_0:RemoveUpdateAction(var_22_1.id)

				if arg_22_2 then
					arg_22_2()
				end

				var_22_2.Complete()
			end
		end

		var_22_1.id = arg_22_0:RegisterUpdateAction(var_22_3)
	end

	function arg_1_1.HideAllDynamicAction(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
		QWorldLuaBridge.HidePlayer(arg_24_2 or false)

		if arg_24_3 then
			QWorldLuaBridge.CullingAllDynamic(arg_24_1, arg_24_4, arg_24_3)
		else
			QWorldLuaBridge.CullingAllDynamic(arg_24_1, arg_24_4)
		end
	end

	function arg_1_1.PlaySoundsAction(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
		if arg_25_1 == QWStoryConst.SoundsType.Music then
			arg_25_0.isChangeBGM = true

			manager.audio:PlayBGM(arg_25_2, arg_25_3, arg_25_4)
		elseif arg_25_1 == QWStoryConst.SoundsType.Voice then
			manager.audio:PlayVoice(arg_25_2, arg_25_3, arg_25_4)
		elseif arg_25_1 == QWStoryConst.SoundsType.Effect then
			manager.audio:PlayEffect(arg_25_2, arg_25_3, arg_25_4)
		end
	end

	function arg_1_1.StopSoundsAction(arg_26_0, arg_26_1)
		if arg_26_1 == QWStoryConst.SoundsType.Music then
			manager.audio:Stop("music")
		elseif arg_26_1 == QWStoryConst.SoundsType.Voice then
			manager.audio:Stop("voice")
		elseif arg_26_1 == QWStoryConst.SoundsType.Effect then
			manager.audio:Stop("effect")
		end
	end
end

return var_0_0
