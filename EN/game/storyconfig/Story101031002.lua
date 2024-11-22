return {
	Play103102001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103102001
		arg_1_1.duration_ = 9.2

		local var_1_0 = {
			ja = 9.2,
			ko = 6.7,
			zh = 6.6,
			en = 6.033
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
				arg_1_0:Play103102002(arg_1_1)
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
			local var_4_13 = 2

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

			local var_4_22 = "B03d"

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
				local var_4_27 = arg_1_1.bgs_.B03d

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
					if iter_4_0 ~= "B03d" then
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

			local var_4_47 = 1.79999995231628

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_4_48 = 1.79999995231628

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.475

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

				local var_4_53 = arg_1_1:GetWordFromCfg(103102001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102001", "story_v_out_103102.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_103102", "103102001", "story_v_out_103102.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_103102", "103102001", "story_v_out_103102.awb")

						arg_1_1:RecordAudio("103102001", var_4_59)
						arg_1_1:RecordAudio("103102001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_103102", "103102001", "story_v_out_103102.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_103102", "103102001", "story_v_out_103102.awb")
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
	Play103102002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103102002
		arg_7_1.duration_ = 1.999999999999

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play103102003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "1084ui_story"

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

			local var_10_4 = arg_7_1.actors_["1084ui_story"]
			local var_10_5 = 0

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_6 = 0.1

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_5) / var_10_6

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_5 + var_10_6 and arg_7_1.time_ < var_10_5 + var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_8 = arg_7_1.actors_["4010ui_story"].transform
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.var_.moveOldPos4010ui_story = var_10_8.localPosition
			end

			local var_10_10 = 0.001

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10
				local var_10_12 = Vector3.New(0, 100, 0)

				var_10_8.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos4010ui_story, var_10_12, var_10_11)

				local var_10_13 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_13.x, var_10_13.y, var_10_13.z)

				local var_10_14 = var_10_8.localEulerAngles

				var_10_14.z = 0
				var_10_14.x = 0
				var_10_8.localEulerAngles = var_10_14
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 then
				var_10_8.localPosition = Vector3.New(0, 100, 0)

				local var_10_15 = manager.ui.mainCamera.transform.position - var_10_8.position

				var_10_8.forward = Vector3.New(var_10_15.x, var_10_15.y, var_10_15.z)

				local var_10_16 = var_10_8.localEulerAngles

				var_10_16.z = 0
				var_10_16.x = 0
				var_10_8.localEulerAngles = var_10_16
			end

			local var_10_17 = 0

			if var_10_17 < arg_7_1.time_ and arg_7_1.time_ <= var_10_17 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_10_18 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_18.localPosition

				local var_10_20 = "1084ui_story"

				arg_7_1:ShowWeapon(arg_7_1.var_[var_10_20 .. "Animator"].transform, true)
			end

			local var_10_21 = 0.001

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_19) / var_10_21
				local var_10_23 = Vector3.New(0, -0.97, -6)

				var_10_18.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_23, var_10_22)

				local var_10_24 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_24.x, var_10_24.y, var_10_24.z)

				local var_10_25 = var_10_18.localEulerAngles

				var_10_25.z = 0
				var_10_25.x = 0
				var_10_18.localEulerAngles = var_10_25
			end

			if arg_7_1.time_ >= var_10_19 + var_10_21 and arg_7_1.time_ < var_10_19 + var_10_21 + arg_10_0 then
				var_10_18.localPosition = Vector3.New(0, -0.97, -6)

				local var_10_26 = manager.ui.mainCamera.transform.position - var_10_18.position

				var_10_18.forward = Vector3.New(var_10_26.x, var_10_26.y, var_10_26.z)

				local var_10_27 = var_10_18.localEulerAngles

				var_10_27.z = 0
				var_10_27.x = 0
				var_10_18.localEulerAngles = var_10_27
			end

			local var_10_28 = 0

			if var_10_28 < arg_7_1.time_ and arg_7_1.time_ <= var_10_28 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_10_29 = 0
			local var_10_30 = 0.075

			if var_10_29 < arg_7_1.time_ and arg_7_1.time_ <= var_10_29 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_31 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_32 = arg_7_1:GetWordFromCfg(103102002)
				local var_10_33 = arg_7_1:FormatText(var_10_32.content)

				arg_7_1.text_.text = var_10_33

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_34 = 3
				local var_10_35 = utf8.len(var_10_33)
				local var_10_36 = var_10_34 <= 0 and var_10_30 or var_10_30 * (var_10_35 / var_10_34)

				if var_10_36 > 0 and var_10_30 < var_10_36 then
					arg_7_1.talkMaxDuration = var_10_36

					if var_10_36 + var_10_29 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_36 + var_10_29
					end
				end

				arg_7_1.text_.text = var_10_33
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102002", "story_v_out_103102.awb") ~= 0 then
					local var_10_37 = manager.audio:GetVoiceLength("story_v_out_103102", "103102002", "story_v_out_103102.awb") / 1000

					if var_10_37 + var_10_29 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_37 + var_10_29
					end

					if var_10_32.prefab_name ~= "" and arg_7_1.actors_[var_10_32.prefab_name] ~= nil then
						local var_10_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_32.prefab_name].transform, "story_v_out_103102", "103102002", "story_v_out_103102.awb")

						arg_7_1:RecordAudio("103102002", var_10_38)
						arg_7_1:RecordAudio("103102002", var_10_38)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_103102", "103102002", "story_v_out_103102.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_103102", "103102002", "story_v_out_103102.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_39 = math.max(var_10_30, arg_7_1.talkMaxDuration)

			if var_10_29 <= arg_7_1.time_ and arg_7_1.time_ < var_10_29 + var_10_39 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_29) / var_10_39

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_29 + var_10_39 and arg_7_1.time_ < var_10_29 + var_10_39 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play103102003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103102003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play103102004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1084ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story == nil then
				arg_11_1.var_.characterEffect1084ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.1

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1084ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1084ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1084ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.5

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_8 = arg_11_1:FormatText(StoryNameCfg[7].name)

				arg_11_1.leftNameTxt_.text = var_14_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_9 = arg_11_1:GetWordFromCfg(103102003)
				local var_14_10 = arg_11_1:FormatText(var_14_9.content)

				arg_11_1.text_.text = var_14_10

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_11 = 20
				local var_14_12 = utf8.len(var_14_10)
				local var_14_13 = var_14_11 <= 0 and var_14_7 or var_14_7 * (var_14_12 / var_14_11)

				if var_14_13 > 0 and var_14_7 < var_14_13 then
					arg_11_1.talkMaxDuration = var_14_13

					if var_14_13 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_10
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_14 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_14 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_14

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_14 and arg_11_1.time_ < var_14_6 + var_14_14 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play103102004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103102004
		arg_15_1.duration_ = 6

		local var_15_0 = {
			ja = 6,
			ko = 4.266,
			zh = 3.966,
			en = 5.1
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
				arg_15_0:Play103102005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_2 = "play"
				local var_18_3 = "effect"

				arg_15_1:AudioAction(var_18_2, var_18_3, "se_story_3", "se_story_3_destroy_1", "")
			end

			local var_18_4 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_4.localPosition
			end

			local var_18_6 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_6 then
				local var_18_7 = (arg_15_1.time_ - var_18_5) / var_18_6
				local var_18_8 = Vector3.New(0, 100, 0)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_8, var_18_7)

				local var_18_9 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_9.x, var_18_9.y, var_18_9.z)

				local var_18_10 = var_18_4.localEulerAngles

				var_18_10.z = 0
				var_18_10.x = 0
				var_18_4.localEulerAngles = var_18_10
			end

			if arg_15_1.time_ >= var_18_5 + var_18_6 and arg_15_1.time_ < var_18_5 + var_18_6 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, 100, 0)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_4.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_4.localEulerAngles = var_18_12
			end

			local var_18_13 = 0

			if var_18_13 < arg_15_1.time_ and arg_15_1.time_ <= var_18_13 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_2")
			end

			local var_18_14 = 0
			local var_18_15 = 0.325

			if var_18_14 < arg_15_1.time_ and arg_15_1.time_ <= var_18_14 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_16 = arg_15_1:FormatText(StoryNameCfg[53].name)

				arg_15_1.leftNameTxt_.text = var_18_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(103102004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 13
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_15 or var_18_15 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_15 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_14 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_14
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102004", "story_v_out_103102.awb") ~= 0 then
					local var_18_22 = manager.audio:GetVoiceLength("story_v_out_103102", "103102004", "story_v_out_103102.awb") / 1000

					if var_18_22 + var_18_14 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_22 + var_18_14
					end

					if var_18_17.prefab_name ~= "" and arg_15_1.actors_[var_18_17.prefab_name] ~= nil then
						local var_18_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_17.prefab_name].transform, "story_v_out_103102", "103102004", "story_v_out_103102.awb")

						arg_15_1:RecordAudio("103102004", var_18_23)
						arg_15_1:RecordAudio("103102004", var_18_23)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_103102", "103102004", "story_v_out_103102.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_103102", "103102004", "story_v_out_103102.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_24 = math.max(var_18_15, arg_15_1.talkMaxDuration)

			if var_18_14 <= arg_15_1.time_ and arg_15_1.time_ < var_18_14 + var_18_24 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_14) / var_18_24

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_14 + var_18_24 and arg_15_1.time_ < var_18_14 + var_18_24 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103102005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103102005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play103102006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_1 = 0.5

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_1 then
				local var_22_2 = (arg_19_1.time_ - var_22_0) / var_22_1
				local var_22_3 = Color.New(1, 1, 1)

				var_22_3.a = Mathf.Lerp(1, 0, var_22_2)
				arg_19_1.mask_.color = var_22_3
			end

			if arg_19_1.time_ >= var_22_0 + var_22_1 and arg_19_1.time_ < var_22_0 + var_22_1 + arg_22_0 then
				local var_22_4 = Color.New(1, 1, 1)
				local var_22_5 = 0

				arg_19_1.mask_.enabled = false
				var_22_4.a = var_22_5
				arg_19_1.mask_.color = var_22_4
			end

			local var_22_6 = manager.ui.mainCamera.transform
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 then
				arg_19_1.var_.shakeOldPosMainCamera = var_22_6.localPosition
			end

			local var_22_8 = 0.600000023841858

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / 0.066
				local var_22_10, var_22_11 = math.modf(var_22_9)

				var_22_6.localPosition = Vector3.New(var_22_11 * 0.13, var_22_11 * 0.13, var_22_11 * 0.13) + arg_19_1.var_.shakeOldPosMainCamera
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 then
				var_22_6.localPosition = arg_19_1.var_.shakeOldPosMainCamera
			end

			local var_22_12 = 0
			local var_22_13 = 1.425

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_14 = arg_19_1:GetWordFromCfg(103102005)
				local var_22_15 = arg_19_1:FormatText(var_22_14.content)

				arg_19_1.text_.text = var_22_15

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_16 = 57
				local var_22_17 = utf8.len(var_22_15)
				local var_22_18 = var_22_16 <= 0 and var_22_13 or var_22_13 * (var_22_17 / var_22_16)

				if var_22_18 > 0 and var_22_13 < var_22_18 then
					arg_19_1.talkMaxDuration = var_22_18

					if var_22_18 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_18 + var_22_12
					end
				end

				arg_19_1.text_.text = var_22_15
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_19 = math.max(var_22_13, arg_19_1.talkMaxDuration)

			if var_22_12 <= arg_19_1.time_ and arg_19_1.time_ < var_22_12 + var_22_19 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_12) / var_22_19

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_12 + var_22_19 and arg_19_1.time_ < var_22_12 + var_22_19 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103102006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 103102006
		arg_23_1.duration_ = 3.066

		local var_23_0 = {
			ja = 2.866,
			ko = 2.566,
			zh = 3.066,
			en = 3.033
		}
		local var_23_1 = manager.audio:GetLocalizationFlag()

		if var_23_0[var_23_1] ~= nil then
			arg_23_1.duration_ = var_23_0[var_23_1]
		end

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play103102007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.225

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[49].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(103102006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 9
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102006", "story_v_out_103102.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_103102", "103102006", "story_v_out_103102.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_103102", "103102006", "story_v_out_103102.awb")

						arg_23_1:RecordAudio("103102006", var_26_9)
						arg_23_1:RecordAudio("103102006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_103102", "103102006", "story_v_out_103102.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_103102", "103102006", "story_v_out_103102.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play103102007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 103102007
		arg_27_1.duration_ = 5.133

		local var_27_0 = {
			ja = 5.133,
			ko = 4.3,
			zh = 3.433,
			en = 2.566
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
				arg_27_0:Play103102008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["4010ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story == nil then
				arg_27_1.var_.characterEffect4010ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.1

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect4010ui_story then
					arg_27_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect4010ui_story then
				arg_27_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_30_4 = arg_27_1.actors_["4010ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos4010ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0, -1.59, -5.2)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos4010ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_30_15 = 0
			local var_30_16 = 0.375

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_17 = arg_27_1:FormatText(StoryNameCfg[42].name)

				arg_27_1.leftNameTxt_.text = var_30_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_18 = arg_27_1:GetWordFromCfg(103102007)
				local var_30_19 = arg_27_1:FormatText(var_30_18.content)

				arg_27_1.text_.text = var_30_19

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_20 = 15
				local var_30_21 = utf8.len(var_30_19)
				local var_30_22 = var_30_20 <= 0 and var_30_16 or var_30_16 * (var_30_21 / var_30_20)

				if var_30_22 > 0 and var_30_16 < var_30_22 then
					arg_27_1.talkMaxDuration = var_30_22

					if var_30_22 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_22 + var_30_15
					end
				end

				arg_27_1.text_.text = var_30_19
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102007", "story_v_out_103102.awb") ~= 0 then
					local var_30_23 = manager.audio:GetVoiceLength("story_v_out_103102", "103102007", "story_v_out_103102.awb") / 1000

					if var_30_23 + var_30_15 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_23 + var_30_15
					end

					if var_30_18.prefab_name ~= "" and arg_27_1.actors_[var_30_18.prefab_name] ~= nil then
						local var_30_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_18.prefab_name].transform, "story_v_out_103102", "103102007", "story_v_out_103102.awb")

						arg_27_1:RecordAudio("103102007", var_30_24)
						arg_27_1:RecordAudio("103102007", var_30_24)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_103102", "103102007", "story_v_out_103102.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_103102", "103102007", "story_v_out_103102.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_25 = math.max(var_30_16, arg_27_1.talkMaxDuration)

			if var_30_15 <= arg_27_1.time_ and arg_27_1.time_ < var_30_15 + var_30_25 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_15) / var_30_25

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_15 + var_30_25 and arg_27_1.time_ < var_30_15 + var_30_25 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play103102008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 103102008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play103102009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["4010ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos4010ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos4010ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = 0
			local var_34_10 = 0.375

			if var_34_9 < arg_31_1.time_ and arg_31_1.time_ <= var_34_9 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_11 = arg_31_1:GetWordFromCfg(103102008)
				local var_34_12 = arg_31_1:FormatText(var_34_11.content)

				arg_31_1.text_.text = var_34_12

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_13 = 15
				local var_34_14 = utf8.len(var_34_12)
				local var_34_15 = var_34_13 <= 0 and var_34_10 or var_34_10 * (var_34_14 / var_34_13)

				if var_34_15 > 0 and var_34_10 < var_34_15 then
					arg_31_1.talkMaxDuration = var_34_15

					if var_34_15 + var_34_9 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_15 + var_34_9
					end
				end

				arg_31_1.text_.text = var_34_12
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_16 = math.max(var_34_10, arg_31_1.talkMaxDuration)

			if var_34_9 <= arg_31_1.time_ and arg_31_1.time_ < var_34_9 + var_34_16 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_9) / var_34_16

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_9 + var_34_16 and arg_31_1.time_ < var_34_9 + var_34_16 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play103102009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 103102009
		arg_35_1.duration_ = 2.5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play103102010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				local var_38_2 = "play"
				local var_38_3 = "effect"

				arg_35_1:AudioAction(var_38_2, var_38_3, "se_story_3", "se_story_3_destroy_2", "")
			end

			local var_38_4 = 0

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = true

				arg_35_1:SetGaussion(false)
			end

			local var_38_5 = 0.5

			if var_38_4 <= arg_35_1.time_ and arg_35_1.time_ < var_38_4 + var_38_5 then
				local var_38_6 = (arg_35_1.time_ - var_38_4) / var_38_5
				local var_38_7 = Color.New(1, 1, 1)

				var_38_7.a = Mathf.Lerp(1, 0, var_38_6)
				arg_35_1.mask_.color = var_38_7
			end

			if arg_35_1.time_ >= var_38_4 + var_38_5 and arg_35_1.time_ < var_38_4 + var_38_5 + arg_38_0 then
				local var_38_8 = Color.New(1, 1, 1)
				local var_38_9 = 0

				arg_35_1.mask_.enabled = false
				var_38_8.a = var_38_9
				arg_35_1.mask_.color = var_38_8
			end

			local var_38_10 = manager.ui.mainCamera.transform
			local var_38_11 = 0

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.var_.shakeOldPosMainCamera = var_38_10.localPosition
			end

			local var_38_12 = 0.600000023841858

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_12 then
				local var_38_13 = (arg_35_1.time_ - var_38_11) / 0.066
				local var_38_14, var_38_15 = math.modf(var_38_13)

				var_38_10.localPosition = Vector3.New(var_38_15 * 0.13, var_38_15 * 0.13, var_38_15 * 0.13) + arg_35_1.var_.shakeOldPosMainCamera
			end

			if arg_35_1.time_ >= var_38_11 + var_38_12 and arg_35_1.time_ < var_38_11 + var_38_12 + arg_38_0 then
				var_38_10.localPosition = arg_35_1.var_.shakeOldPosMainCamera
			end

			local var_38_16 = 0
			local var_38_17 = 0.15

			if var_38_16 < arg_35_1.time_ and arg_35_1.time_ <= var_38_16 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_18 = arg_35_1:FormatText(StoryNameCfg[53].name)

				arg_35_1.leftNameTxt_.text = var_38_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_19 = arg_35_1:GetWordFromCfg(103102009)
				local var_38_20 = arg_35_1:FormatText(var_38_19.content)

				arg_35_1.text_.text = var_38_20

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_21 = 6
				local var_38_22 = utf8.len(var_38_20)
				local var_38_23 = var_38_21 <= 0 and var_38_17 or var_38_17 * (var_38_22 / var_38_21)

				if var_38_23 > 0 and var_38_17 < var_38_23 then
					arg_35_1.talkMaxDuration = var_38_23

					if var_38_23 + var_38_16 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_16
					end
				end

				arg_35_1.text_.text = var_38_20
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102009", "story_v_out_103102.awb") ~= 0 then
					local var_38_24 = manager.audio:GetVoiceLength("story_v_out_103102", "103102009", "story_v_out_103102.awb") / 1000

					if var_38_24 + var_38_16 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_24 + var_38_16
					end

					if var_38_19.prefab_name ~= "" and arg_35_1.actors_[var_38_19.prefab_name] ~= nil then
						local var_38_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_19.prefab_name].transform, "story_v_out_103102", "103102009", "story_v_out_103102.awb")

						arg_35_1:RecordAudio("103102009", var_38_25)
						arg_35_1:RecordAudio("103102009", var_38_25)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_103102", "103102009", "story_v_out_103102.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_103102", "103102009", "story_v_out_103102.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_26 = math.max(var_38_17, arg_35_1.talkMaxDuration)

			if var_38_16 <= arg_35_1.time_ and arg_35_1.time_ < var_38_16 + var_38_26 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_16) / var_38_26

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_16 + var_38_26 and arg_35_1.time_ < var_38_16 + var_38_26 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play103102010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 103102010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play103102011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.225

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_2 = arg_39_1:GetWordFromCfg(103102010)
				local var_42_3 = arg_39_1:FormatText(var_42_2.content)

				arg_39_1.text_.text = var_42_3

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_4 = 9
				local var_42_5 = utf8.len(var_42_3)
				local var_42_6 = var_42_4 <= 0 and var_42_1 or var_42_1 * (var_42_5 / var_42_4)

				if var_42_6 > 0 and var_42_1 < var_42_6 then
					arg_39_1.talkMaxDuration = var_42_6

					if var_42_6 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_6 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_3
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_7 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_7 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_7

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_7 and arg_39_1.time_ < var_42_0 + var_42_7 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play103102011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 103102011
		arg_43_1.duration_ = 2

		local var_43_0 = {
			ja = 1.333,
			ko = 0.933,
			zh = 2,
			en = 1.8
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
				arg_43_0:Play103102012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.125

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[49].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(103102011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 5
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102011", "story_v_out_103102.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_103102", "103102011", "story_v_out_103102.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_103102", "103102011", "story_v_out_103102.awb")

						arg_43_1:RecordAudio("103102011", var_46_9)
						arg_43_1:RecordAudio("103102011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_103102", "103102011", "story_v_out_103102.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_103102", "103102011", "story_v_out_103102.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_10 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_10 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_10

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_10 and arg_43_1.time_ < var_46_0 + var_46_10 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play103102012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 103102012
		arg_47_1.duration_ = 6.933

		local var_47_0 = {
			ja = 6.933,
			ko = 5.7,
			zh = 5.6,
			en = 6.2
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
				arg_47_0:Play103102013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["4010ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story == nil then
				arg_47_1.var_.characterEffect4010ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.1

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect4010ui_story then
					arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect4010ui_story then
				arg_47_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["4010ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos4010ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, -1.59, -5.2)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos4010ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action5_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.5

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[42].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(103102012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 20
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102012", "story_v_out_103102.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_103102", "103102012", "story_v_out_103102.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_103102", "103102012", "story_v_out_103102.awb")

						arg_47_1:RecordAudio("103102012", var_50_24)
						arg_47_1:RecordAudio("103102012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_103102", "103102012", "story_v_out_103102.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_103102", "103102012", "story_v_out_103102.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play103102013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 103102013
		arg_51_1.duration_ = 7.1

		local var_51_0 = {
			ja = 4.3,
			ko = 7.1,
			zh = 3.533,
			en = 3.433
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
				arg_51_0:Play103102014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 1.63333333333333
			local var_54_1 = 1

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				local var_54_2 = "play"
				local var_54_3 = "effect"

				arg_51_1:AudioAction(var_54_2, var_54_3, "se_story_3", "se_story_3_destroy_3", "")
			end

			local var_54_4 = arg_51_1.actors_["4010ui_story"].transform
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 then
				arg_51_1.var_.moveOldPos4010ui_story = var_54_4.localPosition
			end

			local var_54_6 = 0.001

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6
				local var_54_8 = Vector3.New(0, 100, 0)

				var_54_4.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos4010ui_story, var_54_8, var_54_7)

				local var_54_9 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_9.x, var_54_9.y, var_54_9.z)

				local var_54_10 = var_54_4.localEulerAngles

				var_54_10.z = 0
				var_54_10.x = 0
				var_54_4.localEulerAngles = var_54_10
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 then
				var_54_4.localPosition = Vector3.New(0, 100, 0)

				local var_54_11 = manager.ui.mainCamera.transform.position - var_54_4.position

				var_54_4.forward = Vector3.New(var_54_11.x, var_54_11.y, var_54_11.z)

				local var_54_12 = var_54_4.localEulerAngles

				var_54_12.z = 0
				var_54_12.x = 0
				var_54_4.localEulerAngles = var_54_12
			end

			local var_54_13 = 0
			local var_54_14 = 0.7

			if var_54_13 < arg_51_1.time_ and arg_51_1.time_ <= var_54_13 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_15 = arg_51_1:FormatText(StoryNameCfg[49].name)

				arg_51_1.leftNameTxt_.text = var_54_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_40131")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_16 = arg_51_1:GetWordFromCfg(103102013)
				local var_54_17 = arg_51_1:FormatText(var_54_16.content)

				arg_51_1.text_.text = var_54_17

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_18 = 28
				local var_54_19 = utf8.len(var_54_17)
				local var_54_20 = var_54_18 <= 0 and var_54_14 or var_54_14 * (var_54_19 / var_54_18)

				if var_54_20 > 0 and var_54_14 < var_54_20 then
					arg_51_1.talkMaxDuration = var_54_20

					if var_54_20 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_13
					end
				end

				arg_51_1.text_.text = var_54_17
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102013", "story_v_out_103102.awb") ~= 0 then
					local var_54_21 = manager.audio:GetVoiceLength("story_v_out_103102", "103102013", "story_v_out_103102.awb") / 1000

					if var_54_21 + var_54_13 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_21 + var_54_13
					end

					if var_54_16.prefab_name ~= "" and arg_51_1.actors_[var_54_16.prefab_name] ~= nil then
						local var_54_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_16.prefab_name].transform, "story_v_out_103102", "103102013", "story_v_out_103102.awb")

						arg_51_1:RecordAudio("103102013", var_54_22)
						arg_51_1:RecordAudio("103102013", var_54_22)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_103102", "103102013", "story_v_out_103102.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_103102", "103102013", "story_v_out_103102.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_23 = math.max(var_54_14, arg_51_1.talkMaxDuration)

			if var_54_13 <= arg_51_1.time_ and arg_51_1.time_ < var_54_13 + var_54_23 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_13) / var_54_23

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_13 + var_54_23 and arg_51_1.time_ < var_54_13 + var_54_23 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play103102014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 103102014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play103102015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.725

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_2 = arg_55_1:GetWordFromCfg(103102014)
				local var_58_3 = arg_55_1:FormatText(var_58_2.content)

				arg_55_1.text_.text = var_58_3

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_4 = 29
				local var_58_5 = utf8.len(var_58_3)
				local var_58_6 = var_58_4 <= 0 and var_58_1 or var_58_1 * (var_58_5 / var_58_4)

				if var_58_6 > 0 and var_58_1 < var_58_6 then
					arg_55_1.talkMaxDuration = var_58_6

					if var_58_6 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_6 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_3
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_7 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_7 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_7

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_7 and arg_55_1.time_ < var_58_0 + var_58_7 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play103102015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 103102015
		arg_59_1.duration_ = 5.3

		local var_59_0 = {
			ja = 5.3,
			ko = 4.233,
			zh = 4.566,
			en = 4.866
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
				arg_59_0:Play103102016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "1011ui_story"

			if arg_59_1.actors_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(Asset.Load("Char/" .. var_62_0), arg_59_1.stage_.transform)

				var_62_1.name = var_62_0
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.actors_[var_62_0] = var_62_1

				local var_62_2 = var_62_1:GetComponentInChildren(typeof(CharacterEffect))

				var_62_2.enabled = true

				local var_62_3 = GameObjectTools.GetOrAddComponent(var_62_1, typeof(DynamicBoneHelper))

				if var_62_3 then
					var_62_3:EnableDynamicBone(false)
				end

				arg_59_1:ShowWeapon(var_62_2.transform, false)

				arg_59_1.var_[var_62_0 .. "Animator"] = var_62_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_59_1.var_[var_62_0 .. "Animator"].applyRootMotion = true
				arg_59_1.var_[var_62_0 .. "LipSync"] = var_62_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_62_4 = arg_59_1.actors_["1011ui_story"]
			local var_62_5 = 2

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story == nil then
				arg_59_1.var_.characterEffect1011ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.1

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1011ui_story then
					arg_59_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1011ui_story then
				arg_59_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_9 = 1.5

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9
				local var_62_11 = Color.New(0, 0, 0)

				var_62_11.a = Mathf.Lerp(0, 1, var_62_10)
				arg_59_1.mask_.color = var_62_11
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 then
				local var_62_12 = Color.New(0, 0, 0)

				var_62_12.a = 1
				arg_59_1.mask_.color = var_62_12
			end

			local var_62_13 = 1.5

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_14 = 1.5

			if var_62_13 <= arg_59_1.time_ and arg_59_1.time_ < var_62_13 + var_62_14 then
				local var_62_15 = (arg_59_1.time_ - var_62_13) / var_62_14
				local var_62_16 = Color.New(0, 0, 0)

				var_62_16.a = Mathf.Lerp(1, 0, var_62_15)
				arg_59_1.mask_.color = var_62_16
			end

			if arg_59_1.time_ >= var_62_13 + var_62_14 and arg_59_1.time_ < var_62_13 + var_62_14 + arg_62_0 then
				local var_62_17 = Color.New(0, 0, 0)
				local var_62_18 = 0

				arg_59_1.mask_.enabled = false
				var_62_17.a = var_62_18
				arg_59_1.mask_.color = var_62_17
			end

			local var_62_19 = "B03f"

			if arg_59_1.bgs_[var_62_19] == nil then
				local var_62_20 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_20:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_19)
				var_62_20.name = var_62_19
				var_62_20.transform.parent = arg_59_1.stage_.transform
				var_62_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_19] = var_62_20
			end

			local var_62_21 = 1.5

			if var_62_21 < arg_59_1.time_ and arg_59_1.time_ <= var_62_21 + arg_62_0 then
				local var_62_22 = manager.ui.mainCamera.transform.localPosition
				local var_62_23 = Vector3.New(0, 0, 10) + Vector3.New(var_62_22.x, var_62_22.y, 0)
				local var_62_24 = arg_59_1.bgs_.B03f

				var_62_24.transform.localPosition = var_62_23
				var_62_24.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_25 = var_62_24:GetComponent("SpriteRenderer")

				if var_62_25 and var_62_25.sprite then
					local var_62_26 = (var_62_24.transform.localPosition - var_62_22).z
					local var_62_27 = manager.ui.mainCameraCom_
					local var_62_28 = 2 * var_62_26 * Mathf.Tan(var_62_27.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_29 = var_62_28 * var_62_27.aspect
					local var_62_30 = var_62_25.sprite.bounds.size.x
					local var_62_31 = var_62_25.sprite.bounds.size.y
					local var_62_32 = var_62_29 / var_62_30
					local var_62_33 = var_62_28 / var_62_31
					local var_62_34 = var_62_33 < var_62_32 and var_62_32 or var_62_33

					var_62_24.transform.localScale = Vector3.New(var_62_34, var_62_34, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "B03f" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_35 = arg_59_1.actors_["4010ui_story"].transform
			local var_62_36 = 0

			if var_62_36 < arg_59_1.time_ and arg_59_1.time_ <= var_62_36 + arg_62_0 then
				arg_59_1.var_.moveOldPos4010ui_story = var_62_35.localPosition
			end

			local var_62_37 = 0.001

			if var_62_36 <= arg_59_1.time_ and arg_59_1.time_ < var_62_36 + var_62_37 then
				local var_62_38 = (arg_59_1.time_ - var_62_36) / var_62_37
				local var_62_39 = Vector3.New(0, 100, 0)

				var_62_35.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos4010ui_story, var_62_39, var_62_38)

				local var_62_40 = manager.ui.mainCamera.transform.position - var_62_35.position

				var_62_35.forward = Vector3.New(var_62_40.x, var_62_40.y, var_62_40.z)

				local var_62_41 = var_62_35.localEulerAngles

				var_62_41.z = 0
				var_62_41.x = 0
				var_62_35.localEulerAngles = var_62_41
			end

			if arg_59_1.time_ >= var_62_36 + var_62_37 and arg_59_1.time_ < var_62_36 + var_62_37 + arg_62_0 then
				var_62_35.localPosition = Vector3.New(0, 100, 0)

				local var_62_42 = manager.ui.mainCamera.transform.position - var_62_35.position

				var_62_35.forward = Vector3.New(var_62_42.x, var_62_42.y, var_62_42.z)

				local var_62_43 = var_62_35.localEulerAngles

				var_62_43.z = 0
				var_62_43.x = 0
				var_62_35.localEulerAngles = var_62_43
			end

			local var_62_44 = arg_59_1.actors_["1011ui_story"].transform
			local var_62_45 = 1.79999995231628

			if var_62_45 < arg_59_1.time_ and arg_59_1.time_ <= var_62_45 + arg_62_0 then
				arg_59_1.var_.moveOldPos1011ui_story = var_62_44.localPosition
			end

			local var_62_46 = 0.001

			if var_62_45 <= arg_59_1.time_ and arg_59_1.time_ < var_62_45 + var_62_46 then
				local var_62_47 = (arg_59_1.time_ - var_62_45) / var_62_46
				local var_62_48 = Vector3.New(0, -0.71, -6)

				var_62_44.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1011ui_story, var_62_48, var_62_47)

				local var_62_49 = manager.ui.mainCamera.transform.position - var_62_44.position

				var_62_44.forward = Vector3.New(var_62_49.x, var_62_49.y, var_62_49.z)

				local var_62_50 = var_62_44.localEulerAngles

				var_62_50.z = 0
				var_62_50.x = 0
				var_62_44.localEulerAngles = var_62_50
			end

			if arg_59_1.time_ >= var_62_45 + var_62_46 and arg_59_1.time_ < var_62_45 + var_62_46 + arg_62_0 then
				var_62_44.localPosition = Vector3.New(0, -0.71, -6)

				local var_62_51 = manager.ui.mainCamera.transform.position - var_62_44.position

				var_62_44.forward = Vector3.New(var_62_51.x, var_62_51.y, var_62_51.z)

				local var_62_52 = var_62_44.localEulerAngles

				var_62_52.z = 0
				var_62_52.x = 0
				var_62_44.localEulerAngles = var_62_52
			end

			local var_62_53 = 1.79999995231628

			if var_62_53 < arg_59_1.time_ and arg_59_1.time_ <= var_62_53 + arg_62_0 then
				arg_59_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_62_54 = 0

			if var_62_54 < arg_59_1.time_ and arg_59_1.time_ <= var_62_54 + arg_62_0 then
				arg_59_1.allBtn_.enabled = false
			end

			local var_62_55 = 2

			if arg_59_1.time_ >= var_62_54 + var_62_55 and arg_59_1.time_ < var_62_54 + var_62_55 + arg_62_0 then
				arg_59_1.allBtn_.enabled = true
			end

			local var_62_56 = 0

			if var_62_56 < arg_59_1.time_ and arg_59_1.time_ <= var_62_56 + arg_62_0 then
				arg_59_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_57 = 2
			local var_62_58 = 0.225

			if var_62_57 < arg_59_1.time_ and arg_59_1.time_ <= var_62_57 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_59 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_59:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_60 = arg_59_1:FormatText(StoryNameCfg[37].name)

				arg_59_1.leftNameTxt_.text = var_62_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_61 = arg_59_1:GetWordFromCfg(103102015)
				local var_62_62 = arg_59_1:FormatText(var_62_61.content)

				arg_59_1.text_.text = var_62_62

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_63 = 9
				local var_62_64 = utf8.len(var_62_62)
				local var_62_65 = var_62_63 <= 0 and var_62_58 or var_62_58 * (var_62_64 / var_62_63)

				if var_62_65 > 0 and var_62_58 < var_62_65 then
					arg_59_1.talkMaxDuration = var_62_65
					var_62_57 = var_62_57 + 0.3

					if var_62_65 + var_62_57 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_65 + var_62_57
					end
				end

				arg_59_1.text_.text = var_62_62
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102015", "story_v_out_103102.awb") ~= 0 then
					local var_62_66 = manager.audio:GetVoiceLength("story_v_out_103102", "103102015", "story_v_out_103102.awb") / 1000

					if var_62_66 + var_62_57 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_66 + var_62_57
					end

					if var_62_61.prefab_name ~= "" and arg_59_1.actors_[var_62_61.prefab_name] ~= nil then
						local var_62_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_61.prefab_name].transform, "story_v_out_103102", "103102015", "story_v_out_103102.awb")

						arg_59_1:RecordAudio("103102015", var_62_67)
						arg_59_1:RecordAudio("103102015", var_62_67)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_103102", "103102015", "story_v_out_103102.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_103102", "103102015", "story_v_out_103102.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_68 = var_62_57 + 0.3
			local var_62_69 = math.max(var_62_58, arg_59_1.talkMaxDuration)

			if var_62_68 <= arg_59_1.time_ and arg_59_1.time_ < var_62_68 + var_62_69 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_68) / var_62_69

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_68 + var_62_69 and arg_59_1.time_ < var_62_68 + var_62_69 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play103102016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 103102016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play103102017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["1011ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect1011ui_story == nil then
				arg_65_1.var_.characterEffect1011ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.1

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect1011ui_story then
					local var_68_4 = Mathf.Lerp(0, 0.5, var_68_3)

					arg_65_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_65_1.var_.characterEffect1011ui_story.fillRatio = var_68_4
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect1011ui_story then
				local var_68_5 = 0.5

				arg_65_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_65_1.var_.characterEffect1011ui_story.fillRatio = var_68_5
			end

			local var_68_6 = 0
			local var_68_7 = 0.75

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_8 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_9 = arg_65_1:GetWordFromCfg(103102016)
				local var_68_10 = arg_65_1:FormatText(var_68_9.content)

				arg_65_1.text_.text = var_68_10

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_11 = 30
				local var_68_12 = utf8.len(var_68_10)
				local var_68_13 = var_68_11 <= 0 and var_68_7 or var_68_7 * (var_68_12 / var_68_11)

				if var_68_13 > 0 and var_68_7 < var_68_13 then
					arg_65_1.talkMaxDuration = var_68_13

					if var_68_13 + var_68_6 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_13 + var_68_6
					end
				end

				arg_65_1.text_.text = var_68_10
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_14 = math.max(var_68_7, arg_65_1.talkMaxDuration)

			if var_68_6 <= arg_65_1.time_ and arg_65_1.time_ < var_68_6 + var_68_14 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_6) / var_68_14

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_6 + var_68_14 and arg_65_1.time_ < var_68_6 + var_68_14 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play103102017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 103102017
		arg_69_1.duration_ = 1.999999999999

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play103102018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1084ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.1

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1084ui_story then
					arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				arg_69_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_72_4 = arg_69_1.actors_["1084ui_story"].transform
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.var_.moveOldPos1084ui_story = var_72_4.localPosition

				local var_72_6 = "1084ui_story"

				arg_69_1:ShowWeapon(arg_69_1.var_[var_72_6 .. "Animator"].transform, false)
			end

			local var_72_7 = 0.001

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_7 then
				local var_72_8 = (arg_69_1.time_ - var_72_5) / var_72_7
				local var_72_9 = Vector3.New(0, -0.97, -6)

				var_72_4.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1084ui_story, var_72_9, var_72_8)

				local var_72_10 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_10.x, var_72_10.y, var_72_10.z)

				local var_72_11 = var_72_4.localEulerAngles

				var_72_11.z = 0
				var_72_11.x = 0
				var_72_4.localEulerAngles = var_72_11
			end

			if arg_69_1.time_ >= var_72_5 + var_72_7 and arg_69_1.time_ < var_72_5 + var_72_7 + arg_72_0 then
				var_72_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_72_12 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_12.x, var_72_12.y, var_72_12.z)

				local var_72_13 = var_72_4.localEulerAngles

				var_72_13.z = 0
				var_72_13.x = 0
				var_72_4.localEulerAngles = var_72_13
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_72_15 = 0

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_72_16 = arg_69_1.actors_["1011ui_story"].transform
			local var_72_17 = 0

			if var_72_17 < arg_69_1.time_ and arg_69_1.time_ <= var_72_17 + arg_72_0 then
				arg_69_1.var_.moveOldPos1011ui_story = var_72_16.localPosition

				local var_72_18 = "1011ui_story"

				arg_69_1:ShowWeapon(arg_69_1.var_[var_72_18 .. "Animator"].transform, false)
			end

			local var_72_19 = 0.001

			if var_72_17 <= arg_69_1.time_ and arg_69_1.time_ < var_72_17 + var_72_19 then
				local var_72_20 = (arg_69_1.time_ - var_72_17) / var_72_19
				local var_72_21 = Vector3.New(0, 100, 0)

				var_72_16.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1011ui_story, var_72_21, var_72_20)

				local var_72_22 = manager.ui.mainCamera.transform.position - var_72_16.position

				var_72_16.forward = Vector3.New(var_72_22.x, var_72_22.y, var_72_22.z)

				local var_72_23 = var_72_16.localEulerAngles

				var_72_23.z = 0
				var_72_23.x = 0
				var_72_16.localEulerAngles = var_72_23
			end

			if arg_69_1.time_ >= var_72_17 + var_72_19 and arg_69_1.time_ < var_72_17 + var_72_19 + arg_72_0 then
				var_72_16.localPosition = Vector3.New(0, 100, 0)

				local var_72_24 = manager.ui.mainCamera.transform.position - var_72_16.position

				var_72_16.forward = Vector3.New(var_72_24.x, var_72_24.y, var_72_24.z)

				local var_72_25 = var_72_16.localEulerAngles

				var_72_25.z = 0
				var_72_25.x = 0
				var_72_16.localEulerAngles = var_72_25
			end

			local var_72_26 = 0
			local var_72_27 = 0.2

			if var_72_26 < arg_69_1.time_ and arg_69_1.time_ <= var_72_26 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_28 = arg_69_1:FormatText(StoryNameCfg[6].name)

				arg_69_1.leftNameTxt_.text = var_72_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_29 = arg_69_1:GetWordFromCfg(103102017)
				local var_72_30 = arg_69_1:FormatText(var_72_29.content)

				arg_69_1.text_.text = var_72_30

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_31 = 8
				local var_72_32 = utf8.len(var_72_30)
				local var_72_33 = var_72_31 <= 0 and var_72_27 or var_72_27 * (var_72_32 / var_72_31)

				if var_72_33 > 0 and var_72_27 < var_72_33 then
					arg_69_1.talkMaxDuration = var_72_33

					if var_72_33 + var_72_26 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_33 + var_72_26
					end
				end

				arg_69_1.text_.text = var_72_30
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102017", "story_v_out_103102.awb") ~= 0 then
					local var_72_34 = manager.audio:GetVoiceLength("story_v_out_103102", "103102017", "story_v_out_103102.awb") / 1000

					if var_72_34 + var_72_26 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_34 + var_72_26
					end

					if var_72_29.prefab_name ~= "" and arg_69_1.actors_[var_72_29.prefab_name] ~= nil then
						local var_72_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_29.prefab_name].transform, "story_v_out_103102", "103102017", "story_v_out_103102.awb")

						arg_69_1:RecordAudio("103102017", var_72_35)
						arg_69_1:RecordAudio("103102017", var_72_35)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_103102", "103102017", "story_v_out_103102.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_103102", "103102017", "story_v_out_103102.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_36 = math.max(var_72_27, arg_69_1.talkMaxDuration)

			if var_72_26 <= arg_69_1.time_ and arg_69_1.time_ < var_72_26 + var_72_36 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_26) / var_72_36

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_26 + var_72_36 and arg_69_1.time_ < var_72_26 + var_72_36 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play103102018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 103102018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play103102019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["4010ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect4010ui_story == nil then
				arg_73_1.var_.characterEffect4010ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.1

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect4010ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_73_1.var_.characterEffect4010ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect4010ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_73_1.var_.characterEffect4010ui_story.fillRatio = var_76_5
			end

			local var_76_6 = arg_73_1.actors_["1084ui_story"].transform
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 then
				arg_73_1.var_.moveOldPos1084ui_story = var_76_6.localPosition
			end

			local var_76_8 = 0.001

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8
				local var_76_10 = Vector3.New(0, 100, 0)

				var_76_6.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1084ui_story, var_76_10, var_76_9)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_6.position

				var_76_6.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_6.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_6.localEulerAngles = var_76_12
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 then
				var_76_6.localPosition = Vector3.New(0, 100, 0)

				local var_76_13 = manager.ui.mainCamera.transform.position - var_76_6.position

				var_76_6.forward = Vector3.New(var_76_13.x, var_76_13.y, var_76_13.z)

				local var_76_14 = var_76_6.localEulerAngles

				var_76_14.z = 0
				var_76_14.x = 0
				var_76_6.localEulerAngles = var_76_14
			end

			local var_76_15 = arg_73_1.actors_["4010ui_story"].transform
			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 then
				arg_73_1.var_.moveOldPos4010ui_story = var_76_15.localPosition
			end

			local var_76_17 = 0.001

			if var_76_16 <= arg_73_1.time_ and arg_73_1.time_ < var_76_16 + var_76_17 then
				local var_76_18 = (arg_73_1.time_ - var_76_16) / var_76_17
				local var_76_19 = Vector3.New(0, -1.59, -5.2)

				var_76_15.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos4010ui_story, var_76_19, var_76_18)

				local var_76_20 = manager.ui.mainCamera.transform.position - var_76_15.position

				var_76_15.forward = Vector3.New(var_76_20.x, var_76_20.y, var_76_20.z)

				local var_76_21 = var_76_15.localEulerAngles

				var_76_21.z = 0
				var_76_21.x = 0
				var_76_15.localEulerAngles = var_76_21
			end

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 then
				var_76_15.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_76_22 = manager.ui.mainCamera.transform.position - var_76_15.position

				var_76_15.forward = Vector3.New(var_76_22.x, var_76_22.y, var_76_22.z)

				local var_76_23 = var_76_15.localEulerAngles

				var_76_23.z = 0
				var_76_23.x = 0
				var_76_15.localEulerAngles = var_76_23
			end

			local var_76_24 = 0

			if var_76_24 < arg_73_1.time_ and arg_73_1.time_ <= var_76_24 + arg_76_0 then
				arg_73_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_76_25 = 0
			local var_76_26 = 0.525

			if var_76_25 < arg_73_1.time_ and arg_73_1.time_ <= var_76_25 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_27 = arg_73_1:GetWordFromCfg(103102018)
				local var_76_28 = arg_73_1:FormatText(var_76_27.content)

				arg_73_1.text_.text = var_76_28

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_29 = 21
				local var_76_30 = utf8.len(var_76_28)
				local var_76_31 = var_76_29 <= 0 and var_76_26 or var_76_26 * (var_76_30 / var_76_29)

				if var_76_31 > 0 and var_76_26 < var_76_31 then
					arg_73_1.talkMaxDuration = var_76_31

					if var_76_31 + var_76_25 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_31 + var_76_25
					end
				end

				arg_73_1.text_.text = var_76_28
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_32 = math.max(var_76_26, arg_73_1.talkMaxDuration)

			if var_76_25 <= arg_73_1.time_ and arg_73_1.time_ < var_76_25 + var_76_32 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_25) / var_76_32

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_25 + var_76_32 and arg_73_1.time_ < var_76_25 + var_76_32 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play103102019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 103102019
		arg_77_1.duration_ = 5.966

		local var_77_0 = {
			ja = 4.633,
			ko = 5.3,
			zh = 5.966,
			en = 5.033
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play103102020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["4010ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect4010ui_story == nil then
				arg_77_1.var_.characterEffect4010ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.1

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect4010ui_story then
					arg_77_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect4010ui_story then
				arg_77_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_80_5 = 0
			local var_80_6 = 0.5

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_7 = arg_77_1:FormatText(StoryNameCfg[42].name)

				arg_77_1.leftNameTxt_.text = var_80_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_8 = arg_77_1:GetWordFromCfg(103102019)
				local var_80_9 = arg_77_1:FormatText(var_80_8.content)

				arg_77_1.text_.text = var_80_9

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_10 = 20
				local var_80_11 = utf8.len(var_80_9)
				local var_80_12 = var_80_10 <= 0 and var_80_6 or var_80_6 * (var_80_11 / var_80_10)

				if var_80_12 > 0 and var_80_6 < var_80_12 then
					arg_77_1.talkMaxDuration = var_80_12

					if var_80_12 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_12 + var_80_5
					end
				end

				arg_77_1.text_.text = var_80_9
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102019", "story_v_out_103102.awb") ~= 0 then
					local var_80_13 = manager.audio:GetVoiceLength("story_v_out_103102", "103102019", "story_v_out_103102.awb") / 1000

					if var_80_13 + var_80_5 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_5
					end

					if var_80_8.prefab_name ~= "" and arg_77_1.actors_[var_80_8.prefab_name] ~= nil then
						local var_80_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_8.prefab_name].transform, "story_v_out_103102", "103102019", "story_v_out_103102.awb")

						arg_77_1:RecordAudio("103102019", var_80_14)
						arg_77_1:RecordAudio("103102019", var_80_14)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_103102", "103102019", "story_v_out_103102.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_103102", "103102019", "story_v_out_103102.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_15 = math.max(var_80_6, arg_77_1.talkMaxDuration)

			if var_80_5 <= arg_77_1.time_ and arg_77_1.time_ < var_80_5 + var_80_15 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_5) / var_80_15

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_5 + var_80_15 and arg_77_1.time_ < var_80_5 + var_80_15 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play103102020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 103102020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play103102021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["4010ui_story"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos4010ui_story = var_84_0.localPosition
			end

			local var_84_2 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2
				local var_84_4 = Vector3.New(0, 100, 0)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos4010ui_story, var_84_4, var_84_3)

				local var_84_5 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_5.x, var_84_5.y, var_84_5.z)

				local var_84_6 = var_84_0.localEulerAngles

				var_84_6.z = 0
				var_84_6.x = 0
				var_84_0.localEulerAngles = var_84_6
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, 100, 0)

				local var_84_7 = manager.ui.mainCamera.transform.position - var_84_0.position

				var_84_0.forward = Vector3.New(var_84_7.x, var_84_7.y, var_84_7.z)

				local var_84_8 = var_84_0.localEulerAngles

				var_84_8.z = 0
				var_84_8.x = 0
				var_84_0.localEulerAngles = var_84_8
			end

			local var_84_9 = 0
			local var_84_10 = 0.65

			if var_84_9 < arg_81_1.time_ and arg_81_1.time_ <= var_84_9 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_11 = arg_81_1:GetWordFromCfg(103102020)
				local var_84_12 = arg_81_1:FormatText(var_84_11.content)

				arg_81_1.text_.text = var_84_12

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_13 = 26
				local var_84_14 = utf8.len(var_84_12)
				local var_84_15 = var_84_13 <= 0 and var_84_10 or var_84_10 * (var_84_14 / var_84_13)

				if var_84_15 > 0 and var_84_10 < var_84_15 then
					arg_81_1.talkMaxDuration = var_84_15

					if var_84_15 + var_84_9 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_15 + var_84_9
					end
				end

				arg_81_1.text_.text = var_84_12
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_16 = math.max(var_84_10, arg_81_1.talkMaxDuration)

			if var_84_9 <= arg_81_1.time_ and arg_81_1.time_ < var_84_9 + var_84_16 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_9) / var_84_16

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_9 + var_84_16 and arg_81_1.time_ < var_84_9 + var_84_16 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play103102021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 103102021
		arg_85_1.duration_ = 2.733

		local var_85_0 = {
			ja = 2.733,
			ko = 2.166,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play103102022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1084ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story == nil then
				arg_85_1.var_.characterEffect1084ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.1

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect1084ui_story then
					arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect1084ui_story then
				arg_85_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_88_4 = arg_85_1.actors_["1084ui_story"].transform
			local var_88_5 = 0

			if var_88_5 < arg_85_1.time_ and arg_85_1.time_ <= var_88_5 + arg_88_0 then
				arg_85_1.var_.moveOldPos1084ui_story = var_88_4.localPosition
			end

			local var_88_6 = 0.001

			if var_88_5 <= arg_85_1.time_ and arg_85_1.time_ < var_88_5 + var_88_6 then
				local var_88_7 = (arg_85_1.time_ - var_88_5) / var_88_6
				local var_88_8 = Vector3.New(0, -0.97, -6)

				var_88_4.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1084ui_story, var_88_8, var_88_7)

				local var_88_9 = manager.ui.mainCamera.transform.position - var_88_4.position

				var_88_4.forward = Vector3.New(var_88_9.x, var_88_9.y, var_88_9.z)

				local var_88_10 = var_88_4.localEulerAngles

				var_88_10.z = 0
				var_88_10.x = 0
				var_88_4.localEulerAngles = var_88_10
			end

			if arg_85_1.time_ >= var_88_5 + var_88_6 and arg_85_1.time_ < var_88_5 + var_88_6 + arg_88_0 then
				var_88_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_88_11 = manager.ui.mainCamera.transform.position - var_88_4.position

				var_88_4.forward = Vector3.New(var_88_11.x, var_88_11.y, var_88_11.z)

				local var_88_12 = var_88_4.localEulerAngles

				var_88_12.z = 0
				var_88_12.x = 0
				var_88_4.localEulerAngles = var_88_12
			end

			local var_88_13 = 0

			if var_88_13 < arg_85_1.time_ and arg_85_1.time_ <= var_88_13 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_88_15 = 0
			local var_88_16 = 0.1

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_17 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_18 = arg_85_1:GetWordFromCfg(103102021)
				local var_88_19 = arg_85_1:FormatText(var_88_18.content)

				arg_85_1.text_.text = var_88_19

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_20 = 4
				local var_88_21 = utf8.len(var_88_19)
				local var_88_22 = var_88_20 <= 0 and var_88_16 or var_88_16 * (var_88_21 / var_88_20)

				if var_88_22 > 0 and var_88_16 < var_88_22 then
					arg_85_1.talkMaxDuration = var_88_22

					if var_88_22 + var_88_15 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_22 + var_88_15
					end
				end

				arg_85_1.text_.text = var_88_19
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102021", "story_v_out_103102.awb") ~= 0 then
					local var_88_23 = manager.audio:GetVoiceLength("story_v_out_103102", "103102021", "story_v_out_103102.awb") / 1000

					if var_88_23 + var_88_15 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_23 + var_88_15
					end

					if var_88_18.prefab_name ~= "" and arg_85_1.actors_[var_88_18.prefab_name] ~= nil then
						local var_88_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_18.prefab_name].transform, "story_v_out_103102", "103102021", "story_v_out_103102.awb")

						arg_85_1:RecordAudio("103102021", var_88_24)
						arg_85_1:RecordAudio("103102021", var_88_24)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_103102", "103102021", "story_v_out_103102.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_103102", "103102021", "story_v_out_103102.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_25 = math.max(var_88_16, arg_85_1.talkMaxDuration)

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_25 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_15) / var_88_25

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_15 + var_88_25 and arg_85_1.time_ < var_88_15 + var_88_25 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play103102022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 103102022
		arg_89_1.duration_ = 5.266

		local var_89_0 = {
			ja = 5.266,
			ko = 3.4,
			zh = 4.233,
			en = 3.1
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play103102023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["4010ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect4010ui_story == nil then
				arg_89_1.var_.characterEffect4010ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.1

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect4010ui_story then
					arg_89_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect4010ui_story then
				arg_89_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_92_4 = arg_89_1.actors_["1084ui_story"].transform
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1.var_.moveOldPos1084ui_story = var_92_4.localPosition
			end

			local var_92_6 = 0.001

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6
				local var_92_8 = Vector3.New(0, 100, 0)

				var_92_4.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1084ui_story, var_92_8, var_92_7)

				local var_92_9 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_9.x, var_92_9.y, var_92_9.z)

				local var_92_10 = var_92_4.localEulerAngles

				var_92_10.z = 0
				var_92_10.x = 0
				var_92_4.localEulerAngles = var_92_10
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 then
				var_92_4.localPosition = Vector3.New(0, 100, 0)

				local var_92_11 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_11.x, var_92_11.y, var_92_11.z)

				local var_92_12 = var_92_4.localEulerAngles

				var_92_12.z = 0
				var_92_12.x = 0
				var_92_4.localEulerAngles = var_92_12
			end

			local var_92_13 = arg_89_1.actors_["4010ui_story"].transform
			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 then
				arg_89_1.var_.moveOldPos4010ui_story = var_92_13.localPosition
			end

			local var_92_15 = 0.001

			if var_92_14 <= arg_89_1.time_ and arg_89_1.time_ < var_92_14 + var_92_15 then
				local var_92_16 = (arg_89_1.time_ - var_92_14) / var_92_15
				local var_92_17 = Vector3.New(-0.7, -1.59, -5.2)

				var_92_13.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos4010ui_story, var_92_17, var_92_16)

				local var_92_18 = manager.ui.mainCamera.transform.position - var_92_13.position

				var_92_13.forward = Vector3.New(var_92_18.x, var_92_18.y, var_92_18.z)

				local var_92_19 = var_92_13.localEulerAngles

				var_92_19.z = 0
				var_92_19.x = 0
				var_92_13.localEulerAngles = var_92_19
			end

			if arg_89_1.time_ >= var_92_14 + var_92_15 and arg_89_1.time_ < var_92_14 + var_92_15 + arg_92_0 then
				var_92_13.localPosition = Vector3.New(-0.7, -1.59, -5.2)

				local var_92_20 = manager.ui.mainCamera.transform.position - var_92_13.position

				var_92_13.forward = Vector3.New(var_92_20.x, var_92_20.y, var_92_20.z)

				local var_92_21 = var_92_13.localEulerAngles

				var_92_21.z = 0
				var_92_21.x = 0
				var_92_13.localEulerAngles = var_92_21
			end

			local var_92_22 = 0

			if var_92_22 < arg_89_1.time_ and arg_89_1.time_ <= var_92_22 + arg_92_0 then
				arg_89_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action2_1")
			end

			local var_92_23 = 0

			if var_92_23 < arg_89_1.time_ and arg_89_1.time_ <= var_92_23 + arg_92_0 then
				arg_89_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_92_24 = 0
			local var_92_25 = 0.425

			if var_92_24 < arg_89_1.time_ and arg_89_1.time_ <= var_92_24 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_26 = arg_89_1:FormatText(StoryNameCfg[42].name)

				arg_89_1.leftNameTxt_.text = var_92_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_27 = arg_89_1:GetWordFromCfg(103102022)
				local var_92_28 = arg_89_1:FormatText(var_92_27.content)

				arg_89_1.text_.text = var_92_28

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_29 = 17
				local var_92_30 = utf8.len(var_92_28)
				local var_92_31 = var_92_29 <= 0 and var_92_25 or var_92_25 * (var_92_30 / var_92_29)

				if var_92_31 > 0 and var_92_25 < var_92_31 then
					arg_89_1.talkMaxDuration = var_92_31

					if var_92_31 + var_92_24 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_31 + var_92_24
					end
				end

				arg_89_1.text_.text = var_92_28
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102022", "story_v_out_103102.awb") ~= 0 then
					local var_92_32 = manager.audio:GetVoiceLength("story_v_out_103102", "103102022", "story_v_out_103102.awb") / 1000

					if var_92_32 + var_92_24 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_32 + var_92_24
					end

					if var_92_27.prefab_name ~= "" and arg_89_1.actors_[var_92_27.prefab_name] ~= nil then
						local var_92_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_27.prefab_name].transform, "story_v_out_103102", "103102022", "story_v_out_103102.awb")

						arg_89_1:RecordAudio("103102022", var_92_33)
						arg_89_1:RecordAudio("103102022", var_92_33)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_103102", "103102022", "story_v_out_103102.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_103102", "103102022", "story_v_out_103102.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_34 = math.max(var_92_25, arg_89_1.talkMaxDuration)

			if var_92_24 <= arg_89_1.time_ and arg_89_1.time_ < var_92_24 + var_92_34 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_24) / var_92_34

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_24 + var_92_34 and arg_89_1.time_ < var_92_24 + var_92_34 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play103102023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 103102023
		arg_93_1.duration_ = 2.266

		local var_93_0 = {
			ja = 2.266,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_93_1 = manager.audio:GetLocalizationFlag()

		if var_93_0[var_93_1] ~= nil then
			arg_93_1.duration_ = var_93_0[var_93_1]
		end

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play103102024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "1019ui_story"

			if arg_93_1.actors_[var_96_0] == nil then
				local var_96_1 = Object.Instantiate(Asset.Load("Char/" .. var_96_0), arg_93_1.stage_.transform)

				var_96_1.name = var_96_0
				var_96_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_93_1.actors_[var_96_0] = var_96_1

				local var_96_2 = var_96_1:GetComponentInChildren(typeof(CharacterEffect))

				var_96_2.enabled = true

				local var_96_3 = GameObjectTools.GetOrAddComponent(var_96_1, typeof(DynamicBoneHelper))

				if var_96_3 then
					var_96_3:EnableDynamicBone(false)
				end

				arg_93_1:ShowWeapon(var_96_2.transform, false)

				arg_93_1.var_[var_96_0 .. "Animator"] = var_96_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_93_1.var_[var_96_0 .. "Animator"].applyRootMotion = true
				arg_93_1.var_[var_96_0 .. "LipSync"] = var_96_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_96_4 = arg_93_1.actors_["1019ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story == nil then
				arg_93_1.var_.characterEffect1019ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.1

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1019ui_story then
					arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story then
				arg_93_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_96_8 = arg_93_1.actors_["4010ui_story"]
			local var_96_9 = 0

			if var_96_9 < arg_93_1.time_ and arg_93_1.time_ <= var_96_9 + arg_96_0 and arg_93_1.var_.characterEffect4010ui_story == nil then
				arg_93_1.var_.characterEffect4010ui_story = var_96_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_10 = 0.1

			if var_96_9 <= arg_93_1.time_ and arg_93_1.time_ < var_96_9 + var_96_10 then
				local var_96_11 = (arg_93_1.time_ - var_96_9) / var_96_10

				if arg_93_1.var_.characterEffect4010ui_story then
					local var_96_12 = Mathf.Lerp(0, 0.5, var_96_11)

					arg_93_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_93_1.var_.characterEffect4010ui_story.fillRatio = var_96_12
				end
			end

			if arg_93_1.time_ >= var_96_9 + var_96_10 and arg_93_1.time_ < var_96_9 + var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect4010ui_story then
				local var_96_13 = 0.5

				arg_93_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_93_1.var_.characterEffect4010ui_story.fillRatio = var_96_13
			end

			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_96_15 = arg_93_1.actors_["1019ui_story"].transform
			local var_96_16 = 0

			if var_96_16 < arg_93_1.time_ and arg_93_1.time_ <= var_96_16 + arg_96_0 then
				arg_93_1.var_.moveOldPos1019ui_story = var_96_15.localPosition
			end

			local var_96_17 = 0.001

			if var_96_16 <= arg_93_1.time_ and arg_93_1.time_ < var_96_16 + var_96_17 then
				local var_96_18 = (arg_93_1.time_ - var_96_16) / var_96_17
				local var_96_19 = Vector3.New(0.7, -1.08, -5.9)

				var_96_15.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1019ui_story, var_96_19, var_96_18)

				local var_96_20 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_20.x, var_96_20.y, var_96_20.z)

				local var_96_21 = var_96_15.localEulerAngles

				var_96_21.z = 0
				var_96_21.x = 0
				var_96_15.localEulerAngles = var_96_21
			end

			if arg_93_1.time_ >= var_96_16 + var_96_17 and arg_93_1.time_ < var_96_16 + var_96_17 + arg_96_0 then
				var_96_15.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_96_22 = manager.ui.mainCamera.transform.position - var_96_15.position

				var_96_15.forward = Vector3.New(var_96_22.x, var_96_22.y, var_96_22.z)

				local var_96_23 = var_96_15.localEulerAngles

				var_96_23.z = 0
				var_96_23.x = 0
				var_96_15.localEulerAngles = var_96_23
			end

			local var_96_24 = 0

			if var_96_24 < arg_93_1.time_ and arg_93_1.time_ <= var_96_24 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_96_25 = 0
			local var_96_26 = 0.15

			if var_96_25 < arg_93_1.time_ and arg_93_1.time_ <= var_96_25 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_27 = arg_93_1:FormatText(StoryNameCfg[13].name)

				arg_93_1.leftNameTxt_.text = var_96_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_28 = arg_93_1:GetWordFromCfg(103102023)
				local var_96_29 = arg_93_1:FormatText(var_96_28.content)

				arg_93_1.text_.text = var_96_29

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_30 = 6
				local var_96_31 = utf8.len(var_96_29)
				local var_96_32 = var_96_30 <= 0 and var_96_26 or var_96_26 * (var_96_31 / var_96_30)

				if var_96_32 > 0 and var_96_26 < var_96_32 then
					arg_93_1.talkMaxDuration = var_96_32

					if var_96_32 + var_96_25 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_32 + var_96_25
					end
				end

				arg_93_1.text_.text = var_96_29
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102023", "story_v_out_103102.awb") ~= 0 then
					local var_96_33 = manager.audio:GetVoiceLength("story_v_out_103102", "103102023", "story_v_out_103102.awb") / 1000

					if var_96_33 + var_96_25 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_33 + var_96_25
					end

					if var_96_28.prefab_name ~= "" and arg_93_1.actors_[var_96_28.prefab_name] ~= nil then
						local var_96_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_28.prefab_name].transform, "story_v_out_103102", "103102023", "story_v_out_103102.awb")

						arg_93_1:RecordAudio("103102023", var_96_34)
						arg_93_1:RecordAudio("103102023", var_96_34)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_103102", "103102023", "story_v_out_103102.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_103102", "103102023", "story_v_out_103102.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_35 = math.max(var_96_26, arg_93_1.talkMaxDuration)

			if var_96_25 <= arg_93_1.time_ and arg_93_1.time_ < var_96_25 + var_96_35 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_25) / var_96_35

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_25 + var_96_35 and arg_93_1.time_ < var_96_25 + var_96_35 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play103102024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 103102024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play103102025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1019ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story == nil then
				arg_97_1.var_.characterEffect1019ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.1

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1019ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1019ui_story.fillRatio = var_100_5
			end

			local var_100_6 = 0
			local var_100_7 = 0.55

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_8 = arg_97_1:GetWordFromCfg(103102024)
				local var_100_9 = arg_97_1:FormatText(var_100_8.content)

				arg_97_1.text_.text = var_100_9

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_10 = 22
				local var_100_11 = utf8.len(var_100_9)
				local var_100_12 = var_100_10 <= 0 and var_100_7 or var_100_7 * (var_100_11 / var_100_10)

				if var_100_12 > 0 and var_100_7 < var_100_12 then
					arg_97_1.talkMaxDuration = var_100_12

					if var_100_12 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_9
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_13 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_13 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_13

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_13 and arg_97_1.time_ < var_100_6 + var_100_13 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play103102025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 103102025
		arg_101_1.duration_ = 8.5

		local var_101_0 = {
			ja = 8.5,
			ko = 6.766,
			zh = 7.933,
			en = 8.366
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play103102026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["4010ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect4010ui_story == nil then
				arg_101_1.var_.characterEffect4010ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.1

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect4010ui_story then
					arg_101_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect4010ui_story then
				arg_101_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_104_4 = 0

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 then
				arg_101_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010actionlink/4010action426")
			end

			local var_104_6 = 0
			local var_104_7 = 0.9

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[42].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(103102025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 36
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102025", "story_v_out_103102.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_103102", "103102025", "story_v_out_103102.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_103102", "103102025", "story_v_out_103102.awb")

						arg_101_1:RecordAudio("103102025", var_104_15)
						arg_101_1:RecordAudio("103102025", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_103102", "103102025", "story_v_out_103102.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_103102", "103102025", "story_v_out_103102.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play103102026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 103102026
		arg_105_1.duration_ = 3.133

		local var_105_0 = {
			ja = 3.133,
			ko = 1.999999999999,
			zh = 2.1,
			en = 2.933
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play103102027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1019ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story == nil then
				arg_105_1.var_.characterEffect1019ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.1

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1019ui_story then
					arg_105_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1019ui_story then
				arg_105_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_108_4 = arg_105_1.actors_["4010ui_story"]
			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story == nil then
				arg_105_1.var_.characterEffect4010ui_story = var_108_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_6 = 0.1

			if var_108_5 <= arg_105_1.time_ and arg_105_1.time_ < var_108_5 + var_108_6 then
				local var_108_7 = (arg_105_1.time_ - var_108_5) / var_108_6

				if arg_105_1.var_.characterEffect4010ui_story then
					local var_108_8 = Mathf.Lerp(0, 0.5, var_108_7)

					arg_105_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_105_1.var_.characterEffect4010ui_story.fillRatio = var_108_8
				end
			end

			if arg_105_1.time_ >= var_108_5 + var_108_6 and arg_105_1.time_ < var_108_5 + var_108_6 + arg_108_0 and arg_105_1.var_.characterEffect4010ui_story then
				local var_108_9 = 0.5

				arg_105_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_105_1.var_.characterEffect4010ui_story.fillRatio = var_108_9
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_108_11 = 0

			if var_108_11 < arg_105_1.time_ and arg_105_1.time_ <= var_108_11 + arg_108_0 then
				arg_105_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_108_12 = 0
			local var_108_13 = 0.3

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_14 = arg_105_1:FormatText(StoryNameCfg[13].name)

				arg_105_1.leftNameTxt_.text = var_108_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(103102026)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 12
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102026", "story_v_out_103102.awb") ~= 0 then
					local var_108_20 = manager.audio:GetVoiceLength("story_v_out_103102", "103102026", "story_v_out_103102.awb") / 1000

					if var_108_20 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_20 + var_108_12
					end

					if var_108_15.prefab_name ~= "" and arg_105_1.actors_[var_108_15.prefab_name] ~= nil then
						local var_108_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_15.prefab_name].transform, "story_v_out_103102", "103102026", "story_v_out_103102.awb")

						arg_105_1:RecordAudio("103102026", var_108_21)
						arg_105_1:RecordAudio("103102026", var_108_21)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_103102", "103102026", "story_v_out_103102.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_103102", "103102026", "story_v_out_103102.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_22 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_22 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_12) / var_108_22

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_12 + var_108_22 and arg_105_1.time_ < var_108_12 + var_108_22 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play103102027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 103102027
		arg_109_1.duration_ = 4.4

		local var_109_0 = {
			ja = 4.4,
			ko = 3.566,
			zh = 3.366,
			en = 3.866
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play103102028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = "3009ui_story"

			if arg_109_1.actors_[var_112_0] == nil then
				local var_112_1 = Object.Instantiate(Asset.Load("Char/" .. var_112_0), arg_109_1.stage_.transform)

				var_112_1.name = var_112_0
				var_112_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_109_1.actors_[var_112_0] = var_112_1

				local var_112_2 = var_112_1:GetComponentInChildren(typeof(CharacterEffect))

				var_112_2.enabled = true

				local var_112_3 = GameObjectTools.GetOrAddComponent(var_112_1, typeof(DynamicBoneHelper))

				if var_112_3 then
					var_112_3:EnableDynamicBone(false)
				end

				arg_109_1:ShowWeapon(var_112_2.transform, false)

				arg_109_1.var_[var_112_0 .. "Animator"] = var_112_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_109_1.var_[var_112_0 .. "Animator"].applyRootMotion = true
				arg_109_1.var_[var_112_0 .. "LipSync"] = var_112_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_112_4 = arg_109_1.actors_["3009ui_story"]
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 and arg_109_1.var_.characterEffect3009ui_story == nil then
				arg_109_1.var_.characterEffect3009ui_story = var_112_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_6 = 0.1

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6

				if arg_109_1.var_.characterEffect3009ui_story then
					arg_109_1.var_.characterEffect3009ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect3009ui_story then
				arg_109_1.var_.characterEffect3009ui_story.fillFlat = false
			end

			local var_112_8 = arg_109_1.actors_["1019ui_story"]
			local var_112_9 = 0

			if var_112_9 < arg_109_1.time_ and arg_109_1.time_ <= var_112_9 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story == nil then
				arg_109_1.var_.characterEffect1019ui_story = var_112_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_10 = 0.1

			if var_112_9 <= arg_109_1.time_ and arg_109_1.time_ < var_112_9 + var_112_10 then
				local var_112_11 = (arg_109_1.time_ - var_112_9) / var_112_10

				if arg_109_1.var_.characterEffect1019ui_story then
					local var_112_12 = Mathf.Lerp(0, 0.5, var_112_11)

					arg_109_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1019ui_story.fillRatio = var_112_12
				end
			end

			if arg_109_1.time_ >= var_112_9 + var_112_10 and arg_109_1.time_ < var_112_9 + var_112_10 + arg_112_0 and arg_109_1.var_.characterEffect1019ui_story then
				local var_112_13 = 0.5

				arg_109_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1019ui_story.fillRatio = var_112_13
			end

			local var_112_14 = arg_109_1.actors_["1019ui_story"].transform
			local var_112_15 = 0

			if var_112_15 < arg_109_1.time_ and arg_109_1.time_ <= var_112_15 + arg_112_0 then
				arg_109_1.var_.moveOldPos1019ui_story = var_112_14.localPosition
			end

			local var_112_16 = 0.001

			if var_112_15 <= arg_109_1.time_ and arg_109_1.time_ < var_112_15 + var_112_16 then
				local var_112_17 = (arg_109_1.time_ - var_112_15) / var_112_16
				local var_112_18 = Vector3.New(0, 100, 0)

				var_112_14.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1019ui_story, var_112_18, var_112_17)

				local var_112_19 = manager.ui.mainCamera.transform.position - var_112_14.position

				var_112_14.forward = Vector3.New(var_112_19.x, var_112_19.y, var_112_19.z)

				local var_112_20 = var_112_14.localEulerAngles

				var_112_20.z = 0
				var_112_20.x = 0
				var_112_14.localEulerAngles = var_112_20
			end

			if arg_109_1.time_ >= var_112_15 + var_112_16 and arg_109_1.time_ < var_112_15 + var_112_16 + arg_112_0 then
				var_112_14.localPosition = Vector3.New(0, 100, 0)

				local var_112_21 = manager.ui.mainCamera.transform.position - var_112_14.position

				var_112_14.forward = Vector3.New(var_112_21.x, var_112_21.y, var_112_21.z)

				local var_112_22 = var_112_14.localEulerAngles

				var_112_22.z = 0
				var_112_22.x = 0
				var_112_14.localEulerAngles = var_112_22
			end

			local var_112_23 = arg_109_1.actors_["4010ui_story"].transform
			local var_112_24 = 0

			if var_112_24 < arg_109_1.time_ and arg_109_1.time_ <= var_112_24 + arg_112_0 then
				arg_109_1.var_.moveOldPos4010ui_story = var_112_23.localPosition
			end

			local var_112_25 = 0.001

			if var_112_24 <= arg_109_1.time_ and arg_109_1.time_ < var_112_24 + var_112_25 then
				local var_112_26 = (arg_109_1.time_ - var_112_24) / var_112_25
				local var_112_27 = Vector3.New(0, 100, 0)

				var_112_23.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos4010ui_story, var_112_27, var_112_26)

				local var_112_28 = manager.ui.mainCamera.transform.position - var_112_23.position

				var_112_23.forward = Vector3.New(var_112_28.x, var_112_28.y, var_112_28.z)

				local var_112_29 = var_112_23.localEulerAngles

				var_112_29.z = 0
				var_112_29.x = 0
				var_112_23.localEulerAngles = var_112_29
			end

			if arg_109_1.time_ >= var_112_24 + var_112_25 and arg_109_1.time_ < var_112_24 + var_112_25 + arg_112_0 then
				var_112_23.localPosition = Vector3.New(0, 100, 0)

				local var_112_30 = manager.ui.mainCamera.transform.position - var_112_23.position

				var_112_23.forward = Vector3.New(var_112_30.x, var_112_30.y, var_112_30.z)

				local var_112_31 = var_112_23.localEulerAngles

				var_112_31.z = 0
				var_112_31.x = 0
				var_112_23.localEulerAngles = var_112_31
			end

			local var_112_32 = arg_109_1.actors_["3009ui_story"].transform
			local var_112_33 = 0

			if var_112_33 < arg_109_1.time_ and arg_109_1.time_ <= var_112_33 + arg_112_0 then
				arg_109_1.var_.moveOldPos3009ui_story = var_112_32.localPosition

				local var_112_34 = "3009ui_story"

				arg_109_1:ShowWeapon(arg_109_1.var_[var_112_34 .. "Animator"].transform, true)
			end

			local var_112_35 = 0.001

			if var_112_33 <= arg_109_1.time_ and arg_109_1.time_ < var_112_33 + var_112_35 then
				local var_112_36 = (arg_109_1.time_ - var_112_33) / var_112_35
				local var_112_37 = Vector3.New(0, -1.75, -4.8)

				var_112_32.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos3009ui_story, var_112_37, var_112_36)

				local var_112_38 = manager.ui.mainCamera.transform.position - var_112_32.position

				var_112_32.forward = Vector3.New(var_112_38.x, var_112_38.y, var_112_38.z)

				local var_112_39 = var_112_32.localEulerAngles

				var_112_39.z = 0
				var_112_39.x = 0
				var_112_32.localEulerAngles = var_112_39
			end

			if arg_109_1.time_ >= var_112_33 + var_112_35 and arg_109_1.time_ < var_112_33 + var_112_35 + arg_112_0 then
				var_112_32.localPosition = Vector3.New(0, -1.75, -4.8)

				local var_112_40 = manager.ui.mainCamera.transform.position - var_112_32.position

				var_112_32.forward = Vector3.New(var_112_40.x, var_112_40.y, var_112_40.z)

				local var_112_41 = var_112_32.localEulerAngles

				var_112_41.z = 0
				var_112_41.x = 0
				var_112_32.localEulerAngles = var_112_41
			end

			local var_112_42 = 0

			if var_112_42 < arg_109_1.time_ and arg_109_1.time_ <= var_112_42 + arg_112_0 then
				arg_109_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/story3009/3009action/3009action2_1")
			end

			local var_112_43 = 0

			if var_112_43 < arg_109_1.time_ and arg_109_1.time_ <= var_112_43 + arg_112_0 then
				arg_109_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_112_44 = 0
			local var_112_45 = 0.425

			if var_112_44 < arg_109_1.time_ and arg_109_1.time_ <= var_112_44 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_46 = arg_109_1:FormatText(StoryNameCfg[43].name)

				arg_109_1.leftNameTxt_.text = var_112_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_47 = arg_109_1:GetWordFromCfg(103102027)
				local var_112_48 = arg_109_1:FormatText(var_112_47.content)

				arg_109_1.text_.text = var_112_48

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_49 = 17
				local var_112_50 = utf8.len(var_112_48)
				local var_112_51 = var_112_49 <= 0 and var_112_45 or var_112_45 * (var_112_50 / var_112_49)

				if var_112_51 > 0 and var_112_45 < var_112_51 then
					arg_109_1.talkMaxDuration = var_112_51

					if var_112_51 + var_112_44 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_51 + var_112_44
					end
				end

				arg_109_1.text_.text = var_112_48
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102027", "story_v_out_103102.awb") ~= 0 then
					local var_112_52 = manager.audio:GetVoiceLength("story_v_out_103102", "103102027", "story_v_out_103102.awb") / 1000

					if var_112_52 + var_112_44 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_52 + var_112_44
					end

					if var_112_47.prefab_name ~= "" and arg_109_1.actors_[var_112_47.prefab_name] ~= nil then
						local var_112_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_47.prefab_name].transform, "story_v_out_103102", "103102027", "story_v_out_103102.awb")

						arg_109_1:RecordAudio("103102027", var_112_53)
						arg_109_1:RecordAudio("103102027", var_112_53)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_103102", "103102027", "story_v_out_103102.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_103102", "103102027", "story_v_out_103102.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_54 = math.max(var_112_45, arg_109_1.talkMaxDuration)

			if var_112_44 <= arg_109_1.time_ and arg_109_1.time_ < var_112_44 + var_112_54 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_44) / var_112_54

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_44 + var_112_54 and arg_109_1.time_ < var_112_44 + var_112_54 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play103102028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 103102028
		arg_113_1.duration_ = 8.933

		local var_113_0 = {
			ja = 8.933,
			ko = 4.6,
			zh = 4,
			en = 5.033
		}
		local var_113_1 = manager.audio:GetLocalizationFlag()

		if var_113_0[var_113_1] ~= nil then
			arg_113_1.duration_ = var_113_0[var_113_1]
		end

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play103102029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("3009ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_116_1 = 0
			local var_116_2 = 0.6

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_3 = arg_113_1:FormatText(StoryNameCfg[43].name)

				arg_113_1.leftNameTxt_.text = var_116_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_4 = arg_113_1:GetWordFromCfg(103102028)
				local var_116_5 = arg_113_1:FormatText(var_116_4.content)

				arg_113_1.text_.text = var_116_5

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_6 = 24
				local var_116_7 = utf8.len(var_116_5)
				local var_116_8 = var_116_6 <= 0 and var_116_2 or var_116_2 * (var_116_7 / var_116_6)

				if var_116_8 > 0 and var_116_2 < var_116_8 then
					arg_113_1.talkMaxDuration = var_116_8

					if var_116_8 + var_116_1 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_8 + var_116_1
					end
				end

				arg_113_1.text_.text = var_116_5
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102028", "story_v_out_103102.awb") ~= 0 then
					local var_116_9 = manager.audio:GetVoiceLength("story_v_out_103102", "103102028", "story_v_out_103102.awb") / 1000

					if var_116_9 + var_116_1 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_9 + var_116_1
					end

					if var_116_4.prefab_name ~= "" and arg_113_1.actors_[var_116_4.prefab_name] ~= nil then
						local var_116_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_4.prefab_name].transform, "story_v_out_103102", "103102028", "story_v_out_103102.awb")

						arg_113_1:RecordAudio("103102028", var_116_10)
						arg_113_1:RecordAudio("103102028", var_116_10)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_103102", "103102028", "story_v_out_103102.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_103102", "103102028", "story_v_out_103102.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_11 = math.max(var_116_2, arg_113_1.talkMaxDuration)

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_11 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_1) / var_116_11

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_1 + var_116_11 and arg_113_1.time_ < var_116_1 + var_116_11 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play103102029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 103102029
		arg_117_1.duration_ = 9.2

		local var_117_0 = {
			ja = 9.2,
			ko = 6.533,
			zh = 7.6,
			en = 7.933
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play103102030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["4010ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect4010ui_story == nil then
				arg_117_1.var_.characterEffect4010ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.1

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect4010ui_story then
					arg_117_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect4010ui_story then
				arg_117_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_120_4 = arg_117_1.actors_["3009ui_story"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect3009ui_story == nil then
				arg_117_1.var_.characterEffect3009ui_story = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.1

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect3009ui_story then
					local var_120_8 = Mathf.Lerp(0, 0.5, var_120_7)

					arg_117_1.var_.characterEffect3009ui_story.fillFlat = true
					arg_117_1.var_.characterEffect3009ui_story.fillRatio = var_120_8
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect3009ui_story then
				local var_120_9 = 0.5

				arg_117_1.var_.characterEffect3009ui_story.fillFlat = true
				arg_117_1.var_.characterEffect3009ui_story.fillRatio = var_120_9
			end

			local var_120_10 = arg_117_1.actors_["3009ui_story"].transform
			local var_120_11 = 0

			if var_120_11 < arg_117_1.time_ and arg_117_1.time_ <= var_120_11 + arg_120_0 then
				arg_117_1.var_.moveOldPos3009ui_story = var_120_10.localPosition
			end

			local var_120_12 = 0.001

			if var_120_11 <= arg_117_1.time_ and arg_117_1.time_ < var_120_11 + var_120_12 then
				local var_120_13 = (arg_117_1.time_ - var_120_11) / var_120_12
				local var_120_14 = Vector3.New(0, 100, 0)

				var_120_10.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos3009ui_story, var_120_14, var_120_13)

				local var_120_15 = manager.ui.mainCamera.transform.position - var_120_10.position

				var_120_10.forward = Vector3.New(var_120_15.x, var_120_15.y, var_120_15.z)

				local var_120_16 = var_120_10.localEulerAngles

				var_120_16.z = 0
				var_120_16.x = 0
				var_120_10.localEulerAngles = var_120_16
			end

			if arg_117_1.time_ >= var_120_11 + var_120_12 and arg_117_1.time_ < var_120_11 + var_120_12 + arg_120_0 then
				var_120_10.localPosition = Vector3.New(0, 100, 0)

				local var_120_17 = manager.ui.mainCamera.transform.position - var_120_10.position

				var_120_10.forward = Vector3.New(var_120_17.x, var_120_17.y, var_120_17.z)

				local var_120_18 = var_120_10.localEulerAngles

				var_120_18.z = 0
				var_120_18.x = 0
				var_120_10.localEulerAngles = var_120_18
			end

			local var_120_19 = arg_117_1.actors_["4010ui_story"].transform
			local var_120_20 = 0

			if var_120_20 < arg_117_1.time_ and arg_117_1.time_ <= var_120_20 + arg_120_0 then
				arg_117_1.var_.moveOldPos4010ui_story = var_120_19.localPosition
			end

			local var_120_21 = 0.001

			if var_120_20 <= arg_117_1.time_ and arg_117_1.time_ < var_120_20 + var_120_21 then
				local var_120_22 = (arg_117_1.time_ - var_120_20) / var_120_21
				local var_120_23 = Vector3.New(0, -1.59, -5.2)

				var_120_19.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos4010ui_story, var_120_23, var_120_22)

				local var_120_24 = manager.ui.mainCamera.transform.position - var_120_19.position

				var_120_19.forward = Vector3.New(var_120_24.x, var_120_24.y, var_120_24.z)

				local var_120_25 = var_120_19.localEulerAngles

				var_120_25.z = 0
				var_120_25.x = 0
				var_120_19.localEulerAngles = var_120_25
			end

			if arg_117_1.time_ >= var_120_20 + var_120_21 and arg_117_1.time_ < var_120_20 + var_120_21 + arg_120_0 then
				var_120_19.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_120_26 = manager.ui.mainCamera.transform.position - var_120_19.position

				var_120_19.forward = Vector3.New(var_120_26.x, var_120_26.y, var_120_26.z)

				local var_120_27 = var_120_19.localEulerAngles

				var_120_27.z = 0
				var_120_27.x = 0
				var_120_19.localEulerAngles = var_120_27
			end

			local var_120_28 = 0

			if var_120_28 < arg_117_1.time_ and arg_117_1.time_ <= var_120_28 + arg_120_0 then
				arg_117_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_120_29 = 0

			if var_120_29 < arg_117_1.time_ and arg_117_1.time_ <= var_120_29 + arg_120_0 then
				arg_117_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_120_30 = 0
			local var_120_31 = 0.925

			if var_120_30 < arg_117_1.time_ and arg_117_1.time_ <= var_120_30 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_32 = arg_117_1:FormatText(StoryNameCfg[42].name)

				arg_117_1.leftNameTxt_.text = var_120_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_33 = arg_117_1:GetWordFromCfg(103102029)
				local var_120_34 = arg_117_1:FormatText(var_120_33.content)

				arg_117_1.text_.text = var_120_34

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_35 = 37
				local var_120_36 = utf8.len(var_120_34)
				local var_120_37 = var_120_35 <= 0 and var_120_31 or var_120_31 * (var_120_36 / var_120_35)

				if var_120_37 > 0 and var_120_31 < var_120_37 then
					arg_117_1.talkMaxDuration = var_120_37

					if var_120_37 + var_120_30 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_37 + var_120_30
					end
				end

				arg_117_1.text_.text = var_120_34
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102029", "story_v_out_103102.awb") ~= 0 then
					local var_120_38 = manager.audio:GetVoiceLength("story_v_out_103102", "103102029", "story_v_out_103102.awb") / 1000

					if var_120_38 + var_120_30 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_38 + var_120_30
					end

					if var_120_33.prefab_name ~= "" and arg_117_1.actors_[var_120_33.prefab_name] ~= nil then
						local var_120_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_33.prefab_name].transform, "story_v_out_103102", "103102029", "story_v_out_103102.awb")

						arg_117_1:RecordAudio("103102029", var_120_39)
						arg_117_1:RecordAudio("103102029", var_120_39)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_103102", "103102029", "story_v_out_103102.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_103102", "103102029", "story_v_out_103102.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_40 = math.max(var_120_31, arg_117_1.talkMaxDuration)

			if var_120_30 <= arg_117_1.time_ and arg_117_1.time_ < var_120_30 + var_120_40 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_30) / var_120_40

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_30 + var_120_40 and arg_117_1.time_ < var_120_30 + var_120_40 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play103102030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 103102030
		arg_121_1.duration_ = 2

		local var_121_0 = {
			ja = 1.999999999999,
			ko = 2,
			zh = 1.999999999999,
			en = 1.999999999999
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play103102031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1084ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story == nil then
				arg_121_1.var_.characterEffect1084ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.1

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1084ui_story then
					arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1084ui_story then
				arg_121_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_124_4 = arg_121_1.actors_["4010ui_story"]
			local var_124_5 = 0

			if var_124_5 < arg_121_1.time_ and arg_121_1.time_ <= var_124_5 + arg_124_0 and arg_121_1.var_.characterEffect4010ui_story == nil then
				arg_121_1.var_.characterEffect4010ui_story = var_124_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_6 = 0.1

			if var_124_5 <= arg_121_1.time_ and arg_121_1.time_ < var_124_5 + var_124_6 then
				local var_124_7 = (arg_121_1.time_ - var_124_5) / var_124_6

				if arg_121_1.var_.characterEffect4010ui_story then
					local var_124_8 = Mathf.Lerp(0, 0.5, var_124_7)

					arg_121_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_121_1.var_.characterEffect4010ui_story.fillRatio = var_124_8
				end
			end

			if arg_121_1.time_ >= var_124_5 + var_124_6 and arg_121_1.time_ < var_124_5 + var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect4010ui_story then
				local var_124_9 = 0.5

				arg_121_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_121_1.var_.characterEffect4010ui_story.fillRatio = var_124_9
			end

			local var_124_10 = arg_121_1.actors_["4010ui_story"].transform
			local var_124_11 = 0

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1.var_.moveOldPos4010ui_story = var_124_10.localPosition
			end

			local var_124_12 = 0.001

			if var_124_11 <= arg_121_1.time_ and arg_121_1.time_ < var_124_11 + var_124_12 then
				local var_124_13 = (arg_121_1.time_ - var_124_11) / var_124_12
				local var_124_14 = Vector3.New(0, 100, 0)

				var_124_10.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos4010ui_story, var_124_14, var_124_13)

				local var_124_15 = manager.ui.mainCamera.transform.position - var_124_10.position

				var_124_10.forward = Vector3.New(var_124_15.x, var_124_15.y, var_124_15.z)

				local var_124_16 = var_124_10.localEulerAngles

				var_124_16.z = 0
				var_124_16.x = 0
				var_124_10.localEulerAngles = var_124_16
			end

			if arg_121_1.time_ >= var_124_11 + var_124_12 and arg_121_1.time_ < var_124_11 + var_124_12 + arg_124_0 then
				var_124_10.localPosition = Vector3.New(0, 100, 0)

				local var_124_17 = manager.ui.mainCamera.transform.position - var_124_10.position

				var_124_10.forward = Vector3.New(var_124_17.x, var_124_17.y, var_124_17.z)

				local var_124_18 = var_124_10.localEulerAngles

				var_124_18.z = 0
				var_124_18.x = 0
				var_124_10.localEulerAngles = var_124_18
			end

			local var_124_19 = 0

			if var_124_19 < arg_121_1.time_ and arg_121_1.time_ <= var_124_19 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_124_20 = arg_121_1.actors_["1084ui_story"].transform
			local var_124_21 = 0

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.var_.moveOldPos1084ui_story = var_124_20.localPosition

				local var_124_22 = "1084ui_story"

				arg_121_1:ShowWeapon(arg_121_1.var_[var_124_22 .. "Animator"].transform, true)
			end

			local var_124_23 = 0.001

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_23 then
				local var_124_24 = (arg_121_1.time_ - var_124_21) / var_124_23
				local var_124_25 = Vector3.New(0, -0.97, -6)

				var_124_20.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1084ui_story, var_124_25, var_124_24)

				local var_124_26 = manager.ui.mainCamera.transform.position - var_124_20.position

				var_124_20.forward = Vector3.New(var_124_26.x, var_124_26.y, var_124_26.z)

				local var_124_27 = var_124_20.localEulerAngles

				var_124_27.z = 0
				var_124_27.x = 0
				var_124_20.localEulerAngles = var_124_27
			end

			if arg_121_1.time_ >= var_124_21 + var_124_23 and arg_121_1.time_ < var_124_21 + var_124_23 + arg_124_0 then
				var_124_20.localPosition = Vector3.New(0, -0.97, -6)

				local var_124_28 = manager.ui.mainCamera.transform.position - var_124_20.position

				var_124_20.forward = Vector3.New(var_124_28.x, var_124_28.y, var_124_28.z)

				local var_124_29 = var_124_20.localEulerAngles

				var_124_29.z = 0
				var_124_29.x = 0
				var_124_20.localEulerAngles = var_124_29
			end

			local var_124_30 = 0

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_124_31 = 0
			local var_124_32 = 0.15

			if var_124_31 < arg_121_1.time_ and arg_121_1.time_ <= var_124_31 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_33 = arg_121_1:FormatText(StoryNameCfg[6].name)

				arg_121_1.leftNameTxt_.text = var_124_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_34 = arg_121_1:GetWordFromCfg(103102030)
				local var_124_35 = arg_121_1:FormatText(var_124_34.content)

				arg_121_1.text_.text = var_124_35

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_36 = 6
				local var_124_37 = utf8.len(var_124_35)
				local var_124_38 = var_124_36 <= 0 and var_124_32 or var_124_32 * (var_124_37 / var_124_36)

				if var_124_38 > 0 and var_124_32 < var_124_38 then
					arg_121_1.talkMaxDuration = var_124_38

					if var_124_38 + var_124_31 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_38 + var_124_31
					end
				end

				arg_121_1.text_.text = var_124_35
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102030", "story_v_out_103102.awb") ~= 0 then
					local var_124_39 = manager.audio:GetVoiceLength("story_v_out_103102", "103102030", "story_v_out_103102.awb") / 1000

					if var_124_39 + var_124_31 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_39 + var_124_31
					end

					if var_124_34.prefab_name ~= "" and arg_121_1.actors_[var_124_34.prefab_name] ~= nil then
						local var_124_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_34.prefab_name].transform, "story_v_out_103102", "103102030", "story_v_out_103102.awb")

						arg_121_1:RecordAudio("103102030", var_124_40)
						arg_121_1:RecordAudio("103102030", var_124_40)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_103102", "103102030", "story_v_out_103102.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_103102", "103102030", "story_v_out_103102.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_41 = math.max(var_124_32, arg_121_1.talkMaxDuration)

			if var_124_31 <= arg_121_1.time_ and arg_121_1.time_ < var_124_31 + var_124_41 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_31) / var_124_41

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_31 + var_124_41 and arg_121_1.time_ < var_124_31 + var_124_41 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play103102031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 103102031
		arg_125_1.duration_ = 14.433

		local var_125_0 = {
			ja = 14.433,
			ko = 10.066,
			zh = 11.466,
			en = 9.5
		}
		local var_125_1 = manager.audio:GetLocalizationFlag()

		if var_125_0[var_125_1] ~= nil then
			arg_125_1.duration_ = var_125_0[var_125_1]
		end

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play103102032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["4010ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story == nil then
				arg_125_1.var_.characterEffect4010ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.1

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect4010ui_story then
					arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect4010ui_story then
				arg_125_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["1084ui_story"]
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story == nil then
				arg_125_1.var_.characterEffect1084ui_story = var_128_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_6 = 0.1

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_6 then
				local var_128_7 = (arg_125_1.time_ - var_128_5) / var_128_6

				if arg_125_1.var_.characterEffect1084ui_story then
					local var_128_8 = Mathf.Lerp(0, 0.5, var_128_7)

					arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_8
				end
			end

			if arg_125_1.time_ >= var_128_5 + var_128_6 and arg_125_1.time_ < var_128_5 + var_128_6 + arg_128_0 and arg_125_1.var_.characterEffect1084ui_story then
				local var_128_9 = 0.5

				arg_125_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1084ui_story.fillRatio = var_128_9
			end

			local var_128_10 = arg_125_1.actors_["1084ui_story"].transform
			local var_128_11 = 0

			if var_128_11 < arg_125_1.time_ and arg_125_1.time_ <= var_128_11 + arg_128_0 then
				arg_125_1.var_.moveOldPos1084ui_story = var_128_10.localPosition

				local var_128_12 = "1084ui_story"

				arg_125_1:ShowWeapon(arg_125_1.var_[var_128_12 .. "Animator"].transform, false)
			end

			local var_128_13 = 0.001

			if var_128_11 <= arg_125_1.time_ and arg_125_1.time_ < var_128_11 + var_128_13 then
				local var_128_14 = (arg_125_1.time_ - var_128_11) / var_128_13
				local var_128_15 = Vector3.New(0, 100, 0)

				var_128_10.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1084ui_story, var_128_15, var_128_14)

				local var_128_16 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_16.x, var_128_16.y, var_128_16.z)

				local var_128_17 = var_128_10.localEulerAngles

				var_128_17.z = 0
				var_128_17.x = 0
				var_128_10.localEulerAngles = var_128_17
			end

			if arg_125_1.time_ >= var_128_11 + var_128_13 and arg_125_1.time_ < var_128_11 + var_128_13 + arg_128_0 then
				var_128_10.localPosition = Vector3.New(0, 100, 0)

				local var_128_18 = manager.ui.mainCamera.transform.position - var_128_10.position

				var_128_10.forward = Vector3.New(var_128_18.x, var_128_18.y, var_128_18.z)

				local var_128_19 = var_128_10.localEulerAngles

				var_128_19.z = 0
				var_128_19.x = 0
				var_128_10.localEulerAngles = var_128_19
			end

			local var_128_20 = arg_125_1.actors_["4010ui_story"].transform
			local var_128_21 = 0

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.var_.moveOldPos4010ui_story = var_128_20.localPosition
			end

			local var_128_22 = 0.001

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_22 then
				local var_128_23 = (arg_125_1.time_ - var_128_21) / var_128_22
				local var_128_24 = Vector3.New(0, -1.59, -5.2)

				var_128_20.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos4010ui_story, var_128_24, var_128_23)

				local var_128_25 = manager.ui.mainCamera.transform.position - var_128_20.position

				var_128_20.forward = Vector3.New(var_128_25.x, var_128_25.y, var_128_25.z)

				local var_128_26 = var_128_20.localEulerAngles

				var_128_26.z = 0
				var_128_26.x = 0
				var_128_20.localEulerAngles = var_128_26
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 then
				var_128_20.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_128_27 = manager.ui.mainCamera.transform.position - var_128_20.position

				var_128_20.forward = Vector3.New(var_128_27.x, var_128_27.y, var_128_27.z)

				local var_128_28 = var_128_20.localEulerAngles

				var_128_28.z = 0
				var_128_28.x = 0
				var_128_20.localEulerAngles = var_128_28
			end

			local var_128_29 = 0

			if var_128_29 < arg_125_1.time_ and arg_125_1.time_ <= var_128_29 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action4_1")
			end

			local var_128_30 = 0

			if var_128_30 < arg_125_1.time_ and arg_125_1.time_ <= var_128_30 + arg_128_0 then
				arg_125_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_128_31 = 0
			local var_128_32 = 1.3

			if var_128_31 < arg_125_1.time_ and arg_125_1.time_ <= var_128_31 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_33 = arg_125_1:FormatText(StoryNameCfg[42].name)

				arg_125_1.leftNameTxt_.text = var_128_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_34 = arg_125_1:GetWordFromCfg(103102031)
				local var_128_35 = arg_125_1:FormatText(var_128_34.content)

				arg_125_1.text_.text = var_128_35

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_36 = 54
				local var_128_37 = utf8.len(var_128_35)
				local var_128_38 = var_128_36 <= 0 and var_128_32 or var_128_32 * (var_128_37 / var_128_36)

				if var_128_38 > 0 and var_128_32 < var_128_38 then
					arg_125_1.talkMaxDuration = var_128_38

					if var_128_38 + var_128_31 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_38 + var_128_31
					end
				end

				arg_125_1.text_.text = var_128_35
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102031", "story_v_out_103102.awb") ~= 0 then
					local var_128_39 = manager.audio:GetVoiceLength("story_v_out_103102", "103102031", "story_v_out_103102.awb") / 1000

					if var_128_39 + var_128_31 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_39 + var_128_31
					end

					if var_128_34.prefab_name ~= "" and arg_125_1.actors_[var_128_34.prefab_name] ~= nil then
						local var_128_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_34.prefab_name].transform, "story_v_out_103102", "103102031", "story_v_out_103102.awb")

						arg_125_1:RecordAudio("103102031", var_128_40)
						arg_125_1:RecordAudio("103102031", var_128_40)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_103102", "103102031", "story_v_out_103102.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_103102", "103102031", "story_v_out_103102.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_41 = math.max(var_128_32, arg_125_1.talkMaxDuration)

			if var_128_31 <= arg_125_1.time_ and arg_125_1.time_ < var_128_31 + var_128_41 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_31) / var_128_41

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_31 + var_128_41 and arg_125_1.time_ < var_128_31 + var_128_41 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play103102032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 103102032
		arg_129_1.duration_ = 6.7

		local var_129_0 = {
			ja = 6.7,
			ko = 5.466,
			zh = 4.366,
			en = 6.266
		}
		local var_129_1 = manager.audio:GetLocalizationFlag()

		if var_129_0[var_129_1] ~= nil then
			arg_129_1.duration_ = var_129_0[var_129_1]
		end

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play103102033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = "1036ui_story"

			if arg_129_1.actors_[var_132_0] == nil then
				local var_132_1 = Object.Instantiate(Asset.Load("Char/" .. var_132_0), arg_129_1.stage_.transform)

				var_132_1.name = var_132_0
				var_132_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_129_1.actors_[var_132_0] = var_132_1

				local var_132_2 = var_132_1:GetComponentInChildren(typeof(CharacterEffect))

				var_132_2.enabled = true

				local var_132_3 = GameObjectTools.GetOrAddComponent(var_132_1, typeof(DynamicBoneHelper))

				if var_132_3 then
					var_132_3:EnableDynamicBone(false)
				end

				arg_129_1:ShowWeapon(var_132_2.transform, false)

				arg_129_1.var_[var_132_0 .. "Animator"] = var_132_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_129_1.var_[var_132_0 .. "Animator"].applyRootMotion = true
				arg_129_1.var_[var_132_0 .. "LipSync"] = var_132_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_132_4 = arg_129_1.actors_["1036ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect1036ui_story == nil then
				arg_129_1.var_.characterEffect1036ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.1

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect1036ui_story then
					arg_129_1.var_.characterEffect1036ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect1036ui_story then
				arg_129_1.var_.characterEffect1036ui_story.fillFlat = false
			end

			local var_132_8 = arg_129_1.actors_["4010ui_story"]
			local var_132_9 = 0

			if var_132_9 < arg_129_1.time_ and arg_129_1.time_ <= var_132_9 + arg_132_0 and arg_129_1.var_.characterEffect4010ui_story == nil then
				arg_129_1.var_.characterEffect4010ui_story = var_132_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_10 = 0.1

			if var_132_9 <= arg_129_1.time_ and arg_129_1.time_ < var_132_9 + var_132_10 then
				local var_132_11 = (arg_129_1.time_ - var_132_9) / var_132_10

				if arg_129_1.var_.characterEffect4010ui_story then
					local var_132_12 = Mathf.Lerp(0, 0.5, var_132_11)

					arg_129_1.var_.characterEffect4010ui_story.fillFlat = true
					arg_129_1.var_.characterEffect4010ui_story.fillRatio = var_132_12
				end
			end

			if arg_129_1.time_ >= var_132_9 + var_132_10 and arg_129_1.time_ < var_132_9 + var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect4010ui_story then
				local var_132_13 = 0.5

				arg_129_1.var_.characterEffect4010ui_story.fillFlat = true
				arg_129_1.var_.characterEffect4010ui_story.fillRatio = var_132_13
			end

			local var_132_14 = arg_129_1.actors_["4010ui_story"].transform
			local var_132_15 = 0

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.var_.moveOldPos4010ui_story = var_132_14.localPosition
			end

			local var_132_16 = 0.001

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_16 then
				local var_132_17 = (arg_129_1.time_ - var_132_15) / var_132_16
				local var_132_18 = Vector3.New(0, 100, 0)

				var_132_14.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos4010ui_story, var_132_18, var_132_17)

				local var_132_19 = manager.ui.mainCamera.transform.position - var_132_14.position

				var_132_14.forward = Vector3.New(var_132_19.x, var_132_19.y, var_132_19.z)

				local var_132_20 = var_132_14.localEulerAngles

				var_132_20.z = 0
				var_132_20.x = 0
				var_132_14.localEulerAngles = var_132_20
			end

			if arg_129_1.time_ >= var_132_15 + var_132_16 and arg_129_1.time_ < var_132_15 + var_132_16 + arg_132_0 then
				var_132_14.localPosition = Vector3.New(0, 100, 0)

				local var_132_21 = manager.ui.mainCamera.transform.position - var_132_14.position

				var_132_14.forward = Vector3.New(var_132_21.x, var_132_21.y, var_132_21.z)

				local var_132_22 = var_132_14.localEulerAngles

				var_132_22.z = 0
				var_132_22.x = 0
				var_132_14.localEulerAngles = var_132_22
			end

			local var_132_23 = 0

			if var_132_23 < arg_129_1.time_ and arg_129_1.time_ <= var_132_23 + arg_132_0 then
				arg_129_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/1036/1036action/1036action5_1")
			end

			local var_132_24 = arg_129_1.actors_["1036ui_story"].transform
			local var_132_25 = 0

			if var_132_25 < arg_129_1.time_ and arg_129_1.time_ <= var_132_25 + arg_132_0 then
				arg_129_1.var_.moveOldPos1036ui_story = var_132_24.localPosition
			end

			local var_132_26 = 0.001

			if var_132_25 <= arg_129_1.time_ and arg_129_1.time_ < var_132_25 + var_132_26 then
				local var_132_27 = (arg_129_1.time_ - var_132_25) / var_132_26
				local var_132_28 = Vector3.New(-0.7, -1.09, -5.78)

				var_132_24.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1036ui_story, var_132_28, var_132_27)

				local var_132_29 = manager.ui.mainCamera.transform.position - var_132_24.position

				var_132_24.forward = Vector3.New(var_132_29.x, var_132_29.y, var_132_29.z)

				local var_132_30 = var_132_24.localEulerAngles

				var_132_30.z = 0
				var_132_30.x = 0
				var_132_24.localEulerAngles = var_132_30
			end

			if arg_129_1.time_ >= var_132_25 + var_132_26 and arg_129_1.time_ < var_132_25 + var_132_26 + arg_132_0 then
				var_132_24.localPosition = Vector3.New(-0.7, -1.09, -5.78)

				local var_132_31 = manager.ui.mainCamera.transform.position - var_132_24.position

				var_132_24.forward = Vector3.New(var_132_31.x, var_132_31.y, var_132_31.z)

				local var_132_32 = var_132_24.localEulerAngles

				var_132_32.z = 0
				var_132_32.x = 0
				var_132_24.localEulerAngles = var_132_32
			end

			local var_132_33 = 0

			if var_132_33 < arg_129_1.time_ and arg_129_1.time_ <= var_132_33 + arg_132_0 then
				arg_129_1:PlayTimeline("1036ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_132_34 = 0
			local var_132_35 = 0.65

			if var_132_34 < arg_129_1.time_ and arg_129_1.time_ <= var_132_34 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_36 = arg_129_1:FormatText(StoryNameCfg[5].name)

				arg_129_1.leftNameTxt_.text = var_132_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_37 = arg_129_1:GetWordFromCfg(103102032)
				local var_132_38 = arg_129_1:FormatText(var_132_37.content)

				arg_129_1.text_.text = var_132_38

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_39 = 25
				local var_132_40 = utf8.len(var_132_38)
				local var_132_41 = var_132_39 <= 0 and var_132_35 or var_132_35 * (var_132_40 / var_132_39)

				if var_132_41 > 0 and var_132_35 < var_132_41 then
					arg_129_1.talkMaxDuration = var_132_41

					if var_132_41 + var_132_34 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_41 + var_132_34
					end
				end

				arg_129_1.text_.text = var_132_38
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102032", "story_v_out_103102.awb") ~= 0 then
					local var_132_42 = manager.audio:GetVoiceLength("story_v_out_103102", "103102032", "story_v_out_103102.awb") / 1000

					if var_132_42 + var_132_34 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_42 + var_132_34
					end

					if var_132_37.prefab_name ~= "" and arg_129_1.actors_[var_132_37.prefab_name] ~= nil then
						local var_132_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_37.prefab_name].transform, "story_v_out_103102", "103102032", "story_v_out_103102.awb")

						arg_129_1:RecordAudio("103102032", var_132_43)
						arg_129_1:RecordAudio("103102032", var_132_43)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_103102", "103102032", "story_v_out_103102.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_103102", "103102032", "story_v_out_103102.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_44 = math.max(var_132_35, arg_129_1.talkMaxDuration)

			if var_132_34 <= arg_129_1.time_ and arg_129_1.time_ < var_132_34 + var_132_44 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_34) / var_132_44

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_34 + var_132_44 and arg_129_1.time_ < var_132_34 + var_132_44 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play103102033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 103102033
		arg_133_1.duration_ = 1.999999999999

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play103102034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1084ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story == nil then
				arg_133_1.var_.characterEffect1084ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.1

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1084ui_story then
					arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story then
				arg_133_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_136_4 = arg_133_1.actors_["1036ui_story"]
			local var_136_5 = 0

			if var_136_5 < arg_133_1.time_ and arg_133_1.time_ <= var_136_5 + arg_136_0 and arg_133_1.var_.characterEffect1036ui_story == nil then
				arg_133_1.var_.characterEffect1036ui_story = var_136_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_6 = 0.1

			if var_136_5 <= arg_133_1.time_ and arg_133_1.time_ < var_136_5 + var_136_6 then
				local var_136_7 = (arg_133_1.time_ - var_136_5) / var_136_6

				if arg_133_1.var_.characterEffect1036ui_story then
					local var_136_8 = Mathf.Lerp(0, 0.5, var_136_7)

					arg_133_1.var_.characterEffect1036ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1036ui_story.fillRatio = var_136_8
				end
			end

			if arg_133_1.time_ >= var_136_5 + var_136_6 and arg_133_1.time_ < var_136_5 + var_136_6 + arg_136_0 and arg_133_1.var_.characterEffect1036ui_story then
				local var_136_9 = 0.5

				arg_133_1.var_.characterEffect1036ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1036ui_story.fillRatio = var_136_9
			end

			local var_136_10 = arg_133_1.actors_["1084ui_story"].transform
			local var_136_11 = 0

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1.var_.moveOldPos1084ui_story = var_136_10.localPosition

				local var_136_12 = "1084ui_story"

				arg_133_1:ShowWeapon(arg_133_1.var_[var_136_12 .. "Animator"].transform, false)
			end

			local var_136_13 = 0.001

			if var_136_11 <= arg_133_1.time_ and arg_133_1.time_ < var_136_11 + var_136_13 then
				local var_136_14 = (arg_133_1.time_ - var_136_11) / var_136_13
				local var_136_15 = Vector3.New(0.7, -0.97, -6)

				var_136_10.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1084ui_story, var_136_15, var_136_14)

				local var_136_16 = manager.ui.mainCamera.transform.position - var_136_10.position

				var_136_10.forward = Vector3.New(var_136_16.x, var_136_16.y, var_136_16.z)

				local var_136_17 = var_136_10.localEulerAngles

				var_136_17.z = 0
				var_136_17.x = 0
				var_136_10.localEulerAngles = var_136_17
			end

			if arg_133_1.time_ >= var_136_11 + var_136_13 and arg_133_1.time_ < var_136_11 + var_136_13 + arg_136_0 then
				var_136_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_136_18 = manager.ui.mainCamera.transform.position - var_136_10.position

				var_136_10.forward = Vector3.New(var_136_18.x, var_136_18.y, var_136_18.z)

				local var_136_19 = var_136_10.localEulerAngles

				var_136_19.z = 0
				var_136_19.x = 0
				var_136_10.localEulerAngles = var_136_19
			end

			local var_136_20 = 0

			if var_136_20 < arg_133_1.time_ and arg_133_1.time_ <= var_136_20 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_136_21 = 0

			if var_136_21 < arg_133_1.time_ and arg_133_1.time_ <= var_136_21 + arg_136_0 then
				arg_133_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_136_22 = 0
			local var_136_23 = 0.175

			if var_136_22 < arg_133_1.time_ and arg_133_1.time_ <= var_136_22 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_24 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_25 = arg_133_1:GetWordFromCfg(103102033)
				local var_136_26 = arg_133_1:FormatText(var_136_25.content)

				arg_133_1.text_.text = var_136_26

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_27 = 7
				local var_136_28 = utf8.len(var_136_26)
				local var_136_29 = var_136_27 <= 0 and var_136_23 or var_136_23 * (var_136_28 / var_136_27)

				if var_136_29 > 0 and var_136_23 < var_136_29 then
					arg_133_1.talkMaxDuration = var_136_29

					if var_136_29 + var_136_22 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_29 + var_136_22
					end
				end

				arg_133_1.text_.text = var_136_26
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102033", "story_v_out_103102.awb") ~= 0 then
					local var_136_30 = manager.audio:GetVoiceLength("story_v_out_103102", "103102033", "story_v_out_103102.awb") / 1000

					if var_136_30 + var_136_22 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_30 + var_136_22
					end

					if var_136_25.prefab_name ~= "" and arg_133_1.actors_[var_136_25.prefab_name] ~= nil then
						local var_136_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_25.prefab_name].transform, "story_v_out_103102", "103102033", "story_v_out_103102.awb")

						arg_133_1:RecordAudio("103102033", var_136_31)
						arg_133_1:RecordAudio("103102033", var_136_31)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_103102", "103102033", "story_v_out_103102.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_103102", "103102033", "story_v_out_103102.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_32 = math.max(var_136_23, arg_133_1.talkMaxDuration)

			if var_136_22 <= arg_133_1.time_ and arg_133_1.time_ < var_136_22 + var_136_32 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_22) / var_136_32

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_22 + var_136_32 and arg_133_1.time_ < var_136_22 + var_136_32 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play103102034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 103102034
		arg_137_1.duration_ = 6.6

		local var_137_0 = {
			ja = 6.6,
			ko = 4.466,
			zh = 5.766,
			en = 3.366
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
			arg_137_1.auto_ = false
		end

		function arg_137_1.playNext_(arg_139_0)
			arg_137_1.onStoryFinished_()
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["4010ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect4010ui_story == nil then
				arg_137_1.var_.characterEffect4010ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.1

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect4010ui_story then
					arg_137_1.var_.characterEffect4010ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect4010ui_story then
				arg_137_1.var_.characterEffect4010ui_story.fillFlat = false
			end

			local var_140_4 = arg_137_1.actors_["1084ui_story"]
			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_6 = 0.1

			if var_140_5 <= arg_137_1.time_ and arg_137_1.time_ < var_140_5 + var_140_6 then
				local var_140_7 = (arg_137_1.time_ - var_140_5) / var_140_6

				if arg_137_1.var_.characterEffect1084ui_story then
					local var_140_8 = Mathf.Lerp(0, 0.5, var_140_7)

					arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_8
				end
			end

			if arg_137_1.time_ >= var_140_5 + var_140_6 and arg_137_1.time_ < var_140_5 + var_140_6 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				local var_140_9 = 0.5

				arg_137_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1084ui_story.fillRatio = var_140_9
			end

			local var_140_10 = arg_137_1.actors_["1084ui_story"].transform
			local var_140_11 = 0

			if var_140_11 < arg_137_1.time_ and arg_137_1.time_ <= var_140_11 + arg_140_0 then
				arg_137_1.var_.moveOldPos1084ui_story = var_140_10.localPosition
			end

			local var_140_12 = 0.001

			if var_140_11 <= arg_137_1.time_ and arg_137_1.time_ < var_140_11 + var_140_12 then
				local var_140_13 = (arg_137_1.time_ - var_140_11) / var_140_12
				local var_140_14 = Vector3.New(0, 100, 0)

				var_140_10.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1084ui_story, var_140_14, var_140_13)

				local var_140_15 = manager.ui.mainCamera.transform.position - var_140_10.position

				var_140_10.forward = Vector3.New(var_140_15.x, var_140_15.y, var_140_15.z)

				local var_140_16 = var_140_10.localEulerAngles

				var_140_16.z = 0
				var_140_16.x = 0
				var_140_10.localEulerAngles = var_140_16
			end

			if arg_137_1.time_ >= var_140_11 + var_140_12 and arg_137_1.time_ < var_140_11 + var_140_12 + arg_140_0 then
				var_140_10.localPosition = Vector3.New(0, 100, 0)

				local var_140_17 = manager.ui.mainCamera.transform.position - var_140_10.position

				var_140_10.forward = Vector3.New(var_140_17.x, var_140_17.y, var_140_17.z)

				local var_140_18 = var_140_10.localEulerAngles

				var_140_18.z = 0
				var_140_18.x = 0
				var_140_10.localEulerAngles = var_140_18
			end

			local var_140_19 = arg_137_1.actors_["1036ui_story"].transform
			local var_140_20 = 0

			if var_140_20 < arg_137_1.time_ and arg_137_1.time_ <= var_140_20 + arg_140_0 then
				arg_137_1.var_.moveOldPos1036ui_story = var_140_19.localPosition
			end

			local var_140_21 = 0.001

			if var_140_20 <= arg_137_1.time_ and arg_137_1.time_ < var_140_20 + var_140_21 then
				local var_140_22 = (arg_137_1.time_ - var_140_20) / var_140_21
				local var_140_23 = Vector3.New(0, 100, 0)

				var_140_19.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1036ui_story, var_140_23, var_140_22)

				local var_140_24 = manager.ui.mainCamera.transform.position - var_140_19.position

				var_140_19.forward = Vector3.New(var_140_24.x, var_140_24.y, var_140_24.z)

				local var_140_25 = var_140_19.localEulerAngles

				var_140_25.z = 0
				var_140_25.x = 0
				var_140_19.localEulerAngles = var_140_25
			end

			if arg_137_1.time_ >= var_140_20 + var_140_21 and arg_137_1.time_ < var_140_20 + var_140_21 + arg_140_0 then
				var_140_19.localPosition = Vector3.New(0, 100, 0)

				local var_140_26 = manager.ui.mainCamera.transform.position - var_140_19.position

				var_140_19.forward = Vector3.New(var_140_26.x, var_140_26.y, var_140_26.z)

				local var_140_27 = var_140_19.localEulerAngles

				var_140_27.z = 0
				var_140_27.x = 0
				var_140_19.localEulerAngles = var_140_27
			end

			local var_140_28 = arg_137_1.actors_["4010ui_story"].transform
			local var_140_29 = 0

			if var_140_29 < arg_137_1.time_ and arg_137_1.time_ <= var_140_29 + arg_140_0 then
				arg_137_1.var_.moveOldPos4010ui_story = var_140_28.localPosition
			end

			local var_140_30 = 0.001

			if var_140_29 <= arg_137_1.time_ and arg_137_1.time_ < var_140_29 + var_140_30 then
				local var_140_31 = (arg_137_1.time_ - var_140_29) / var_140_30
				local var_140_32 = Vector3.New(0, -1.59, -5.2)

				var_140_28.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos4010ui_story, var_140_32, var_140_31)

				local var_140_33 = manager.ui.mainCamera.transform.position - var_140_28.position

				var_140_28.forward = Vector3.New(var_140_33.x, var_140_33.y, var_140_33.z)

				local var_140_34 = var_140_28.localEulerAngles

				var_140_34.z = 0
				var_140_34.x = 0
				var_140_28.localEulerAngles = var_140_34
			end

			if arg_137_1.time_ >= var_140_29 + var_140_30 and arg_137_1.time_ < var_140_29 + var_140_30 + arg_140_0 then
				var_140_28.localPosition = Vector3.New(0, -1.59, -5.2)

				local var_140_35 = manager.ui.mainCamera.transform.position - var_140_28.position

				var_140_28.forward = Vector3.New(var_140_35.x, var_140_35.y, var_140_35.z)

				local var_140_36 = var_140_28.localEulerAngles

				var_140_36.z = 0
				var_140_36.x = 0
				var_140_28.localEulerAngles = var_140_36
			end

			local var_140_37 = 0

			if var_140_37 < arg_137_1.time_ and arg_137_1.time_ <= var_140_37 + arg_140_0 then
				arg_137_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/story4010/story4010action/4010action1_1")
			end

			local var_140_38 = 0

			if var_140_38 < arg_137_1.time_ and arg_137_1.time_ <= var_140_38 + arg_140_0 then
				arg_137_1:PlayTimeline("4010ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_140_39 = 0
			local var_140_40 = 0.375

			if var_140_39 < arg_137_1.time_ and arg_137_1.time_ <= var_140_39 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_41 = arg_137_1:FormatText(StoryNameCfg[42].name)

				arg_137_1.leftNameTxt_.text = var_140_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_42 = arg_137_1:GetWordFromCfg(103102034)
				local var_140_43 = arg_137_1:FormatText(var_140_42.content)

				arg_137_1.text_.text = var_140_43

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_44 = 15
				local var_140_45 = utf8.len(var_140_43)
				local var_140_46 = var_140_44 <= 0 and var_140_40 or var_140_40 * (var_140_45 / var_140_44)

				if var_140_46 > 0 and var_140_40 < var_140_46 then
					arg_137_1.talkMaxDuration = var_140_46

					if var_140_46 + var_140_39 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_46 + var_140_39
					end
				end

				arg_137_1.text_.text = var_140_43
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_103102", "103102034", "story_v_out_103102.awb") ~= 0 then
					local var_140_47 = manager.audio:GetVoiceLength("story_v_out_103102", "103102034", "story_v_out_103102.awb") / 1000

					if var_140_47 + var_140_39 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_47 + var_140_39
					end

					if var_140_42.prefab_name ~= "" and arg_137_1.actors_[var_140_42.prefab_name] ~= nil then
						local var_140_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_42.prefab_name].transform, "story_v_out_103102", "103102034", "story_v_out_103102.awb")

						arg_137_1:RecordAudio("103102034", var_140_48)
						arg_137_1:RecordAudio("103102034", var_140_48)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_103102", "103102034", "story_v_out_103102.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_103102", "103102034", "story_v_out_103102.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_49 = math.max(var_140_40, arg_137_1.talkMaxDuration)

			if var_140_39 <= arg_137_1.time_ and arg_137_1.time_ < var_140_39 + var_140_49 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_39) / var_140_49

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_39 + var_140_49 and arg_137_1.time_ < var_140_39 + var_140_49 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B03d",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B03f"
	},
	voices = {
		"story_v_out_103102.awb"
	}
}
