return {
	Play100 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 100
		arg_1_1.duration_ = 18.6

		local var_1_0 = {
			ja = 18.6,
			ko = 12.433,
			zh = 13.866,
			en = 15.733
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play101(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A01a"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 0

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.A01a

				var_4_5.transform.localPosition = var_4_4
				var_4_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_6 = var_4_5:GetComponent("SpriteRenderer")

				if var_4_6 and var_4_6.sprite then
					local var_4_7 = (var_4_5.transform.localPosition - var_4_3).z
					local var_4_8 = manager.ui.mainCameraCom_
					local var_4_9 = 2 * var_4_7 * Mathf.Tan(var_4_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_10 = var_4_9 * var_4_8.aspect
					local var_4_11 = var_4_6.sprite.bounds.size.x
					local var_4_12 = var_4_6.sprite.bounds.size.y
					local var_4_13 = var_4_10 / var_4_11
					local var_4_14 = var_4_9 / var_4_12
					local var_4_15 = var_4_14 < var_4_13 and var_4_13 or var_4_14

					var_4_5.transform.localScale = Vector3.New(var_4_15, var_4_15, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "A01a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = manager.ui.mainCamera.transform
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = arg_1_1.var_.effect2132132113

				if not var_4_18 then
					var_4_18 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_heiwu"))
					var_4_18.name = "2132132113"
					arg_1_1.var_.effect2132132113 = var_4_18
				end

				local var_4_19 = var_4_16:Find("")

				if var_4_19 then
					var_4_18.transform.parent = var_4_19
				else
					var_4_18.transform.parent = var_4_16
				end

				var_4_18.transform.localPosition = Vector3.New(0, 0, 0)
				var_4_18.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_4_20 = manager.ui.mainCameraCom_
				local var_4_21 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_4_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_4_22 = var_4_18.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_4_23 = 15
				local var_4_24 = 2 * var_4_23 * Mathf.Tan(var_4_20.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_4_20.aspect
				local var_4_25 = 1
				local var_4_26 = 1.7777777777777777

				if var_4_26 < var_4_20.aspect then
					var_4_25 = var_4_24 / (2 * var_4_23 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_4_26)
				end

				for iter_4_2, iter_4_3 in ipairs(var_4_22) do
					local var_4_27 = iter_4_3.transform.localScale

					iter_4_3.transform.localScale = Vector3.New(var_4_27.x / var_4_21 * var_4_25, var_4_27.y / var_4_21, var_4_27.z)
				end
			end

			local var_4_28 = "2079ui_story"

			if arg_1_1.actors_[var_4_28] == nil then
				local var_4_29 = Asset.Load("Char/" .. "2079ui_story")

				if not isNil(var_4_29) then
					local var_4_30 = Object.Instantiate(Asset.Load("Char/" .. "2079ui_story"), arg_1_1.stage_.transform)

					var_4_30.name = var_4_28
					var_4_30.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_28] = var_4_30

					local var_4_31 = var_4_30:GetComponentInChildren(typeof(CharacterEffect))

					var_4_31.enabled = true

					local var_4_32 = GameObjectTools.GetOrAddComponent(var_4_30, typeof(DynamicBoneHelper))

					if var_4_32 then
						var_4_32:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_31.transform, false)

					arg_1_1.var_[var_4_28 .. "Animator"] = var_4_31.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_28 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_28 .. "LipSync"] = var_4_31.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_33 = arg_1_1.actors_["2079ui_story"].transform
			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPos2079ui_story = var_4_33.localPosition
			end

			local var_4_35 = 0.001

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				local var_4_36 = (arg_1_1.time_ - var_4_34) / var_4_35
				local var_4_37 = Vector3.New(0, -1.28, -5.6)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos2079ui_story, var_4_37, var_4_36)

				local var_4_38 = manager.ui.mainCamera.transform.position - var_4_33.position

				var_4_33.forward = Vector3.New(var_4_38.x, var_4_38.y, var_4_38.z)

				local var_4_39 = var_4_33.localEulerAngles

				var_4_39.z = 0
				var_4_39.x = 0
				var_4_33.localEulerAngles = var_4_39
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(0, -1.28, -5.6)

				local var_4_40 = manager.ui.mainCamera.transform.position - var_4_33.position

				var_4_33.forward = Vector3.New(var_4_40.x, var_4_40.y, var_4_40.z)

				local var_4_41 = var_4_33.localEulerAngles

				var_4_41.z = 0
				var_4_41.x = 0
				var_4_33.localEulerAngles = var_4_41
			end

			local var_4_42 = 0

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_4_43 = 0
			local var_4_44 = 1

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_45 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_45:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_46 = arg_1_1:GetWordFromCfg(100011004)
				local var_4_47 = arg_1_1:FormatText(var_4_46.content)

				arg_1_1.text_.text = var_4_47

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_48 = 61
				local var_4_49 = utf8.len(var_4_47)
				local var_4_50 = var_4_48 <= 0 and var_4_44 or var_4_44 * (var_4_49 / var_4_48)

				if var_4_50 > 0 and var_4_44 < var_4_50 then
					arg_1_1.talkMaxDuration = var_4_50
					var_4_43 = var_4_43 + 0.3

					if var_4_50 + var_4_43 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_50 + var_4_43
					end
				end

				arg_1_1.text_.text = var_4_47
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_100011", "100011004", "story_v_out_100011.awb") ~= 0 then
					local var_4_51 = manager.audio:GetVoiceLength("story_v_out_100011", "100011004", "story_v_out_100011.awb") / 1000

					if var_4_51 + var_4_43 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_51 + var_4_43
					end

					if var_4_46.prefab_name ~= "" and arg_1_1.actors_[var_4_46.prefab_name] ~= nil then
						local var_4_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_46.prefab_name].transform, "story_v_out_100011", "100011004", "story_v_out_100011.awb")

						arg_1_1:RecordAudio("100011004", var_4_52)
						arg_1_1:RecordAudio("100011004", var_4_52)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_100011", "100011004", "story_v_out_100011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_100011", "100011004", "story_v_out_100011.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_53 = var_4_43 + 0.3
			local var_4_54 = math.max(var_4_44, arg_1_1.talkMaxDuration)

			if var_4_53 <= arg_1_1.time_ and arg_1_1.time_ < var_4_53 + var_4_54 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_53) / var_4_54

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_53 + var_4_54 and arg_1_1.time_ < var_4_53 + var_4_54 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play101 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 101
		arg_7_1.duration_ = 8.1

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play102(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = manager.ui.mainCamera.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				local var_10_2 = arg_7_1.var_.effect2132132113

				if var_10_2 then
					Object.Destroy(var_10_2)

					arg_7_1.var_.effect2132132113 = nil
				end
			end

			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1:PlayTimeline("2079ui_story", "StoryTimeline/CharAction/story2079/story2079action/2079action1_1")
			end

			local var_10_4 = manager.ui.mainCamera.transform
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				local var_10_6 = arg_7_1.var_.effect2132132114

				if not var_10_6 then
					var_10_6 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_redlight_keep"))
					var_10_6.name = "2132132114"
					arg_7_1.var_.effect2132132114 = var_10_6
				end

				local var_10_7 = var_10_4:Find("")

				if var_10_7 then
					var_10_6.transform.parent = var_10_7
				else
					var_10_6.transform.parent = var_10_4
				end

				var_10_6.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_6.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_10_8 = manager.ui.mainCameraCom_
				local var_10_9 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_10_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_10_10 = var_10_6.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_10_11 = 15
				local var_10_12 = 2 * var_10_11 * Mathf.Tan(var_10_8.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_10_8.aspect
				local var_10_13 = 1
				local var_10_14 = 1.7777777777777777

				if var_10_14 < var_10_8.aspect then
					var_10_13 = var_10_12 / (2 * var_10_11 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_10_14)
				end

				for iter_10_0, iter_10_1 in ipairs(var_10_10) do
					local var_10_15 = iter_10_1.transform.localScale

					iter_10_1.transform.localScale = Vector3.New(var_10_15.x / var_10_9 * var_10_13, var_10_15.y / var_10_9, var_10_15.z)
				end
			end

			local var_10_16 = manager.ui.mainCamera.transform
			local var_10_17 = 4

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				local var_10_18 = arg_7_1.var_.effect2132132115

				if not var_10_18 then
					var_10_18 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_redlight_out"))
					var_10_18.name = "2132132115"
					arg_7_1.var_.effect2132132115 = var_10_18
				end

				local var_10_19 = var_10_16:Find("")

				if var_10_19 then
					var_10_18.transform.parent = var_10_19
				else
					var_10_18.transform.parent = var_10_16
				end

				var_10_18.transform.localPosition = Vector3.New(0, 0, 0)
				var_10_18.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_10_20 = manager.ui.mainCameraCom_
				local var_10_21 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_10_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_10_22 = var_10_18.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_10_23 = 15
				local var_10_24 = 2 * var_10_23 * Mathf.Tan(var_10_20.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_10_20.aspect
				local var_10_25 = 1
				local var_10_26 = 1.7777777777777777

				if var_10_26 < var_10_20.aspect then
					var_10_25 = var_10_24 / (2 * var_10_23 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_10_26)
				end

				for iter_10_2, iter_10_3 in ipairs(var_10_22) do
					local var_10_27 = iter_10_3.transform.localScale

					iter_10_3.transform.localScale = Vector3.New(var_10_27.x / var_10_21 * var_10_25, var_10_27.y / var_10_21, var_10_27.z)
				end
			end

			local var_10_28 = manager.ui.mainCamera.transform
			local var_10_29 = 6.9

			if var_10_29 < arg_7_1.time_ and arg_7_1.time_ <= var_10_29 + arg_10_0 then
				local var_10_30 = arg_7_1.var_.effect2132132114

				if var_10_30 then
					Object.Destroy(var_10_30)

					arg_7_1.var_.effect2132132114 = nil
				end
			end
		end
	end,
	Play102 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 102
		arg_11_1.duration_ = 4.7

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play103(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = manager.ui.mainCamera.transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				local var_14_2 = arg_11_1.var_.effect2132132114

				if var_14_2 then
					Object.Destroy(var_14_2)

					arg_11_1.var_.effect2132132114 = nil
				end
			end

			local var_14_3 = manager.ui.mainCamera.transform
			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				local var_14_5 = arg_11_1.var_.effect21321332231132

				if not var_14_5 then
					var_14_5 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_ripple"))
					var_14_5.name = "21321332231132"
					arg_11_1.var_.effect21321332231132 = var_14_5
				end

				local var_14_6 = var_14_3:Find("")

				if var_14_6 then
					var_14_5.transform.parent = var_14_6
				else
					var_14_5.transform.parent = var_14_3
				end

				var_14_5.transform.localPosition = Vector3.New(0, 0, 0)
				var_14_5.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_14_7 = manager.ui.mainCameraCom_
				local var_14_8 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_14_7.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_14_9 = var_14_5.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_14_10 = 15
				local var_14_11 = 2 * var_14_10 * Mathf.Tan(var_14_7.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_14_7.aspect
				local var_14_12 = 1
				local var_14_13 = 1.7777777777777777

				if var_14_13 < var_14_7.aspect then
					var_14_12 = var_14_11 / (2 * var_14_10 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_14_13)
				end

				for iter_14_0, iter_14_1 in ipairs(var_14_9) do
					local var_14_14 = iter_14_1.transform.localScale

					iter_14_1.transform.localScale = Vector3.New(var_14_14.x / var_14_8 * var_14_12, var_14_14.y / var_14_8, var_14_14.z)
				end
			end

			local var_14_15 = arg_11_1.actors_["2079ui_story"].transform
			local var_14_16 = 0

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.var_.moveOldPos2079ui_story = var_14_15.localPosition
			end

			local var_14_17 = 0.1

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_17 then
				local var_14_18 = (arg_11_1.time_ - var_14_16) / var_14_17
				local var_14_19 = Vector3.New(0, 100, 0)

				var_14_15.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos2079ui_story, var_14_19, var_14_18)

				local var_14_20 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_20.x, var_14_20.y, var_14_20.z)

				local var_14_21 = var_14_15.localEulerAngles

				var_14_21.z = 0
				var_14_21.x = 0
				var_14_15.localEulerAngles = var_14_21
			end

			if arg_11_1.time_ >= var_14_16 + var_14_17 and arg_11_1.time_ < var_14_16 + var_14_17 + arg_14_0 then
				var_14_15.localPosition = Vector3.New(0, 100, 0)

				local var_14_22 = manager.ui.mainCamera.transform.position - var_14_15.position

				var_14_15.forward = Vector3.New(var_14_22.x, var_14_22.y, var_14_22.z)

				local var_14_23 = var_14_15.localEulerAngles

				var_14_23.z = 0
				var_14_23.x = 0
				var_14_15.localEulerAngles = var_14_23
			end
		end
	end,
	Play103 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103
		arg_15_1.duration_ = 10.8

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play104(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = manager.ui.mainCamera.transform
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				local var_18_2 = arg_15_1.var_.effect21321332231132

				if var_18_2 then
					Object.Destroy(var_18_2)

					arg_15_1.var_.effect21321332231132 = nil
				end
			end

			local var_18_3 = manager.ui.mainCamera.transform
			local var_18_4 = 0

			if var_18_4 < arg_15_1.time_ and arg_15_1.time_ <= var_18_4 + arg_18_0 then
				local var_18_5 = arg_15_1.var_.effect21323121222223123

				if not var_18_5 then
					var_18_5 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_redtwister_keep"))
					var_18_5.name = "21323121222223123"
					arg_15_1.var_.effect21323121222223123 = var_18_5
				end

				local var_18_6 = var_18_3:Find("")

				if var_18_6 then
					var_18_5.transform.parent = var_18_6
				else
					var_18_5.transform.parent = var_18_3
				end

				var_18_5.transform.localPosition = Vector3.New(0, 0, 0.69)
				var_18_5.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_18_7 = manager.ui.mainCameraCom_
				local var_18_8 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_18_7.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_18_9 = var_18_5.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_18_10 = 15
				local var_18_11 = 2 * var_18_10 * Mathf.Tan(var_18_7.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_18_7.aspect
				local var_18_12 = 1
				local var_18_13 = 1.7777777777777777

				if var_18_13 < var_18_7.aspect then
					var_18_12 = var_18_11 / (2 * var_18_10 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_18_13)
				end

				for iter_18_0, iter_18_1 in ipairs(var_18_9) do
					local var_18_14 = iter_18_1.transform.localScale

					iter_18_1.transform.localScale = Vector3.New(var_18_14.x / var_18_8 * var_18_12, var_18_14.y / var_18_8, var_18_14.z)
				end
			end

			local var_18_15 = manager.ui.mainCamera.transform
			local var_18_16 = 5.4

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				local var_18_17 = arg_15_1.var_.effect213212312322223

				if not var_18_17 then
					var_18_17 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_redtwister_out"))
					var_18_17.name = "213212312322223"
					arg_15_1.var_.effect213212312322223 = var_18_17
				end

				local var_18_18 = var_18_15:Find("")

				if var_18_18 then
					var_18_17.transform.parent = var_18_18
				else
					var_18_17.transform.parent = var_18_15
				end

				var_18_17.transform.localPosition = Vector3.New(0, 0, 0.69)
				var_18_17.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_18_19 = manager.ui.mainCameraCom_
				local var_18_20 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_18_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_18_21 = var_18_17.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_18_22 = 15
				local var_18_23 = 2 * var_18_22 * Mathf.Tan(var_18_19.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_18_19.aspect
				local var_18_24 = 1
				local var_18_25 = 1.7777777777777777

				if var_18_25 < var_18_19.aspect then
					var_18_24 = var_18_23 / (2 * var_18_22 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_18_25)
				end

				for iter_18_2, iter_18_3 in ipairs(var_18_21) do
					local var_18_26 = iter_18_3.transform.localScale

					iter_18_3.transform.localScale = Vector3.New(var_18_26.x / var_18_20 * var_18_24, var_18_26.y / var_18_20, var_18_26.z)
				end
			end

			local var_18_27 = manager.ui.mainCamera.transform
			local var_18_28 = 5.399999999999

			if var_18_28 < arg_15_1.time_ and arg_15_1.time_ <= var_18_28 + arg_18_0 then
				local var_18_29 = arg_15_1.var_.effect21323121222223123

				if var_18_29 then
					Object.Destroy(var_18_29)

					arg_15_1.var_.effect21323121222223123 = nil
				end
			end
		end
	end,
	Play104 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 104
		arg_19_1.duration_ = 7.13

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play105(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1148ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Asset.Load("Char/" .. "1148ui_story")

				if not isNil(var_22_1) then
					local var_22_2 = Object.Instantiate(Asset.Load("Char/" .. "1148ui_story"), arg_19_1.stage_.transform)

					var_22_2.name = var_22_0
					var_22_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_19_1.actors_[var_22_0] = var_22_2

					local var_22_3 = var_22_2:GetComponentInChildren(typeof(CharacterEffect))

					var_22_3.enabled = true

					local var_22_4 = GameObjectTools.GetOrAddComponent(var_22_2, typeof(DynamicBoneHelper))

					if var_22_4 then
						var_22_4:EnableDynamicBone(false)
					end

					arg_19_1:ShowWeapon(var_22_3.transform, false)

					arg_19_1.var_[var_22_0 .. "Animator"] = var_22_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
					arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_22_5 = arg_19_1.actors_["1148ui_story"]
			local var_22_6 = 0

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 and not isNil(var_22_5) and arg_19_1.var_.characterEffect1148ui_story == nil then
				arg_19_1.var_.characterEffect1148ui_story = var_22_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_7 = 0.1

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_7 and not isNil(var_22_5) then
				local var_22_8 = (arg_19_1.time_ - var_22_6) / var_22_7

				if arg_19_1.var_.characterEffect1148ui_story and not isNil(var_22_5) then
					arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_6 + var_22_7 and arg_19_1.time_ < var_22_6 + var_22_7 + arg_22_0 and not isNil(var_22_5) and arg_19_1.var_.characterEffect1148ui_story then
				arg_19_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_22_9 = "1084ui_story"

			if arg_19_1.actors_[var_22_9] == nil then
				local var_22_10 = Asset.Load("Char/" .. "1084ui_story")

				if not isNil(var_22_10) then
					local var_22_11 = Object.Instantiate(Asset.Load("Char/" .. "1084ui_story"), arg_19_1.stage_.transform)

					var_22_11.name = var_22_9
					var_22_11.transform.localPosition = Vector3.New(0, 100, 0)
					arg_19_1.actors_[var_22_9] = var_22_11

					local var_22_12 = var_22_11:GetComponentInChildren(typeof(CharacterEffect))

					var_22_12.enabled = true

					local var_22_13 = GameObjectTools.GetOrAddComponent(var_22_11, typeof(DynamicBoneHelper))

					if var_22_13 then
						var_22_13:EnableDynamicBone(false)
					end

					arg_19_1:ShowWeapon(var_22_12.transform, false)

					arg_19_1.var_[var_22_9 .. "Animator"] = var_22_12.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_19_1.var_[var_22_9 .. "Animator"].applyRootMotion = true
					arg_19_1.var_[var_22_9 .. "LipSync"] = var_22_12.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_22_14 = arg_19_1.actors_["1084ui_story"]
			local var_22_15 = 0

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 and not isNil(var_22_14) and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_16 = 0.1

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_16 and not isNil(var_22_14) then
				local var_22_17 = (arg_19_1.time_ - var_22_15) / var_22_16

				if arg_19_1.var_.characterEffect1084ui_story and not isNil(var_22_14) then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_15 + var_22_16 and arg_19_1.time_ < var_22_15 + var_22_16 + arg_22_0 and not isNil(var_22_14) and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_18 = "ST05"

			if arg_19_1.bgs_[var_22_18] == nil then
				local var_22_19 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_19:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_18)
				var_22_19.name = var_22_18
				var_22_19.transform.parent = arg_19_1.stage_.transform
				var_22_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_18] = var_22_19
			end

			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				local var_22_21 = manager.ui.mainCamera.transform.localPosition
				local var_22_22 = Vector3.New(0, 0, 10) + Vector3.New(var_22_21.x, var_22_21.y, 0)
				local var_22_23 = arg_19_1.bgs_.ST05

				var_22_23.transform.localPosition = var_22_22
				var_22_23.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_24 = var_22_23:GetComponent("SpriteRenderer")

				if var_22_24 and var_22_24.sprite then
					local var_22_25 = (var_22_23.transform.localPosition - var_22_21).z
					local var_22_26 = manager.ui.mainCameraCom_
					local var_22_27 = 2 * var_22_25 * Mathf.Tan(var_22_26.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_28 = var_22_27 * var_22_26.aspect
					local var_22_29 = var_22_24.sprite.bounds.size.x
					local var_22_30 = var_22_24.sprite.bounds.size.y
					local var_22_31 = var_22_28 / var_22_29
					local var_22_32 = var_22_27 / var_22_30
					local var_22_33 = var_22_32 < var_22_31 and var_22_31 or var_22_32

					var_22_23.transform.localScale = Vector3.New(var_22_33, var_22_33, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST05" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_34 = "ST03a"

			if arg_19_1.bgs_[var_22_34] == nil then
				local var_22_35 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_35:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_34)
				var_22_35.name = var_22_34
				var_22_35.transform.parent = arg_19_1.stage_.transform
				var_22_35.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_34] = var_22_35
			end

			local var_22_36 = arg_19_1.bgs_.ST03a.transform
			local var_22_37 = 0

			if var_22_37 < arg_19_1.time_ and arg_19_1.time_ <= var_22_37 + arg_22_0 then
				arg_19_1.var_.moveOldPosST03a = var_22_36.localPosition
			end

			local var_22_38 = 0.001

			if var_22_37 <= arg_19_1.time_ and arg_19_1.time_ < var_22_37 + var_22_38 then
				local var_22_39 = (arg_19_1.time_ - var_22_37) / var_22_38
				local var_22_40 = Vector3.New(0, -100, 10)

				var_22_36.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPosST03a, var_22_40, var_22_39)
			end

			if arg_19_1.time_ >= var_22_37 + var_22_38 and arg_19_1.time_ < var_22_37 + var_22_38 + arg_22_0 then
				var_22_36.localPosition = Vector3.New(0, -100, 10)
			end

			local var_22_41 = 0

			if var_22_41 < arg_19_1.time_ and arg_19_1.time_ <= var_22_41 + arg_22_0 then
				arg_19_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action452")
			end

			local var_22_42 = 0
			local var_22_43 = 0.1

			if var_22_42 < arg_19_1.time_ and arg_19_1.time_ <= var_22_42 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_44 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_44:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_45 = arg_19_1:GetWordFromCfg(100)
				local var_22_46 = arg_19_1:FormatText(var_22_45.content)

				arg_19_1.text_.text = var_22_46

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_47 = 4
				local var_22_48 = utf8.len(var_22_46)
				local var_22_49 = var_22_47 <= 0 and var_22_43 or var_22_43 * (var_22_48 / var_22_47)

				if var_22_49 > 0 and var_22_43 < var_22_49 then
					arg_19_1.talkMaxDuration = var_22_49
					var_22_42 = var_22_42 + 0.3

					if var_22_49 + var_22_42 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_49 + var_22_42
					end
				end

				arg_19_1.text_.text = var_22_46
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_50 = var_22_42 + 0.3
			local var_22_51 = math.max(var_22_43, arg_19_1.talkMaxDuration)

			if var_22_50 <= arg_19_1.time_ and arg_19_1.time_ < var_22_50 + var_22_51 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_50) / var_22_51

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_50 + var_22_51 and arg_19_1.time_ < var_22_50 + var_22_51 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play105 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 105
		arg_25_1.duration_ = 7.37

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play106(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1148ui_story"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story == nil then
				arg_25_1.var_.characterEffect1148ui_story = var_28_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_2 = 0.1

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 and not isNil(var_28_0) then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.characterEffect1148ui_story and not isNil(var_28_0) then
					arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and not isNil(var_28_0) and arg_25_1.var_.characterEffect1148ui_story then
				arg_25_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_28_4 = arg_25_1.actors_["1084ui_story"]
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story == nil then
				arg_25_1.var_.characterEffect1084ui_story = var_28_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_6 = 0.1

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 and not isNil(var_28_4) then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6

				if arg_25_1.var_.characterEffect1084ui_story and not isNil(var_28_4) then
					arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 and not isNil(var_28_4) and arg_25_1.var_.characterEffect1084ui_story then
				arg_25_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_28_8 = "ST05a"

			if arg_25_1.bgs_[var_28_8] == nil then
				local var_28_9 = Object.Instantiate(arg_25_1.paintGo_)

				var_28_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_28_8)
				var_28_9.name = var_28_8
				var_28_9.transform.parent = arg_25_1.stage_.transform
				var_28_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.bgs_[var_28_8] = var_28_9
			end

			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 then
				local var_28_11 = manager.ui.mainCamera.transform.localPosition
				local var_28_12 = Vector3.New(0, 0, 10) + Vector3.New(var_28_11.x, var_28_11.y, 0)
				local var_28_13 = arg_25_1.bgs_.ST05a

				var_28_13.transform.localPosition = var_28_12
				var_28_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_28_14 = var_28_13:GetComponent("SpriteRenderer")

				if var_28_14 and var_28_14.sprite then
					local var_28_15 = (var_28_13.transform.localPosition - var_28_11).z
					local var_28_16 = manager.ui.mainCameraCom_
					local var_28_17 = 2 * var_28_15 * Mathf.Tan(var_28_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_28_18 = var_28_17 * var_28_16.aspect
					local var_28_19 = var_28_14.sprite.bounds.size.x
					local var_28_20 = var_28_14.sprite.bounds.size.y
					local var_28_21 = var_28_18 / var_28_19
					local var_28_22 = var_28_17 / var_28_20
					local var_28_23 = var_28_22 < var_28_21 and var_28_21 or var_28_22

					var_28_13.transform.localScale = Vector3.New(var_28_23, var_28_23, 0)
				end

				for iter_28_0, iter_28_1 in pairs(arg_25_1.bgs_) do
					if iter_28_0 ~= "ST05a" then
						iter_28_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_28_24 = arg_25_1.bgs_.ST05.transform
			local var_28_25 = 0

			if var_28_25 < arg_25_1.time_ and arg_25_1.time_ <= var_28_25 + arg_28_0 then
				arg_25_1.var_.moveOldPosST05 = var_28_24.localPosition
			end

			local var_28_26 = 0.001

			if var_28_25 <= arg_25_1.time_ and arg_25_1.time_ < var_28_25 + var_28_26 then
				local var_28_27 = (arg_25_1.time_ - var_28_25) / var_28_26
				local var_28_28 = Vector3.New(0, -100, 10)

				var_28_24.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPosST05, var_28_28, var_28_27)
			end

			if arg_25_1.time_ >= var_28_25 + var_28_26 and arg_25_1.time_ < var_28_25 + var_28_26 + arg_28_0 then
				var_28_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_28_29 = 0

			if var_28_29 < arg_25_1.time_ and arg_25_1.time_ <= var_28_29 + arg_28_0 then
				arg_25_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action423")
			end

			local var_28_30 = 0
			local var_28_31 = 0.1

			if var_28_30 < arg_25_1.time_ and arg_25_1.time_ <= var_28_30 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_32 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_32:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_33 = arg_25_1:GetWordFromCfg(100)
				local var_28_34 = arg_25_1:FormatText(var_28_33.content)

				arg_25_1.text_.text = var_28_34

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_35 = 4
				local var_28_36 = utf8.len(var_28_34)
				local var_28_37 = var_28_35 <= 0 and var_28_31 or var_28_31 * (var_28_36 / var_28_35)

				if var_28_37 > 0 and var_28_31 < var_28_37 then
					arg_25_1.talkMaxDuration = var_28_37
					var_28_30 = var_28_30 + 0.3

					if var_28_37 + var_28_30 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_37 + var_28_30
					end
				end

				arg_25_1.text_.text = var_28_34
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_38 = var_28_30 + 0.3
			local var_28_39 = math.max(var_28_31, arg_25_1.talkMaxDuration)

			if var_28_38 <= arg_25_1.time_ and arg_25_1.time_ < var_28_38 + var_28_39 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_38) / var_28_39

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_38 + var_28_39 and arg_25_1.time_ < var_28_38 + var_28_39 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play106 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 106
		arg_31_1.duration_ = 6.83

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play107(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1148ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story == nil then
				arg_31_1.var_.characterEffect1148ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 and not isNil(var_34_0) then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1148ui_story and not isNil(var_34_0) then
					arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and not isNil(var_34_0) and arg_31_1.var_.characterEffect1148ui_story then
				arg_31_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1084ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 and not isNil(var_34_4) then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1084ui_story and not isNil(var_34_4) then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and not isNil(var_34_4) and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_8 = "ST06"

			if arg_31_1.bgs_[var_34_8] == nil then
				local var_34_9 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_8)
				var_34_9.name = var_34_8
				var_34_9.transform.parent = arg_31_1.stage_.transform
				var_34_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_8] = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				local var_34_11 = manager.ui.mainCamera.transform.localPosition
				local var_34_12 = Vector3.New(0, 0, 10) + Vector3.New(var_34_11.x, var_34_11.y, 0)
				local var_34_13 = arg_31_1.bgs_.ST06

				var_34_13.transform.localPosition = var_34_12
				var_34_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_14 = var_34_13:GetComponent("SpriteRenderer")

				if var_34_14 and var_34_14.sprite then
					local var_34_15 = (var_34_13.transform.localPosition - var_34_11).z
					local var_34_16 = manager.ui.mainCameraCom_
					local var_34_17 = 2 * var_34_15 * Mathf.Tan(var_34_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_18 = var_34_17 * var_34_16.aspect
					local var_34_19 = var_34_14.sprite.bounds.size.x
					local var_34_20 = var_34_14.sprite.bounds.size.y
					local var_34_21 = var_34_18 / var_34_19
					local var_34_22 = var_34_17 / var_34_20
					local var_34_23 = var_34_22 < var_34_21 and var_34_21 or var_34_22

					var_34_13.transform.localScale = Vector3.New(var_34_23, var_34_23, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST06" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_24 = arg_31_1.bgs_.ST05a.transform
			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.var_.moveOldPosST05a = var_34_24.localPosition
			end

			local var_34_26 = 0.001

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26
				local var_34_28 = Vector3.New(0, -100, 10)

				var_34_24.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPosST05a, var_34_28, var_34_27)
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				var_34_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_34_29 = 0

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action423")
			end

			local var_34_30 = 0
			local var_34_31 = 0.1

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_32 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_32:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(100)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 4
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37
					var_34_30 = var_34_30 + 0.3

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_38 = var_34_30 + 0.3
			local var_34_39 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_38 <= arg_31_1.time_ and arg_31_1.time_ < var_34_38 + var_34_39 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_38) / var_34_39

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_38 + var_34_39 and arg_31_1.time_ < var_34_38 + var_34_39 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play107 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 107
		arg_37_1.duration_ = 6.8

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play108(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1148ui_story"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story == nil then
				arg_37_1.var_.characterEffect1148ui_story = var_40_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_2 = 0.1

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 and not isNil(var_40_0) then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.characterEffect1148ui_story and not isNil(var_40_0) then
					arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and not isNil(var_40_0) and arg_37_1.var_.characterEffect1148ui_story then
				arg_37_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_40_4 = arg_37_1.actors_["1084ui_story"]
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_6 = 0.1

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 and not isNil(var_40_4) then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6

				if arg_37_1.var_.characterEffect1084ui_story and not isNil(var_40_4) then
					arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 and not isNil(var_40_4) and arg_37_1.var_.characterEffect1084ui_story then
				arg_37_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_40_8 = "ST06a"

			if arg_37_1.bgs_[var_40_8] == nil then
				local var_40_9 = Object.Instantiate(arg_37_1.paintGo_)

				var_40_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_40_8)
				var_40_9.name = var_40_8
				var_40_9.transform.parent = arg_37_1.stage_.transform
				var_40_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.bgs_[var_40_8] = var_40_9
			end

			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 then
				local var_40_11 = manager.ui.mainCamera.transform.localPosition
				local var_40_12 = Vector3.New(0, 0, 10) + Vector3.New(var_40_11.x, var_40_11.y, 0)
				local var_40_13 = arg_37_1.bgs_.ST06a

				var_40_13.transform.localPosition = var_40_12
				var_40_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_40_14 = var_40_13:GetComponent("SpriteRenderer")

				if var_40_14 and var_40_14.sprite then
					local var_40_15 = (var_40_13.transform.localPosition - var_40_11).z
					local var_40_16 = manager.ui.mainCameraCom_
					local var_40_17 = 2 * var_40_15 * Mathf.Tan(var_40_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_40_18 = var_40_17 * var_40_16.aspect
					local var_40_19 = var_40_14.sprite.bounds.size.x
					local var_40_20 = var_40_14.sprite.bounds.size.y
					local var_40_21 = var_40_18 / var_40_19
					local var_40_22 = var_40_17 / var_40_20
					local var_40_23 = var_40_22 < var_40_21 and var_40_21 or var_40_22

					var_40_13.transform.localScale = Vector3.New(var_40_23, var_40_23, 0)
				end

				for iter_40_0, iter_40_1 in pairs(arg_37_1.bgs_) do
					if iter_40_0 ~= "ST06a" then
						iter_40_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_40_24 = arg_37_1.bgs_.ST06.transform
			local var_40_25 = 0

			if var_40_25 < arg_37_1.time_ and arg_37_1.time_ <= var_40_25 + arg_40_0 then
				arg_37_1.var_.moveOldPosST06 = var_40_24.localPosition
			end

			local var_40_26 = 0.001

			if var_40_25 <= arg_37_1.time_ and arg_37_1.time_ < var_40_25 + var_40_26 then
				local var_40_27 = (arg_37_1.time_ - var_40_25) / var_40_26
				local var_40_28 = Vector3.New(0, -100, 10)

				var_40_24.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPosST06, var_40_28, var_40_27)
			end

			if arg_37_1.time_ >= var_40_25 + var_40_26 and arg_37_1.time_ < var_40_25 + var_40_26 + arg_40_0 then
				var_40_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_40_29 = 0

			if var_40_29 < arg_37_1.time_ and arg_37_1.time_ <= var_40_29 + arg_40_0 then
				arg_37_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action434")
			end

			local var_40_30 = 0
			local var_40_31 = 0.1

			if var_40_30 < arg_37_1.time_ and arg_37_1.time_ <= var_40_30 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_32 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_32:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_33 = arg_37_1:GetWordFromCfg(100)
				local var_40_34 = arg_37_1:FormatText(var_40_33.content)

				arg_37_1.text_.text = var_40_34

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_35 = 4
				local var_40_36 = utf8.len(var_40_34)
				local var_40_37 = var_40_35 <= 0 and var_40_31 or var_40_31 * (var_40_36 / var_40_35)

				if var_40_37 > 0 and var_40_31 < var_40_37 then
					arg_37_1.talkMaxDuration = var_40_37
					var_40_30 = var_40_30 + 0.3

					if var_40_37 + var_40_30 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_37 + var_40_30
					end
				end

				arg_37_1.text_.text = var_40_34
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_38 = var_40_30 + 0.3
			local var_40_39 = math.max(var_40_31, arg_37_1.talkMaxDuration)

			if var_40_38 <= arg_37_1.time_ and arg_37_1.time_ < var_40_38 + var_40_39 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_38) / var_40_39

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_38 + var_40_39 and arg_37_1.time_ < var_40_38 + var_40_39 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play108 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 108
		arg_43_1.duration_ = 7.05

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play109(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1148ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story == nil then
				arg_43_1.var_.characterEffect1148ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.1

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 and not isNil(var_46_0) then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1148ui_story and not isNil(var_46_0) then
					arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and not isNil(var_46_0) and arg_43_1.var_.characterEffect1148ui_story then
				arg_43_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1084ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.1

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 and not isNil(var_46_4) then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1084ui_story and not isNil(var_46_4) then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and not isNil(var_46_4) and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_8 = "ST06b"

			if arg_43_1.bgs_[var_46_8] == nil then
				local var_46_9 = Object.Instantiate(arg_43_1.paintGo_)

				var_46_9:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_8)
				var_46_9.name = var_46_8
				var_46_9.transform.parent = arg_43_1.stage_.transform
				var_46_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_8] = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				local var_46_11 = manager.ui.mainCamera.transform.localPosition
				local var_46_12 = Vector3.New(0, 0, 10) + Vector3.New(var_46_11.x, var_46_11.y, 0)
				local var_46_13 = arg_43_1.bgs_.ST06b

				var_46_13.transform.localPosition = var_46_12
				var_46_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_14 = var_46_13:GetComponent("SpriteRenderer")

				if var_46_14 and var_46_14.sprite then
					local var_46_15 = (var_46_13.transform.localPosition - var_46_11).z
					local var_46_16 = manager.ui.mainCameraCom_
					local var_46_17 = 2 * var_46_15 * Mathf.Tan(var_46_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_18 = var_46_17 * var_46_16.aspect
					local var_46_19 = var_46_14.sprite.bounds.size.x
					local var_46_20 = var_46_14.sprite.bounds.size.y
					local var_46_21 = var_46_18 / var_46_19
					local var_46_22 = var_46_17 / var_46_20
					local var_46_23 = var_46_22 < var_46_21 and var_46_21 or var_46_22

					var_46_13.transform.localScale = Vector3.New(var_46_23, var_46_23, 0)
				end

				for iter_46_0, iter_46_1 in pairs(arg_43_1.bgs_) do
					if iter_46_0 ~= "ST06b" then
						iter_46_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_46_24 = arg_43_1.bgs_.ST06a.transform
			local var_46_25 = 0

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 then
				arg_43_1.var_.moveOldPosST06a = var_46_24.localPosition
			end

			local var_46_26 = 0.001

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_25) / var_46_26
				local var_46_28 = Vector3.New(0, -100, 10)

				var_46_24.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPosST06a, var_46_28, var_46_27)
			end

			if arg_43_1.time_ >= var_46_25 + var_46_26 and arg_43_1.time_ < var_46_25 + var_46_26 + arg_46_0 then
				var_46_24.localPosition = Vector3.New(0, -100, 10)
			end

			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action434")
			end

			local var_46_30 = 0
			local var_46_31 = 0.1

			if var_46_30 < arg_43_1.time_ and arg_43_1.time_ <= var_46_30 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0

				arg_43_1.dialog_:SetActive(true)

				local var_46_32 = LeanTween.value(arg_43_1.dialog_, 0, 1, 0.3)

				var_46_32:setOnUpdate(LuaHelper.FloatAction(function(arg_47_0)
					arg_43_1.dialogCg_.alpha = arg_47_0
				end))
				var_46_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_43_1.dialog_)
					var_46_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_43_1.duration_ = arg_43_1.duration_ + 0.3

				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_33 = arg_43_1:GetWordFromCfg(100)
				local var_46_34 = arg_43_1:FormatText(var_46_33.content)

				arg_43_1.text_.text = var_46_34

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_35 = 4
				local var_46_36 = utf8.len(var_46_34)
				local var_46_37 = var_46_35 <= 0 and var_46_31 or var_46_31 * (var_46_36 / var_46_35)

				if var_46_37 > 0 and var_46_31 < var_46_37 then
					arg_43_1.talkMaxDuration = var_46_37
					var_46_30 = var_46_30 + 0.3

					if var_46_37 + var_46_30 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_37 + var_46_30
					end
				end

				arg_43_1.text_.text = var_46_34
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_38 = var_46_30 + 0.3
			local var_46_39 = math.max(var_46_31, arg_43_1.talkMaxDuration)

			if var_46_38 <= arg_43_1.time_ and arg_43_1.time_ < var_46_38 + var_46_39 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_38) / var_46_39

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_38 + var_46_39 and arg_43_1.time_ < var_46_38 + var_46_39 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play109 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 109
		arg_49_1.duration_ = 6.67

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play110(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1148ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story == nil then
				arg_49_1.var_.characterEffect1148ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.1

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 and not isNil(var_52_0) then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect1148ui_story and not isNil(var_52_0) then
					arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and not isNil(var_52_0) and arg_49_1.var_.characterEffect1148ui_story then
				arg_49_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_52_4 = arg_49_1.actors_["1084ui_story"]
			local var_52_5 = 0

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_6 = 0.1

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 and not isNil(var_52_4) then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6

				if arg_49_1.var_.characterEffect1084ui_story and not isNil(var_52_4) then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 and not isNil(var_52_4) and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_52_8 = arg_49_1.bgs_.ST06b.transform
			local var_52_9 = 0

			if var_52_9 < arg_49_1.time_ and arg_49_1.time_ <= var_52_9 + arg_52_0 then
				arg_49_1.var_.moveOldPosST06b = var_52_8.localPosition
			end

			local var_52_10 = 0.001

			if var_52_9 <= arg_49_1.time_ and arg_49_1.time_ < var_52_9 + var_52_10 then
				local var_52_11 = (arg_49_1.time_ - var_52_9) / var_52_10
				local var_52_12 = Vector3.New(0, -100, 10)

				var_52_8.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPosST06b, var_52_12, var_52_11)
			end

			if arg_49_1.time_ >= var_52_9 + var_52_10 and arg_49_1.time_ < var_52_9 + var_52_10 + arg_52_0 then
				var_52_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_52_13 = "ST07a"

			if arg_49_1.bgs_[var_52_13] == nil then
				local var_52_14 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_13)
				var_52_14.name = var_52_13
				var_52_14.transform.parent = arg_49_1.stage_.transform
				var_52_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_13] = var_52_14
			end

			local var_52_15 = 0

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				local var_52_16 = manager.ui.mainCamera.transform.localPosition
				local var_52_17 = Vector3.New(0, 0, 10) + Vector3.New(var_52_16.x, var_52_16.y, 0)
				local var_52_18 = arg_49_1.bgs_.ST07a

				var_52_18.transform.localPosition = var_52_17
				var_52_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_19 = var_52_18:GetComponent("SpriteRenderer")

				if var_52_19 and var_52_19.sprite then
					local var_52_20 = (var_52_18.transform.localPosition - var_52_16).z
					local var_52_21 = manager.ui.mainCameraCom_
					local var_52_22 = 2 * var_52_20 * Mathf.Tan(var_52_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_23 = var_52_22 * var_52_21.aspect
					local var_52_24 = var_52_19.sprite.bounds.size.x
					local var_52_25 = var_52_19.sprite.bounds.size.y
					local var_52_26 = var_52_23 / var_52_24
					local var_52_27 = var_52_22 / var_52_25
					local var_52_28 = var_52_27 < var_52_26 and var_52_26 or var_52_27

					var_52_18.transform.localScale = Vector3.New(var_52_28, var_52_28, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "ST07a" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_29 = 0

			if var_52_29 < arg_49_1.time_ and arg_49_1.time_ <= var_52_29 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action445")
			end

			local var_52_30 = 0
			local var_52_31 = 0.1

			if var_52_30 < arg_49_1.time_ and arg_49_1.time_ <= var_52_30 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_32 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_32:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_33 = arg_49_1:GetWordFromCfg(100)
				local var_52_34 = arg_49_1:FormatText(var_52_33.content)

				arg_49_1.text_.text = var_52_34

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_35 = 4
				local var_52_36 = utf8.len(var_52_34)
				local var_52_37 = var_52_35 <= 0 and var_52_31 or var_52_31 * (var_52_36 / var_52_35)

				if var_52_37 > 0 and var_52_31 < var_52_37 then
					arg_49_1.talkMaxDuration = var_52_37
					var_52_30 = var_52_30 + 0.3

					if var_52_37 + var_52_30 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_37 + var_52_30
					end
				end

				arg_49_1.text_.text = var_52_34
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_38 = var_52_30 + 0.3
			local var_52_39 = math.max(var_52_31, arg_49_1.talkMaxDuration)

			if var_52_38 <= arg_49_1.time_ and arg_49_1.time_ < var_52_38 + var_52_39 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_38) / var_52_39

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_38 + var_52_39 and arg_49_1.time_ < var_52_38 + var_52_39 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play110 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 110
		arg_55_1.duration_ = 6.77

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play111(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1148ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story == nil then
				arg_55_1.var_.characterEffect1148ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 and not isNil(var_58_0) then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1148ui_story and not isNil(var_58_0) then
					arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and not isNil(var_58_0) and arg_55_1.var_.characterEffect1148ui_story then
				arg_55_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1084ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 and not isNil(var_58_4) then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1084ui_story and not isNil(var_58_4) then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and not isNil(var_58_4) and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_8 = arg_55_1.bgs_.ST07a.transform
			local var_58_9 = 0

			if var_58_9 < arg_55_1.time_ and arg_55_1.time_ <= var_58_9 + arg_58_0 then
				arg_55_1.var_.moveOldPosST07a = var_58_8.localPosition
			end

			local var_58_10 = 0.001

			if var_58_9 <= arg_55_1.time_ and arg_55_1.time_ < var_58_9 + var_58_10 then
				local var_58_11 = (arg_55_1.time_ - var_58_9) / var_58_10
				local var_58_12 = Vector3.New(0, -100, 10)

				var_58_8.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosST07a, var_58_12, var_58_11)
			end

			if arg_55_1.time_ >= var_58_9 + var_58_10 and arg_55_1.time_ < var_58_9 + var_58_10 + arg_58_0 then
				var_58_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_58_13 = "ST07b"

			if arg_55_1.bgs_[var_58_13] == nil then
				local var_58_14 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_13)
				var_58_14.name = var_58_13
				var_58_14.transform.parent = arg_55_1.stage_.transform
				var_58_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_13] = var_58_14
			end

			local var_58_15 = 0

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				local var_58_16 = manager.ui.mainCamera.transform.localPosition
				local var_58_17 = Vector3.New(0, 0, 10) + Vector3.New(var_58_16.x, var_58_16.y, 0)
				local var_58_18 = arg_55_1.bgs_.ST07b

				var_58_18.transform.localPosition = var_58_17
				var_58_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_58_19 = var_58_18:GetComponent("SpriteRenderer")

				if var_58_19 and var_58_19.sprite then
					local var_58_20 = (var_58_18.transform.localPosition - var_58_16).z
					local var_58_21 = manager.ui.mainCameraCom_
					local var_58_22 = 2 * var_58_20 * Mathf.Tan(var_58_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_58_23 = var_58_22 * var_58_21.aspect
					local var_58_24 = var_58_19.sprite.bounds.size.x
					local var_58_25 = var_58_19.sprite.bounds.size.y
					local var_58_26 = var_58_23 / var_58_24
					local var_58_27 = var_58_22 / var_58_25
					local var_58_28 = var_58_27 < var_58_26 and var_58_26 or var_58_27

					var_58_18.transform.localScale = Vector3.New(var_58_28, var_58_28, 0)
				end

				for iter_58_0, iter_58_1 in pairs(arg_55_1.bgs_) do
					if iter_58_0 ~= "ST07b" then
						iter_58_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_58_29 = 0

			if var_58_29 < arg_55_1.time_ and arg_55_1.time_ <= var_58_29 + arg_58_0 then
				arg_55_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action445")
			end

			local var_58_30 = 0
			local var_58_31 = 0.1

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_32 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_32:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(100)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 4
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37
					var_58_30 = var_58_30 + 0.3

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_38 = var_58_30 + 0.3
			local var_58_39 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_39 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_38) / var_58_39

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_38 + var_58_39 and arg_55_1.time_ < var_58_38 + var_58_39 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play111 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 111
		arg_61_1.duration_ = 7.33

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play112(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1148ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story == nil then
				arg_61_1.var_.characterEffect1148ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.1

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 and not isNil(var_64_0) then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1148ui_story and not isNil(var_64_0) then
					arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and not isNil(var_64_0) and arg_61_1.var_.characterEffect1148ui_story then
				arg_61_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_64_4 = arg_61_1.actors_["1084ui_story"]
			local var_64_5 = 0

			if var_64_5 < arg_61_1.time_ and arg_61_1.time_ <= var_64_5 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story == nil then
				arg_61_1.var_.characterEffect1084ui_story = var_64_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_6 = 0.1

			if var_64_5 <= arg_61_1.time_ and arg_61_1.time_ < var_64_5 + var_64_6 and not isNil(var_64_4) then
				local var_64_7 = (arg_61_1.time_ - var_64_5) / var_64_6

				if arg_61_1.var_.characterEffect1084ui_story and not isNil(var_64_4) then
					arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_61_1.time_ >= var_64_5 + var_64_6 and arg_61_1.time_ < var_64_5 + var_64_6 + arg_64_0 and not isNil(var_64_4) and arg_61_1.var_.characterEffect1084ui_story then
				arg_61_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_64_8 = arg_61_1.bgs_.ST07b.transform
			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 then
				arg_61_1.var_.moveOldPosST07b = var_64_8.localPosition
			end

			local var_64_10 = 0.001

			if var_64_9 <= arg_61_1.time_ and arg_61_1.time_ < var_64_9 + var_64_10 then
				local var_64_11 = (arg_61_1.time_ - var_64_9) / var_64_10
				local var_64_12 = Vector3.New(0, -100, 10)

				var_64_8.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPosST07b, var_64_12, var_64_11)
			end

			if arg_61_1.time_ >= var_64_9 + var_64_10 and arg_61_1.time_ < var_64_9 + var_64_10 + arg_64_0 then
				var_64_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_64_13 = "ST08"

			if arg_61_1.bgs_[var_64_13] == nil then
				local var_64_14 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_13)
				var_64_14.name = var_64_13
				var_64_14.transform.parent = arg_61_1.stage_.transform
				var_64_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_13] = var_64_14
			end

			local var_64_15 = 0

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				local var_64_16 = manager.ui.mainCamera.transform.localPosition
				local var_64_17 = Vector3.New(0, 0, 10) + Vector3.New(var_64_16.x, var_64_16.y, 0)
				local var_64_18 = arg_61_1.bgs_.ST08

				var_64_18.transform.localPosition = var_64_17
				var_64_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_19 = var_64_18:GetComponent("SpriteRenderer")

				if var_64_19 and var_64_19.sprite then
					local var_64_20 = (var_64_18.transform.localPosition - var_64_16).z
					local var_64_21 = manager.ui.mainCameraCom_
					local var_64_22 = 2 * var_64_20 * Mathf.Tan(var_64_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_23 = var_64_22 * var_64_21.aspect
					local var_64_24 = var_64_19.sprite.bounds.size.x
					local var_64_25 = var_64_19.sprite.bounds.size.y
					local var_64_26 = var_64_23 / var_64_24
					local var_64_27 = var_64_22 / var_64_25
					local var_64_28 = var_64_27 < var_64_26 and var_64_26 or var_64_27

					var_64_18.transform.localScale = Vector3.New(var_64_28, var_64_28, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "ST08" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_29 = 0

			if var_64_29 < arg_61_1.time_ and arg_61_1.time_ <= var_64_29 + arg_64_0 then
				arg_61_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action456")
			end

			local var_64_30 = 0
			local var_64_31 = 0.1

			if var_64_30 < arg_61_1.time_ and arg_61_1.time_ <= var_64_30 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_32 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_32:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_33 = arg_61_1:GetWordFromCfg(100)
				local var_64_34 = arg_61_1:FormatText(var_64_33.content)

				arg_61_1.text_.text = var_64_34

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_35 = 4
				local var_64_36 = utf8.len(var_64_34)
				local var_64_37 = var_64_35 <= 0 and var_64_31 or var_64_31 * (var_64_36 / var_64_35)

				if var_64_37 > 0 and var_64_31 < var_64_37 then
					arg_61_1.talkMaxDuration = var_64_37
					var_64_30 = var_64_30 + 0.3

					if var_64_37 + var_64_30 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_37 + var_64_30
					end
				end

				arg_61_1.text_.text = var_64_34
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_38 = var_64_30 + 0.3
			local var_64_39 = math.max(var_64_31, arg_61_1.talkMaxDuration)

			if var_64_38 <= arg_61_1.time_ and arg_61_1.time_ < var_64_38 + var_64_39 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_38) / var_64_39

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_38 + var_64_39 and arg_61_1.time_ < var_64_38 + var_64_39 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play112 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 112
		arg_67_1.duration_ = 6.93

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
			arg_67_1.auto_ = false
		end

		function arg_67_1.playNext_(arg_69_0)
			arg_67_1.onStoryFinished_()
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1148ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story == nil then
				arg_67_1.var_.characterEffect1148ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 and not isNil(var_70_0) then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1148ui_story and not isNil(var_70_0) then
					arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and not isNil(var_70_0) and arg_67_1.var_.characterEffect1148ui_story then
				arg_67_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1084ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story == nil then
				arg_67_1.var_.characterEffect1084ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 and not isNil(var_70_4) then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1084ui_story and not isNil(var_70_4) then
					arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and not isNil(var_70_4) and arg_67_1.var_.characterEffect1084ui_story then
				arg_67_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_70_8 = arg_67_1.bgs_.ST08.transform
			local var_70_9 = 0

			if var_70_9 < arg_67_1.time_ and arg_67_1.time_ <= var_70_9 + arg_70_0 then
				arg_67_1.var_.moveOldPosST08 = var_70_8.localPosition
			end

			local var_70_10 = 0.001

			if var_70_9 <= arg_67_1.time_ and arg_67_1.time_ < var_70_9 + var_70_10 then
				local var_70_11 = (arg_67_1.time_ - var_70_9) / var_70_10
				local var_70_12 = Vector3.New(0, -100, 10)

				var_70_8.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPosST08, var_70_12, var_70_11)
			end

			if arg_67_1.time_ >= var_70_9 + var_70_10 and arg_67_1.time_ < var_70_9 + var_70_10 + arg_70_0 then
				var_70_8.localPosition = Vector3.New(0, -100, 10)
			end

			local var_70_13 = "ST12"

			if arg_67_1.bgs_[var_70_13] == nil then
				local var_70_14 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_13)
				var_70_14.name = var_70_13
				var_70_14.transform.parent = arg_67_1.stage_.transform
				var_70_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_13] = var_70_14
			end

			local var_70_15 = 0

			if var_70_15 < arg_67_1.time_ and arg_67_1.time_ <= var_70_15 + arg_70_0 then
				local var_70_16 = manager.ui.mainCamera.transform.localPosition
				local var_70_17 = Vector3.New(0, 0, 10) + Vector3.New(var_70_16.x, var_70_16.y, 0)
				local var_70_18 = arg_67_1.bgs_.ST12

				var_70_18.transform.localPosition = var_70_17
				var_70_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_19 = var_70_18:GetComponent("SpriteRenderer")

				if var_70_19 and var_70_19.sprite then
					local var_70_20 = (var_70_18.transform.localPosition - var_70_16).z
					local var_70_21 = manager.ui.mainCameraCom_
					local var_70_22 = 2 * var_70_20 * Mathf.Tan(var_70_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_23 = var_70_22 * var_70_21.aspect
					local var_70_24 = var_70_19.sprite.bounds.size.x
					local var_70_25 = var_70_19.sprite.bounds.size.y
					local var_70_26 = var_70_23 / var_70_24
					local var_70_27 = var_70_22 / var_70_25
					local var_70_28 = var_70_27 < var_70_26 and var_70_26 or var_70_27

					var_70_18.transform.localScale = Vector3.New(var_70_28, var_70_28, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST12" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_29 = 0

			if var_70_29 < arg_67_1.time_ and arg_67_1.time_ <= var_70_29 + arg_70_0 then
				arg_67_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148actionlink/1148action456")
			end

			local var_70_30 = 0
			local var_70_31 = 0.1

			if var_70_30 < arg_67_1.time_ and arg_67_1.time_ <= var_70_30 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_32 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_32:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_33 = arg_67_1:GetWordFromCfg(100)
				local var_70_34 = arg_67_1:FormatText(var_70_33.content)

				arg_67_1.text_.text = var_70_34

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_35 = 4
				local var_70_36 = utf8.len(var_70_34)
				local var_70_37 = var_70_35 <= 0 and var_70_31 or var_70_31 * (var_70_36 / var_70_35)

				if var_70_37 > 0 and var_70_31 < var_70_37 then
					arg_67_1.talkMaxDuration = var_70_37
					var_70_30 = var_70_30 + 0.3

					if var_70_37 + var_70_30 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_37 + var_70_30
					end
				end

				arg_67_1.text_.text = var_70_34
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_38 = var_70_30 + 0.3
			local var_70_39 = math.max(var_70_31, arg_67_1.talkMaxDuration)

			if var_70_38 <= arg_67_1.time_ and arg_67_1.time_ < var_70_38 + var_70_39 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_38) / var_70_39

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_38 + var_70_39 and arg_67_1.time_ < var_70_38 + var_70_39 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST05a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST06b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST08",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12"
	},
	voices = {
		"story_v_out_100011.awb"
	}
}
