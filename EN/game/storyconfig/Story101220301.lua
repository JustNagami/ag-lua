return {
	Play122031001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 122031001
		arg_1_1.duration_ = 7.3

		local var_1_0 = {
			ja = 7.3,
			ko = 4.4,
			zh = 4.4
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
				arg_1_0:Play122031002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST29a"

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
				local var_4_5 = arg_1_1.bgs_.ST29a

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
					if iter_4_0 ~= "ST29a" then
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

			local var_4_22 = "10044ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("Char/" .. var_4_22), arg_1_1.stage_.transform)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_22] = var_4_23

				local var_4_24 = var_4_23:GetComponentInChildren(typeof(CharacterEffect))

				var_4_24.enabled = true

				local var_4_25 = GameObjectTools.GetOrAddComponent(var_4_23, typeof(DynamicBoneHelper))

				if var_4_25 then
					var_4_25:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_24.transform, false)

				arg_1_1.var_[var_4_22 .. "Animator"] = var_4_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_26 = arg_1_1.actors_["10044ui_story"].transform
			local var_4_27 = 1.8

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos10044ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.72, -6.3)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10044ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["10044ui_story"]
			local var_4_36 = 1.8

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect10044ui_story == nil then
				arg_1_1.var_.characterEffect10044ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect10044ui_story then
					arg_1_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect10044ui_story then
				arg_1_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_4_39 = 1.8

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_4_40 = 1.8

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_4_41 = 0
			local var_4_42 = 0.4

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 1.30000000298023
			local var_4_46 = 0.7

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_2_ui", "bgm_activity_2_2_ui", "bgm_activity_2_2_ui.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.35

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

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[380].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(122031001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031001", "story_v_out_122031.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_122031", "122031001", "story_v_out_122031.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_122031", "122031001", "story_v_out_122031.awb")

						arg_1_1:RecordAudio("122031001", var_4_59)
						arg_1_1:RecordAudio("122031001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_122031", "122031001", "story_v_out_122031.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_122031", "122031001", "story_v_out_122031.awb")
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
	Play122031002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 122031002
		arg_7_1.duration_ = 6.9

		local var_7_0 = {
			ja = 6.9,
			ko = 6.466,
			zh = 6.466
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
				arg_7_0:Play122031003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["10044ui_story"]
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 and arg_7_1.var_.characterEffect10044ui_story == nil then
				arg_7_1.var_.characterEffect10044ui_story = var_10_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_10_2 = 0.200000002980232

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2

				if arg_7_1.var_.characterEffect10044ui_story then
					local var_10_4 = Mathf.Lerp(0, 0.5, var_10_3)

					arg_7_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_7_1.var_.characterEffect10044ui_story.fillRatio = var_10_4
				end
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 and arg_7_1.var_.characterEffect10044ui_story then
				local var_10_5 = 0.5

				arg_7_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_7_1.var_.characterEffect10044ui_story.fillRatio = var_10_5
			end

			local var_10_6 = 0
			local var_10_7 = 0.775

			if var_10_6 < arg_7_1.time_ and arg_7_1.time_ <= var_10_6 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_8 = arg_7_1:FormatText(StoryNameCfg[433].name)

				arg_7_1.leftNameTxt_.text = var_10_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_9 = arg_7_1:GetWordFromCfg(122031002)
				local var_10_10 = arg_7_1:FormatText(var_10_9.content)

				arg_7_1.text_.text = var_10_10

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_11 = 31
				local var_10_12 = utf8.len(var_10_10)
				local var_10_13 = var_10_11 <= 0 and var_10_7 or var_10_7 * (var_10_12 / var_10_11)

				if var_10_13 > 0 and var_10_7 < var_10_13 then
					arg_7_1.talkMaxDuration = var_10_13

					if var_10_13 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_13 + var_10_6
					end
				end

				arg_7_1.text_.text = var_10_10
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031002", "story_v_out_122031.awb") ~= 0 then
					local var_10_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031002", "story_v_out_122031.awb") / 1000

					if var_10_14 + var_10_6 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_14 + var_10_6
					end

					if var_10_9.prefab_name ~= "" and arg_7_1.actors_[var_10_9.prefab_name] ~= nil then
						local var_10_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_9.prefab_name].transform, "story_v_out_122031", "122031002", "story_v_out_122031.awb")

						arg_7_1:RecordAudio("122031002", var_10_15)
						arg_7_1:RecordAudio("122031002", var_10_15)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_122031", "122031002", "story_v_out_122031.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_122031", "122031002", "story_v_out_122031.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_16 = math.max(var_10_7, arg_7_1.talkMaxDuration)

			if var_10_6 <= arg_7_1.time_ and arg_7_1.time_ < var_10_6 + var_10_16 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_6) / var_10_16

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_6 + var_10_16 and arg_7_1.time_ < var_10_6 + var_10_16 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play122031003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 122031003
		arg_11_1.duration_ = 5.366

		local var_11_0 = {
			ja = 5.366,
			ko = 3.266,
			zh = 3.266
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
				arg_11_0:Play122031004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10044ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect10044ui_story == nil then
				arg_11_1.var_.characterEffect10044ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect10044ui_story then
					arg_11_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect10044ui_story then
				arg_11_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_14_4 = 0

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_14_5 = 0
			local var_14_6 = 0.4

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_7 = arg_11_1:FormatText(StoryNameCfg[380].name)

				arg_11_1.leftNameTxt_.text = var_14_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(122031003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 16
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_6 or var_14_6 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_6 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_5 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_5
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031003", "story_v_out_122031.awb") ~= 0 then
					local var_14_13 = manager.audio:GetVoiceLength("story_v_out_122031", "122031003", "story_v_out_122031.awb") / 1000

					if var_14_13 + var_14_5 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_13 + var_14_5
					end

					if var_14_8.prefab_name ~= "" and arg_11_1.actors_[var_14_8.prefab_name] ~= nil then
						local var_14_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_8.prefab_name].transform, "story_v_out_122031", "122031003", "story_v_out_122031.awb")

						arg_11_1:RecordAudio("122031003", var_14_14)
						arg_11_1:RecordAudio("122031003", var_14_14)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_122031", "122031003", "story_v_out_122031.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_122031", "122031003", "story_v_out_122031.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_15 = math.max(var_14_6, arg_11_1.talkMaxDuration)

			if var_14_5 <= arg_11_1.time_ and arg_11_1.time_ < var_14_5 + var_14_15 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_5) / var_14_15

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_5 + var_14_15 and arg_11_1.time_ < var_14_5 + var_14_15 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play122031004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 122031004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play122031005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10044ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect10044ui_story == nil then
				arg_15_1.var_.characterEffect10044ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.200000002980232

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect10044ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_15_1.var_.characterEffect10044ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect10044ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_15_1.var_.characterEffect10044ui_story.fillRatio = var_18_5
			end

			local var_18_6 = arg_15_1.actors_["10044ui_story"].transform
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.var_.moveOldPos10044ui_story = var_18_6.localPosition
			end

			local var_18_8 = 0.001

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_8 then
				local var_18_9 = (arg_15_1.time_ - var_18_7) / var_18_8
				local var_18_10 = Vector3.New(0, 100, 0)

				var_18_6.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos10044ui_story, var_18_10, var_18_9)

				local var_18_11 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_11.x, var_18_11.y, var_18_11.z)

				local var_18_12 = var_18_6.localEulerAngles

				var_18_12.z = 0
				var_18_12.x = 0
				var_18_6.localEulerAngles = var_18_12
			end

			if arg_15_1.time_ >= var_18_7 + var_18_8 and arg_15_1.time_ < var_18_7 + var_18_8 + arg_18_0 then
				var_18_6.localPosition = Vector3.New(0, 100, 0)

				local var_18_13 = manager.ui.mainCamera.transform.position - var_18_6.position

				var_18_6.forward = Vector3.New(var_18_13.x, var_18_13.y, var_18_13.z)

				local var_18_14 = var_18_6.localEulerAngles

				var_18_14.z = 0
				var_18_14.x = 0
				var_18_6.localEulerAngles = var_18_14
			end

			local var_18_15 = 0
			local var_18_16 = 1.15

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_17 = arg_15_1:GetWordFromCfg(122031004)
				local var_18_18 = arg_15_1:FormatText(var_18_17.content)

				arg_15_1.text_.text = var_18_18

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_19 = 46
				local var_18_20 = utf8.len(var_18_18)
				local var_18_21 = var_18_19 <= 0 and var_18_16 or var_18_16 * (var_18_20 / var_18_19)

				if var_18_21 > 0 and var_18_16 < var_18_21 then
					arg_15_1.talkMaxDuration = var_18_21

					if var_18_21 + var_18_15 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_21 + var_18_15
					end
				end

				arg_15_1.text_.text = var_18_18
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_22 = math.max(var_18_16, arg_15_1.talkMaxDuration)

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_22 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_15) / var_18_22

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_15 + var_18_22 and arg_15_1.time_ < var_18_15 + var_18_22 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play122031005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 122031005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play122031006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.866666666666667

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				local var_22_2 = "play"
				local var_22_3 = "effect"

				arg_19_1:AudioAction(var_22_2, var_22_3, "se_story_122_01", "se_story_122_01_buildinghit01", "")
			end

			local var_22_4 = 0
			local var_22_5 = 1.675

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_6 = arg_19_1:GetWordFromCfg(122031005)
				local var_22_7 = arg_19_1:FormatText(var_22_6.content)

				arg_19_1.text_.text = var_22_7

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_8 = 67
				local var_22_9 = utf8.len(var_22_7)
				local var_22_10 = var_22_8 <= 0 and var_22_5 or var_22_5 * (var_22_9 / var_22_8)

				if var_22_10 > 0 and var_22_5 < var_22_10 then
					arg_19_1.talkMaxDuration = var_22_10

					if var_22_10 + var_22_4 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_10 + var_22_4
					end
				end

				arg_19_1.text_.text = var_22_7
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = math.max(var_22_5, arg_19_1.talkMaxDuration)

			if var_22_4 <= arg_19_1.time_ and arg_19_1.time_ < var_22_4 + var_22_11 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_4) / var_22_11

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_4 + var_22_11 and arg_19_1.time_ < var_22_4 + var_22_11 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play122031006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 122031006
		arg_23_1.duration_ = 4.5

		local var_23_0 = {
			ja = 4.5,
			ko = 3,
			zh = 3
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
				arg_23_0:Play122031007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_2 = "play"
				local var_26_3 = "effect"

				arg_23_1:AudioAction(var_26_2, var_26_3, "se_story_122_01", "se_story_122_01_monsterattack01_loop", "")
			end

			local var_26_4 = 0
			local var_26_5 = 0.375

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_6 = arg_23_1:FormatText(StoryNameCfg[433].name)

				arg_23_1.leftNameTxt_.text = var_26_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_7 = arg_23_1:GetWordFromCfg(122031006)
				local var_26_8 = arg_23_1:FormatText(var_26_7.content)

				arg_23_1.text_.text = var_26_8

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_9 = 15
				local var_26_10 = utf8.len(var_26_8)
				local var_26_11 = var_26_9 <= 0 and var_26_5 or var_26_5 * (var_26_10 / var_26_9)

				if var_26_11 > 0 and var_26_5 < var_26_11 then
					arg_23_1.talkMaxDuration = var_26_11

					if var_26_11 + var_26_4 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_11 + var_26_4
					end
				end

				arg_23_1.text_.text = var_26_8
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031006", "story_v_out_122031.awb") ~= 0 then
					local var_26_12 = manager.audio:GetVoiceLength("story_v_out_122031", "122031006", "story_v_out_122031.awb") / 1000

					if var_26_12 + var_26_4 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_12 + var_26_4
					end

					if var_26_7.prefab_name ~= "" and arg_23_1.actors_[var_26_7.prefab_name] ~= nil then
						local var_26_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_7.prefab_name].transform, "story_v_out_122031", "122031006", "story_v_out_122031.awb")

						arg_23_1:RecordAudio("122031006", var_26_13)
						arg_23_1:RecordAudio("122031006", var_26_13)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_122031", "122031006", "story_v_out_122031.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_122031", "122031006", "story_v_out_122031.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_14 = math.max(var_26_5, arg_23_1.talkMaxDuration)

			if var_26_4 <= arg_23_1.time_ and arg_23_1.time_ < var_26_4 + var_26_14 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_4) / var_26_14

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_4 + var_26_14 and arg_23_1.time_ < var_26_4 + var_26_14 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play122031007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 122031007
		arg_27_1.duration_ = 5.9

		local var_27_0 = {
			ja = 5.9,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_27_0:Play122031008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10044ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10044ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0, -0.72, -6.3)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10044ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["10044ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect10044ui_story == nil then
				arg_27_1.var_.characterEffect10044ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect10044ui_story then
					arg_27_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect10044ui_story then
				arg_27_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_30_15 = 0
			local var_30_16 = 0.4

			if var_30_15 < arg_27_1.time_ and arg_27_1.time_ <= var_30_15 + arg_30_0 then
				local var_30_17 = "play"
				local var_30_18 = "effect"

				arg_27_1:AudioAction(var_30_17, var_30_18, "se_story_122_01", "se_story_122_01_buildinghit02", "")
			end

			local var_30_19 = 0.433333333333333
			local var_30_20 = 0.466666666666667

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				local var_30_21 = "play"
				local var_30_22 = "music"

				arg_27_1:AudioAction(var_30_21, var_30_22, "se_story_122_01", "se_story_122_01_buildinghit01", "")
			end

			local var_30_23 = 0
			local var_30_24 = 0.125

			if var_30_23 < arg_27_1.time_ and arg_27_1.time_ <= var_30_23 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_25 = arg_27_1:FormatText(StoryNameCfg[380].name)

				arg_27_1.leftNameTxt_.text = var_30_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_26 = arg_27_1:GetWordFromCfg(122031007)
				local var_30_27 = arg_27_1:FormatText(var_30_26.content)

				arg_27_1.text_.text = var_30_27

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_28 = 5
				local var_30_29 = utf8.len(var_30_27)
				local var_30_30 = var_30_28 <= 0 and var_30_24 or var_30_24 * (var_30_29 / var_30_28)

				if var_30_30 > 0 and var_30_24 < var_30_30 then
					arg_27_1.talkMaxDuration = var_30_30

					if var_30_30 + var_30_23 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_30 + var_30_23
					end
				end

				arg_27_1.text_.text = var_30_27
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031007", "story_v_out_122031.awb") ~= 0 then
					local var_30_31 = manager.audio:GetVoiceLength("story_v_out_122031", "122031007", "story_v_out_122031.awb") / 1000

					if var_30_31 + var_30_23 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_31 + var_30_23
					end

					if var_30_26.prefab_name ~= "" and arg_27_1.actors_[var_30_26.prefab_name] ~= nil then
						local var_30_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_26.prefab_name].transform, "story_v_out_122031", "122031007", "story_v_out_122031.awb")

						arg_27_1:RecordAudio("122031007", var_30_32)
						arg_27_1:RecordAudio("122031007", var_30_32)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_122031", "122031007", "story_v_out_122031.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_122031", "122031007", "story_v_out_122031.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_33 = math.max(var_30_24, arg_27_1.talkMaxDuration)

			if var_30_23 <= arg_27_1.time_ and arg_27_1.time_ < var_30_23 + var_30_33 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_23) / var_30_33

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_23 + var_30_33 and arg_27_1.time_ < var_30_23 + var_30_33 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play122031008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 122031008
		arg_31_1.duration_ = 14.3

		local var_31_0 = {
			ja = 13.7,
			ko = 14.3,
			zh = 14.3
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
				arg_31_0:Play122031009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_34_2 = 0
			local var_34_3 = 1.4

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_4 = arg_31_1:FormatText(StoryNameCfg[380].name)

				arg_31_1.leftNameTxt_.text = var_34_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_5 = arg_31_1:GetWordFromCfg(122031008)
				local var_34_6 = arg_31_1:FormatText(var_34_5.content)

				arg_31_1.text_.text = var_34_6

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_7 = 56
				local var_34_8 = utf8.len(var_34_6)
				local var_34_9 = var_34_7 <= 0 and var_34_3 or var_34_3 * (var_34_8 / var_34_7)

				if var_34_9 > 0 and var_34_3 < var_34_9 then
					arg_31_1.talkMaxDuration = var_34_9

					if var_34_9 + var_34_2 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_9 + var_34_2
					end
				end

				arg_31_1.text_.text = var_34_6
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031008", "story_v_out_122031.awb") ~= 0 then
					local var_34_10 = manager.audio:GetVoiceLength("story_v_out_122031", "122031008", "story_v_out_122031.awb") / 1000

					if var_34_10 + var_34_2 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_10 + var_34_2
					end

					if var_34_5.prefab_name ~= "" and arg_31_1.actors_[var_34_5.prefab_name] ~= nil then
						local var_34_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_5.prefab_name].transform, "story_v_out_122031", "122031008", "story_v_out_122031.awb")

						arg_31_1:RecordAudio("122031008", var_34_11)
						arg_31_1:RecordAudio("122031008", var_34_11)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_122031", "122031008", "story_v_out_122031.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_122031", "122031008", "story_v_out_122031.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_12 = math.max(var_34_3, arg_31_1.talkMaxDuration)

			if var_34_2 <= arg_31_1.time_ and arg_31_1.time_ < var_34_2 + var_34_12 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_2) / var_34_12

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_2 + var_34_12 and arg_31_1.time_ < var_34_2 + var_34_12 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play122031009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 122031009
		arg_35_1.duration_ = 5.3

		local var_35_0 = {
			ja = 4.466,
			ko = 5.3,
			zh = 5.3
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
				arg_35_0:Play122031010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.7

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[380].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(122031009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 28
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031009", "story_v_out_122031.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031009", "story_v_out_122031.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_122031", "122031009", "story_v_out_122031.awb")

						arg_35_1:RecordAudio("122031009", var_38_9)
						arg_35_1:RecordAudio("122031009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_122031", "122031009", "story_v_out_122031.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_122031", "122031009", "story_v_out_122031.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play122031010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 122031010
		arg_39_1.duration_ = 6.866

		local var_39_0 = {
			ja = 4.5,
			ko = 6.866,
			zh = 6.866
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
				arg_39_0:Play122031011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10044ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect10044ui_story == nil then
				arg_39_1.var_.characterEffect10044ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect10044ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10044ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect10044ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10044ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.675

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[433].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(122031010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 27
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031010", "story_v_out_122031.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031010", "story_v_out_122031.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_122031", "122031010", "story_v_out_122031.awb")

						arg_39_1:RecordAudio("122031010", var_42_15)
						arg_39_1:RecordAudio("122031010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_122031", "122031010", "story_v_out_122031.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_122031", "122031010", "story_v_out_122031.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play122031011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 122031011
		arg_43_1.duration_ = 7.7

		local var_43_0 = {
			ja = 7.666,
			ko = 7.7,
			zh = 7.7
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
				arg_43_0:Play122031012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.825

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[433].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(122031011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031011", "story_v_out_122031.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031011", "story_v_out_122031.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_122031", "122031011", "story_v_out_122031.awb")

						arg_43_1:RecordAudio("122031011", var_46_9)
						arg_43_1:RecordAudio("122031011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_122031", "122031011", "story_v_out_122031.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_122031", "122031011", "story_v_out_122031.awb")
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
	Play122031012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 122031012
		arg_47_1.duration_ = 2.533

		local var_47_0 = {
			ja = 2.066,
			ko = 2.533,
			zh = 2.533
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
				arg_47_0:Play122031013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10044ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10044ui_story == nil then
				arg_47_1.var_.characterEffect10044ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10044ui_story then
					arg_47_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10044ui_story then
				arg_47_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_6 = 0
			local var_50_7 = 0.25

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[380].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(122031012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 10
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031012", "story_v_out_122031.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031012", "story_v_out_122031.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_122031", "122031012", "story_v_out_122031.awb")

						arg_47_1:RecordAudio("122031012", var_50_15)
						arg_47_1:RecordAudio("122031012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_122031", "122031012", "story_v_out_122031.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_122031", "122031012", "story_v_out_122031.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play122031013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 122031013
		arg_51_1.duration_ = 10.7

		local var_51_0 = {
			ja = 9.933,
			ko = 10.7,
			zh = 10.7
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
				arg_51_0:Play122031014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 1.225

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[380].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(122031013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 49
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031013", "story_v_out_122031.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031013", "story_v_out_122031.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_122031", "122031013", "story_v_out_122031.awb")

						arg_51_1:RecordAudio("122031013", var_54_9)
						arg_51_1:RecordAudio("122031013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_122031", "122031013", "story_v_out_122031.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_122031", "122031013", "story_v_out_122031.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play122031014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 122031014
		arg_55_1.duration_ = 8.9

		local var_55_0 = {
			ja = 8.6,
			ko = 8.9,
			zh = 8.9
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
				arg_55_0:Play122031015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.05

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[380].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(122031014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031014", "story_v_out_122031.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031014", "story_v_out_122031.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_122031", "122031014", "story_v_out_122031.awb")

						arg_55_1:RecordAudio("122031014", var_58_9)
						arg_55_1:RecordAudio("122031014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_122031", "122031014", "story_v_out_122031.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_122031", "122031014", "story_v_out_122031.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play122031015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 122031015
		arg_59_1.duration_ = 12.8

		local var_59_0 = {
			ja = 10.7,
			ko = 12.8,
			zh = 12.8
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
				arg_59_0:Play122031016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.55

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[380].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(122031015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 62
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031015", "story_v_out_122031.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031015", "story_v_out_122031.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_122031", "122031015", "story_v_out_122031.awb")

						arg_59_1:RecordAudio("122031015", var_62_9)
						arg_59_1:RecordAudio("122031015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_122031", "122031015", "story_v_out_122031.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_122031", "122031015", "story_v_out_122031.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play122031016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 122031016
		arg_63_1.duration_ = 10.133

		local var_63_0 = {
			ja = 9.333,
			ko = 10.133,
			zh = 10.133
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
				arg_63_0:Play122031017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10044ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect10044ui_story == nil then
				arg_63_1.var_.characterEffect10044ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect10044ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10044ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect10044ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10044ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 1

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[433].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(122031016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 40
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031016", "story_v_out_122031.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031016", "story_v_out_122031.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_122031", "122031016", "story_v_out_122031.awb")

						arg_63_1:RecordAudio("122031016", var_66_15)
						arg_63_1:RecordAudio("122031016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_122031", "122031016", "story_v_out_122031.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_122031", "122031016", "story_v_out_122031.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play122031017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 122031017
		arg_67_1.duration_ = 10.833

		local var_67_0 = {
			ja = 5.766,
			ko = 10.833,
			zh = 10.833
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
				arg_67_0:Play122031018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10044ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect10044ui_story == nil then
				arg_67_1.var_.characterEffect10044ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect10044ui_story then
					arg_67_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect10044ui_story then
				arg_67_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_70_6 = 0
			local var_70_7 = 1.375

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[380].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(122031017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 55
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031017", "story_v_out_122031.awb") ~= 0 then
					local var_70_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031017", "story_v_out_122031.awb") / 1000

					if var_70_14 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_6
					end

					if var_70_9.prefab_name ~= "" and arg_67_1.actors_[var_70_9.prefab_name] ~= nil then
						local var_70_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_9.prefab_name].transform, "story_v_out_122031", "122031017", "story_v_out_122031.awb")

						arg_67_1:RecordAudio("122031017", var_70_15)
						arg_67_1:RecordAudio("122031017", var_70_15)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_122031", "122031017", "story_v_out_122031.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_122031", "122031017", "story_v_out_122031.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_16 and arg_67_1.time_ < var_70_6 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play122031018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 122031018
		arg_71_1.duration_ = 7.633

		local var_71_0 = {
			ja = 7.633,
			ko = 3.933,
			zh = 3.933
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
				arg_71_0:Play122031019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10044ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect10044ui_story == nil then
				arg_71_1.var_.characterEffect10044ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect10044ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_71_1.var_.characterEffect10044ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect10044ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_71_1.var_.characterEffect10044ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.25

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_8 = arg_71_1:FormatText(StoryNameCfg[433].name)

				arg_71_1.leftNameTxt_.text = var_74_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_9 = arg_71_1:GetWordFromCfg(122031018)
				local var_74_10 = arg_71_1:FormatText(var_74_9.content)

				arg_71_1.text_.text = var_74_10

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_11 = 10
				local var_74_12 = utf8.len(var_74_10)
				local var_74_13 = var_74_11 <= 0 and var_74_7 or var_74_7 * (var_74_12 / var_74_11)

				if var_74_13 > 0 and var_74_7 < var_74_13 then
					arg_71_1.talkMaxDuration = var_74_13

					if var_74_13 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_10
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031018", "story_v_out_122031.awb") ~= 0 then
					local var_74_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031018", "story_v_out_122031.awb") / 1000

					if var_74_14 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_14 + var_74_6
					end

					if var_74_9.prefab_name ~= "" and arg_71_1.actors_[var_74_9.prefab_name] ~= nil then
						local var_74_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_9.prefab_name].transform, "story_v_out_122031", "122031018", "story_v_out_122031.awb")

						arg_71_1:RecordAudio("122031018", var_74_15)
						arg_71_1:RecordAudio("122031018", var_74_15)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_122031", "122031018", "story_v_out_122031.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_122031", "122031018", "story_v_out_122031.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_16 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_16 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_16

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_16 and arg_71_1.time_ < var_74_6 + var_74_16 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play122031019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 122031019
		arg_75_1.duration_ = 8.533

		local var_75_0 = {
			ja = 7.566,
			ko = 8.533,
			zh = 8.533
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
				arg_75_0:Play122031020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.9

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[433].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(122031019)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 36
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031019", "story_v_out_122031.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031019", "story_v_out_122031.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_122031", "122031019", "story_v_out_122031.awb")

						arg_75_1:RecordAudio("122031019", var_78_9)
						arg_75_1:RecordAudio("122031019", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_122031", "122031019", "story_v_out_122031.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_122031", "122031019", "story_v_out_122031.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play122031020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 122031020
		arg_79_1.duration_ = 8.8

		local var_79_0 = {
			ja = 8.8,
			ko = 8.033,
			zh = 8.033
		}
		local var_79_1 = manager.audio:GetLocalizationFlag()

		if var_79_0[var_79_1] ~= nil then
			arg_79_1.duration_ = var_79_0[var_79_1]
		end

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play122031021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10044ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect10044ui_story == nil then
				arg_79_1.var_.characterEffect10044ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect10044ui_story then
					arg_79_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect10044ui_story then
				arg_79_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action437")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_6 = 0
			local var_82_7 = 1.075

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[380].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(122031020)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 43
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031020", "story_v_out_122031.awb") ~= 0 then
					local var_82_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031020", "story_v_out_122031.awb") / 1000

					if var_82_14 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_14 + var_82_6
					end

					if var_82_9.prefab_name ~= "" and arg_79_1.actors_[var_82_9.prefab_name] ~= nil then
						local var_82_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_9.prefab_name].transform, "story_v_out_122031", "122031020", "story_v_out_122031.awb")

						arg_79_1:RecordAudio("122031020", var_82_15)
						arg_79_1:RecordAudio("122031020", var_82_15)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_122031", "122031020", "story_v_out_122031.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_122031", "122031020", "story_v_out_122031.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_16 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_16 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_16

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_16 and arg_79_1.time_ < var_82_6 + var_82_16 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play122031021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 122031021
		arg_83_1.duration_ = 9.8

		local var_83_0 = {
			ja = 9.8,
			ko = 6.266,
			zh = 6.266
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
				arg_83_0:Play122031022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.85

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[380].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(122031021)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 34
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031021", "story_v_out_122031.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031021", "story_v_out_122031.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_122031", "122031021", "story_v_out_122031.awb")

						arg_83_1:RecordAudio("122031021", var_86_9)
						arg_83_1:RecordAudio("122031021", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_122031", "122031021", "story_v_out_122031.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_122031", "122031021", "story_v_out_122031.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play122031022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 122031022
		arg_87_1.duration_ = 8.933

		local var_87_0 = {
			ja = 8.933,
			ko = 7.633,
			zh = 7.633
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
				arg_87_0:Play122031023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10044ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story == nil then
				arg_87_1.var_.characterEffect10044ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect10044ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10044ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect10044ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10044ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.85

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[433].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_sifangw")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(122031022)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 34
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031022", "story_v_out_122031.awb") ~= 0 then
					local var_90_14 = manager.audio:GetVoiceLength("story_v_out_122031", "122031022", "story_v_out_122031.awb") / 1000

					if var_90_14 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_14 + var_90_6
					end

					if var_90_9.prefab_name ~= "" and arg_87_1.actors_[var_90_9.prefab_name] ~= nil then
						local var_90_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_9.prefab_name].transform, "story_v_out_122031", "122031022", "story_v_out_122031.awb")

						arg_87_1:RecordAudio("122031022", var_90_15)
						arg_87_1:RecordAudio("122031022", var_90_15)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_122031", "122031022", "story_v_out_122031.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_122031", "122031022", "story_v_out_122031.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_16 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_16 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_16

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_16 and arg_87_1.time_ < var_90_6 + var_90_16 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play122031023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 122031023
		arg_91_1.duration_ = 6.9

		local var_91_0 = {
			ja = 6.9,
			ko = 6.833,
			zh = 6.833
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
				arg_91_0:Play122031024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10044ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect10044ui_story == nil then
				arg_91_1.var_.characterEffect10044ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect10044ui_story then
					arg_91_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10044ui_story then
				arg_91_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_94_4 = 0

			if var_94_4 < arg_91_1.time_ and arg_91_1.time_ <= var_94_4 + arg_94_0 then
				arg_91_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_94_5 = 0
			local var_94_6 = 0.7

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_7 = arg_91_1:FormatText(StoryNameCfg[380].name)

				arg_91_1.leftNameTxt_.text = var_94_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(122031023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 28
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_6 or var_94_6 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_6 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_5 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_5
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031023", "story_v_out_122031.awb") ~= 0 then
					local var_94_13 = manager.audio:GetVoiceLength("story_v_out_122031", "122031023", "story_v_out_122031.awb") / 1000

					if var_94_13 + var_94_5 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_5
					end

					if var_94_8.prefab_name ~= "" and arg_91_1.actors_[var_94_8.prefab_name] ~= nil then
						local var_94_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_8.prefab_name].transform, "story_v_out_122031", "122031023", "story_v_out_122031.awb")

						arg_91_1:RecordAudio("122031023", var_94_14)
						arg_91_1:RecordAudio("122031023", var_94_14)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_122031", "122031023", "story_v_out_122031.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_122031", "122031023", "story_v_out_122031.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_15 = math.max(var_94_6, arg_91_1.talkMaxDuration)

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_15 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_5) / var_94_15

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_5 + var_94_15 and arg_91_1.time_ < var_94_5 + var_94_15 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play122031024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 122031024
		arg_95_1.duration_ = 9.666

		local var_95_0 = {
			ja = 6.033,
			ko = 9.666,
			zh = 9.666
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
				arg_95_0:Play122031025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_1 = 0
			local var_98_2 = 1.325

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_3 = arg_95_1:FormatText(StoryNameCfg[380].name)

				arg_95_1.leftNameTxt_.text = var_98_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_4 = arg_95_1:GetWordFromCfg(122031024)
				local var_98_5 = arg_95_1:FormatText(var_98_4.content)

				arg_95_1.text_.text = var_98_5

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_6 = 53
				local var_98_7 = utf8.len(var_98_5)
				local var_98_8 = var_98_6 <= 0 and var_98_2 or var_98_2 * (var_98_7 / var_98_6)

				if var_98_8 > 0 and var_98_2 < var_98_8 then
					arg_95_1.talkMaxDuration = var_98_8

					if var_98_8 + var_98_1 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_1
					end
				end

				arg_95_1.text_.text = var_98_5
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031024", "story_v_out_122031.awb") ~= 0 then
					local var_98_9 = manager.audio:GetVoiceLength("story_v_out_122031", "122031024", "story_v_out_122031.awb") / 1000

					if var_98_9 + var_98_1 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_9 + var_98_1
					end

					if var_98_4.prefab_name ~= "" and arg_95_1.actors_[var_98_4.prefab_name] ~= nil then
						local var_98_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_4.prefab_name].transform, "story_v_out_122031", "122031024", "story_v_out_122031.awb")

						arg_95_1:RecordAudio("122031024", var_98_10)
						arg_95_1:RecordAudio("122031024", var_98_10)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_122031", "122031024", "story_v_out_122031.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_122031", "122031024", "story_v_out_122031.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_11 = math.max(var_98_2, arg_95_1.talkMaxDuration)

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_11 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_1) / var_98_11

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_1 + var_98_11 and arg_95_1.time_ < var_98_1 + var_98_11 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play122031025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 122031025
		arg_99_1.duration_ = 8.033

		local var_99_0 = {
			ja = 8.033,
			ko = 5.733,
			zh = 5.733
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
				arg_99_0:Play122031026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.775

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[380].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(122031025)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 31
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031025", "story_v_out_122031.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031025", "story_v_out_122031.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_122031", "122031025", "story_v_out_122031.awb")

						arg_99_1:RecordAudio("122031025", var_102_9)
						arg_99_1:RecordAudio("122031025", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_122031", "122031025", "story_v_out_122031.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_122031", "122031025", "story_v_out_122031.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play122031026 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 122031026
		arg_103_1.duration_ = 8.8

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play122031027(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10044ui_story"].transform
			local var_106_1 = 1.96599999815226

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10044ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0, 100, 0)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10044ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0, 100, 0)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10044ui_story"]
			local var_106_10 = 1.96599999815226

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story == nil then
				arg_103_1.var_.characterEffect10044ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.034000001847744

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10044ui_story then
					local var_106_13 = Mathf.Lerp(0, 0.5, var_106_12)

					arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_13
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10044ui_story then
				local var_106_14 = 0.5

				arg_103_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10044ui_story.fillRatio = var_106_14
			end

			local var_106_15 = 2
			local var_106_16 = 0.3

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 then
				local var_106_17 = "play"
				local var_106_18 = "effect"

				arg_103_1:AudioAction(var_106_17, var_106_18, "se_story_122_01", "se_story_122_01_buildinghit02", "")
			end

			local var_106_19 = 2
			local var_106_20 = 0.3

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				local var_106_21 = "stop"
				local var_106_22 = "effect"

				arg_103_1:AudioAction(var_106_21, var_106_22, "se_story_122_01", "se_story_122_01_monsterattack01_loop", "")
			end

			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_24 = 2

			if var_106_23 <= arg_103_1.time_ and arg_103_1.time_ < var_106_23 + var_106_24 then
				local var_106_25 = (arg_103_1.time_ - var_106_23) / var_106_24
				local var_106_26 = Color.New(0, 0, 0)

				var_106_26.a = Mathf.Lerp(0, 1, var_106_25)
				arg_103_1.mask_.color = var_106_26
			end

			if arg_103_1.time_ >= var_106_23 + var_106_24 and arg_103_1.time_ < var_106_23 + var_106_24 + arg_106_0 then
				local var_106_27 = Color.New(0, 0, 0)

				var_106_27.a = 1
				arg_103_1.mask_.color = var_106_27
			end

			local var_106_28 = 2

			if var_106_28 < arg_103_1.time_ and arg_103_1.time_ <= var_106_28 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_29 = 2

			if var_106_28 <= arg_103_1.time_ and arg_103_1.time_ < var_106_28 + var_106_29 then
				local var_106_30 = (arg_103_1.time_ - var_106_28) / var_106_29
				local var_106_31 = Color.New(0, 0, 0)

				var_106_31.a = Mathf.Lerp(1, 0, var_106_30)
				arg_103_1.mask_.color = var_106_31
			end

			if arg_103_1.time_ >= var_106_28 + var_106_29 and arg_103_1.time_ < var_106_28 + var_106_29 + arg_106_0 then
				local var_106_32 = Color.New(0, 0, 0)
				local var_106_33 = 0

				arg_103_1.mask_.enabled = false
				var_106_32.a = var_106_33
				arg_103_1.mask_.color = var_106_32
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_34 = 3.8
			local var_106_35 = 1.075

			if var_106_34 < arg_103_1.time_ and arg_103_1.time_ <= var_106_34 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_36 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_36:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_37 = arg_103_1:GetWordFromCfg(122031026)
				local var_106_38 = arg_103_1:FormatText(var_106_37.content)

				arg_103_1.text_.text = var_106_38

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_39 = 43
				local var_106_40 = utf8.len(var_106_38)
				local var_106_41 = var_106_39 <= 0 and var_106_35 or var_106_35 * (var_106_40 / var_106_39)

				if var_106_41 > 0 and var_106_35 < var_106_41 then
					arg_103_1.talkMaxDuration = var_106_41
					var_106_34 = var_106_34 + 0.3

					if var_106_41 + var_106_34 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_41 + var_106_34
					end
				end

				arg_103_1.text_.text = var_106_38
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_42 = var_106_34 + 0.3
			local var_106_43 = math.max(var_106_35, arg_103_1.talkMaxDuration)

			if var_106_42 <= arg_103_1.time_ and arg_103_1.time_ < var_106_42 + var_106_43 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_42) / var_106_43

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_42 + var_106_43 and arg_103_1.time_ < var_106_42 + var_106_43 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play122031027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 122031027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play122031028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				local var_112_2 = "play"
				local var_112_3 = "effect"

				arg_109_1:AudioAction(var_112_2, var_112_3, "se_story_122_01", "se_story_122_01_metaldoor", "")
			end

			local var_112_4 = 0
			local var_112_5 = 1.525

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_6 = arg_109_1:GetWordFromCfg(122031027)
				local var_112_7 = arg_109_1:FormatText(var_112_6.content)

				arg_109_1.text_.text = var_112_7

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_8 = 61
				local var_112_9 = utf8.len(var_112_7)
				local var_112_10 = var_112_8 <= 0 and var_112_5 or var_112_5 * (var_112_9 / var_112_8)

				if var_112_10 > 0 and var_112_5 < var_112_10 then
					arg_109_1.talkMaxDuration = var_112_10

					if var_112_10 + var_112_4 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_10 + var_112_4
					end
				end

				arg_109_1.text_.text = var_112_7
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_11 = math.max(var_112_5, arg_109_1.talkMaxDuration)

			if var_112_4 <= arg_109_1.time_ and arg_109_1.time_ < var_112_4 + var_112_11 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_4) / var_112_11

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_4 + var_112_11 and arg_109_1.time_ < var_112_4 + var_112_11 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play122031028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 122031028
		arg_113_1.duration_ = 10.9

		local var_113_0 = {
			ja = 10.066,
			ko = 10.9,
			zh = 10.9
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
				arg_113_0:Play122031029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10044ui_story"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos10044ui_story = var_116_0.localPosition
			end

			local var_116_2 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2
				local var_116_4 = Vector3.New(0, -0.72, -6.3)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10044ui_story, var_116_4, var_116_3)

				local var_116_5 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_5.x, var_116_5.y, var_116_5.z)

				local var_116_6 = var_116_0.localEulerAngles

				var_116_6.z = 0
				var_116_6.x = 0
				var_116_0.localEulerAngles = var_116_6
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_116_7 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_7.x, var_116_7.y, var_116_7.z)

				local var_116_8 = var_116_0.localEulerAngles

				var_116_8.z = 0
				var_116_8.x = 0
				var_116_0.localEulerAngles = var_116_8
			end

			local var_116_9 = arg_113_1.actors_["10044ui_story"]
			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 and arg_113_1.var_.characterEffect10044ui_story == nil then
				arg_113_1.var_.characterEffect10044ui_story = var_116_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_11 = 0.200000002980232

			if var_116_10 <= arg_113_1.time_ and arg_113_1.time_ < var_116_10 + var_116_11 then
				local var_116_12 = (arg_113_1.time_ - var_116_10) / var_116_11

				if arg_113_1.var_.characterEffect10044ui_story then
					arg_113_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_10 + var_116_11 and arg_113_1.time_ < var_116_10 + var_116_11 + arg_116_0 and arg_113_1.var_.characterEffect10044ui_story then
				arg_113_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_116_13 = 0

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				arg_113_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action2_1")
			end

			local var_116_14 = 0

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_116_15 = 0
			local var_116_16 = 1.15

			if var_116_15 < arg_113_1.time_ and arg_113_1.time_ <= var_116_15 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_17 = arg_113_1:FormatText(StoryNameCfg[380].name)

				arg_113_1.leftNameTxt_.text = var_116_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_18 = arg_113_1:GetWordFromCfg(122031028)
				local var_116_19 = arg_113_1:FormatText(var_116_18.content)

				arg_113_1.text_.text = var_116_19

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_20 = 46
				local var_116_21 = utf8.len(var_116_19)
				local var_116_22 = var_116_20 <= 0 and var_116_16 or var_116_16 * (var_116_21 / var_116_20)

				if var_116_22 > 0 and var_116_16 < var_116_22 then
					arg_113_1.talkMaxDuration = var_116_22

					if var_116_22 + var_116_15 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_22 + var_116_15
					end
				end

				arg_113_1.text_.text = var_116_19
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031028", "story_v_out_122031.awb") ~= 0 then
					local var_116_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031028", "story_v_out_122031.awb") / 1000

					if var_116_23 + var_116_15 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_23 + var_116_15
					end

					if var_116_18.prefab_name ~= "" and arg_113_1.actors_[var_116_18.prefab_name] ~= nil then
						local var_116_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_18.prefab_name].transform, "story_v_out_122031", "122031028", "story_v_out_122031.awb")

						arg_113_1:RecordAudio("122031028", var_116_24)
						arg_113_1:RecordAudio("122031028", var_116_24)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_122031", "122031028", "story_v_out_122031.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_122031", "122031028", "story_v_out_122031.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_25 = math.max(var_116_16, arg_113_1.talkMaxDuration)

			if var_116_15 <= arg_113_1.time_ and arg_113_1.time_ < var_116_15 + var_116_25 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_15) / var_116_25

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_15 + var_116_25 and arg_113_1.time_ < var_116_15 + var_116_25 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play122031029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 122031029
		arg_117_1.duration_ = 7.833

		local var_117_0 = {
			ja = 7.833,
			ko = 2,
			zh = 2
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
				arg_117_0:Play122031030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action2_2")
			end

			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_2 = 0
			local var_120_3 = 0.225

			if var_120_2 < arg_117_1.time_ and arg_117_1.time_ <= var_120_2 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_4 = arg_117_1:FormatText(StoryNameCfg[380].name)

				arg_117_1.leftNameTxt_.text = var_120_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_5 = arg_117_1:GetWordFromCfg(122031029)
				local var_120_6 = arg_117_1:FormatText(var_120_5.content)

				arg_117_1.text_.text = var_120_6

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_7 = 9
				local var_120_8 = utf8.len(var_120_6)
				local var_120_9 = var_120_7 <= 0 and var_120_3 or var_120_3 * (var_120_8 / var_120_7)

				if var_120_9 > 0 and var_120_3 < var_120_9 then
					arg_117_1.talkMaxDuration = var_120_9

					if var_120_9 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_9 + var_120_2
					end
				end

				arg_117_1.text_.text = var_120_6
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031029", "story_v_out_122031.awb") ~= 0 then
					local var_120_10 = manager.audio:GetVoiceLength("story_v_out_122031", "122031029", "story_v_out_122031.awb") / 1000

					if var_120_10 + var_120_2 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_10 + var_120_2
					end

					if var_120_5.prefab_name ~= "" and arg_117_1.actors_[var_120_5.prefab_name] ~= nil then
						local var_120_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_5.prefab_name].transform, "story_v_out_122031", "122031029", "story_v_out_122031.awb")

						arg_117_1:RecordAudio("122031029", var_120_11)
						arg_117_1:RecordAudio("122031029", var_120_11)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_122031", "122031029", "story_v_out_122031.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_122031", "122031029", "story_v_out_122031.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_12 = math.max(var_120_3, arg_117_1.talkMaxDuration)

			if var_120_2 <= arg_117_1.time_ and arg_117_1.time_ < var_120_2 + var_120_12 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_2) / var_120_12

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_2 + var_120_12 and arg_117_1.time_ < var_120_2 + var_120_12 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play122031030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 122031030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play122031031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10044ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10044ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, 100, 0)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10044ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, 100, 0)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["10044ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect10044ui_story == nil then
				arg_121_1.var_.characterEffect10044ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect10044ui_story then
					local var_124_13 = Mathf.Lerp(0, 0.5, var_124_12)

					arg_121_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10044ui_story.fillRatio = var_124_13
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect10044ui_story then
				local var_124_14 = 0.5

				arg_121_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10044ui_story.fillRatio = var_124_14
			end

			local var_124_15 = 0
			local var_124_16 = 1.35

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_17 = arg_121_1:GetWordFromCfg(122031030)
				local var_124_18 = arg_121_1:FormatText(var_124_17.content)

				arg_121_1.text_.text = var_124_18

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_19 = 54
				local var_124_20 = utf8.len(var_124_18)
				local var_124_21 = var_124_19 <= 0 and var_124_16 or var_124_16 * (var_124_20 / var_124_19)

				if var_124_21 > 0 and var_124_16 < var_124_21 then
					arg_121_1.talkMaxDuration = var_124_21

					if var_124_21 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_21 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_18
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_22 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_22 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_22

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_22 and arg_121_1.time_ < var_124_15 + var_124_22 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play122031031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 122031031
		arg_125_1.duration_ = 1.833

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play122031032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.05

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[68].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, true)
				arg_125_1.iconController_:SetSelectedState("hero")

				arg_125_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3039")

				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(122031031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 2
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031031", "story_v_out_122031.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031031", "story_v_out_122031.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_122031", "122031031", "story_v_out_122031.awb")

						arg_125_1:RecordAudio("122031031", var_128_9)
						arg_125_1:RecordAudio("122031031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_122031", "122031031", "story_v_out_122031.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_122031", "122031031", "story_v_out_122031.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play122031032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 122031032
		arg_129_1.duration_ = 8.033

		local var_129_0 = {
			ja = 8.033,
			ko = 3.566,
			zh = 3.566
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
				arg_129_0:Play122031033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10044ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10044ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, -0.72, -6.3)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10044ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["10044ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect10044ui_story == nil then
				arg_129_1.var_.characterEffect10044ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect10044ui_story then
					arg_129_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect10044ui_story then
				arg_129_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.325

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[380].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(122031032)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 13
				local var_132_21 = utf8.len(var_132_19)
				local var_132_22 = var_132_20 <= 0 and var_132_16 or var_132_16 * (var_132_21 / var_132_20)

				if var_132_22 > 0 and var_132_16 < var_132_22 then
					arg_129_1.talkMaxDuration = var_132_22

					if var_132_22 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_22 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_19
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031032", "story_v_out_122031.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031032", "story_v_out_122031.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_out_122031", "122031032", "story_v_out_122031.awb")

						arg_129_1:RecordAudio("122031032", var_132_24)
						arg_129_1:RecordAudio("122031032", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_122031", "122031032", "story_v_out_122031.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_122031", "122031032", "story_v_out_122031.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_25 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_25 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_25

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_25 and arg_129_1.time_ < var_132_15 + var_132_25 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play122031033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 122031033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play122031034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10044ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10044ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, 100, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10044ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, 100, 0)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["10044ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect10044ui_story == nil then
				arg_133_1.var_.characterEffect10044ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect10044ui_story then
					local var_136_13 = Mathf.Lerp(0, 0.5, var_136_12)

					arg_133_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10044ui_story.fillRatio = var_136_13
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect10044ui_story then
				local var_136_14 = 0.5

				arg_133_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10044ui_story.fillRatio = var_136_14
			end

			local var_136_15 = 0
			local var_136_16 = 1.1

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_17 = arg_133_1:GetWordFromCfg(122031033)
				local var_136_18 = arg_133_1:FormatText(var_136_17.content)

				arg_133_1.text_.text = var_136_18

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_19 = 44
				local var_136_20 = utf8.len(var_136_18)
				local var_136_21 = var_136_19 <= 0 and var_136_16 or var_136_16 * (var_136_20 / var_136_19)

				if var_136_21 > 0 and var_136_16 < var_136_21 then
					arg_133_1.talkMaxDuration = var_136_21

					if var_136_21 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_21 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_18
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_22 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_22 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_22

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_22 and arg_133_1.time_ < var_136_15 + var_136_22 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play122031034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 122031034
		arg_137_1.duration_ = 6

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play122031035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = manager.ui.mainCamera.transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.shakeOldPos = var_140_0.localPosition
			end

			local var_140_2 = 1

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / 0.066
				local var_140_4, var_140_5 = math.modf(var_140_3)

				var_140_0.localPosition = Vector3.New(var_140_5 * 0.13, var_140_5 * 0.13, var_140_5 * 0.13) + arg_137_1.var_.shakeOldPos
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = arg_137_1.var_.shakeOldPos
			end

			local var_140_6 = 0

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.allBtn_.enabled = false
			end

			local var_140_7 = 1

			if arg_137_1.time_ >= var_140_6 + var_140_7 and arg_137_1.time_ < var_140_6 + var_140_7 + arg_140_0 then
				arg_137_1.allBtn_.enabled = true
			end

			local var_140_8 = 0
			local var_140_9 = 1

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 then
				local var_140_10 = "play"
				local var_140_11 = "effect"

				arg_137_1:AudioAction(var_140_10, var_140_11, "se_story_122_01", "se_story_122_01_buildinghit03", "")
			end

			if arg_137_1.frameCnt_ <= 1 then
				arg_137_1.dialog_:SetActive(false)
			end

			local var_140_12 = 1
			local var_140_13 = 1.575

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0

				arg_137_1.dialog_:SetActive(true)

				local var_140_14 = LeanTween.value(arg_137_1.dialog_, 0, 1, 0.3)

				var_140_14:setOnUpdate(LuaHelper.FloatAction(function(arg_141_0)
					arg_137_1.dialogCg_.alpha = arg_141_0
				end))
				var_140_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_137_1.dialog_)
					var_140_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_137_1.duration_ = arg_137_1.duration_ + 0.3

				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(122031034)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 63
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19
					var_140_12 = var_140_12 + 0.3

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_20 = var_140_12 + 0.3
			local var_140_21 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_20 <= arg_137_1.time_ and arg_137_1.time_ < var_140_20 + var_140_21 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_20) / var_140_21

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_20 + var_140_21 and arg_137_1.time_ < var_140_20 + var_140_21 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play122031035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 122031035
		arg_143_1.duration_ = 9.8

		local var_143_0 = {
			ja = 9.8,
			ko = 8.733,
			zh = 8.733
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
				arg_143_0:Play122031036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10044ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos10044ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, -0.72, -6.3)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10044ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["10044ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect10044ui_story == nil then
				arg_143_1.var_.characterEffect10044ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.200000002980232

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect10044ui_story then
					arg_143_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect10044ui_story then
				arg_143_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_146_13 = 0

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_146_15 = 0
			local var_146_16 = 0.8

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_17 = arg_143_1:FormatText(StoryNameCfg[380].name)

				arg_143_1.leftNameTxt_.text = var_146_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_18 = arg_143_1:GetWordFromCfg(122031035)
				local var_146_19 = arg_143_1:FormatText(var_146_18.content)

				arg_143_1.text_.text = var_146_19

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_20 = 32
				local var_146_21 = utf8.len(var_146_19)
				local var_146_22 = var_146_20 <= 0 and var_146_16 or var_146_16 * (var_146_21 / var_146_20)

				if var_146_22 > 0 and var_146_16 < var_146_22 then
					arg_143_1.talkMaxDuration = var_146_22

					if var_146_22 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_22 + var_146_15
					end
				end

				arg_143_1.text_.text = var_146_19
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031035", "story_v_out_122031.awb") ~= 0 then
					local var_146_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031035", "story_v_out_122031.awb") / 1000

					if var_146_23 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_23 + var_146_15
					end

					if var_146_18.prefab_name ~= "" and arg_143_1.actors_[var_146_18.prefab_name] ~= nil then
						local var_146_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_18.prefab_name].transform, "story_v_out_122031", "122031035", "story_v_out_122031.awb")

						arg_143_1:RecordAudio("122031035", var_146_24)
						arg_143_1:RecordAudio("122031035", var_146_24)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_122031", "122031035", "story_v_out_122031.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_122031", "122031035", "story_v_out_122031.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_16, arg_143_1.talkMaxDuration)

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_15) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_15 + var_146_25 and arg_143_1.time_ < var_146_15 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play122031036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 122031036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play122031037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10044ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10044ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, 100, 0)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10044ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, 100, 0)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = arg_147_1.actors_["10044ui_story"]
			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 and arg_147_1.var_.characterEffect10044ui_story == nil then
				arg_147_1.var_.characterEffect10044ui_story = var_150_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_11 = 0.200000002980232

			if var_150_10 <= arg_147_1.time_ and arg_147_1.time_ < var_150_10 + var_150_11 then
				local var_150_12 = (arg_147_1.time_ - var_150_10) / var_150_11

				if arg_147_1.var_.characterEffect10044ui_story then
					local var_150_13 = Mathf.Lerp(0, 0.5, var_150_12)

					arg_147_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_147_1.var_.characterEffect10044ui_story.fillRatio = var_150_13
				end
			end

			if arg_147_1.time_ >= var_150_10 + var_150_11 and arg_147_1.time_ < var_150_10 + var_150_11 + arg_150_0 and arg_147_1.var_.characterEffect10044ui_story then
				local var_150_14 = 0.5

				arg_147_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_147_1.var_.characterEffect10044ui_story.fillRatio = var_150_14
			end

			local var_150_15 = 0
			local var_150_16 = 1.45

			if var_150_15 < arg_147_1.time_ and arg_147_1.time_ <= var_150_15 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_17 = arg_147_1:GetWordFromCfg(122031036)
				local var_150_18 = arg_147_1:FormatText(var_150_17.content)

				arg_147_1.text_.text = var_150_18

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_19 = 58
				local var_150_20 = utf8.len(var_150_18)
				local var_150_21 = var_150_19 <= 0 and var_150_16 or var_150_16 * (var_150_20 / var_150_19)

				if var_150_21 > 0 and var_150_16 < var_150_21 then
					arg_147_1.talkMaxDuration = var_150_21

					if var_150_21 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_21 + var_150_15
					end
				end

				arg_147_1.text_.text = var_150_18
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_16, arg_147_1.talkMaxDuration)

			if var_150_15 <= arg_147_1.time_ and arg_147_1.time_ < var_150_15 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_15) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_15 + var_150_22 and arg_147_1.time_ < var_150_15 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play122031037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 122031037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play122031038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.85

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_2 = arg_151_1:GetWordFromCfg(122031037)
				local var_154_3 = arg_151_1:FormatText(var_154_2.content)

				arg_151_1.text_.text = var_154_3

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_4 = 34
				local var_154_5 = utf8.len(var_154_3)
				local var_154_6 = var_154_4 <= 0 and var_154_1 or var_154_1 * (var_154_5 / var_154_4)

				if var_154_6 > 0 and var_154_1 < var_154_6 then
					arg_151_1.talkMaxDuration = var_154_6

					if var_154_6 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_6 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_3
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_7 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_7 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_7

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_7 and arg_151_1.time_ < var_154_0 + var_154_7 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play122031038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 122031038
		arg_155_1.duration_ = 8.933

		local var_155_0 = {
			ja = 6.4,
			ko = 8.933,
			zh = 8.933
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play122031039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10044ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10044ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0, -0.72, -6.3)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10044ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["10044ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect10044ui_story == nil then
				arg_155_1.var_.characterEffect10044ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect10044ui_story then
					arg_155_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect10044ui_story then
				arg_155_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_158_15 = 0
			local var_158_16 = 0.8

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_17 = arg_155_1:FormatText(StoryNameCfg[380].name)

				arg_155_1.leftNameTxt_.text = var_158_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_18 = arg_155_1:GetWordFromCfg(122031038)
				local var_158_19 = arg_155_1:FormatText(var_158_18.content)

				arg_155_1.text_.text = var_158_19

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_20 = 32
				local var_158_21 = utf8.len(var_158_19)
				local var_158_22 = var_158_20 <= 0 and var_158_16 or var_158_16 * (var_158_21 / var_158_20)

				if var_158_22 > 0 and var_158_16 < var_158_22 then
					arg_155_1.talkMaxDuration = var_158_22

					if var_158_22 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_22 + var_158_15
					end
				end

				arg_155_1.text_.text = var_158_19
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031038", "story_v_out_122031.awb") ~= 0 then
					local var_158_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031038", "story_v_out_122031.awb") / 1000

					if var_158_23 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_23 + var_158_15
					end

					if var_158_18.prefab_name ~= "" and arg_155_1.actors_[var_158_18.prefab_name] ~= nil then
						local var_158_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_18.prefab_name].transform, "story_v_out_122031", "122031038", "story_v_out_122031.awb")

						arg_155_1:RecordAudio("122031038", var_158_24)
						arg_155_1:RecordAudio("122031038", var_158_24)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_122031", "122031038", "story_v_out_122031.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_122031", "122031038", "story_v_out_122031.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_25 = math.max(var_158_16, arg_155_1.talkMaxDuration)

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_25 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_15) / var_158_25

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_15 + var_158_25 and arg_155_1.time_ < var_158_15 + var_158_25 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play122031039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 122031039
		arg_159_1.duration_ = 16.166

		local var_159_0 = {
			ja = 13.8,
			ko = 16.166,
			zh = 16.166
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
				arg_159_0:Play122031040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_2 = 0
			local var_162_3 = 1.45

			if var_162_2 < arg_159_1.time_ and arg_159_1.time_ <= var_162_2 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_4 = arg_159_1:FormatText(StoryNameCfg[380].name)

				arg_159_1.leftNameTxt_.text = var_162_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_5 = arg_159_1:GetWordFromCfg(122031039)
				local var_162_6 = arg_159_1:FormatText(var_162_5.content)

				arg_159_1.text_.text = var_162_6

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_7 = 58
				local var_162_8 = utf8.len(var_162_6)
				local var_162_9 = var_162_7 <= 0 and var_162_3 or var_162_3 * (var_162_8 / var_162_7)

				if var_162_9 > 0 and var_162_3 < var_162_9 then
					arg_159_1.talkMaxDuration = var_162_9

					if var_162_9 + var_162_2 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_9 + var_162_2
					end
				end

				arg_159_1.text_.text = var_162_6
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031039", "story_v_out_122031.awb") ~= 0 then
					local var_162_10 = manager.audio:GetVoiceLength("story_v_out_122031", "122031039", "story_v_out_122031.awb") / 1000

					if var_162_10 + var_162_2 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_10 + var_162_2
					end

					if var_162_5.prefab_name ~= "" and arg_159_1.actors_[var_162_5.prefab_name] ~= nil then
						local var_162_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_5.prefab_name].transform, "story_v_out_122031", "122031039", "story_v_out_122031.awb")

						arg_159_1:RecordAudio("122031039", var_162_11)
						arg_159_1:RecordAudio("122031039", var_162_11)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_122031", "122031039", "story_v_out_122031.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_122031", "122031039", "story_v_out_122031.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_12 = math.max(var_162_3, arg_159_1.talkMaxDuration)

			if var_162_2 <= arg_159_1.time_ and arg_159_1.time_ < var_162_2 + var_162_12 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_2) / var_162_12

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_2 + var_162_12 and arg_159_1.time_ < var_162_2 + var_162_12 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play122031040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 122031040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play122031041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10044ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10044ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, 100, 0)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10044ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, 100, 0)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["10044ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect10044ui_story == nil then
				arg_163_1.var_.characterEffect10044ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect10044ui_story then
					local var_166_13 = Mathf.Lerp(0, 0.5, var_166_12)

					arg_163_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_163_1.var_.characterEffect10044ui_story.fillRatio = var_166_13
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect10044ui_story then
				local var_166_14 = 0.5

				arg_163_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_163_1.var_.characterEffect10044ui_story.fillRatio = var_166_14
			end

			local var_166_15 = 0
			local var_166_16 = 1

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				local var_166_17 = "play"
				local var_166_18 = "effect"

				arg_163_1:AudioAction(var_166_17, var_166_18, "se_story_122_01", "se_story_122_01_monsterattack02_loop", "")
			end

			local var_166_19 = 0
			local var_166_20 = 1.275

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_21 = arg_163_1:GetWordFromCfg(122031040)
				local var_166_22 = arg_163_1:FormatText(var_166_21.content)

				arg_163_1.text_.text = var_166_22

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_23 = 51
				local var_166_24 = utf8.len(var_166_22)
				local var_166_25 = var_166_23 <= 0 and var_166_20 or var_166_20 * (var_166_24 / var_166_23)

				if var_166_25 > 0 and var_166_20 < var_166_25 then
					arg_163_1.talkMaxDuration = var_166_25

					if var_166_25 + var_166_19 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_25 + var_166_19
					end
				end

				arg_163_1.text_.text = var_166_22
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_26 = math.max(var_166_20, arg_163_1.talkMaxDuration)

			if var_166_19 <= arg_163_1.time_ and arg_163_1.time_ < var_166_19 + var_166_26 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_19) / var_166_26

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_19 + var_166_26 and arg_163_1.time_ < var_166_19 + var_166_26 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play122031041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 122031041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play122031042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.175

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_2 = arg_167_1:GetWordFromCfg(122031041)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 47
				local var_170_5 = utf8.len(var_170_3)
				local var_170_6 = var_170_4 <= 0 and var_170_1 or var_170_1 * (var_170_5 / var_170_4)

				if var_170_6 > 0 and var_170_1 < var_170_6 then
					arg_167_1.talkMaxDuration = var_170_6

					if var_170_6 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_6 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_3
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_7 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_7 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_7

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_7 and arg_167_1.time_ < var_170_0 + var_170_7 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play122031042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 122031042
		arg_171_1.duration_ = 5.8

		local var_171_0 = {
			ja = 5.8,
			ko = 4.033,
			zh = 4.033
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
				arg_171_0:Play122031043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10044ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos10044ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, -0.72, -6.3)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10044ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["10044ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect10044ui_story == nil then
				arg_171_1.var_.characterEffect10044ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect10044ui_story then
					arg_171_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect10044ui_story then
				arg_171_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_174_15 = 0
			local var_174_16 = 0.25

			if var_174_15 < arg_171_1.time_ and arg_171_1.time_ <= var_174_15 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_17 = arg_171_1:FormatText(StoryNameCfg[380].name)

				arg_171_1.leftNameTxt_.text = var_174_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_18 = arg_171_1:GetWordFromCfg(122031042)
				local var_174_19 = arg_171_1:FormatText(var_174_18.content)

				arg_171_1.text_.text = var_174_19

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_20 = 10
				local var_174_21 = utf8.len(var_174_19)
				local var_174_22 = var_174_20 <= 0 and var_174_16 or var_174_16 * (var_174_21 / var_174_20)

				if var_174_22 > 0 and var_174_16 < var_174_22 then
					arg_171_1.talkMaxDuration = var_174_22

					if var_174_22 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_22 + var_174_15
					end
				end

				arg_171_1.text_.text = var_174_19
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031042", "story_v_out_122031.awb") ~= 0 then
					local var_174_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031042", "story_v_out_122031.awb") / 1000

					if var_174_23 + var_174_15 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_23 + var_174_15
					end

					if var_174_18.prefab_name ~= "" and arg_171_1.actors_[var_174_18.prefab_name] ~= nil then
						local var_174_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_18.prefab_name].transform, "story_v_out_122031", "122031042", "story_v_out_122031.awb")

						arg_171_1:RecordAudio("122031042", var_174_24)
						arg_171_1:RecordAudio("122031042", var_174_24)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_122031", "122031042", "story_v_out_122031.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_122031", "122031042", "story_v_out_122031.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_25 = math.max(var_174_16, arg_171_1.talkMaxDuration)

			if var_174_15 <= arg_171_1.time_ and arg_171_1.time_ < var_174_15 + var_174_25 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_15) / var_174_25

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_15 + var_174_25 and arg_171_1.time_ < var_174_15 + var_174_25 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play122031043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 122031043
		arg_175_1.duration_ = 1.833

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play122031044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10044ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10044ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, 100, 0)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10044ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, 100, 0)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["10044ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect10044ui_story == nil then
				arg_175_1.var_.characterEffect10044ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect10044ui_story then
					local var_178_13 = Mathf.Lerp(0, 0.5, var_178_12)

					arg_175_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10044ui_story.fillRatio = var_178_13
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect10044ui_story then
				local var_178_14 = 0.5

				arg_175_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10044ui_story.fillRatio = var_178_14
			end

			local var_178_15 = manager.ui.mainCamera.transform
			local var_178_16 = 0

			if var_178_16 < arg_175_1.time_ and arg_175_1.time_ <= var_178_16 + arg_178_0 then
				arg_175_1.var_.shakeOldPos = var_178_15.localPosition
			end

			local var_178_17 = 0.6

			if var_178_16 <= arg_175_1.time_ and arg_175_1.time_ < var_178_16 + var_178_17 then
				local var_178_18 = (arg_175_1.time_ - var_178_16) / 0.066
				local var_178_19, var_178_20 = math.modf(var_178_18)

				var_178_15.localPosition = Vector3.New(var_178_20 * 0.13, var_178_20 * 0.13, var_178_20 * 0.13) + arg_175_1.var_.shakeOldPos
			end

			if arg_175_1.time_ >= var_178_16 + var_178_17 and arg_175_1.time_ < var_178_16 + var_178_17 + arg_178_0 then
				var_178_15.localPosition = arg_175_1.var_.shakeOldPos
			end

			local var_178_21 = 0

			if var_178_21 < arg_175_1.time_ and arg_175_1.time_ <= var_178_21 + arg_178_0 then
				arg_175_1.allBtn_.enabled = false
			end

			local var_178_22 = 0.6

			if arg_175_1.time_ >= var_178_21 + var_178_22 and arg_175_1.time_ < var_178_21 + var_178_22 + arg_178_0 then
				arg_175_1.allBtn_.enabled = true
			end

			local var_178_23 = 0
			local var_178_24 = 0.6

			if var_178_23 < arg_175_1.time_ and arg_175_1.time_ <= var_178_23 + arg_178_0 then
				local var_178_25 = "play"
				local var_178_26 = "effect"

				arg_175_1:AudioAction(var_178_25, var_178_26, "se_story_120_00", "se_story_120_00_growl", "")
			end

			local var_178_27 = 0
			local var_178_28 = 0.1

			if var_178_27 < arg_175_1.time_ and arg_175_1.time_ <= var_178_27 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_29 = arg_175_1:FormatText(StoryNameCfg[68].name)

				arg_175_1.leftNameTxt_.text = var_178_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, true)
				arg_175_1.iconController_:SetSelectedState("hero")

				arg_175_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2080")

				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_30 = arg_175_1:GetWordFromCfg(122031043)
				local var_178_31 = arg_175_1:FormatText(var_178_30.content)

				arg_175_1.text_.text = var_178_31

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_32 = 4
				local var_178_33 = utf8.len(var_178_31)
				local var_178_34 = var_178_32 <= 0 and var_178_28 or var_178_28 * (var_178_33 / var_178_32)

				if var_178_34 > 0 and var_178_28 < var_178_34 then
					arg_175_1.talkMaxDuration = var_178_34

					if var_178_34 + var_178_27 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_34 + var_178_27
					end
				end

				arg_175_1.text_.text = var_178_31
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031043", "story_v_out_122031.awb") ~= 0 then
					local var_178_35 = manager.audio:GetVoiceLength("story_v_out_122031", "122031043", "story_v_out_122031.awb") / 1000

					if var_178_35 + var_178_27 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_35 + var_178_27
					end

					if var_178_30.prefab_name ~= "" and arg_175_1.actors_[var_178_30.prefab_name] ~= nil then
						local var_178_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_30.prefab_name].transform, "story_v_out_122031", "122031043", "story_v_out_122031.awb")

						arg_175_1:RecordAudio("122031043", var_178_36)
						arg_175_1:RecordAudio("122031043", var_178_36)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_122031", "122031043", "story_v_out_122031.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_122031", "122031043", "story_v_out_122031.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_37 = math.max(var_178_28, arg_175_1.talkMaxDuration)

			if var_178_27 <= arg_175_1.time_ and arg_175_1.time_ < var_178_27 + var_178_37 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_27) / var_178_37

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_27 + var_178_37 and arg_175_1.time_ < var_178_27 + var_178_37 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play122031044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 122031044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play122031045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.9

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_2 = arg_179_1:GetWordFromCfg(122031044)
				local var_182_3 = arg_179_1:FormatText(var_182_2.content)

				arg_179_1.text_.text = var_182_3

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_4 = 76
				local var_182_5 = utf8.len(var_182_3)
				local var_182_6 = var_182_4 <= 0 and var_182_1 or var_182_1 * (var_182_5 / var_182_4)

				if var_182_6 > 0 and var_182_1 < var_182_6 then
					arg_179_1.talkMaxDuration = var_182_6

					if var_182_6 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_6 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_3
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_7 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_7 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_7

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_7 and arg_179_1.time_ < var_182_0 + var_182_7 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play122031045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 122031045
		arg_183_1.duration_ = 5

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play122031046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 1.475

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_2 = arg_183_1:GetWordFromCfg(122031045)
				local var_186_3 = arg_183_1:FormatText(var_186_2.content)

				arg_183_1.text_.text = var_186_3

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_4 = 59
				local var_186_5 = utf8.len(var_186_3)
				local var_186_6 = var_186_4 <= 0 and var_186_1 or var_186_1 * (var_186_5 / var_186_4)

				if var_186_6 > 0 and var_186_1 < var_186_6 then
					arg_183_1.talkMaxDuration = var_186_6

					if var_186_6 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_6 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_3
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_7 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_7 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_7

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_7 and arg_183_1.time_ < var_186_0 + var_186_7 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play122031046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 122031046
		arg_187_1.duration_ = 3.966

		local var_187_0 = {
			ja = 3.966,
			ko = 3.8,
			zh = 3.8
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
				arg_187_0:Play122031047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10044ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10044ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(0, -0.72, -6.3)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10044ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["10044ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect10044ui_story == nil then
				arg_187_1.var_.characterEffect10044ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect10044ui_story then
					arg_187_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect10044ui_story then
				arg_187_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_190_15 = 0
			local var_190_16 = 0.525

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_17 = arg_187_1:FormatText(StoryNameCfg[380].name)

				arg_187_1.leftNameTxt_.text = var_190_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_18 = arg_187_1:GetWordFromCfg(122031046)
				local var_190_19 = arg_187_1:FormatText(var_190_18.content)

				arg_187_1.text_.text = var_190_19

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_20 = 21
				local var_190_21 = utf8.len(var_190_19)
				local var_190_22 = var_190_20 <= 0 and var_190_16 or var_190_16 * (var_190_21 / var_190_20)

				if var_190_22 > 0 and var_190_16 < var_190_22 then
					arg_187_1.talkMaxDuration = var_190_22

					if var_190_22 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_22 + var_190_15
					end
				end

				arg_187_1.text_.text = var_190_19
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031046", "story_v_out_122031.awb") ~= 0 then
					local var_190_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031046", "story_v_out_122031.awb") / 1000

					if var_190_23 + var_190_15 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_23 + var_190_15
					end

					if var_190_18.prefab_name ~= "" and arg_187_1.actors_[var_190_18.prefab_name] ~= nil then
						local var_190_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_18.prefab_name].transform, "story_v_out_122031", "122031046", "story_v_out_122031.awb")

						arg_187_1:RecordAudio("122031046", var_190_24)
						arg_187_1:RecordAudio("122031046", var_190_24)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_122031", "122031046", "story_v_out_122031.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_122031", "122031046", "story_v_out_122031.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_25 = math.max(var_190_16, arg_187_1.talkMaxDuration)

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_25 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_15) / var_190_25

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_15 + var_190_25 and arg_187_1.time_ < var_190_15 + var_190_25 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play122031047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 122031047
		arg_191_1.duration_ = 9.50000000298023

		local var_191_0 = {
			ja = 9.50000000298023,
			ko = 8.06600000298023,
			zh = 8.06600000298023
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
				arg_191_0:Play122031048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = "ST37a"

			if arg_191_1.bgs_[var_194_0] == nil then
				local var_194_1 = Object.Instantiate(arg_191_1.paintGo_)

				var_194_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_194_0)
				var_194_1.name = var_194_0
				var_194_1.transform.parent = arg_191_1.stage_.transform
				var_194_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_191_1.bgs_[var_194_0] = var_194_1
			end

			local var_194_2 = 2.00000000298023

			if var_194_2 < arg_191_1.time_ and arg_191_1.time_ <= var_194_2 + arg_194_0 then
				local var_194_3 = manager.ui.mainCamera.transform.localPosition
				local var_194_4 = Vector3.New(0, 0, 10) + Vector3.New(var_194_3.x, var_194_3.y, 0)
				local var_194_5 = arg_191_1.bgs_.ST37a

				var_194_5.transform.localPosition = var_194_4
				var_194_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_194_6 = var_194_5:GetComponent("SpriteRenderer")

				if var_194_6 and var_194_6.sprite then
					local var_194_7 = (var_194_5.transform.localPosition - var_194_3).z
					local var_194_8 = manager.ui.mainCameraCom_
					local var_194_9 = 2 * var_194_7 * Mathf.Tan(var_194_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_194_10 = var_194_9 * var_194_8.aspect
					local var_194_11 = var_194_6.sprite.bounds.size.x
					local var_194_12 = var_194_6.sprite.bounds.size.y
					local var_194_13 = var_194_10 / var_194_11
					local var_194_14 = var_194_9 / var_194_12
					local var_194_15 = var_194_14 < var_194_13 and var_194_13 or var_194_14

					var_194_5.transform.localScale = Vector3.New(var_194_15, var_194_15, 0)
				end

				for iter_194_0, iter_194_1 in pairs(arg_191_1.bgs_) do
					if iter_194_0 ~= "ST37a" then
						iter_194_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_194_16 = 0

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_17 = 2

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_17 then
				local var_194_18 = (arg_191_1.time_ - var_194_16) / var_194_17
				local var_194_19 = Color.New(0, 0, 0)

				var_194_19.a = Mathf.Lerp(0, 1, var_194_18)
				arg_191_1.mask_.color = var_194_19
			end

			if arg_191_1.time_ >= var_194_16 + var_194_17 and arg_191_1.time_ < var_194_16 + var_194_17 + arg_194_0 then
				local var_194_20 = Color.New(0, 0, 0)

				var_194_20.a = 1
				arg_191_1.mask_.color = var_194_20
			end

			local var_194_21 = 2

			if var_194_21 < arg_191_1.time_ and arg_191_1.time_ <= var_194_21 + arg_194_0 then
				arg_191_1.mask_.enabled = true
				arg_191_1.mask_.raycastTarget = true

				arg_191_1:SetGaussion(false)
			end

			local var_194_22 = 2

			if var_194_21 <= arg_191_1.time_ and arg_191_1.time_ < var_194_21 + var_194_22 then
				local var_194_23 = (arg_191_1.time_ - var_194_21) / var_194_22
				local var_194_24 = Color.New(0, 0, 0)

				var_194_24.a = Mathf.Lerp(1, 0, var_194_23)
				arg_191_1.mask_.color = var_194_24
			end

			if arg_191_1.time_ >= var_194_21 + var_194_22 and arg_191_1.time_ < var_194_21 + var_194_22 + arg_194_0 then
				local var_194_25 = Color.New(0, 0, 0)
				local var_194_26 = 0

				arg_191_1.mask_.enabled = false
				var_194_25.a = var_194_26
				arg_191_1.mask_.color = var_194_25
			end

			local var_194_27 = arg_191_1.actors_["10044ui_story"].transform
			local var_194_28 = 3.8

			if var_194_28 < arg_191_1.time_ and arg_191_1.time_ <= var_194_28 + arg_194_0 then
				arg_191_1.var_.moveOldPos10044ui_story = var_194_27.localPosition
			end

			local var_194_29 = 0.001

			if var_194_28 <= arg_191_1.time_ and arg_191_1.time_ < var_194_28 + var_194_29 then
				local var_194_30 = (arg_191_1.time_ - var_194_28) / var_194_29
				local var_194_31 = Vector3.New(0, -0.72, -6.3)

				var_194_27.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10044ui_story, var_194_31, var_194_30)

				local var_194_32 = manager.ui.mainCamera.transform.position - var_194_27.position

				var_194_27.forward = Vector3.New(var_194_32.x, var_194_32.y, var_194_32.z)

				local var_194_33 = var_194_27.localEulerAngles

				var_194_33.z = 0
				var_194_33.x = 0
				var_194_27.localEulerAngles = var_194_33
			end

			if arg_191_1.time_ >= var_194_28 + var_194_29 and arg_191_1.time_ < var_194_28 + var_194_29 + arg_194_0 then
				var_194_27.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_194_34 = manager.ui.mainCamera.transform.position - var_194_27.position

				var_194_27.forward = Vector3.New(var_194_34.x, var_194_34.y, var_194_34.z)

				local var_194_35 = var_194_27.localEulerAngles

				var_194_35.z = 0
				var_194_35.x = 0
				var_194_27.localEulerAngles = var_194_35
			end

			local var_194_36 = arg_191_1.actors_["10044ui_story"]
			local var_194_37 = 3.8

			if var_194_37 < arg_191_1.time_ and arg_191_1.time_ <= var_194_37 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story == nil then
				arg_191_1.var_.characterEffect10044ui_story = var_194_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_38 = 0.200000002980232

			if var_194_37 <= arg_191_1.time_ and arg_191_1.time_ < var_194_37 + var_194_38 then
				local var_194_39 = (arg_191_1.time_ - var_194_37) / var_194_38

				if arg_191_1.var_.characterEffect10044ui_story then
					arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_37 + var_194_38 and arg_191_1.time_ < var_194_37 + var_194_38 + arg_194_0 and arg_191_1.var_.characterEffect10044ui_story then
				arg_191_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_194_40 = 3.8

			if var_194_40 < arg_191_1.time_ and arg_191_1.time_ <= var_194_40 + arg_194_0 then
				arg_191_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_194_41 = 3.8

			if var_194_41 < arg_191_1.time_ and arg_191_1.time_ <= var_194_41 + arg_194_0 then
				arg_191_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_194_42 = arg_191_1.actors_["10044ui_story"].transform
			local var_194_43 = 1.96599999815226

			if var_194_43 < arg_191_1.time_ and arg_191_1.time_ <= var_194_43 + arg_194_0 then
				arg_191_1.var_.moveOldPos10044ui_story = var_194_42.localPosition
			end

			local var_194_44 = 0.001

			if var_194_43 <= arg_191_1.time_ and arg_191_1.time_ < var_194_43 + var_194_44 then
				local var_194_45 = (arg_191_1.time_ - var_194_43) / var_194_44
				local var_194_46 = Vector3.New(0, 100, 0)

				var_194_42.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10044ui_story, var_194_46, var_194_45)

				local var_194_47 = manager.ui.mainCamera.transform.position - var_194_42.position

				var_194_42.forward = Vector3.New(var_194_47.x, var_194_47.y, var_194_47.z)

				local var_194_48 = var_194_42.localEulerAngles

				var_194_48.z = 0
				var_194_48.x = 0
				var_194_42.localEulerAngles = var_194_48
			end

			if arg_191_1.time_ >= var_194_43 + var_194_44 and arg_191_1.time_ < var_194_43 + var_194_44 + arg_194_0 then
				var_194_42.localPosition = Vector3.New(0, 100, 0)

				local var_194_49 = manager.ui.mainCamera.transform.position - var_194_42.position

				var_194_42.forward = Vector3.New(var_194_49.x, var_194_49.y, var_194_49.z)

				local var_194_50 = var_194_42.localEulerAngles

				var_194_50.z = 0
				var_194_50.x = 0
				var_194_42.localEulerAngles = var_194_50
			end

			local var_194_51 = 0
			local var_194_52 = 1

			if var_194_51 < arg_191_1.time_ and arg_191_1.time_ <= var_194_51 + arg_194_0 then
				local var_194_53 = "stop"
				local var_194_54 = "effect"

				arg_191_1:AudioAction(var_194_53, var_194_54, "se_story_122_01", "se_story_122_01_monsterattack02_loop", "")
			end

			local var_194_55 = 0
			local var_194_56 = 1

			if var_194_55 < arg_191_1.time_ and arg_191_1.time_ <= var_194_55 + arg_194_0 then
				local var_194_57 = "play"
				local var_194_58 = "music"

				arg_191_1:AudioAction(var_194_57, var_194_58, "se_story_120_04", "se_story_120_04_dooropen", "")
			end

			if arg_191_1.frameCnt_ <= 1 then
				arg_191_1.dialog_:SetActive(false)
			end

			local var_194_59 = 4.00000000298023
			local var_194_60 = 0.4

			if var_194_59 < arg_191_1.time_ and arg_191_1.time_ <= var_194_59 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0

				arg_191_1.dialog_:SetActive(true)

				local var_194_61 = LeanTween.value(arg_191_1.dialog_, 0, 1, 0.3)

				var_194_61:setOnUpdate(LuaHelper.FloatAction(function(arg_195_0)
					arg_191_1.dialogCg_.alpha = arg_195_0
				end))
				var_194_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_191_1.dialog_)
					var_194_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_191_1.duration_ = arg_191_1.duration_ + 0.3

				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_62 = arg_191_1:FormatText(StoryNameCfg[380].name)

				arg_191_1.leftNameTxt_.text = var_194_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_63 = arg_191_1:GetWordFromCfg(122031047)
				local var_194_64 = arg_191_1:FormatText(var_194_63.content)

				arg_191_1.text_.text = var_194_64

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_65 = 16
				local var_194_66 = utf8.len(var_194_64)
				local var_194_67 = var_194_65 <= 0 and var_194_60 or var_194_60 * (var_194_66 / var_194_65)

				if var_194_67 > 0 and var_194_60 < var_194_67 then
					arg_191_1.talkMaxDuration = var_194_67
					var_194_59 = var_194_59 + 0.3

					if var_194_67 + var_194_59 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_67 + var_194_59
					end
				end

				arg_191_1.text_.text = var_194_64
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031047", "story_v_out_122031.awb") ~= 0 then
					local var_194_68 = manager.audio:GetVoiceLength("story_v_out_122031", "122031047", "story_v_out_122031.awb") / 1000

					if var_194_68 + var_194_59 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_68 + var_194_59
					end

					if var_194_63.prefab_name ~= "" and arg_191_1.actors_[var_194_63.prefab_name] ~= nil then
						local var_194_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_63.prefab_name].transform, "story_v_out_122031", "122031047", "story_v_out_122031.awb")

						arg_191_1:RecordAudio("122031047", var_194_69)
						arg_191_1:RecordAudio("122031047", var_194_69)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_122031", "122031047", "story_v_out_122031.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_122031", "122031047", "story_v_out_122031.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_70 = var_194_59 + 0.3
			local var_194_71 = math.max(var_194_60, arg_191_1.talkMaxDuration)

			if var_194_70 <= arg_191_1.time_ and arg_191_1.time_ < var_194_70 + var_194_71 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_70) / var_194_71

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_70 + var_194_71 and arg_191_1.time_ < var_194_70 + var_194_71 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play122031048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 122031048
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play122031049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10044ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos10044ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, 100, 0)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos10044ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, 100, 0)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["10044ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect10044ui_story == nil then
				arg_197_1.var_.characterEffect10044ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect10044ui_story then
					local var_200_13 = Mathf.Lerp(0, 0.5, var_200_12)

					arg_197_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_197_1.var_.characterEffect10044ui_story.fillRatio = var_200_13
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect10044ui_story then
				local var_200_14 = 0.5

				arg_197_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_197_1.var_.characterEffect10044ui_story.fillRatio = var_200_14
			end

			local var_200_15 = 0
			local var_200_16 = 1.6

			if var_200_15 < arg_197_1.time_ and arg_197_1.time_ <= var_200_15 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_17 = arg_197_1:GetWordFromCfg(122031048)
				local var_200_18 = arg_197_1:FormatText(var_200_17.content)

				arg_197_1.text_.text = var_200_18

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_19 = 64
				local var_200_20 = utf8.len(var_200_18)
				local var_200_21 = var_200_19 <= 0 and var_200_16 or var_200_16 * (var_200_20 / var_200_19)

				if var_200_21 > 0 and var_200_16 < var_200_21 then
					arg_197_1.talkMaxDuration = var_200_21

					if var_200_21 + var_200_15 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_15
					end
				end

				arg_197_1.text_.text = var_200_18
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = math.max(var_200_16, arg_197_1.talkMaxDuration)

			if var_200_15 <= arg_197_1.time_ and arg_197_1.time_ < var_200_15 + var_200_22 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_15) / var_200_22

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_15 + var_200_22 and arg_197_1.time_ < var_200_15 + var_200_22 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play122031049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 122031049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play122031050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = manager.ui.mainCamera.transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.shakeOldPos = var_204_0.localPosition
			end

			local var_204_2 = 0.6

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / 0.066
				local var_204_4, var_204_5 = math.modf(var_204_3)

				var_204_0.localPosition = Vector3.New(var_204_5 * 0.13, var_204_5 * 0.13, var_204_5 * 0.13) + arg_201_1.var_.shakeOldPos
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = arg_201_1.var_.shakeOldPos
			end

			local var_204_6 = 0

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.allBtn_.enabled = false
			end

			local var_204_7 = 0.6

			if arg_201_1.time_ >= var_204_6 + var_204_7 and arg_201_1.time_ < var_204_6 + var_204_7 + arg_204_0 then
				arg_201_1.allBtn_.enabled = true
			end

			local var_204_8 = 0
			local var_204_9 = 0.7

			if var_204_8 < arg_201_1.time_ and arg_201_1.time_ <= var_204_8 + arg_204_0 then
				local var_204_10 = "play"
				local var_204_11 = "effect"

				arg_201_1:AudioAction(var_204_10, var_204_11, "se_story_122_01", "se_story_122_01_door03", "")
			end

			local var_204_12 = 0
			local var_204_13 = 0.1

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_14 = arg_201_1:GetWordFromCfg(122031049)
				local var_204_15 = arg_201_1:FormatText(var_204_14.content)

				arg_201_1.text_.text = var_204_15

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_16 = 4
				local var_204_17 = utf8.len(var_204_15)
				local var_204_18 = var_204_16 <= 0 and var_204_13 or var_204_13 * (var_204_17 / var_204_16)

				if var_204_18 > 0 and var_204_13 < var_204_18 then
					arg_201_1.talkMaxDuration = var_204_18

					if var_204_18 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_18 + var_204_12
					end
				end

				arg_201_1.text_.text = var_204_15
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_19 = math.max(var_204_13, arg_201_1.talkMaxDuration)

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_19 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_12) / var_204_19

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_12 + var_204_19 and arg_201_1.time_ < var_204_12 + var_204_19 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play122031050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 122031050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play122031051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 1.8

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_2 = arg_205_1:GetWordFromCfg(122031050)
				local var_208_3 = arg_205_1:FormatText(var_208_2.content)

				arg_205_1.text_.text = var_208_3

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_4 = 72
				local var_208_5 = utf8.len(var_208_3)
				local var_208_6 = var_208_4 <= 0 and var_208_1 or var_208_1 * (var_208_5 / var_208_4)

				if var_208_6 > 0 and var_208_1 < var_208_6 then
					arg_205_1.talkMaxDuration = var_208_6

					if var_208_6 + var_208_0 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_6 + var_208_0
					end
				end

				arg_205_1.text_.text = var_208_3
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_7 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_7 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_7

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_7 and arg_205_1.time_ < var_208_0 + var_208_7 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play122031051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 122031051
		arg_209_1.duration_ = 10.9

		local var_209_0 = {
			ja = 8.066,
			ko = 10.9,
			zh = 10.9
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play122031052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10044ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos10044ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -0.72, -6.3)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos10044ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["10044ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect10044ui_story == nil then
				arg_209_1.var_.characterEffect10044ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect10044ui_story then
					arg_209_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect10044ui_story then
				arg_209_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_212_15 = 0
			local var_212_16 = 0.825

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_17 = arg_209_1:FormatText(StoryNameCfg[380].name)

				arg_209_1.leftNameTxt_.text = var_212_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(122031051)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 33
				local var_212_21 = utf8.len(var_212_19)
				local var_212_22 = var_212_20 <= 0 and var_212_16 or var_212_16 * (var_212_21 / var_212_20)

				if var_212_22 > 0 and var_212_16 < var_212_22 then
					arg_209_1.talkMaxDuration = var_212_22

					if var_212_22 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_22 + var_212_15
					end
				end

				arg_209_1.text_.text = var_212_19
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031051", "story_v_out_122031.awb") ~= 0 then
					local var_212_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031051", "story_v_out_122031.awb") / 1000

					if var_212_23 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_23 + var_212_15
					end

					if var_212_18.prefab_name ~= "" and arg_209_1.actors_[var_212_18.prefab_name] ~= nil then
						local var_212_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_18.prefab_name].transform, "story_v_out_122031", "122031051", "story_v_out_122031.awb")

						arg_209_1:RecordAudio("122031051", var_212_24)
						arg_209_1:RecordAudio("122031051", var_212_24)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_122031", "122031051", "story_v_out_122031.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_122031", "122031051", "story_v_out_122031.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_25 = math.max(var_212_16, arg_209_1.talkMaxDuration)

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_25 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_15) / var_212_25

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_15 + var_212_25 and arg_209_1.time_ < var_212_15 + var_212_25 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play122031052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 122031052
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play122031053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10044ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos10044ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos10044ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["10044ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect10044ui_story == nil then
				arg_213_1.var_.characterEffect10044ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect10044ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_213_1.var_.characterEffect10044ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect10044ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_213_1.var_.characterEffect10044ui_story.fillRatio = var_216_14
			end

			local var_216_15 = 0
			local var_216_16 = 1

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				local var_216_17 = "play"
				local var_216_18 = "effect"

				arg_213_1:AudioAction(var_216_17, var_216_18, "se_story_122_01", "se_story_122_01_door01", "")
			end

			local var_216_19 = 0
			local var_216_20 = 1.25

			if var_216_19 < arg_213_1.time_ and arg_213_1.time_ <= var_216_19 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_21 = arg_213_1:GetWordFromCfg(122031052)
				local var_216_22 = arg_213_1:FormatText(var_216_21.content)

				arg_213_1.text_.text = var_216_22

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_23 = 50
				local var_216_24 = utf8.len(var_216_22)
				local var_216_25 = var_216_23 <= 0 and var_216_20 or var_216_20 * (var_216_24 / var_216_23)

				if var_216_25 > 0 and var_216_20 < var_216_25 then
					arg_213_1.talkMaxDuration = var_216_25

					if var_216_25 + var_216_19 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_25 + var_216_19
					end
				end

				arg_213_1.text_.text = var_216_22
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_26 = math.max(var_216_20, arg_213_1.talkMaxDuration)

			if var_216_19 <= arg_213_1.time_ and arg_213_1.time_ < var_216_19 + var_216_26 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_19) / var_216_26

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_19 + var_216_26 and arg_213_1.time_ < var_216_19 + var_216_26 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play122031053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 122031053
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play122031054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				local var_220_2 = "play"
				local var_220_3 = "effect"

				arg_217_1:AudioAction(var_220_2, var_220_3, "se_story_122_01", "se_story_122_01_door02", "")
			end

			local var_220_4 = 0
			local var_220_5 = 0.625

			if var_220_4 < arg_217_1.time_ and arg_217_1.time_ <= var_220_4 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_6 = arg_217_1:GetWordFromCfg(122031053)
				local var_220_7 = arg_217_1:FormatText(var_220_6.content)

				arg_217_1.text_.text = var_220_7

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_8 = 25
				local var_220_9 = utf8.len(var_220_7)
				local var_220_10 = var_220_8 <= 0 and var_220_5 or var_220_5 * (var_220_9 / var_220_8)

				if var_220_10 > 0 and var_220_5 < var_220_10 then
					arg_217_1.talkMaxDuration = var_220_10

					if var_220_10 + var_220_4 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_10 + var_220_4
					end
				end

				arg_217_1.text_.text = var_220_7
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_11 = math.max(var_220_5, arg_217_1.talkMaxDuration)

			if var_220_4 <= arg_217_1.time_ and arg_217_1.time_ < var_220_4 + var_220_11 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_4) / var_220_11

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_4 + var_220_11 and arg_217_1.time_ < var_220_4 + var_220_11 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play122031054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 122031054
		arg_221_1.duration_ = 2.966

		local var_221_0 = {
			ja = 2.966,
			ko = 2.4,
			zh = 2.4
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play122031055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10044ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10044ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, -0.72, -6.3)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10044ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["10044ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect10044ui_story == nil then
				arg_221_1.var_.characterEffect10044ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect10044ui_story then
					arg_221_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect10044ui_story then
				arg_221_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action2_1")
			end

			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_224_15 = 0
			local var_224_16 = 0.275

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_17 = arg_221_1:FormatText(StoryNameCfg[380].name)

				arg_221_1.leftNameTxt_.text = var_224_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_18 = arg_221_1:GetWordFromCfg(122031054)
				local var_224_19 = arg_221_1:FormatText(var_224_18.content)

				arg_221_1.text_.text = var_224_19

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_20 = 11
				local var_224_21 = utf8.len(var_224_19)
				local var_224_22 = var_224_20 <= 0 and var_224_16 or var_224_16 * (var_224_21 / var_224_20)

				if var_224_22 > 0 and var_224_16 < var_224_22 then
					arg_221_1.talkMaxDuration = var_224_22

					if var_224_22 + var_224_15 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_22 + var_224_15
					end
				end

				arg_221_1.text_.text = var_224_19
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031054", "story_v_out_122031.awb") ~= 0 then
					local var_224_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031054", "story_v_out_122031.awb") / 1000

					if var_224_23 + var_224_15 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_23 + var_224_15
					end

					if var_224_18.prefab_name ~= "" and arg_221_1.actors_[var_224_18.prefab_name] ~= nil then
						local var_224_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_18.prefab_name].transform, "story_v_out_122031", "122031054", "story_v_out_122031.awb")

						arg_221_1:RecordAudio("122031054", var_224_24)
						arg_221_1:RecordAudio("122031054", var_224_24)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_122031", "122031054", "story_v_out_122031.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_122031", "122031054", "story_v_out_122031.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_25 = math.max(var_224_16, arg_221_1.talkMaxDuration)

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_25 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_15) / var_224_25

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_15 + var_224_25 and arg_221_1.time_ < var_224_15 + var_224_25 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play122031055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 122031055
		arg_225_1.duration_ = 3.799999999999

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play122031056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 1.8

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action423")
			end

			local var_228_1 = 1.8

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_228_2 = 0

			if var_228_2 < arg_225_1.time_ and arg_225_1.time_ <= var_228_2 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_3 = 2

			if var_228_2 <= arg_225_1.time_ and arg_225_1.time_ < var_228_2 + var_228_3 then
				local var_228_4 = (arg_225_1.time_ - var_228_2) / var_228_3
				local var_228_5 = Color.New(1, 1, 1)

				var_228_5.a = Mathf.Lerp(1, 0, var_228_4)
				arg_225_1.mask_.color = var_228_5
			end

			if arg_225_1.time_ >= var_228_2 + var_228_3 and arg_225_1.time_ < var_228_2 + var_228_3 + arg_228_0 then
				local var_228_6 = Color.New(1, 1, 1)
				local var_228_7 = 0

				arg_225_1.mask_.enabled = false
				var_228_6.a = var_228_7
				arg_225_1.mask_.color = var_228_6
			end

			if arg_225_1.frameCnt_ <= 1 then
				arg_225_1.dialog_:SetActive(false)
			end

			local var_228_8 = 2
			local var_228_9 = 0.075

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_10 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_10:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_10:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_10:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_11 = arg_225_1:FormatText(StoryNameCfg[380].name)

				arg_225_1.leftNameTxt_.text = var_228_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_12 = arg_225_1:GetWordFromCfg(122031055)
				local var_228_13 = arg_225_1:FormatText(var_228_12.content)

				arg_225_1.text_.text = var_228_13

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_14 = 3
				local var_228_15 = utf8.len(var_228_13)
				local var_228_16 = var_228_14 <= 0 and var_228_9 or var_228_9 * (var_228_15 / var_228_14)

				if var_228_16 > 0 and var_228_9 < var_228_16 then
					arg_225_1.talkMaxDuration = var_228_16
					var_228_8 = var_228_8 + 0.3

					if var_228_16 + var_228_8 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_16 + var_228_8
					end
				end

				arg_225_1.text_.text = var_228_13
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031055", "story_v_out_122031.awb") ~= 0 then
					local var_228_17 = manager.audio:GetVoiceLength("story_v_out_122031", "122031055", "story_v_out_122031.awb") / 1000

					if var_228_17 + var_228_8 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_17 + var_228_8
					end

					if var_228_12.prefab_name ~= "" and arg_225_1.actors_[var_228_12.prefab_name] ~= nil then
						local var_228_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_12.prefab_name].transform, "story_v_out_122031", "122031055", "story_v_out_122031.awb")

						arg_225_1:RecordAudio("122031055", var_228_18)
						arg_225_1:RecordAudio("122031055", var_228_18)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_122031", "122031055", "story_v_out_122031.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_122031", "122031055", "story_v_out_122031.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_19 = var_228_8 + 0.3
			local var_228_20 = math.max(var_228_9, arg_225_1.talkMaxDuration)

			if var_228_19 <= arg_225_1.time_ and arg_225_1.time_ < var_228_19 + var_228_20 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_19) / var_228_20

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_19 + var_228_20 and arg_225_1.time_ < var_228_19 + var_228_20 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play122031056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 122031056
		arg_231_1.duration_ = 3.899999999999

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play122031057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10044ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos10044ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, 100, 0)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10044ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, 100, 0)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["10044ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect10044ui_story == nil then
				arg_231_1.var_.characterEffect10044ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.05

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect10044ui_story then
					local var_234_13 = Mathf.Lerp(0, 0.5, var_234_12)

					arg_231_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_231_1.var_.characterEffect10044ui_story.fillRatio = var_234_13
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect10044ui_story then
				local var_234_14 = 0.5

				arg_231_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_231_1.var_.characterEffect10044ui_story.fillRatio = var_234_14
			end

			local var_234_15 = "1074ui_story"

			if arg_231_1.actors_[var_234_15] == nil then
				local var_234_16 = Object.Instantiate(Asset.Load("Char/" .. var_234_15), arg_231_1.stage_.transform)

				var_234_16.name = var_234_15
				var_234_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_231_1.actors_[var_234_15] = var_234_16

				local var_234_17 = var_234_16:GetComponentInChildren(typeof(CharacterEffect))

				var_234_17.enabled = true

				local var_234_18 = GameObjectTools.GetOrAddComponent(var_234_16, typeof(DynamicBoneHelper))

				if var_234_18 then
					var_234_18:EnableDynamicBone(false)
				end

				arg_231_1:ShowWeapon(var_234_17.transform, false)

				arg_231_1.var_[var_234_15 .. "Animator"] = var_234_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_231_1.var_[var_234_15 .. "Animator"].applyRootMotion = true
				arg_231_1.var_[var_234_15 .. "LipSync"] = var_234_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_234_19 = arg_231_1.actors_["1074ui_story"].transform
			local var_234_20 = 0

			if var_234_20 < arg_231_1.time_ and arg_231_1.time_ <= var_234_20 + arg_234_0 then
				arg_231_1.var_.moveOldPos1074ui_story = var_234_19.localPosition

				local var_234_21 = "1074ui_story"

				arg_231_1:ShowWeapon(arg_231_1.var_[var_234_21 .. "Animator"].transform, true)
			end

			local var_234_22 = 0.001

			if var_234_20 <= arg_231_1.time_ and arg_231_1.time_ < var_234_20 + var_234_22 then
				local var_234_23 = (arg_231_1.time_ - var_234_20) / var_234_22
				local var_234_24 = Vector3.New(0, -1.055, -6.12)

				var_234_19.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1074ui_story, var_234_24, var_234_23)

				local var_234_25 = manager.ui.mainCamera.transform.position - var_234_19.position

				var_234_19.forward = Vector3.New(var_234_25.x, var_234_25.y, var_234_25.z)

				local var_234_26 = var_234_19.localEulerAngles

				var_234_26.z = 0
				var_234_26.x = 0
				var_234_19.localEulerAngles = var_234_26
			end

			if arg_231_1.time_ >= var_234_20 + var_234_22 and arg_231_1.time_ < var_234_20 + var_234_22 + arg_234_0 then
				var_234_19.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_234_27 = manager.ui.mainCamera.transform.position - var_234_19.position

				var_234_19.forward = Vector3.New(var_234_27.x, var_234_27.y, var_234_27.z)

				local var_234_28 = var_234_19.localEulerAngles

				var_234_28.z = 0
				var_234_28.x = 0
				var_234_19.localEulerAngles = var_234_28
			end

			local var_234_29 = arg_231_1.actors_["1074ui_story"]
			local var_234_30 = 0

			if var_234_30 < arg_231_1.time_ and arg_231_1.time_ <= var_234_30 + arg_234_0 and arg_231_1.var_.characterEffect1074ui_story == nil then
				arg_231_1.var_.characterEffect1074ui_story = var_234_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_31 = 0.200000002980232

			if var_234_30 <= arg_231_1.time_ and arg_231_1.time_ < var_234_30 + var_234_31 then
				local var_234_32 = (arg_231_1.time_ - var_234_30) / var_234_31

				if arg_231_1.var_.characterEffect1074ui_story then
					arg_231_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_30 + var_234_31 and arg_231_1.time_ < var_234_30 + var_234_31 + arg_234_0 and arg_231_1.var_.characterEffect1074ui_story then
				arg_231_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_234_33 = 0

			if var_234_33 < arg_231_1.time_ and arg_231_1.time_ <= var_234_33 + arg_234_0 then
				arg_231_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action7_1")
			end

			local var_234_34 = 0

			if var_234_34 < arg_231_1.time_ and arg_231_1.time_ <= var_234_34 + arg_234_0 then
				arg_231_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_234_35 = 0
			local var_234_36 = 0.4

			if var_234_35 < arg_231_1.time_ and arg_231_1.time_ <= var_234_35 + arg_234_0 then
				local var_234_37 = "play"
				local var_234_38 = "music"

				arg_231_1:AudioAction(var_234_37, var_234_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_234_39 = 0
			local var_234_40 = 0.05

			if var_234_39 < arg_231_1.time_ and arg_231_1.time_ <= var_234_39 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_41 = arg_231_1:FormatText(StoryNameCfg[410].name)

				arg_231_1.leftNameTxt_.text = var_234_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_42 = arg_231_1:GetWordFromCfg(122031056)
				local var_234_43 = arg_231_1:FormatText(var_234_42.content)

				arg_231_1.text_.text = var_234_43

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_44 = 2
				local var_234_45 = utf8.len(var_234_43)
				local var_234_46 = var_234_44 <= 0 and var_234_40 or var_234_40 * (var_234_45 / var_234_44)

				if var_234_46 > 0 and var_234_40 < var_234_46 then
					arg_231_1.talkMaxDuration = var_234_46

					if var_234_46 + var_234_39 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_46 + var_234_39
					end
				end

				arg_231_1.text_.text = var_234_43
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031056", "story_v_out_122031.awb") ~= 0 then
					local var_234_47 = manager.audio:GetVoiceLength("story_v_out_122031", "122031056", "story_v_out_122031.awb") / 1000

					if var_234_47 + var_234_39 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_47 + var_234_39
					end

					if var_234_42.prefab_name ~= "" and arg_231_1.actors_[var_234_42.prefab_name] ~= nil then
						local var_234_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_42.prefab_name].transform, "story_v_out_122031", "122031056", "story_v_out_122031.awb")

						arg_231_1:RecordAudio("122031056", var_234_48)
						arg_231_1:RecordAudio("122031056", var_234_48)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_122031", "122031056", "story_v_out_122031.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_122031", "122031056", "story_v_out_122031.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_49 = math.max(var_234_40, arg_231_1.talkMaxDuration)

			if var_234_39 <= arg_231_1.time_ and arg_231_1.time_ < var_234_39 + var_234_49 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_39) / var_234_49

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_39 + var_234_49 and arg_231_1.time_ < var_234_39 + var_234_49 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play122031057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 122031057
		arg_235_1.duration_ = 8.16666666666667

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play122031058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1074ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1074ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, 100, 0)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1074ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, 100, 0)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["1074ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect1074ui_story == nil then
				arg_235_1.var_.characterEffect1074ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect1074ui_story then
					local var_238_13 = Mathf.Lerp(0, 0.5, var_238_12)

					arg_235_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1074ui_story.fillRatio = var_238_13
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect1074ui_story then
				local var_238_14 = 0.5

				arg_235_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1074ui_story.fillRatio = var_238_14
			end

			local var_238_15 = 0
			local var_238_16 = 1

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				local var_238_17 = "play"
				local var_238_18 = "effect"

				arg_235_1:AudioAction(var_238_17, var_238_18, "se_story_122_01", "se_story_122_01_bomb", "")
			end

			local var_238_19 = 0

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.mask_.enabled = true
				arg_235_1.mask_.raycastTarget = true

				arg_235_1:SetGaussion(false)
			end

			local var_238_20 = 3.5

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_20 then
				local var_238_21 = (arg_235_1.time_ - var_238_19) / var_238_20
				local var_238_22 = Color.New(1, 1, 1)

				var_238_22.a = Mathf.Lerp(1, 0, var_238_21)
				arg_235_1.mask_.color = var_238_22
			end

			if arg_235_1.time_ >= var_238_19 + var_238_20 and arg_235_1.time_ < var_238_19 + var_238_20 + arg_238_0 then
				local var_238_23 = Color.New(1, 1, 1)
				local var_238_24 = 0

				arg_235_1.mask_.enabled = false
				var_238_23.a = var_238_24
				arg_235_1.mask_.color = var_238_23
			end

			if arg_235_1.frameCnt_ <= 1 then
				arg_235_1.dialog_:SetActive(false)
			end

			local var_238_25 = 3.16666666666667
			local var_238_26 = 1.3

			if var_238_25 < arg_235_1.time_ and arg_235_1.time_ <= var_238_25 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0

				arg_235_1.dialog_:SetActive(true)

				local var_238_27 = LeanTween.value(arg_235_1.dialog_, 0, 1, 0.3)

				var_238_27:setOnUpdate(LuaHelper.FloatAction(function(arg_239_0)
					arg_235_1.dialogCg_.alpha = arg_239_0
				end))
				var_238_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_235_1.dialog_)
					var_238_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_235_1.duration_ = arg_235_1.duration_ + 0.3

				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_28 = arg_235_1:GetWordFromCfg(122031057)
				local var_238_29 = arg_235_1:FormatText(var_238_28.content)

				arg_235_1.text_.text = var_238_29

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_30 = 52
				local var_238_31 = utf8.len(var_238_29)
				local var_238_32 = var_238_30 <= 0 and var_238_26 or var_238_26 * (var_238_31 / var_238_30)

				if var_238_32 > 0 and var_238_26 < var_238_32 then
					arg_235_1.talkMaxDuration = var_238_32
					var_238_25 = var_238_25 + 0.3

					if var_238_32 + var_238_25 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_32 + var_238_25
					end
				end

				arg_235_1.text_.text = var_238_29
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_33 = var_238_25 + 0.3
			local var_238_34 = math.max(var_238_26, arg_235_1.talkMaxDuration)

			if var_238_33 <= arg_235_1.time_ and arg_235_1.time_ < var_238_33 + var_238_34 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_33) / var_238_34

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_33 + var_238_34 and arg_235_1.time_ < var_238_33 + var_238_34 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play122031058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 122031058
		arg_241_1.duration_ = 14.366

		local var_241_0 = {
			ja = 14.366,
			ko = 6.233333333332,
			zh = 6.233333333332
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play122031059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1074ui_story"].transform
			local var_244_1 = 3.8

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1074ui_story = var_244_0.localPosition

				local var_244_2 = "1074ui_story"

				arg_241_1:ShowWeapon(arg_241_1.var_[var_244_2 .. "Animator"].transform, false)
			end

			local var_244_3 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_3 then
				local var_244_4 = (arg_241_1.time_ - var_244_1) / var_244_3
				local var_244_5 = Vector3.New(-0.7, -1.055, -6.12)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1074ui_story, var_244_5, var_244_4)

				local var_244_6 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_6.x, var_244_6.y, var_244_6.z)

				local var_244_7 = var_244_0.localEulerAngles

				var_244_7.z = 0
				var_244_7.x = 0
				var_244_0.localEulerAngles = var_244_7
			end

			if arg_241_1.time_ >= var_244_1 + var_244_3 and arg_241_1.time_ < var_244_1 + var_244_3 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_244_8 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_8.x, var_244_8.y, var_244_8.z)

				local var_244_9 = var_244_0.localEulerAngles

				var_244_9.z = 0
				var_244_9.x = 0
				var_244_0.localEulerAngles = var_244_9
			end

			local var_244_10 = arg_241_1.actors_["1074ui_story"]
			local var_244_11 = 3.8

			if var_244_11 < arg_241_1.time_ and arg_241_1.time_ <= var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect1074ui_story == nil then
				arg_241_1.var_.characterEffect1074ui_story = var_244_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_12 = 0.200000002980232

			if var_244_11 <= arg_241_1.time_ and arg_241_1.time_ < var_244_11 + var_244_12 then
				local var_244_13 = (arg_241_1.time_ - var_244_11) / var_244_12

				if arg_241_1.var_.characterEffect1074ui_story then
					arg_241_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_11 + var_244_12 and arg_241_1.time_ < var_244_11 + var_244_12 + arg_244_0 and arg_241_1.var_.characterEffect1074ui_story then
				arg_241_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_244_14 = 3.8

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 then
				arg_241_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_244_15 = 3.8

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 then
				arg_241_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_244_16 = arg_241_1.actors_["10044ui_story"].transform
			local var_244_17 = 3.8

			if var_244_17 < arg_241_1.time_ and arg_241_1.time_ <= var_244_17 + arg_244_0 then
				arg_241_1.var_.moveOldPos10044ui_story = var_244_16.localPosition
			end

			local var_244_18 = 0.001

			if var_244_17 <= arg_241_1.time_ and arg_241_1.time_ < var_244_17 + var_244_18 then
				local var_244_19 = (arg_241_1.time_ - var_244_17) / var_244_18
				local var_244_20 = Vector3.New(0.7, -0.72, -6.3)

				var_244_16.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10044ui_story, var_244_20, var_244_19)

				local var_244_21 = manager.ui.mainCamera.transform.position - var_244_16.position

				var_244_16.forward = Vector3.New(var_244_21.x, var_244_21.y, var_244_21.z)

				local var_244_22 = var_244_16.localEulerAngles

				var_244_22.z = 0
				var_244_22.x = 0
				var_244_16.localEulerAngles = var_244_22
			end

			if arg_241_1.time_ >= var_244_17 + var_244_18 and arg_241_1.time_ < var_244_17 + var_244_18 + arg_244_0 then
				var_244_16.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_244_23 = manager.ui.mainCamera.transform.position - var_244_16.position

				var_244_16.forward = Vector3.New(var_244_23.x, var_244_23.y, var_244_23.z)

				local var_244_24 = var_244_16.localEulerAngles

				var_244_24.z = 0
				var_244_24.x = 0
				var_244_16.localEulerAngles = var_244_24
			end

			local var_244_25 = arg_241_1.actors_["10044ui_story"]
			local var_244_26 = 3.8

			if var_244_26 < arg_241_1.time_ and arg_241_1.time_ <= var_244_26 + arg_244_0 and arg_241_1.var_.characterEffect10044ui_story == nil then
				arg_241_1.var_.characterEffect10044ui_story = var_244_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_27 = 0.200000002980232

			if var_244_26 <= arg_241_1.time_ and arg_241_1.time_ < var_244_26 + var_244_27 then
				local var_244_28 = (arg_241_1.time_ - var_244_26) / var_244_27

				if arg_241_1.var_.characterEffect10044ui_story then
					local var_244_29 = Mathf.Lerp(0, 0.5, var_244_28)

					arg_241_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_241_1.var_.characterEffect10044ui_story.fillRatio = var_244_29
				end
			end

			if arg_241_1.time_ >= var_244_26 + var_244_27 and arg_241_1.time_ < var_244_26 + var_244_27 + arg_244_0 and arg_241_1.var_.characterEffect10044ui_story then
				local var_244_30 = 0.5

				arg_241_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_241_1.var_.characterEffect10044ui_story.fillRatio = var_244_30
			end

			local var_244_31 = 0
			local var_244_32 = 0.133333333333333

			if var_244_31 < arg_241_1.time_ and arg_241_1.time_ <= var_244_31 + arg_244_0 then
				local var_244_33 = "play"
				local var_244_34 = "music"

				arg_241_1:AudioAction(var_244_33, var_244_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_244_35 = 0.200000002980232
			local var_244_36 = 0.7

			if var_244_35 < arg_241_1.time_ and arg_241_1.time_ <= var_244_35 + arg_244_0 then
				local var_244_37 = "play"
				local var_244_38 = "music"

				arg_241_1:AudioAction(var_244_37, var_244_38, "bgm_activity_2_0_battle_tianlu", "bgm_activity_2_0_battle_tianlu", "bgm_activity_2_0_battle_tianlu.awb")
			end

			local var_244_39 = 0

			if var_244_39 < arg_241_1.time_ and arg_241_1.time_ <= var_244_39 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_40 = 2

			if var_244_39 <= arg_241_1.time_ and arg_241_1.time_ < var_244_39 + var_244_40 then
				local var_244_41 = (arg_241_1.time_ - var_244_39) / var_244_40
				local var_244_42 = Color.New(0, 0, 0)

				var_244_42.a = Mathf.Lerp(0, 1, var_244_41)
				arg_241_1.mask_.color = var_244_42
			end

			if arg_241_1.time_ >= var_244_39 + var_244_40 and arg_241_1.time_ < var_244_39 + var_244_40 + arg_244_0 then
				local var_244_43 = Color.New(0, 0, 0)

				var_244_43.a = 1
				arg_241_1.mask_.color = var_244_43
			end

			local var_244_44 = 2

			if var_244_44 < arg_241_1.time_ and arg_241_1.time_ <= var_244_44 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_45 = 2

			if var_244_44 <= arg_241_1.time_ and arg_241_1.time_ < var_244_44 + var_244_45 then
				local var_244_46 = (arg_241_1.time_ - var_244_44) / var_244_45
				local var_244_47 = Color.New(0, 0, 0)

				var_244_47.a = Mathf.Lerp(1, 0, var_244_46)
				arg_241_1.mask_.color = var_244_47
			end

			if arg_241_1.time_ >= var_244_44 + var_244_45 and arg_241_1.time_ < var_244_44 + var_244_45 + arg_244_0 then
				local var_244_48 = Color.New(0, 0, 0)
				local var_244_49 = 0

				arg_241_1.mask_.enabled = false
				var_244_48.a = var_244_49
				arg_241_1.mask_.color = var_244_48
			end

			if arg_241_1.frameCnt_ <= 1 then
				arg_241_1.dialog_:SetActive(false)
			end

			local var_244_50 = 4
			local var_244_51 = 0.3

			if var_244_50 < arg_241_1.time_ and arg_241_1.time_ <= var_244_50 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0

				arg_241_1.dialog_:SetActive(true)

				local var_244_52 = LeanTween.value(arg_241_1.dialog_, 0, 1, 0.3)

				var_244_52:setOnUpdate(LuaHelper.FloatAction(function(arg_245_0)
					arg_241_1.dialogCg_.alpha = arg_245_0
				end))
				var_244_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_241_1.dialog_)
					var_244_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_241_1.duration_ = arg_241_1.duration_ + 0.3

				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_53 = arg_241_1:FormatText(StoryNameCfg[410].name)

				arg_241_1.leftNameTxt_.text = var_244_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_54 = arg_241_1:GetWordFromCfg(122031058)
				local var_244_55 = arg_241_1:FormatText(var_244_54.content)

				arg_241_1.text_.text = var_244_55

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_56 = 12
				local var_244_57 = utf8.len(var_244_55)
				local var_244_58 = var_244_56 <= 0 and var_244_51 or var_244_51 * (var_244_57 / var_244_56)

				if var_244_58 > 0 and var_244_51 < var_244_58 then
					arg_241_1.talkMaxDuration = var_244_58
					var_244_50 = var_244_50 + 0.3

					if var_244_58 + var_244_50 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_58 + var_244_50
					end
				end

				arg_241_1.text_.text = var_244_55
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031058", "story_v_out_122031.awb") ~= 0 then
					local var_244_59 = manager.audio:GetVoiceLength("story_v_out_122031", "122031058", "story_v_out_122031.awb") / 1000

					if var_244_59 + var_244_50 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_59 + var_244_50
					end

					if var_244_54.prefab_name ~= "" and arg_241_1.actors_[var_244_54.prefab_name] ~= nil then
						local var_244_60 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_54.prefab_name].transform, "story_v_out_122031", "122031058", "story_v_out_122031.awb")

						arg_241_1:RecordAudio("122031058", var_244_60)
						arg_241_1:RecordAudio("122031058", var_244_60)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_122031", "122031058", "story_v_out_122031.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_122031", "122031058", "story_v_out_122031.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_61 = var_244_50 + 0.3
			local var_244_62 = math.max(var_244_51, arg_241_1.talkMaxDuration)

			if var_244_61 <= arg_241_1.time_ and arg_241_1.time_ < var_244_61 + var_244_62 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_61) / var_244_62

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_61 + var_244_62 and arg_241_1.time_ < var_244_61 + var_244_62 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play122031059 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 122031059
		arg_247_1.duration_ = 9.266

		local var_247_0 = {
			ja = 9.266,
			ko = 5.1,
			zh = 5.1
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
				arg_247_0:Play122031060(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10044ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story == nil then
				arg_247_1.var_.characterEffect10044ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.200000002980232

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect10044ui_story then
					arg_247_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect10044ui_story then
				arg_247_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_250_4 = 0

			if var_250_4 < arg_247_1.time_ and arg_247_1.time_ <= var_250_4 + arg_250_0 then
				arg_247_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action434")
			end

			local var_250_5 = 0

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 then
				arg_247_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_250_6 = arg_247_1.actors_["1074ui_story"]
			local var_250_7 = 0

			if var_250_7 < arg_247_1.time_ and arg_247_1.time_ <= var_250_7 + arg_250_0 and arg_247_1.var_.characterEffect1074ui_story == nil then
				arg_247_1.var_.characterEffect1074ui_story = var_250_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_8 = 0.200000002980232

			if var_250_7 <= arg_247_1.time_ and arg_247_1.time_ < var_250_7 + var_250_8 then
				local var_250_9 = (arg_247_1.time_ - var_250_7) / var_250_8

				if arg_247_1.var_.characterEffect1074ui_story then
					local var_250_10 = Mathf.Lerp(0, 0.5, var_250_9)

					arg_247_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1074ui_story.fillRatio = var_250_10
				end
			end

			if arg_247_1.time_ >= var_250_7 + var_250_8 and arg_247_1.time_ < var_250_7 + var_250_8 + arg_250_0 and arg_247_1.var_.characterEffect1074ui_story then
				local var_250_11 = 0.5

				arg_247_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1074ui_story.fillRatio = var_250_11
			end

			local var_250_12 = 0
			local var_250_13 = 0.525

			if var_250_12 < arg_247_1.time_ and arg_247_1.time_ <= var_250_12 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_14 = arg_247_1:FormatText(StoryNameCfg[380].name)

				arg_247_1.leftNameTxt_.text = var_250_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_15 = arg_247_1:GetWordFromCfg(122031059)
				local var_250_16 = arg_247_1:FormatText(var_250_15.content)

				arg_247_1.text_.text = var_250_16

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_17 = 21
				local var_250_18 = utf8.len(var_250_16)
				local var_250_19 = var_250_17 <= 0 and var_250_13 or var_250_13 * (var_250_18 / var_250_17)

				if var_250_19 > 0 and var_250_13 < var_250_19 then
					arg_247_1.talkMaxDuration = var_250_19

					if var_250_19 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_19 + var_250_12
					end
				end

				arg_247_1.text_.text = var_250_16
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031059", "story_v_out_122031.awb") ~= 0 then
					local var_250_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031059", "story_v_out_122031.awb") / 1000

					if var_250_20 + var_250_12 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_20 + var_250_12
					end

					if var_250_15.prefab_name ~= "" and arg_247_1.actors_[var_250_15.prefab_name] ~= nil then
						local var_250_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_15.prefab_name].transform, "story_v_out_122031", "122031059", "story_v_out_122031.awb")

						arg_247_1:RecordAudio("122031059", var_250_21)
						arg_247_1:RecordAudio("122031059", var_250_21)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_122031", "122031059", "story_v_out_122031.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_122031", "122031059", "story_v_out_122031.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_22 = math.max(var_250_13, arg_247_1.talkMaxDuration)

			if var_250_12 <= arg_247_1.time_ and arg_247_1.time_ < var_250_12 + var_250_22 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_12) / var_250_22

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_12 + var_250_22 and arg_247_1.time_ < var_250_12 + var_250_22 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play122031060 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 122031060
		arg_251_1.duration_ = 4.4

		local var_251_0 = {
			ja = 4.4,
			ko = 2.233,
			zh = 2.233
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play122031061(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1074ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1074ui_story == nil then
				arg_251_1.var_.characterEffect1074ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.200000002980232

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1074ui_story then
					arg_251_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1074ui_story then
				arg_251_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_254_4 = arg_251_1.actors_["10044ui_story"]
			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 and arg_251_1.var_.characterEffect10044ui_story == nil then
				arg_251_1.var_.characterEffect10044ui_story = var_254_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_6 = 0.200000002980232

			if var_254_5 <= arg_251_1.time_ and arg_251_1.time_ < var_254_5 + var_254_6 then
				local var_254_7 = (arg_251_1.time_ - var_254_5) / var_254_6

				if arg_251_1.var_.characterEffect10044ui_story then
					local var_254_8 = Mathf.Lerp(0, 0.5, var_254_7)

					arg_251_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_251_1.var_.characterEffect10044ui_story.fillRatio = var_254_8
				end
			end

			if arg_251_1.time_ >= var_254_5 + var_254_6 and arg_251_1.time_ < var_254_5 + var_254_6 + arg_254_0 and arg_251_1.var_.characterEffect10044ui_story then
				local var_254_9 = 0.5

				arg_251_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_251_1.var_.characterEffect10044ui_story.fillRatio = var_254_9
			end

			local var_254_10 = 0
			local var_254_11 = 0.1

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_12 = arg_251_1:FormatText(StoryNameCfg[410].name)

				arg_251_1.leftNameTxt_.text = var_254_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_13 = arg_251_1:GetWordFromCfg(122031060)
				local var_254_14 = arg_251_1:FormatText(var_254_13.content)

				arg_251_1.text_.text = var_254_14

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_15 = 4
				local var_254_16 = utf8.len(var_254_14)
				local var_254_17 = var_254_15 <= 0 and var_254_11 or var_254_11 * (var_254_16 / var_254_15)

				if var_254_17 > 0 and var_254_11 < var_254_17 then
					arg_251_1.talkMaxDuration = var_254_17

					if var_254_17 + var_254_10 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_17 + var_254_10
					end
				end

				arg_251_1.text_.text = var_254_14
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031060", "story_v_out_122031.awb") ~= 0 then
					local var_254_18 = manager.audio:GetVoiceLength("story_v_out_122031", "122031060", "story_v_out_122031.awb") / 1000

					if var_254_18 + var_254_10 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_18 + var_254_10
					end

					if var_254_13.prefab_name ~= "" and arg_251_1.actors_[var_254_13.prefab_name] ~= nil then
						local var_254_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_13.prefab_name].transform, "story_v_out_122031", "122031060", "story_v_out_122031.awb")

						arg_251_1:RecordAudio("122031060", var_254_19)
						arg_251_1:RecordAudio("122031060", var_254_19)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_122031", "122031060", "story_v_out_122031.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_122031", "122031060", "story_v_out_122031.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_20 = math.max(var_254_11, arg_251_1.talkMaxDuration)

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_20 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_10) / var_254_20

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_10 + var_254_20 and arg_251_1.time_ < var_254_10 + var_254_20 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play122031061 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 122031061
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play122031062(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1074ui_story"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1074ui_story = var_258_0.localPosition
			end

			local var_258_2 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2
				local var_258_4 = Vector3.New(0, 100, 0)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1074ui_story, var_258_4, var_258_3)

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

			local var_258_9 = arg_255_1.actors_["1074ui_story"]
			local var_258_10 = 0

			if var_258_10 < arg_255_1.time_ and arg_255_1.time_ <= var_258_10 + arg_258_0 and arg_255_1.var_.characterEffect1074ui_story == nil then
				arg_255_1.var_.characterEffect1074ui_story = var_258_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_11 = 0.200000002980232

			if var_258_10 <= arg_255_1.time_ and arg_255_1.time_ < var_258_10 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_10) / var_258_11

				if arg_255_1.var_.characterEffect1074ui_story then
					local var_258_13 = Mathf.Lerp(0, 0.5, var_258_12)

					arg_255_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1074ui_story.fillRatio = var_258_13
				end
			end

			if arg_255_1.time_ >= var_258_10 + var_258_11 and arg_255_1.time_ < var_258_10 + var_258_11 + arg_258_0 and arg_255_1.var_.characterEffect1074ui_story then
				local var_258_14 = 0.5

				arg_255_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1074ui_story.fillRatio = var_258_14
			end

			local var_258_15 = arg_255_1.actors_["10044ui_story"].transform
			local var_258_16 = 0

			if var_258_16 < arg_255_1.time_ and arg_255_1.time_ <= var_258_16 + arg_258_0 then
				arg_255_1.var_.moveOldPos10044ui_story = var_258_15.localPosition
			end

			local var_258_17 = 0.001

			if var_258_16 <= arg_255_1.time_ and arg_255_1.time_ < var_258_16 + var_258_17 then
				local var_258_18 = (arg_255_1.time_ - var_258_16) / var_258_17
				local var_258_19 = Vector3.New(0, 100, 0)

				var_258_15.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10044ui_story, var_258_19, var_258_18)

				local var_258_20 = manager.ui.mainCamera.transform.position - var_258_15.position

				var_258_15.forward = Vector3.New(var_258_20.x, var_258_20.y, var_258_20.z)

				local var_258_21 = var_258_15.localEulerAngles

				var_258_21.z = 0
				var_258_21.x = 0
				var_258_15.localEulerAngles = var_258_21
			end

			if arg_255_1.time_ >= var_258_16 + var_258_17 and arg_255_1.time_ < var_258_16 + var_258_17 + arg_258_0 then
				var_258_15.localPosition = Vector3.New(0, 100, 0)

				local var_258_22 = manager.ui.mainCamera.transform.position - var_258_15.position

				var_258_15.forward = Vector3.New(var_258_22.x, var_258_22.y, var_258_22.z)

				local var_258_23 = var_258_15.localEulerAngles

				var_258_23.z = 0
				var_258_23.x = 0
				var_258_15.localEulerAngles = var_258_23
			end

			local var_258_24 = arg_255_1.actors_["10044ui_story"]
			local var_258_25 = 0

			if var_258_25 < arg_255_1.time_ and arg_255_1.time_ <= var_258_25 + arg_258_0 and arg_255_1.var_.characterEffect10044ui_story == nil then
				arg_255_1.var_.characterEffect10044ui_story = var_258_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_26 = 0.200000002980232

			if var_258_25 <= arg_255_1.time_ and arg_255_1.time_ < var_258_25 + var_258_26 then
				local var_258_27 = (arg_255_1.time_ - var_258_25) / var_258_26

				if arg_255_1.var_.characterEffect10044ui_story then
					local var_258_28 = Mathf.Lerp(0, 0.5, var_258_27)

					arg_255_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_255_1.var_.characterEffect10044ui_story.fillRatio = var_258_28
				end
			end

			if arg_255_1.time_ >= var_258_25 + var_258_26 and arg_255_1.time_ < var_258_25 + var_258_26 + arg_258_0 and arg_255_1.var_.characterEffect10044ui_story then
				local var_258_29 = 0.5

				arg_255_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_255_1.var_.characterEffect10044ui_story.fillRatio = var_258_29
			end

			local var_258_30 = 0
			local var_258_31 = 1.1

			if var_258_30 < arg_255_1.time_ and arg_255_1.time_ <= var_258_30 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_32 = arg_255_1:GetWordFromCfg(122031061)
				local var_258_33 = arg_255_1:FormatText(var_258_32.content)

				arg_255_1.text_.text = var_258_33

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_34 = 44
				local var_258_35 = utf8.len(var_258_33)
				local var_258_36 = var_258_34 <= 0 and var_258_31 or var_258_31 * (var_258_35 / var_258_34)

				if var_258_36 > 0 and var_258_31 < var_258_36 then
					arg_255_1.talkMaxDuration = var_258_36

					if var_258_36 + var_258_30 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_36 + var_258_30
					end
				end

				arg_255_1.text_.text = var_258_33
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_37 = math.max(var_258_31, arg_255_1.talkMaxDuration)

			if var_258_30 <= arg_255_1.time_ and arg_255_1.time_ < var_258_30 + var_258_37 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_30) / var_258_37

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_30 + var_258_37 and arg_255_1.time_ < var_258_30 + var_258_37 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play122031062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 122031062
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play122031063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.85

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_2 = arg_259_1:GetWordFromCfg(122031062)
				local var_262_3 = arg_259_1:FormatText(var_262_2.content)

				arg_259_1.text_.text = var_262_3

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_4 = 34
				local var_262_5 = utf8.len(var_262_3)
				local var_262_6 = var_262_4 <= 0 and var_262_1 or var_262_1 * (var_262_5 / var_262_4)

				if var_262_6 > 0 and var_262_1 < var_262_6 then
					arg_259_1.talkMaxDuration = var_262_6

					if var_262_6 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_6 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_3
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_7 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_7 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_7

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_7 and arg_259_1.time_ < var_262_0 + var_262_7 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play122031063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 122031063
		arg_263_1.duration_ = 4.7

		local var_263_0 = {
			ja = 4.7,
			ko = 3.333,
			zh = 3.333
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play122031064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["10044ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos10044ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(-0.7, -0.72, -6.3)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10044ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["10044ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect10044ui_story == nil then
				arg_263_1.var_.characterEffect10044ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect10044ui_story then
					arg_263_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect10044ui_story then
				arg_263_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action443")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_266_15 = arg_263_1.actors_["1074ui_story"].transform
			local var_266_16 = 0

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.var_.moveOldPos1074ui_story = var_266_15.localPosition
			end

			local var_266_17 = 0.001

			if var_266_16 <= arg_263_1.time_ and arg_263_1.time_ < var_266_16 + var_266_17 then
				local var_266_18 = (arg_263_1.time_ - var_266_16) / var_266_17
				local var_266_19 = Vector3.New(0.7, -1.055, -6.12)

				var_266_15.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1074ui_story, var_266_19, var_266_18)

				local var_266_20 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_20.x, var_266_20.y, var_266_20.z)

				local var_266_21 = var_266_15.localEulerAngles

				var_266_21.z = 0
				var_266_21.x = 0
				var_266_15.localEulerAngles = var_266_21
			end

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				var_266_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_266_22 = manager.ui.mainCamera.transform.position - var_266_15.position

				var_266_15.forward = Vector3.New(var_266_22.x, var_266_22.y, var_266_22.z)

				local var_266_23 = var_266_15.localEulerAngles

				var_266_23.z = 0
				var_266_23.x = 0
				var_266_15.localEulerAngles = var_266_23
			end

			local var_266_24 = arg_263_1.actors_["1074ui_story"]
			local var_266_25 = 0

			if var_266_25 < arg_263_1.time_ and arg_263_1.time_ <= var_266_25 + arg_266_0 and arg_263_1.var_.characterEffect1074ui_story == nil then
				arg_263_1.var_.characterEffect1074ui_story = var_266_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_26 = 0.200000002980232

			if var_266_25 <= arg_263_1.time_ and arg_263_1.time_ < var_266_25 + var_266_26 then
				local var_266_27 = (arg_263_1.time_ - var_266_25) / var_266_26

				if arg_263_1.var_.characterEffect1074ui_story then
					local var_266_28 = Mathf.Lerp(0, 0.5, var_266_27)

					arg_263_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_263_1.var_.characterEffect1074ui_story.fillRatio = var_266_28
				end
			end

			if arg_263_1.time_ >= var_266_25 + var_266_26 and arg_263_1.time_ < var_266_25 + var_266_26 + arg_266_0 and arg_263_1.var_.characterEffect1074ui_story then
				local var_266_29 = 0.5

				arg_263_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_263_1.var_.characterEffect1074ui_story.fillRatio = var_266_29
			end

			local var_266_30 = 0
			local var_266_31 = 0.275

			if var_266_30 < arg_263_1.time_ and arg_263_1.time_ <= var_266_30 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_32 = arg_263_1:FormatText(StoryNameCfg[380].name)

				arg_263_1.leftNameTxt_.text = var_266_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_33 = arg_263_1:GetWordFromCfg(122031063)
				local var_266_34 = arg_263_1:FormatText(var_266_33.content)

				arg_263_1.text_.text = var_266_34

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_35 = 11
				local var_266_36 = utf8.len(var_266_34)
				local var_266_37 = var_266_35 <= 0 and var_266_31 or var_266_31 * (var_266_36 / var_266_35)

				if var_266_37 > 0 and var_266_31 < var_266_37 then
					arg_263_1.talkMaxDuration = var_266_37

					if var_266_37 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_37 + var_266_30
					end
				end

				arg_263_1.text_.text = var_266_34
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031063", "story_v_out_122031.awb") ~= 0 then
					local var_266_38 = manager.audio:GetVoiceLength("story_v_out_122031", "122031063", "story_v_out_122031.awb") / 1000

					if var_266_38 + var_266_30 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_38 + var_266_30
					end

					if var_266_33.prefab_name ~= "" and arg_263_1.actors_[var_266_33.prefab_name] ~= nil then
						local var_266_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_33.prefab_name].transform, "story_v_out_122031", "122031063", "story_v_out_122031.awb")

						arg_263_1:RecordAudio("122031063", var_266_39)
						arg_263_1:RecordAudio("122031063", var_266_39)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_122031", "122031063", "story_v_out_122031.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_122031", "122031063", "story_v_out_122031.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_40 = math.max(var_266_31, arg_263_1.talkMaxDuration)

			if var_266_30 <= arg_263_1.time_ and arg_263_1.time_ < var_266_30 + var_266_40 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_30) / var_266_40

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_30 + var_266_40 and arg_263_1.time_ < var_266_30 + var_266_40 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play122031064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 122031064
		arg_267_1.duration_ = 12

		local var_267_0 = {
			ja = 12,
			ko = 9.266,
			zh = 9.266
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play122031065(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 1.225

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[380].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(122031064)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 49
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031064", "story_v_out_122031.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031064", "story_v_out_122031.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_122031", "122031064", "story_v_out_122031.awb")

						arg_267_1:RecordAudio("122031064", var_270_9)
						arg_267_1:RecordAudio("122031064", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_122031", "122031064", "story_v_out_122031.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_122031", "122031064", "story_v_out_122031.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play122031065 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 122031065
		arg_271_1.duration_ = 7.533

		local var_271_0 = {
			ja = 7.533,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_271_1 = manager.audio:GetLocalizationFlag()

		if var_271_0[var_271_1] ~= nil then
			arg_271_1.duration_ = var_271_0[var_271_1]
		end

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play122031066(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1074ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story == nil then
				arg_271_1.var_.characterEffect1074ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1074ui_story then
					arg_271_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story then
				arg_271_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_274_4 = 0

			if var_274_4 < arg_271_1.time_ and arg_271_1.time_ <= var_274_4 + arg_274_0 then
				arg_271_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_274_5 = arg_271_1.actors_["10044ui_story"]
			local var_274_6 = 0

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 and arg_271_1.var_.characterEffect10044ui_story == nil then
				arg_271_1.var_.characterEffect10044ui_story = var_274_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_7 = 0.200000002980232

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_7 then
				local var_274_8 = (arg_271_1.time_ - var_274_6) / var_274_7

				if arg_271_1.var_.characterEffect10044ui_story then
					local var_274_9 = Mathf.Lerp(0, 0.5, var_274_8)

					arg_271_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_271_1.var_.characterEffect10044ui_story.fillRatio = var_274_9
				end
			end

			if arg_271_1.time_ >= var_274_6 + var_274_7 and arg_271_1.time_ < var_274_6 + var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect10044ui_story then
				local var_274_10 = 0.5

				arg_271_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_271_1.var_.characterEffect10044ui_story.fillRatio = var_274_10
			end

			local var_274_11 = 0
			local var_274_12 = 0.125

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_13 = arg_271_1:FormatText(StoryNameCfg[410].name)

				arg_271_1.leftNameTxt_.text = var_274_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_14 = arg_271_1:GetWordFromCfg(122031065)
				local var_274_15 = arg_271_1:FormatText(var_274_14.content)

				arg_271_1.text_.text = var_274_15

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_16 = 5
				local var_274_17 = utf8.len(var_274_15)
				local var_274_18 = var_274_16 <= 0 and var_274_12 or var_274_12 * (var_274_17 / var_274_16)

				if var_274_18 > 0 and var_274_12 < var_274_18 then
					arg_271_1.talkMaxDuration = var_274_18

					if var_274_18 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_18 + var_274_11
					end
				end

				arg_271_1.text_.text = var_274_15
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031065", "story_v_out_122031.awb") ~= 0 then
					local var_274_19 = manager.audio:GetVoiceLength("story_v_out_122031", "122031065", "story_v_out_122031.awb") / 1000

					if var_274_19 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_11
					end

					if var_274_14.prefab_name ~= "" and arg_271_1.actors_[var_274_14.prefab_name] ~= nil then
						local var_274_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_14.prefab_name].transform, "story_v_out_122031", "122031065", "story_v_out_122031.awb")

						arg_271_1:RecordAudio("122031065", var_274_20)
						arg_271_1:RecordAudio("122031065", var_274_20)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_122031", "122031065", "story_v_out_122031.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_122031", "122031065", "story_v_out_122031.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_12, arg_271_1.talkMaxDuration)

			if var_274_11 <= arg_271_1.time_ and arg_271_1.time_ < var_274_11 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_11) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_11 + var_274_21 and arg_271_1.time_ < var_274_11 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play122031066 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 122031066
		arg_275_1.duration_ = 1.999999999999

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play122031067(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10044ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect10044ui_story == nil then
				arg_275_1.var_.characterEffect10044ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect10044ui_story then
					arg_275_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect10044ui_story then
				arg_275_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_278_4 = 0

			if var_278_4 < arg_275_1.time_ and arg_275_1.time_ <= var_278_4 + arg_278_0 then
				arg_275_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_278_5 = 0

			if var_278_5 < arg_275_1.time_ and arg_275_1.time_ <= var_278_5 + arg_278_0 then
				arg_275_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_278_6 = arg_275_1.actors_["1074ui_story"]
			local var_278_7 = 0

			if var_278_7 < arg_275_1.time_ and arg_275_1.time_ <= var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect1074ui_story == nil then
				arg_275_1.var_.characterEffect1074ui_story = var_278_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_8 = 0.200000002980232

			if var_278_7 <= arg_275_1.time_ and arg_275_1.time_ < var_278_7 + var_278_8 then
				local var_278_9 = (arg_275_1.time_ - var_278_7) / var_278_8

				if arg_275_1.var_.characterEffect1074ui_story then
					local var_278_10 = Mathf.Lerp(0, 0.5, var_278_9)

					arg_275_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1074ui_story.fillRatio = var_278_10
				end
			end

			if arg_275_1.time_ >= var_278_7 + var_278_8 and arg_275_1.time_ < var_278_7 + var_278_8 + arg_278_0 and arg_275_1.var_.characterEffect1074ui_story then
				local var_278_11 = 0.5

				arg_275_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1074ui_story.fillRatio = var_278_11
			end

			local var_278_12 = 0
			local var_278_13 = 0.1

			if var_278_12 < arg_275_1.time_ and arg_275_1.time_ <= var_278_12 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_14 = arg_275_1:FormatText(StoryNameCfg[380].name)

				arg_275_1.leftNameTxt_.text = var_278_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_15 = arg_275_1:GetWordFromCfg(122031066)
				local var_278_16 = arg_275_1:FormatText(var_278_15.content)

				arg_275_1.text_.text = var_278_16

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_17 = 4
				local var_278_18 = utf8.len(var_278_16)
				local var_278_19 = var_278_17 <= 0 and var_278_13 or var_278_13 * (var_278_18 / var_278_17)

				if var_278_19 > 0 and var_278_13 < var_278_19 then
					arg_275_1.talkMaxDuration = var_278_19

					if var_278_19 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_12
					end
				end

				arg_275_1.text_.text = var_278_16
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031066", "story_v_out_122031.awb") ~= 0 then
					local var_278_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031066", "story_v_out_122031.awb") / 1000

					if var_278_20 + var_278_12 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_20 + var_278_12
					end

					if var_278_15.prefab_name ~= "" and arg_275_1.actors_[var_278_15.prefab_name] ~= nil then
						local var_278_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_15.prefab_name].transform, "story_v_out_122031", "122031066", "story_v_out_122031.awb")

						arg_275_1:RecordAudio("122031066", var_278_21)
						arg_275_1:RecordAudio("122031066", var_278_21)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_122031", "122031066", "story_v_out_122031.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_122031", "122031066", "story_v_out_122031.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_22 = math.max(var_278_13, arg_275_1.talkMaxDuration)

			if var_278_12 <= arg_275_1.time_ and arg_275_1.time_ < var_278_12 + var_278_22 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_12) / var_278_22

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_12 + var_278_22 and arg_275_1.time_ < var_278_12 + var_278_22 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play122031067 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 122031067
		arg_279_1.duration_ = 10.7

		local var_279_0 = {
			ja = 10.7,
			ko = 8.133,
			zh = 8.133
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play122031068(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1074ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1074ui_story == nil then
				arg_279_1.var_.characterEffect1074ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.200000002980232

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1074ui_story then
					arg_279_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1074ui_story then
				arg_279_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_282_4 = 0

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 then
				arg_279_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_282_6 = arg_279_1.actors_["10044ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect10044ui_story == nil then
				arg_279_1.var_.characterEffect10044ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.200000002980232

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect10044ui_story then
					local var_282_10 = Mathf.Lerp(0, 0.5, var_282_9)

					arg_279_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_279_1.var_.characterEffect10044ui_story.fillRatio = var_282_10
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect10044ui_story then
				local var_282_11 = 0.5

				arg_279_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_279_1.var_.characterEffect10044ui_story.fillRatio = var_282_11
			end

			local var_282_12 = 0
			local var_282_13 = 0.875

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[410].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(122031067)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 35
				local var_282_18 = utf8.len(var_282_16)
				local var_282_19 = var_282_17 <= 0 and var_282_13 or var_282_13 * (var_282_18 / var_282_17)

				if var_282_19 > 0 and var_282_13 < var_282_19 then
					arg_279_1.talkMaxDuration = var_282_19

					if var_282_19 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_19 + var_282_12
					end
				end

				arg_279_1.text_.text = var_282_16
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031067", "story_v_out_122031.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031067", "story_v_out_122031.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_122031", "122031067", "story_v_out_122031.awb")

						arg_279_1:RecordAudio("122031067", var_282_21)
						arg_279_1:RecordAudio("122031067", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_122031", "122031067", "story_v_out_122031.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_122031", "122031067", "story_v_out_122031.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_22 = math.max(var_282_13, arg_279_1.talkMaxDuration)

			if var_282_12 <= arg_279_1.time_ and arg_279_1.time_ < var_282_12 + var_282_22 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_12) / var_282_22

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_12 + var_282_22 and arg_279_1.time_ < var_282_12 + var_282_22 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play122031068 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 122031068
		arg_283_1.duration_ = 12.366

		local var_283_0 = {
			ja = 12.366,
			ko = 5.433,
			zh = 5.433
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play122031069(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10044ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect10044ui_story == nil then
				arg_283_1.var_.characterEffect10044ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect10044ui_story then
					arg_283_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect10044ui_story then
				arg_283_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_286_4 = 0

			if var_286_4 < arg_283_1.time_ and arg_283_1.time_ <= var_286_4 + arg_286_0 then
				arg_283_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action2_1")
			end

			local var_286_5 = 0

			if var_286_5 < arg_283_1.time_ and arg_283_1.time_ <= var_286_5 + arg_286_0 then
				arg_283_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_286_6 = arg_283_1.actors_["1074ui_story"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1074ui_story == nil then
				arg_283_1.var_.characterEffect1074ui_story = var_286_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_8 = 0.200000002980232

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.characterEffect1074ui_story then
					local var_286_10 = Mathf.Lerp(0, 0.5, var_286_9)

					arg_283_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1074ui_story.fillRatio = var_286_10
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1074ui_story then
				local var_286_11 = 0.5

				arg_283_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1074ui_story.fillRatio = var_286_11
			end

			local var_286_12 = 0
			local var_286_13 = 0.55

			if var_286_12 < arg_283_1.time_ and arg_283_1.time_ <= var_286_12 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_14 = arg_283_1:FormatText(StoryNameCfg[380].name)

				arg_283_1.leftNameTxt_.text = var_286_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_15 = arg_283_1:GetWordFromCfg(122031068)
				local var_286_16 = arg_283_1:FormatText(var_286_15.content)

				arg_283_1.text_.text = var_286_16

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_17 = 22
				local var_286_18 = utf8.len(var_286_16)
				local var_286_19 = var_286_17 <= 0 and var_286_13 or var_286_13 * (var_286_18 / var_286_17)

				if var_286_19 > 0 and var_286_13 < var_286_19 then
					arg_283_1.talkMaxDuration = var_286_19

					if var_286_19 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_12
					end
				end

				arg_283_1.text_.text = var_286_16
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031068", "story_v_out_122031.awb") ~= 0 then
					local var_286_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031068", "story_v_out_122031.awb") / 1000

					if var_286_20 + var_286_12 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_20 + var_286_12
					end

					if var_286_15.prefab_name ~= "" and arg_283_1.actors_[var_286_15.prefab_name] ~= nil then
						local var_286_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_15.prefab_name].transform, "story_v_out_122031", "122031068", "story_v_out_122031.awb")

						arg_283_1:RecordAudio("122031068", var_286_21)
						arg_283_1:RecordAudio("122031068", var_286_21)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_122031", "122031068", "story_v_out_122031.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_122031", "122031068", "story_v_out_122031.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_13, arg_283_1.talkMaxDuration)

			if var_286_12 <= arg_283_1.time_ and arg_283_1.time_ < var_286_12 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_12) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_12 + var_286_22 and arg_283_1.time_ < var_286_12 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play122031069 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 122031069
		arg_287_1.duration_ = 5

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play122031070(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10044ui_story"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos10044ui_story = var_290_0.localPosition
			end

			local var_290_2 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2
				local var_290_4 = Vector3.New(0, 100, 0)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos10044ui_story, var_290_4, var_290_3)

				local var_290_5 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_5.x, var_290_5.y, var_290_5.z)

				local var_290_6 = var_290_0.localEulerAngles

				var_290_6.z = 0
				var_290_6.x = 0
				var_290_0.localEulerAngles = var_290_6
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(0, 100, 0)

				local var_290_7 = manager.ui.mainCamera.transform.position - var_290_0.position

				var_290_0.forward = Vector3.New(var_290_7.x, var_290_7.y, var_290_7.z)

				local var_290_8 = var_290_0.localEulerAngles

				var_290_8.z = 0
				var_290_8.x = 0
				var_290_0.localEulerAngles = var_290_8
			end

			local var_290_9 = arg_287_1.actors_["10044ui_story"]
			local var_290_10 = 0

			if var_290_10 < arg_287_1.time_ and arg_287_1.time_ <= var_290_10 + arg_290_0 and arg_287_1.var_.characterEffect10044ui_story == nil then
				arg_287_1.var_.characterEffect10044ui_story = var_290_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_11 = 0.200000002980232

			if var_290_10 <= arg_287_1.time_ and arg_287_1.time_ < var_290_10 + var_290_11 then
				local var_290_12 = (arg_287_1.time_ - var_290_10) / var_290_11

				if arg_287_1.var_.characterEffect10044ui_story then
					local var_290_13 = Mathf.Lerp(0, 0.5, var_290_12)

					arg_287_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_287_1.var_.characterEffect10044ui_story.fillRatio = var_290_13
				end
			end

			if arg_287_1.time_ >= var_290_10 + var_290_11 and arg_287_1.time_ < var_290_10 + var_290_11 + arg_290_0 and arg_287_1.var_.characterEffect10044ui_story then
				local var_290_14 = 0.5

				arg_287_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_287_1.var_.characterEffect10044ui_story.fillRatio = var_290_14
			end

			local var_290_15 = arg_287_1.actors_["1074ui_story"].transform
			local var_290_16 = 0

			if var_290_16 < arg_287_1.time_ and arg_287_1.time_ <= var_290_16 + arg_290_0 then
				arg_287_1.var_.moveOldPos1074ui_story = var_290_15.localPosition
			end

			local var_290_17 = 0.001

			if var_290_16 <= arg_287_1.time_ and arg_287_1.time_ < var_290_16 + var_290_17 then
				local var_290_18 = (arg_287_1.time_ - var_290_16) / var_290_17
				local var_290_19 = Vector3.New(0, 100, 0)

				var_290_15.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos1074ui_story, var_290_19, var_290_18)

				local var_290_20 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_20.x, var_290_20.y, var_290_20.z)

				local var_290_21 = var_290_15.localEulerAngles

				var_290_21.z = 0
				var_290_21.x = 0
				var_290_15.localEulerAngles = var_290_21
			end

			if arg_287_1.time_ >= var_290_16 + var_290_17 and arg_287_1.time_ < var_290_16 + var_290_17 + arg_290_0 then
				var_290_15.localPosition = Vector3.New(0, 100, 0)

				local var_290_22 = manager.ui.mainCamera.transform.position - var_290_15.position

				var_290_15.forward = Vector3.New(var_290_22.x, var_290_22.y, var_290_22.z)

				local var_290_23 = var_290_15.localEulerAngles

				var_290_23.z = 0
				var_290_23.x = 0
				var_290_15.localEulerAngles = var_290_23
			end

			local var_290_24 = arg_287_1.actors_["1074ui_story"]
			local var_290_25 = 0

			if var_290_25 < arg_287_1.time_ and arg_287_1.time_ <= var_290_25 + arg_290_0 and arg_287_1.var_.characterEffect1074ui_story == nil then
				arg_287_1.var_.characterEffect1074ui_story = var_290_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_26 = 0.200000002980232

			if var_290_25 <= arg_287_1.time_ and arg_287_1.time_ < var_290_25 + var_290_26 then
				local var_290_27 = (arg_287_1.time_ - var_290_25) / var_290_26

				if arg_287_1.var_.characterEffect1074ui_story then
					local var_290_28 = Mathf.Lerp(0, 0.5, var_290_27)

					arg_287_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1074ui_story.fillRatio = var_290_28
				end
			end

			if arg_287_1.time_ >= var_290_25 + var_290_26 and arg_287_1.time_ < var_290_25 + var_290_26 + arg_290_0 and arg_287_1.var_.characterEffect1074ui_story then
				local var_290_29 = 0.5

				arg_287_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1074ui_story.fillRatio = var_290_29
			end

			local var_290_30 = 0
			local var_290_31 = 1.375

			if var_290_30 < arg_287_1.time_ and arg_287_1.time_ <= var_290_30 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_32 = arg_287_1:GetWordFromCfg(122031069)
				local var_290_33 = arg_287_1:FormatText(var_290_32.content)

				arg_287_1.text_.text = var_290_33

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_34 = 55
				local var_290_35 = utf8.len(var_290_33)
				local var_290_36 = var_290_34 <= 0 and var_290_31 or var_290_31 * (var_290_35 / var_290_34)

				if var_290_36 > 0 and var_290_31 < var_290_36 then
					arg_287_1.talkMaxDuration = var_290_36

					if var_290_36 + var_290_30 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_36 + var_290_30
					end
				end

				arg_287_1.text_.text = var_290_33
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_37 = math.max(var_290_31, arg_287_1.talkMaxDuration)

			if var_290_30 <= arg_287_1.time_ and arg_287_1.time_ < var_290_30 + var_290_37 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_30) / var_290_37

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_30 + var_290_37 and arg_287_1.time_ < var_290_30 + var_290_37 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play122031070 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 122031070
		arg_291_1.duration_ = 6.833

		local var_291_0 = {
			ja = 6.833,
			ko = 2.1,
			zh = 2.1
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play122031071(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1074ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1074ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1074ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1074ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1074ui_story == nil then
				arg_291_1.var_.characterEffect1074ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1074ui_story then
					arg_291_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1074ui_story then
				arg_291_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_294_13 = 0

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_294_14 = 0

			if var_294_14 < arg_291_1.time_ and arg_291_1.time_ <= var_294_14 + arg_294_0 then
				arg_291_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_294_15 = arg_291_1.actors_["10044ui_story"].transform
			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.var_.moveOldPos10044ui_story = var_294_15.localPosition
			end

			local var_294_17 = 0.001

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Vector3.New(0.7, -0.72, -6.3)

				var_294_15.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10044ui_story, var_294_19, var_294_18)

				local var_294_20 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_20.x, var_294_20.y, var_294_20.z)

				local var_294_21 = var_294_15.localEulerAngles

				var_294_21.z = 0
				var_294_21.x = 0
				var_294_15.localEulerAngles = var_294_21
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				var_294_15.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_294_22 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_22.x, var_294_22.y, var_294_22.z)

				local var_294_23 = var_294_15.localEulerAngles

				var_294_23.z = 0
				var_294_23.x = 0
				var_294_15.localEulerAngles = var_294_23
			end

			local var_294_24 = arg_291_1.actors_["10044ui_story"]
			local var_294_25 = 0

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect10044ui_story == nil then
				arg_291_1.var_.characterEffect10044ui_story = var_294_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_26 = 0.200000002980232

			if var_294_25 <= arg_291_1.time_ and arg_291_1.time_ < var_294_25 + var_294_26 then
				local var_294_27 = (arg_291_1.time_ - var_294_25) / var_294_26

				if arg_291_1.var_.characterEffect10044ui_story then
					local var_294_28 = Mathf.Lerp(0, 0.5, var_294_27)

					arg_291_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_291_1.var_.characterEffect10044ui_story.fillRatio = var_294_28
				end
			end

			if arg_291_1.time_ >= var_294_25 + var_294_26 and arg_291_1.time_ < var_294_25 + var_294_26 + arg_294_0 and arg_291_1.var_.characterEffect10044ui_story then
				local var_294_29 = 0.5

				arg_291_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_291_1.var_.characterEffect10044ui_story.fillRatio = var_294_29
			end

			local var_294_30 = 0

			if var_294_30 < arg_291_1.time_ and arg_291_1.time_ <= var_294_30 + arg_294_0 then
				arg_291_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_294_31 = 0

			if var_294_31 < arg_291_1.time_ and arg_291_1.time_ <= var_294_31 + arg_294_0 then
				arg_291_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_294_32 = 0
			local var_294_33 = 0.3

			if var_294_32 < arg_291_1.time_ and arg_291_1.time_ <= var_294_32 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_34 = arg_291_1:FormatText(StoryNameCfg[410].name)

				arg_291_1.leftNameTxt_.text = var_294_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_35 = arg_291_1:GetWordFromCfg(122031070)
				local var_294_36 = arg_291_1:FormatText(var_294_35.content)

				arg_291_1.text_.text = var_294_36

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_37 = 12
				local var_294_38 = utf8.len(var_294_36)
				local var_294_39 = var_294_37 <= 0 and var_294_33 or var_294_33 * (var_294_38 / var_294_37)

				if var_294_39 > 0 and var_294_33 < var_294_39 then
					arg_291_1.talkMaxDuration = var_294_39

					if var_294_39 + var_294_32 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_39 + var_294_32
					end
				end

				arg_291_1.text_.text = var_294_36
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031070", "story_v_out_122031.awb") ~= 0 then
					local var_294_40 = manager.audio:GetVoiceLength("story_v_out_122031", "122031070", "story_v_out_122031.awb") / 1000

					if var_294_40 + var_294_32 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_40 + var_294_32
					end

					if var_294_35.prefab_name ~= "" and arg_291_1.actors_[var_294_35.prefab_name] ~= nil then
						local var_294_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_35.prefab_name].transform, "story_v_out_122031", "122031070", "story_v_out_122031.awb")

						arg_291_1:RecordAudio("122031070", var_294_41)
						arg_291_1:RecordAudio("122031070", var_294_41)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_122031", "122031070", "story_v_out_122031.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_122031", "122031070", "story_v_out_122031.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_42 = math.max(var_294_33, arg_291_1.talkMaxDuration)

			if var_294_32 <= arg_291_1.time_ and arg_291_1.time_ < var_294_32 + var_294_42 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_32) / var_294_42

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_32 + var_294_42 and arg_291_1.time_ < var_294_32 + var_294_42 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play122031071 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 122031071
		arg_295_1.duration_ = 13.2

		local var_295_0 = {
			ja = 13.2,
			ko = 9.033,
			zh = 9.033
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
				arg_295_0:Play122031072(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10044ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect10044ui_story == nil then
				arg_295_1.var_.characterEffect10044ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.200000002980232

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect10044ui_story then
					arg_295_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect10044ui_story then
				arg_295_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_298_4 = 0

			if var_298_4 < arg_295_1.time_ and arg_295_1.time_ <= var_298_4 + arg_298_0 then
				arg_295_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 then
				arg_295_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_298_6 = arg_295_1.actors_["1074ui_story"]
			local var_298_7 = 0

			if var_298_7 < arg_295_1.time_ and arg_295_1.time_ <= var_298_7 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story == nil then
				arg_295_1.var_.characterEffect1074ui_story = var_298_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_8 = 0.200000002980232

			if var_298_7 <= arg_295_1.time_ and arg_295_1.time_ < var_298_7 + var_298_8 then
				local var_298_9 = (arg_295_1.time_ - var_298_7) / var_298_8

				if arg_295_1.var_.characterEffect1074ui_story then
					local var_298_10 = Mathf.Lerp(0, 0.5, var_298_9)

					arg_295_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1074ui_story.fillRatio = var_298_10
				end
			end

			if arg_295_1.time_ >= var_298_7 + var_298_8 and arg_295_1.time_ < var_298_7 + var_298_8 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story then
				local var_298_11 = 0.5

				arg_295_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1074ui_story.fillRatio = var_298_11
			end

			local var_298_12 = 0
			local var_298_13 = 1.2

			if var_298_12 < arg_295_1.time_ and arg_295_1.time_ <= var_298_12 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_14 = arg_295_1:FormatText(StoryNameCfg[380].name)

				arg_295_1.leftNameTxt_.text = var_298_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_15 = arg_295_1:GetWordFromCfg(122031071)
				local var_298_16 = arg_295_1:FormatText(var_298_15.content)

				arg_295_1.text_.text = var_298_16

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_17 = 48
				local var_298_18 = utf8.len(var_298_16)
				local var_298_19 = var_298_17 <= 0 and var_298_13 or var_298_13 * (var_298_18 / var_298_17)

				if var_298_19 > 0 and var_298_13 < var_298_19 then
					arg_295_1.talkMaxDuration = var_298_19

					if var_298_19 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_19 + var_298_12
					end
				end

				arg_295_1.text_.text = var_298_16
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031071", "story_v_out_122031.awb") ~= 0 then
					local var_298_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031071", "story_v_out_122031.awb") / 1000

					if var_298_20 + var_298_12 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_20 + var_298_12
					end

					if var_298_15.prefab_name ~= "" and arg_295_1.actors_[var_298_15.prefab_name] ~= nil then
						local var_298_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_15.prefab_name].transform, "story_v_out_122031", "122031071", "story_v_out_122031.awb")

						arg_295_1:RecordAudio("122031071", var_298_21)
						arg_295_1:RecordAudio("122031071", var_298_21)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_122031", "122031071", "story_v_out_122031.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_122031", "122031071", "story_v_out_122031.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_22 = math.max(var_298_13, arg_295_1.talkMaxDuration)

			if var_298_12 <= arg_295_1.time_ and arg_295_1.time_ < var_298_12 + var_298_22 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_12) / var_298_22

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_12 + var_298_22 and arg_295_1.time_ < var_298_12 + var_298_22 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play122031072 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 122031072
		arg_299_1.duration_ = 5.8

		local var_299_0 = {
			ja = 5.8,
			ko = 3.166,
			zh = 3.166
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play122031073(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1074ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1074ui_story == nil then
				arg_299_1.var_.characterEffect1074ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.200000002980232

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1074ui_story then
					arg_299_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1074ui_story then
				arg_299_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_302_4 = 0

			if var_302_4 < arg_299_1.time_ and arg_299_1.time_ <= var_302_4 + arg_302_0 then
				arg_299_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_302_5 = 0

			if var_302_5 < arg_299_1.time_ and arg_299_1.time_ <= var_302_5 + arg_302_0 then
				arg_299_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_302_6 = arg_299_1.actors_["10044ui_story"]
			local var_302_7 = 0

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 and arg_299_1.var_.characterEffect10044ui_story == nil then
				arg_299_1.var_.characterEffect10044ui_story = var_302_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_8 = 0.200000002980232

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_8 then
				local var_302_9 = (arg_299_1.time_ - var_302_7) / var_302_8

				if arg_299_1.var_.characterEffect10044ui_story then
					local var_302_10 = Mathf.Lerp(0, 0.5, var_302_9)

					arg_299_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_299_1.var_.characterEffect10044ui_story.fillRatio = var_302_10
				end
			end

			if arg_299_1.time_ >= var_302_7 + var_302_8 and arg_299_1.time_ < var_302_7 + var_302_8 + arg_302_0 and arg_299_1.var_.characterEffect10044ui_story then
				local var_302_11 = 0.5

				arg_299_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_299_1.var_.characterEffect10044ui_story.fillRatio = var_302_11
			end

			local var_302_12 = 0
			local var_302_13 = 0.35

			if var_302_12 < arg_299_1.time_ and arg_299_1.time_ <= var_302_12 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_14 = arg_299_1:FormatText(StoryNameCfg[410].name)

				arg_299_1.leftNameTxt_.text = var_302_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_15 = arg_299_1:GetWordFromCfg(122031072)
				local var_302_16 = arg_299_1:FormatText(var_302_15.content)

				arg_299_1.text_.text = var_302_16

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_17 = 14
				local var_302_18 = utf8.len(var_302_16)
				local var_302_19 = var_302_17 <= 0 and var_302_13 or var_302_13 * (var_302_18 / var_302_17)

				if var_302_19 > 0 and var_302_13 < var_302_19 then
					arg_299_1.talkMaxDuration = var_302_19

					if var_302_19 + var_302_12 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_19 + var_302_12
					end
				end

				arg_299_1.text_.text = var_302_16
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031072", "story_v_out_122031.awb") ~= 0 then
					local var_302_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031072", "story_v_out_122031.awb") / 1000

					if var_302_20 + var_302_12 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_20 + var_302_12
					end

					if var_302_15.prefab_name ~= "" and arg_299_1.actors_[var_302_15.prefab_name] ~= nil then
						local var_302_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_15.prefab_name].transform, "story_v_out_122031", "122031072", "story_v_out_122031.awb")

						arg_299_1:RecordAudio("122031072", var_302_21)
						arg_299_1:RecordAudio("122031072", var_302_21)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_122031", "122031072", "story_v_out_122031.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_122031", "122031072", "story_v_out_122031.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_22 = math.max(var_302_13, arg_299_1.talkMaxDuration)

			if var_302_12 <= arg_299_1.time_ and arg_299_1.time_ < var_302_12 + var_302_22 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_12) / var_302_22

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_12 + var_302_22 and arg_299_1.time_ < var_302_12 + var_302_22 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play122031073 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 122031073
		arg_303_1.duration_ = 6.333

		local var_303_0 = {
			ja = 5.433,
			ko = 6.333,
			zh = 6.333
		}
		local var_303_1 = manager.audio:GetLocalizationFlag()

		if var_303_0[var_303_1] ~= nil then
			arg_303_1.duration_ = var_303_0[var_303_1]
		end

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play122031074(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["10044ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect10044ui_story == nil then
				arg_303_1.var_.characterEffect10044ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.200000002980232

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect10044ui_story then
					arg_303_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect10044ui_story then
				arg_303_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_306_4 = 0

			if var_306_4 < arg_303_1.time_ and arg_303_1.time_ <= var_306_4 + arg_306_0 then
				arg_303_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_306_5 = arg_303_1.actors_["1074ui_story"]
			local var_306_6 = 0

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 and arg_303_1.var_.characterEffect1074ui_story == nil then
				arg_303_1.var_.characterEffect1074ui_story = var_306_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_7 = 0.200000002980232

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_7 then
				local var_306_8 = (arg_303_1.time_ - var_306_6) / var_306_7

				if arg_303_1.var_.characterEffect1074ui_story then
					local var_306_9 = Mathf.Lerp(0, 0.5, var_306_8)

					arg_303_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1074ui_story.fillRatio = var_306_9
				end
			end

			if arg_303_1.time_ >= var_306_6 + var_306_7 and arg_303_1.time_ < var_306_6 + var_306_7 + arg_306_0 and arg_303_1.var_.characterEffect1074ui_story then
				local var_306_10 = 0.5

				arg_303_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1074ui_story.fillRatio = var_306_10
			end

			local var_306_11 = 0
			local var_306_12 = 0.475

			if var_306_11 < arg_303_1.time_ and arg_303_1.time_ <= var_306_11 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_13 = arg_303_1:FormatText(StoryNameCfg[380].name)

				arg_303_1.leftNameTxt_.text = var_306_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_14 = arg_303_1:GetWordFromCfg(122031073)
				local var_306_15 = arg_303_1:FormatText(var_306_14.content)

				arg_303_1.text_.text = var_306_15

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_16 = 19
				local var_306_17 = utf8.len(var_306_15)
				local var_306_18 = var_306_16 <= 0 and var_306_12 or var_306_12 * (var_306_17 / var_306_16)

				if var_306_18 > 0 and var_306_12 < var_306_18 then
					arg_303_1.talkMaxDuration = var_306_18

					if var_306_18 + var_306_11 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_18 + var_306_11
					end
				end

				arg_303_1.text_.text = var_306_15
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031073", "story_v_out_122031.awb") ~= 0 then
					local var_306_19 = manager.audio:GetVoiceLength("story_v_out_122031", "122031073", "story_v_out_122031.awb") / 1000

					if var_306_19 + var_306_11 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_19 + var_306_11
					end

					if var_306_14.prefab_name ~= "" and arg_303_1.actors_[var_306_14.prefab_name] ~= nil then
						local var_306_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_14.prefab_name].transform, "story_v_out_122031", "122031073", "story_v_out_122031.awb")

						arg_303_1:RecordAudio("122031073", var_306_20)
						arg_303_1:RecordAudio("122031073", var_306_20)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_122031", "122031073", "story_v_out_122031.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_122031", "122031073", "story_v_out_122031.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_21 = math.max(var_306_12, arg_303_1.talkMaxDuration)

			if var_306_11 <= arg_303_1.time_ and arg_303_1.time_ < var_306_11 + var_306_21 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_11) / var_306_21

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_11 + var_306_21 and arg_303_1.time_ < var_306_11 + var_306_21 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play122031074 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 122031074
		arg_307_1.duration_ = 7.233

		local var_307_0 = {
			ja = 7.233,
			ko = 5.933,
			zh = 5.933
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play122031075(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1074ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and arg_307_1.var_.characterEffect1074ui_story == nil then
				arg_307_1.var_.characterEffect1074ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1074ui_story then
					arg_307_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and arg_307_1.var_.characterEffect1074ui_story then
				arg_307_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_310_4 = 0

			if var_310_4 < arg_307_1.time_ and arg_307_1.time_ <= var_310_4 + arg_310_0 then
				arg_307_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_310_5 = 0

			if var_310_5 < arg_307_1.time_ and arg_307_1.time_ <= var_310_5 + arg_310_0 then
				arg_307_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_310_6 = arg_307_1.actors_["10044ui_story"]
			local var_310_7 = 0

			if var_310_7 < arg_307_1.time_ and arg_307_1.time_ <= var_310_7 + arg_310_0 and arg_307_1.var_.characterEffect10044ui_story == nil then
				arg_307_1.var_.characterEffect10044ui_story = var_310_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_8 = 0.200000002980232

			if var_310_7 <= arg_307_1.time_ and arg_307_1.time_ < var_310_7 + var_310_8 then
				local var_310_9 = (arg_307_1.time_ - var_310_7) / var_310_8

				if arg_307_1.var_.characterEffect10044ui_story then
					local var_310_10 = Mathf.Lerp(0, 0.5, var_310_9)

					arg_307_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_307_1.var_.characterEffect10044ui_story.fillRatio = var_310_10
				end
			end

			if arg_307_1.time_ >= var_310_7 + var_310_8 and arg_307_1.time_ < var_310_7 + var_310_8 + arg_310_0 and arg_307_1.var_.characterEffect10044ui_story then
				local var_310_11 = 0.5

				arg_307_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_307_1.var_.characterEffect10044ui_story.fillRatio = var_310_11
			end

			local var_310_12 = 0
			local var_310_13 = 0.675

			if var_310_12 < arg_307_1.time_ and arg_307_1.time_ <= var_310_12 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_14 = arg_307_1:FormatText(StoryNameCfg[410].name)

				arg_307_1.leftNameTxt_.text = var_310_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_15 = arg_307_1:GetWordFromCfg(122031074)
				local var_310_16 = arg_307_1:FormatText(var_310_15.content)

				arg_307_1.text_.text = var_310_16

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_17 = 27
				local var_310_18 = utf8.len(var_310_16)
				local var_310_19 = var_310_17 <= 0 and var_310_13 or var_310_13 * (var_310_18 / var_310_17)

				if var_310_19 > 0 and var_310_13 < var_310_19 then
					arg_307_1.talkMaxDuration = var_310_19

					if var_310_19 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_19 + var_310_12
					end
				end

				arg_307_1.text_.text = var_310_16
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031074", "story_v_out_122031.awb") ~= 0 then
					local var_310_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031074", "story_v_out_122031.awb") / 1000

					if var_310_20 + var_310_12 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_12
					end

					if var_310_15.prefab_name ~= "" and arg_307_1.actors_[var_310_15.prefab_name] ~= nil then
						local var_310_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_15.prefab_name].transform, "story_v_out_122031", "122031074", "story_v_out_122031.awb")

						arg_307_1:RecordAudio("122031074", var_310_21)
						arg_307_1:RecordAudio("122031074", var_310_21)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_122031", "122031074", "story_v_out_122031.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_122031", "122031074", "story_v_out_122031.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_13, arg_307_1.talkMaxDuration)

			if var_310_12 <= arg_307_1.time_ and arg_307_1.time_ < var_310_12 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_12) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_12 + var_310_22 and arg_307_1.time_ < var_310_12 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play122031075 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 122031075
		arg_311_1.duration_ = 7.633

		local var_311_0 = {
			ja = 7.633,
			ko = 2.533,
			zh = 2.533
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play122031076(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.3

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_2 = arg_311_1:FormatText(StoryNameCfg[410].name)

				arg_311_1.leftNameTxt_.text = var_314_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_3 = arg_311_1:GetWordFromCfg(122031075)
				local var_314_4 = arg_311_1:FormatText(var_314_3.content)

				arg_311_1.text_.text = var_314_4

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_5 = 12
				local var_314_6 = utf8.len(var_314_4)
				local var_314_7 = var_314_5 <= 0 and var_314_1 or var_314_1 * (var_314_6 / var_314_5)

				if var_314_7 > 0 and var_314_1 < var_314_7 then
					arg_311_1.talkMaxDuration = var_314_7

					if var_314_7 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_7 + var_314_0
					end
				end

				arg_311_1.text_.text = var_314_4
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031075", "story_v_out_122031.awb") ~= 0 then
					local var_314_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031075", "story_v_out_122031.awb") / 1000

					if var_314_8 + var_314_0 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_8 + var_314_0
					end

					if var_314_3.prefab_name ~= "" and arg_311_1.actors_[var_314_3.prefab_name] ~= nil then
						local var_314_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_3.prefab_name].transform, "story_v_out_122031", "122031075", "story_v_out_122031.awb")

						arg_311_1:RecordAudio("122031075", var_314_9)
						arg_311_1:RecordAudio("122031075", var_314_9)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_122031", "122031075", "story_v_out_122031.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_122031", "122031075", "story_v_out_122031.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_10 = math.max(var_314_1, arg_311_1.talkMaxDuration)

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_10 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_0) / var_314_10

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_0 + var_314_10 and arg_311_1.time_ < var_314_0 + var_314_10 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play122031076 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 122031076
		arg_315_1.duration_ = 3.1

		local var_315_0 = {
			ja = 3.1,
			ko = 2.1,
			zh = 2.1
		}
		local var_315_1 = manager.audio:GetLocalizationFlag()

		if var_315_0[var_315_1] ~= nil then
			arg_315_1.duration_ = var_315_0[var_315_1]
		end

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play122031077(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["10044ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect10044ui_story == nil then
				arg_315_1.var_.characterEffect10044ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect10044ui_story then
					arg_315_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect10044ui_story then
				arg_315_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_318_4 = 0

			if var_318_4 < arg_315_1.time_ and arg_315_1.time_ <= var_318_4 + arg_318_0 then
				arg_315_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action432")
			end

			local var_318_5 = 0

			if var_318_5 < arg_315_1.time_ and arg_315_1.time_ <= var_318_5 + arg_318_0 then
				arg_315_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_318_6 = arg_315_1.actors_["1074ui_story"]
			local var_318_7 = 0

			if var_318_7 < arg_315_1.time_ and arg_315_1.time_ <= var_318_7 + arg_318_0 and arg_315_1.var_.characterEffect1074ui_story == nil then
				arg_315_1.var_.characterEffect1074ui_story = var_318_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_8 = 0.200000002980232

			if var_318_7 <= arg_315_1.time_ and arg_315_1.time_ < var_318_7 + var_318_8 then
				local var_318_9 = (arg_315_1.time_ - var_318_7) / var_318_8

				if arg_315_1.var_.characterEffect1074ui_story then
					local var_318_10 = Mathf.Lerp(0, 0.5, var_318_9)

					arg_315_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1074ui_story.fillRatio = var_318_10
				end
			end

			if arg_315_1.time_ >= var_318_7 + var_318_8 and arg_315_1.time_ < var_318_7 + var_318_8 + arg_318_0 and arg_315_1.var_.characterEffect1074ui_story then
				local var_318_11 = 0.5

				arg_315_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1074ui_story.fillRatio = var_318_11
			end

			local var_318_12 = 0
			local var_318_13 = 0.25

			if var_318_12 < arg_315_1.time_ and arg_315_1.time_ <= var_318_12 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_14 = arg_315_1:FormatText(StoryNameCfg[380].name)

				arg_315_1.leftNameTxt_.text = var_318_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_15 = arg_315_1:GetWordFromCfg(122031076)
				local var_318_16 = arg_315_1:FormatText(var_318_15.content)

				arg_315_1.text_.text = var_318_16

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_17 = 10
				local var_318_18 = utf8.len(var_318_16)
				local var_318_19 = var_318_17 <= 0 and var_318_13 or var_318_13 * (var_318_18 / var_318_17)

				if var_318_19 > 0 and var_318_13 < var_318_19 then
					arg_315_1.talkMaxDuration = var_318_19

					if var_318_19 + var_318_12 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_19 + var_318_12
					end
				end

				arg_315_1.text_.text = var_318_16
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031076", "story_v_out_122031.awb") ~= 0 then
					local var_318_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031076", "story_v_out_122031.awb") / 1000

					if var_318_20 + var_318_12 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_20 + var_318_12
					end

					if var_318_15.prefab_name ~= "" and arg_315_1.actors_[var_318_15.prefab_name] ~= nil then
						local var_318_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_15.prefab_name].transform, "story_v_out_122031", "122031076", "story_v_out_122031.awb")

						arg_315_1:RecordAudio("122031076", var_318_21)
						arg_315_1:RecordAudio("122031076", var_318_21)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_122031", "122031076", "story_v_out_122031.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_122031", "122031076", "story_v_out_122031.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_22 = math.max(var_318_13, arg_315_1.talkMaxDuration)

			if var_318_12 <= arg_315_1.time_ and arg_315_1.time_ < var_318_12 + var_318_22 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_12) / var_318_22

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_12 + var_318_22 and arg_315_1.time_ < var_318_12 + var_318_22 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play122031077 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 122031077
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play122031078(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["10044ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos10044ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, 100, 0)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos10044ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, 100, 0)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["10044ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and arg_319_1.var_.characterEffect10044ui_story == nil then
				arg_319_1.var_.characterEffect10044ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect10044ui_story then
					local var_322_13 = Mathf.Lerp(0, 0.5, var_322_12)

					arg_319_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_319_1.var_.characterEffect10044ui_story.fillRatio = var_322_13
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and arg_319_1.var_.characterEffect10044ui_story then
				local var_322_14 = 0.5

				arg_319_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_319_1.var_.characterEffect10044ui_story.fillRatio = var_322_14
			end

			local var_322_15 = arg_319_1.actors_["1074ui_story"].transform
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 then
				arg_319_1.var_.moveOldPos1074ui_story = var_322_15.localPosition
			end

			local var_322_17 = 0.001

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17
				local var_322_19 = Vector3.New(0, 100, 0)

				var_322_15.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1074ui_story, var_322_19, var_322_18)

				local var_322_20 = manager.ui.mainCamera.transform.position - var_322_15.position

				var_322_15.forward = Vector3.New(var_322_20.x, var_322_20.y, var_322_20.z)

				local var_322_21 = var_322_15.localEulerAngles

				var_322_21.z = 0
				var_322_21.x = 0
				var_322_15.localEulerAngles = var_322_21
			end

			if arg_319_1.time_ >= var_322_16 + var_322_17 and arg_319_1.time_ < var_322_16 + var_322_17 + arg_322_0 then
				var_322_15.localPosition = Vector3.New(0, 100, 0)

				local var_322_22 = manager.ui.mainCamera.transform.position - var_322_15.position

				var_322_15.forward = Vector3.New(var_322_22.x, var_322_22.y, var_322_22.z)

				local var_322_23 = var_322_15.localEulerAngles

				var_322_23.z = 0
				var_322_23.x = 0
				var_322_15.localEulerAngles = var_322_23
			end

			local var_322_24 = arg_319_1.actors_["1074ui_story"]
			local var_322_25 = 0

			if var_322_25 < arg_319_1.time_ and arg_319_1.time_ <= var_322_25 + arg_322_0 and arg_319_1.var_.characterEffect1074ui_story == nil then
				arg_319_1.var_.characterEffect1074ui_story = var_322_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_26 = 0.200000002980232

			if var_322_25 <= arg_319_1.time_ and arg_319_1.time_ < var_322_25 + var_322_26 then
				local var_322_27 = (arg_319_1.time_ - var_322_25) / var_322_26

				if arg_319_1.var_.characterEffect1074ui_story then
					local var_322_28 = Mathf.Lerp(0, 0.5, var_322_27)

					arg_319_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1074ui_story.fillRatio = var_322_28
				end
			end

			if arg_319_1.time_ >= var_322_25 + var_322_26 and arg_319_1.time_ < var_322_25 + var_322_26 + arg_322_0 and arg_319_1.var_.characterEffect1074ui_story then
				local var_322_29 = 0.5

				arg_319_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1074ui_story.fillRatio = var_322_29
			end

			local var_322_30 = 0
			local var_322_31 = 0.925

			if var_322_30 < arg_319_1.time_ and arg_319_1.time_ <= var_322_30 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_32 = arg_319_1:GetWordFromCfg(122031077)
				local var_322_33 = arg_319_1:FormatText(var_322_32.content)

				arg_319_1.text_.text = var_322_33

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_34 = 37
				local var_322_35 = utf8.len(var_322_33)
				local var_322_36 = var_322_34 <= 0 and var_322_31 or var_322_31 * (var_322_35 / var_322_34)

				if var_322_36 > 0 and var_322_31 < var_322_36 then
					arg_319_1.talkMaxDuration = var_322_36

					if var_322_36 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_36 + var_322_30
					end
				end

				arg_319_1.text_.text = var_322_33
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_37 = math.max(var_322_31, arg_319_1.talkMaxDuration)

			if var_322_30 <= arg_319_1.time_ and arg_319_1.time_ < var_322_30 + var_322_37 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_30) / var_322_37

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_30 + var_322_37 and arg_319_1.time_ < var_322_30 + var_322_37 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play122031078 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 122031078
		arg_323_1.duration_ = 10.8

		local var_323_0 = {
			ja = 10.8,
			ko = 6.233,
			zh = 6.233
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play122031079(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["10044ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos10044ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(-0.7, -0.72, -6.3)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos10044ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["10044ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect10044ui_story == nil then
				arg_323_1.var_.characterEffect10044ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect10044ui_story then
					arg_323_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect10044ui_story then
				arg_323_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_326_13 = 0

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_326_15 = arg_323_1.actors_["1074ui_story"].transform
			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 then
				arg_323_1.var_.moveOldPos1074ui_story = var_326_15.localPosition
			end

			local var_326_17 = 0.001

			if var_326_16 <= arg_323_1.time_ and arg_323_1.time_ < var_326_16 + var_326_17 then
				local var_326_18 = (arg_323_1.time_ - var_326_16) / var_326_17
				local var_326_19 = Vector3.New(0.7, -1.055, -6.12)

				var_326_15.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1074ui_story, var_326_19, var_326_18)

				local var_326_20 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_20.x, var_326_20.y, var_326_20.z)

				local var_326_21 = var_326_15.localEulerAngles

				var_326_21.z = 0
				var_326_21.x = 0
				var_326_15.localEulerAngles = var_326_21
			end

			if arg_323_1.time_ >= var_326_16 + var_326_17 and arg_323_1.time_ < var_326_16 + var_326_17 + arg_326_0 then
				var_326_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_326_22 = manager.ui.mainCamera.transform.position - var_326_15.position

				var_326_15.forward = Vector3.New(var_326_22.x, var_326_22.y, var_326_22.z)

				local var_326_23 = var_326_15.localEulerAngles

				var_326_23.z = 0
				var_326_23.x = 0
				var_326_15.localEulerAngles = var_326_23
			end

			local var_326_24 = arg_323_1.actors_["1074ui_story"]
			local var_326_25 = 0

			if var_326_25 < arg_323_1.time_ and arg_323_1.time_ <= var_326_25 + arg_326_0 and arg_323_1.var_.characterEffect1074ui_story == nil then
				arg_323_1.var_.characterEffect1074ui_story = var_326_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_26 = 0.200000002980232

			if var_326_25 <= arg_323_1.time_ and arg_323_1.time_ < var_326_25 + var_326_26 then
				local var_326_27 = (arg_323_1.time_ - var_326_25) / var_326_26

				if arg_323_1.var_.characterEffect1074ui_story then
					local var_326_28 = Mathf.Lerp(0, 0.5, var_326_27)

					arg_323_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1074ui_story.fillRatio = var_326_28
				end
			end

			if arg_323_1.time_ >= var_326_25 + var_326_26 and arg_323_1.time_ < var_326_25 + var_326_26 + arg_326_0 and arg_323_1.var_.characterEffect1074ui_story then
				local var_326_29 = 0.5

				arg_323_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1074ui_story.fillRatio = var_326_29
			end

			local var_326_30 = 0
			local var_326_31 = 0.775

			if var_326_30 < arg_323_1.time_ and arg_323_1.time_ <= var_326_30 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_32 = arg_323_1:FormatText(StoryNameCfg[380].name)

				arg_323_1.leftNameTxt_.text = var_326_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_33 = arg_323_1:GetWordFromCfg(122031078)
				local var_326_34 = arg_323_1:FormatText(var_326_33.content)

				arg_323_1.text_.text = var_326_34

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_35 = 31
				local var_326_36 = utf8.len(var_326_34)
				local var_326_37 = var_326_35 <= 0 and var_326_31 or var_326_31 * (var_326_36 / var_326_35)

				if var_326_37 > 0 and var_326_31 < var_326_37 then
					arg_323_1.talkMaxDuration = var_326_37

					if var_326_37 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_37 + var_326_30
					end
				end

				arg_323_1.text_.text = var_326_34
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031078", "story_v_out_122031.awb") ~= 0 then
					local var_326_38 = manager.audio:GetVoiceLength("story_v_out_122031", "122031078", "story_v_out_122031.awb") / 1000

					if var_326_38 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_38 + var_326_30
					end

					if var_326_33.prefab_name ~= "" and arg_323_1.actors_[var_326_33.prefab_name] ~= nil then
						local var_326_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_33.prefab_name].transform, "story_v_out_122031", "122031078", "story_v_out_122031.awb")

						arg_323_1:RecordAudio("122031078", var_326_39)
						arg_323_1:RecordAudio("122031078", var_326_39)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_122031", "122031078", "story_v_out_122031.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_122031", "122031078", "story_v_out_122031.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_40 = math.max(var_326_31, arg_323_1.talkMaxDuration)

			if var_326_30 <= arg_323_1.time_ and arg_323_1.time_ < var_326_30 + var_326_40 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_30) / var_326_40

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_30 + var_326_40 and arg_323_1.time_ < var_326_30 + var_326_40 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play122031079 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 122031079
		arg_327_1.duration_ = 4.333

		local var_327_0 = {
			ja = 4.333,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play122031080(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1074ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1074ui_story == nil then
				arg_327_1.var_.characterEffect1074ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.200000002980232

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1074ui_story then
					arg_327_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1074ui_story then
				arg_327_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_330_4 = 0

			if var_330_4 < arg_327_1.time_ and arg_327_1.time_ <= var_330_4 + arg_330_0 then
				arg_327_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_330_5 = arg_327_1.actors_["10044ui_story"]
			local var_330_6 = 0

			if var_330_6 < arg_327_1.time_ and arg_327_1.time_ <= var_330_6 + arg_330_0 and arg_327_1.var_.characterEffect10044ui_story == nil then
				arg_327_1.var_.characterEffect10044ui_story = var_330_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_7 = 0.200000002980232

			if var_330_6 <= arg_327_1.time_ and arg_327_1.time_ < var_330_6 + var_330_7 then
				local var_330_8 = (arg_327_1.time_ - var_330_6) / var_330_7

				if arg_327_1.var_.characterEffect10044ui_story then
					local var_330_9 = Mathf.Lerp(0, 0.5, var_330_8)

					arg_327_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_327_1.var_.characterEffect10044ui_story.fillRatio = var_330_9
				end
			end

			if arg_327_1.time_ >= var_330_6 + var_330_7 and arg_327_1.time_ < var_330_6 + var_330_7 + arg_330_0 and arg_327_1.var_.characterEffect10044ui_story then
				local var_330_10 = 0.5

				arg_327_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_327_1.var_.characterEffect10044ui_story.fillRatio = var_330_10
			end

			local var_330_11 = 0
			local var_330_12 = 0.175

			if var_330_11 < arg_327_1.time_ and arg_327_1.time_ <= var_330_11 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_13 = arg_327_1:FormatText(StoryNameCfg[410].name)

				arg_327_1.leftNameTxt_.text = var_330_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_14 = arg_327_1:GetWordFromCfg(122031079)
				local var_330_15 = arg_327_1:FormatText(var_330_14.content)

				arg_327_1.text_.text = var_330_15

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_16 = 7
				local var_330_17 = utf8.len(var_330_15)
				local var_330_18 = var_330_16 <= 0 and var_330_12 or var_330_12 * (var_330_17 / var_330_16)

				if var_330_18 > 0 and var_330_12 < var_330_18 then
					arg_327_1.talkMaxDuration = var_330_18

					if var_330_18 + var_330_11 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_18 + var_330_11
					end
				end

				arg_327_1.text_.text = var_330_15
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031079", "story_v_out_122031.awb") ~= 0 then
					local var_330_19 = manager.audio:GetVoiceLength("story_v_out_122031", "122031079", "story_v_out_122031.awb") / 1000

					if var_330_19 + var_330_11 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_19 + var_330_11
					end

					if var_330_14.prefab_name ~= "" and arg_327_1.actors_[var_330_14.prefab_name] ~= nil then
						local var_330_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_14.prefab_name].transform, "story_v_out_122031", "122031079", "story_v_out_122031.awb")

						arg_327_1:RecordAudio("122031079", var_330_20)
						arg_327_1:RecordAudio("122031079", var_330_20)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_122031", "122031079", "story_v_out_122031.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_122031", "122031079", "story_v_out_122031.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_21 = math.max(var_330_12, arg_327_1.talkMaxDuration)

			if var_330_11 <= arg_327_1.time_ and arg_327_1.time_ < var_330_11 + var_330_21 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_11) / var_330_21

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_11 + var_330_21 and arg_327_1.time_ < var_330_11 + var_330_21 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play122031080 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 122031080
		arg_331_1.duration_ = 2.766

		local var_331_0 = {
			ja = 2.766,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_331_1 = manager.audio:GetLocalizationFlag()

		if var_331_0[var_331_1] ~= nil then
			arg_331_1.duration_ = var_331_0[var_331_1]
		end

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play122031081(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["10044ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect10044ui_story == nil then
				arg_331_1.var_.characterEffect10044ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect10044ui_story then
					arg_331_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect10044ui_story then
				arg_331_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_334_4 = 0

			if var_334_4 < arg_331_1.time_ and arg_331_1.time_ <= var_334_4 + arg_334_0 then
				arg_331_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_334_5 = 0

			if var_334_5 < arg_331_1.time_ and arg_331_1.time_ <= var_334_5 + arg_334_0 then
				arg_331_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_334_6 = arg_331_1.actors_["1074ui_story"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story == nil then
				arg_331_1.var_.characterEffect1074ui_story = var_334_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_8 = 0.200000002980232

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.characterEffect1074ui_story then
					local var_334_10 = Mathf.Lerp(0, 0.5, var_334_9)

					arg_331_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1074ui_story.fillRatio = var_334_10
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story then
				local var_334_11 = 0.5

				arg_331_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1074ui_story.fillRatio = var_334_11
			end

			local var_334_12 = 0
			local var_334_13 = 0.1

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_14 = arg_331_1:FormatText(StoryNameCfg[380].name)

				arg_331_1.leftNameTxt_.text = var_334_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_15 = arg_331_1:GetWordFromCfg(122031080)
				local var_334_16 = arg_331_1:FormatText(var_334_15.content)

				arg_331_1.text_.text = var_334_16

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_17 = 4
				local var_334_18 = utf8.len(var_334_16)
				local var_334_19 = var_334_17 <= 0 and var_334_13 or var_334_13 * (var_334_18 / var_334_17)

				if var_334_19 > 0 and var_334_13 < var_334_19 then
					arg_331_1.talkMaxDuration = var_334_19

					if var_334_19 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_12
					end
				end

				arg_331_1.text_.text = var_334_16
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031080", "story_v_out_122031.awb") ~= 0 then
					local var_334_20 = manager.audio:GetVoiceLength("story_v_out_122031", "122031080", "story_v_out_122031.awb") / 1000

					if var_334_20 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_12
					end

					if var_334_15.prefab_name ~= "" and arg_331_1.actors_[var_334_15.prefab_name] ~= nil then
						local var_334_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_15.prefab_name].transform, "story_v_out_122031", "122031080", "story_v_out_122031.awb")

						arg_331_1:RecordAudio("122031080", var_334_21)
						arg_331_1:RecordAudio("122031080", var_334_21)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_122031", "122031080", "story_v_out_122031.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_122031", "122031080", "story_v_out_122031.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_22 = math.max(var_334_13, arg_331_1.talkMaxDuration)

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_22 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_12) / var_334_22

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_12 + var_334_22 and arg_331_1.time_ < var_334_12 + var_334_22 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play122031081 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 122031081
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play122031082(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10044ui_story"].transform
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.var_.moveOldPos10044ui_story = var_338_0.localPosition
			end

			local var_338_2 = 0.001

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2
				local var_338_4 = Vector3.New(0, 100, 0)

				var_338_0.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos10044ui_story, var_338_4, var_338_3)

				local var_338_5 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_5.x, var_338_5.y, var_338_5.z)

				local var_338_6 = var_338_0.localEulerAngles

				var_338_6.z = 0
				var_338_6.x = 0
				var_338_0.localEulerAngles = var_338_6
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 then
				var_338_0.localPosition = Vector3.New(0, 100, 0)

				local var_338_7 = manager.ui.mainCamera.transform.position - var_338_0.position

				var_338_0.forward = Vector3.New(var_338_7.x, var_338_7.y, var_338_7.z)

				local var_338_8 = var_338_0.localEulerAngles

				var_338_8.z = 0
				var_338_8.x = 0
				var_338_0.localEulerAngles = var_338_8
			end

			local var_338_9 = arg_335_1.actors_["10044ui_story"]
			local var_338_10 = 0

			if var_338_10 < arg_335_1.time_ and arg_335_1.time_ <= var_338_10 + arg_338_0 and arg_335_1.var_.characterEffect10044ui_story == nil then
				arg_335_1.var_.characterEffect10044ui_story = var_338_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_11 = 0.200000002980232

			if var_338_10 <= arg_335_1.time_ and arg_335_1.time_ < var_338_10 + var_338_11 then
				local var_338_12 = (arg_335_1.time_ - var_338_10) / var_338_11

				if arg_335_1.var_.characterEffect10044ui_story then
					local var_338_13 = Mathf.Lerp(0, 0.5, var_338_12)

					arg_335_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_335_1.var_.characterEffect10044ui_story.fillRatio = var_338_13
				end
			end

			if arg_335_1.time_ >= var_338_10 + var_338_11 and arg_335_1.time_ < var_338_10 + var_338_11 + arg_338_0 and arg_335_1.var_.characterEffect10044ui_story then
				local var_338_14 = 0.5

				arg_335_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_335_1.var_.characterEffect10044ui_story.fillRatio = var_338_14
			end

			local var_338_15 = arg_335_1.actors_["1074ui_story"].transform
			local var_338_16 = 0

			if var_338_16 < arg_335_1.time_ and arg_335_1.time_ <= var_338_16 + arg_338_0 then
				arg_335_1.var_.moveOldPos1074ui_story = var_338_15.localPosition
			end

			local var_338_17 = 0.001

			if var_338_16 <= arg_335_1.time_ and arg_335_1.time_ < var_338_16 + var_338_17 then
				local var_338_18 = (arg_335_1.time_ - var_338_16) / var_338_17
				local var_338_19 = Vector3.New(0, 100, 0)

				var_338_15.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1074ui_story, var_338_19, var_338_18)

				local var_338_20 = manager.ui.mainCamera.transform.position - var_338_15.position

				var_338_15.forward = Vector3.New(var_338_20.x, var_338_20.y, var_338_20.z)

				local var_338_21 = var_338_15.localEulerAngles

				var_338_21.z = 0
				var_338_21.x = 0
				var_338_15.localEulerAngles = var_338_21
			end

			if arg_335_1.time_ >= var_338_16 + var_338_17 and arg_335_1.time_ < var_338_16 + var_338_17 + arg_338_0 then
				var_338_15.localPosition = Vector3.New(0, 100, 0)

				local var_338_22 = manager.ui.mainCamera.transform.position - var_338_15.position

				var_338_15.forward = Vector3.New(var_338_22.x, var_338_22.y, var_338_22.z)

				local var_338_23 = var_338_15.localEulerAngles

				var_338_23.z = 0
				var_338_23.x = 0
				var_338_15.localEulerAngles = var_338_23
			end

			local var_338_24 = arg_335_1.actors_["1074ui_story"]
			local var_338_25 = 0

			if var_338_25 < arg_335_1.time_ and arg_335_1.time_ <= var_338_25 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story == nil then
				arg_335_1.var_.characterEffect1074ui_story = var_338_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_26 = 0.200000002980232

			if var_338_25 <= arg_335_1.time_ and arg_335_1.time_ < var_338_25 + var_338_26 then
				local var_338_27 = (arg_335_1.time_ - var_338_25) / var_338_26

				if arg_335_1.var_.characterEffect1074ui_story then
					local var_338_28 = Mathf.Lerp(0, 0.5, var_338_27)

					arg_335_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_335_1.var_.characterEffect1074ui_story.fillRatio = var_338_28
				end
			end

			if arg_335_1.time_ >= var_338_25 + var_338_26 and arg_335_1.time_ < var_338_25 + var_338_26 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story then
				local var_338_29 = 0.5

				arg_335_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_335_1.var_.characterEffect1074ui_story.fillRatio = var_338_29
			end

			local var_338_30 = 0
			local var_338_31 = 0.675

			if var_338_30 < arg_335_1.time_ and arg_335_1.time_ <= var_338_30 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_32 = arg_335_1:GetWordFromCfg(122031081)
				local var_338_33 = arg_335_1:FormatText(var_338_32.content)

				arg_335_1.text_.text = var_338_33

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_34 = 27
				local var_338_35 = utf8.len(var_338_33)
				local var_338_36 = var_338_34 <= 0 and var_338_31 or var_338_31 * (var_338_35 / var_338_34)

				if var_338_36 > 0 and var_338_31 < var_338_36 then
					arg_335_1.talkMaxDuration = var_338_36

					if var_338_36 + var_338_30 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_36 + var_338_30
					end
				end

				arg_335_1.text_.text = var_338_33
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_37 = math.max(var_338_31, arg_335_1.talkMaxDuration)

			if var_338_30 <= arg_335_1.time_ and arg_335_1.time_ < var_338_30 + var_338_37 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_30) / var_338_37

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_30 + var_338_37 and arg_335_1.time_ < var_338_30 + var_338_37 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play122031082 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 122031082
		arg_339_1.duration_ = 10.4

		local var_339_0 = {
			ja = 10.4,
			ko = 8.2,
			zh = 8.2
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play122031083(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1074ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1074ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, -1.055, -6.12)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1074ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1074ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1074ui_story == nil then
				arg_339_1.var_.characterEffect1074ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1074ui_story then
					arg_339_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1074ui_story then
				arg_339_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_342_15 = 0
			local var_342_16 = 1.1

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[410].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(122031082)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 44
				local var_342_21 = utf8.len(var_342_19)
				local var_342_22 = var_342_20 <= 0 and var_342_16 or var_342_16 * (var_342_21 / var_342_20)

				if var_342_22 > 0 and var_342_16 < var_342_22 then
					arg_339_1.talkMaxDuration = var_342_22

					if var_342_22 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_15
					end
				end

				arg_339_1.text_.text = var_342_19
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031082", "story_v_out_122031.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_out_122031", "122031082", "story_v_out_122031.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_out_122031", "122031082", "story_v_out_122031.awb")

						arg_339_1:RecordAudio("122031082", var_342_24)
						arg_339_1:RecordAudio("122031082", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_122031", "122031082", "story_v_out_122031.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_122031", "122031082", "story_v_out_122031.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_25 = math.max(var_342_16, arg_339_1.talkMaxDuration)

			if var_342_15 <= arg_339_1.time_ and arg_339_1.time_ < var_342_15 + var_342_25 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_15) / var_342_25

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_15 + var_342_25 and arg_339_1.time_ < var_342_15 + var_342_25 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play122031083 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 122031083
		arg_343_1.duration_ = 6.2

		local var_343_0 = {
			ja = 6.2,
			ko = 3.7,
			zh = 3.7
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play122031084(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = 0
			local var_346_1 = 0.5

			if var_346_0 < arg_343_1.time_ and arg_343_1.time_ <= var_346_0 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_2 = arg_343_1:FormatText(StoryNameCfg[410].name)

				arg_343_1.leftNameTxt_.text = var_346_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_3 = arg_343_1:GetWordFromCfg(122031083)
				local var_346_4 = arg_343_1:FormatText(var_346_3.content)

				arg_343_1.text_.text = var_346_4

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_5 = 20
				local var_346_6 = utf8.len(var_346_4)
				local var_346_7 = var_346_5 <= 0 and var_346_1 or var_346_1 * (var_346_6 / var_346_5)

				if var_346_7 > 0 and var_346_1 < var_346_7 then
					arg_343_1.talkMaxDuration = var_346_7

					if var_346_7 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_7 + var_346_0
					end
				end

				arg_343_1.text_.text = var_346_4
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031083", "story_v_out_122031.awb") ~= 0 then
					local var_346_8 = manager.audio:GetVoiceLength("story_v_out_122031", "122031083", "story_v_out_122031.awb") / 1000

					if var_346_8 + var_346_0 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_8 + var_346_0
					end

					if var_346_3.prefab_name ~= "" and arg_343_1.actors_[var_346_3.prefab_name] ~= nil then
						local var_346_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_3.prefab_name].transform, "story_v_out_122031", "122031083", "story_v_out_122031.awb")

						arg_343_1:RecordAudio("122031083", var_346_9)
						arg_343_1:RecordAudio("122031083", var_346_9)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_122031", "122031083", "story_v_out_122031.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_122031", "122031083", "story_v_out_122031.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_10 = math.max(var_346_1, arg_343_1.talkMaxDuration)

			if var_346_0 <= arg_343_1.time_ and arg_343_1.time_ < var_346_0 + var_346_10 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_0) / var_346_10

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_0 + var_346_10 and arg_343_1.time_ < var_346_0 + var_346_10 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play122031084 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 122031084
		arg_347_1.duration_ = 4.533

		local var_347_0 = {
			ja = 4.533,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_347_1 = manager.audio:GetLocalizationFlag()

		if var_347_0[var_347_1] ~= nil then
			arg_347_1.duration_ = var_347_0[var_347_1]
		end

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
			arg_347_1.auto_ = false
		end

		function arg_347_1.playNext_(arg_349_0)
			arg_347_1.onStoryFinished_()
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1074ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1074ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, 100, 0)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1074ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, 100, 0)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = arg_347_1.actors_["1074ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and arg_347_1.var_.characterEffect1074ui_story == nil then
				arg_347_1.var_.characterEffect1074ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect1074ui_story then
					local var_350_13 = Mathf.Lerp(0, 0.5, var_350_12)

					arg_347_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1074ui_story.fillRatio = var_350_13
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and arg_347_1.var_.characterEffect1074ui_story then
				local var_350_14 = 0.5

				arg_347_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1074ui_story.fillRatio = var_350_14
			end

			local var_350_15 = arg_347_1.actors_["10044ui_story"].transform
			local var_350_16 = 0

			if var_350_16 < arg_347_1.time_ and arg_347_1.time_ <= var_350_16 + arg_350_0 then
				arg_347_1.var_.moveOldPos10044ui_story = var_350_15.localPosition
			end

			local var_350_17 = 0.001

			if var_350_16 <= arg_347_1.time_ and arg_347_1.time_ < var_350_16 + var_350_17 then
				local var_350_18 = (arg_347_1.time_ - var_350_16) / var_350_17
				local var_350_19 = Vector3.New(0, -0.72, -6.3)

				var_350_15.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos10044ui_story, var_350_19, var_350_18)

				local var_350_20 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_20.x, var_350_20.y, var_350_20.z)

				local var_350_21 = var_350_15.localEulerAngles

				var_350_21.z = 0
				var_350_21.x = 0
				var_350_15.localEulerAngles = var_350_21
			end

			if arg_347_1.time_ >= var_350_16 + var_350_17 and arg_347_1.time_ < var_350_16 + var_350_17 + arg_350_0 then
				var_350_15.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_350_22 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_22.x, var_350_22.y, var_350_22.z)

				local var_350_23 = var_350_15.localEulerAngles

				var_350_23.z = 0
				var_350_23.x = 0
				var_350_15.localEulerAngles = var_350_23
			end

			local var_350_24 = arg_347_1.actors_["10044ui_story"]
			local var_350_25 = 0

			if var_350_25 < arg_347_1.time_ and arg_347_1.time_ <= var_350_25 + arg_350_0 and arg_347_1.var_.characterEffect10044ui_story == nil then
				arg_347_1.var_.characterEffect10044ui_story = var_350_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_26 = 0.200000002980232

			if var_350_25 <= arg_347_1.time_ and arg_347_1.time_ < var_350_25 + var_350_26 then
				local var_350_27 = (arg_347_1.time_ - var_350_25) / var_350_26

				if arg_347_1.var_.characterEffect10044ui_story then
					arg_347_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_25 + var_350_26 and arg_347_1.time_ < var_350_25 + var_350_26 + arg_350_0 and arg_347_1.var_.characterEffect10044ui_story then
				arg_347_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_350_28 = 0

			if var_350_28 < arg_347_1.time_ and arg_347_1.time_ <= var_350_28 + arg_350_0 then
				arg_347_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_350_29 = 0

			if var_350_29 < arg_347_1.time_ and arg_347_1.time_ <= var_350_29 + arg_350_0 then
				arg_347_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_350_30 = 0
			local var_350_31 = 0.125

			if var_350_30 < arg_347_1.time_ and arg_347_1.time_ <= var_350_30 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_32 = arg_347_1:FormatText(StoryNameCfg[380].name)

				arg_347_1.leftNameTxt_.text = var_350_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_33 = arg_347_1:GetWordFromCfg(122031084)
				local var_350_34 = arg_347_1:FormatText(var_350_33.content)

				arg_347_1.text_.text = var_350_34

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_35 = 5
				local var_350_36 = utf8.len(var_350_34)
				local var_350_37 = var_350_35 <= 0 and var_350_31 or var_350_31 * (var_350_36 / var_350_35)

				if var_350_37 > 0 and var_350_31 < var_350_37 then
					arg_347_1.talkMaxDuration = var_350_37

					if var_350_37 + var_350_30 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_37 + var_350_30
					end
				end

				arg_347_1.text_.text = var_350_34
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_122031", "122031084", "story_v_out_122031.awb") ~= 0 then
					local var_350_38 = manager.audio:GetVoiceLength("story_v_out_122031", "122031084", "story_v_out_122031.awb") / 1000

					if var_350_38 + var_350_30 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_38 + var_350_30
					end

					if var_350_33.prefab_name ~= "" and arg_347_1.actors_[var_350_33.prefab_name] ~= nil then
						local var_350_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_33.prefab_name].transform, "story_v_out_122031", "122031084", "story_v_out_122031.awb")

						arg_347_1:RecordAudio("122031084", var_350_39)
						arg_347_1:RecordAudio("122031084", var_350_39)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_122031", "122031084", "story_v_out_122031.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_122031", "122031084", "story_v_out_122031.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_40 = math.max(var_350_31, arg_347_1.talkMaxDuration)

			if var_350_30 <= arg_347_1.time_ and arg_347_1.time_ < var_350_30 + var_350_40 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_30) / var_350_40

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_30 + var_350_40 and arg_347_1.time_ < var_350_30 + var_350_40 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37a"
	},
	voices = {
		"story_v_out_122031.awb"
	}
}
