﻿return {
	Play411151001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 411151001
		arg_1_1.duration_ = 8.67

		local var_1_0 = {
			zh = 7.266,
			ja = 8.666
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
				arg_1_0:Play411151002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I11o"

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
				local var_4_5 = arg_1_1.bgs_.I11o

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
					if iter_4_0 ~= "I11o" then
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

			local var_4_22 = "1095ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Asset.Load("Char/" .. "1095ui_story")

				if not isNil(var_4_23) then
					local var_4_24 = Object.Instantiate(Asset.Load("Char/" .. "1095ui_story"), arg_1_1.stage_.transform)

					var_4_24.name = var_4_22
					var_4_24.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_22] = var_4_24

					local var_4_25 = var_4_24:GetComponentInChildren(typeof(CharacterEffect))

					var_4_25.enabled = true

					local var_4_26 = GameObjectTools.GetOrAddComponent(var_4_24, typeof(DynamicBoneHelper))

					if var_4_26 then
						var_4_26:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_25.transform, false)

					arg_1_1.var_[var_4_22 .. "Animator"] = var_4_25.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_25.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_27 = arg_1_1.actors_["1095ui_story"].transform
			local var_4_28 = 2

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_27.localPosition
			end

			local var_4_29 = 0.001

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_28) / var_4_29
				local var_4_31 = Vector3.New(0, -0.98, -6.1)

				var_4_27.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_27.position

				var_4_27.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_27.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_27.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				var_4_27.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_27.position

				var_4_27.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_27.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_27.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1095ui_story"]
			local var_4_37 = 2

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and not isNil(var_4_36) and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 and not isNil(var_4_36) then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1095ui_story and not isNil(var_4_36) then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and not isNil(var_4_36) and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_42 = 0
			local var_4_43 = 0.3

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				local var_4_44 = "play"
				local var_4_45 = "music"

				arg_1_1:AudioAction(var_4_44, var_4_45, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_46 = ""
				local var_4_47 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_47 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_47 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_47

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_47
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

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_48 = 2
			local var_4_49 = 0.7

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_50 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_50:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_51 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_52 = arg_1_1:GetWordFromCfg(411151001)
				local var_4_53 = arg_1_1:FormatText(var_4_52.content)

				arg_1_1.text_.text = var_4_53

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_54 = 28
				local var_4_55 = utf8.len(var_4_53)
				local var_4_56 = var_4_54 <= 0 and var_4_49 or var_4_49 * (var_4_55 / var_4_54)

				if var_4_56 > 0 and var_4_49 < var_4_56 then
					arg_1_1.talkMaxDuration = var_4_56
					var_4_48 = var_4_48 + 0.3

					if var_4_56 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_56 + var_4_48
					end
				end

				arg_1_1.text_.text = var_4_53
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151001", "story_v_out_411151.awb") ~= 0 then
					local var_4_57 = manager.audio:GetVoiceLength("story_v_out_411151", "411151001", "story_v_out_411151.awb") / 1000

					if var_4_57 + var_4_48 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_48
					end

					if var_4_52.prefab_name ~= "" and arg_1_1.actors_[var_4_52.prefab_name] ~= nil then
						local var_4_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_52.prefab_name].transform, "story_v_out_411151", "411151001", "story_v_out_411151.awb")

						arg_1_1:RecordAudio("411151001", var_4_58)
						arg_1_1:RecordAudio("411151001", var_4_58)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_411151", "411151001", "story_v_out_411151.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_411151", "411151001", "story_v_out_411151.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_59 = var_4_48 + 0.3
			local var_4_60 = math.max(var_4_49, arg_1_1.talkMaxDuration)

			if var_4_59 <= arg_1_1.time_ and arg_1_1.time_ < var_4_59 + var_4_60 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_59) / var_4_60

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_59 + var_4_60 and arg_1_1.time_ < var_4_59 + var_4_60 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play411151002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 411151002
		arg_8_1.duration_ = 5.9

		local var_8_0 = {
			zh = 3.433,
			ja = 5.9
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
				arg_8_0:Play411151003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = 0
			local var_11_1 = 0.4

			if var_11_0 < arg_8_1.time_ and arg_8_1.time_ <= var_11_0 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_2 = arg_8_1:FormatText(StoryNameCfg[471].name)

				arg_8_1.leftNameTxt_.text = var_11_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_3 = arg_8_1:GetWordFromCfg(411151002)
				local var_11_4 = arg_8_1:FormatText(var_11_3.content)

				arg_8_1.text_.text = var_11_4

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_5 = 16
				local var_11_6 = utf8.len(var_11_4)
				local var_11_7 = var_11_5 <= 0 and var_11_1 or var_11_1 * (var_11_6 / var_11_5)

				if var_11_7 > 0 and var_11_1 < var_11_7 then
					arg_8_1.talkMaxDuration = var_11_7

					if var_11_7 + var_11_0 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_7 + var_11_0
					end
				end

				arg_8_1.text_.text = var_11_4
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151002", "story_v_out_411151.awb") ~= 0 then
					local var_11_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151002", "story_v_out_411151.awb") / 1000

					if var_11_8 + var_11_0 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_8 + var_11_0
					end

					if var_11_3.prefab_name ~= "" and arg_8_1.actors_[var_11_3.prefab_name] ~= nil then
						local var_11_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_8_1.actors_[var_11_3.prefab_name].transform, "story_v_out_411151", "411151002", "story_v_out_411151.awb")

						arg_8_1:RecordAudio("411151002", var_11_9)
						arg_8_1:RecordAudio("411151002", var_11_9)
					else
						arg_8_1:AudioAction("play", "voice", "story_v_out_411151", "411151002", "story_v_out_411151.awb")
					end

					arg_8_1:RecordHistoryTalkVoice("story_v_out_411151", "411151002", "story_v_out_411151.awb")
				end

				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_10 = math.max(var_11_1, arg_8_1.talkMaxDuration)

			if var_11_0 <= arg_8_1.time_ and arg_8_1.time_ < var_11_0 + var_11_10 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_0) / var_11_10

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_0 + var_11_10 and arg_8_1.time_ < var_11_0 + var_11_10 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play411151003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 411151003
		arg_12_1.duration_ = 5

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play411151004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = arg_12_1.actors_["1095ui_story"]
			local var_15_1 = 0

			if var_15_1 < arg_12_1.time_ and arg_12_1.time_ <= var_15_1 + arg_15_0 and not isNil(var_15_0) and arg_12_1.var_.characterEffect1095ui_story == nil then
				arg_12_1.var_.characterEffect1095ui_story = var_15_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_2 = 0.200000002980232

			if var_15_1 <= arg_12_1.time_ and arg_12_1.time_ < var_15_1 + var_15_2 and not isNil(var_15_0) then
				local var_15_3 = (arg_12_1.time_ - var_15_1) / var_15_2

				if arg_12_1.var_.characterEffect1095ui_story and not isNil(var_15_0) then
					local var_15_4 = Mathf.Lerp(0, 0.5, var_15_3)

					arg_12_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_12_1.var_.characterEffect1095ui_story.fillRatio = var_15_4
				end
			end

			if arg_12_1.time_ >= var_15_1 + var_15_2 and arg_12_1.time_ < var_15_1 + var_15_2 + arg_15_0 and not isNil(var_15_0) and arg_12_1.var_.characterEffect1095ui_story then
				local var_15_5 = 0.5

				arg_12_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_12_1.var_.characterEffect1095ui_story.fillRatio = var_15_5
			end

			local var_15_6 = arg_12_1.actors_["1095ui_story"].transform
			local var_15_7 = 0

			if var_15_7 < arg_12_1.time_ and arg_12_1.time_ <= var_15_7 + arg_15_0 then
				arg_12_1.var_.moveOldPos1095ui_story = var_15_6.localPosition
			end

			local var_15_8 = 0.001

			if var_15_7 <= arg_12_1.time_ and arg_12_1.time_ < var_15_7 + var_15_8 then
				local var_15_9 = (arg_12_1.time_ - var_15_7) / var_15_8
				local var_15_10 = Vector3.New(0, 100, 0)

				var_15_6.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1095ui_story, var_15_10, var_15_9)

				local var_15_11 = manager.ui.mainCamera.transform.position - var_15_6.position

				var_15_6.forward = Vector3.New(var_15_11.x, var_15_11.y, var_15_11.z)

				local var_15_12 = var_15_6.localEulerAngles

				var_15_12.z = 0
				var_15_12.x = 0
				var_15_6.localEulerAngles = var_15_12
			end

			if arg_12_1.time_ >= var_15_7 + var_15_8 and arg_12_1.time_ < var_15_7 + var_15_8 + arg_15_0 then
				var_15_6.localPosition = Vector3.New(0, 100, 0)

				local var_15_13 = manager.ui.mainCamera.transform.position - var_15_6.position

				var_15_6.forward = Vector3.New(var_15_13.x, var_15_13.y, var_15_13.z)

				local var_15_14 = var_15_6.localEulerAngles

				var_15_14.z = 0
				var_15_14.x = 0
				var_15_6.localEulerAngles = var_15_14
			end

			local var_15_15 = 0
			local var_15_16 = 0.65

			if var_15_15 < arg_12_1.time_ and arg_12_1.time_ <= var_15_15 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, false)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_17 = arg_12_1:GetWordFromCfg(411151003)
				local var_15_18 = arg_12_1:FormatText(var_15_17.content)

				arg_12_1.text_.text = var_15_18

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_19 = 26
				local var_15_20 = utf8.len(var_15_18)
				local var_15_21 = var_15_19 <= 0 and var_15_16 or var_15_16 * (var_15_20 / var_15_19)

				if var_15_21 > 0 and var_15_16 < var_15_21 then
					arg_12_1.talkMaxDuration = var_15_21

					if var_15_21 + var_15_15 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_21 + var_15_15
					end
				end

				arg_12_1.text_.text = var_15_18
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)
				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_22 = math.max(var_15_16, arg_12_1.talkMaxDuration)

			if var_15_15 <= arg_12_1.time_ and arg_12_1.time_ < var_15_15 + var_15_22 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_15) / var_15_22

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_15 + var_15_22 and arg_12_1.time_ < var_15_15 + var_15_22 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play411151004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 411151004
		arg_16_1.duration_ = 5

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play411151005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = 0
			local var_19_1 = 0.725

			if var_19_0 < arg_16_1.time_ and arg_16_1.time_ <= var_19_0 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, false)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_2 = arg_16_1:GetWordFromCfg(411151004)
				local var_19_3 = arg_16_1:FormatText(var_19_2.content)

				arg_16_1.text_.text = var_19_3

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_4 = 29
				local var_19_5 = utf8.len(var_19_3)
				local var_19_6 = var_19_4 <= 0 and var_19_1 or var_19_1 * (var_19_5 / var_19_4)

				if var_19_6 > 0 and var_19_1 < var_19_6 then
					arg_16_1.talkMaxDuration = var_19_6

					if var_19_6 + var_19_0 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_6 + var_19_0
					end
				end

				arg_16_1.text_.text = var_19_3
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)
				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_7 = math.max(var_19_1, arg_16_1.talkMaxDuration)

			if var_19_0 <= arg_16_1.time_ and arg_16_1.time_ < var_19_0 + var_19_7 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_0) / var_19_7

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_0 + var_19_7 and arg_16_1.time_ < var_19_0 + var_19_7 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play411151005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 411151005
		arg_20_1.duration_ = 5.3

		local var_20_0 = {
			zh = 5.3,
			ja = 4.2
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
				arg_20_0:Play411151006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = arg_20_1.actors_["1095ui_story"]
			local var_23_1 = 0

			if var_23_1 < arg_20_1.time_ and arg_20_1.time_ <= var_23_1 + arg_23_0 and not isNil(var_23_0) and arg_20_1.var_.characterEffect1095ui_story == nil then
				arg_20_1.var_.characterEffect1095ui_story = var_23_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_2 = 0.200000002980232

			if var_23_1 <= arg_20_1.time_ and arg_20_1.time_ < var_23_1 + var_23_2 and not isNil(var_23_0) then
				local var_23_3 = (arg_20_1.time_ - var_23_1) / var_23_2

				if arg_20_1.var_.characterEffect1095ui_story and not isNil(var_23_0) then
					arg_20_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_1 + var_23_2 and arg_20_1.time_ < var_23_1 + var_23_2 + arg_23_0 and not isNil(var_23_0) and arg_20_1.var_.characterEffect1095ui_story then
				arg_20_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_23_4 = 0
			local var_23_5 = 0.45

			if var_23_4 < arg_20_1.time_ and arg_20_1.time_ <= var_23_4 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_6 = arg_20_1:FormatText(StoryNameCfg[471].name)

				arg_20_1.leftNameTxt_.text = var_23_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, true)
				arg_20_1.iconController_:SetSelectedState("hero")

				arg_20_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1095")

				arg_20_1.callingController_:SetSelectedState("normal")

				arg_20_1.keyicon_.color = Color.New(1, 1, 1)
				arg_20_1.icon_.color = Color.New(1, 1, 1)

				local var_23_7 = arg_20_1:GetWordFromCfg(411151005)
				local var_23_8 = arg_20_1:FormatText(var_23_7.content)

				arg_20_1.text_.text = var_23_8

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_9 = 18
				local var_23_10 = utf8.len(var_23_8)
				local var_23_11 = var_23_9 <= 0 and var_23_5 or var_23_5 * (var_23_10 / var_23_9)

				if var_23_11 > 0 and var_23_5 < var_23_11 then
					arg_20_1.talkMaxDuration = var_23_11

					if var_23_11 + var_23_4 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_11 + var_23_4
					end
				end

				arg_20_1.text_.text = var_23_8
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151005", "story_v_out_411151.awb") ~= 0 then
					local var_23_12 = manager.audio:GetVoiceLength("story_v_out_411151", "411151005", "story_v_out_411151.awb") / 1000

					if var_23_12 + var_23_4 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_12 + var_23_4
					end

					if var_23_7.prefab_name ~= "" and arg_20_1.actors_[var_23_7.prefab_name] ~= nil then
						local var_23_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_7.prefab_name].transform, "story_v_out_411151", "411151005", "story_v_out_411151.awb")

						arg_20_1:RecordAudio("411151005", var_23_13)
						arg_20_1:RecordAudio("411151005", var_23_13)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_411151", "411151005", "story_v_out_411151.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_411151", "411151005", "story_v_out_411151.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_14 = math.max(var_23_5, arg_20_1.talkMaxDuration)

			if var_23_4 <= arg_20_1.time_ and arg_20_1.time_ < var_23_4 + var_23_14 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_4) / var_23_14

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_4 + var_23_14 and arg_20_1.time_ < var_23_4 + var_23_14 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play411151006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 411151006
		arg_24_1.duration_ = 9

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play411151007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = "ST74a"

			if arg_24_1.bgs_[var_27_0] == nil then
				local var_27_1 = Object.Instantiate(arg_24_1.paintGo_)

				var_27_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_27_0)
				var_27_1.name = var_27_0
				var_27_1.transform.parent = arg_24_1.stage_.transform
				var_27_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_24_1.bgs_[var_27_0] = var_27_1
			end

			local var_27_2 = 2

			if var_27_2 < arg_24_1.time_ and arg_24_1.time_ <= var_27_2 + arg_27_0 then
				local var_27_3 = manager.ui.mainCamera.transform.localPosition
				local var_27_4 = Vector3.New(0, 0, 10) + Vector3.New(var_27_3.x, var_27_3.y, 0)
				local var_27_5 = arg_24_1.bgs_.ST74a

				var_27_5.transform.localPosition = var_27_4
				var_27_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_27_6 = var_27_5:GetComponent("SpriteRenderer")

				if var_27_6 and var_27_6.sprite then
					local var_27_7 = (var_27_5.transform.localPosition - var_27_3).z
					local var_27_8 = manager.ui.mainCameraCom_
					local var_27_9 = 2 * var_27_7 * Mathf.Tan(var_27_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_27_10 = var_27_9 * var_27_8.aspect
					local var_27_11 = var_27_6.sprite.bounds.size.x
					local var_27_12 = var_27_6.sprite.bounds.size.y
					local var_27_13 = var_27_10 / var_27_11
					local var_27_14 = var_27_9 / var_27_12
					local var_27_15 = var_27_14 < var_27_13 and var_27_13 or var_27_14

					var_27_5.transform.localScale = Vector3.New(var_27_15, var_27_15, 0)
				end

				for iter_27_0, iter_27_1 in pairs(arg_24_1.bgs_) do
					if iter_27_0 ~= "ST74a" then
						iter_27_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_27_16 = 0

			if var_27_16 < arg_24_1.time_ and arg_24_1.time_ <= var_27_16 + arg_27_0 then
				arg_24_1.mask_.enabled = true
				arg_24_1.mask_.raycastTarget = true

				arg_24_1:SetGaussion(false)
			end

			local var_27_17 = 2

			if var_27_16 <= arg_24_1.time_ and arg_24_1.time_ < var_27_16 + var_27_17 then
				local var_27_18 = (arg_24_1.time_ - var_27_16) / var_27_17
				local var_27_19 = Color.New(0, 0, 0)

				var_27_19.a = Mathf.Lerp(0, 1, var_27_18)
				arg_24_1.mask_.color = var_27_19
			end

			if arg_24_1.time_ >= var_27_16 + var_27_17 and arg_24_1.time_ < var_27_16 + var_27_17 + arg_27_0 then
				local var_27_20 = Color.New(0, 0, 0)

				var_27_20.a = 1
				arg_24_1.mask_.color = var_27_20
			end

			local var_27_21 = 2

			if var_27_21 < arg_24_1.time_ and arg_24_1.time_ <= var_27_21 + arg_27_0 then
				arg_24_1.mask_.enabled = true
				arg_24_1.mask_.raycastTarget = true

				arg_24_1:SetGaussion(false)
			end

			local var_27_22 = 2

			if var_27_21 <= arg_24_1.time_ and arg_24_1.time_ < var_27_21 + var_27_22 then
				local var_27_23 = (arg_24_1.time_ - var_27_21) / var_27_22
				local var_27_24 = Color.New(0, 0, 0)

				var_27_24.a = Mathf.Lerp(1, 0, var_27_23)
				arg_24_1.mask_.color = var_27_24
			end

			if arg_24_1.time_ >= var_27_21 + var_27_22 and arg_24_1.time_ < var_27_21 + var_27_22 + arg_27_0 then
				local var_27_25 = Color.New(0, 0, 0)
				local var_27_26 = 0

				arg_24_1.mask_.enabled = false
				var_27_25.a = var_27_26
				arg_24_1.mask_.color = var_27_25
			end

			local var_27_27 = arg_24_1.actors_["1095ui_story"].transform
			local var_27_28 = 2

			if var_27_28 < arg_24_1.time_ and arg_24_1.time_ <= var_27_28 + arg_27_0 then
				arg_24_1.var_.moveOldPos1095ui_story = var_27_27.localPosition
			end

			local var_27_29 = 0.001

			if var_27_28 <= arg_24_1.time_ and arg_24_1.time_ < var_27_28 + var_27_29 then
				local var_27_30 = (arg_24_1.time_ - var_27_28) / var_27_29
				local var_27_31 = Vector3.New(0, 100, 0)

				var_27_27.localPosition = Vector3.Lerp(arg_24_1.var_.moveOldPos1095ui_story, var_27_31, var_27_30)

				local var_27_32 = manager.ui.mainCamera.transform.position - var_27_27.position

				var_27_27.forward = Vector3.New(var_27_32.x, var_27_32.y, var_27_32.z)

				local var_27_33 = var_27_27.localEulerAngles

				var_27_33.z = 0
				var_27_33.x = 0
				var_27_27.localEulerAngles = var_27_33
			end

			if arg_24_1.time_ >= var_27_28 + var_27_29 and arg_24_1.time_ < var_27_28 + var_27_29 + arg_27_0 then
				var_27_27.localPosition = Vector3.New(0, 100, 0)

				local var_27_34 = manager.ui.mainCamera.transform.position - var_27_27.position

				var_27_27.forward = Vector3.New(var_27_34.x, var_27_34.y, var_27_34.z)

				local var_27_35 = var_27_27.localEulerAngles

				var_27_35.z = 0
				var_27_35.x = 0
				var_27_27.localEulerAngles = var_27_35
			end

			local var_27_36 = arg_24_1.actors_["1095ui_story"]
			local var_27_37 = 2

			if var_27_37 < arg_24_1.time_ and arg_24_1.time_ <= var_27_37 + arg_27_0 and not isNil(var_27_36) and arg_24_1.var_.characterEffect1095ui_story == nil then
				arg_24_1.var_.characterEffect1095ui_story = var_27_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_38 = 0.200000002980232

			if var_27_37 <= arg_24_1.time_ and arg_24_1.time_ < var_27_37 + var_27_38 and not isNil(var_27_36) then
				local var_27_39 = (arg_24_1.time_ - var_27_37) / var_27_38

				if arg_24_1.var_.characterEffect1095ui_story and not isNil(var_27_36) then
					local var_27_40 = Mathf.Lerp(0, 0.5, var_27_39)

					arg_24_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_24_1.var_.characterEffect1095ui_story.fillRatio = var_27_40
				end
			end

			if arg_24_1.time_ >= var_27_37 + var_27_38 and arg_24_1.time_ < var_27_37 + var_27_38 + arg_27_0 and not isNil(var_27_36) and arg_24_1.var_.characterEffect1095ui_story then
				local var_27_41 = 0.5

				arg_24_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_24_1.var_.characterEffect1095ui_story.fillRatio = var_27_41
			end

			local var_27_42 = 0
			local var_27_43 = 0.200000002980232

			if var_27_42 < arg_24_1.time_ and arg_24_1.time_ <= var_27_42 + arg_27_0 then
				local var_27_44 = "play"
				local var_27_45 = "music"

				arg_24_1:AudioAction(var_27_44, var_27_45, "ui_battle", "ui_battle_stopbgm", "")

				local var_27_46 = ""
				local var_27_47 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_27_47 ~= "" then
					if arg_24_1.bgmTxt_.text ~= var_27_47 and arg_24_1.bgmTxt_.text ~= "" then
						if arg_24_1.bgmTxt2_.text ~= "" then
							arg_24_1.bgmTxt_.text = arg_24_1.bgmTxt2_.text
						end

						arg_24_1.bgmTxt2_.text = var_27_47

						arg_24_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_24_1.bgmTxt_.text = var_27_47
					end

					if arg_24_1.bgmTimer then
						arg_24_1.bgmTimer:Stop()

						arg_24_1.bgmTimer = nil
					end

					if arg_24_1.settingData.show_music_name == 1 then
						arg_24_1.musicController:SetSelectedState("show")
						arg_24_1.musicAnimator_:Play("open", 0, 0)

						if arg_24_1.settingData.music_time ~= 0 then
							arg_24_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_24_1.settingData.music_time), function()
								if arg_24_1 == nil or isNil(arg_24_1.bgmTxt_) then
									return
								end

								arg_24_1.musicController:SetSelectedState("hide")
								arg_24_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_27_48 = 0.233333333333333
			local var_27_49 = 0.3

			if var_27_48 < arg_24_1.time_ and arg_24_1.time_ <= var_27_48 + arg_27_0 then
				local var_27_50 = "play"
				local var_27_51 = "music"

				arg_24_1:AudioAction(var_27_50, var_27_51, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")

				local var_27_52 = ""
				local var_27_53 = manager.audio:GetAudioName("bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon")

				if var_27_53 ~= "" then
					if arg_24_1.bgmTxt_.text ~= var_27_53 and arg_24_1.bgmTxt_.text ~= "" then
						if arg_24_1.bgmTxt2_.text ~= "" then
							arg_24_1.bgmTxt_.text = arg_24_1.bgmTxt2_.text
						end

						arg_24_1.bgmTxt2_.text = var_27_53

						arg_24_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_24_1.bgmTxt_.text = var_27_53
					end

					if arg_24_1.bgmTimer then
						arg_24_1.bgmTimer:Stop()

						arg_24_1.bgmTimer = nil
					end

					if arg_24_1.settingData.show_music_name == 1 then
						arg_24_1.musicController:SetSelectedState("show")
						arg_24_1.musicAnimator_:Play("open", 0, 0)

						if arg_24_1.settingData.music_time ~= 0 then
							arg_24_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_24_1.settingData.music_time), function()
								if arg_24_1 == nil or isNil(arg_24_1.bgmTxt_) then
									return
								end

								arg_24_1.musicController:SetSelectedState("hide")
								arg_24_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_24_1.frameCnt_ <= 1 then
				arg_24_1.dialog_:SetActive(false)
			end

			local var_27_54 = 4
			local var_27_55 = 0.95

			if var_27_54 < arg_24_1.time_ and arg_24_1.time_ <= var_27_54 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0

				arg_24_1.dialog_:SetActive(true)

				local var_27_56 = LeanTween.value(arg_24_1.dialog_, 0, 1, 0.3)

				var_27_56:setOnUpdate(LuaHelper.FloatAction(function(arg_30_0)
					arg_24_1.dialogCg_.alpha = arg_30_0
				end))
				var_27_56:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_24_1.dialog_)
					var_27_56:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_24_1.duration_ = arg_24_1.duration_ + 0.3

				SetActive(arg_24_1.leftNameGo_, false)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_57 = arg_24_1:GetWordFromCfg(411151006)
				local var_27_58 = arg_24_1:FormatText(var_27_57.content)

				arg_24_1.text_.text = var_27_58

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_59 = 38
				local var_27_60 = utf8.len(var_27_58)
				local var_27_61 = var_27_59 <= 0 and var_27_55 or var_27_55 * (var_27_60 / var_27_59)

				if var_27_61 > 0 and var_27_55 < var_27_61 then
					arg_24_1.talkMaxDuration = var_27_61
					var_27_54 = var_27_54 + 0.3

					if var_27_61 + var_27_54 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_61 + var_27_54
					end
				end

				arg_24_1.text_.text = var_27_58
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)
				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_62 = var_27_54 + 0.3
			local var_27_63 = math.max(var_27_55, arg_24_1.talkMaxDuration)

			if var_27_62 <= arg_24_1.time_ and arg_24_1.time_ < var_27_62 + var_27_63 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_62) / var_27_63

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_62 + var_27_63 and arg_24_1.time_ < var_27_62 + var_27_63 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play411151007 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 411151007
		arg_32_1.duration_ = 5.2

		local var_32_0 = {
			zh = 3.833,
			ja = 5.2
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
				arg_32_0:Play411151008(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = arg_32_1.actors_["1095ui_story"].transform
			local var_35_1 = 0

			if var_35_1 < arg_32_1.time_ and arg_32_1.time_ <= var_35_1 + arg_35_0 then
				arg_32_1.var_.moveOldPos1095ui_story = var_35_0.localPosition
			end

			local var_35_2 = 0.001

			if var_35_1 <= arg_32_1.time_ and arg_32_1.time_ < var_35_1 + var_35_2 then
				local var_35_3 = (arg_32_1.time_ - var_35_1) / var_35_2
				local var_35_4 = Vector3.New(0, -0.98, -6.1)

				var_35_0.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos1095ui_story, var_35_4, var_35_3)

				local var_35_5 = manager.ui.mainCamera.transform.position - var_35_0.position

				var_35_0.forward = Vector3.New(var_35_5.x, var_35_5.y, var_35_5.z)

				local var_35_6 = var_35_0.localEulerAngles

				var_35_6.z = 0
				var_35_6.x = 0
				var_35_0.localEulerAngles = var_35_6
			end

			if arg_32_1.time_ >= var_35_1 + var_35_2 and arg_32_1.time_ < var_35_1 + var_35_2 + arg_35_0 then
				var_35_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_35_7 = manager.ui.mainCamera.transform.position - var_35_0.position

				var_35_0.forward = Vector3.New(var_35_7.x, var_35_7.y, var_35_7.z)

				local var_35_8 = var_35_0.localEulerAngles

				var_35_8.z = 0
				var_35_8.x = 0
				var_35_0.localEulerAngles = var_35_8
			end

			local var_35_9 = arg_32_1.actors_["1095ui_story"]
			local var_35_10 = 0

			if var_35_10 < arg_32_1.time_ and arg_32_1.time_ <= var_35_10 + arg_35_0 and not isNil(var_35_9) and arg_32_1.var_.characterEffect1095ui_story == nil then
				arg_32_1.var_.characterEffect1095ui_story = var_35_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_11 = 0.200000002980232

			if var_35_10 <= arg_32_1.time_ and arg_32_1.time_ < var_35_10 + var_35_11 and not isNil(var_35_9) then
				local var_35_12 = (arg_32_1.time_ - var_35_10) / var_35_11

				if arg_32_1.var_.characterEffect1095ui_story and not isNil(var_35_9) then
					arg_32_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_32_1.time_ >= var_35_10 + var_35_11 and arg_32_1.time_ < var_35_10 + var_35_11 + arg_35_0 and not isNil(var_35_9) and arg_32_1.var_.characterEffect1095ui_story then
				arg_32_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_35_13 = 0

			if var_35_13 < arg_32_1.time_ and arg_32_1.time_ <= var_35_13 + arg_35_0 then
				arg_32_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_35_14 = 0

			if var_35_14 < arg_32_1.time_ and arg_32_1.time_ <= var_35_14 + arg_35_0 then
				arg_32_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_35_15 = 0
			local var_35_16 = 0.5

			if var_35_15 < arg_32_1.time_ and arg_32_1.time_ <= var_35_15 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_17 = arg_32_1:FormatText(StoryNameCfg[471].name)

				arg_32_1.leftNameTxt_.text = var_35_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_18 = arg_32_1:GetWordFromCfg(411151007)
				local var_35_19 = arg_32_1:FormatText(var_35_18.content)

				arg_32_1.text_.text = var_35_19

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_20 = 20
				local var_35_21 = utf8.len(var_35_19)
				local var_35_22 = var_35_20 <= 0 and var_35_16 or var_35_16 * (var_35_21 / var_35_20)

				if var_35_22 > 0 and var_35_16 < var_35_22 then
					arg_32_1.talkMaxDuration = var_35_22

					if var_35_22 + var_35_15 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_22 + var_35_15
					end
				end

				arg_32_1.text_.text = var_35_19
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151007", "story_v_out_411151.awb") ~= 0 then
					local var_35_23 = manager.audio:GetVoiceLength("story_v_out_411151", "411151007", "story_v_out_411151.awb") / 1000

					if var_35_23 + var_35_15 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_23 + var_35_15
					end

					if var_35_18.prefab_name ~= "" and arg_32_1.actors_[var_35_18.prefab_name] ~= nil then
						local var_35_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_32_1.actors_[var_35_18.prefab_name].transform, "story_v_out_411151", "411151007", "story_v_out_411151.awb")

						arg_32_1:RecordAudio("411151007", var_35_24)
						arg_32_1:RecordAudio("411151007", var_35_24)
					else
						arg_32_1:AudioAction("play", "voice", "story_v_out_411151", "411151007", "story_v_out_411151.awb")
					end

					arg_32_1:RecordHistoryTalkVoice("story_v_out_411151", "411151007", "story_v_out_411151.awb")
				end

				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_25 = math.max(var_35_16, arg_32_1.talkMaxDuration)

			if var_35_15 <= arg_32_1.time_ and arg_32_1.time_ < var_35_15 + var_35_25 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_15) / var_35_25

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_15 + var_35_25 and arg_32_1.time_ < var_35_15 + var_35_25 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play411151008 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 411151008
		arg_36_1.duration_ = 4.3

		local var_36_0 = {
			zh = 4.3,
			ja = 4.133
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
				arg_36_0:Play411151009(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = 0
			local var_39_1 = 0.625

			if var_39_0 < arg_36_1.time_ and arg_36_1.time_ <= var_39_0 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_2 = arg_36_1:FormatText(StoryNameCfg[471].name)

				arg_36_1.leftNameTxt_.text = var_39_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_3 = arg_36_1:GetWordFromCfg(411151008)
				local var_39_4 = arg_36_1:FormatText(var_39_3.content)

				arg_36_1.text_.text = var_39_4

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_5 = 25
				local var_39_6 = utf8.len(var_39_4)
				local var_39_7 = var_39_5 <= 0 and var_39_1 or var_39_1 * (var_39_6 / var_39_5)

				if var_39_7 > 0 and var_39_1 < var_39_7 then
					arg_36_1.talkMaxDuration = var_39_7

					if var_39_7 + var_39_0 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_7 + var_39_0
					end
				end

				arg_36_1.text_.text = var_39_4
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151008", "story_v_out_411151.awb") ~= 0 then
					local var_39_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151008", "story_v_out_411151.awb") / 1000

					if var_39_8 + var_39_0 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_8 + var_39_0
					end

					if var_39_3.prefab_name ~= "" and arg_36_1.actors_[var_39_3.prefab_name] ~= nil then
						local var_39_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_3.prefab_name].transform, "story_v_out_411151", "411151008", "story_v_out_411151.awb")

						arg_36_1:RecordAudio("411151008", var_39_9)
						arg_36_1:RecordAudio("411151008", var_39_9)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_411151", "411151008", "story_v_out_411151.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_411151", "411151008", "story_v_out_411151.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_10 = math.max(var_39_1, arg_36_1.talkMaxDuration)

			if var_39_0 <= arg_36_1.time_ and arg_36_1.time_ < var_39_0 + var_39_10 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_0) / var_39_10

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_0 + var_39_10 and arg_36_1.time_ < var_39_0 + var_39_10 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play411151009 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 411151009
		arg_40_1.duration_ = 5

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play411151010(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = arg_40_1.actors_["1095ui_story"]
			local var_43_1 = 0

			if var_43_1 < arg_40_1.time_ and arg_40_1.time_ <= var_43_1 + arg_43_0 and not isNil(var_43_0) and arg_40_1.var_.characterEffect1095ui_story == nil then
				arg_40_1.var_.characterEffect1095ui_story = var_43_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_43_2 = 0.200000002980232

			if var_43_1 <= arg_40_1.time_ and arg_40_1.time_ < var_43_1 + var_43_2 and not isNil(var_43_0) then
				local var_43_3 = (arg_40_1.time_ - var_43_1) / var_43_2

				if arg_40_1.var_.characterEffect1095ui_story and not isNil(var_43_0) then
					local var_43_4 = Mathf.Lerp(0, 0.5, var_43_3)

					arg_40_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_40_1.var_.characterEffect1095ui_story.fillRatio = var_43_4
				end
			end

			if arg_40_1.time_ >= var_43_1 + var_43_2 and arg_40_1.time_ < var_43_1 + var_43_2 + arg_43_0 and not isNil(var_43_0) and arg_40_1.var_.characterEffect1095ui_story then
				local var_43_5 = 0.5

				arg_40_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_40_1.var_.characterEffect1095ui_story.fillRatio = var_43_5
			end

			local var_43_6 = 0
			local var_43_7 = 1.35

			if var_43_6 < arg_40_1.time_ and arg_40_1.time_ <= var_43_6 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, false)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_40_1.iconTrs_.gameObject, false)
				arg_40_1.callingController_:SetSelectedState("normal")

				local var_43_8 = arg_40_1:GetWordFromCfg(411151009)
				local var_43_9 = arg_40_1:FormatText(var_43_8.content)

				arg_40_1.text_.text = var_43_9

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_10 = 54
				local var_43_11 = utf8.len(var_43_9)
				local var_43_12 = var_43_10 <= 0 and var_43_7 or var_43_7 * (var_43_11 / var_43_10)

				if var_43_12 > 0 and var_43_7 < var_43_12 then
					arg_40_1.talkMaxDuration = var_43_12

					if var_43_12 + var_43_6 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_12 + var_43_6
					end
				end

				arg_40_1.text_.text = var_43_9
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)
				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_13 = math.max(var_43_7, arg_40_1.talkMaxDuration)

			if var_43_6 <= arg_40_1.time_ and arg_40_1.time_ < var_43_6 + var_43_13 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_6) / var_43_13

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_6 + var_43_13 and arg_40_1.time_ < var_43_6 + var_43_13 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play411151010 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 411151010
		arg_44_1.duration_ = 6.6

		local var_44_0 = {
			zh = 4.866,
			ja = 6.6
		}
		local var_44_1 = manager.audio:GetLocalizationFlag()

		if var_44_0[var_44_1] ~= nil then
			arg_44_1.duration_ = var_44_0[var_44_1]
		end

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
		end

		function arg_44_1.playNext_(arg_46_0)
			if arg_46_0 == 1 then
				arg_44_0:Play411151011(arg_44_1)
			end
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = arg_44_1.actors_["1095ui_story"]
			local var_47_1 = 0

			if var_47_1 < arg_44_1.time_ and arg_44_1.time_ <= var_47_1 + arg_47_0 and not isNil(var_47_0) and arg_44_1.var_.characterEffect1095ui_story == nil then
				arg_44_1.var_.characterEffect1095ui_story = var_47_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_47_2 = 0.200000002980232

			if var_47_1 <= arg_44_1.time_ and arg_44_1.time_ < var_47_1 + var_47_2 and not isNil(var_47_0) then
				local var_47_3 = (arg_44_1.time_ - var_47_1) / var_47_2

				if arg_44_1.var_.characterEffect1095ui_story and not isNil(var_47_0) then
					arg_44_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_44_1.time_ >= var_47_1 + var_47_2 and arg_44_1.time_ < var_47_1 + var_47_2 + arg_47_0 and not isNil(var_47_0) and arg_44_1.var_.characterEffect1095ui_story then
				arg_44_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_47_4 = 0
			local var_47_5 = 0.5

			if var_47_4 < arg_44_1.time_ and arg_44_1.time_ <= var_47_4 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0
				arg_44_1.dialogCg_.alpha = 1

				arg_44_1.dialog_:SetActive(true)
				SetActive(arg_44_1.leftNameGo_, true)

				local var_47_6 = arg_44_1:FormatText(StoryNameCfg[471].name)

				arg_44_1.leftNameTxt_.text = var_47_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_44_1.leftNameTxt_.transform)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1.leftNameTxt_.text)
				SetActive(arg_44_1.iconTrs_.gameObject, false)
				arg_44_1.callingController_:SetSelectedState("normal")

				local var_47_7 = arg_44_1:GetWordFromCfg(411151010)
				local var_47_8 = arg_44_1:FormatText(var_47_7.content)

				arg_44_1.text_.text = var_47_8

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_9 = 20
				local var_47_10 = utf8.len(var_47_8)
				local var_47_11 = var_47_9 <= 0 and var_47_5 or var_47_5 * (var_47_10 / var_47_9)

				if var_47_11 > 0 and var_47_5 < var_47_11 then
					arg_44_1.talkMaxDuration = var_47_11

					if var_47_11 + var_47_4 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_11 + var_47_4
					end
				end

				arg_44_1.text_.text = var_47_8
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151010", "story_v_out_411151.awb") ~= 0 then
					local var_47_12 = manager.audio:GetVoiceLength("story_v_out_411151", "411151010", "story_v_out_411151.awb") / 1000

					if var_47_12 + var_47_4 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_12 + var_47_4
					end

					if var_47_7.prefab_name ~= "" and arg_44_1.actors_[var_47_7.prefab_name] ~= nil then
						local var_47_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_44_1.actors_[var_47_7.prefab_name].transform, "story_v_out_411151", "411151010", "story_v_out_411151.awb")

						arg_44_1:RecordAudio("411151010", var_47_13)
						arg_44_1:RecordAudio("411151010", var_47_13)
					else
						arg_44_1:AudioAction("play", "voice", "story_v_out_411151", "411151010", "story_v_out_411151.awb")
					end

					arg_44_1:RecordHistoryTalkVoice("story_v_out_411151", "411151010", "story_v_out_411151.awb")
				end

				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_14 = math.max(var_47_5, arg_44_1.talkMaxDuration)

			if var_47_4 <= arg_44_1.time_ and arg_44_1.time_ < var_47_4 + var_47_14 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_4) / var_47_14

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_4 + var_47_14 and arg_44_1.time_ < var_47_4 + var_47_14 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	Play411151011 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 411151011
		arg_48_1.duration_ = 5

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play411151012(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = arg_48_1.actors_["1095ui_story"]
			local var_51_1 = 0

			if var_51_1 < arg_48_1.time_ and arg_48_1.time_ <= var_51_1 + arg_51_0 and not isNil(var_51_0) and arg_48_1.var_.characterEffect1095ui_story == nil then
				arg_48_1.var_.characterEffect1095ui_story = var_51_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_2 = 0.200000002980232

			if var_51_1 <= arg_48_1.time_ and arg_48_1.time_ < var_51_1 + var_51_2 and not isNil(var_51_0) then
				local var_51_3 = (arg_48_1.time_ - var_51_1) / var_51_2

				if arg_48_1.var_.characterEffect1095ui_story and not isNil(var_51_0) then
					local var_51_4 = Mathf.Lerp(0, 0.5, var_51_3)

					arg_48_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_48_1.var_.characterEffect1095ui_story.fillRatio = var_51_4
				end
			end

			if arg_48_1.time_ >= var_51_1 + var_51_2 and arg_48_1.time_ < var_51_1 + var_51_2 + arg_51_0 and not isNil(var_51_0) and arg_48_1.var_.characterEffect1095ui_story then
				local var_51_5 = 0.5

				arg_48_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_48_1.var_.characterEffect1095ui_story.fillRatio = var_51_5
			end

			local var_51_6 = arg_48_1.actors_["1095ui_story"].transform
			local var_51_7 = 0

			if var_51_7 < arg_48_1.time_ and arg_48_1.time_ <= var_51_7 + arg_51_0 then
				arg_48_1.var_.moveOldPos1095ui_story = var_51_6.localPosition
			end

			local var_51_8 = 0.001

			if var_51_7 <= arg_48_1.time_ and arg_48_1.time_ < var_51_7 + var_51_8 then
				local var_51_9 = (arg_48_1.time_ - var_51_7) / var_51_8
				local var_51_10 = Vector3.New(0, 100, 0)

				var_51_6.localPosition = Vector3.Lerp(arg_48_1.var_.moveOldPos1095ui_story, var_51_10, var_51_9)

				local var_51_11 = manager.ui.mainCamera.transform.position - var_51_6.position

				var_51_6.forward = Vector3.New(var_51_11.x, var_51_11.y, var_51_11.z)

				local var_51_12 = var_51_6.localEulerAngles

				var_51_12.z = 0
				var_51_12.x = 0
				var_51_6.localEulerAngles = var_51_12
			end

			if arg_48_1.time_ >= var_51_7 + var_51_8 and arg_48_1.time_ < var_51_7 + var_51_8 + arg_51_0 then
				var_51_6.localPosition = Vector3.New(0, 100, 0)

				local var_51_13 = manager.ui.mainCamera.transform.position - var_51_6.position

				var_51_6.forward = Vector3.New(var_51_13.x, var_51_13.y, var_51_13.z)

				local var_51_14 = var_51_6.localEulerAngles

				var_51_14.z = 0
				var_51_14.x = 0
				var_51_6.localEulerAngles = var_51_14
			end

			local var_51_15 = 0
			local var_51_16 = 1.025

			if var_51_15 < arg_48_1.time_ and arg_48_1.time_ <= var_51_15 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0
				arg_48_1.dialogCg_.alpha = 1

				arg_48_1.dialog_:SetActive(true)
				SetActive(arg_48_1.leftNameGo_, false)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_48_1.iconTrs_.gameObject, false)
				arg_48_1.callingController_:SetSelectedState("normal")

				local var_51_17 = arg_48_1:GetWordFromCfg(411151011)
				local var_51_18 = arg_48_1:FormatText(var_51_17.content)

				arg_48_1.text_.text = var_51_18

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_19 = 41
				local var_51_20 = utf8.len(var_51_18)
				local var_51_21 = var_51_19 <= 0 and var_51_16 or var_51_16 * (var_51_20 / var_51_19)

				if var_51_21 > 0 and var_51_16 < var_51_21 then
					arg_48_1.talkMaxDuration = var_51_21

					if var_51_21 + var_51_15 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_21 + var_51_15
					end
				end

				arg_48_1.text_.text = var_51_18
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)
				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_22 = math.max(var_51_16, arg_48_1.talkMaxDuration)

			if var_51_15 <= arg_48_1.time_ and arg_48_1.time_ < var_51_15 + var_51_22 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_15) / var_51_22

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_15 + var_51_22 and arg_48_1.time_ < var_51_15 + var_51_22 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play411151012 = function(arg_52_0, arg_52_1)
		arg_52_1.time_ = 0
		arg_52_1.frameCnt_ = 0
		arg_52_1.state_ = "playing"
		arg_52_1.curTalkId_ = 411151012
		arg_52_1.duration_ = 5

		SetActive(arg_52_1.tipsGo_, false)

		function arg_52_1.onSingleLineFinish_()
			arg_52_1.onSingleLineUpdate_ = nil
			arg_52_1.onSingleLineFinish_ = nil
			arg_52_1.state_ = "waiting"
		end

		function arg_52_1.playNext_(arg_54_0)
			if arg_54_0 == 1 then
				arg_52_0:Play411151013(arg_52_1)
			end
		end

		function arg_52_1.onSingleLineUpdate_(arg_55_0)
			local var_55_0 = 0
			local var_55_1 = 0.825

			if var_55_0 < arg_52_1.time_ and arg_52_1.time_ <= var_55_0 + arg_55_0 then
				arg_52_1.talkMaxDuration = 0
				arg_52_1.dialogCg_.alpha = 1

				arg_52_1.dialog_:SetActive(true)
				SetActive(arg_52_1.leftNameGo_, false)

				arg_52_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_52_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_52_1:RecordName(arg_52_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_52_1.iconTrs_.gameObject, false)
				arg_52_1.callingController_:SetSelectedState("normal")

				local var_55_2 = arg_52_1:GetWordFromCfg(411151012)
				local var_55_3 = arg_52_1:FormatText(var_55_2.content)

				arg_52_1.text_.text = var_55_3

				LuaForUtil.ClearLinePrefixSymbol(arg_52_1.text_)

				local var_55_4 = 33
				local var_55_5 = utf8.len(var_55_3)
				local var_55_6 = var_55_4 <= 0 and var_55_1 or var_55_1 * (var_55_5 / var_55_4)

				if var_55_6 > 0 and var_55_1 < var_55_6 then
					arg_52_1.talkMaxDuration = var_55_6

					if var_55_6 + var_55_0 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_6 + var_55_0
					end
				end

				arg_52_1.text_.text = var_55_3
				arg_52_1.typewritter.percent = 0

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(false)
				arg_52_1:RecordContent(arg_52_1.text_.text)
			end

			local var_55_7 = math.max(var_55_1, arg_52_1.talkMaxDuration)

			if var_55_0 <= arg_52_1.time_ and arg_52_1.time_ < var_55_0 + var_55_7 then
				arg_52_1.typewritter.percent = (arg_52_1.time_ - var_55_0) / var_55_7

				arg_52_1.typewritter:SetDirty()
			end

			if arg_52_1.time_ >= var_55_0 + var_55_7 and arg_52_1.time_ < var_55_0 + var_55_7 + arg_55_0 then
				arg_52_1.typewritter.percent = 1

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(true)
			end
		end
	end,
	Play411151013 = function(arg_56_0, arg_56_1)
		arg_56_1.time_ = 0
		arg_56_1.frameCnt_ = 0
		arg_56_1.state_ = "playing"
		arg_56_1.curTalkId_ = 411151013
		arg_56_1.duration_ = 3.07

		local var_56_0 = {
			zh = 3.066,
			ja = 1.566
		}
		local var_56_1 = manager.audio:GetLocalizationFlag()

		if var_56_0[var_56_1] ~= nil then
			arg_56_1.duration_ = var_56_0[var_56_1]
		end

		SetActive(arg_56_1.tipsGo_, false)

		function arg_56_1.onSingleLineFinish_()
			arg_56_1.onSingleLineUpdate_ = nil
			arg_56_1.onSingleLineFinish_ = nil
			arg_56_1.state_ = "waiting"
		end

		function arg_56_1.playNext_(arg_58_0)
			if arg_58_0 == 1 then
				arg_56_0:Play411151014(arg_56_1)
			end
		end

		function arg_56_1.onSingleLineUpdate_(arg_59_0)
			local var_59_0 = arg_56_1.actors_["1095ui_story"]
			local var_59_1 = 0

			if var_59_1 < arg_56_1.time_ and arg_56_1.time_ <= var_59_1 + arg_59_0 and not isNil(var_59_0) and arg_56_1.var_.characterEffect1095ui_story == nil then
				arg_56_1.var_.characterEffect1095ui_story = var_59_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_59_2 = 0.200000002980232

			if var_59_1 <= arg_56_1.time_ and arg_56_1.time_ < var_59_1 + var_59_2 and not isNil(var_59_0) then
				local var_59_3 = (arg_56_1.time_ - var_59_1) / var_59_2

				if arg_56_1.var_.characterEffect1095ui_story and not isNil(var_59_0) then
					arg_56_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_56_1.time_ >= var_59_1 + var_59_2 and arg_56_1.time_ < var_59_1 + var_59_2 + arg_59_0 and not isNil(var_59_0) and arg_56_1.var_.characterEffect1095ui_story then
				arg_56_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_59_4 = arg_56_1.actors_["1095ui_story"].transform
			local var_59_5 = 0

			if var_59_5 < arg_56_1.time_ and arg_56_1.time_ <= var_59_5 + arg_59_0 then
				arg_56_1.var_.moveOldPos1095ui_story = var_59_4.localPosition
			end

			local var_59_6 = 0.001

			if var_59_5 <= arg_56_1.time_ and arg_56_1.time_ < var_59_5 + var_59_6 then
				local var_59_7 = (arg_56_1.time_ - var_59_5) / var_59_6
				local var_59_8 = Vector3.New(0, -0.98, -6.1)

				var_59_4.localPosition = Vector3.Lerp(arg_56_1.var_.moveOldPos1095ui_story, var_59_8, var_59_7)

				local var_59_9 = manager.ui.mainCamera.transform.position - var_59_4.position

				var_59_4.forward = Vector3.New(var_59_9.x, var_59_9.y, var_59_9.z)

				local var_59_10 = var_59_4.localEulerAngles

				var_59_10.z = 0
				var_59_10.x = 0
				var_59_4.localEulerAngles = var_59_10
			end

			if arg_56_1.time_ >= var_59_5 + var_59_6 and arg_56_1.time_ < var_59_5 + var_59_6 + arg_59_0 then
				var_59_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_59_11 = manager.ui.mainCamera.transform.position - var_59_4.position

				var_59_4.forward = Vector3.New(var_59_11.x, var_59_11.y, var_59_11.z)

				local var_59_12 = var_59_4.localEulerAngles

				var_59_12.z = 0
				var_59_12.x = 0
				var_59_4.localEulerAngles = var_59_12
			end

			local var_59_13 = 0
			local var_59_14 = 0.225

			if var_59_13 < arg_56_1.time_ and arg_56_1.time_ <= var_59_13 + arg_59_0 then
				arg_56_1.talkMaxDuration = 0
				arg_56_1.dialogCg_.alpha = 1

				arg_56_1.dialog_:SetActive(true)
				SetActive(arg_56_1.leftNameGo_, true)

				local var_59_15 = arg_56_1:FormatText(StoryNameCfg[471].name)

				arg_56_1.leftNameTxt_.text = var_59_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_56_1.leftNameTxt_.transform)

				arg_56_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_56_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_56_1:RecordName(arg_56_1.leftNameTxt_.text)
				SetActive(arg_56_1.iconTrs_.gameObject, false)
				arg_56_1.callingController_:SetSelectedState("normal")

				local var_59_16 = arg_56_1:GetWordFromCfg(411151013)
				local var_59_17 = arg_56_1:FormatText(var_59_16.content)

				arg_56_1.text_.text = var_59_17

				LuaForUtil.ClearLinePrefixSymbol(arg_56_1.text_)

				local var_59_18 = 9
				local var_59_19 = utf8.len(var_59_17)
				local var_59_20 = var_59_18 <= 0 and var_59_14 or var_59_14 * (var_59_19 / var_59_18)

				if var_59_20 > 0 and var_59_14 < var_59_20 then
					arg_56_1.talkMaxDuration = var_59_20

					if var_59_20 + var_59_13 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_20 + var_59_13
					end
				end

				arg_56_1.text_.text = var_59_17
				arg_56_1.typewritter.percent = 0

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151013", "story_v_out_411151.awb") ~= 0 then
					local var_59_21 = manager.audio:GetVoiceLength("story_v_out_411151", "411151013", "story_v_out_411151.awb") / 1000

					if var_59_21 + var_59_13 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_21 + var_59_13
					end

					if var_59_16.prefab_name ~= "" and arg_56_1.actors_[var_59_16.prefab_name] ~= nil then
						local var_59_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_56_1.actors_[var_59_16.prefab_name].transform, "story_v_out_411151", "411151013", "story_v_out_411151.awb")

						arg_56_1:RecordAudio("411151013", var_59_22)
						arg_56_1:RecordAudio("411151013", var_59_22)
					else
						arg_56_1:AudioAction("play", "voice", "story_v_out_411151", "411151013", "story_v_out_411151.awb")
					end

					arg_56_1:RecordHistoryTalkVoice("story_v_out_411151", "411151013", "story_v_out_411151.awb")
				end

				arg_56_1:RecordContent(arg_56_1.text_.text)
			end

			local var_59_23 = math.max(var_59_14, arg_56_1.talkMaxDuration)

			if var_59_13 <= arg_56_1.time_ and arg_56_1.time_ < var_59_13 + var_59_23 then
				arg_56_1.typewritter.percent = (arg_56_1.time_ - var_59_13) / var_59_23

				arg_56_1.typewritter:SetDirty()
			end

			if arg_56_1.time_ >= var_59_13 + var_59_23 and arg_56_1.time_ < var_59_13 + var_59_23 + arg_59_0 then
				arg_56_1.typewritter.percent = 1

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(true)
			end
		end
	end,
	Play411151014 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 411151014
		arg_60_1.duration_ = 5

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play411151015(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = arg_60_1.actors_["1095ui_story"].transform
			local var_63_1 = 0

			if var_63_1 < arg_60_1.time_ and arg_60_1.time_ <= var_63_1 + arg_63_0 then
				arg_60_1.var_.moveOldPos1095ui_story = var_63_0.localPosition
			end

			local var_63_2 = 0.001

			if var_63_1 <= arg_60_1.time_ and arg_60_1.time_ < var_63_1 + var_63_2 then
				local var_63_3 = (arg_60_1.time_ - var_63_1) / var_63_2
				local var_63_4 = Vector3.New(0, 100, 0)

				var_63_0.localPosition = Vector3.Lerp(arg_60_1.var_.moveOldPos1095ui_story, var_63_4, var_63_3)

				local var_63_5 = manager.ui.mainCamera.transform.position - var_63_0.position

				var_63_0.forward = Vector3.New(var_63_5.x, var_63_5.y, var_63_5.z)

				local var_63_6 = var_63_0.localEulerAngles

				var_63_6.z = 0
				var_63_6.x = 0
				var_63_0.localEulerAngles = var_63_6
			end

			if arg_60_1.time_ >= var_63_1 + var_63_2 and arg_60_1.time_ < var_63_1 + var_63_2 + arg_63_0 then
				var_63_0.localPosition = Vector3.New(0, 100, 0)

				local var_63_7 = manager.ui.mainCamera.transform.position - var_63_0.position

				var_63_0.forward = Vector3.New(var_63_7.x, var_63_7.y, var_63_7.z)

				local var_63_8 = var_63_0.localEulerAngles

				var_63_8.z = 0
				var_63_8.x = 0
				var_63_0.localEulerAngles = var_63_8
			end

			local var_63_9 = arg_60_1.actors_["1095ui_story"]
			local var_63_10 = 0

			if var_63_10 < arg_60_1.time_ and arg_60_1.time_ <= var_63_10 + arg_63_0 and not isNil(var_63_9) and arg_60_1.var_.characterEffect1095ui_story == nil then
				arg_60_1.var_.characterEffect1095ui_story = var_63_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_11 = 0.200000002980232

			if var_63_10 <= arg_60_1.time_ and arg_60_1.time_ < var_63_10 + var_63_11 and not isNil(var_63_9) then
				local var_63_12 = (arg_60_1.time_ - var_63_10) / var_63_11

				if arg_60_1.var_.characterEffect1095ui_story and not isNil(var_63_9) then
					local var_63_13 = Mathf.Lerp(0, 0.5, var_63_12)

					arg_60_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_60_1.var_.characterEffect1095ui_story.fillRatio = var_63_13
				end
			end

			if arg_60_1.time_ >= var_63_10 + var_63_11 and arg_60_1.time_ < var_63_10 + var_63_11 + arg_63_0 and not isNil(var_63_9) and arg_60_1.var_.characterEffect1095ui_story then
				local var_63_14 = 0.5

				arg_60_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_60_1.var_.characterEffect1095ui_story.fillRatio = var_63_14
			end

			local var_63_15 = 0
			local var_63_16 = 0.95

			if var_63_15 < arg_60_1.time_ and arg_60_1.time_ <= var_63_15 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, false)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_17 = arg_60_1:GetWordFromCfg(411151014)
				local var_63_18 = arg_60_1:FormatText(var_63_17.content)

				arg_60_1.text_.text = var_63_18

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_19 = 38
				local var_63_20 = utf8.len(var_63_18)
				local var_63_21 = var_63_19 <= 0 and var_63_16 or var_63_16 * (var_63_20 / var_63_19)

				if var_63_21 > 0 and var_63_16 < var_63_21 then
					arg_60_1.talkMaxDuration = var_63_21

					if var_63_21 + var_63_15 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_21 + var_63_15
					end
				end

				arg_60_1.text_.text = var_63_18
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)
				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_22 = math.max(var_63_16, arg_60_1.talkMaxDuration)

			if var_63_15 <= arg_60_1.time_ and arg_60_1.time_ < var_63_15 + var_63_22 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_15) / var_63_22

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_15 + var_63_22 and arg_60_1.time_ < var_63_15 + var_63_22 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play411151015 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 411151015
		arg_64_1.duration_ = 6.13

		local var_64_0 = {
			zh = 3.166,
			ja = 6.133
		}
		local var_64_1 = manager.audio:GetLocalizationFlag()

		if var_64_0[var_64_1] ~= nil then
			arg_64_1.duration_ = var_64_0[var_64_1]
		end

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
		end

		function arg_64_1.playNext_(arg_66_0)
			if arg_66_0 == 1 then
				arg_64_0:Play411151016(arg_64_1)
			end
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = 0
			local var_67_1 = 0.425

			if var_67_0 < arg_64_1.time_ and arg_64_1.time_ <= var_67_0 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, true)

				local var_67_2 = arg_64_1:FormatText(StoryNameCfg[263].name)

				arg_64_1.leftNameTxt_.text = var_67_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_64_1.leftNameTxt_.transform)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1.leftNameTxt_.text)
				SetActive(arg_64_1.iconTrs_.gameObject, true)
				arg_64_1.iconController_:SetSelectedState("hero")

				arg_64_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052_split_1")

				arg_64_1.callingController_:SetSelectedState("calling")

				arg_64_1.keyicon_.color = Color.New(1, 1, 1)
				arg_64_1.icon_.color = Color.New(1, 1, 1)

				local var_67_3 = arg_64_1:GetWordFromCfg(411151015)
				local var_67_4 = arg_64_1:FormatText(var_67_3.content)

				arg_64_1.text_.text = var_67_4

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_5 = 17
				local var_67_6 = utf8.len(var_67_4)
				local var_67_7 = var_67_5 <= 0 and var_67_1 or var_67_1 * (var_67_6 / var_67_5)

				if var_67_7 > 0 and var_67_1 < var_67_7 then
					arg_64_1.talkMaxDuration = var_67_7

					if var_67_7 + var_67_0 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_7 + var_67_0
					end
				end

				arg_64_1.text_.text = var_67_4
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151015", "story_v_out_411151.awb") ~= 0 then
					local var_67_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151015", "story_v_out_411151.awb") / 1000

					if var_67_8 + var_67_0 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_8 + var_67_0
					end

					if var_67_3.prefab_name ~= "" and arg_64_1.actors_[var_67_3.prefab_name] ~= nil then
						local var_67_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_64_1.actors_[var_67_3.prefab_name].transform, "story_v_out_411151", "411151015", "story_v_out_411151.awb")

						arg_64_1:RecordAudio("411151015", var_67_9)
						arg_64_1:RecordAudio("411151015", var_67_9)
					else
						arg_64_1:AudioAction("play", "voice", "story_v_out_411151", "411151015", "story_v_out_411151.awb")
					end

					arg_64_1:RecordHistoryTalkVoice("story_v_out_411151", "411151015", "story_v_out_411151.awb")
				end

				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_10 = math.max(var_67_1, arg_64_1.talkMaxDuration)

			if var_67_0 <= arg_64_1.time_ and arg_64_1.time_ < var_67_0 + var_67_10 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_0) / var_67_10

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_0 + var_67_10 and arg_64_1.time_ < var_67_0 + var_67_10 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	Play411151016 = function(arg_68_0, arg_68_1)
		arg_68_1.time_ = 0
		arg_68_1.frameCnt_ = 0
		arg_68_1.state_ = "playing"
		arg_68_1.curTalkId_ = 411151016
		arg_68_1.duration_ = 2

		SetActive(arg_68_1.tipsGo_, false)

		function arg_68_1.onSingleLineFinish_()
			arg_68_1.onSingleLineUpdate_ = nil
			arg_68_1.onSingleLineFinish_ = nil
			arg_68_1.state_ = "waiting"
		end

		function arg_68_1.playNext_(arg_70_0)
			if arg_70_0 == 1 then
				arg_68_0:Play411151017(arg_68_1)
			end
		end

		function arg_68_1.onSingleLineUpdate_(arg_71_0)
			local var_71_0 = "1052ui_story"

			if arg_68_1.actors_[var_71_0] == nil then
				local var_71_1 = Asset.Load("Char/" .. "1052ui_story")

				if not isNil(var_71_1) then
					local var_71_2 = Object.Instantiate(Asset.Load("Char/" .. "1052ui_story"), arg_68_1.stage_.transform)

					var_71_2.name = var_71_0
					var_71_2.transform.localPosition = Vector3.New(0, 100, 0)
					arg_68_1.actors_[var_71_0] = var_71_2

					local var_71_3 = var_71_2:GetComponentInChildren(typeof(CharacterEffect))

					var_71_3.enabled = true

					local var_71_4 = GameObjectTools.GetOrAddComponent(var_71_2, typeof(DynamicBoneHelper))

					if var_71_4 then
						var_71_4:EnableDynamicBone(false)
					end

					arg_68_1:ShowWeapon(var_71_3.transform, false)

					arg_68_1.var_[var_71_0 .. "Animator"] = var_71_3.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_68_1.var_[var_71_0 .. "Animator"].applyRootMotion = true
					arg_68_1.var_[var_71_0 .. "LipSync"] = var_71_3.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_71_5 = arg_68_1.actors_["1052ui_story"].transform
			local var_71_6 = 0

			if var_71_6 < arg_68_1.time_ and arg_68_1.time_ <= var_71_6 + arg_71_0 then
				arg_68_1.var_.moveOldPos1052ui_story = var_71_5.localPosition
			end

			local var_71_7 = 0.001

			if var_71_6 <= arg_68_1.time_ and arg_68_1.time_ < var_71_6 + var_71_7 then
				local var_71_8 = (arg_68_1.time_ - var_71_6) / var_71_7
				local var_71_9 = Vector3.New(-0.7, -1.05, -6.2)

				var_71_5.localPosition = Vector3.Lerp(arg_68_1.var_.moveOldPos1052ui_story, var_71_9, var_71_8)

				local var_71_10 = manager.ui.mainCamera.transform.position - var_71_5.position

				var_71_5.forward = Vector3.New(var_71_10.x, var_71_10.y, var_71_10.z)

				local var_71_11 = var_71_5.localEulerAngles

				var_71_11.z = 0
				var_71_11.x = 0
				var_71_5.localEulerAngles = var_71_11
			end

			if arg_68_1.time_ >= var_71_6 + var_71_7 and arg_68_1.time_ < var_71_6 + var_71_7 + arg_71_0 then
				var_71_5.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_71_12 = manager.ui.mainCamera.transform.position - var_71_5.position

				var_71_5.forward = Vector3.New(var_71_12.x, var_71_12.y, var_71_12.z)

				local var_71_13 = var_71_5.localEulerAngles

				var_71_13.z = 0
				var_71_13.x = 0
				var_71_5.localEulerAngles = var_71_13
			end

			local var_71_14 = arg_68_1.actors_["1052ui_story"]
			local var_71_15 = 0

			if var_71_15 < arg_68_1.time_ and arg_68_1.time_ <= var_71_15 + arg_71_0 and not isNil(var_71_14) and arg_68_1.var_.characterEffect1052ui_story == nil then
				arg_68_1.var_.characterEffect1052ui_story = var_71_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_71_16 = 0.200000002980232

			if var_71_15 <= arg_68_1.time_ and arg_68_1.time_ < var_71_15 + var_71_16 and not isNil(var_71_14) then
				local var_71_17 = (arg_68_1.time_ - var_71_15) / var_71_16

				if arg_68_1.var_.characterEffect1052ui_story and not isNil(var_71_14) then
					local var_71_18 = Mathf.Lerp(0, 0.5, var_71_17)

					arg_68_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_68_1.var_.characterEffect1052ui_story.fillRatio = var_71_18
				end
			end

			if arg_68_1.time_ >= var_71_15 + var_71_16 and arg_68_1.time_ < var_71_15 + var_71_16 + arg_71_0 and not isNil(var_71_14) and arg_68_1.var_.characterEffect1052ui_story then
				local var_71_19 = 0.5

				arg_68_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_68_1.var_.characterEffect1052ui_story.fillRatio = var_71_19
			end

			local var_71_20 = 0

			if var_71_20 < arg_68_1.time_ and arg_68_1.time_ <= var_71_20 + arg_71_0 then
				arg_68_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action1_1")
			end

			local var_71_21 = 0

			if var_71_21 < arg_68_1.time_ and arg_68_1.time_ <= var_71_21 + arg_71_0 then
				arg_68_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_71_22 = arg_68_1.actors_["1052ui_story"]
			local var_71_23 = 0

			if var_71_23 < arg_68_1.time_ and arg_68_1.time_ <= var_71_23 + arg_71_0 then
				if arg_68_1.var_.characterEffect1052ui_story == nil then
					arg_68_1.var_.characterEffect1052ui_story = var_71_22:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_71_24 = arg_68_1.var_.characterEffect1052ui_story

				var_71_24.imageEffect:turnOff()

				var_71_24.interferenceEffect.enabled = true
				var_71_24.interferenceEffect.noise = 0.01
				var_71_24.interferenceEffect.simTimeScale = 1
				var_71_24.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_71_25 = arg_68_1.actors_["1052ui_story"]
			local var_71_26 = 0
			local var_71_27 = 2

			if var_71_26 < arg_68_1.time_ and arg_68_1.time_ <= var_71_26 + arg_71_0 then
				if arg_68_1.var_.characterEffect1052ui_story == nil then
					arg_68_1.var_.characterEffect1052ui_story = var_71_25:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_68_1.var_.characterEffect1052ui_story.imageEffect:turnOn(false)
			end

			local var_71_28 = arg_68_1.actors_["1095ui_story"].transform
			local var_71_29 = 0

			if var_71_29 < arg_68_1.time_ and arg_68_1.time_ <= var_71_29 + arg_71_0 then
				arg_68_1.var_.moveOldPos1095ui_story = var_71_28.localPosition
			end

			local var_71_30 = 0.001

			if var_71_29 <= arg_68_1.time_ and arg_68_1.time_ < var_71_29 + var_71_30 then
				local var_71_31 = (arg_68_1.time_ - var_71_29) / var_71_30
				local var_71_32 = Vector3.New(0.7, -0.98, -6.1)

				var_71_28.localPosition = Vector3.Lerp(arg_68_1.var_.moveOldPos1095ui_story, var_71_32, var_71_31)

				local var_71_33 = manager.ui.mainCamera.transform.position - var_71_28.position

				var_71_28.forward = Vector3.New(var_71_33.x, var_71_33.y, var_71_33.z)

				local var_71_34 = var_71_28.localEulerAngles

				var_71_34.z = 0
				var_71_34.x = 0
				var_71_28.localEulerAngles = var_71_34
			end

			if arg_68_1.time_ >= var_71_29 + var_71_30 and arg_68_1.time_ < var_71_29 + var_71_30 + arg_71_0 then
				var_71_28.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_71_35 = manager.ui.mainCamera.transform.position - var_71_28.position

				var_71_28.forward = Vector3.New(var_71_35.x, var_71_35.y, var_71_35.z)

				local var_71_36 = var_71_28.localEulerAngles

				var_71_36.z = 0
				var_71_36.x = 0
				var_71_28.localEulerAngles = var_71_36
			end

			local var_71_37 = 0

			if var_71_37 < arg_68_1.time_ and arg_68_1.time_ <= var_71_37 + arg_71_0 then
				arg_68_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_71_38 = arg_68_1.actors_["1095ui_story"]
			local var_71_39 = 0

			if var_71_39 < arg_68_1.time_ and arg_68_1.time_ <= var_71_39 + arg_71_0 and not isNil(var_71_38) and arg_68_1.var_.characterEffect1095ui_story == nil then
				arg_68_1.var_.characterEffect1095ui_story = var_71_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_71_40 = 0.200000002980232

			if var_71_39 <= arg_68_1.time_ and arg_68_1.time_ < var_71_39 + var_71_40 and not isNil(var_71_38) then
				local var_71_41 = (arg_68_1.time_ - var_71_39) / var_71_40

				if arg_68_1.var_.characterEffect1095ui_story and not isNil(var_71_38) then
					arg_68_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_68_1.time_ >= var_71_39 + var_71_40 and arg_68_1.time_ < var_71_39 + var_71_40 + arg_71_0 and not isNil(var_71_38) and arg_68_1.var_.characterEffect1095ui_story then
				arg_68_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_71_42 = 0
			local var_71_43 = 0.075

			if var_71_42 < arg_68_1.time_ and arg_68_1.time_ <= var_71_42 + arg_71_0 then
				arg_68_1.talkMaxDuration = 0
				arg_68_1.dialogCg_.alpha = 1

				arg_68_1.dialog_:SetActive(true)
				SetActive(arg_68_1.leftNameGo_, true)

				local var_71_44 = arg_68_1:FormatText(StoryNameCfg[471].name)

				arg_68_1.leftNameTxt_.text = var_71_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_68_1.leftNameTxt_.transform)

				arg_68_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_68_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_68_1:RecordName(arg_68_1.leftNameTxt_.text)
				SetActive(arg_68_1.iconTrs_.gameObject, false)
				arg_68_1.callingController_:SetSelectedState("normal")

				local var_71_45 = arg_68_1:GetWordFromCfg(411151016)
				local var_71_46 = arg_68_1:FormatText(var_71_45.content)

				arg_68_1.text_.text = var_71_46

				LuaForUtil.ClearLinePrefixSymbol(arg_68_1.text_)

				local var_71_47 = 3
				local var_71_48 = utf8.len(var_71_46)
				local var_71_49 = var_71_47 <= 0 and var_71_43 or var_71_43 * (var_71_48 / var_71_47)

				if var_71_49 > 0 and var_71_43 < var_71_49 then
					arg_68_1.talkMaxDuration = var_71_49

					if var_71_49 + var_71_42 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_49 + var_71_42
					end
				end

				arg_68_1.text_.text = var_71_46
				arg_68_1.typewritter.percent = 0

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151016", "story_v_out_411151.awb") ~= 0 then
					local var_71_50 = manager.audio:GetVoiceLength("story_v_out_411151", "411151016", "story_v_out_411151.awb") / 1000

					if var_71_50 + var_71_42 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_50 + var_71_42
					end

					if var_71_45.prefab_name ~= "" and arg_68_1.actors_[var_71_45.prefab_name] ~= nil then
						local var_71_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_68_1.actors_[var_71_45.prefab_name].transform, "story_v_out_411151", "411151016", "story_v_out_411151.awb")

						arg_68_1:RecordAudio("411151016", var_71_51)
						arg_68_1:RecordAudio("411151016", var_71_51)
					else
						arg_68_1:AudioAction("play", "voice", "story_v_out_411151", "411151016", "story_v_out_411151.awb")
					end

					arg_68_1:RecordHistoryTalkVoice("story_v_out_411151", "411151016", "story_v_out_411151.awb")
				end

				arg_68_1:RecordContent(arg_68_1.text_.text)
			end

			local var_71_52 = math.max(var_71_43, arg_68_1.talkMaxDuration)

			if var_71_42 <= arg_68_1.time_ and arg_68_1.time_ < var_71_42 + var_71_52 then
				arg_68_1.typewritter.percent = (arg_68_1.time_ - var_71_42) / var_71_52

				arg_68_1.typewritter:SetDirty()
			end

			if arg_68_1.time_ >= var_71_42 + var_71_52 and arg_68_1.time_ < var_71_42 + var_71_52 + arg_71_0 then
				arg_68_1.typewritter.percent = 1

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(true)
			end
		end
	end,
	Play411151017 = function(arg_72_0, arg_72_1)
		arg_72_1.time_ = 0
		arg_72_1.frameCnt_ = 0
		arg_72_1.state_ = "playing"
		arg_72_1.curTalkId_ = 411151017
		arg_72_1.duration_ = 5.53

		local var_72_0 = {
			zh = 5.533,
			ja = 3.233
		}
		local var_72_1 = manager.audio:GetLocalizationFlag()

		if var_72_0[var_72_1] ~= nil then
			arg_72_1.duration_ = var_72_0[var_72_1]
		end

		SetActive(arg_72_1.tipsGo_, false)

		function arg_72_1.onSingleLineFinish_()
			arg_72_1.onSingleLineUpdate_ = nil
			arg_72_1.onSingleLineFinish_ = nil
			arg_72_1.state_ = "waiting"
		end

		function arg_72_1.playNext_(arg_74_0)
			if arg_74_0 == 1 then
				arg_72_0:Play411151018(arg_72_1)
			end
		end

		function arg_72_1.onSingleLineUpdate_(arg_75_0)
			local var_75_0 = arg_72_1.actors_["1052ui_story"].transform
			local var_75_1 = 0

			if var_75_1 < arg_72_1.time_ and arg_72_1.time_ <= var_75_1 + arg_75_0 then
				arg_72_1.var_.moveOldPos1052ui_story = var_75_0.localPosition

				local var_75_2 = "1052ui_story"

				arg_72_1:ShowWeapon(arg_72_1.var_[var_75_2 .. "Animator"].transform, false)
			end

			local var_75_3 = 0.001

			if var_75_1 <= arg_72_1.time_ and arg_72_1.time_ < var_75_1 + var_75_3 then
				local var_75_4 = (arg_72_1.time_ - var_75_1) / var_75_3
				local var_75_5 = Vector3.New(-0.7, -1.05, -6.2)

				var_75_0.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPos1052ui_story, var_75_5, var_75_4)

				local var_75_6 = manager.ui.mainCamera.transform.position - var_75_0.position

				var_75_0.forward = Vector3.New(var_75_6.x, var_75_6.y, var_75_6.z)

				local var_75_7 = var_75_0.localEulerAngles

				var_75_7.z = 0
				var_75_7.x = 0
				var_75_0.localEulerAngles = var_75_7
			end

			if arg_72_1.time_ >= var_75_1 + var_75_3 and arg_72_1.time_ < var_75_1 + var_75_3 + arg_75_0 then
				var_75_0.localPosition = Vector3.New(-0.7, -1.05, -6.2)

				local var_75_8 = manager.ui.mainCamera.transform.position - var_75_0.position

				var_75_0.forward = Vector3.New(var_75_8.x, var_75_8.y, var_75_8.z)

				local var_75_9 = var_75_0.localEulerAngles

				var_75_9.z = 0
				var_75_9.x = 0
				var_75_0.localEulerAngles = var_75_9
			end

			local var_75_10 = arg_72_1.actors_["1052ui_story"]
			local var_75_11 = 0

			if var_75_11 < arg_72_1.time_ and arg_72_1.time_ <= var_75_11 + arg_75_0 and not isNil(var_75_10) and arg_72_1.var_.characterEffect1052ui_story == nil then
				arg_72_1.var_.characterEffect1052ui_story = var_75_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_12 = 0.200000002980232

			if var_75_11 <= arg_72_1.time_ and arg_72_1.time_ < var_75_11 + var_75_12 and not isNil(var_75_10) then
				local var_75_13 = (arg_72_1.time_ - var_75_11) / var_75_12

				if arg_72_1.var_.characterEffect1052ui_story and not isNil(var_75_10) then
					arg_72_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_72_1.time_ >= var_75_11 + var_75_12 and arg_72_1.time_ < var_75_11 + var_75_12 + arg_75_0 and not isNil(var_75_10) and arg_72_1.var_.characterEffect1052ui_story then
				arg_72_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_75_14 = 0

			if var_75_14 < arg_72_1.time_ and arg_72_1.time_ <= var_75_14 + arg_75_0 then
				arg_72_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_1")
			end

			local var_75_15 = 0

			if var_75_15 < arg_72_1.time_ and arg_72_1.time_ <= var_75_15 + arg_75_0 then
				arg_72_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_75_16 = arg_72_1.actors_["1095ui_story"].transform
			local var_75_17 = 0

			if var_75_17 < arg_72_1.time_ and arg_72_1.time_ <= var_75_17 + arg_75_0 then
				arg_72_1.var_.moveOldPos1095ui_story = var_75_16.localPosition
			end

			local var_75_18 = 0.001

			if var_75_17 <= arg_72_1.time_ and arg_72_1.time_ < var_75_17 + var_75_18 then
				local var_75_19 = (arg_72_1.time_ - var_75_17) / var_75_18
				local var_75_20 = Vector3.New(0.7, -0.98, -6.1)

				var_75_16.localPosition = Vector3.Lerp(arg_72_1.var_.moveOldPos1095ui_story, var_75_20, var_75_19)

				local var_75_21 = manager.ui.mainCamera.transform.position - var_75_16.position

				var_75_16.forward = Vector3.New(var_75_21.x, var_75_21.y, var_75_21.z)

				local var_75_22 = var_75_16.localEulerAngles

				var_75_22.z = 0
				var_75_22.x = 0
				var_75_16.localEulerAngles = var_75_22
			end

			if arg_72_1.time_ >= var_75_17 + var_75_18 and arg_72_1.time_ < var_75_17 + var_75_18 + arg_75_0 then
				var_75_16.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_75_23 = manager.ui.mainCamera.transform.position - var_75_16.position

				var_75_16.forward = Vector3.New(var_75_23.x, var_75_23.y, var_75_23.z)

				local var_75_24 = var_75_16.localEulerAngles

				var_75_24.z = 0
				var_75_24.x = 0
				var_75_16.localEulerAngles = var_75_24
			end

			local var_75_25 = arg_72_1.actors_["1095ui_story"]
			local var_75_26 = 0

			if var_75_26 < arg_72_1.time_ and arg_72_1.time_ <= var_75_26 + arg_75_0 and not isNil(var_75_25) and arg_72_1.var_.characterEffect1095ui_story == nil then
				arg_72_1.var_.characterEffect1095ui_story = var_75_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_75_27 = 0.200000002980232

			if var_75_26 <= arg_72_1.time_ and arg_72_1.time_ < var_75_26 + var_75_27 and not isNil(var_75_25) then
				local var_75_28 = (arg_72_1.time_ - var_75_26) / var_75_27

				if arg_72_1.var_.characterEffect1095ui_story and not isNil(var_75_25) then
					local var_75_29 = Mathf.Lerp(0, 0.5, var_75_28)

					arg_72_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_72_1.var_.characterEffect1095ui_story.fillRatio = var_75_29
				end
			end

			if arg_72_1.time_ >= var_75_26 + var_75_27 and arg_72_1.time_ < var_75_26 + var_75_27 + arg_75_0 and not isNil(var_75_25) and arg_72_1.var_.characterEffect1095ui_story then
				local var_75_30 = 0.5

				arg_72_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_72_1.var_.characterEffect1095ui_story.fillRatio = var_75_30
			end

			local var_75_31 = 0
			local var_75_32 = 0.725

			if var_75_31 < arg_72_1.time_ and arg_72_1.time_ <= var_75_31 + arg_75_0 then
				arg_72_1.talkMaxDuration = 0
				arg_72_1.dialogCg_.alpha = 1

				arg_72_1.dialog_:SetActive(true)
				SetActive(arg_72_1.leftNameGo_, true)

				local var_75_33 = arg_72_1:FormatText(StoryNameCfg[263].name)

				arg_72_1.leftNameTxt_.text = var_75_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_72_1.leftNameTxt_.transform)

				arg_72_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_72_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_72_1:RecordName(arg_72_1.leftNameTxt_.text)
				SetActive(arg_72_1.iconTrs_.gameObject, false)
				arg_72_1.callingController_:SetSelectedState("normal")

				local var_75_34 = arg_72_1:GetWordFromCfg(411151017)
				local var_75_35 = arg_72_1:FormatText(var_75_34.content)

				arg_72_1.text_.text = var_75_35

				LuaForUtil.ClearLinePrefixSymbol(arg_72_1.text_)

				local var_75_36 = 29
				local var_75_37 = utf8.len(var_75_35)
				local var_75_38 = var_75_36 <= 0 and var_75_32 or var_75_32 * (var_75_37 / var_75_36)

				if var_75_38 > 0 and var_75_32 < var_75_38 then
					arg_72_1.talkMaxDuration = var_75_38

					if var_75_38 + var_75_31 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_38 + var_75_31
					end
				end

				arg_72_1.text_.text = var_75_35
				arg_72_1.typewritter.percent = 0

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151017", "story_v_out_411151.awb") ~= 0 then
					local var_75_39 = manager.audio:GetVoiceLength("story_v_out_411151", "411151017", "story_v_out_411151.awb") / 1000

					if var_75_39 + var_75_31 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_39 + var_75_31
					end

					if var_75_34.prefab_name ~= "" and arg_72_1.actors_[var_75_34.prefab_name] ~= nil then
						local var_75_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_72_1.actors_[var_75_34.prefab_name].transform, "story_v_out_411151", "411151017", "story_v_out_411151.awb")

						arg_72_1:RecordAudio("411151017", var_75_40)
						arg_72_1:RecordAudio("411151017", var_75_40)
					else
						arg_72_1:AudioAction("play", "voice", "story_v_out_411151", "411151017", "story_v_out_411151.awb")
					end

					arg_72_1:RecordHistoryTalkVoice("story_v_out_411151", "411151017", "story_v_out_411151.awb")
				end

				arg_72_1:RecordContent(arg_72_1.text_.text)
			end

			local var_75_41 = math.max(var_75_32, arg_72_1.talkMaxDuration)

			if var_75_31 <= arg_72_1.time_ and arg_72_1.time_ < var_75_31 + var_75_41 then
				arg_72_1.typewritter.percent = (arg_72_1.time_ - var_75_31) / var_75_41

				arg_72_1.typewritter:SetDirty()
			end

			if arg_72_1.time_ >= var_75_31 + var_75_41 and arg_72_1.time_ < var_75_31 + var_75_41 + arg_75_0 then
				arg_72_1.typewritter.percent = 1

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(true)
			end
		end
	end,
	Play411151018 = function(arg_76_0, arg_76_1)
		arg_76_1.time_ = 0
		arg_76_1.frameCnt_ = 0
		arg_76_1.state_ = "playing"
		arg_76_1.curTalkId_ = 411151018
		arg_76_1.duration_ = 2.87

		local var_76_0 = {
			zh = 2.4,
			ja = 2.866
		}
		local var_76_1 = manager.audio:GetLocalizationFlag()

		if var_76_0[var_76_1] ~= nil then
			arg_76_1.duration_ = var_76_0[var_76_1]
		end

		SetActive(arg_76_1.tipsGo_, false)

		function arg_76_1.onSingleLineFinish_()
			arg_76_1.onSingleLineUpdate_ = nil
			arg_76_1.onSingleLineFinish_ = nil
			arg_76_1.state_ = "waiting"
		end

		function arg_76_1.playNext_(arg_78_0)
			if arg_78_0 == 1 then
				arg_76_0:Play411151019(arg_76_1)
			end
		end

		function arg_76_1.onSingleLineUpdate_(arg_79_0)
			local var_79_0 = 0
			local var_79_1 = 0.2

			if var_79_0 < arg_76_1.time_ and arg_76_1.time_ <= var_79_0 + arg_79_0 then
				arg_76_1.talkMaxDuration = 0
				arg_76_1.dialogCg_.alpha = 1

				arg_76_1.dialog_:SetActive(true)
				SetActive(arg_76_1.leftNameGo_, true)

				local var_79_2 = arg_76_1:FormatText(StoryNameCfg[263].name)

				arg_76_1.leftNameTxt_.text = var_79_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_76_1.leftNameTxt_.transform)

				arg_76_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_76_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_76_1:RecordName(arg_76_1.leftNameTxt_.text)
				SetActive(arg_76_1.iconTrs_.gameObject, false)
				arg_76_1.callingController_:SetSelectedState("normal")

				local var_79_3 = arg_76_1:GetWordFromCfg(411151018)
				local var_79_4 = arg_76_1:FormatText(var_79_3.content)

				arg_76_1.text_.text = var_79_4

				LuaForUtil.ClearLinePrefixSymbol(arg_76_1.text_)

				local var_79_5 = 8
				local var_79_6 = utf8.len(var_79_4)
				local var_79_7 = var_79_5 <= 0 and var_79_1 or var_79_1 * (var_79_6 / var_79_5)

				if var_79_7 > 0 and var_79_1 < var_79_7 then
					arg_76_1.talkMaxDuration = var_79_7

					if var_79_7 + var_79_0 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_7 + var_79_0
					end
				end

				arg_76_1.text_.text = var_79_4
				arg_76_1.typewritter.percent = 0

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151018", "story_v_out_411151.awb") ~= 0 then
					local var_79_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151018", "story_v_out_411151.awb") / 1000

					if var_79_8 + var_79_0 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_8 + var_79_0
					end

					if var_79_3.prefab_name ~= "" and arg_76_1.actors_[var_79_3.prefab_name] ~= nil then
						local var_79_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_76_1.actors_[var_79_3.prefab_name].transform, "story_v_out_411151", "411151018", "story_v_out_411151.awb")

						arg_76_1:RecordAudio("411151018", var_79_9)
						arg_76_1:RecordAudio("411151018", var_79_9)
					else
						arg_76_1:AudioAction("play", "voice", "story_v_out_411151", "411151018", "story_v_out_411151.awb")
					end

					arg_76_1:RecordHistoryTalkVoice("story_v_out_411151", "411151018", "story_v_out_411151.awb")
				end

				arg_76_1:RecordContent(arg_76_1.text_.text)
			end

			local var_79_10 = math.max(var_79_1, arg_76_1.talkMaxDuration)

			if var_79_0 <= arg_76_1.time_ and arg_76_1.time_ < var_79_0 + var_79_10 then
				arg_76_1.typewritter.percent = (arg_76_1.time_ - var_79_0) / var_79_10

				arg_76_1.typewritter:SetDirty()
			end

			if arg_76_1.time_ >= var_79_0 + var_79_10 and arg_76_1.time_ < var_79_0 + var_79_10 + arg_79_0 then
				arg_76_1.typewritter.percent = 1

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(true)
			end
		end
	end,
	Play411151019 = function(arg_80_0, arg_80_1)
		arg_80_1.time_ = 0
		arg_80_1.frameCnt_ = 0
		arg_80_1.state_ = "playing"
		arg_80_1.curTalkId_ = 411151019
		arg_80_1.duration_ = 6.03

		local var_80_0 = {
			zh = 4.4,
			ja = 6.033
		}
		local var_80_1 = manager.audio:GetLocalizationFlag()

		if var_80_0[var_80_1] ~= nil then
			arg_80_1.duration_ = var_80_0[var_80_1]
		end

		SetActive(arg_80_1.tipsGo_, false)

		function arg_80_1.onSingleLineFinish_()
			arg_80_1.onSingleLineUpdate_ = nil
			arg_80_1.onSingleLineFinish_ = nil
			arg_80_1.state_ = "waiting"
		end

		function arg_80_1.playNext_(arg_82_0)
			if arg_82_0 == 1 then
				arg_80_0:Play411151020(arg_80_1)
			end
		end

		function arg_80_1.onSingleLineUpdate_(arg_83_0)
			local var_83_0 = arg_80_1.actors_["1052ui_story"]
			local var_83_1 = 0

			if var_83_1 < arg_80_1.time_ and arg_80_1.time_ <= var_83_1 + arg_83_0 and not isNil(var_83_0) and arg_80_1.var_.characterEffect1052ui_story == nil then
				arg_80_1.var_.characterEffect1052ui_story = var_83_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_83_2 = 0.200000002980232

			if var_83_1 <= arg_80_1.time_ and arg_80_1.time_ < var_83_1 + var_83_2 and not isNil(var_83_0) then
				local var_83_3 = (arg_80_1.time_ - var_83_1) / var_83_2

				if arg_80_1.var_.characterEffect1052ui_story and not isNil(var_83_0) then
					local var_83_4 = Mathf.Lerp(0, 0.5, var_83_3)

					arg_80_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_80_1.var_.characterEffect1052ui_story.fillRatio = var_83_4
				end
			end

			if arg_80_1.time_ >= var_83_1 + var_83_2 and arg_80_1.time_ < var_83_1 + var_83_2 + arg_83_0 and not isNil(var_83_0) and arg_80_1.var_.characterEffect1052ui_story then
				local var_83_5 = 0.5

				arg_80_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_80_1.var_.characterEffect1052ui_story.fillRatio = var_83_5
			end

			local var_83_6 = arg_80_1.actors_["1095ui_story"]
			local var_83_7 = 0

			if var_83_7 < arg_80_1.time_ and arg_80_1.time_ <= var_83_7 + arg_83_0 and not isNil(var_83_6) and arg_80_1.var_.characterEffect1095ui_story == nil then
				arg_80_1.var_.characterEffect1095ui_story = var_83_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_83_8 = 0.200000002980232

			if var_83_7 <= arg_80_1.time_ and arg_80_1.time_ < var_83_7 + var_83_8 and not isNil(var_83_6) then
				local var_83_9 = (arg_80_1.time_ - var_83_7) / var_83_8

				if arg_80_1.var_.characterEffect1095ui_story and not isNil(var_83_6) then
					arg_80_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_80_1.time_ >= var_83_7 + var_83_8 and arg_80_1.time_ < var_83_7 + var_83_8 + arg_83_0 and not isNil(var_83_6) and arg_80_1.var_.characterEffect1095ui_story then
				arg_80_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_83_10 = 0

			if var_83_10 < arg_80_1.time_ and arg_80_1.time_ <= var_83_10 + arg_83_0 then
				arg_80_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_83_11 = 0

			if var_83_11 < arg_80_1.time_ and arg_80_1.time_ <= var_83_11 + arg_83_0 then
				arg_80_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_83_12 = 0
			local var_83_13 = 0.6

			if var_83_12 < arg_80_1.time_ and arg_80_1.time_ <= var_83_12 + arg_83_0 then
				arg_80_1.talkMaxDuration = 0
				arg_80_1.dialogCg_.alpha = 1

				arg_80_1.dialog_:SetActive(true)
				SetActive(arg_80_1.leftNameGo_, true)

				local var_83_14 = arg_80_1:FormatText(StoryNameCfg[471].name)

				arg_80_1.leftNameTxt_.text = var_83_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_80_1.leftNameTxt_.transform)

				arg_80_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_80_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_80_1:RecordName(arg_80_1.leftNameTxt_.text)
				SetActive(arg_80_1.iconTrs_.gameObject, false)
				arg_80_1.callingController_:SetSelectedState("normal")

				local var_83_15 = arg_80_1:GetWordFromCfg(411151019)
				local var_83_16 = arg_80_1:FormatText(var_83_15.content)

				arg_80_1.text_.text = var_83_16

				LuaForUtil.ClearLinePrefixSymbol(arg_80_1.text_)

				local var_83_17 = 24
				local var_83_18 = utf8.len(var_83_16)
				local var_83_19 = var_83_17 <= 0 and var_83_13 or var_83_13 * (var_83_18 / var_83_17)

				if var_83_19 > 0 and var_83_13 < var_83_19 then
					arg_80_1.talkMaxDuration = var_83_19

					if var_83_19 + var_83_12 > arg_80_1.duration_ then
						arg_80_1.duration_ = var_83_19 + var_83_12
					end
				end

				arg_80_1.text_.text = var_83_16
				arg_80_1.typewritter.percent = 0

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151019", "story_v_out_411151.awb") ~= 0 then
					local var_83_20 = manager.audio:GetVoiceLength("story_v_out_411151", "411151019", "story_v_out_411151.awb") / 1000

					if var_83_20 + var_83_12 > arg_80_1.duration_ then
						arg_80_1.duration_ = var_83_20 + var_83_12
					end

					if var_83_15.prefab_name ~= "" and arg_80_1.actors_[var_83_15.prefab_name] ~= nil then
						local var_83_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_80_1.actors_[var_83_15.prefab_name].transform, "story_v_out_411151", "411151019", "story_v_out_411151.awb")

						arg_80_1:RecordAudio("411151019", var_83_21)
						arg_80_1:RecordAudio("411151019", var_83_21)
					else
						arg_80_1:AudioAction("play", "voice", "story_v_out_411151", "411151019", "story_v_out_411151.awb")
					end

					arg_80_1:RecordHistoryTalkVoice("story_v_out_411151", "411151019", "story_v_out_411151.awb")
				end

				arg_80_1:RecordContent(arg_80_1.text_.text)
			end

			local var_83_22 = math.max(var_83_13, arg_80_1.talkMaxDuration)

			if var_83_12 <= arg_80_1.time_ and arg_80_1.time_ < var_83_12 + var_83_22 then
				arg_80_1.typewritter.percent = (arg_80_1.time_ - var_83_12) / var_83_22

				arg_80_1.typewritter:SetDirty()
			end

			if arg_80_1.time_ >= var_83_12 + var_83_22 and arg_80_1.time_ < var_83_12 + var_83_22 + arg_83_0 then
				arg_80_1.typewritter.percent = 1

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(true)
			end
		end
	end,
	Play411151020 = function(arg_84_0, arg_84_1)
		arg_84_1.time_ = 0
		arg_84_1.frameCnt_ = 0
		arg_84_1.state_ = "playing"
		arg_84_1.curTalkId_ = 411151020
		arg_84_1.duration_ = 3.23

		local var_84_0 = {
			zh = 2.733,
			ja = 3.233
		}
		local var_84_1 = manager.audio:GetLocalizationFlag()

		if var_84_0[var_84_1] ~= nil then
			arg_84_1.duration_ = var_84_0[var_84_1]
		end

		SetActive(arg_84_1.tipsGo_, false)

		function arg_84_1.onSingleLineFinish_()
			arg_84_1.onSingleLineUpdate_ = nil
			arg_84_1.onSingleLineFinish_ = nil
			arg_84_1.state_ = "waiting"
		end

		function arg_84_1.playNext_(arg_86_0)
			if arg_86_0 == 1 then
				arg_84_0:Play411151021(arg_84_1)
			end
		end

		function arg_84_1.onSingleLineUpdate_(arg_87_0)
			local var_87_0 = arg_84_1.actors_["1052ui_story"]
			local var_87_1 = 0

			if var_87_1 < arg_84_1.time_ and arg_84_1.time_ <= var_87_1 + arg_87_0 and not isNil(var_87_0) and arg_84_1.var_.characterEffect1052ui_story == nil then
				arg_84_1.var_.characterEffect1052ui_story = var_87_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_87_2 = 0.200000002980232

			if var_87_1 <= arg_84_1.time_ and arg_84_1.time_ < var_87_1 + var_87_2 and not isNil(var_87_0) then
				local var_87_3 = (arg_84_1.time_ - var_87_1) / var_87_2

				if arg_84_1.var_.characterEffect1052ui_story and not isNil(var_87_0) then
					arg_84_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_84_1.time_ >= var_87_1 + var_87_2 and arg_84_1.time_ < var_87_1 + var_87_2 + arg_87_0 and not isNil(var_87_0) and arg_84_1.var_.characterEffect1052ui_story then
				arg_84_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_87_4 = arg_84_1.actors_["1095ui_story"]
			local var_87_5 = 0

			if var_87_5 < arg_84_1.time_ and arg_84_1.time_ <= var_87_5 + arg_87_0 and not isNil(var_87_4) and arg_84_1.var_.characterEffect1095ui_story == nil then
				arg_84_1.var_.characterEffect1095ui_story = var_87_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_87_6 = 0.200000002980232

			if var_87_5 <= arg_84_1.time_ and arg_84_1.time_ < var_87_5 + var_87_6 and not isNil(var_87_4) then
				local var_87_7 = (arg_84_1.time_ - var_87_5) / var_87_6

				if arg_84_1.var_.characterEffect1095ui_story and not isNil(var_87_4) then
					local var_87_8 = Mathf.Lerp(0, 0.5, var_87_7)

					arg_84_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_84_1.var_.characterEffect1095ui_story.fillRatio = var_87_8
				end
			end

			if arg_84_1.time_ >= var_87_5 + var_87_6 and arg_84_1.time_ < var_87_5 + var_87_6 + arg_87_0 and not isNil(var_87_4) and arg_84_1.var_.characterEffect1095ui_story then
				local var_87_9 = 0.5

				arg_84_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_84_1.var_.characterEffect1095ui_story.fillRatio = var_87_9
			end

			local var_87_10 = 0

			if var_87_10 < arg_84_1.time_ and arg_84_1.time_ <= var_87_10 + arg_87_0 then
				arg_84_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_2")
			end

			local var_87_11 = 0

			if var_87_11 < arg_84_1.time_ and arg_84_1.time_ <= var_87_11 + arg_87_0 then
				arg_84_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_87_12 = 0
			local var_87_13 = 0.3

			if var_87_12 < arg_84_1.time_ and arg_84_1.time_ <= var_87_12 + arg_87_0 then
				arg_84_1.talkMaxDuration = 0
				arg_84_1.dialogCg_.alpha = 1

				arg_84_1.dialog_:SetActive(true)
				SetActive(arg_84_1.leftNameGo_, true)

				local var_87_14 = arg_84_1:FormatText(StoryNameCfg[263].name)

				arg_84_1.leftNameTxt_.text = var_87_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_84_1.leftNameTxt_.transform)

				arg_84_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_84_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_84_1:RecordName(arg_84_1.leftNameTxt_.text)
				SetActive(arg_84_1.iconTrs_.gameObject, false)
				arg_84_1.callingController_:SetSelectedState("normal")

				local var_87_15 = arg_84_1:GetWordFromCfg(411151020)
				local var_87_16 = arg_84_1:FormatText(var_87_15.content)

				arg_84_1.text_.text = var_87_16

				LuaForUtil.ClearLinePrefixSymbol(arg_84_1.text_)

				local var_87_17 = 12
				local var_87_18 = utf8.len(var_87_16)
				local var_87_19 = var_87_17 <= 0 and var_87_13 or var_87_13 * (var_87_18 / var_87_17)

				if var_87_19 > 0 and var_87_13 < var_87_19 then
					arg_84_1.talkMaxDuration = var_87_19

					if var_87_19 + var_87_12 > arg_84_1.duration_ then
						arg_84_1.duration_ = var_87_19 + var_87_12
					end
				end

				arg_84_1.text_.text = var_87_16
				arg_84_1.typewritter.percent = 0

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151020", "story_v_out_411151.awb") ~= 0 then
					local var_87_20 = manager.audio:GetVoiceLength("story_v_out_411151", "411151020", "story_v_out_411151.awb") / 1000

					if var_87_20 + var_87_12 > arg_84_1.duration_ then
						arg_84_1.duration_ = var_87_20 + var_87_12
					end

					if var_87_15.prefab_name ~= "" and arg_84_1.actors_[var_87_15.prefab_name] ~= nil then
						local var_87_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_84_1.actors_[var_87_15.prefab_name].transform, "story_v_out_411151", "411151020", "story_v_out_411151.awb")

						arg_84_1:RecordAudio("411151020", var_87_21)
						arg_84_1:RecordAudio("411151020", var_87_21)
					else
						arg_84_1:AudioAction("play", "voice", "story_v_out_411151", "411151020", "story_v_out_411151.awb")
					end

					arg_84_1:RecordHistoryTalkVoice("story_v_out_411151", "411151020", "story_v_out_411151.awb")
				end

				arg_84_1:RecordContent(arg_84_1.text_.text)
			end

			local var_87_22 = math.max(var_87_13, arg_84_1.talkMaxDuration)

			if var_87_12 <= arg_84_1.time_ and arg_84_1.time_ < var_87_12 + var_87_22 then
				arg_84_1.typewritter.percent = (arg_84_1.time_ - var_87_12) / var_87_22

				arg_84_1.typewritter:SetDirty()
			end

			if arg_84_1.time_ >= var_87_12 + var_87_22 and arg_84_1.time_ < var_87_12 + var_87_22 + arg_87_0 then
				arg_84_1.typewritter.percent = 1

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(true)
			end
		end
	end,
	Play411151021 = function(arg_88_0, arg_88_1)
		arg_88_1.time_ = 0
		arg_88_1.frameCnt_ = 0
		arg_88_1.state_ = "playing"
		arg_88_1.curTalkId_ = 411151021
		arg_88_1.duration_ = 3.47

		local var_88_0 = {
			zh = 1.766,
			ja = 3.466
		}
		local var_88_1 = manager.audio:GetLocalizationFlag()

		if var_88_0[var_88_1] ~= nil then
			arg_88_1.duration_ = var_88_0[var_88_1]
		end

		SetActive(arg_88_1.tipsGo_, false)

		function arg_88_1.onSingleLineFinish_()
			arg_88_1.onSingleLineUpdate_ = nil
			arg_88_1.onSingleLineFinish_ = nil
			arg_88_1.state_ = "waiting"
		end

		function arg_88_1.playNext_(arg_90_0)
			if arg_90_0 == 1 then
				arg_88_0:Play411151022(arg_88_1)
			end
		end

		function arg_88_1.onSingleLineUpdate_(arg_91_0)
			local var_91_0 = arg_88_1.actors_["1052ui_story"]
			local var_91_1 = 0

			if var_91_1 < arg_88_1.time_ and arg_88_1.time_ <= var_91_1 + arg_91_0 and not isNil(var_91_0) and arg_88_1.var_.characterEffect1052ui_story == nil then
				arg_88_1.var_.characterEffect1052ui_story = var_91_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_91_2 = 0.200000002980232

			if var_91_1 <= arg_88_1.time_ and arg_88_1.time_ < var_91_1 + var_91_2 and not isNil(var_91_0) then
				local var_91_3 = (arg_88_1.time_ - var_91_1) / var_91_2

				if arg_88_1.var_.characterEffect1052ui_story and not isNil(var_91_0) then
					local var_91_4 = Mathf.Lerp(0, 0.5, var_91_3)

					arg_88_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_88_1.var_.characterEffect1052ui_story.fillRatio = var_91_4
				end
			end

			if arg_88_1.time_ >= var_91_1 + var_91_2 and arg_88_1.time_ < var_91_1 + var_91_2 + arg_91_0 and not isNil(var_91_0) and arg_88_1.var_.characterEffect1052ui_story then
				local var_91_5 = 0.5

				arg_88_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_88_1.var_.characterEffect1052ui_story.fillRatio = var_91_5
			end

			local var_91_6 = arg_88_1.actors_["1095ui_story"]
			local var_91_7 = 0

			if var_91_7 < arg_88_1.time_ and arg_88_1.time_ <= var_91_7 + arg_91_0 and not isNil(var_91_6) and arg_88_1.var_.characterEffect1095ui_story == nil then
				arg_88_1.var_.characterEffect1095ui_story = var_91_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_91_8 = 0.200000002980232

			if var_91_7 <= arg_88_1.time_ and arg_88_1.time_ < var_91_7 + var_91_8 and not isNil(var_91_6) then
				local var_91_9 = (arg_88_1.time_ - var_91_7) / var_91_8

				if arg_88_1.var_.characterEffect1095ui_story and not isNil(var_91_6) then
					arg_88_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_88_1.time_ >= var_91_7 + var_91_8 and arg_88_1.time_ < var_91_7 + var_91_8 + arg_91_0 and not isNil(var_91_6) and arg_88_1.var_.characterEffect1095ui_story then
				arg_88_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_91_10 = 0
			local var_91_11 = 0.2

			if var_91_10 < arg_88_1.time_ and arg_88_1.time_ <= var_91_10 + arg_91_0 then
				arg_88_1.talkMaxDuration = 0
				arg_88_1.dialogCg_.alpha = 1

				arg_88_1.dialog_:SetActive(true)
				SetActive(arg_88_1.leftNameGo_, true)

				local var_91_12 = arg_88_1:FormatText(StoryNameCfg[471].name)

				arg_88_1.leftNameTxt_.text = var_91_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_88_1.leftNameTxt_.transform)

				arg_88_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_88_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_88_1:RecordName(arg_88_1.leftNameTxt_.text)
				SetActive(arg_88_1.iconTrs_.gameObject, false)
				arg_88_1.callingController_:SetSelectedState("normal")

				local var_91_13 = arg_88_1:GetWordFromCfg(411151021)
				local var_91_14 = arg_88_1:FormatText(var_91_13.content)

				arg_88_1.text_.text = var_91_14

				LuaForUtil.ClearLinePrefixSymbol(arg_88_1.text_)

				local var_91_15 = 8
				local var_91_16 = utf8.len(var_91_14)
				local var_91_17 = var_91_15 <= 0 and var_91_11 or var_91_11 * (var_91_16 / var_91_15)

				if var_91_17 > 0 and var_91_11 < var_91_17 then
					arg_88_1.talkMaxDuration = var_91_17

					if var_91_17 + var_91_10 > arg_88_1.duration_ then
						arg_88_1.duration_ = var_91_17 + var_91_10
					end
				end

				arg_88_1.text_.text = var_91_14
				arg_88_1.typewritter.percent = 0

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151021", "story_v_out_411151.awb") ~= 0 then
					local var_91_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151021", "story_v_out_411151.awb") / 1000

					if var_91_18 + var_91_10 > arg_88_1.duration_ then
						arg_88_1.duration_ = var_91_18 + var_91_10
					end

					if var_91_13.prefab_name ~= "" and arg_88_1.actors_[var_91_13.prefab_name] ~= nil then
						local var_91_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_88_1.actors_[var_91_13.prefab_name].transform, "story_v_out_411151", "411151021", "story_v_out_411151.awb")

						arg_88_1:RecordAudio("411151021", var_91_19)
						arg_88_1:RecordAudio("411151021", var_91_19)
					else
						arg_88_1:AudioAction("play", "voice", "story_v_out_411151", "411151021", "story_v_out_411151.awb")
					end

					arg_88_1:RecordHistoryTalkVoice("story_v_out_411151", "411151021", "story_v_out_411151.awb")
				end

				arg_88_1:RecordContent(arg_88_1.text_.text)
			end

			local var_91_20 = math.max(var_91_11, arg_88_1.talkMaxDuration)

			if var_91_10 <= arg_88_1.time_ and arg_88_1.time_ < var_91_10 + var_91_20 then
				arg_88_1.typewritter.percent = (arg_88_1.time_ - var_91_10) / var_91_20

				arg_88_1.typewritter:SetDirty()
			end

			if arg_88_1.time_ >= var_91_10 + var_91_20 and arg_88_1.time_ < var_91_10 + var_91_20 + arg_91_0 then
				arg_88_1.typewritter.percent = 1

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(true)
			end
		end
	end,
	Play411151022 = function(arg_92_0, arg_92_1)
		arg_92_1.time_ = 0
		arg_92_1.frameCnt_ = 0
		arg_92_1.state_ = "playing"
		arg_92_1.curTalkId_ = 411151022
		arg_92_1.duration_ = 10.2

		local var_92_0 = {
			zh = 7.966,
			ja = 10.2
		}
		local var_92_1 = manager.audio:GetLocalizationFlag()

		if var_92_0[var_92_1] ~= nil then
			arg_92_1.duration_ = var_92_0[var_92_1]
		end

		SetActive(arg_92_1.tipsGo_, false)

		function arg_92_1.onSingleLineFinish_()
			arg_92_1.onSingleLineUpdate_ = nil
			arg_92_1.onSingleLineFinish_ = nil
			arg_92_1.state_ = "waiting"
		end

		function arg_92_1.playNext_(arg_94_0)
			if arg_94_0 == 1 then
				arg_92_0:Play411151023(arg_92_1)
			end
		end

		function arg_92_1.onSingleLineUpdate_(arg_95_0)
			local var_95_0 = 0

			if var_95_0 < arg_92_1.time_ and arg_92_1.time_ <= var_95_0 + arg_95_0 then
				arg_92_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_95_1 = 0

			if var_95_1 < arg_92_1.time_ and arg_92_1.time_ <= var_95_1 + arg_95_0 then
				arg_92_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_95_2 = 0
			local var_95_3 = 1.075

			if var_95_2 < arg_92_1.time_ and arg_92_1.time_ <= var_95_2 + arg_95_0 then
				arg_92_1.talkMaxDuration = 0
				arg_92_1.dialogCg_.alpha = 1

				arg_92_1.dialog_:SetActive(true)
				SetActive(arg_92_1.leftNameGo_, true)

				local var_95_4 = arg_92_1:FormatText(StoryNameCfg[471].name)

				arg_92_1.leftNameTxt_.text = var_95_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_92_1.leftNameTxt_.transform)

				arg_92_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_92_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_92_1:RecordName(arg_92_1.leftNameTxt_.text)
				SetActive(arg_92_1.iconTrs_.gameObject, false)
				arg_92_1.callingController_:SetSelectedState("normal")

				local var_95_5 = arg_92_1:GetWordFromCfg(411151022)
				local var_95_6 = arg_92_1:FormatText(var_95_5.content)

				arg_92_1.text_.text = var_95_6

				LuaForUtil.ClearLinePrefixSymbol(arg_92_1.text_)

				local var_95_7 = 43
				local var_95_8 = utf8.len(var_95_6)
				local var_95_9 = var_95_7 <= 0 and var_95_3 or var_95_3 * (var_95_8 / var_95_7)

				if var_95_9 > 0 and var_95_3 < var_95_9 then
					arg_92_1.talkMaxDuration = var_95_9

					if var_95_9 + var_95_2 > arg_92_1.duration_ then
						arg_92_1.duration_ = var_95_9 + var_95_2
					end
				end

				arg_92_1.text_.text = var_95_6
				arg_92_1.typewritter.percent = 0

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151022", "story_v_out_411151.awb") ~= 0 then
					local var_95_10 = manager.audio:GetVoiceLength("story_v_out_411151", "411151022", "story_v_out_411151.awb") / 1000

					if var_95_10 + var_95_2 > arg_92_1.duration_ then
						arg_92_1.duration_ = var_95_10 + var_95_2
					end

					if var_95_5.prefab_name ~= "" and arg_92_1.actors_[var_95_5.prefab_name] ~= nil then
						local var_95_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_92_1.actors_[var_95_5.prefab_name].transform, "story_v_out_411151", "411151022", "story_v_out_411151.awb")

						arg_92_1:RecordAudio("411151022", var_95_11)
						arg_92_1:RecordAudio("411151022", var_95_11)
					else
						arg_92_1:AudioAction("play", "voice", "story_v_out_411151", "411151022", "story_v_out_411151.awb")
					end

					arg_92_1:RecordHistoryTalkVoice("story_v_out_411151", "411151022", "story_v_out_411151.awb")
				end

				arg_92_1:RecordContent(arg_92_1.text_.text)
			end

			local var_95_12 = math.max(var_95_3, arg_92_1.talkMaxDuration)

			if var_95_2 <= arg_92_1.time_ and arg_92_1.time_ < var_95_2 + var_95_12 then
				arg_92_1.typewritter.percent = (arg_92_1.time_ - var_95_2) / var_95_12

				arg_92_1.typewritter:SetDirty()
			end

			if arg_92_1.time_ >= var_95_2 + var_95_12 and arg_92_1.time_ < var_95_2 + var_95_12 + arg_95_0 then
				arg_92_1.typewritter.percent = 1

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(true)
			end
		end
	end,
	Play411151023 = function(arg_96_0, arg_96_1)
		arg_96_1.time_ = 0
		arg_96_1.frameCnt_ = 0
		arg_96_1.state_ = "playing"
		arg_96_1.curTalkId_ = 411151023
		arg_96_1.duration_ = 12.4

		local var_96_0 = {
			zh = 7.433,
			ja = 12.4
		}
		local var_96_1 = manager.audio:GetLocalizationFlag()

		if var_96_0[var_96_1] ~= nil then
			arg_96_1.duration_ = var_96_0[var_96_1]
		end

		SetActive(arg_96_1.tipsGo_, false)

		function arg_96_1.onSingleLineFinish_()
			arg_96_1.onSingleLineUpdate_ = nil
			arg_96_1.onSingleLineFinish_ = nil
			arg_96_1.state_ = "waiting"
		end

		function arg_96_1.playNext_(arg_98_0)
			if arg_98_0 == 1 then
				arg_96_0:Play411151024(arg_96_1)
			end
		end

		function arg_96_1.onSingleLineUpdate_(arg_99_0)
			local var_99_0 = arg_96_1.actors_["1052ui_story"]
			local var_99_1 = 0

			if var_99_1 < arg_96_1.time_ and arg_96_1.time_ <= var_99_1 + arg_99_0 and not isNil(var_99_0) and arg_96_1.var_.characterEffect1052ui_story == nil then
				arg_96_1.var_.characterEffect1052ui_story = var_99_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_99_2 = 0.200000002980232

			if var_99_1 <= arg_96_1.time_ and arg_96_1.time_ < var_99_1 + var_99_2 and not isNil(var_99_0) then
				local var_99_3 = (arg_96_1.time_ - var_99_1) / var_99_2

				if arg_96_1.var_.characterEffect1052ui_story and not isNil(var_99_0) then
					arg_96_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_96_1.time_ >= var_99_1 + var_99_2 and arg_96_1.time_ < var_99_1 + var_99_2 + arg_99_0 and not isNil(var_99_0) and arg_96_1.var_.characterEffect1052ui_story then
				arg_96_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_99_4 = arg_96_1.actors_["1095ui_story"]
			local var_99_5 = 0

			if var_99_5 < arg_96_1.time_ and arg_96_1.time_ <= var_99_5 + arg_99_0 and not isNil(var_99_4) and arg_96_1.var_.characterEffect1095ui_story == nil then
				arg_96_1.var_.characterEffect1095ui_story = var_99_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_99_6 = 0.200000002980232

			if var_99_5 <= arg_96_1.time_ and arg_96_1.time_ < var_99_5 + var_99_6 and not isNil(var_99_4) then
				local var_99_7 = (arg_96_1.time_ - var_99_5) / var_99_6

				if arg_96_1.var_.characterEffect1095ui_story and not isNil(var_99_4) then
					local var_99_8 = Mathf.Lerp(0, 0.5, var_99_7)

					arg_96_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_96_1.var_.characterEffect1095ui_story.fillRatio = var_99_8
				end
			end

			if arg_96_1.time_ >= var_99_5 + var_99_6 and arg_96_1.time_ < var_99_5 + var_99_6 + arg_99_0 and not isNil(var_99_4) and arg_96_1.var_.characterEffect1095ui_story then
				local var_99_9 = 0.5

				arg_96_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_96_1.var_.characterEffect1095ui_story.fillRatio = var_99_9
			end

			local var_99_10 = 0
			local var_99_11 = 0.725

			if var_99_10 < arg_96_1.time_ and arg_96_1.time_ <= var_99_10 + arg_99_0 then
				arg_96_1.talkMaxDuration = 0
				arg_96_1.dialogCg_.alpha = 1

				arg_96_1.dialog_:SetActive(true)
				SetActive(arg_96_1.leftNameGo_, true)

				local var_99_12 = arg_96_1:FormatText(StoryNameCfg[263].name)

				arg_96_1.leftNameTxt_.text = var_99_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_96_1.leftNameTxt_.transform)

				arg_96_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_96_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_96_1:RecordName(arg_96_1.leftNameTxt_.text)
				SetActive(arg_96_1.iconTrs_.gameObject, false)
				arg_96_1.callingController_:SetSelectedState("normal")

				local var_99_13 = arg_96_1:GetWordFromCfg(411151023)
				local var_99_14 = arg_96_1:FormatText(var_99_13.content)

				arg_96_1.text_.text = var_99_14

				LuaForUtil.ClearLinePrefixSymbol(arg_96_1.text_)

				local var_99_15 = 29
				local var_99_16 = utf8.len(var_99_14)
				local var_99_17 = var_99_15 <= 0 and var_99_11 or var_99_11 * (var_99_16 / var_99_15)

				if var_99_17 > 0 and var_99_11 < var_99_17 then
					arg_96_1.talkMaxDuration = var_99_17

					if var_99_17 + var_99_10 > arg_96_1.duration_ then
						arg_96_1.duration_ = var_99_17 + var_99_10
					end
				end

				arg_96_1.text_.text = var_99_14
				arg_96_1.typewritter.percent = 0

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151023", "story_v_out_411151.awb") ~= 0 then
					local var_99_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151023", "story_v_out_411151.awb") / 1000

					if var_99_18 + var_99_10 > arg_96_1.duration_ then
						arg_96_1.duration_ = var_99_18 + var_99_10
					end

					if var_99_13.prefab_name ~= "" and arg_96_1.actors_[var_99_13.prefab_name] ~= nil then
						local var_99_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_96_1.actors_[var_99_13.prefab_name].transform, "story_v_out_411151", "411151023", "story_v_out_411151.awb")

						arg_96_1:RecordAudio("411151023", var_99_19)
						arg_96_1:RecordAudio("411151023", var_99_19)
					else
						arg_96_1:AudioAction("play", "voice", "story_v_out_411151", "411151023", "story_v_out_411151.awb")
					end

					arg_96_1:RecordHistoryTalkVoice("story_v_out_411151", "411151023", "story_v_out_411151.awb")
				end

				arg_96_1:RecordContent(arg_96_1.text_.text)
			end

			local var_99_20 = math.max(var_99_11, arg_96_1.talkMaxDuration)

			if var_99_10 <= arg_96_1.time_ and arg_96_1.time_ < var_99_10 + var_99_20 then
				arg_96_1.typewritter.percent = (arg_96_1.time_ - var_99_10) / var_99_20

				arg_96_1.typewritter:SetDirty()
			end

			if arg_96_1.time_ >= var_99_10 + var_99_20 and arg_96_1.time_ < var_99_10 + var_99_20 + arg_99_0 then
				arg_96_1.typewritter.percent = 1

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(true)
			end
		end
	end,
	Play411151024 = function(arg_100_0, arg_100_1)
		arg_100_1.time_ = 0
		arg_100_1.frameCnt_ = 0
		arg_100_1.state_ = "playing"
		arg_100_1.curTalkId_ = 411151024
		arg_100_1.duration_ = 7.37

		local var_100_0 = {
			zh = 4.6,
			ja = 7.366
		}
		local var_100_1 = manager.audio:GetLocalizationFlag()

		if var_100_0[var_100_1] ~= nil then
			arg_100_1.duration_ = var_100_0[var_100_1]
		end

		SetActive(arg_100_1.tipsGo_, false)

		function arg_100_1.onSingleLineFinish_()
			arg_100_1.onSingleLineUpdate_ = nil
			arg_100_1.onSingleLineFinish_ = nil
			arg_100_1.state_ = "waiting"
		end

		function arg_100_1.playNext_(arg_102_0)
			if arg_102_0 == 1 then
				arg_100_0:Play411151025(arg_100_1)
			end
		end

		function arg_100_1.onSingleLineUpdate_(arg_103_0)
			local var_103_0 = arg_100_1.actors_["1052ui_story"]
			local var_103_1 = 0

			if var_103_1 < arg_100_1.time_ and arg_100_1.time_ <= var_103_1 + arg_103_0 and not isNil(var_103_0) and arg_100_1.var_.characterEffect1052ui_story == nil then
				arg_100_1.var_.characterEffect1052ui_story = var_103_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_2 = 0.200000002980232

			if var_103_1 <= arg_100_1.time_ and arg_100_1.time_ < var_103_1 + var_103_2 and not isNil(var_103_0) then
				local var_103_3 = (arg_100_1.time_ - var_103_1) / var_103_2

				if arg_100_1.var_.characterEffect1052ui_story and not isNil(var_103_0) then
					local var_103_4 = Mathf.Lerp(0, 0.5, var_103_3)

					arg_100_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_100_1.var_.characterEffect1052ui_story.fillRatio = var_103_4
				end
			end

			if arg_100_1.time_ >= var_103_1 + var_103_2 and arg_100_1.time_ < var_103_1 + var_103_2 + arg_103_0 and not isNil(var_103_0) and arg_100_1.var_.characterEffect1052ui_story then
				local var_103_5 = 0.5

				arg_100_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_100_1.var_.characterEffect1052ui_story.fillRatio = var_103_5
			end

			local var_103_6 = arg_100_1.actors_["1095ui_story"]
			local var_103_7 = 0

			if var_103_7 < arg_100_1.time_ and arg_100_1.time_ <= var_103_7 + arg_103_0 and not isNil(var_103_6) and arg_100_1.var_.characterEffect1095ui_story == nil then
				arg_100_1.var_.characterEffect1095ui_story = var_103_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_8 = 0.200000002980232

			if var_103_7 <= arg_100_1.time_ and arg_100_1.time_ < var_103_7 + var_103_8 and not isNil(var_103_6) then
				local var_103_9 = (arg_100_1.time_ - var_103_7) / var_103_8

				if arg_100_1.var_.characterEffect1095ui_story and not isNil(var_103_6) then
					arg_100_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_100_1.time_ >= var_103_7 + var_103_8 and arg_100_1.time_ < var_103_7 + var_103_8 + arg_103_0 and not isNil(var_103_6) and arg_100_1.var_.characterEffect1095ui_story then
				arg_100_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_103_10 = 0
			local var_103_11 = 0.55

			if var_103_10 < arg_100_1.time_ and arg_100_1.time_ <= var_103_10 + arg_103_0 then
				arg_100_1.talkMaxDuration = 0
				arg_100_1.dialogCg_.alpha = 1

				arg_100_1.dialog_:SetActive(true)
				SetActive(arg_100_1.leftNameGo_, true)

				local var_103_12 = arg_100_1:FormatText(StoryNameCfg[471].name)

				arg_100_1.leftNameTxt_.text = var_103_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_100_1.leftNameTxt_.transform)

				arg_100_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_100_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_100_1:RecordName(arg_100_1.leftNameTxt_.text)
				SetActive(arg_100_1.iconTrs_.gameObject, false)
				arg_100_1.callingController_:SetSelectedState("normal")

				local var_103_13 = arg_100_1:GetWordFromCfg(411151024)
				local var_103_14 = arg_100_1:FormatText(var_103_13.content)

				arg_100_1.text_.text = var_103_14

				LuaForUtil.ClearLinePrefixSymbol(arg_100_1.text_)

				local var_103_15 = 22
				local var_103_16 = utf8.len(var_103_14)
				local var_103_17 = var_103_15 <= 0 and var_103_11 or var_103_11 * (var_103_16 / var_103_15)

				if var_103_17 > 0 and var_103_11 < var_103_17 then
					arg_100_1.talkMaxDuration = var_103_17

					if var_103_17 + var_103_10 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_17 + var_103_10
					end
				end

				arg_100_1.text_.text = var_103_14
				arg_100_1.typewritter.percent = 0

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151024", "story_v_out_411151.awb") ~= 0 then
					local var_103_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151024", "story_v_out_411151.awb") / 1000

					if var_103_18 + var_103_10 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_18 + var_103_10
					end

					if var_103_13.prefab_name ~= "" and arg_100_1.actors_[var_103_13.prefab_name] ~= nil then
						local var_103_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_100_1.actors_[var_103_13.prefab_name].transform, "story_v_out_411151", "411151024", "story_v_out_411151.awb")

						arg_100_1:RecordAudio("411151024", var_103_19)
						arg_100_1:RecordAudio("411151024", var_103_19)
					else
						arg_100_1:AudioAction("play", "voice", "story_v_out_411151", "411151024", "story_v_out_411151.awb")
					end

					arg_100_1:RecordHistoryTalkVoice("story_v_out_411151", "411151024", "story_v_out_411151.awb")
				end

				arg_100_1:RecordContent(arg_100_1.text_.text)
			end

			local var_103_20 = math.max(var_103_11, arg_100_1.talkMaxDuration)

			if var_103_10 <= arg_100_1.time_ and arg_100_1.time_ < var_103_10 + var_103_20 then
				arg_100_1.typewritter.percent = (arg_100_1.time_ - var_103_10) / var_103_20

				arg_100_1.typewritter:SetDirty()
			end

			if arg_100_1.time_ >= var_103_10 + var_103_20 and arg_100_1.time_ < var_103_10 + var_103_20 + arg_103_0 then
				arg_100_1.typewritter.percent = 1

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(true)
			end
		end
	end,
	Play411151025 = function(arg_104_0, arg_104_1)
		arg_104_1.time_ = 0
		arg_104_1.frameCnt_ = 0
		arg_104_1.state_ = "playing"
		arg_104_1.curTalkId_ = 411151025
		arg_104_1.duration_ = 3.83

		local var_104_0 = {
			zh = 2.366,
			ja = 3.833
		}
		local var_104_1 = manager.audio:GetLocalizationFlag()

		if var_104_0[var_104_1] ~= nil then
			arg_104_1.duration_ = var_104_0[var_104_1]
		end

		SetActive(arg_104_1.tipsGo_, false)

		function arg_104_1.onSingleLineFinish_()
			arg_104_1.onSingleLineUpdate_ = nil
			arg_104_1.onSingleLineFinish_ = nil
			arg_104_1.state_ = "waiting"
		end

		function arg_104_1.playNext_(arg_106_0)
			if arg_106_0 == 1 then
				arg_104_0:Play411151026(arg_104_1)
			end
		end

		function arg_104_1.onSingleLineUpdate_(arg_107_0)
			local var_107_0 = arg_104_1.actors_["1052ui_story"]
			local var_107_1 = 0

			if var_107_1 < arg_104_1.time_ and arg_104_1.time_ <= var_107_1 + arg_107_0 and not isNil(var_107_0) and arg_104_1.var_.characterEffect1052ui_story == nil then
				arg_104_1.var_.characterEffect1052ui_story = var_107_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_107_2 = 0.200000002980232

			if var_107_1 <= arg_104_1.time_ and arg_104_1.time_ < var_107_1 + var_107_2 and not isNil(var_107_0) then
				local var_107_3 = (arg_104_1.time_ - var_107_1) / var_107_2

				if arg_104_1.var_.characterEffect1052ui_story and not isNil(var_107_0) then
					arg_104_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_104_1.time_ >= var_107_1 + var_107_2 and arg_104_1.time_ < var_107_1 + var_107_2 + arg_107_0 and not isNil(var_107_0) and arg_104_1.var_.characterEffect1052ui_story then
				arg_104_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_107_4 = arg_104_1.actors_["1095ui_story"]
			local var_107_5 = 0

			if var_107_5 < arg_104_1.time_ and arg_104_1.time_ <= var_107_5 + arg_107_0 and not isNil(var_107_4) and arg_104_1.var_.characterEffect1095ui_story == nil then
				arg_104_1.var_.characterEffect1095ui_story = var_107_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_107_6 = 0.200000002980232

			if var_107_5 <= arg_104_1.time_ and arg_104_1.time_ < var_107_5 + var_107_6 and not isNil(var_107_4) then
				local var_107_7 = (arg_104_1.time_ - var_107_5) / var_107_6

				if arg_104_1.var_.characterEffect1095ui_story and not isNil(var_107_4) then
					local var_107_8 = Mathf.Lerp(0, 0.5, var_107_7)

					arg_104_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_104_1.var_.characterEffect1095ui_story.fillRatio = var_107_8
				end
			end

			if arg_104_1.time_ >= var_107_5 + var_107_6 and arg_104_1.time_ < var_107_5 + var_107_6 + arg_107_0 and not isNil(var_107_4) and arg_104_1.var_.characterEffect1095ui_story then
				local var_107_9 = 0.5

				arg_104_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_104_1.var_.characterEffect1095ui_story.fillRatio = var_107_9
			end

			local var_107_10 = 0

			if var_107_10 < arg_104_1.time_ and arg_104_1.time_ <= var_107_10 + arg_107_0 then
				arg_104_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_107_11 = 0
			local var_107_12 = 0.225

			if var_107_11 < arg_104_1.time_ and arg_104_1.time_ <= var_107_11 + arg_107_0 then
				arg_104_1.talkMaxDuration = 0
				arg_104_1.dialogCg_.alpha = 1

				arg_104_1.dialog_:SetActive(true)
				SetActive(arg_104_1.leftNameGo_, true)

				local var_107_13 = arg_104_1:FormatText(StoryNameCfg[263].name)

				arg_104_1.leftNameTxt_.text = var_107_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_104_1.leftNameTxt_.transform)

				arg_104_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_104_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_104_1:RecordName(arg_104_1.leftNameTxt_.text)
				SetActive(arg_104_1.iconTrs_.gameObject, false)
				arg_104_1.callingController_:SetSelectedState("normal")

				local var_107_14 = arg_104_1:GetWordFromCfg(411151025)
				local var_107_15 = arg_104_1:FormatText(var_107_14.content)

				arg_104_1.text_.text = var_107_15

				LuaForUtil.ClearLinePrefixSymbol(arg_104_1.text_)

				local var_107_16 = 9
				local var_107_17 = utf8.len(var_107_15)
				local var_107_18 = var_107_16 <= 0 and var_107_12 or var_107_12 * (var_107_17 / var_107_16)

				if var_107_18 > 0 and var_107_12 < var_107_18 then
					arg_104_1.talkMaxDuration = var_107_18

					if var_107_18 + var_107_11 > arg_104_1.duration_ then
						arg_104_1.duration_ = var_107_18 + var_107_11
					end
				end

				arg_104_1.text_.text = var_107_15
				arg_104_1.typewritter.percent = 0

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151025", "story_v_out_411151.awb") ~= 0 then
					local var_107_19 = manager.audio:GetVoiceLength("story_v_out_411151", "411151025", "story_v_out_411151.awb") / 1000

					if var_107_19 + var_107_11 > arg_104_1.duration_ then
						arg_104_1.duration_ = var_107_19 + var_107_11
					end

					if var_107_14.prefab_name ~= "" and arg_104_1.actors_[var_107_14.prefab_name] ~= nil then
						local var_107_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_104_1.actors_[var_107_14.prefab_name].transform, "story_v_out_411151", "411151025", "story_v_out_411151.awb")

						arg_104_1:RecordAudio("411151025", var_107_20)
						arg_104_1:RecordAudio("411151025", var_107_20)
					else
						arg_104_1:AudioAction("play", "voice", "story_v_out_411151", "411151025", "story_v_out_411151.awb")
					end

					arg_104_1:RecordHistoryTalkVoice("story_v_out_411151", "411151025", "story_v_out_411151.awb")
				end

				arg_104_1:RecordContent(arg_104_1.text_.text)
			end

			local var_107_21 = math.max(var_107_12, arg_104_1.talkMaxDuration)

			if var_107_11 <= arg_104_1.time_ and arg_104_1.time_ < var_107_11 + var_107_21 then
				arg_104_1.typewritter.percent = (arg_104_1.time_ - var_107_11) / var_107_21

				arg_104_1.typewritter:SetDirty()
			end

			if arg_104_1.time_ >= var_107_11 + var_107_21 and arg_104_1.time_ < var_107_11 + var_107_21 + arg_107_0 then
				arg_104_1.typewritter.percent = 1

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(true)
			end
		end
	end,
	Play411151026 = function(arg_108_0, arg_108_1)
		arg_108_1.time_ = 0
		arg_108_1.frameCnt_ = 0
		arg_108_1.state_ = "playing"
		arg_108_1.curTalkId_ = 411151026
		arg_108_1.duration_ = 3.1

		local var_108_0 = {
			zh = 1.766,
			ja = 3.1
		}
		local var_108_1 = manager.audio:GetLocalizationFlag()

		if var_108_0[var_108_1] ~= nil then
			arg_108_1.duration_ = var_108_0[var_108_1]
		end

		SetActive(arg_108_1.tipsGo_, false)

		function arg_108_1.onSingleLineFinish_()
			arg_108_1.onSingleLineUpdate_ = nil
			arg_108_1.onSingleLineFinish_ = nil
			arg_108_1.state_ = "waiting"
		end

		function arg_108_1.playNext_(arg_110_0)
			if arg_110_0 == 1 then
				arg_108_0:Play411151027(arg_108_1)
			end
		end

		function arg_108_1.onSingleLineUpdate_(arg_111_0)
			local var_111_0 = arg_108_1.actors_["1052ui_story"]
			local var_111_1 = 0

			if var_111_1 < arg_108_1.time_ and arg_108_1.time_ <= var_111_1 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.characterEffect1052ui_story == nil then
				arg_108_1.var_.characterEffect1052ui_story = var_111_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_111_2 = 0.200000002980232

			if var_111_1 <= arg_108_1.time_ and arg_108_1.time_ < var_111_1 + var_111_2 and not isNil(var_111_0) then
				local var_111_3 = (arg_108_1.time_ - var_111_1) / var_111_2

				if arg_108_1.var_.characterEffect1052ui_story and not isNil(var_111_0) then
					local var_111_4 = Mathf.Lerp(0, 0.5, var_111_3)

					arg_108_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_108_1.var_.characterEffect1052ui_story.fillRatio = var_111_4
				end
			end

			if arg_108_1.time_ >= var_111_1 + var_111_2 and arg_108_1.time_ < var_111_1 + var_111_2 + arg_111_0 and not isNil(var_111_0) and arg_108_1.var_.characterEffect1052ui_story then
				local var_111_5 = 0.5

				arg_108_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_108_1.var_.characterEffect1052ui_story.fillRatio = var_111_5
			end

			local var_111_6 = arg_108_1.actors_["1095ui_story"]
			local var_111_7 = 0

			if var_111_7 < arg_108_1.time_ and arg_108_1.time_ <= var_111_7 + arg_111_0 and not isNil(var_111_6) and arg_108_1.var_.characterEffect1095ui_story == nil then
				arg_108_1.var_.characterEffect1095ui_story = var_111_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_111_8 = 0.200000002980232

			if var_111_7 <= arg_108_1.time_ and arg_108_1.time_ < var_111_7 + var_111_8 and not isNil(var_111_6) then
				local var_111_9 = (arg_108_1.time_ - var_111_7) / var_111_8

				if arg_108_1.var_.characterEffect1095ui_story and not isNil(var_111_6) then
					arg_108_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_108_1.time_ >= var_111_7 + var_111_8 and arg_108_1.time_ < var_111_7 + var_111_8 + arg_111_0 and not isNil(var_111_6) and arg_108_1.var_.characterEffect1095ui_story then
				arg_108_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_111_10 = 0
			local var_111_11 = 0.225

			if var_111_10 < arg_108_1.time_ and arg_108_1.time_ <= var_111_10 + arg_111_0 then
				arg_108_1.talkMaxDuration = 0
				arg_108_1.dialogCg_.alpha = 1

				arg_108_1.dialog_:SetActive(true)
				SetActive(arg_108_1.leftNameGo_, true)

				local var_111_12 = arg_108_1:FormatText(StoryNameCfg[471].name)

				arg_108_1.leftNameTxt_.text = var_111_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_108_1.leftNameTxt_.transform)

				arg_108_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_108_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_108_1:RecordName(arg_108_1.leftNameTxt_.text)
				SetActive(arg_108_1.iconTrs_.gameObject, false)
				arg_108_1.callingController_:SetSelectedState("normal")

				local var_111_13 = arg_108_1:GetWordFromCfg(411151026)
				local var_111_14 = arg_108_1:FormatText(var_111_13.content)

				arg_108_1.text_.text = var_111_14

				LuaForUtil.ClearLinePrefixSymbol(arg_108_1.text_)

				local var_111_15 = 9
				local var_111_16 = utf8.len(var_111_14)
				local var_111_17 = var_111_15 <= 0 and var_111_11 or var_111_11 * (var_111_16 / var_111_15)

				if var_111_17 > 0 and var_111_11 < var_111_17 then
					arg_108_1.talkMaxDuration = var_111_17

					if var_111_17 + var_111_10 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_17 + var_111_10
					end
				end

				arg_108_1.text_.text = var_111_14
				arg_108_1.typewritter.percent = 0

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151026", "story_v_out_411151.awb") ~= 0 then
					local var_111_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151026", "story_v_out_411151.awb") / 1000

					if var_111_18 + var_111_10 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_18 + var_111_10
					end

					if var_111_13.prefab_name ~= "" and arg_108_1.actors_[var_111_13.prefab_name] ~= nil then
						local var_111_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_108_1.actors_[var_111_13.prefab_name].transform, "story_v_out_411151", "411151026", "story_v_out_411151.awb")

						arg_108_1:RecordAudio("411151026", var_111_19)
						arg_108_1:RecordAudio("411151026", var_111_19)
					else
						arg_108_1:AudioAction("play", "voice", "story_v_out_411151", "411151026", "story_v_out_411151.awb")
					end

					arg_108_1:RecordHistoryTalkVoice("story_v_out_411151", "411151026", "story_v_out_411151.awb")
				end

				arg_108_1:RecordContent(arg_108_1.text_.text)
			end

			local var_111_20 = math.max(var_111_11, arg_108_1.talkMaxDuration)

			if var_111_10 <= arg_108_1.time_ and arg_108_1.time_ < var_111_10 + var_111_20 then
				arg_108_1.typewritter.percent = (arg_108_1.time_ - var_111_10) / var_111_20

				arg_108_1.typewritter:SetDirty()
			end

			if arg_108_1.time_ >= var_111_10 + var_111_20 and arg_108_1.time_ < var_111_10 + var_111_20 + arg_111_0 then
				arg_108_1.typewritter.percent = 1

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(true)
			end
		end
	end,
	Play411151027 = function(arg_112_0, arg_112_1)
		arg_112_1.time_ = 0
		arg_112_1.frameCnt_ = 0
		arg_112_1.state_ = "playing"
		arg_112_1.curTalkId_ = 411151027
		arg_112_1.duration_ = 7

		local var_112_0 = {
			zh = 3.766,
			ja = 7
		}
		local var_112_1 = manager.audio:GetLocalizationFlag()

		if var_112_0[var_112_1] ~= nil then
			arg_112_1.duration_ = var_112_0[var_112_1]
		end

		SetActive(arg_112_1.tipsGo_, false)

		function arg_112_1.onSingleLineFinish_()
			arg_112_1.onSingleLineUpdate_ = nil
			arg_112_1.onSingleLineFinish_ = nil
			arg_112_1.state_ = "waiting"
		end

		function arg_112_1.playNext_(arg_114_0)
			if arg_114_0 == 1 then
				arg_112_0:Play411151028(arg_112_1)
			end
		end

		function arg_112_1.onSingleLineUpdate_(arg_115_0)
			local var_115_0 = arg_112_1.actors_["1052ui_story"]
			local var_115_1 = 0

			if var_115_1 < arg_112_1.time_ and arg_112_1.time_ <= var_115_1 + arg_115_0 and not isNil(var_115_0) and arg_112_1.var_.characterEffect1052ui_story == nil then
				arg_112_1.var_.characterEffect1052ui_story = var_115_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_115_2 = 0.200000002980232

			if var_115_1 <= arg_112_1.time_ and arg_112_1.time_ < var_115_1 + var_115_2 and not isNil(var_115_0) then
				local var_115_3 = (arg_112_1.time_ - var_115_1) / var_115_2

				if arg_112_1.var_.characterEffect1052ui_story and not isNil(var_115_0) then
					arg_112_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_112_1.time_ >= var_115_1 + var_115_2 and arg_112_1.time_ < var_115_1 + var_115_2 + arg_115_0 and not isNil(var_115_0) and arg_112_1.var_.characterEffect1052ui_story then
				arg_112_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_115_4 = arg_112_1.actors_["1095ui_story"]
			local var_115_5 = 0

			if var_115_5 < arg_112_1.time_ and arg_112_1.time_ <= var_115_5 + arg_115_0 and not isNil(var_115_4) and arg_112_1.var_.characterEffect1095ui_story == nil then
				arg_112_1.var_.characterEffect1095ui_story = var_115_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_115_6 = 0.200000002980232

			if var_115_5 <= arg_112_1.time_ and arg_112_1.time_ < var_115_5 + var_115_6 and not isNil(var_115_4) then
				local var_115_7 = (arg_112_1.time_ - var_115_5) / var_115_6

				if arg_112_1.var_.characterEffect1095ui_story and not isNil(var_115_4) then
					local var_115_8 = Mathf.Lerp(0, 0.5, var_115_7)

					arg_112_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_112_1.var_.characterEffect1095ui_story.fillRatio = var_115_8
				end
			end

			if arg_112_1.time_ >= var_115_5 + var_115_6 and arg_112_1.time_ < var_115_5 + var_115_6 + arg_115_0 and not isNil(var_115_4) and arg_112_1.var_.characterEffect1095ui_story then
				local var_115_9 = 0.5

				arg_112_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_112_1.var_.characterEffect1095ui_story.fillRatio = var_115_9
			end

			local var_115_10 = 0

			if var_115_10 < arg_112_1.time_ and arg_112_1.time_ <= var_115_10 + arg_115_0 then
				arg_112_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_115_11 = 0
			local var_115_12 = 0.45

			if var_115_11 < arg_112_1.time_ and arg_112_1.time_ <= var_115_11 + arg_115_0 then
				arg_112_1.talkMaxDuration = 0
				arg_112_1.dialogCg_.alpha = 1

				arg_112_1.dialog_:SetActive(true)
				SetActive(arg_112_1.leftNameGo_, true)

				local var_115_13 = arg_112_1:FormatText(StoryNameCfg[263].name)

				arg_112_1.leftNameTxt_.text = var_115_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_112_1.leftNameTxt_.transform)

				arg_112_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_112_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_112_1:RecordName(arg_112_1.leftNameTxt_.text)
				SetActive(arg_112_1.iconTrs_.gameObject, false)
				arg_112_1.callingController_:SetSelectedState("normal")

				local var_115_14 = arg_112_1:GetWordFromCfg(411151027)
				local var_115_15 = arg_112_1:FormatText(var_115_14.content)

				arg_112_1.text_.text = var_115_15

				LuaForUtil.ClearLinePrefixSymbol(arg_112_1.text_)

				local var_115_16 = 18
				local var_115_17 = utf8.len(var_115_15)
				local var_115_18 = var_115_16 <= 0 and var_115_12 or var_115_12 * (var_115_17 / var_115_16)

				if var_115_18 > 0 and var_115_12 < var_115_18 then
					arg_112_1.talkMaxDuration = var_115_18

					if var_115_18 + var_115_11 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_18 + var_115_11
					end
				end

				arg_112_1.text_.text = var_115_15
				arg_112_1.typewritter.percent = 0

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151027", "story_v_out_411151.awb") ~= 0 then
					local var_115_19 = manager.audio:GetVoiceLength("story_v_out_411151", "411151027", "story_v_out_411151.awb") / 1000

					if var_115_19 + var_115_11 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_19 + var_115_11
					end

					if var_115_14.prefab_name ~= "" and arg_112_1.actors_[var_115_14.prefab_name] ~= nil then
						local var_115_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_112_1.actors_[var_115_14.prefab_name].transform, "story_v_out_411151", "411151027", "story_v_out_411151.awb")

						arg_112_1:RecordAudio("411151027", var_115_20)
						arg_112_1:RecordAudio("411151027", var_115_20)
					else
						arg_112_1:AudioAction("play", "voice", "story_v_out_411151", "411151027", "story_v_out_411151.awb")
					end

					arg_112_1:RecordHistoryTalkVoice("story_v_out_411151", "411151027", "story_v_out_411151.awb")
				end

				arg_112_1:RecordContent(arg_112_1.text_.text)
			end

			local var_115_21 = math.max(var_115_12, arg_112_1.talkMaxDuration)

			if var_115_11 <= arg_112_1.time_ and arg_112_1.time_ < var_115_11 + var_115_21 then
				arg_112_1.typewritter.percent = (arg_112_1.time_ - var_115_11) / var_115_21

				arg_112_1.typewritter:SetDirty()
			end

			if arg_112_1.time_ >= var_115_11 + var_115_21 and arg_112_1.time_ < var_115_11 + var_115_21 + arg_115_0 then
				arg_112_1.typewritter.percent = 1

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(true)
			end
		end
	end,
	Play411151028 = function(arg_116_0, arg_116_1)
		arg_116_1.time_ = 0
		arg_116_1.frameCnt_ = 0
		arg_116_1.state_ = "playing"
		arg_116_1.curTalkId_ = 411151028
		arg_116_1.duration_ = 3.73

		local var_116_0 = {
			zh = 2.233,
			ja = 3.733
		}
		local var_116_1 = manager.audio:GetLocalizationFlag()

		if var_116_0[var_116_1] ~= nil then
			arg_116_1.duration_ = var_116_0[var_116_1]
		end

		SetActive(arg_116_1.tipsGo_, false)

		function arg_116_1.onSingleLineFinish_()
			arg_116_1.onSingleLineUpdate_ = nil
			arg_116_1.onSingleLineFinish_ = nil
			arg_116_1.state_ = "waiting"
		end

		function arg_116_1.playNext_(arg_118_0)
			if arg_118_0 == 1 then
				arg_116_0:Play411151029(arg_116_1)
			end
		end

		function arg_116_1.onSingleLineUpdate_(arg_119_0)
			local var_119_0 = arg_116_1.actors_["1052ui_story"]
			local var_119_1 = 0

			if var_119_1 < arg_116_1.time_ and arg_116_1.time_ <= var_119_1 + arg_119_0 and not isNil(var_119_0) and arg_116_1.var_.characterEffect1052ui_story == nil then
				arg_116_1.var_.characterEffect1052ui_story = var_119_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_119_2 = 0.200000002980232

			if var_119_1 <= arg_116_1.time_ and arg_116_1.time_ < var_119_1 + var_119_2 and not isNil(var_119_0) then
				local var_119_3 = (arg_116_1.time_ - var_119_1) / var_119_2

				if arg_116_1.var_.characterEffect1052ui_story and not isNil(var_119_0) then
					local var_119_4 = Mathf.Lerp(0, 0.5, var_119_3)

					arg_116_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_116_1.var_.characterEffect1052ui_story.fillRatio = var_119_4
				end
			end

			if arg_116_1.time_ >= var_119_1 + var_119_2 and arg_116_1.time_ < var_119_1 + var_119_2 + arg_119_0 and not isNil(var_119_0) and arg_116_1.var_.characterEffect1052ui_story then
				local var_119_5 = 0.5

				arg_116_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_116_1.var_.characterEffect1052ui_story.fillRatio = var_119_5
			end

			local var_119_6 = arg_116_1.actors_["1095ui_story"]
			local var_119_7 = 0

			if var_119_7 < arg_116_1.time_ and arg_116_1.time_ <= var_119_7 + arg_119_0 and not isNil(var_119_6) and arg_116_1.var_.characterEffect1095ui_story == nil then
				arg_116_1.var_.characterEffect1095ui_story = var_119_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_119_8 = 0.200000002980232

			if var_119_7 <= arg_116_1.time_ and arg_116_1.time_ < var_119_7 + var_119_8 and not isNil(var_119_6) then
				local var_119_9 = (arg_116_1.time_ - var_119_7) / var_119_8

				if arg_116_1.var_.characterEffect1095ui_story and not isNil(var_119_6) then
					arg_116_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_116_1.time_ >= var_119_7 + var_119_8 and arg_116_1.time_ < var_119_7 + var_119_8 + arg_119_0 and not isNil(var_119_6) and arg_116_1.var_.characterEffect1095ui_story then
				arg_116_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_119_10 = 0
			local var_119_11 = 0.225

			if var_119_10 < arg_116_1.time_ and arg_116_1.time_ <= var_119_10 + arg_119_0 then
				arg_116_1.talkMaxDuration = 0
				arg_116_1.dialogCg_.alpha = 1

				arg_116_1.dialog_:SetActive(true)
				SetActive(arg_116_1.leftNameGo_, true)

				local var_119_12 = arg_116_1:FormatText(StoryNameCfg[471].name)

				arg_116_1.leftNameTxt_.text = var_119_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_116_1.leftNameTxt_.transform)

				arg_116_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_116_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_116_1:RecordName(arg_116_1.leftNameTxt_.text)
				SetActive(arg_116_1.iconTrs_.gameObject, false)
				arg_116_1.callingController_:SetSelectedState("normal")

				local var_119_13 = arg_116_1:GetWordFromCfg(411151028)
				local var_119_14 = arg_116_1:FormatText(var_119_13.content)

				arg_116_1.text_.text = var_119_14

				LuaForUtil.ClearLinePrefixSymbol(arg_116_1.text_)

				local var_119_15 = 9
				local var_119_16 = utf8.len(var_119_14)
				local var_119_17 = var_119_15 <= 0 and var_119_11 or var_119_11 * (var_119_16 / var_119_15)

				if var_119_17 > 0 and var_119_11 < var_119_17 then
					arg_116_1.talkMaxDuration = var_119_17

					if var_119_17 + var_119_10 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_17 + var_119_10
					end
				end

				arg_116_1.text_.text = var_119_14
				arg_116_1.typewritter.percent = 0

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151028", "story_v_out_411151.awb") ~= 0 then
					local var_119_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151028", "story_v_out_411151.awb") / 1000

					if var_119_18 + var_119_10 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_18 + var_119_10
					end

					if var_119_13.prefab_name ~= "" and arg_116_1.actors_[var_119_13.prefab_name] ~= nil then
						local var_119_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_116_1.actors_[var_119_13.prefab_name].transform, "story_v_out_411151", "411151028", "story_v_out_411151.awb")

						arg_116_1:RecordAudio("411151028", var_119_19)
						arg_116_1:RecordAudio("411151028", var_119_19)
					else
						arg_116_1:AudioAction("play", "voice", "story_v_out_411151", "411151028", "story_v_out_411151.awb")
					end

					arg_116_1:RecordHistoryTalkVoice("story_v_out_411151", "411151028", "story_v_out_411151.awb")
				end

				arg_116_1:RecordContent(arg_116_1.text_.text)
			end

			local var_119_20 = math.max(var_119_11, arg_116_1.talkMaxDuration)

			if var_119_10 <= arg_116_1.time_ and arg_116_1.time_ < var_119_10 + var_119_20 then
				arg_116_1.typewritter.percent = (arg_116_1.time_ - var_119_10) / var_119_20

				arg_116_1.typewritter:SetDirty()
			end

			if arg_116_1.time_ >= var_119_10 + var_119_20 and arg_116_1.time_ < var_119_10 + var_119_20 + arg_119_0 then
				arg_116_1.typewritter.percent = 1

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(true)
			end
		end
	end,
	Play411151029 = function(arg_120_0, arg_120_1)
		arg_120_1.time_ = 0
		arg_120_1.frameCnt_ = 0
		arg_120_1.state_ = "playing"
		arg_120_1.curTalkId_ = 411151029
		arg_120_1.duration_ = 6.6

		local var_120_0 = {
			zh = 5.8,
			ja = 6.6
		}
		local var_120_1 = manager.audio:GetLocalizationFlag()

		if var_120_0[var_120_1] ~= nil then
			arg_120_1.duration_ = var_120_0[var_120_1]
		end

		SetActive(arg_120_1.tipsGo_, false)

		function arg_120_1.onSingleLineFinish_()
			arg_120_1.onSingleLineUpdate_ = nil
			arg_120_1.onSingleLineFinish_ = nil
			arg_120_1.state_ = "waiting"
		end

		function arg_120_1.playNext_(arg_122_0)
			if arg_122_0 == 1 then
				arg_120_0:Play411151030(arg_120_1)
			end
		end

		function arg_120_1.onSingleLineUpdate_(arg_123_0)
			local var_123_0 = arg_120_1.actors_["1052ui_story"]
			local var_123_1 = 0

			if var_123_1 < arg_120_1.time_ and arg_120_1.time_ <= var_123_1 + arg_123_0 and not isNil(var_123_0) and arg_120_1.var_.characterEffect1052ui_story == nil then
				arg_120_1.var_.characterEffect1052ui_story = var_123_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_123_2 = 0.200000002980232

			if var_123_1 <= arg_120_1.time_ and arg_120_1.time_ < var_123_1 + var_123_2 and not isNil(var_123_0) then
				local var_123_3 = (arg_120_1.time_ - var_123_1) / var_123_2

				if arg_120_1.var_.characterEffect1052ui_story and not isNil(var_123_0) then
					arg_120_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_120_1.time_ >= var_123_1 + var_123_2 and arg_120_1.time_ < var_123_1 + var_123_2 + arg_123_0 and not isNil(var_123_0) and arg_120_1.var_.characterEffect1052ui_story then
				arg_120_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_123_4 = arg_120_1.actors_["1095ui_story"]
			local var_123_5 = 0

			if var_123_5 < arg_120_1.time_ and arg_120_1.time_ <= var_123_5 + arg_123_0 and not isNil(var_123_4) and arg_120_1.var_.characterEffect1095ui_story == nil then
				arg_120_1.var_.characterEffect1095ui_story = var_123_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_123_6 = 0.200000002980232

			if var_123_5 <= arg_120_1.time_ and arg_120_1.time_ < var_123_5 + var_123_6 and not isNil(var_123_4) then
				local var_123_7 = (arg_120_1.time_ - var_123_5) / var_123_6

				if arg_120_1.var_.characterEffect1095ui_story and not isNil(var_123_4) then
					local var_123_8 = Mathf.Lerp(0, 0.5, var_123_7)

					arg_120_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_120_1.var_.characterEffect1095ui_story.fillRatio = var_123_8
				end
			end

			if arg_120_1.time_ >= var_123_5 + var_123_6 and arg_120_1.time_ < var_123_5 + var_123_6 + arg_123_0 and not isNil(var_123_4) and arg_120_1.var_.characterEffect1095ui_story then
				local var_123_9 = 0.5

				arg_120_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_120_1.var_.characterEffect1095ui_story.fillRatio = var_123_9
			end

			local var_123_10 = 0
			local var_123_11 = 0.7

			if var_123_10 < arg_120_1.time_ and arg_120_1.time_ <= var_123_10 + arg_123_0 then
				arg_120_1.talkMaxDuration = 0
				arg_120_1.dialogCg_.alpha = 1

				arg_120_1.dialog_:SetActive(true)
				SetActive(arg_120_1.leftNameGo_, true)

				local var_123_12 = arg_120_1:FormatText(StoryNameCfg[263].name)

				arg_120_1.leftNameTxt_.text = var_123_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_120_1.leftNameTxt_.transform)

				arg_120_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_120_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_120_1:RecordName(arg_120_1.leftNameTxt_.text)
				SetActive(arg_120_1.iconTrs_.gameObject, false)
				arg_120_1.callingController_:SetSelectedState("normal")

				local var_123_13 = arg_120_1:GetWordFromCfg(411151029)
				local var_123_14 = arg_120_1:FormatText(var_123_13.content)

				arg_120_1.text_.text = var_123_14

				LuaForUtil.ClearLinePrefixSymbol(arg_120_1.text_)

				local var_123_15 = 28
				local var_123_16 = utf8.len(var_123_14)
				local var_123_17 = var_123_15 <= 0 and var_123_11 or var_123_11 * (var_123_16 / var_123_15)

				if var_123_17 > 0 and var_123_11 < var_123_17 then
					arg_120_1.talkMaxDuration = var_123_17

					if var_123_17 + var_123_10 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_17 + var_123_10
					end
				end

				arg_120_1.text_.text = var_123_14
				arg_120_1.typewritter.percent = 0

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151029", "story_v_out_411151.awb") ~= 0 then
					local var_123_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151029", "story_v_out_411151.awb") / 1000

					if var_123_18 + var_123_10 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_18 + var_123_10
					end

					if var_123_13.prefab_name ~= "" and arg_120_1.actors_[var_123_13.prefab_name] ~= nil then
						local var_123_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_120_1.actors_[var_123_13.prefab_name].transform, "story_v_out_411151", "411151029", "story_v_out_411151.awb")

						arg_120_1:RecordAudio("411151029", var_123_19)
						arg_120_1:RecordAudio("411151029", var_123_19)
					else
						arg_120_1:AudioAction("play", "voice", "story_v_out_411151", "411151029", "story_v_out_411151.awb")
					end

					arg_120_1:RecordHistoryTalkVoice("story_v_out_411151", "411151029", "story_v_out_411151.awb")
				end

				arg_120_1:RecordContent(arg_120_1.text_.text)
			end

			local var_123_20 = math.max(var_123_11, arg_120_1.talkMaxDuration)

			if var_123_10 <= arg_120_1.time_ and arg_120_1.time_ < var_123_10 + var_123_20 then
				arg_120_1.typewritter.percent = (arg_120_1.time_ - var_123_10) / var_123_20

				arg_120_1.typewritter:SetDirty()
			end

			if arg_120_1.time_ >= var_123_10 + var_123_20 and arg_120_1.time_ < var_123_10 + var_123_20 + arg_123_0 then
				arg_120_1.typewritter.percent = 1

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(true)
			end
		end
	end,
	Play411151030 = function(arg_124_0, arg_124_1)
		arg_124_1.time_ = 0
		arg_124_1.frameCnt_ = 0
		arg_124_1.state_ = "playing"
		arg_124_1.curTalkId_ = 411151030
		arg_124_1.duration_ = 8.23

		local var_124_0 = {
			zh = 8.233,
			ja = 5.333
		}
		local var_124_1 = manager.audio:GetLocalizationFlag()

		if var_124_0[var_124_1] ~= nil then
			arg_124_1.duration_ = var_124_0[var_124_1]
		end

		SetActive(arg_124_1.tipsGo_, false)

		function arg_124_1.onSingleLineFinish_()
			arg_124_1.onSingleLineUpdate_ = nil
			arg_124_1.onSingleLineFinish_ = nil
			arg_124_1.state_ = "waiting"
		end

		function arg_124_1.playNext_(arg_126_0)
			if arg_126_0 == 1 then
				arg_124_0:Play411151031(arg_124_1)
			end
		end

		function arg_124_1.onSingleLineUpdate_(arg_127_0)
			local var_127_0 = 0

			if var_127_0 < arg_124_1.time_ and arg_124_1.time_ <= var_127_0 + arg_127_0 then
				arg_124_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_1")
			end

			local var_127_1 = 0

			if var_127_1 < arg_124_1.time_ and arg_124_1.time_ <= var_127_1 + arg_127_0 then
				arg_124_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_127_2 = 0
			local var_127_3 = 1.025

			if var_127_2 < arg_124_1.time_ and arg_124_1.time_ <= var_127_2 + arg_127_0 then
				arg_124_1.talkMaxDuration = 0
				arg_124_1.dialogCg_.alpha = 1

				arg_124_1.dialog_:SetActive(true)
				SetActive(arg_124_1.leftNameGo_, true)

				local var_127_4 = arg_124_1:FormatText(StoryNameCfg[263].name)

				arg_124_1.leftNameTxt_.text = var_127_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_124_1.leftNameTxt_.transform)

				arg_124_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_124_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_124_1:RecordName(arg_124_1.leftNameTxt_.text)
				SetActive(arg_124_1.iconTrs_.gameObject, false)
				arg_124_1.callingController_:SetSelectedState("normal")

				local var_127_5 = arg_124_1:GetWordFromCfg(411151030)
				local var_127_6 = arg_124_1:FormatText(var_127_5.content)

				arg_124_1.text_.text = var_127_6

				LuaForUtil.ClearLinePrefixSymbol(arg_124_1.text_)

				local var_127_7 = 42
				local var_127_8 = utf8.len(var_127_6)
				local var_127_9 = var_127_7 <= 0 and var_127_3 or var_127_3 * (var_127_8 / var_127_7)

				if var_127_9 > 0 and var_127_3 < var_127_9 then
					arg_124_1.talkMaxDuration = var_127_9

					if var_127_9 + var_127_2 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_9 + var_127_2
					end
				end

				arg_124_1.text_.text = var_127_6
				arg_124_1.typewritter.percent = 0

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151030", "story_v_out_411151.awb") ~= 0 then
					local var_127_10 = manager.audio:GetVoiceLength("story_v_out_411151", "411151030", "story_v_out_411151.awb") / 1000

					if var_127_10 + var_127_2 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_10 + var_127_2
					end

					if var_127_5.prefab_name ~= "" and arg_124_1.actors_[var_127_5.prefab_name] ~= nil then
						local var_127_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_124_1.actors_[var_127_5.prefab_name].transform, "story_v_out_411151", "411151030", "story_v_out_411151.awb")

						arg_124_1:RecordAudio("411151030", var_127_11)
						arg_124_1:RecordAudio("411151030", var_127_11)
					else
						arg_124_1:AudioAction("play", "voice", "story_v_out_411151", "411151030", "story_v_out_411151.awb")
					end

					arg_124_1:RecordHistoryTalkVoice("story_v_out_411151", "411151030", "story_v_out_411151.awb")
				end

				arg_124_1:RecordContent(arg_124_1.text_.text)
			end

			local var_127_12 = math.max(var_127_3, arg_124_1.talkMaxDuration)

			if var_127_2 <= arg_124_1.time_ and arg_124_1.time_ < var_127_2 + var_127_12 then
				arg_124_1.typewritter.percent = (arg_124_1.time_ - var_127_2) / var_127_12

				arg_124_1.typewritter:SetDirty()
			end

			if arg_124_1.time_ >= var_127_2 + var_127_12 and arg_124_1.time_ < var_127_2 + var_127_12 + arg_127_0 then
				arg_124_1.typewritter.percent = 1

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(true)
			end
		end
	end,
	Play411151031 = function(arg_128_0, arg_128_1)
		arg_128_1.time_ = 0
		arg_128_1.frameCnt_ = 0
		arg_128_1.state_ = "playing"
		arg_128_1.curTalkId_ = 411151031
		arg_128_1.duration_ = 6.8

		local var_128_0 = {
			zh = 6.8,
			ja = 4.966
		}
		local var_128_1 = manager.audio:GetLocalizationFlag()

		if var_128_0[var_128_1] ~= nil then
			arg_128_1.duration_ = var_128_0[var_128_1]
		end

		SetActive(arg_128_1.tipsGo_, false)

		function arg_128_1.onSingleLineFinish_()
			arg_128_1.onSingleLineUpdate_ = nil
			arg_128_1.onSingleLineFinish_ = nil
			arg_128_1.state_ = "waiting"
		end

		function arg_128_1.playNext_(arg_130_0)
			if arg_130_0 == 1 then
				arg_128_0:Play411151032(arg_128_1)
			end
		end

		function arg_128_1.onSingleLineUpdate_(arg_131_0)
			local var_131_0 = 0
			local var_131_1 = 0.8

			if var_131_0 < arg_128_1.time_ and arg_128_1.time_ <= var_131_0 + arg_131_0 then
				arg_128_1.talkMaxDuration = 0
				arg_128_1.dialogCg_.alpha = 1

				arg_128_1.dialog_:SetActive(true)
				SetActive(arg_128_1.leftNameGo_, true)

				local var_131_2 = arg_128_1:FormatText(StoryNameCfg[263].name)

				arg_128_1.leftNameTxt_.text = var_131_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_128_1.leftNameTxt_.transform)

				arg_128_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_128_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_128_1:RecordName(arg_128_1.leftNameTxt_.text)
				SetActive(arg_128_1.iconTrs_.gameObject, false)
				arg_128_1.callingController_:SetSelectedState("normal")

				local var_131_3 = arg_128_1:GetWordFromCfg(411151031)
				local var_131_4 = arg_128_1:FormatText(var_131_3.content)

				arg_128_1.text_.text = var_131_4

				LuaForUtil.ClearLinePrefixSymbol(arg_128_1.text_)

				local var_131_5 = 32
				local var_131_6 = utf8.len(var_131_4)
				local var_131_7 = var_131_5 <= 0 and var_131_1 or var_131_1 * (var_131_6 / var_131_5)

				if var_131_7 > 0 and var_131_1 < var_131_7 then
					arg_128_1.talkMaxDuration = var_131_7

					if var_131_7 + var_131_0 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_7 + var_131_0
					end
				end

				arg_128_1.text_.text = var_131_4
				arg_128_1.typewritter.percent = 0

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151031", "story_v_out_411151.awb") ~= 0 then
					local var_131_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151031", "story_v_out_411151.awb") / 1000

					if var_131_8 + var_131_0 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_8 + var_131_0
					end

					if var_131_3.prefab_name ~= "" and arg_128_1.actors_[var_131_3.prefab_name] ~= nil then
						local var_131_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_128_1.actors_[var_131_3.prefab_name].transform, "story_v_out_411151", "411151031", "story_v_out_411151.awb")

						arg_128_1:RecordAudio("411151031", var_131_9)
						arg_128_1:RecordAudio("411151031", var_131_9)
					else
						arg_128_1:AudioAction("play", "voice", "story_v_out_411151", "411151031", "story_v_out_411151.awb")
					end

					arg_128_1:RecordHistoryTalkVoice("story_v_out_411151", "411151031", "story_v_out_411151.awb")
				end

				arg_128_1:RecordContent(arg_128_1.text_.text)
			end

			local var_131_10 = math.max(var_131_1, arg_128_1.talkMaxDuration)

			if var_131_0 <= arg_128_1.time_ and arg_128_1.time_ < var_131_0 + var_131_10 then
				arg_128_1.typewritter.percent = (arg_128_1.time_ - var_131_0) / var_131_10

				arg_128_1.typewritter:SetDirty()
			end

			if arg_128_1.time_ >= var_131_0 + var_131_10 and arg_128_1.time_ < var_131_0 + var_131_10 + arg_131_0 then
				arg_128_1.typewritter.percent = 1

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(true)
			end
		end
	end,
	Play411151032 = function(arg_132_0, arg_132_1)
		arg_132_1.time_ = 0
		arg_132_1.frameCnt_ = 0
		arg_132_1.state_ = "playing"
		arg_132_1.curTalkId_ = 411151032
		arg_132_1.duration_ = 10.77

		local var_132_0 = {
			zh = 9.133,
			ja = 10.766
		}
		local var_132_1 = manager.audio:GetLocalizationFlag()

		if var_132_0[var_132_1] ~= nil then
			arg_132_1.duration_ = var_132_0[var_132_1]
		end

		SetActive(arg_132_1.tipsGo_, false)

		function arg_132_1.onSingleLineFinish_()
			arg_132_1.onSingleLineUpdate_ = nil
			arg_132_1.onSingleLineFinish_ = nil
			arg_132_1.state_ = "waiting"
		end

		function arg_132_1.playNext_(arg_134_0)
			if arg_134_0 == 1 then
				arg_132_0:Play411151033(arg_132_1)
			end
		end

		function arg_132_1.onSingleLineUpdate_(arg_135_0)
			local var_135_0 = arg_132_1.actors_["1052ui_story"]
			local var_135_1 = 0

			if var_135_1 < arg_132_1.time_ and arg_132_1.time_ <= var_135_1 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.characterEffect1052ui_story == nil then
				arg_132_1.var_.characterEffect1052ui_story = var_135_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_135_2 = 0.200000002980232

			if var_135_1 <= arg_132_1.time_ and arg_132_1.time_ < var_135_1 + var_135_2 and not isNil(var_135_0) then
				local var_135_3 = (arg_132_1.time_ - var_135_1) / var_135_2

				if arg_132_1.var_.characterEffect1052ui_story and not isNil(var_135_0) then
					local var_135_4 = Mathf.Lerp(0, 0.5, var_135_3)

					arg_132_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_132_1.var_.characterEffect1052ui_story.fillRatio = var_135_4
				end
			end

			if arg_132_1.time_ >= var_135_1 + var_135_2 and arg_132_1.time_ < var_135_1 + var_135_2 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.characterEffect1052ui_story then
				local var_135_5 = 0.5

				arg_132_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_132_1.var_.characterEffect1052ui_story.fillRatio = var_135_5
			end

			local var_135_6 = arg_132_1.actors_["1095ui_story"]
			local var_135_7 = 0

			if var_135_7 < arg_132_1.time_ and arg_132_1.time_ <= var_135_7 + arg_135_0 and not isNil(var_135_6) and arg_132_1.var_.characterEffect1095ui_story == nil then
				arg_132_1.var_.characterEffect1095ui_story = var_135_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_135_8 = 0.200000002980232

			if var_135_7 <= arg_132_1.time_ and arg_132_1.time_ < var_135_7 + var_135_8 and not isNil(var_135_6) then
				local var_135_9 = (arg_132_1.time_ - var_135_7) / var_135_8

				if arg_132_1.var_.characterEffect1095ui_story and not isNil(var_135_6) then
					arg_132_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_132_1.time_ >= var_135_7 + var_135_8 and arg_132_1.time_ < var_135_7 + var_135_8 + arg_135_0 and not isNil(var_135_6) and arg_132_1.var_.characterEffect1095ui_story then
				arg_132_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_135_10 = 0

			if var_135_10 < arg_132_1.time_ and arg_132_1.time_ <= var_135_10 + arg_135_0 then
				arg_132_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_135_11 = 0

			if var_135_11 < arg_132_1.time_ and arg_132_1.time_ <= var_135_11 + arg_135_0 then
				arg_132_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_135_12 = 0
			local var_135_13 = 1.175

			if var_135_12 < arg_132_1.time_ and arg_132_1.time_ <= var_135_12 + arg_135_0 then
				arg_132_1.talkMaxDuration = 0
				arg_132_1.dialogCg_.alpha = 1

				arg_132_1.dialog_:SetActive(true)
				SetActive(arg_132_1.leftNameGo_, true)

				local var_135_14 = arg_132_1:FormatText(StoryNameCfg[471].name)

				arg_132_1.leftNameTxt_.text = var_135_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_132_1.leftNameTxt_.transform)

				arg_132_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_132_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_132_1:RecordName(arg_132_1.leftNameTxt_.text)
				SetActive(arg_132_1.iconTrs_.gameObject, false)
				arg_132_1.callingController_:SetSelectedState("normal")

				local var_135_15 = arg_132_1:GetWordFromCfg(411151032)
				local var_135_16 = arg_132_1:FormatText(var_135_15.content)

				arg_132_1.text_.text = var_135_16

				LuaForUtil.ClearLinePrefixSymbol(arg_132_1.text_)

				local var_135_17 = 47
				local var_135_18 = utf8.len(var_135_16)
				local var_135_19 = var_135_17 <= 0 and var_135_13 or var_135_13 * (var_135_18 / var_135_17)

				if var_135_19 > 0 and var_135_13 < var_135_19 then
					arg_132_1.talkMaxDuration = var_135_19

					if var_135_19 + var_135_12 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_19 + var_135_12
					end
				end

				arg_132_1.text_.text = var_135_16
				arg_132_1.typewritter.percent = 0

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151032", "story_v_out_411151.awb") ~= 0 then
					local var_135_20 = manager.audio:GetVoiceLength("story_v_out_411151", "411151032", "story_v_out_411151.awb") / 1000

					if var_135_20 + var_135_12 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_20 + var_135_12
					end

					if var_135_15.prefab_name ~= "" and arg_132_1.actors_[var_135_15.prefab_name] ~= nil then
						local var_135_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_132_1.actors_[var_135_15.prefab_name].transform, "story_v_out_411151", "411151032", "story_v_out_411151.awb")

						arg_132_1:RecordAudio("411151032", var_135_21)
						arg_132_1:RecordAudio("411151032", var_135_21)
					else
						arg_132_1:AudioAction("play", "voice", "story_v_out_411151", "411151032", "story_v_out_411151.awb")
					end

					arg_132_1:RecordHistoryTalkVoice("story_v_out_411151", "411151032", "story_v_out_411151.awb")
				end

				arg_132_1:RecordContent(arg_132_1.text_.text)
			end

			local var_135_22 = math.max(var_135_13, arg_132_1.talkMaxDuration)

			if var_135_12 <= arg_132_1.time_ and arg_132_1.time_ < var_135_12 + var_135_22 then
				arg_132_1.typewritter.percent = (arg_132_1.time_ - var_135_12) / var_135_22

				arg_132_1.typewritter:SetDirty()
			end

			if arg_132_1.time_ >= var_135_12 + var_135_22 and arg_132_1.time_ < var_135_12 + var_135_22 + arg_135_0 then
				arg_132_1.typewritter.percent = 1

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(true)
			end
		end
	end,
	Play411151033 = function(arg_136_0, arg_136_1)
		arg_136_1.time_ = 0
		arg_136_1.frameCnt_ = 0
		arg_136_1.state_ = "playing"
		arg_136_1.curTalkId_ = 411151033
		arg_136_1.duration_ = 12.1

		local var_136_0 = {
			zh = 7.8,
			ja = 12.1
		}
		local var_136_1 = manager.audio:GetLocalizationFlag()

		if var_136_0[var_136_1] ~= nil then
			arg_136_1.duration_ = var_136_0[var_136_1]
		end

		SetActive(arg_136_1.tipsGo_, false)

		function arg_136_1.onSingleLineFinish_()
			arg_136_1.onSingleLineUpdate_ = nil
			arg_136_1.onSingleLineFinish_ = nil
			arg_136_1.state_ = "waiting"
		end

		function arg_136_1.playNext_(arg_138_0)
			if arg_138_0 == 1 then
				arg_136_0:Play411151034(arg_136_1)
			end
		end

		function arg_136_1.onSingleLineUpdate_(arg_139_0)
			local var_139_0 = 0
			local var_139_1 = 0.95

			if var_139_0 < arg_136_1.time_ and arg_136_1.time_ <= var_139_0 + arg_139_0 then
				arg_136_1.talkMaxDuration = 0
				arg_136_1.dialogCg_.alpha = 1

				arg_136_1.dialog_:SetActive(true)
				SetActive(arg_136_1.leftNameGo_, true)

				local var_139_2 = arg_136_1:FormatText(StoryNameCfg[471].name)

				arg_136_1.leftNameTxt_.text = var_139_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_136_1.leftNameTxt_.transform)

				arg_136_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_136_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_136_1:RecordName(arg_136_1.leftNameTxt_.text)
				SetActive(arg_136_1.iconTrs_.gameObject, false)
				arg_136_1.callingController_:SetSelectedState("normal")

				local var_139_3 = arg_136_1:GetWordFromCfg(411151033)
				local var_139_4 = arg_136_1:FormatText(var_139_3.content)

				arg_136_1.text_.text = var_139_4

				LuaForUtil.ClearLinePrefixSymbol(arg_136_1.text_)

				local var_139_5 = 38
				local var_139_6 = utf8.len(var_139_4)
				local var_139_7 = var_139_5 <= 0 and var_139_1 or var_139_1 * (var_139_6 / var_139_5)

				if var_139_7 > 0 and var_139_1 < var_139_7 then
					arg_136_1.talkMaxDuration = var_139_7

					if var_139_7 + var_139_0 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_7 + var_139_0
					end
				end

				arg_136_1.text_.text = var_139_4
				arg_136_1.typewritter.percent = 0

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151033", "story_v_out_411151.awb") ~= 0 then
					local var_139_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151033", "story_v_out_411151.awb") / 1000

					if var_139_8 + var_139_0 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_8 + var_139_0
					end

					if var_139_3.prefab_name ~= "" and arg_136_1.actors_[var_139_3.prefab_name] ~= nil then
						local var_139_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_136_1.actors_[var_139_3.prefab_name].transform, "story_v_out_411151", "411151033", "story_v_out_411151.awb")

						arg_136_1:RecordAudio("411151033", var_139_9)
						arg_136_1:RecordAudio("411151033", var_139_9)
					else
						arg_136_1:AudioAction("play", "voice", "story_v_out_411151", "411151033", "story_v_out_411151.awb")
					end

					arg_136_1:RecordHistoryTalkVoice("story_v_out_411151", "411151033", "story_v_out_411151.awb")
				end

				arg_136_1:RecordContent(arg_136_1.text_.text)
			end

			local var_139_10 = math.max(var_139_1, arg_136_1.talkMaxDuration)

			if var_139_0 <= arg_136_1.time_ and arg_136_1.time_ < var_139_0 + var_139_10 then
				arg_136_1.typewritter.percent = (arg_136_1.time_ - var_139_0) / var_139_10

				arg_136_1.typewritter:SetDirty()
			end

			if arg_136_1.time_ >= var_139_0 + var_139_10 and arg_136_1.time_ < var_139_0 + var_139_10 + arg_139_0 then
				arg_136_1.typewritter.percent = 1

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(true)
			end
		end
	end,
	Play411151034 = function(arg_140_0, arg_140_1)
		arg_140_1.time_ = 0
		arg_140_1.frameCnt_ = 0
		arg_140_1.state_ = "playing"
		arg_140_1.curTalkId_ = 411151034
		arg_140_1.duration_ = 8.47

		local var_140_0 = {
			zh = 6.7,
			ja = 8.466
		}
		local var_140_1 = manager.audio:GetLocalizationFlag()

		if var_140_0[var_140_1] ~= nil then
			arg_140_1.duration_ = var_140_0[var_140_1]
		end

		SetActive(arg_140_1.tipsGo_, false)

		function arg_140_1.onSingleLineFinish_()
			arg_140_1.onSingleLineUpdate_ = nil
			arg_140_1.onSingleLineFinish_ = nil
			arg_140_1.state_ = "waiting"
		end

		function arg_140_1.playNext_(arg_142_0)
			if arg_142_0 == 1 then
				arg_140_0:Play411151035(arg_140_1)
			end
		end

		function arg_140_1.onSingleLineUpdate_(arg_143_0)
			local var_143_0 = arg_140_1.actors_["1052ui_story"]
			local var_143_1 = 0

			if var_143_1 < arg_140_1.time_ and arg_140_1.time_ <= var_143_1 + arg_143_0 and not isNil(var_143_0) and arg_140_1.var_.characterEffect1052ui_story == nil then
				arg_140_1.var_.characterEffect1052ui_story = var_143_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_143_2 = 0.200000002980232

			if var_143_1 <= arg_140_1.time_ and arg_140_1.time_ < var_143_1 + var_143_2 and not isNil(var_143_0) then
				local var_143_3 = (arg_140_1.time_ - var_143_1) / var_143_2

				if arg_140_1.var_.characterEffect1052ui_story and not isNil(var_143_0) then
					arg_140_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_140_1.time_ >= var_143_1 + var_143_2 and arg_140_1.time_ < var_143_1 + var_143_2 + arg_143_0 and not isNil(var_143_0) and arg_140_1.var_.characterEffect1052ui_story then
				arg_140_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_143_4 = arg_140_1.actors_["1095ui_story"]
			local var_143_5 = 0

			if var_143_5 < arg_140_1.time_ and arg_140_1.time_ <= var_143_5 + arg_143_0 and not isNil(var_143_4) and arg_140_1.var_.characterEffect1095ui_story == nil then
				arg_140_1.var_.characterEffect1095ui_story = var_143_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_143_6 = 0.200000002980232

			if var_143_5 <= arg_140_1.time_ and arg_140_1.time_ < var_143_5 + var_143_6 and not isNil(var_143_4) then
				local var_143_7 = (arg_140_1.time_ - var_143_5) / var_143_6

				if arg_140_1.var_.characterEffect1095ui_story and not isNil(var_143_4) then
					local var_143_8 = Mathf.Lerp(0, 0.5, var_143_7)

					arg_140_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_140_1.var_.characterEffect1095ui_story.fillRatio = var_143_8
				end
			end

			if arg_140_1.time_ >= var_143_5 + var_143_6 and arg_140_1.time_ < var_143_5 + var_143_6 + arg_143_0 and not isNil(var_143_4) and arg_140_1.var_.characterEffect1095ui_story then
				local var_143_9 = 0.5

				arg_140_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_140_1.var_.characterEffect1095ui_story.fillRatio = var_143_9
			end

			local var_143_10 = 0

			if var_143_10 < arg_140_1.time_ and arg_140_1.time_ <= var_143_10 + arg_143_0 then
				arg_140_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/1052/1052action/1052action6_2")
			end

			local var_143_11 = 0

			if var_143_11 < arg_140_1.time_ and arg_140_1.time_ <= var_143_11 + arg_143_0 then
				arg_140_1:PlayTimeline("1052ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_143_12 = 0
			local var_143_13 = 0.75

			if var_143_12 < arg_140_1.time_ and arg_140_1.time_ <= var_143_12 + arg_143_0 then
				arg_140_1.talkMaxDuration = 0
				arg_140_1.dialogCg_.alpha = 1

				arg_140_1.dialog_:SetActive(true)
				SetActive(arg_140_1.leftNameGo_, true)

				local var_143_14 = arg_140_1:FormatText(StoryNameCfg[263].name)

				arg_140_1.leftNameTxt_.text = var_143_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_140_1.leftNameTxt_.transform)

				arg_140_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_140_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_140_1:RecordName(arg_140_1.leftNameTxt_.text)
				SetActive(arg_140_1.iconTrs_.gameObject, false)
				arg_140_1.callingController_:SetSelectedState("normal")

				local var_143_15 = arg_140_1:GetWordFromCfg(411151034)
				local var_143_16 = arg_140_1:FormatText(var_143_15.content)

				arg_140_1.text_.text = var_143_16

				LuaForUtil.ClearLinePrefixSymbol(arg_140_1.text_)

				local var_143_17 = 30
				local var_143_18 = utf8.len(var_143_16)
				local var_143_19 = var_143_17 <= 0 and var_143_13 or var_143_13 * (var_143_18 / var_143_17)

				if var_143_19 > 0 and var_143_13 < var_143_19 then
					arg_140_1.talkMaxDuration = var_143_19

					if var_143_19 + var_143_12 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_19 + var_143_12
					end
				end

				arg_140_1.text_.text = var_143_16
				arg_140_1.typewritter.percent = 0

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151034", "story_v_out_411151.awb") ~= 0 then
					local var_143_20 = manager.audio:GetVoiceLength("story_v_out_411151", "411151034", "story_v_out_411151.awb") / 1000

					if var_143_20 + var_143_12 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_20 + var_143_12
					end

					if var_143_15.prefab_name ~= "" and arg_140_1.actors_[var_143_15.prefab_name] ~= nil then
						local var_143_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_140_1.actors_[var_143_15.prefab_name].transform, "story_v_out_411151", "411151034", "story_v_out_411151.awb")

						arg_140_1:RecordAudio("411151034", var_143_21)
						arg_140_1:RecordAudio("411151034", var_143_21)
					else
						arg_140_1:AudioAction("play", "voice", "story_v_out_411151", "411151034", "story_v_out_411151.awb")
					end

					arg_140_1:RecordHistoryTalkVoice("story_v_out_411151", "411151034", "story_v_out_411151.awb")
				end

				arg_140_1:RecordContent(arg_140_1.text_.text)
			end

			local var_143_22 = math.max(var_143_13, arg_140_1.talkMaxDuration)

			if var_143_12 <= arg_140_1.time_ and arg_140_1.time_ < var_143_12 + var_143_22 then
				arg_140_1.typewritter.percent = (arg_140_1.time_ - var_143_12) / var_143_22

				arg_140_1.typewritter:SetDirty()
			end

			if arg_140_1.time_ >= var_143_12 + var_143_22 and arg_140_1.time_ < var_143_12 + var_143_22 + arg_143_0 then
				arg_140_1.typewritter.percent = 1

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(true)
			end
		end
	end,
	Play411151035 = function(arg_144_0, arg_144_1)
		arg_144_1.time_ = 0
		arg_144_1.frameCnt_ = 0
		arg_144_1.state_ = "playing"
		arg_144_1.curTalkId_ = 411151035
		arg_144_1.duration_ = 4.8

		local var_144_0 = {
			zh = 4.333,
			ja = 4.8
		}
		local var_144_1 = manager.audio:GetLocalizationFlag()

		if var_144_0[var_144_1] ~= nil then
			arg_144_1.duration_ = var_144_0[var_144_1]
		end

		SetActive(arg_144_1.tipsGo_, false)

		function arg_144_1.onSingleLineFinish_()
			arg_144_1.onSingleLineUpdate_ = nil
			arg_144_1.onSingleLineFinish_ = nil
			arg_144_1.state_ = "waiting"
		end

		function arg_144_1.playNext_(arg_146_0)
			if arg_146_0 == 1 then
				arg_144_0:Play411151036(arg_144_1)
			end
		end

		function arg_144_1.onSingleLineUpdate_(arg_147_0)
			local var_147_0 = arg_144_1.actors_["1052ui_story"]
			local var_147_1 = 0

			if var_147_1 < arg_144_1.time_ and arg_144_1.time_ <= var_147_1 + arg_147_0 and not isNil(var_147_0) and arg_144_1.var_.characterEffect1052ui_story == nil then
				arg_144_1.var_.characterEffect1052ui_story = var_147_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_147_2 = 0.200000002980232

			if var_147_1 <= arg_144_1.time_ and arg_144_1.time_ < var_147_1 + var_147_2 and not isNil(var_147_0) then
				local var_147_3 = (arg_144_1.time_ - var_147_1) / var_147_2

				if arg_144_1.var_.characterEffect1052ui_story and not isNil(var_147_0) then
					local var_147_4 = Mathf.Lerp(0, 0.5, var_147_3)

					arg_144_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_144_1.var_.characterEffect1052ui_story.fillRatio = var_147_4
				end
			end

			if arg_144_1.time_ >= var_147_1 + var_147_2 and arg_144_1.time_ < var_147_1 + var_147_2 + arg_147_0 and not isNil(var_147_0) and arg_144_1.var_.characterEffect1052ui_story then
				local var_147_5 = 0.5

				arg_144_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_144_1.var_.characterEffect1052ui_story.fillRatio = var_147_5
			end

			local var_147_6 = arg_144_1.actors_["1095ui_story"]
			local var_147_7 = 0

			if var_147_7 < arg_144_1.time_ and arg_144_1.time_ <= var_147_7 + arg_147_0 and not isNil(var_147_6) and arg_144_1.var_.characterEffect1095ui_story == nil then
				arg_144_1.var_.characterEffect1095ui_story = var_147_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_147_8 = 0.200000002980232

			if var_147_7 <= arg_144_1.time_ and arg_144_1.time_ < var_147_7 + var_147_8 and not isNil(var_147_6) then
				local var_147_9 = (arg_144_1.time_ - var_147_7) / var_147_8

				if arg_144_1.var_.characterEffect1095ui_story and not isNil(var_147_6) then
					arg_144_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_144_1.time_ >= var_147_7 + var_147_8 and arg_144_1.time_ < var_147_7 + var_147_8 + arg_147_0 and not isNil(var_147_6) and arg_144_1.var_.characterEffect1095ui_story then
				arg_144_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_147_10 = 0
			local var_147_11 = 0.5

			if var_147_10 < arg_144_1.time_ and arg_144_1.time_ <= var_147_10 + arg_147_0 then
				arg_144_1.talkMaxDuration = 0
				arg_144_1.dialogCg_.alpha = 1

				arg_144_1.dialog_:SetActive(true)
				SetActive(arg_144_1.leftNameGo_, true)

				local var_147_12 = arg_144_1:FormatText(StoryNameCfg[471].name)

				arg_144_1.leftNameTxt_.text = var_147_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_144_1.leftNameTxt_.transform)

				arg_144_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_144_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_144_1:RecordName(arg_144_1.leftNameTxt_.text)
				SetActive(arg_144_1.iconTrs_.gameObject, false)
				arg_144_1.callingController_:SetSelectedState("normal")

				local var_147_13 = arg_144_1:GetWordFromCfg(411151035)
				local var_147_14 = arg_144_1:FormatText(var_147_13.content)

				arg_144_1.text_.text = var_147_14

				LuaForUtil.ClearLinePrefixSymbol(arg_144_1.text_)

				local var_147_15 = 20
				local var_147_16 = utf8.len(var_147_14)
				local var_147_17 = var_147_15 <= 0 and var_147_11 or var_147_11 * (var_147_16 / var_147_15)

				if var_147_17 > 0 and var_147_11 < var_147_17 then
					arg_144_1.talkMaxDuration = var_147_17

					if var_147_17 + var_147_10 > arg_144_1.duration_ then
						arg_144_1.duration_ = var_147_17 + var_147_10
					end
				end

				arg_144_1.text_.text = var_147_14
				arg_144_1.typewritter.percent = 0

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151035", "story_v_out_411151.awb") ~= 0 then
					local var_147_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151035", "story_v_out_411151.awb") / 1000

					if var_147_18 + var_147_10 > arg_144_1.duration_ then
						arg_144_1.duration_ = var_147_18 + var_147_10
					end

					if var_147_13.prefab_name ~= "" and arg_144_1.actors_[var_147_13.prefab_name] ~= nil then
						local var_147_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_144_1.actors_[var_147_13.prefab_name].transform, "story_v_out_411151", "411151035", "story_v_out_411151.awb")

						arg_144_1:RecordAudio("411151035", var_147_19)
						arg_144_1:RecordAudio("411151035", var_147_19)
					else
						arg_144_1:AudioAction("play", "voice", "story_v_out_411151", "411151035", "story_v_out_411151.awb")
					end

					arg_144_1:RecordHistoryTalkVoice("story_v_out_411151", "411151035", "story_v_out_411151.awb")
				end

				arg_144_1:RecordContent(arg_144_1.text_.text)
			end

			local var_147_20 = math.max(var_147_11, arg_144_1.talkMaxDuration)

			if var_147_10 <= arg_144_1.time_ and arg_144_1.time_ < var_147_10 + var_147_20 then
				arg_144_1.typewritter.percent = (arg_144_1.time_ - var_147_10) / var_147_20

				arg_144_1.typewritter:SetDirty()
			end

			if arg_144_1.time_ >= var_147_10 + var_147_20 and arg_144_1.time_ < var_147_10 + var_147_20 + arg_147_0 then
				arg_144_1.typewritter.percent = 1

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(true)
			end
		end
	end,
	Play411151036 = function(arg_148_0, arg_148_1)
		arg_148_1.time_ = 0
		arg_148_1.frameCnt_ = 0
		arg_148_1.state_ = "playing"
		arg_148_1.curTalkId_ = 411151036
		arg_148_1.duration_ = 3.77

		local var_148_0 = {
			zh = 3.6,
			ja = 3.766
		}
		local var_148_1 = manager.audio:GetLocalizationFlag()

		if var_148_0[var_148_1] ~= nil then
			arg_148_1.duration_ = var_148_0[var_148_1]
		end

		SetActive(arg_148_1.tipsGo_, false)

		function arg_148_1.onSingleLineFinish_()
			arg_148_1.onSingleLineUpdate_ = nil
			arg_148_1.onSingleLineFinish_ = nil
			arg_148_1.state_ = "waiting"
		end

		function arg_148_1.playNext_(arg_150_0)
			if arg_150_0 == 1 then
				arg_148_0:Play411151037(arg_148_1)
			end
		end

		function arg_148_1.onSingleLineUpdate_(arg_151_0)
			local var_151_0 = 0
			local var_151_1 = 0.525

			if var_151_0 < arg_148_1.time_ and arg_148_1.time_ <= var_151_0 + arg_151_0 then
				arg_148_1.talkMaxDuration = 0
				arg_148_1.dialogCg_.alpha = 1

				arg_148_1.dialog_:SetActive(true)
				SetActive(arg_148_1.leftNameGo_, true)

				local var_151_2 = arg_148_1:FormatText(StoryNameCfg[471].name)

				arg_148_1.leftNameTxt_.text = var_151_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_148_1.leftNameTxt_.transform)

				arg_148_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_148_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_148_1:RecordName(arg_148_1.leftNameTxt_.text)
				SetActive(arg_148_1.iconTrs_.gameObject, false)
				arg_148_1.callingController_:SetSelectedState("normal")

				local var_151_3 = arg_148_1:GetWordFromCfg(411151036)
				local var_151_4 = arg_148_1:FormatText(var_151_3.content)

				arg_148_1.text_.text = var_151_4

				LuaForUtil.ClearLinePrefixSymbol(arg_148_1.text_)

				local var_151_5 = 21
				local var_151_6 = utf8.len(var_151_4)
				local var_151_7 = var_151_5 <= 0 and var_151_1 or var_151_1 * (var_151_6 / var_151_5)

				if var_151_7 > 0 and var_151_1 < var_151_7 then
					arg_148_1.talkMaxDuration = var_151_7

					if var_151_7 + var_151_0 > arg_148_1.duration_ then
						arg_148_1.duration_ = var_151_7 + var_151_0
					end
				end

				arg_148_1.text_.text = var_151_4
				arg_148_1.typewritter.percent = 0

				arg_148_1.typewritter:SetDirty()
				arg_148_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151036", "story_v_out_411151.awb") ~= 0 then
					local var_151_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151036", "story_v_out_411151.awb") / 1000

					if var_151_8 + var_151_0 > arg_148_1.duration_ then
						arg_148_1.duration_ = var_151_8 + var_151_0
					end

					if var_151_3.prefab_name ~= "" and arg_148_1.actors_[var_151_3.prefab_name] ~= nil then
						local var_151_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_148_1.actors_[var_151_3.prefab_name].transform, "story_v_out_411151", "411151036", "story_v_out_411151.awb")

						arg_148_1:RecordAudio("411151036", var_151_9)
						arg_148_1:RecordAudio("411151036", var_151_9)
					else
						arg_148_1:AudioAction("play", "voice", "story_v_out_411151", "411151036", "story_v_out_411151.awb")
					end

					arg_148_1:RecordHistoryTalkVoice("story_v_out_411151", "411151036", "story_v_out_411151.awb")
				end

				arg_148_1:RecordContent(arg_148_1.text_.text)
			end

			local var_151_10 = math.max(var_151_1, arg_148_1.talkMaxDuration)

			if var_151_0 <= arg_148_1.time_ and arg_148_1.time_ < var_151_0 + var_151_10 then
				arg_148_1.typewritter.percent = (arg_148_1.time_ - var_151_0) / var_151_10

				arg_148_1.typewritter:SetDirty()
			end

			if arg_148_1.time_ >= var_151_0 + var_151_10 and arg_148_1.time_ < var_151_0 + var_151_10 + arg_151_0 then
				arg_148_1.typewritter.percent = 1

				arg_148_1.typewritter:SetDirty()
				arg_148_1:ShowNextGo(true)
			end
		end
	end,
	Play411151037 = function(arg_152_0, arg_152_1)
		arg_152_1.time_ = 0
		arg_152_1.frameCnt_ = 0
		arg_152_1.state_ = "playing"
		arg_152_1.curTalkId_ = 411151037
		arg_152_1.duration_ = 4.87

		local var_152_0 = {
			zh = 4.866,
			ja = 4
		}
		local var_152_1 = manager.audio:GetLocalizationFlag()

		if var_152_0[var_152_1] ~= nil then
			arg_152_1.duration_ = var_152_0[var_152_1]
		end

		SetActive(arg_152_1.tipsGo_, false)

		function arg_152_1.onSingleLineFinish_()
			arg_152_1.onSingleLineUpdate_ = nil
			arg_152_1.onSingleLineFinish_ = nil
			arg_152_1.state_ = "waiting"
		end

		function arg_152_1.playNext_(arg_154_0)
			if arg_154_0 == 1 then
				arg_152_0:Play411151038(arg_152_1)
			end
		end

		function arg_152_1.onSingleLineUpdate_(arg_155_0)
			local var_155_0 = arg_152_1.actors_["1052ui_story"]
			local var_155_1 = 0

			if var_155_1 < arg_152_1.time_ and arg_152_1.time_ <= var_155_1 + arg_155_0 and not isNil(var_155_0) and arg_152_1.var_.characterEffect1052ui_story == nil then
				arg_152_1.var_.characterEffect1052ui_story = var_155_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_155_2 = 0.200000002980232

			if var_155_1 <= arg_152_1.time_ and arg_152_1.time_ < var_155_1 + var_155_2 and not isNil(var_155_0) then
				local var_155_3 = (arg_152_1.time_ - var_155_1) / var_155_2

				if arg_152_1.var_.characterEffect1052ui_story and not isNil(var_155_0) then
					arg_152_1.var_.characterEffect1052ui_story.fillFlat = false
				end
			end

			if arg_152_1.time_ >= var_155_1 + var_155_2 and arg_152_1.time_ < var_155_1 + var_155_2 + arg_155_0 and not isNil(var_155_0) and arg_152_1.var_.characterEffect1052ui_story then
				arg_152_1.var_.characterEffect1052ui_story.fillFlat = false
			end

			local var_155_4 = arg_152_1.actors_["1095ui_story"]
			local var_155_5 = 0

			if var_155_5 < arg_152_1.time_ and arg_152_1.time_ <= var_155_5 + arg_155_0 and not isNil(var_155_4) and arg_152_1.var_.characterEffect1095ui_story == nil then
				arg_152_1.var_.characterEffect1095ui_story = var_155_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_155_6 = 0.200000002980232

			if var_155_5 <= arg_152_1.time_ and arg_152_1.time_ < var_155_5 + var_155_6 and not isNil(var_155_4) then
				local var_155_7 = (arg_152_1.time_ - var_155_5) / var_155_6

				if arg_152_1.var_.characterEffect1095ui_story and not isNil(var_155_4) then
					local var_155_8 = Mathf.Lerp(0, 0.5, var_155_7)

					arg_152_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_152_1.var_.characterEffect1095ui_story.fillRatio = var_155_8
				end
			end

			if arg_152_1.time_ >= var_155_5 + var_155_6 and arg_152_1.time_ < var_155_5 + var_155_6 + arg_155_0 and not isNil(var_155_4) and arg_152_1.var_.characterEffect1095ui_story then
				local var_155_9 = 0.5

				arg_152_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_152_1.var_.characterEffect1095ui_story.fillRatio = var_155_9
			end

			local var_155_10 = 0
			local var_155_11 = 0.525

			if var_155_10 < arg_152_1.time_ and arg_152_1.time_ <= var_155_10 + arg_155_0 then
				arg_152_1.talkMaxDuration = 0
				arg_152_1.dialogCg_.alpha = 1

				arg_152_1.dialog_:SetActive(true)
				SetActive(arg_152_1.leftNameGo_, true)

				local var_155_12 = arg_152_1:FormatText(StoryNameCfg[263].name)

				arg_152_1.leftNameTxt_.text = var_155_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_152_1.leftNameTxt_.transform)

				arg_152_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_152_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_152_1:RecordName(arg_152_1.leftNameTxt_.text)
				SetActive(arg_152_1.iconTrs_.gameObject, false)
				arg_152_1.callingController_:SetSelectedState("normal")

				local var_155_13 = arg_152_1:GetWordFromCfg(411151037)
				local var_155_14 = arg_152_1:FormatText(var_155_13.content)

				arg_152_1.text_.text = var_155_14

				LuaForUtil.ClearLinePrefixSymbol(arg_152_1.text_)

				local var_155_15 = 21
				local var_155_16 = utf8.len(var_155_14)
				local var_155_17 = var_155_15 <= 0 and var_155_11 or var_155_11 * (var_155_16 / var_155_15)

				if var_155_17 > 0 and var_155_11 < var_155_17 then
					arg_152_1.talkMaxDuration = var_155_17

					if var_155_17 + var_155_10 > arg_152_1.duration_ then
						arg_152_1.duration_ = var_155_17 + var_155_10
					end
				end

				arg_152_1.text_.text = var_155_14
				arg_152_1.typewritter.percent = 0

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151037", "story_v_out_411151.awb") ~= 0 then
					local var_155_18 = manager.audio:GetVoiceLength("story_v_out_411151", "411151037", "story_v_out_411151.awb") / 1000

					if var_155_18 + var_155_10 > arg_152_1.duration_ then
						arg_152_1.duration_ = var_155_18 + var_155_10
					end

					if var_155_13.prefab_name ~= "" and arg_152_1.actors_[var_155_13.prefab_name] ~= nil then
						local var_155_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_152_1.actors_[var_155_13.prefab_name].transform, "story_v_out_411151", "411151037", "story_v_out_411151.awb")

						arg_152_1:RecordAudio("411151037", var_155_19)
						arg_152_1:RecordAudio("411151037", var_155_19)
					else
						arg_152_1:AudioAction("play", "voice", "story_v_out_411151", "411151037", "story_v_out_411151.awb")
					end

					arg_152_1:RecordHistoryTalkVoice("story_v_out_411151", "411151037", "story_v_out_411151.awb")
				end

				arg_152_1:RecordContent(arg_152_1.text_.text)
			end

			local var_155_20 = math.max(var_155_11, arg_152_1.talkMaxDuration)

			if var_155_10 <= arg_152_1.time_ and arg_152_1.time_ < var_155_10 + var_155_20 then
				arg_152_1.typewritter.percent = (arg_152_1.time_ - var_155_10) / var_155_20

				arg_152_1.typewritter:SetDirty()
			end

			if arg_152_1.time_ >= var_155_10 + var_155_20 and arg_152_1.time_ < var_155_10 + var_155_20 + arg_155_0 then
				arg_152_1.typewritter.percent = 1

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(true)
			end
		end
	end,
	Play411151038 = function(arg_156_0, arg_156_1)
		arg_156_1.time_ = 0
		arg_156_1.frameCnt_ = 0
		arg_156_1.state_ = "playing"
		arg_156_1.curTalkId_ = 411151038
		arg_156_1.duration_ = 5

		SetActive(arg_156_1.tipsGo_, false)

		function arg_156_1.onSingleLineFinish_()
			arg_156_1.onSingleLineUpdate_ = nil
			arg_156_1.onSingleLineFinish_ = nil
			arg_156_1.state_ = "waiting"
		end

		function arg_156_1.playNext_(arg_158_0)
			if arg_158_0 == 1 then
				arg_156_0:Play411151039(arg_156_1)
			end
		end

		function arg_156_1.onSingleLineUpdate_(arg_159_0)
			local var_159_0 = arg_156_1.actors_["1052ui_story"].transform
			local var_159_1 = 0

			if var_159_1 < arg_156_1.time_ and arg_156_1.time_ <= var_159_1 + arg_159_0 then
				arg_156_1.var_.moveOldPos1052ui_story = var_159_0.localPosition
			end

			local var_159_2 = 0.001

			if var_159_1 <= arg_156_1.time_ and arg_156_1.time_ < var_159_1 + var_159_2 then
				local var_159_3 = (arg_156_1.time_ - var_159_1) / var_159_2
				local var_159_4 = Vector3.New(0, 100, 0)

				var_159_0.localPosition = Vector3.Lerp(arg_156_1.var_.moveOldPos1052ui_story, var_159_4, var_159_3)

				local var_159_5 = manager.ui.mainCamera.transform.position - var_159_0.position

				var_159_0.forward = Vector3.New(var_159_5.x, var_159_5.y, var_159_5.z)

				local var_159_6 = var_159_0.localEulerAngles

				var_159_6.z = 0
				var_159_6.x = 0
				var_159_0.localEulerAngles = var_159_6
			end

			if arg_156_1.time_ >= var_159_1 + var_159_2 and arg_156_1.time_ < var_159_1 + var_159_2 + arg_159_0 then
				var_159_0.localPosition = Vector3.New(0, 100, 0)

				local var_159_7 = manager.ui.mainCamera.transform.position - var_159_0.position

				var_159_0.forward = Vector3.New(var_159_7.x, var_159_7.y, var_159_7.z)

				local var_159_8 = var_159_0.localEulerAngles

				var_159_8.z = 0
				var_159_8.x = 0
				var_159_0.localEulerAngles = var_159_8
			end

			local var_159_9 = arg_156_1.actors_["1052ui_story"]
			local var_159_10 = 0

			if var_159_10 < arg_156_1.time_ and arg_156_1.time_ <= var_159_10 + arg_159_0 and not isNil(var_159_9) and arg_156_1.var_.characterEffect1052ui_story == nil then
				arg_156_1.var_.characterEffect1052ui_story = var_159_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_159_11 = 0.200000002980232

			if var_159_10 <= arg_156_1.time_ and arg_156_1.time_ < var_159_10 + var_159_11 and not isNil(var_159_9) then
				local var_159_12 = (arg_156_1.time_ - var_159_10) / var_159_11

				if arg_156_1.var_.characterEffect1052ui_story and not isNil(var_159_9) then
					local var_159_13 = Mathf.Lerp(0, 0.5, var_159_12)

					arg_156_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_156_1.var_.characterEffect1052ui_story.fillRatio = var_159_13
				end
			end

			if arg_156_1.time_ >= var_159_10 + var_159_11 and arg_156_1.time_ < var_159_10 + var_159_11 + arg_159_0 and not isNil(var_159_9) and arg_156_1.var_.characterEffect1052ui_story then
				local var_159_14 = 0.5

				arg_156_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_156_1.var_.characterEffect1052ui_story.fillRatio = var_159_14
			end

			local var_159_15 = arg_156_1.actors_["1095ui_story"].transform
			local var_159_16 = 0

			if var_159_16 < arg_156_1.time_ and arg_156_1.time_ <= var_159_16 + arg_159_0 then
				arg_156_1.var_.moveOldPos1095ui_story = var_159_15.localPosition
			end

			local var_159_17 = 0.001

			if var_159_16 <= arg_156_1.time_ and arg_156_1.time_ < var_159_16 + var_159_17 then
				local var_159_18 = (arg_156_1.time_ - var_159_16) / var_159_17
				local var_159_19 = Vector3.New(0, 100, 0)

				var_159_15.localPosition = Vector3.Lerp(arg_156_1.var_.moveOldPos1095ui_story, var_159_19, var_159_18)

				local var_159_20 = manager.ui.mainCamera.transform.position - var_159_15.position

				var_159_15.forward = Vector3.New(var_159_20.x, var_159_20.y, var_159_20.z)

				local var_159_21 = var_159_15.localEulerAngles

				var_159_21.z = 0
				var_159_21.x = 0
				var_159_15.localEulerAngles = var_159_21
			end

			if arg_156_1.time_ >= var_159_16 + var_159_17 and arg_156_1.time_ < var_159_16 + var_159_17 + arg_159_0 then
				var_159_15.localPosition = Vector3.New(0, 100, 0)

				local var_159_22 = manager.ui.mainCamera.transform.position - var_159_15.position

				var_159_15.forward = Vector3.New(var_159_22.x, var_159_22.y, var_159_22.z)

				local var_159_23 = var_159_15.localEulerAngles

				var_159_23.z = 0
				var_159_23.x = 0
				var_159_15.localEulerAngles = var_159_23
			end

			local var_159_24 = arg_156_1.actors_["1052ui_story"]
			local var_159_25 = 0

			if var_159_25 < arg_156_1.time_ and arg_156_1.time_ <= var_159_25 + arg_159_0 and not isNil(var_159_24) and arg_156_1.var_.characterEffect1052ui_story == nil then
				arg_156_1.var_.characterEffect1052ui_story = var_159_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_159_26 = 0.200000002980232

			if var_159_25 <= arg_156_1.time_ and arg_156_1.time_ < var_159_25 + var_159_26 and not isNil(var_159_24) then
				local var_159_27 = (arg_156_1.time_ - var_159_25) / var_159_26

				if arg_156_1.var_.characterEffect1052ui_story and not isNil(var_159_24) then
					local var_159_28 = Mathf.Lerp(0, 0.5, var_159_27)

					arg_156_1.var_.characterEffect1052ui_story.fillFlat = true
					arg_156_1.var_.characterEffect1052ui_story.fillRatio = var_159_28
				end
			end

			if arg_156_1.time_ >= var_159_25 + var_159_26 and arg_156_1.time_ < var_159_25 + var_159_26 + arg_159_0 and not isNil(var_159_24) and arg_156_1.var_.characterEffect1052ui_story then
				local var_159_29 = 0.5

				arg_156_1.var_.characterEffect1052ui_story.fillFlat = true
				arg_156_1.var_.characterEffect1052ui_story.fillRatio = var_159_29
			end

			local var_159_30 = 0
			local var_159_31 = 0.975

			if var_159_30 < arg_156_1.time_ and arg_156_1.time_ <= var_159_30 + arg_159_0 then
				arg_156_1.talkMaxDuration = 0
				arg_156_1.dialogCg_.alpha = 1

				arg_156_1.dialog_:SetActive(true)
				SetActive(arg_156_1.leftNameGo_, false)

				arg_156_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_156_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_156_1:RecordName(arg_156_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_156_1.iconTrs_.gameObject, false)
				arg_156_1.callingController_:SetSelectedState("normal")

				local var_159_32 = arg_156_1:GetWordFromCfg(411151038)
				local var_159_33 = arg_156_1:FormatText(var_159_32.content)

				arg_156_1.text_.text = var_159_33

				LuaForUtil.ClearLinePrefixSymbol(arg_156_1.text_)

				local var_159_34 = 39
				local var_159_35 = utf8.len(var_159_33)
				local var_159_36 = var_159_34 <= 0 and var_159_31 or var_159_31 * (var_159_35 / var_159_34)

				if var_159_36 > 0 and var_159_31 < var_159_36 then
					arg_156_1.talkMaxDuration = var_159_36

					if var_159_36 + var_159_30 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_36 + var_159_30
					end
				end

				arg_156_1.text_.text = var_159_33
				arg_156_1.typewritter.percent = 0

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(false)
				arg_156_1:RecordContent(arg_156_1.text_.text)
			end

			local var_159_37 = math.max(var_159_31, arg_156_1.talkMaxDuration)

			if var_159_30 <= arg_156_1.time_ and arg_156_1.time_ < var_159_30 + var_159_37 then
				arg_156_1.typewritter.percent = (arg_156_1.time_ - var_159_30) / var_159_37

				arg_156_1.typewritter:SetDirty()
			end

			if arg_156_1.time_ >= var_159_30 + var_159_37 and arg_156_1.time_ < var_159_30 + var_159_37 + arg_159_0 then
				arg_156_1.typewritter.percent = 1

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(true)
			end
		end
	end,
	Play411151039 = function(arg_160_0, arg_160_1)
		arg_160_1.time_ = 0
		arg_160_1.frameCnt_ = 0
		arg_160_1.state_ = "playing"
		arg_160_1.curTalkId_ = 411151039
		arg_160_1.duration_ = 14.7

		local var_160_0 = {
			zh = 14.6996666666667,
			ja = 14.0666666666667
		}
		local var_160_1 = manager.audio:GetLocalizationFlag()

		if var_160_0[var_160_1] ~= nil then
			arg_160_1.duration_ = var_160_0[var_160_1]
		end

		SetActive(arg_160_1.tipsGo_, false)

		function arg_160_1.onSingleLineFinish_()
			arg_160_1.onSingleLineUpdate_ = nil
			arg_160_1.onSingleLineFinish_ = nil
			arg_160_1.state_ = "waiting"
		end

		function arg_160_1.playNext_(arg_162_0)
			if arg_162_0 == 1 then
				arg_160_0:Play411151040(arg_160_1)
			end
		end

		function arg_160_1.onSingleLineUpdate_(arg_163_0)
			local var_163_0 = arg_160_1.actors_["1095ui_story"].transform
			local var_163_1 = 3.06666666666667

			if var_163_1 < arg_160_1.time_ and arg_160_1.time_ <= var_163_1 + arg_163_0 then
				arg_160_1.var_.moveOldPos1095ui_story = var_163_0.localPosition
			end

			local var_163_2 = 0.001

			if var_163_1 <= arg_160_1.time_ and arg_160_1.time_ < var_163_1 + var_163_2 then
				local var_163_3 = (arg_160_1.time_ - var_163_1) / var_163_2
				local var_163_4 = Vector3.New(0, -0.98, -6.1)

				var_163_0.localPosition = Vector3.Lerp(arg_160_1.var_.moveOldPos1095ui_story, var_163_4, var_163_3)

				local var_163_5 = manager.ui.mainCamera.transform.position - var_163_0.position

				var_163_0.forward = Vector3.New(var_163_5.x, var_163_5.y, var_163_5.z)

				local var_163_6 = var_163_0.localEulerAngles

				var_163_6.z = 0
				var_163_6.x = 0
				var_163_0.localEulerAngles = var_163_6
			end

			if arg_160_1.time_ >= var_163_1 + var_163_2 and arg_160_1.time_ < var_163_1 + var_163_2 + arg_163_0 then
				var_163_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_163_7 = manager.ui.mainCamera.transform.position - var_163_0.position

				var_163_0.forward = Vector3.New(var_163_7.x, var_163_7.y, var_163_7.z)

				local var_163_8 = var_163_0.localEulerAngles

				var_163_8.z = 0
				var_163_8.x = 0
				var_163_0.localEulerAngles = var_163_8
			end

			local var_163_9 = arg_160_1.actors_["1095ui_story"]
			local var_163_10 = 3.06666666666667

			if var_163_10 < arg_160_1.time_ and arg_160_1.time_ <= var_163_10 + arg_163_0 and not isNil(var_163_9) and arg_160_1.var_.characterEffect1095ui_story == nil then
				arg_160_1.var_.characterEffect1095ui_story = var_163_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_163_11 = 0.200000002980232

			if var_163_10 <= arg_160_1.time_ and arg_160_1.time_ < var_163_10 + var_163_11 and not isNil(var_163_9) then
				local var_163_12 = (arg_160_1.time_ - var_163_10) / var_163_11

				if arg_160_1.var_.characterEffect1095ui_story and not isNil(var_163_9) then
					arg_160_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_160_1.time_ >= var_163_10 + var_163_11 and arg_160_1.time_ < var_163_10 + var_163_11 + arg_163_0 and not isNil(var_163_9) and arg_160_1.var_.characterEffect1095ui_story then
				arg_160_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_163_13 = 3.06666666666667

			if var_163_13 < arg_160_1.time_ and arg_160_1.time_ <= var_163_13 + arg_163_0 then
				arg_160_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_163_14 = 3.06666666666667

			if var_163_14 < arg_160_1.time_ and arg_160_1.time_ <= var_163_14 + arg_163_0 then
				arg_160_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_163_15 = 2

			if var_163_15 < arg_160_1.time_ and arg_160_1.time_ <= var_163_15 + arg_163_0 then
				local var_163_16 = manager.ui.mainCamera.transform.localPosition
				local var_163_17 = Vector3.New(0, 0, 10) + Vector3.New(var_163_16.x, var_163_16.y, 0)
				local var_163_18 = arg_160_1.bgs_.ST74a

				var_163_18.transform.localPosition = var_163_17
				var_163_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_163_19 = var_163_18:GetComponent("SpriteRenderer")

				if var_163_19 and var_163_19.sprite then
					local var_163_20 = (var_163_18.transform.localPosition - var_163_16).z
					local var_163_21 = manager.ui.mainCameraCom_
					local var_163_22 = 2 * var_163_20 * Mathf.Tan(var_163_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_163_23 = var_163_22 * var_163_21.aspect
					local var_163_24 = var_163_19.sprite.bounds.size.x
					local var_163_25 = var_163_19.sprite.bounds.size.y
					local var_163_26 = var_163_23 / var_163_24
					local var_163_27 = var_163_22 / var_163_25
					local var_163_28 = var_163_27 < var_163_26 and var_163_26 or var_163_27

					var_163_18.transform.localScale = Vector3.New(var_163_28, var_163_28, 0)
				end

				for iter_163_0, iter_163_1 in pairs(arg_160_1.bgs_) do
					if iter_163_0 ~= "ST74a" then
						iter_163_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_163_29 = 0

			if var_163_29 < arg_160_1.time_ and arg_160_1.time_ <= var_163_29 + arg_163_0 then
				arg_160_1.mask_.enabled = true
				arg_160_1.mask_.raycastTarget = true

				arg_160_1:SetGaussion(false)
			end

			local var_163_30 = 2

			if var_163_29 <= arg_160_1.time_ and arg_160_1.time_ < var_163_29 + var_163_30 then
				local var_163_31 = (arg_160_1.time_ - var_163_29) / var_163_30
				local var_163_32 = Color.New(0, 0, 0)

				var_163_32.a = Mathf.Lerp(0, 1, var_163_31)
				arg_160_1.mask_.color = var_163_32
			end

			if arg_160_1.time_ >= var_163_29 + var_163_30 and arg_160_1.time_ < var_163_29 + var_163_30 + arg_163_0 then
				local var_163_33 = Color.New(0, 0, 0)

				var_163_33.a = 1
				arg_160_1.mask_.color = var_163_33
			end

			local var_163_34 = 2

			if var_163_34 < arg_160_1.time_ and arg_160_1.time_ <= var_163_34 + arg_163_0 then
				arg_160_1.mask_.enabled = true
				arg_160_1.mask_.raycastTarget = true

				arg_160_1:SetGaussion(false)
			end

			local var_163_35 = 2

			if var_163_34 <= arg_160_1.time_ and arg_160_1.time_ < var_163_34 + var_163_35 then
				local var_163_36 = (arg_160_1.time_ - var_163_34) / var_163_35
				local var_163_37 = Color.New(0, 0, 0)

				var_163_37.a = Mathf.Lerp(1, 0, var_163_36)
				arg_160_1.mask_.color = var_163_37
			end

			if arg_160_1.time_ >= var_163_34 + var_163_35 and arg_160_1.time_ < var_163_34 + var_163_35 + arg_163_0 then
				local var_163_38 = Color.New(0, 0, 0)
				local var_163_39 = 0

				arg_160_1.mask_.enabled = false
				var_163_38.a = var_163_39
				arg_160_1.mask_.color = var_163_38
			end

			if arg_160_1.frameCnt_ <= 1 then
				arg_160_1.dialog_:SetActive(false)
			end

			local var_163_40 = 3.06666666666667
			local var_163_41 = 0.925

			if var_163_40 < arg_160_1.time_ and arg_160_1.time_ <= var_163_40 + arg_163_0 then
				arg_160_1.talkMaxDuration = 0

				arg_160_1.dialog_:SetActive(true)

				local var_163_42 = LeanTween.value(arg_160_1.dialog_, 0, 1, 0.3)

				var_163_42:setOnUpdate(LuaHelper.FloatAction(function(arg_164_0)
					arg_160_1.dialogCg_.alpha = arg_164_0
				end))
				var_163_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_160_1.dialog_)
					var_163_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_160_1.duration_ = arg_160_1.duration_ + 0.3

				SetActive(arg_160_1.leftNameGo_, true)

				local var_163_43 = arg_160_1:FormatText(StoryNameCfg[471].name)

				arg_160_1.leftNameTxt_.text = var_163_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_160_1.leftNameTxt_.transform)

				arg_160_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_160_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_160_1:RecordName(arg_160_1.leftNameTxt_.text)
				SetActive(arg_160_1.iconTrs_.gameObject, false)
				arg_160_1.callingController_:SetSelectedState("normal")

				local var_163_44 = arg_160_1:GetWordFromCfg(411151039)
				local var_163_45 = arg_160_1:FormatText(var_163_44.content)

				arg_160_1.text_.text = var_163_45

				LuaForUtil.ClearLinePrefixSymbol(arg_160_1.text_)

				local var_163_46 = 37
				local var_163_47 = utf8.len(var_163_45)
				local var_163_48 = var_163_46 <= 0 and var_163_41 or var_163_41 * (var_163_47 / var_163_46)

				if var_163_48 > 0 and var_163_41 < var_163_48 then
					arg_160_1.talkMaxDuration = var_163_48
					var_163_40 = var_163_40 + 0.3

					if var_163_48 + var_163_40 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_48 + var_163_40
					end
				end

				arg_160_1.text_.text = var_163_45
				arg_160_1.typewritter.percent = 0

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151039", "story_v_out_411151.awb") ~= 0 then
					local var_163_49 = manager.audio:GetVoiceLength("story_v_out_411151", "411151039", "story_v_out_411151.awb") / 1000

					if var_163_49 + var_163_40 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_49 + var_163_40
					end

					if var_163_44.prefab_name ~= "" and arg_160_1.actors_[var_163_44.prefab_name] ~= nil then
						local var_163_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_160_1.actors_[var_163_44.prefab_name].transform, "story_v_out_411151", "411151039", "story_v_out_411151.awb")

						arg_160_1:RecordAudio("411151039", var_163_50)
						arg_160_1:RecordAudio("411151039", var_163_50)
					else
						arg_160_1:AudioAction("play", "voice", "story_v_out_411151", "411151039", "story_v_out_411151.awb")
					end

					arg_160_1:RecordHistoryTalkVoice("story_v_out_411151", "411151039", "story_v_out_411151.awb")
				end

				arg_160_1:RecordContent(arg_160_1.text_.text)
			end

			local var_163_51 = var_163_40 + 0.3
			local var_163_52 = math.max(var_163_41, arg_160_1.talkMaxDuration)

			if var_163_51 <= arg_160_1.time_ and arg_160_1.time_ < var_163_51 + var_163_52 then
				arg_160_1.typewritter.percent = (arg_160_1.time_ - var_163_51) / var_163_52

				arg_160_1.typewritter:SetDirty()
			end

			if arg_160_1.time_ >= var_163_51 + var_163_52 and arg_160_1.time_ < var_163_51 + var_163_52 + arg_163_0 then
				arg_160_1.typewritter.percent = 1

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(true)
			end
		end
	end,
	Play411151040 = function(arg_166_0, arg_166_1)
		arg_166_1.time_ = 0
		arg_166_1.frameCnt_ = 0
		arg_166_1.state_ = "playing"
		arg_166_1.curTalkId_ = 411151040
		arg_166_1.duration_ = 4.27

		local var_166_0 = {
			zh = 4.266,
			ja = 3.7
		}
		local var_166_1 = manager.audio:GetLocalizationFlag()

		if var_166_0[var_166_1] ~= nil then
			arg_166_1.duration_ = var_166_0[var_166_1]
		end

		SetActive(arg_166_1.tipsGo_, false)

		function arg_166_1.onSingleLineFinish_()
			arg_166_1.onSingleLineUpdate_ = nil
			arg_166_1.onSingleLineFinish_ = nil
			arg_166_1.state_ = "waiting"
		end

		function arg_166_1.playNext_(arg_168_0)
			if arg_168_0 == 1 then
				arg_166_0:Play411151041(arg_166_1)
			end
		end

		function arg_166_1.onSingleLineUpdate_(arg_169_0)
			local var_169_0 = 0

			if var_169_0 < arg_166_1.time_ and arg_166_1.time_ <= var_169_0 + arg_169_0 then
				arg_166_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_169_1 = 0

			if var_169_1 < arg_166_1.time_ and arg_166_1.time_ <= var_169_1 + arg_169_0 then
				arg_166_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_169_2 = 0
			local var_169_3 = 0.275

			if var_169_2 < arg_166_1.time_ and arg_166_1.time_ <= var_169_2 + arg_169_0 then
				arg_166_1.talkMaxDuration = 0
				arg_166_1.dialogCg_.alpha = 1

				arg_166_1.dialog_:SetActive(true)
				SetActive(arg_166_1.leftNameGo_, true)

				local var_169_4 = arg_166_1:FormatText(StoryNameCfg[471].name)

				arg_166_1.leftNameTxt_.text = var_169_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_166_1.leftNameTxt_.transform)

				arg_166_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_166_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_166_1:RecordName(arg_166_1.leftNameTxt_.text)
				SetActive(arg_166_1.iconTrs_.gameObject, false)
				arg_166_1.callingController_:SetSelectedState("normal")

				local var_169_5 = arg_166_1:GetWordFromCfg(411151040)
				local var_169_6 = arg_166_1:FormatText(var_169_5.content)

				arg_166_1.text_.text = var_169_6

				LuaForUtil.ClearLinePrefixSymbol(arg_166_1.text_)

				local var_169_7 = 11
				local var_169_8 = utf8.len(var_169_6)
				local var_169_9 = var_169_7 <= 0 and var_169_3 or var_169_3 * (var_169_8 / var_169_7)

				if var_169_9 > 0 and var_169_3 < var_169_9 then
					arg_166_1.talkMaxDuration = var_169_9

					if var_169_9 + var_169_2 > arg_166_1.duration_ then
						arg_166_1.duration_ = var_169_9 + var_169_2
					end
				end

				arg_166_1.text_.text = var_169_6
				arg_166_1.typewritter.percent = 0

				arg_166_1.typewritter:SetDirty()
				arg_166_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151040", "story_v_out_411151.awb") ~= 0 then
					local var_169_10 = manager.audio:GetVoiceLength("story_v_out_411151", "411151040", "story_v_out_411151.awb") / 1000

					if var_169_10 + var_169_2 > arg_166_1.duration_ then
						arg_166_1.duration_ = var_169_10 + var_169_2
					end

					if var_169_5.prefab_name ~= "" and arg_166_1.actors_[var_169_5.prefab_name] ~= nil then
						local var_169_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_166_1.actors_[var_169_5.prefab_name].transform, "story_v_out_411151", "411151040", "story_v_out_411151.awb")

						arg_166_1:RecordAudio("411151040", var_169_11)
						arg_166_1:RecordAudio("411151040", var_169_11)
					else
						arg_166_1:AudioAction("play", "voice", "story_v_out_411151", "411151040", "story_v_out_411151.awb")
					end

					arg_166_1:RecordHistoryTalkVoice("story_v_out_411151", "411151040", "story_v_out_411151.awb")
				end

				arg_166_1:RecordContent(arg_166_1.text_.text)
			end

			local var_169_12 = math.max(var_169_3, arg_166_1.talkMaxDuration)

			if var_169_2 <= arg_166_1.time_ and arg_166_1.time_ < var_169_2 + var_169_12 then
				arg_166_1.typewritter.percent = (arg_166_1.time_ - var_169_2) / var_169_12

				arg_166_1.typewritter:SetDirty()
			end

			if arg_166_1.time_ >= var_169_2 + var_169_12 and arg_166_1.time_ < var_169_2 + var_169_12 + arg_169_0 then
				arg_166_1.typewritter.percent = 1

				arg_166_1.typewritter:SetDirty()
				arg_166_1:ShowNextGo(true)
			end
		end
	end,
	Play411151041 = function(arg_170_0, arg_170_1)
		arg_170_1.time_ = 0
		arg_170_1.frameCnt_ = 0
		arg_170_1.state_ = "playing"
		arg_170_1.curTalkId_ = 411151041
		arg_170_1.duration_ = 5

		SetActive(arg_170_1.tipsGo_, false)

		function arg_170_1.onSingleLineFinish_()
			arg_170_1.onSingleLineUpdate_ = nil
			arg_170_1.onSingleLineFinish_ = nil
			arg_170_1.state_ = "waiting"
		end

		function arg_170_1.playNext_(arg_172_0)
			if arg_172_0 == 1 then
				arg_170_0:Play411151042(arg_170_1)
			end
		end

		function arg_170_1.onSingleLineUpdate_(arg_173_0)
			local var_173_0 = arg_170_1.actors_["1095ui_story"]
			local var_173_1 = 0

			if var_173_1 < arg_170_1.time_ and arg_170_1.time_ <= var_173_1 + arg_173_0 and not isNil(var_173_0) and arg_170_1.var_.characterEffect1095ui_story == nil then
				arg_170_1.var_.characterEffect1095ui_story = var_173_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_173_2 = 0.200000002980232

			if var_173_1 <= arg_170_1.time_ and arg_170_1.time_ < var_173_1 + var_173_2 and not isNil(var_173_0) then
				local var_173_3 = (arg_170_1.time_ - var_173_1) / var_173_2

				if arg_170_1.var_.characterEffect1095ui_story and not isNil(var_173_0) then
					local var_173_4 = Mathf.Lerp(0, 0.5, var_173_3)

					arg_170_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_170_1.var_.characterEffect1095ui_story.fillRatio = var_173_4
				end
			end

			if arg_170_1.time_ >= var_173_1 + var_173_2 and arg_170_1.time_ < var_173_1 + var_173_2 + arg_173_0 and not isNil(var_173_0) and arg_170_1.var_.characterEffect1095ui_story then
				local var_173_5 = 0.5

				arg_170_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_170_1.var_.characterEffect1095ui_story.fillRatio = var_173_5
			end

			local var_173_6 = 0
			local var_173_7 = 0.55

			if var_173_6 < arg_170_1.time_ and arg_170_1.time_ <= var_173_6 + arg_173_0 then
				arg_170_1.talkMaxDuration = 0
				arg_170_1.dialogCg_.alpha = 1

				arg_170_1.dialog_:SetActive(true)
				SetActive(arg_170_1.leftNameGo_, false)

				arg_170_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_170_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_170_1:RecordName(arg_170_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_170_1.iconTrs_.gameObject, false)
				arg_170_1.callingController_:SetSelectedState("normal")

				local var_173_8 = arg_170_1:GetWordFromCfg(411151041)
				local var_173_9 = arg_170_1:FormatText(var_173_8.content)

				arg_170_1.text_.text = var_173_9

				LuaForUtil.ClearLinePrefixSymbol(arg_170_1.text_)

				local var_173_10 = 22
				local var_173_11 = utf8.len(var_173_9)
				local var_173_12 = var_173_10 <= 0 and var_173_7 or var_173_7 * (var_173_11 / var_173_10)

				if var_173_12 > 0 and var_173_7 < var_173_12 then
					arg_170_1.talkMaxDuration = var_173_12

					if var_173_12 + var_173_6 > arg_170_1.duration_ then
						arg_170_1.duration_ = var_173_12 + var_173_6
					end
				end

				arg_170_1.text_.text = var_173_9
				arg_170_1.typewritter.percent = 0

				arg_170_1.typewritter:SetDirty()
				arg_170_1:ShowNextGo(false)
				arg_170_1:RecordContent(arg_170_1.text_.text)
			end

			local var_173_13 = math.max(var_173_7, arg_170_1.talkMaxDuration)

			if var_173_6 <= arg_170_1.time_ and arg_170_1.time_ < var_173_6 + var_173_13 then
				arg_170_1.typewritter.percent = (arg_170_1.time_ - var_173_6) / var_173_13

				arg_170_1.typewritter:SetDirty()
			end

			if arg_170_1.time_ >= var_173_6 + var_173_13 and arg_170_1.time_ < var_173_6 + var_173_13 + arg_173_0 then
				arg_170_1.typewritter.percent = 1

				arg_170_1.typewritter:SetDirty()
				arg_170_1:ShowNextGo(true)
			end
		end
	end,
	Play411151042 = function(arg_174_0, arg_174_1)
		arg_174_1.time_ = 0
		arg_174_1.frameCnt_ = 0
		arg_174_1.state_ = "playing"
		arg_174_1.curTalkId_ = 411151042
		arg_174_1.duration_ = 3.07

		local var_174_0 = {
			zh = 0.999999999999,
			ja = 3.066
		}
		local var_174_1 = manager.audio:GetLocalizationFlag()

		if var_174_0[var_174_1] ~= nil then
			arg_174_1.duration_ = var_174_0[var_174_1]
		end

		SetActive(arg_174_1.tipsGo_, false)

		function arg_174_1.onSingleLineFinish_()
			arg_174_1.onSingleLineUpdate_ = nil
			arg_174_1.onSingleLineFinish_ = nil
			arg_174_1.state_ = "waiting"
		end

		function arg_174_1.playNext_(arg_176_0)
			if arg_176_0 == 1 then
				arg_174_0:Play411151043(arg_174_1)
			end
		end

		function arg_174_1.onSingleLineUpdate_(arg_177_0)
			local var_177_0 = arg_174_1.actors_["1095ui_story"]
			local var_177_1 = 0

			if var_177_1 < arg_174_1.time_ and arg_174_1.time_ <= var_177_1 + arg_177_0 and not isNil(var_177_0) and arg_174_1.var_.characterEffect1095ui_story == nil then
				arg_174_1.var_.characterEffect1095ui_story = var_177_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_177_2 = 0.200000002980232

			if var_177_1 <= arg_174_1.time_ and arg_174_1.time_ < var_177_1 + var_177_2 and not isNil(var_177_0) then
				local var_177_3 = (arg_174_1.time_ - var_177_1) / var_177_2

				if arg_174_1.var_.characterEffect1095ui_story and not isNil(var_177_0) then
					arg_174_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_174_1.time_ >= var_177_1 + var_177_2 and arg_174_1.time_ < var_177_1 + var_177_2 + arg_177_0 and not isNil(var_177_0) and arg_174_1.var_.characterEffect1095ui_story then
				arg_174_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_177_4 = 0
			local var_177_5 = 0.1

			if var_177_4 < arg_174_1.time_ and arg_174_1.time_ <= var_177_4 + arg_177_0 then
				arg_174_1.talkMaxDuration = 0
				arg_174_1.dialogCg_.alpha = 1

				arg_174_1.dialog_:SetActive(true)
				SetActive(arg_174_1.leftNameGo_, true)

				local var_177_6 = arg_174_1:FormatText(StoryNameCfg[471].name)

				arg_174_1.leftNameTxt_.text = var_177_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_174_1.leftNameTxt_.transform)

				arg_174_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_174_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_174_1:RecordName(arg_174_1.leftNameTxt_.text)
				SetActive(arg_174_1.iconTrs_.gameObject, false)
				arg_174_1.callingController_:SetSelectedState("normal")

				local var_177_7 = arg_174_1:GetWordFromCfg(411151042)
				local var_177_8 = arg_174_1:FormatText(var_177_7.content)

				arg_174_1.text_.text = var_177_8

				LuaForUtil.ClearLinePrefixSymbol(arg_174_1.text_)

				local var_177_9 = 4
				local var_177_10 = utf8.len(var_177_8)
				local var_177_11 = var_177_9 <= 0 and var_177_5 or var_177_5 * (var_177_10 / var_177_9)

				if var_177_11 > 0 and var_177_5 < var_177_11 then
					arg_174_1.talkMaxDuration = var_177_11

					if var_177_11 + var_177_4 > arg_174_1.duration_ then
						arg_174_1.duration_ = var_177_11 + var_177_4
					end
				end

				arg_174_1.text_.text = var_177_8
				arg_174_1.typewritter.percent = 0

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151042", "story_v_out_411151.awb") ~= 0 then
					local var_177_12 = manager.audio:GetVoiceLength("story_v_out_411151", "411151042", "story_v_out_411151.awb") / 1000

					if var_177_12 + var_177_4 > arg_174_1.duration_ then
						arg_174_1.duration_ = var_177_12 + var_177_4
					end

					if var_177_7.prefab_name ~= "" and arg_174_1.actors_[var_177_7.prefab_name] ~= nil then
						local var_177_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_174_1.actors_[var_177_7.prefab_name].transform, "story_v_out_411151", "411151042", "story_v_out_411151.awb")

						arg_174_1:RecordAudio("411151042", var_177_13)
						arg_174_1:RecordAudio("411151042", var_177_13)
					else
						arg_174_1:AudioAction("play", "voice", "story_v_out_411151", "411151042", "story_v_out_411151.awb")
					end

					arg_174_1:RecordHistoryTalkVoice("story_v_out_411151", "411151042", "story_v_out_411151.awb")
				end

				arg_174_1:RecordContent(arg_174_1.text_.text)
			end

			local var_177_14 = math.max(var_177_5, arg_174_1.talkMaxDuration)

			if var_177_4 <= arg_174_1.time_ and arg_174_1.time_ < var_177_4 + var_177_14 then
				arg_174_1.typewritter.percent = (arg_174_1.time_ - var_177_4) / var_177_14

				arg_174_1.typewritter:SetDirty()
			end

			if arg_174_1.time_ >= var_177_4 + var_177_14 and arg_174_1.time_ < var_177_4 + var_177_14 + arg_177_0 then
				arg_174_1.typewritter.percent = 1

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(true)
			end
		end
	end,
	Play411151043 = function(arg_178_0, arg_178_1)
		arg_178_1.time_ = 0
		arg_178_1.frameCnt_ = 0
		arg_178_1.state_ = "playing"
		arg_178_1.curTalkId_ = 411151043
		arg_178_1.duration_ = 5

		SetActive(arg_178_1.tipsGo_, false)

		function arg_178_1.onSingleLineFinish_()
			arg_178_1.onSingleLineUpdate_ = nil
			arg_178_1.onSingleLineFinish_ = nil
			arg_178_1.state_ = "waiting"
		end

		function arg_178_1.playNext_(arg_180_0)
			if arg_180_0 == 1 then
				arg_178_0:Play411151044(arg_178_1)
			end
		end

		function arg_178_1.onSingleLineUpdate_(arg_181_0)
			local var_181_0 = arg_178_1.actors_["1095ui_story"]
			local var_181_1 = 0

			if var_181_1 < arg_178_1.time_ and arg_178_1.time_ <= var_181_1 + arg_181_0 and not isNil(var_181_0) and arg_178_1.var_.characterEffect1095ui_story == nil then
				arg_178_1.var_.characterEffect1095ui_story = var_181_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_181_2 = 0.200000002980232

			if var_181_1 <= arg_178_1.time_ and arg_178_1.time_ < var_181_1 + var_181_2 and not isNil(var_181_0) then
				local var_181_3 = (arg_178_1.time_ - var_181_1) / var_181_2

				if arg_178_1.var_.characterEffect1095ui_story and not isNil(var_181_0) then
					local var_181_4 = Mathf.Lerp(0, 0.5, var_181_3)

					arg_178_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_178_1.var_.characterEffect1095ui_story.fillRatio = var_181_4
				end
			end

			if arg_178_1.time_ >= var_181_1 + var_181_2 and arg_178_1.time_ < var_181_1 + var_181_2 + arg_181_0 and not isNil(var_181_0) and arg_178_1.var_.characterEffect1095ui_story then
				local var_181_5 = 0.5

				arg_178_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_178_1.var_.characterEffect1095ui_story.fillRatio = var_181_5
			end

			local var_181_6 = arg_178_1.actors_["1095ui_story"].transform
			local var_181_7 = 0

			if var_181_7 < arg_178_1.time_ and arg_178_1.time_ <= var_181_7 + arg_181_0 then
				arg_178_1.var_.moveOldPos1095ui_story = var_181_6.localPosition
			end

			local var_181_8 = 0.001

			if var_181_7 <= arg_178_1.time_ and arg_178_1.time_ < var_181_7 + var_181_8 then
				local var_181_9 = (arg_178_1.time_ - var_181_7) / var_181_8
				local var_181_10 = Vector3.New(0, 100, 0)

				var_181_6.localPosition = Vector3.Lerp(arg_178_1.var_.moveOldPos1095ui_story, var_181_10, var_181_9)

				local var_181_11 = manager.ui.mainCamera.transform.position - var_181_6.position

				var_181_6.forward = Vector3.New(var_181_11.x, var_181_11.y, var_181_11.z)

				local var_181_12 = var_181_6.localEulerAngles

				var_181_12.z = 0
				var_181_12.x = 0
				var_181_6.localEulerAngles = var_181_12
			end

			if arg_178_1.time_ >= var_181_7 + var_181_8 and arg_178_1.time_ < var_181_7 + var_181_8 + arg_181_0 then
				var_181_6.localPosition = Vector3.New(0, 100, 0)

				local var_181_13 = manager.ui.mainCamera.transform.position - var_181_6.position

				var_181_6.forward = Vector3.New(var_181_13.x, var_181_13.y, var_181_13.z)

				local var_181_14 = var_181_6.localEulerAngles

				var_181_14.z = 0
				var_181_14.x = 0
				var_181_6.localEulerAngles = var_181_14
			end

			local var_181_15 = 0
			local var_181_16 = 0.9

			if var_181_15 < arg_178_1.time_ and arg_178_1.time_ <= var_181_15 + arg_181_0 then
				arg_178_1.talkMaxDuration = 0
				arg_178_1.dialogCg_.alpha = 1

				arg_178_1.dialog_:SetActive(true)
				SetActive(arg_178_1.leftNameGo_, false)

				arg_178_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_178_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_178_1:RecordName(arg_178_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_178_1.iconTrs_.gameObject, false)
				arg_178_1.callingController_:SetSelectedState("normal")

				local var_181_17 = arg_178_1:GetWordFromCfg(411151043)
				local var_181_18 = arg_178_1:FormatText(var_181_17.content)

				arg_178_1.text_.text = var_181_18

				LuaForUtil.ClearLinePrefixSymbol(arg_178_1.text_)

				local var_181_19 = 36
				local var_181_20 = utf8.len(var_181_18)
				local var_181_21 = var_181_19 <= 0 and var_181_16 or var_181_16 * (var_181_20 / var_181_19)

				if var_181_21 > 0 and var_181_16 < var_181_21 then
					arg_178_1.talkMaxDuration = var_181_21

					if var_181_21 + var_181_15 > arg_178_1.duration_ then
						arg_178_1.duration_ = var_181_21 + var_181_15
					end
				end

				arg_178_1.text_.text = var_181_18
				arg_178_1.typewritter.percent = 0

				arg_178_1.typewritter:SetDirty()
				arg_178_1:ShowNextGo(false)
				arg_178_1:RecordContent(arg_178_1.text_.text)
			end

			local var_181_22 = math.max(var_181_16, arg_178_1.talkMaxDuration)

			if var_181_15 <= arg_178_1.time_ and arg_178_1.time_ < var_181_15 + var_181_22 then
				arg_178_1.typewritter.percent = (arg_178_1.time_ - var_181_15) / var_181_22

				arg_178_1.typewritter:SetDirty()
			end

			if arg_178_1.time_ >= var_181_15 + var_181_22 and arg_178_1.time_ < var_181_15 + var_181_22 + arg_181_0 then
				arg_178_1.typewritter.percent = 1

				arg_178_1.typewritter:SetDirty()
				arg_178_1:ShowNextGo(true)
			end
		end
	end,
	Play411151044 = function(arg_182_0, arg_182_1)
		arg_182_1.time_ = 0
		arg_182_1.frameCnt_ = 0
		arg_182_1.state_ = "playing"
		arg_182_1.curTalkId_ = 411151044
		arg_182_1.duration_ = 5

		SetActive(arg_182_1.tipsGo_, false)

		function arg_182_1.onSingleLineFinish_()
			arg_182_1.onSingleLineUpdate_ = nil
			arg_182_1.onSingleLineFinish_ = nil
			arg_182_1.state_ = "waiting"
		end

		function arg_182_1.playNext_(arg_184_0)
			if arg_184_0 == 1 then
				arg_182_0:Play411151045(arg_182_1)
			end
		end

		function arg_182_1.onSingleLineUpdate_(arg_185_0)
			local var_185_0 = 0
			local var_185_1 = 0.85

			if var_185_0 < arg_182_1.time_ and arg_182_1.time_ <= var_185_0 + arg_185_0 then
				arg_182_1.talkMaxDuration = 0
				arg_182_1.dialogCg_.alpha = 1

				arg_182_1.dialog_:SetActive(true)
				SetActive(arg_182_1.leftNameGo_, false)

				arg_182_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_182_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_182_1:RecordName(arg_182_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_182_1.iconTrs_.gameObject, false)
				arg_182_1.callingController_:SetSelectedState("normal")

				local var_185_2 = arg_182_1:GetWordFromCfg(411151044)
				local var_185_3 = arg_182_1:FormatText(var_185_2.content)

				arg_182_1.text_.text = var_185_3

				LuaForUtil.ClearLinePrefixSymbol(arg_182_1.text_)

				local var_185_4 = 34
				local var_185_5 = utf8.len(var_185_3)
				local var_185_6 = var_185_4 <= 0 and var_185_1 or var_185_1 * (var_185_5 / var_185_4)

				if var_185_6 > 0 and var_185_1 < var_185_6 then
					arg_182_1.talkMaxDuration = var_185_6

					if var_185_6 + var_185_0 > arg_182_1.duration_ then
						arg_182_1.duration_ = var_185_6 + var_185_0
					end
				end

				arg_182_1.text_.text = var_185_3
				arg_182_1.typewritter.percent = 0

				arg_182_1.typewritter:SetDirty()
				arg_182_1:ShowNextGo(false)
				arg_182_1:RecordContent(arg_182_1.text_.text)
			end

			local var_185_7 = math.max(var_185_1, arg_182_1.talkMaxDuration)

			if var_185_0 <= arg_182_1.time_ and arg_182_1.time_ < var_185_0 + var_185_7 then
				arg_182_1.typewritter.percent = (arg_182_1.time_ - var_185_0) / var_185_7

				arg_182_1.typewritter:SetDirty()
			end

			if arg_182_1.time_ >= var_185_0 + var_185_7 and arg_182_1.time_ < var_185_0 + var_185_7 + arg_185_0 then
				arg_182_1.typewritter.percent = 1

				arg_182_1.typewritter:SetDirty()
				arg_182_1:ShowNextGo(true)
			end
		end
	end,
	Play411151045 = function(arg_186_0, arg_186_1)
		arg_186_1.time_ = 0
		arg_186_1.frameCnt_ = 0
		arg_186_1.state_ = "playing"
		arg_186_1.curTalkId_ = 411151045
		arg_186_1.duration_ = 3.73

		local var_186_0 = {
			zh = 1.999999999999,
			ja = 3.733
		}
		local var_186_1 = manager.audio:GetLocalizationFlag()

		if var_186_0[var_186_1] ~= nil then
			arg_186_1.duration_ = var_186_0[var_186_1]
		end

		SetActive(arg_186_1.tipsGo_, false)

		function arg_186_1.onSingleLineFinish_()
			arg_186_1.onSingleLineUpdate_ = nil
			arg_186_1.onSingleLineFinish_ = nil
			arg_186_1.state_ = "waiting"
		end

		function arg_186_1.playNext_(arg_188_0)
			if arg_188_0 == 1 then
				arg_186_0:Play411151046(arg_186_1)
			end
		end

		function arg_186_1.onSingleLineUpdate_(arg_189_0)
			local var_189_0 = arg_186_1.actors_["1095ui_story"]
			local var_189_1 = 0

			if var_189_1 < arg_186_1.time_ and arg_186_1.time_ <= var_189_1 + arg_189_0 and not isNil(var_189_0) and arg_186_1.var_.characterEffect1095ui_story == nil then
				arg_186_1.var_.characterEffect1095ui_story = var_189_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_189_2 = 0.200000002980232

			if var_189_1 <= arg_186_1.time_ and arg_186_1.time_ < var_189_1 + var_189_2 and not isNil(var_189_0) then
				local var_189_3 = (arg_186_1.time_ - var_189_1) / var_189_2

				if arg_186_1.var_.characterEffect1095ui_story and not isNil(var_189_0) then
					arg_186_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_186_1.time_ >= var_189_1 + var_189_2 and arg_186_1.time_ < var_189_1 + var_189_2 + arg_189_0 and not isNil(var_189_0) and arg_186_1.var_.characterEffect1095ui_story then
				arg_186_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_189_4 = arg_186_1.actors_["1095ui_story"].transform
			local var_189_5 = 0

			if var_189_5 < arg_186_1.time_ and arg_186_1.time_ <= var_189_5 + arg_189_0 then
				arg_186_1.var_.moveOldPos1095ui_story = var_189_4.localPosition
			end

			local var_189_6 = 0.001

			if var_189_5 <= arg_186_1.time_ and arg_186_1.time_ < var_189_5 + var_189_6 then
				local var_189_7 = (arg_186_1.time_ - var_189_5) / var_189_6
				local var_189_8 = Vector3.New(0, -0.98, -6.1)

				var_189_4.localPosition = Vector3.Lerp(arg_186_1.var_.moveOldPos1095ui_story, var_189_8, var_189_7)

				local var_189_9 = manager.ui.mainCamera.transform.position - var_189_4.position

				var_189_4.forward = Vector3.New(var_189_9.x, var_189_9.y, var_189_9.z)

				local var_189_10 = var_189_4.localEulerAngles

				var_189_10.z = 0
				var_189_10.x = 0
				var_189_4.localEulerAngles = var_189_10
			end

			if arg_186_1.time_ >= var_189_5 + var_189_6 and arg_186_1.time_ < var_189_5 + var_189_6 + arg_189_0 then
				var_189_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_189_11 = manager.ui.mainCamera.transform.position - var_189_4.position

				var_189_4.forward = Vector3.New(var_189_11.x, var_189_11.y, var_189_11.z)

				local var_189_12 = var_189_4.localEulerAngles

				var_189_12.z = 0
				var_189_12.x = 0
				var_189_4.localEulerAngles = var_189_12
			end

			local var_189_13 = 0

			if var_189_13 < arg_186_1.time_ and arg_186_1.time_ <= var_189_13 + arg_189_0 then
				arg_186_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_189_14 = 0

			if var_189_14 < arg_186_1.time_ and arg_186_1.time_ <= var_189_14 + arg_189_0 then
				arg_186_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_189_15 = 0
			local var_189_16 = 0.275

			if var_189_15 < arg_186_1.time_ and arg_186_1.time_ <= var_189_15 + arg_189_0 then
				arg_186_1.talkMaxDuration = 0
				arg_186_1.dialogCg_.alpha = 1

				arg_186_1.dialog_:SetActive(true)
				SetActive(arg_186_1.leftNameGo_, true)

				local var_189_17 = arg_186_1:FormatText(StoryNameCfg[471].name)

				arg_186_1.leftNameTxt_.text = var_189_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_186_1.leftNameTxt_.transform)

				arg_186_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_186_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_186_1:RecordName(arg_186_1.leftNameTxt_.text)
				SetActive(arg_186_1.iconTrs_.gameObject, false)
				arg_186_1.callingController_:SetSelectedState("normal")

				local var_189_18 = arg_186_1:GetWordFromCfg(411151045)
				local var_189_19 = arg_186_1:FormatText(var_189_18.content)

				arg_186_1.text_.text = var_189_19

				LuaForUtil.ClearLinePrefixSymbol(arg_186_1.text_)

				local var_189_20 = 11
				local var_189_21 = utf8.len(var_189_19)
				local var_189_22 = var_189_20 <= 0 and var_189_16 or var_189_16 * (var_189_21 / var_189_20)

				if var_189_22 > 0 and var_189_16 < var_189_22 then
					arg_186_1.talkMaxDuration = var_189_22

					if var_189_22 + var_189_15 > arg_186_1.duration_ then
						arg_186_1.duration_ = var_189_22 + var_189_15
					end
				end

				arg_186_1.text_.text = var_189_19
				arg_186_1.typewritter.percent = 0

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151045", "story_v_out_411151.awb") ~= 0 then
					local var_189_23 = manager.audio:GetVoiceLength("story_v_out_411151", "411151045", "story_v_out_411151.awb") / 1000

					if var_189_23 + var_189_15 > arg_186_1.duration_ then
						arg_186_1.duration_ = var_189_23 + var_189_15
					end

					if var_189_18.prefab_name ~= "" and arg_186_1.actors_[var_189_18.prefab_name] ~= nil then
						local var_189_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_186_1.actors_[var_189_18.prefab_name].transform, "story_v_out_411151", "411151045", "story_v_out_411151.awb")

						arg_186_1:RecordAudio("411151045", var_189_24)
						arg_186_1:RecordAudio("411151045", var_189_24)
					else
						arg_186_1:AudioAction("play", "voice", "story_v_out_411151", "411151045", "story_v_out_411151.awb")
					end

					arg_186_1:RecordHistoryTalkVoice("story_v_out_411151", "411151045", "story_v_out_411151.awb")
				end

				arg_186_1:RecordContent(arg_186_1.text_.text)
			end

			local var_189_25 = math.max(var_189_16, arg_186_1.talkMaxDuration)

			if var_189_15 <= arg_186_1.time_ and arg_186_1.time_ < var_189_15 + var_189_25 then
				arg_186_1.typewritter.percent = (arg_186_1.time_ - var_189_15) / var_189_25

				arg_186_1.typewritter:SetDirty()
			end

			if arg_186_1.time_ >= var_189_15 + var_189_25 and arg_186_1.time_ < var_189_15 + var_189_25 + arg_189_0 then
				arg_186_1.typewritter.percent = 1

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(true)
			end
		end
	end,
	Play411151046 = function(arg_190_0, arg_190_1)
		arg_190_1.time_ = 0
		arg_190_1.frameCnt_ = 0
		arg_190_1.state_ = "playing"
		arg_190_1.curTalkId_ = 411151046
		arg_190_1.duration_ = 5

		SetActive(arg_190_1.tipsGo_, false)

		function arg_190_1.onSingleLineFinish_()
			arg_190_1.onSingleLineUpdate_ = nil
			arg_190_1.onSingleLineFinish_ = nil
			arg_190_1.state_ = "waiting"
		end

		function arg_190_1.playNext_(arg_192_0)
			if arg_192_0 == 1 then
				arg_190_0:Play411151047(arg_190_1)
			end
		end

		function arg_190_1.onSingleLineUpdate_(arg_193_0)
			local var_193_0 = arg_190_1.actors_["1095ui_story"]
			local var_193_1 = 0

			if var_193_1 < arg_190_1.time_ and arg_190_1.time_ <= var_193_1 + arg_193_0 and not isNil(var_193_0) and arg_190_1.var_.characterEffect1095ui_story == nil then
				arg_190_1.var_.characterEffect1095ui_story = var_193_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_193_2 = 0.200000002980232

			if var_193_1 <= arg_190_1.time_ and arg_190_1.time_ < var_193_1 + var_193_2 and not isNil(var_193_0) then
				local var_193_3 = (arg_190_1.time_ - var_193_1) / var_193_2

				if arg_190_1.var_.characterEffect1095ui_story and not isNil(var_193_0) then
					local var_193_4 = Mathf.Lerp(0, 0.5, var_193_3)

					arg_190_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_190_1.var_.characterEffect1095ui_story.fillRatio = var_193_4
				end
			end

			if arg_190_1.time_ >= var_193_1 + var_193_2 and arg_190_1.time_ < var_193_1 + var_193_2 + arg_193_0 and not isNil(var_193_0) and arg_190_1.var_.characterEffect1095ui_story then
				local var_193_5 = 0.5

				arg_190_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_190_1.var_.characterEffect1095ui_story.fillRatio = var_193_5
			end

			local var_193_6 = 0
			local var_193_7 = 0.825

			if var_193_6 < arg_190_1.time_ and arg_190_1.time_ <= var_193_6 + arg_193_0 then
				arg_190_1.talkMaxDuration = 0
				arg_190_1.dialogCg_.alpha = 1

				arg_190_1.dialog_:SetActive(true)
				SetActive(arg_190_1.leftNameGo_, false)

				arg_190_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_190_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_190_1:RecordName(arg_190_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_190_1.iconTrs_.gameObject, false)
				arg_190_1.callingController_:SetSelectedState("normal")

				local var_193_8 = arg_190_1:GetWordFromCfg(411151046)
				local var_193_9 = arg_190_1:FormatText(var_193_8.content)

				arg_190_1.text_.text = var_193_9

				LuaForUtil.ClearLinePrefixSymbol(arg_190_1.text_)

				local var_193_10 = 33
				local var_193_11 = utf8.len(var_193_9)
				local var_193_12 = var_193_10 <= 0 and var_193_7 or var_193_7 * (var_193_11 / var_193_10)

				if var_193_12 > 0 and var_193_7 < var_193_12 then
					arg_190_1.talkMaxDuration = var_193_12

					if var_193_12 + var_193_6 > arg_190_1.duration_ then
						arg_190_1.duration_ = var_193_12 + var_193_6
					end
				end

				arg_190_1.text_.text = var_193_9
				arg_190_1.typewritter.percent = 0

				arg_190_1.typewritter:SetDirty()
				arg_190_1:ShowNextGo(false)
				arg_190_1:RecordContent(arg_190_1.text_.text)
			end

			local var_193_13 = math.max(var_193_7, arg_190_1.talkMaxDuration)

			if var_193_6 <= arg_190_1.time_ and arg_190_1.time_ < var_193_6 + var_193_13 then
				arg_190_1.typewritter.percent = (arg_190_1.time_ - var_193_6) / var_193_13

				arg_190_1.typewritter:SetDirty()
			end

			if arg_190_1.time_ >= var_193_6 + var_193_13 and arg_190_1.time_ < var_193_6 + var_193_13 + arg_193_0 then
				arg_190_1.typewritter.percent = 1

				arg_190_1.typewritter:SetDirty()
				arg_190_1:ShowNextGo(true)
			end
		end
	end,
	Play411151047 = function(arg_194_0, arg_194_1)
		arg_194_1.time_ = 0
		arg_194_1.frameCnt_ = 0
		arg_194_1.state_ = "playing"
		arg_194_1.curTalkId_ = 411151047
		arg_194_1.duration_ = 5.7

		local var_194_0 = {
			zh = 4.433,
			ja = 5.7
		}
		local var_194_1 = manager.audio:GetLocalizationFlag()

		if var_194_0[var_194_1] ~= nil then
			arg_194_1.duration_ = var_194_0[var_194_1]
		end

		SetActive(arg_194_1.tipsGo_, false)

		function arg_194_1.onSingleLineFinish_()
			arg_194_1.onSingleLineUpdate_ = nil
			arg_194_1.onSingleLineFinish_ = nil
			arg_194_1.state_ = "waiting"
		end

		function arg_194_1.playNext_(arg_196_0)
			if arg_196_0 == 1 then
				arg_194_0:Play411151048(arg_194_1)
			end
		end

		function arg_194_1.onSingleLineUpdate_(arg_197_0)
			local var_197_0 = arg_194_1.actors_["1095ui_story"]
			local var_197_1 = 0

			if var_197_1 < arg_194_1.time_ and arg_194_1.time_ <= var_197_1 + arg_197_0 and not isNil(var_197_0) and arg_194_1.var_.characterEffect1095ui_story == nil then
				arg_194_1.var_.characterEffect1095ui_story = var_197_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_197_2 = 0.200000002980232

			if var_197_1 <= arg_194_1.time_ and arg_194_1.time_ < var_197_1 + var_197_2 and not isNil(var_197_0) then
				local var_197_3 = (arg_194_1.time_ - var_197_1) / var_197_2

				if arg_194_1.var_.characterEffect1095ui_story and not isNil(var_197_0) then
					arg_194_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_194_1.time_ >= var_197_1 + var_197_2 and arg_194_1.time_ < var_197_1 + var_197_2 + arg_197_0 and not isNil(var_197_0) and arg_194_1.var_.characterEffect1095ui_story then
				arg_194_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_197_4 = 0
			local var_197_5 = 0.525

			if var_197_4 < arg_194_1.time_ and arg_194_1.time_ <= var_197_4 + arg_197_0 then
				arg_194_1.talkMaxDuration = 0
				arg_194_1.dialogCg_.alpha = 1

				arg_194_1.dialog_:SetActive(true)
				SetActive(arg_194_1.leftNameGo_, true)

				local var_197_6 = arg_194_1:FormatText(StoryNameCfg[471].name)

				arg_194_1.leftNameTxt_.text = var_197_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_194_1.leftNameTxt_.transform)

				arg_194_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_194_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_194_1:RecordName(arg_194_1.leftNameTxt_.text)
				SetActive(arg_194_1.iconTrs_.gameObject, false)
				arg_194_1.callingController_:SetSelectedState("normal")

				local var_197_7 = arg_194_1:GetWordFromCfg(411151047)
				local var_197_8 = arg_194_1:FormatText(var_197_7.content)

				arg_194_1.text_.text = var_197_8

				LuaForUtil.ClearLinePrefixSymbol(arg_194_1.text_)

				local var_197_9 = 21
				local var_197_10 = utf8.len(var_197_8)
				local var_197_11 = var_197_9 <= 0 and var_197_5 or var_197_5 * (var_197_10 / var_197_9)

				if var_197_11 > 0 and var_197_5 < var_197_11 then
					arg_194_1.talkMaxDuration = var_197_11

					if var_197_11 + var_197_4 > arg_194_1.duration_ then
						arg_194_1.duration_ = var_197_11 + var_197_4
					end
				end

				arg_194_1.text_.text = var_197_8
				arg_194_1.typewritter.percent = 0

				arg_194_1.typewritter:SetDirty()
				arg_194_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151047", "story_v_out_411151.awb") ~= 0 then
					local var_197_12 = manager.audio:GetVoiceLength("story_v_out_411151", "411151047", "story_v_out_411151.awb") / 1000

					if var_197_12 + var_197_4 > arg_194_1.duration_ then
						arg_194_1.duration_ = var_197_12 + var_197_4
					end

					if var_197_7.prefab_name ~= "" and arg_194_1.actors_[var_197_7.prefab_name] ~= nil then
						local var_197_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_194_1.actors_[var_197_7.prefab_name].transform, "story_v_out_411151", "411151047", "story_v_out_411151.awb")

						arg_194_1:RecordAudio("411151047", var_197_13)
						arg_194_1:RecordAudio("411151047", var_197_13)
					else
						arg_194_1:AudioAction("play", "voice", "story_v_out_411151", "411151047", "story_v_out_411151.awb")
					end

					arg_194_1:RecordHistoryTalkVoice("story_v_out_411151", "411151047", "story_v_out_411151.awb")
				end

				arg_194_1:RecordContent(arg_194_1.text_.text)
			end

			local var_197_14 = math.max(var_197_5, arg_194_1.talkMaxDuration)

			if var_197_4 <= arg_194_1.time_ and arg_194_1.time_ < var_197_4 + var_197_14 then
				arg_194_1.typewritter.percent = (arg_194_1.time_ - var_197_4) / var_197_14

				arg_194_1.typewritter:SetDirty()
			end

			if arg_194_1.time_ >= var_197_4 + var_197_14 and arg_194_1.time_ < var_197_4 + var_197_14 + arg_197_0 then
				arg_194_1.typewritter.percent = 1

				arg_194_1.typewritter:SetDirty()
				arg_194_1:ShowNextGo(true)
			end
		end
	end,
	Play411151048 = function(arg_198_0, arg_198_1)
		arg_198_1.time_ = 0
		arg_198_1.frameCnt_ = 0
		arg_198_1.state_ = "playing"
		arg_198_1.curTalkId_ = 411151048
		arg_198_1.duration_ = 3.3

		local var_198_0 = {
			zh = 1.466,
			ja = 3.3
		}
		local var_198_1 = manager.audio:GetLocalizationFlag()

		if var_198_0[var_198_1] ~= nil then
			arg_198_1.duration_ = var_198_0[var_198_1]
		end

		SetActive(arg_198_1.tipsGo_, false)

		function arg_198_1.onSingleLineFinish_()
			arg_198_1.onSingleLineUpdate_ = nil
			arg_198_1.onSingleLineFinish_ = nil
			arg_198_1.state_ = "waiting"
		end

		function arg_198_1.playNext_(arg_200_0)
			if arg_200_0 == 1 then
				arg_198_0:Play411151049(arg_198_1)
			end
		end

		function arg_198_1.onSingleLineUpdate_(arg_201_0)
			local var_201_0 = 0
			local var_201_1 = 0.2

			if var_201_0 < arg_198_1.time_ and arg_198_1.time_ <= var_201_0 + arg_201_0 then
				arg_198_1.talkMaxDuration = 0
				arg_198_1.dialogCg_.alpha = 1

				arg_198_1.dialog_:SetActive(true)
				SetActive(arg_198_1.leftNameGo_, true)

				local var_201_2 = arg_198_1:FormatText(StoryNameCfg[471].name)

				arg_198_1.leftNameTxt_.text = var_201_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_198_1.leftNameTxt_.transform)

				arg_198_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_198_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_198_1:RecordName(arg_198_1.leftNameTxt_.text)
				SetActive(arg_198_1.iconTrs_.gameObject, false)
				arg_198_1.callingController_:SetSelectedState("normal")

				local var_201_3 = arg_198_1:GetWordFromCfg(411151048)
				local var_201_4 = arg_198_1:FormatText(var_201_3.content)

				arg_198_1.text_.text = var_201_4

				LuaForUtil.ClearLinePrefixSymbol(arg_198_1.text_)

				local var_201_5 = 8
				local var_201_6 = utf8.len(var_201_4)
				local var_201_7 = var_201_5 <= 0 and var_201_1 or var_201_1 * (var_201_6 / var_201_5)

				if var_201_7 > 0 and var_201_1 < var_201_7 then
					arg_198_1.talkMaxDuration = var_201_7

					if var_201_7 + var_201_0 > arg_198_1.duration_ then
						arg_198_1.duration_ = var_201_7 + var_201_0
					end
				end

				arg_198_1.text_.text = var_201_4
				arg_198_1.typewritter.percent = 0

				arg_198_1.typewritter:SetDirty()
				arg_198_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151048", "story_v_out_411151.awb") ~= 0 then
					local var_201_8 = manager.audio:GetVoiceLength("story_v_out_411151", "411151048", "story_v_out_411151.awb") / 1000

					if var_201_8 + var_201_0 > arg_198_1.duration_ then
						arg_198_1.duration_ = var_201_8 + var_201_0
					end

					if var_201_3.prefab_name ~= "" and arg_198_1.actors_[var_201_3.prefab_name] ~= nil then
						local var_201_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_198_1.actors_[var_201_3.prefab_name].transform, "story_v_out_411151", "411151048", "story_v_out_411151.awb")

						arg_198_1:RecordAudio("411151048", var_201_9)
						arg_198_1:RecordAudio("411151048", var_201_9)
					else
						arg_198_1:AudioAction("play", "voice", "story_v_out_411151", "411151048", "story_v_out_411151.awb")
					end

					arg_198_1:RecordHistoryTalkVoice("story_v_out_411151", "411151048", "story_v_out_411151.awb")
				end

				arg_198_1:RecordContent(arg_198_1.text_.text)
			end

			local var_201_10 = math.max(var_201_1, arg_198_1.talkMaxDuration)

			if var_201_0 <= arg_198_1.time_ and arg_198_1.time_ < var_201_0 + var_201_10 then
				arg_198_1.typewritter.percent = (arg_198_1.time_ - var_201_0) / var_201_10

				arg_198_1.typewritter:SetDirty()
			end

			if arg_198_1.time_ >= var_201_0 + var_201_10 and arg_198_1.time_ < var_201_0 + var_201_10 + arg_201_0 then
				arg_198_1.typewritter.percent = 1

				arg_198_1.typewritter:SetDirty()
				arg_198_1:ShowNextGo(true)
			end
		end
	end,
	Play411151049 = function(arg_202_0, arg_202_1)
		arg_202_1.time_ = 0
		arg_202_1.frameCnt_ = 0
		arg_202_1.state_ = "playing"
		arg_202_1.curTalkId_ = 411151049
		arg_202_1.duration_ = 5.77

		SetActive(arg_202_1.tipsGo_, false)

		function arg_202_1.onSingleLineFinish_()
			arg_202_1.onSingleLineUpdate_ = nil
			arg_202_1.onSingleLineFinish_ = nil
			arg_202_1.state_ = "waiting"
		end

		function arg_202_1.playNext_(arg_204_0)
			if arg_204_0 == 1 then
				arg_202_0:Play411151050(arg_202_1)
			end
		end

		function arg_202_1.onSingleLineUpdate_(arg_205_0)
			local var_205_0 = arg_202_1.actors_["1095ui_story"].transform
			local var_205_1 = 0

			if var_205_1 < arg_202_1.time_ and arg_202_1.time_ <= var_205_1 + arg_205_0 then
				arg_202_1.var_.moveOldPos1095ui_story = var_205_0.localPosition
			end

			local var_205_2 = 0.001

			if var_205_1 <= arg_202_1.time_ and arg_202_1.time_ < var_205_1 + var_205_2 then
				local var_205_3 = (arg_202_1.time_ - var_205_1) / var_205_2
				local var_205_4 = Vector3.New(0, 100, 0)

				var_205_0.localPosition = Vector3.Lerp(arg_202_1.var_.moveOldPos1095ui_story, var_205_4, var_205_3)

				local var_205_5 = manager.ui.mainCamera.transform.position - var_205_0.position

				var_205_0.forward = Vector3.New(var_205_5.x, var_205_5.y, var_205_5.z)

				local var_205_6 = var_205_0.localEulerAngles

				var_205_6.z = 0
				var_205_6.x = 0
				var_205_0.localEulerAngles = var_205_6
			end

			if arg_202_1.time_ >= var_205_1 + var_205_2 and arg_202_1.time_ < var_205_1 + var_205_2 + arg_205_0 then
				var_205_0.localPosition = Vector3.New(0, 100, 0)

				local var_205_7 = manager.ui.mainCamera.transform.position - var_205_0.position

				var_205_0.forward = Vector3.New(var_205_7.x, var_205_7.y, var_205_7.z)

				local var_205_8 = var_205_0.localEulerAngles

				var_205_8.z = 0
				var_205_8.x = 0
				var_205_0.localEulerAngles = var_205_8
			end

			local var_205_9 = arg_202_1.actors_["1095ui_story"]
			local var_205_10 = 0

			if var_205_10 < arg_202_1.time_ and arg_202_1.time_ <= var_205_10 + arg_205_0 and not isNil(var_205_9) and arg_202_1.var_.characterEffect1095ui_story == nil then
				arg_202_1.var_.characterEffect1095ui_story = var_205_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_205_11 = 0.200000002980232

			if var_205_10 <= arg_202_1.time_ and arg_202_1.time_ < var_205_10 + var_205_11 and not isNil(var_205_9) then
				local var_205_12 = (arg_202_1.time_ - var_205_10) / var_205_11

				if arg_202_1.var_.characterEffect1095ui_story and not isNil(var_205_9) then
					local var_205_13 = Mathf.Lerp(0, 0.5, var_205_12)

					arg_202_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_202_1.var_.characterEffect1095ui_story.fillRatio = var_205_13
				end
			end

			if arg_202_1.time_ >= var_205_10 + var_205_11 and arg_202_1.time_ < var_205_10 + var_205_11 + arg_205_0 and not isNil(var_205_9) and arg_202_1.var_.characterEffect1095ui_story then
				local var_205_14 = 0.5

				arg_202_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_202_1.var_.characterEffect1095ui_story.fillRatio = var_205_14
			end

			local var_205_15 = 0

			if var_205_15 < arg_202_1.time_ and arg_202_1.time_ <= var_205_15 + arg_205_0 then
				arg_202_1.mask_.enabled = true
				arg_202_1.mask_.raycastTarget = false

				arg_202_1:SetGaussion(false)
			end

			local var_205_16 = 0.4

			if var_205_15 <= arg_202_1.time_ and arg_202_1.time_ < var_205_15 + var_205_16 then
				local var_205_17 = (arg_202_1.time_ - var_205_15) / var_205_16
				local var_205_18 = Color.New(1, 1, 1)

				var_205_18.a = Mathf.Lerp(1, 0, var_205_17)
				arg_202_1.mask_.color = var_205_18
			end

			if arg_202_1.time_ >= var_205_15 + var_205_16 and arg_202_1.time_ < var_205_15 + var_205_16 + arg_205_0 then
				local var_205_19 = Color.New(1, 1, 1)
				local var_205_20 = 0

				arg_202_1.mask_.enabled = false
				var_205_19.a = var_205_20
				arg_202_1.mask_.color = var_205_19
			end

			if arg_202_1.frameCnt_ <= 1 then
				arg_202_1.dialog_:SetActive(false)
			end

			local var_205_21 = 0.766666666666667
			local var_205_22 = 0.8

			if var_205_21 < arg_202_1.time_ and arg_202_1.time_ <= var_205_21 + arg_205_0 then
				arg_202_1.talkMaxDuration = 0

				arg_202_1.dialog_:SetActive(true)

				local var_205_23 = LeanTween.value(arg_202_1.dialog_, 0, 1, 0.3)

				var_205_23:setOnUpdate(LuaHelper.FloatAction(function(arg_206_0)
					arg_202_1.dialogCg_.alpha = arg_206_0
				end))
				var_205_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_202_1.dialog_)
					var_205_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_202_1.duration_ = arg_202_1.duration_ + 0.3

				SetActive(arg_202_1.leftNameGo_, false)

				arg_202_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_202_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_202_1:RecordName(arg_202_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_202_1.iconTrs_.gameObject, false)
				arg_202_1.callingController_:SetSelectedState("normal")

				local var_205_24 = arg_202_1:GetWordFromCfg(411151049)
				local var_205_25 = arg_202_1:FormatText(var_205_24.content)

				arg_202_1.text_.text = var_205_25

				LuaForUtil.ClearLinePrefixSymbol(arg_202_1.text_)

				local var_205_26 = 32
				local var_205_27 = utf8.len(var_205_25)
				local var_205_28 = var_205_26 <= 0 and var_205_22 or var_205_22 * (var_205_27 / var_205_26)

				if var_205_28 > 0 and var_205_22 < var_205_28 then
					arg_202_1.talkMaxDuration = var_205_28
					var_205_21 = var_205_21 + 0.3

					if var_205_28 + var_205_21 > arg_202_1.duration_ then
						arg_202_1.duration_ = var_205_28 + var_205_21
					end
				end

				arg_202_1.text_.text = var_205_25
				arg_202_1.typewritter.percent = 0

				arg_202_1.typewritter:SetDirty()
				arg_202_1:ShowNextGo(false)
				arg_202_1:RecordContent(arg_202_1.text_.text)
			end

			local var_205_29 = var_205_21 + 0.3
			local var_205_30 = math.max(var_205_22, arg_202_1.talkMaxDuration)

			if var_205_29 <= arg_202_1.time_ and arg_202_1.time_ < var_205_29 + var_205_30 then
				arg_202_1.typewritter.percent = (arg_202_1.time_ - var_205_29) / var_205_30

				arg_202_1.typewritter:SetDirty()
			end

			if arg_202_1.time_ >= var_205_29 + var_205_30 and arg_202_1.time_ < var_205_29 + var_205_30 + arg_205_0 then
				arg_202_1.typewritter.percent = 1

				arg_202_1.typewritter:SetDirty()
				arg_202_1:ShowNextGo(true)
			end
		end
	end,
	Play411151050 = function(arg_208_0, arg_208_1)
		arg_208_1.time_ = 0
		arg_208_1.frameCnt_ = 0
		arg_208_1.state_ = "playing"
		arg_208_1.curTalkId_ = 411151050
		arg_208_1.duration_ = 5

		SetActive(arg_208_1.tipsGo_, false)

		function arg_208_1.onSingleLineFinish_()
			arg_208_1.onSingleLineUpdate_ = nil
			arg_208_1.onSingleLineFinish_ = nil
			arg_208_1.state_ = "waiting"
		end

		function arg_208_1.playNext_(arg_210_0)
			if arg_210_0 == 1 then
				arg_208_0:Play411151051(arg_208_1)
			end
		end

		function arg_208_1.onSingleLineUpdate_(arg_211_0)
			local var_211_0 = 0
			local var_211_1 = 0.9

			if var_211_0 < arg_208_1.time_ and arg_208_1.time_ <= var_211_0 + arg_211_0 then
				arg_208_1.talkMaxDuration = 0
				arg_208_1.dialogCg_.alpha = 1

				arg_208_1.dialog_:SetActive(true)
				SetActive(arg_208_1.leftNameGo_, true)

				local var_211_2 = arg_208_1:FormatText(StoryNameCfg[263].name)

				arg_208_1.leftNameTxt_.text = var_211_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_208_1.leftNameTxt_.transform)

				arg_208_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_208_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_208_1:RecordName(arg_208_1.leftNameTxt_.text)
				SetActive(arg_208_1.iconTrs_.gameObject, true)
				arg_208_1.iconController_:SetSelectedState("hero")

				arg_208_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052_split_1")

				arg_208_1.callingController_:SetSelectedState("normal")

				arg_208_1.keyicon_.color = Color.New(1, 1, 1)
				arg_208_1.icon_.color = Color.New(1, 1, 1)

				local var_211_3 = arg_208_1:GetWordFromCfg(411151050)
				local var_211_4 = arg_208_1:FormatText(var_211_3.content)

				arg_208_1.text_.text = var_211_4

				LuaForUtil.ClearLinePrefixSymbol(arg_208_1.text_)

				local var_211_5 = 36
				local var_211_6 = utf8.len(var_211_4)
				local var_211_7 = var_211_5 <= 0 and var_211_1 or var_211_1 * (var_211_6 / var_211_5)

				if var_211_7 > 0 and var_211_1 < var_211_7 then
					arg_208_1.talkMaxDuration = var_211_7

					if var_211_7 + var_211_0 > arg_208_1.duration_ then
						arg_208_1.duration_ = var_211_7 + var_211_0
					end
				end

				arg_208_1.text_.text = var_211_4
				arg_208_1.typewritter.percent = 0

				arg_208_1.typewritter:SetDirty()
				arg_208_1:ShowNextGo(false)
				arg_208_1:RecordContent(arg_208_1.text_.text)
			end

			local var_211_8 = math.max(var_211_1, arg_208_1.talkMaxDuration)

			if var_211_0 <= arg_208_1.time_ and arg_208_1.time_ < var_211_0 + var_211_8 then
				arg_208_1.typewritter.percent = (arg_208_1.time_ - var_211_0) / var_211_8

				arg_208_1.typewritter:SetDirty()
			end

			if arg_208_1.time_ >= var_211_0 + var_211_8 and arg_208_1.time_ < var_211_0 + var_211_8 + arg_211_0 then
				arg_208_1.typewritter.percent = 1

				arg_208_1.typewritter:SetDirty()
				arg_208_1:ShowNextGo(true)
			end
		end
	end,
	Play411151051 = function(arg_212_0, arg_212_1)
		arg_212_1.time_ = 0
		arg_212_1.frameCnt_ = 0
		arg_212_1.state_ = "playing"
		arg_212_1.curTalkId_ = 411151051
		arg_212_1.duration_ = 5

		SetActive(arg_212_1.tipsGo_, false)

		function arg_212_1.onSingleLineFinish_()
			arg_212_1.onSingleLineUpdate_ = nil
			arg_212_1.onSingleLineFinish_ = nil
			arg_212_1.state_ = "waiting"
		end

		function arg_212_1.playNext_(arg_214_0)
			if arg_214_0 == 1 then
				arg_212_0:Play411151052(arg_212_1)
			end
		end

		function arg_212_1.onSingleLineUpdate_(arg_215_0)
			local var_215_0 = 0
			local var_215_1 = 0.625

			if var_215_0 < arg_212_1.time_ and arg_212_1.time_ <= var_215_0 + arg_215_0 then
				arg_212_1.talkMaxDuration = 0
				arg_212_1.dialogCg_.alpha = 1

				arg_212_1.dialog_:SetActive(true)
				SetActive(arg_212_1.leftNameGo_, true)

				local var_215_2 = arg_212_1:FormatText(StoryNameCfg[263].name)

				arg_212_1.leftNameTxt_.text = var_215_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_212_1.leftNameTxt_.transform)

				arg_212_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_212_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_212_1:RecordName(arg_212_1.leftNameTxt_.text)
				SetActive(arg_212_1.iconTrs_.gameObject, true)
				arg_212_1.iconController_:SetSelectedState("hero")

				arg_212_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1052_split_1")

				arg_212_1.callingController_:SetSelectedState("normal")

				arg_212_1.keyicon_.color = Color.New(1, 1, 1)
				arg_212_1.icon_.color = Color.New(1, 1, 1)

				local var_215_3 = arg_212_1:GetWordFromCfg(411151051)
				local var_215_4 = arg_212_1:FormatText(var_215_3.content)

				arg_212_1.text_.text = var_215_4

				LuaForUtil.ClearLinePrefixSymbol(arg_212_1.text_)

				local var_215_5 = 25
				local var_215_6 = utf8.len(var_215_4)
				local var_215_7 = var_215_5 <= 0 and var_215_1 or var_215_1 * (var_215_6 / var_215_5)

				if var_215_7 > 0 and var_215_1 < var_215_7 then
					arg_212_1.talkMaxDuration = var_215_7

					if var_215_7 + var_215_0 > arg_212_1.duration_ then
						arg_212_1.duration_ = var_215_7 + var_215_0
					end
				end

				arg_212_1.text_.text = var_215_4
				arg_212_1.typewritter.percent = 0

				arg_212_1.typewritter:SetDirty()
				arg_212_1:ShowNextGo(false)
				arg_212_1:RecordContent(arg_212_1.text_.text)
			end

			local var_215_8 = math.max(var_215_1, arg_212_1.talkMaxDuration)

			if var_215_0 <= arg_212_1.time_ and arg_212_1.time_ < var_215_0 + var_215_8 then
				arg_212_1.typewritter.percent = (arg_212_1.time_ - var_215_0) / var_215_8

				arg_212_1.typewritter:SetDirty()
			end

			if arg_212_1.time_ >= var_215_0 + var_215_8 and arg_212_1.time_ < var_215_0 + var_215_8 + arg_215_0 then
				arg_212_1.typewritter.percent = 1

				arg_212_1.typewritter:SetDirty()
				arg_212_1:ShowNextGo(true)
			end
		end
	end,
	Play411151052 = function(arg_216_0, arg_216_1)
		arg_216_1.time_ = 0
		arg_216_1.frameCnt_ = 0
		arg_216_1.state_ = "playing"
		arg_216_1.curTalkId_ = 411151052
		arg_216_1.duration_ = 2

		local var_216_0 = {
			zh = 2,
			ja = 1.999999999999
		}
		local var_216_1 = manager.audio:GetLocalizationFlag()

		if var_216_0[var_216_1] ~= nil then
			arg_216_1.duration_ = var_216_0[var_216_1]
		end

		SetActive(arg_216_1.tipsGo_, false)

		function arg_216_1.onSingleLineFinish_()
			arg_216_1.onSingleLineUpdate_ = nil
			arg_216_1.onSingleLineFinish_ = nil
			arg_216_1.state_ = "waiting"
			arg_216_1.auto_ = false
		end

		function arg_216_1.playNext_(arg_218_0)
			arg_216_1.onStoryFinished_()
		end

		function arg_216_1.onSingleLineUpdate_(arg_219_0)
			local var_219_0 = arg_216_1.actors_["1095ui_story"].transform
			local var_219_1 = 0

			if var_219_1 < arg_216_1.time_ and arg_216_1.time_ <= var_219_1 + arg_219_0 then
				arg_216_1.var_.moveOldPos1095ui_story = var_219_0.localPosition
			end

			local var_219_2 = 0.001

			if var_219_1 <= arg_216_1.time_ and arg_216_1.time_ < var_219_1 + var_219_2 then
				local var_219_3 = (arg_216_1.time_ - var_219_1) / var_219_2
				local var_219_4 = Vector3.New(0, -0.98, -6.1)

				var_219_0.localPosition = Vector3.Lerp(arg_216_1.var_.moveOldPos1095ui_story, var_219_4, var_219_3)

				local var_219_5 = manager.ui.mainCamera.transform.position - var_219_0.position

				var_219_0.forward = Vector3.New(var_219_5.x, var_219_5.y, var_219_5.z)

				local var_219_6 = var_219_0.localEulerAngles

				var_219_6.z = 0
				var_219_6.x = 0
				var_219_0.localEulerAngles = var_219_6
			end

			if arg_216_1.time_ >= var_219_1 + var_219_2 and arg_216_1.time_ < var_219_1 + var_219_2 + arg_219_0 then
				var_219_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_219_7 = manager.ui.mainCamera.transform.position - var_219_0.position

				var_219_0.forward = Vector3.New(var_219_7.x, var_219_7.y, var_219_7.z)

				local var_219_8 = var_219_0.localEulerAngles

				var_219_8.z = 0
				var_219_8.x = 0
				var_219_0.localEulerAngles = var_219_8
			end

			local var_219_9 = arg_216_1.actors_["1095ui_story"]
			local var_219_10 = 0

			if var_219_10 < arg_216_1.time_ and arg_216_1.time_ <= var_219_10 + arg_219_0 and not isNil(var_219_9) and arg_216_1.var_.characterEffect1095ui_story == nil then
				arg_216_1.var_.characterEffect1095ui_story = var_219_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_219_11 = 0.200000002980232

			if var_219_10 <= arg_216_1.time_ and arg_216_1.time_ < var_219_10 + var_219_11 and not isNil(var_219_9) then
				local var_219_12 = (arg_216_1.time_ - var_219_10) / var_219_11

				if arg_216_1.var_.characterEffect1095ui_story and not isNil(var_219_9) then
					arg_216_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_216_1.time_ >= var_219_10 + var_219_11 and arg_216_1.time_ < var_219_10 + var_219_11 + arg_219_0 and not isNil(var_219_9) and arg_216_1.var_.characterEffect1095ui_story then
				arg_216_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_219_13 = 0

			if var_219_13 < arg_216_1.time_ and arg_216_1.time_ <= var_219_13 + arg_219_0 then
				arg_216_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_219_14 = 0

			if var_219_14 < arg_216_1.time_ and arg_216_1.time_ <= var_219_14 + arg_219_0 then
				arg_216_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_219_15 = 0
			local var_219_16 = 0.25

			if var_219_15 < arg_216_1.time_ and arg_216_1.time_ <= var_219_15 + arg_219_0 then
				arg_216_1.talkMaxDuration = 0
				arg_216_1.dialogCg_.alpha = 1

				arg_216_1.dialog_:SetActive(true)
				SetActive(arg_216_1.leftNameGo_, true)

				local var_219_17 = arg_216_1:FormatText(StoryNameCfg[471].name)

				arg_216_1.leftNameTxt_.text = var_219_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_216_1.leftNameTxt_.transform)

				arg_216_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_216_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_216_1:RecordName(arg_216_1.leftNameTxt_.text)
				SetActive(arg_216_1.iconTrs_.gameObject, false)
				arg_216_1.callingController_:SetSelectedState("normal")

				local var_219_18 = arg_216_1:GetWordFromCfg(411151052)
				local var_219_19 = arg_216_1:FormatText(var_219_18.content)

				arg_216_1.text_.text = var_219_19

				LuaForUtil.ClearLinePrefixSymbol(arg_216_1.text_)

				local var_219_20 = 10
				local var_219_21 = utf8.len(var_219_19)
				local var_219_22 = var_219_20 <= 0 and var_219_16 or var_219_16 * (var_219_21 / var_219_20)

				if var_219_22 > 0 and var_219_16 < var_219_22 then
					arg_216_1.talkMaxDuration = var_219_22

					if var_219_22 + var_219_15 > arg_216_1.duration_ then
						arg_216_1.duration_ = var_219_22 + var_219_15
					end
				end

				arg_216_1.text_.text = var_219_19
				arg_216_1.typewritter.percent = 0

				arg_216_1.typewritter:SetDirty()
				arg_216_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_411151", "411151052", "story_v_out_411151.awb") ~= 0 then
					local var_219_23 = manager.audio:GetVoiceLength("story_v_out_411151", "411151052", "story_v_out_411151.awb") / 1000

					if var_219_23 + var_219_15 > arg_216_1.duration_ then
						arg_216_1.duration_ = var_219_23 + var_219_15
					end

					if var_219_18.prefab_name ~= "" and arg_216_1.actors_[var_219_18.prefab_name] ~= nil then
						local var_219_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_216_1.actors_[var_219_18.prefab_name].transform, "story_v_out_411151", "411151052", "story_v_out_411151.awb")

						arg_216_1:RecordAudio("411151052", var_219_24)
						arg_216_1:RecordAudio("411151052", var_219_24)
					else
						arg_216_1:AudioAction("play", "voice", "story_v_out_411151", "411151052", "story_v_out_411151.awb")
					end

					arg_216_1:RecordHistoryTalkVoice("story_v_out_411151", "411151052", "story_v_out_411151.awb")
				end

				arg_216_1:RecordContent(arg_216_1.text_.text)
			end

			local var_219_25 = math.max(var_219_16, arg_216_1.talkMaxDuration)

			if var_219_15 <= arg_216_1.time_ and arg_216_1.time_ < var_219_15 + var_219_25 then
				arg_216_1.typewritter.percent = (arg_216_1.time_ - var_219_15) / var_219_25

				arg_216_1.typewritter:SetDirty()
			end

			if arg_216_1.time_ >= var_219_15 + var_219_25 and arg_216_1.time_ < var_219_15 + var_219_25 + arg_219_0 then
				arg_216_1.typewritter.percent = 1

				arg_216_1.typewritter:SetDirty()
				arg_216_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11o",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74a"
	},
	voices = {
		"story_v_out_411151.awb"
	}
}
