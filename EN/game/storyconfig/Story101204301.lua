return {
	Play120431001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120431001
		arg_1_1.duration_ = 8.733

		local var_1_0 = {
			zh = 6.1,
			ja = 8.733
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
				arg_1_0:Play120431002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST31"

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
				local var_4_5 = arg_1_1.bgs_.ST31

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
					if iter_4_0 ~= "ST31" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
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

			local var_4_22 = 0
			local var_4_23 = 1

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_120_04", "se_story_120_04_street_loop", "")
			end

			local var_4_26 = "1076ui_story"

			if arg_1_1.actors_[var_4_26] == nil then
				local var_4_27 = Object.Instantiate(Asset.Load("Char/" .. var_4_26), arg_1_1.stage_.transform)

				var_4_27.name = var_4_26
				var_4_27.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_26] = var_4_27

				local var_4_28 = var_4_27:GetComponentInChildren(typeof(CharacterEffect))

				var_4_28.enabled = true

				local var_4_29 = GameObjectTools.GetOrAddComponent(var_4_27, typeof(DynamicBoneHelper))

				if var_4_29 then
					var_4_29:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_28.transform, false)

				arg_1_1.var_[var_4_26 .. "Animator"] = var_4_28.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_26 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_26 .. "LipSync"] = var_4_28.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_30 = arg_1_1.actors_["1076ui_story"].transform
			local var_4_31 = 1.8

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.var_.moveOldPos1076ui_story = var_4_30.localPosition
			end

			local var_4_32 = 0.001

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Vector3.New(-0.7, -1.06, -6.2)

				var_4_30.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1076ui_story, var_4_34, var_4_33)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_30.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_30.localEulerAngles = var_4_36
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				var_4_30.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_30.position

				var_4_30.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_30.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_30.localEulerAngles = var_4_38
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_4_41 = arg_1_1.actors_["1076ui_story"]
			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 and arg_1_1.var_.characterEffect1076ui_story == nil then
				arg_1_1.var_.characterEffect1076ui_story = var_4_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_43 = 0.2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				local var_4_44 = (arg_1_1.time_ - var_4_42) / var_4_43

				if arg_1_1.var_.characterEffect1076ui_story then
					arg_1_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 and arg_1_1.var_.characterEffect1076ui_story then
				arg_1_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_4_45 = 0.233333333333333
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			local var_4_49 = 0
			local var_4_50 = 0.2

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2
			local var_4_54 = 0.45

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_55 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_55:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[389].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(120431001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 18
				local var_4_60 = utf8.len(var_4_58)
				local var_4_61 = var_4_59 <= 0 and var_4_54 or var_4_54 * (var_4_60 / var_4_59)

				if var_4_61 > 0 and var_4_54 < var_4_61 then
					arg_1_1.talkMaxDuration = var_4_61
					var_4_53 = var_4_53 + 0.3

					if var_4_61 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_53
					end
				end

				arg_1_1.text_.text = var_4_58
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431001", "story_v_out_120431.awb") ~= 0 then
					local var_4_62 = manager.audio:GetVoiceLength("story_v_out_120431", "120431001", "story_v_out_120431.awb") / 1000

					if var_4_62 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_62 + var_4_53
					end

					if var_4_57.prefab_name ~= "" and arg_1_1.actors_[var_4_57.prefab_name] ~= nil then
						local var_4_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_57.prefab_name].transform, "story_v_out_120431", "120431001", "story_v_out_120431.awb")

						arg_1_1:RecordAudio("120431001", var_4_63)
						arg_1_1:RecordAudio("120431001", var_4_63)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120431", "120431001", "story_v_out_120431.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120431", "120431001", "story_v_out_120431.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_64 = var_4_53 + 0.3
			local var_4_65 = math.max(var_4_54, arg_1_1.talkMaxDuration)

			if var_4_64 <= arg_1_1.time_ and arg_1_1.time_ < var_4_64 + var_4_65 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_64) / var_4_65

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_64 + var_4_65 and arg_1_1.time_ < var_4_64 + var_4_65 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120431002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120431002
		arg_7_1.duration_ = 4.6

		local var_7_0 = {
			zh = 2.233,
			ja = 4.6
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play120431003(arg_7_1)
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

			local var_10_4 = 0

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_10_5 = arg_7_1.actors_["1084ui_story"]
			local var_10_6 = 0

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story == nil then
				arg_7_1.var_.characterEffect1084ui_story = var_10_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_7 = 0.2

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_7 then
				local var_10_8 = (arg_7_1.time_ - var_10_6) / var_10_7

				if arg_7_1.var_.characterEffect1084ui_story then
					arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_7_1.time_ >= var_10_6 + var_10_7 and arg_7_1.time_ < var_10_6 + var_10_7 + arg_10_0 and arg_7_1.var_.characterEffect1084ui_story then
				arg_7_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_10_9 = arg_7_1.actors_["1084ui_story"].transform
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 then
				arg_7_1.var_.moveOldPos1084ui_story = var_10_9.localPosition
			end

			local var_10_11 = 0.001

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11
				local var_10_13 = Vector3.New(0.7, -0.97, -6)

				var_10_9.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1084ui_story, var_10_13, var_10_12)

				local var_10_14 = manager.ui.mainCamera.transform.position - var_10_9.position

				var_10_9.forward = Vector3.New(var_10_14.x, var_10_14.y, var_10_14.z)

				local var_10_15 = var_10_9.localEulerAngles

				var_10_15.z = 0
				var_10_15.x = 0
				var_10_9.localEulerAngles = var_10_15
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 then
				var_10_9.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_10_16 = manager.ui.mainCamera.transform.position - var_10_9.position

				var_10_9.forward = Vector3.New(var_10_16.x, var_10_16.y, var_10_16.z)

				local var_10_17 = var_10_9.localEulerAngles

				var_10_17.z = 0
				var_10_17.x = 0
				var_10_9.localEulerAngles = var_10_17
			end

			local var_10_18 = arg_7_1.actors_["1076ui_story"]
			local var_10_19 = 0

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 and arg_7_1.var_.characterEffect1076ui_story == nil then
				arg_7_1.var_.characterEffect1076ui_story = var_10_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_20 = 0.2

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_20 then
				local var_10_21 = (arg_7_1.time_ - var_10_19) / var_10_20

				if arg_7_1.var_.characterEffect1076ui_story then
					local var_10_22 = Mathf.Lerp(0, 0.5, var_10_21)

					arg_7_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_7_1.var_.characterEffect1076ui_story.fillRatio = var_10_22
				end
			end

			if arg_7_1.time_ >= var_10_19 + var_10_20 and arg_7_1.time_ < var_10_19 + var_10_20 + arg_10_0 and arg_7_1.var_.characterEffect1076ui_story then
				local var_10_23 = 0.5

				arg_7_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_7_1.var_.characterEffect1076ui_story.fillRatio = var_10_23
			end

			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_10_25 = 0
			local var_10_26 = 0.3

			if var_10_25 < arg_7_1.time_ and arg_7_1.time_ <= var_10_25 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_27 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_28 = arg_7_1:GetWordFromCfg(120431002)
				local var_10_29 = arg_7_1:FormatText(var_10_28.content)

				arg_7_1.text_.text = var_10_29

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_30 = 13
				local var_10_31 = utf8.len(var_10_29)
				local var_10_32 = var_10_30 <= 0 and var_10_26 or var_10_26 * (var_10_31 / var_10_30)

				if var_10_32 > 0 and var_10_26 < var_10_32 then
					arg_7_1.talkMaxDuration = var_10_32

					if var_10_32 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_32 + var_10_25
					end
				end

				arg_7_1.text_.text = var_10_29
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431002", "story_v_out_120431.awb") ~= 0 then
					local var_10_33 = manager.audio:GetVoiceLength("story_v_out_120431", "120431002", "story_v_out_120431.awb") / 1000

					if var_10_33 + var_10_25 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_33 + var_10_25
					end

					if var_10_28.prefab_name ~= "" and arg_7_1.actors_[var_10_28.prefab_name] ~= nil then
						local var_10_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_28.prefab_name].transform, "story_v_out_120431", "120431002", "story_v_out_120431.awb")

						arg_7_1:RecordAudio("120431002", var_10_34)
						arg_7_1:RecordAudio("120431002", var_10_34)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_120431", "120431002", "story_v_out_120431.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_120431", "120431002", "story_v_out_120431.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_35 = math.max(var_10_26, arg_7_1.talkMaxDuration)

			if var_10_25 <= arg_7_1.time_ and arg_7_1.time_ < var_10_25 + var_10_35 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_25) / var_10_35

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_25 + var_10_35 and arg_7_1.time_ < var_10_25 + var_10_35 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play120431003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120431003
		arg_11_1.duration_ = 4.4

		local var_11_0 = {
			zh = 2.433,
			ja = 4.4
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
				arg_11_0:Play120431004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_14_1 = 0
			local var_14_2 = 0.275

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_3 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_4 = arg_11_1:GetWordFromCfg(120431003)
				local var_14_5 = arg_11_1:FormatText(var_14_4.content)

				arg_11_1.text_.text = var_14_5

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_6 = 11
				local var_14_7 = utf8.len(var_14_5)
				local var_14_8 = var_14_6 <= 0 and var_14_2 or var_14_2 * (var_14_7 / var_14_6)

				if var_14_8 > 0 and var_14_2 < var_14_8 then
					arg_11_1.talkMaxDuration = var_14_8

					if var_14_8 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_1
					end
				end

				arg_11_1.text_.text = var_14_5
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431003", "story_v_out_120431.awb") ~= 0 then
					local var_14_9 = manager.audio:GetVoiceLength("story_v_out_120431", "120431003", "story_v_out_120431.awb") / 1000

					if var_14_9 + var_14_1 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_1
					end

					if var_14_4.prefab_name ~= "" and arg_11_1.actors_[var_14_4.prefab_name] ~= nil then
						local var_14_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_4.prefab_name].transform, "story_v_out_120431", "120431003", "story_v_out_120431.awb")

						arg_11_1:RecordAudio("120431003", var_14_10)
						arg_11_1:RecordAudio("120431003", var_14_10)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120431", "120431003", "story_v_out_120431.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120431", "120431003", "story_v_out_120431.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_2, arg_11_1.talkMaxDuration)

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_1) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_1 + var_14_11 and arg_11_1.time_ < var_14_1 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120431004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120431004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play120431005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1084ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1084ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1084ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 0.45

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(120431004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 18
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_14 and arg_15_1.time_ < var_18_6 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120431005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120431005
		arg_19_1.duration_ = 4.9

		local var_19_0 = {
			zh = 3.4,
			ja = 4.9
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
				arg_19_0:Play120431006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1084ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1084ui_story then
					arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				arg_19_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_22_5 = 0
			local var_22_6 = 0.325

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_7 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_8 = arg_19_1:GetWordFromCfg(120431005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 13
				local var_22_11 = utf8.len(var_22_9)
				local var_22_12 = var_22_10 <= 0 and var_22_6 or var_22_6 * (var_22_11 / var_22_10)

				if var_22_12 > 0 and var_22_6 < var_22_12 then
					arg_19_1.talkMaxDuration = var_22_12

					if var_22_12 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_12 + var_22_5
					end
				end

				arg_19_1.text_.text = var_22_9
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431005", "story_v_out_120431.awb") ~= 0 then
					local var_22_13 = manager.audio:GetVoiceLength("story_v_out_120431", "120431005", "story_v_out_120431.awb") / 1000

					if var_22_13 + var_22_5 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_5
					end

					if var_22_8.prefab_name ~= "" and arg_19_1.actors_[var_22_8.prefab_name] ~= nil then
						local var_22_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_8.prefab_name].transform, "story_v_out_120431", "120431005", "story_v_out_120431.awb")

						arg_19_1:RecordAudio("120431005", var_22_14)
						arg_19_1:RecordAudio("120431005", var_22_14)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_120431", "120431005", "story_v_out_120431.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_120431", "120431005", "story_v_out_120431.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_15 = math.max(var_22_6, arg_19_1.talkMaxDuration)

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_15 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_5) / var_22_15

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_5 + var_22_15 and arg_19_1.time_ < var_22_5 + var_22_15 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120431006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120431006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120431007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1084ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story == nil then
				arg_23_1.var_.characterEffect1084ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1084ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1084ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1084ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 1.125

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_8 = arg_23_1:GetWordFromCfg(120431006)
				local var_26_9 = arg_23_1:FormatText(var_26_8.content)

				arg_23_1.text_.text = var_26_9

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_10 = 45
				local var_26_11 = utf8.len(var_26_9)
				local var_26_12 = var_26_10 <= 0 and var_26_7 or var_26_7 * (var_26_11 / var_26_10)

				if var_26_12 > 0 and var_26_7 < var_26_12 then
					arg_23_1.talkMaxDuration = var_26_12

					if var_26_12 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_9
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_13 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_13 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_13

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_13 and arg_23_1.time_ < var_26_6 + var_26_13 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play120431007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120431007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play120431008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.9

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(120431007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 36
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120431008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120431008
		arg_31_1.duration_ = 3.8

		local var_31_0 = {
			zh = 1.999999999999,
			ja = 3.8
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
				arg_31_0:Play120431009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1084ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story == nil then
				arg_31_1.var_.characterEffect1084ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1084ui_story then
					arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1084ui_story then
				arg_31_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_34_4 = 0

			if var_34_4 < arg_31_1.time_ and arg_31_1.time_ <= var_34_4 + arg_34_0 then
				arg_31_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_34_5 = 0
			local var_34_6 = 0.275

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_7 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(120431008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 11
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_6 or var_34_6 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_6 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_5
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431008", "story_v_out_120431.awb") ~= 0 then
					local var_34_13 = manager.audio:GetVoiceLength("story_v_out_120431", "120431008", "story_v_out_120431.awb") / 1000

					if var_34_13 + var_34_5 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_5
					end

					if var_34_8.prefab_name ~= "" and arg_31_1.actors_[var_34_8.prefab_name] ~= nil then
						local var_34_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_8.prefab_name].transform, "story_v_out_120431", "120431008", "story_v_out_120431.awb")

						arg_31_1:RecordAudio("120431008", var_34_14)
						arg_31_1:RecordAudio("120431008", var_34_14)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120431", "120431008", "story_v_out_120431.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120431", "120431008", "story_v_out_120431.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_15 = math.max(var_34_6, arg_31_1.talkMaxDuration)

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_15 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_5) / var_34_15

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_5 + var_34_15 and arg_31_1.time_ < var_34_5 + var_34_15 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120431009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120431009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play120431010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1084ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story == nil then
				arg_35_1.var_.characterEffect1084ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1084ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1084ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1084ui_story.fillRatio = var_38_5
			end

			local var_38_6 = 0
			local var_38_7 = 0.75

			if var_38_6 < arg_35_1.time_ and arg_35_1.time_ <= var_38_6 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_8 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_9 = arg_35_1:GetWordFromCfg(120431009)
				local var_38_10 = arg_35_1:FormatText(var_38_9.content)

				arg_35_1.text_.text = var_38_10

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_11 = 30
				local var_38_12 = utf8.len(var_38_10)
				local var_38_13 = var_38_11 <= 0 and var_38_7 or var_38_7 * (var_38_12 / var_38_11)

				if var_38_13 > 0 and var_38_7 < var_38_13 then
					arg_35_1.talkMaxDuration = var_38_13

					if var_38_13 + var_38_6 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_13 + var_38_6
					end
				end

				arg_35_1.text_.text = var_38_10
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_7, arg_35_1.talkMaxDuration)

			if var_38_6 <= arg_35_1.time_ and arg_35_1.time_ < var_38_6 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_6) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_6 + var_38_14 and arg_35_1.time_ < var_38_6 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120431010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120431010
		arg_39_1.duration_ = 7.333

		local var_39_0 = {
			zh = 1.8,
			ja = 7.333
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
				arg_39_0:Play120431011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1076ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story == nil then
				arg_39_1.var_.characterEffect1076ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1076ui_story then
					arg_39_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1076ui_story then
				arg_39_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_42_4 = 0
			local var_42_5 = 0.175

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_6 = arg_39_1:FormatText(StoryNameCfg[389].name)

				arg_39_1.leftNameTxt_.text = var_42_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_7 = arg_39_1:GetWordFromCfg(120431010)
				local var_42_8 = arg_39_1:FormatText(var_42_7.content)

				arg_39_1.text_.text = var_42_8

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_9 = 7
				local var_42_10 = utf8.len(var_42_8)
				local var_42_11 = var_42_9 <= 0 and var_42_5 or var_42_5 * (var_42_10 / var_42_9)

				if var_42_11 > 0 and var_42_5 < var_42_11 then
					arg_39_1.talkMaxDuration = var_42_11

					if var_42_11 + var_42_4 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_11 + var_42_4
					end
				end

				arg_39_1.text_.text = var_42_8
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431010", "story_v_out_120431.awb") ~= 0 then
					local var_42_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431010", "story_v_out_120431.awb") / 1000

					if var_42_12 + var_42_4 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_4
					end

					if var_42_7.prefab_name ~= "" and arg_39_1.actors_[var_42_7.prefab_name] ~= nil then
						local var_42_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_7.prefab_name].transform, "story_v_out_120431", "120431010", "story_v_out_120431.awb")

						arg_39_1:RecordAudio("120431010", var_42_13)
						arg_39_1:RecordAudio("120431010", var_42_13)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_120431", "120431010", "story_v_out_120431.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_120431", "120431010", "story_v_out_120431.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_14 = math.max(var_42_5, arg_39_1.talkMaxDuration)

			if var_42_4 <= arg_39_1.time_ and arg_39_1.time_ < var_42_4 + var_42_14 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_4) / var_42_14

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_4 + var_42_14 and arg_39_1.time_ < var_42_4 + var_42_14 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120431011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120431011
		arg_43_1.duration_ = 2.199999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play120431012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1084ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story == nil then
				arg_43_1.var_.characterEffect1084ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1084ui_story then
					arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1084ui_story then
				arg_43_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_46_4 = 0

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_46_5 = arg_43_1.actors_["1076ui_story"]
			local var_46_6 = 0

			if var_46_6 < arg_43_1.time_ and arg_43_1.time_ <= var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story == nil then
				arg_43_1.var_.characterEffect1076ui_story = var_46_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_7 = 0.2

			if var_46_6 <= arg_43_1.time_ and arg_43_1.time_ < var_46_6 + var_46_7 then
				local var_46_8 = (arg_43_1.time_ - var_46_6) / var_46_7

				if arg_43_1.var_.characterEffect1076ui_story then
					local var_46_9 = Mathf.Lerp(0, 0.5, var_46_8)

					arg_43_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1076ui_story.fillRatio = var_46_9
				end
			end

			if arg_43_1.time_ >= var_46_6 + var_46_7 and arg_43_1.time_ < var_46_6 + var_46_7 + arg_46_0 and arg_43_1.var_.characterEffect1076ui_story then
				local var_46_10 = 0.5

				arg_43_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1076ui_story.fillRatio = var_46_10
			end

			local var_46_11 = 0
			local var_46_12 = 0.05

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_13 = arg_43_1:FormatText(StoryNameCfg[401].name)

				arg_43_1.leftNameTxt_.text = var_46_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_14 = arg_43_1:GetWordFromCfg(120431011)
				local var_46_15 = arg_43_1:FormatText(var_46_14.content)

				arg_43_1.text_.text = var_46_15

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_16 = 2
				local var_46_17 = utf8.len(var_46_15)
				local var_46_18 = var_46_16 <= 0 and var_46_12 or var_46_12 * (var_46_17 / var_46_16)

				if var_46_18 > 0 and var_46_12 < var_46_18 then
					arg_43_1.talkMaxDuration = var_46_18

					if var_46_18 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_18 + var_46_11
					end
				end

				arg_43_1.text_.text = var_46_15
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431011", "story_v_out_120431.awb") ~= 0 then
					local var_46_19 = manager.audio:GetVoiceLength("story_v_out_120431", "120431011", "story_v_out_120431.awb") / 1000

					if var_46_19 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_11
					end

					if var_46_14.prefab_name ~= "" and arg_43_1.actors_[var_46_14.prefab_name] ~= nil then
						local var_46_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_14.prefab_name].transform, "story_v_out_120431", "120431011", "story_v_out_120431.awb")

						arg_43_1:RecordAudio("120431011", var_46_20)
						arg_43_1:RecordAudio("120431011", var_46_20)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120431", "120431011", "story_v_out_120431.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120431", "120431011", "story_v_out_120431.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_21 = math.max(var_46_12, arg_43_1.talkMaxDuration)

			if var_46_11 <= arg_43_1.time_ and arg_43_1.time_ < var_46_11 + var_46_21 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_11) / var_46_21

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_11 + var_46_21 and arg_43_1.time_ < var_46_11 + var_46_21 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120431012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120431012
		arg_47_1.duration_ = 6.5

		local var_47_0 = {
			zh = 5.466,
			ja = 6.5
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
				arg_47_0:Play120431013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1084ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1084ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1084ui_story.fillRatio = var_50_5
			end

			local var_50_6 = arg_47_1.actors_["1076ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story == nil then
				arg_47_1.var_.characterEffect1076ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.2

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1076ui_story then
					arg_47_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1076ui_story then
				arg_47_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_50_10 = 0
			local var_50_11 = 0.55

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_12 = arg_47_1:FormatText(StoryNameCfg[389].name)

				arg_47_1.leftNameTxt_.text = var_50_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_13 = arg_47_1:GetWordFromCfg(120431012)
				local var_50_14 = arg_47_1:FormatText(var_50_13.content)

				arg_47_1.text_.text = var_50_14

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_15 = 22
				local var_50_16 = utf8.len(var_50_14)
				local var_50_17 = var_50_15 <= 0 and var_50_11 or var_50_11 * (var_50_16 / var_50_15)

				if var_50_17 > 0 and var_50_11 < var_50_17 then
					arg_47_1.talkMaxDuration = var_50_17

					if var_50_17 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_17 + var_50_10
					end
				end

				arg_47_1.text_.text = var_50_14
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431012", "story_v_out_120431.awb") ~= 0 then
					local var_50_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431012", "story_v_out_120431.awb") / 1000

					if var_50_18 + var_50_10 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_18 + var_50_10
					end

					if var_50_13.prefab_name ~= "" and arg_47_1.actors_[var_50_13.prefab_name] ~= nil then
						local var_50_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_13.prefab_name].transform, "story_v_out_120431", "120431012", "story_v_out_120431.awb")

						arg_47_1:RecordAudio("120431012", var_50_19)
						arg_47_1:RecordAudio("120431012", var_50_19)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120431", "120431012", "story_v_out_120431.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120431", "120431012", "story_v_out_120431.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_20 = math.max(var_50_11, arg_47_1.talkMaxDuration)

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_20 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_10) / var_50_20

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_10 + var_50_20 and arg_47_1.time_ < var_50_10 + var_50_20 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120431013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120431013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120431014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1076ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story == nil then
				arg_51_1.var_.characterEffect1076ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1076ui_story then
					local var_54_4 = Mathf.Lerp(0, 0.5, var_54_3)

					arg_51_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1076ui_story.fillRatio = var_54_4
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1076ui_story then
				local var_54_5 = 0.5

				arg_51_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1076ui_story.fillRatio = var_54_5
			end

			local var_54_6 = 0
			local var_54_7 = 0.75

			if var_54_6 < arg_51_1.time_ and arg_51_1.time_ <= var_54_6 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_8 = arg_51_1:GetWordFromCfg(120431013)
				local var_54_9 = arg_51_1:FormatText(var_54_8.content)

				arg_51_1.text_.text = var_54_9

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_10 = 30
				local var_54_11 = utf8.len(var_54_9)
				local var_54_12 = var_54_10 <= 0 and var_54_7 or var_54_7 * (var_54_11 / var_54_10)

				if var_54_12 > 0 and var_54_7 < var_54_12 then
					arg_51_1.talkMaxDuration = var_54_12

					if var_54_12 + var_54_6 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_6
					end
				end

				arg_51_1.text_.text = var_54_9
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_13 = math.max(var_54_7, arg_51_1.talkMaxDuration)

			if var_54_6 <= arg_51_1.time_ and arg_51_1.time_ < var_54_6 + var_54_13 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_6) / var_54_13

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_6 + var_54_13 and arg_51_1.time_ < var_54_6 + var_54_13 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120431014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120431014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play120431015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.4

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(120431014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 16
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_8 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_8

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_8 and arg_55_1.time_ < var_58_0 + var_58_8 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120431015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120431015
		arg_59_1.duration_ = 5.633

		local var_59_0 = {
			zh = 5.633,
			ja = 5.5
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
				arg_59_0:Play120431016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1076ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story == nil then
				arg_59_1.var_.characterEffect1076ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1076ui_story then
					arg_59_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1076ui_story then
				arg_59_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_62_4 = 0
			local var_62_5 = 0.55

			if var_62_4 < arg_59_1.time_ and arg_59_1.time_ <= var_62_4 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_6 = arg_59_1:FormatText(StoryNameCfg[389].name)

				arg_59_1.leftNameTxt_.text = var_62_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_7 = arg_59_1:GetWordFromCfg(120431015)
				local var_62_8 = arg_59_1:FormatText(var_62_7.content)

				arg_59_1.text_.text = var_62_8

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_9 = 22
				local var_62_10 = utf8.len(var_62_8)
				local var_62_11 = var_62_9 <= 0 and var_62_5 or var_62_5 * (var_62_10 / var_62_9)

				if var_62_11 > 0 and var_62_5 < var_62_11 then
					arg_59_1.talkMaxDuration = var_62_11

					if var_62_11 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_11 + var_62_4
					end
				end

				arg_59_1.text_.text = var_62_8
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431015", "story_v_out_120431.awb") ~= 0 then
					local var_62_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431015", "story_v_out_120431.awb") / 1000

					if var_62_12 + var_62_4 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_12 + var_62_4
					end

					if var_62_7.prefab_name ~= "" and arg_59_1.actors_[var_62_7.prefab_name] ~= nil then
						local var_62_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_7.prefab_name].transform, "story_v_out_120431", "120431015", "story_v_out_120431.awb")

						arg_59_1:RecordAudio("120431015", var_62_13)
						arg_59_1:RecordAudio("120431015", var_62_13)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120431", "120431015", "story_v_out_120431.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120431", "120431015", "story_v_out_120431.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_14 = math.max(var_62_5, arg_59_1.talkMaxDuration)

			if var_62_4 <= arg_59_1.time_ and arg_59_1.time_ < var_62_4 + var_62_14 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_4) / var_62_14

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_4 + var_62_14 and arg_59_1.time_ < var_62_4 + var_62_14 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120431016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120431016
		arg_63_1.duration_ = 9

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play120431017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_1 = 2

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_1 then
				local var_66_2 = (arg_63_1.time_ - var_66_0) / var_66_1
				local var_66_3 = Color.New(0, 0, 0)

				var_66_3.a = Mathf.Lerp(0, 1, var_66_2)
				arg_63_1.mask_.color = var_66_3
			end

			if arg_63_1.time_ >= var_66_0 + var_66_1 and arg_63_1.time_ < var_66_0 + var_66_1 + arg_66_0 then
				local var_66_4 = Color.New(0, 0, 0)

				var_66_4.a = 1
				arg_63_1.mask_.color = var_66_4
			end

			local var_66_5 = 2

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_6 = 2

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6
				local var_66_8 = Color.New(0, 0, 0)

				var_66_8.a = Mathf.Lerp(1, 0, var_66_7)
				arg_63_1.mask_.color = var_66_8
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 then
				local var_66_9 = Color.New(0, 0, 0)
				local var_66_10 = 0

				arg_63_1.mask_.enabled = false
				var_66_9.a = var_66_10
				arg_63_1.mask_.color = var_66_9
			end

			local var_66_11 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_12 = 1.966

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_11.localPosition
			end

			local var_66_13 = 0.001

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_13 then
				local var_66_14 = (arg_63_1.time_ - var_66_12) / var_66_13
				local var_66_15 = Vector3.New(0, 100, 0)

				var_66_11.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_15, var_66_14)

				local var_66_16 = manager.ui.mainCamera.transform.position - var_66_11.position

				var_66_11.forward = Vector3.New(var_66_16.x, var_66_16.y, var_66_16.z)

				local var_66_17 = var_66_11.localEulerAngles

				var_66_17.z = 0
				var_66_17.x = 0
				var_66_11.localEulerAngles = var_66_17
			end

			if arg_63_1.time_ >= var_66_12 + var_66_13 and arg_63_1.time_ < var_66_12 + var_66_13 + arg_66_0 then
				var_66_11.localPosition = Vector3.New(0, 100, 0)

				local var_66_18 = manager.ui.mainCamera.transform.position - var_66_11.position

				var_66_11.forward = Vector3.New(var_66_18.x, var_66_18.y, var_66_18.z)

				local var_66_19 = var_66_11.localEulerAngles

				var_66_19.z = 0
				var_66_19.x = 0
				var_66_11.localEulerAngles = var_66_19
			end

			local var_66_20 = arg_63_1.actors_["1076ui_story"].transform
			local var_66_21 = 1.966

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.var_.moveOldPos1076ui_story = var_66_20.localPosition
			end

			local var_66_22 = 0.001

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Vector3.New(0, 100, 0)

				var_66_20.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1076ui_story, var_66_24, var_66_23)

				local var_66_25 = manager.ui.mainCamera.transform.position - var_66_20.position

				var_66_20.forward = Vector3.New(var_66_25.x, var_66_25.y, var_66_25.z)

				local var_66_26 = var_66_20.localEulerAngles

				var_66_26.z = 0
				var_66_26.x = 0
				var_66_20.localEulerAngles = var_66_26
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				var_66_20.localPosition = Vector3.New(0, 100, 0)

				local var_66_27 = manager.ui.mainCamera.transform.position - var_66_20.position

				var_66_20.forward = Vector3.New(var_66_27.x, var_66_27.y, var_66_27.z)

				local var_66_28 = var_66_20.localEulerAngles

				var_66_28.z = 0
				var_66_28.x = 0
				var_66_20.localEulerAngles = var_66_28
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_29 = 4
			local var_66_30 = 0.675

			if var_66_29 < arg_63_1.time_ and arg_63_1.time_ <= var_66_29 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_31 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_31:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_32 = arg_63_1:GetWordFromCfg(120431016)
				local var_66_33 = arg_63_1:FormatText(var_66_32.content)

				arg_63_1.text_.text = var_66_33

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_34 = 27
				local var_66_35 = utf8.len(var_66_33)
				local var_66_36 = var_66_34 <= 0 and var_66_30 or var_66_30 * (var_66_35 / var_66_34)

				if var_66_36 > 0 and var_66_30 < var_66_36 then
					arg_63_1.talkMaxDuration = var_66_36
					var_66_29 = var_66_29 + 0.3

					if var_66_36 + var_66_29 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_36 + var_66_29
					end
				end

				arg_63_1.text_.text = var_66_33
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_37 = var_66_29 + 0.3
			local var_66_38 = math.max(var_66_30, arg_63_1.talkMaxDuration)

			if var_66_37 <= arg_63_1.time_ and arg_63_1.time_ < var_66_37 + var_66_38 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_37) / var_66_38

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_37 + var_66_38 and arg_63_1.time_ < var_66_37 + var_66_38 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120431017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 120431017
		arg_69_1.duration_ = 3.9

		local var_69_0 = {
			zh = 2.666,
			ja = 3.9
		}
		local var_69_1 = manager.audio:GetLocalizationFlag()

		if var_69_0[var_69_1] ~= nil then
			arg_69_1.duration_ = var_69_0[var_69_1]
		end

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play120431018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 0.275

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[402].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(120431017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 11
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431017", "story_v_out_120431.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431017", "story_v_out_120431.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_out_120431", "120431017", "story_v_out_120431.awb")

						arg_69_1:RecordAudio("120431017", var_72_9)
						arg_69_1:RecordAudio("120431017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_120431", "120431017", "story_v_out_120431.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_120431", "120431017", "story_v_out_120431.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play120431018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 120431018
		arg_73_1.duration_ = 2.5

		local var_73_0 = {
			zh = 0.999999999999,
			ja = 2.5
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play120431019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1076ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1076ui_story == nil then
				arg_73_1.var_.characterEffect1076ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1076ui_story then
					arg_73_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1076ui_story then
				arg_73_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_76_4 = arg_73_1.actors_["1076ui_story"].transform
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.var_.moveOldPos1076ui_story = var_76_4.localPosition
			end

			local var_76_6 = 0.001

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6
				local var_76_8 = Vector3.New(0, -1.06, -6.2)

				var_76_4.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1076ui_story, var_76_8, var_76_7)

				local var_76_9 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_9.x, var_76_9.y, var_76_9.z)

				local var_76_10 = var_76_4.localEulerAngles

				var_76_10.z = 0
				var_76_10.x = 0
				var_76_4.localEulerAngles = var_76_10
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 then
				var_76_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_4.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_4.localEulerAngles = var_76_12
			end

			local var_76_13 = 0
			local var_76_14 = 0.05

			if var_76_13 < arg_73_1.time_ and arg_73_1.time_ <= var_76_13 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_15 = arg_73_1:FormatText(StoryNameCfg[389].name)

				arg_73_1.leftNameTxt_.text = var_76_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_16 = arg_73_1:GetWordFromCfg(120431018)
				local var_76_17 = arg_73_1:FormatText(var_76_16.content)

				arg_73_1.text_.text = var_76_17

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_18 = 2
				local var_76_19 = utf8.len(var_76_17)
				local var_76_20 = var_76_18 <= 0 and var_76_14 or var_76_14 * (var_76_19 / var_76_18)

				if var_76_20 > 0 and var_76_14 < var_76_20 then
					arg_73_1.talkMaxDuration = var_76_20

					if var_76_20 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_13
					end
				end

				arg_73_1.text_.text = var_76_17
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431018", "story_v_out_120431.awb") ~= 0 then
					local var_76_21 = manager.audio:GetVoiceLength("story_v_out_120431", "120431018", "story_v_out_120431.awb") / 1000

					if var_76_21 + var_76_13 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_21 + var_76_13
					end

					if var_76_16.prefab_name ~= "" and arg_73_1.actors_[var_76_16.prefab_name] ~= nil then
						local var_76_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_16.prefab_name].transform, "story_v_out_120431", "120431018", "story_v_out_120431.awb")

						arg_73_1:RecordAudio("120431018", var_76_22)
						arg_73_1:RecordAudio("120431018", var_76_22)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_120431", "120431018", "story_v_out_120431.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_120431", "120431018", "story_v_out_120431.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_23 = math.max(var_76_14, arg_73_1.talkMaxDuration)

			if var_76_13 <= arg_73_1.time_ and arg_73_1.time_ < var_76_13 + var_76_23 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_13) / var_76_23

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_13 + var_76_23 and arg_73_1.time_ < var_76_13 + var_76_23 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play120431019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 120431019
		arg_77_1.duration_ = 6.466

		local var_77_0 = {
			zh = 6.166,
			ja = 6.466
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
				arg_77_0:Play120431020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1076ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect1076ui_story == nil then
				arg_77_1.var_.characterEffect1076ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect1076ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1076ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect1076ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1076ui_story.fillRatio = var_80_5
			end

			local var_80_6 = 0
			local var_80_7 = 0.75

			if var_80_6 < arg_77_1.time_ and arg_77_1.time_ <= var_80_6 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_8 = arg_77_1:FormatText(StoryNameCfg[403].name)

				arg_77_1.leftNameTxt_.text = var_80_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwa")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_9 = arg_77_1:GetWordFromCfg(120431019)
				local var_80_10 = arg_77_1:FormatText(var_80_9.content)

				arg_77_1.text_.text = var_80_10

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_11 = 29
				local var_80_12 = utf8.len(var_80_10)
				local var_80_13 = var_80_11 <= 0 and var_80_7 or var_80_7 * (var_80_12 / var_80_11)

				if var_80_13 > 0 and var_80_7 < var_80_13 then
					arg_77_1.talkMaxDuration = var_80_13

					if var_80_13 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_13 + var_80_6
					end
				end

				arg_77_1.text_.text = var_80_10
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431019", "story_v_out_120431.awb") ~= 0 then
					local var_80_14 = manager.audio:GetVoiceLength("story_v_out_120431", "120431019", "story_v_out_120431.awb") / 1000

					if var_80_14 + var_80_6 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_14 + var_80_6
					end

					if var_80_9.prefab_name ~= "" and arg_77_1.actors_[var_80_9.prefab_name] ~= nil then
						local var_80_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_9.prefab_name].transform, "story_v_out_120431", "120431019", "story_v_out_120431.awb")

						arg_77_1:RecordAudio("120431019", var_80_15)
						arg_77_1:RecordAudio("120431019", var_80_15)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_120431", "120431019", "story_v_out_120431.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_120431", "120431019", "story_v_out_120431.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_16 = math.max(var_80_7, arg_77_1.talkMaxDuration)

			if var_80_6 <= arg_77_1.time_ and arg_77_1.time_ < var_80_6 + var_80_16 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_6) / var_80_16

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_6 + var_80_16 and arg_77_1.time_ < var_80_6 + var_80_16 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play120431020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 120431020
		arg_81_1.duration_ = 10.866

		local var_81_0 = {
			zh = 8.033,
			ja = 10.866
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play120431021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 1.05

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[402].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(120431020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 42
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431020", "story_v_out_120431.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431020", "story_v_out_120431.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_out_120431", "120431020", "story_v_out_120431.awb")

						arg_81_1:RecordAudio("120431020", var_84_9)
						arg_81_1:RecordAudio("120431020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_120431", "120431020", "story_v_out_120431.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_120431", "120431020", "story_v_out_120431.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play120431021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 120431021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play120431022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.875

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_2 = arg_85_1:GetWordFromCfg(120431021)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 35
				local var_88_5 = utf8.len(var_88_3)
				local var_88_6 = var_88_4 <= 0 and var_88_1 or var_88_1 * (var_88_5 / var_88_4)

				if var_88_6 > 0 and var_88_1 < var_88_6 then
					arg_85_1.talkMaxDuration = var_88_6

					if var_88_6 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_6 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_3
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_7 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_7 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_7

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_7 and arg_85_1.time_ < var_88_0 + var_88_7 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play120431022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 120431022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play120431023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.75

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, false)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_2 = arg_89_1:GetWordFromCfg(120431022)
				local var_92_3 = arg_89_1:FormatText(var_92_2.content)

				arg_89_1.text_.text = var_92_3

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_4 = 30
				local var_92_5 = utf8.len(var_92_3)
				local var_92_6 = var_92_4 <= 0 and var_92_1 or var_92_1 * (var_92_5 / var_92_4)

				if var_92_6 > 0 and var_92_1 < var_92_6 then
					arg_89_1.talkMaxDuration = var_92_6

					if var_92_6 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_6 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_3
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_7 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_7 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_7

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_7 and arg_89_1.time_ < var_92_0 + var_92_7 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play120431023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 120431023
		arg_93_1.duration_ = 8.966

		local var_93_0 = {
			zh = 5.7,
			ja = 8.966
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
				arg_93_0:Play120431024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1076ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1076ui_story == nil then
				arg_93_1.var_.characterEffect1076ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1076ui_story then
					arg_93_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1076ui_story then
				arg_93_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_96_4 = 0
			local var_96_5 = 0.675

			if var_96_4 < arg_93_1.time_ and arg_93_1.time_ <= var_96_4 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_6 = arg_93_1:FormatText(StoryNameCfg[389].name)

				arg_93_1.leftNameTxt_.text = var_96_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_7 = arg_93_1:GetWordFromCfg(120431023)
				local var_96_8 = arg_93_1:FormatText(var_96_7.content)

				arg_93_1.text_.text = var_96_8

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_9 = 27
				local var_96_10 = utf8.len(var_96_8)
				local var_96_11 = var_96_9 <= 0 and var_96_5 or var_96_5 * (var_96_10 / var_96_9)

				if var_96_11 > 0 and var_96_5 < var_96_11 then
					arg_93_1.talkMaxDuration = var_96_11

					if var_96_11 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_11 + var_96_4
					end
				end

				arg_93_1.text_.text = var_96_8
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431023", "story_v_out_120431.awb") ~= 0 then
					local var_96_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431023", "story_v_out_120431.awb") / 1000

					if var_96_12 + var_96_4 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_4
					end

					if var_96_7.prefab_name ~= "" and arg_93_1.actors_[var_96_7.prefab_name] ~= nil then
						local var_96_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_7.prefab_name].transform, "story_v_out_120431", "120431023", "story_v_out_120431.awb")

						arg_93_1:RecordAudio("120431023", var_96_13)
						arg_93_1:RecordAudio("120431023", var_96_13)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_120431", "120431023", "story_v_out_120431.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_120431", "120431023", "story_v_out_120431.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_5, arg_93_1.talkMaxDuration)

			if var_96_4 <= arg_93_1.time_ and arg_93_1.time_ < var_96_4 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_4) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_4 + var_96_14 and arg_93_1.time_ < var_96_4 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play120431024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 120431024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play120431025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1076ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1076ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, 100, 0)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1076ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, 100, 0)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = 0
			local var_100_10 = 1.2

			if var_100_9 < arg_97_1.time_ and arg_97_1.time_ <= var_100_9 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_11 = arg_97_1:GetWordFromCfg(120431024)
				local var_100_12 = arg_97_1:FormatText(var_100_11.content)

				arg_97_1.text_.text = var_100_12

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_13 = 48
				local var_100_14 = utf8.len(var_100_12)
				local var_100_15 = var_100_13 <= 0 and var_100_10 or var_100_10 * (var_100_14 / var_100_13)

				if var_100_15 > 0 and var_100_10 < var_100_15 then
					arg_97_1.talkMaxDuration = var_100_15

					if var_100_15 + var_100_9 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_15 + var_100_9
					end
				end

				arg_97_1.text_.text = var_100_12
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_10, arg_97_1.talkMaxDuration)

			if var_100_9 <= arg_97_1.time_ and arg_97_1.time_ < var_100_9 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_9) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_9 + var_100_16 and arg_97_1.time_ < var_100_9 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play120431025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 120431025
		arg_101_1.duration_ = 5

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play120431026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.525

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, false)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_2 = arg_101_1:GetWordFromCfg(120431025)
				local var_104_3 = arg_101_1:FormatText(var_104_2.content)

				arg_101_1.text_.text = var_104_3

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_4 = 21
				local var_104_5 = utf8.len(var_104_3)
				local var_104_6 = var_104_4 <= 0 and var_104_1 or var_104_1 * (var_104_5 / var_104_4)

				if var_104_6 > 0 and var_104_1 < var_104_6 then
					arg_101_1.talkMaxDuration = var_104_6

					if var_104_6 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_6 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_3
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)
				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_7 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_7 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_7

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_7 and arg_101_1.time_ < var_104_0 + var_104_7 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play120431026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 120431026
		arg_105_1.duration_ = 5.466

		local var_105_0 = {
			zh = 4.4,
			ja = 5.466
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
				arg_105_0:Play120431027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1084ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos1084ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(-0.7, -0.97, -6)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1084ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["1084ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story == nil then
				arg_105_1.var_.characterEffect1084ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.2

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect1084ui_story then
					arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect1084ui_story then
				arg_105_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_108_15 = 0
			local var_108_16 = 0.425

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_17 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_18 = arg_105_1:GetWordFromCfg(120431026)
				local var_108_19 = arg_105_1:FormatText(var_108_18.content)

				arg_105_1.text_.text = var_108_19

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_20 = 17
				local var_108_21 = utf8.len(var_108_19)
				local var_108_22 = var_108_20 <= 0 and var_108_16 or var_108_16 * (var_108_21 / var_108_20)

				if var_108_22 > 0 and var_108_16 < var_108_22 then
					arg_105_1.talkMaxDuration = var_108_22

					if var_108_22 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_22 + var_108_15
					end
				end

				arg_105_1.text_.text = var_108_19
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431026", "story_v_out_120431.awb") ~= 0 then
					local var_108_23 = manager.audio:GetVoiceLength("story_v_out_120431", "120431026", "story_v_out_120431.awb") / 1000

					if var_108_23 + var_108_15 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_23 + var_108_15
					end

					if var_108_18.prefab_name ~= "" and arg_105_1.actors_[var_108_18.prefab_name] ~= nil then
						local var_108_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_18.prefab_name].transform, "story_v_out_120431", "120431026", "story_v_out_120431.awb")

						arg_105_1:RecordAudio("120431026", var_108_24)
						arg_105_1:RecordAudio("120431026", var_108_24)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_120431", "120431026", "story_v_out_120431.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_120431", "120431026", "story_v_out_120431.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_25 = math.max(var_108_16, arg_105_1.talkMaxDuration)

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_25 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_15) / var_108_25

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_15 + var_108_25 and arg_105_1.time_ < var_108_15 + var_108_25 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play120431027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 120431027
		arg_109_1.duration_ = 1.4

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play120431028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1076ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1076ui_story == nil then
				arg_109_1.var_.characterEffect1076ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.2

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1076ui_story then
					arg_109_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1076ui_story then
				arg_109_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_112_4 = arg_109_1.actors_["1076ui_story"].transform
			local var_112_5 = 0

			if var_112_5 < arg_109_1.time_ and arg_109_1.time_ <= var_112_5 + arg_112_0 then
				arg_109_1.var_.moveOldPos1076ui_story = var_112_4.localPosition
			end

			local var_112_6 = 0.001

			if var_112_5 <= arg_109_1.time_ and arg_109_1.time_ < var_112_5 + var_112_6 then
				local var_112_7 = (arg_109_1.time_ - var_112_5) / var_112_6
				local var_112_8 = Vector3.New(0.7, -1.06, -6.2)

				var_112_4.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1076ui_story, var_112_8, var_112_7)

				local var_112_9 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_9.x, var_112_9.y, var_112_9.z)

				local var_112_10 = var_112_4.localEulerAngles

				var_112_10.z = 0
				var_112_10.x = 0
				var_112_4.localEulerAngles = var_112_10
			end

			if arg_109_1.time_ >= var_112_5 + var_112_6 and arg_109_1.time_ < var_112_5 + var_112_6 + arg_112_0 then
				var_112_4.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_112_11 = manager.ui.mainCamera.transform.position - var_112_4.position

				var_112_4.forward = Vector3.New(var_112_11.x, var_112_11.y, var_112_11.z)

				local var_112_12 = var_112_4.localEulerAngles

				var_112_12.z = 0
				var_112_12.x = 0
				var_112_4.localEulerAngles = var_112_12
			end

			local var_112_13 = arg_109_1.actors_["1084ui_story"]
			local var_112_14 = 0

			if var_112_14 < arg_109_1.time_ and arg_109_1.time_ <= var_112_14 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story == nil then
				arg_109_1.var_.characterEffect1084ui_story = var_112_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_15 = 0.2

			if var_112_14 <= arg_109_1.time_ and arg_109_1.time_ < var_112_14 + var_112_15 then
				local var_112_16 = (arg_109_1.time_ - var_112_14) / var_112_15

				if arg_109_1.var_.characterEffect1084ui_story then
					local var_112_17 = Mathf.Lerp(0, 0.5, var_112_16)

					arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_17
				end
			end

			if arg_109_1.time_ >= var_112_14 + var_112_15 and arg_109_1.time_ < var_112_14 + var_112_15 + arg_112_0 and arg_109_1.var_.characterEffect1084ui_story then
				local var_112_18 = 0.5

				arg_109_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1084ui_story.fillRatio = var_112_18
			end

			local var_112_19 = 0
			local var_112_20 = 0.125

			if var_112_19 < arg_109_1.time_ and arg_109_1.time_ <= var_112_19 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_21 = arg_109_1:FormatText(StoryNameCfg[389].name)

				arg_109_1.leftNameTxt_.text = var_112_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_22 = arg_109_1:GetWordFromCfg(120431027)
				local var_112_23 = arg_109_1:FormatText(var_112_22.content)

				arg_109_1.text_.text = var_112_23

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_24 = 5
				local var_112_25 = utf8.len(var_112_23)
				local var_112_26 = var_112_24 <= 0 and var_112_20 or var_112_20 * (var_112_25 / var_112_24)

				if var_112_26 > 0 and var_112_20 < var_112_26 then
					arg_109_1.talkMaxDuration = var_112_26

					if var_112_26 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_26 + var_112_19
					end
				end

				arg_109_1.text_.text = var_112_23
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431027", "story_v_out_120431.awb") ~= 0 then
					local var_112_27 = manager.audio:GetVoiceLength("story_v_out_120431", "120431027", "story_v_out_120431.awb") / 1000

					if var_112_27 + var_112_19 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_27 + var_112_19
					end

					if var_112_22.prefab_name ~= "" and arg_109_1.actors_[var_112_22.prefab_name] ~= nil then
						local var_112_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_22.prefab_name].transform, "story_v_out_120431", "120431027", "story_v_out_120431.awb")

						arg_109_1:RecordAudio("120431027", var_112_28)
						arg_109_1:RecordAudio("120431027", var_112_28)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_120431", "120431027", "story_v_out_120431.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_120431", "120431027", "story_v_out_120431.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_29 = math.max(var_112_20, arg_109_1.talkMaxDuration)

			if var_112_19 <= arg_109_1.time_ and arg_109_1.time_ < var_112_19 + var_112_29 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_19) / var_112_29

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_19 + var_112_29 and arg_109_1.time_ < var_112_19 + var_112_29 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play120431028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 120431028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play120431029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1076ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1076ui_story == nil then
				arg_113_1.var_.characterEffect1076ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1076ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1076ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1076ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1076ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 0.775

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_8 = arg_113_1:GetWordFromCfg(120431028)
				local var_116_9 = arg_113_1:FormatText(var_116_8.content)

				arg_113_1.text_.text = var_116_9

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_10 = 31
				local var_116_11 = utf8.len(var_116_9)
				local var_116_12 = var_116_10 <= 0 and var_116_7 or var_116_7 * (var_116_11 / var_116_10)

				if var_116_12 > 0 and var_116_7 < var_116_12 then
					arg_113_1.talkMaxDuration = var_116_12

					if var_116_12 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_12 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_9
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_13 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_13 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_13

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_13 and arg_113_1.time_ < var_116_6 + var_116_13 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play120431029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 120431029
		arg_117_1.duration_ = 8.4

		local var_117_0 = {
			zh = 5.366,
			ja = 8.4
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
				arg_117_0:Play120431030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_2 = "stop"
				local var_120_3 = "effect"

				arg_117_1:AudioAction(var_120_2, var_120_3, "se_story_120_04", "se_story_120_04_street_loop", "")
			end

			local var_120_4 = arg_117_1.actors_["1076ui_story"]
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 and arg_117_1.var_.characterEffect1076ui_story == nil then
				arg_117_1.var_.characterEffect1076ui_story = var_120_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_6 = 0.2

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / var_120_6

				if arg_117_1.var_.characterEffect1076ui_story then
					arg_117_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 and arg_117_1.var_.characterEffect1076ui_story then
				arg_117_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_120_8 = 0
			local var_120_9 = 0.575

			if var_120_8 < arg_117_1.time_ and arg_117_1.time_ <= var_120_8 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_10 = arg_117_1:FormatText(StoryNameCfg[389].name)

				arg_117_1.leftNameTxt_.text = var_120_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_11 = arg_117_1:GetWordFromCfg(120431029)
				local var_120_12 = arg_117_1:FormatText(var_120_11.content)

				arg_117_1.text_.text = var_120_12

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_13 = 23
				local var_120_14 = utf8.len(var_120_12)
				local var_120_15 = var_120_13 <= 0 and var_120_9 or var_120_9 * (var_120_14 / var_120_13)

				if var_120_15 > 0 and var_120_9 < var_120_15 then
					arg_117_1.talkMaxDuration = var_120_15

					if var_120_15 + var_120_8 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_15 + var_120_8
					end
				end

				arg_117_1.text_.text = var_120_12
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431029", "story_v_out_120431.awb") ~= 0 then
					local var_120_16 = manager.audio:GetVoiceLength("story_v_out_120431", "120431029", "story_v_out_120431.awb") / 1000

					if var_120_16 + var_120_8 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_16 + var_120_8
					end

					if var_120_11.prefab_name ~= "" and arg_117_1.actors_[var_120_11.prefab_name] ~= nil then
						local var_120_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_11.prefab_name].transform, "story_v_out_120431", "120431029", "story_v_out_120431.awb")

						arg_117_1:RecordAudio("120431029", var_120_17)
						arg_117_1:RecordAudio("120431029", var_120_17)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_120431", "120431029", "story_v_out_120431.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_120431", "120431029", "story_v_out_120431.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_18 = math.max(var_120_9, arg_117_1.talkMaxDuration)

			if var_120_8 <= arg_117_1.time_ and arg_117_1.time_ < var_120_8 + var_120_18 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_8) / var_120_18

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_8 + var_120_18 and arg_117_1.time_ < var_120_8 + var_120_18 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play120431030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 120431030
		arg_121_1.duration_ = 7.133

		local var_121_0 = {
			zh = 7.133,
			ja = 6.866
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
				arg_121_0:Play120431031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.475

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[389].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(120431030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 19
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431030", "story_v_out_120431.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431030", "story_v_out_120431.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_120431", "120431030", "story_v_out_120431.awb")

						arg_121_1:RecordAudio("120431030", var_124_9)
						arg_121_1:RecordAudio("120431030", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_120431", "120431030", "story_v_out_120431.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_120431", "120431030", "story_v_out_120431.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play120431031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 120431031
		arg_125_1.duration_ = 9

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play120431032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = "ST32a"

			if arg_125_1.bgs_[var_128_0] == nil then
				local var_128_1 = Object.Instantiate(arg_125_1.paintGo_)

				var_128_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_128_0)
				var_128_1.name = var_128_0
				var_128_1.transform.parent = arg_125_1.stage_.transform
				var_128_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_125_1.bgs_[var_128_0] = var_128_1
			end

			local var_128_2 = 2

			if var_128_2 < arg_125_1.time_ and arg_125_1.time_ <= var_128_2 + arg_128_0 then
				local var_128_3 = manager.ui.mainCamera.transform.localPosition
				local var_128_4 = Vector3.New(0, 0, 10) + Vector3.New(var_128_3.x, var_128_3.y, 0)
				local var_128_5 = arg_125_1.bgs_.ST32a

				var_128_5.transform.localPosition = var_128_4
				var_128_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_6 = var_128_5:GetComponent("SpriteRenderer")

				if var_128_6 and var_128_6.sprite then
					local var_128_7 = (var_128_5.transform.localPosition - var_128_3).z
					local var_128_8 = manager.ui.mainCameraCom_
					local var_128_9 = 2 * var_128_7 * Mathf.Tan(var_128_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_10 = var_128_9 * var_128_8.aspect
					local var_128_11 = var_128_6.sprite.bounds.size.x
					local var_128_12 = var_128_6.sprite.bounds.size.y
					local var_128_13 = var_128_10 / var_128_11
					local var_128_14 = var_128_9 / var_128_12
					local var_128_15 = var_128_14 < var_128_13 and var_128_13 or var_128_14

					var_128_5.transform.localScale = Vector3.New(var_128_15, var_128_15, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "ST32a" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_17 = 2

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17
				local var_128_19 = Color.New(0, 0, 0)

				var_128_19.a = Mathf.Lerp(0, 1, var_128_18)
				arg_125_1.mask_.color = var_128_19
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 then
				local var_128_20 = Color.New(0, 0, 0)

				var_128_20.a = 1
				arg_125_1.mask_.color = var_128_20
			end

			local var_128_21 = 2

			if var_128_21 < arg_125_1.time_ and arg_125_1.time_ <= var_128_21 + arg_128_0 then
				arg_125_1.mask_.enabled = true
				arg_125_1.mask_.raycastTarget = true

				arg_125_1:SetGaussion(false)
			end

			local var_128_22 = 2

			if var_128_21 <= arg_125_1.time_ and arg_125_1.time_ < var_128_21 + var_128_22 then
				local var_128_23 = (arg_125_1.time_ - var_128_21) / var_128_22
				local var_128_24 = Color.New(0, 0, 0)

				var_128_24.a = Mathf.Lerp(1, 0, var_128_23)
				arg_125_1.mask_.color = var_128_24
			end

			if arg_125_1.time_ >= var_128_21 + var_128_22 and arg_125_1.time_ < var_128_21 + var_128_22 + arg_128_0 then
				local var_128_25 = Color.New(0, 0, 0)
				local var_128_26 = 0

				arg_125_1.mask_.enabled = false
				var_128_25.a = var_128_26
				arg_125_1.mask_.color = var_128_25
			end

			local var_128_27 = 0
			local var_128_28 = 1

			if var_128_27 < arg_125_1.time_ and arg_125_1.time_ <= var_128_27 + arg_128_0 then
				local var_128_29 = "play"
				local var_128_30 = "effect"

				arg_125_1:AudioAction(var_128_29, var_128_30, "se_story_120_04", "se_story_120_04_hotpot_loop", "")
			end

			local var_128_31 = arg_125_1.actors_["1076ui_story"].transform
			local var_128_32 = 1.966

			if var_128_32 < arg_125_1.time_ and arg_125_1.time_ <= var_128_32 + arg_128_0 then
				arg_125_1.var_.moveOldPos1076ui_story = var_128_31.localPosition
			end

			local var_128_33 = 0.001

			if var_128_32 <= arg_125_1.time_ and arg_125_1.time_ < var_128_32 + var_128_33 then
				local var_128_34 = (arg_125_1.time_ - var_128_32) / var_128_33
				local var_128_35 = Vector3.New(0, 100, 0)

				var_128_31.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1076ui_story, var_128_35, var_128_34)

				local var_128_36 = manager.ui.mainCamera.transform.position - var_128_31.position

				var_128_31.forward = Vector3.New(var_128_36.x, var_128_36.y, var_128_36.z)

				local var_128_37 = var_128_31.localEulerAngles

				var_128_37.z = 0
				var_128_37.x = 0
				var_128_31.localEulerAngles = var_128_37
			end

			if arg_125_1.time_ >= var_128_32 + var_128_33 and arg_125_1.time_ < var_128_32 + var_128_33 + arg_128_0 then
				var_128_31.localPosition = Vector3.New(0, 100, 0)

				local var_128_38 = manager.ui.mainCamera.transform.position - var_128_31.position

				var_128_31.forward = Vector3.New(var_128_38.x, var_128_38.y, var_128_38.z)

				local var_128_39 = var_128_31.localEulerAngles

				var_128_39.z = 0
				var_128_39.x = 0
				var_128_31.localEulerAngles = var_128_39
			end

			local var_128_40 = arg_125_1.actors_["1084ui_story"].transform
			local var_128_41 = 1.966

			if var_128_41 < arg_125_1.time_ and arg_125_1.time_ <= var_128_41 + arg_128_0 then
				arg_125_1.var_.moveOldPos1084ui_story = var_128_40.localPosition
			end

			local var_128_42 = 0.001

			if var_128_41 <= arg_125_1.time_ and arg_125_1.time_ < var_128_41 + var_128_42 then
				local var_128_43 = (arg_125_1.time_ - var_128_41) / var_128_42
				local var_128_44 = Vector3.New(0, 100, 0)

				var_128_40.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos1084ui_story, var_128_44, var_128_43)

				local var_128_45 = manager.ui.mainCamera.transform.position - var_128_40.position

				var_128_40.forward = Vector3.New(var_128_45.x, var_128_45.y, var_128_45.z)

				local var_128_46 = var_128_40.localEulerAngles

				var_128_46.z = 0
				var_128_46.x = 0
				var_128_40.localEulerAngles = var_128_46
			end

			if arg_125_1.time_ >= var_128_41 + var_128_42 and arg_125_1.time_ < var_128_41 + var_128_42 + arg_128_0 then
				var_128_40.localPosition = Vector3.New(0, 100, 0)

				local var_128_47 = manager.ui.mainCamera.transform.position - var_128_40.position

				var_128_40.forward = Vector3.New(var_128_47.x, var_128_47.y, var_128_47.z)

				local var_128_48 = var_128_40.localEulerAngles

				var_128_48.z = 0
				var_128_48.x = 0
				var_128_40.localEulerAngles = var_128_48
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_49 = 4
			local var_128_50 = 0.675

			if var_128_49 < arg_125_1.time_ and arg_125_1.time_ <= var_128_49 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_51 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_51:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_52 = arg_125_1:GetWordFromCfg(120431031)
				local var_128_53 = arg_125_1:FormatText(var_128_52.content)

				arg_125_1.text_.text = var_128_53

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_54 = 27
				local var_128_55 = utf8.len(var_128_53)
				local var_128_56 = var_128_54 <= 0 and var_128_50 or var_128_50 * (var_128_55 / var_128_54)

				if var_128_56 > 0 and var_128_50 < var_128_56 then
					arg_125_1.talkMaxDuration = var_128_56
					var_128_49 = var_128_49 + 0.3

					if var_128_56 + var_128_49 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_56 + var_128_49
					end
				end

				arg_125_1.text_.text = var_128_53
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_57 = var_128_49 + 0.3
			local var_128_58 = math.max(var_128_50, arg_125_1.talkMaxDuration)

			if var_128_57 <= arg_125_1.time_ and arg_125_1.time_ < var_128_57 + var_128_58 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_57) / var_128_58

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_57 + var_128_58 and arg_125_1.time_ < var_128_57 + var_128_58 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play120431032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120431032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play120431033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1.025

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_2 = arg_131_1:GetWordFromCfg(120431032)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 41
				local var_134_5 = utf8.len(var_134_3)
				local var_134_6 = var_134_4 <= 0 and var_134_1 or var_134_1 * (var_134_5 / var_134_4)

				if var_134_6 > 0 and var_134_1 < var_134_6 then
					arg_131_1.talkMaxDuration = var_134_6

					if var_134_6 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_6 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_3
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_7 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_7 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_7

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_7 and arg_131_1.time_ < var_134_0 + var_134_7 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120431033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120431033
		arg_135_1.duration_ = 8

		local var_135_0 = {
			zh = 5.6,
			ja = 8
		}
		local var_135_1 = manager.audio:GetLocalizationFlag()

		if var_135_0[var_135_1] ~= nil then
			arg_135_1.duration_ = var_135_0[var_135_1]
		end

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play120431034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1075ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1075ui_story"].transform
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.var_.moveOldPos1075ui_story = var_138_4.localPosition
			end

			local var_138_6 = 0.001

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6
				local var_138_8 = Vector3.New(-0.7, -1.055, -6.16)

				var_138_4.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1075ui_story, var_138_8, var_138_7)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_4.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_4.localEulerAngles = var_138_10
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 then
				var_138_4.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_138_11 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_11.x, var_138_11.y, var_138_11.z)

				local var_138_12 = var_138_4.localEulerAngles

				var_138_12.z = 0
				var_138_12.x = 0
				var_138_4.localEulerAngles = var_138_12
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_138_15 = arg_135_1.actors_["1075ui_story"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story == nil then
				arg_135_1.var_.characterEffect1075ui_story = var_138_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_17 = 0.2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.characterEffect1075ui_story then
					arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story then
				arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_138_19 = 0
			local var_138_20 = 0.725

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[381].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(120431033)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 29
				local var_138_25 = utf8.len(var_138_23)
				local var_138_26 = var_138_24 <= 0 and var_138_20 or var_138_20 * (var_138_25 / var_138_24)

				if var_138_26 > 0 and var_138_20 < var_138_26 then
					arg_135_1.talkMaxDuration = var_138_26

					if var_138_26 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_26 + var_138_19
					end
				end

				arg_135_1.text_.text = var_138_23
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431033", "story_v_out_120431.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_120431", "120431033", "story_v_out_120431.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_120431", "120431033", "story_v_out_120431.awb")

						arg_135_1:RecordAudio("120431033", var_138_28)
						arg_135_1:RecordAudio("120431033", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120431", "120431033", "story_v_out_120431.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120431", "120431033", "story_v_out_120431.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_29 = math.max(var_138_20, arg_135_1.talkMaxDuration)

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_29 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_19) / var_138_29

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_19 + var_138_29 and arg_135_1.time_ < var_138_19 + var_138_29 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120431034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120431034
		arg_139_1.duration_ = 12

		local var_139_0 = {
			zh = 9.6,
			ja = 12
		}
		local var_139_1 = manager.audio:GetLocalizationFlag()

		if var_139_0[var_139_1] ~= nil then
			arg_139_1.duration_ = var_139_0[var_139_1]
		end

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play120431035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = "1069ui_story"

			if arg_139_1.actors_[var_142_0] == nil then
				local var_142_1 = Object.Instantiate(Asset.Load("Char/" .. var_142_0), arg_139_1.stage_.transform)

				var_142_1.name = var_142_0
				var_142_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_139_1.actors_[var_142_0] = var_142_1

				local var_142_2 = var_142_1:GetComponentInChildren(typeof(CharacterEffect))

				var_142_2.enabled = true

				local var_142_3 = GameObjectTools.GetOrAddComponent(var_142_1, typeof(DynamicBoneHelper))

				if var_142_3 then
					var_142_3:EnableDynamicBone(false)
				end

				arg_139_1:ShowWeapon(var_142_2.transform, false)

				arg_139_1.var_[var_142_0 .. "Animator"] = var_142_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_139_1.var_[var_142_0 .. "Animator"].applyRootMotion = true
				arg_139_1.var_[var_142_0 .. "LipSync"] = var_142_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_142_4 = arg_139_1.actors_["1069ui_story"].transform
			local var_142_5 = 0

			if var_142_5 < arg_139_1.time_ and arg_139_1.time_ <= var_142_5 + arg_142_0 then
				arg_139_1.var_.moveOldPos1069ui_story = var_142_4.localPosition
			end

			local var_142_6 = 0.001

			if var_142_5 <= arg_139_1.time_ and arg_139_1.time_ < var_142_5 + var_142_6 then
				local var_142_7 = (arg_139_1.time_ - var_142_5) / var_142_6
				local var_142_8 = Vector3.New(0.7, -1, -6)

				var_142_4.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1069ui_story, var_142_8, var_142_7)

				local var_142_9 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_9.x, var_142_9.y, var_142_9.z)

				local var_142_10 = var_142_4.localEulerAngles

				var_142_10.z = 0
				var_142_10.x = 0
				var_142_4.localEulerAngles = var_142_10
			end

			if arg_139_1.time_ >= var_142_5 + var_142_6 and arg_139_1.time_ < var_142_5 + var_142_6 + arg_142_0 then
				var_142_4.localPosition = Vector3.New(0.7, -1, -6)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_4.position

				var_142_4.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_4.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_4.localEulerAngles = var_142_12
			end

			local var_142_13 = arg_139_1.actors_["1075ui_story"]
			local var_142_14 = 0

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 and arg_139_1.var_.characterEffect1075ui_story == nil then
				arg_139_1.var_.characterEffect1075ui_story = var_142_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_15 = 0.2

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_15 then
				local var_142_16 = (arg_139_1.time_ - var_142_14) / var_142_15

				if arg_139_1.var_.characterEffect1075ui_story then
					local var_142_17 = Mathf.Lerp(0, 0.5, var_142_16)

					arg_139_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1075ui_story.fillRatio = var_142_17
				end
			end

			if arg_139_1.time_ >= var_142_14 + var_142_15 and arg_139_1.time_ < var_142_14 + var_142_15 + arg_142_0 and arg_139_1.var_.characterEffect1075ui_story then
				local var_142_18 = 0.5

				arg_139_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1075ui_story.fillRatio = var_142_18
			end

			local var_142_19 = arg_139_1.actors_["1069ui_story"]
			local var_142_20 = 0

			if var_142_20 < arg_139_1.time_ and arg_139_1.time_ <= var_142_20 + arg_142_0 and arg_139_1.var_.characterEffect1069ui_story == nil then
				arg_139_1.var_.characterEffect1069ui_story = var_142_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_21 = 0.2

			if var_142_20 <= arg_139_1.time_ and arg_139_1.time_ < var_142_20 + var_142_21 then
				local var_142_22 = (arg_139_1.time_ - var_142_20) / var_142_21

				if arg_139_1.var_.characterEffect1069ui_story then
					arg_139_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_20 + var_142_21 and arg_139_1.time_ < var_142_20 + var_142_21 + arg_142_0 and arg_139_1.var_.characterEffect1069ui_story then
				arg_139_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_142_23 = 0

			if var_142_23 < arg_139_1.time_ and arg_139_1.time_ <= var_142_23 + arg_142_0 then
				arg_139_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_142_24 = 0

			if var_142_24 < arg_139_1.time_ and arg_139_1.time_ <= var_142_24 + arg_142_0 then
				arg_139_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_142_25 = 0
			local var_142_26 = 1.1

			if var_142_25 < arg_139_1.time_ and arg_139_1.time_ <= var_142_25 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_27 = arg_139_1:FormatText(StoryNameCfg[378].name)

				arg_139_1.leftNameTxt_.text = var_142_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_28 = arg_139_1:GetWordFromCfg(120431034)
				local var_142_29 = arg_139_1:FormatText(var_142_28.content)

				arg_139_1.text_.text = var_142_29

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_30 = 44
				local var_142_31 = utf8.len(var_142_29)
				local var_142_32 = var_142_30 <= 0 and var_142_26 or var_142_26 * (var_142_31 / var_142_30)

				if var_142_32 > 0 and var_142_26 < var_142_32 then
					arg_139_1.talkMaxDuration = var_142_32

					if var_142_32 + var_142_25 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_32 + var_142_25
					end
				end

				arg_139_1.text_.text = var_142_29
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431034", "story_v_out_120431.awb") ~= 0 then
					local var_142_33 = manager.audio:GetVoiceLength("story_v_out_120431", "120431034", "story_v_out_120431.awb") / 1000

					if var_142_33 + var_142_25 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_33 + var_142_25
					end

					if var_142_28.prefab_name ~= "" and arg_139_1.actors_[var_142_28.prefab_name] ~= nil then
						local var_142_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_28.prefab_name].transform, "story_v_out_120431", "120431034", "story_v_out_120431.awb")

						arg_139_1:RecordAudio("120431034", var_142_34)
						arg_139_1:RecordAudio("120431034", var_142_34)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120431", "120431034", "story_v_out_120431.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120431", "120431034", "story_v_out_120431.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_35 = math.max(var_142_26, arg_139_1.talkMaxDuration)

			if var_142_25 <= arg_139_1.time_ and arg_139_1.time_ < var_142_25 + var_142_35 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_25) / var_142_35

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_25 + var_142_35 and arg_139_1.time_ < var_142_25 + var_142_35 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120431035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120431035
		arg_143_1.duration_ = 1.8

		local var_143_0 = {
			zh = 1.766,
			ja = 1.8
		}
		local var_143_1 = manager.audio:GetLocalizationFlag()

		if var_143_0[var_143_1] ~= nil then
			arg_143_1.duration_ = var_143_0[var_143_1]
		end

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play120431036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1069ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1069ui_story == nil then
				arg_143_1.var_.characterEffect1069ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1069ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1069ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1069ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1069ui_story.fillRatio = var_146_5
			end

			local var_146_6 = arg_143_1.actors_["1075ui_story"]
			local var_146_7 = 0

			if var_146_7 < arg_143_1.time_ and arg_143_1.time_ <= var_146_7 + arg_146_0 and arg_143_1.var_.characterEffect1075ui_story == nil then
				arg_143_1.var_.characterEffect1075ui_story = var_146_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_8 = 0.2

			if var_146_7 <= arg_143_1.time_ and arg_143_1.time_ < var_146_7 + var_146_8 then
				local var_146_9 = (arg_143_1.time_ - var_146_7) / var_146_8

				if arg_143_1.var_.characterEffect1075ui_story then
					arg_143_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_7 + var_146_8 and arg_143_1.time_ < var_146_7 + var_146_8 + arg_146_0 and arg_143_1.var_.characterEffect1075ui_story then
				arg_143_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_146_10 = 0
			local var_146_11 = 0.15

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_12 = arg_143_1:FormatText(StoryNameCfg[381].name)

				arg_143_1.leftNameTxt_.text = var_146_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_13 = arg_143_1:GetWordFromCfg(120431035)
				local var_146_14 = arg_143_1:FormatText(var_146_13.content)

				arg_143_1.text_.text = var_146_14

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_15 = 6
				local var_146_16 = utf8.len(var_146_14)
				local var_146_17 = var_146_15 <= 0 and var_146_11 or var_146_11 * (var_146_16 / var_146_15)

				if var_146_17 > 0 and var_146_11 < var_146_17 then
					arg_143_1.talkMaxDuration = var_146_17

					if var_146_17 + var_146_10 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_17 + var_146_10
					end
				end

				arg_143_1.text_.text = var_146_14
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431035", "story_v_out_120431.awb") ~= 0 then
					local var_146_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431035", "story_v_out_120431.awb") / 1000

					if var_146_18 + var_146_10 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_18 + var_146_10
					end

					if var_146_13.prefab_name ~= "" and arg_143_1.actors_[var_146_13.prefab_name] ~= nil then
						local var_146_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_13.prefab_name].transform, "story_v_out_120431", "120431035", "story_v_out_120431.awb")

						arg_143_1:RecordAudio("120431035", var_146_19)
						arg_143_1:RecordAudio("120431035", var_146_19)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_120431", "120431035", "story_v_out_120431.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_120431", "120431035", "story_v_out_120431.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_20 = math.max(var_146_11, arg_143_1.talkMaxDuration)

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_20 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_10) / var_146_20

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_10 + var_146_20 and arg_143_1.time_ < var_146_10 + var_146_20 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play120431036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120431036
		arg_147_1.duration_ = 6.9

		local var_147_0 = {
			zh = 4.966,
			ja = 6.9
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play120431037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1069ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1069ui_story == nil then
				arg_147_1.var_.characterEffect1069ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.2

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1069ui_story then
					arg_147_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1069ui_story then
				arg_147_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_150_4 = arg_147_1.actors_["1075ui_story"]
			local var_150_5 = 0

			if var_150_5 < arg_147_1.time_ and arg_147_1.time_ <= var_150_5 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story == nil then
				arg_147_1.var_.characterEffect1075ui_story = var_150_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_6 = 0.2

			if var_150_5 <= arg_147_1.time_ and arg_147_1.time_ < var_150_5 + var_150_6 then
				local var_150_7 = (arg_147_1.time_ - var_150_5) / var_150_6

				if arg_147_1.var_.characterEffect1075ui_story then
					local var_150_8 = Mathf.Lerp(0, 0.5, var_150_7)

					arg_147_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1075ui_story.fillRatio = var_150_8
				end
			end

			if arg_147_1.time_ >= var_150_5 + var_150_6 and arg_147_1.time_ < var_150_5 + var_150_6 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story then
				local var_150_9 = 0.5

				arg_147_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1075ui_story.fillRatio = var_150_9
			end

			local var_150_10 = 0
			local var_150_11 = 0.575

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_12 = arg_147_1:FormatText(StoryNameCfg[378].name)

				arg_147_1.leftNameTxt_.text = var_150_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_13 = arg_147_1:GetWordFromCfg(120431036)
				local var_150_14 = arg_147_1:FormatText(var_150_13.content)

				arg_147_1.text_.text = var_150_14

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_15 = 22
				local var_150_16 = utf8.len(var_150_14)
				local var_150_17 = var_150_15 <= 0 and var_150_11 or var_150_11 * (var_150_16 / var_150_15)

				if var_150_17 > 0 and var_150_11 < var_150_17 then
					arg_147_1.talkMaxDuration = var_150_17

					if var_150_17 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_17 + var_150_10
					end
				end

				arg_147_1.text_.text = var_150_14
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431036", "story_v_out_120431.awb") ~= 0 then
					local var_150_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431036", "story_v_out_120431.awb") / 1000

					if var_150_18 + var_150_10 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_18 + var_150_10
					end

					if var_150_13.prefab_name ~= "" and arg_147_1.actors_[var_150_13.prefab_name] ~= nil then
						local var_150_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_13.prefab_name].transform, "story_v_out_120431", "120431036", "story_v_out_120431.awb")

						arg_147_1:RecordAudio("120431036", var_150_19)
						arg_147_1:RecordAudio("120431036", var_150_19)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120431", "120431036", "story_v_out_120431.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120431", "120431036", "story_v_out_120431.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_20 = math.max(var_150_11, arg_147_1.talkMaxDuration)

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_20 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_10) / var_150_20

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_10 + var_150_20 and arg_147_1.time_ < var_150_10 + var_150_20 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play120431037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120431037
		arg_151_1.duration_ = 5.2

		local var_151_0 = {
			zh = 5.2,
			ja = 4.133
		}
		local var_151_1 = manager.audio:GetLocalizationFlag()

		if var_151_0[var_151_1] ~= nil then
			arg_151_1.duration_ = var_151_0[var_151_1]
		end

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play120431038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1.025

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[378].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(120431037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 41
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431037", "story_v_out_120431.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431037", "story_v_out_120431.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_120431", "120431037", "story_v_out_120431.awb")

						arg_151_1:RecordAudio("120431037", var_154_9)
						arg_151_1:RecordAudio("120431037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120431", "120431037", "story_v_out_120431.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120431", "120431037", "story_v_out_120431.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play120431038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120431038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play120431039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1069ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1069ui_story == nil then
				arg_155_1.var_.characterEffect1069ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.2

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1069ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1069ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1069ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1069ui_story.fillRatio = var_158_5
			end

			local var_158_6 = 0
			local var_158_7 = 0.125

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_8 = arg_155_1:FormatText(StoryNameCfg[7].name)

				arg_155_1.leftNameTxt_.text = var_158_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_9 = arg_155_1:GetWordFromCfg(120431038)
				local var_158_10 = arg_155_1:FormatText(var_158_9.content)

				arg_155_1.text_.text = var_158_10

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_11 = 5
				local var_158_12 = utf8.len(var_158_10)
				local var_158_13 = var_158_11 <= 0 and var_158_7 or var_158_7 * (var_158_12 / var_158_11)

				if var_158_13 > 0 and var_158_7 < var_158_13 then
					arg_155_1.talkMaxDuration = var_158_13

					if var_158_13 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_13 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_10
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_14 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_14 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_14

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_14 and arg_155_1.time_ < var_158_6 + var_158_14 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play120431039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120431039
		arg_159_1.duration_ = 7

		local var_159_0 = {
			zh = 3.8,
			ja = 7
		}
		local var_159_1 = manager.audio:GetLocalizationFlag()

		if var_159_0[var_159_1] ~= nil then
			arg_159_1.duration_ = var_159_0[var_159_1]
		end

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play120431040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1069ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1069ui_story == nil then
				arg_159_1.var_.characterEffect1069ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.2

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1069ui_story then
					arg_159_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1069ui_story then
				arg_159_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_162_4 = 0
			local var_162_5 = 0.5

			if var_162_4 < arg_159_1.time_ and arg_159_1.time_ <= var_162_4 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_6 = arg_159_1:FormatText(StoryNameCfg[378].name)

				arg_159_1.leftNameTxt_.text = var_162_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_7 = arg_159_1:GetWordFromCfg(120431039)
				local var_162_8 = arg_159_1:FormatText(var_162_7.content)

				arg_159_1.text_.text = var_162_8

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_9 = 20
				local var_162_10 = utf8.len(var_162_8)
				local var_162_11 = var_162_9 <= 0 and var_162_5 or var_162_5 * (var_162_10 / var_162_9)

				if var_162_11 > 0 and var_162_5 < var_162_11 then
					arg_159_1.talkMaxDuration = var_162_11

					if var_162_11 + var_162_4 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_11 + var_162_4
					end
				end

				arg_159_1.text_.text = var_162_8
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431039", "story_v_out_120431.awb") ~= 0 then
					local var_162_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431039", "story_v_out_120431.awb") / 1000

					if var_162_12 + var_162_4 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_12 + var_162_4
					end

					if var_162_7.prefab_name ~= "" and arg_159_1.actors_[var_162_7.prefab_name] ~= nil then
						local var_162_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_7.prefab_name].transform, "story_v_out_120431", "120431039", "story_v_out_120431.awb")

						arg_159_1:RecordAudio("120431039", var_162_13)
						arg_159_1:RecordAudio("120431039", var_162_13)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120431", "120431039", "story_v_out_120431.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120431", "120431039", "story_v_out_120431.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_14 = math.max(var_162_5, arg_159_1.talkMaxDuration)

			if var_162_4 <= arg_159_1.time_ and arg_159_1.time_ < var_162_4 + var_162_14 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_4) / var_162_14

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_4 + var_162_14 and arg_159_1.time_ < var_162_4 + var_162_14 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play120431040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120431040
		arg_163_1.duration_ = 9.5

		local var_163_0 = {
			zh = 7.233,
			ja = 9.5
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play120431041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.875

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[378].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(120431040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 35
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431040", "story_v_out_120431.awb") ~= 0 then
					local var_166_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431040", "story_v_out_120431.awb") / 1000

					if var_166_8 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_8 + var_166_0
					end

					if var_166_3.prefab_name ~= "" and arg_163_1.actors_[var_166_3.prefab_name] ~= nil then
						local var_166_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_3.prefab_name].transform, "story_v_out_120431", "120431040", "story_v_out_120431.awb")

						arg_163_1:RecordAudio("120431040", var_166_9)
						arg_163_1:RecordAudio("120431040", var_166_9)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_120431", "120431040", "story_v_out_120431.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_120431", "120431040", "story_v_out_120431.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_10 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_10 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_10

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_10 and arg_163_1.time_ < var_166_0 + var_166_10 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120431041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120431041
		arg_167_1.duration_ = 5.566

		local var_167_0 = {
			zh = 4.833,
			ja = 5.566
		}
		local var_167_1 = manager.audio:GetLocalizationFlag()

		if var_167_0[var_167_1] ~= nil then
			arg_167_1.duration_ = var_167_0[var_167_1]
		end

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play120431042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1069ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1069ui_story == nil then
				arg_167_1.var_.characterEffect1069ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.2

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1069ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1069ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1069ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1069ui_story.fillRatio = var_170_5
			end

			local var_170_6 = arg_167_1.actors_["1075ui_story"]
			local var_170_7 = 0

			if var_170_7 < arg_167_1.time_ and arg_167_1.time_ <= var_170_7 + arg_170_0 and arg_167_1.var_.characterEffect1075ui_story == nil then
				arg_167_1.var_.characterEffect1075ui_story = var_170_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_8 = 0.2

			if var_170_7 <= arg_167_1.time_ and arg_167_1.time_ < var_170_7 + var_170_8 then
				local var_170_9 = (arg_167_1.time_ - var_170_7) / var_170_8

				if arg_167_1.var_.characterEffect1075ui_story then
					arg_167_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_7 + var_170_8 and arg_167_1.time_ < var_170_7 + var_170_8 + arg_170_0 and arg_167_1.var_.characterEffect1075ui_story then
				arg_167_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_170_11 = 0

			if var_170_11 < arg_167_1.time_ and arg_167_1.time_ <= var_170_11 + arg_170_0 then
				arg_167_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_170_12 = 0
			local var_170_13 = 0.6

			if var_170_12 < arg_167_1.time_ and arg_167_1.time_ <= var_170_12 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_14 = arg_167_1:FormatText(StoryNameCfg[381].name)

				arg_167_1.leftNameTxt_.text = var_170_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_15 = arg_167_1:GetWordFromCfg(120431041)
				local var_170_16 = arg_167_1:FormatText(var_170_15.content)

				arg_167_1.text_.text = var_170_16

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_17 = 24
				local var_170_18 = utf8.len(var_170_16)
				local var_170_19 = var_170_17 <= 0 and var_170_13 or var_170_13 * (var_170_18 / var_170_17)

				if var_170_19 > 0 and var_170_13 < var_170_19 then
					arg_167_1.talkMaxDuration = var_170_19

					if var_170_19 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_19 + var_170_12
					end
				end

				arg_167_1.text_.text = var_170_16
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431041", "story_v_out_120431.awb") ~= 0 then
					local var_170_20 = manager.audio:GetVoiceLength("story_v_out_120431", "120431041", "story_v_out_120431.awb") / 1000

					if var_170_20 + var_170_12 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_20 + var_170_12
					end

					if var_170_15.prefab_name ~= "" and arg_167_1.actors_[var_170_15.prefab_name] ~= nil then
						local var_170_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_15.prefab_name].transform, "story_v_out_120431", "120431041", "story_v_out_120431.awb")

						arg_167_1:RecordAudio("120431041", var_170_21)
						arg_167_1:RecordAudio("120431041", var_170_21)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120431", "120431041", "story_v_out_120431.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120431", "120431041", "story_v_out_120431.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_22 = math.max(var_170_13, arg_167_1.talkMaxDuration)

			if var_170_12 <= arg_167_1.time_ and arg_167_1.time_ < var_170_12 + var_170_22 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_12) / var_170_22

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_12 + var_170_22 and arg_167_1.time_ < var_170_12 + var_170_22 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120431042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120431042
		arg_171_1.duration_ = 13.5

		local var_171_0 = {
			zh = 7.066,
			ja = 13.5
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play120431043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_174_2 = 0
			local var_174_3 = 0.925

			if var_174_2 < arg_171_1.time_ and arg_171_1.time_ <= var_174_2 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_4 = arg_171_1:FormatText(StoryNameCfg[381].name)

				arg_171_1.leftNameTxt_.text = var_174_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_5 = arg_171_1:GetWordFromCfg(120431042)
				local var_174_6 = arg_171_1:FormatText(var_174_5.content)

				arg_171_1.text_.text = var_174_6

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_7 = 37
				local var_174_8 = utf8.len(var_174_6)
				local var_174_9 = var_174_7 <= 0 and var_174_3 or var_174_3 * (var_174_8 / var_174_7)

				if var_174_9 > 0 and var_174_3 < var_174_9 then
					arg_171_1.talkMaxDuration = var_174_9

					if var_174_9 + var_174_2 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_9 + var_174_2
					end
				end

				arg_171_1.text_.text = var_174_6
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431042", "story_v_out_120431.awb") ~= 0 then
					local var_174_10 = manager.audio:GetVoiceLength("story_v_out_120431", "120431042", "story_v_out_120431.awb") / 1000

					if var_174_10 + var_174_2 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_10 + var_174_2
					end

					if var_174_5.prefab_name ~= "" and arg_171_1.actors_[var_174_5.prefab_name] ~= nil then
						local var_174_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_5.prefab_name].transform, "story_v_out_120431", "120431042", "story_v_out_120431.awb")

						arg_171_1:RecordAudio("120431042", var_174_11)
						arg_171_1:RecordAudio("120431042", var_174_11)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120431", "120431042", "story_v_out_120431.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120431", "120431042", "story_v_out_120431.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_12 = math.max(var_174_3, arg_171_1.talkMaxDuration)

			if var_174_2 <= arg_171_1.time_ and arg_171_1.time_ < var_174_2 + var_174_12 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_2) / var_174_12

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_2 + var_174_12 and arg_171_1.time_ < var_174_2 + var_174_12 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120431043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120431043
		arg_175_1.duration_ = 8.233

		local var_175_0 = {
			zh = 5.066,
			ja = 8.233
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play120431044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1075ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story == nil then
				arg_175_1.var_.characterEffect1075ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.2

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1075ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1075ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1075ui_story.fillRatio = var_178_5
			end

			local var_178_6 = arg_175_1.actors_["1069ui_story"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.characterEffect1069ui_story == nil then
				arg_175_1.var_.characterEffect1069ui_story = var_178_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_8 = 0.2

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.characterEffect1069ui_story then
					arg_175_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.characterEffect1069ui_story then
				arg_175_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 then
				arg_175_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069actionlink/1069action442")
			end

			local var_178_11 = 0

			if var_178_11 < arg_175_1.time_ and arg_175_1.time_ <= var_178_11 + arg_178_0 then
				arg_175_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_178_12 = 0
			local var_178_13 = 0.65

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_14 = arg_175_1:FormatText(StoryNameCfg[378].name)

				arg_175_1.leftNameTxt_.text = var_178_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_15 = arg_175_1:GetWordFromCfg(120431043)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 26
				local var_178_18 = utf8.len(var_178_16)
				local var_178_19 = var_178_17 <= 0 and var_178_13 or var_178_13 * (var_178_18 / var_178_17)

				if var_178_19 > 0 and var_178_13 < var_178_19 then
					arg_175_1.talkMaxDuration = var_178_19

					if var_178_19 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_19 + var_178_12
					end
				end

				arg_175_1.text_.text = var_178_16
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431043", "story_v_out_120431.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_120431", "120431043", "story_v_out_120431.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_120431", "120431043", "story_v_out_120431.awb")

						arg_175_1:RecordAudio("120431043", var_178_21)
						arg_175_1:RecordAudio("120431043", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120431", "120431043", "story_v_out_120431.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120431", "120431043", "story_v_out_120431.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_22 = math.max(var_178_13, arg_175_1.talkMaxDuration)

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_22 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_12) / var_178_22

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_12 + var_178_22 and arg_175_1.time_ < var_178_12 + var_178_22 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120431044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120431044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120431045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1069ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1069ui_story == nil then
				arg_179_1.var_.characterEffect1069ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1069ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1069ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1069ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1069ui_story.fillRatio = var_182_5
			end

			local var_182_6 = 0
			local var_182_7 = 0.325

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[7].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(120431044)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 13
				local var_182_12 = utf8.len(var_182_10)
				local var_182_13 = var_182_11 <= 0 and var_182_7 or var_182_7 * (var_182_12 / var_182_11)

				if var_182_13 > 0 and var_182_7 < var_182_13 then
					arg_179_1.talkMaxDuration = var_182_13

					if var_182_13 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_13 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_10
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_14 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_14 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_14

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_14 and arg_179_1.time_ < var_182_6 + var_182_14 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120431045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120431045
		arg_183_1.duration_ = 5.566

		local var_183_0 = {
			zh = 2.966,
			ja = 5.566
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play120431046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1069ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1069ui_story == nil then
				arg_183_1.var_.characterEffect1069ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1069ui_story then
					arg_183_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1069ui_story then
				arg_183_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_186_4 = 0
			local var_186_5 = 0.375

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_6 = arg_183_1:FormatText(StoryNameCfg[378].name)

				arg_183_1.leftNameTxt_.text = var_186_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_7 = arg_183_1:GetWordFromCfg(120431045)
				local var_186_8 = arg_183_1:FormatText(var_186_7.content)

				arg_183_1.text_.text = var_186_8

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_9 = 15
				local var_186_10 = utf8.len(var_186_8)
				local var_186_11 = var_186_9 <= 0 and var_186_5 or var_186_5 * (var_186_10 / var_186_9)

				if var_186_11 > 0 and var_186_5 < var_186_11 then
					arg_183_1.talkMaxDuration = var_186_11

					if var_186_11 + var_186_4 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_11 + var_186_4
					end
				end

				arg_183_1.text_.text = var_186_8
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431045", "story_v_out_120431.awb") ~= 0 then
					local var_186_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431045", "story_v_out_120431.awb") / 1000

					if var_186_12 + var_186_4 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_4
					end

					if var_186_7.prefab_name ~= "" and arg_183_1.actors_[var_186_7.prefab_name] ~= nil then
						local var_186_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_7.prefab_name].transform, "story_v_out_120431", "120431045", "story_v_out_120431.awb")

						arg_183_1:RecordAudio("120431045", var_186_13)
						arg_183_1:RecordAudio("120431045", var_186_13)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120431", "120431045", "story_v_out_120431.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120431", "120431045", "story_v_out_120431.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_14 = math.max(var_186_5, arg_183_1.talkMaxDuration)

			if var_186_4 <= arg_183_1.time_ and arg_183_1.time_ < var_186_4 + var_186_14 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_4) / var_186_14

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_4 + var_186_14 and arg_183_1.time_ < var_186_4 + var_186_14 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120431046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120431046
		arg_187_1.duration_ = 16.066

		local var_187_0 = {
			zh = 8,
			ja = 16.066
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120431047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1075ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story == nil then
				arg_187_1.var_.characterEffect1075ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1075ui_story then
					arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story then
				arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["1069ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect1069ui_story == nil then
				arg_187_1.var_.characterEffect1069ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.2

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect1069ui_story then
					local var_190_8 = Mathf.Lerp(0, 0.5, var_190_7)

					arg_187_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1069ui_story.fillRatio = var_190_8
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect1069ui_story then
				local var_190_9 = 0.5

				arg_187_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1069ui_story.fillRatio = var_190_9
			end

			local var_190_10 = 0
			local var_190_11 = 0.95

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_12 = arg_187_1:FormatText(StoryNameCfg[381].name)

				arg_187_1.leftNameTxt_.text = var_190_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_13 = arg_187_1:GetWordFromCfg(120431046)
				local var_190_14 = arg_187_1:FormatText(var_190_13.content)

				arg_187_1.text_.text = var_190_14

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_15 = 38
				local var_190_16 = utf8.len(var_190_14)
				local var_190_17 = var_190_15 <= 0 and var_190_11 or var_190_11 * (var_190_16 / var_190_15)

				if var_190_17 > 0 and var_190_11 < var_190_17 then
					arg_187_1.talkMaxDuration = var_190_17

					if var_190_17 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_17 + var_190_10
					end
				end

				arg_187_1.text_.text = var_190_14
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431046", "story_v_out_120431.awb") ~= 0 then
					local var_190_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431046", "story_v_out_120431.awb") / 1000

					if var_190_18 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_18 + var_190_10
					end

					if var_190_13.prefab_name ~= "" and arg_187_1.actors_[var_190_13.prefab_name] ~= nil then
						local var_190_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_13.prefab_name].transform, "story_v_out_120431", "120431046", "story_v_out_120431.awb")

						arg_187_1:RecordAudio("120431046", var_190_19)
						arg_187_1:RecordAudio("120431046", var_190_19)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120431", "120431046", "story_v_out_120431.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120431", "120431046", "story_v_out_120431.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_20 = math.max(var_190_11, arg_187_1.talkMaxDuration)

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_20 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_10) / var_190_20

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_10 + var_190_20 and arg_187_1.time_ < var_190_10 + var_190_20 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120431047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120431047
		arg_191_1.duration_ = 7.866

		local var_191_0 = {
			zh = 3.966,
			ja = 7.866
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120431048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1075ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story == nil then
				arg_191_1.var_.characterEffect1075ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1075ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_5
			end

			local var_194_6 = arg_191_1.actors_["1069ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1069ui_story == nil then
				arg_191_1.var_.characterEffect1069ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.2

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1069ui_story then
					arg_191_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1069ui_story then
				arg_191_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_194_10 = 0
			local var_194_11 = 0.525

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_12 = arg_191_1:FormatText(StoryNameCfg[378].name)

				arg_191_1.leftNameTxt_.text = var_194_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_13 = arg_191_1:GetWordFromCfg(120431047)
				local var_194_14 = arg_191_1:FormatText(var_194_13.content)

				arg_191_1.text_.text = var_194_14

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_15 = 21
				local var_194_16 = utf8.len(var_194_14)
				local var_194_17 = var_194_15 <= 0 and var_194_11 or var_194_11 * (var_194_16 / var_194_15)

				if var_194_17 > 0 and var_194_11 < var_194_17 then
					arg_191_1.talkMaxDuration = var_194_17

					if var_194_17 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_17 + var_194_10
					end
				end

				arg_191_1.text_.text = var_194_14
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431047", "story_v_out_120431.awb") ~= 0 then
					local var_194_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431047", "story_v_out_120431.awb") / 1000

					if var_194_18 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_10
					end

					if var_194_13.prefab_name ~= "" and arg_191_1.actors_[var_194_13.prefab_name] ~= nil then
						local var_194_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_13.prefab_name].transform, "story_v_out_120431", "120431047", "story_v_out_120431.awb")

						arg_191_1:RecordAudio("120431047", var_194_19)
						arg_191_1:RecordAudio("120431047", var_194_19)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_120431", "120431047", "story_v_out_120431.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_120431", "120431047", "story_v_out_120431.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_20 = math.max(var_194_11, arg_191_1.talkMaxDuration)

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_20 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_10) / var_194_20

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_10 + var_194_20 and arg_191_1.time_ < var_194_10 + var_194_20 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120431048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120431048
		arg_195_1.duration_ = 5.9

		local var_195_0 = {
			zh = 5.9,
			ja = 4.733
		}
		local var_195_1 = manager.audio:GetLocalizationFlag()

		if var_195_0[var_195_1] ~= nil then
			arg_195_1.duration_ = var_195_0[var_195_1]
		end

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play120431049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.65

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_2 = arg_195_1:FormatText(StoryNameCfg[378].name)

				arg_195_1.leftNameTxt_.text = var_198_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_3 = arg_195_1:GetWordFromCfg(120431048)
				local var_198_4 = arg_195_1:FormatText(var_198_3.content)

				arg_195_1.text_.text = var_198_4

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_5 = 26
				local var_198_6 = utf8.len(var_198_4)
				local var_198_7 = var_198_5 <= 0 and var_198_1 or var_198_1 * (var_198_6 / var_198_5)

				if var_198_7 > 0 and var_198_1 < var_198_7 then
					arg_195_1.talkMaxDuration = var_198_7

					if var_198_7 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_7 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_4
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431048", "story_v_out_120431.awb") ~= 0 then
					local var_198_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431048", "story_v_out_120431.awb") / 1000

					if var_198_8 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_0
					end

					if var_198_3.prefab_name ~= "" and arg_195_1.actors_[var_198_3.prefab_name] ~= nil then
						local var_198_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_3.prefab_name].transform, "story_v_out_120431", "120431048", "story_v_out_120431.awb")

						arg_195_1:RecordAudio("120431048", var_198_9)
						arg_195_1:RecordAudio("120431048", var_198_9)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120431", "120431048", "story_v_out_120431.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120431", "120431048", "story_v_out_120431.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_10 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_10 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_10

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_10 and arg_195_1.time_ < var_198_0 + var_198_10 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120431049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120431049
		arg_199_1.duration_ = 4.933

		local var_199_0 = {
			zh = 4.933,
			ja = 3.466
		}
		local var_199_1 = manager.audio:GetLocalizationFlag()

		if var_199_0[var_199_1] ~= nil then
			arg_199_1.duration_ = var_199_0[var_199_1]
		end

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play120431050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1075ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1075ui_story == nil then
				arg_199_1.var_.characterEffect1075ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.2

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1075ui_story then
					arg_199_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1075ui_story then
				arg_199_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_202_4 = arg_199_1.actors_["1069ui_story"]
			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 and arg_199_1.var_.characterEffect1069ui_story == nil then
				arg_199_1.var_.characterEffect1069ui_story = var_202_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_6 = 0.2

			if var_202_5 <= arg_199_1.time_ and arg_199_1.time_ < var_202_5 + var_202_6 then
				local var_202_7 = (arg_199_1.time_ - var_202_5) / var_202_6

				if arg_199_1.var_.characterEffect1069ui_story then
					local var_202_8 = Mathf.Lerp(0, 0.5, var_202_7)

					arg_199_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1069ui_story.fillRatio = var_202_8
				end
			end

			if arg_199_1.time_ >= var_202_5 + var_202_6 and arg_199_1.time_ < var_202_5 + var_202_6 + arg_202_0 and arg_199_1.var_.characterEffect1069ui_story then
				local var_202_9 = 0.5

				arg_199_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1069ui_story.fillRatio = var_202_9
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action3_1")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.425

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[381].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(120431049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 17
				local var_202_18 = utf8.len(var_202_16)
				local var_202_19 = var_202_17 <= 0 and var_202_13 or var_202_13 * (var_202_18 / var_202_17)

				if var_202_19 > 0 and var_202_13 < var_202_19 then
					arg_199_1.talkMaxDuration = var_202_19

					if var_202_19 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_19 + var_202_12
					end
				end

				arg_199_1.text_.text = var_202_16
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431049", "story_v_out_120431.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_120431", "120431049", "story_v_out_120431.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_120431", "120431049", "story_v_out_120431.awb")

						arg_199_1:RecordAudio("120431049", var_202_21)
						arg_199_1:RecordAudio("120431049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120431", "120431049", "story_v_out_120431.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120431", "120431049", "story_v_out_120431.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_22 = math.max(var_202_13, arg_199_1.talkMaxDuration)

			if var_202_12 <= arg_199_1.time_ and arg_199_1.time_ < var_202_12 + var_202_22 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_12) / var_202_22

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_12 + var_202_22 and arg_199_1.time_ < var_202_12 + var_202_22 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120431050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120431050
		arg_203_1.duration_ = 9.766

		local var_203_0 = {
			zh = 5.1,
			ja = 9.766
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120431051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action3_2")
			end

			local var_206_1 = 0
			local var_206_2 = 0.725

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_3 = arg_203_1:FormatText(StoryNameCfg[381].name)

				arg_203_1.leftNameTxt_.text = var_206_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_4 = arg_203_1:GetWordFromCfg(120431050)
				local var_206_5 = arg_203_1:FormatText(var_206_4.content)

				arg_203_1.text_.text = var_206_5

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_6 = 29
				local var_206_7 = utf8.len(var_206_5)
				local var_206_8 = var_206_6 <= 0 and var_206_2 or var_206_2 * (var_206_7 / var_206_6)

				if var_206_8 > 0 and var_206_2 < var_206_8 then
					arg_203_1.talkMaxDuration = var_206_8

					if var_206_8 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_1
					end
				end

				arg_203_1.text_.text = var_206_5
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431050", "story_v_out_120431.awb") ~= 0 then
					local var_206_9 = manager.audio:GetVoiceLength("story_v_out_120431", "120431050", "story_v_out_120431.awb") / 1000

					if var_206_9 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_9 + var_206_1
					end

					if var_206_4.prefab_name ~= "" and arg_203_1.actors_[var_206_4.prefab_name] ~= nil then
						local var_206_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_4.prefab_name].transform, "story_v_out_120431", "120431050", "story_v_out_120431.awb")

						arg_203_1:RecordAudio("120431050", var_206_10)
						arg_203_1:RecordAudio("120431050", var_206_10)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_120431", "120431050", "story_v_out_120431.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_120431", "120431050", "story_v_out_120431.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_11 = math.max(var_206_2, arg_203_1.talkMaxDuration)

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_11 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_1) / var_206_11

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_1 + var_206_11 and arg_203_1.time_ < var_206_1 + var_206_11 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120431051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120431051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play120431052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0.666666666666667
			local var_210_1 = 0.166666666666667

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				local var_210_2 = "play"
				local var_210_3 = "effect"

				arg_207_1:AudioAction(var_210_2, var_210_3, "se_story_120_04", "se_story_120_04_footsteps01", "")
			end

			local var_210_4 = 0
			local var_210_5 = 0.266666666666667

			if var_210_4 < arg_207_1.time_ and arg_207_1.time_ <= var_210_4 + arg_210_0 then
				local var_210_6 = "stop"
				local var_210_7 = "music"

				arg_207_1:AudioAction(var_210_6, var_210_7, "se_story_120_04", "se_story_120_04_hotpot_loop", "")
			end

			local var_210_8 = arg_207_1.actors_["1075ui_story"]
			local var_210_9 = 0

			if var_210_9 < arg_207_1.time_ and arg_207_1.time_ <= var_210_9 + arg_210_0 and arg_207_1.var_.characterEffect1075ui_story == nil then
				arg_207_1.var_.characterEffect1075ui_story = var_210_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_10 = 0.2

			if var_210_9 <= arg_207_1.time_ and arg_207_1.time_ < var_210_9 + var_210_10 then
				local var_210_11 = (arg_207_1.time_ - var_210_9) / var_210_10

				if arg_207_1.var_.characterEffect1075ui_story then
					local var_210_12 = Mathf.Lerp(0, 0.5, var_210_11)

					arg_207_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1075ui_story.fillRatio = var_210_12
				end
			end

			if arg_207_1.time_ >= var_210_9 + var_210_10 and arg_207_1.time_ < var_210_9 + var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect1075ui_story then
				local var_210_13 = 0.5

				arg_207_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1075ui_story.fillRatio = var_210_13
			end

			local var_210_14 = 0
			local var_210_15 = 1.15

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_16 = arg_207_1:GetWordFromCfg(120431051)
				local var_210_17 = arg_207_1:FormatText(var_210_16.content)

				arg_207_1.text_.text = var_210_17

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_18 = 46
				local var_210_19 = utf8.len(var_210_17)
				local var_210_20 = var_210_18 <= 0 and var_210_15 or var_210_15 * (var_210_19 / var_210_18)

				if var_210_20 > 0 and var_210_15 < var_210_20 then
					arg_207_1.talkMaxDuration = var_210_20

					if var_210_20 + var_210_14 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_14
					end
				end

				arg_207_1.text_.text = var_210_17
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_21 = math.max(var_210_15, arg_207_1.talkMaxDuration)

			if var_210_14 <= arg_207_1.time_ and arg_207_1.time_ < var_210_14 + var_210_21 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_14) / var_210_21

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_14 + var_210_21 and arg_207_1.time_ < var_210_14 + var_210_21 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120431052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120431052
		arg_211_1.duration_ = 8.366

		local var_211_0 = {
			zh = 4.1,
			ja = 8.366
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play120431053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.5

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[36].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(120431052)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 20
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431052", "story_v_out_120431.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431052", "story_v_out_120431.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_120431", "120431052", "story_v_out_120431.awb")

						arg_211_1:RecordAudio("120431052", var_214_9)
						arg_211_1:RecordAudio("120431052", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_120431", "120431052", "story_v_out_120431.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_120431", "120431052", "story_v_out_120431.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_10 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_10 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_10

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_10 and arg_211_1.time_ < var_214_0 + var_214_10 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play120431053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120431053
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play120431054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.925

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(120431053)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 37
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play120431054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120431054
		arg_219_1.duration_ = 3.033

		local var_219_0 = {
			zh = 2.5,
			ja = 3.033
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play120431055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1075ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1075ui_story == nil then
				arg_219_1.var_.characterEffect1075ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1075ui_story then
					arg_219_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1075ui_story then
				arg_219_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_222_4 = 0

			if var_222_4 < arg_219_1.time_ and arg_219_1.time_ <= var_222_4 + arg_222_0 then
				arg_219_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_222_5 = 0
			local var_222_6 = 0.175

			if var_222_5 < arg_219_1.time_ and arg_219_1.time_ <= var_222_5 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_7 = arg_219_1:FormatText(StoryNameCfg[381].name)

				arg_219_1.leftNameTxt_.text = var_222_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_8 = arg_219_1:GetWordFromCfg(120431054)
				local var_222_9 = arg_219_1:FormatText(var_222_8.content)

				arg_219_1.text_.text = var_222_9

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_10 = 7
				local var_222_11 = utf8.len(var_222_9)
				local var_222_12 = var_222_10 <= 0 and var_222_6 or var_222_6 * (var_222_11 / var_222_10)

				if var_222_12 > 0 and var_222_6 < var_222_12 then
					arg_219_1.talkMaxDuration = var_222_12

					if var_222_12 + var_222_5 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_12 + var_222_5
					end
				end

				arg_219_1.text_.text = var_222_9
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431054", "story_v_out_120431.awb") ~= 0 then
					local var_222_13 = manager.audio:GetVoiceLength("story_v_out_120431", "120431054", "story_v_out_120431.awb") / 1000

					if var_222_13 + var_222_5 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_5
					end

					if var_222_8.prefab_name ~= "" and arg_219_1.actors_[var_222_8.prefab_name] ~= nil then
						local var_222_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_8.prefab_name].transform, "story_v_out_120431", "120431054", "story_v_out_120431.awb")

						arg_219_1:RecordAudio("120431054", var_222_14)
						arg_219_1:RecordAudio("120431054", var_222_14)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120431", "120431054", "story_v_out_120431.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120431", "120431054", "story_v_out_120431.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_15 = math.max(var_222_6, arg_219_1.talkMaxDuration)

			if var_222_5 <= arg_219_1.time_ and arg_219_1.time_ < var_222_5 + var_222_15 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_5) / var_222_15

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_5 + var_222_15 and arg_219_1.time_ < var_222_5 + var_222_15 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play120431055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120431055
		arg_223_1.duration_ = 6.933

		local var_223_0 = {
			zh = 3.9,
			ja = 6.933
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play120431056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1075ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story == nil then
				arg_223_1.var_.characterEffect1075ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1075ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1075ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1075ui_story.fillRatio = var_226_5
			end

			local var_226_6 = "1029ui_story"

			if arg_223_1.actors_[var_226_6] == nil then
				local var_226_7 = Object.Instantiate(Asset.Load("Char/" .. var_226_6), arg_223_1.stage_.transform)

				var_226_7.name = var_226_6
				var_226_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_223_1.actors_[var_226_6] = var_226_7

				local var_226_8 = var_226_7:GetComponentInChildren(typeof(CharacterEffect))

				var_226_8.enabled = true

				local var_226_9 = GameObjectTools.GetOrAddComponent(var_226_7, typeof(DynamicBoneHelper))

				if var_226_9 then
					var_226_9:EnableDynamicBone(false)
				end

				arg_223_1:ShowWeapon(var_226_8.transform, false)

				arg_223_1.var_[var_226_6 .. "Animator"] = var_226_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_223_1.var_[var_226_6 .. "Animator"].applyRootMotion = true
				arg_223_1.var_[var_226_6 .. "LipSync"] = var_226_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_226_10 = arg_223_1.actors_["1029ui_story"].transform
			local var_226_11 = 0

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1.var_.moveOldPos1029ui_story = var_226_10.localPosition
			end

			local var_226_12 = 0.001

			if var_226_11 <= arg_223_1.time_ and arg_223_1.time_ < var_226_11 + var_226_12 then
				local var_226_13 = (arg_223_1.time_ - var_226_11) / var_226_12
				local var_226_14 = Vector3.New(0.7, -1.09, -6.2)

				var_226_10.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1029ui_story, var_226_14, var_226_13)

				local var_226_15 = manager.ui.mainCamera.transform.position - var_226_10.position

				var_226_10.forward = Vector3.New(var_226_15.x, var_226_15.y, var_226_15.z)

				local var_226_16 = var_226_10.localEulerAngles

				var_226_16.z = 0
				var_226_16.x = 0
				var_226_10.localEulerAngles = var_226_16
			end

			if arg_223_1.time_ >= var_226_11 + var_226_12 and arg_223_1.time_ < var_226_11 + var_226_12 + arg_226_0 then
				var_226_10.localPosition = Vector3.New(0.7, -1.09, -6.2)

				local var_226_17 = manager.ui.mainCamera.transform.position - var_226_10.position

				var_226_10.forward = Vector3.New(var_226_17.x, var_226_17.y, var_226_17.z)

				local var_226_18 = var_226_10.localEulerAngles

				var_226_18.z = 0
				var_226_18.x = 0
				var_226_10.localEulerAngles = var_226_18
			end

			local var_226_19 = arg_223_1.actors_["1069ui_story"].transform
			local var_226_20 = 0

			if var_226_20 < arg_223_1.time_ and arg_223_1.time_ <= var_226_20 + arg_226_0 then
				arg_223_1.var_.moveOldPos1069ui_story = var_226_19.localPosition
			end

			local var_226_21 = 0.001

			if var_226_20 <= arg_223_1.time_ and arg_223_1.time_ < var_226_20 + var_226_21 then
				local var_226_22 = (arg_223_1.time_ - var_226_20) / var_226_21
				local var_226_23 = Vector3.New(0, 100, 0)

				var_226_19.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1069ui_story, var_226_23, var_226_22)

				local var_226_24 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_24.x, var_226_24.y, var_226_24.z)

				local var_226_25 = var_226_19.localEulerAngles

				var_226_25.z = 0
				var_226_25.x = 0
				var_226_19.localEulerAngles = var_226_25
			end

			if arg_223_1.time_ >= var_226_20 + var_226_21 and arg_223_1.time_ < var_226_20 + var_226_21 + arg_226_0 then
				var_226_19.localPosition = Vector3.New(0, 100, 0)

				local var_226_26 = manager.ui.mainCamera.transform.position - var_226_19.position

				var_226_19.forward = Vector3.New(var_226_26.x, var_226_26.y, var_226_26.z)

				local var_226_27 = var_226_19.localEulerAngles

				var_226_27.z = 0
				var_226_27.x = 0
				var_226_19.localEulerAngles = var_226_27
			end

			local var_226_28 = 0

			if var_226_28 < arg_223_1.time_ and arg_223_1.time_ <= var_226_28 + arg_226_0 then
				arg_223_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_226_29 = 0

			if var_226_29 < arg_223_1.time_ and arg_223_1.time_ <= var_226_29 + arg_226_0 then
				arg_223_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_226_30 = 0
			local var_226_31 = 0.325

			if var_226_30 < arg_223_1.time_ and arg_223_1.time_ <= var_226_30 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_32 = arg_223_1:FormatText(StoryNameCfg[319].name)

				arg_223_1.leftNameTxt_.text = var_226_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_33 = arg_223_1:GetWordFromCfg(120431055)
				local var_226_34 = arg_223_1:FormatText(var_226_33.content)

				arg_223_1.text_.text = var_226_34

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_35 = 13
				local var_226_36 = utf8.len(var_226_34)
				local var_226_37 = var_226_35 <= 0 and var_226_31 or var_226_31 * (var_226_36 / var_226_35)

				if var_226_37 > 0 and var_226_31 < var_226_37 then
					arg_223_1.talkMaxDuration = var_226_37

					if var_226_37 + var_226_30 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_37 + var_226_30
					end
				end

				arg_223_1.text_.text = var_226_34
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431055", "story_v_out_120431.awb") ~= 0 then
					local var_226_38 = manager.audio:GetVoiceLength("story_v_out_120431", "120431055", "story_v_out_120431.awb") / 1000

					if var_226_38 + var_226_30 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_38 + var_226_30
					end

					if var_226_33.prefab_name ~= "" and arg_223_1.actors_[var_226_33.prefab_name] ~= nil then
						local var_226_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_33.prefab_name].transform, "story_v_out_120431", "120431055", "story_v_out_120431.awb")

						arg_223_1:RecordAudio("120431055", var_226_39)
						arg_223_1:RecordAudio("120431055", var_226_39)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_120431", "120431055", "story_v_out_120431.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_120431", "120431055", "story_v_out_120431.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_40 = math.max(var_226_31, arg_223_1.talkMaxDuration)

			if var_226_30 <= arg_223_1.time_ and arg_223_1.time_ < var_226_30 + var_226_40 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_30) / var_226_40

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_30 + var_226_40 and arg_223_1.time_ < var_226_30 + var_226_40 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120431056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120431056
		arg_227_1.duration_ = 9.766

		local var_227_0 = {
			zh = 4.766,
			ja = 9.766
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play120431057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1075ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1075ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, 100, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1075ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, 100, 0)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1069ui_story"].transform
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1.var_.moveOldPos1069ui_story = var_230_9.localPosition
			end

			local var_230_11 = 0.001

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11
				local var_230_13 = Vector3.New(-0.7, -1, -6)

				var_230_9.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1069ui_story, var_230_13, var_230_12)

				local var_230_14 = manager.ui.mainCamera.transform.position - var_230_9.position

				var_230_9.forward = Vector3.New(var_230_14.x, var_230_14.y, var_230_14.z)

				local var_230_15 = var_230_9.localEulerAngles

				var_230_15.z = 0
				var_230_15.x = 0
				var_230_9.localEulerAngles = var_230_15
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 then
				var_230_9.localPosition = Vector3.New(-0.7, -1, -6)

				local var_230_16 = manager.ui.mainCamera.transform.position - var_230_9.position

				var_230_9.forward = Vector3.New(var_230_16.x, var_230_16.y, var_230_16.z)

				local var_230_17 = var_230_9.localEulerAngles

				var_230_17.z = 0
				var_230_17.x = 0
				var_230_9.localEulerAngles = var_230_17
			end

			local var_230_18 = 0

			if var_230_18 < arg_227_1.time_ and arg_227_1.time_ <= var_230_18 + arg_230_0 then
				arg_227_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_230_19 = arg_227_1.actors_["1069ui_story"]
			local var_230_20 = 0

			if var_230_20 < arg_227_1.time_ and arg_227_1.time_ <= var_230_20 + arg_230_0 and arg_227_1.var_.characterEffect1069ui_story == nil then
				arg_227_1.var_.characterEffect1069ui_story = var_230_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_21 = 0.2

			if var_230_20 <= arg_227_1.time_ and arg_227_1.time_ < var_230_20 + var_230_21 then
				local var_230_22 = (arg_227_1.time_ - var_230_20) / var_230_21

				if arg_227_1.var_.characterEffect1069ui_story then
					arg_227_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_20 + var_230_21 and arg_227_1.time_ < var_230_20 + var_230_21 + arg_230_0 and arg_227_1.var_.characterEffect1069ui_story then
				arg_227_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_230_23 = arg_227_1.actors_["1029ui_story"]
			local var_230_24 = 0

			if var_230_24 < arg_227_1.time_ and arg_227_1.time_ <= var_230_24 + arg_230_0 and arg_227_1.var_.characterEffect1029ui_story == nil then
				arg_227_1.var_.characterEffect1029ui_story = var_230_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_25 = 0.2

			if var_230_24 <= arg_227_1.time_ and arg_227_1.time_ < var_230_24 + var_230_25 then
				local var_230_26 = (arg_227_1.time_ - var_230_24) / var_230_25

				if arg_227_1.var_.characterEffect1029ui_story then
					local var_230_27 = Mathf.Lerp(0, 0.5, var_230_26)

					arg_227_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1029ui_story.fillRatio = var_230_27
				end
			end

			if arg_227_1.time_ >= var_230_24 + var_230_25 and arg_227_1.time_ < var_230_24 + var_230_25 + arg_230_0 and arg_227_1.var_.characterEffect1029ui_story then
				local var_230_28 = 0.5

				arg_227_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1029ui_story.fillRatio = var_230_28
			end

			local var_230_29 = 0
			local var_230_30 = 0.6

			if var_230_29 < arg_227_1.time_ and arg_227_1.time_ <= var_230_29 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_31 = arg_227_1:FormatText(StoryNameCfg[378].name)

				arg_227_1.leftNameTxt_.text = var_230_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_32 = arg_227_1:GetWordFromCfg(120431056)
				local var_230_33 = arg_227_1:FormatText(var_230_32.content)

				arg_227_1.text_.text = var_230_33

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_34 = 24
				local var_230_35 = utf8.len(var_230_33)
				local var_230_36 = var_230_34 <= 0 and var_230_30 or var_230_30 * (var_230_35 / var_230_34)

				if var_230_36 > 0 and var_230_30 < var_230_36 then
					arg_227_1.talkMaxDuration = var_230_36

					if var_230_36 + var_230_29 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_36 + var_230_29
					end
				end

				arg_227_1.text_.text = var_230_33
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431056", "story_v_out_120431.awb") ~= 0 then
					local var_230_37 = manager.audio:GetVoiceLength("story_v_out_120431", "120431056", "story_v_out_120431.awb") / 1000

					if var_230_37 + var_230_29 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_37 + var_230_29
					end

					if var_230_32.prefab_name ~= "" and arg_227_1.actors_[var_230_32.prefab_name] ~= nil then
						local var_230_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_32.prefab_name].transform, "story_v_out_120431", "120431056", "story_v_out_120431.awb")

						arg_227_1:RecordAudio("120431056", var_230_38)
						arg_227_1:RecordAudio("120431056", var_230_38)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120431", "120431056", "story_v_out_120431.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120431", "120431056", "story_v_out_120431.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_39 = math.max(var_230_30, arg_227_1.talkMaxDuration)

			if var_230_29 <= arg_227_1.time_ and arg_227_1.time_ < var_230_29 + var_230_39 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_29) / var_230_39

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_29 + var_230_39 and arg_227_1.time_ < var_230_29 + var_230_39 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play120431057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 120431057
		arg_231_1.duration_ = 6.233

		local var_231_0 = {
			zh = 5.1,
			ja = 6.233
		}
		local var_231_1 = manager.audio:GetLocalizationFlag()

		if var_231_0[var_231_1] ~= nil then
			arg_231_1.duration_ = var_231_0[var_231_1]
		end

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play120431058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1029ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1029ui_story == nil then
				arg_231_1.var_.characterEffect1029ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1029ui_story then
					arg_231_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1029ui_story then
				arg_231_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_234_4 = arg_231_1.actors_["1069ui_story"]
			local var_234_5 = 0

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 and arg_231_1.var_.characterEffect1069ui_story == nil then
				arg_231_1.var_.characterEffect1069ui_story = var_234_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_6 = 0.2

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_6 then
				local var_234_7 = (arg_231_1.time_ - var_234_5) / var_234_6

				if arg_231_1.var_.characterEffect1069ui_story then
					local var_234_8 = Mathf.Lerp(0, 0.5, var_234_7)

					arg_231_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1069ui_story.fillRatio = var_234_8
				end
			end

			if arg_231_1.time_ >= var_234_5 + var_234_6 and arg_231_1.time_ < var_234_5 + var_234_6 + arg_234_0 and arg_231_1.var_.characterEffect1069ui_story then
				local var_234_9 = 0.5

				arg_231_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1069ui_story.fillRatio = var_234_9
			end

			local var_234_10 = 0
			local var_234_11 = 0.425

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_12 = arg_231_1:FormatText(StoryNameCfg[319].name)

				arg_231_1.leftNameTxt_.text = var_234_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_13 = arg_231_1:GetWordFromCfg(120431057)
				local var_234_14 = arg_231_1:FormatText(var_234_13.content)

				arg_231_1.text_.text = var_234_14

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_15 = 17
				local var_234_16 = utf8.len(var_234_14)
				local var_234_17 = var_234_15 <= 0 and var_234_11 or var_234_11 * (var_234_16 / var_234_15)

				if var_234_17 > 0 and var_234_11 < var_234_17 then
					arg_231_1.talkMaxDuration = var_234_17

					if var_234_17 + var_234_10 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_17 + var_234_10
					end
				end

				arg_231_1.text_.text = var_234_14
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431057", "story_v_out_120431.awb") ~= 0 then
					local var_234_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431057", "story_v_out_120431.awb") / 1000

					if var_234_18 + var_234_10 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_18 + var_234_10
					end

					if var_234_13.prefab_name ~= "" and arg_231_1.actors_[var_234_13.prefab_name] ~= nil then
						local var_234_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_13.prefab_name].transform, "story_v_out_120431", "120431057", "story_v_out_120431.awb")

						arg_231_1:RecordAudio("120431057", var_234_19)
						arg_231_1:RecordAudio("120431057", var_234_19)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_120431", "120431057", "story_v_out_120431.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_120431", "120431057", "story_v_out_120431.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_20 = math.max(var_234_11, arg_231_1.talkMaxDuration)

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_20 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_10) / var_234_20

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_10 + var_234_20 and arg_231_1.time_ < var_234_10 + var_234_20 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play120431058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 120431058
		arg_235_1.duration_ = 2.066

		local var_235_0 = {
			zh = 1.6,
			ja = 2.066
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play120431059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.175

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_2 = arg_235_1:FormatText(StoryNameCfg[319].name)

				arg_235_1.leftNameTxt_.text = var_238_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_3 = arg_235_1:GetWordFromCfg(120431058)
				local var_238_4 = arg_235_1:FormatText(var_238_3.content)

				arg_235_1.text_.text = var_238_4

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_5 = 7
				local var_238_6 = utf8.len(var_238_4)
				local var_238_7 = var_238_5 <= 0 and var_238_1 or var_238_1 * (var_238_6 / var_238_5)

				if var_238_7 > 0 and var_238_1 < var_238_7 then
					arg_235_1.talkMaxDuration = var_238_7

					if var_238_7 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_7 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_4
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431058", "story_v_out_120431.awb") ~= 0 then
					local var_238_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431058", "story_v_out_120431.awb") / 1000

					if var_238_8 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_8 + var_238_0
					end

					if var_238_3.prefab_name ~= "" and arg_235_1.actors_[var_238_3.prefab_name] ~= nil then
						local var_238_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_3.prefab_name].transform, "story_v_out_120431", "120431058", "story_v_out_120431.awb")

						arg_235_1:RecordAudio("120431058", var_238_9)
						arg_235_1:RecordAudio("120431058", var_238_9)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_120431", "120431058", "story_v_out_120431.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_120431", "120431058", "story_v_out_120431.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_10 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_10 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_10

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_10 and arg_235_1.time_ < var_238_0 + var_238_10 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play120431059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 120431059
		arg_239_1.duration_ = 7.533

		local var_239_0 = {
			zh = 6.066,
			ja = 7.533
		}
		local var_239_1 = manager.audio:GetLocalizationFlag()

		if var_239_0[var_239_1] ~= nil then
			arg_239_1.duration_ = var_239_0[var_239_1]
		end

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play120431060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1075ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1075ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1075ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1029ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1029ui_story == nil then
				arg_239_1.var_.characterEffect1029ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.2

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1029ui_story then
					local var_242_13 = Mathf.Lerp(0, 0.5, var_242_12)

					arg_239_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1029ui_story.fillRatio = var_242_13
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1029ui_story then
				local var_242_14 = 0.5

				arg_239_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1029ui_story.fillRatio = var_242_14
			end

			local var_242_15 = arg_239_1.actors_["1075ui_story"]
			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 and arg_239_1.var_.characterEffect1075ui_story == nil then
				arg_239_1.var_.characterEffect1075ui_story = var_242_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_17 = 0.2

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_17 then
				local var_242_18 = (arg_239_1.time_ - var_242_16) / var_242_17

				if arg_239_1.var_.characterEffect1075ui_story then
					arg_239_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_16 + var_242_17 and arg_239_1.time_ < var_242_16 + var_242_17 + arg_242_0 and arg_239_1.var_.characterEffect1075ui_story then
				arg_239_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_242_19 = arg_239_1.actors_["1069ui_story"].transform
			local var_242_20 = 0

			if var_242_20 < arg_239_1.time_ and arg_239_1.time_ <= var_242_20 + arg_242_0 then
				arg_239_1.var_.moveOldPos1069ui_story = var_242_19.localPosition
			end

			local var_242_21 = 0.001

			if var_242_20 <= arg_239_1.time_ and arg_239_1.time_ < var_242_20 + var_242_21 then
				local var_242_22 = (arg_239_1.time_ - var_242_20) / var_242_21
				local var_242_23 = Vector3.New(0, 100, 0)

				var_242_19.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1069ui_story, var_242_23, var_242_22)

				local var_242_24 = manager.ui.mainCamera.transform.position - var_242_19.position

				var_242_19.forward = Vector3.New(var_242_24.x, var_242_24.y, var_242_24.z)

				local var_242_25 = var_242_19.localEulerAngles

				var_242_25.z = 0
				var_242_25.x = 0
				var_242_19.localEulerAngles = var_242_25
			end

			if arg_239_1.time_ >= var_242_20 + var_242_21 and arg_239_1.time_ < var_242_20 + var_242_21 + arg_242_0 then
				var_242_19.localPosition = Vector3.New(0, 100, 0)

				local var_242_26 = manager.ui.mainCamera.transform.position - var_242_19.position

				var_242_19.forward = Vector3.New(var_242_26.x, var_242_26.y, var_242_26.z)

				local var_242_27 = var_242_19.localEulerAngles

				var_242_27.z = 0
				var_242_27.x = 0
				var_242_19.localEulerAngles = var_242_27
			end

			local var_242_28 = 0

			if var_242_28 < arg_239_1.time_ and arg_239_1.time_ <= var_242_28 + arg_242_0 then
				arg_239_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_242_29 = 0

			if var_242_29 < arg_239_1.time_ and arg_239_1.time_ <= var_242_29 + arg_242_0 then
				arg_239_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_242_30 = 0
			local var_242_31 = 0.75

			if var_242_30 < arg_239_1.time_ and arg_239_1.time_ <= var_242_30 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_32 = arg_239_1:FormatText(StoryNameCfg[381].name)

				arg_239_1.leftNameTxt_.text = var_242_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_33 = arg_239_1:GetWordFromCfg(120431059)
				local var_242_34 = arg_239_1:FormatText(var_242_33.content)

				arg_239_1.text_.text = var_242_34

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_35 = 29
				local var_242_36 = utf8.len(var_242_34)
				local var_242_37 = var_242_35 <= 0 and var_242_31 or var_242_31 * (var_242_36 / var_242_35)

				if var_242_37 > 0 and var_242_31 < var_242_37 then
					arg_239_1.talkMaxDuration = var_242_37

					if var_242_37 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_37 + var_242_30
					end
				end

				arg_239_1.text_.text = var_242_34
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431059", "story_v_out_120431.awb") ~= 0 then
					local var_242_38 = manager.audio:GetVoiceLength("story_v_out_120431", "120431059", "story_v_out_120431.awb") / 1000

					if var_242_38 + var_242_30 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_38 + var_242_30
					end

					if var_242_33.prefab_name ~= "" and arg_239_1.actors_[var_242_33.prefab_name] ~= nil then
						local var_242_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_33.prefab_name].transform, "story_v_out_120431", "120431059", "story_v_out_120431.awb")

						arg_239_1:RecordAudio("120431059", var_242_39)
						arg_239_1:RecordAudio("120431059", var_242_39)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_120431", "120431059", "story_v_out_120431.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_120431", "120431059", "story_v_out_120431.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_40 = math.max(var_242_31, arg_239_1.talkMaxDuration)

			if var_242_30 <= arg_239_1.time_ and arg_239_1.time_ < var_242_30 + var_242_40 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_30) / var_242_40

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_30 + var_242_40 and arg_239_1.time_ < var_242_30 + var_242_40 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play120431060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 120431060
		arg_243_1.duration_ = 6.3

		local var_243_0 = {
			zh = 6.266,
			ja = 6.3
		}
		local var_243_1 = manager.audio:GetLocalizationFlag()

		if var_243_0[var_243_1] ~= nil then
			arg_243_1.duration_ = var_243_0[var_243_1]
		end

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play120431061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_246_2 = 0
			local var_246_3 = 0.6

			if var_246_2 < arg_243_1.time_ and arg_243_1.time_ <= var_246_2 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_4 = arg_243_1:FormatText(StoryNameCfg[381].name)

				arg_243_1.leftNameTxt_.text = var_246_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_5 = arg_243_1:GetWordFromCfg(120431060)
				local var_246_6 = arg_243_1:FormatText(var_246_5.content)

				arg_243_1.text_.text = var_246_6

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_7 = 24
				local var_246_8 = utf8.len(var_246_6)
				local var_246_9 = var_246_7 <= 0 and var_246_3 or var_246_3 * (var_246_8 / var_246_7)

				if var_246_9 > 0 and var_246_3 < var_246_9 then
					arg_243_1.talkMaxDuration = var_246_9

					if var_246_9 + var_246_2 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_9 + var_246_2
					end
				end

				arg_243_1.text_.text = var_246_6
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431060", "story_v_out_120431.awb") ~= 0 then
					local var_246_10 = manager.audio:GetVoiceLength("story_v_out_120431", "120431060", "story_v_out_120431.awb") / 1000

					if var_246_10 + var_246_2 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_10 + var_246_2
					end

					if var_246_5.prefab_name ~= "" and arg_243_1.actors_[var_246_5.prefab_name] ~= nil then
						local var_246_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_5.prefab_name].transform, "story_v_out_120431", "120431060", "story_v_out_120431.awb")

						arg_243_1:RecordAudio("120431060", var_246_11)
						arg_243_1:RecordAudio("120431060", var_246_11)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_120431", "120431060", "story_v_out_120431.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_120431", "120431060", "story_v_out_120431.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_12 = math.max(var_246_3, arg_243_1.talkMaxDuration)

			if var_246_2 <= arg_243_1.time_ and arg_243_1.time_ < var_246_2 + var_246_12 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_2) / var_246_12

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_2 + var_246_12 and arg_243_1.time_ < var_246_2 + var_246_12 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play120431061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 120431061
		arg_247_1.duration_ = 10.1

		local var_247_0 = {
			zh = 5.6,
			ja = 10.1
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play120431062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_250_1 = arg_247_1.actors_["1075ui_story"]
			local var_250_2 = 0

			if var_250_2 < arg_247_1.time_ and arg_247_1.time_ <= var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1075ui_story == nil then
				arg_247_1.var_.characterEffect1075ui_story = var_250_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_3 = 0.2

			if var_250_2 <= arg_247_1.time_ and arg_247_1.time_ < var_250_2 + var_250_3 then
				local var_250_4 = (arg_247_1.time_ - var_250_2) / var_250_3

				if arg_247_1.var_.characterEffect1075ui_story then
					local var_250_5 = Mathf.Lerp(0, 0.5, var_250_4)

					arg_247_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1075ui_story.fillRatio = var_250_5
				end
			end

			if arg_247_1.time_ >= var_250_2 + var_250_3 and arg_247_1.time_ < var_250_2 + var_250_3 + arg_250_0 and arg_247_1.var_.characterEffect1075ui_story then
				local var_250_6 = 0.5

				arg_247_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1075ui_story.fillRatio = var_250_6
			end

			local var_250_7 = arg_247_1.actors_["1084ui_story"]
			local var_250_8 = 0

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 and arg_247_1.var_.characterEffect1084ui_story == nil then
				arg_247_1.var_.characterEffect1084ui_story = var_250_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_9 = 0.2

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_9 then
				local var_250_10 = (arg_247_1.time_ - var_250_8) / var_250_9

				if arg_247_1.var_.characterEffect1084ui_story then
					arg_247_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_8 + var_250_9 and arg_247_1.time_ < var_250_8 + var_250_9 + arg_250_0 and arg_247_1.var_.characterEffect1084ui_story then
				arg_247_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_250_11 = arg_247_1.actors_["1084ui_story"].transform
			local var_250_12 = 0

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.var_.moveOldPos1084ui_story = var_250_11.localPosition
			end

			local var_250_13 = 0.001

			if var_250_12 <= arg_247_1.time_ and arg_247_1.time_ < var_250_12 + var_250_13 then
				local var_250_14 = (arg_247_1.time_ - var_250_12) / var_250_13
				local var_250_15 = Vector3.New(0, -0.97, -6)

				var_250_11.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1084ui_story, var_250_15, var_250_14)

				local var_250_16 = manager.ui.mainCamera.transform.position - var_250_11.position

				var_250_11.forward = Vector3.New(var_250_16.x, var_250_16.y, var_250_16.z)

				local var_250_17 = var_250_11.localEulerAngles

				var_250_17.z = 0
				var_250_17.x = 0
				var_250_11.localEulerAngles = var_250_17
			end

			if arg_247_1.time_ >= var_250_12 + var_250_13 and arg_247_1.time_ < var_250_12 + var_250_13 + arg_250_0 then
				var_250_11.localPosition = Vector3.New(0, -0.97, -6)

				local var_250_18 = manager.ui.mainCamera.transform.position - var_250_11.position

				var_250_11.forward = Vector3.New(var_250_18.x, var_250_18.y, var_250_18.z)

				local var_250_19 = var_250_11.localEulerAngles

				var_250_19.z = 0
				var_250_19.x = 0
				var_250_11.localEulerAngles = var_250_19
			end

			local var_250_20 = arg_247_1.actors_["1075ui_story"].transform
			local var_250_21 = 0

			if var_250_21 < arg_247_1.time_ and arg_247_1.time_ <= var_250_21 + arg_250_0 then
				arg_247_1.var_.moveOldPos1075ui_story = var_250_20.localPosition
			end

			local var_250_22 = 0.001

			if var_250_21 <= arg_247_1.time_ and arg_247_1.time_ < var_250_21 + var_250_22 then
				local var_250_23 = (arg_247_1.time_ - var_250_21) / var_250_22
				local var_250_24 = Vector3.New(0, 100, 0)

				var_250_20.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1075ui_story, var_250_24, var_250_23)

				local var_250_25 = manager.ui.mainCamera.transform.position - var_250_20.position

				var_250_20.forward = Vector3.New(var_250_25.x, var_250_25.y, var_250_25.z)

				local var_250_26 = var_250_20.localEulerAngles

				var_250_26.z = 0
				var_250_26.x = 0
				var_250_20.localEulerAngles = var_250_26
			end

			if arg_247_1.time_ >= var_250_21 + var_250_22 and arg_247_1.time_ < var_250_21 + var_250_22 + arg_250_0 then
				var_250_20.localPosition = Vector3.New(0, 100, 0)

				local var_250_27 = manager.ui.mainCamera.transform.position - var_250_20.position

				var_250_20.forward = Vector3.New(var_250_27.x, var_250_27.y, var_250_27.z)

				local var_250_28 = var_250_20.localEulerAngles

				var_250_28.z = 0
				var_250_28.x = 0
				var_250_20.localEulerAngles = var_250_28
			end

			local var_250_29 = arg_247_1.actors_["1029ui_story"].transform
			local var_250_30 = 0

			if var_250_30 < arg_247_1.time_ and arg_247_1.time_ <= var_250_30 + arg_250_0 then
				arg_247_1.var_.moveOldPos1029ui_story = var_250_29.localPosition
			end

			local var_250_31 = 0.001

			if var_250_30 <= arg_247_1.time_ and arg_247_1.time_ < var_250_30 + var_250_31 then
				local var_250_32 = (arg_247_1.time_ - var_250_30) / var_250_31
				local var_250_33 = Vector3.New(0, 100, 0)

				var_250_29.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1029ui_story, var_250_33, var_250_32)

				local var_250_34 = manager.ui.mainCamera.transform.position - var_250_29.position

				var_250_29.forward = Vector3.New(var_250_34.x, var_250_34.y, var_250_34.z)

				local var_250_35 = var_250_29.localEulerAngles

				var_250_35.z = 0
				var_250_35.x = 0
				var_250_29.localEulerAngles = var_250_35
			end

			if arg_247_1.time_ >= var_250_30 + var_250_31 and arg_247_1.time_ < var_250_30 + var_250_31 + arg_250_0 then
				var_250_29.localPosition = Vector3.New(0, 100, 0)

				local var_250_36 = manager.ui.mainCamera.transform.position - var_250_29.position

				var_250_29.forward = Vector3.New(var_250_36.x, var_250_36.y, var_250_36.z)

				local var_250_37 = var_250_29.localEulerAngles

				var_250_37.z = 0
				var_250_37.x = 0
				var_250_29.localEulerAngles = var_250_37
			end

			local var_250_38 = 0

			if var_250_38 < arg_247_1.time_ and arg_247_1.time_ <= var_250_38 + arg_250_0 then
				arg_247_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_250_39 = 0
			local var_250_40 = 0.575

			if var_250_39 < arg_247_1.time_ and arg_247_1.time_ <= var_250_39 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_41 = arg_247_1:FormatText(StoryNameCfg[6].name)

				arg_247_1.leftNameTxt_.text = var_250_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_42 = arg_247_1:GetWordFromCfg(120431061)
				local var_250_43 = arg_247_1:FormatText(var_250_42.content)

				arg_247_1.text_.text = var_250_43

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_44 = 23
				local var_250_45 = utf8.len(var_250_43)
				local var_250_46 = var_250_44 <= 0 and var_250_40 or var_250_40 * (var_250_45 / var_250_44)

				if var_250_46 > 0 and var_250_40 < var_250_46 then
					arg_247_1.talkMaxDuration = var_250_46

					if var_250_46 + var_250_39 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_46 + var_250_39
					end
				end

				arg_247_1.text_.text = var_250_43
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431061", "story_v_out_120431.awb") ~= 0 then
					local var_250_47 = manager.audio:GetVoiceLength("story_v_out_120431", "120431061", "story_v_out_120431.awb") / 1000

					if var_250_47 + var_250_39 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_47 + var_250_39
					end

					if var_250_42.prefab_name ~= "" and arg_247_1.actors_[var_250_42.prefab_name] ~= nil then
						local var_250_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_42.prefab_name].transform, "story_v_out_120431", "120431061", "story_v_out_120431.awb")

						arg_247_1:RecordAudio("120431061", var_250_48)
						arg_247_1:RecordAudio("120431061", var_250_48)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_120431", "120431061", "story_v_out_120431.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_120431", "120431061", "story_v_out_120431.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_49 = math.max(var_250_40, arg_247_1.talkMaxDuration)

			if var_250_39 <= arg_247_1.time_ and arg_247_1.time_ < var_250_39 + var_250_49 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_39) / var_250_49

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_39 + var_250_49 and arg_247_1.time_ < var_250_39 + var_250_49 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play120431062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120431062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play120431063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1084ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1084ui_story == nil then
				arg_251_1.var_.characterEffect1084ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1084ui_story then
					local var_254_4 = Mathf.Lerp(0, 0.5, var_254_3)

					arg_251_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1084ui_story.fillRatio = var_254_4
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1084ui_story then
				local var_254_5 = 0.5

				arg_251_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1084ui_story.fillRatio = var_254_5
			end

			local var_254_6 = 0
			local var_254_7 = 0.3

			if var_254_6 < arg_251_1.time_ and arg_251_1.time_ <= var_254_6 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_8 = arg_251_1:FormatText(StoryNameCfg[7].name)

				arg_251_1.leftNameTxt_.text = var_254_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_9 = arg_251_1:GetWordFromCfg(120431062)
				local var_254_10 = arg_251_1:FormatText(var_254_9.content)

				arg_251_1.text_.text = var_254_10

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_11 = 12
				local var_254_12 = utf8.len(var_254_10)
				local var_254_13 = var_254_11 <= 0 and var_254_7 or var_254_7 * (var_254_12 / var_254_11)

				if var_254_13 > 0 and var_254_7 < var_254_13 then
					arg_251_1.talkMaxDuration = var_254_13

					if var_254_13 + var_254_6 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_13 + var_254_6
					end
				end

				arg_251_1.text_.text = var_254_10
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_14 = math.max(var_254_7, arg_251_1.talkMaxDuration)

			if var_254_6 <= arg_251_1.time_ and arg_251_1.time_ < var_254_6 + var_254_14 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_6) / var_254_14

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_6 + var_254_14 and arg_251_1.time_ < var_254_6 + var_254_14 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120431063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120431063
		arg_255_1.duration_ = 4.233

		local var_255_0 = {
			zh = 2.033,
			ja = 4.233
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play120431064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1084ui_story"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1084ui_story = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(0, 100, 0)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1084ui_story, var_258_4, var_258_3)

				local var_258_5 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_5.x, var_258_5.y, var_258_5.z)

				local var_258_6 = var_258_0.localEulerAngles

				var_258_6.z = 0
				var_258_6.x = 0
				var_258_0.localEulerAngles = var_258_6
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(0, 100, 0)

				local var_258_7 = manager.ui.mainCamera.transform.position - var_258_0.position

				var_258_0.forward = Vector3.New(var_258_7.x, var_258_7.y, var_258_7.z)

				local var_258_8 = var_258_0.localEulerAngles

				var_258_8.z = 0
				var_258_8.x = 0
				var_258_0.localEulerAngles = var_258_8
			end

			local var_258_9 = arg_255_1.actors_["1069ui_story"].transform
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 then
				arg_255_1.var_.moveOldPos1069ui_story = var_258_9.localPosition
			end

			local var_258_11 = 0.001

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11
				local var_258_13 = Vector3.New(0, -1, -6)

				var_258_9.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1069ui_story, var_258_13, var_258_12)

				local var_258_14 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_14.x, var_258_14.y, var_258_14.z)

				local var_258_15 = var_258_9.localEulerAngles

				var_258_15.z = 0
				var_258_15.x = 0
				var_258_9.localEulerAngles = var_258_15
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 then
				var_258_9.localPosition = Vector3.New(0, -1, -6)

				local var_258_16 = manager.ui.mainCamera.transform.position - var_258_9.position

				var_258_9.forward = Vector3.New(var_258_16.x, var_258_16.y, var_258_16.z)

				local var_258_17 = var_258_9.localEulerAngles

				var_258_17.z = 0
				var_258_17.x = 0
				var_258_9.localEulerAngles = var_258_17
			end

			local var_258_18 = 0

			if var_258_18 < arg_255_1.time_ and arg_255_1.time_ <= var_258_18 + arg_258_0 then
				arg_255_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_258_19 = 0

			if var_258_19 < arg_255_1.time_ and arg_255_1.time_ <= var_258_19 + arg_258_0 then
				arg_255_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_258_20 = arg_255_1.actors_["1069ui_story"]
			local var_258_21 = 0

			if var_258_21 < arg_255_1.time_ and arg_255_1.time_ <= var_258_21 + arg_258_0 and arg_255_1.var_.characterEffect1069ui_story == nil then
				arg_255_1.var_.characterEffect1069ui_story = var_258_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_22 = 0.2

			if var_258_21 <= arg_255_1.time_ and arg_255_1.time_ < var_258_21 + var_258_22 then
				local var_258_23 = (arg_255_1.time_ - var_258_21) / var_258_22

				if arg_255_1.var_.characterEffect1069ui_story then
					arg_255_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_21 + var_258_22 and arg_255_1.time_ < var_258_21 + var_258_22 + arg_258_0 and arg_255_1.var_.characterEffect1069ui_story then
				arg_255_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_258_24 = 0
			local var_258_25 = 0.3

			if var_258_24 < arg_255_1.time_ and arg_255_1.time_ <= var_258_24 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_26 = arg_255_1:FormatText(StoryNameCfg[378].name)

				arg_255_1.leftNameTxt_.text = var_258_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_27 = arg_255_1:GetWordFromCfg(120431063)
				local var_258_28 = arg_255_1:FormatText(var_258_27.content)

				arg_255_1.text_.text = var_258_28

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_29 = 12
				local var_258_30 = utf8.len(var_258_28)
				local var_258_31 = var_258_29 <= 0 and var_258_25 or var_258_25 * (var_258_30 / var_258_29)

				if var_258_31 > 0 and var_258_25 < var_258_31 then
					arg_255_1.talkMaxDuration = var_258_31

					if var_258_31 + var_258_24 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_31 + var_258_24
					end
				end

				arg_255_1.text_.text = var_258_28
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431063", "story_v_out_120431.awb") ~= 0 then
					local var_258_32 = manager.audio:GetVoiceLength("story_v_out_120431", "120431063", "story_v_out_120431.awb") / 1000

					if var_258_32 + var_258_24 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_32 + var_258_24
					end

					if var_258_27.prefab_name ~= "" and arg_255_1.actors_[var_258_27.prefab_name] ~= nil then
						local var_258_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_27.prefab_name].transform, "story_v_out_120431", "120431063", "story_v_out_120431.awb")

						arg_255_1:RecordAudio("120431063", var_258_33)
						arg_255_1:RecordAudio("120431063", var_258_33)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_120431", "120431063", "story_v_out_120431.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_120431", "120431063", "story_v_out_120431.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_34 = math.max(var_258_25, arg_255_1.talkMaxDuration)

			if var_258_24 <= arg_255_1.time_ and arg_255_1.time_ < var_258_24 + var_258_34 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_24) / var_258_34

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_24 + var_258_34 and arg_255_1.time_ < var_258_24 + var_258_34 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120431064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120431064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play120431065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1069ui_story"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos1069ui_story = var_262_0.localPosition
			end

			local var_262_2 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2
				local var_262_4 = Vector3.New(0, 100, 0)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1069ui_story, var_262_4, var_262_3)

				local var_262_5 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_5.x, var_262_5.y, var_262_5.z)

				local var_262_6 = var_262_0.localEulerAngles

				var_262_6.z = 0
				var_262_6.x = 0
				var_262_0.localEulerAngles = var_262_6
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(0, 100, 0)

				local var_262_7 = manager.ui.mainCamera.transform.position - var_262_0.position

				var_262_0.forward = Vector3.New(var_262_7.x, var_262_7.y, var_262_7.z)

				local var_262_8 = var_262_0.localEulerAngles

				var_262_8.z = 0
				var_262_8.x = 0
				var_262_0.localEulerAngles = var_262_8
			end

			local var_262_9 = 0
			local var_262_10 = 0.575

			if var_262_9 < arg_259_1.time_ and arg_259_1.time_ <= var_262_9 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_11 = arg_259_1:GetWordFromCfg(120431064)
				local var_262_12 = arg_259_1:FormatText(var_262_11.content)

				arg_259_1.text_.text = var_262_12

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_13 = 23
				local var_262_14 = utf8.len(var_262_12)
				local var_262_15 = var_262_13 <= 0 and var_262_10 or var_262_10 * (var_262_14 / var_262_13)

				if var_262_15 > 0 and var_262_10 < var_262_15 then
					arg_259_1.talkMaxDuration = var_262_15

					if var_262_15 + var_262_9 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_15 + var_262_9
					end
				end

				arg_259_1.text_.text = var_262_12
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_16 = math.max(var_262_10, arg_259_1.talkMaxDuration)

			if var_262_9 <= arg_259_1.time_ and arg_259_1.time_ < var_262_9 + var_262_16 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_9) / var_262_16

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_9 + var_262_16 and arg_259_1.time_ < var_262_9 + var_262_16 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120431065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120431065
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play120431066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.3

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[7].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(120431065)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 12
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_8 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_8 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_8

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_8 and arg_263_1.time_ < var_266_0 + var_266_8 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120431066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120431066
		arg_267_1.duration_ = 7

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play120431067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.mask_.enabled = true
				arg_267_1.mask_.raycastTarget = true

				arg_267_1:SetGaussion(false)
			end

			local var_270_1 = 2

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_1 then
				local var_270_2 = (arg_267_1.time_ - var_270_0) / var_270_1
				local var_270_3 = Color.New(1, 1, 1)

				var_270_3.a = Mathf.Lerp(1, 0, var_270_2)
				arg_267_1.mask_.color = var_270_3
			end

			if arg_267_1.time_ >= var_270_0 + var_270_1 and arg_267_1.time_ < var_270_0 + var_270_1 + arg_270_0 then
				local var_270_4 = Color.New(1, 1, 1)
				local var_270_5 = 0

				arg_267_1.mask_.enabled = false
				var_270_4.a = var_270_5
				arg_267_1.mask_.color = var_270_4
			end

			if arg_267_1.frameCnt_ <= 1 then
				arg_267_1.dialog_:SetActive(false)
			end

			local var_270_6 = 2
			local var_270_7 = 0.8

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0

				arg_267_1.dialog_:SetActive(true)

				local var_270_8 = LeanTween.value(arg_267_1.dialog_, 0, 1, 0.3)

				var_270_8:setOnUpdate(LuaHelper.FloatAction(function(arg_271_0)
					arg_267_1.dialogCg_.alpha = arg_271_0
				end))
				var_270_8:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_267_1.dialog_)
					var_270_8:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_267_1.duration_ = arg_267_1.duration_ + 0.3

				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_9 = arg_267_1:GetWordFromCfg(120431066)
				local var_270_10 = arg_267_1:FormatText(var_270_9.content)

				arg_267_1.text_.text = var_270_10

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_11 = 32
				local var_270_12 = utf8.len(var_270_10)
				local var_270_13 = var_270_11 <= 0 and var_270_7 or var_270_7 * (var_270_12 / var_270_11)

				if var_270_13 > 0 and var_270_7 < var_270_13 then
					arg_267_1.talkMaxDuration = var_270_13
					var_270_6 = var_270_6 + 0.3

					if var_270_13 + var_270_6 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_13 + var_270_6
					end
				end

				arg_267_1.text_.text = var_270_10
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_14 = var_270_6 + 0.3
			local var_270_15 = math.max(var_270_7, arg_267_1.talkMaxDuration)

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_15 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_14) / var_270_15

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120431067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 120431067
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play120431068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.275

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[7].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(120431067)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 11
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_8 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_8 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_8

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_8 and arg_273_1.time_ < var_276_0 + var_276_8 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play120431068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 120431068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play120431069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(120431068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 40
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play120431069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 120431069
		arg_281_1.duration_ = 8.7

		local var_281_0 = {
			zh = 2.2,
			ja = 8.7
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play120431070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1076ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1076ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, -1.06, -6.2)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1076ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = 0

			if var_284_9 < arg_281_1.time_ and arg_281_1.time_ <= var_284_9 + arg_284_0 then
				arg_281_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_284_11 = arg_281_1.actors_["1076ui_story"]
			local var_284_12 = 0

			if var_284_12 < arg_281_1.time_ and arg_281_1.time_ <= var_284_12 + arg_284_0 and arg_281_1.var_.characterEffect1076ui_story == nil then
				arg_281_1.var_.characterEffect1076ui_story = var_284_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_13 = 0.2

			if var_284_12 <= arg_281_1.time_ and arg_281_1.time_ < var_284_12 + var_284_13 then
				local var_284_14 = (arg_281_1.time_ - var_284_12) / var_284_13

				if arg_281_1.var_.characterEffect1076ui_story then
					arg_281_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_12 + var_284_13 and arg_281_1.time_ < var_284_12 + var_284_13 + arg_284_0 and arg_281_1.var_.characterEffect1076ui_story then
				arg_281_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_284_15 = 0
			local var_284_16 = 0.3

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_17 = arg_281_1:FormatText(StoryNameCfg[389].name)

				arg_281_1.leftNameTxt_.text = var_284_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_18 = arg_281_1:GetWordFromCfg(120431069)
				local var_284_19 = arg_281_1:FormatText(var_284_18.content)

				arg_281_1.text_.text = var_284_19

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_20 = 12
				local var_284_21 = utf8.len(var_284_19)
				local var_284_22 = var_284_20 <= 0 and var_284_16 or var_284_16 * (var_284_21 / var_284_20)

				if var_284_22 > 0 and var_284_16 < var_284_22 then
					arg_281_1.talkMaxDuration = var_284_22

					if var_284_22 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_22 + var_284_15
					end
				end

				arg_281_1.text_.text = var_284_19
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431069", "story_v_out_120431.awb") ~= 0 then
					local var_284_23 = manager.audio:GetVoiceLength("story_v_out_120431", "120431069", "story_v_out_120431.awb") / 1000

					if var_284_23 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_23 + var_284_15
					end

					if var_284_18.prefab_name ~= "" and arg_281_1.actors_[var_284_18.prefab_name] ~= nil then
						local var_284_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_18.prefab_name].transform, "story_v_out_120431", "120431069", "story_v_out_120431.awb")

						arg_281_1:RecordAudio("120431069", var_284_24)
						arg_281_1:RecordAudio("120431069", var_284_24)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_120431", "120431069", "story_v_out_120431.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_120431", "120431069", "story_v_out_120431.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_25 = math.max(var_284_16, arg_281_1.talkMaxDuration)

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_25 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_15) / var_284_25

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_15 + var_284_25 and arg_281_1.time_ < var_284_15 + var_284_25 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play120431070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 120431070
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play120431071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1076ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect1076ui_story == nil then
				arg_285_1.var_.characterEffect1076ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.2

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1076ui_story then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1076ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1076ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1076ui_story.fillRatio = var_288_5
			end

			local var_288_6 = 0
			local var_288_7 = 0.35

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_8 = arg_285_1:FormatText(StoryNameCfg[7].name)

				arg_285_1.leftNameTxt_.text = var_288_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_9 = arg_285_1:GetWordFromCfg(120431070)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 14
				local var_288_12 = utf8.len(var_288_10)
				local var_288_13 = var_288_11 <= 0 and var_288_7 or var_288_7 * (var_288_12 / var_288_11)

				if var_288_13 > 0 and var_288_7 < var_288_13 then
					arg_285_1.talkMaxDuration = var_288_13

					if var_288_13 + var_288_6 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_13 + var_288_6
					end
				end

				arg_285_1.text_.text = var_288_10
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_14 = math.max(var_288_7, arg_285_1.talkMaxDuration)

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_14 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_6) / var_288_14

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_6 + var_288_14 and arg_285_1.time_ < var_288_6 + var_288_14 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play120431071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 120431071
		arg_289_1.duration_ = 7

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play120431072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = "STblack"

			if arg_289_1.bgs_[var_292_0] == nil then
				local var_292_1 = Object.Instantiate(arg_289_1.paintGo_)

				var_292_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_292_0)
				var_292_1.name = var_292_0
				var_292_1.transform.parent = arg_289_1.stage_.transform
				var_292_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.bgs_[var_292_0] = var_292_1
			end

			local var_292_2 = 2

			if var_292_2 < arg_289_1.time_ and arg_289_1.time_ <= var_292_2 + arg_292_0 then
				local var_292_3 = manager.ui.mainCamera.transform.localPosition
				local var_292_4 = Vector3.New(0, 0, 10) + Vector3.New(var_292_3.x, var_292_3.y, 0)
				local var_292_5 = arg_289_1.bgs_.STblack

				var_292_5.transform.localPosition = var_292_4
				var_292_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_292_6 = var_292_5:GetComponent("SpriteRenderer")

				if var_292_6 and var_292_6.sprite then
					local var_292_7 = (var_292_5.transform.localPosition - var_292_3).z
					local var_292_8 = manager.ui.mainCameraCom_
					local var_292_9 = 2 * var_292_7 * Mathf.Tan(var_292_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_292_10 = var_292_9 * var_292_8.aspect
					local var_292_11 = var_292_6.sprite.bounds.size.x
					local var_292_12 = var_292_6.sprite.bounds.size.y
					local var_292_13 = var_292_10 / var_292_11
					local var_292_14 = var_292_9 / var_292_12
					local var_292_15 = var_292_14 < var_292_13 and var_292_13 or var_292_14

					var_292_5.transform.localScale = Vector3.New(var_292_15, var_292_15, 0)
				end

				for iter_292_0, iter_292_1 in pairs(arg_289_1.bgs_) do
					if iter_292_0 ~= "STblack" then
						iter_292_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_292_16 = 0

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = true

				arg_289_1:SetGaussion(false)
			end

			local var_292_17 = 2

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17
				local var_292_19 = Color.New(0, 0, 0)

				var_292_19.a = Mathf.Lerp(0, 1, var_292_18)
				arg_289_1.mask_.color = var_292_19
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 then
				local var_292_20 = Color.New(0, 0, 0)

				var_292_20.a = 1
				arg_289_1.mask_.color = var_292_20
			end

			local var_292_21 = 2

			if var_292_21 < arg_289_1.time_ and arg_289_1.time_ <= var_292_21 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = true

				arg_289_1:SetGaussion(false)
			end

			local var_292_22 = 1

			if var_292_21 <= arg_289_1.time_ and arg_289_1.time_ < var_292_21 + var_292_22 then
				local var_292_23 = (arg_289_1.time_ - var_292_21) / var_292_22
				local var_292_24 = Color.New(0, 0, 0)

				var_292_24.a = Mathf.Lerp(1, 0, var_292_23)
				arg_289_1.mask_.color = var_292_24
			end

			if arg_289_1.time_ >= var_292_21 + var_292_22 and arg_289_1.time_ < var_292_21 + var_292_22 + arg_292_0 then
				local var_292_25 = Color.New(0, 0, 0)
				local var_292_26 = 0

				arg_289_1.mask_.enabled = false
				var_292_25.a = var_292_26
				arg_289_1.mask_.color = var_292_25
			end

			local var_292_27 = arg_289_1.actors_["1076ui_story"].transform
			local var_292_28 = 1.966

			if var_292_28 < arg_289_1.time_ and arg_289_1.time_ <= var_292_28 + arg_292_0 then
				arg_289_1.var_.moveOldPos1076ui_story = var_292_27.localPosition
			end

			local var_292_29 = 0.001

			if var_292_28 <= arg_289_1.time_ and arg_289_1.time_ < var_292_28 + var_292_29 then
				local var_292_30 = (arg_289_1.time_ - var_292_28) / var_292_29
				local var_292_31 = Vector3.New(0, 100, 0)

				var_292_27.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1076ui_story, var_292_31, var_292_30)

				local var_292_32 = manager.ui.mainCamera.transform.position - var_292_27.position

				var_292_27.forward = Vector3.New(var_292_32.x, var_292_32.y, var_292_32.z)

				local var_292_33 = var_292_27.localEulerAngles

				var_292_33.z = 0
				var_292_33.x = 0
				var_292_27.localEulerAngles = var_292_33
			end

			if arg_289_1.time_ >= var_292_28 + var_292_29 and arg_289_1.time_ < var_292_28 + var_292_29 + arg_292_0 then
				var_292_27.localPosition = Vector3.New(0, 100, 0)

				local var_292_34 = manager.ui.mainCamera.transform.position - var_292_27.position

				var_292_27.forward = Vector3.New(var_292_34.x, var_292_34.y, var_292_34.z)

				local var_292_35 = var_292_27.localEulerAngles

				var_292_35.z = 0
				var_292_35.x = 0
				var_292_27.localEulerAngles = var_292_35
			end

			if arg_289_1.frameCnt_ <= 1 then
				arg_289_1.dialog_:SetActive(false)
			end

			local var_292_36 = 2
			local var_292_37 = 0.4

			if var_292_36 < arg_289_1.time_ and arg_289_1.time_ <= var_292_36 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0

				arg_289_1.dialog_:SetActive(true)

				local var_292_38 = LeanTween.value(arg_289_1.dialog_, 0, 1, 0.3)

				var_292_38:setOnUpdate(LuaHelper.FloatAction(function(arg_293_0)
					arg_289_1.dialogCg_.alpha = arg_293_0
				end))
				var_292_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_289_1.dialog_)
					var_292_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_289_1.duration_ = arg_289_1.duration_ + 0.3

				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_39 = arg_289_1:GetWordFromCfg(120431071)
				local var_292_40 = arg_289_1:FormatText(var_292_39.content)

				arg_289_1.text_.text = var_292_40

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_41 = 16
				local var_292_42 = utf8.len(var_292_40)
				local var_292_43 = var_292_41 <= 0 and var_292_37 or var_292_37 * (var_292_42 / var_292_41)

				if var_292_43 > 0 and var_292_37 < var_292_43 then
					arg_289_1.talkMaxDuration = var_292_43
					var_292_36 = var_292_36 + 0.3

					if var_292_43 + var_292_36 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_43 + var_292_36
					end
				end

				arg_289_1.text_.text = var_292_40
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_44 = var_292_36 + 0.3
			local var_292_45 = math.max(var_292_37, arg_289_1.talkMaxDuration)

			if var_292_44 <= arg_289_1.time_ and arg_289_1.time_ < var_292_44 + var_292_45 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_44) / var_292_45

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_44 + var_292_45 and arg_289_1.time_ < var_292_44 + var_292_45 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play120431072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120431072
		arg_295_1.duration_ = 5.25

		local var_295_0 = {
			zh = 5.25,
			ja = 4.716
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play120431073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = "XH0205"

			if arg_295_1.bgs_[var_298_0] == nil then
				local var_298_1 = Object.Instantiate(arg_295_1.paintGo_)

				var_298_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_298_0)
				var_298_1.name = var_298_0
				var_298_1.transform.parent = arg_295_1.stage_.transform
				var_298_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_295_1.bgs_[var_298_0] = var_298_1
			end

			local var_298_2 = 0

			if var_298_2 < arg_295_1.time_ and arg_295_1.time_ <= var_298_2 + arg_298_0 then
				local var_298_3 = manager.ui.mainCamera.transform.localPosition
				local var_298_4 = Vector3.New(0, 0, 10) + Vector3.New(var_298_3.x, var_298_3.y, 0)
				local var_298_5 = arg_295_1.bgs_.XH0205

				var_298_5.transform.localPosition = var_298_4
				var_298_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_298_6 = var_298_5:GetComponent("SpriteRenderer")

				if var_298_6 and var_298_6.sprite then
					local var_298_7 = (var_298_5.transform.localPosition - var_298_3).z
					local var_298_8 = manager.ui.mainCameraCom_
					local var_298_9 = 2 * var_298_7 * Mathf.Tan(var_298_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_298_10 = var_298_9 * var_298_8.aspect
					local var_298_11 = var_298_6.sprite.bounds.size.x
					local var_298_12 = var_298_6.sprite.bounds.size.y
					local var_298_13 = var_298_10 / var_298_11
					local var_298_14 = var_298_9 / var_298_12
					local var_298_15 = var_298_14 < var_298_13 and var_298_13 or var_298_14

					var_298_5.transform.localScale = Vector3.New(var_298_15, var_298_15, 0)
				end

				for iter_298_0, iter_298_1 in pairs(arg_295_1.bgs_) do
					if iter_298_0 ~= "XH0205" then
						iter_298_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_17 = 3.5

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17
				local var_298_19 = Color.New(0, 0, 0)

				var_298_19.a = Mathf.Lerp(1, 0, var_298_18)
				arg_295_1.mask_.color = var_298_19
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 then
				local var_298_20 = Color.New(0, 0, 0)
				local var_298_21 = 0

				arg_295_1.mask_.enabled = false
				var_298_20.a = var_298_21
				arg_295_1.mask_.color = var_298_20
			end

			if arg_295_1.frameCnt_ <= 1 then
				arg_295_1.dialog_:SetActive(false)
			end

			local var_298_22 = 3.35
			local var_298_23 = 0.15

			if var_298_22 < arg_295_1.time_ and arg_295_1.time_ <= var_298_22 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				arg_295_1.dialog_:SetActive(true)

				local var_298_24 = LeanTween.value(arg_295_1.dialog_, 0, 1, 0.3)

				var_298_24:setOnUpdate(LuaHelper.FloatAction(function(arg_299_0)
					arg_295_1.dialogCg_.alpha = arg_299_0
				end))
				var_298_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_295_1.dialog_)
					var_298_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_295_1.duration_ = arg_295_1.duration_ + 0.3

				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_25 = arg_295_1:FormatText(StoryNameCfg[6].name)

				arg_295_1.leftNameTxt_.text = var_298_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_26 = arg_295_1:GetWordFromCfg(120431072)
				local var_298_27 = arg_295_1:FormatText(var_298_26.content)

				arg_295_1.text_.text = var_298_27

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_28 = 6
				local var_298_29 = utf8.len(var_298_27)
				local var_298_30 = var_298_28 <= 0 and var_298_23 or var_298_23 * (var_298_29 / var_298_28)

				if var_298_30 > 0 and var_298_23 < var_298_30 then
					arg_295_1.talkMaxDuration = var_298_30
					var_298_22 = var_298_22 + 0.3

					if var_298_30 + var_298_22 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_30 + var_298_22
					end
				end

				arg_295_1.text_.text = var_298_27
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431072", "story_v_out_120431.awb") ~= 0 then
					local var_298_31 = manager.audio:GetVoiceLength("story_v_out_120431", "120431072", "story_v_out_120431.awb") / 1000

					if var_298_31 + var_298_22 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_31 + var_298_22
					end

					if var_298_26.prefab_name ~= "" and arg_295_1.actors_[var_298_26.prefab_name] ~= nil then
						local var_298_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_26.prefab_name].transform, "story_v_out_120431", "120431072", "story_v_out_120431.awb")

						arg_295_1:RecordAudio("120431072", var_298_32)
						arg_295_1:RecordAudio("120431072", var_298_32)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_120431", "120431072", "story_v_out_120431.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_120431", "120431072", "story_v_out_120431.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_33 = var_298_22 + 0.3
			local var_298_34 = math.max(var_298_23, arg_295_1.talkMaxDuration)

			if var_298_33 <= arg_295_1.time_ and arg_295_1.time_ < var_298_33 + var_298_34 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_33) / var_298_34

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_33 + var_298_34 and arg_295_1.time_ < var_298_33 + var_298_34 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play120431073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 120431073
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play120431074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.825

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_2 = arg_301_1:GetWordFromCfg(120431073)
				local var_304_3 = arg_301_1:FormatText(var_304_2.content)

				arg_301_1.text_.text = var_304_3

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_4 = 33
				local var_304_5 = utf8.len(var_304_3)
				local var_304_6 = var_304_4 <= 0 and var_304_1 or var_304_1 * (var_304_5 / var_304_4)

				if var_304_6 > 0 and var_304_1 < var_304_6 then
					arg_301_1.talkMaxDuration = var_304_6

					if var_304_6 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_6 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_3
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_7 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_7 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_7

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_7 and arg_301_1.time_ < var_304_0 + var_304_7 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play120431074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 120431074
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play120431075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 1.175

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_2 = arg_305_1:GetWordFromCfg(120431074)
				local var_308_3 = arg_305_1:FormatText(var_308_2.content)

				arg_305_1.text_.text = var_308_3

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_4 = 47
				local var_308_5 = utf8.len(var_308_3)
				local var_308_6 = var_308_4 <= 0 and var_308_1 or var_308_1 * (var_308_5 / var_308_4)

				if var_308_6 > 0 and var_308_1 < var_308_6 then
					arg_305_1.talkMaxDuration = var_308_6

					if var_308_6 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_6 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_3
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_7 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_7 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_7

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_7 and arg_305_1.time_ < var_308_0 + var_308_7 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play120431075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 120431075
		arg_309_1.duration_ = 5

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play120431076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.5

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[7].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(120431075)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 20
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)
				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_8 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_8 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_8

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_8 and arg_309_1.time_ < var_312_0 + var_312_8 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play120431076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 120431076
		arg_313_1.duration_ = 7.433

		local var_313_0 = {
			zh = 3.666,
			ja = 7.433
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play120431077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 0.35

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[319].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(120431076)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 14
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431076", "story_v_out_120431.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431076", "story_v_out_120431.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_120431", "120431076", "story_v_out_120431.awb")

						arg_313_1:RecordAudio("120431076", var_316_9)
						arg_313_1:RecordAudio("120431076", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_120431", "120431076", "story_v_out_120431.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_120431", "120431076", "story_v_out_120431.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play120431077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 120431077
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play120431078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 0.575

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[7].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(120431077)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 22
				local var_320_6 = utf8.len(var_320_4)
				local var_320_7 = var_320_5 <= 0 and var_320_1 or var_320_1 * (var_320_6 / var_320_5)

				if var_320_7 > 0 and var_320_1 < var_320_7 then
					arg_317_1.talkMaxDuration = var_320_7

					if var_320_7 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_7 + var_320_0
					end
				end

				arg_317_1.text_.text = var_320_4
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_8 = math.max(var_320_1, arg_317_1.talkMaxDuration)

			if var_320_0 <= arg_317_1.time_ and arg_317_1.time_ < var_320_0 + var_320_8 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_0) / var_320_8

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_0 + var_320_8 and arg_317_1.time_ < var_320_0 + var_320_8 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play120431078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 120431078
		arg_321_1.duration_ = 4.9

		local var_321_0 = {
			zh = 4.9,
			ja = 4.366
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play120431079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.5

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[378].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(120431078)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 20
				local var_324_6 = utf8.len(var_324_4)
				local var_324_7 = var_324_5 <= 0 and var_324_1 or var_324_1 * (var_324_6 / var_324_5)

				if var_324_7 > 0 and var_324_1 < var_324_7 then
					arg_321_1.talkMaxDuration = var_324_7

					if var_324_7 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_7 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_4
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431078", "story_v_out_120431.awb") ~= 0 then
					local var_324_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431078", "story_v_out_120431.awb") / 1000

					if var_324_8 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_8 + var_324_0
					end

					if var_324_3.prefab_name ~= "" and arg_321_1.actors_[var_324_3.prefab_name] ~= nil then
						local var_324_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_3.prefab_name].transform, "story_v_out_120431", "120431078", "story_v_out_120431.awb")

						arg_321_1:RecordAudio("120431078", var_324_9)
						arg_321_1:RecordAudio("120431078", var_324_9)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_120431", "120431078", "story_v_out_120431.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_120431", "120431078", "story_v_out_120431.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_10 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_10 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_10

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_10 and arg_321_1.time_ < var_324_0 + var_324_10 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play120431079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 120431079
		arg_325_1.duration_ = 4.966

		local var_325_0 = {
			zh = 3.7,
			ja = 4.966
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play120431080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.475

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[6].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(120431079)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 19
				local var_328_6 = utf8.len(var_328_4)
				local var_328_7 = var_328_5 <= 0 and var_328_1 or var_328_1 * (var_328_6 / var_328_5)

				if var_328_7 > 0 and var_328_1 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_4
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431079", "story_v_out_120431.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431079", "story_v_out_120431.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_120431", "120431079", "story_v_out_120431.awb")

						arg_325_1:RecordAudio("120431079", var_328_9)
						arg_325_1:RecordAudio("120431079", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_120431", "120431079", "story_v_out_120431.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_120431", "120431079", "story_v_out_120431.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_10 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_10 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_10

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_10 and arg_325_1.time_ < var_328_0 + var_328_10 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play120431080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 120431080
		arg_329_1.duration_ = 4.9

		local var_329_0 = {
			zh = 2.9,
			ja = 4.9
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play120431081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.4

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[378].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(120431080)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 16
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431080", "story_v_out_120431.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431080", "story_v_out_120431.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_out_120431", "120431080", "story_v_out_120431.awb")

						arg_329_1:RecordAudio("120431080", var_332_9)
						arg_329_1:RecordAudio("120431080", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_120431", "120431080", "story_v_out_120431.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_120431", "120431080", "story_v_out_120431.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_10 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_10 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_10

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_10 and arg_329_1.time_ < var_332_0 + var_332_10 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play120431081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 120431081
		arg_333_1.duration_ = 6.833

		local var_333_0 = {
			zh = 6.833,
			ja = 5.833
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play120431082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.625

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[381].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(120431081)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 25
				local var_336_6 = utf8.len(var_336_4)
				local var_336_7 = var_336_5 <= 0 and var_336_1 or var_336_1 * (var_336_6 / var_336_5)

				if var_336_7 > 0 and var_336_1 < var_336_7 then
					arg_333_1.talkMaxDuration = var_336_7

					if var_336_7 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_7 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_4
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431081", "story_v_out_120431.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431081", "story_v_out_120431.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_out_120431", "120431081", "story_v_out_120431.awb")

						arg_333_1:RecordAudio("120431081", var_336_9)
						arg_333_1:RecordAudio("120431081", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_120431", "120431081", "story_v_out_120431.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_120431", "120431081", "story_v_out_120431.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_10 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_10 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_10

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_10 and arg_333_1.time_ < var_336_0 + var_336_10 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play120431082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 120431082
		arg_337_1.duration_ = 5.7

		local var_337_0 = {
			zh = 4.266,
			ja = 5.7
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play120431083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.55

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[378].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(120431082)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 22
				local var_340_6 = utf8.len(var_340_4)
				local var_340_7 = var_340_5 <= 0 and var_340_1 or var_340_1 * (var_340_6 / var_340_5)

				if var_340_7 > 0 and var_340_1 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_4
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431082", "story_v_out_120431.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431082", "story_v_out_120431.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_120431", "120431082", "story_v_out_120431.awb")

						arg_337_1:RecordAudio("120431082", var_340_9)
						arg_337_1:RecordAudio("120431082", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_120431", "120431082", "story_v_out_120431.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_120431", "120431082", "story_v_out_120431.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_10 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_10 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_10

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_10 and arg_337_1.time_ < var_340_0 + var_340_10 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play120431083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 120431083
		arg_341_1.duration_ = 13.1

		local var_341_0 = {
			zh = 12,
			ja = 13.1
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play120431084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 1.25

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_2 = arg_341_1:FormatText(StoryNameCfg[389].name)

				arg_341_1.leftNameTxt_.text = var_344_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(120431083)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 50
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_1 or var_344_1 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_1 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431083", "story_v_out_120431.awb") ~= 0 then
					local var_344_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431083", "story_v_out_120431.awb") / 1000

					if var_344_8 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_8 + var_344_0
					end

					if var_344_3.prefab_name ~= "" and arg_341_1.actors_[var_344_3.prefab_name] ~= nil then
						local var_344_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_3.prefab_name].transform, "story_v_out_120431", "120431083", "story_v_out_120431.awb")

						arg_341_1:RecordAudio("120431083", var_344_9)
						arg_341_1:RecordAudio("120431083", var_344_9)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_120431", "120431083", "story_v_out_120431.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_120431", "120431083", "story_v_out_120431.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_10 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_10 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_10

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_10 and arg_341_1.time_ < var_344_0 + var_344_10 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play120431084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 120431084
		arg_345_1.duration_ = 5.3

		local var_345_0 = {
			zh = 3.1,
			ja = 5.3
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play120431085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.275

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[389].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(120431084)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 11
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431084", "story_v_out_120431.awb") ~= 0 then
					local var_348_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431084", "story_v_out_120431.awb") / 1000

					if var_348_8 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_0
					end

					if var_348_3.prefab_name ~= "" and arg_345_1.actors_[var_348_3.prefab_name] ~= nil then
						local var_348_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_3.prefab_name].transform, "story_v_out_120431", "120431084", "story_v_out_120431.awb")

						arg_345_1:RecordAudio("120431084", var_348_9)
						arg_345_1:RecordAudio("120431084", var_348_9)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_120431", "120431084", "story_v_out_120431.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_120431", "120431084", "story_v_out_120431.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_10 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_10 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_10

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_10 and arg_345_1.time_ < var_348_0 + var_348_10 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play120431085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 120431085
		arg_349_1.duration_ = 8.366

		local var_349_0 = {
			zh = 5.966,
			ja = 8.366
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play120431086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.65

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[319].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(120431085)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 26
				local var_352_6 = utf8.len(var_352_4)
				local var_352_7 = var_352_5 <= 0 and var_352_1 or var_352_1 * (var_352_6 / var_352_5)

				if var_352_7 > 0 and var_352_1 < var_352_7 then
					arg_349_1.talkMaxDuration = var_352_7

					if var_352_7 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_7 + var_352_0
					end
				end

				arg_349_1.text_.text = var_352_4
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431085", "story_v_out_120431.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431085", "story_v_out_120431.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_120431", "120431085", "story_v_out_120431.awb")

						arg_349_1:RecordAudio("120431085", var_352_9)
						arg_349_1:RecordAudio("120431085", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_120431", "120431085", "story_v_out_120431.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_120431", "120431085", "story_v_out_120431.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_10 = math.max(var_352_1, arg_349_1.talkMaxDuration)

			if var_352_0 <= arg_349_1.time_ and arg_349_1.time_ < var_352_0 + var_352_10 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_0) / var_352_10

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_0 + var_352_10 and arg_349_1.time_ < var_352_0 + var_352_10 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play120431086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 120431086
		arg_353_1.duration_ = 6

		local var_353_0 = {
			zh = 4.533,
			ja = 6
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play120431087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.3

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[389].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(120431086)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 12
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431086", "story_v_out_120431.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431086", "story_v_out_120431.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_120431", "120431086", "story_v_out_120431.awb")

						arg_353_1:RecordAudio("120431086", var_356_9)
						arg_353_1:RecordAudio("120431086", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_120431", "120431086", "story_v_out_120431.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_120431", "120431086", "story_v_out_120431.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_10 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_10 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_10

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_10 and arg_353_1.time_ < var_356_0 + var_356_10 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play120431087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 120431087
		arg_357_1.duration_ = 5.066

		local var_357_0 = {
			zh = 4.8,
			ja = 5.066
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play120431088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.4

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[319].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(120431087)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 16
				local var_360_6 = utf8.len(var_360_4)
				local var_360_7 = var_360_5 <= 0 and var_360_1 or var_360_1 * (var_360_6 / var_360_5)

				if var_360_7 > 0 and var_360_1 < var_360_7 then
					arg_357_1.talkMaxDuration = var_360_7

					if var_360_7 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_7 + var_360_0
					end
				end

				arg_357_1.text_.text = var_360_4
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431087", "story_v_out_120431.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431087", "story_v_out_120431.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_120431", "120431087", "story_v_out_120431.awb")

						arg_357_1:RecordAudio("120431087", var_360_9)
						arg_357_1:RecordAudio("120431087", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_120431", "120431087", "story_v_out_120431.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_120431", "120431087", "story_v_out_120431.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_10 = math.max(var_360_1, arg_357_1.talkMaxDuration)

			if var_360_0 <= arg_357_1.time_ and arg_357_1.time_ < var_360_0 + var_360_10 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_0) / var_360_10

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_0 + var_360_10 and arg_357_1.time_ < var_360_0 + var_360_10 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play120431088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 120431088
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play120431089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.875

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[7].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(120431088)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 35
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_8 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_8 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_8

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_8 and arg_361_1.time_ < var_364_0 + var_364_8 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play120431089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 120431089
		arg_365_1.duration_ = 9.033

		local var_365_0 = {
			zh = 5.3,
			ja = 9.033
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play120431090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.45

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_2 = arg_365_1:FormatText(StoryNameCfg[389].name)

				arg_365_1.leftNameTxt_.text = var_368_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_3 = arg_365_1:GetWordFromCfg(120431089)
				local var_368_4 = arg_365_1:FormatText(var_368_3.content)

				arg_365_1.text_.text = var_368_4

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_5 = 18
				local var_368_6 = utf8.len(var_368_4)
				local var_368_7 = var_368_5 <= 0 and var_368_1 or var_368_1 * (var_368_6 / var_368_5)

				if var_368_7 > 0 and var_368_1 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_4
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431089", "story_v_out_120431.awb") ~= 0 then
					local var_368_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431089", "story_v_out_120431.awb") / 1000

					if var_368_8 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_8 + var_368_0
					end

					if var_368_3.prefab_name ~= "" and arg_365_1.actors_[var_368_3.prefab_name] ~= nil then
						local var_368_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_3.prefab_name].transform, "story_v_out_120431", "120431089", "story_v_out_120431.awb")

						arg_365_1:RecordAudio("120431089", var_368_9)
						arg_365_1:RecordAudio("120431089", var_368_9)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_120431", "120431089", "story_v_out_120431.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_120431", "120431089", "story_v_out_120431.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_10 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_10 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_10

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_10 and arg_365_1.time_ < var_368_0 + var_368_10 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play120431090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 120431090
		arg_369_1.duration_ = 9.566

		local var_369_0 = {
			zh = 3.766,
			ja = 9.566
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play120431091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.6

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[389].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(120431090)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 24
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431090", "story_v_out_120431.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431090", "story_v_out_120431.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_120431", "120431090", "story_v_out_120431.awb")

						arg_369_1:RecordAudio("120431090", var_372_9)
						arg_369_1:RecordAudio("120431090", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_120431", "120431090", "story_v_out_120431.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_120431", "120431090", "story_v_out_120431.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play120431091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 120431091
		arg_373_1.duration_ = 0.016666666666

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"

			SetActive(arg_373_1.choicesGo_, true)

			for iter_374_0, iter_374_1 in ipairs(arg_373_1.choices_) do
				local var_374_0 = iter_374_0 <= 1

				SetActive(iter_374_1.go, var_374_0)
			end

			arg_373_1.choices_[1].txt.text = arg_373_1:FormatText(StoryChoiceCfg[388].name)
			arg_373_1.choices_[2].txt.text = arg_373_1:FormatText(StoryChoiceCfg[389].name)
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play120431092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			return
		end
	end,
	Play120431092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 120431092
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play120431093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.35

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_2 = arg_377_1:FormatText(StoryNameCfg[7].name)

				arg_377_1.leftNameTxt_.text = var_380_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_3 = arg_377_1:GetWordFromCfg(120431092)
				local var_380_4 = arg_377_1:FormatText(var_380_3.content)

				arg_377_1.text_.text = var_380_4

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_5 = 14
				local var_380_6 = utf8.len(var_380_4)
				local var_380_7 = var_380_5 <= 0 and var_380_1 or var_380_1 * (var_380_6 / var_380_5)

				if var_380_7 > 0 and var_380_1 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_4
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_8 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_8 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_8

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_8 and arg_377_1.time_ < var_380_0 + var_380_8 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play120431093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 120431093
		arg_381_1.duration_ = 5.033

		local var_381_0 = {
			zh = 2.233,
			ja = 5.033
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play120431094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.275

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[6].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(120431093)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 11
				local var_384_6 = utf8.len(var_384_4)
				local var_384_7 = var_384_5 <= 0 and var_384_1 or var_384_1 * (var_384_6 / var_384_5)

				if var_384_7 > 0 and var_384_1 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_4
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431093", "story_v_out_120431.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431093", "story_v_out_120431.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_120431", "120431093", "story_v_out_120431.awb")

						arg_381_1:RecordAudio("120431093", var_384_9)
						arg_381_1:RecordAudio("120431093", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_120431", "120431093", "story_v_out_120431.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_120431", "120431093", "story_v_out_120431.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_10 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_10 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_10

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_10 and arg_381_1.time_ < var_384_0 + var_384_10 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play120431094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 120431094
		arg_385_1.duration_ = 4.299999999999

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play120431095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 2

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.fswbg_:SetActive(true)
				arg_385_1.dialog_:SetActive(false)

				arg_385_1.fswtw_.percent = 0

				local var_388_1 = arg_385_1:GetWordFromCfg(120431094)
				local var_388_2 = arg_385_1:FormatText(var_388_1.content)

				arg_385_1.fswt_.text = var_388_2

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.fswt_)

				arg_385_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_385_1.fswtw_:SetDirty()

				arg_385_1.typewritterCharCountI18N = 0

				SetActive(arg_385_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_385_1:ShowNextGo(false)
			end

			local var_388_3 = 2.01666666666667

			if var_388_3 < arg_385_1.time_ and arg_385_1.time_ <= var_388_3 + arg_388_0 then
				arg_385_1.var_.oldValueTypewriter = arg_385_1.fswtw_.percent

				arg_385_1:ShowNextGo(false)
			end

			local var_388_4 = 21
			local var_388_5 = 1.4
			local var_388_6 = arg_385_1:GetWordFromCfg(120431094)
			local var_388_7 = arg_385_1:FormatText(var_388_6.content)
			local var_388_8, var_388_9 = arg_385_1:GetPercentByPara(var_388_7, 1)

			if var_388_3 < arg_385_1.time_ and arg_385_1.time_ <= var_388_3 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0

				local var_388_10 = var_388_4 <= 0 and var_388_5 or var_388_5 * ((var_388_9 - arg_385_1.typewritterCharCountI18N) / var_388_4)

				if var_388_10 > 0 and var_388_5 < var_388_10 then
					arg_385_1.talkMaxDuration = var_388_10

					if var_388_10 + var_388_3 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_10 + var_388_3
					end
				end
			end

			local var_388_11 = 1.4
			local var_388_12 = math.max(var_388_11, arg_385_1.talkMaxDuration)

			if var_388_3 <= arg_385_1.time_ and arg_385_1.time_ < var_388_3 + var_388_12 then
				local var_388_13 = (arg_385_1.time_ - var_388_3) / var_388_12

				arg_385_1.fswtw_.percent = Mathf.Lerp(arg_385_1.var_.oldValueTypewriter, var_388_8, var_388_13)
				arg_385_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_385_1.fswtw_:SetDirty()
			end

			if arg_385_1.time_ >= var_388_3 + var_388_12 and arg_385_1.time_ < var_388_3 + var_388_12 + arg_388_0 then
				arg_385_1.fswtw_.percent = var_388_8

				arg_385_1.fswtw_:SetDirty()
				arg_385_1:ShowNextGo(true)

				arg_385_1.typewritterCharCountI18N = var_388_9
			end

			local var_388_14 = 2

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_15 = 2

			if var_388_14 <= arg_385_1.time_ and arg_385_1.time_ < var_388_14 + var_388_15 then
				local var_388_16 = (arg_385_1.time_ - var_388_14) / var_388_15
				local var_388_17 = Color.New(0, 0, 0)

				var_388_17.a = Mathf.Lerp(1, 0, var_388_16)
				arg_385_1.mask_.color = var_388_17
			end

			if arg_385_1.time_ >= var_388_14 + var_388_15 and arg_385_1.time_ < var_388_14 + var_388_15 + arg_388_0 then
				local var_388_18 = Color.New(0, 0, 0)
				local var_388_19 = 0

				arg_385_1.mask_.enabled = false
				var_388_18.a = var_388_19
				arg_385_1.mask_.color = var_388_18
			end

			local var_388_20 = 0

			if var_388_20 < arg_385_1.time_ and arg_385_1.time_ <= var_388_20 + arg_388_0 then
				arg_385_1.mask_.enabled = true
				arg_385_1.mask_.raycastTarget = true

				arg_385_1:SetGaussion(false)
			end

			local var_388_21 = 2

			if var_388_20 <= arg_385_1.time_ and arg_385_1.time_ < var_388_20 + var_388_21 then
				local var_388_22 = (arg_385_1.time_ - var_388_20) / var_388_21
				local var_388_23 = Color.New(0, 0, 0)

				var_388_23.a = Mathf.Lerp(0, 1, var_388_22)
				arg_385_1.mask_.color = var_388_23
			end

			if arg_385_1.time_ >= var_388_20 + var_388_21 and arg_385_1.time_ < var_388_20 + var_388_21 + arg_388_0 then
				local var_388_24 = Color.New(0, 0, 0)

				var_388_24.a = 1
				arg_385_1.mask_.color = var_388_24
			end

			local var_388_25 = 2

			if var_388_25 < arg_385_1.time_ and arg_385_1.time_ <= var_388_25 + arg_388_0 then
				local var_388_26 = arg_385_1.fswbg_.transform:Find("textbox/adapt/content") or arg_385_1.fswbg_.transform:Find("textbox/content")
				local var_388_27 = var_388_26:GetComponent("Text")
				local var_388_28 = var_388_26:GetComponent("RectTransform")

				var_388_27.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_388_28.offsetMin = Vector2.New(0, 0)
				var_388_28.offsetMax = Vector2.New(0, 0)
			end

			local var_388_29 = 1.7
			local var_388_30 = 1

			if var_388_29 < arg_385_1.time_ and arg_385_1.time_ <= var_388_29 + arg_388_0 then
				local var_388_31 = "play"
				local var_388_32 = "music"

				arg_385_1:AudioAction(var_388_31, var_388_32, "ui_battle", "ui_battle_stopbgm", "")
			end
		end
	end,
	Play120431095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 120431095
		arg_389_1.duration_ = 2.016666666666

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play120431096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.fswbg_:SetActive(true)
				arg_389_1.dialog_:SetActive(false)

				arg_389_1.fswtw_.percent = 0

				local var_392_1 = arg_389_1:GetWordFromCfg(120431095)
				local var_392_2 = arg_389_1:FormatText(var_392_1.content)

				arg_389_1.fswt_.text = var_392_2

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.fswt_)

				arg_389_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_389_1.fswtw_:SetDirty()

				arg_389_1.typewritterCharCountI18N = 0

				SetActive(arg_389_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_389_1:ShowNextGo(false)
			end

			local var_392_3 = 0.0166666666666667

			if var_392_3 < arg_389_1.time_ and arg_389_1.time_ <= var_392_3 + arg_392_0 then
				arg_389_1.var_.oldValueTypewriter = arg_389_1.fswtw_.percent

				arg_389_1:ShowNextGo(false)
			end

			local var_392_4 = 30
			local var_392_5 = 2
			local var_392_6 = arg_389_1:GetWordFromCfg(120431095)
			local var_392_7 = arg_389_1:FormatText(var_392_6.content)
			local var_392_8, var_392_9 = arg_389_1:GetPercentByPara(var_392_7, 1)

			if var_392_3 < arg_389_1.time_ and arg_389_1.time_ <= var_392_3 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0

				local var_392_10 = var_392_4 <= 0 and var_392_5 or var_392_5 * ((var_392_9 - arg_389_1.typewritterCharCountI18N) / var_392_4)

				if var_392_10 > 0 and var_392_5 < var_392_10 then
					arg_389_1.talkMaxDuration = var_392_10

					if var_392_10 + var_392_3 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_10 + var_392_3
					end
				end
			end

			local var_392_11 = 2
			local var_392_12 = math.max(var_392_11, arg_389_1.talkMaxDuration)

			if var_392_3 <= arg_389_1.time_ and arg_389_1.time_ < var_392_3 + var_392_12 then
				local var_392_13 = (arg_389_1.time_ - var_392_3) / var_392_12

				arg_389_1.fswtw_.percent = Mathf.Lerp(arg_389_1.var_.oldValueTypewriter, var_392_8, var_392_13)
				arg_389_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_389_1.fswtw_:SetDirty()
			end

			if arg_389_1.time_ >= var_392_3 + var_392_12 and arg_389_1.time_ < var_392_3 + var_392_12 + arg_392_0 then
				arg_389_1.fswtw_.percent = var_392_8

				arg_389_1.fswtw_:SetDirty()
				arg_389_1:ShowNextGo(true)

				arg_389_1.typewritterCharCountI18N = var_392_9
			end
		end
	end,
	Play120431096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 120431096
		arg_393_1.duration_ = 3.549999999999

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play120431097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.fswbg_:SetActive(true)
				arg_393_1.dialog_:SetActive(false)

				arg_393_1.fswtw_.percent = 0

				local var_396_1 = arg_393_1:GetWordFromCfg(120431096)
				local var_396_2 = arg_393_1:FormatText(var_396_1.content)

				arg_393_1.fswt_.text = var_396_2

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.fswt_)

				arg_393_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_393_1.fswtw_:SetDirty()

				arg_393_1.typewritterCharCountI18N = 0

				SetActive(arg_393_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_393_1:ShowNextGo(false)
			end

			local var_396_3 = 0.0166666666666666

			if var_396_3 < arg_393_1.time_ and arg_393_1.time_ <= var_396_3 + arg_396_0 then
				arg_393_1.var_.oldValueTypewriter = arg_393_1.fswtw_.percent

				arg_393_1:ShowNextGo(false)
			end

			local var_396_4 = 53
			local var_396_5 = 3.53333333333333
			local var_396_6 = arg_393_1:GetWordFromCfg(120431096)
			local var_396_7 = arg_393_1:FormatText(var_396_6.content)
			local var_396_8, var_396_9 = arg_393_1:GetPercentByPara(var_396_7, 1)

			if var_396_3 < arg_393_1.time_ and arg_393_1.time_ <= var_396_3 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0

				local var_396_10 = var_396_4 <= 0 and var_396_5 or var_396_5 * ((var_396_9 - arg_393_1.typewritterCharCountI18N) / var_396_4)

				if var_396_10 > 0 and var_396_5 < var_396_10 then
					arg_393_1.talkMaxDuration = var_396_10

					if var_396_10 + var_396_3 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_10 + var_396_3
					end
				end
			end

			local var_396_11 = 3.53333333333333
			local var_396_12 = math.max(var_396_11, arg_393_1.talkMaxDuration)

			if var_396_3 <= arg_393_1.time_ and arg_393_1.time_ < var_396_3 + var_396_12 then
				local var_396_13 = (arg_393_1.time_ - var_396_3) / var_396_12

				arg_393_1.fswtw_.percent = Mathf.Lerp(arg_393_1.var_.oldValueTypewriter, var_396_8, var_396_13)
				arg_393_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_393_1.fswtw_:SetDirty()
			end

			if arg_393_1.time_ >= var_396_3 + var_396_12 and arg_393_1.time_ < var_396_3 + var_396_12 + arg_396_0 then
				arg_393_1.fswtw_.percent = var_396_8

				arg_393_1.fswtw_:SetDirty()
				arg_393_1:ShowNextGo(true)

				arg_393_1.typewritterCharCountI18N = var_396_9
			end
		end
	end,
	Play120431097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 120431097
		arg_397_1.duration_ = 0.999999999999

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play120431098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.fswbg_:SetActive(true)
				arg_397_1.dialog_:SetActive(false)

				arg_397_1.fswtw_.percent = 0

				local var_400_1 = arg_397_1:GetWordFromCfg(120431097)
				local var_400_2 = arg_397_1:FormatText(var_400_1.content)

				arg_397_1.fswt_.text = var_400_2

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.fswt_)

				arg_397_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_397_1.fswtw_:SetDirty()

				arg_397_1.typewritterCharCountI18N = 0

				SetActive(arg_397_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_397_1:ShowNextGo(false)
			end

			local var_400_3 = 0.0166666666666666

			if var_400_3 < arg_397_1.time_ and arg_397_1.time_ <= var_400_3 + arg_400_0 then
				arg_397_1.var_.oldValueTypewriter = arg_397_1.fswtw_.percent

				arg_397_1:ShowNextGo(false)
			end

			local var_400_4 = 8
			local var_400_5 = 0.533333333333333
			local var_400_6 = arg_397_1:GetWordFromCfg(120431097)
			local var_400_7 = arg_397_1:FormatText(var_400_6.content)
			local var_400_8, var_400_9 = arg_397_1:GetPercentByPara(var_400_7, 1)

			if var_400_3 < arg_397_1.time_ and arg_397_1.time_ <= var_400_3 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0

				local var_400_10 = var_400_4 <= 0 and var_400_5 or var_400_5 * ((var_400_9 - arg_397_1.typewritterCharCountI18N) / var_400_4)

				if var_400_10 > 0 and var_400_5 < var_400_10 then
					arg_397_1.talkMaxDuration = var_400_10

					if var_400_10 + var_400_3 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_10 + var_400_3
					end
				end
			end

			local var_400_11 = 0.533333333333333
			local var_400_12 = math.max(var_400_11, arg_397_1.talkMaxDuration)

			if var_400_3 <= arg_397_1.time_ and arg_397_1.time_ < var_400_3 + var_400_12 then
				local var_400_13 = (arg_397_1.time_ - var_400_3) / var_400_12

				arg_397_1.fswtw_.percent = Mathf.Lerp(arg_397_1.var_.oldValueTypewriter, var_400_8, var_400_13)
				arg_397_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_397_1.fswtw_:SetDirty()
			end

			if arg_397_1.time_ >= var_400_3 + var_400_12 and arg_397_1.time_ < var_400_3 + var_400_12 + arg_400_0 then
				arg_397_1.fswtw_.percent = var_400_8

				arg_397_1.fswtw_:SetDirty()
				arg_397_1:ShowNextGo(true)

				arg_397_1.typewritterCharCountI18N = var_400_9
			end
		end
	end,
	Play120431098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 120431098
		arg_401_1.duration_ = 7.566

		local var_401_0 = {
			zh = 6.366666666666,
			ja = 7.566
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play120431099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = "ST31a"

			if arg_401_1.bgs_[var_404_0] == nil then
				local var_404_1 = Object.Instantiate(arg_401_1.paintGo_)

				var_404_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_404_0)
				var_404_1.name = var_404_0
				var_404_1.transform.parent = arg_401_1.stage_.transform
				var_404_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_401_1.bgs_[var_404_0] = var_404_1
			end

			local var_404_2 = 2

			if var_404_2 < arg_401_1.time_ and arg_401_1.time_ <= var_404_2 + arg_404_0 then
				local var_404_3 = manager.ui.mainCamera.transform.localPosition
				local var_404_4 = Vector3.New(0, 0, 10) + Vector3.New(var_404_3.x, var_404_3.y, 0)
				local var_404_5 = arg_401_1.bgs_.ST31a

				var_404_5.transform.localPosition = var_404_4
				var_404_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_404_6 = var_404_5:GetComponent("SpriteRenderer")

				if var_404_6 and var_404_6.sprite then
					local var_404_7 = (var_404_5.transform.localPosition - var_404_3).z
					local var_404_8 = manager.ui.mainCameraCom_
					local var_404_9 = 2 * var_404_7 * Mathf.Tan(var_404_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_404_10 = var_404_9 * var_404_8.aspect
					local var_404_11 = var_404_6.sprite.bounds.size.x
					local var_404_12 = var_404_6.sprite.bounds.size.y
					local var_404_13 = var_404_10 / var_404_11
					local var_404_14 = var_404_9 / var_404_12
					local var_404_15 = var_404_14 < var_404_13 and var_404_13 or var_404_14

					var_404_5.transform.localScale = Vector3.New(var_404_15, var_404_15, 0)
				end

				for iter_404_0, iter_404_1 in pairs(arg_401_1.bgs_) do
					if iter_404_0 ~= "ST31a" then
						iter_404_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_404_16 = 0

			if var_404_16 < arg_401_1.time_ and arg_401_1.time_ <= var_404_16 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_17 = 2

			if var_404_16 <= arg_401_1.time_ and arg_401_1.time_ < var_404_16 + var_404_17 then
				local var_404_18 = (arg_401_1.time_ - var_404_16) / var_404_17
				local var_404_19 = Color.New(0, 0, 0)

				var_404_19.a = Mathf.Lerp(0, 1, var_404_18)
				arg_401_1.mask_.color = var_404_19
			end

			if arg_401_1.time_ >= var_404_16 + var_404_17 and arg_401_1.time_ < var_404_16 + var_404_17 + arg_404_0 then
				local var_404_20 = Color.New(0, 0, 0)

				var_404_20.a = 1
				arg_401_1.mask_.color = var_404_20
			end

			local var_404_21 = 2

			if var_404_21 < arg_401_1.time_ and arg_401_1.time_ <= var_404_21 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_22 = 2

			if var_404_21 <= arg_401_1.time_ and arg_401_1.time_ < var_404_21 + var_404_22 then
				local var_404_23 = (arg_401_1.time_ - var_404_21) / var_404_22
				local var_404_24 = Color.New(0, 0, 0)

				var_404_24.a = Mathf.Lerp(1, 0, var_404_23)
				arg_401_1.mask_.color = var_404_24
			end

			if arg_401_1.time_ >= var_404_21 + var_404_22 and arg_401_1.time_ < var_404_21 + var_404_22 + arg_404_0 then
				local var_404_25 = Color.New(0, 0, 0)
				local var_404_26 = 0

				arg_401_1.mask_.enabled = false
				var_404_25.a = var_404_26
				arg_401_1.mask_.color = var_404_25
			end

			local var_404_27 = 1.98333333333333

			if var_404_27 < arg_401_1.time_ and arg_401_1.time_ <= var_404_27 + arg_404_0 then
				arg_401_1.fswbg_:SetActive(false)
				arg_401_1.dialog_:SetActive(false)
				arg_401_1:ShowNextGo(false)
			end

			local var_404_28 = arg_401_1.actors_["1029ui_story"].transform
			local var_404_29 = 3.8

			if var_404_29 < arg_401_1.time_ and arg_401_1.time_ <= var_404_29 + arg_404_0 then
				arg_401_1.var_.moveOldPos1029ui_story = var_404_28.localPosition
			end

			local var_404_30 = 0.001

			if var_404_29 <= arg_401_1.time_ and arg_401_1.time_ < var_404_29 + var_404_30 then
				local var_404_31 = (arg_401_1.time_ - var_404_29) / var_404_30
				local var_404_32 = Vector3.New(0, -1.09, -6.2)

				var_404_28.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1029ui_story, var_404_32, var_404_31)

				local var_404_33 = manager.ui.mainCamera.transform.position - var_404_28.position

				var_404_28.forward = Vector3.New(var_404_33.x, var_404_33.y, var_404_33.z)

				local var_404_34 = var_404_28.localEulerAngles

				var_404_34.z = 0
				var_404_34.x = 0
				var_404_28.localEulerAngles = var_404_34
			end

			if arg_401_1.time_ >= var_404_29 + var_404_30 and arg_401_1.time_ < var_404_29 + var_404_30 + arg_404_0 then
				var_404_28.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_404_35 = manager.ui.mainCamera.transform.position - var_404_28.position

				var_404_28.forward = Vector3.New(var_404_35.x, var_404_35.y, var_404_35.z)

				local var_404_36 = var_404_28.localEulerAngles

				var_404_36.z = 0
				var_404_36.x = 0
				var_404_28.localEulerAngles = var_404_36
			end

			local var_404_37 = 3.8

			if var_404_37 < arg_401_1.time_ and arg_401_1.time_ <= var_404_37 + arg_404_0 then
				arg_401_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_404_38 = 3.8

			if var_404_38 < arg_401_1.time_ and arg_401_1.time_ <= var_404_38 + arg_404_0 then
				arg_401_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_404_39 = arg_401_1.actors_["1029ui_story"]
			local var_404_40 = 3.8

			if var_404_40 < arg_401_1.time_ and arg_401_1.time_ <= var_404_40 + arg_404_0 and arg_401_1.var_.characterEffect1029ui_story == nil then
				arg_401_1.var_.characterEffect1029ui_story = var_404_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_41 = 0.2

			if var_404_40 <= arg_401_1.time_ and arg_401_1.time_ < var_404_40 + var_404_41 then
				local var_404_42 = (arg_401_1.time_ - var_404_40) / var_404_41

				if arg_401_1.var_.characterEffect1029ui_story then
					arg_401_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_40 + var_404_41 and arg_401_1.time_ < var_404_40 + var_404_41 + arg_404_0 and arg_401_1.var_.characterEffect1029ui_story then
				arg_401_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_404_43 = 1.86666666666667
			local var_404_44 = 1

			if var_404_43 < arg_401_1.time_ and arg_401_1.time_ <= var_404_43 + arg_404_0 then
				local var_404_45 = "play"
				local var_404_46 = "music"

				arg_401_1:AudioAction(var_404_45, var_404_46, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_401_1.frameCnt_ <= 1 then
				arg_401_1.dialog_:SetActive(false)
			end

			local var_404_47 = 4
			local var_404_48 = 0.125

			if var_404_47 < arg_401_1.time_ and arg_401_1.time_ <= var_404_47 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0

				arg_401_1.dialog_:SetActive(true)

				local var_404_49 = LeanTween.value(arg_401_1.dialog_, 0, 1, 0.3)

				var_404_49:setOnUpdate(LuaHelper.FloatAction(function(arg_405_0)
					arg_401_1.dialogCg_.alpha = arg_405_0
				end))
				var_404_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_401_1.dialog_)
					var_404_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_401_1.duration_ = arg_401_1.duration_ + 0.3

				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_50 = arg_401_1:FormatText(StoryNameCfg[319].name)

				arg_401_1.leftNameTxt_.text = var_404_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_51 = arg_401_1:GetWordFromCfg(120431098)
				local var_404_52 = arg_401_1:FormatText(var_404_51.content)

				arg_401_1.text_.text = var_404_52

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_53 = 5
				local var_404_54 = utf8.len(var_404_52)
				local var_404_55 = var_404_53 <= 0 and var_404_48 or var_404_48 * (var_404_54 / var_404_53)

				if var_404_55 > 0 and var_404_48 < var_404_55 then
					arg_401_1.talkMaxDuration = var_404_55
					var_404_47 = var_404_47 + 0.3

					if var_404_55 + var_404_47 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_55 + var_404_47
					end
				end

				arg_401_1.text_.text = var_404_52
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431098", "story_v_out_120431.awb") ~= 0 then
					local var_404_56 = manager.audio:GetVoiceLength("story_v_out_120431", "120431098", "story_v_out_120431.awb") / 1000

					if var_404_56 + var_404_47 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_56 + var_404_47
					end

					if var_404_51.prefab_name ~= "" and arg_401_1.actors_[var_404_51.prefab_name] ~= nil then
						local var_404_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_51.prefab_name].transform, "story_v_out_120431", "120431098", "story_v_out_120431.awb")

						arg_401_1:RecordAudio("120431098", var_404_57)
						arg_401_1:RecordAudio("120431098", var_404_57)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_120431", "120431098", "story_v_out_120431.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_120431", "120431098", "story_v_out_120431.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_58 = var_404_47 + 0.3
			local var_404_59 = math.max(var_404_48, arg_401_1.talkMaxDuration)

			if var_404_58 <= arg_401_1.time_ and arg_401_1.time_ < var_404_58 + var_404_59 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_58) / var_404_59

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_58 + var_404_59 and arg_401_1.time_ < var_404_58 + var_404_59 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play120431099 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 120431099
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play120431100(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1029ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect1029ui_story == nil then
				arg_407_1.var_.characterEffect1029ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.2

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect1029ui_story then
					local var_410_4 = Mathf.Lerp(0, 0.5, var_410_3)

					arg_407_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1029ui_story.fillRatio = var_410_4
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect1029ui_story then
				local var_410_5 = 0.5

				arg_407_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1029ui_story.fillRatio = var_410_5
			end

			local var_410_6 = 0
			local var_410_7 = 1

			if var_410_6 < arg_407_1.time_ and arg_407_1.time_ <= var_410_6 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, false)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_8 = arg_407_1:GetWordFromCfg(120431099)
				local var_410_9 = arg_407_1:FormatText(var_410_8.content)

				arg_407_1.text_.text = var_410_9

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_10 = 40
				local var_410_11 = utf8.len(var_410_9)
				local var_410_12 = var_410_10 <= 0 and var_410_7 or var_410_7 * (var_410_11 / var_410_10)

				if var_410_12 > 0 and var_410_7 < var_410_12 then
					arg_407_1.talkMaxDuration = var_410_12

					if var_410_12 + var_410_6 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_12 + var_410_6
					end
				end

				arg_407_1.text_.text = var_410_9
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_13 = math.max(var_410_7, arg_407_1.talkMaxDuration)

			if var_410_6 <= arg_407_1.time_ and arg_407_1.time_ < var_410_6 + var_410_13 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_6) / var_410_13

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_6 + var_410_13 and arg_407_1.time_ < var_410_6 + var_410_13 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play120431100 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 120431100
		arg_411_1.duration_ = 5

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play120431101(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.825

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, false)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_2 = arg_411_1:GetWordFromCfg(120431100)
				local var_414_3 = arg_411_1:FormatText(var_414_2.content)

				arg_411_1.text_.text = var_414_3

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_4 = 33
				local var_414_5 = utf8.len(var_414_3)
				local var_414_6 = var_414_4 <= 0 and var_414_1 or var_414_1 * (var_414_5 / var_414_4)

				if var_414_6 > 0 and var_414_1 < var_414_6 then
					arg_411_1.talkMaxDuration = var_414_6

					if var_414_6 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_6 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_3
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)
				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_7 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_7 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_7

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_7 and arg_411_1.time_ < var_414_0 + var_414_7 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play120431101 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 120431101
		arg_415_1.duration_ = 8.466

		local var_415_0 = {
			zh = 7.066,
			ja = 8.466
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play120431102(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1029ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.characterEffect1029ui_story == nil then
				arg_415_1.var_.characterEffect1029ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.2

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect1029ui_story then
					arg_415_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.characterEffect1029ui_story then
				arg_415_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_418_4 = 0
			local var_418_5 = 0.825

			if var_418_4 < arg_415_1.time_ and arg_415_1.time_ <= var_418_4 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_6 = arg_415_1:FormatText(StoryNameCfg[319].name)

				arg_415_1.leftNameTxt_.text = var_418_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_7 = arg_415_1:GetWordFromCfg(120431101)
				local var_418_8 = arg_415_1:FormatText(var_418_7.content)

				arg_415_1.text_.text = var_418_8

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_9 = 33
				local var_418_10 = utf8.len(var_418_8)
				local var_418_11 = var_418_9 <= 0 and var_418_5 or var_418_5 * (var_418_10 / var_418_9)

				if var_418_11 > 0 and var_418_5 < var_418_11 then
					arg_415_1.talkMaxDuration = var_418_11

					if var_418_11 + var_418_4 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_11 + var_418_4
					end
				end

				arg_415_1.text_.text = var_418_8
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431101", "story_v_out_120431.awb") ~= 0 then
					local var_418_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431101", "story_v_out_120431.awb") / 1000

					if var_418_12 + var_418_4 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_12 + var_418_4
					end

					if var_418_7.prefab_name ~= "" and arg_415_1.actors_[var_418_7.prefab_name] ~= nil then
						local var_418_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_7.prefab_name].transform, "story_v_out_120431", "120431101", "story_v_out_120431.awb")

						arg_415_1:RecordAudio("120431101", var_418_13)
						arg_415_1:RecordAudio("120431101", var_418_13)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_120431", "120431101", "story_v_out_120431.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_120431", "120431101", "story_v_out_120431.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_14 = math.max(var_418_5, arg_415_1.talkMaxDuration)

			if var_418_4 <= arg_415_1.time_ and arg_415_1.time_ < var_418_4 + var_418_14 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_4) / var_418_14

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_4 + var_418_14 and arg_415_1.time_ < var_418_4 + var_418_14 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play120431102 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 120431102
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play120431103(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1029ui_story"]
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 and arg_419_1.var_.characterEffect1029ui_story == nil then
				arg_419_1.var_.characterEffect1029ui_story = var_422_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_2 = 0.2

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2

				if arg_419_1.var_.characterEffect1029ui_story then
					local var_422_4 = Mathf.Lerp(0, 0.5, var_422_3)

					arg_419_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_419_1.var_.characterEffect1029ui_story.fillRatio = var_422_4
				end
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 and arg_419_1.var_.characterEffect1029ui_story then
				local var_422_5 = 0.5

				arg_419_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_419_1.var_.characterEffect1029ui_story.fillRatio = var_422_5
			end

			local var_422_6 = 0
			local var_422_7 = 0.25

			if var_422_6 < arg_419_1.time_ and arg_419_1.time_ <= var_422_6 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_8 = arg_419_1:FormatText(StoryNameCfg[7].name)

				arg_419_1.leftNameTxt_.text = var_422_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_9 = arg_419_1:GetWordFromCfg(120431102)
				local var_422_10 = arg_419_1:FormatText(var_422_9.content)

				arg_419_1.text_.text = var_422_10

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_11 = 10
				local var_422_12 = utf8.len(var_422_10)
				local var_422_13 = var_422_11 <= 0 and var_422_7 or var_422_7 * (var_422_12 / var_422_11)

				if var_422_13 > 0 and var_422_7 < var_422_13 then
					arg_419_1.talkMaxDuration = var_422_13

					if var_422_13 + var_422_6 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_13 + var_422_6
					end
				end

				arg_419_1.text_.text = var_422_10
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_14 = math.max(var_422_7, arg_419_1.talkMaxDuration)

			if var_422_6 <= arg_419_1.time_ and arg_419_1.time_ < var_422_6 + var_422_14 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_6) / var_422_14

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_6 + var_422_14 and arg_419_1.time_ < var_422_6 + var_422_14 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play120431103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 120431103
		arg_423_1.duration_ = 4.133

		local var_423_0 = {
			zh = 4.133,
			ja = 4.033
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play120431104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["1029ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.characterEffect1029ui_story == nil then
				arg_423_1.var_.characterEffect1029ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.2

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect1029ui_story then
					arg_423_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.characterEffect1029ui_story then
				arg_423_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_426_4 = 0

			if var_426_4 < arg_423_1.time_ and arg_423_1.time_ <= var_426_4 + arg_426_0 then
				arg_423_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_426_5 = 0

			if var_426_5 < arg_423_1.time_ and arg_423_1.time_ <= var_426_5 + arg_426_0 then
				arg_423_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_426_6 = 0
			local var_426_7 = 0.325

			if var_426_6 < arg_423_1.time_ and arg_423_1.time_ <= var_426_6 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_8 = arg_423_1:FormatText(StoryNameCfg[319].name)

				arg_423_1.leftNameTxt_.text = var_426_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_9 = arg_423_1:GetWordFromCfg(120431103)
				local var_426_10 = arg_423_1:FormatText(var_426_9.content)

				arg_423_1.text_.text = var_426_10

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_11 = 13
				local var_426_12 = utf8.len(var_426_10)
				local var_426_13 = var_426_11 <= 0 and var_426_7 or var_426_7 * (var_426_12 / var_426_11)

				if var_426_13 > 0 and var_426_7 < var_426_13 then
					arg_423_1.talkMaxDuration = var_426_13

					if var_426_13 + var_426_6 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_13 + var_426_6
					end
				end

				arg_423_1.text_.text = var_426_10
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431103", "story_v_out_120431.awb") ~= 0 then
					local var_426_14 = manager.audio:GetVoiceLength("story_v_out_120431", "120431103", "story_v_out_120431.awb") / 1000

					if var_426_14 + var_426_6 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_14 + var_426_6
					end

					if var_426_9.prefab_name ~= "" and arg_423_1.actors_[var_426_9.prefab_name] ~= nil then
						local var_426_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_9.prefab_name].transform, "story_v_out_120431", "120431103", "story_v_out_120431.awb")

						arg_423_1:RecordAudio("120431103", var_426_15)
						arg_423_1:RecordAudio("120431103", var_426_15)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_120431", "120431103", "story_v_out_120431.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_120431", "120431103", "story_v_out_120431.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_16 = math.max(var_426_7, arg_423_1.talkMaxDuration)

			if var_426_6 <= arg_423_1.time_ and arg_423_1.time_ < var_426_6 + var_426_16 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_6) / var_426_16

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_6 + var_426_16 and arg_423_1.time_ < var_426_6 + var_426_16 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play120431104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 120431104
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play120431105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_430_1 = arg_427_1.actors_["1029ui_story"]
			local var_430_2 = 0

			if var_430_2 < arg_427_1.time_ and arg_427_1.time_ <= var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect1029ui_story == nil then
				arg_427_1.var_.characterEffect1029ui_story = var_430_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_3 = 0.2

			if var_430_2 <= arg_427_1.time_ and arg_427_1.time_ < var_430_2 + var_430_3 then
				local var_430_4 = (arg_427_1.time_ - var_430_2) / var_430_3

				if arg_427_1.var_.characterEffect1029ui_story then
					local var_430_5 = Mathf.Lerp(0, 0.5, var_430_4)

					arg_427_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_427_1.var_.characterEffect1029ui_story.fillRatio = var_430_5
				end
			end

			if arg_427_1.time_ >= var_430_2 + var_430_3 and arg_427_1.time_ < var_430_2 + var_430_3 + arg_430_0 and arg_427_1.var_.characterEffect1029ui_story then
				local var_430_6 = 0.5

				arg_427_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_427_1.var_.characterEffect1029ui_story.fillRatio = var_430_6
			end

			local var_430_7 = 0
			local var_430_8 = 0.5

			if var_430_7 < arg_427_1.time_ and arg_427_1.time_ <= var_430_7 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_9 = arg_427_1:FormatText(StoryNameCfg[7].name)

				arg_427_1.leftNameTxt_.text = var_430_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_10 = arg_427_1:GetWordFromCfg(120431104)
				local var_430_11 = arg_427_1:FormatText(var_430_10.content)

				arg_427_1.text_.text = var_430_11

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_12 = 20
				local var_430_13 = utf8.len(var_430_11)
				local var_430_14 = var_430_12 <= 0 and var_430_8 or var_430_8 * (var_430_13 / var_430_12)

				if var_430_14 > 0 and var_430_8 < var_430_14 then
					arg_427_1.talkMaxDuration = var_430_14

					if var_430_14 + var_430_7 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_14 + var_430_7
					end
				end

				arg_427_1.text_.text = var_430_11
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_15 = math.max(var_430_8, arg_427_1.talkMaxDuration)

			if var_430_7 <= arg_427_1.time_ and arg_427_1.time_ < var_430_7 + var_430_15 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_7) / var_430_15

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_7 + var_430_15 and arg_427_1.time_ < var_430_7 + var_430_15 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play120431105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 120431105
		arg_431_1.duration_ = 4.2

		local var_431_0 = {
			zh = 3.066,
			ja = 4.2
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play120431106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1029ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect1029ui_story == nil then
				arg_431_1.var_.characterEffect1029ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.2

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect1029ui_story then
					arg_431_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect1029ui_story then
				arg_431_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_434_4 = 0
			local var_434_5 = 0.3

			if var_434_4 < arg_431_1.time_ and arg_431_1.time_ <= var_434_4 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_6 = arg_431_1:FormatText(StoryNameCfg[319].name)

				arg_431_1.leftNameTxt_.text = var_434_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_7 = arg_431_1:GetWordFromCfg(120431105)
				local var_434_8 = arg_431_1:FormatText(var_434_7.content)

				arg_431_1.text_.text = var_434_8

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_9 = 12
				local var_434_10 = utf8.len(var_434_8)
				local var_434_11 = var_434_9 <= 0 and var_434_5 or var_434_5 * (var_434_10 / var_434_9)

				if var_434_11 > 0 and var_434_5 < var_434_11 then
					arg_431_1.talkMaxDuration = var_434_11

					if var_434_11 + var_434_4 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_11 + var_434_4
					end
				end

				arg_431_1.text_.text = var_434_8
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431105", "story_v_out_120431.awb") ~= 0 then
					local var_434_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431105", "story_v_out_120431.awb") / 1000

					if var_434_12 + var_434_4 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_12 + var_434_4
					end

					if var_434_7.prefab_name ~= "" and arg_431_1.actors_[var_434_7.prefab_name] ~= nil then
						local var_434_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_7.prefab_name].transform, "story_v_out_120431", "120431105", "story_v_out_120431.awb")

						arg_431_1:RecordAudio("120431105", var_434_13)
						arg_431_1:RecordAudio("120431105", var_434_13)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_120431", "120431105", "story_v_out_120431.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_120431", "120431105", "story_v_out_120431.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_14 = math.max(var_434_5, arg_431_1.talkMaxDuration)

			if var_434_4 <= arg_431_1.time_ and arg_431_1.time_ < var_434_4 + var_434_14 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_4) / var_434_14

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_4 + var_434_14 and arg_431_1.time_ < var_434_4 + var_434_14 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play120431106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 120431106
		arg_435_1.duration_ = 7.866

		local var_435_0 = {
			zh = 5.233,
			ja = 7.866
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play120431107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.7

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[319].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(120431106)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 28
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431106", "story_v_out_120431.awb") ~= 0 then
					local var_438_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431106", "story_v_out_120431.awb") / 1000

					if var_438_8 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_8 + var_438_0
					end

					if var_438_3.prefab_name ~= "" and arg_435_1.actors_[var_438_3.prefab_name] ~= nil then
						local var_438_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_3.prefab_name].transform, "story_v_out_120431", "120431106", "story_v_out_120431.awb")

						arg_435_1:RecordAudio("120431106", var_438_9)
						arg_435_1:RecordAudio("120431106", var_438_9)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_120431", "120431106", "story_v_out_120431.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_120431", "120431106", "story_v_out_120431.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_10 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_10 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_10

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_10 and arg_435_1.time_ < var_438_0 + var_438_10 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play120431107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 120431107
		arg_439_1.duration_ = 2.499999999999

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play120431108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1029ui_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.characterEffect1029ui_story == nil then
				arg_439_1.var_.characterEffect1029ui_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.2

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect1029ui_story then
					local var_442_4 = Mathf.Lerp(0, 0.5, var_442_3)

					arg_439_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_439_1.var_.characterEffect1029ui_story.fillRatio = var_442_4
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.characterEffect1029ui_story then
				local var_442_5 = 0.5

				arg_439_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_439_1.var_.characterEffect1029ui_story.fillRatio = var_442_5
			end

			local var_442_6 = arg_439_1.actors_["1029ui_story"].transform
			local var_442_7 = 0

			if var_442_7 < arg_439_1.time_ and arg_439_1.time_ <= var_442_7 + arg_442_0 then
				arg_439_1.var_.moveOldPos1029ui_story = var_442_6.localPosition
			end

			local var_442_8 = 0.001

			if var_442_7 <= arg_439_1.time_ and arg_439_1.time_ < var_442_7 + var_442_8 then
				local var_442_9 = (arg_439_1.time_ - var_442_7) / var_442_8
				local var_442_10 = Vector3.New(-0.7, -1.09, -6.2)

				var_442_6.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1029ui_story, var_442_10, var_442_9)

				local var_442_11 = manager.ui.mainCamera.transform.position - var_442_6.position

				var_442_6.forward = Vector3.New(var_442_11.x, var_442_11.y, var_442_11.z)

				local var_442_12 = var_442_6.localEulerAngles

				var_442_12.z = 0
				var_442_12.x = 0
				var_442_6.localEulerAngles = var_442_12
			end

			if arg_439_1.time_ >= var_442_7 + var_442_8 and arg_439_1.time_ < var_442_7 + var_442_8 + arg_442_0 then
				var_442_6.localPosition = Vector3.New(-0.7, -1.09, -6.2)

				local var_442_13 = manager.ui.mainCamera.transform.position - var_442_6.position

				var_442_6.forward = Vector3.New(var_442_13.x, var_442_13.y, var_442_13.z)

				local var_442_14 = var_442_6.localEulerAngles

				var_442_14.z = 0
				var_442_14.x = 0
				var_442_6.localEulerAngles = var_442_14
			end

			local var_442_15 = arg_439_1.actors_["1084ui_story"].transform
			local var_442_16 = 0

			if var_442_16 < arg_439_1.time_ and arg_439_1.time_ <= var_442_16 + arg_442_0 then
				arg_439_1.var_.moveOldPos1084ui_story = var_442_15.localPosition
			end

			local var_442_17 = 0.001

			if var_442_16 <= arg_439_1.time_ and arg_439_1.time_ < var_442_16 + var_442_17 then
				local var_442_18 = (arg_439_1.time_ - var_442_16) / var_442_17
				local var_442_19 = Vector3.New(0.7, -0.97, -6)

				var_442_15.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1084ui_story, var_442_19, var_442_18)

				local var_442_20 = manager.ui.mainCamera.transform.position - var_442_15.position

				var_442_15.forward = Vector3.New(var_442_20.x, var_442_20.y, var_442_20.z)

				local var_442_21 = var_442_15.localEulerAngles

				var_442_21.z = 0
				var_442_21.x = 0
				var_442_15.localEulerAngles = var_442_21
			end

			if arg_439_1.time_ >= var_442_16 + var_442_17 and arg_439_1.time_ < var_442_16 + var_442_17 + arg_442_0 then
				var_442_15.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_442_22 = manager.ui.mainCamera.transform.position - var_442_15.position

				var_442_15.forward = Vector3.New(var_442_22.x, var_442_22.y, var_442_22.z)

				local var_442_23 = var_442_15.localEulerAngles

				var_442_23.z = 0
				var_442_23.x = 0
				var_442_15.localEulerAngles = var_442_23
			end

			local var_442_24 = 0

			if var_442_24 < arg_439_1.time_ and arg_439_1.time_ <= var_442_24 + arg_442_0 then
				arg_439_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_442_25 = 0

			if var_442_25 < arg_439_1.time_ and arg_439_1.time_ <= var_442_25 + arg_442_0 then
				arg_439_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_442_26 = arg_439_1.actors_["1084ui_story"]
			local var_442_27 = 0

			if var_442_27 < arg_439_1.time_ and arg_439_1.time_ <= var_442_27 + arg_442_0 and arg_439_1.var_.characterEffect1084ui_story == nil then
				arg_439_1.var_.characterEffect1084ui_story = var_442_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_28 = 0.2

			if var_442_27 <= arg_439_1.time_ and arg_439_1.time_ < var_442_27 + var_442_28 then
				local var_442_29 = (arg_439_1.time_ - var_442_27) / var_442_28

				if arg_439_1.var_.characterEffect1084ui_story then
					arg_439_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_27 + var_442_28 and arg_439_1.time_ < var_442_27 + var_442_28 + arg_442_0 and arg_439_1.var_.characterEffect1084ui_story then
				arg_439_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_442_30 = 0
			local var_442_31 = 0.05

			if var_442_30 < arg_439_1.time_ and arg_439_1.time_ <= var_442_30 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_32 = arg_439_1:FormatText(StoryNameCfg[6].name)

				arg_439_1.leftNameTxt_.text = var_442_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_33 = arg_439_1:GetWordFromCfg(120431107)
				local var_442_34 = arg_439_1:FormatText(var_442_33.content)

				arg_439_1.text_.text = var_442_34

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_35 = 2
				local var_442_36 = utf8.len(var_442_34)
				local var_442_37 = var_442_35 <= 0 and var_442_31 or var_442_31 * (var_442_36 / var_442_35)

				if var_442_37 > 0 and var_442_31 < var_442_37 then
					arg_439_1.talkMaxDuration = var_442_37

					if var_442_37 + var_442_30 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_37 + var_442_30
					end
				end

				arg_439_1.text_.text = var_442_34
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431107", "story_v_out_120431.awb") ~= 0 then
					local var_442_38 = manager.audio:GetVoiceLength("story_v_out_120431", "120431107", "story_v_out_120431.awb") / 1000

					if var_442_38 + var_442_30 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_38 + var_442_30
					end

					if var_442_33.prefab_name ~= "" and arg_439_1.actors_[var_442_33.prefab_name] ~= nil then
						local var_442_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_33.prefab_name].transform, "story_v_out_120431", "120431107", "story_v_out_120431.awb")

						arg_439_1:RecordAudio("120431107", var_442_39)
						arg_439_1:RecordAudio("120431107", var_442_39)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_120431", "120431107", "story_v_out_120431.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_120431", "120431107", "story_v_out_120431.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_40 = math.max(var_442_31, arg_439_1.talkMaxDuration)

			if var_442_30 <= arg_439_1.time_ and arg_439_1.time_ < var_442_30 + var_442_40 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_30) / var_442_40

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_30 + var_442_40 and arg_439_1.time_ < var_442_30 + var_442_40 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play120431108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 120431108
		arg_443_1.duration_ = 6.3

		local var_443_0 = {
			zh = 5,
			ja = 6.3
		}
		local var_443_1 = manager.audio:GetLocalizationFlag()

		if var_443_0[var_443_1] ~= nil then
			arg_443_1.duration_ = var_443_0[var_443_1]
		end

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play120431109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action447")
			end

			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_446_2 = 0
			local var_446_3 = 0.525

			if var_446_2 < arg_443_1.time_ and arg_443_1.time_ <= var_446_2 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_4 = arg_443_1:FormatText(StoryNameCfg[6].name)

				arg_443_1.leftNameTxt_.text = var_446_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_5 = arg_443_1:GetWordFromCfg(120431108)
				local var_446_6 = arg_443_1:FormatText(var_446_5.content)

				arg_443_1.text_.text = var_446_6

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_7 = 21
				local var_446_8 = utf8.len(var_446_6)
				local var_446_9 = var_446_7 <= 0 and var_446_3 or var_446_3 * (var_446_8 / var_446_7)

				if var_446_9 > 0 and var_446_3 < var_446_9 then
					arg_443_1.talkMaxDuration = var_446_9

					if var_446_9 + var_446_2 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_9 + var_446_2
					end
				end

				arg_443_1.text_.text = var_446_6
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431108", "story_v_out_120431.awb") ~= 0 then
					local var_446_10 = manager.audio:GetVoiceLength("story_v_out_120431", "120431108", "story_v_out_120431.awb") / 1000

					if var_446_10 + var_446_2 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_10 + var_446_2
					end

					if var_446_5.prefab_name ~= "" and arg_443_1.actors_[var_446_5.prefab_name] ~= nil then
						local var_446_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_5.prefab_name].transform, "story_v_out_120431", "120431108", "story_v_out_120431.awb")

						arg_443_1:RecordAudio("120431108", var_446_11)
						arg_443_1:RecordAudio("120431108", var_446_11)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_120431", "120431108", "story_v_out_120431.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_120431", "120431108", "story_v_out_120431.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_12 = math.max(var_446_3, arg_443_1.talkMaxDuration)

			if var_446_2 <= arg_443_1.time_ and arg_443_1.time_ < var_446_2 + var_446_12 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_2) / var_446_12

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_2 + var_446_12 and arg_443_1.time_ < var_446_2 + var_446_12 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play120431109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 120431109
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play120431110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["1084ui_story"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and arg_447_1.var_.characterEffect1084ui_story == nil then
				arg_447_1.var_.characterEffect1084ui_story = var_450_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.characterEffect1084ui_story then
					local var_450_4 = Mathf.Lerp(0, 0.5, var_450_3)

					arg_447_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_447_1.var_.characterEffect1084ui_story.fillRatio = var_450_4
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and arg_447_1.var_.characterEffect1084ui_story then
				local var_450_5 = 0.5

				arg_447_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_447_1.var_.characterEffect1084ui_story.fillRatio = var_450_5
			end

			local var_450_6 = 0
			local var_450_7 = 0.225

			if var_450_6 < arg_447_1.time_ and arg_447_1.time_ <= var_450_6 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_8 = arg_447_1:FormatText(StoryNameCfg[7].name)

				arg_447_1.leftNameTxt_.text = var_450_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_9 = arg_447_1:GetWordFromCfg(120431109)
				local var_450_10 = arg_447_1:FormatText(var_450_9.content)

				arg_447_1.text_.text = var_450_10

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_11 = 9
				local var_450_12 = utf8.len(var_450_10)
				local var_450_13 = var_450_11 <= 0 and var_450_7 or var_450_7 * (var_450_12 / var_450_11)

				if var_450_13 > 0 and var_450_7 < var_450_13 then
					arg_447_1.talkMaxDuration = var_450_13

					if var_450_13 + var_450_6 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_13 + var_450_6
					end
				end

				arg_447_1.text_.text = var_450_10
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_14 = math.max(var_450_7, arg_447_1.talkMaxDuration)

			if var_450_6 <= arg_447_1.time_ and arg_447_1.time_ < var_450_6 + var_450_14 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_6) / var_450_14

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_6 + var_450_14 and arg_447_1.time_ < var_450_6 + var_450_14 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play120431110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 120431110
		arg_451_1.duration_ = 6.066

		local var_451_0 = {
			zh = 4.566,
			ja = 6.066
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play120431111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1084ui_story"]
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 and arg_451_1.var_.characterEffect1084ui_story == nil then
				arg_451_1.var_.characterEffect1084ui_story = var_454_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_2 = 0.2

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2

				if arg_451_1.var_.characterEffect1084ui_story then
					arg_451_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 and arg_451_1.var_.characterEffect1084ui_story then
				arg_451_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_454_4 = 0

			if var_454_4 < arg_451_1.time_ and arg_451_1.time_ <= var_454_4 + arg_454_0 then
				arg_451_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_454_5 = 0

			if var_454_5 < arg_451_1.time_ and arg_451_1.time_ <= var_454_5 + arg_454_0 then
				arg_451_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_454_6 = 0
			local var_454_7 = 0.45

			if var_454_6 < arg_451_1.time_ and arg_451_1.time_ <= var_454_6 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_8 = arg_451_1:FormatText(StoryNameCfg[6].name)

				arg_451_1.leftNameTxt_.text = var_454_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_9 = arg_451_1:GetWordFromCfg(120431110)
				local var_454_10 = arg_451_1:FormatText(var_454_9.content)

				arg_451_1.text_.text = var_454_10

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_11 = 17
				local var_454_12 = utf8.len(var_454_10)
				local var_454_13 = var_454_11 <= 0 and var_454_7 or var_454_7 * (var_454_12 / var_454_11)

				if var_454_13 > 0 and var_454_7 < var_454_13 then
					arg_451_1.talkMaxDuration = var_454_13

					if var_454_13 + var_454_6 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_13 + var_454_6
					end
				end

				arg_451_1.text_.text = var_454_10
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431110", "story_v_out_120431.awb") ~= 0 then
					local var_454_14 = manager.audio:GetVoiceLength("story_v_out_120431", "120431110", "story_v_out_120431.awb") / 1000

					if var_454_14 + var_454_6 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_14 + var_454_6
					end

					if var_454_9.prefab_name ~= "" and arg_451_1.actors_[var_454_9.prefab_name] ~= nil then
						local var_454_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_9.prefab_name].transform, "story_v_out_120431", "120431110", "story_v_out_120431.awb")

						arg_451_1:RecordAudio("120431110", var_454_15)
						arg_451_1:RecordAudio("120431110", var_454_15)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_120431", "120431110", "story_v_out_120431.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_120431", "120431110", "story_v_out_120431.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_16 = math.max(var_454_7, arg_451_1.talkMaxDuration)

			if var_454_6 <= arg_451_1.time_ and arg_451_1.time_ < var_454_6 + var_454_16 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_6) / var_454_16

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_6 + var_454_16 and arg_451_1.time_ < var_454_6 + var_454_16 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play120431111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 120431111
		arg_455_1.duration_ = 4.533

		local var_455_0 = {
			zh = 3.3,
			ja = 4.533
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play120431112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.425

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[6].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(120431111)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 17
				local var_458_6 = utf8.len(var_458_4)
				local var_458_7 = var_458_5 <= 0 and var_458_1 or var_458_1 * (var_458_6 / var_458_5)

				if var_458_7 > 0 and var_458_1 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_4
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431111", "story_v_out_120431.awb") ~= 0 then
					local var_458_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431111", "story_v_out_120431.awb") / 1000

					if var_458_8 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_0
					end

					if var_458_3.prefab_name ~= "" and arg_455_1.actors_[var_458_3.prefab_name] ~= nil then
						local var_458_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_3.prefab_name].transform, "story_v_out_120431", "120431111", "story_v_out_120431.awb")

						arg_455_1:RecordAudio("120431111", var_458_9)
						arg_455_1:RecordAudio("120431111", var_458_9)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_120431", "120431111", "story_v_out_120431.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_120431", "120431111", "story_v_out_120431.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_10 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_10 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_10

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_10 and arg_455_1.time_ < var_458_0 + var_458_10 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play120431112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 120431112
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play120431113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 0.575

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_2 = arg_459_1:FormatText(StoryNameCfg[7].name)

				arg_459_1.leftNameTxt_.text = var_462_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_3 = arg_459_1:GetWordFromCfg(120431112)
				local var_462_4 = arg_459_1:FormatText(var_462_3.content)

				arg_459_1.text_.text = var_462_4

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_5 = 23
				local var_462_6 = utf8.len(var_462_4)
				local var_462_7 = var_462_5 <= 0 and var_462_1 or var_462_1 * (var_462_6 / var_462_5)

				if var_462_7 > 0 and var_462_1 < var_462_7 then
					arg_459_1.talkMaxDuration = var_462_7

					if var_462_7 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_7 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_4
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_8 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_8 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_8

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_8 and arg_459_1.time_ < var_462_0 + var_462_8 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play120431113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 120431113
		arg_463_1.duration_ = 6.7

		local var_463_0 = {
			zh = 4.066,
			ja = 6.7
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play120431114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 0.45

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[6].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(120431113)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 18
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431113", "story_v_out_120431.awb") ~= 0 then
					local var_466_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431113", "story_v_out_120431.awb") / 1000

					if var_466_8 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_8 + var_466_0
					end

					if var_466_3.prefab_name ~= "" and arg_463_1.actors_[var_466_3.prefab_name] ~= nil then
						local var_466_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_3.prefab_name].transform, "story_v_out_120431", "120431113", "story_v_out_120431.awb")

						arg_463_1:RecordAudio("120431113", var_466_9)
						arg_463_1:RecordAudio("120431113", var_466_9)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_120431", "120431113", "story_v_out_120431.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_120431", "120431113", "story_v_out_120431.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_10 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_10 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_10

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_10 and arg_463_1.time_ < var_466_0 + var_466_10 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play120431114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 120431114
		arg_467_1.duration_ = 9.233

		local var_467_0 = {
			zh = 4.733,
			ja = 9.233
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play120431115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.65

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_2 = arg_467_1:FormatText(StoryNameCfg[6].name)

				arg_467_1.leftNameTxt_.text = var_470_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_3 = arg_467_1:GetWordFromCfg(120431114)
				local var_470_4 = arg_467_1:FormatText(var_470_3.content)

				arg_467_1.text_.text = var_470_4

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_5 = 26
				local var_470_6 = utf8.len(var_470_4)
				local var_470_7 = var_470_5 <= 0 and var_470_1 or var_470_1 * (var_470_6 / var_470_5)

				if var_470_7 > 0 and var_470_1 < var_470_7 then
					arg_467_1.talkMaxDuration = var_470_7

					if var_470_7 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_7 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_4
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431114", "story_v_out_120431.awb") ~= 0 then
					local var_470_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431114", "story_v_out_120431.awb") / 1000

					if var_470_8 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_0
					end

					if var_470_3.prefab_name ~= "" and arg_467_1.actors_[var_470_3.prefab_name] ~= nil then
						local var_470_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_3.prefab_name].transform, "story_v_out_120431", "120431114", "story_v_out_120431.awb")

						arg_467_1:RecordAudio("120431114", var_470_9)
						arg_467_1:RecordAudio("120431114", var_470_9)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_120431", "120431114", "story_v_out_120431.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_120431", "120431114", "story_v_out_120431.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_10 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_10 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_10

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_10 and arg_467_1.time_ < var_470_0 + var_470_10 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play120431115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 120431115
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play120431116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1084ui_story"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos1084ui_story = var_474_0.localPosition
			end

			local var_474_2 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2
				local var_474_4 = Vector3.New(0, 100, 0)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1084ui_story, var_474_4, var_474_3)

				local var_474_5 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_5.x, var_474_5.y, var_474_5.z)

				local var_474_6 = var_474_0.localEulerAngles

				var_474_6.z = 0
				var_474_6.x = 0
				var_474_0.localEulerAngles = var_474_6
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(0, 100, 0)

				local var_474_7 = manager.ui.mainCamera.transform.position - var_474_0.position

				var_474_0.forward = Vector3.New(var_474_7.x, var_474_7.y, var_474_7.z)

				local var_474_8 = var_474_0.localEulerAngles

				var_474_8.z = 0
				var_474_8.x = 0
				var_474_0.localEulerAngles = var_474_8
			end

			local var_474_9 = arg_471_1.actors_["1029ui_story"].transform
			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 then
				arg_471_1.var_.moveOldPos1029ui_story = var_474_9.localPosition
			end

			local var_474_11 = 0.001

			if var_474_10 <= arg_471_1.time_ and arg_471_1.time_ < var_474_10 + var_474_11 then
				local var_474_12 = (arg_471_1.time_ - var_474_10) / var_474_11
				local var_474_13 = Vector3.New(0, 100, 0)

				var_474_9.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos1029ui_story, var_474_13, var_474_12)

				local var_474_14 = manager.ui.mainCamera.transform.position - var_474_9.position

				var_474_9.forward = Vector3.New(var_474_14.x, var_474_14.y, var_474_14.z)

				local var_474_15 = var_474_9.localEulerAngles

				var_474_15.z = 0
				var_474_15.x = 0
				var_474_9.localEulerAngles = var_474_15
			end

			if arg_471_1.time_ >= var_474_10 + var_474_11 and arg_471_1.time_ < var_474_10 + var_474_11 + arg_474_0 then
				var_474_9.localPosition = Vector3.New(0, 100, 0)

				local var_474_16 = manager.ui.mainCamera.transform.position - var_474_9.position

				var_474_9.forward = Vector3.New(var_474_16.x, var_474_16.y, var_474_16.z)

				local var_474_17 = var_474_9.localEulerAngles

				var_474_17.z = 0
				var_474_17.x = 0
				var_474_9.localEulerAngles = var_474_17
			end

			local var_474_18 = 0
			local var_474_19 = 1.05

			if var_474_18 < arg_471_1.time_ and arg_471_1.time_ <= var_474_18 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_20 = arg_471_1:GetWordFromCfg(120431115)
				local var_474_21 = arg_471_1:FormatText(var_474_20.content)

				arg_471_1.text_.text = var_474_21

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_22 = 42
				local var_474_23 = utf8.len(var_474_21)
				local var_474_24 = var_474_22 <= 0 and var_474_19 or var_474_19 * (var_474_23 / var_474_22)

				if var_474_24 > 0 and var_474_19 < var_474_24 then
					arg_471_1.talkMaxDuration = var_474_24

					if var_474_24 + var_474_18 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_24 + var_474_18
					end
				end

				arg_471_1.text_.text = var_474_21
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_25 = math.max(var_474_19, arg_471_1.talkMaxDuration)

			if var_474_18 <= arg_471_1.time_ and arg_471_1.time_ < var_474_18 + var_474_25 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_18) / var_474_25

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_18 + var_474_25 and arg_471_1.time_ < var_474_18 + var_474_25 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play120431116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 120431116
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play120431117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.725

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, false)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_2 = arg_475_1:GetWordFromCfg(120431116)
				local var_478_3 = arg_475_1:FormatText(var_478_2.content)

				arg_475_1.text_.text = var_478_3

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_4 = 29
				local var_478_5 = utf8.len(var_478_3)
				local var_478_6 = var_478_4 <= 0 and var_478_1 or var_478_1 * (var_478_5 / var_478_4)

				if var_478_6 > 0 and var_478_1 < var_478_6 then
					arg_475_1.talkMaxDuration = var_478_6

					if var_478_6 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_6 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_3
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_7 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_7 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_7

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_7 and arg_475_1.time_ < var_478_0 + var_478_7 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play120431117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 120431117
		arg_479_1.duration_ = 8.166

		local var_479_0 = {
			zh = 5.033,
			ja = 8.166
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play120431118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1029ui_story"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos1029ui_story = var_482_0.localPosition
			end

			local var_482_2 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2
				local var_482_4 = Vector3.New(0, -1.09, -6.2)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1029ui_story, var_482_4, var_482_3)

				local var_482_5 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_5.x, var_482_5.y, var_482_5.z)

				local var_482_6 = var_482_0.localEulerAngles

				var_482_6.z = 0
				var_482_6.x = 0
				var_482_0.localEulerAngles = var_482_6
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -1.09, -6.2)

				local var_482_7 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_7.x, var_482_7.y, var_482_7.z)

				local var_482_8 = var_482_0.localEulerAngles

				var_482_8.z = 0
				var_482_8.x = 0
				var_482_0.localEulerAngles = var_482_8
			end

			local var_482_9 = 0

			if var_482_9 < arg_479_1.time_ and arg_479_1.time_ <= var_482_9 + arg_482_0 then
				arg_479_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action1_1")
			end

			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 then
				arg_479_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_482_11 = arg_479_1.actors_["1029ui_story"]
			local var_482_12 = 0

			if var_482_12 < arg_479_1.time_ and arg_479_1.time_ <= var_482_12 + arg_482_0 and arg_479_1.var_.characterEffect1029ui_story == nil then
				arg_479_1.var_.characterEffect1029ui_story = var_482_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_13 = 0.2

			if var_482_12 <= arg_479_1.time_ and arg_479_1.time_ < var_482_12 + var_482_13 then
				local var_482_14 = (arg_479_1.time_ - var_482_12) / var_482_13

				if arg_479_1.var_.characterEffect1029ui_story then
					arg_479_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_12 + var_482_13 and arg_479_1.time_ < var_482_12 + var_482_13 + arg_482_0 and arg_479_1.var_.characterEffect1029ui_story then
				arg_479_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_482_15 = 0
			local var_482_16 = 0.45

			if var_482_15 < arg_479_1.time_ and arg_479_1.time_ <= var_482_15 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_17 = arg_479_1:FormatText(StoryNameCfg[319].name)

				arg_479_1.leftNameTxt_.text = var_482_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_18 = arg_479_1:GetWordFromCfg(120431117)
				local var_482_19 = arg_479_1:FormatText(var_482_18.content)

				arg_479_1.text_.text = var_482_19

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_20 = 18
				local var_482_21 = utf8.len(var_482_19)
				local var_482_22 = var_482_20 <= 0 and var_482_16 or var_482_16 * (var_482_21 / var_482_20)

				if var_482_22 > 0 and var_482_16 < var_482_22 then
					arg_479_1.talkMaxDuration = var_482_22

					if var_482_22 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_22 + var_482_15
					end
				end

				arg_479_1.text_.text = var_482_19
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431117", "story_v_out_120431.awb") ~= 0 then
					local var_482_23 = manager.audio:GetVoiceLength("story_v_out_120431", "120431117", "story_v_out_120431.awb") / 1000

					if var_482_23 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_23 + var_482_15
					end

					if var_482_18.prefab_name ~= "" and arg_479_1.actors_[var_482_18.prefab_name] ~= nil then
						local var_482_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_18.prefab_name].transform, "story_v_out_120431", "120431117", "story_v_out_120431.awb")

						arg_479_1:RecordAudio("120431117", var_482_24)
						arg_479_1:RecordAudio("120431117", var_482_24)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_120431", "120431117", "story_v_out_120431.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_120431", "120431117", "story_v_out_120431.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_25 = math.max(var_482_16, arg_479_1.talkMaxDuration)

			if var_482_15 <= arg_479_1.time_ and arg_479_1.time_ < var_482_15 + var_482_25 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_15) / var_482_25

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_15 + var_482_25 and arg_479_1.time_ < var_482_15 + var_482_25 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play120431118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 120431118
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play120431119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1029ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1029ui_story == nil then
				arg_483_1.var_.characterEffect1029ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.2

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1029ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1029ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1029ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1029ui_story.fillRatio = var_486_5
			end

			local var_486_6 = 0
			local var_486_7 = 0.175

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_8 = arg_483_1:FormatText(StoryNameCfg[7].name)

				arg_483_1.leftNameTxt_.text = var_486_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_9 = arg_483_1:GetWordFromCfg(120431118)
				local var_486_10 = arg_483_1:FormatText(var_486_9.content)

				arg_483_1.text_.text = var_486_10

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_11 = 7
				local var_486_12 = utf8.len(var_486_10)
				local var_486_13 = var_486_11 <= 0 and var_486_7 or var_486_7 * (var_486_12 / var_486_11)

				if var_486_13 > 0 and var_486_7 < var_486_13 then
					arg_483_1.talkMaxDuration = var_486_13

					if var_486_13 + var_486_6 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_13 + var_486_6
					end
				end

				arg_483_1.text_.text = var_486_10
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_14 = math.max(var_486_7, arg_483_1.talkMaxDuration)

			if var_486_6 <= arg_483_1.time_ and arg_483_1.time_ < var_486_6 + var_486_14 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_6) / var_486_14

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_6 + var_486_14 and arg_483_1.time_ < var_486_6 + var_486_14 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play120431119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 120431119
		arg_487_1.duration_ = 5.5

		local var_487_0 = {
			zh = 1.933,
			ja = 5.5
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play120431120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1029ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect1029ui_story == nil then
				arg_487_1.var_.characterEffect1029ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.2

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect1029ui_story then
					arg_487_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect1029ui_story then
				arg_487_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_490_4 = 0
			local var_490_5 = 0.2

			if var_490_4 < arg_487_1.time_ and arg_487_1.time_ <= var_490_4 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_6 = arg_487_1:FormatText(StoryNameCfg[319].name)

				arg_487_1.leftNameTxt_.text = var_490_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_7 = arg_487_1:GetWordFromCfg(120431119)
				local var_490_8 = arg_487_1:FormatText(var_490_7.content)

				arg_487_1.text_.text = var_490_8

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_9 = 8
				local var_490_10 = utf8.len(var_490_8)
				local var_490_11 = var_490_9 <= 0 and var_490_5 or var_490_5 * (var_490_10 / var_490_9)

				if var_490_11 > 0 and var_490_5 < var_490_11 then
					arg_487_1.talkMaxDuration = var_490_11

					if var_490_11 + var_490_4 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_11 + var_490_4
					end
				end

				arg_487_1.text_.text = var_490_8
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431119", "story_v_out_120431.awb") ~= 0 then
					local var_490_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431119", "story_v_out_120431.awb") / 1000

					if var_490_12 + var_490_4 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_12 + var_490_4
					end

					if var_490_7.prefab_name ~= "" and arg_487_1.actors_[var_490_7.prefab_name] ~= nil then
						local var_490_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_7.prefab_name].transform, "story_v_out_120431", "120431119", "story_v_out_120431.awb")

						arg_487_1:RecordAudio("120431119", var_490_13)
						arg_487_1:RecordAudio("120431119", var_490_13)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_120431", "120431119", "story_v_out_120431.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_120431", "120431119", "story_v_out_120431.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_14 = math.max(var_490_5, arg_487_1.talkMaxDuration)

			if var_490_4 <= arg_487_1.time_ and arg_487_1.time_ < var_490_4 + var_490_14 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_4) / var_490_14

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_4 + var_490_14 and arg_487_1.time_ < var_490_4 + var_490_14 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play120431120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 120431120
		arg_491_1.duration_ = 3.766

		local var_491_0 = {
			zh = 1.633,
			ja = 3.766
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play120431121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 0.175

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_2 = arg_491_1:FormatText(StoryNameCfg[319].name)

				arg_491_1.leftNameTxt_.text = var_494_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_3 = arg_491_1:GetWordFromCfg(120431120)
				local var_494_4 = arg_491_1:FormatText(var_494_3.content)

				arg_491_1.text_.text = var_494_4

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_5 = 7
				local var_494_6 = utf8.len(var_494_4)
				local var_494_7 = var_494_5 <= 0 and var_494_1 or var_494_1 * (var_494_6 / var_494_5)

				if var_494_7 > 0 and var_494_1 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_4
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431120", "story_v_out_120431.awb") ~= 0 then
					local var_494_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431120", "story_v_out_120431.awb") / 1000

					if var_494_8 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_8 + var_494_0
					end

					if var_494_3.prefab_name ~= "" and arg_491_1.actors_[var_494_3.prefab_name] ~= nil then
						local var_494_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_3.prefab_name].transform, "story_v_out_120431", "120431120", "story_v_out_120431.awb")

						arg_491_1:RecordAudio("120431120", var_494_9)
						arg_491_1:RecordAudio("120431120", var_494_9)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_120431", "120431120", "story_v_out_120431.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_120431", "120431120", "story_v_out_120431.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_10 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_10 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_10

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_10 and arg_491_1.time_ < var_494_0 + var_494_10 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play120431121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 120431121
		arg_495_1.duration_ = 5

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play120431122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1029ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story == nil then
				arg_495_1.var_.characterEffect1029ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.2

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1029ui_story then
					local var_498_4 = Mathf.Lerp(0, 0.5, var_498_3)

					arg_495_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_495_1.var_.characterEffect1029ui_story.fillRatio = var_498_4
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1029ui_story then
				local var_498_5 = 0.5

				arg_495_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_495_1.var_.characterEffect1029ui_story.fillRatio = var_498_5
			end

			local var_498_6 = 0
			local var_498_7 = 0.45

			if var_498_6 < arg_495_1.time_ and arg_495_1.time_ <= var_498_6 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_8 = arg_495_1:FormatText(StoryNameCfg[7].name)

				arg_495_1.leftNameTxt_.text = var_498_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_9 = arg_495_1:GetWordFromCfg(120431121)
				local var_498_10 = arg_495_1:FormatText(var_498_9.content)

				arg_495_1.text_.text = var_498_10

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_11 = 18
				local var_498_12 = utf8.len(var_498_10)
				local var_498_13 = var_498_11 <= 0 and var_498_7 or var_498_7 * (var_498_12 / var_498_11)

				if var_498_13 > 0 and var_498_7 < var_498_13 then
					arg_495_1.talkMaxDuration = var_498_13

					if var_498_13 + var_498_6 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_6
					end
				end

				arg_495_1.text_.text = var_498_10
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)
				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_14 = math.max(var_498_7, arg_495_1.talkMaxDuration)

			if var_498_6 <= arg_495_1.time_ and arg_495_1.time_ < var_498_6 + var_498_14 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_6) / var_498_14

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_6 + var_498_14 and arg_495_1.time_ < var_498_6 + var_498_14 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play120431122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 120431122
		arg_499_1.duration_ = 6.2

		local var_499_0 = {
			zh = 4,
			ja = 6.2
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play120431123(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1029ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1029ui_story == nil then
				arg_499_1.var_.characterEffect1029ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.2

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1029ui_story then
					arg_499_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1029ui_story then
				arg_499_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_502_4 = 0
			local var_502_5 = 0.425

			if var_502_4 < arg_499_1.time_ and arg_499_1.time_ <= var_502_4 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_6 = arg_499_1:FormatText(StoryNameCfg[319].name)

				arg_499_1.leftNameTxt_.text = var_502_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_7 = arg_499_1:GetWordFromCfg(120431122)
				local var_502_8 = arg_499_1:FormatText(var_502_7.content)

				arg_499_1.text_.text = var_502_8

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_9 = 17
				local var_502_10 = utf8.len(var_502_8)
				local var_502_11 = var_502_9 <= 0 and var_502_5 or var_502_5 * (var_502_10 / var_502_9)

				if var_502_11 > 0 and var_502_5 < var_502_11 then
					arg_499_1.talkMaxDuration = var_502_11

					if var_502_11 + var_502_4 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_11 + var_502_4
					end
				end

				arg_499_1.text_.text = var_502_8
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431122", "story_v_out_120431.awb") ~= 0 then
					local var_502_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431122", "story_v_out_120431.awb") / 1000

					if var_502_12 + var_502_4 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_12 + var_502_4
					end

					if var_502_7.prefab_name ~= "" and arg_499_1.actors_[var_502_7.prefab_name] ~= nil then
						local var_502_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_7.prefab_name].transform, "story_v_out_120431", "120431122", "story_v_out_120431.awb")

						arg_499_1:RecordAudio("120431122", var_502_13)
						arg_499_1:RecordAudio("120431122", var_502_13)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_120431", "120431122", "story_v_out_120431.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_120431", "120431122", "story_v_out_120431.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_14 = math.max(var_502_5, arg_499_1.talkMaxDuration)

			if var_502_4 <= arg_499_1.time_ and arg_499_1.time_ < var_502_4 + var_502_14 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_4) / var_502_14

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_4 + var_502_14 and arg_499_1.time_ < var_502_4 + var_502_14 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play120431123 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 120431123
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play120431124(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1029ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1029ui_story == nil then
				arg_503_1.var_.characterEffect1029ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.2

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1029ui_story then
					local var_506_4 = Mathf.Lerp(0, 0.5, var_506_3)

					arg_503_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1029ui_story.fillRatio = var_506_4
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1029ui_story then
				local var_506_5 = 0.5

				arg_503_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1029ui_story.fillRatio = var_506_5
			end

			local var_506_6 = 0
			local var_506_7 = 0.725

			if var_506_6 < arg_503_1.time_ and arg_503_1.time_ <= var_506_6 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_8 = arg_503_1:FormatText(StoryNameCfg[7].name)

				arg_503_1.leftNameTxt_.text = var_506_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_9 = arg_503_1:GetWordFromCfg(120431123)
				local var_506_10 = arg_503_1:FormatText(var_506_9.content)

				arg_503_1.text_.text = var_506_10

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_11 = 29
				local var_506_12 = utf8.len(var_506_10)
				local var_506_13 = var_506_11 <= 0 and var_506_7 or var_506_7 * (var_506_12 / var_506_11)

				if var_506_13 > 0 and var_506_7 < var_506_13 then
					arg_503_1.talkMaxDuration = var_506_13

					if var_506_13 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_13 + var_506_6
					end
				end

				arg_503_1.text_.text = var_506_10
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_14 = math.max(var_506_7, arg_503_1.talkMaxDuration)

			if var_506_6 <= arg_503_1.time_ and arg_503_1.time_ < var_506_6 + var_506_14 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_6) / var_506_14

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_6 + var_506_14 and arg_503_1.time_ < var_506_6 + var_506_14 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play120431124 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 120431124
		arg_507_1.duration_ = 4.8

		local var_507_0 = {
			zh = 4.8,
			ja = 3.1
		}
		local var_507_1 = manager.audio:GetLocalizationFlag()

		if var_507_0[var_507_1] ~= nil then
			arg_507_1.duration_ = var_507_0[var_507_1]
		end

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play120431125(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1029ui_story"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.characterEffect1029ui_story == nil then
				arg_507_1.var_.characterEffect1029ui_story = var_510_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_2 = 0.2

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.characterEffect1029ui_story then
					arg_507_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.characterEffect1029ui_story then
				arg_507_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_510_4 = 0
			local var_510_5 = 0.375

			if var_510_4 < arg_507_1.time_ and arg_507_1.time_ <= var_510_4 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_6 = arg_507_1:FormatText(StoryNameCfg[319].name)

				arg_507_1.leftNameTxt_.text = var_510_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_7 = arg_507_1:GetWordFromCfg(120431124)
				local var_510_8 = arg_507_1:FormatText(var_510_7.content)

				arg_507_1.text_.text = var_510_8

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_9 = 15
				local var_510_10 = utf8.len(var_510_8)
				local var_510_11 = var_510_9 <= 0 and var_510_5 or var_510_5 * (var_510_10 / var_510_9)

				if var_510_11 > 0 and var_510_5 < var_510_11 then
					arg_507_1.talkMaxDuration = var_510_11

					if var_510_11 + var_510_4 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_11 + var_510_4
					end
				end

				arg_507_1.text_.text = var_510_8
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431124", "story_v_out_120431.awb") ~= 0 then
					local var_510_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431124", "story_v_out_120431.awb") / 1000

					if var_510_12 + var_510_4 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_12 + var_510_4
					end

					if var_510_7.prefab_name ~= "" and arg_507_1.actors_[var_510_7.prefab_name] ~= nil then
						local var_510_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_7.prefab_name].transform, "story_v_out_120431", "120431124", "story_v_out_120431.awb")

						arg_507_1:RecordAudio("120431124", var_510_13)
						arg_507_1:RecordAudio("120431124", var_510_13)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_120431", "120431124", "story_v_out_120431.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_120431", "120431124", "story_v_out_120431.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_14 = math.max(var_510_5, arg_507_1.talkMaxDuration)

			if var_510_4 <= arg_507_1.time_ and arg_507_1.time_ < var_510_4 + var_510_14 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_4) / var_510_14

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_4 + var_510_14 and arg_507_1.time_ < var_510_4 + var_510_14 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play120431125 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 120431125
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play120431126(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1029ui_story"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and arg_511_1.var_.characterEffect1029ui_story == nil then
				arg_511_1.var_.characterEffect1029ui_story = var_514_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_2 = 0.2

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.characterEffect1029ui_story then
					local var_514_4 = Mathf.Lerp(0, 0.5, var_514_3)

					arg_511_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1029ui_story.fillRatio = var_514_4
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and arg_511_1.var_.characterEffect1029ui_story then
				local var_514_5 = 0.5

				arg_511_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1029ui_story.fillRatio = var_514_5
			end

			local var_514_6 = 0
			local var_514_7 = 0.2

			if var_514_6 < arg_511_1.time_ and arg_511_1.time_ <= var_514_6 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_8 = arg_511_1:FormatText(StoryNameCfg[7].name)

				arg_511_1.leftNameTxt_.text = var_514_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_9 = arg_511_1:GetWordFromCfg(120431125)
				local var_514_10 = arg_511_1:FormatText(var_514_9.content)

				arg_511_1.text_.text = var_514_10

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_11 = 8
				local var_514_12 = utf8.len(var_514_10)
				local var_514_13 = var_514_11 <= 0 and var_514_7 or var_514_7 * (var_514_12 / var_514_11)

				if var_514_13 > 0 and var_514_7 < var_514_13 then
					arg_511_1.talkMaxDuration = var_514_13

					if var_514_13 + var_514_6 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_13 + var_514_6
					end
				end

				arg_511_1.text_.text = var_514_10
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_14 = math.max(var_514_7, arg_511_1.talkMaxDuration)

			if var_514_6 <= arg_511_1.time_ and arg_511_1.time_ < var_514_6 + var_514_14 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_6) / var_514_14

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_6 + var_514_14 and arg_511_1.time_ < var_514_6 + var_514_14 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play120431126 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 120431126
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play120431127(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.7

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, false)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_2 = arg_515_1:GetWordFromCfg(120431126)
				local var_518_3 = arg_515_1:FormatText(var_518_2.content)

				arg_515_1.text_.text = var_518_3

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_4 = 28
				local var_518_5 = utf8.len(var_518_3)
				local var_518_6 = var_518_4 <= 0 and var_518_1 or var_518_1 * (var_518_5 / var_518_4)

				if var_518_6 > 0 and var_518_1 < var_518_6 then
					arg_515_1.talkMaxDuration = var_518_6

					if var_518_6 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_6 + var_518_0
					end
				end

				arg_515_1.text_.text = var_518_3
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_7 = math.max(var_518_1, arg_515_1.talkMaxDuration)

			if var_518_0 <= arg_515_1.time_ and arg_515_1.time_ < var_518_0 + var_518_7 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_0) / var_518_7

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_0 + var_518_7 and arg_515_1.time_ < var_518_0 + var_518_7 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play120431127 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 120431127
		arg_519_1.duration_ = 11.5

		local var_519_0 = {
			zh = 10.466,
			ja = 11.5
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play120431128(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1029ui_story"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and arg_519_1.var_.characterEffect1029ui_story == nil then
				arg_519_1.var_.characterEffect1029ui_story = var_522_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_2 = 0.2

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.characterEffect1029ui_story then
					arg_519_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and arg_519_1.var_.characterEffect1029ui_story then
				arg_519_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_522_4 = 0
			local var_522_5 = 1

			if var_522_4 < arg_519_1.time_ and arg_519_1.time_ <= var_522_4 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_6 = arg_519_1:FormatText(StoryNameCfg[319].name)

				arg_519_1.leftNameTxt_.text = var_522_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_7 = arg_519_1:GetWordFromCfg(120431127)
				local var_522_8 = arg_519_1:FormatText(var_522_7.content)

				arg_519_1.text_.text = var_522_8

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_9 = 40
				local var_522_10 = utf8.len(var_522_8)
				local var_522_11 = var_522_9 <= 0 and var_522_5 or var_522_5 * (var_522_10 / var_522_9)

				if var_522_11 > 0 and var_522_5 < var_522_11 then
					arg_519_1.talkMaxDuration = var_522_11

					if var_522_11 + var_522_4 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_11 + var_522_4
					end
				end

				arg_519_1.text_.text = var_522_8
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431127", "story_v_out_120431.awb") ~= 0 then
					local var_522_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431127", "story_v_out_120431.awb") / 1000

					if var_522_12 + var_522_4 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_12 + var_522_4
					end

					if var_522_7.prefab_name ~= "" and arg_519_1.actors_[var_522_7.prefab_name] ~= nil then
						local var_522_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_7.prefab_name].transform, "story_v_out_120431", "120431127", "story_v_out_120431.awb")

						arg_519_1:RecordAudio("120431127", var_522_13)
						arg_519_1:RecordAudio("120431127", var_522_13)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_120431", "120431127", "story_v_out_120431.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_120431", "120431127", "story_v_out_120431.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_14 = math.max(var_522_5, arg_519_1.talkMaxDuration)

			if var_522_4 <= arg_519_1.time_ and arg_519_1.time_ < var_522_4 + var_522_14 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_4) / var_522_14

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_4 + var_522_14 and arg_519_1.time_ < var_522_4 + var_522_14 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play120431128 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 120431128
		arg_523_1.duration_ = 12.8

		local var_523_0 = {
			zh = 12.8,
			ja = 12.766
		}
		local var_523_1 = manager.audio:GetLocalizationFlag()

		if var_523_0[var_523_1] ~= nil then
			arg_523_1.duration_ = var_523_0[var_523_1]
		end

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play120431129(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1:PlayTimeline("1029ui_story", "StoryTimeline/CharAction/story1029/1029action/1029action4_1")
			end

			local var_526_1 = 0
			local var_526_2 = 1.275

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_3 = arg_523_1:FormatText(StoryNameCfg[319].name)

				arg_523_1.leftNameTxt_.text = var_526_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_4 = arg_523_1:GetWordFromCfg(120431128)
				local var_526_5 = arg_523_1:FormatText(var_526_4.content)

				arg_523_1.text_.text = var_526_5

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_6 = 51
				local var_526_7 = utf8.len(var_526_5)
				local var_526_8 = var_526_6 <= 0 and var_526_2 or var_526_2 * (var_526_7 / var_526_6)

				if var_526_8 > 0 and var_526_2 < var_526_8 then
					arg_523_1.talkMaxDuration = var_526_8

					if var_526_8 + var_526_1 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_8 + var_526_1
					end
				end

				arg_523_1.text_.text = var_526_5
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431128", "story_v_out_120431.awb") ~= 0 then
					local var_526_9 = manager.audio:GetVoiceLength("story_v_out_120431", "120431128", "story_v_out_120431.awb") / 1000

					if var_526_9 + var_526_1 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_9 + var_526_1
					end

					if var_526_4.prefab_name ~= "" and arg_523_1.actors_[var_526_4.prefab_name] ~= nil then
						local var_526_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_4.prefab_name].transform, "story_v_out_120431", "120431128", "story_v_out_120431.awb")

						arg_523_1:RecordAudio("120431128", var_526_10)
						arg_523_1:RecordAudio("120431128", var_526_10)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_120431", "120431128", "story_v_out_120431.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_120431", "120431128", "story_v_out_120431.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_11 = math.max(var_526_2, arg_523_1.talkMaxDuration)

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_11 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_1) / var_526_11

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_1 + var_526_11 and arg_523_1.time_ < var_526_1 + var_526_11 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play120431129 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 120431129
		arg_527_1.duration_ = 1.333

		local var_527_0 = {
			zh = 1.333,
			ja = 1.166
		}
		local var_527_1 = manager.audio:GetLocalizationFlag()

		if var_527_0[var_527_1] ~= nil then
			arg_527_1.duration_ = var_527_0[var_527_1]
		end

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play120431130(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 0.1

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_2 = arg_527_1:FormatText(StoryNameCfg[319].name)

				arg_527_1.leftNameTxt_.text = var_530_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_3 = arg_527_1:GetWordFromCfg(120431129)
				local var_530_4 = arg_527_1:FormatText(var_530_3.content)

				arg_527_1.text_.text = var_530_4

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_5 = 4
				local var_530_6 = utf8.len(var_530_4)
				local var_530_7 = var_530_5 <= 0 and var_530_1 or var_530_1 * (var_530_6 / var_530_5)

				if var_530_7 > 0 and var_530_1 < var_530_7 then
					arg_527_1.talkMaxDuration = var_530_7

					if var_530_7 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_7 + var_530_0
					end
				end

				arg_527_1.text_.text = var_530_4
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431129", "story_v_out_120431.awb") ~= 0 then
					local var_530_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431129", "story_v_out_120431.awb") / 1000

					if var_530_8 + var_530_0 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_8 + var_530_0
					end

					if var_530_3.prefab_name ~= "" and arg_527_1.actors_[var_530_3.prefab_name] ~= nil then
						local var_530_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_3.prefab_name].transform, "story_v_out_120431", "120431129", "story_v_out_120431.awb")

						arg_527_1:RecordAudio("120431129", var_530_9)
						arg_527_1:RecordAudio("120431129", var_530_9)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_120431", "120431129", "story_v_out_120431.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_120431", "120431129", "story_v_out_120431.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_10 = math.max(var_530_1, arg_527_1.talkMaxDuration)

			if var_530_0 <= arg_527_1.time_ and arg_527_1.time_ < var_530_0 + var_530_10 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_0) / var_530_10

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_0 + var_530_10 and arg_527_1.time_ < var_530_0 + var_530_10 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play120431130 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 120431130
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play120431131(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1029ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1029ui_story == nil then
				arg_531_1.var_.characterEffect1029ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.2

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1029ui_story then
					local var_534_4 = Mathf.Lerp(0, 0.5, var_534_3)

					arg_531_1.var_.characterEffect1029ui_story.fillFlat = true
					arg_531_1.var_.characterEffect1029ui_story.fillRatio = var_534_4
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1029ui_story then
				local var_534_5 = 0.5

				arg_531_1.var_.characterEffect1029ui_story.fillFlat = true
				arg_531_1.var_.characterEffect1029ui_story.fillRatio = var_534_5
			end

			local var_534_6 = 0
			local var_534_7 = 0.75

			if var_534_6 < arg_531_1.time_ and arg_531_1.time_ <= var_534_6 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, false)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_8 = arg_531_1:GetWordFromCfg(120431130)
				local var_534_9 = arg_531_1:FormatText(var_534_8.content)

				arg_531_1.text_.text = var_534_9

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_10 = 30
				local var_534_11 = utf8.len(var_534_9)
				local var_534_12 = var_534_10 <= 0 and var_534_7 or var_534_7 * (var_534_11 / var_534_10)

				if var_534_12 > 0 and var_534_7 < var_534_12 then
					arg_531_1.talkMaxDuration = var_534_12

					if var_534_12 + var_534_6 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_12 + var_534_6
					end
				end

				arg_531_1.text_.text = var_534_9
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_13 = math.max(var_534_7, arg_531_1.talkMaxDuration)

			if var_534_6 <= arg_531_1.time_ and arg_531_1.time_ < var_534_6 + var_534_13 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_6) / var_534_13

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_6 + var_534_13 and arg_531_1.time_ < var_534_6 + var_534_13 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play120431131 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 120431131
		arg_535_1.duration_ = 3.2

		local var_535_0 = {
			zh = 1.933,
			ja = 3.2
		}
		local var_535_1 = manager.audio:GetLocalizationFlag()

		if var_535_0[var_535_1] ~= nil then
			arg_535_1.duration_ = var_535_0[var_535_1]
		end

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play120431132(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1029ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1029ui_story == nil then
				arg_535_1.var_.characterEffect1029ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.2

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1029ui_story then
					arg_535_1.var_.characterEffect1029ui_story.fillFlat = false
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.characterEffect1029ui_story then
				arg_535_1.var_.characterEffect1029ui_story.fillFlat = false
			end

			local var_538_4 = 0
			local var_538_5 = 0.225

			if var_538_4 < arg_535_1.time_ and arg_535_1.time_ <= var_538_4 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_6 = arg_535_1:FormatText(StoryNameCfg[319].name)

				arg_535_1.leftNameTxt_.text = var_538_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_7 = arg_535_1:GetWordFromCfg(120431131)
				local var_538_8 = arg_535_1:FormatText(var_538_7.content)

				arg_535_1.text_.text = var_538_8

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_9 = 9
				local var_538_10 = utf8.len(var_538_8)
				local var_538_11 = var_538_9 <= 0 and var_538_5 or var_538_5 * (var_538_10 / var_538_9)

				if var_538_11 > 0 and var_538_5 < var_538_11 then
					arg_535_1.talkMaxDuration = var_538_11

					if var_538_11 + var_538_4 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_11 + var_538_4
					end
				end

				arg_535_1.text_.text = var_538_8
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431131", "story_v_out_120431.awb") ~= 0 then
					local var_538_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431131", "story_v_out_120431.awb") / 1000

					if var_538_12 + var_538_4 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_12 + var_538_4
					end

					if var_538_7.prefab_name ~= "" and arg_535_1.actors_[var_538_7.prefab_name] ~= nil then
						local var_538_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_7.prefab_name].transform, "story_v_out_120431", "120431131", "story_v_out_120431.awb")

						arg_535_1:RecordAudio("120431131", var_538_13)
						arg_535_1:RecordAudio("120431131", var_538_13)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_120431", "120431131", "story_v_out_120431.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_120431", "120431131", "story_v_out_120431.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_14 = math.max(var_538_5, arg_535_1.talkMaxDuration)

			if var_538_4 <= arg_535_1.time_ and arg_535_1.time_ < var_538_4 + var_538_14 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_4) / var_538_14

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_4 + var_538_14 and arg_535_1.time_ < var_538_4 + var_538_14 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play120431132 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 120431132
		arg_539_1.duration_ = 9

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play120431133(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.mask_.enabled = true
				arg_539_1.mask_.raycastTarget = true

				arg_539_1:SetGaussion(false)
			end

			local var_542_1 = 2

			if var_542_0 <= arg_539_1.time_ and arg_539_1.time_ < var_542_0 + var_542_1 then
				local var_542_2 = (arg_539_1.time_ - var_542_0) / var_542_1
				local var_542_3 = Color.New(0, 0, 0)

				var_542_3.a = Mathf.Lerp(0, 1, var_542_2)
				arg_539_1.mask_.color = var_542_3
			end

			if arg_539_1.time_ >= var_542_0 + var_542_1 and arg_539_1.time_ < var_542_0 + var_542_1 + arg_542_0 then
				local var_542_4 = Color.New(0, 0, 0)

				var_542_4.a = 1
				arg_539_1.mask_.color = var_542_4
			end

			local var_542_5 = 2

			if var_542_5 < arg_539_1.time_ and arg_539_1.time_ <= var_542_5 + arg_542_0 then
				arg_539_1.mask_.enabled = true
				arg_539_1.mask_.raycastTarget = true

				arg_539_1:SetGaussion(false)
			end

			local var_542_6 = 2

			if var_542_5 <= arg_539_1.time_ and arg_539_1.time_ < var_542_5 + var_542_6 then
				local var_542_7 = (arg_539_1.time_ - var_542_5) / var_542_6
				local var_542_8 = Color.New(0, 0, 0)

				var_542_8.a = Mathf.Lerp(1, 0, var_542_7)
				arg_539_1.mask_.color = var_542_8
			end

			if arg_539_1.time_ >= var_542_5 + var_542_6 and arg_539_1.time_ < var_542_5 + var_542_6 + arg_542_0 then
				local var_542_9 = Color.New(0, 0, 0)
				local var_542_10 = 0

				arg_539_1.mask_.enabled = false
				var_542_9.a = var_542_10
				arg_539_1.mask_.color = var_542_9
			end

			local var_542_11 = arg_539_1.actors_["1029ui_story"].transform
			local var_542_12 = 1.966

			if var_542_12 < arg_539_1.time_ and arg_539_1.time_ <= var_542_12 + arg_542_0 then
				arg_539_1.var_.moveOldPos1029ui_story = var_542_11.localPosition
			end

			local var_542_13 = 0.001

			if var_542_12 <= arg_539_1.time_ and arg_539_1.time_ < var_542_12 + var_542_13 then
				local var_542_14 = (arg_539_1.time_ - var_542_12) / var_542_13
				local var_542_15 = Vector3.New(0, 100, 0)

				var_542_11.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1029ui_story, var_542_15, var_542_14)

				local var_542_16 = manager.ui.mainCamera.transform.position - var_542_11.position

				var_542_11.forward = Vector3.New(var_542_16.x, var_542_16.y, var_542_16.z)

				local var_542_17 = var_542_11.localEulerAngles

				var_542_17.z = 0
				var_542_17.x = 0
				var_542_11.localEulerAngles = var_542_17
			end

			if arg_539_1.time_ >= var_542_12 + var_542_13 and arg_539_1.time_ < var_542_12 + var_542_13 + arg_542_0 then
				var_542_11.localPosition = Vector3.New(0, 100, 0)

				local var_542_18 = manager.ui.mainCamera.transform.position - var_542_11.position

				var_542_11.forward = Vector3.New(var_542_18.x, var_542_18.y, var_542_18.z)

				local var_542_19 = var_542_11.localEulerAngles

				var_542_19.z = 0
				var_542_19.x = 0
				var_542_11.localEulerAngles = var_542_19
			end

			if arg_539_1.frameCnt_ <= 1 then
				arg_539_1.dialog_:SetActive(false)
			end

			local var_542_20 = 4
			local var_542_21 = 1.1

			if var_542_20 < arg_539_1.time_ and arg_539_1.time_ <= var_542_20 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0

				arg_539_1.dialog_:SetActive(true)

				local var_542_22 = LeanTween.value(arg_539_1.dialog_, 0, 1, 0.3)

				var_542_22:setOnUpdate(LuaHelper.FloatAction(function(arg_543_0)
					arg_539_1.dialogCg_.alpha = arg_543_0
				end))
				var_542_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_539_1.dialog_)
					var_542_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_539_1.duration_ = arg_539_1.duration_ + 0.3

				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_23 = arg_539_1:GetWordFromCfg(120431132)
				local var_542_24 = arg_539_1:FormatText(var_542_23.content)

				arg_539_1.text_.text = var_542_24

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_25 = 44
				local var_542_26 = utf8.len(var_542_24)
				local var_542_27 = var_542_25 <= 0 and var_542_21 or var_542_21 * (var_542_26 / var_542_25)

				if var_542_27 > 0 and var_542_21 < var_542_27 then
					arg_539_1.talkMaxDuration = var_542_27
					var_542_20 = var_542_20 + 0.3

					if var_542_27 + var_542_20 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_27 + var_542_20
					end
				end

				arg_539_1.text_.text = var_542_24
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_28 = var_542_20 + 0.3
			local var_542_29 = math.max(var_542_21, arg_539_1.talkMaxDuration)

			if var_542_28 <= arg_539_1.time_ and arg_539_1.time_ < var_542_28 + var_542_29 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_28) / var_542_29

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_28 + var_542_29 and arg_539_1.time_ < var_542_28 + var_542_29 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play120431133 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 120431133
		arg_545_1.duration_ = 11.7

		local var_545_0 = {
			zh = 7.666,
			ja = 11.7
		}
		local var_545_1 = manager.audio:GetLocalizationFlag()

		if var_545_0[var_545_1] ~= nil then
			arg_545_1.duration_ = var_545_0[var_545_1]
		end

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play120431134(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = arg_545_1.actors_["1084ui_story"].transform
			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 then
				arg_545_1.var_.moveOldPos1084ui_story = var_548_0.localPosition
			end

			local var_548_2 = 0.001

			if var_548_1 <= arg_545_1.time_ and arg_545_1.time_ < var_548_1 + var_548_2 then
				local var_548_3 = (arg_545_1.time_ - var_548_1) / var_548_2
				local var_548_4 = Vector3.New(0, -0.97, -6)

				var_548_0.localPosition = Vector3.Lerp(arg_545_1.var_.moveOldPos1084ui_story, var_548_4, var_548_3)

				local var_548_5 = manager.ui.mainCamera.transform.position - var_548_0.position

				var_548_0.forward = Vector3.New(var_548_5.x, var_548_5.y, var_548_5.z)

				local var_548_6 = var_548_0.localEulerAngles

				var_548_6.z = 0
				var_548_6.x = 0
				var_548_0.localEulerAngles = var_548_6
			end

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 then
				var_548_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_548_7 = manager.ui.mainCamera.transform.position - var_548_0.position

				var_548_0.forward = Vector3.New(var_548_7.x, var_548_7.y, var_548_7.z)

				local var_548_8 = var_548_0.localEulerAngles

				var_548_8.z = 0
				var_548_8.x = 0
				var_548_0.localEulerAngles = var_548_8
			end

			local var_548_9 = 0

			if var_548_9 < arg_545_1.time_ and arg_545_1.time_ <= var_548_9 + arg_548_0 then
				arg_545_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_548_10 = 0

			if var_548_10 < arg_545_1.time_ and arg_545_1.time_ <= var_548_10 + arg_548_0 then
				arg_545_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_548_11 = arg_545_1.actors_["1084ui_story"]
			local var_548_12 = 0

			if var_548_12 < arg_545_1.time_ and arg_545_1.time_ <= var_548_12 + arg_548_0 and arg_545_1.var_.characterEffect1084ui_story == nil then
				arg_545_1.var_.characterEffect1084ui_story = var_548_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_548_13 = 0.2

			if var_548_12 <= arg_545_1.time_ and arg_545_1.time_ < var_548_12 + var_548_13 then
				local var_548_14 = (arg_545_1.time_ - var_548_12) / var_548_13

				if arg_545_1.var_.characterEffect1084ui_story then
					arg_545_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_545_1.time_ >= var_548_12 + var_548_13 and arg_545_1.time_ < var_548_12 + var_548_13 + arg_548_0 and arg_545_1.var_.characterEffect1084ui_story then
				arg_545_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_548_15 = 0
			local var_548_16 = 0.95

			if var_548_15 < arg_545_1.time_ and arg_545_1.time_ <= var_548_15 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_17 = arg_545_1:FormatText(StoryNameCfg[6].name)

				arg_545_1.leftNameTxt_.text = var_548_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_18 = arg_545_1:GetWordFromCfg(120431133)
				local var_548_19 = arg_545_1:FormatText(var_548_18.content)

				arg_545_1.text_.text = var_548_19

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_20 = 38
				local var_548_21 = utf8.len(var_548_19)
				local var_548_22 = var_548_20 <= 0 and var_548_16 or var_548_16 * (var_548_21 / var_548_20)

				if var_548_22 > 0 and var_548_16 < var_548_22 then
					arg_545_1.talkMaxDuration = var_548_22

					if var_548_22 + var_548_15 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_22 + var_548_15
					end
				end

				arg_545_1.text_.text = var_548_19
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431133", "story_v_out_120431.awb") ~= 0 then
					local var_548_23 = manager.audio:GetVoiceLength("story_v_out_120431", "120431133", "story_v_out_120431.awb") / 1000

					if var_548_23 + var_548_15 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_23 + var_548_15
					end

					if var_548_18.prefab_name ~= "" and arg_545_1.actors_[var_548_18.prefab_name] ~= nil then
						local var_548_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_545_1.actors_[var_548_18.prefab_name].transform, "story_v_out_120431", "120431133", "story_v_out_120431.awb")

						arg_545_1:RecordAudio("120431133", var_548_24)
						arg_545_1:RecordAudio("120431133", var_548_24)
					else
						arg_545_1:AudioAction("play", "voice", "story_v_out_120431", "120431133", "story_v_out_120431.awb")
					end

					arg_545_1:RecordHistoryTalkVoice("story_v_out_120431", "120431133", "story_v_out_120431.awb")
				end

				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_25 = math.max(var_548_16, arg_545_1.talkMaxDuration)

			if var_548_15 <= arg_545_1.time_ and arg_545_1.time_ < var_548_15 + var_548_25 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_15) / var_548_25

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_15 + var_548_25 and arg_545_1.time_ < var_548_15 + var_548_25 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play120431134 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 120431134
		arg_549_1.duration_ = 9.8

		local var_549_0 = {
			zh = 7.233,
			ja = 9.8
		}
		local var_549_1 = manager.audio:GetLocalizationFlag()

		if var_549_0[var_549_1] ~= nil then
			arg_549_1.duration_ = var_549_0[var_549_1]
		end

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play120431135(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = 0

			if var_552_0 < arg_549_1.time_ and arg_549_1.time_ <= var_552_0 + arg_552_0 then
				arg_549_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action437")
			end

			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 then
				arg_549_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_552_2 = 0
			local var_552_3 = 0.625

			if var_552_2 < arg_549_1.time_ and arg_549_1.time_ <= var_552_2 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_4 = arg_549_1:FormatText(StoryNameCfg[6].name)

				arg_549_1.leftNameTxt_.text = var_552_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_5 = arg_549_1:GetWordFromCfg(120431134)
				local var_552_6 = arg_549_1:FormatText(var_552_5.content)

				arg_549_1.text_.text = var_552_6

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_7 = 24
				local var_552_8 = utf8.len(var_552_6)
				local var_552_9 = var_552_7 <= 0 and var_552_3 or var_552_3 * (var_552_8 / var_552_7)

				if var_552_9 > 0 and var_552_3 < var_552_9 then
					arg_549_1.talkMaxDuration = var_552_9

					if var_552_9 + var_552_2 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_9 + var_552_2
					end
				end

				arg_549_1.text_.text = var_552_6
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431134", "story_v_out_120431.awb") ~= 0 then
					local var_552_10 = manager.audio:GetVoiceLength("story_v_out_120431", "120431134", "story_v_out_120431.awb") / 1000

					if var_552_10 + var_552_2 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_10 + var_552_2
					end

					if var_552_5.prefab_name ~= "" and arg_549_1.actors_[var_552_5.prefab_name] ~= nil then
						local var_552_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_549_1.actors_[var_552_5.prefab_name].transform, "story_v_out_120431", "120431134", "story_v_out_120431.awb")

						arg_549_1:RecordAudio("120431134", var_552_11)
						arg_549_1:RecordAudio("120431134", var_552_11)
					else
						arg_549_1:AudioAction("play", "voice", "story_v_out_120431", "120431134", "story_v_out_120431.awb")
					end

					arg_549_1:RecordHistoryTalkVoice("story_v_out_120431", "120431134", "story_v_out_120431.awb")
				end

				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_12 = math.max(var_552_3, arg_549_1.talkMaxDuration)

			if var_552_2 <= arg_549_1.time_ and arg_549_1.time_ < var_552_2 + var_552_12 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_2) / var_552_12

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_2 + var_552_12 and arg_549_1.time_ < var_552_2 + var_552_12 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play120431135 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 120431135
		arg_553_1.duration_ = 3

		local var_553_0 = {
			zh = 1.433,
			ja = 3
		}
		local var_553_1 = manager.audio:GetLocalizationFlag()

		if var_553_0[var_553_1] ~= nil then
			arg_553_1.duration_ = var_553_0[var_553_1]
		end

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play120431136(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1084ui_story"]
			local var_556_1 = 0

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 and arg_553_1.var_.characterEffect1084ui_story == nil then
				arg_553_1.var_.characterEffect1084ui_story = var_556_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_556_2 = 0.2

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2

				if arg_553_1.var_.characterEffect1084ui_story then
					local var_556_4 = Mathf.Lerp(0, 0.5, var_556_3)

					arg_553_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_553_1.var_.characterEffect1084ui_story.fillRatio = var_556_4
				end
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 and arg_553_1.var_.characterEffect1084ui_story then
				local var_556_5 = 0.5

				arg_553_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_553_1.var_.characterEffect1084ui_story.fillRatio = var_556_5
			end

			local var_556_6 = 0
			local var_556_7 = 0.125

			if var_556_6 < arg_553_1.time_ and arg_553_1.time_ <= var_556_6 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0
				arg_553_1.dialogCg_.alpha = 1

				arg_553_1.dialog_:SetActive(true)
				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_8 = arg_553_1:FormatText(StoryNameCfg[389].name)

				arg_553_1.leftNameTxt_.text = var_556_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, true)
				arg_553_1.iconController_:SetSelectedState("hero")

				arg_553_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1076")

				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_9 = arg_553_1:GetWordFromCfg(120431135)
				local var_556_10 = arg_553_1:FormatText(var_556_9.content)

				arg_553_1.text_.text = var_556_10

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_11 = 5
				local var_556_12 = utf8.len(var_556_10)
				local var_556_13 = var_556_11 <= 0 and var_556_7 or var_556_7 * (var_556_12 / var_556_11)

				if var_556_13 > 0 and var_556_7 < var_556_13 then
					arg_553_1.talkMaxDuration = var_556_13

					if var_556_13 + var_556_6 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_13 + var_556_6
					end
				end

				arg_553_1.text_.text = var_556_10
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431135", "story_v_out_120431.awb") ~= 0 then
					local var_556_14 = manager.audio:GetVoiceLength("story_v_out_120431", "120431135", "story_v_out_120431.awb") / 1000

					if var_556_14 + var_556_6 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_14 + var_556_6
					end

					if var_556_9.prefab_name ~= "" and arg_553_1.actors_[var_556_9.prefab_name] ~= nil then
						local var_556_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_9.prefab_name].transform, "story_v_out_120431", "120431135", "story_v_out_120431.awb")

						arg_553_1:RecordAudio("120431135", var_556_15)
						arg_553_1:RecordAudio("120431135", var_556_15)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_out_120431", "120431135", "story_v_out_120431.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_out_120431", "120431135", "story_v_out_120431.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_16 = math.max(var_556_7, arg_553_1.talkMaxDuration)

			if var_556_6 <= arg_553_1.time_ and arg_553_1.time_ < var_556_6 + var_556_16 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_6) / var_556_16

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_6 + var_556_16 and arg_553_1.time_ < var_556_6 + var_556_16 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play120431136 = function(arg_557_0, arg_557_1)
		arg_557_1.time_ = 0
		arg_557_1.frameCnt_ = 0
		arg_557_1.state_ = "playing"
		arg_557_1.curTalkId_ = 120431136
		arg_557_1.duration_ = 5

		SetActive(arg_557_1.tipsGo_, false)

		function arg_557_1.onSingleLineFinish_()
			arg_557_1.onSingleLineUpdate_ = nil
			arg_557_1.onSingleLineFinish_ = nil
			arg_557_1.state_ = "waiting"
		end

		function arg_557_1.playNext_(arg_559_0)
			if arg_559_0 == 1 then
				arg_557_0:Play120431137(arg_557_1)
			end
		end

		function arg_557_1.onSingleLineUpdate_(arg_560_0)
			local var_560_0 = arg_557_1.actors_["1084ui_story"].transform
			local var_560_1 = 0

			if var_560_1 < arg_557_1.time_ and arg_557_1.time_ <= var_560_1 + arg_560_0 then
				arg_557_1.var_.moveOldPos1084ui_story = var_560_0.localPosition
			end

			local var_560_2 = 0.001

			if var_560_1 <= arg_557_1.time_ and arg_557_1.time_ < var_560_1 + var_560_2 then
				local var_560_3 = (arg_557_1.time_ - var_560_1) / var_560_2
				local var_560_4 = Vector3.New(0, 100, 0)

				var_560_0.localPosition = Vector3.Lerp(arg_557_1.var_.moveOldPos1084ui_story, var_560_4, var_560_3)

				local var_560_5 = manager.ui.mainCamera.transform.position - var_560_0.position

				var_560_0.forward = Vector3.New(var_560_5.x, var_560_5.y, var_560_5.z)

				local var_560_6 = var_560_0.localEulerAngles

				var_560_6.z = 0
				var_560_6.x = 0
				var_560_0.localEulerAngles = var_560_6
			end

			if arg_557_1.time_ >= var_560_1 + var_560_2 and arg_557_1.time_ < var_560_1 + var_560_2 + arg_560_0 then
				var_560_0.localPosition = Vector3.New(0, 100, 0)

				local var_560_7 = manager.ui.mainCamera.transform.position - var_560_0.position

				var_560_0.forward = Vector3.New(var_560_7.x, var_560_7.y, var_560_7.z)

				local var_560_8 = var_560_0.localEulerAngles

				var_560_8.z = 0
				var_560_8.x = 0
				var_560_0.localEulerAngles = var_560_8
			end

			local var_560_9 = 0
			local var_560_10 = 1.55

			if var_560_9 < arg_557_1.time_ and arg_557_1.time_ <= var_560_9 + arg_560_0 then
				arg_557_1.talkMaxDuration = 0
				arg_557_1.dialogCg_.alpha = 1

				arg_557_1.dialog_:SetActive(true)
				SetActive(arg_557_1.leftNameGo_, false)

				arg_557_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_557_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_557_1:RecordName(arg_557_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_557_1.iconTrs_.gameObject, false)
				arg_557_1.callingController_:SetSelectedState("normal")

				local var_560_11 = arg_557_1:GetWordFromCfg(120431136)
				local var_560_12 = arg_557_1:FormatText(var_560_11.content)

				arg_557_1.text_.text = var_560_12

				LuaForUtil.ClearLinePrefixSymbol(arg_557_1.text_)

				local var_560_13 = 62
				local var_560_14 = utf8.len(var_560_12)
				local var_560_15 = var_560_13 <= 0 and var_560_10 or var_560_10 * (var_560_14 / var_560_13)

				if var_560_15 > 0 and var_560_10 < var_560_15 then
					arg_557_1.talkMaxDuration = var_560_15

					if var_560_15 + var_560_9 > arg_557_1.duration_ then
						arg_557_1.duration_ = var_560_15 + var_560_9
					end
				end

				arg_557_1.text_.text = var_560_12
				arg_557_1.typewritter.percent = 0

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(false)
				arg_557_1:RecordContent(arg_557_1.text_.text)
			end

			local var_560_16 = math.max(var_560_10, arg_557_1.talkMaxDuration)

			if var_560_9 <= arg_557_1.time_ and arg_557_1.time_ < var_560_9 + var_560_16 then
				arg_557_1.typewritter.percent = (arg_557_1.time_ - var_560_9) / var_560_16

				arg_557_1.typewritter:SetDirty()
			end

			if arg_557_1.time_ >= var_560_9 + var_560_16 and arg_557_1.time_ < var_560_9 + var_560_16 + arg_560_0 then
				arg_557_1.typewritter.percent = 1

				arg_557_1.typewritter:SetDirty()
				arg_557_1:ShowNextGo(true)
			end
		end
	end,
	Play120431137 = function(arg_561_0, arg_561_1)
		arg_561_1.time_ = 0
		arg_561_1.frameCnt_ = 0
		arg_561_1.state_ = "playing"
		arg_561_1.curTalkId_ = 120431137
		arg_561_1.duration_ = 10.866

		local var_561_0 = {
			zh = 6.6,
			ja = 10.866
		}
		local var_561_1 = manager.audio:GetLocalizationFlag()

		if var_561_0[var_561_1] ~= nil then
			arg_561_1.duration_ = var_561_0[var_561_1]
		end

		SetActive(arg_561_1.tipsGo_, false)

		function arg_561_1.onSingleLineFinish_()
			arg_561_1.onSingleLineUpdate_ = nil
			arg_561_1.onSingleLineFinish_ = nil
			arg_561_1.state_ = "waiting"
		end

		function arg_561_1.playNext_(arg_563_0)
			if arg_563_0 == 1 then
				arg_561_0:Play120431138(arg_561_1)
			end
		end

		function arg_561_1.onSingleLineUpdate_(arg_564_0)
			local var_564_0 = 0

			if var_564_0 < arg_561_1.time_ and arg_561_1.time_ <= var_564_0 + arg_564_0 then
				arg_561_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_564_1 = arg_561_1.actors_["1084ui_story"]
			local var_564_2 = 0

			if var_564_2 < arg_561_1.time_ and arg_561_1.time_ <= var_564_2 + arg_564_0 and arg_561_1.var_.characterEffect1084ui_story == nil then
				arg_561_1.var_.characterEffect1084ui_story = var_564_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_564_3 = 0.2

			if var_564_2 <= arg_561_1.time_ and arg_561_1.time_ < var_564_2 + var_564_3 then
				local var_564_4 = (arg_561_1.time_ - var_564_2) / var_564_3

				if arg_561_1.var_.characterEffect1084ui_story then
					arg_561_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_561_1.time_ >= var_564_2 + var_564_3 and arg_561_1.time_ < var_564_2 + var_564_3 + arg_564_0 and arg_561_1.var_.characterEffect1084ui_story then
				arg_561_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_564_5 = arg_561_1.actors_["1084ui_story"].transform
			local var_564_6 = 0

			if var_564_6 < arg_561_1.time_ and arg_561_1.time_ <= var_564_6 + arg_564_0 then
				arg_561_1.var_.moveOldPos1084ui_story = var_564_5.localPosition
			end

			local var_564_7 = 0.001

			if var_564_6 <= arg_561_1.time_ and arg_561_1.time_ < var_564_6 + var_564_7 then
				local var_564_8 = (arg_561_1.time_ - var_564_6) / var_564_7
				local var_564_9 = Vector3.New(-0.7, -0.97, -6)

				var_564_5.localPosition = Vector3.Lerp(arg_561_1.var_.moveOldPos1084ui_story, var_564_9, var_564_8)

				local var_564_10 = manager.ui.mainCamera.transform.position - var_564_5.position

				var_564_5.forward = Vector3.New(var_564_10.x, var_564_10.y, var_564_10.z)

				local var_564_11 = var_564_5.localEulerAngles

				var_564_11.z = 0
				var_564_11.x = 0
				var_564_5.localEulerAngles = var_564_11
			end

			if arg_561_1.time_ >= var_564_6 + var_564_7 and arg_561_1.time_ < var_564_6 + var_564_7 + arg_564_0 then
				var_564_5.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_564_12 = manager.ui.mainCamera.transform.position - var_564_5.position

				var_564_5.forward = Vector3.New(var_564_12.x, var_564_12.y, var_564_12.z)

				local var_564_13 = var_564_5.localEulerAngles

				var_564_13.z = 0
				var_564_13.x = 0
				var_564_5.localEulerAngles = var_564_13
			end

			local var_564_14 = 0

			if var_564_14 < arg_561_1.time_ and arg_561_1.time_ <= var_564_14 + arg_564_0 then
				arg_561_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_564_15 = 0
			local var_564_16 = 0.525

			if var_564_15 < arg_561_1.time_ and arg_561_1.time_ <= var_564_15 + arg_564_0 then
				arg_561_1.talkMaxDuration = 0
				arg_561_1.dialogCg_.alpha = 1

				arg_561_1.dialog_:SetActive(true)
				SetActive(arg_561_1.leftNameGo_, true)

				local var_564_17 = arg_561_1:FormatText(StoryNameCfg[6].name)

				arg_561_1.leftNameTxt_.text = var_564_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_561_1.leftNameTxt_.transform)

				arg_561_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_561_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_561_1:RecordName(arg_561_1.leftNameTxt_.text)
				SetActive(arg_561_1.iconTrs_.gameObject, false)
				arg_561_1.callingController_:SetSelectedState("normal")

				local var_564_18 = arg_561_1:GetWordFromCfg(120431137)
				local var_564_19 = arg_561_1:FormatText(var_564_18.content)

				arg_561_1.text_.text = var_564_19

				LuaForUtil.ClearLinePrefixSymbol(arg_561_1.text_)

				local var_564_20 = 21
				local var_564_21 = utf8.len(var_564_19)
				local var_564_22 = var_564_20 <= 0 and var_564_16 or var_564_16 * (var_564_21 / var_564_20)

				if var_564_22 > 0 and var_564_16 < var_564_22 then
					arg_561_1.talkMaxDuration = var_564_22

					if var_564_22 + var_564_15 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_22 + var_564_15
					end
				end

				arg_561_1.text_.text = var_564_19
				arg_561_1.typewritter.percent = 0

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431137", "story_v_out_120431.awb") ~= 0 then
					local var_564_23 = manager.audio:GetVoiceLength("story_v_out_120431", "120431137", "story_v_out_120431.awb") / 1000

					if var_564_23 + var_564_15 > arg_561_1.duration_ then
						arg_561_1.duration_ = var_564_23 + var_564_15
					end

					if var_564_18.prefab_name ~= "" and arg_561_1.actors_[var_564_18.prefab_name] ~= nil then
						local var_564_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_561_1.actors_[var_564_18.prefab_name].transform, "story_v_out_120431", "120431137", "story_v_out_120431.awb")

						arg_561_1:RecordAudio("120431137", var_564_24)
						arg_561_1:RecordAudio("120431137", var_564_24)
					else
						arg_561_1:AudioAction("play", "voice", "story_v_out_120431", "120431137", "story_v_out_120431.awb")
					end

					arg_561_1:RecordHistoryTalkVoice("story_v_out_120431", "120431137", "story_v_out_120431.awb")
				end

				arg_561_1:RecordContent(arg_561_1.text_.text)
			end

			local var_564_25 = math.max(var_564_16, arg_561_1.talkMaxDuration)

			if var_564_15 <= arg_561_1.time_ and arg_561_1.time_ < var_564_15 + var_564_25 then
				arg_561_1.typewritter.percent = (arg_561_1.time_ - var_564_15) / var_564_25

				arg_561_1.typewritter:SetDirty()
			end

			if arg_561_1.time_ >= var_564_15 + var_564_25 and arg_561_1.time_ < var_564_15 + var_564_25 + arg_564_0 then
				arg_561_1.typewritter.percent = 1

				arg_561_1.typewritter:SetDirty()
				arg_561_1:ShowNextGo(true)
			end
		end
	end,
	Play120431138 = function(arg_565_0, arg_565_1)
		arg_565_1.time_ = 0
		arg_565_1.frameCnt_ = 0
		arg_565_1.state_ = "playing"
		arg_565_1.curTalkId_ = 120431138
		arg_565_1.duration_ = 5.633

		local var_565_0 = {
			zh = 1.999999999999,
			ja = 5.633
		}
		local var_565_1 = manager.audio:GetLocalizationFlag()

		if var_565_0[var_565_1] ~= nil then
			arg_565_1.duration_ = var_565_0[var_565_1]
		end

		SetActive(arg_565_1.tipsGo_, false)

		function arg_565_1.onSingleLineFinish_()
			arg_565_1.onSingleLineUpdate_ = nil
			arg_565_1.onSingleLineFinish_ = nil
			arg_565_1.state_ = "waiting"
		end

		function arg_565_1.playNext_(arg_567_0)
			if arg_567_0 == 1 then
				arg_565_0:Play120431139(arg_565_1)
			end
		end

		function arg_565_1.onSingleLineUpdate_(arg_568_0)
			local var_568_0 = arg_565_1.actors_["1084ui_story"]
			local var_568_1 = 0

			if var_568_1 < arg_565_1.time_ and arg_565_1.time_ <= var_568_1 + arg_568_0 and arg_565_1.var_.characterEffect1084ui_story == nil then
				arg_565_1.var_.characterEffect1084ui_story = var_568_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_2 = 0.2

			if var_568_1 <= arg_565_1.time_ and arg_565_1.time_ < var_568_1 + var_568_2 then
				local var_568_3 = (arg_565_1.time_ - var_568_1) / var_568_2

				if arg_565_1.var_.characterEffect1084ui_story then
					local var_568_4 = Mathf.Lerp(0, 0.5, var_568_3)

					arg_565_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_565_1.var_.characterEffect1084ui_story.fillRatio = var_568_4
				end
			end

			if arg_565_1.time_ >= var_568_1 + var_568_2 and arg_565_1.time_ < var_568_1 + var_568_2 + arg_568_0 and arg_565_1.var_.characterEffect1084ui_story then
				local var_568_5 = 0.5

				arg_565_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_565_1.var_.characterEffect1084ui_story.fillRatio = var_568_5
			end

			local var_568_6 = arg_565_1.actors_["1076ui_story"].transform
			local var_568_7 = 0

			if var_568_7 < arg_565_1.time_ and arg_565_1.time_ <= var_568_7 + arg_568_0 then
				arg_565_1.var_.moveOldPos1076ui_story = var_568_6.localPosition
			end

			local var_568_8 = 0.001

			if var_568_7 <= arg_565_1.time_ and arg_565_1.time_ < var_568_7 + var_568_8 then
				local var_568_9 = (arg_565_1.time_ - var_568_7) / var_568_8
				local var_568_10 = Vector3.New(0.7, -1.06, -6.2)

				var_568_6.localPosition = Vector3.Lerp(arg_565_1.var_.moveOldPos1076ui_story, var_568_10, var_568_9)

				local var_568_11 = manager.ui.mainCamera.transform.position - var_568_6.position

				var_568_6.forward = Vector3.New(var_568_11.x, var_568_11.y, var_568_11.z)

				local var_568_12 = var_568_6.localEulerAngles

				var_568_12.z = 0
				var_568_12.x = 0
				var_568_6.localEulerAngles = var_568_12
			end

			if arg_565_1.time_ >= var_568_7 + var_568_8 and arg_565_1.time_ < var_568_7 + var_568_8 + arg_568_0 then
				var_568_6.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_568_13 = manager.ui.mainCamera.transform.position - var_568_6.position

				var_568_6.forward = Vector3.New(var_568_13.x, var_568_13.y, var_568_13.z)

				local var_568_14 = var_568_6.localEulerAngles

				var_568_14.z = 0
				var_568_14.x = 0
				var_568_6.localEulerAngles = var_568_14
			end

			local var_568_15 = 0

			if var_568_15 < arg_565_1.time_ and arg_565_1.time_ <= var_568_15 + arg_568_0 then
				arg_565_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_568_16 = arg_565_1.actors_["1076ui_story"]
			local var_568_17 = 0

			if var_568_17 < arg_565_1.time_ and arg_565_1.time_ <= var_568_17 + arg_568_0 and arg_565_1.var_.characterEffect1076ui_story == nil then
				arg_565_1.var_.characterEffect1076ui_story = var_568_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_568_18 = 0.2

			if var_568_17 <= arg_565_1.time_ and arg_565_1.time_ < var_568_17 + var_568_18 then
				local var_568_19 = (arg_565_1.time_ - var_568_17) / var_568_18

				if arg_565_1.var_.characterEffect1076ui_story then
					arg_565_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_565_1.time_ >= var_568_17 + var_568_18 and arg_565_1.time_ < var_568_17 + var_568_18 + arg_568_0 and arg_565_1.var_.characterEffect1076ui_story then
				arg_565_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_568_20 = 0
			local var_568_21 = 0.15

			if var_568_20 < arg_565_1.time_ and arg_565_1.time_ <= var_568_20 + arg_568_0 then
				arg_565_1.talkMaxDuration = 0
				arg_565_1.dialogCg_.alpha = 1

				arg_565_1.dialog_:SetActive(true)
				SetActive(arg_565_1.leftNameGo_, true)

				local var_568_22 = arg_565_1:FormatText(StoryNameCfg[389].name)

				arg_565_1.leftNameTxt_.text = var_568_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_565_1.leftNameTxt_.transform)

				arg_565_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_565_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_565_1:RecordName(arg_565_1.leftNameTxt_.text)
				SetActive(arg_565_1.iconTrs_.gameObject, false)
				arg_565_1.callingController_:SetSelectedState("normal")

				local var_568_23 = arg_565_1:GetWordFromCfg(120431138)
				local var_568_24 = arg_565_1:FormatText(var_568_23.content)

				arg_565_1.text_.text = var_568_24

				LuaForUtil.ClearLinePrefixSymbol(arg_565_1.text_)

				local var_568_25 = 6
				local var_568_26 = utf8.len(var_568_24)
				local var_568_27 = var_568_25 <= 0 and var_568_21 or var_568_21 * (var_568_26 / var_568_25)

				if var_568_27 > 0 and var_568_21 < var_568_27 then
					arg_565_1.talkMaxDuration = var_568_27

					if var_568_27 + var_568_20 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_27 + var_568_20
					end
				end

				arg_565_1.text_.text = var_568_24
				arg_565_1.typewritter.percent = 0

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431138", "story_v_out_120431.awb") ~= 0 then
					local var_568_28 = manager.audio:GetVoiceLength("story_v_out_120431", "120431138", "story_v_out_120431.awb") / 1000

					if var_568_28 + var_568_20 > arg_565_1.duration_ then
						arg_565_1.duration_ = var_568_28 + var_568_20
					end

					if var_568_23.prefab_name ~= "" and arg_565_1.actors_[var_568_23.prefab_name] ~= nil then
						local var_568_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_565_1.actors_[var_568_23.prefab_name].transform, "story_v_out_120431", "120431138", "story_v_out_120431.awb")

						arg_565_1:RecordAudio("120431138", var_568_29)
						arg_565_1:RecordAudio("120431138", var_568_29)
					else
						arg_565_1:AudioAction("play", "voice", "story_v_out_120431", "120431138", "story_v_out_120431.awb")
					end

					arg_565_1:RecordHistoryTalkVoice("story_v_out_120431", "120431138", "story_v_out_120431.awb")
				end

				arg_565_1:RecordContent(arg_565_1.text_.text)
			end

			local var_568_30 = math.max(var_568_21, arg_565_1.talkMaxDuration)

			if var_568_20 <= arg_565_1.time_ and arg_565_1.time_ < var_568_20 + var_568_30 then
				arg_565_1.typewritter.percent = (arg_565_1.time_ - var_568_20) / var_568_30

				arg_565_1.typewritter:SetDirty()
			end

			if arg_565_1.time_ >= var_568_20 + var_568_30 and arg_565_1.time_ < var_568_20 + var_568_30 + arg_568_0 then
				arg_565_1.typewritter.percent = 1

				arg_565_1.typewritter:SetDirty()
				arg_565_1:ShowNextGo(true)
			end
		end
	end,
	Play120431139 = function(arg_569_0, arg_569_1)
		arg_569_1.time_ = 0
		arg_569_1.frameCnt_ = 0
		arg_569_1.state_ = "playing"
		arg_569_1.curTalkId_ = 120431139
		arg_569_1.duration_ = 5

		SetActive(arg_569_1.tipsGo_, false)

		function arg_569_1.onSingleLineFinish_()
			arg_569_1.onSingleLineUpdate_ = nil
			arg_569_1.onSingleLineFinish_ = nil
			arg_569_1.state_ = "waiting"
		end

		function arg_569_1.playNext_(arg_571_0)
			if arg_571_0 == 1 then
				arg_569_0:Play120431140(arg_569_1)
			end
		end

		function arg_569_1.onSingleLineUpdate_(arg_572_0)
			local var_572_0 = arg_569_1.actors_["1076ui_story"]
			local var_572_1 = 0

			if var_572_1 < arg_569_1.time_ and arg_569_1.time_ <= var_572_1 + arg_572_0 and arg_569_1.var_.characterEffect1076ui_story == nil then
				arg_569_1.var_.characterEffect1076ui_story = var_572_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_572_2 = 0.2

			if var_572_1 <= arg_569_1.time_ and arg_569_1.time_ < var_572_1 + var_572_2 then
				local var_572_3 = (arg_569_1.time_ - var_572_1) / var_572_2

				if arg_569_1.var_.characterEffect1076ui_story then
					local var_572_4 = Mathf.Lerp(0, 0.5, var_572_3)

					arg_569_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_569_1.var_.characterEffect1076ui_story.fillRatio = var_572_4
				end
			end

			if arg_569_1.time_ >= var_572_1 + var_572_2 and arg_569_1.time_ < var_572_1 + var_572_2 + arg_572_0 and arg_569_1.var_.characterEffect1076ui_story then
				local var_572_5 = 0.5

				arg_569_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_569_1.var_.characterEffect1076ui_story.fillRatio = var_572_5
			end

			local var_572_6 = 0
			local var_572_7 = 1.35

			if var_572_6 < arg_569_1.time_ and arg_569_1.time_ <= var_572_6 + arg_572_0 then
				arg_569_1.talkMaxDuration = 0
				arg_569_1.dialogCg_.alpha = 1

				arg_569_1.dialog_:SetActive(true)
				SetActive(arg_569_1.leftNameGo_, false)

				arg_569_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_569_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_569_1:RecordName(arg_569_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_569_1.iconTrs_.gameObject, false)
				arg_569_1.callingController_:SetSelectedState("normal")

				local var_572_8 = arg_569_1:GetWordFromCfg(120431139)
				local var_572_9 = arg_569_1:FormatText(var_572_8.content)

				arg_569_1.text_.text = var_572_9

				LuaForUtil.ClearLinePrefixSymbol(arg_569_1.text_)

				local var_572_10 = 54
				local var_572_11 = utf8.len(var_572_9)
				local var_572_12 = var_572_10 <= 0 and var_572_7 or var_572_7 * (var_572_11 / var_572_10)

				if var_572_12 > 0 and var_572_7 < var_572_12 then
					arg_569_1.talkMaxDuration = var_572_12

					if var_572_12 + var_572_6 > arg_569_1.duration_ then
						arg_569_1.duration_ = var_572_12 + var_572_6
					end
				end

				arg_569_1.text_.text = var_572_9
				arg_569_1.typewritter.percent = 0

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(false)
				arg_569_1:RecordContent(arg_569_1.text_.text)
			end

			local var_572_13 = math.max(var_572_7, arg_569_1.talkMaxDuration)

			if var_572_6 <= arg_569_1.time_ and arg_569_1.time_ < var_572_6 + var_572_13 then
				arg_569_1.typewritter.percent = (arg_569_1.time_ - var_572_6) / var_572_13

				arg_569_1.typewritter:SetDirty()
			end

			if arg_569_1.time_ >= var_572_6 + var_572_13 and arg_569_1.time_ < var_572_6 + var_572_13 + arg_572_0 then
				arg_569_1.typewritter.percent = 1

				arg_569_1.typewritter:SetDirty()
				arg_569_1:ShowNextGo(true)
			end
		end
	end,
	Play120431140 = function(arg_573_0, arg_573_1)
		arg_573_1.time_ = 0
		arg_573_1.frameCnt_ = 0
		arg_573_1.state_ = "playing"
		arg_573_1.curTalkId_ = 120431140
		arg_573_1.duration_ = 12.066

		local var_573_0 = {
			zh = 7.233,
			ja = 12.066
		}
		local var_573_1 = manager.audio:GetLocalizationFlag()

		if var_573_0[var_573_1] ~= nil then
			arg_573_1.duration_ = var_573_0[var_573_1]
		end

		SetActive(arg_573_1.tipsGo_, false)

		function arg_573_1.onSingleLineFinish_()
			arg_573_1.onSingleLineUpdate_ = nil
			arg_573_1.onSingleLineFinish_ = nil
			arg_573_1.state_ = "waiting"
		end

		function arg_573_1.playNext_(arg_575_0)
			if arg_575_0 == 1 then
				arg_573_0:Play120431141(arg_573_1)
			end
		end

		function arg_573_1.onSingleLineUpdate_(arg_576_0)
			local var_576_0 = arg_573_1.actors_["1076ui_story"]
			local var_576_1 = 0

			if var_576_1 < arg_573_1.time_ and arg_573_1.time_ <= var_576_1 + arg_576_0 and arg_573_1.var_.characterEffect1076ui_story == nil then
				arg_573_1.var_.characterEffect1076ui_story = var_576_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_576_2 = 0.2

			if var_576_1 <= arg_573_1.time_ and arg_573_1.time_ < var_576_1 + var_576_2 then
				local var_576_3 = (arg_573_1.time_ - var_576_1) / var_576_2

				if arg_573_1.var_.characterEffect1076ui_story then
					arg_573_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_573_1.time_ >= var_576_1 + var_576_2 and arg_573_1.time_ < var_576_1 + var_576_2 + arg_576_0 and arg_573_1.var_.characterEffect1076ui_story then
				arg_573_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_576_4 = 0
			local var_576_5 = 0.825

			if var_576_4 < arg_573_1.time_ and arg_573_1.time_ <= var_576_4 + arg_576_0 then
				arg_573_1.talkMaxDuration = 0
				arg_573_1.dialogCg_.alpha = 1

				arg_573_1.dialog_:SetActive(true)
				SetActive(arg_573_1.leftNameGo_, true)

				local var_576_6 = arg_573_1:FormatText(StoryNameCfg[389].name)

				arg_573_1.leftNameTxt_.text = var_576_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_573_1.leftNameTxt_.transform)

				arg_573_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_573_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_573_1:RecordName(arg_573_1.leftNameTxt_.text)
				SetActive(arg_573_1.iconTrs_.gameObject, false)
				arg_573_1.callingController_:SetSelectedState("normal")

				local var_576_7 = arg_573_1:GetWordFromCfg(120431140)
				local var_576_8 = arg_573_1:FormatText(var_576_7.content)

				arg_573_1.text_.text = var_576_8

				LuaForUtil.ClearLinePrefixSymbol(arg_573_1.text_)

				local var_576_9 = 33
				local var_576_10 = utf8.len(var_576_8)
				local var_576_11 = var_576_9 <= 0 and var_576_5 or var_576_5 * (var_576_10 / var_576_9)

				if var_576_11 > 0 and var_576_5 < var_576_11 then
					arg_573_1.talkMaxDuration = var_576_11

					if var_576_11 + var_576_4 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_11 + var_576_4
					end
				end

				arg_573_1.text_.text = var_576_8
				arg_573_1.typewritter.percent = 0

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431140", "story_v_out_120431.awb") ~= 0 then
					local var_576_12 = manager.audio:GetVoiceLength("story_v_out_120431", "120431140", "story_v_out_120431.awb") / 1000

					if var_576_12 + var_576_4 > arg_573_1.duration_ then
						arg_573_1.duration_ = var_576_12 + var_576_4
					end

					if var_576_7.prefab_name ~= "" and arg_573_1.actors_[var_576_7.prefab_name] ~= nil then
						local var_576_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_573_1.actors_[var_576_7.prefab_name].transform, "story_v_out_120431", "120431140", "story_v_out_120431.awb")

						arg_573_1:RecordAudio("120431140", var_576_13)
						arg_573_1:RecordAudio("120431140", var_576_13)
					else
						arg_573_1:AudioAction("play", "voice", "story_v_out_120431", "120431140", "story_v_out_120431.awb")
					end

					arg_573_1:RecordHistoryTalkVoice("story_v_out_120431", "120431140", "story_v_out_120431.awb")
				end

				arg_573_1:RecordContent(arg_573_1.text_.text)
			end

			local var_576_14 = math.max(var_576_5, arg_573_1.talkMaxDuration)

			if var_576_4 <= arg_573_1.time_ and arg_573_1.time_ < var_576_4 + var_576_14 then
				arg_573_1.typewritter.percent = (arg_573_1.time_ - var_576_4) / var_576_14

				arg_573_1.typewritter:SetDirty()
			end

			if arg_573_1.time_ >= var_576_4 + var_576_14 and arg_573_1.time_ < var_576_4 + var_576_14 + arg_576_0 then
				arg_573_1.typewritter.percent = 1

				arg_573_1.typewritter:SetDirty()
				arg_573_1:ShowNextGo(true)
			end
		end
	end,
	Play120431141 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 120431141
		arg_577_1.duration_ = 3.3

		local var_577_0 = {
			zh = 2.566,
			ja = 3.3
		}
		local var_577_1 = manager.audio:GetLocalizationFlag()

		if var_577_0[var_577_1] ~= nil then
			arg_577_1.duration_ = var_577_0[var_577_1]
		end

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play120431142(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = arg_577_1.actors_["1084ui_story"]
			local var_580_1 = 0

			if var_580_1 < arg_577_1.time_ and arg_577_1.time_ <= var_580_1 + arg_580_0 and arg_577_1.var_.characterEffect1084ui_story == nil then
				arg_577_1.var_.characterEffect1084ui_story = var_580_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_2 = 0.2

			if var_580_1 <= arg_577_1.time_ and arg_577_1.time_ < var_580_1 + var_580_2 then
				local var_580_3 = (arg_577_1.time_ - var_580_1) / var_580_2

				if arg_577_1.var_.characterEffect1084ui_story then
					arg_577_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_577_1.time_ >= var_580_1 + var_580_2 and arg_577_1.time_ < var_580_1 + var_580_2 + arg_580_0 and arg_577_1.var_.characterEffect1084ui_story then
				arg_577_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_580_4 = 0

			if var_580_4 < arg_577_1.time_ and arg_577_1.time_ <= var_580_4 + arg_580_0 then
				arg_577_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_580_5 = arg_577_1.actors_["1076ui_story"]
			local var_580_6 = 0

			if var_580_6 < arg_577_1.time_ and arg_577_1.time_ <= var_580_6 + arg_580_0 and arg_577_1.var_.characterEffect1076ui_story == nil then
				arg_577_1.var_.characterEffect1076ui_story = var_580_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_7 = 0.2

			if var_580_6 <= arg_577_1.time_ and arg_577_1.time_ < var_580_6 + var_580_7 then
				local var_580_8 = (arg_577_1.time_ - var_580_6) / var_580_7

				if arg_577_1.var_.characterEffect1076ui_story then
					local var_580_9 = Mathf.Lerp(0, 0.5, var_580_8)

					arg_577_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_577_1.var_.characterEffect1076ui_story.fillRatio = var_580_9
				end
			end

			if arg_577_1.time_ >= var_580_6 + var_580_7 and arg_577_1.time_ < var_580_6 + var_580_7 + arg_580_0 and arg_577_1.var_.characterEffect1076ui_story then
				local var_580_10 = 0.5

				arg_577_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_577_1.var_.characterEffect1076ui_story.fillRatio = var_580_10
			end

			local var_580_11 = 0

			if var_580_11 < arg_577_1.time_ and arg_577_1.time_ <= var_580_11 + arg_580_0 then
				arg_577_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_580_12 = 0
			local var_580_13 = 0.125

			if var_580_12 < arg_577_1.time_ and arg_577_1.time_ <= var_580_12 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_14 = arg_577_1:FormatText(StoryNameCfg[6].name)

				arg_577_1.leftNameTxt_.text = var_580_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_15 = arg_577_1:GetWordFromCfg(120431141)
				local var_580_16 = arg_577_1:FormatText(var_580_15.content)

				arg_577_1.text_.text = var_580_16

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_17 = 5
				local var_580_18 = utf8.len(var_580_16)
				local var_580_19 = var_580_17 <= 0 and var_580_13 or var_580_13 * (var_580_18 / var_580_17)

				if var_580_19 > 0 and var_580_13 < var_580_19 then
					arg_577_1.talkMaxDuration = var_580_19

					if var_580_19 + var_580_12 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_19 + var_580_12
					end
				end

				arg_577_1.text_.text = var_580_16
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431141", "story_v_out_120431.awb") ~= 0 then
					local var_580_20 = manager.audio:GetVoiceLength("story_v_out_120431", "120431141", "story_v_out_120431.awb") / 1000

					if var_580_20 + var_580_12 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_20 + var_580_12
					end

					if var_580_15.prefab_name ~= "" and arg_577_1.actors_[var_580_15.prefab_name] ~= nil then
						local var_580_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_15.prefab_name].transform, "story_v_out_120431", "120431141", "story_v_out_120431.awb")

						arg_577_1:RecordAudio("120431141", var_580_21)
						arg_577_1:RecordAudio("120431141", var_580_21)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_out_120431", "120431141", "story_v_out_120431.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_out_120431", "120431141", "story_v_out_120431.awb")
				end

				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_22 = math.max(var_580_13, arg_577_1.talkMaxDuration)

			if var_580_12 <= arg_577_1.time_ and arg_577_1.time_ < var_580_12 + var_580_22 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_12) / var_580_22

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_12 + var_580_22 and arg_577_1.time_ < var_580_12 + var_580_22 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play120431142 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 120431142
		arg_581_1.duration_ = 13.333

		local var_581_0 = {
			zh = 6.033,
			ja = 13.333
		}
		local var_581_1 = manager.audio:GetLocalizationFlag()

		if var_581_0[var_581_1] ~= nil then
			arg_581_1.duration_ = var_581_0[var_581_1]
		end

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play120431143(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = arg_581_1.actors_["1076ui_story"]
			local var_584_1 = 0

			if var_584_1 < arg_581_1.time_ and arg_581_1.time_ <= var_584_1 + arg_584_0 and arg_581_1.var_.characterEffect1076ui_story == nil then
				arg_581_1.var_.characterEffect1076ui_story = var_584_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_2 = 0.2

			if var_584_1 <= arg_581_1.time_ and arg_581_1.time_ < var_584_1 + var_584_2 then
				local var_584_3 = (arg_581_1.time_ - var_584_1) / var_584_2

				if arg_581_1.var_.characterEffect1076ui_story then
					arg_581_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_581_1.time_ >= var_584_1 + var_584_2 and arg_581_1.time_ < var_584_1 + var_584_2 + arg_584_0 and arg_581_1.var_.characterEffect1076ui_story then
				arg_581_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_584_4 = arg_581_1.actors_["1084ui_story"]
			local var_584_5 = 0

			if var_584_5 < arg_581_1.time_ and arg_581_1.time_ <= var_584_5 + arg_584_0 and arg_581_1.var_.characterEffect1084ui_story == nil then
				arg_581_1.var_.characterEffect1084ui_story = var_584_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_584_6 = 0.2

			if var_584_5 <= arg_581_1.time_ and arg_581_1.time_ < var_584_5 + var_584_6 then
				local var_584_7 = (arg_581_1.time_ - var_584_5) / var_584_6

				if arg_581_1.var_.characterEffect1084ui_story then
					local var_584_8 = Mathf.Lerp(0, 0.5, var_584_7)

					arg_581_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_581_1.var_.characterEffect1084ui_story.fillRatio = var_584_8
				end
			end

			if arg_581_1.time_ >= var_584_5 + var_584_6 and arg_581_1.time_ < var_584_5 + var_584_6 + arg_584_0 and arg_581_1.var_.characterEffect1084ui_story then
				local var_584_9 = 0.5

				arg_581_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_581_1.var_.characterEffect1084ui_story.fillRatio = var_584_9
			end

			local var_584_10 = 0
			local var_584_11 = 0.575

			if var_584_10 < arg_581_1.time_ and arg_581_1.time_ <= var_584_10 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_12 = arg_581_1:FormatText(StoryNameCfg[389].name)

				arg_581_1.leftNameTxt_.text = var_584_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, false)
				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_13 = arg_581_1:GetWordFromCfg(120431142)
				local var_584_14 = arg_581_1:FormatText(var_584_13.content)

				arg_581_1.text_.text = var_584_14

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_15 = 23
				local var_584_16 = utf8.len(var_584_14)
				local var_584_17 = var_584_15 <= 0 and var_584_11 or var_584_11 * (var_584_16 / var_584_15)

				if var_584_17 > 0 and var_584_11 < var_584_17 then
					arg_581_1.talkMaxDuration = var_584_17

					if var_584_17 + var_584_10 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_17 + var_584_10
					end
				end

				arg_581_1.text_.text = var_584_14
				arg_581_1.typewritter.percent = 0

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431142", "story_v_out_120431.awb") ~= 0 then
					local var_584_18 = manager.audio:GetVoiceLength("story_v_out_120431", "120431142", "story_v_out_120431.awb") / 1000

					if var_584_18 + var_584_10 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_18 + var_584_10
					end

					if var_584_13.prefab_name ~= "" and arg_581_1.actors_[var_584_13.prefab_name] ~= nil then
						local var_584_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_581_1.actors_[var_584_13.prefab_name].transform, "story_v_out_120431", "120431142", "story_v_out_120431.awb")

						arg_581_1:RecordAudio("120431142", var_584_19)
						arg_581_1:RecordAudio("120431142", var_584_19)
					else
						arg_581_1:AudioAction("play", "voice", "story_v_out_120431", "120431142", "story_v_out_120431.awb")
					end

					arg_581_1:RecordHistoryTalkVoice("story_v_out_120431", "120431142", "story_v_out_120431.awb")
				end

				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_20 = math.max(var_584_11, arg_581_1.talkMaxDuration)

			if var_584_10 <= arg_581_1.time_ and arg_581_1.time_ < var_584_10 + var_584_20 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_10) / var_584_20

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_10 + var_584_20 and arg_581_1.time_ < var_584_10 + var_584_20 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play120431143 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 120431143
		arg_585_1.duration_ = 2.266

		local var_585_0 = {
			zh = 1.999999999999,
			ja = 2.266
		}
		local var_585_1 = manager.audio:GetLocalizationFlag()

		if var_585_0[var_585_1] ~= nil then
			arg_585_1.duration_ = var_585_0[var_585_1]
		end

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play120431144(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = arg_585_1.actors_["1076ui_story"]
			local var_588_1 = 0

			if var_588_1 < arg_585_1.time_ and arg_585_1.time_ <= var_588_1 + arg_588_0 and arg_585_1.var_.characterEffect1076ui_story == nil then
				arg_585_1.var_.characterEffect1076ui_story = var_588_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_2 = 0.2

			if var_588_1 <= arg_585_1.time_ and arg_585_1.time_ < var_588_1 + var_588_2 then
				local var_588_3 = (arg_585_1.time_ - var_588_1) / var_588_2

				if arg_585_1.var_.characterEffect1076ui_story then
					local var_588_4 = Mathf.Lerp(0, 0.5, var_588_3)

					arg_585_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_585_1.var_.characterEffect1076ui_story.fillRatio = var_588_4
				end
			end

			if arg_585_1.time_ >= var_588_1 + var_588_2 and arg_585_1.time_ < var_588_1 + var_588_2 + arg_588_0 and arg_585_1.var_.characterEffect1076ui_story then
				local var_588_5 = 0.5

				arg_585_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_585_1.var_.characterEffect1076ui_story.fillRatio = var_588_5
			end

			local var_588_6 = arg_585_1.actors_["1084ui_story"]
			local var_588_7 = 0

			if var_588_7 < arg_585_1.time_ and arg_585_1.time_ <= var_588_7 + arg_588_0 and arg_585_1.var_.characterEffect1084ui_story == nil then
				arg_585_1.var_.characterEffect1084ui_story = var_588_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_588_8 = 0.2

			if var_588_7 <= arg_585_1.time_ and arg_585_1.time_ < var_588_7 + var_588_8 then
				local var_588_9 = (arg_585_1.time_ - var_588_7) / var_588_8

				if arg_585_1.var_.characterEffect1084ui_story then
					arg_585_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_585_1.time_ >= var_588_7 + var_588_8 and arg_585_1.time_ < var_588_7 + var_588_8 + arg_588_0 and arg_585_1.var_.characterEffect1084ui_story then
				arg_585_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_588_10 = 0

			if var_588_10 < arg_585_1.time_ and arg_585_1.time_ <= var_588_10 + arg_588_0 then
				arg_585_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_588_11 = 0
			local var_588_12 = 0.15

			if var_588_11 < arg_585_1.time_ and arg_585_1.time_ <= var_588_11 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, true)

				local var_588_13 = arg_585_1:FormatText(StoryNameCfg[6].name)

				arg_585_1.leftNameTxt_.text = var_588_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_585_1.leftNameTxt_.transform)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1.leftNameTxt_.text)
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_14 = arg_585_1:GetWordFromCfg(120431143)
				local var_588_15 = arg_585_1:FormatText(var_588_14.content)

				arg_585_1.text_.text = var_588_15

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_16 = 6
				local var_588_17 = utf8.len(var_588_15)
				local var_588_18 = var_588_16 <= 0 and var_588_12 or var_588_12 * (var_588_17 / var_588_16)

				if var_588_18 > 0 and var_588_12 < var_588_18 then
					arg_585_1.talkMaxDuration = var_588_18

					if var_588_18 + var_588_11 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_18 + var_588_11
					end
				end

				arg_585_1.text_.text = var_588_15
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431143", "story_v_out_120431.awb") ~= 0 then
					local var_588_19 = manager.audio:GetVoiceLength("story_v_out_120431", "120431143", "story_v_out_120431.awb") / 1000

					if var_588_19 + var_588_11 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_19 + var_588_11
					end

					if var_588_14.prefab_name ~= "" and arg_585_1.actors_[var_588_14.prefab_name] ~= nil then
						local var_588_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_585_1.actors_[var_588_14.prefab_name].transform, "story_v_out_120431", "120431143", "story_v_out_120431.awb")

						arg_585_1:RecordAudio("120431143", var_588_20)
						arg_585_1:RecordAudio("120431143", var_588_20)
					else
						arg_585_1:AudioAction("play", "voice", "story_v_out_120431", "120431143", "story_v_out_120431.awb")
					end

					arg_585_1:RecordHistoryTalkVoice("story_v_out_120431", "120431143", "story_v_out_120431.awb")
				end

				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_21 = math.max(var_588_12, arg_585_1.talkMaxDuration)

			if var_588_11 <= arg_585_1.time_ and arg_585_1.time_ < var_588_11 + var_588_21 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_11) / var_588_21

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_11 + var_588_21 and arg_585_1.time_ < var_588_11 + var_588_21 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play120431144 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 120431144
		arg_589_1.duration_ = 5

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play120431145(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = 0
			local var_592_1 = 0.3

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, false)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_2 = arg_589_1:GetWordFromCfg(120431144)
				local var_592_3 = arg_589_1:FormatText(var_592_2.content)

				arg_589_1.text_.text = var_592_3

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_4 = 12
				local var_592_5 = utf8.len(var_592_3)
				local var_592_6 = var_592_4 <= 0 and var_592_1 or var_592_1 * (var_592_5 / var_592_4)

				if var_592_6 > 0 and var_592_1 < var_592_6 then
					arg_589_1.talkMaxDuration = var_592_6

					if var_592_6 + var_592_0 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_6 + var_592_0
					end
				end

				arg_589_1.text_.text = var_592_3
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_7 = math.max(var_592_1, arg_589_1.talkMaxDuration)

			if var_592_0 <= arg_589_1.time_ and arg_589_1.time_ < var_592_0 + var_592_7 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_0) / var_592_7

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_0 + var_592_7 and arg_589_1.time_ < var_592_0 + var_592_7 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play120431145 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 120431145
		arg_593_1.duration_ = 9

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play120431146(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = "XH0206"

			if arg_593_1.bgs_[var_596_0] == nil then
				local var_596_1 = Object.Instantiate(arg_593_1.paintGo_)

				var_596_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_596_0)
				var_596_1.name = var_596_0
				var_596_1.transform.parent = arg_593_1.stage_.transform
				var_596_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_593_1.bgs_[var_596_0] = var_596_1
			end

			local var_596_2 = 2

			if var_596_2 < arg_593_1.time_ and arg_593_1.time_ <= var_596_2 + arg_596_0 then
				local var_596_3 = manager.ui.mainCamera.transform.localPosition
				local var_596_4 = Vector3.New(0, 0, 10) + Vector3.New(var_596_3.x, var_596_3.y, 0)
				local var_596_5 = arg_593_1.bgs_.XH0206

				var_596_5.transform.localPosition = var_596_4
				var_596_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_596_6 = var_596_5:GetComponent("SpriteRenderer")

				if var_596_6 and var_596_6.sprite then
					local var_596_7 = (var_596_5.transform.localPosition - var_596_3).z
					local var_596_8 = manager.ui.mainCameraCom_
					local var_596_9 = 2 * var_596_7 * Mathf.Tan(var_596_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_596_10 = var_596_9 * var_596_8.aspect
					local var_596_11 = var_596_6.sprite.bounds.size.x
					local var_596_12 = var_596_6.sprite.bounds.size.y
					local var_596_13 = var_596_10 / var_596_11
					local var_596_14 = var_596_9 / var_596_12
					local var_596_15 = var_596_14 < var_596_13 and var_596_13 or var_596_14

					var_596_5.transform.localScale = Vector3.New(var_596_15, var_596_15, 0)
				end

				for iter_596_0, iter_596_1 in pairs(arg_593_1.bgs_) do
					if iter_596_0 ~= "XH0206" then
						iter_596_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_596_16 = 2

			if var_596_16 < arg_593_1.time_ and arg_593_1.time_ <= var_596_16 + arg_596_0 then
				arg_593_1.mask_.enabled = true
				arg_593_1.mask_.raycastTarget = true

				arg_593_1:SetGaussion(false)
			end

			local var_596_17 = 2

			if var_596_16 <= arg_593_1.time_ and arg_593_1.time_ < var_596_16 + var_596_17 then
				local var_596_18 = (arg_593_1.time_ - var_596_16) / var_596_17
				local var_596_19 = Color.New(0, 0, 0)

				var_596_19.a = Mathf.Lerp(1, 0, var_596_18)
				arg_593_1.mask_.color = var_596_19
			end

			if arg_593_1.time_ >= var_596_16 + var_596_17 and arg_593_1.time_ < var_596_16 + var_596_17 + arg_596_0 then
				local var_596_20 = Color.New(0, 0, 0)
				local var_596_21 = 0

				arg_593_1.mask_.enabled = false
				var_596_20.a = var_596_21
				arg_593_1.mask_.color = var_596_20
			end

			local var_596_22 = 0

			if var_596_22 < arg_593_1.time_ and arg_593_1.time_ <= var_596_22 + arg_596_0 then
				arg_593_1.mask_.enabled = true
				arg_593_1.mask_.raycastTarget = true

				arg_593_1:SetGaussion(false)
			end

			local var_596_23 = 2

			if var_596_22 <= arg_593_1.time_ and arg_593_1.time_ < var_596_22 + var_596_23 then
				local var_596_24 = (arg_593_1.time_ - var_596_22) / var_596_23
				local var_596_25 = Color.New(0, 0, 0)

				var_596_25.a = Mathf.Lerp(0, 1, var_596_24)
				arg_593_1.mask_.color = var_596_25
			end

			if arg_593_1.time_ >= var_596_22 + var_596_23 and arg_593_1.time_ < var_596_22 + var_596_23 + arg_596_0 then
				local var_596_26 = Color.New(0, 0, 0)

				var_596_26.a = 1
				arg_593_1.mask_.color = var_596_26
			end

			local var_596_27 = arg_593_1.actors_["1076ui_story"].transform
			local var_596_28 = 1.966

			if var_596_28 < arg_593_1.time_ and arg_593_1.time_ <= var_596_28 + arg_596_0 then
				arg_593_1.var_.moveOldPos1076ui_story = var_596_27.localPosition
			end

			local var_596_29 = 0.001

			if var_596_28 <= arg_593_1.time_ and arg_593_1.time_ < var_596_28 + var_596_29 then
				local var_596_30 = (arg_593_1.time_ - var_596_28) / var_596_29
				local var_596_31 = Vector3.New(0, 100, 0)

				var_596_27.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPos1076ui_story, var_596_31, var_596_30)

				local var_596_32 = manager.ui.mainCamera.transform.position - var_596_27.position

				var_596_27.forward = Vector3.New(var_596_32.x, var_596_32.y, var_596_32.z)

				local var_596_33 = var_596_27.localEulerAngles

				var_596_33.z = 0
				var_596_33.x = 0
				var_596_27.localEulerAngles = var_596_33
			end

			if arg_593_1.time_ >= var_596_28 + var_596_29 and arg_593_1.time_ < var_596_28 + var_596_29 + arg_596_0 then
				var_596_27.localPosition = Vector3.New(0, 100, 0)

				local var_596_34 = manager.ui.mainCamera.transform.position - var_596_27.position

				var_596_27.forward = Vector3.New(var_596_34.x, var_596_34.y, var_596_34.z)

				local var_596_35 = var_596_27.localEulerAngles

				var_596_35.z = 0
				var_596_35.x = 0
				var_596_27.localEulerAngles = var_596_35
			end

			local var_596_36 = arg_593_1.actors_["1084ui_story"].transform
			local var_596_37 = 1.966

			if var_596_37 < arg_593_1.time_ and arg_593_1.time_ <= var_596_37 + arg_596_0 then
				arg_593_1.var_.moveOldPos1084ui_story = var_596_36.localPosition
			end

			local var_596_38 = 0.001

			if var_596_37 <= arg_593_1.time_ and arg_593_1.time_ < var_596_37 + var_596_38 then
				local var_596_39 = (arg_593_1.time_ - var_596_37) / var_596_38
				local var_596_40 = Vector3.New(0, 100, 0)

				var_596_36.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPos1084ui_story, var_596_40, var_596_39)

				local var_596_41 = manager.ui.mainCamera.transform.position - var_596_36.position

				var_596_36.forward = Vector3.New(var_596_41.x, var_596_41.y, var_596_41.z)

				local var_596_42 = var_596_36.localEulerAngles

				var_596_42.z = 0
				var_596_42.x = 0
				var_596_36.localEulerAngles = var_596_42
			end

			if arg_593_1.time_ >= var_596_37 + var_596_38 and arg_593_1.time_ < var_596_37 + var_596_38 + arg_596_0 then
				var_596_36.localPosition = Vector3.New(0, 100, 0)

				local var_596_43 = manager.ui.mainCamera.transform.position - var_596_36.position

				var_596_36.forward = Vector3.New(var_596_43.x, var_596_43.y, var_596_43.z)

				local var_596_44 = var_596_36.localEulerAngles

				var_596_44.z = 0
				var_596_44.x = 0
				var_596_36.localEulerAngles = var_596_44
			end

			local var_596_45 = arg_593_1.bgs_.XH0206.transform
			local var_596_46 = 2

			if var_596_46 < arg_593_1.time_ and arg_593_1.time_ <= var_596_46 + arg_596_0 then
				arg_593_1.var_.moveOldPosXH0206 = var_596_45.localPosition
			end

			local var_596_47 = 0.001

			if var_596_46 <= arg_593_1.time_ and arg_593_1.time_ < var_596_46 + var_596_47 then
				local var_596_48 = (arg_593_1.time_ - var_596_46) / var_596_47
				local var_596_49 = Vector3.New(0, 1, 9.5)

				var_596_45.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPosXH0206, var_596_49, var_596_48)
			end

			if arg_593_1.time_ >= var_596_46 + var_596_47 and arg_593_1.time_ < var_596_46 + var_596_47 + arg_596_0 then
				var_596_45.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_596_50 = arg_593_1.bgs_.XH0206.transform
			local var_596_51 = 2.034

			if var_596_51 < arg_593_1.time_ and arg_593_1.time_ <= var_596_51 + arg_596_0 then
				arg_593_1.var_.moveOldPosXH0206 = var_596_50.localPosition
			end

			local var_596_52 = 4.5

			if var_596_51 <= arg_593_1.time_ and arg_593_1.time_ < var_596_51 + var_596_52 then
				local var_596_53 = (arg_593_1.time_ - var_596_51) / var_596_52
				local var_596_54 = Vector3.New(0, 1, 10)

				var_596_50.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPosXH0206, var_596_54, var_596_53)
			end

			if arg_593_1.time_ >= var_596_51 + var_596_52 and arg_593_1.time_ < var_596_51 + var_596_52 + arg_596_0 then
				var_596_50.localPosition = Vector3.New(0, 1, 10)
			end

			local var_596_55 = 4

			if var_596_55 < arg_593_1.time_ and arg_593_1.time_ <= var_596_55 + arg_596_0 then
				arg_593_1.allBtn_.enabled = false
			end

			local var_596_56 = 2.534

			if arg_593_1.time_ >= var_596_55 + var_596_56 and arg_593_1.time_ < var_596_55 + var_596_56 + arg_596_0 then
				arg_593_1.allBtn_.enabled = true
			end

			if arg_593_1.frameCnt_ <= 1 then
				arg_593_1.dialog_:SetActive(false)
			end

			local var_596_57 = 4
			local var_596_58 = 1.075

			if var_596_57 < arg_593_1.time_ and arg_593_1.time_ <= var_596_57 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0

				arg_593_1.dialog_:SetActive(true)

				local var_596_59 = LeanTween.value(arg_593_1.dialog_, 0, 1, 0.3)

				var_596_59:setOnUpdate(LuaHelper.FloatAction(function(arg_597_0)
					arg_593_1.dialogCg_.alpha = arg_597_0
				end))
				var_596_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_593_1.dialog_)
					var_596_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_593_1.duration_ = arg_593_1.duration_ + 0.3

				SetActive(arg_593_1.leftNameGo_, false)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_60 = arg_593_1:GetWordFromCfg(120431145)
				local var_596_61 = arg_593_1:FormatText(var_596_60.content)

				arg_593_1.text_.text = var_596_61

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_62 = 43
				local var_596_63 = utf8.len(var_596_61)
				local var_596_64 = var_596_62 <= 0 and var_596_58 or var_596_58 * (var_596_63 / var_596_62)

				if var_596_64 > 0 and var_596_58 < var_596_64 then
					arg_593_1.talkMaxDuration = var_596_64
					var_596_57 = var_596_57 + 0.3

					if var_596_64 + var_596_57 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_64 + var_596_57
					end
				end

				arg_593_1.text_.text = var_596_61
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)
				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_65 = var_596_57 + 0.3
			local var_596_66 = math.max(var_596_58, arg_593_1.talkMaxDuration)

			if var_596_65 <= arg_593_1.time_ and arg_593_1.time_ < var_596_65 + var_596_66 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_65) / var_596_66

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_65 + var_596_66 and arg_593_1.time_ < var_596_65 + var_596_66 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play120431146 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 120431146
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play120431147(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 0.9

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, false)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_2 = arg_599_1:GetWordFromCfg(120431146)
				local var_602_3 = arg_599_1:FormatText(var_602_2.content)

				arg_599_1.text_.text = var_602_3

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_4 = 36
				local var_602_5 = utf8.len(var_602_3)
				local var_602_6 = var_602_4 <= 0 and var_602_1 or var_602_1 * (var_602_5 / var_602_4)

				if var_602_6 > 0 and var_602_1 < var_602_6 then
					arg_599_1.talkMaxDuration = var_602_6

					if var_602_6 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_6 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_3
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_7 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_7 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_7

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_7 and arg_599_1.time_ < var_602_0 + var_602_7 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play120431147 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 120431147
		arg_603_1.duration_ = 5.2

		local var_603_0 = {
			zh = 1.433,
			ja = 5.2
		}
		local var_603_1 = manager.audio:GetLocalizationFlag()

		if var_603_0[var_603_1] ~= nil then
			arg_603_1.duration_ = var_603_0[var_603_1]
		end

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play120431148(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.125

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_2 = arg_603_1:FormatText(StoryNameCfg[389].name)

				arg_603_1.leftNameTxt_.text = var_606_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_3 = arg_603_1:GetWordFromCfg(120431147)
				local var_606_4 = arg_603_1:FormatText(var_606_3.content)

				arg_603_1.text_.text = var_606_4

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_5 = 5
				local var_606_6 = utf8.len(var_606_4)
				local var_606_7 = var_606_5 <= 0 and var_606_1 or var_606_1 * (var_606_6 / var_606_5)

				if var_606_7 > 0 and var_606_1 < var_606_7 then
					arg_603_1.talkMaxDuration = var_606_7

					if var_606_7 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_7 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_4
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431147", "story_v_out_120431.awb") ~= 0 then
					local var_606_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431147", "story_v_out_120431.awb") / 1000

					if var_606_8 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_8 + var_606_0
					end

					if var_606_3.prefab_name ~= "" and arg_603_1.actors_[var_606_3.prefab_name] ~= nil then
						local var_606_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_3.prefab_name].transform, "story_v_out_120431", "120431147", "story_v_out_120431.awb")

						arg_603_1:RecordAudio("120431147", var_606_9)
						arg_603_1:RecordAudio("120431147", var_606_9)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_out_120431", "120431147", "story_v_out_120431.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_out_120431", "120431147", "story_v_out_120431.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_10 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_10 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_10

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_10 and arg_603_1.time_ < var_606_0 + var_606_10 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play120431148 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 120431148
		arg_607_1.duration_ = 8.333

		local var_607_0 = {
			zh = 8.333,
			ja = 8.266
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play120431149(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.675

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_2 = arg_607_1:FormatText(StoryNameCfg[6].name)

				arg_607_1.leftNameTxt_.text = var_610_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_3 = arg_607_1:GetWordFromCfg(120431148)
				local var_610_4 = arg_607_1:FormatText(var_610_3.content)

				arg_607_1.text_.text = var_610_4

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_5 = 27
				local var_610_6 = utf8.len(var_610_4)
				local var_610_7 = var_610_5 <= 0 and var_610_1 or var_610_1 * (var_610_6 / var_610_5)

				if var_610_7 > 0 and var_610_1 < var_610_7 then
					arg_607_1.talkMaxDuration = var_610_7

					if var_610_7 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_7 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_4
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431148", "story_v_out_120431.awb") ~= 0 then
					local var_610_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431148", "story_v_out_120431.awb") / 1000

					if var_610_8 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_8 + var_610_0
					end

					if var_610_3.prefab_name ~= "" and arg_607_1.actors_[var_610_3.prefab_name] ~= nil then
						local var_610_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_3.prefab_name].transform, "story_v_out_120431", "120431148", "story_v_out_120431.awb")

						arg_607_1:RecordAudio("120431148", var_610_9)
						arg_607_1:RecordAudio("120431148", var_610_9)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_120431", "120431148", "story_v_out_120431.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_120431", "120431148", "story_v_out_120431.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_10 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_10 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_10

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_10 and arg_607_1.time_ < var_610_0 + var_610_10 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play120431149 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 120431149
		arg_611_1.duration_ = 6.166

		local var_611_0 = {
			zh = 1.8,
			ja = 6.166
		}
		local var_611_1 = manager.audio:GetLocalizationFlag()

		if var_611_0[var_611_1] ~= nil then
			arg_611_1.duration_ = var_611_0[var_611_1]
		end

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play120431150(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.125

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_2 = arg_611_1:FormatText(StoryNameCfg[389].name)

				arg_611_1.leftNameTxt_.text = var_614_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_3 = arg_611_1:GetWordFromCfg(120431149)
				local var_614_4 = arg_611_1:FormatText(var_614_3.content)

				arg_611_1.text_.text = var_614_4

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_5 = 5
				local var_614_6 = utf8.len(var_614_4)
				local var_614_7 = var_614_5 <= 0 and var_614_1 or var_614_1 * (var_614_6 / var_614_5)

				if var_614_7 > 0 and var_614_1 < var_614_7 then
					arg_611_1.talkMaxDuration = var_614_7

					if var_614_7 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_7 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_4
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431149", "story_v_out_120431.awb") ~= 0 then
					local var_614_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431149", "story_v_out_120431.awb") / 1000

					if var_614_8 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_8 + var_614_0
					end

					if var_614_3.prefab_name ~= "" and arg_611_1.actors_[var_614_3.prefab_name] ~= nil then
						local var_614_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_3.prefab_name].transform, "story_v_out_120431", "120431149", "story_v_out_120431.awb")

						arg_611_1:RecordAudio("120431149", var_614_9)
						arg_611_1:RecordAudio("120431149", var_614_9)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_120431", "120431149", "story_v_out_120431.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_120431", "120431149", "story_v_out_120431.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_10 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_10 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_10

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_10 and arg_611_1.time_ < var_614_0 + var_614_10 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play120431150 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 120431150
		arg_615_1.duration_ = 7.566

		local var_615_0 = {
			zh = 7.333,
			ja = 7.566
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play120431151(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 0.575

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_2 = arg_615_1:FormatText(StoryNameCfg[6].name)

				arg_615_1.leftNameTxt_.text = var_618_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_3 = arg_615_1:GetWordFromCfg(120431150)
				local var_618_4 = arg_615_1:FormatText(var_618_3.content)

				arg_615_1.text_.text = var_618_4

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_5 = 23
				local var_618_6 = utf8.len(var_618_4)
				local var_618_7 = var_618_5 <= 0 and var_618_1 or var_618_1 * (var_618_6 / var_618_5)

				if var_618_7 > 0 and var_618_1 < var_618_7 then
					arg_615_1.talkMaxDuration = var_618_7

					if var_618_7 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_7 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_4
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431150", "story_v_out_120431.awb") ~= 0 then
					local var_618_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431150", "story_v_out_120431.awb") / 1000

					if var_618_8 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_8 + var_618_0
					end

					if var_618_3.prefab_name ~= "" and arg_615_1.actors_[var_618_3.prefab_name] ~= nil then
						local var_618_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_3.prefab_name].transform, "story_v_out_120431", "120431150", "story_v_out_120431.awb")

						arg_615_1:RecordAudio("120431150", var_618_9)
						arg_615_1:RecordAudio("120431150", var_618_9)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_120431", "120431150", "story_v_out_120431.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_120431", "120431150", "story_v_out_120431.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_10 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_10 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_10

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_10 and arg_615_1.time_ < var_618_0 + var_618_10 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play120431151 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 120431151
		arg_619_1.duration_ = 10.966

		local var_619_0 = {
			zh = 8.266,
			ja = 10.966
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play120431152(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.9

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[6].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, false)
				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(120431151)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 36
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431151", "story_v_out_120431.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431151", "story_v_out_120431.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_out_120431", "120431151", "story_v_out_120431.awb")

						arg_619_1:RecordAudio("120431151", var_622_9)
						arg_619_1:RecordAudio("120431151", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_120431", "120431151", "story_v_out_120431.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_120431", "120431151", "story_v_out_120431.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_10 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_10 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_10

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_10 and arg_619_1.time_ < var_622_0 + var_622_10 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play120431152 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 120431152
		arg_623_1.duration_ = 14.366

		local var_623_0 = {
			zh = 11.666,
			ja = 14.366
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play120431153(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = 0
			local var_626_1 = 1.175

			if var_626_0 < arg_623_1.time_ and arg_623_1.time_ <= var_626_0 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_2 = arg_623_1:FormatText(StoryNameCfg[6].name)

				arg_623_1.leftNameTxt_.text = var_626_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_3 = arg_623_1:GetWordFromCfg(120431152)
				local var_626_4 = arg_623_1:FormatText(var_626_3.content)

				arg_623_1.text_.text = var_626_4

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_5 = 47
				local var_626_6 = utf8.len(var_626_4)
				local var_626_7 = var_626_5 <= 0 and var_626_1 or var_626_1 * (var_626_6 / var_626_5)

				if var_626_7 > 0 and var_626_1 < var_626_7 then
					arg_623_1.talkMaxDuration = var_626_7

					if var_626_7 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_7 + var_626_0
					end
				end

				arg_623_1.text_.text = var_626_4
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431152", "story_v_out_120431.awb") ~= 0 then
					local var_626_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431152", "story_v_out_120431.awb") / 1000

					if var_626_8 + var_626_0 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_8 + var_626_0
					end

					if var_626_3.prefab_name ~= "" and arg_623_1.actors_[var_626_3.prefab_name] ~= nil then
						local var_626_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_3.prefab_name].transform, "story_v_out_120431", "120431152", "story_v_out_120431.awb")

						arg_623_1:RecordAudio("120431152", var_626_9)
						arg_623_1:RecordAudio("120431152", var_626_9)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_120431", "120431152", "story_v_out_120431.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_120431", "120431152", "story_v_out_120431.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_10 = math.max(var_626_1, arg_623_1.talkMaxDuration)

			if var_626_0 <= arg_623_1.time_ and arg_623_1.time_ < var_626_0 + var_626_10 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_0) / var_626_10

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_0 + var_626_10 and arg_623_1.time_ < var_626_0 + var_626_10 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play120431153 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 120431153
		arg_627_1.duration_ = 2.1

		local var_627_0 = {
			zh = 1.433,
			ja = 2.1
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play120431154(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = 0
			local var_630_1 = 0.1

			if var_630_0 < arg_627_1.time_ and arg_627_1.time_ <= var_630_0 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_2 = arg_627_1:FormatText(StoryNameCfg[389].name)

				arg_627_1.leftNameTxt_.text = var_630_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_3 = arg_627_1:GetWordFromCfg(120431153)
				local var_630_4 = arg_627_1:FormatText(var_630_3.content)

				arg_627_1.text_.text = var_630_4

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_5 = 4
				local var_630_6 = utf8.len(var_630_4)
				local var_630_7 = var_630_5 <= 0 and var_630_1 or var_630_1 * (var_630_6 / var_630_5)

				if var_630_7 > 0 and var_630_1 < var_630_7 then
					arg_627_1.talkMaxDuration = var_630_7

					if var_630_7 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_7 + var_630_0
					end
				end

				arg_627_1.text_.text = var_630_4
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431153", "story_v_out_120431.awb") ~= 0 then
					local var_630_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431153", "story_v_out_120431.awb") / 1000

					if var_630_8 + var_630_0 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_8 + var_630_0
					end

					if var_630_3.prefab_name ~= "" and arg_627_1.actors_[var_630_3.prefab_name] ~= nil then
						local var_630_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_3.prefab_name].transform, "story_v_out_120431", "120431153", "story_v_out_120431.awb")

						arg_627_1:RecordAudio("120431153", var_630_9)
						arg_627_1:RecordAudio("120431153", var_630_9)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_120431", "120431153", "story_v_out_120431.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_120431", "120431153", "story_v_out_120431.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_10 = math.max(var_630_1, arg_627_1.talkMaxDuration)

			if var_630_0 <= arg_627_1.time_ and arg_627_1.time_ < var_630_0 + var_630_10 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_0) / var_630_10

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_0 + var_630_10 and arg_627_1.time_ < var_630_0 + var_630_10 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play120431154 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 120431154
		arg_631_1.duration_ = 4.533

		local var_631_0 = {
			zh = 4.166,
			ja = 4.533
		}
		local var_631_1 = manager.audio:GetLocalizationFlag()

		if var_631_0[var_631_1] ~= nil then
			arg_631_1.duration_ = var_631_0[var_631_1]
		end

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play120431155(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = 0
			local var_634_1 = 0.5

			if var_634_0 < arg_631_1.time_ and arg_631_1.time_ <= var_634_0 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_2 = arg_631_1:FormatText(StoryNameCfg[6].name)

				arg_631_1.leftNameTxt_.text = var_634_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_3 = arg_631_1:GetWordFromCfg(120431154)
				local var_634_4 = arg_631_1:FormatText(var_634_3.content)

				arg_631_1.text_.text = var_634_4

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_5 = 20
				local var_634_6 = utf8.len(var_634_4)
				local var_634_7 = var_634_5 <= 0 and var_634_1 or var_634_1 * (var_634_6 / var_634_5)

				if var_634_7 > 0 and var_634_1 < var_634_7 then
					arg_631_1.talkMaxDuration = var_634_7

					if var_634_7 + var_634_0 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_7 + var_634_0
					end
				end

				arg_631_1.text_.text = var_634_4
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431154", "story_v_out_120431.awb") ~= 0 then
					local var_634_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431154", "story_v_out_120431.awb") / 1000

					if var_634_8 + var_634_0 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_8 + var_634_0
					end

					if var_634_3.prefab_name ~= "" and arg_631_1.actors_[var_634_3.prefab_name] ~= nil then
						local var_634_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_631_1.actors_[var_634_3.prefab_name].transform, "story_v_out_120431", "120431154", "story_v_out_120431.awb")

						arg_631_1:RecordAudio("120431154", var_634_9)
						arg_631_1:RecordAudio("120431154", var_634_9)
					else
						arg_631_1:AudioAction("play", "voice", "story_v_out_120431", "120431154", "story_v_out_120431.awb")
					end

					arg_631_1:RecordHistoryTalkVoice("story_v_out_120431", "120431154", "story_v_out_120431.awb")
				end

				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_10 = math.max(var_634_1, arg_631_1.talkMaxDuration)

			if var_634_0 <= arg_631_1.time_ and arg_631_1.time_ < var_634_0 + var_634_10 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_0) / var_634_10

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_0 + var_634_10 and arg_631_1.time_ < var_634_0 + var_634_10 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play120431155 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 120431155
		arg_635_1.duration_ = 4

		local var_635_0 = {
			zh = 2.333,
			ja = 4
		}
		local var_635_1 = manager.audio:GetLocalizationFlag()

		if var_635_0[var_635_1] ~= nil then
			arg_635_1.duration_ = var_635_0[var_635_1]
		end

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play120431156(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = 0
			local var_638_1 = 0.25

			if var_638_0 < arg_635_1.time_ and arg_635_1.time_ <= var_638_0 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_2 = arg_635_1:FormatText(StoryNameCfg[389].name)

				arg_635_1.leftNameTxt_.text = var_638_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_3 = arg_635_1:GetWordFromCfg(120431155)
				local var_638_4 = arg_635_1:FormatText(var_638_3.content)

				arg_635_1.text_.text = var_638_4

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_5 = 10
				local var_638_6 = utf8.len(var_638_4)
				local var_638_7 = var_638_5 <= 0 and var_638_1 or var_638_1 * (var_638_6 / var_638_5)

				if var_638_7 > 0 and var_638_1 < var_638_7 then
					arg_635_1.talkMaxDuration = var_638_7

					if var_638_7 + var_638_0 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_7 + var_638_0
					end
				end

				arg_635_1.text_.text = var_638_4
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431155", "story_v_out_120431.awb") ~= 0 then
					local var_638_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431155", "story_v_out_120431.awb") / 1000

					if var_638_8 + var_638_0 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_8 + var_638_0
					end

					if var_638_3.prefab_name ~= "" and arg_635_1.actors_[var_638_3.prefab_name] ~= nil then
						local var_638_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_635_1.actors_[var_638_3.prefab_name].transform, "story_v_out_120431", "120431155", "story_v_out_120431.awb")

						arg_635_1:RecordAudio("120431155", var_638_9)
						arg_635_1:RecordAudio("120431155", var_638_9)
					else
						arg_635_1:AudioAction("play", "voice", "story_v_out_120431", "120431155", "story_v_out_120431.awb")
					end

					arg_635_1:RecordHistoryTalkVoice("story_v_out_120431", "120431155", "story_v_out_120431.awb")
				end

				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_10 = math.max(var_638_1, arg_635_1.talkMaxDuration)

			if var_638_0 <= arg_635_1.time_ and arg_635_1.time_ < var_638_0 + var_638_10 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_0) / var_638_10

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_0 + var_638_10 and arg_635_1.time_ < var_638_0 + var_638_10 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play120431156 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 120431156
		arg_639_1.duration_ = 16.7

		local var_639_0 = {
			zh = 10.133,
			ja = 16.7
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play120431157(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = 0
			local var_642_1 = 0.975

			if var_642_0 < arg_639_1.time_ and arg_639_1.time_ <= var_642_0 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_2 = arg_639_1:FormatText(StoryNameCfg[389].name)

				arg_639_1.leftNameTxt_.text = var_642_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_3 = arg_639_1:GetWordFromCfg(120431156)
				local var_642_4 = arg_639_1:FormatText(var_642_3.content)

				arg_639_1.text_.text = var_642_4

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_5 = 39
				local var_642_6 = utf8.len(var_642_4)
				local var_642_7 = var_642_5 <= 0 and var_642_1 or var_642_1 * (var_642_6 / var_642_5)

				if var_642_7 > 0 and var_642_1 < var_642_7 then
					arg_639_1.talkMaxDuration = var_642_7

					if var_642_7 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_7 + var_642_0
					end
				end

				arg_639_1.text_.text = var_642_4
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431156", "story_v_out_120431.awb") ~= 0 then
					local var_642_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431156", "story_v_out_120431.awb") / 1000

					if var_642_8 + var_642_0 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_8 + var_642_0
					end

					if var_642_3.prefab_name ~= "" and arg_639_1.actors_[var_642_3.prefab_name] ~= nil then
						local var_642_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_3.prefab_name].transform, "story_v_out_120431", "120431156", "story_v_out_120431.awb")

						arg_639_1:RecordAudio("120431156", var_642_9)
						arg_639_1:RecordAudio("120431156", var_642_9)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_120431", "120431156", "story_v_out_120431.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_120431", "120431156", "story_v_out_120431.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_10 = math.max(var_642_1, arg_639_1.talkMaxDuration)

			if var_642_0 <= arg_639_1.time_ and arg_639_1.time_ < var_642_0 + var_642_10 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_0) / var_642_10

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_0 + var_642_10 and arg_639_1.time_ < var_642_0 + var_642_10 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play120431157 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 120431157
		arg_643_1.duration_ = 20.866

		local var_643_0 = {
			zh = 7.666,
			ja = 20.866
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play120431158(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.775

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_2 = arg_643_1:FormatText(StoryNameCfg[389].name)

				arg_643_1.leftNameTxt_.text = var_646_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_3 = arg_643_1:GetWordFromCfg(120431157)
				local var_646_4 = arg_643_1:FormatText(var_646_3.content)

				arg_643_1.text_.text = var_646_4

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_5 = 31
				local var_646_6 = utf8.len(var_646_4)
				local var_646_7 = var_646_5 <= 0 and var_646_1 or var_646_1 * (var_646_6 / var_646_5)

				if var_646_7 > 0 and var_646_1 < var_646_7 then
					arg_643_1.talkMaxDuration = var_646_7

					if var_646_7 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_7 + var_646_0
					end
				end

				arg_643_1.text_.text = var_646_4
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431157", "story_v_out_120431.awb") ~= 0 then
					local var_646_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431157", "story_v_out_120431.awb") / 1000

					if var_646_8 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_8 + var_646_0
					end

					if var_646_3.prefab_name ~= "" and arg_643_1.actors_[var_646_3.prefab_name] ~= nil then
						local var_646_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_3.prefab_name].transform, "story_v_out_120431", "120431157", "story_v_out_120431.awb")

						arg_643_1:RecordAudio("120431157", var_646_9)
						arg_643_1:RecordAudio("120431157", var_646_9)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_120431", "120431157", "story_v_out_120431.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_120431", "120431157", "story_v_out_120431.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_10 = math.max(var_646_1, arg_643_1.talkMaxDuration)

			if var_646_0 <= arg_643_1.time_ and arg_643_1.time_ < var_646_0 + var_646_10 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_0) / var_646_10

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_0 + var_646_10 and arg_643_1.time_ < var_646_0 + var_646_10 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play120431158 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 120431158
		arg_647_1.duration_ = 13.2

		local var_647_0 = {
			zh = 9.766,
			ja = 13.2
		}
		local var_647_1 = manager.audio:GetLocalizationFlag()

		if var_647_0[var_647_1] ~= nil then
			arg_647_1.duration_ = var_647_0[var_647_1]
		end

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play120431159(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = 0
			local var_650_1 = 1.1

			if var_650_0 < arg_647_1.time_ and arg_647_1.time_ <= var_650_0 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_2 = arg_647_1:FormatText(StoryNameCfg[6].name)

				arg_647_1.leftNameTxt_.text = var_650_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_3 = arg_647_1:GetWordFromCfg(120431158)
				local var_650_4 = arg_647_1:FormatText(var_650_3.content)

				arg_647_1.text_.text = var_650_4

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_5 = 44
				local var_650_6 = utf8.len(var_650_4)
				local var_650_7 = var_650_5 <= 0 and var_650_1 or var_650_1 * (var_650_6 / var_650_5)

				if var_650_7 > 0 and var_650_1 < var_650_7 then
					arg_647_1.talkMaxDuration = var_650_7

					if var_650_7 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_7 + var_650_0
					end
				end

				arg_647_1.text_.text = var_650_4
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431158", "story_v_out_120431.awb") ~= 0 then
					local var_650_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431158", "story_v_out_120431.awb") / 1000

					if var_650_8 + var_650_0 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_8 + var_650_0
					end

					if var_650_3.prefab_name ~= "" and arg_647_1.actors_[var_650_3.prefab_name] ~= nil then
						local var_650_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_3.prefab_name].transform, "story_v_out_120431", "120431158", "story_v_out_120431.awb")

						arg_647_1:RecordAudio("120431158", var_650_9)
						arg_647_1:RecordAudio("120431158", var_650_9)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_120431", "120431158", "story_v_out_120431.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_120431", "120431158", "story_v_out_120431.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_10 = math.max(var_650_1, arg_647_1.talkMaxDuration)

			if var_650_0 <= arg_647_1.time_ and arg_647_1.time_ < var_650_0 + var_650_10 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_0) / var_650_10

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_0 + var_650_10 and arg_647_1.time_ < var_650_0 + var_650_10 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play120431159 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 120431159
		arg_651_1.duration_ = 11.666

		local var_651_0 = {
			zh = 10.666,
			ja = 11.666
		}
		local var_651_1 = manager.audio:GetLocalizationFlag()

		if var_651_0[var_651_1] ~= nil then
			arg_651_1.duration_ = var_651_0[var_651_1]
		end

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play120431160(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0
			local var_654_1 = 0.75

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_2 = arg_651_1:FormatText(StoryNameCfg[389].name)

				arg_651_1.leftNameTxt_.text = var_654_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_3 = arg_651_1:GetWordFromCfg(120431159)
				local var_654_4 = arg_651_1:FormatText(var_654_3.content)

				arg_651_1.text_.text = var_654_4

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_5 = 30
				local var_654_6 = utf8.len(var_654_4)
				local var_654_7 = var_654_5 <= 0 and var_654_1 or var_654_1 * (var_654_6 / var_654_5)

				if var_654_7 > 0 and var_654_1 < var_654_7 then
					arg_651_1.talkMaxDuration = var_654_7

					if var_654_7 + var_654_0 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_7 + var_654_0
					end
				end

				arg_651_1.text_.text = var_654_4
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431159", "story_v_out_120431.awb") ~= 0 then
					local var_654_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431159", "story_v_out_120431.awb") / 1000

					if var_654_8 + var_654_0 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_8 + var_654_0
					end

					if var_654_3.prefab_name ~= "" and arg_651_1.actors_[var_654_3.prefab_name] ~= nil then
						local var_654_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_651_1.actors_[var_654_3.prefab_name].transform, "story_v_out_120431", "120431159", "story_v_out_120431.awb")

						arg_651_1:RecordAudio("120431159", var_654_9)
						arg_651_1:RecordAudio("120431159", var_654_9)
					else
						arg_651_1:AudioAction("play", "voice", "story_v_out_120431", "120431159", "story_v_out_120431.awb")
					end

					arg_651_1:RecordHistoryTalkVoice("story_v_out_120431", "120431159", "story_v_out_120431.awb")
				end

				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_10 = math.max(var_654_1, arg_651_1.talkMaxDuration)

			if var_654_0 <= arg_651_1.time_ and arg_651_1.time_ < var_654_0 + var_654_10 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_0) / var_654_10

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_0 + var_654_10 and arg_651_1.time_ < var_654_0 + var_654_10 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play120431160 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 120431160
		arg_655_1.duration_ = 16.166

		local var_655_0 = {
			zh = 11,
			ja = 16.166
		}
		local var_655_1 = manager.audio:GetLocalizationFlag()

		if var_655_0[var_655_1] ~= nil then
			arg_655_1.duration_ = var_655_0[var_655_1]
		end

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play120431161(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 1.1

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[389].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(120431160)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 44
				local var_658_6 = utf8.len(var_658_4)
				local var_658_7 = var_658_5 <= 0 and var_658_1 or var_658_1 * (var_658_6 / var_658_5)

				if var_658_7 > 0 and var_658_1 < var_658_7 then
					arg_655_1.talkMaxDuration = var_658_7

					if var_658_7 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_7 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_4
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431160", "story_v_out_120431.awb") ~= 0 then
					local var_658_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431160", "story_v_out_120431.awb") / 1000

					if var_658_8 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_8 + var_658_0
					end

					if var_658_3.prefab_name ~= "" and arg_655_1.actors_[var_658_3.prefab_name] ~= nil then
						local var_658_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_3.prefab_name].transform, "story_v_out_120431", "120431160", "story_v_out_120431.awb")

						arg_655_1:RecordAudio("120431160", var_658_9)
						arg_655_1:RecordAudio("120431160", var_658_9)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_out_120431", "120431160", "story_v_out_120431.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_out_120431", "120431160", "story_v_out_120431.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_10 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_10 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_10

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_10 and arg_655_1.time_ < var_658_0 + var_658_10 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play120431161 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 120431161
		arg_659_1.duration_ = 2.7

		local var_659_0 = {
			zh = 1.766,
			ja = 2.7
		}
		local var_659_1 = manager.audio:GetLocalizationFlag()

		if var_659_0[var_659_1] ~= nil then
			arg_659_1.duration_ = var_659_0[var_659_1]
		end

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play120431162(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0
			local var_662_1 = 0.125

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_2 = arg_659_1:FormatText(StoryNameCfg[6].name)

				arg_659_1.leftNameTxt_.text = var_662_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_3 = arg_659_1:GetWordFromCfg(120431161)
				local var_662_4 = arg_659_1:FormatText(var_662_3.content)

				arg_659_1.text_.text = var_662_4

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_5 = 5
				local var_662_6 = utf8.len(var_662_4)
				local var_662_7 = var_662_5 <= 0 and var_662_1 or var_662_1 * (var_662_6 / var_662_5)

				if var_662_7 > 0 and var_662_1 < var_662_7 then
					arg_659_1.talkMaxDuration = var_662_7

					if var_662_7 + var_662_0 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_7 + var_662_0
					end
				end

				arg_659_1.text_.text = var_662_4
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431161", "story_v_out_120431.awb") ~= 0 then
					local var_662_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431161", "story_v_out_120431.awb") / 1000

					if var_662_8 + var_662_0 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_8 + var_662_0
					end

					if var_662_3.prefab_name ~= "" and arg_659_1.actors_[var_662_3.prefab_name] ~= nil then
						local var_662_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_659_1.actors_[var_662_3.prefab_name].transform, "story_v_out_120431", "120431161", "story_v_out_120431.awb")

						arg_659_1:RecordAudio("120431161", var_662_9)
						arg_659_1:RecordAudio("120431161", var_662_9)
					else
						arg_659_1:AudioAction("play", "voice", "story_v_out_120431", "120431161", "story_v_out_120431.awb")
					end

					arg_659_1:RecordHistoryTalkVoice("story_v_out_120431", "120431161", "story_v_out_120431.awb")
				end

				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_10 = math.max(var_662_1, arg_659_1.talkMaxDuration)

			if var_662_0 <= arg_659_1.time_ and arg_659_1.time_ < var_662_0 + var_662_10 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_0) / var_662_10

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_0 + var_662_10 and arg_659_1.time_ < var_662_0 + var_662_10 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play120431162 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 120431162
		arg_663_1.duration_ = 16.766

		local var_663_0 = {
			zh = 10.233,
			ja = 16.766
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play120431163(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.95

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_2 = arg_663_1:FormatText(StoryNameCfg[389].name)

				arg_663_1.leftNameTxt_.text = var_666_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_3 = arg_663_1:GetWordFromCfg(120431162)
				local var_666_4 = arg_663_1:FormatText(var_666_3.content)

				arg_663_1.text_.text = var_666_4

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_5 = 38
				local var_666_6 = utf8.len(var_666_4)
				local var_666_7 = var_666_5 <= 0 and var_666_1 or var_666_1 * (var_666_6 / var_666_5)

				if var_666_7 > 0 and var_666_1 < var_666_7 then
					arg_663_1.talkMaxDuration = var_666_7

					if var_666_7 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_7 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_4
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431162", "story_v_out_120431.awb") ~= 0 then
					local var_666_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431162", "story_v_out_120431.awb") / 1000

					if var_666_8 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_8 + var_666_0
					end

					if var_666_3.prefab_name ~= "" and arg_663_1.actors_[var_666_3.prefab_name] ~= nil then
						local var_666_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_3.prefab_name].transform, "story_v_out_120431", "120431162", "story_v_out_120431.awb")

						arg_663_1:RecordAudio("120431162", var_666_9)
						arg_663_1:RecordAudio("120431162", var_666_9)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_120431", "120431162", "story_v_out_120431.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_120431", "120431162", "story_v_out_120431.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_10 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_10 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_10

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_10 and arg_663_1.time_ < var_666_0 + var_666_10 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play120431163 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 120431163
		arg_667_1.duration_ = 11.466

		local var_667_0 = {
			zh = 9,
			ja = 11.466
		}
		local var_667_1 = manager.audio:GetLocalizationFlag()

		if var_667_0[var_667_1] ~= nil then
			arg_667_1.duration_ = var_667_0[var_667_1]
		end

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play120431164(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.775

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_2 = arg_667_1:FormatText(StoryNameCfg[389].name)

				arg_667_1.leftNameTxt_.text = var_670_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_3 = arg_667_1:GetWordFromCfg(120431163)
				local var_670_4 = arg_667_1:FormatText(var_670_3.content)

				arg_667_1.text_.text = var_670_4

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_5 = 31
				local var_670_6 = utf8.len(var_670_4)
				local var_670_7 = var_670_5 <= 0 and var_670_1 or var_670_1 * (var_670_6 / var_670_5)

				if var_670_7 > 0 and var_670_1 < var_670_7 then
					arg_667_1.talkMaxDuration = var_670_7

					if var_670_7 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_7 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_4
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431163", "story_v_out_120431.awb") ~= 0 then
					local var_670_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431163", "story_v_out_120431.awb") / 1000

					if var_670_8 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_8 + var_670_0
					end

					if var_670_3.prefab_name ~= "" and arg_667_1.actors_[var_670_3.prefab_name] ~= nil then
						local var_670_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_3.prefab_name].transform, "story_v_out_120431", "120431163", "story_v_out_120431.awb")

						arg_667_1:RecordAudio("120431163", var_670_9)
						arg_667_1:RecordAudio("120431163", var_670_9)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_120431", "120431163", "story_v_out_120431.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_120431", "120431163", "story_v_out_120431.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_10 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_10 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_10

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_10 and arg_667_1.time_ < var_670_0 + var_670_10 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play120431164 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 120431164
		arg_671_1.duration_ = 10.066

		local var_671_0 = {
			zh = 7.133,
			ja = 10.066
		}
		local var_671_1 = manager.audio:GetLocalizationFlag()

		if var_671_0[var_671_1] ~= nil then
			arg_671_1.duration_ = var_671_0[var_671_1]
		end

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play120431165(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0
			local var_674_1 = 0.65

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_2 = arg_671_1:FormatText(StoryNameCfg[389].name)

				arg_671_1.leftNameTxt_.text = var_674_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_3 = arg_671_1:GetWordFromCfg(120431164)
				local var_674_4 = arg_671_1:FormatText(var_674_3.content)

				arg_671_1.text_.text = var_674_4

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_5 = 26
				local var_674_6 = utf8.len(var_674_4)
				local var_674_7 = var_674_5 <= 0 and var_674_1 or var_674_1 * (var_674_6 / var_674_5)

				if var_674_7 > 0 and var_674_1 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end

				arg_671_1.text_.text = var_674_4
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431164", "story_v_out_120431.awb") ~= 0 then
					local var_674_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431164", "story_v_out_120431.awb") / 1000

					if var_674_8 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_8 + var_674_0
					end

					if var_674_3.prefab_name ~= "" and arg_671_1.actors_[var_674_3.prefab_name] ~= nil then
						local var_674_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_671_1.actors_[var_674_3.prefab_name].transform, "story_v_out_120431", "120431164", "story_v_out_120431.awb")

						arg_671_1:RecordAudio("120431164", var_674_9)
						arg_671_1:RecordAudio("120431164", var_674_9)
					else
						arg_671_1:AudioAction("play", "voice", "story_v_out_120431", "120431164", "story_v_out_120431.awb")
					end

					arg_671_1:RecordHistoryTalkVoice("story_v_out_120431", "120431164", "story_v_out_120431.awb")
				end

				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_10 = math.max(var_674_1, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_10 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_0) / var_674_10

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_10 and arg_671_1.time_ < var_674_0 + var_674_10 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play120431165 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 120431165
		arg_675_1.duration_ = 8.2

		local var_675_0 = {
			zh = 4.7,
			ja = 8.2
		}
		local var_675_1 = manager.audio:GetLocalizationFlag()

		if var_675_0[var_675_1] ~= nil then
			arg_675_1.duration_ = var_675_0[var_675_1]
		end

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play120431166(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = 0
			local var_678_1 = 0.375

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_2 = arg_675_1:FormatText(StoryNameCfg[6].name)

				arg_675_1.leftNameTxt_.text = var_678_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_3 = arg_675_1:GetWordFromCfg(120431165)
				local var_678_4 = arg_675_1:FormatText(var_678_3.content)

				arg_675_1.text_.text = var_678_4

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_5 = 15
				local var_678_6 = utf8.len(var_678_4)
				local var_678_7 = var_678_5 <= 0 and var_678_1 or var_678_1 * (var_678_6 / var_678_5)

				if var_678_7 > 0 and var_678_1 < var_678_7 then
					arg_675_1.talkMaxDuration = var_678_7

					if var_678_7 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_7 + var_678_0
					end
				end

				arg_675_1.text_.text = var_678_4
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431165", "story_v_out_120431.awb") ~= 0 then
					local var_678_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431165", "story_v_out_120431.awb") / 1000

					if var_678_8 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_8 + var_678_0
					end

					if var_678_3.prefab_name ~= "" and arg_675_1.actors_[var_678_3.prefab_name] ~= nil then
						local var_678_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_3.prefab_name].transform, "story_v_out_120431", "120431165", "story_v_out_120431.awb")

						arg_675_1:RecordAudio("120431165", var_678_9)
						arg_675_1:RecordAudio("120431165", var_678_9)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_out_120431", "120431165", "story_v_out_120431.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_out_120431", "120431165", "story_v_out_120431.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_10 = math.max(var_678_1, arg_675_1.talkMaxDuration)

			if var_678_0 <= arg_675_1.time_ and arg_675_1.time_ < var_678_0 + var_678_10 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_0) / var_678_10

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_0 + var_678_10 and arg_675_1.time_ < var_678_0 + var_678_10 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play120431166 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 120431166
		arg_679_1.duration_ = 8.433

		local var_679_0 = {
			zh = 7.033,
			ja = 8.433
		}
		local var_679_1 = manager.audio:GetLocalizationFlag()

		if var_679_0[var_679_1] ~= nil then
			arg_679_1.duration_ = var_679_0[var_679_1]
		end

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play120431167(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.7

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[6].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(120431166)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 28
				local var_682_6 = utf8.len(var_682_4)
				local var_682_7 = var_682_5 <= 0 and var_682_1 or var_682_1 * (var_682_6 / var_682_5)

				if var_682_7 > 0 and var_682_1 < var_682_7 then
					arg_679_1.talkMaxDuration = var_682_7

					if var_682_7 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_7 + var_682_0
					end
				end

				arg_679_1.text_.text = var_682_4
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431166", "story_v_out_120431.awb") ~= 0 then
					local var_682_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431166", "story_v_out_120431.awb") / 1000

					if var_682_8 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_8 + var_682_0
					end

					if var_682_3.prefab_name ~= "" and arg_679_1.actors_[var_682_3.prefab_name] ~= nil then
						local var_682_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_3.prefab_name].transform, "story_v_out_120431", "120431166", "story_v_out_120431.awb")

						arg_679_1:RecordAudio("120431166", var_682_9)
						arg_679_1:RecordAudio("120431166", var_682_9)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_out_120431", "120431166", "story_v_out_120431.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_out_120431", "120431166", "story_v_out_120431.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_10 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_10 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_10

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_10 and arg_679_1.time_ < var_682_0 + var_682_10 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play120431167 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 120431167
		arg_683_1.duration_ = 10.2

		local var_683_0 = {
			zh = 7.933,
			ja = 10.2
		}
		local var_683_1 = manager.audio:GetLocalizationFlag()

		if var_683_0[var_683_1] ~= nil then
			arg_683_1.duration_ = var_683_0[var_683_1]
		end

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play120431168(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0
			local var_686_1 = 0.7

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_2 = arg_683_1:FormatText(StoryNameCfg[389].name)

				arg_683_1.leftNameTxt_.text = var_686_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_3 = arg_683_1:GetWordFromCfg(120431167)
				local var_686_4 = arg_683_1:FormatText(var_686_3.content)

				arg_683_1.text_.text = var_686_4

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_5 = 28
				local var_686_6 = utf8.len(var_686_4)
				local var_686_7 = var_686_5 <= 0 and var_686_1 or var_686_1 * (var_686_6 / var_686_5)

				if var_686_7 > 0 and var_686_1 < var_686_7 then
					arg_683_1.talkMaxDuration = var_686_7

					if var_686_7 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_7 + var_686_0
					end
				end

				arg_683_1.text_.text = var_686_4
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431167", "story_v_out_120431.awb") ~= 0 then
					local var_686_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431167", "story_v_out_120431.awb") / 1000

					if var_686_8 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_8 + var_686_0
					end

					if var_686_3.prefab_name ~= "" and arg_683_1.actors_[var_686_3.prefab_name] ~= nil then
						local var_686_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_3.prefab_name].transform, "story_v_out_120431", "120431167", "story_v_out_120431.awb")

						arg_683_1:RecordAudio("120431167", var_686_9)
						arg_683_1:RecordAudio("120431167", var_686_9)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_out_120431", "120431167", "story_v_out_120431.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_out_120431", "120431167", "story_v_out_120431.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_10 = math.max(var_686_1, arg_683_1.talkMaxDuration)

			if var_686_0 <= arg_683_1.time_ and arg_683_1.time_ < var_686_0 + var_686_10 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_0) / var_686_10

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_0 + var_686_10 and arg_683_1.time_ < var_686_0 + var_686_10 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play120431168 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 120431168
		arg_687_1.duration_ = 14.1

		local var_687_0 = {
			zh = 9.6,
			ja = 14.1
		}
		local var_687_1 = manager.audio:GetLocalizationFlag()

		if var_687_0[var_687_1] ~= nil then
			arg_687_1.duration_ = var_687_0[var_687_1]
		end

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play120431169(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = 0
			local var_690_1 = 1.025

			if var_690_0 < arg_687_1.time_ and arg_687_1.time_ <= var_690_0 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, true)

				local var_690_2 = arg_687_1:FormatText(StoryNameCfg[389].name)

				arg_687_1.leftNameTxt_.text = var_690_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_687_1.leftNameTxt_.transform)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1.leftNameTxt_.text)
				SetActive(arg_687_1.iconTrs_.gameObject, false)
				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_3 = arg_687_1:GetWordFromCfg(120431168)
				local var_690_4 = arg_687_1:FormatText(var_690_3.content)

				arg_687_1.text_.text = var_690_4

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_5 = 41
				local var_690_6 = utf8.len(var_690_4)
				local var_690_7 = var_690_5 <= 0 and var_690_1 or var_690_1 * (var_690_6 / var_690_5)

				if var_690_7 > 0 and var_690_1 < var_690_7 then
					arg_687_1.talkMaxDuration = var_690_7

					if var_690_7 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_7 + var_690_0
					end
				end

				arg_687_1.text_.text = var_690_4
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431168", "story_v_out_120431.awb") ~= 0 then
					local var_690_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431168", "story_v_out_120431.awb") / 1000

					if var_690_8 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_8 + var_690_0
					end

					if var_690_3.prefab_name ~= "" and arg_687_1.actors_[var_690_3.prefab_name] ~= nil then
						local var_690_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_687_1.actors_[var_690_3.prefab_name].transform, "story_v_out_120431", "120431168", "story_v_out_120431.awb")

						arg_687_1:RecordAudio("120431168", var_690_9)
						arg_687_1:RecordAudio("120431168", var_690_9)
					else
						arg_687_1:AudioAction("play", "voice", "story_v_out_120431", "120431168", "story_v_out_120431.awb")
					end

					arg_687_1:RecordHistoryTalkVoice("story_v_out_120431", "120431168", "story_v_out_120431.awb")
				end

				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_10 = math.max(var_690_1, arg_687_1.talkMaxDuration)

			if var_690_0 <= arg_687_1.time_ and arg_687_1.time_ < var_690_0 + var_690_10 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_0) / var_690_10

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_0 + var_690_10 and arg_687_1.time_ < var_690_0 + var_690_10 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play120431169 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 120431169
		arg_691_1.duration_ = 16.333

		local var_691_0 = {
			zh = 10.2,
			ja = 16.333
		}
		local var_691_1 = manager.audio:GetLocalizationFlag()

		if var_691_0[var_691_1] ~= nil then
			arg_691_1.duration_ = var_691_0[var_691_1]
		end

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play120431170(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0
			local var_694_1 = 1.1

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, true)

				local var_694_2 = arg_691_1:FormatText(StoryNameCfg[389].name)

				arg_691_1.leftNameTxt_.text = var_694_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_691_1.leftNameTxt_.transform)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1.leftNameTxt_.text)
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_3 = arg_691_1:GetWordFromCfg(120431169)
				local var_694_4 = arg_691_1:FormatText(var_694_3.content)

				arg_691_1.text_.text = var_694_4

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_5 = 44
				local var_694_6 = utf8.len(var_694_4)
				local var_694_7 = var_694_5 <= 0 and var_694_1 or var_694_1 * (var_694_6 / var_694_5)

				if var_694_7 > 0 and var_694_1 < var_694_7 then
					arg_691_1.talkMaxDuration = var_694_7

					if var_694_7 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_7 + var_694_0
					end
				end

				arg_691_1.text_.text = var_694_4
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431169", "story_v_out_120431.awb") ~= 0 then
					local var_694_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431169", "story_v_out_120431.awb") / 1000

					if var_694_8 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_8 + var_694_0
					end

					if var_694_3.prefab_name ~= "" and arg_691_1.actors_[var_694_3.prefab_name] ~= nil then
						local var_694_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_691_1.actors_[var_694_3.prefab_name].transform, "story_v_out_120431", "120431169", "story_v_out_120431.awb")

						arg_691_1:RecordAudio("120431169", var_694_9)
						arg_691_1:RecordAudio("120431169", var_694_9)
					else
						arg_691_1:AudioAction("play", "voice", "story_v_out_120431", "120431169", "story_v_out_120431.awb")
					end

					arg_691_1:RecordHistoryTalkVoice("story_v_out_120431", "120431169", "story_v_out_120431.awb")
				end

				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_10 = math.max(var_694_1, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_10 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_0) / var_694_10

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_10 and arg_691_1.time_ < var_694_0 + var_694_10 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play120431170 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 120431170
		arg_695_1.duration_ = 8.533

		local var_695_0 = {
			zh = 6.766,
			ja = 8.533
		}
		local var_695_1 = manager.audio:GetLocalizationFlag()

		if var_695_0[var_695_1] ~= nil then
			arg_695_1.duration_ = var_695_0[var_695_1]
		end

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play120431171(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = 0
			local var_698_1 = 0.7

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0
				arg_695_1.dialogCg_.alpha = 1

				arg_695_1.dialog_:SetActive(true)
				SetActive(arg_695_1.leftNameGo_, true)

				local var_698_2 = arg_695_1:FormatText(StoryNameCfg[389].name)

				arg_695_1.leftNameTxt_.text = var_698_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_695_1.leftNameTxt_.transform)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1.leftNameTxt_.text)
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_3 = arg_695_1:GetWordFromCfg(120431170)
				local var_698_4 = arg_695_1:FormatText(var_698_3.content)

				arg_695_1.text_.text = var_698_4

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_5 = 28
				local var_698_6 = utf8.len(var_698_4)
				local var_698_7 = var_698_5 <= 0 and var_698_1 or var_698_1 * (var_698_6 / var_698_5)

				if var_698_7 > 0 and var_698_1 < var_698_7 then
					arg_695_1.talkMaxDuration = var_698_7

					if var_698_7 + var_698_0 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_7 + var_698_0
					end
				end

				arg_695_1.text_.text = var_698_4
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431170", "story_v_out_120431.awb") ~= 0 then
					local var_698_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431170", "story_v_out_120431.awb") / 1000

					if var_698_8 + var_698_0 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_8 + var_698_0
					end

					if var_698_3.prefab_name ~= "" and arg_695_1.actors_[var_698_3.prefab_name] ~= nil then
						local var_698_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_695_1.actors_[var_698_3.prefab_name].transform, "story_v_out_120431", "120431170", "story_v_out_120431.awb")

						arg_695_1:RecordAudio("120431170", var_698_9)
						arg_695_1:RecordAudio("120431170", var_698_9)
					else
						arg_695_1:AudioAction("play", "voice", "story_v_out_120431", "120431170", "story_v_out_120431.awb")
					end

					arg_695_1:RecordHistoryTalkVoice("story_v_out_120431", "120431170", "story_v_out_120431.awb")
				end

				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_10 = math.max(var_698_1, arg_695_1.talkMaxDuration)

			if var_698_0 <= arg_695_1.time_ and arg_695_1.time_ < var_698_0 + var_698_10 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_0) / var_698_10

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_0 + var_698_10 and arg_695_1.time_ < var_698_0 + var_698_10 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play120431171 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 120431171
		arg_699_1.duration_ = 3.6

		local var_699_0 = {
			zh = 1.833,
			ja = 3.6
		}
		local var_699_1 = manager.audio:GetLocalizationFlag()

		if var_699_0[var_699_1] ~= nil then
			arg_699_1.duration_ = var_699_0[var_699_1]
		end

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play120431172(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = 0
			local var_702_1 = 0.2

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_2 = arg_699_1:FormatText(StoryNameCfg[6].name)

				arg_699_1.leftNameTxt_.text = var_702_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_3 = arg_699_1:GetWordFromCfg(120431171)
				local var_702_4 = arg_699_1:FormatText(var_702_3.content)

				arg_699_1.text_.text = var_702_4

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_5 = 8
				local var_702_6 = utf8.len(var_702_4)
				local var_702_7 = var_702_5 <= 0 and var_702_1 or var_702_1 * (var_702_6 / var_702_5)

				if var_702_7 > 0 and var_702_1 < var_702_7 then
					arg_699_1.talkMaxDuration = var_702_7

					if var_702_7 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_7 + var_702_0
					end
				end

				arg_699_1.text_.text = var_702_4
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431171", "story_v_out_120431.awb") ~= 0 then
					local var_702_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431171", "story_v_out_120431.awb") / 1000

					if var_702_8 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_8 + var_702_0
					end

					if var_702_3.prefab_name ~= "" and arg_699_1.actors_[var_702_3.prefab_name] ~= nil then
						local var_702_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_699_1.actors_[var_702_3.prefab_name].transform, "story_v_out_120431", "120431171", "story_v_out_120431.awb")

						arg_699_1:RecordAudio("120431171", var_702_9)
						arg_699_1:RecordAudio("120431171", var_702_9)
					else
						arg_699_1:AudioAction("play", "voice", "story_v_out_120431", "120431171", "story_v_out_120431.awb")
					end

					arg_699_1:RecordHistoryTalkVoice("story_v_out_120431", "120431171", "story_v_out_120431.awb")
				end

				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_10 = math.max(var_702_1, arg_699_1.talkMaxDuration)

			if var_702_0 <= arg_699_1.time_ and arg_699_1.time_ < var_702_0 + var_702_10 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_0) / var_702_10

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_0 + var_702_10 and arg_699_1.time_ < var_702_0 + var_702_10 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play120431172 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 120431172
		arg_703_1.duration_ = 11.5

		local var_703_0 = {
			zh = 5.9,
			ja = 11.5
		}
		local var_703_1 = manager.audio:GetLocalizationFlag()

		if var_703_0[var_703_1] ~= nil then
			arg_703_1.duration_ = var_703_0[var_703_1]
		end

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play120431173(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0
			local var_706_1 = 0.55

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_2 = arg_703_1:FormatText(StoryNameCfg[389].name)

				arg_703_1.leftNameTxt_.text = var_706_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_3 = arg_703_1:GetWordFromCfg(120431172)
				local var_706_4 = arg_703_1:FormatText(var_706_3.content)

				arg_703_1.text_.text = var_706_4

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_5 = 22
				local var_706_6 = utf8.len(var_706_4)
				local var_706_7 = var_706_5 <= 0 and var_706_1 or var_706_1 * (var_706_6 / var_706_5)

				if var_706_7 > 0 and var_706_1 < var_706_7 then
					arg_703_1.talkMaxDuration = var_706_7

					if var_706_7 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_7 + var_706_0
					end
				end

				arg_703_1.text_.text = var_706_4
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431172", "story_v_out_120431.awb") ~= 0 then
					local var_706_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431172", "story_v_out_120431.awb") / 1000

					if var_706_8 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_8 + var_706_0
					end

					if var_706_3.prefab_name ~= "" and arg_703_1.actors_[var_706_3.prefab_name] ~= nil then
						local var_706_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_703_1.actors_[var_706_3.prefab_name].transform, "story_v_out_120431", "120431172", "story_v_out_120431.awb")

						arg_703_1:RecordAudio("120431172", var_706_9)
						arg_703_1:RecordAudio("120431172", var_706_9)
					else
						arg_703_1:AudioAction("play", "voice", "story_v_out_120431", "120431172", "story_v_out_120431.awb")
					end

					arg_703_1:RecordHistoryTalkVoice("story_v_out_120431", "120431172", "story_v_out_120431.awb")
				end

				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_10 = math.max(var_706_1, arg_703_1.talkMaxDuration)

			if var_706_0 <= arg_703_1.time_ and arg_703_1.time_ < var_706_0 + var_706_10 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_0) / var_706_10

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_0 + var_706_10 and arg_703_1.time_ < var_706_0 + var_706_10 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play120431173 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 120431173
		arg_707_1.duration_ = 16.4

		local var_707_0 = {
			zh = 7.133,
			ja = 16.4
		}
		local var_707_1 = manager.audio:GetLocalizationFlag()

		if var_707_0[var_707_1] ~= nil then
			arg_707_1.duration_ = var_707_0[var_707_1]
		end

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play120431174(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 0
			local var_710_1 = 0.675

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0
				arg_707_1.dialogCg_.alpha = 1

				arg_707_1.dialog_:SetActive(true)
				SetActive(arg_707_1.leftNameGo_, true)

				local var_710_2 = arg_707_1:FormatText(StoryNameCfg[389].name)

				arg_707_1.leftNameTxt_.text = var_710_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_707_1.leftNameTxt_.transform)

				arg_707_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_707_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_707_1:RecordName(arg_707_1.leftNameTxt_.text)
				SetActive(arg_707_1.iconTrs_.gameObject, false)
				arg_707_1.callingController_:SetSelectedState("normal")

				local var_710_3 = arg_707_1:GetWordFromCfg(120431173)
				local var_710_4 = arg_707_1:FormatText(var_710_3.content)

				arg_707_1.text_.text = var_710_4

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.text_)

				local var_710_5 = 28
				local var_710_6 = utf8.len(var_710_4)
				local var_710_7 = var_710_5 <= 0 and var_710_1 or var_710_1 * (var_710_6 / var_710_5)

				if var_710_7 > 0 and var_710_1 < var_710_7 then
					arg_707_1.talkMaxDuration = var_710_7

					if var_710_7 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_7 + var_710_0
					end
				end

				arg_707_1.text_.text = var_710_4
				arg_707_1.typewritter.percent = 0

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431173", "story_v_out_120431.awb") ~= 0 then
					local var_710_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431173", "story_v_out_120431.awb") / 1000

					if var_710_8 + var_710_0 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_8 + var_710_0
					end

					if var_710_3.prefab_name ~= "" and arg_707_1.actors_[var_710_3.prefab_name] ~= nil then
						local var_710_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_707_1.actors_[var_710_3.prefab_name].transform, "story_v_out_120431", "120431173", "story_v_out_120431.awb")

						arg_707_1:RecordAudio("120431173", var_710_9)
						arg_707_1:RecordAudio("120431173", var_710_9)
					else
						arg_707_1:AudioAction("play", "voice", "story_v_out_120431", "120431173", "story_v_out_120431.awb")
					end

					arg_707_1:RecordHistoryTalkVoice("story_v_out_120431", "120431173", "story_v_out_120431.awb")
				end

				arg_707_1:RecordContent(arg_707_1.text_.text)
			end

			local var_710_10 = math.max(var_710_1, arg_707_1.talkMaxDuration)

			if var_710_0 <= arg_707_1.time_ and arg_707_1.time_ < var_710_0 + var_710_10 then
				arg_707_1.typewritter.percent = (arg_707_1.time_ - var_710_0) / var_710_10

				arg_707_1.typewritter:SetDirty()
			end

			if arg_707_1.time_ >= var_710_0 + var_710_10 and arg_707_1.time_ < var_710_0 + var_710_10 + arg_710_0 then
				arg_707_1.typewritter.percent = 1

				arg_707_1.typewritter:SetDirty()
				arg_707_1:ShowNextGo(true)
			end
		end
	end,
	Play120431174 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 120431174
		arg_711_1.duration_ = 19.333

		local var_711_0 = {
			zh = 11.333,
			ja = 19.333
		}
		local var_711_1 = manager.audio:GetLocalizationFlag()

		if var_711_0[var_711_1] ~= nil then
			arg_711_1.duration_ = var_711_0[var_711_1]
		end

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play120431175(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = 0
			local var_714_1 = 0.95

			if var_714_0 < arg_711_1.time_ and arg_711_1.time_ <= var_714_0 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0
				arg_711_1.dialogCg_.alpha = 1

				arg_711_1.dialog_:SetActive(true)
				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_2 = arg_711_1:FormatText(StoryNameCfg[389].name)

				arg_711_1.leftNameTxt_.text = var_714_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, false)
				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_3 = arg_711_1:GetWordFromCfg(120431174)
				local var_714_4 = arg_711_1:FormatText(var_714_3.content)

				arg_711_1.text_.text = var_714_4

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_5 = 38
				local var_714_6 = utf8.len(var_714_4)
				local var_714_7 = var_714_5 <= 0 and var_714_1 or var_714_1 * (var_714_6 / var_714_5)

				if var_714_7 > 0 and var_714_1 < var_714_7 then
					arg_711_1.talkMaxDuration = var_714_7

					if var_714_7 + var_714_0 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_7 + var_714_0
					end
				end

				arg_711_1.text_.text = var_714_4
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431174", "story_v_out_120431.awb") ~= 0 then
					local var_714_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431174", "story_v_out_120431.awb") / 1000

					if var_714_8 + var_714_0 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_8 + var_714_0
					end

					if var_714_3.prefab_name ~= "" and arg_711_1.actors_[var_714_3.prefab_name] ~= nil then
						local var_714_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_711_1.actors_[var_714_3.prefab_name].transform, "story_v_out_120431", "120431174", "story_v_out_120431.awb")

						arg_711_1:RecordAudio("120431174", var_714_9)
						arg_711_1:RecordAudio("120431174", var_714_9)
					else
						arg_711_1:AudioAction("play", "voice", "story_v_out_120431", "120431174", "story_v_out_120431.awb")
					end

					arg_711_1:RecordHistoryTalkVoice("story_v_out_120431", "120431174", "story_v_out_120431.awb")
				end

				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_10 = math.max(var_714_1, arg_711_1.talkMaxDuration)

			if var_714_0 <= arg_711_1.time_ and arg_711_1.time_ < var_714_0 + var_714_10 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_0) / var_714_10

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_0 + var_714_10 and arg_711_1.time_ < var_714_0 + var_714_10 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play120431175 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 120431175
		arg_715_1.duration_ = 13.8

		local var_715_0 = {
			zh = 7.9,
			ja = 13.8
		}
		local var_715_1 = manager.audio:GetLocalizationFlag()

		if var_715_0[var_715_1] ~= nil then
			arg_715_1.duration_ = var_715_0[var_715_1]
		end

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
			arg_715_1.auto_ = false
		end

		function arg_715_1.playNext_(arg_717_0)
			arg_715_1.onStoryFinished_()
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = 0
			local var_718_1 = 0.675

			if var_718_0 < arg_715_1.time_ and arg_715_1.time_ <= var_718_0 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0
				arg_715_1.dialogCg_.alpha = 1

				arg_715_1.dialog_:SetActive(true)
				SetActive(arg_715_1.leftNameGo_, true)

				local var_718_2 = arg_715_1:FormatText(StoryNameCfg[389].name)

				arg_715_1.leftNameTxt_.text = var_718_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_715_1.leftNameTxt_.transform)

				arg_715_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_715_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_715_1:RecordName(arg_715_1.leftNameTxt_.text)
				SetActive(arg_715_1.iconTrs_.gameObject, false)
				arg_715_1.callingController_:SetSelectedState("normal")

				local var_718_3 = arg_715_1:GetWordFromCfg(120431175)
				local var_718_4 = arg_715_1:FormatText(var_718_3.content)

				arg_715_1.text_.text = var_718_4

				LuaForUtil.ClearLinePrefixSymbol(arg_715_1.text_)

				local var_718_5 = 27
				local var_718_6 = utf8.len(var_718_4)
				local var_718_7 = var_718_5 <= 0 and var_718_1 or var_718_1 * (var_718_6 / var_718_5)

				if var_718_7 > 0 and var_718_1 < var_718_7 then
					arg_715_1.talkMaxDuration = var_718_7

					if var_718_7 + var_718_0 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_7 + var_718_0
					end
				end

				arg_715_1.text_.text = var_718_4
				arg_715_1.typewritter.percent = 0

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120431", "120431175", "story_v_out_120431.awb") ~= 0 then
					local var_718_8 = manager.audio:GetVoiceLength("story_v_out_120431", "120431175", "story_v_out_120431.awb") / 1000

					if var_718_8 + var_718_0 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_8 + var_718_0
					end

					if var_718_3.prefab_name ~= "" and arg_715_1.actors_[var_718_3.prefab_name] ~= nil then
						local var_718_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_715_1.actors_[var_718_3.prefab_name].transform, "story_v_out_120431", "120431175", "story_v_out_120431.awb")

						arg_715_1:RecordAudio("120431175", var_718_9)
						arg_715_1:RecordAudio("120431175", var_718_9)
					else
						arg_715_1:AudioAction("play", "voice", "story_v_out_120431", "120431175", "story_v_out_120431.awb")
					end

					arg_715_1:RecordHistoryTalkVoice("story_v_out_120431", "120431175", "story_v_out_120431.awb")
				end

				arg_715_1:RecordContent(arg_715_1.text_.text)
			end

			local var_718_10 = math.max(var_718_1, arg_715_1.talkMaxDuration)

			if var_718_0 <= arg_715_1.time_ and arg_715_1.time_ < var_718_0 + var_718_10 then
				arg_715_1.typewritter.percent = (arg_715_1.time_ - var_718_0) / var_718_10

				arg_715_1.typewritter:SetDirty()
			end

			if arg_715_1.time_ >= var_718_0 + var_718_10 and arg_715_1.time_ < var_718_0 + var_718_10 + arg_718_0 then
				arg_715_1.typewritter.percent = 1

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST32a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0205",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0206"
	},
	voices = {
		"story_v_out_120431.awb"
	}
}
