return {
	Play103031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103031001
		arg_1_1.duration_ = 11.333

		local var_1_0 = {
			ja = 11.333,
			ko = 6.766,
			zh = 8.933,
			en = 10.6
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
				arg_1_0:Play103031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 1

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1", "bgm_story_v1_battleground_1")
			end

			local var_4_4 = 0
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "effect"

				arg_1_1:AudioAction(var_4_6, var_4_7, "se_story_v1_environment_factory", "se_story_v1_environment_factory", "se_story_v1_environment_factory")
			end

			local var_4_8 = "4010ui_story"

			if arg_1_1.actors_[var_4_8] == nil then
				local var_4_9 = Object.Instantiate(Asset.Load("Char/" .. var_4_8), arg_1_1.stage_.transform)

				var_4_9.name = var_4_8
				var_4_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_8] = var_4_9

				local var_4_10 = var_4_9:GetComponentInChildren(typeof(CharacterEffect))

				var_4_10.enabled = true

				local var_4_11 = GameObjectTools.GetOrAddComponent(var_4_9, typeof(DynamicBoneHelper))

				if var_4_11 then
					var_4_11:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_10.transform, false)

				arg_1_1.var_[var_4_8 .. "Animator"] = var_4_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_8 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_8 .. "LipSync"] = var_4_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_12 = arg_1_1.actors_["4010ui_story"]
			local var_4_13 = 1.8

			if var_4_13 < arg_1_1.time_ and arg_1_1.time_ <= var_4_13 + arg_4_0 and arg_1_1.var_.characterEffect4010ui_story == nil then
				arg_1_1.var_.characterEffect4010ui_story = var_4_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_14 = 0.1

			if var_4_13 <= arg_1_1.time_ and arg_1_1.time_ < var_4_13 + var_4_14 then
				local var_4_15 = (arg_1_1.time_ - var_4_13) / var_4_14

				if arg_1_1.var_.characterEffect4010ui_story then
					arg_1_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_13 + var_4_14 and arg_1_1.time_ < var_4_13 + var_4_14 + arg_4_0 and arg_1_1.var_.characterEffect4010ui_story then
				arg_1_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_17 = 2

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_17 then
				local var_4_18 = (arg_1_1.time_ - var_4_16) / var_4_17
				local var_4_19 = Color.New(0, 0, 0)

				var_4_19.a = Mathf.Lerp(1, 0, var_4_18)
				arg_1_1.mask_.color = var_4_19
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				local var_4_20 = Color.New(0, 0, 0)
				local var_4_21 = 0

				arg_1_1.mask_.enabled = false
				var_4_20.a = var_4_21
				arg_1_1.mask_.color = var_4_20
			end

			local var_4_22 = "B08b"

			if arg_1_1.bgs_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_23:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_22)
				var_4_23.name = var_4_22
				var_4_23.transform.parent = arg_1_1.stage_.transform
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_22] = var_4_23
			end

			local var_4_24 = 0

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_25 = manager.ui.mainCamera.transform.localPosition
				local var_4_26 = Vector3.New(0, 0, 10) + Vector3.New(var_4_25.x, var_4_25.y, 0)
				local var_4_27 = arg_1_1.bgs_.B08b

				var_4_27.transform.localPosition = var_4_26
				var_4_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_28 = var_4_27:GetComponent("SpriteRenderer")

				if var_4_28 and var_4_28.sprite then
					local var_4_29 = (var_4_27.transform.localPosition - var_4_25).z
					local var_4_30 = manager.ui.mainCameraCom_
					local var_4_31 = 2 * var_4_29 * Mathf.Tan(var_4_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_32 = var_4_31 * var_4_30.aspect
					local var_4_33 = var_4_28.sprite.bounds.size.x
					local var_4_34 = var_4_28.sprite.bounds.size.y
					local var_4_35 = var_4_32 / var_4_33
					local var_4_36 = var_4_31 / var_4_34
					local var_4_37 = var_4_36 < var_4_35 and var_4_35 or var_4_36

					var_4_27.transform.localScale = Vector3.New(var_4_37, var_4_37, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B08b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_38 = arg_1_1.actors_["4010ui_story"].transform
			local var_4_39 = 1.79999995231628

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1.var_.moveOldPos4010ui_story = var_4_38.localPosition
			end

			local var_4_40 = 0.001

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_39) / var_4_40
				local var_4_42 = Vector3.New(0, -1.59, -5.2)

				var_4_38.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos4010ui_story, var_4_42, var_4_41)

				local var_4_43 = manager.ui.mainCamera.transform.position - var_4_38.position

				var_4_38.forward = Vector3.New(var_4_43.x, var_4_43.y, var_4_43.z)

				local var_4_44 = var_4_38.localEulerAngles

				var_4_44.z = 0
				var_4_44.x = 0
				var_4_38.localEulerAngles = var_4_44
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				var_4_38.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_4_45 = manager.ui.mainCamera.transform.position - var_4_38.position

				var_4_38.forward = Vector3.New(var_4_45.x, var_4_45.y, var_4_45.z)

				local var_4_46 = var_4_38.localEulerAngles

				var_4_46.z = 0
				var_4_46.x = 0
				var_4_38.localEulerAngles = var_4_46
			end

			local var_4_47 = 1.8

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_4_48 = 1.8

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.7

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[42].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(103031001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 28
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_50 or var_4_50 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_50 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_49 = var_4_49 + 0.3

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031001", "story_v_out_103031.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_103031", "103031001", "story_v_out_103031.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_103031", "103031001", "story_v_out_103031.awb")

						arg_1_1:RecordAudio("103031001", var_4_59)
						arg_1_1:RecordAudio("103031001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_103031", "103031001", "story_v_out_103031.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_103031", "103031001", "story_v_out_103031.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_60 = var_4_49 + 0.3
			local var_4_61 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_61 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_60) / var_4_61

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_60 + var_4_61 and arg_1_1.time_ < var_4_60 + var_4_61 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103031002
		arg_7_1.duration_ = 1.999999999999

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play103031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1011ui_story"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("Char/" .. var_10_0), arg_7_1.stage_.transform)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_0] = var_10_1

				local var_10_2 = var_10_1:GetComponentInChildren(typeof(CharacterEffect))

				var_10_2.enabled = true

				local var_10_3 = GameObjectTools.GetOrAddComponent(var_10_1, typeof(DynamicBoneHelper))

				if var_10_3 then
					var_10_3:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_2.transform, false)

				arg_7_1.var_[var_10_0 .. "Animator"] = var_10_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_0 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_0 .. "LipSync"] = var_10_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_4 = arg_7_1.actors_["1011ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1011ui_story == nil then
				arg_7_1.var_.characterEffect1011ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1011ui_story then
					arg_7_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1011ui_story then
				arg_7_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_10_8 = "1019ui_story"

			if arg_7_1.actors_[var_10_8] == nil then
				local var_10_9 = Object.Instantiate(Asset.Load("Char/" .. var_10_8), arg_7_1.stage_.transform)

				var_10_9.name = var_10_8
				var_10_9.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_8] = var_10_9

				local var_10_10 = var_10_9:GetComponentInChildren(typeof(CharacterEffect))

				var_10_10.enabled = true

				local var_10_11 = GameObjectTools.GetOrAddComponent(var_10_9, typeof(DynamicBoneHelper))

				if var_10_11 then
					var_10_11:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_10.transform, false)

				arg_7_1.var_[var_10_8 .. "Animator"] = var_10_10.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_8 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_8 .. "LipSync"] = var_10_10.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_12 = arg_7_1.actors_["1019ui_story"]
			local var_10_13 = 0

			if var_10_13 < arg_7_1.time_ and arg_7_1.time_ <= var_10_13 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story == nil then
				arg_7_1.var_.characterEffect1019ui_story = var_10_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_14 = 0.1

			if var_10_13 <= arg_7_1.time_ and arg_7_1.time_ < var_10_13 + var_10_14 then
				local var_10_15 = (arg_7_1.time_ - var_10_13) / var_10_14

				if arg_7_1.var_.characterEffect1019ui_story then
					arg_7_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_13 + var_10_14 and arg_7_1.time_ < var_10_13 + var_10_14 + arg_10_0 and arg_7_1.var_.characterEffect1019ui_story then
				arg_7_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_10_16 = "1084ui_story"

			if arg_7_1.actors_[var_10_16] == nil then
				local var_10_17 = Object.Instantiate(Asset.Load("Char/" .. var_10_16), arg_7_1.stage_.transform)

				var_10_17.name = var_10_16
				var_10_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_7_1.actors_[var_10_16] = var_10_17

				local var_10_18 = var_10_17:GetComponentInChildren(typeof(CharacterEffect))

				var_10_18.enabled = true

				local var_10_19 = GameObjectTools.GetOrAddComponent(var_10_17, typeof(DynamicBoneHelper))

				if var_10_19 then
					var_10_19:EnableDynamicBone(false)
				end

				arg_7_1:ShowWeapon(var_10_18.transform, false)

				arg_7_1.var_[var_10_16 .. "Animator"] = var_10_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_7_1.var_[var_10_16 .. "Animator"].applyRootMotion = true
				arg_7_1.var_[var_10_16 .. "LipSync"] = var_10_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_10_20 = arg_7_1.actors_["1084ui_story"]
			local var_10_21 = 0

			if var_10_21 < arg_7_1.time_ and arg_7_1.time_ <= var_10_21 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_22 = 0.1

			if var_10_21 <= arg_7_1.time_ and arg_7_1.time_ < var_10_21 + var_10_22 then
				local var_10_23 = (arg_7_1.time_ - var_10_21) / var_10_22

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_21 + var_10_22 and arg_7_1.time_ < var_10_21 + var_10_22 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_24 = arg_7_1.actors_["4010ui_story"]
			local var_10_25 = 0

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 and arg_7_1.var_.characterEffect4010ui_story == nil then
				arg_7_1.var_.characterEffect4010ui_story = var_10_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_26 = 0.1

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_26 then
				local var_10_27 = (arg_7_1.time_ - var_10_25) / var_10_26

				if arg_7_1.var_.characterEffect4010ui_story then
					local var_10_28 = Mathf.Lerp(0, 0.5, var_10_27)

					arg_7_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_7_1.var_.characterEffect4010ui_story.fillRatio = var_10_28
				end
			end

			if arg_7_1.time_ >= var_10_25 + var_10_26 and arg_7_1.time_ < var_10_25 + var_10_26 + arg_10_0 and arg_7_1.var_.characterEffect4010ui_story then
				local var_10_29 = 0.5

				arg_7_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_7_1.var_.characterEffect4010ui_story.fillRatio = var_10_29
			end

			local var_10_30 = arg_7_1.actors_["4010ui_story"].transform
			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 then
				arg_7_1.var_.moveOldPos4010ui_story = var_10_30.localPosition
			end

			local var_10_32 = 0.001

			if var_10_31 <= arg_7_1.time_ and arg_7_1.time_ < var_10_31 + var_10_32 then
				local var_10_33 = (arg_7_1.time_ - var_10_31) / var_10_32
				local var_10_34 = Vector3.New(0, 100, 0)

				var_10_30.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos4010ui_story, var_10_34, var_10_33)

				local var_10_35 = manager.ui.mainCamera.transform.position - var_10_30.position

				var_10_30.forward = Vector3.New(var_10_35.x, var_10_35.y, var_10_35.z)

				local var_10_36 = var_10_30.localEulerAngles

				var_10_36.z = 0
				var_10_36.x = 0
				var_10_30.localEulerAngles = var_10_36
			end

			if arg_7_1.time_ >= var_10_31 + var_10_32 and arg_7_1.time_ < var_10_31 + var_10_32 + arg_10_0 then
				var_10_30.localPosition = Vector3.New(0, 100, 0)

				local var_10_37 = manager.ui.mainCamera.transform.position - var_10_30.position

				var_10_30.forward = Vector3.New(var_10_37.x, var_10_37.y, var_10_37.z)

				local var_10_38 = var_10_30.localEulerAngles

				var_10_38.z = 0
				var_10_38.x = 0
				var_10_30.localEulerAngles = var_10_38
			end

			local var_10_39 = 0

			if var_10_39 < arg_7_1.time_ and arg_7_1.time_ <= var_10_39 + arg_10_0 then
				arg_7_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_10_40 = arg_7_1.actors_["1011ui_story"].transform
			local var_10_41 = 0

			if var_10_41 < arg_7_1.time_ and arg_7_1.time_ <= var_10_41 + arg_10_0 then
				arg_7_1.var_.moveOldPos1011ui_story = var_10_40.localPosition
			end

			local var_10_42 = 0.001

			if var_10_41 <= arg_7_1.time_ and arg_7_1.time_ < var_10_41 + var_10_42 then
				local var_10_43 = (arg_7_1.time_ - var_10_41) / var_10_42
				local var_10_44 = Vector3.New(-0.7, -0.71, -6)

				var_10_40.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1011ui_story, var_10_44, var_10_43)

				local var_10_45 = manager.ui.mainCamera.transform.position - var_10_40.position

				var_10_40.forward = Vector3.New(var_10_45.x, var_10_45.y, var_10_45.z)

				local var_10_46 = var_10_40.localEulerAngles

				var_10_46.z = 0
				var_10_46.x = 0
				var_10_40.localEulerAngles = var_10_46
			end

			if arg_7_1.time_ >= var_10_41 + var_10_42 and arg_7_1.time_ < var_10_41 + var_10_42 + arg_10_0 then
				var_10_40.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_10_47 = manager.ui.mainCamera.transform.position - var_10_40.position

				var_10_40.forward = Vector3.New(var_10_47.x, var_10_47.y, var_10_47.z)

				local var_10_48 = var_10_40.localEulerAngles

				var_10_48.z = 0
				var_10_48.x = 0
				var_10_40.localEulerAngles = var_10_48
			end

			local var_10_49 = 0

			if var_10_49 < arg_7_1.time_ and arg_7_1.time_ <= var_10_49 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_10_50 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_51 = 0

			if var_10_51 < arg_7_1.time_ and arg_7_1.time_ <= var_10_51 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_50.localPosition
			end

			local var_10_52 = 0.001

			if var_10_51 <= arg_7_1.time_ and arg_7_1.time_ < var_10_51 + var_10_52 then
				local var_10_53 = (arg_7_1.time_ - var_10_51) / var_10_52
				local var_10_54 = Vector3.New(0, -0.97, -6)

				var_10_50.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_54, var_10_53)

				local var_10_55 = manager.ui.mainCamera.transform.position - var_10_50.position

				var_10_50.forward = Vector3.New(var_10_55.x, var_10_55.y, var_10_55.z)

				local var_10_56 = var_10_50.localEulerAngles

				var_10_56.z = 0
				var_10_56.x = 0
				var_10_50.localEulerAngles = var_10_56
			end

			if arg_7_1.time_ >= var_10_51 + var_10_52 and arg_7_1.time_ < var_10_51 + var_10_52 + arg_10_0 then
				var_10_50.localPosition = Vector3.New(0, -0.97, -6)

				local var_10_57 = manager.ui.mainCamera.transform.position - var_10_50.position

				var_10_50.forward = Vector3.New(var_10_57.x, var_10_57.y, var_10_57.z)

				local var_10_58 = var_10_50.localEulerAngles

				var_10_58.z = 0
				var_10_58.x = 0
				var_10_50.localEulerAngles = var_10_58
			end

			local var_10_59 = 0

			if var_10_59 < arg_7_1.time_ and arg_7_1.time_ <= var_10_59 + arg_10_0 then
				arg_7_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_10_60 = arg_7_1.actors_["1019ui_story"].transform
			local var_10_61 = 0

			if var_10_61 < arg_7_1.time_ and arg_7_1.time_ <= var_10_61 + arg_10_0 then
				arg_7_1.var_.moveOldPos1019ui_story = var_10_60.localPosition
			end

			local var_10_62 = 0.001

			if var_10_61 <= arg_7_1.time_ and arg_7_1.time_ < var_10_61 + var_10_62 then
				local var_10_63 = (arg_7_1.time_ - var_10_61) / var_10_62
				local var_10_64 = Vector3.New(0.7, -1.08, -5.9)

				var_10_60.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1019ui_story, var_10_64, var_10_63)

				local var_10_65 = manager.ui.mainCamera.transform.position - var_10_60.position

				var_10_60.forward = Vector3.New(var_10_65.x, var_10_65.y, var_10_65.z)

				local var_10_66 = var_10_60.localEulerAngles

				var_10_66.z = 0
				var_10_66.x = 0
				var_10_60.localEulerAngles = var_10_66
			end

			if arg_7_1.time_ >= var_10_61 + var_10_62 and arg_7_1.time_ < var_10_61 + var_10_62 + arg_10_0 then
				var_10_60.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_10_67 = manager.ui.mainCamera.transform.position - var_10_60.position

				var_10_60.forward = Vector3.New(var_10_67.x, var_10_67.y, var_10_67.z)

				local var_10_68 = var_10_60.localEulerAngles

				var_10_68.z = 0
				var_10_68.x = 0
				var_10_60.localEulerAngles = var_10_68
			end

			local var_10_69 = 0

			if var_10_69 < arg_7_1.time_ and arg_7_1.time_ <= var_10_69 + arg_10_0 then
				arg_7_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_10_70 = 0
			local var_10_71 = 0.05

			if var_10_70 < arg_7_1.time_ and arg_7_1.time_ <= var_10_70 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_72 = arg_7_1:FormatText(StoryNameCfg[50].name)

				arg_7_1.leftNameTxt_.text = var_10_72

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_73 = arg_7_1:GetWordFromCfg(103031002)
				local var_10_74 = arg_7_1:FormatText(var_10_73.content)

				arg_7_1.text_.text = var_10_74

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_75 = 2
				local var_10_76 = utf8.len(var_10_74)
				local var_10_77 = var_10_75 <= 0 and var_10_71 or var_10_71 * (var_10_76 / var_10_75)

				if var_10_77 > 0 and var_10_71 < var_10_77 then
					arg_7_1.talkMaxDuration = var_10_77

					if var_10_77 + var_10_70 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_77 + var_10_70
					end
				end

				arg_7_1.text_.text = var_10_74
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031002", "story_v_out_103031.awb") ~= 0 then
					local var_10_78 = manager.audio:GetVoiceLength("story_v_out_103031", "103031002", "story_v_out_103031.awb") / 1000

					if var_10_78 + var_10_70 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_78 + var_10_70
					end

					if var_10_73.prefab_name ~= "" and arg_7_1.actors_[var_10_73.prefab_name] ~= nil then
						local var_10_79 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_73.prefab_name].transform, "story_v_out_103031", "103031002", "story_v_out_103031.awb")

						arg_7_1:RecordAudio("103031002", var_10_79)
						arg_7_1:RecordAudio("103031002", var_10_79)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_103031", "103031002", "story_v_out_103031.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_103031", "103031002", "story_v_out_103031.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_80 = math.max(var_10_71, arg_7_1.talkMaxDuration)

			if var_10_70 <= arg_7_1.time_ and arg_7_1.time_ < var_10_70 + var_10_80 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_70) / var_10_80

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_70 + var_10_80 and arg_7_1.time_ < var_10_70 + var_10_80 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play103031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103031003
		arg_11_1.duration_ = 5.7

		local var_11_0 = {
			ja = 5.1,
			ko = 3.8,
			zh = 5.7,
			en = 5.3
		}
		local var_11_1 = manager.audio:GetLocalizationFlag()

		if var_11_0[var_11_1] ~= nil then
			arg_11_1.duration_ = var_11_0[var_11_1]
		end

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play103031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["4010ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect4010ui_story == nil then
				arg_11_1.var_.characterEffect4010ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect4010ui_story then
					arg_11_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect4010ui_story then
				arg_11_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_14_4 = arg_11_1.actors_["1011ui_story"].transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.var_.moveOldPos1011ui_story = var_14_4.localPosition
			end

			local var_14_6 = 0.001

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_6 then
				local var_14_7 = (arg_11_1.time_ - var_14_5) / var_14_6
				local var_14_8 = Vector3.New(0, 100, 0)

				var_14_4.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1011ui_story, var_14_8, var_14_7)

				local var_14_9 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_9.x, var_14_9.y, var_14_9.z)

				local var_14_10 = var_14_4.localEulerAngles

				var_14_10.z = 0
				var_14_10.x = 0
				var_14_4.localEulerAngles = var_14_10
			end

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				var_14_4.localPosition = Vector3.New(0, 100, 0)

				local var_14_11 = manager.ui.mainCamera.transform.position - var_14_4.position

				var_14_4.forward = Vector3.New(var_14_11.x, var_14_11.y, var_14_11.z)

				local var_14_12 = var_14_4.localEulerAngles

				var_14_12.z = 0
				var_14_12.x = 0
				var_14_4.localEulerAngles = var_14_12
			end

			local var_14_13 = arg_11_1.actors_["1084ui_story"].transform
			local var_14_14 = 0

			if var_14_14 < arg_11_1.time_ and arg_11_1.time_ <= var_14_14 + arg_14_0 then
				arg_11_1.var_.moveOldPos1084ui_story = var_14_13.localPosition
			end

			local var_14_15 = 0.001

			if var_14_14 <= arg_11_1.time_ and arg_11_1.time_ < var_14_14 + var_14_15 then
				local var_14_16 = (arg_11_1.time_ - var_14_14) / var_14_15
				local var_14_17 = Vector3.New(0, 100, 0)

				var_14_13.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1084ui_story, var_14_17, var_14_16)

				local var_14_18 = manager.ui.mainCamera.transform.position - var_14_13.position

				var_14_13.forward = Vector3.New(var_14_18.x, var_14_18.y, var_14_18.z)

				local var_14_19 = var_14_13.localEulerAngles

				var_14_19.z = 0
				var_14_19.x = 0
				var_14_13.localEulerAngles = var_14_19
			end

			if arg_11_1.time_ >= var_14_14 + var_14_15 and arg_11_1.time_ < var_14_14 + var_14_15 + arg_14_0 then
				var_14_13.localPosition = Vector3.New(0, 100, 0)

				local var_14_20 = manager.ui.mainCamera.transform.position - var_14_13.position

				var_14_13.forward = Vector3.New(var_14_20.x, var_14_20.y, var_14_20.z)

				local var_14_21 = var_14_13.localEulerAngles

				var_14_21.z = 0
				var_14_21.x = 0
				var_14_13.localEulerAngles = var_14_21
			end

			local var_14_22 = arg_11_1.actors_["1019ui_story"].transform
			local var_14_23 = 0

			if var_14_23 < arg_11_1.time_ and arg_11_1.time_ <= var_14_23 + arg_14_0 then
				arg_11_1.var_.moveOldPos1019ui_story = var_14_22.localPosition
			end

			local var_14_24 = 0.001

			if var_14_23 <= arg_11_1.time_ and arg_11_1.time_ < var_14_23 + var_14_24 then
				local var_14_25 = (arg_11_1.time_ - var_14_23) / var_14_24
				local var_14_26 = Vector3.New(0, 100, 0)

				var_14_22.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1019ui_story, var_14_26, var_14_25)

				local var_14_27 = manager.ui.mainCamera.transform.position - var_14_22.position

				var_14_22.forward = Vector3.New(var_14_27.x, var_14_27.y, var_14_27.z)

				local var_14_28 = var_14_22.localEulerAngles

				var_14_28.z = 0
				var_14_28.x = 0
				var_14_22.localEulerAngles = var_14_28
			end

			if arg_11_1.time_ >= var_14_23 + var_14_24 and arg_11_1.time_ < var_14_23 + var_14_24 + arg_14_0 then
				var_14_22.localPosition = Vector3.New(0, 100, 0)

				local var_14_29 = manager.ui.mainCamera.transform.position - var_14_22.position

				var_14_22.forward = Vector3.New(var_14_29.x, var_14_29.y, var_14_29.z)

				local var_14_30 = var_14_22.localEulerAngles

				var_14_30.z = 0
				var_14_30.x = 0
				var_14_22.localEulerAngles = var_14_30
			end

			local var_14_31 = arg_11_1.actors_["4010ui_story"].transform
			local var_14_32 = 0

			if var_14_32 < arg_11_1.time_ and arg_11_1.time_ <= var_14_32 + arg_14_0 then
				arg_11_1.var_.moveOldPos4010ui_story = var_14_31.localPosition
			end

			local var_14_33 = 0.001

			if var_14_32 <= arg_11_1.time_ and arg_11_1.time_ < var_14_32 + var_14_33 then
				local var_14_34 = (arg_11_1.time_ - var_14_32) / var_14_33
				local var_14_35 = Vector3.New(0, -1.59, -5.2)

				var_14_31.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos4010ui_story, var_14_35, var_14_34)

				local var_14_36 = manager.ui.mainCamera.transform.position - var_14_31.position

				var_14_31.forward = Vector3.New(var_14_36.x, var_14_36.y, var_14_36.z)

				local var_14_37 = var_14_31.localEulerAngles

				var_14_37.z = 0
				var_14_37.x = 0
				var_14_31.localEulerAngles = var_14_37
			end

			if arg_11_1.time_ >= var_14_32 + var_14_33 and arg_11_1.time_ < var_14_32 + var_14_33 + arg_14_0 then
				var_14_31.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_14_38 = manager.ui.mainCamera.transform.position - var_14_31.position

				var_14_31.forward = Vector3.New(var_14_38.x, var_14_38.y, var_14_38.z)

				local var_14_39 = var_14_31.localEulerAngles

				var_14_39.z = 0
				var_14_39.x = 0
				var_14_31.localEulerAngles = var_14_39
			end

			local var_14_40 = 0

			if var_14_40 < arg_11_1.time_ and arg_11_1.time_ <= var_14_40 + arg_14_0 then
				arg_11_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_14_41 = 0

			if var_14_41 < arg_11_1.time_ and arg_11_1.time_ <= var_14_41 + arg_14_0 then
				arg_11_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_14_42 = 0
			local var_14_43 = 0.65

			if var_14_42 < arg_11_1.time_ and arg_11_1.time_ <= var_14_42 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_44 = arg_11_1:FormatText(StoryNameCfg[42].name)

				arg_11_1.leftNameTxt_.text = var_14_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_45 = arg_11_1:GetWordFromCfg(103031003)
				local var_14_46 = arg_11_1:FormatText(var_14_45.content)

				arg_11_1.text_.text = var_14_46

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_47 = 25
				local var_14_48 = utf8.len(var_14_46)
				local var_14_49 = var_14_47 <= 0 and var_14_43 or var_14_43 * (var_14_48 / var_14_47)

				if var_14_49 > 0 and var_14_43 < var_14_49 then
					arg_11_1.talkMaxDuration = var_14_49

					if var_14_49 + var_14_42 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_49 + var_14_42
					end
				end

				arg_11_1.text_.text = var_14_46
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031003", "story_v_out_103031.awb") ~= 0 then
					local var_14_50 = manager.audio:GetVoiceLength("story_v_out_103031", "103031003", "story_v_out_103031.awb") / 1000

					if var_14_50 + var_14_42 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_50 + var_14_42
					end

					if var_14_45.prefab_name ~= "" and arg_11_1.actors_[var_14_45.prefab_name] ~= nil then
						local var_14_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_45.prefab_name].transform, "story_v_out_103031", "103031003", "story_v_out_103031.awb")

						arg_11_1:RecordAudio("103031003", var_14_51)
						arg_11_1:RecordAudio("103031003", var_14_51)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_103031", "103031003", "story_v_out_103031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_103031", "103031003", "story_v_out_103031.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_52 = math.max(var_14_43, arg_11_1.talkMaxDuration)

			if var_14_42 <= arg_11_1.time_ and arg_11_1.time_ < var_14_42 + var_14_52 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_42) / var_14_52

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_42 + var_14_52 and arg_11_1.time_ < var_14_42 + var_14_52 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play103031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103031004
		arg_15_1.duration_ = 4.6

		local var_15_0 = {
			ja = 4.266,
			ko = 4.033,
			zh = 4.6,
			en = 3.533
		}
		local var_15_1 = manager.audio:GetLocalizationFlag()

		if var_15_0[var_15_1] ~= nil then
			arg_15_1.duration_ = var_15_0[var_15_1]
		end

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play103031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1011ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story == nil then
				arg_15_1.var_.characterEffect1011ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.1

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1011ui_story then
					arg_15_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1011ui_story then
				arg_15_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_18_4 = arg_15_1.actors_["4010ui_story"]
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 and arg_15_1.var_.characterEffect4010ui_story == nil then
				arg_15_1.var_.characterEffect4010ui_story = var_18_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_6 = 0.1

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6

				if arg_15_1.var_.characterEffect4010ui_story then
					local var_18_8 = Mathf.Lerp(0, 0.5, var_18_7)

					arg_15_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_15_1.var_.characterEffect4010ui_story.fillRatio = var_18_8
				end
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 and arg_15_1.var_.characterEffect4010ui_story then
				local var_18_9 = 0.5

				arg_15_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_15_1.var_.characterEffect4010ui_story.fillRatio = var_18_9
			end

			local var_18_10 = arg_15_1.actors_["4010ui_story"].transform
			local var_18_11 = 0

			if var_18_11 < arg_15_1.time_ and arg_15_1.time_ <= var_18_11 + arg_18_0 then
				arg_15_1.var_.moveOldPos4010ui_story = var_18_10.localPosition
			end

			local var_18_12 = 0.001

			if var_18_11 <= arg_15_1.time_ and arg_15_1.time_ < var_18_11 + var_18_12 then
				local var_18_13 = (arg_15_1.time_ - var_18_11) / var_18_12
				local var_18_14 = Vector3.New(0, 100, 0)

				var_18_10.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos4010ui_story, var_18_14, var_18_13)

				local var_18_15 = manager.ui.mainCamera.transform.position - var_18_10.position

				var_18_10.forward = Vector3.New(var_18_15.x, var_18_15.y, var_18_15.z)

				local var_18_16 = var_18_10.localEulerAngles

				var_18_16.z = 0
				var_18_16.x = 0
				var_18_10.localEulerAngles = var_18_16
			end

			if arg_15_1.time_ >= var_18_11 + var_18_12 and arg_15_1.time_ < var_18_11 + var_18_12 + arg_18_0 then
				var_18_10.localPosition = Vector3.New(0, 100, 0)

				local var_18_17 = manager.ui.mainCamera.transform.position - var_18_10.position

				var_18_10.forward = Vector3.New(var_18_17.x, var_18_17.y, var_18_17.z)

				local var_18_18 = var_18_10.localEulerAngles

				var_18_18.z = 0
				var_18_18.x = 0
				var_18_10.localEulerAngles = var_18_18
			end

			local var_18_19 = arg_15_1.actors_["1011ui_story"].transform
			local var_18_20 = 0

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.var_.moveOldPos1011ui_story = var_18_19.localPosition
			end

			local var_18_21 = 0.001

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_21 then
				local var_18_22 = (arg_15_1.time_ - var_18_20) / var_18_21
				local var_18_23 = Vector3.New(-0.7, -0.71, -6)

				var_18_19.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1011ui_story, var_18_23, var_18_22)

				local var_18_24 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_24.x, var_18_24.y, var_18_24.z)

				local var_18_25 = var_18_19.localEulerAngles

				var_18_25.z = 0
				var_18_25.x = 0
				var_18_19.localEulerAngles = var_18_25
			end

			if arg_15_1.time_ >= var_18_20 + var_18_21 and arg_15_1.time_ < var_18_20 + var_18_21 + arg_18_0 then
				var_18_19.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_18_26 = manager.ui.mainCamera.transform.position - var_18_19.position

				var_18_19.forward = Vector3.New(var_18_26.x, var_18_26.y, var_18_26.z)

				local var_18_27 = var_18_19.localEulerAngles

				var_18_27.z = 0
				var_18_27.x = 0
				var_18_19.localEulerAngles = var_18_27
			end

			local var_18_28 = 0

			if var_18_28 < arg_15_1.time_ and arg_15_1.time_ <= var_18_28 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_18_29 = 0

			if var_18_29 < arg_15_1.time_ and arg_15_1.time_ <= var_18_29 + arg_18_0 then
				arg_15_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_18_30 = 0
			local var_18_31 = 0.375

			if var_18_30 < arg_15_1.time_ and arg_15_1.time_ <= var_18_30 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_32 = arg_15_1:FormatText(StoryNameCfg[37].name)

				arg_15_1.leftNameTxt_.text = var_18_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_33 = arg_15_1:GetWordFromCfg(103031004)
				local var_18_34 = arg_15_1:FormatText(var_18_33.content)

				arg_15_1.text_.text = var_18_34

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_35 = 15
				local var_18_36 = utf8.len(var_18_34)
				local var_18_37 = var_18_35 <= 0 and var_18_31 or var_18_31 * (var_18_36 / var_18_35)

				if var_18_37 > 0 and var_18_31 < var_18_37 then
					arg_15_1.talkMaxDuration = var_18_37

					if var_18_37 + var_18_30 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_37 + var_18_30
					end
				end

				arg_15_1.text_.text = var_18_34
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031004", "story_v_out_103031.awb") ~= 0 then
					local var_18_38 = manager.audio:GetVoiceLength("story_v_out_103031", "103031004", "story_v_out_103031.awb") / 1000

					if var_18_38 + var_18_30 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_38 + var_18_30
					end

					if var_18_33.prefab_name ~= "" and arg_15_1.actors_[var_18_33.prefab_name] ~= nil then
						local var_18_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_33.prefab_name].transform, "story_v_out_103031", "103031004", "story_v_out_103031.awb")

						arg_15_1:RecordAudio("103031004", var_18_39)
						arg_15_1:RecordAudio("103031004", var_18_39)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_103031", "103031004", "story_v_out_103031.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_103031", "103031004", "story_v_out_103031.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_40 = math.max(var_18_31, arg_15_1.talkMaxDuration)

			if var_18_30 <= arg_15_1.time_ and arg_15_1.time_ < var_18_30 + var_18_40 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_30) / var_18_40

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_30 + var_18_40 and arg_15_1.time_ < var_18_30 + var_18_40 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103031005
		arg_19_1.duration_ = 5.166

		local var_19_0 = {
			ja = 5.166,
			ko = 4.266,
			zh = 4.4,
			en = 4.233
		}
		local var_19_1 = manager.audio:GetLocalizationFlag()

		if var_19_0[var_19_1] ~= nil then
			arg_19_1.duration_ = var_19_0[var_19_1]
		end

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play103031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1019ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story == nil then
				arg_19_1.var_.characterEffect1019ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.1

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1019ui_story then
					arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1019ui_story then
				arg_19_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_22_4 = arg_19_1.actors_["1011ui_story"]
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story == nil then
				arg_19_1.var_.characterEffect1011ui_story = var_22_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_6 = 0.1

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6

				if arg_19_1.var_.characterEffect1011ui_story then
					local var_22_8 = Mathf.Lerp(0, 0.5, var_22_7)

					arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_8
				end
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 and arg_19_1.var_.characterEffect1011ui_story then
				local var_22_9 = 0.5

				arg_19_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1011ui_story.fillRatio = var_22_9
			end

			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_22_11 = arg_19_1.actors_["1019ui_story"].transform
			local var_22_12 = 0

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.var_.moveOldPos1019ui_story = var_22_11.localPosition
			end

			local var_22_13 = 0.001

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_13 then
				local var_22_14 = (arg_19_1.time_ - var_22_12) / var_22_13
				local var_22_15 = Vector3.New(0.7, -1.08, -5.9)

				var_22_11.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1019ui_story, var_22_15, var_22_14)

				local var_22_16 = manager.ui.mainCamera.transform.position - var_22_11.position

				var_22_11.forward = Vector3.New(var_22_16.x, var_22_16.y, var_22_16.z)

				local var_22_17 = var_22_11.localEulerAngles

				var_22_17.z = 0
				var_22_17.x = 0
				var_22_11.localEulerAngles = var_22_17
			end

			if arg_19_1.time_ >= var_22_12 + var_22_13 and arg_19_1.time_ < var_22_12 + var_22_13 + arg_22_0 then
				var_22_11.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_22_18 = manager.ui.mainCamera.transform.position - var_22_11.position

				var_22_11.forward = Vector3.New(var_22_18.x, var_22_18.y, var_22_18.z)

				local var_22_19 = var_22_11.localEulerAngles

				var_22_19.z = 0
				var_22_19.x = 0
				var_22_11.localEulerAngles = var_22_19
			end

			local var_22_20 = 0

			if var_22_20 < arg_19_1.time_ and arg_19_1.time_ <= var_22_20 + arg_22_0 then
				arg_19_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_22_21 = 0
			local var_22_22 = 0.45

			if var_22_21 < arg_19_1.time_ and arg_19_1.time_ <= var_22_21 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_23 = arg_19_1:FormatText(StoryNameCfg[13].name)

				arg_19_1.leftNameTxt_.text = var_22_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_24 = arg_19_1:GetWordFromCfg(103031005)
				local var_22_25 = arg_19_1:FormatText(var_22_24.content)

				arg_19_1.text_.text = var_22_25

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_26 = 18
				local var_22_27 = utf8.len(var_22_25)
				local var_22_28 = var_22_26 <= 0 and var_22_22 or var_22_22 * (var_22_27 / var_22_26)

				if var_22_28 > 0 and var_22_22 < var_22_28 then
					arg_19_1.talkMaxDuration = var_22_28

					if var_22_28 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_28 + var_22_21
					end
				end

				arg_19_1.text_.text = var_22_25
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031005", "story_v_out_103031.awb") ~= 0 then
					local var_22_29 = manager.audio:GetVoiceLength("story_v_out_103031", "103031005", "story_v_out_103031.awb") / 1000

					if var_22_29 + var_22_21 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_29 + var_22_21
					end

					if var_22_24.prefab_name ~= "" and arg_19_1.actors_[var_22_24.prefab_name] ~= nil then
						local var_22_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_24.prefab_name].transform, "story_v_out_103031", "103031005", "story_v_out_103031.awb")

						arg_19_1:RecordAudio("103031005", var_22_30)
						arg_19_1:RecordAudio("103031005", var_22_30)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_103031", "103031005", "story_v_out_103031.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_103031", "103031005", "story_v_out_103031.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_31 = math.max(var_22_22, arg_19_1.talkMaxDuration)

			if var_22_21 <= arg_19_1.time_ and arg_19_1.time_ < var_22_21 + var_22_31 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_21) / var_22_31

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_21 + var_22_31 and arg_19_1.time_ < var_22_21 + var_22_31 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 103031006
		arg_23_1.duration_ = 1.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play103031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["4010ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect4010ui_story == nil then
				arg_23_1.var_.characterEffect4010ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.1

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect4010ui_story then
					arg_23_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect4010ui_story then
				arg_23_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_26_4 = arg_23_1.actors_["1019ui_story"]
			local var_26_5 = 0

			if var_26_5 < arg_23_1.time_ and arg_23_1.time_ <= var_26_5 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_6 = 0.1

			if var_26_5 <= arg_23_1.time_ and arg_23_1.time_ < var_26_5 + var_26_6 then
				local var_26_7 = (arg_23_1.time_ - var_26_5) / var_26_6

				if arg_23_1.var_.characterEffect1019ui_story then
					local var_26_8 = Mathf.Lerp(0, 0.5, var_26_7)

					arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_8
				end
			end

			if arg_23_1.time_ >= var_26_5 + var_26_6 and arg_23_1.time_ < var_26_5 + var_26_6 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				local var_26_9 = 0.5

				arg_23_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1019ui_story.fillRatio = var_26_9
			end

			local var_26_10 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_11 = 0

			if var_26_11 < arg_23_1.time_ and arg_23_1.time_ <= var_26_11 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_10.localPosition
			end

			local var_26_12 = 0.001

			if var_26_11 <= arg_23_1.time_ and arg_23_1.time_ < var_26_11 + var_26_12 then
				local var_26_13 = (arg_23_1.time_ - var_26_11) / var_26_12
				local var_26_14 = Vector3.New(0, 100, 0)

				var_26_10.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_14, var_26_13)

				local var_26_15 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_15.x, var_26_15.y, var_26_15.z)

				local var_26_16 = var_26_10.localEulerAngles

				var_26_16.z = 0
				var_26_16.x = 0
				var_26_10.localEulerAngles = var_26_16
			end

			if arg_23_1.time_ >= var_26_11 + var_26_12 and arg_23_1.time_ < var_26_11 + var_26_12 + arg_26_0 then
				var_26_10.localPosition = Vector3.New(0, 100, 0)

				local var_26_17 = manager.ui.mainCamera.transform.position - var_26_10.position

				var_26_10.forward = Vector3.New(var_26_17.x, var_26_17.y, var_26_17.z)

				local var_26_18 = var_26_10.localEulerAngles

				var_26_18.z = 0
				var_26_18.x = 0
				var_26_10.localEulerAngles = var_26_18
			end

			local var_26_19 = arg_23_1.actors_["1011ui_story"].transform
			local var_26_20 = 0

			if var_26_20 < arg_23_1.time_ and arg_23_1.time_ <= var_26_20 + arg_26_0 then
				arg_23_1.var_.moveOldPos1011ui_story = var_26_19.localPosition
			end

			local var_26_21 = 0.001

			if var_26_20 <= arg_23_1.time_ and arg_23_1.time_ < var_26_20 + var_26_21 then
				local var_26_22 = (arg_23_1.time_ - var_26_20) / var_26_21
				local var_26_23 = Vector3.New(0, 100, 0)

				var_26_19.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1011ui_story, var_26_23, var_26_22)

				local var_26_24 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_24.x, var_26_24.y, var_26_24.z)

				local var_26_25 = var_26_19.localEulerAngles

				var_26_25.z = 0
				var_26_25.x = 0
				var_26_19.localEulerAngles = var_26_25
			end

			if arg_23_1.time_ >= var_26_20 + var_26_21 and arg_23_1.time_ < var_26_20 + var_26_21 + arg_26_0 then
				var_26_19.localPosition = Vector3.New(0, 100, 0)

				local var_26_26 = manager.ui.mainCamera.transform.position - var_26_19.position

				var_26_19.forward = Vector3.New(var_26_26.x, var_26_26.y, var_26_26.z)

				local var_26_27 = var_26_19.localEulerAngles

				var_26_27.z = 0
				var_26_27.x = 0
				var_26_19.localEulerAngles = var_26_27
			end

			local var_26_28 = arg_23_1.actors_["4010ui_story"].transform
			local var_26_29 = 0

			if var_26_29 < arg_23_1.time_ and arg_23_1.time_ <= var_26_29 + arg_26_0 then
				arg_23_1.var_.moveOldPos4010ui_story = var_26_28.localPosition
			end

			local var_26_30 = 0.001

			if var_26_29 <= arg_23_1.time_ and arg_23_1.time_ < var_26_29 + var_26_30 then
				local var_26_31 = (arg_23_1.time_ - var_26_29) / var_26_30
				local var_26_32 = Vector3.New(0, -1.59, -5.2)

				var_26_28.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos4010ui_story, var_26_32, var_26_31)

				local var_26_33 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_33.x, var_26_33.y, var_26_33.z)

				local var_26_34 = var_26_28.localEulerAngles

				var_26_34.z = 0
				var_26_34.x = 0
				var_26_28.localEulerAngles = var_26_34
			end

			if arg_23_1.time_ >= var_26_29 + var_26_30 and arg_23_1.time_ < var_26_29 + var_26_30 + arg_26_0 then
				var_26_28.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_26_35 = manager.ui.mainCamera.transform.position - var_26_28.position

				var_26_28.forward = Vector3.New(var_26_35.x, var_26_35.y, var_26_35.z)

				local var_26_36 = var_26_28.localEulerAngles

				var_26_36.z = 0
				var_26_36.x = 0
				var_26_28.localEulerAngles = var_26_36
			end

			local var_26_37 = 0

			if var_26_37 < arg_23_1.time_ and arg_23_1.time_ <= var_26_37 + arg_26_0 then
				arg_23_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_2")
			end

			local var_26_38 = 0

			if var_26_38 < arg_23_1.time_ and arg_23_1.time_ <= var_26_38 + arg_26_0 then
				arg_23_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_26_39 = 0
			local var_26_40 = 0.05

			if var_26_39 < arg_23_1.time_ and arg_23_1.time_ <= var_26_39 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_41 = arg_23_1:FormatText(StoryNameCfg[42].name)

				arg_23_1.leftNameTxt_.text = var_26_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_42 = arg_23_1:GetWordFromCfg(103031006)
				local var_26_43 = arg_23_1:FormatText(var_26_42.content)

				arg_23_1.text_.text = var_26_43

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_44 = 2
				local var_26_45 = utf8.len(var_26_43)
				local var_26_46 = var_26_44 <= 0 and var_26_40 or var_26_40 * (var_26_45 / var_26_44)

				if var_26_46 > 0 and var_26_40 < var_26_46 then
					arg_23_1.talkMaxDuration = var_26_46

					if var_26_46 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_46 + var_26_39
					end
				end

				arg_23_1.text_.text = var_26_43
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031006", "story_v_out_103031.awb") ~= 0 then
					local var_26_47 = manager.audio:GetVoiceLength("story_v_out_103031", "103031006", "story_v_out_103031.awb") / 1000

					if var_26_47 + var_26_39 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_47 + var_26_39
					end

					if var_26_42.prefab_name ~= "" and arg_23_1.actors_[var_26_42.prefab_name] ~= nil then
						local var_26_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_42.prefab_name].transform, "story_v_out_103031", "103031006", "story_v_out_103031.awb")

						arg_23_1:RecordAudio("103031006", var_26_48)
						arg_23_1:RecordAudio("103031006", var_26_48)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_103031", "103031006", "story_v_out_103031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_103031", "103031006", "story_v_out_103031.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_49 = math.max(var_26_40, arg_23_1.talkMaxDuration)

			if var_26_39 <= arg_23_1.time_ and arg_23_1.time_ < var_26_39 + var_26_49 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_39) / var_26_49

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_39 + var_26_49 and arg_23_1.time_ < var_26_39 + var_26_49 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play103031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 103031007
		arg_27_1.duration_ = 3.066

		local var_27_0 = {
			ja = 3.066,
			ko = 2.266,
			zh = 2.466,
			en = 2.133
		}
		local var_27_1 = manager.audio:GetLocalizationFlag()

		if var_27_0[var_27_1] ~= nil then
			arg_27_1.duration_ = var_27_0[var_27_1]
		end

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play103031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "3009ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["3009ui_story"]
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 and arg_27_1.var_.characterEffect3009ui_story == nil then
				arg_27_1.var_.characterEffect3009ui_story = var_30_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_6 = 0.1

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6

				if arg_27_1.var_.characterEffect3009ui_story then
					arg_27_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 and arg_27_1.var_.characterEffect3009ui_story then
				arg_27_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_30_8 = arg_27_1.actors_["4010ui_story"]
			local var_30_9 = 0

			if var_30_9 < arg_27_1.time_ and arg_27_1.time_ <= var_30_9 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story == nil then
				arg_27_1.var_.characterEffect4010ui_story = var_30_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_10 = 0.1

			if var_30_9 <= arg_27_1.time_ and arg_27_1.time_ < var_30_9 + var_30_10 then
				local var_30_11 = (arg_27_1.time_ - var_30_9) / var_30_10

				if arg_27_1.var_.characterEffect4010ui_story then
					local var_30_12 = Mathf.Lerp(0, 0.5, var_30_11)

					arg_27_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_27_1.var_.characterEffect4010ui_story.fillRatio = var_30_12
				end
			end

			if arg_27_1.time_ >= var_30_9 + var_30_10 and arg_27_1.time_ < var_30_9 + var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story then
				local var_30_13 = 0.5

				arg_27_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_27_1.var_.characterEffect4010ui_story.fillRatio = var_30_13
			end

			local var_30_14 = arg_27_1.actors_["4010ui_story"].transform
			local var_30_15 = 0

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.var_.moveOldPos4010ui_story = var_30_14.localPosition
			end

			local var_30_16 = 0.5

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_16 then
				local var_30_17 = (arg_27_1.time_ - var_30_15) / var_30_16
				local var_30_18 = Vector3.New(-0.7, -1.59, -5.2)

				var_30_14.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4010ui_story, var_30_18, var_30_17)

				local var_30_19 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_19.x, var_30_19.y, var_30_19.z)

				local var_30_20 = var_30_14.localEulerAngles

				var_30_20.z = 0
				var_30_20.x = 0
				var_30_14.localEulerAngles = var_30_20
			end

			if arg_27_1.time_ >= var_30_15 + var_30_16 and arg_27_1.time_ < var_30_15 + var_30_16 + arg_30_0 then
				var_30_14.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_30_21 = manager.ui.mainCamera.transform.position - var_30_14.position

				var_30_14.forward = Vector3.New(var_30_21.x, var_30_21.y, var_30_21.z)

				local var_30_22 = var_30_14.localEulerAngles

				var_30_22.z = 0
				var_30_22.x = 0
				var_30_14.localEulerAngles = var_30_22
			end

			local var_30_23 = arg_27_1.actors_["3009ui_story"].transform
			local var_30_24 = 0

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1.var_.moveOldPos3009ui_story = var_30_23.localPosition

				local var_30_25 = "3009ui_story"

				arg_27_1:ShowWeapon(arg_27_1.var_[var_30_25 .. "Animator"].transform, true)
			end

			local var_30_26 = 0.001

			if var_30_24 <= arg_27_1.time_ and arg_27_1.time_ < var_30_24 + var_30_26 then
				local var_30_27 = (arg_27_1.time_ - var_30_24) / var_30_26
				local var_30_28 = Vector3.New(0.7, -1.75, -4.8)

				var_30_23.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos3009ui_story, var_30_28, var_30_27)

				local var_30_29 = manager.ui.mainCamera.transform.position - var_30_23.position

				var_30_23.forward = Vector3.New(var_30_29.x, var_30_29.y, var_30_29.z)

				local var_30_30 = var_30_23.localEulerAngles

				var_30_30.z = 0
				var_30_30.x = 0
				var_30_23.localEulerAngles = var_30_30
			end

			if arg_27_1.time_ >= var_30_24 + var_30_26 and arg_27_1.time_ < var_30_24 + var_30_26 + arg_30_0 then
				var_30_23.localPosition = Vector3.New(0.7, -1.75, -4.8)

				local var_30_31 = manager.ui.mainCamera.transform.position - var_30_23.position

				var_30_23.forward = Vector3.New(var_30_31.x, var_30_31.y, var_30_31.z)

				local var_30_32 = var_30_23.localEulerAngles

				var_30_32.z = 0
				var_30_32.x = 0
				var_30_23.localEulerAngles = var_30_32
			end

			local var_30_33 = 0

			if var_30_33 < arg_27_1.time_ and arg_27_1.time_ <= var_30_33 + arg_30_0 then
				arg_27_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action2_1")
			end

			local var_30_34 = 0

			if var_30_34 < arg_27_1.time_ and arg_27_1.time_ <= var_30_34 + arg_30_0 then
				arg_27_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_30_35 = 0
			local var_30_36 = 0.25

			if var_30_35 < arg_27_1.time_ and arg_27_1.time_ <= var_30_35 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_37 = arg_27_1:FormatText(StoryNameCfg[43].name)

				arg_27_1.leftNameTxt_.text = var_30_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_38 = arg_27_1:GetWordFromCfg(103031007)
				local var_30_39 = arg_27_1:FormatText(var_30_38.content)

				arg_27_1.text_.text = var_30_39

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_40 = 10
				local var_30_41 = utf8.len(var_30_39)
				local var_30_42 = var_30_40 <= 0 and var_30_36 or var_30_36 * (var_30_41 / var_30_40)

				if var_30_42 > 0 and var_30_36 < var_30_42 then
					arg_27_1.talkMaxDuration = var_30_42

					if var_30_42 + var_30_35 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_42 + var_30_35
					end
				end

				arg_27_1.text_.text = var_30_39
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031007", "story_v_out_103031.awb") ~= 0 then
					local var_30_43 = manager.audio:GetVoiceLength("story_v_out_103031", "103031007", "story_v_out_103031.awb") / 1000

					if var_30_43 + var_30_35 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_43 + var_30_35
					end

					if var_30_38.prefab_name ~= "" and arg_27_1.actors_[var_30_38.prefab_name] ~= nil then
						local var_30_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_38.prefab_name].transform, "story_v_out_103031", "103031007", "story_v_out_103031.awb")

						arg_27_1:RecordAudio("103031007", var_30_44)
						arg_27_1:RecordAudio("103031007", var_30_44)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_103031", "103031007", "story_v_out_103031.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_103031", "103031007", "story_v_out_103031.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_45 = math.max(var_30_36, arg_27_1.talkMaxDuration)

			if var_30_35 <= arg_27_1.time_ and arg_27_1.time_ < var_30_35 + var_30_45 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_35) / var_30_45

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_35 + var_30_45 and arg_27_1.time_ < var_30_35 + var_30_45 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play103031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 103031008
		arg_31_1.duration_ = 6.266

		local var_31_0 = {
			ja = 6.266,
			ko = 4.633,
			zh = 3.633,
			en = 5.6
		}
		local var_31_1 = manager.audio:GetLocalizationFlag()

		if var_31_0[var_31_1] ~= nil then
			arg_31_1.duration_ = var_31_0[var_31_1]
		end

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play103031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["4010ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect4010ui_story == nil then
				arg_31_1.var_.characterEffect4010ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.1

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect4010ui_story then
					arg_31_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect4010ui_story then
				arg_31_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["3009ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect3009ui_story == nil then
				arg_31_1.var_.characterEffect3009ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.1

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect3009ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_31_1.var_.characterEffect3009ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect3009ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_31_1.var_.characterEffect3009ui_story.fillRatio = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_34_11 = 0
			local var_34_12 = 0.375

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_13 = arg_31_1:FormatText(StoryNameCfg[42].name)

				arg_31_1.leftNameTxt_.text = var_34_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_14 = arg_31_1:GetWordFromCfg(103031008)
				local var_34_15 = arg_31_1:FormatText(var_34_14.content)

				arg_31_1.text_.text = var_34_15

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_16 = 15
				local var_34_17 = utf8.len(var_34_15)
				local var_34_18 = var_34_16 <= 0 and var_34_12 or var_34_12 * (var_34_17 / var_34_16)

				if var_34_18 > 0 and var_34_12 < var_34_18 then
					arg_31_1.talkMaxDuration = var_34_18

					if var_34_18 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_11
					end
				end

				arg_31_1.text_.text = var_34_15
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031008", "story_v_out_103031.awb") ~= 0 then
					local var_34_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031008", "story_v_out_103031.awb") / 1000

					if var_34_19 + var_34_11 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_19 + var_34_11
					end

					if var_34_14.prefab_name ~= "" and arg_31_1.actors_[var_34_14.prefab_name] ~= nil then
						local var_34_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_14.prefab_name].transform, "story_v_out_103031", "103031008", "story_v_out_103031.awb")

						arg_31_1:RecordAudio("103031008", var_34_20)
						arg_31_1:RecordAudio("103031008", var_34_20)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_103031", "103031008", "story_v_out_103031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_103031", "103031008", "story_v_out_103031.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_21 = math.max(var_34_12, arg_31_1.talkMaxDuration)

			if var_34_11 <= arg_31_1.time_ and arg_31_1.time_ < var_34_11 + var_34_21 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_11) / var_34_21

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_11 + var_34_21 and arg_31_1.time_ < var_34_11 + var_34_21 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play103031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 103031009
		arg_35_1.duration_ = 8.4

		local var_35_0 = {
			ja = 3.166,
			ko = 8.4,
			zh = 5.533,
			en = 6.7
		}
		local var_35_1 = manager.audio:GetLocalizationFlag()

		if var_35_0[var_35_1] ~= nil then
			arg_35_1.duration_ = var_35_0[var_35_1]
		end

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play103031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = "3008ui_story"

			if arg_35_1.actors_[var_38_0] == nil then
				local var_38_1 = Object.Instantiate(Asset.Load("Char/" .. var_38_0), arg_35_1.stage_.transform)

				var_38_1.name = var_38_0
				var_38_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_35_1.actors_[var_38_0] = var_38_1

				local var_38_2 = var_38_1:GetComponentInChildren(typeof(CharacterEffect))

				var_38_2.enabled = true

				local var_38_3 = GameObjectTools.GetOrAddComponent(var_38_1, typeof(DynamicBoneHelper))

				if var_38_3 then
					var_38_3:EnableDynamicBone(false)
				end

				arg_35_1:ShowWeapon(var_38_2.transform, false)

				arg_35_1.var_[var_38_0 .. "Animator"] = var_38_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_35_1.var_[var_38_0 .. "Animator"].applyRootMotion = true
				arg_35_1.var_[var_38_0 .. "LipSync"] = var_38_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_38_4 = arg_35_1.actors_["3008ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect3008ui_story == nil then
				arg_35_1.var_.characterEffect3008ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.1

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect3008ui_story then
					arg_35_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect3008ui_story then
				arg_35_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_38_8 = arg_35_1.actors_["3009ui_story"].transform
			local var_38_9 = 0

			if var_38_9 < arg_35_1.time_ and arg_35_1.time_ <= var_38_9 + arg_38_0 then
				arg_35_1.var_.moveOldPos3009ui_story = var_38_8.localPosition
			end

			local var_38_10 = 0.001

			if var_38_9 <= arg_35_1.time_ and arg_35_1.time_ < var_38_9 + var_38_10 then
				local var_38_11 = (arg_35_1.time_ - var_38_9) / var_38_10
				local var_38_12 = Vector3.New(0, 100, 0)

				var_38_8.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3009ui_story, var_38_12, var_38_11)

				local var_38_13 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_13.x, var_38_13.y, var_38_13.z)

				local var_38_14 = var_38_8.localEulerAngles

				var_38_14.z = 0
				var_38_14.x = 0
				var_38_8.localEulerAngles = var_38_14
			end

			if arg_35_1.time_ >= var_38_9 + var_38_10 and arg_35_1.time_ < var_38_9 + var_38_10 + arg_38_0 then
				var_38_8.localPosition = Vector3.New(0, 100, 0)

				local var_38_15 = manager.ui.mainCamera.transform.position - var_38_8.position

				var_38_8.forward = Vector3.New(var_38_15.x, var_38_15.y, var_38_15.z)

				local var_38_16 = var_38_8.localEulerAngles

				var_38_16.z = 0
				var_38_16.x = 0
				var_38_8.localEulerAngles = var_38_16
			end

			local var_38_17 = arg_35_1.actors_["4010ui_story"].transform
			local var_38_18 = 0

			if var_38_18 < arg_35_1.time_ and arg_35_1.time_ <= var_38_18 + arg_38_0 then
				arg_35_1.var_.moveOldPos4010ui_story = var_38_17.localPosition
			end

			local var_38_19 = 0.001

			if var_38_18 <= arg_35_1.time_ and arg_35_1.time_ < var_38_18 + var_38_19 then
				local var_38_20 = (arg_35_1.time_ - var_38_18) / var_38_19
				local var_38_21 = Vector3.New(0, 100, 0)

				var_38_17.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos4010ui_story, var_38_21, var_38_20)

				local var_38_22 = manager.ui.mainCamera.transform.position - var_38_17.position

				var_38_17.forward = Vector3.New(var_38_22.x, var_38_22.y, var_38_22.z)

				local var_38_23 = var_38_17.localEulerAngles

				var_38_23.z = 0
				var_38_23.x = 0
				var_38_17.localEulerAngles = var_38_23
			end

			if arg_35_1.time_ >= var_38_18 + var_38_19 and arg_35_1.time_ < var_38_18 + var_38_19 + arg_38_0 then
				var_38_17.localPosition = Vector3.New(0, 100, 0)

				local var_38_24 = manager.ui.mainCamera.transform.position - var_38_17.position

				var_38_17.forward = Vector3.New(var_38_24.x, var_38_24.y, var_38_24.z)

				local var_38_25 = var_38_17.localEulerAngles

				var_38_25.z = 0
				var_38_25.x = 0
				var_38_17.localEulerAngles = var_38_25
			end

			local var_38_26 = arg_35_1.actors_["3008ui_story"].transform
			local var_38_27 = 0

			if var_38_27 < arg_35_1.time_ and arg_35_1.time_ <= var_38_27 + arg_38_0 then
				arg_35_1.var_.moveOldPos3008ui_story = var_38_26.localPosition
			end

			local var_38_28 = 0.001

			if var_38_27 <= arg_35_1.time_ and arg_35_1.time_ < var_38_27 + var_38_28 then
				local var_38_29 = (arg_35_1.time_ - var_38_27) / var_38_28
				local var_38_30 = Vector3.New(0, -1.51, -4.3)

				var_38_26.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos3008ui_story, var_38_30, var_38_29)

				local var_38_31 = manager.ui.mainCamera.transform.position - var_38_26.position

				var_38_26.forward = Vector3.New(var_38_31.x, var_38_31.y, var_38_31.z)

				local var_38_32 = var_38_26.localEulerAngles

				var_38_32.z = 0
				var_38_32.x = 0
				var_38_26.localEulerAngles = var_38_32
			end

			if arg_35_1.time_ >= var_38_27 + var_38_28 and arg_35_1.time_ < var_38_27 + var_38_28 + arg_38_0 then
				var_38_26.localPosition = Vector3.New(0, -1.51, -4.3)

				local var_38_33 = manager.ui.mainCamera.transform.position - var_38_26.position

				var_38_26.forward = Vector3.New(var_38_33.x, var_38_33.y, var_38_33.z)

				local var_38_34 = var_38_26.localEulerAngles

				var_38_34.z = 0
				var_38_34.x = 0
				var_38_26.localEulerAngles = var_38_34
			end

			local var_38_35 = 0

			if var_38_35 < arg_35_1.time_ and arg_35_1.time_ <= var_38_35 + arg_38_0 then
				arg_35_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/3008/3008action/3008action2_1")
			end

			local var_38_36 = 0

			if var_38_36 < arg_35_1.time_ and arg_35_1.time_ <= var_38_36 + arg_38_0 then
				arg_35_1:PlayTimeline("3008ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_38_37 = 0
			local var_38_38 = 0.775

			if var_38_37 < arg_35_1.time_ and arg_35_1.time_ <= var_38_37 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_39 = arg_35_1:FormatText(StoryNameCfg[20].name)

				arg_35_1.leftNameTxt_.text = var_38_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_40 = arg_35_1:GetWordFromCfg(103031009)
				local var_38_41 = arg_35_1:FormatText(var_38_40.content)

				arg_35_1.text_.text = var_38_41

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_42 = 30
				local var_38_43 = utf8.len(var_38_41)
				local var_38_44 = var_38_42 <= 0 and var_38_38 or var_38_38 * (var_38_43 / var_38_42)

				if var_38_44 > 0 and var_38_38 < var_38_44 then
					arg_35_1.talkMaxDuration = var_38_44

					if var_38_44 + var_38_37 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_44 + var_38_37
					end
				end

				arg_35_1.text_.text = var_38_41
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031009", "story_v_out_103031.awb") ~= 0 then
					local var_38_45 = manager.audio:GetVoiceLength("story_v_out_103031", "103031009", "story_v_out_103031.awb") / 1000

					if var_38_45 + var_38_37 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_45 + var_38_37
					end

					if var_38_40.prefab_name ~= "" and arg_35_1.actors_[var_38_40.prefab_name] ~= nil then
						local var_38_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_40.prefab_name].transform, "story_v_out_103031", "103031009", "story_v_out_103031.awb")

						arg_35_1:RecordAudio("103031009", var_38_46)
						arg_35_1:RecordAudio("103031009", var_38_46)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_103031", "103031009", "story_v_out_103031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_103031", "103031009", "story_v_out_103031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_47 = math.max(var_38_38, arg_35_1.talkMaxDuration)

			if var_38_37 <= arg_35_1.time_ and arg_35_1.time_ < var_38_37 + var_38_47 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_37) / var_38_47

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_37 + var_38_47 and arg_35_1.time_ < var_38_37 + var_38_47 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play103031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 103031010
		arg_39_1.duration_ = 14.2

		local var_39_0 = {
			ja = 14.2,
			ko = 11.733,
			zh = 11.433,
			en = 10.8
		}
		local var_39_1 = manager.audio:GetLocalizationFlag()

		if var_39_0[var_39_1] ~= nil then
			arg_39_1.duration_ = var_39_0[var_39_1]
		end

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play103031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["4010ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect4010ui_story == nil then
				arg_39_1.var_.characterEffect4010ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.1

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect4010ui_story then
					arg_39_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect4010ui_story then
				arg_39_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["3008ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect3008ui_story == nil then
				arg_39_1.var_.characterEffect3008ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.1

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect3008ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_39_1.var_.characterEffect3008ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect3008ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_39_1.var_.characterEffect3008ui_story.fillRatio = var_42_9
			end

			local var_42_10 = arg_39_1.actors_["3008ui_story"].transform
			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.var_.moveOldPos3008ui_story = var_42_10.localPosition
			end

			local var_42_12 = 0.001

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_12 then
				local var_42_13 = (arg_39_1.time_ - var_42_11) / var_42_12
				local var_42_14 = Vector3.New(0, 100, 0)

				var_42_10.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos3008ui_story, var_42_14, var_42_13)

				local var_42_15 = manager.ui.mainCamera.transform.position - var_42_10.position

				var_42_10.forward = Vector3.New(var_42_15.x, var_42_15.y, var_42_15.z)

				local var_42_16 = var_42_10.localEulerAngles

				var_42_16.z = 0
				var_42_16.x = 0
				var_42_10.localEulerAngles = var_42_16
			end

			if arg_39_1.time_ >= var_42_11 + var_42_12 and arg_39_1.time_ < var_42_11 + var_42_12 + arg_42_0 then
				var_42_10.localPosition = Vector3.New(0, 100, 0)

				local var_42_17 = manager.ui.mainCamera.transform.position - var_42_10.position

				var_42_10.forward = Vector3.New(var_42_17.x, var_42_17.y, var_42_17.z)

				local var_42_18 = var_42_10.localEulerAngles

				var_42_18.z = 0
				var_42_18.x = 0
				var_42_10.localEulerAngles = var_42_18
			end

			local var_42_19 = arg_39_1.actors_["4010ui_story"].transform
			local var_42_20 = 0

			if var_42_20 < arg_39_1.time_ and arg_39_1.time_ <= var_42_20 + arg_42_0 then
				arg_39_1.var_.moveOldPos4010ui_story = var_42_19.localPosition
			end

			local var_42_21 = 0.001

			if var_42_20 <= arg_39_1.time_ and arg_39_1.time_ < var_42_20 + var_42_21 then
				local var_42_22 = (arg_39_1.time_ - var_42_20) / var_42_21
				local var_42_23 = Vector3.New(0, -1.59, -5.2)

				var_42_19.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos4010ui_story, var_42_23, var_42_22)

				local var_42_24 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_24.x, var_42_24.y, var_42_24.z)

				local var_42_25 = var_42_19.localEulerAngles

				var_42_25.z = 0
				var_42_25.x = 0
				var_42_19.localEulerAngles = var_42_25
			end

			if arg_39_1.time_ >= var_42_20 + var_42_21 and arg_39_1.time_ < var_42_20 + var_42_21 + arg_42_0 then
				var_42_19.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_42_26 = manager.ui.mainCamera.transform.position - var_42_19.position

				var_42_19.forward = Vector3.New(var_42_26.x, var_42_26.y, var_42_26.z)

				local var_42_27 = var_42_19.localEulerAngles

				var_42_27.z = 0
				var_42_27.x = 0
				var_42_19.localEulerAngles = var_42_27
			end

			local var_42_28 = 0

			if var_42_28 < arg_39_1.time_ and arg_39_1.time_ <= var_42_28 + arg_42_0 then
				arg_39_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_1")
			end

			local var_42_29 = 0

			if var_42_29 < arg_39_1.time_ and arg_39_1.time_ <= var_42_29 + arg_42_0 then
				arg_39_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_42_30 = 0
			local var_42_31 = 1.325

			if var_42_30 < arg_39_1.time_ and arg_39_1.time_ <= var_42_30 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_32 = arg_39_1:FormatText(StoryNameCfg[42].name)

				arg_39_1.leftNameTxt_.text = var_42_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_33 = arg_39_1:GetWordFromCfg(103031010)
				local var_42_34 = arg_39_1:FormatText(var_42_33.content)

				arg_39_1.text_.text = var_42_34

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_35 = 52
				local var_42_36 = utf8.len(var_42_34)
				local var_42_37 = var_42_35 <= 0 and var_42_31 or var_42_31 * (var_42_36 / var_42_35)

				if var_42_37 > 0 and var_42_31 < var_42_37 then
					arg_39_1.talkMaxDuration = var_42_37

					if var_42_37 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_37 + var_42_30
					end
				end

				arg_39_1.text_.text = var_42_34
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031010", "story_v_out_103031.awb") ~= 0 then
					local var_42_38 = manager.audio:GetVoiceLength("story_v_out_103031", "103031010", "story_v_out_103031.awb") / 1000

					if var_42_38 + var_42_30 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_38 + var_42_30
					end

					if var_42_33.prefab_name ~= "" and arg_39_1.actors_[var_42_33.prefab_name] ~= nil then
						local var_42_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_33.prefab_name].transform, "story_v_out_103031", "103031010", "story_v_out_103031.awb")

						arg_39_1:RecordAudio("103031010", var_42_39)
						arg_39_1:RecordAudio("103031010", var_42_39)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_103031", "103031010", "story_v_out_103031.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_103031", "103031010", "story_v_out_103031.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_40 = math.max(var_42_31, arg_39_1.talkMaxDuration)

			if var_42_30 <= arg_39_1.time_ and arg_39_1.time_ < var_42_30 + var_42_40 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_30) / var_42_40

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_30 + var_42_40 and arg_39_1.time_ < var_42_30 + var_42_40 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play103031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 103031011
		arg_43_1.duration_ = 13.233

		local var_43_0 = {
			ja = 13.233,
			ko = 8.966,
			zh = 10,
			en = 8.833
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play103031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action6_2")
			end

			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_46_2 = 0
			local var_46_3 = 1.075

			if var_46_2 < arg_43_1.time_ and arg_43_1.time_ <= var_46_2 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_4 = arg_43_1:FormatText(StoryNameCfg[42].name)

				arg_43_1.leftNameTxt_.text = var_46_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_5 = arg_43_1:GetWordFromCfg(103031011)
				local var_46_6 = arg_43_1:FormatText(var_46_5.content)

				arg_43_1.text_.text = var_46_6

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_7 = 43
				local var_46_8 = utf8.len(var_46_6)
				local var_46_9 = var_46_7 <= 0 and var_46_3 or var_46_3 * (var_46_8 / var_46_7)

				if var_46_9 > 0 and var_46_3 < var_46_9 then
					arg_43_1.talkMaxDuration = var_46_9

					if var_46_9 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_9 + var_46_2
					end
				end

				arg_43_1.text_.text = var_46_6
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031011", "story_v_out_103031.awb") ~= 0 then
					local var_46_10 = manager.audio:GetVoiceLength("story_v_out_103031", "103031011", "story_v_out_103031.awb") / 1000

					if var_46_10 + var_46_2 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_10 + var_46_2
					end

					if var_46_5.prefab_name ~= "" and arg_43_1.actors_[var_46_5.prefab_name] ~= nil then
						local var_46_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_5.prefab_name].transform, "story_v_out_103031", "103031011", "story_v_out_103031.awb")

						arg_43_1:RecordAudio("103031011", var_46_11)
						arg_43_1:RecordAudio("103031011", var_46_11)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_103031", "103031011", "story_v_out_103031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_103031", "103031011", "story_v_out_103031.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_12 = math.max(var_46_3, arg_43_1.talkMaxDuration)

			if var_46_2 <= arg_43_1.time_ and arg_43_1.time_ < var_46_2 + var_46_12 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_2) / var_46_12

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_2 + var_46_12 and arg_43_1.time_ < var_46_2 + var_46_12 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play103031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 103031012
		arg_47_1.duration_ = 3.2

		local var_47_0 = {
			ja = 3.2,
			ko = 2.5,
			zh = 1.666,
			en = 1.633
		}
		local var_47_1 = manager.audio:GetLocalizationFlag()

		if var_47_0[var_47_1] ~= nil then
			arg_47_1.duration_ = var_47_0[var_47_1]
		end

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play103031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1084ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1084ui_story then
					arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["4010ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story == nil then
				arg_47_1.var_.characterEffect4010ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.1

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect4010ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_47_1.var_.characterEffect4010ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_47_1.var_.characterEffect4010ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_50_11 = 0
			local var_50_12 = 0.125

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_13 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_14 = arg_47_1:GetWordFromCfg(103031012)
				local var_50_15 = arg_47_1:FormatText(var_50_14.content)

				arg_47_1.text_.text = var_50_15

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_16 = 5
				local var_50_17 = utf8.len(var_50_15)
				local var_50_18 = var_50_16 <= 0 and var_50_12 or var_50_12 * (var_50_17 / var_50_16)

				if var_50_18 > 0 and var_50_12 < var_50_18 then
					arg_47_1.talkMaxDuration = var_50_18

					if var_50_18 + var_50_11 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_11
					end
				end

				arg_47_1.text_.text = var_50_15
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031012", "story_v_out_103031.awb") ~= 0 then
					local var_50_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031012", "story_v_out_103031.awb") / 1000

					if var_50_19 + var_50_11 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_11
					end

					if var_50_14.prefab_name ~= "" and arg_47_1.actors_[var_50_14.prefab_name] ~= nil then
						local var_50_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_14.prefab_name].transform, "story_v_out_103031", "103031012", "story_v_out_103031.awb")

						arg_47_1:RecordAudio("103031012", var_50_20)
						arg_47_1:RecordAudio("103031012", var_50_20)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_103031", "103031012", "story_v_out_103031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_103031", "103031012", "story_v_out_103031.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_21 = math.max(var_50_12, arg_47_1.talkMaxDuration)

			if var_50_11 <= arg_47_1.time_ and arg_47_1.time_ < var_50_11 + var_50_21 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_11) / var_50_21

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_11 + var_50_21 and arg_47_1.time_ < var_50_11 + var_50_21 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play103031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 103031013
		arg_51_1.duration_ = 11.566

		local var_51_0 = {
			ja = 11.566,
			ko = 7.4,
			zh = 7.633,
			en = 6.966
		}
		local var_51_1 = manager.audio:GetLocalizationFlag()

		if var_51_0[var_51_1] ~= nil then
			arg_51_1.duration_ = var_51_0[var_51_1]
		end

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play103031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["4010ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story == nil then
				arg_51_1.var_.characterEffect4010ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.1

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect4010ui_story then
					arg_51_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect4010ui_story then
				arg_51_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1084ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story == nil then
				arg_51_1.var_.characterEffect1084ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.1

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1084ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1084ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1084ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_54_11 = 0
			local var_54_12 = 0.925

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_13 = arg_51_1:FormatText(StoryNameCfg[42].name)

				arg_51_1.leftNameTxt_.text = var_54_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_14 = arg_51_1:GetWordFromCfg(103031013)
				local var_54_15 = arg_51_1:FormatText(var_54_14.content)

				arg_51_1.text_.text = var_54_15

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_16 = 37
				local var_54_17 = utf8.len(var_54_15)
				local var_54_18 = var_54_16 <= 0 and var_54_12 or var_54_12 * (var_54_17 / var_54_16)

				if var_54_18 > 0 and var_54_12 < var_54_18 then
					arg_51_1.talkMaxDuration = var_54_18

					if var_54_18 + var_54_11 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_11
					end
				end

				arg_51_1.text_.text = var_54_15
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031013", "story_v_out_103031.awb") ~= 0 then
					local var_54_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031013", "story_v_out_103031.awb") / 1000

					if var_54_19 + var_54_11 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_11
					end

					if var_54_14.prefab_name ~= "" and arg_51_1.actors_[var_54_14.prefab_name] ~= nil then
						local var_54_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_14.prefab_name].transform, "story_v_out_103031", "103031013", "story_v_out_103031.awb")

						arg_51_1:RecordAudio("103031013", var_54_20)
						arg_51_1:RecordAudio("103031013", var_54_20)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_103031", "103031013", "story_v_out_103031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_103031", "103031013", "story_v_out_103031.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_21 = math.max(var_54_12, arg_51_1.talkMaxDuration)

			if var_54_11 <= arg_51_1.time_ and arg_51_1.time_ < var_54_11 + var_54_21 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_11) / var_54_21

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_11 + var_54_21 and arg_51_1.time_ < var_54_11 + var_54_21 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play103031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 103031014
		arg_55_1.duration_ = 5.633

		local var_55_0 = {
			ja = 5.633,
			ko = 4.9,
			zh = 5.433,
			en = 3.966
		}
		local var_55_1 = manager.audio:GetLocalizationFlag()

		if var_55_0[var_55_1] ~= nil then
			arg_55_1.duration_ = var_55_0[var_55_1]
		end

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play103031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["4010ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story == nil then
				arg_55_1.var_.characterEffect4010ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.1

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect4010ui_story then
					arg_55_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect4010ui_story then
				arg_55_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1011ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story == nil then
				arg_55_1.var_.characterEffect1011ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.1

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1011ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1011ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1011ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1011ui_story.fillRatio = var_58_9
			end

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_58_11 = 0
			local var_58_12 = 0.625

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_13 = arg_55_1:FormatText(StoryNameCfg[42].name)

				arg_55_1.leftNameTxt_.text = var_58_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_14 = arg_55_1:GetWordFromCfg(103031014)
				local var_58_15 = arg_55_1:FormatText(var_58_14.content)

				arg_55_1.text_.text = var_58_15

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_16 = 25
				local var_58_17 = utf8.len(var_58_15)
				local var_58_18 = var_58_16 <= 0 and var_58_12 or var_58_12 * (var_58_17 / var_58_16)

				if var_58_18 > 0 and var_58_12 < var_58_18 then
					arg_55_1.talkMaxDuration = var_58_18

					if var_58_18 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_18 + var_58_11
					end
				end

				arg_55_1.text_.text = var_58_15
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031014", "story_v_out_103031.awb") ~= 0 then
					local var_58_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031014", "story_v_out_103031.awb") / 1000

					if var_58_19 + var_58_11 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_11
					end

					if var_58_14.prefab_name ~= "" and arg_55_1.actors_[var_58_14.prefab_name] ~= nil then
						local var_58_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_14.prefab_name].transform, "story_v_out_103031", "103031014", "story_v_out_103031.awb")

						arg_55_1:RecordAudio("103031014", var_58_20)
						arg_55_1:RecordAudio("103031014", var_58_20)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_103031", "103031014", "story_v_out_103031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_103031", "103031014", "story_v_out_103031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_21 = math.max(var_58_12, arg_55_1.talkMaxDuration)

			if var_58_11 <= arg_55_1.time_ and arg_55_1.time_ < var_58_11 + var_58_21 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_11) / var_58_21

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_11 + var_58_21 and arg_55_1.time_ < var_58_11 + var_58_21 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play103031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 103031015
		arg_59_1.duration_ = 16.233

		local var_59_0 = {
			ja = 16.233,
			ko = 12.566,
			zh = 13,
			en = 13.666
		}
		local var_59_1 = manager.audio:GetLocalizationFlag()

		if var_59_0[var_59_1] ~= nil then
			arg_59_1.duration_ = var_59_0[var_59_1]
		end

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play103031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_62_1 = 0
			local var_62_2 = 1.6

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_3 = arg_59_1:FormatText(StoryNameCfg[42].name)

				arg_59_1.leftNameTxt_.text = var_62_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_4 = arg_59_1:GetWordFromCfg(103031015)
				local var_62_5 = arg_59_1:FormatText(var_62_4.content)

				arg_59_1.text_.text = var_62_5

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_6 = 64
				local var_62_7 = utf8.len(var_62_5)
				local var_62_8 = var_62_6 <= 0 and var_62_2 or var_62_2 * (var_62_7 / var_62_6)

				if var_62_8 > 0 and var_62_2 < var_62_8 then
					arg_59_1.talkMaxDuration = var_62_8

					if var_62_8 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_1
					end
				end

				arg_59_1.text_.text = var_62_5
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031015", "story_v_out_103031.awb") ~= 0 then
					local var_62_9 = manager.audio:GetVoiceLength("story_v_out_103031", "103031015", "story_v_out_103031.awb") / 1000

					if var_62_9 + var_62_1 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_9 + var_62_1
					end

					if var_62_4.prefab_name ~= "" and arg_59_1.actors_[var_62_4.prefab_name] ~= nil then
						local var_62_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_4.prefab_name].transform, "story_v_out_103031", "103031015", "story_v_out_103031.awb")

						arg_59_1:RecordAudio("103031015", var_62_10)
						arg_59_1:RecordAudio("103031015", var_62_10)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_103031", "103031015", "story_v_out_103031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_103031", "103031015", "story_v_out_103031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_11 = math.max(var_62_2, arg_59_1.talkMaxDuration)

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_11 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_1) / var_62_11

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_1 + var_62_11 and arg_59_1.time_ < var_62_1 + var_62_11 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play103031016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 103031016
		arg_63_1.duration_ = 3.7

		local var_63_0 = {
			ja = 3.566,
			ko = 3,
			zh = 3.7,
			en = 3.066
		}
		local var_63_1 = manager.audio:GetLocalizationFlag()

		if var_63_0[var_63_1] ~= nil then
			arg_63_1.duration_ = var_63_0[var_63_1]
		end

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play103031017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1011ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story == nil then
				arg_63_1.var_.characterEffect1011ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.1

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1011ui_story then
					arg_63_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1011ui_story then
				arg_63_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["4010ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect4010ui_story == nil then
				arg_63_1.var_.characterEffect4010ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.1

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect4010ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_63_1.var_.characterEffect4010ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect4010ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_63_1.var_.characterEffect4010ui_story.fillRatio = var_66_9
			end

			local var_66_10 = arg_63_1.actors_["4010ui_story"].transform
			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1.var_.moveOldPos4010ui_story = var_66_10.localPosition
			end

			local var_66_12 = 0.5

			if var_66_11 <= arg_63_1.time_ and arg_63_1.time_ < var_66_11 + var_66_12 then
				local var_66_13 = (arg_63_1.time_ - var_66_11) / var_66_12
				local var_66_14 = Vector3.New(0.7, -1.59, -5.2)

				var_66_10.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos4010ui_story, var_66_14, var_66_13)

				local var_66_15 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_15.x, var_66_15.y, var_66_15.z)

				local var_66_16 = var_66_10.localEulerAngles

				var_66_16.z = 0
				var_66_16.x = 0
				var_66_10.localEulerAngles = var_66_16
			end

			if arg_63_1.time_ >= var_66_11 + var_66_12 and arg_63_1.time_ < var_66_11 + var_66_12 + arg_66_0 then
				var_66_10.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_66_17 = manager.ui.mainCamera.transform.position - var_66_10.position

				var_66_10.forward = Vector3.New(var_66_17.x, var_66_17.y, var_66_17.z)

				local var_66_18 = var_66_10.localEulerAngles

				var_66_18.z = 0
				var_66_18.x = 0
				var_66_10.localEulerAngles = var_66_18
			end

			local var_66_19 = arg_63_1.actors_["1011ui_story"].transform
			local var_66_20 = 0

			if var_66_20 < arg_63_1.time_ and arg_63_1.time_ <= var_66_20 + arg_66_0 then
				arg_63_1.var_.moveOldPos1011ui_story = var_66_19.localPosition
			end

			local var_66_21 = 0.001

			if var_66_20 <= arg_63_1.time_ and arg_63_1.time_ < var_66_20 + var_66_21 then
				local var_66_22 = (arg_63_1.time_ - var_66_20) / var_66_21
				local var_66_23 = Vector3.New(-0.7, -0.71, -6)

				var_66_19.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1011ui_story, var_66_23, var_66_22)

				local var_66_24 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_24.x, var_66_24.y, var_66_24.z)

				local var_66_25 = var_66_19.localEulerAngles

				var_66_25.z = 0
				var_66_25.x = 0
				var_66_19.localEulerAngles = var_66_25
			end

			if arg_63_1.time_ >= var_66_20 + var_66_21 and arg_63_1.time_ < var_66_20 + var_66_21 + arg_66_0 then
				var_66_19.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_66_26 = manager.ui.mainCamera.transform.position - var_66_19.position

				var_66_19.forward = Vector3.New(var_66_26.x, var_66_26.y, var_66_26.z)

				local var_66_27 = var_66_19.localEulerAngles

				var_66_27.z = 0
				var_66_27.x = 0
				var_66_19.localEulerAngles = var_66_27
			end

			local var_66_28 = 0

			if var_66_28 < arg_63_1.time_ and arg_63_1.time_ <= var_66_28 + arg_66_0 then
				arg_63_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_66_29 = 0

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_66_30 = 0
			local var_66_31 = 0.275

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_32 = arg_63_1:FormatText(StoryNameCfg[37].name)

				arg_63_1.leftNameTxt_.text = var_66_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_33 = arg_63_1:GetWordFromCfg(103031016)
				local var_66_34 = arg_63_1:FormatText(var_66_33.content)

				arg_63_1.text_.text = var_66_34

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_35 = 11
				local var_66_36 = utf8.len(var_66_34)
				local var_66_37 = var_66_35 <= 0 and var_66_31 or var_66_31 * (var_66_36 / var_66_35)

				if var_66_37 > 0 and var_66_31 < var_66_37 then
					arg_63_1.talkMaxDuration = var_66_37

					if var_66_37 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_37 + var_66_30
					end
				end

				arg_63_1.text_.text = var_66_34
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031016", "story_v_out_103031.awb") ~= 0 then
					local var_66_38 = manager.audio:GetVoiceLength("story_v_out_103031", "103031016", "story_v_out_103031.awb") / 1000

					if var_66_38 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_38 + var_66_30
					end

					if var_66_33.prefab_name ~= "" and arg_63_1.actors_[var_66_33.prefab_name] ~= nil then
						local var_66_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_33.prefab_name].transform, "story_v_out_103031", "103031016", "story_v_out_103031.awb")

						arg_63_1:RecordAudio("103031016", var_66_39)
						arg_63_1:RecordAudio("103031016", var_66_39)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_103031", "103031016", "story_v_out_103031.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_103031", "103031016", "story_v_out_103031.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_40 = math.max(var_66_31, arg_63_1.talkMaxDuration)

			if var_66_30 <= arg_63_1.time_ and arg_63_1.time_ < var_66_30 + var_66_40 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_30) / var_66_40

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_30 + var_66_40 and arg_63_1.time_ < var_66_30 + var_66_40 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play103031017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 103031017
		arg_67_1.duration_ = 11.7

		local var_67_0 = {
			ja = 11.7,
			ko = 9.633,
			zh = 9.933,
			en = 7.6
		}
		local var_67_1 = manager.audio:GetLocalizationFlag()

		if var_67_0[var_67_1] ~= nil then
			arg_67_1.duration_ = var_67_0[var_67_1]
		end

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play103031018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["4010ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect4010ui_story == nil then
				arg_67_1.var_.characterEffect4010ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.1

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect4010ui_story then
					arg_67_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect4010ui_story then
				arg_67_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_70_4 = arg_67_1.actors_["1011ui_story"]
			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 and arg_67_1.var_.characterEffect1011ui_story == nil then
				arg_67_1.var_.characterEffect1011ui_story = var_70_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_6 = 0.1

			if var_70_5 <= arg_67_1.time_ and arg_67_1.time_ < var_70_5 + var_70_6 then
				local var_70_7 = (arg_67_1.time_ - var_70_5) / var_70_6

				if arg_67_1.var_.characterEffect1011ui_story then
					local var_70_8 = Mathf.Lerp(0, 0.5, var_70_7)

					arg_67_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1011ui_story.fillRatio = var_70_8
				end
			end

			if arg_67_1.time_ >= var_70_5 + var_70_6 and arg_67_1.time_ < var_70_5 + var_70_6 + arg_70_0 and arg_67_1.var_.characterEffect1011ui_story then
				local var_70_9 = 0.5

				arg_67_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1011ui_story.fillRatio = var_70_9
			end

			local var_70_10 = 0

			if var_70_10 < arg_67_1.time_ and arg_67_1.time_ <= var_70_10 + arg_70_0 then
				arg_67_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_70_11 = 0
			local var_70_12 = 1.075

			if var_70_11 < arg_67_1.time_ and arg_67_1.time_ <= var_70_11 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_13 = arg_67_1:FormatText(StoryNameCfg[42].name)

				arg_67_1.leftNameTxt_.text = var_70_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_14 = arg_67_1:GetWordFromCfg(103031017)
				local var_70_15 = arg_67_1:FormatText(var_70_14.content)

				arg_67_1.text_.text = var_70_15

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_16 = 42
				local var_70_17 = utf8.len(var_70_15)
				local var_70_18 = var_70_16 <= 0 and var_70_12 or var_70_12 * (var_70_17 / var_70_16)

				if var_70_18 > 0 and var_70_12 < var_70_18 then
					arg_67_1.talkMaxDuration = var_70_18

					if var_70_18 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_18 + var_70_11
					end
				end

				arg_67_1.text_.text = var_70_15
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031017", "story_v_out_103031.awb") ~= 0 then
					local var_70_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031017", "story_v_out_103031.awb") / 1000

					if var_70_19 + var_70_11 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_19 + var_70_11
					end

					if var_70_14.prefab_name ~= "" and arg_67_1.actors_[var_70_14.prefab_name] ~= nil then
						local var_70_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_14.prefab_name].transform, "story_v_out_103031", "103031017", "story_v_out_103031.awb")

						arg_67_1:RecordAudio("103031017", var_70_20)
						arg_67_1:RecordAudio("103031017", var_70_20)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_103031", "103031017", "story_v_out_103031.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_103031", "103031017", "story_v_out_103031.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_21 = math.max(var_70_12, arg_67_1.talkMaxDuration)

			if var_70_11 <= arg_67_1.time_ and arg_67_1.time_ < var_70_11 + var_70_21 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_11) / var_70_21

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_11 + var_70_21 and arg_67_1.time_ < var_70_11 + var_70_21 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play103031018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 103031018
		arg_71_1.duration_ = 12.7

		local var_71_0 = {
			ja = 12.7,
			ko = 9.5,
			zh = 10.666,
			en = 11.8
		}
		local var_71_1 = manager.audio:GetLocalizationFlag()

		if var_71_0[var_71_1] ~= nil then
			arg_71_1.duration_ = var_71_0[var_71_1]
		end

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play103031019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_74_1 = 0
			local var_74_2 = 1.15

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_3 = arg_71_1:FormatText(StoryNameCfg[42].name)

				arg_71_1.leftNameTxt_.text = var_74_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_4 = arg_71_1:GetWordFromCfg(103031018)
				local var_74_5 = arg_71_1:FormatText(var_74_4.content)

				arg_71_1.text_.text = var_74_5

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_6 = 47
				local var_74_7 = utf8.len(var_74_5)
				local var_74_8 = var_74_6 <= 0 and var_74_2 or var_74_2 * (var_74_7 / var_74_6)

				if var_74_8 > 0 and var_74_2 < var_74_8 then
					arg_71_1.talkMaxDuration = var_74_8

					if var_74_8 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_1
					end
				end

				arg_71_1.text_.text = var_74_5
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031018", "story_v_out_103031.awb") ~= 0 then
					local var_74_9 = manager.audio:GetVoiceLength("story_v_out_103031", "103031018", "story_v_out_103031.awb") / 1000

					if var_74_9 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_9 + var_74_1
					end

					if var_74_4.prefab_name ~= "" and arg_71_1.actors_[var_74_4.prefab_name] ~= nil then
						local var_74_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_4.prefab_name].transform, "story_v_out_103031", "103031018", "story_v_out_103031.awb")

						arg_71_1:RecordAudio("103031018", var_74_10)
						arg_71_1:RecordAudio("103031018", var_74_10)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_103031", "103031018", "story_v_out_103031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_103031", "103031018", "story_v_out_103031.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_11 = math.max(var_74_2, arg_71_1.talkMaxDuration)

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_11 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_1) / var_74_11

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_1 + var_74_11 and arg_71_1.time_ < var_74_1 + var_74_11 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play103031019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 103031019
		arg_75_1.duration_ = 6.2

		local var_75_0 = {
			ja = 4.433,
			ko = 5.533,
			zh = 4.8,
			en = 6.2
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play103031020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_78_1 = 0
			local var_78_2 = 0.375

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_3 = arg_75_1:FormatText(StoryNameCfg[42].name)

				arg_75_1.leftNameTxt_.text = var_78_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_4 = arg_75_1:GetWordFromCfg(103031019)
				local var_78_5 = arg_75_1:FormatText(var_78_4.content)

				arg_75_1.text_.text = var_78_5

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_6 = 15
				local var_78_7 = utf8.len(var_78_5)
				local var_78_8 = var_78_6 <= 0 and var_78_2 or var_78_2 * (var_78_7 / var_78_6)

				if var_78_8 > 0 and var_78_2 < var_78_8 then
					arg_75_1.talkMaxDuration = var_78_8

					if var_78_8 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_1
					end
				end

				arg_75_1.text_.text = var_78_5
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031019", "story_v_out_103031.awb") ~= 0 then
					local var_78_9 = manager.audio:GetVoiceLength("story_v_out_103031", "103031019", "story_v_out_103031.awb") / 1000

					if var_78_9 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_9 + var_78_1
					end

					if var_78_4.prefab_name ~= "" and arg_75_1.actors_[var_78_4.prefab_name] ~= nil then
						local var_78_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_4.prefab_name].transform, "story_v_out_103031", "103031019", "story_v_out_103031.awb")

						arg_75_1:RecordAudio("103031019", var_78_10)
						arg_75_1:RecordAudio("103031019", var_78_10)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_103031", "103031019", "story_v_out_103031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_103031", "103031019", "story_v_out_103031.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_11 = math.max(var_78_2, arg_75_1.talkMaxDuration)

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_11 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_1) / var_78_11

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_1 + var_78_11 and arg_75_1.time_ < var_78_1 + var_78_11 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play103031020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 103031020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play103031021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1019ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1019ui_story == nil then
				arg_79_1.var_.characterEffect1019ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.1

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1019ui_story then
					arg_79_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1019ui_story then
				arg_79_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["4010ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect4010ui_story == nil then
				arg_79_1.var_.characterEffect4010ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.1

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect4010ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_79_1.var_.characterEffect4010ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect4010ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_79_1.var_.characterEffect4010ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0
			local var_82_11 = 0.875

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_12 = arg_79_1:FormatText(StoryNameCfg[7].name)

				arg_79_1.leftNameTxt_.text = var_82_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_13 = arg_79_1:GetWordFromCfg(103031020)
				local var_82_14 = arg_79_1:FormatText(var_82_13.content)

				arg_79_1.text_.text = var_82_14

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_15 = 35
				local var_82_16 = utf8.len(var_82_14)
				local var_82_17 = var_82_15 <= 0 and var_82_11 or var_82_11 * (var_82_16 / var_82_15)

				if var_82_17 > 0 and var_82_11 < var_82_17 then
					arg_79_1.talkMaxDuration = var_82_17

					if var_82_17 + var_82_10 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_17 + var_82_10
					end
				end

				arg_79_1.text_.text = var_82_14
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_18 = math.max(var_82_11, arg_79_1.talkMaxDuration)

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_18 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_10) / var_82_18

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_10 + var_82_18 and arg_79_1.time_ < var_82_10 + var_82_18 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play103031021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 103031021
		arg_83_1.duration_ = 9.166

		local var_83_0 = {
			ja = 9.166,
			ko = 6.7,
			zh = 7.533,
			en = 7.5
		}
		local var_83_1 = manager.audio:GetLocalizationFlag()

		if var_83_0[var_83_1] ~= nil then
			arg_83_1.duration_ = var_83_0[var_83_1]
		end

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play103031022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_1 = 0
			local var_86_2 = 0.925

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_3 = arg_83_1:FormatText(StoryNameCfg[13].name)

				arg_83_1.leftNameTxt_.text = var_86_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_4 = arg_83_1:GetWordFromCfg(103031021)
				local var_86_5 = arg_83_1:FormatText(var_86_4.content)

				arg_83_1.text_.text = var_86_5

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_6 = 37
				local var_86_7 = utf8.len(var_86_5)
				local var_86_8 = var_86_6 <= 0 and var_86_2 or var_86_2 * (var_86_7 / var_86_6)

				if var_86_8 > 0 and var_86_2 < var_86_8 then
					arg_83_1.talkMaxDuration = var_86_8

					if var_86_8 + var_86_1 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_1
					end
				end

				arg_83_1.text_.text = var_86_5
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031021", "story_v_out_103031.awb") ~= 0 then
					local var_86_9 = manager.audio:GetVoiceLength("story_v_out_103031", "103031021", "story_v_out_103031.awb") / 1000

					if var_86_9 + var_86_1 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_1
					end

					if var_86_4.prefab_name ~= "" and arg_83_1.actors_[var_86_4.prefab_name] ~= nil then
						local var_86_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_4.prefab_name].transform, "story_v_out_103031", "103031021", "story_v_out_103031.awb")

						arg_83_1:RecordAudio("103031021", var_86_10)
						arg_83_1:RecordAudio("103031021", var_86_10)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_103031", "103031021", "story_v_out_103031.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_103031", "103031021", "story_v_out_103031.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_11 = math.max(var_86_2, arg_83_1.talkMaxDuration)

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_11 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_1) / var_86_11

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_1 + var_86_11 and arg_83_1.time_ < var_86_1 + var_86_11 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play103031022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 103031022
		arg_87_1.duration_ = 5.8

		local var_87_0 = {
			ja = 5.8,
			ko = 3.6,
			zh = 3,
			en = 2.8
		}
		local var_87_1 = manager.audio:GetLocalizationFlag()

		if var_87_0[var_87_1] ~= nil then
			arg_87_1.duration_ = var_87_0[var_87_1]
		end

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play103031023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["4010ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos4010ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos4010ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1011ui_story"].transform
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.var_.moveOldPos1011ui_story = var_90_9.localPosition
			end

			local var_90_11 = 0.001

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11
				local var_90_13 = Vector3.New(0, 100, 0)

				var_90_9.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1011ui_story, var_90_13, var_90_12)

				local var_90_14 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_14.x, var_90_14.y, var_90_14.z)

				local var_90_15 = var_90_9.localEulerAngles

				var_90_15.z = 0
				var_90_15.x = 0
				var_90_9.localEulerAngles = var_90_15
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 then
				var_90_9.localPosition = Vector3.New(0, 100, 0)

				local var_90_16 = manager.ui.mainCamera.transform.position - var_90_9.position

				var_90_9.forward = Vector3.New(var_90_16.x, var_90_16.y, var_90_16.z)

				local var_90_17 = var_90_9.localEulerAngles

				var_90_17.z = 0
				var_90_17.x = 0
				var_90_9.localEulerAngles = var_90_17
			end

			local var_90_18 = arg_87_1.actors_["1019ui_story"].transform
			local var_90_19 = 0

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.var_.moveOldPos1019ui_story = var_90_18.localPosition
			end

			local var_90_20 = 0.001

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_20 then
				local var_90_21 = (arg_87_1.time_ - var_90_19) / var_90_20
				local var_90_22 = Vector3.New(0, -1.08, -5.9)

				var_90_18.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1019ui_story, var_90_22, var_90_21)

				local var_90_23 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_23.x, var_90_23.y, var_90_23.z)

				local var_90_24 = var_90_18.localEulerAngles

				var_90_24.z = 0
				var_90_24.x = 0
				var_90_18.localEulerAngles = var_90_24
			end

			if arg_87_1.time_ >= var_90_19 + var_90_20 and arg_87_1.time_ < var_90_19 + var_90_20 + arg_90_0 then
				var_90_18.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_90_25 = manager.ui.mainCamera.transform.position - var_90_18.position

				var_90_18.forward = Vector3.New(var_90_25.x, var_90_25.y, var_90_25.z)

				local var_90_26 = var_90_18.localEulerAngles

				var_90_26.z = 0
				var_90_26.x = 0
				var_90_18.localEulerAngles = var_90_26
			end

			local var_90_27 = 0

			if var_90_27 < arg_87_1.time_ and arg_87_1.time_ <= var_90_27 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action4_1")
			end

			local var_90_28 = 0

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_29 = 0
			local var_90_30 = 0.325

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_31 = arg_87_1:FormatText(StoryNameCfg[13].name)

				arg_87_1.leftNameTxt_.text = var_90_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_32 = arg_87_1:GetWordFromCfg(103031022)
				local var_90_33 = arg_87_1:FormatText(var_90_32.content)

				arg_87_1.text_.text = var_90_33

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_34 = 13
				local var_90_35 = utf8.len(var_90_33)
				local var_90_36 = var_90_34 <= 0 and var_90_30 or var_90_30 * (var_90_35 / var_90_34)

				if var_90_36 > 0 and var_90_30 < var_90_36 then
					arg_87_1.talkMaxDuration = var_90_36

					if var_90_36 + var_90_29 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_36 + var_90_29
					end
				end

				arg_87_1.text_.text = var_90_33
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031022", "story_v_out_103031.awb") ~= 0 then
					local var_90_37 = manager.audio:GetVoiceLength("story_v_out_103031", "103031022", "story_v_out_103031.awb") / 1000

					if var_90_37 + var_90_29 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_37 + var_90_29
					end

					if var_90_32.prefab_name ~= "" and arg_87_1.actors_[var_90_32.prefab_name] ~= nil then
						local var_90_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_32.prefab_name].transform, "story_v_out_103031", "103031022", "story_v_out_103031.awb")

						arg_87_1:RecordAudio("103031022", var_90_38)
						arg_87_1:RecordAudio("103031022", var_90_38)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_103031", "103031022", "story_v_out_103031.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_103031", "103031022", "story_v_out_103031.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_39 = math.max(var_90_30, arg_87_1.talkMaxDuration)

			if var_90_29 <= arg_87_1.time_ and arg_87_1.time_ < var_90_29 + var_90_39 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_29) / var_90_39

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_29 + var_90_39 and arg_87_1.time_ < var_90_29 + var_90_39 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play103031023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 103031023
		arg_91_1.duration_ = 5.133

		local var_91_0 = {
			ja = 5.133,
			ko = 3.466,
			zh = 3.6,
			en = 3.066
		}
		local var_91_1 = manager.audio:GetLocalizationFlag()

		if var_91_0[var_91_1] ~= nil then
			arg_91_1.duration_ = var_91_0[var_91_1]
		end

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play103031024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["4010ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect4010ui_story == nil then
				arg_91_1.var_.characterEffect4010ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.1

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect4010ui_story then
					arg_91_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect4010ui_story then
				arg_91_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1019ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story == nil then
				arg_91_1.var_.characterEffect1019ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.1

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1019ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1019ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1019ui_story.fillRatio = var_94_9
			end

			local var_94_10 = arg_91_1.actors_["1019ui_story"].transform
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1.var_.moveOldPos1019ui_story = var_94_10.localPosition
			end

			local var_94_12 = 0.5

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_12 then
				local var_94_13 = (arg_91_1.time_ - var_94_11) / var_94_12
				local var_94_14 = Vector3.New(-0.7, -1.08, -5.9)

				var_94_10.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1019ui_story, var_94_14, var_94_13)

				local var_94_15 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_15.x, var_94_15.y, var_94_15.z)

				local var_94_16 = var_94_10.localEulerAngles

				var_94_16.z = 0
				var_94_16.x = 0
				var_94_10.localEulerAngles = var_94_16
			end

			if arg_91_1.time_ >= var_94_11 + var_94_12 and arg_91_1.time_ < var_94_11 + var_94_12 + arg_94_0 then
				var_94_10.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_94_17 = manager.ui.mainCamera.transform.position - var_94_10.position

				var_94_10.forward = Vector3.New(var_94_17.x, var_94_17.y, var_94_17.z)

				local var_94_18 = var_94_10.localEulerAngles

				var_94_18.z = 0
				var_94_18.x = 0
				var_94_10.localEulerAngles = var_94_18
			end

			local var_94_19 = arg_91_1.actors_["4010ui_story"].transform
			local var_94_20 = 0

			if var_94_20 < arg_91_1.time_ and arg_91_1.time_ <= var_94_20 + arg_94_0 then
				arg_91_1.var_.moveOldPos4010ui_story = var_94_19.localPosition
			end

			local var_94_21 = 0.001

			if var_94_20 <= arg_91_1.time_ and arg_91_1.time_ < var_94_20 + var_94_21 then
				local var_94_22 = (arg_91_1.time_ - var_94_20) / var_94_21
				local var_94_23 = Vector3.New(0.7, -1.59, -5.2)

				var_94_19.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos4010ui_story, var_94_23, var_94_22)

				local var_94_24 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_24.x, var_94_24.y, var_94_24.z)

				local var_94_25 = var_94_19.localEulerAngles

				var_94_25.z = 0
				var_94_25.x = 0
				var_94_19.localEulerAngles = var_94_25
			end

			if arg_91_1.time_ >= var_94_20 + var_94_21 and arg_91_1.time_ < var_94_20 + var_94_21 + arg_94_0 then
				var_94_19.localPosition = Vector3.New(0.7, -1.59, -5.2)

				local var_94_26 = manager.ui.mainCamera.transform.position - var_94_19.position

				var_94_19.forward = Vector3.New(var_94_26.x, var_94_26.y, var_94_26.z)

				local var_94_27 = var_94_19.localEulerAngles

				var_94_27.z = 0
				var_94_27.x = 0
				var_94_19.localEulerAngles = var_94_27
			end

			local var_94_28 = 0

			if var_94_28 < arg_91_1.time_ and arg_91_1.time_ <= var_94_28 + arg_94_0 then
				arg_91_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_94_29 = 0

			if var_94_29 < arg_91_1.time_ and arg_91_1.time_ <= var_94_29 + arg_94_0 then
				arg_91_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_94_30 = 0
			local var_94_31 = 0.275

			if var_94_30 < arg_91_1.time_ and arg_91_1.time_ <= var_94_30 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_32 = arg_91_1:FormatText(StoryNameCfg[42].name)

				arg_91_1.leftNameTxt_.text = var_94_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_33 = arg_91_1:GetWordFromCfg(103031023)
				local var_94_34 = arg_91_1:FormatText(var_94_33.content)

				arg_91_1.text_.text = var_94_34

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_35 = 11
				local var_94_36 = utf8.len(var_94_34)
				local var_94_37 = var_94_35 <= 0 and var_94_31 or var_94_31 * (var_94_36 / var_94_35)

				if var_94_37 > 0 and var_94_31 < var_94_37 then
					arg_91_1.talkMaxDuration = var_94_37

					if var_94_37 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_37 + var_94_30
					end
				end

				arg_91_1.text_.text = var_94_34
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031023", "story_v_out_103031.awb") ~= 0 then
					local var_94_38 = manager.audio:GetVoiceLength("story_v_out_103031", "103031023", "story_v_out_103031.awb") / 1000

					if var_94_38 + var_94_30 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_38 + var_94_30
					end

					if var_94_33.prefab_name ~= "" and arg_91_1.actors_[var_94_33.prefab_name] ~= nil then
						local var_94_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_33.prefab_name].transform, "story_v_out_103031", "103031023", "story_v_out_103031.awb")

						arg_91_1:RecordAudio("103031023", var_94_39)
						arg_91_1:RecordAudio("103031023", var_94_39)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_103031", "103031023", "story_v_out_103031.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_103031", "103031023", "story_v_out_103031.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_40 = math.max(var_94_31, arg_91_1.talkMaxDuration)

			if var_94_30 <= arg_91_1.time_ and arg_91_1.time_ < var_94_30 + var_94_40 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_30) / var_94_40

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_30 + var_94_40 and arg_91_1.time_ < var_94_30 + var_94_40 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play103031024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 103031024
		arg_95_1.duration_ = 7.7

		local var_95_0 = {
			ja = 7.7,
			ko = 5.4,
			zh = 5.633,
			en = 7.233
		}
		local var_95_1 = manager.audio:GetLocalizationFlag()

		if var_95_0[var_95_1] ~= nil then
			arg_95_1.duration_ = var_95_0[var_95_1]
		end

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play103031025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["3008ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect3008ui_story == nil then
				arg_95_1.var_.characterEffect3008ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.1

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect3008ui_story then
					arg_95_1.var_.characterEffect3008ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect3008ui_story then
				arg_95_1.var_.characterEffect3008ui_story.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["4010ui_story"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect4010ui_story == nil then
				arg_95_1.var_.characterEffect4010ui_story = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.1

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect4010ui_story then
					local var_98_8 = Mathf.Lerp(0, 0.5, var_98_7)

					arg_95_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_95_1.var_.characterEffect4010ui_story.fillRatio = var_98_8
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect4010ui_story then
				local var_98_9 = 0.5

				arg_95_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_95_1.var_.characterEffect4010ui_story.fillRatio = var_98_9
			end

			local var_98_10 = 0
			local var_98_11 = 0.575

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_12 = arg_95_1:FormatText(StoryNameCfg[20].name)

				arg_95_1.leftNameTxt_.text = var_98_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3008")

				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_13 = arg_95_1:GetWordFromCfg(103031024)
				local var_98_14 = arg_95_1:FormatText(var_98_13.content)

				arg_95_1.text_.text = var_98_14

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_15 = 23
				local var_98_16 = utf8.len(var_98_14)
				local var_98_17 = var_98_15 <= 0 and var_98_11 or var_98_11 * (var_98_16 / var_98_15)

				if var_98_17 > 0 and var_98_11 < var_98_17 then
					arg_95_1.talkMaxDuration = var_98_17

					if var_98_17 + var_98_10 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_17 + var_98_10
					end
				end

				arg_95_1.text_.text = var_98_14
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031024", "story_v_out_103031.awb") ~= 0 then
					local var_98_18 = manager.audio:GetVoiceLength("story_v_out_103031", "103031024", "story_v_out_103031.awb") / 1000

					if var_98_18 + var_98_10 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_18 + var_98_10
					end

					if var_98_13.prefab_name ~= "" and arg_95_1.actors_[var_98_13.prefab_name] ~= nil then
						local var_98_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_13.prefab_name].transform, "story_v_out_103031", "103031024", "story_v_out_103031.awb")

						arg_95_1:RecordAudio("103031024", var_98_19)
						arg_95_1:RecordAudio("103031024", var_98_19)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_103031", "103031024", "story_v_out_103031.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_103031", "103031024", "story_v_out_103031.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_20 = math.max(var_98_11, arg_95_1.talkMaxDuration)

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_20 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_10) / var_98_20

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_10 + var_98_20 and arg_95_1.time_ < var_98_10 + var_98_20 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play103031025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 103031025
		arg_99_1.duration_ = 6.066

		local var_99_0 = {
			ja = 6.066,
			ko = 3.633,
			zh = 2.833,
			en = 2.7
		}
		local var_99_1 = manager.audio:GetLocalizationFlag()

		if var_99_0[var_99_1] ~= nil then
			arg_99_1.duration_ = var_99_0[var_99_1]
		end

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play103031026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1019ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1019ui_story == nil then
				arg_99_1.var_.characterEffect1019ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.1

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1019ui_story then
					arg_99_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1019ui_story then
				arg_99_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["3008ui_story"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect3008ui_story == nil then
				arg_99_1.var_.characterEffect3008ui_story = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.1

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect3008ui_story then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect3008ui_story.fillFlat = true
					arg_99_1.var_.characterEffect3008ui_story.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect3008ui_story then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect3008ui_story.fillFlat = true
				arg_99_1.var_.characterEffect3008ui_story.fillRatio = var_102_9
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action445")
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_102_12 = 0
			local var_102_13 = 0.375

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[13].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(103031025)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 15
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031025", "story_v_out_103031.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_103031", "103031025", "story_v_out_103031.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_103031", "103031025", "story_v_out_103031.awb")

						arg_99_1:RecordAudio("103031025", var_102_21)
						arg_99_1:RecordAudio("103031025", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_103031", "103031025", "story_v_out_103031.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_103031", "103031025", "story_v_out_103031.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play103031026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 103031026
		arg_103_1.duration_ = 5.1

		local var_103_0 = {
			ja = 4.7,
			ko = 3.966,
			zh = 3.6,
			en = 5.1
		}
		local var_103_1 = manager.audio:GetLocalizationFlag()

		if var_103_0[var_103_1] ~= nil then
			arg_103_1.duration_ = var_103_0[var_103_1]
		end

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play103031027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["4010ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect4010ui_story == nil then
				arg_103_1.var_.characterEffect4010ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.1

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect4010ui_story then
					arg_103_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect4010ui_story then
				arg_103_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["1019ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect1019ui_story == nil then
				arg_103_1.var_.characterEffect1019ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.1

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect1019ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1019ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect1019ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1019ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_106_11 = 0
			local var_106_12 = 0.35

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_13 = arg_103_1:FormatText(StoryNameCfg[42].name)

				arg_103_1.leftNameTxt_.text = var_106_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_14 = arg_103_1:GetWordFromCfg(103031026)
				local var_106_15 = arg_103_1:FormatText(var_106_14.content)

				arg_103_1.text_.text = var_106_15

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_16 = 14
				local var_106_17 = utf8.len(var_106_15)
				local var_106_18 = var_106_16 <= 0 and var_106_12 or var_106_12 * (var_106_17 / var_106_16)

				if var_106_18 > 0 and var_106_12 < var_106_18 then
					arg_103_1.talkMaxDuration = var_106_18

					if var_106_18 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_11
					end
				end

				arg_103_1.text_.text = var_106_15
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031026", "story_v_out_103031.awb") ~= 0 then
					local var_106_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031026", "story_v_out_103031.awb") / 1000

					if var_106_19 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_11
					end

					if var_106_14.prefab_name ~= "" and arg_103_1.actors_[var_106_14.prefab_name] ~= nil then
						local var_106_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_14.prefab_name].transform, "story_v_out_103031", "103031026", "story_v_out_103031.awb")

						arg_103_1:RecordAudio("103031026", var_106_20)
						arg_103_1:RecordAudio("103031026", var_106_20)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_103031", "103031026", "story_v_out_103031.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_103031", "103031026", "story_v_out_103031.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_21 = math.max(var_106_12, arg_103_1.talkMaxDuration)

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_21 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_11) / var_106_21

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_11 + var_106_21 and arg_103_1.time_ < var_106_11 + var_106_21 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play103031027 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 103031027
		arg_107_1.duration_ = 1.066

		local var_107_0 = {
			ja = 1.066,
			ko = 1,
			zh = 0.999999999999,
			en = 0.999999999999
		}
		local var_107_1 = manager.audio:GetLocalizationFlag()

		if var_107_0[var_107_1] ~= nil then
			arg_107_1.duration_ = var_107_0[var_107_1]
		end

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play103031028(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1019ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1019ui_story == nil then
				arg_107_1.var_.characterEffect1019ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.1

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1019ui_story then
					arg_107_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1019ui_story then
				arg_107_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["4010ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect4010ui_story == nil then
				arg_107_1.var_.characterEffect4010ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.1

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect4010ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_107_1.var_.characterEffect4010ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect4010ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_107_1.var_.characterEffect4010ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_110_11 = 0
			local var_110_12 = 0.05

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_13 = arg_107_1:FormatText(StoryNameCfg[13].name)

				arg_107_1.leftNameTxt_.text = var_110_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_14 = arg_107_1:GetWordFromCfg(103031027)
				local var_110_15 = arg_107_1:FormatText(var_110_14.content)

				arg_107_1.text_.text = var_110_15

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_16 = 2
				local var_110_17 = utf8.len(var_110_15)
				local var_110_18 = var_110_16 <= 0 and var_110_12 or var_110_12 * (var_110_17 / var_110_16)

				if var_110_18 > 0 and var_110_12 < var_110_18 then
					arg_107_1.talkMaxDuration = var_110_18

					if var_110_18 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_18 + var_110_11
					end
				end

				arg_107_1.text_.text = var_110_15
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031027", "story_v_out_103031.awb") ~= 0 then
					local var_110_19 = manager.audio:GetVoiceLength("story_v_out_103031", "103031027", "story_v_out_103031.awb") / 1000

					if var_110_19 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_11
					end

					if var_110_14.prefab_name ~= "" and arg_107_1.actors_[var_110_14.prefab_name] ~= nil then
						local var_110_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_14.prefab_name].transform, "story_v_out_103031", "103031027", "story_v_out_103031.awb")

						arg_107_1:RecordAudio("103031027", var_110_20)
						arg_107_1:RecordAudio("103031027", var_110_20)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_103031", "103031027", "story_v_out_103031.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_103031", "103031027", "story_v_out_103031.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_21 = math.max(var_110_12, arg_107_1.talkMaxDuration)

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_21 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_11) / var_110_21

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_11 + var_110_21 and arg_107_1.time_ < var_110_11 + var_110_21 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play103031028 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 103031028
		arg_111_1.duration_ = 4.866

		local var_111_0 = {
			ja = 4.7,
			ko = 4,
			zh = 4.2,
			en = 4.866
		}
		local var_111_1 = manager.audio:GetLocalizationFlag()

		if var_111_0[var_111_1] ~= nil then
			arg_111_1.duration_ = var_111_0[var_111_1]
		end

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play103031029(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = "2020_tpose"

			if arg_111_1.actors_[var_114_0] == nil then
				local var_114_1 = Object.Instantiate(Asset.Load("Char/" .. var_114_0), arg_111_1.stage_.transform)

				var_114_1.name = var_114_0
				var_114_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.actors_[var_114_0] = var_114_1

				local var_114_2 = var_114_1:GetComponentInChildren(typeof(CharacterEffect))

				var_114_2.enabled = true

				local var_114_3 = GameObjectTools.GetOrAddComponent(var_114_1, typeof(DynamicBoneHelper))

				if var_114_3 then
					var_114_3:EnableDynamicBone(false)
				end

				arg_111_1:ShowWeapon(var_114_2.transform, false)

				arg_111_1.var_[var_114_0 .. "Animator"] = var_114_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_111_1.var_[var_114_0 .. "Animator"].applyRootMotion = true
				arg_111_1.var_[var_114_0 .. "LipSync"] = var_114_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_114_4 = arg_111_1.actors_["2020_tpose"]
			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 and arg_111_1.var_.characterEffect2020_tpose == nil then
				arg_111_1.var_.characterEffect2020_tpose = var_114_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_6 = 0.1

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_6 then
				local var_114_7 = (arg_111_1.time_ - var_114_5) / var_114_6

				if arg_111_1.var_.characterEffect2020_tpose then
					arg_111_1.var_.characterEffect2020_tpose.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_5 + var_114_6 and arg_111_1.time_ < var_114_5 + var_114_6 + arg_114_0 and arg_111_1.var_.characterEffect2020_tpose then
				arg_111_1.var_.characterEffect2020_tpose.fillFlat = false
			end

			local var_114_8 = arg_111_1.actors_["1019ui_story"]
			local var_114_9 = 0

			if var_114_9 < arg_111_1.time_ and arg_111_1.time_ <= var_114_9 + arg_114_0 and arg_111_1.var_.characterEffect1019ui_story == nil then
				arg_111_1.var_.characterEffect1019ui_story = var_114_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_10 = 0.1

			if var_114_9 <= arg_111_1.time_ and arg_111_1.time_ < var_114_9 + var_114_10 then
				local var_114_11 = (arg_111_1.time_ - var_114_9) / var_114_10

				if arg_111_1.var_.characterEffect1019ui_story then
					local var_114_12 = Mathf.Lerp(0, 0.5, var_114_11)

					arg_111_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1019ui_story.fillRatio = var_114_12
				end
			end

			if arg_111_1.time_ >= var_114_9 + var_114_10 and arg_111_1.time_ < var_114_9 + var_114_10 + arg_114_0 and arg_111_1.var_.characterEffect1019ui_story then
				local var_114_13 = 0.5

				arg_111_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1019ui_story.fillRatio = var_114_13
			end

			local var_114_14 = arg_111_1.actors_["1019ui_story"].transform
			local var_114_15 = 0

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				arg_111_1.var_.moveOldPos1019ui_story = var_114_14.localPosition
			end

			local var_114_16 = 0.001

			if var_114_15 <= arg_111_1.time_ and arg_111_1.time_ < var_114_15 + var_114_16 then
				local var_114_17 = (arg_111_1.time_ - var_114_15) / var_114_16
				local var_114_18 = Vector3.New(0, 100, 0)

				var_114_14.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1019ui_story, var_114_18, var_114_17)

				local var_114_19 = manager.ui.mainCamera.transform.position - var_114_14.position

				var_114_14.forward = Vector3.New(var_114_19.x, var_114_19.y, var_114_19.z)

				local var_114_20 = var_114_14.localEulerAngles

				var_114_20.z = 0
				var_114_20.x = 0
				var_114_14.localEulerAngles = var_114_20
			end

			if arg_111_1.time_ >= var_114_15 + var_114_16 and arg_111_1.time_ < var_114_15 + var_114_16 + arg_114_0 then
				var_114_14.localPosition = Vector3.New(0, 100, 0)

				local var_114_21 = manager.ui.mainCamera.transform.position - var_114_14.position

				var_114_14.forward = Vector3.New(var_114_21.x, var_114_21.y, var_114_21.z)

				local var_114_22 = var_114_14.localEulerAngles

				var_114_22.z = 0
				var_114_22.x = 0
				var_114_14.localEulerAngles = var_114_22
			end

			local var_114_23 = arg_111_1.actors_["4010ui_story"].transform
			local var_114_24 = 0

			if var_114_24 < arg_111_1.time_ and arg_111_1.time_ <= var_114_24 + arg_114_0 then
				arg_111_1.var_.moveOldPos4010ui_story = var_114_23.localPosition
			end

			local var_114_25 = 0.001

			if var_114_24 <= arg_111_1.time_ and arg_111_1.time_ < var_114_24 + var_114_25 then
				local var_114_26 = (arg_111_1.time_ - var_114_24) / var_114_25
				local var_114_27 = Vector3.New(0, 100, 0)

				var_114_23.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos4010ui_story, var_114_27, var_114_26)

				local var_114_28 = manager.ui.mainCamera.transform.position - var_114_23.position

				var_114_23.forward = Vector3.New(var_114_28.x, var_114_28.y, var_114_28.z)

				local var_114_29 = var_114_23.localEulerAngles

				var_114_29.z = 0
				var_114_29.x = 0
				var_114_23.localEulerAngles = var_114_29
			end

			if arg_111_1.time_ >= var_114_24 + var_114_25 and arg_111_1.time_ < var_114_24 + var_114_25 + arg_114_0 then
				var_114_23.localPosition = Vector3.New(0, 100, 0)

				local var_114_30 = manager.ui.mainCamera.transform.position - var_114_23.position

				var_114_23.forward = Vector3.New(var_114_30.x, var_114_30.y, var_114_30.z)

				local var_114_31 = var_114_23.localEulerAngles

				var_114_31.z = 0
				var_114_31.x = 0
				var_114_23.localEulerAngles = var_114_31
			end

			local var_114_32 = arg_111_1.actors_["2020_tpose"].transform
			local var_114_33 = 0

			if var_114_33 < arg_111_1.time_ and arg_111_1.time_ <= var_114_33 + arg_114_0 then
				arg_111_1.var_.moveOldPos2020_tpose = var_114_32.localPosition
			end

			local var_114_34 = 0.001

			if var_114_33 <= arg_111_1.time_ and arg_111_1.time_ < var_114_33 + var_114_34 then
				local var_114_35 = (arg_111_1.time_ - var_114_33) / var_114_34
				local var_114_36 = Vector3.New(-0.7, -1.2, -4.1)

				var_114_32.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos2020_tpose, var_114_36, var_114_35)

				local var_114_37 = manager.ui.mainCamera.transform.position - var_114_32.position

				var_114_32.forward = Vector3.New(var_114_37.x, var_114_37.y, var_114_37.z)

				local var_114_38 = var_114_32.localEulerAngles

				var_114_38.z = 0
				var_114_38.x = 0
				var_114_32.localEulerAngles = var_114_38
			end

			if arg_111_1.time_ >= var_114_33 + var_114_34 and arg_111_1.time_ < var_114_33 + var_114_34 + arg_114_0 then
				var_114_32.localPosition = Vector3.New(-0.7, -1.2, -4.1)

				local var_114_39 = manager.ui.mainCamera.transform.position - var_114_32.position

				var_114_32.forward = Vector3.New(var_114_39.x, var_114_39.y, var_114_39.z)

				local var_114_40 = var_114_32.localEulerAngles

				var_114_40.z = 0
				var_114_40.x = 0
				var_114_32.localEulerAngles = var_114_40
			end

			local var_114_41 = 0

			if var_114_41 < arg_111_1.time_ and arg_111_1.time_ <= var_114_41 + arg_114_0 then
				arg_111_1:PlayTimeline("2020_tpose", "StoryTimeline/CharAction/story2020/story2020action/2020action1_1")
			end

			local var_114_42 = 0
			local var_114_43 = 0.45

			if var_114_42 < arg_111_1.time_ and arg_111_1.time_ <= var_114_42 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_44 = arg_111_1:FormatText(StoryNameCfg[34].name)

				arg_111_1.leftNameTxt_.text = var_114_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_45 = arg_111_1:GetWordFromCfg(103031028)
				local var_114_46 = arg_111_1:FormatText(var_114_45.content)

				arg_111_1.text_.text = var_114_46

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_47 = 18
				local var_114_48 = utf8.len(var_114_46)
				local var_114_49 = var_114_47 <= 0 and var_114_43 or var_114_43 * (var_114_48 / var_114_47)

				if var_114_49 > 0 and var_114_43 < var_114_49 then
					arg_111_1.talkMaxDuration = var_114_49

					if var_114_49 + var_114_42 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_49 + var_114_42
					end
				end

				arg_111_1.text_.text = var_114_46
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031028", "story_v_out_103031.awb") ~= 0 then
					local var_114_50 = manager.audio:GetVoiceLength("story_v_out_103031", "103031028", "story_v_out_103031.awb") / 1000

					if var_114_50 + var_114_42 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_50 + var_114_42
					end

					if var_114_45.prefab_name ~= "" and arg_111_1.actors_[var_114_45.prefab_name] ~= nil then
						local var_114_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_45.prefab_name].transform, "story_v_out_103031", "103031028", "story_v_out_103031.awb")

						arg_111_1:RecordAudio("103031028", var_114_51)
						arg_111_1:RecordAudio("103031028", var_114_51)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_103031", "103031028", "story_v_out_103031.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_103031", "103031028", "story_v_out_103031.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_52 = math.max(var_114_43, arg_111_1.talkMaxDuration)

			if var_114_42 <= arg_111_1.time_ and arg_111_1.time_ < var_114_42 + var_114_52 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_42) / var_114_52

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_42 + var_114_52 and arg_111_1.time_ < var_114_42 + var_114_52 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play103031029 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 103031029
		arg_115_1.duration_ = 4.266

		local var_115_0 = {
			ja = 3.166,
			ko = 4,
			zh = 4.133,
			en = 4.266
		}
		local var_115_1 = manager.audio:GetLocalizationFlag()

		if var_115_0[var_115_1] ~= nil then
			arg_115_1.duration_ = var_115_0[var_115_1]
		end

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play103031030(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = "2030_tpose"

			if arg_115_1.actors_[var_118_0] == nil then
				local var_118_1 = Object.Instantiate(Asset.Load("Char/" .. var_118_0), arg_115_1.stage_.transform)

				var_118_1.name = var_118_0
				var_118_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_115_1.actors_[var_118_0] = var_118_1

				local var_118_2 = var_118_1:GetComponentInChildren(typeof(CharacterEffect))

				var_118_2.enabled = true

				local var_118_3 = GameObjectTools.GetOrAddComponent(var_118_1, typeof(DynamicBoneHelper))

				if var_118_3 then
					var_118_3:EnableDynamicBone(false)
				end

				arg_115_1:ShowWeapon(var_118_2.transform, false)

				arg_115_1.var_[var_118_0 .. "Animator"] = var_118_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_115_1.var_[var_118_0 .. "Animator"].applyRootMotion = true
				arg_115_1.var_[var_118_0 .. "LipSync"] = var_118_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_118_4 = arg_115_1.actors_["2030_tpose"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect2030_tpose == nil then
				arg_115_1.var_.characterEffect2030_tpose = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.1

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect2030_tpose then
					arg_115_1.var_.characterEffect2030_tpose.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect2030_tpose then
				arg_115_1.var_.characterEffect2030_tpose.fillFlat = false
			end

			local var_118_8 = arg_115_1.actors_["2020_tpose"]
			local var_118_9 = 0

			if var_118_9 < arg_115_1.time_ and arg_115_1.time_ <= var_118_9 + arg_118_0 and arg_115_1.var_.characterEffect2020_tpose == nil then
				arg_115_1.var_.characterEffect2020_tpose = var_118_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_10 = 0.1

			if var_118_9 <= arg_115_1.time_ and arg_115_1.time_ < var_118_9 + var_118_10 then
				local var_118_11 = (arg_115_1.time_ - var_118_9) / var_118_10

				if arg_115_1.var_.characterEffect2020_tpose then
					local var_118_12 = Mathf.Lerp(0, 0.5, var_118_11)

					arg_115_1.var_.characterEffect2020_tpose.fillFlat = true
					arg_115_1.var_.characterEffect2020_tpose.fillRatio = var_118_12
				end
			end

			if arg_115_1.time_ >= var_118_9 + var_118_10 and arg_115_1.time_ < var_118_9 + var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect2020_tpose then
				local var_118_13 = 0.5

				arg_115_1.var_.characterEffect2020_tpose.fillFlat = true
				arg_115_1.var_.characterEffect2020_tpose.fillRatio = var_118_13
			end

			local var_118_14 = arg_115_1.actors_["2030_tpose"].transform
			local var_118_15 = 0

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				arg_115_1.var_.moveOldPos2030_tpose = var_118_14.localPosition
			end

			local var_118_16 = 0.001

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_15) / var_118_16
				local var_118_18 = Vector3.New(0.7, -1.2, -4.2)

				var_118_14.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos2030_tpose, var_118_18, var_118_17)

				local var_118_19 = manager.ui.mainCamera.transform.position - var_118_14.position

				var_118_14.forward = Vector3.New(var_118_19.x, var_118_19.y, var_118_19.z)

				local var_118_20 = var_118_14.localEulerAngles

				var_118_20.z = 0
				var_118_20.x = 0
				var_118_14.localEulerAngles = var_118_20
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 then
				var_118_14.localPosition = Vector3.New(0.7, -1.2, -4.2)

				local var_118_21 = manager.ui.mainCamera.transform.position - var_118_14.position

				var_118_14.forward = Vector3.New(var_118_21.x, var_118_21.y, var_118_21.z)

				local var_118_22 = var_118_14.localEulerAngles

				var_118_22.z = 0
				var_118_22.x = 0
				var_118_14.localEulerAngles = var_118_22
			end

			local var_118_23 = 0

			if var_118_23 < arg_115_1.time_ and arg_115_1.time_ <= var_118_23 + arg_118_0 then
				arg_115_1:PlayTimeline("2030_tpose", "StoryTimeline/CharAction/story2030/story2030action/2030action1_1")
			end

			local var_118_24 = 0
			local var_118_25 = 0.5

			if var_118_24 < arg_115_1.time_ and arg_115_1.time_ <= var_118_24 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_26 = arg_115_1:FormatText(StoryNameCfg[34].name)

				arg_115_1.leftNameTxt_.text = var_118_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_27 = arg_115_1:GetWordFromCfg(103031029)
				local var_118_28 = arg_115_1:FormatText(var_118_27.content)

				arg_115_1.text_.text = var_118_28

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_29 = 20
				local var_118_30 = utf8.len(var_118_28)
				local var_118_31 = var_118_29 <= 0 and var_118_25 or var_118_25 * (var_118_30 / var_118_29)

				if var_118_31 > 0 and var_118_25 < var_118_31 then
					arg_115_1.talkMaxDuration = var_118_31

					if var_118_31 + var_118_24 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_31 + var_118_24
					end
				end

				arg_115_1.text_.text = var_118_28
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031029", "story_v_out_103031.awb") ~= 0 then
					local var_118_32 = manager.audio:GetVoiceLength("story_v_out_103031", "103031029", "story_v_out_103031.awb") / 1000

					if var_118_32 + var_118_24 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_32 + var_118_24
					end

					if var_118_27.prefab_name ~= "" and arg_115_1.actors_[var_118_27.prefab_name] ~= nil then
						local var_118_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_27.prefab_name].transform, "story_v_out_103031", "103031029", "story_v_out_103031.awb")

						arg_115_1:RecordAudio("103031029", var_118_33)
						arg_115_1:RecordAudio("103031029", var_118_33)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_103031", "103031029", "story_v_out_103031.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_103031", "103031029", "story_v_out_103031.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_34 = math.max(var_118_25, arg_115_1.talkMaxDuration)

			if var_118_24 <= arg_115_1.time_ and arg_115_1.time_ < var_118_24 + var_118_34 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_24) / var_118_34

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_24 + var_118_34 and arg_115_1.time_ < var_118_24 + var_118_34 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play103031030 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 103031030
		arg_119_1.duration_ = 7.833

		local var_119_0 = {
			ja = 7.833,
			ko = 5.666,
			zh = 6.3,
			en = 5.366
		}
		local var_119_1 = manager.audio:GetLocalizationFlag()

		if var_119_0[var_119_1] ~= nil then
			arg_119_1.duration_ = var_119_0[var_119_1]
		end

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play103031031(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["4010ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect4010ui_story == nil then
				arg_119_1.var_.characterEffect4010ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.1

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect4010ui_story then
					arg_119_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect4010ui_story then
				arg_119_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["2030_tpose"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect2030_tpose == nil then
				arg_119_1.var_.characterEffect2030_tpose = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.1

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect2030_tpose then
					local var_122_8 = Mathf.Lerp(0, 0.5, var_122_7)

					arg_119_1.var_.characterEffect2030_tpose.fillFlat = true
					arg_119_1.var_.characterEffect2030_tpose.fillRatio = var_122_8
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect2030_tpose then
				local var_122_9 = 0.5

				arg_119_1.var_.characterEffect2030_tpose.fillFlat = true
				arg_119_1.var_.characterEffect2030_tpose.fillRatio = var_122_9
			end

			local var_122_10 = arg_119_1.actors_["2030_tpose"].transform
			local var_122_11 = 0

			if var_122_11 < arg_119_1.time_ and arg_119_1.time_ <= var_122_11 + arg_122_0 then
				arg_119_1.var_.moveOldPos2030_tpose = var_122_10.localPosition
			end

			local var_122_12 = 0.001

			if var_122_11 <= arg_119_1.time_ and arg_119_1.time_ < var_122_11 + var_122_12 then
				local var_122_13 = (arg_119_1.time_ - var_122_11) / var_122_12
				local var_122_14 = Vector3.New(0, 100, 0)

				var_122_10.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos2030_tpose, var_122_14, var_122_13)

				local var_122_15 = manager.ui.mainCamera.transform.position - var_122_10.position

				var_122_10.forward = Vector3.New(var_122_15.x, var_122_15.y, var_122_15.z)

				local var_122_16 = var_122_10.localEulerAngles

				var_122_16.z = 0
				var_122_16.x = 0
				var_122_10.localEulerAngles = var_122_16
			end

			if arg_119_1.time_ >= var_122_11 + var_122_12 and arg_119_1.time_ < var_122_11 + var_122_12 + arg_122_0 then
				var_122_10.localPosition = Vector3.New(0, 100, 0)

				local var_122_17 = manager.ui.mainCamera.transform.position - var_122_10.position

				var_122_10.forward = Vector3.New(var_122_17.x, var_122_17.y, var_122_17.z)

				local var_122_18 = var_122_10.localEulerAngles

				var_122_18.z = 0
				var_122_18.x = 0
				var_122_10.localEulerAngles = var_122_18
			end

			local var_122_19 = arg_119_1.actors_["2020_tpose"].transform
			local var_122_20 = 0

			if var_122_20 < arg_119_1.time_ and arg_119_1.time_ <= var_122_20 + arg_122_0 then
				arg_119_1.var_.moveOldPos2020_tpose = var_122_19.localPosition
			end

			local var_122_21 = 0.001

			if var_122_20 <= arg_119_1.time_ and arg_119_1.time_ < var_122_20 + var_122_21 then
				local var_122_22 = (arg_119_1.time_ - var_122_20) / var_122_21
				local var_122_23 = Vector3.New(0, 100, 0)

				var_122_19.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos2020_tpose, var_122_23, var_122_22)

				local var_122_24 = manager.ui.mainCamera.transform.position - var_122_19.position

				var_122_19.forward = Vector3.New(var_122_24.x, var_122_24.y, var_122_24.z)

				local var_122_25 = var_122_19.localEulerAngles

				var_122_25.z = 0
				var_122_25.x = 0
				var_122_19.localEulerAngles = var_122_25
			end

			if arg_119_1.time_ >= var_122_20 + var_122_21 and arg_119_1.time_ < var_122_20 + var_122_21 + arg_122_0 then
				var_122_19.localPosition = Vector3.New(0, 100, 0)

				local var_122_26 = manager.ui.mainCamera.transform.position - var_122_19.position

				var_122_19.forward = Vector3.New(var_122_26.x, var_122_26.y, var_122_26.z)

				local var_122_27 = var_122_19.localEulerAngles

				var_122_27.z = 0
				var_122_27.x = 0
				var_122_19.localEulerAngles = var_122_27
			end

			local var_122_28 = arg_119_1.actors_["4010ui_story"].transform
			local var_122_29 = 0

			if var_122_29 < arg_119_1.time_ and arg_119_1.time_ <= var_122_29 + arg_122_0 then
				arg_119_1.var_.moveOldPos4010ui_story = var_122_28.localPosition
			end

			local var_122_30 = 0.001

			if var_122_29 <= arg_119_1.time_ and arg_119_1.time_ < var_122_29 + var_122_30 then
				local var_122_31 = (arg_119_1.time_ - var_122_29) / var_122_30
				local var_122_32 = Vector3.New(0, -1.59, -5.2)

				var_122_28.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos4010ui_story, var_122_32, var_122_31)

				local var_122_33 = manager.ui.mainCamera.transform.position - var_122_28.position

				var_122_28.forward = Vector3.New(var_122_33.x, var_122_33.y, var_122_33.z)

				local var_122_34 = var_122_28.localEulerAngles

				var_122_34.z = 0
				var_122_34.x = 0
				var_122_28.localEulerAngles = var_122_34
			end

			if arg_119_1.time_ >= var_122_29 + var_122_30 and arg_119_1.time_ < var_122_29 + var_122_30 + arg_122_0 then
				var_122_28.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_122_35 = manager.ui.mainCamera.transform.position - var_122_28.position

				var_122_28.forward = Vector3.New(var_122_35.x, var_122_35.y, var_122_35.z)

				local var_122_36 = var_122_28.localEulerAngles

				var_122_36.z = 0
				var_122_36.x = 0
				var_122_28.localEulerAngles = var_122_36
			end

			local var_122_37 = 0

			if var_122_37 < arg_119_1.time_ and arg_119_1.time_ <= var_122_37 + arg_122_0 then
				arg_119_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_122_38 = 0

			if var_122_38 < arg_119_1.time_ and arg_119_1.time_ <= var_122_38 + arg_122_0 then
				arg_119_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_122_39 = 0
			local var_122_40 = 0.575

			if var_122_39 < arg_119_1.time_ and arg_119_1.time_ <= var_122_39 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_41 = arg_119_1:FormatText(StoryNameCfg[42].name)

				arg_119_1.leftNameTxt_.text = var_122_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_42 = arg_119_1:GetWordFromCfg(103031030)
				local var_122_43 = arg_119_1:FormatText(var_122_42.content)

				arg_119_1.text_.text = var_122_43

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_44 = 23
				local var_122_45 = utf8.len(var_122_43)
				local var_122_46 = var_122_44 <= 0 and var_122_40 or var_122_40 * (var_122_45 / var_122_44)

				if var_122_46 > 0 and var_122_40 < var_122_46 then
					arg_119_1.talkMaxDuration = var_122_46

					if var_122_46 + var_122_39 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_46 + var_122_39
					end
				end

				arg_119_1.text_.text = var_122_43
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031030", "story_v_out_103031.awb") ~= 0 then
					local var_122_47 = manager.audio:GetVoiceLength("story_v_out_103031", "103031030", "story_v_out_103031.awb") / 1000

					if var_122_47 + var_122_39 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_47 + var_122_39
					end

					if var_122_42.prefab_name ~= "" and arg_119_1.actors_[var_122_42.prefab_name] ~= nil then
						local var_122_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_42.prefab_name].transform, "story_v_out_103031", "103031030", "story_v_out_103031.awb")

						arg_119_1:RecordAudio("103031030", var_122_48)
						arg_119_1:RecordAudio("103031030", var_122_48)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_103031", "103031030", "story_v_out_103031.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_103031", "103031030", "story_v_out_103031.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_49 = math.max(var_122_40, arg_119_1.talkMaxDuration)

			if var_122_39 <= arg_119_1.time_ and arg_119_1.time_ < var_122_39 + var_122_49 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_39) / var_122_49

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_39 + var_122_49 and arg_119_1.time_ < var_122_39 + var_122_49 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play103031031 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 103031031
		arg_123_1.duration_ = 6.733

		local var_123_0 = {
			ja = 6.733,
			ko = 5.066,
			zh = 6.066,
			en = 6.433
		}
		local var_123_1 = manager.audio:GetLocalizationFlag()

		if var_123_0[var_123_1] ~= nil then
			arg_123_1.duration_ = var_123_0[var_123_1]
		end

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
			arg_123_1.auto_ = false
		end

		function arg_123_1.playNext_(arg_125_0)
			arg_123_1.onStoryFinished_()
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1011ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1011ui_story == nil then
				arg_123_1.var_.characterEffect1011ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.1

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1011ui_story then
					arg_123_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1011ui_story then
				arg_123_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_126_4 = arg_123_1.actors_["4010ui_story"]
			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 and arg_123_1.var_.characterEffect4010ui_story == nil then
				arg_123_1.var_.characterEffect4010ui_story = var_126_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_6 = 0.1

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6

				if arg_123_1.var_.characterEffect4010ui_story then
					local var_126_8 = Mathf.Lerp(0, 0.5, var_126_7)

					arg_123_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_123_1.var_.characterEffect4010ui_story.fillRatio = var_126_8
				end
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 and arg_123_1.var_.characterEffect4010ui_story then
				local var_126_9 = 0.5

				arg_123_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_123_1.var_.characterEffect4010ui_story.fillRatio = var_126_9
			end

			local var_126_10 = arg_123_1.actors_["4010ui_story"].transform
			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1.var_.moveOldPos4010ui_story = var_126_10.localPosition
			end

			local var_126_12 = 0.001

			if var_126_11 <= arg_123_1.time_ and arg_123_1.time_ < var_126_11 + var_126_12 then
				local var_126_13 = (arg_123_1.time_ - var_126_11) / var_126_12
				local var_126_14 = Vector3.New(0, 100, 0)

				var_126_10.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos4010ui_story, var_126_14, var_126_13)

				local var_126_15 = manager.ui.mainCamera.transform.position - var_126_10.position

				var_126_10.forward = Vector3.New(var_126_15.x, var_126_15.y, var_126_15.z)

				local var_126_16 = var_126_10.localEulerAngles

				var_126_16.z = 0
				var_126_16.x = 0
				var_126_10.localEulerAngles = var_126_16
			end

			if arg_123_1.time_ >= var_126_11 + var_126_12 and arg_123_1.time_ < var_126_11 + var_126_12 + arg_126_0 then
				var_126_10.localPosition = Vector3.New(0, 100, 0)

				local var_126_17 = manager.ui.mainCamera.transform.position - var_126_10.position

				var_126_10.forward = Vector3.New(var_126_17.x, var_126_17.y, var_126_17.z)

				local var_126_18 = var_126_10.localEulerAngles

				var_126_18.z = 0
				var_126_18.x = 0
				var_126_10.localEulerAngles = var_126_18
			end

			local var_126_19 = arg_123_1.actors_["1011ui_story"].transform
			local var_126_20 = 0

			if var_126_20 < arg_123_1.time_ and arg_123_1.time_ <= var_126_20 + arg_126_0 then
				arg_123_1.var_.moveOldPos1011ui_story = var_126_19.localPosition
			end

			local var_126_21 = 0.001

			if var_126_20 <= arg_123_1.time_ and arg_123_1.time_ < var_126_20 + var_126_21 then
				local var_126_22 = (arg_123_1.time_ - var_126_20) / var_126_21
				local var_126_23 = Vector3.New(0, -0.71, -6)

				var_126_19.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1011ui_story, var_126_23, var_126_22)

				local var_126_24 = manager.ui.mainCamera.transform.position - var_126_19.position

				var_126_19.forward = Vector3.New(var_126_24.x, var_126_24.y, var_126_24.z)

				local var_126_25 = var_126_19.localEulerAngles

				var_126_25.z = 0
				var_126_25.x = 0
				var_126_19.localEulerAngles = var_126_25
			end

			if arg_123_1.time_ >= var_126_20 + var_126_21 and arg_123_1.time_ < var_126_20 + var_126_21 + arg_126_0 then
				var_126_19.localPosition = Vector3.New(0, -0.71, -6)

				local var_126_26 = manager.ui.mainCamera.transform.position - var_126_19.position

				var_126_19.forward = Vector3.New(var_126_26.x, var_126_26.y, var_126_26.z)

				local var_126_27 = var_126_19.localEulerAngles

				var_126_27.z = 0
				var_126_27.x = 0
				var_126_19.localEulerAngles = var_126_27
			end

			local var_126_28 = 0

			if var_126_28 < arg_123_1.time_ and arg_123_1.time_ <= var_126_28 + arg_126_0 then
				arg_123_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_126_29 = 0

			if var_126_29 < arg_123_1.time_ and arg_123_1.time_ <= var_126_29 + arg_126_0 then
				arg_123_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_126_30 = 0
			local var_126_31 = 0.55

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_32 = arg_123_1:FormatText(StoryNameCfg[37].name)

				arg_123_1.leftNameTxt_.text = var_126_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_33 = arg_123_1:GetWordFromCfg(103031031)
				local var_126_34 = arg_123_1:FormatText(var_126_33.content)

				arg_123_1.text_.text = var_126_34

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_35 = 22
				local var_126_36 = utf8.len(var_126_34)
				local var_126_37 = var_126_35 <= 0 and var_126_31 or var_126_31 * (var_126_36 / var_126_35)

				if var_126_37 > 0 and var_126_31 < var_126_37 then
					arg_123_1.talkMaxDuration = var_126_37

					if var_126_37 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_37 + var_126_30
					end
				end

				arg_123_1.text_.text = var_126_34
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103031", "103031031", "story_v_out_103031.awb") ~= 0 then
					local var_126_38 = manager.audio:GetVoiceLength("story_v_out_103031", "103031031", "story_v_out_103031.awb") / 1000

					if var_126_38 + var_126_30 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_38 + var_126_30
					end

					if var_126_33.prefab_name ~= "" and arg_123_1.actors_[var_126_33.prefab_name] ~= nil then
						local var_126_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_33.prefab_name].transform, "story_v_out_103031", "103031031", "story_v_out_103031.awb")

						arg_123_1:RecordAudio("103031031", var_126_39)
						arg_123_1:RecordAudio("103031031", var_126_39)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_103031", "103031031", "story_v_out_103031.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_103031", "103031031", "story_v_out_103031.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_40 = math.max(var_126_31, arg_123_1.talkMaxDuration)

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_40 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_30) / var_126_40

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_30 + var_126_40 and arg_123_1.time_ < var_126_30 + var_126_40 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B08b"
	},
	voices = {
		"story_v_out_103031.awb"
	}
}
