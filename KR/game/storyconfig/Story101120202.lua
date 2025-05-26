﻿return {
	Play112022001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 112022001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play112022002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "H01a"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = arg_1_1.bgs_.H01a
			local var_4_3 = 0

			if var_4_3 < arg_1_1.time_ and arg_1_1.time_ <= var_4_3 + arg_4_0 then
				local var_4_4 = var_4_2:GetComponent("SpriteRenderer")

				if var_4_4 then
					var_4_4.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_5 = var_4_4.material
					local var_4_6 = var_4_5:GetColor("_Color")

					arg_1_1.var_.alphaOldValueH01a = var_4_6.a
					arg_1_1.var_.alphaMatValueH01a = var_4_5
				end

				arg_1_1.var_.alphaOldValueH01a = 0
			end

			local var_4_7 = 1.5

			if var_4_3 <= arg_1_1.time_ and arg_1_1.time_ < var_4_3 + var_4_7 then
				local var_4_8 = (arg_1_1.time_ - var_4_3) / var_4_7
				local var_4_9 = Mathf.Lerp(arg_1_1.var_.alphaOldValueH01a, 1, var_4_8)

				if arg_1_1.var_.alphaMatValueH01a then
					local var_4_10 = arg_1_1.var_.alphaMatValueH01a
					local var_4_11 = var_4_10:GetColor("_Color")

					var_4_11.a = var_4_9

					var_4_10:SetColor("_Color", var_4_11)
				end
			end

			if arg_1_1.time_ >= var_4_3 + var_4_7 and arg_1_1.time_ < var_4_3 + var_4_7 + arg_4_0 and arg_1_1.var_.alphaMatValueH01a then
				local var_4_12 = arg_1_1.var_.alphaMatValueH01a
				local var_4_13 = var_4_12:GetColor("_Color")

				var_4_13.a = 1

				var_4_12:SetColor("_Color", var_4_13)
			end

			local var_4_14 = 0

			if var_4_14 < arg_1_1.time_ and arg_1_1.time_ <= var_4_14 + arg_4_0 then
				local var_4_15 = manager.ui.mainCamera.transform.localPosition
				local var_4_16 = Vector3.New(0, 0, 10) + Vector3.New(var_4_15.x, var_4_15.y, 0)
				local var_4_17 = arg_1_1.bgs_.H01a

				var_4_17.transform.localPosition = var_4_16
				var_4_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_18 = var_4_17:GetComponent("SpriteRenderer")

				if var_4_18 and var_4_18.sprite then
					local var_4_19 = (var_4_17.transform.localPosition - var_4_15).z
					local var_4_20 = manager.ui.mainCameraCom_
					local var_4_21 = 2 * var_4_19 * Mathf.Tan(var_4_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_22 = var_4_21 * var_4_20.aspect
					local var_4_23 = var_4_18.sprite.bounds.size.x
					local var_4_24 = var_4_18.sprite.bounds.size.y
					local var_4_25 = var_4_22 / var_4_23
					local var_4_26 = var_4_21 / var_4_24
					local var_4_27 = var_4_26 < var_4_25 and var_4_25 or var_4_26

					var_4_17.transform.localScale = Vector3.New(var_4_27, var_4_27, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "H01a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_28 = 0

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 2

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = 2
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense.awb")

				local var_4_34 = ""
				local var_4_35 = manager.audio:GetAudioName("bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense")

				if var_4_35 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_35 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_35

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_35
					end

					if arg_1_1.bgmTimer then
						arg_1_1.bgmTimer:Stop()

						arg_1_1.bgmTimer = nil
					end

					if arg_1_1.settingData.show_music_name == 1 then
						arg_1_1.musicController:SetSelectedState("show")
						arg_1_1.musicAnimator_:Play("open", 0, 0)

						if arg_1_1.settingData.music_time ~= 0 then
							arg_1_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_1_1.settingData.music_time), function()
								if arg_1_1 == nil or isNil(arg_1_1.bgmTxt_) then
									return
								end

								arg_1_1.musicController:SetSelectedState("hide")
								arg_1_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_4_36 = 0
			local var_4_37 = 1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "effect"

				arg_1_1:AudioAction(var_4_38, var_4_39, "se_story_activity_1_2_summer1", "se_story_activity_1_2_summer1_tideloop", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_40 = 2
			local var_4_41 = 1.175

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_42 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_42:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_43 = arg_1_1:GetWordFromCfg(112022001)
				local var_4_44 = arg_1_1:FormatText(var_4_43.content)

				arg_1_1.text_.text = var_4_44

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_45 = 47
				local var_4_46 = utf8.len(var_4_44)
				local var_4_47 = var_4_45 <= 0 and var_4_41 or var_4_41 * (var_4_46 / var_4_45)

				if var_4_47 > 0 and var_4_41 < var_4_47 then
					arg_1_1.talkMaxDuration = var_4_47
					var_4_40 = var_4_40 + 0.3

					if var_4_47 + var_4_40 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_47 + var_4_40
					end
				end

				arg_1_1.text_.text = var_4_44
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_48 = var_4_40 + 0.3
			local var_4_49 = math.max(var_4_41, arg_1_1.talkMaxDuration)

			if var_4_48 <= arg_1_1.time_ and arg_1_1.time_ < var_4_48 + var_4_49 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_48) / var_4_49

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_48 + var_4_49 and arg_1_1.time_ < var_4_48 + var_4_49 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play112022002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 112022002
		arg_8_1.duration_ = 5.63

		local var_8_0 = {
			ja = 5.633,
			ko = 4.933,
			zh = 5.066,
			en = 5.366
		}
		local var_8_1 = manager.audio:GetLocalizationFlag()

		if var_8_0[var_8_1] ~= nil then
			arg_8_1.duration_ = var_8_0[var_8_1]
		end

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play112022003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = "1081ui_story"

			if arg_8_1.actors_[var_11_0] == nil then
				local var_11_1 = Object.Instantiate(Asset.Load("Char/" .. var_11_0), arg_8_1.stage_.transform)

				var_11_1.name = var_11_0
				var_11_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_8_1.actors_[var_11_0] = var_11_1

				local var_11_2 = var_11_1:GetComponentInChildren(typeof(CharacterEffect))

				var_11_2.enabled = true

				local var_11_3 = GameObjectTools.GetOrAddComponent(var_11_1, typeof(DynamicBoneHelper))

				if var_11_3 then
					var_11_3:EnableDynamicBone(false)
				end

				arg_8_1:ShowWeapon(var_11_2.transform, false)

				arg_8_1.var_[var_11_0 .. "Animator"] = var_11_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_8_1.var_[var_11_0 .. "Animator"].applyRootMotion = true
				arg_8_1.var_[var_11_0 .. "LipSync"] = var_11_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_11_4 = 0

			if var_11_4 < arg_8_1.time_ and arg_8_1.time_ <= var_11_4 + arg_11_0 then
				arg_8_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_11_5 = 0

			if var_11_5 < arg_8_1.time_ and arg_8_1.time_ <= var_11_5 + arg_11_0 then
				arg_8_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_11_6 = arg_8_1.actors_["1081ui_story"]
			local var_11_7 = 0

			if var_11_7 < arg_8_1.time_ and arg_8_1.time_ <= var_11_7 + arg_11_0 and arg_8_1.var_.characterEffect1081ui_story == nil then
				arg_8_1.var_.characterEffect1081ui_story = var_11_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_11_8 = 0.2

			if var_11_7 <= arg_8_1.time_ and arg_8_1.time_ < var_11_7 + var_11_8 then
				local var_11_9 = (arg_8_1.time_ - var_11_7) / var_11_8

				if arg_8_1.var_.characterEffect1081ui_story then
					arg_8_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_8_1.time_ >= var_11_7 + var_11_8 and arg_8_1.time_ < var_11_7 + var_11_8 + arg_11_0 and arg_8_1.var_.characterEffect1081ui_story then
				arg_8_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_11_10 = arg_8_1.actors_["1081ui_story"].transform
			local var_11_11 = 0

			if var_11_11 < arg_8_1.time_ and arg_8_1.time_ <= var_11_11 + arg_11_0 then
				arg_8_1.var_.moveOldPos1081ui_story = var_11_10.localPosition
			end

			local var_11_12 = 0.001

			if var_11_11 <= arg_8_1.time_ and arg_8_1.time_ < var_11_11 + var_11_12 then
				local var_11_13 = (arg_8_1.time_ - var_11_11) / var_11_12
				local var_11_14 = Vector3.New(0, -0.92, -5.8)

				var_11_10.localPosition = Vector3.Lerp(arg_8_1.var_.moveOldPos1081ui_story, var_11_14, var_11_13)

				local var_11_15 = manager.ui.mainCamera.transform.position - var_11_10.position

				var_11_10.forward = Vector3.New(var_11_15.x, var_11_15.y, var_11_15.z)

				local var_11_16 = var_11_10.localEulerAngles

				var_11_16.z = 0
				var_11_16.x = 0
				var_11_10.localEulerAngles = var_11_16
			end

			if arg_8_1.time_ >= var_11_11 + var_11_12 and arg_8_1.time_ < var_11_11 + var_11_12 + arg_11_0 then
				var_11_10.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_11_17 = manager.ui.mainCamera.transform.position - var_11_10.position

				var_11_10.forward = Vector3.New(var_11_17.x, var_11_17.y, var_11_17.z)

				local var_11_18 = var_11_10.localEulerAngles

				var_11_18.z = 0
				var_11_18.x = 0
				var_11_10.localEulerAngles = var_11_18
			end

			local var_11_19 = 0
			local var_11_20 = 0.525

			if var_11_19 < arg_8_1.time_ and arg_8_1.time_ <= var_11_19 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_21 = arg_8_1:FormatText(StoryNameCfg[202].name)

				arg_8_1.leftNameTxt_.text = var_11_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_22 = arg_8_1:GetWordFromCfg(112022002)
				local var_11_23 = arg_8_1:FormatText(var_11_22.content)

				arg_8_1.text_.text = var_11_23

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_24 = 21
				local var_11_25 = utf8.len(var_11_23)
				local var_11_26 = var_11_24 <= 0 and var_11_20 or var_11_20 * (var_11_25 / var_11_24)

				if var_11_26 > 0 and var_11_20 < var_11_26 then
					arg_8_1.talkMaxDuration = var_11_26

					if var_11_26 + var_11_19 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_26 + var_11_19
					end
				end

				arg_8_1.text_.text = var_11_23
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022002", "story_v_out_112022.awb") ~= 0 then
					local var_11_27 = manager.audio:GetVoiceLength("story_v_out_112022", "112022002", "story_v_out_112022.awb") / 1000

					if var_11_27 + var_11_19 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_27 + var_11_19
					end

					if var_11_22.prefab_name ~= "" and arg_8_1.actors_[var_11_22.prefab_name] ~= nil then
						local var_11_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_8_1.actors_[var_11_22.prefab_name].transform, "story_v_out_112022", "112022002", "story_v_out_112022.awb")

						arg_8_1:RecordAudio("112022002", var_11_28)
						arg_8_1:RecordAudio("112022002", var_11_28)
					else
						arg_8_1:AudioAction("play", "voice", "story_v_out_112022", "112022002", "story_v_out_112022.awb")
					end

					arg_8_1:RecordHistoryTalkVoice("story_v_out_112022", "112022002", "story_v_out_112022.awb")
				end

				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_29 = math.max(var_11_20, arg_8_1.talkMaxDuration)

			if var_11_19 <= arg_8_1.time_ and arg_8_1.time_ < var_11_19 + var_11_29 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_19) / var_11_29

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_19 + var_11_29 and arg_8_1.time_ < var_11_19 + var_11_29 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play112022003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 112022003
		arg_12_1.duration_ = 5

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play112022004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = arg_12_1.actors_["1081ui_story"].transform
			local var_15_1 = 0

			if var_15_1 < arg_12_1.time_ and arg_12_1.time_ <= var_15_1 + arg_15_0 then
				arg_12_1.var_.moveOldPos1081ui_story = var_15_0.localPosition
			end

			local var_15_2 = 0.001

			if var_15_1 <= arg_12_1.time_ and arg_12_1.time_ < var_15_1 + var_15_2 then
				local var_15_3 = (arg_12_1.time_ - var_15_1) / var_15_2
				local var_15_4 = Vector3.New(0, 100, 0)

				var_15_0.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1081ui_story, var_15_4, var_15_3)

				local var_15_5 = manager.ui.mainCamera.transform.position - var_15_0.position

				var_15_0.forward = Vector3.New(var_15_5.x, var_15_5.y, var_15_5.z)

				local var_15_6 = var_15_0.localEulerAngles

				var_15_6.z = 0
				var_15_6.x = 0
				var_15_0.localEulerAngles = var_15_6
			end

			if arg_12_1.time_ >= var_15_1 + var_15_2 and arg_12_1.time_ < var_15_1 + var_15_2 + arg_15_0 then
				var_15_0.localPosition = Vector3.New(0, 100, 0)

				local var_15_7 = manager.ui.mainCamera.transform.position - var_15_0.position

				var_15_0.forward = Vector3.New(var_15_7.x, var_15_7.y, var_15_7.z)

				local var_15_8 = var_15_0.localEulerAngles

				var_15_8.z = 0
				var_15_8.x = 0
				var_15_0.localEulerAngles = var_15_8
			end

			local var_15_9 = 0
			local var_15_10 = 0.65

			if var_15_9 < arg_12_1.time_ and arg_12_1.time_ <= var_15_9 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, false)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_11 = arg_12_1:GetWordFromCfg(112022003)
				local var_15_12 = arg_12_1:FormatText(var_15_11.content)

				arg_12_1.text_.text = var_15_12

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_13 = 26
				local var_15_14 = utf8.len(var_15_12)
				local var_15_15 = var_15_13 <= 0 and var_15_10 or var_15_10 * (var_15_14 / var_15_13)

				if var_15_15 > 0 and var_15_10 < var_15_15 then
					arg_12_1.talkMaxDuration = var_15_15

					if var_15_15 + var_15_9 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_15 + var_15_9
					end
				end

				arg_12_1.text_.text = var_15_12
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)
				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_16 = math.max(var_15_10, arg_12_1.talkMaxDuration)

			if var_15_9 <= arg_12_1.time_ and arg_12_1.time_ < var_15_9 + var_15_16 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_9) / var_15_16

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_9 + var_15_16 and arg_12_1.time_ < var_15_9 + var_15_16 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play112022004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 112022004
		arg_16_1.duration_ = 9.1

		local var_16_0 = {
			ja = 9.1,
			ko = 6.133,
			zh = 8.3,
			en = 6.9
		}
		local var_16_1 = manager.audio:GetLocalizationFlag()

		if var_16_0[var_16_1] ~= nil then
			arg_16_1.duration_ = var_16_0[var_16_1]
		end

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play112022005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = "1027ui_story"

			if arg_16_1.actors_[var_19_0] == nil then
				local var_19_1 = Object.Instantiate(Asset.Load("Char/" .. var_19_0), arg_16_1.stage_.transform)

				var_19_1.name = var_19_0
				var_19_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_16_1.actors_[var_19_0] = var_19_1

				local var_19_2 = var_19_1:GetComponentInChildren(typeof(CharacterEffect))

				var_19_2.enabled = true

				local var_19_3 = GameObjectTools.GetOrAddComponent(var_19_1, typeof(DynamicBoneHelper))

				if var_19_3 then
					var_19_3:EnableDynamicBone(false)
				end

				arg_16_1:ShowWeapon(var_19_2.transform, false)

				arg_16_1.var_[var_19_0 .. "Animator"] = var_19_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_16_1.var_[var_19_0 .. "Animator"].applyRootMotion = true
				arg_16_1.var_[var_19_0 .. "LipSync"] = var_19_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_19_4 = arg_16_1.actors_["1027ui_story"].transform
			local var_19_5 = 0

			if var_19_5 < arg_16_1.time_ and arg_16_1.time_ <= var_19_5 + arg_19_0 then
				arg_16_1.var_.moveOldPos1027ui_story = var_19_4.localPosition
			end

			local var_19_6 = 0.001

			if var_19_5 <= arg_16_1.time_ and arg_16_1.time_ < var_19_5 + var_19_6 then
				local var_19_7 = (arg_16_1.time_ - var_19_5) / var_19_6
				local var_19_8 = Vector3.New(-0.7, -0.81, -5.8)

				var_19_4.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1027ui_story, var_19_8, var_19_7)

				local var_19_9 = manager.ui.mainCamera.transform.position - var_19_4.position

				var_19_4.forward = Vector3.New(var_19_9.x, var_19_9.y, var_19_9.z)

				local var_19_10 = var_19_4.localEulerAngles

				var_19_10.z = 0
				var_19_10.x = 0
				var_19_4.localEulerAngles = var_19_10
			end

			if arg_16_1.time_ >= var_19_5 + var_19_6 and arg_16_1.time_ < var_19_5 + var_19_6 + arg_19_0 then
				var_19_4.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_19_11 = manager.ui.mainCamera.transform.position - var_19_4.position

				var_19_4.forward = Vector3.New(var_19_11.x, var_19_11.y, var_19_11.z)

				local var_19_12 = var_19_4.localEulerAngles

				var_19_12.z = 0
				var_19_12.x = 0
				var_19_4.localEulerAngles = var_19_12
			end

			local var_19_13 = 0

			if var_19_13 < arg_16_1.time_ and arg_16_1.time_ <= var_19_13 + arg_19_0 then
				arg_16_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_19_14 = 0

			if var_19_14 < arg_16_1.time_ and arg_16_1.time_ <= var_19_14 + arg_19_0 then
				arg_16_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_19_15 = arg_16_1.actors_["1027ui_story"]
			local var_19_16 = 0

			if var_19_16 < arg_16_1.time_ and arg_16_1.time_ <= var_19_16 + arg_19_0 and arg_16_1.var_.characterEffect1027ui_story == nil then
				arg_16_1.var_.characterEffect1027ui_story = var_19_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_17 = 0.2

			if var_19_16 <= arg_16_1.time_ and arg_16_1.time_ < var_19_16 + var_19_17 then
				local var_19_18 = (arg_16_1.time_ - var_19_16) / var_19_17

				if arg_16_1.var_.characterEffect1027ui_story then
					arg_16_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_16_1.time_ >= var_19_16 + var_19_17 and arg_16_1.time_ < var_19_16 + var_19_17 + arg_19_0 and arg_16_1.var_.characterEffect1027ui_story then
				arg_16_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_19_19 = 0
			local var_19_20 = 0.35

			if var_19_19 < arg_16_1.time_ and arg_16_1.time_ <= var_19_19 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_21 = arg_16_1:FormatText(StoryNameCfg[56].name)

				arg_16_1.leftNameTxt_.text = var_19_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_22 = arg_16_1:GetWordFromCfg(112022004)
				local var_19_23 = arg_16_1:FormatText(var_19_22.content)

				arg_16_1.text_.text = var_19_23

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_24 = 14
				local var_19_25 = utf8.len(var_19_23)
				local var_19_26 = var_19_24 <= 0 and var_19_20 or var_19_20 * (var_19_25 / var_19_24)

				if var_19_26 > 0 and var_19_20 < var_19_26 then
					arg_16_1.talkMaxDuration = var_19_26

					if var_19_26 + var_19_19 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_26 + var_19_19
					end
				end

				arg_16_1.text_.text = var_19_23
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022004", "story_v_out_112022.awb") ~= 0 then
					local var_19_27 = manager.audio:GetVoiceLength("story_v_out_112022", "112022004", "story_v_out_112022.awb") / 1000

					if var_19_27 + var_19_19 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_27 + var_19_19
					end

					if var_19_22.prefab_name ~= "" and arg_16_1.actors_[var_19_22.prefab_name] ~= nil then
						local var_19_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_16_1.actors_[var_19_22.prefab_name].transform, "story_v_out_112022", "112022004", "story_v_out_112022.awb")

						arg_16_1:RecordAudio("112022004", var_19_28)
						arg_16_1:RecordAudio("112022004", var_19_28)
					else
						arg_16_1:AudioAction("play", "voice", "story_v_out_112022", "112022004", "story_v_out_112022.awb")
					end

					arg_16_1:RecordHistoryTalkVoice("story_v_out_112022", "112022004", "story_v_out_112022.awb")
				end

				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_29 = math.max(var_19_20, arg_16_1.talkMaxDuration)

			if var_19_19 <= arg_16_1.time_ and arg_16_1.time_ < var_19_19 + var_19_29 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_19) / var_19_29

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_19 + var_19_29 and arg_16_1.time_ < var_19_19 + var_19_29 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play112022005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 112022005
		arg_20_1.duration_ = 3.37

		local var_20_0 = {
			ja = 3.366,
			ko = 1.999999999999,
			zh = 2,
			en = 1.999999999999
		}
		local var_20_1 = manager.audio:GetLocalizationFlag()

		if var_20_0[var_20_1] ~= nil then
			arg_20_1.duration_ = var_20_0[var_20_1]
		end

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play112022006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = "1084ui_story"

			if arg_20_1.actors_[var_23_0] == nil then
				local var_23_1 = Object.Instantiate(Asset.Load("Char/" .. var_23_0), arg_20_1.stage_.transform)

				var_23_1.name = var_23_0
				var_23_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_20_1.actors_[var_23_0] = var_23_1

				local var_23_2 = var_23_1:GetComponentInChildren(typeof(CharacterEffect))

				var_23_2.enabled = true

				local var_23_3 = GameObjectTools.GetOrAddComponent(var_23_1, typeof(DynamicBoneHelper))

				if var_23_3 then
					var_23_3:EnableDynamicBone(false)
				end

				arg_20_1:ShowWeapon(var_23_2.transform, false)

				arg_20_1.var_[var_23_0 .. "Animator"] = var_23_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_20_1.var_[var_23_0 .. "Animator"].applyRootMotion = true
				arg_20_1.var_[var_23_0 .. "LipSync"] = var_23_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_23_4 = arg_20_1.actors_["1084ui_story"].transform
			local var_23_5 = 0

			if var_23_5 < arg_20_1.time_ and arg_20_1.time_ <= var_23_5 + arg_23_0 then
				arg_20_1.var_.moveOldPos1084ui_story = var_23_4.localPosition
			end

			local var_23_6 = 0.001

			if var_23_5 <= arg_20_1.time_ and arg_20_1.time_ < var_23_5 + var_23_6 then
				local var_23_7 = (arg_20_1.time_ - var_23_5) / var_23_6
				local var_23_8 = Vector3.New(0.7, -0.97, -6)

				var_23_4.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1084ui_story, var_23_8, var_23_7)

				local var_23_9 = manager.ui.mainCamera.transform.position - var_23_4.position

				var_23_4.forward = Vector3.New(var_23_9.x, var_23_9.y, var_23_9.z)

				local var_23_10 = var_23_4.localEulerAngles

				var_23_10.z = 0
				var_23_10.x = 0
				var_23_4.localEulerAngles = var_23_10
			end

			if arg_20_1.time_ >= var_23_5 + var_23_6 and arg_20_1.time_ < var_23_5 + var_23_6 + arg_23_0 then
				var_23_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_23_11 = manager.ui.mainCamera.transform.position - var_23_4.position

				var_23_4.forward = Vector3.New(var_23_11.x, var_23_11.y, var_23_11.z)

				local var_23_12 = var_23_4.localEulerAngles

				var_23_12.z = 0
				var_23_12.x = 0
				var_23_4.localEulerAngles = var_23_12
			end

			local var_23_13 = 0

			if var_23_13 < arg_20_1.time_ and arg_20_1.time_ <= var_23_13 + arg_23_0 then
				arg_20_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_23_14 = 0

			if var_23_14 < arg_20_1.time_ and arg_20_1.time_ <= var_23_14 + arg_23_0 then
				arg_20_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_23_15 = arg_20_1.actors_["1027ui_story"]
			local var_23_16 = 0

			if var_23_16 < arg_20_1.time_ and arg_20_1.time_ <= var_23_16 + arg_23_0 and arg_20_1.var_.characterEffect1027ui_story == nil then
				arg_20_1.var_.characterEffect1027ui_story = var_23_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_17 = 0.2

			if var_23_16 <= arg_20_1.time_ and arg_20_1.time_ < var_23_16 + var_23_17 then
				local var_23_18 = (arg_20_1.time_ - var_23_16) / var_23_17

				if arg_20_1.var_.characterEffect1027ui_story then
					local var_23_19 = Mathf.Lerp(0, 0.5, var_23_18)

					arg_20_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_20_1.var_.characterEffect1027ui_story.fillRatio = var_23_19
				end
			end

			if arg_20_1.time_ >= var_23_16 + var_23_17 and arg_20_1.time_ < var_23_16 + var_23_17 + arg_23_0 and arg_20_1.var_.characterEffect1027ui_story then
				local var_23_20 = 0.5

				arg_20_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_20_1.var_.characterEffect1027ui_story.fillRatio = var_23_20
			end

			local var_23_21 = arg_20_1.actors_["1084ui_story"]
			local var_23_22 = 0

			if var_23_22 < arg_20_1.time_ and arg_20_1.time_ <= var_23_22 + arg_23_0 and arg_20_1.var_.characterEffect1084ui_story == nil then
				arg_20_1.var_.characterEffect1084ui_story = var_23_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_23 = 0.2

			if var_23_22 <= arg_20_1.time_ and arg_20_1.time_ < var_23_22 + var_23_23 then
				local var_23_24 = (arg_20_1.time_ - var_23_22) / var_23_23

				if arg_20_1.var_.characterEffect1084ui_story then
					arg_20_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_22 + var_23_23 and arg_20_1.time_ < var_23_22 + var_23_23 + arg_23_0 and arg_20_1.var_.characterEffect1084ui_story then
				arg_20_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_23_25 = 0
			local var_23_26 = 0.075

			if var_23_25 < arg_20_1.time_ and arg_20_1.time_ <= var_23_25 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_27 = arg_20_1:FormatText(StoryNameCfg[6].name)

				arg_20_1.leftNameTxt_.text = var_23_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_28 = arg_20_1:GetWordFromCfg(112022005)
				local var_23_29 = arg_20_1:FormatText(var_23_28.content)

				arg_20_1.text_.text = var_23_29

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_30 = 3
				local var_23_31 = utf8.len(var_23_29)
				local var_23_32 = var_23_30 <= 0 and var_23_26 or var_23_26 * (var_23_31 / var_23_30)

				if var_23_32 > 0 and var_23_26 < var_23_32 then
					arg_20_1.talkMaxDuration = var_23_32

					if var_23_32 + var_23_25 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_32 + var_23_25
					end
				end

				arg_20_1.text_.text = var_23_29
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022005", "story_v_out_112022.awb") ~= 0 then
					local var_23_33 = manager.audio:GetVoiceLength("story_v_out_112022", "112022005", "story_v_out_112022.awb") / 1000

					if var_23_33 + var_23_25 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_33 + var_23_25
					end

					if var_23_28.prefab_name ~= "" and arg_20_1.actors_[var_23_28.prefab_name] ~= nil then
						local var_23_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_28.prefab_name].transform, "story_v_out_112022", "112022005", "story_v_out_112022.awb")

						arg_20_1:RecordAudio("112022005", var_23_34)
						arg_20_1:RecordAudio("112022005", var_23_34)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_112022", "112022005", "story_v_out_112022.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_112022", "112022005", "story_v_out_112022.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_35 = math.max(var_23_26, arg_20_1.talkMaxDuration)

			if var_23_25 <= arg_20_1.time_ and arg_20_1.time_ < var_23_25 + var_23_35 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_25) / var_23_35

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_25 + var_23_35 and arg_20_1.time_ < var_23_25 + var_23_35 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play112022006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 112022006
		arg_24_1.duration_ = 4.6

		local var_24_0 = {
			ja = 4.6,
			ko = 3.666,
			zh = 4.066,
			en = 3.133
		}
		local var_24_1 = manager.audio:GetLocalizationFlag()

		if var_24_0[var_24_1] ~= nil then
			arg_24_1.duration_ = var_24_0[var_24_1]
		end

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play112022007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = arg_24_1.actors_["1084ui_story"]
			local var_27_1 = 0

			if var_27_1 < arg_24_1.time_ and arg_24_1.time_ <= var_27_1 + arg_27_0 and arg_24_1.var_.characterEffect1084ui_story == nil then
				arg_24_1.var_.characterEffect1084ui_story = var_27_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_2 = 0.2

			if var_27_1 <= arg_24_1.time_ and arg_24_1.time_ < var_27_1 + var_27_2 then
				local var_27_3 = (arg_24_1.time_ - var_27_1) / var_27_2

				if arg_24_1.var_.characterEffect1084ui_story then
					local var_27_4 = Mathf.Lerp(0, 0.5, var_27_3)

					arg_24_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_24_1.var_.characterEffect1084ui_story.fillRatio = var_27_4
				end
			end

			if arg_24_1.time_ >= var_27_1 + var_27_2 and arg_24_1.time_ < var_27_1 + var_27_2 + arg_27_0 and arg_24_1.var_.characterEffect1084ui_story then
				local var_27_5 = 0.5

				arg_24_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_24_1.var_.characterEffect1084ui_story.fillRatio = var_27_5
			end

			local var_27_6 = 0
			local var_27_7 = 0.3

			if var_27_6 < arg_24_1.time_ and arg_24_1.time_ <= var_27_6 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_8 = arg_24_1:FormatText(StoryNameCfg[8].name)

				arg_24_1.leftNameTxt_.text = var_27_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, true)
				arg_24_1.iconController_:SetSelectedState("hero")

				arg_24_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1148")

				arg_24_1.callingController_:SetSelectedState("normal")

				arg_24_1.keyicon_.color = Color.New(1, 1, 1)
				arg_24_1.icon_.color = Color.New(1, 1, 1)

				local var_27_9 = arg_24_1:GetWordFromCfg(112022006)
				local var_27_10 = arg_24_1:FormatText(var_27_9.content)

				arg_24_1.text_.text = var_27_10

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_11 = 12
				local var_27_12 = utf8.len(var_27_10)
				local var_27_13 = var_27_11 <= 0 and var_27_7 or var_27_7 * (var_27_12 / var_27_11)

				if var_27_13 > 0 and var_27_7 < var_27_13 then
					arg_24_1.talkMaxDuration = var_27_13

					if var_27_13 + var_27_6 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_13 + var_27_6
					end
				end

				arg_24_1.text_.text = var_27_10
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022006", "story_v_out_112022.awb") ~= 0 then
					local var_27_14 = manager.audio:GetVoiceLength("story_v_out_112022", "112022006", "story_v_out_112022.awb") / 1000

					if var_27_14 + var_27_6 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_14 + var_27_6
					end

					if var_27_9.prefab_name ~= "" and arg_24_1.actors_[var_27_9.prefab_name] ~= nil then
						local var_27_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_24_1.actors_[var_27_9.prefab_name].transform, "story_v_out_112022", "112022006", "story_v_out_112022.awb")

						arg_24_1:RecordAudio("112022006", var_27_15)
						arg_24_1:RecordAudio("112022006", var_27_15)
					else
						arg_24_1:AudioAction("play", "voice", "story_v_out_112022", "112022006", "story_v_out_112022.awb")
					end

					arg_24_1:RecordHistoryTalkVoice("story_v_out_112022", "112022006", "story_v_out_112022.awb")
				end

				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_16 = math.max(var_27_7, arg_24_1.talkMaxDuration)

			if var_27_6 <= arg_24_1.time_ and arg_24_1.time_ < var_27_6 + var_27_16 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_6) / var_27_16

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_6 + var_27_16 and arg_24_1.time_ < var_27_6 + var_27_16 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play112022007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 112022007
		arg_28_1.duration_ = 5

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play112022008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = 0
			local var_31_1 = 0.175

			if var_31_0 < arg_28_1.time_ and arg_28_1.time_ <= var_31_0 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_2 = arg_28_1:FormatText(StoryNameCfg[7].name)

				arg_28_1.leftNameTxt_.text = var_31_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_3 = arg_28_1:GetWordFromCfg(112022007)
				local var_31_4 = arg_28_1:FormatText(var_31_3.content)

				arg_28_1.text_.text = var_31_4

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_5 = 7
				local var_31_6 = utf8.len(var_31_4)
				local var_31_7 = var_31_5 <= 0 and var_31_1 or var_31_1 * (var_31_6 / var_31_5)

				if var_31_7 > 0 and var_31_1 < var_31_7 then
					arg_28_1.talkMaxDuration = var_31_7

					if var_31_7 + var_31_0 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_7 + var_31_0
					end
				end

				arg_28_1.text_.text = var_31_4
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)
				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_8 = math.max(var_31_1, arg_28_1.talkMaxDuration)

			if var_31_0 <= arg_28_1.time_ and arg_28_1.time_ < var_31_0 + var_31_8 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_0) / var_31_8

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_0 + var_31_8 and arg_28_1.time_ < var_31_0 + var_31_8 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play112022008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 112022008
		arg_32_1.duration_ = 5.17

		local var_32_0 = {
			ja = 5.166,
			ko = 3.166,
			zh = 3.8,
			en = 3.633
		}
		local var_32_1 = manager.audio:GetLocalizationFlag()

		if var_32_0[var_32_1] ~= nil then
			arg_32_1.duration_ = var_32_0[var_32_1]
		end

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play112022009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = "1039ui_story"

			if arg_32_1.actors_[var_35_0] == nil then
				local var_35_1 = Object.Instantiate(Asset.Load("Char/" .. var_35_0), arg_32_1.stage_.transform)

				var_35_1.name = var_35_0
				var_35_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_32_1.actors_[var_35_0] = var_35_1

				local var_35_2 = var_35_1:GetComponentInChildren(typeof(CharacterEffect))

				var_35_2.enabled = true

				local var_35_3 = GameObjectTools.GetOrAddComponent(var_35_1, typeof(DynamicBoneHelper))

				if var_35_3 then
					var_35_3:EnableDynamicBone(false)
				end

				arg_32_1:ShowWeapon(var_35_2.transform, false)

				arg_32_1.var_[var_35_0 .. "Animator"] = var_35_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_32_1.var_[var_35_0 .. "Animator"].applyRootMotion = true
				arg_32_1.var_[var_35_0 .. "LipSync"] = var_35_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_35_4 = arg_32_1.actors_["1039ui_story"].transform
			local var_35_5 = 0

			if var_35_5 < arg_32_1.time_ and arg_32_1.time_ <= var_35_5 + arg_35_0 then
				arg_32_1.var_.moveOldPos1039ui_story = var_35_4.localPosition
			end

			local var_35_6 = 0.001

			if var_35_5 <= arg_32_1.time_ and arg_32_1.time_ < var_35_5 + var_35_6 then
				local var_35_7 = (arg_32_1.time_ - var_35_5) / var_35_6
				local var_35_8 = Vector3.New(-0.7, -1.01, -5.9)

				var_35_4.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1039ui_story, var_35_8, var_35_7)

				local var_35_9 = manager.ui.mainCamera.transform.position - var_35_4.position

				var_35_4.forward = Vector3.New(var_35_9.x, var_35_9.y, var_35_9.z)

				local var_35_10 = var_35_4.localEulerAngles

				var_35_10.z = 0
				var_35_10.x = 0
				var_35_4.localEulerAngles = var_35_10
			end

			if arg_32_1.time_ >= var_35_5 + var_35_6 and arg_32_1.time_ < var_35_5 + var_35_6 + arg_35_0 then
				var_35_4.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_35_11 = manager.ui.mainCamera.transform.position - var_35_4.position

				var_35_4.forward = Vector3.New(var_35_11.x, var_35_11.y, var_35_11.z)

				local var_35_12 = var_35_4.localEulerAngles

				var_35_12.z = 0
				var_35_12.x = 0
				var_35_4.localEulerAngles = var_35_12
			end

			local var_35_13 = 0

			if var_35_13 < arg_32_1.time_ and arg_32_1.time_ <= var_35_13 + arg_35_0 then
				arg_32_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_35_14 = 0

			if var_35_14 < arg_32_1.time_ and arg_32_1.time_ <= var_35_14 + arg_35_0 then
				arg_32_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_35_15 = arg_32_1.actors_["1039ui_story"]
			local var_35_16 = 0

			if var_35_16 < arg_32_1.time_ and arg_32_1.time_ <= var_35_16 + arg_35_0 and arg_32_1.var_.characterEffect1039ui_story == nil then
				arg_32_1.var_.characterEffect1039ui_story = var_35_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_17 = 0.2

			if var_35_16 <= arg_32_1.time_ and arg_32_1.time_ < var_35_16 + var_35_17 then
				local var_35_18 = (arg_32_1.time_ - var_35_16) / var_35_17

				if arg_32_1.var_.characterEffect1039ui_story then
					arg_32_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_32_1.time_ >= var_35_16 + var_35_17 and arg_32_1.time_ < var_35_16 + var_35_17 + arg_35_0 and arg_32_1.var_.characterEffect1039ui_story then
				arg_32_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_35_19 = arg_32_1.actors_["1027ui_story"].transform
			local var_35_20 = 0

			if var_35_20 < arg_32_1.time_ and arg_32_1.time_ <= var_35_20 + arg_35_0 then
				arg_32_1.var_.moveOldPos1027ui_story = var_35_19.localPosition
			end

			local var_35_21 = 0.001

			if var_35_20 <= arg_32_1.time_ and arg_32_1.time_ < var_35_20 + var_35_21 then
				local var_35_22 = (arg_32_1.time_ - var_35_20) / var_35_21
				local var_35_23 = Vector3.New(0, 100, 0)

				var_35_19.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1027ui_story, var_35_23, var_35_22)

				local var_35_24 = manager.ui.mainCamera.transform.position - var_35_19.position

				var_35_19.forward = Vector3.New(var_35_24.x, var_35_24.y, var_35_24.z)

				local var_35_25 = var_35_19.localEulerAngles

				var_35_25.z = 0
				var_35_25.x = 0
				var_35_19.localEulerAngles = var_35_25
			end

			if arg_32_1.time_ >= var_35_20 + var_35_21 and arg_32_1.time_ < var_35_20 + var_35_21 + arg_35_0 then
				var_35_19.localPosition = Vector3.New(0, 100, 0)

				local var_35_26 = manager.ui.mainCamera.transform.position - var_35_19.position

				var_35_19.forward = Vector3.New(var_35_26.x, var_35_26.y, var_35_26.z)

				local var_35_27 = var_35_19.localEulerAngles

				var_35_27.z = 0
				var_35_27.x = 0
				var_35_19.localEulerAngles = var_35_27
			end

			local var_35_28 = arg_32_1.actors_["1084ui_story"].transform
			local var_35_29 = 0

			if var_35_29 < arg_32_1.time_ and arg_32_1.time_ <= var_35_29 + arg_35_0 then
				arg_32_1.var_.moveOldPos1084ui_story = var_35_28.localPosition
			end

			local var_35_30 = 0.001

			if var_35_29 <= arg_32_1.time_ and arg_32_1.time_ < var_35_29 + var_35_30 then
				local var_35_31 = (arg_32_1.time_ - var_35_29) / var_35_30
				local var_35_32 = Vector3.New(0, 100, 0)

				var_35_28.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1084ui_story, var_35_32, var_35_31)

				local var_35_33 = manager.ui.mainCamera.transform.position - var_35_28.position

				var_35_28.forward = Vector3.New(var_35_33.x, var_35_33.y, var_35_33.z)

				local var_35_34 = var_35_28.localEulerAngles

				var_35_34.z = 0
				var_35_34.x = 0
				var_35_28.localEulerAngles = var_35_34
			end

			if arg_32_1.time_ >= var_35_29 + var_35_30 and arg_32_1.time_ < var_35_29 + var_35_30 + arg_35_0 then
				var_35_28.localPosition = Vector3.New(0, 100, 0)

				local var_35_35 = manager.ui.mainCamera.transform.position - var_35_28.position

				var_35_28.forward = Vector3.New(var_35_35.x, var_35_35.y, var_35_35.z)

				local var_35_36 = var_35_28.localEulerAngles

				var_35_36.z = 0
				var_35_36.x = 0
				var_35_28.localEulerAngles = var_35_36
			end

			local var_35_37 = 0
			local var_35_38 = 0.325

			if var_35_37 < arg_32_1.time_ and arg_32_1.time_ <= var_35_37 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_39 = arg_32_1:FormatText(StoryNameCfg[9].name)

				arg_32_1.leftNameTxt_.text = var_35_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_40 = arg_32_1:GetWordFromCfg(112022008)
				local var_35_41 = arg_32_1:FormatText(var_35_40.content)

				arg_32_1.text_.text = var_35_41

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_42 = 13
				local var_35_43 = utf8.len(var_35_41)
				local var_35_44 = var_35_42 <= 0 and var_35_38 or var_35_38 * (var_35_43 / var_35_42)

				if var_35_44 > 0 and var_35_38 < var_35_44 then
					arg_32_1.talkMaxDuration = var_35_44

					if var_35_44 + var_35_37 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_44 + var_35_37
					end
				end

				arg_32_1.text_.text = var_35_41
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022008", "story_v_out_112022.awb") ~= 0 then
					local var_35_45 = manager.audio:GetVoiceLength("story_v_out_112022", "112022008", "story_v_out_112022.awb") / 1000

					if var_35_45 + var_35_37 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_45 + var_35_37
					end

					if var_35_40.prefab_name ~= "" and arg_32_1.actors_[var_35_40.prefab_name] ~= nil then
						local var_35_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_32_1.actors_[var_35_40.prefab_name].transform, "story_v_out_112022", "112022008", "story_v_out_112022.awb")

						arg_32_1:RecordAudio("112022008", var_35_46)
						arg_32_1:RecordAudio("112022008", var_35_46)
					else
						arg_32_1:AudioAction("play", "voice", "story_v_out_112022", "112022008", "story_v_out_112022.awb")
					end

					arg_32_1:RecordHistoryTalkVoice("story_v_out_112022", "112022008", "story_v_out_112022.awb")
				end

				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_47 = math.max(var_35_38, arg_32_1.talkMaxDuration)

			if var_35_37 <= arg_32_1.time_ and arg_32_1.time_ < var_35_37 + var_35_47 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_37) / var_35_47

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_37 + var_35_47 and arg_32_1.time_ < var_35_37 + var_35_47 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play112022009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 112022009
		arg_36_1.duration_ = 13.2

		local var_36_0 = {
			ja = 13.2,
			ko = 9.7,
			zh = 10.233,
			en = 10.6
		}
		local var_36_1 = manager.audio:GetLocalizationFlag()

		if var_36_0[var_36_1] ~= nil then
			arg_36_1.duration_ = var_36_0[var_36_1]
		end

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play112022010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = arg_36_1.actors_["1039ui_story"]
			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 and arg_36_1.var_.characterEffect1039ui_story == nil then
				arg_36_1.var_.characterEffect1039ui_story = var_39_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_2 = 0.2

			if var_39_1 <= arg_36_1.time_ and arg_36_1.time_ < var_39_1 + var_39_2 then
				local var_39_3 = (arg_36_1.time_ - var_39_1) / var_39_2

				if arg_36_1.var_.characterEffect1039ui_story then
					local var_39_4 = Mathf.Lerp(0, 0.5, var_39_3)

					arg_36_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_36_1.var_.characterEffect1039ui_story.fillRatio = var_39_4
				end
			end

			if arg_36_1.time_ >= var_39_1 + var_39_2 and arg_36_1.time_ < var_39_1 + var_39_2 + arg_39_0 and arg_36_1.var_.characterEffect1039ui_story then
				local var_39_5 = 0.5

				arg_36_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_36_1.var_.characterEffect1039ui_story.fillRatio = var_39_5
			end

			local var_39_6 = 0

			if var_39_6 < arg_36_1.time_ and arg_36_1.time_ <= var_39_6 + arg_39_0 then
				arg_36_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_39_7 = 0

			if var_39_7 < arg_36_1.time_ and arg_36_1.time_ <= var_39_7 + arg_39_0 then
				arg_36_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_39_8 = arg_36_1.actors_["1081ui_story"]
			local var_39_9 = 0

			if var_39_9 < arg_36_1.time_ and arg_36_1.time_ <= var_39_9 + arg_39_0 and arg_36_1.var_.characterEffect1081ui_story == nil then
				arg_36_1.var_.characterEffect1081ui_story = var_39_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_10 = 0.2

			if var_39_9 <= arg_36_1.time_ and arg_36_1.time_ < var_39_9 + var_39_10 then
				local var_39_11 = (arg_36_1.time_ - var_39_9) / var_39_10

				if arg_36_1.var_.characterEffect1081ui_story then
					arg_36_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_9 + var_39_10 and arg_36_1.time_ < var_39_9 + var_39_10 + arg_39_0 and arg_36_1.var_.characterEffect1081ui_story then
				arg_36_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_39_12 = arg_36_1.actors_["1081ui_story"].transform
			local var_39_13 = 0

			if var_39_13 < arg_36_1.time_ and arg_36_1.time_ <= var_39_13 + arg_39_0 then
				arg_36_1.var_.moveOldPos1081ui_story = var_39_12.localPosition
			end

			local var_39_14 = 0.001

			if var_39_13 <= arg_36_1.time_ and arg_36_1.time_ < var_39_13 + var_39_14 then
				local var_39_15 = (arg_36_1.time_ - var_39_13) / var_39_14
				local var_39_16 = Vector3.New(0.7, -0.92, -5.8)

				var_39_12.localPosition = Vector3.Lerp(arg_36_1.var_.moveOldPos1081ui_story, var_39_16, var_39_15)

				local var_39_17 = manager.ui.mainCamera.transform.position - var_39_12.position

				var_39_12.forward = Vector3.New(var_39_17.x, var_39_17.y, var_39_17.z)

				local var_39_18 = var_39_12.localEulerAngles

				var_39_18.z = 0
				var_39_18.x = 0
				var_39_12.localEulerAngles = var_39_18
			end

			if arg_36_1.time_ >= var_39_13 + var_39_14 and arg_36_1.time_ < var_39_13 + var_39_14 + arg_39_0 then
				var_39_12.localPosition = Vector3.New(0.7, -0.92, -5.8)

				local var_39_19 = manager.ui.mainCamera.transform.position - var_39_12.position

				var_39_12.forward = Vector3.New(var_39_19.x, var_39_19.y, var_39_19.z)

				local var_39_20 = var_39_12.localEulerAngles

				var_39_20.z = 0
				var_39_20.x = 0
				var_39_12.localEulerAngles = var_39_20
			end

			local var_39_21 = 0
			local var_39_22 = 0.975

			if var_39_21 < arg_36_1.time_ and arg_36_1.time_ <= var_39_21 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_23 = arg_36_1:FormatText(StoryNameCfg[202].name)

				arg_36_1.leftNameTxt_.text = var_39_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_24 = arg_36_1:GetWordFromCfg(112022009)
				local var_39_25 = arg_36_1:FormatText(var_39_24.content)

				arg_36_1.text_.text = var_39_25

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_26 = 39
				local var_39_27 = utf8.len(var_39_25)
				local var_39_28 = var_39_26 <= 0 and var_39_22 or var_39_22 * (var_39_27 / var_39_26)

				if var_39_28 > 0 and var_39_22 < var_39_28 then
					arg_36_1.talkMaxDuration = var_39_28

					if var_39_28 + var_39_21 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_28 + var_39_21
					end
				end

				arg_36_1.text_.text = var_39_25
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112022", "112022009", "story_v_out_112022.awb") ~= 0 then
					local var_39_29 = manager.audio:GetVoiceLength("story_v_out_112022", "112022009", "story_v_out_112022.awb") / 1000

					if var_39_29 + var_39_21 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_29 + var_39_21
					end

					if var_39_24.prefab_name ~= "" and arg_36_1.actors_[var_39_24.prefab_name] ~= nil then
						local var_39_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_24.prefab_name].transform, "story_v_out_112022", "112022009", "story_v_out_112022.awb")

						arg_36_1:RecordAudio("112022009", var_39_30)
						arg_36_1:RecordAudio("112022009", var_39_30)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_112022", "112022009", "story_v_out_112022.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_112022", "112022009", "story_v_out_112022.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_31 = math.max(var_39_22, arg_36_1.talkMaxDuration)

			if var_39_21 <= arg_36_1.time_ and arg_36_1.time_ < var_39_21 + var_39_31 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_21) / var_39_31

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_21 + var_39_31 and arg_36_1.time_ < var_39_21 + var_39_31 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play112022010 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 112022010
		arg_40_1.duration_ = 5

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play112022011(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = arg_40_1.actors_["1039ui_story"].transform
			local var_43_1 = 0

			if var_43_1 < arg_40_1.time_ and arg_40_1.time_ <= var_43_1 + arg_43_0 then
				arg_40_1.var_.moveOldPos1039ui_story = var_43_0.localPosition
			end

			local var_43_2 = 0.001

			if var_43_1 <= arg_40_1.time_ and arg_40_1.time_ < var_43_1 + var_43_2 then
				local var_43_3 = (arg_40_1.time_ - var_43_1) / var_43_2
				local var_43_4 = Vector3.New(0, 100, 0)

				var_43_0.localPosition = Vector3.Lerp(arg_40_1.var_.moveOldPos1039ui_story, var_43_4, var_43_3)

				local var_43_5 = manager.ui.mainCamera.transform.position - var_43_0.position

				var_43_0.forward = Vector3.New(var_43_5.x, var_43_5.y, var_43_5.z)

				local var_43_6 = var_43_0.localEulerAngles

				var_43_6.z = 0
				var_43_6.x = 0
				var_43_0.localEulerAngles = var_43_6
			end

			if arg_40_1.time_ >= var_43_1 + var_43_2 and arg_40_1.time_ < var_43_1 + var_43_2 + arg_43_0 then
				var_43_0.localPosition = Vector3.New(0, 100, 0)

				local var_43_7 = manager.ui.mainCamera.transform.position - var_43_0.position

				var_43_0.forward = Vector3.New(var_43_7.x, var_43_7.y, var_43_7.z)

				local var_43_8 = var_43_0.localEulerAngles

				var_43_8.z = 0
				var_43_8.x = 0
				var_43_0.localEulerAngles = var_43_8
			end

			local var_43_9 = arg_40_1.actors_["1081ui_story"].transform
			local var_43_10 = 0

			if var_43_10 < arg_40_1.time_ and arg_40_1.time_ <= var_43_10 + arg_43_0 then
				arg_40_1.var_.moveOldPos1081ui_story = var_43_9.localPosition
			end

			local var_43_11 = 0.001

			if var_43_10 <= arg_40_1.time_ and arg_40_1.time_ < var_43_10 + var_43_11 then
				local var_43_12 = (arg_40_1.time_ - var_43_10) / var_43_11
				local var_43_13 = Vector3.New(0, 100, 0)

				var_43_9.localPosition = Vector3.Lerp(arg_40_1.var_.moveOldPos1081ui_story, var_43_13, var_43_12)

				local var_43_14 = manager.ui.mainCamera.transform.position - var_43_9.position

				var_43_9.forward = Vector3.New(var_43_14.x, var_43_14.y, var_43_14.z)

				local var_43_15 = var_43_9.localEulerAngles

				var_43_15.z = 0
				var_43_15.x = 0
				var_43_9.localEulerAngles = var_43_15
			end

			if arg_40_1.time_ >= var_43_10 + var_43_11 and arg_40_1.time_ < var_43_10 + var_43_11 + arg_43_0 then
				var_43_9.localPosition = Vector3.New(0, 100, 0)

				local var_43_16 = manager.ui.mainCamera.transform.position - var_43_9.position

				var_43_9.forward = Vector3.New(var_43_16.x, var_43_16.y, var_43_16.z)

				local var_43_17 = var_43_9.localEulerAngles

				var_43_17.z = 0
				var_43_17.x = 0
				var_43_9.localEulerAngles = var_43_17
			end

			local var_43_18 = 0
			local var_43_19 = 0.425

			if var_43_18 < arg_40_1.time_ and arg_40_1.time_ <= var_43_18 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, true)

				local var_43_20 = arg_40_1:FormatText(StoryNameCfg[7].name)

				arg_40_1.leftNameTxt_.text = var_43_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_40_1.leftNameTxt_.transform)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1.leftNameTxt_.text)
				SetActive(arg_40_1.iconTrs_.gameObject, false)
				arg_40_1.callingController_:SetSelectedState("normal")

				local var_43_21 = arg_40_1:GetWordFromCfg(112022010)
				local var_43_22 = arg_40_1:FormatText(var_43_21.content)

				arg_40_1.text_.text = var_43_22

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_23 = 17
				local var_43_24 = utf8.len(var_43_22)
				local var_43_25 = var_43_23 <= 0 and var_43_19 or var_43_19 * (var_43_24 / var_43_23)

				if var_43_25 > 0 and var_43_19 < var_43_25 then
					arg_40_1.talkMaxDuration = var_43_25

					if var_43_25 + var_43_18 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_25 + var_43_18
					end
				end

				arg_40_1.text_.text = var_43_22
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)
				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_26 = math.max(var_43_19, arg_40_1.talkMaxDuration)

			if var_43_18 <= arg_40_1.time_ and arg_40_1.time_ < var_43_18 + var_43_26 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_18) / var_43_26

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_18 + var_43_26 and arg_40_1.time_ < var_43_18 + var_43_26 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play112022011 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 112022011
		arg_44_1.duration_ = 6.6

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
			arg_44_1.auto_ = false
		end

		function arg_44_1.playNext_(arg_46_0)
			arg_44_1.onStoryFinished_()
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = manager.ui.mainCamera.transform
			local var_47_1 = 0

			if var_47_1 < arg_44_1.time_ and arg_44_1.time_ <= var_47_1 + arg_47_0 then
				arg_44_1.var_.shakeOldPos = var_47_0.localPosition
			end

			local var_47_2 = 0.6

			if var_47_1 <= arg_44_1.time_ and arg_44_1.time_ < var_47_1 + var_47_2 then
				local var_47_3 = (arg_44_1.time_ - var_47_1) / 0.066
				local var_47_4, var_47_5 = math.modf(var_47_3)

				var_47_0.localPosition = Vector3.New(var_47_5 * 0.13, var_47_5 * 0.13, var_47_5 * 0.13) + arg_44_1.var_.shakeOldPos
			end

			if arg_44_1.time_ >= var_47_1 + var_47_2 and arg_44_1.time_ < var_47_1 + var_47_2 + arg_47_0 then
				var_47_0.localPosition = arg_44_1.var_.shakeOldPos
			end

			local var_47_6 = arg_44_1.bgs_.H01a
			local var_47_7 = 0.6

			if var_47_7 < arg_44_1.time_ and arg_44_1.time_ <= var_47_7 + arg_47_0 then
				local var_47_8 = var_47_6:GetComponent("SpriteRenderer")

				if var_47_8 then
					var_47_8.material = arg_44_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_47_9 = var_47_8.material
					local var_47_10 = var_47_9:GetColor("_Color")

					arg_44_1.var_.alphaOldValueH01a = var_47_10.a
					arg_44_1.var_.alphaMatValueH01a = var_47_9
				end

				arg_44_1.var_.alphaOldValueH01a = 1
			end

			local var_47_11 = 2

			if var_47_7 <= arg_44_1.time_ and arg_44_1.time_ < var_47_7 + var_47_11 then
				local var_47_12 = (arg_44_1.time_ - var_47_7) / var_47_11
				local var_47_13 = Mathf.Lerp(arg_44_1.var_.alphaOldValueH01a, 0, var_47_12)

				if arg_44_1.var_.alphaMatValueH01a then
					local var_47_14 = arg_44_1.var_.alphaMatValueH01a
					local var_47_15 = var_47_14:GetColor("_Color")

					var_47_15.a = var_47_13

					var_47_14:SetColor("_Color", var_47_15)
				end
			end

			if arg_44_1.time_ >= var_47_7 + var_47_11 and arg_44_1.time_ < var_47_7 + var_47_11 + arg_47_0 and arg_44_1.var_.alphaMatValueH01a then
				local var_47_16 = arg_44_1.var_.alphaMatValueH01a
				local var_47_17 = var_47_16:GetColor("_Color")

				var_47_17.a = 0

				var_47_16:SetColor("_Color", var_47_17)
			end

			local var_47_18 = 0

			if var_47_18 < arg_44_1.time_ and arg_44_1.time_ <= var_47_18 + arg_47_0 then
				arg_44_1.allBtn_.enabled = false
			end

			local var_47_19 = 0.6

			if arg_44_1.time_ >= var_47_18 + var_47_19 and arg_44_1.time_ < var_47_18 + var_47_19 + arg_47_0 then
				arg_44_1.allBtn_.enabled = true
			end

			local var_47_20 = 1.599999999999
			local var_47_21 = 1

			if var_47_20 < arg_44_1.time_ and arg_44_1.time_ <= var_47_20 + arg_47_0 then
				local var_47_22 = "stop"
				local var_47_23 = "effect"

				arg_44_1:AudioAction(var_47_22, var_47_23, "se_story_activity_1_2_summer1", "se_story_activity_1_2_summer1_tideloop", "")
			end

			if arg_44_1.frameCnt_ <= 1 then
				arg_44_1.dialog_:SetActive(false)
			end

			local var_47_24 = 1.599999999999
			local var_47_25 = 1

			if var_47_24 < arg_44_1.time_ and arg_44_1.time_ <= var_47_24 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0

				arg_44_1.dialog_:SetActive(true)

				local var_47_26 = LeanTween.value(arg_44_1.dialog_, 0, 1, 0.3)

				var_47_26:setOnUpdate(LuaHelper.FloatAction(function(arg_48_0)
					arg_44_1.dialogCg_.alpha = arg_48_0
				end))
				var_47_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_44_1.dialog_)
					var_47_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_44_1.duration_ = arg_44_1.duration_ + 0.3

				SetActive(arg_44_1.leftNameGo_, false)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_44_1.iconTrs_.gameObject, false)
				arg_44_1.callingController_:SetSelectedState("normal")

				local var_47_27 = arg_44_1:GetWordFromCfg(112022011)
				local var_47_28 = arg_44_1:FormatText(var_47_27.content)

				arg_44_1.text_.text = var_47_28

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_29 = 47
				local var_47_30 = utf8.len(var_47_28)
				local var_47_31 = var_47_29 <= 0 and var_47_25 or var_47_25 * (var_47_30 / var_47_29)

				if var_47_31 > 0 and var_47_25 < var_47_31 then
					arg_44_1.talkMaxDuration = var_47_31
					var_47_24 = var_47_24 + 0.3

					if var_47_31 + var_47_24 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_31 + var_47_24
					end
				end

				arg_44_1.text_.text = var_47_28
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)
				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_32 = var_47_24 + 0.3
			local var_47_33 = math.max(var_47_25, arg_44_1.talkMaxDuration)

			if var_47_32 <= arg_44_1.time_ and arg_44_1.time_ < var_47_32 + var_47_33 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_32) / var_47_33

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_32 + var_47_33 and arg_44_1.time_ < var_47_32 + var_47_33 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/H01a"
	},
	voices = {
		"story_v_out_112022.awb"
	}
}
