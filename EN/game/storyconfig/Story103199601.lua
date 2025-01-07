﻿return {
	Play319961001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319961001
		arg_1_1.duration_ = 7.37

		local var_1_0 = {
			zh = 6.433,
			ja = 7.366
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
				arg_1_0:Play319961002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "STblack"

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
				local var_4_5 = arg_1_1.bgs_.STblack

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
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 2

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = "1095ui_story"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Char/" .. var_4_24), arg_1_1.stage_.transform)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentInChildren(typeof(CharacterEffect))

				var_4_26.enabled = true

				local var_4_27 = GameObjectTools.GetOrAddComponent(var_4_25, typeof(DynamicBoneHelper))

				if var_4_27 then
					var_4_27:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_26.transform, false)

				arg_1_1.var_[var_4_24 .. "Animator"] = var_4_26.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_24 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_24 .. "LipSync"] = var_4_26.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_28 = arg_1_1.actors_["1095ui_story"].transform
			local var_4_29 = 1.8

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPos1095ui_story = var_4_28.localPosition
			end

			local var_4_30 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, -0.98, -6.1)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1095ui_story, var_4_32, var_4_31)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_28.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_28.localEulerAngles = var_4_34
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_4_35 = manager.ui.mainCamera.transform.position - var_4_28.position

				var_4_28.forward = Vector3.New(var_4_35.x, var_4_35.y, var_4_35.z)

				local var_4_36 = var_4_28.localEulerAngles

				var_4_36.z = 0
				var_4_36.x = 0
				var_4_28.localEulerAngles = var_4_36
			end

			local var_4_37 = arg_1_1.actors_["1095ui_story"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story == nil then
				arg_1_1.var_.characterEffect1095ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.200000002980232

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1095ui_story then
					arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1095ui_story then
				arg_1_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_4_43 = 0
			local var_4_44 = 0.2

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_47 = ""
				local var_4_48 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_48 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_48 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_48

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_48
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

			local var_4_49 = 0.233333333333333
			local var_4_50 = 1

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue.awb")

				local var_4_53 = ""
				local var_4_54 = manager.audio:GetAudioName("bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue")

				if var_4_54 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_54 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_54

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_54
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

			local var_4_55 = 2
			local var_4_56 = 0.525

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_57 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_57:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_58 = arg_1_1:FormatText(StoryNameCfg[471].name)

				arg_1_1.leftNameTxt_.text = var_4_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_59 = arg_1_1:GetWordFromCfg(319961001)
				local var_4_60 = arg_1_1:FormatText(var_4_59.content)

				arg_1_1.text_.text = var_4_60

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_61 = 21
				local var_4_62 = utf8.len(var_4_60)
				local var_4_63 = var_4_61 <= 0 and var_4_56 or var_4_56 * (var_4_62 / var_4_61)

				if var_4_63 > 0 and var_4_56 < var_4_63 then
					arg_1_1.talkMaxDuration = var_4_63
					var_4_55 = var_4_55 + 0.3

					if var_4_63 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_63 + var_4_55
					end
				end

				arg_1_1.text_.text = var_4_60
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961001", "story_v_out_319961.awb") ~= 0 then
					local var_4_64 = manager.audio:GetVoiceLength("story_v_out_319961", "319961001", "story_v_out_319961.awb") / 1000

					if var_4_64 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_55
					end

					if var_4_59.prefab_name ~= "" and arg_1_1.actors_[var_4_59.prefab_name] ~= nil then
						local var_4_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_59.prefab_name].transform, "story_v_out_319961", "319961001", "story_v_out_319961.awb")

						arg_1_1:RecordAudio("319961001", var_4_65)
						arg_1_1:RecordAudio("319961001", var_4_65)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319961", "319961001", "story_v_out_319961.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319961", "319961001", "story_v_out_319961.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_66 = var_4_55 + 0.3
			local var_4_67 = math.max(var_4_56, arg_1_1.talkMaxDuration)

			if var_4_66 <= arg_1_1.time_ and arg_1_1.time_ < var_4_66 + var_4_67 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_66) / var_4_67

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_66 + var_4_67 and arg_1_1.time_ < var_4_66 + var_4_67 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319961002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 319961002
		arg_9_1.duration_ = 3.1

		local var_9_0 = {
			zh = 3.1,
			ja = 1.566
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play319961003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "10014ui_story"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(Asset.Load("Char/" .. var_12_0), arg_9_1.stage_.transform)

				var_12_1.name = var_12_0
				var_12_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_0] = var_12_1

				local var_12_2 = var_12_1:GetComponentInChildren(typeof(CharacterEffect))

				var_12_2.enabled = true

				local var_12_3 = GameObjectTools.GetOrAddComponent(var_12_1, typeof(DynamicBoneHelper))

				if var_12_3 then
					var_12_3:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_2.transform, false)

				arg_9_1.var_[var_12_0 .. "Animator"] = var_12_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_0 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_0 .. "LipSync"] = var_12_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_4 = arg_9_1.actors_["10014ui_story"].transform
			local var_12_5 = 0

			if var_12_5 < arg_9_1.time_ and arg_9_1.time_ <= var_12_5 + arg_12_0 then
				arg_9_1.var_.moveOldPos10014ui_story = var_12_4.localPosition
			end

			local var_12_6 = 0.001

			if var_12_5 <= arg_9_1.time_ and arg_9_1.time_ < var_12_5 + var_12_6 then
				local var_12_7 = (arg_9_1.time_ - var_12_5) / var_12_6
				local var_12_8 = Vector3.New(0.7, -1.06, -6.2)

				var_12_4.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos10014ui_story, var_12_8, var_12_7)

				local var_12_9 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_9.x, var_12_9.y, var_12_9.z)

				local var_12_10 = var_12_4.localEulerAngles

				var_12_10.z = 0
				var_12_10.x = 0
				var_12_4.localEulerAngles = var_12_10
			end

			if arg_9_1.time_ >= var_12_5 + var_12_6 and arg_9_1.time_ < var_12_5 + var_12_6 + arg_12_0 then
				var_12_4.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_12_11 = manager.ui.mainCamera.transform.position - var_12_4.position

				var_12_4.forward = Vector3.New(var_12_11.x, var_12_11.y, var_12_11.z)

				local var_12_12 = var_12_4.localEulerAngles

				var_12_12.z = 0
				var_12_12.x = 0
				var_12_4.localEulerAngles = var_12_12
			end

			local var_12_13 = arg_9_1.actors_["10014ui_story"]
			local var_12_14 = 0

			if var_12_14 < arg_9_1.time_ and arg_9_1.time_ <= var_12_14 + arg_12_0 and arg_9_1.var_.characterEffect10014ui_story == nil then
				arg_9_1.var_.characterEffect10014ui_story = var_12_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_15 = 0.200000002980232

			if var_12_14 <= arg_9_1.time_ and arg_9_1.time_ < var_12_14 + var_12_15 then
				local var_12_16 = (arg_9_1.time_ - var_12_14) / var_12_15

				if arg_9_1.var_.characterEffect10014ui_story then
					arg_9_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_9_1.time_ >= var_12_14 + var_12_15 and arg_9_1.time_ < var_12_14 + var_12_15 + arg_12_0 and arg_9_1.var_.characterEffect10014ui_story then
				arg_9_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_12_17 = 0

			if var_12_17 < arg_9_1.time_ and arg_9_1.time_ <= var_12_17 + arg_12_0 then
				arg_9_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_12_18 = 0

			if var_12_18 < arg_9_1.time_ and arg_9_1.time_ <= var_12_18 + arg_12_0 then
				arg_9_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_12_19 = arg_9_1.actors_["1095ui_story"].transform
			local var_12_20 = 0

			if var_12_20 < arg_9_1.time_ and arg_9_1.time_ <= var_12_20 + arg_12_0 then
				arg_9_1.var_.moveOldPos1095ui_story = var_12_19.localPosition
			end

			local var_12_21 = 0.001

			if var_12_20 <= arg_9_1.time_ and arg_9_1.time_ < var_12_20 + var_12_21 then
				local var_12_22 = (arg_9_1.time_ - var_12_20) / var_12_21
				local var_12_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_12_19.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos1095ui_story, var_12_23, var_12_22)

				local var_12_24 = manager.ui.mainCamera.transform.position - var_12_19.position

				var_12_19.forward = Vector3.New(var_12_24.x, var_12_24.y, var_12_24.z)

				local var_12_25 = var_12_19.localEulerAngles

				var_12_25.z = 0
				var_12_25.x = 0
				var_12_19.localEulerAngles = var_12_25
			end

			if arg_9_1.time_ >= var_12_20 + var_12_21 and arg_9_1.time_ < var_12_20 + var_12_21 + arg_12_0 then
				var_12_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_12_26 = manager.ui.mainCamera.transform.position - var_12_19.position

				var_12_19.forward = Vector3.New(var_12_26.x, var_12_26.y, var_12_26.z)

				local var_12_27 = var_12_19.localEulerAngles

				var_12_27.z = 0
				var_12_27.x = 0
				var_12_19.localEulerAngles = var_12_27
			end

			local var_12_28 = arg_9_1.actors_["1095ui_story"]
			local var_12_29 = 0

			if var_12_29 < arg_9_1.time_ and arg_9_1.time_ <= var_12_29 + arg_12_0 and arg_9_1.var_.characterEffect1095ui_story == nil then
				arg_9_1.var_.characterEffect1095ui_story = var_12_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_12_30 = 0.200000002980232

			if var_12_29 <= arg_9_1.time_ and arg_9_1.time_ < var_12_29 + var_12_30 then
				local var_12_31 = (arg_9_1.time_ - var_12_29) / var_12_30

				if arg_9_1.var_.characterEffect1095ui_story then
					local var_12_32 = Mathf.Lerp(0, 0.5, var_12_31)

					arg_9_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_9_1.var_.characterEffect1095ui_story.fillRatio = var_12_32
				end
			end

			if arg_9_1.time_ >= var_12_29 + var_12_30 and arg_9_1.time_ < var_12_29 + var_12_30 + arg_12_0 and arg_9_1.var_.characterEffect1095ui_story then
				local var_12_33 = 0.5

				arg_9_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_9_1.var_.characterEffect1095ui_story.fillRatio = var_12_33
			end

			local var_12_34 = 0
			local var_12_35 = 0.325

			if var_12_34 < arg_9_1.time_ and arg_9_1.time_ <= var_12_34 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_36 = arg_9_1:FormatText(StoryNameCfg[264].name)

				arg_9_1.leftNameTxt_.text = var_12_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_37 = arg_9_1:GetWordFromCfg(319961002)
				local var_12_38 = arg_9_1:FormatText(var_12_37.content)

				arg_9_1.text_.text = var_12_38

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_39 = 13
				local var_12_40 = utf8.len(var_12_38)
				local var_12_41 = var_12_39 <= 0 and var_12_35 or var_12_35 * (var_12_40 / var_12_39)

				if var_12_41 > 0 and var_12_35 < var_12_41 then
					arg_9_1.talkMaxDuration = var_12_41

					if var_12_41 + var_12_34 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_41 + var_12_34
					end
				end

				arg_9_1.text_.text = var_12_38
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961002", "story_v_out_319961.awb") ~= 0 then
					local var_12_42 = manager.audio:GetVoiceLength("story_v_out_319961", "319961002", "story_v_out_319961.awb") / 1000

					if var_12_42 + var_12_34 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_42 + var_12_34
					end

					if var_12_37.prefab_name ~= "" and arg_9_1.actors_[var_12_37.prefab_name] ~= nil then
						local var_12_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_37.prefab_name].transform, "story_v_out_319961", "319961002", "story_v_out_319961.awb")

						arg_9_1:RecordAudio("319961002", var_12_43)
						arg_9_1:RecordAudio("319961002", var_12_43)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_319961", "319961002", "story_v_out_319961.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_319961", "319961002", "story_v_out_319961.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_44 = math.max(var_12_35, arg_9_1.talkMaxDuration)

			if var_12_34 <= arg_9_1.time_ and arg_9_1.time_ < var_12_34 + var_12_44 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_34) / var_12_44

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_34 + var_12_44 and arg_9_1.time_ < var_12_34 + var_12_44 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play319961003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 319961003
		arg_13_1.duration_ = 3.23

		local var_13_0 = {
			zh = 1.866,
			ja = 3.233
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play319961004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = 0
			local var_16_1 = 0.225

			if var_16_0 < arg_13_1.time_ and arg_13_1.time_ <= var_16_0 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_2 = arg_13_1:FormatText(StoryNameCfg[264].name)

				arg_13_1.leftNameTxt_.text = var_16_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_3 = arg_13_1:GetWordFromCfg(319961003)
				local var_16_4 = arg_13_1:FormatText(var_16_3.content)

				arg_13_1.text_.text = var_16_4

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_5 = 9
				local var_16_6 = utf8.len(var_16_4)
				local var_16_7 = var_16_5 <= 0 and var_16_1 or var_16_1 * (var_16_6 / var_16_5)

				if var_16_7 > 0 and var_16_1 < var_16_7 then
					arg_13_1.talkMaxDuration = var_16_7

					if var_16_7 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_7 + var_16_0
					end
				end

				arg_13_1.text_.text = var_16_4
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961003", "story_v_out_319961.awb") ~= 0 then
					local var_16_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961003", "story_v_out_319961.awb") / 1000

					if var_16_8 + var_16_0 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_8 + var_16_0
					end

					if var_16_3.prefab_name ~= "" and arg_13_1.actors_[var_16_3.prefab_name] ~= nil then
						local var_16_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_3.prefab_name].transform, "story_v_out_319961", "319961003", "story_v_out_319961.awb")

						arg_13_1:RecordAudio("319961003", var_16_9)
						arg_13_1:RecordAudio("319961003", var_16_9)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_319961", "319961003", "story_v_out_319961.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_319961", "319961003", "story_v_out_319961.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_10 = math.max(var_16_1, arg_13_1.talkMaxDuration)

			if var_16_0 <= arg_13_1.time_ and arg_13_1.time_ < var_16_0 + var_16_10 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_0) / var_16_10

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_0 + var_16_10 and arg_13_1.time_ < var_16_0 + var_16_10 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play319961004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 319961004
		arg_17_1.duration_ = 9

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play319961005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "I07"

			if arg_17_1.bgs_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(arg_17_1.paintGo_)

				var_20_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_20_0)
				var_20_1.name = var_20_0
				var_20_1.transform.parent = arg_17_1.stage_.transform
				var_20_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.bgs_[var_20_0] = var_20_1
			end

			local var_20_2 = 2

			if var_20_2 < arg_17_1.time_ and arg_17_1.time_ <= var_20_2 + arg_20_0 then
				local var_20_3 = manager.ui.mainCamera.transform.localPosition
				local var_20_4 = Vector3.New(0, 0, 10) + Vector3.New(var_20_3.x, var_20_3.y, 0)
				local var_20_5 = arg_17_1.bgs_.I07

				var_20_5.transform.localPosition = var_20_4
				var_20_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_20_6 = var_20_5:GetComponent("SpriteRenderer")

				if var_20_6 and var_20_6.sprite then
					local var_20_7 = (var_20_5.transform.localPosition - var_20_3).z
					local var_20_8 = manager.ui.mainCameraCom_
					local var_20_9 = 2 * var_20_7 * Mathf.Tan(var_20_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_20_10 = var_20_9 * var_20_8.aspect
					local var_20_11 = var_20_6.sprite.bounds.size.x
					local var_20_12 = var_20_6.sprite.bounds.size.y
					local var_20_13 = var_20_10 / var_20_11
					local var_20_14 = var_20_9 / var_20_12
					local var_20_15 = var_20_14 < var_20_13 and var_20_13 or var_20_14

					var_20_5.transform.localScale = Vector3.New(var_20_15, var_20_15, 0)
				end

				for iter_20_0, iter_20_1 in pairs(arg_17_1.bgs_) do
					if iter_20_0 ~= "I07" then
						iter_20_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_20_16 = 3.999999999999

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 then
				arg_17_1.allBtn_.enabled = false
			end

			local var_20_17 = 0.3

			if arg_17_1.time_ >= var_20_16 + var_20_17 and arg_17_1.time_ < var_20_16 + var_20_17 + arg_20_0 then
				arg_17_1.allBtn_.enabled = true
			end

			local var_20_18 = 0

			if var_20_18 < arg_17_1.time_ and arg_17_1.time_ <= var_20_18 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_19 = 2

			if var_20_18 <= arg_17_1.time_ and arg_17_1.time_ < var_20_18 + var_20_19 then
				local var_20_20 = (arg_17_1.time_ - var_20_18) / var_20_19
				local var_20_21 = Color.New(0, 0, 0)

				var_20_21.a = Mathf.Lerp(0, 1, var_20_20)
				arg_17_1.mask_.color = var_20_21
			end

			if arg_17_1.time_ >= var_20_18 + var_20_19 and arg_17_1.time_ < var_20_18 + var_20_19 + arg_20_0 then
				local var_20_22 = Color.New(0, 0, 0)

				var_20_22.a = 1
				arg_17_1.mask_.color = var_20_22
			end

			local var_20_23 = 2

			if var_20_23 < arg_17_1.time_ and arg_17_1.time_ <= var_20_23 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_24 = 2

			if var_20_23 <= arg_17_1.time_ and arg_17_1.time_ < var_20_23 + var_20_24 then
				local var_20_25 = (arg_17_1.time_ - var_20_23) / var_20_24
				local var_20_26 = Color.New(0, 0, 0)

				var_20_26.a = Mathf.Lerp(1, 0, var_20_25)
				arg_17_1.mask_.color = var_20_26
			end

			if arg_17_1.time_ >= var_20_23 + var_20_24 and arg_17_1.time_ < var_20_23 + var_20_24 + arg_20_0 then
				local var_20_27 = Color.New(0, 0, 0)
				local var_20_28 = 0

				arg_17_1.mask_.enabled = false
				var_20_27.a = var_20_28
				arg_17_1.mask_.color = var_20_27
			end

			local var_20_29 = arg_17_1.actors_["10014ui_story"].transform
			local var_20_30 = 1.966

			if var_20_30 < arg_17_1.time_ and arg_17_1.time_ <= var_20_30 + arg_20_0 then
				arg_17_1.var_.moveOldPos10014ui_story = var_20_29.localPosition
			end

			local var_20_31 = 0.001

			if var_20_30 <= arg_17_1.time_ and arg_17_1.time_ < var_20_30 + var_20_31 then
				local var_20_32 = (arg_17_1.time_ - var_20_30) / var_20_31
				local var_20_33 = Vector3.New(0, 100, 0)

				var_20_29.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos10014ui_story, var_20_33, var_20_32)

				local var_20_34 = manager.ui.mainCamera.transform.position - var_20_29.position

				var_20_29.forward = Vector3.New(var_20_34.x, var_20_34.y, var_20_34.z)

				local var_20_35 = var_20_29.localEulerAngles

				var_20_35.z = 0
				var_20_35.x = 0
				var_20_29.localEulerAngles = var_20_35
			end

			if arg_17_1.time_ >= var_20_30 + var_20_31 and arg_17_1.time_ < var_20_30 + var_20_31 + arg_20_0 then
				var_20_29.localPosition = Vector3.New(0, 100, 0)

				local var_20_36 = manager.ui.mainCamera.transform.position - var_20_29.position

				var_20_29.forward = Vector3.New(var_20_36.x, var_20_36.y, var_20_36.z)

				local var_20_37 = var_20_29.localEulerAngles

				var_20_37.z = 0
				var_20_37.x = 0
				var_20_29.localEulerAngles = var_20_37
			end

			local var_20_38 = arg_17_1.actors_["1095ui_story"].transform
			local var_20_39 = 1.966

			if var_20_39 < arg_17_1.time_ and arg_17_1.time_ <= var_20_39 + arg_20_0 then
				arg_17_1.var_.moveOldPos1095ui_story = var_20_38.localPosition
			end

			local var_20_40 = 0.001

			if var_20_39 <= arg_17_1.time_ and arg_17_1.time_ < var_20_39 + var_20_40 then
				local var_20_41 = (arg_17_1.time_ - var_20_39) / var_20_40
				local var_20_42 = Vector3.New(0, 100, 0)

				var_20_38.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1095ui_story, var_20_42, var_20_41)

				local var_20_43 = manager.ui.mainCamera.transform.position - var_20_38.position

				var_20_38.forward = Vector3.New(var_20_43.x, var_20_43.y, var_20_43.z)

				local var_20_44 = var_20_38.localEulerAngles

				var_20_44.z = 0
				var_20_44.x = 0
				var_20_38.localEulerAngles = var_20_44
			end

			if arg_17_1.time_ >= var_20_39 + var_20_40 and arg_17_1.time_ < var_20_39 + var_20_40 + arg_20_0 then
				var_20_38.localPosition = Vector3.New(0, 100, 0)

				local var_20_45 = manager.ui.mainCamera.transform.position - var_20_38.position

				var_20_38.forward = Vector3.New(var_20_45.x, var_20_45.y, var_20_45.z)

				local var_20_46 = var_20_38.localEulerAngles

				var_20_46.z = 0
				var_20_46.x = 0
				var_20_38.localEulerAngles = var_20_46
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_47 = 4
			local var_20_48 = 1.075

			if var_20_47 < arg_17_1.time_ and arg_17_1.time_ <= var_20_47 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_49 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_49:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_50 = arg_17_1:GetWordFromCfg(319961004)
				local var_20_51 = arg_17_1:FormatText(var_20_50.content)

				arg_17_1.text_.text = var_20_51

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_52 = 43
				local var_20_53 = utf8.len(var_20_51)
				local var_20_54 = var_20_52 <= 0 and var_20_48 or var_20_48 * (var_20_53 / var_20_52)

				if var_20_54 > 0 and var_20_48 < var_20_54 then
					arg_17_1.talkMaxDuration = var_20_54
					var_20_47 = var_20_47 + 0.3

					if var_20_54 + var_20_47 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_54 + var_20_47
					end
				end

				arg_17_1.text_.text = var_20_51
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_55 = var_20_47 + 0.3
			local var_20_56 = math.max(var_20_48, arg_17_1.talkMaxDuration)

			if var_20_55 <= arg_17_1.time_ and arg_17_1.time_ < var_20_55 + var_20_56 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_55) / var_20_56

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_55 + var_20_56 and arg_17_1.time_ < var_20_55 + var_20_56 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play319961005 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319961005
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319961006(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1.55

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(319961005)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 62
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319961006 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319961006
		arg_27_1.duration_ = 8.4

		local var_27_0 = {
			zh = 6.1,
			ja = 8.4
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
				arg_27_0:Play319961007(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10014ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos10014ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(0.7, -1.06, -6.2)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos10014ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["10014ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect10014ui_story == nil then
				arg_27_1.var_.characterEffect10014ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect10014ui_story then
					arg_27_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect10014ui_story then
				arg_27_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_30_15 = arg_27_1.actors_["1095ui_story"].transform
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 then
				arg_27_1.var_.moveOldPos1095ui_story = var_30_15.localPosition
			end

			local var_30_17 = 0.001

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17
				local var_30_19 = Vector3.New(-0.7, -0.98, -6.1)

				var_30_15.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1095ui_story, var_30_19, var_30_18)

				local var_30_20 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_20.x, var_30_20.y, var_30_20.z)

				local var_30_21 = var_30_15.localEulerAngles

				var_30_21.z = 0
				var_30_21.x = 0
				var_30_15.localEulerAngles = var_30_21
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 then
				var_30_15.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_30_22 = manager.ui.mainCamera.transform.position - var_30_15.position

				var_30_15.forward = Vector3.New(var_30_22.x, var_30_22.y, var_30_22.z)

				local var_30_23 = var_30_15.localEulerAngles

				var_30_23.z = 0
				var_30_23.x = 0
				var_30_15.localEulerAngles = var_30_23
			end

			local var_30_24 = 0
			local var_30_25 = 0.725

			if var_30_24 < arg_27_1.time_ and arg_27_1.time_ <= var_30_24 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_26 = arg_27_1:FormatText(StoryNameCfg[264].name)

				arg_27_1.leftNameTxt_.text = var_30_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_27 = arg_27_1:GetWordFromCfg(319961006)
				local var_30_28 = arg_27_1:FormatText(var_30_27.content)

				arg_27_1.text_.text = var_30_28

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_29 = 29
				local var_30_30 = utf8.len(var_30_28)
				local var_30_31 = var_30_29 <= 0 and var_30_25 or var_30_25 * (var_30_30 / var_30_29)

				if var_30_31 > 0 and var_30_25 < var_30_31 then
					arg_27_1.talkMaxDuration = var_30_31

					if var_30_31 + var_30_24 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_31 + var_30_24
					end
				end

				arg_27_1.text_.text = var_30_28
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961006", "story_v_out_319961.awb") ~= 0 then
					local var_30_32 = manager.audio:GetVoiceLength("story_v_out_319961", "319961006", "story_v_out_319961.awb") / 1000

					if var_30_32 + var_30_24 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_24
					end

					if var_30_27.prefab_name ~= "" and arg_27_1.actors_[var_30_27.prefab_name] ~= nil then
						local var_30_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_27.prefab_name].transform, "story_v_out_319961", "319961006", "story_v_out_319961.awb")

						arg_27_1:RecordAudio("319961006", var_30_33)
						arg_27_1:RecordAudio("319961006", var_30_33)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_319961", "319961006", "story_v_out_319961.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_319961", "319961006", "story_v_out_319961.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_34 = math.max(var_30_25, arg_27_1.talkMaxDuration)

			if var_30_24 <= arg_27_1.time_ and arg_27_1.time_ < var_30_24 + var_30_34 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_24) / var_30_34

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_24 + var_30_34 and arg_27_1.time_ < var_30_24 + var_30_34 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319961007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319961007
		arg_31_1.duration_ = 4.57

		local var_31_0 = {
			zh = 2.366,
			ja = 4.566
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
				arg_31_0:Play319961008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10014ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect10014ui_story == nil then
				arg_31_1.var_.characterEffect10014ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect10014ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_31_1.var_.characterEffect10014ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect10014ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_31_1.var_.characterEffect10014ui_story.fillRatio = var_34_5
			end

			local var_34_6 = arg_31_1.actors_["1095ui_story"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story == nil then
				arg_31_1.var_.characterEffect1095ui_story = var_34_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_8 = 0.200000002980232

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_8 then
				local var_34_9 = (arg_31_1.time_ - var_34_7) / var_34_8

				if arg_31_1.var_.characterEffect1095ui_story then
					arg_31_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_8 and arg_31_1.time_ < var_34_7 + var_34_8 + arg_34_0 and arg_31_1.var_.characterEffect1095ui_story then
				arg_31_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_34_10 = 0
			local var_34_11 = 0.325

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_12 = arg_31_1:FormatText(StoryNameCfg[471].name)

				arg_31_1.leftNameTxt_.text = var_34_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_13 = arg_31_1:GetWordFromCfg(319961007)
				local var_34_14 = arg_31_1:FormatText(var_34_13.content)

				arg_31_1.text_.text = var_34_14

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_15 = 13
				local var_34_16 = utf8.len(var_34_14)
				local var_34_17 = var_34_15 <= 0 and var_34_11 or var_34_11 * (var_34_16 / var_34_15)

				if var_34_17 > 0 and var_34_11 < var_34_17 then
					arg_31_1.talkMaxDuration = var_34_17

					if var_34_17 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_17 + var_34_10
					end
				end

				arg_31_1.text_.text = var_34_14
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961007", "story_v_out_319961.awb") ~= 0 then
					local var_34_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961007", "story_v_out_319961.awb") / 1000

					if var_34_18 + var_34_10 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_18 + var_34_10
					end

					if var_34_13.prefab_name ~= "" and arg_31_1.actors_[var_34_13.prefab_name] ~= nil then
						local var_34_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_13.prefab_name].transform, "story_v_out_319961", "319961007", "story_v_out_319961.awb")

						arg_31_1:RecordAudio("319961007", var_34_19)
						arg_31_1:RecordAudio("319961007", var_34_19)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319961", "319961007", "story_v_out_319961.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319961", "319961007", "story_v_out_319961.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_20 = math.max(var_34_11, arg_31_1.talkMaxDuration)

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_20 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_10) / var_34_20

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_10 + var_34_20 and arg_31_1.time_ < var_34_10 + var_34_20 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319961008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319961008
		arg_35_1.duration_ = 7.37

		local var_35_0 = {
			zh = 2.266,
			ja = 7.366
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
				arg_35_0:Play319961009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1095ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1095ui_story then
					local var_38_4 = Mathf.Lerp(0, 0.5, var_38_3)

					arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_4
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				local var_38_5 = 0.5

				arg_35_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1095ui_story.fillRatio = var_38_5
			end

			local var_38_6 = arg_35_1.actors_["10014ui_story"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.characterEffect10014ui_story == nil then
				arg_35_1.var_.characterEffect10014ui_story = var_38_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_8 = 0.200000002980232

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.characterEffect10014ui_story then
					arg_35_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.characterEffect10014ui_story then
				arg_35_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_38_10 = 0
			local var_38_11 = 0.3

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_12 = arg_35_1:FormatText(StoryNameCfg[264].name)

				arg_35_1.leftNameTxt_.text = var_38_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_13 = arg_35_1:GetWordFromCfg(319961008)
				local var_38_14 = arg_35_1:FormatText(var_38_13.content)

				arg_35_1.text_.text = var_38_14

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_15 = 12
				local var_38_16 = utf8.len(var_38_14)
				local var_38_17 = var_38_15 <= 0 and var_38_11 or var_38_11 * (var_38_16 / var_38_15)

				if var_38_17 > 0 and var_38_11 < var_38_17 then
					arg_35_1.talkMaxDuration = var_38_17

					if var_38_17 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_17 + var_38_10
					end
				end

				arg_35_1.text_.text = var_38_14
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961008", "story_v_out_319961.awb") ~= 0 then
					local var_38_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961008", "story_v_out_319961.awb") / 1000

					if var_38_18 + var_38_10 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_10
					end

					if var_38_13.prefab_name ~= "" and arg_35_1.actors_[var_38_13.prefab_name] ~= nil then
						local var_38_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_13.prefab_name].transform, "story_v_out_319961", "319961008", "story_v_out_319961.awb")

						arg_35_1:RecordAudio("319961008", var_38_19)
						arg_35_1:RecordAudio("319961008", var_38_19)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319961", "319961008", "story_v_out_319961.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319961", "319961008", "story_v_out_319961.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_20 = math.max(var_38_11, arg_35_1.talkMaxDuration)

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_20 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_10) / var_38_20

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_10 + var_38_20 and arg_35_1.time_ < var_38_10 + var_38_20 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319961009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319961009
		arg_39_1.duration_ = 5.07

		local var_39_0 = {
			zh = 3.066,
			ja = 5.066
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
				arg_39_0:Play319961010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1095ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1095ui_story then
					arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				arg_39_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_42_4 = 0

			if var_42_4 < arg_39_1.time_ and arg_39_1.time_ <= var_42_4 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 then
				arg_39_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_42_6 = arg_39_1.actors_["10014ui_story"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.characterEffect10014ui_story == nil then
				arg_39_1.var_.characterEffect10014ui_story = var_42_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_8 = 0.200000002980232

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.characterEffect10014ui_story then
					local var_42_10 = Mathf.Lerp(0, 0.5, var_42_9)

					arg_39_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_39_1.var_.characterEffect10014ui_story.fillRatio = var_42_10
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.characterEffect10014ui_story then
				local var_42_11 = 0.5

				arg_39_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_39_1.var_.characterEffect10014ui_story.fillRatio = var_42_11
			end

			local var_42_12 = 0
			local var_42_13 = 0.4

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[471].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(319961009)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 16
				local var_42_18 = utf8.len(var_42_16)
				local var_42_19 = var_42_17 <= 0 and var_42_13 or var_42_13 * (var_42_18 / var_42_17)

				if var_42_19 > 0 and var_42_13 < var_42_19 then
					arg_39_1.talkMaxDuration = var_42_19

					if var_42_19 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_12
					end
				end

				arg_39_1.text_.text = var_42_16
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961009", "story_v_out_319961.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961009", "story_v_out_319961.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_319961", "319961009", "story_v_out_319961.awb")

						arg_39_1:RecordAudio("319961009", var_42_21)
						arg_39_1:RecordAudio("319961009", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319961", "319961009", "story_v_out_319961.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319961", "319961009", "story_v_out_319961.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_22 = math.max(var_42_13, arg_39_1.talkMaxDuration)

			if var_42_12 <= arg_39_1.time_ and arg_39_1.time_ < var_42_12 + var_42_22 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_12) / var_42_22

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_12 + var_42_22 and arg_39_1.time_ < var_42_12 + var_42_22 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319961010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319961010
		arg_43_1.duration_ = 5.9

		local var_43_0 = {
			zh = 5.9,
			ja = 5.4
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
				arg_43_0:Play319961011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.7

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[471].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(319961010)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961010", "story_v_out_319961.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961010", "story_v_out_319961.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_319961", "319961010", "story_v_out_319961.awb")

						arg_43_1:RecordAudio("319961010", var_46_9)
						arg_43_1:RecordAudio("319961010", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319961", "319961010", "story_v_out_319961.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319961", "319961010", "story_v_out_319961.awb")
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
	Play319961011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319961011
		arg_47_1.duration_ = 7.17

		local var_47_0 = {
			zh = 4.033,
			ja = 7.166
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
				arg_47_0:Play319961012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10014ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect10014ui_story == nil then
				arg_47_1.var_.characterEffect10014ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect10014ui_story then
					arg_47_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect10014ui_story then
				arg_47_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_50_4 = 0

			if var_50_4 < arg_47_1.time_ and arg_47_1.time_ <= var_50_4 + arg_50_0 then
				arg_47_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_2")
			end

			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_6 = arg_47_1.actors_["1095ui_story"]
			local var_50_7 = 0

			if var_50_7 < arg_47_1.time_ and arg_47_1.time_ <= var_50_7 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story == nil then
				arg_47_1.var_.characterEffect1095ui_story = var_50_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_8 = 0.200000002980232

			if var_50_7 <= arg_47_1.time_ and arg_47_1.time_ < var_50_7 + var_50_8 then
				local var_50_9 = (arg_47_1.time_ - var_50_7) / var_50_8

				if arg_47_1.var_.characterEffect1095ui_story then
					local var_50_10 = Mathf.Lerp(0, 0.5, var_50_9)

					arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_10
				end
			end

			if arg_47_1.time_ >= var_50_7 + var_50_8 and arg_47_1.time_ < var_50_7 + var_50_8 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story then
				local var_50_11 = 0.5

				arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_11
			end

			local var_50_12 = 0
			local var_50_13 = 0.525

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[264].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(319961011)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 21
				local var_50_18 = utf8.len(var_50_16)
				local var_50_19 = var_50_17 <= 0 and var_50_13 or var_50_13 * (var_50_18 / var_50_17)

				if var_50_19 > 0 and var_50_13 < var_50_19 then
					arg_47_1.talkMaxDuration = var_50_19

					if var_50_19 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_19 + var_50_12
					end
				end

				arg_47_1.text_.text = var_50_16
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961011", "story_v_out_319961.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961011", "story_v_out_319961.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_319961", "319961011", "story_v_out_319961.awb")

						arg_47_1:RecordAudio("319961011", var_50_21)
						arg_47_1:RecordAudio("319961011", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319961", "319961011", "story_v_out_319961.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319961", "319961011", "story_v_out_319961.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_22 = math.max(var_50_13, arg_47_1.talkMaxDuration)

			if var_50_12 <= arg_47_1.time_ and arg_47_1.time_ < var_50_12 + var_50_22 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_12) / var_50_22

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_12 + var_50_22 and arg_47_1.time_ < var_50_12 + var_50_22 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319961012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319961012
		arg_51_1.duration_ = 9.5

		local var_51_0 = {
			zh = 9.5,
			ja = 9.333
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
				arg_51_0:Play319961013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1095ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story == nil then
				arg_51_1.var_.characterEffect1095ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1095ui_story then
					arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story then
				arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["10014ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect10014ui_story == nil then
				arg_51_1.var_.characterEffect10014ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.200000002980232

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect10014ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_51_1.var_.characterEffect10014ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect10014ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_51_1.var_.characterEffect10014ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0
			local var_54_11 = 1.075

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_12 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_13 = arg_51_1:GetWordFromCfg(319961012)
				local var_54_14 = arg_51_1:FormatText(var_54_13.content)

				arg_51_1.text_.text = var_54_14

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_15 = 43
				local var_54_16 = utf8.len(var_54_14)
				local var_54_17 = var_54_15 <= 0 and var_54_11 or var_54_11 * (var_54_16 / var_54_15)

				if var_54_17 > 0 and var_54_11 < var_54_17 then
					arg_51_1.talkMaxDuration = var_54_17

					if var_54_17 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_17 + var_54_10
					end
				end

				arg_51_1.text_.text = var_54_14
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961012", "story_v_out_319961.awb") ~= 0 then
					local var_54_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961012", "story_v_out_319961.awb") / 1000

					if var_54_18 + var_54_10 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_18 + var_54_10
					end

					if var_54_13.prefab_name ~= "" and arg_51_1.actors_[var_54_13.prefab_name] ~= nil then
						local var_54_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_13.prefab_name].transform, "story_v_out_319961", "319961012", "story_v_out_319961.awb")

						arg_51_1:RecordAudio("319961012", var_54_19)
						arg_51_1:RecordAudio("319961012", var_54_19)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319961", "319961012", "story_v_out_319961.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319961", "319961012", "story_v_out_319961.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_20 = math.max(var_54_11, arg_51_1.talkMaxDuration)

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_20 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_10) / var_54_20

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_10 + var_54_20 and arg_51_1.time_ < var_54_10 + var_54_20 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319961013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319961013
		arg_55_1.duration_ = 5.33

		local var_55_0 = {
			zh = 4.066,
			ja = 5.333
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
				arg_55_0:Play319961014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_2 = 0
			local var_58_3 = 0.525

			if var_58_2 < arg_55_1.time_ and arg_55_1.time_ <= var_58_2 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_4 = arg_55_1:FormatText(StoryNameCfg[471].name)

				arg_55_1.leftNameTxt_.text = var_58_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_5 = arg_55_1:GetWordFromCfg(319961013)
				local var_58_6 = arg_55_1:FormatText(var_58_5.content)

				arg_55_1.text_.text = var_58_6

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_7 = 21
				local var_58_8 = utf8.len(var_58_6)
				local var_58_9 = var_58_7 <= 0 and var_58_3 or var_58_3 * (var_58_8 / var_58_7)

				if var_58_9 > 0 and var_58_3 < var_58_9 then
					arg_55_1.talkMaxDuration = var_58_9

					if var_58_9 + var_58_2 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_9 + var_58_2
					end
				end

				arg_55_1.text_.text = var_58_6
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961013", "story_v_out_319961.awb") ~= 0 then
					local var_58_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961013", "story_v_out_319961.awb") / 1000

					if var_58_10 + var_58_2 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_10 + var_58_2
					end

					if var_58_5.prefab_name ~= "" and arg_55_1.actors_[var_58_5.prefab_name] ~= nil then
						local var_58_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_5.prefab_name].transform, "story_v_out_319961", "319961013", "story_v_out_319961.awb")

						arg_55_1:RecordAudio("319961013", var_58_11)
						arg_55_1:RecordAudio("319961013", var_58_11)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319961", "319961013", "story_v_out_319961.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319961", "319961013", "story_v_out_319961.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_12 = math.max(var_58_3, arg_55_1.talkMaxDuration)

			if var_58_2 <= arg_55_1.time_ and arg_55_1.time_ < var_58_2 + var_58_12 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_2) / var_58_12

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_2 + var_58_12 and arg_55_1.time_ < var_58_2 + var_58_12 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319961014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319961014
		arg_59_1.duration_ = 6.13

		local var_59_0 = {
			zh = 4.5,
			ja = 6.133
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
				arg_59_0:Play319961015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1095ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1095ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_5
			end

			local var_62_6 = arg_59_1.actors_["10014ui_story"]
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 and arg_59_1.var_.characterEffect10014ui_story == nil then
				arg_59_1.var_.characterEffect10014ui_story = var_62_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_8 = 0.200000002980232

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8

				if arg_59_1.var_.characterEffect10014ui_story then
					arg_59_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 and arg_59_1.var_.characterEffect10014ui_story then
				arg_59_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_62_10 = 0
			local var_62_11 = 0.575

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_12 = arg_59_1:FormatText(StoryNameCfg[264].name)

				arg_59_1.leftNameTxt_.text = var_62_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_13 = arg_59_1:GetWordFromCfg(319961014)
				local var_62_14 = arg_59_1:FormatText(var_62_13.content)

				arg_59_1.text_.text = var_62_14

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_15 = 23
				local var_62_16 = utf8.len(var_62_14)
				local var_62_17 = var_62_15 <= 0 and var_62_11 or var_62_11 * (var_62_16 / var_62_15)

				if var_62_17 > 0 and var_62_11 < var_62_17 then
					arg_59_1.talkMaxDuration = var_62_17

					if var_62_17 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_17 + var_62_10
					end
				end

				arg_59_1.text_.text = var_62_14
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961014", "story_v_out_319961.awb") ~= 0 then
					local var_62_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961014", "story_v_out_319961.awb") / 1000

					if var_62_18 + var_62_10 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_18 + var_62_10
					end

					if var_62_13.prefab_name ~= "" and arg_59_1.actors_[var_62_13.prefab_name] ~= nil then
						local var_62_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_13.prefab_name].transform, "story_v_out_319961", "319961014", "story_v_out_319961.awb")

						arg_59_1:RecordAudio("319961014", var_62_19)
						arg_59_1:RecordAudio("319961014", var_62_19)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319961", "319961014", "story_v_out_319961.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319961", "319961014", "story_v_out_319961.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_20 = math.max(var_62_11, arg_59_1.talkMaxDuration)

			if var_62_10 <= arg_59_1.time_ and arg_59_1.time_ < var_62_10 + var_62_20 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_10) / var_62_20

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_10 + var_62_20 and arg_59_1.time_ < var_62_10 + var_62_20 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319961015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319961015
		arg_63_1.duration_ = 5.37

		local var_63_0 = {
			zh = 2.633,
			ja = 5.366
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
				arg_63_0:Play319961016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1095ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1095ui_story then
					arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				arg_63_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["10014ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect10014ui_story == nil then
				arg_63_1.var_.characterEffect10014ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.200000002980232

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect10014ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_63_1.var_.characterEffect10014ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect10014ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_63_1.var_.characterEffect10014ui_story.fillRatio = var_66_9
			end

			local var_66_10 = 0
			local var_66_11 = 0.325

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_12 = arg_63_1:FormatText(StoryNameCfg[471].name)

				arg_63_1.leftNameTxt_.text = var_66_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_13 = arg_63_1:GetWordFromCfg(319961015)
				local var_66_14 = arg_63_1:FormatText(var_66_13.content)

				arg_63_1.text_.text = var_66_14

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_15 = 13
				local var_66_16 = utf8.len(var_66_14)
				local var_66_17 = var_66_15 <= 0 and var_66_11 or var_66_11 * (var_66_16 / var_66_15)

				if var_66_17 > 0 and var_66_11 < var_66_17 then
					arg_63_1.talkMaxDuration = var_66_17

					if var_66_17 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_17 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_14
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961015", "story_v_out_319961.awb") ~= 0 then
					local var_66_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961015", "story_v_out_319961.awb") / 1000

					if var_66_18 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_10
					end

					if var_66_13.prefab_name ~= "" and arg_63_1.actors_[var_66_13.prefab_name] ~= nil then
						local var_66_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_13.prefab_name].transform, "story_v_out_319961", "319961015", "story_v_out_319961.awb")

						arg_63_1:RecordAudio("319961015", var_66_19)
						arg_63_1:RecordAudio("319961015", var_66_19)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319961", "319961015", "story_v_out_319961.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319961", "319961015", "story_v_out_319961.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_20 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_20 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_20

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_20 and arg_63_1.time_ < var_66_10 + var_66_20 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319961016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319961016
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play319961017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1095ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story == nil then
				arg_67_1.var_.characterEffect1095ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.200000002980232

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1095ui_story then
					local var_70_4 = Mathf.Lerp(0, 0.5, var_70_3)

					arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_4
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1095ui_story then
				local var_70_5 = 0.5

				arg_67_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_67_1.var_.characterEffect1095ui_story.fillRatio = var_70_5
			end

			local var_70_6 = 0
			local var_70_7 = 0.65

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_8 = arg_67_1:GetWordFromCfg(319961016)
				local var_70_9 = arg_67_1:FormatText(var_70_8.content)

				arg_67_1.text_.text = var_70_9

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_10 = 26
				local var_70_11 = utf8.len(var_70_9)
				local var_70_12 = var_70_10 <= 0 and var_70_7 or var_70_7 * (var_70_11 / var_70_10)

				if var_70_12 > 0 and var_70_7 < var_70_12 then
					arg_67_1.talkMaxDuration = var_70_12

					if var_70_12 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_12 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_9
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_13 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_13 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_13

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_13 and arg_67_1.time_ < var_70_6 + var_70_13 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319961017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319961017
		arg_71_1.duration_ = 4.9

		local var_71_0 = {
			zh = 2.833,
			ja = 4.9
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
				arg_71_0:Play319961018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1095ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story == nil then
				arg_71_1.var_.characterEffect1095ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1095ui_story then
					arg_71_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1095ui_story then
				arg_71_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_74_4 = 0
			local var_74_5 = 0.3

			if var_74_4 < arg_71_1.time_ and arg_71_1.time_ <= var_74_4 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_6 = arg_71_1:FormatText(StoryNameCfg[471].name)

				arg_71_1.leftNameTxt_.text = var_74_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_7 = arg_71_1:GetWordFromCfg(319961017)
				local var_74_8 = arg_71_1:FormatText(var_74_7.content)

				arg_71_1.text_.text = var_74_8

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_9 = 12
				local var_74_10 = utf8.len(var_74_8)
				local var_74_11 = var_74_9 <= 0 and var_74_5 or var_74_5 * (var_74_10 / var_74_9)

				if var_74_11 > 0 and var_74_5 < var_74_11 then
					arg_71_1.talkMaxDuration = var_74_11

					if var_74_11 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_11 + var_74_4
					end
				end

				arg_71_1.text_.text = var_74_8
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961017", "story_v_out_319961.awb") ~= 0 then
					local var_74_12 = manager.audio:GetVoiceLength("story_v_out_319961", "319961017", "story_v_out_319961.awb") / 1000

					if var_74_12 + var_74_4 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_4
					end

					if var_74_7.prefab_name ~= "" and arg_71_1.actors_[var_74_7.prefab_name] ~= nil then
						local var_74_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_7.prefab_name].transform, "story_v_out_319961", "319961017", "story_v_out_319961.awb")

						arg_71_1:RecordAudio("319961017", var_74_13)
						arg_71_1:RecordAudio("319961017", var_74_13)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319961", "319961017", "story_v_out_319961.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319961", "319961017", "story_v_out_319961.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_14 = math.max(var_74_5, arg_71_1.talkMaxDuration)

			if var_74_4 <= arg_71_1.time_ and arg_71_1.time_ < var_74_4 + var_74_14 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_4) / var_74_14

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_4 + var_74_14 and arg_71_1.time_ < var_74_4 + var_74_14 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319961018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319961018
		arg_75_1.duration_ = 3

		local var_75_0 = {
			zh = 1.999999999999,
			ja = 3
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
				arg_75_0:Play319961019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10014ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10014ui_story == nil then
				arg_75_1.var_.characterEffect10014ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10014ui_story then
					arg_75_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10014ui_story then
				arg_75_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_5 = arg_75_1.actors_["1095ui_story"]
			local var_78_6 = 0

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story == nil then
				arg_75_1.var_.characterEffect1095ui_story = var_78_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_7 = 0.200000002980232

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_7 then
				local var_78_8 = (arg_75_1.time_ - var_78_6) / var_78_7

				if arg_75_1.var_.characterEffect1095ui_story then
					local var_78_9 = Mathf.Lerp(0, 0.5, var_78_8)

					arg_75_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1095ui_story.fillRatio = var_78_9
				end
			end

			if arg_75_1.time_ >= var_78_6 + var_78_7 and arg_75_1.time_ < var_78_6 + var_78_7 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story then
				local var_78_10 = 0.5

				arg_75_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1095ui_story.fillRatio = var_78_10
			end

			local var_78_11 = 0
			local var_78_12 = 0.275

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_13 = arg_75_1:FormatText(StoryNameCfg[264].name)

				arg_75_1.leftNameTxt_.text = var_78_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_14 = arg_75_1:GetWordFromCfg(319961018)
				local var_78_15 = arg_75_1:FormatText(var_78_14.content)

				arg_75_1.text_.text = var_78_15

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_16 = 11
				local var_78_17 = utf8.len(var_78_15)
				local var_78_18 = var_78_16 <= 0 and var_78_12 or var_78_12 * (var_78_17 / var_78_16)

				if var_78_18 > 0 and var_78_12 < var_78_18 then
					arg_75_1.talkMaxDuration = var_78_18

					if var_78_18 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_11
					end
				end

				arg_75_1.text_.text = var_78_15
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961018", "story_v_out_319961.awb") ~= 0 then
					local var_78_19 = manager.audio:GetVoiceLength("story_v_out_319961", "319961018", "story_v_out_319961.awb") / 1000

					if var_78_19 + var_78_11 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_11
					end

					if var_78_14.prefab_name ~= "" and arg_75_1.actors_[var_78_14.prefab_name] ~= nil then
						local var_78_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_14.prefab_name].transform, "story_v_out_319961", "319961018", "story_v_out_319961.awb")

						arg_75_1:RecordAudio("319961018", var_78_20)
						arg_75_1:RecordAudio("319961018", var_78_20)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319961", "319961018", "story_v_out_319961.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319961", "319961018", "story_v_out_319961.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_21 = math.max(var_78_12, arg_75_1.talkMaxDuration)

			if var_78_11 <= arg_75_1.time_ and arg_75_1.time_ < var_78_11 + var_78_21 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_11) / var_78_21

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_11 + var_78_21 and arg_75_1.time_ < var_78_11 + var_78_21 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319961019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319961019
		arg_79_1.duration_ = 6.07

		local var_79_0 = {
			zh = 1.999999999999,
			ja = 6.066
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
				arg_79_0:Play319961020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1095ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story == nil then
				arg_79_1.var_.characterEffect1095ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1095ui_story then
					arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story then
				arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_6 = arg_79_1.actors_["10014ui_story"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.characterEffect10014ui_story == nil then
				arg_79_1.var_.characterEffect10014ui_story = var_82_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_8 = 0.200000002980232

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.characterEffect10014ui_story then
					local var_82_10 = Mathf.Lerp(0, 0.5, var_82_9)

					arg_79_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_79_1.var_.characterEffect10014ui_story.fillRatio = var_82_10
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.characterEffect10014ui_story then
				local var_82_11 = 0.5

				arg_79_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_79_1.var_.characterEffect10014ui_story.fillRatio = var_82_11
			end

			local var_82_12 = 0
			local var_82_13 = 0.2

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[471].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(319961019)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 8
				local var_82_18 = utf8.len(var_82_16)
				local var_82_19 = var_82_17 <= 0 and var_82_13 or var_82_13 * (var_82_18 / var_82_17)

				if var_82_19 > 0 and var_82_13 < var_82_19 then
					arg_79_1.talkMaxDuration = var_82_19

					if var_82_19 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_19 + var_82_12
					end
				end

				arg_79_1.text_.text = var_82_16
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961019", "story_v_out_319961.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961019", "story_v_out_319961.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_319961", "319961019", "story_v_out_319961.awb")

						arg_79_1:RecordAudio("319961019", var_82_21)
						arg_79_1:RecordAudio("319961019", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319961", "319961019", "story_v_out_319961.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319961", "319961019", "story_v_out_319961.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_22 = math.max(var_82_13, arg_79_1.talkMaxDuration)

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_22 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_12) / var_82_22

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_12 + var_82_22 and arg_79_1.time_ < var_82_12 + var_82_22 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319961020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319961020
		arg_83_1.duration_ = 7.43

		local var_83_0 = {
			zh = 3.666,
			ja = 7.433
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
				arg_83_0:Play319961021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1095ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story == nil then
				arg_83_1.var_.characterEffect1095ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1095ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["10014ui_story"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.characterEffect10014ui_story == nil then
				arg_83_1.var_.characterEffect10014ui_story = var_86_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_8 = 0.200000002980232

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.characterEffect10014ui_story then
					arg_83_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.characterEffect10014ui_story then
				arg_83_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_86_11 = 0
			local var_86_12 = 0.375

			if var_86_11 < arg_83_1.time_ and arg_83_1.time_ <= var_86_11 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_13 = arg_83_1:FormatText(StoryNameCfg[264].name)

				arg_83_1.leftNameTxt_.text = var_86_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_14 = arg_83_1:GetWordFromCfg(319961020)
				local var_86_15 = arg_83_1:FormatText(var_86_14.content)

				arg_83_1.text_.text = var_86_15

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_16 = 15
				local var_86_17 = utf8.len(var_86_15)
				local var_86_18 = var_86_16 <= 0 and var_86_12 or var_86_12 * (var_86_17 / var_86_16)

				if var_86_18 > 0 and var_86_12 < var_86_18 then
					arg_83_1.talkMaxDuration = var_86_18

					if var_86_18 + var_86_11 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_11
					end
				end

				arg_83_1.text_.text = var_86_15
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961020", "story_v_out_319961.awb") ~= 0 then
					local var_86_19 = manager.audio:GetVoiceLength("story_v_out_319961", "319961020", "story_v_out_319961.awb") / 1000

					if var_86_19 + var_86_11 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_11
					end

					if var_86_14.prefab_name ~= "" and arg_83_1.actors_[var_86_14.prefab_name] ~= nil then
						local var_86_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_14.prefab_name].transform, "story_v_out_319961", "319961020", "story_v_out_319961.awb")

						arg_83_1:RecordAudio("319961020", var_86_20)
						arg_83_1:RecordAudio("319961020", var_86_20)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319961", "319961020", "story_v_out_319961.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319961", "319961020", "story_v_out_319961.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_21 = math.max(var_86_12, arg_83_1.talkMaxDuration)

			if var_86_11 <= arg_83_1.time_ and arg_83_1.time_ < var_86_11 + var_86_21 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_11) / var_86_21

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_11 + var_86_21 and arg_83_1.time_ < var_86_11 + var_86_21 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319961021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319961021
		arg_87_1.duration_ = 5.13

		local var_87_0 = {
			zh = 1.7,
			ja = 5.133
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
				arg_87_0:Play319961022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1095ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story == nil then
				arg_87_1.var_.characterEffect1095ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1095ui_story then
					arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story then
				arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["10014ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect10014ui_story == nil then
				arg_87_1.var_.characterEffect10014ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.200000002980232

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect10014ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_87_1.var_.characterEffect10014ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect10014ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_87_1.var_.characterEffect10014ui_story.fillRatio = var_90_9
			end

			local var_90_10 = 0
			local var_90_11 = 0.2

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_12 = arg_87_1:FormatText(StoryNameCfg[471].name)

				arg_87_1.leftNameTxt_.text = var_90_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_13 = arg_87_1:GetWordFromCfg(319961021)
				local var_90_14 = arg_87_1:FormatText(var_90_13.content)

				arg_87_1.text_.text = var_90_14

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_15 = 8
				local var_90_16 = utf8.len(var_90_14)
				local var_90_17 = var_90_15 <= 0 and var_90_11 or var_90_11 * (var_90_16 / var_90_15)

				if var_90_17 > 0 and var_90_11 < var_90_17 then
					arg_87_1.talkMaxDuration = var_90_17

					if var_90_17 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_17 + var_90_10
					end
				end

				arg_87_1.text_.text = var_90_14
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961021", "story_v_out_319961.awb") ~= 0 then
					local var_90_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961021", "story_v_out_319961.awb") / 1000

					if var_90_18 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_10
					end

					if var_90_13.prefab_name ~= "" and arg_87_1.actors_[var_90_13.prefab_name] ~= nil then
						local var_90_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_13.prefab_name].transform, "story_v_out_319961", "319961021", "story_v_out_319961.awb")

						arg_87_1:RecordAudio("319961021", var_90_19)
						arg_87_1:RecordAudio("319961021", var_90_19)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319961", "319961021", "story_v_out_319961.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319961", "319961021", "story_v_out_319961.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_20 = math.max(var_90_11, arg_87_1.talkMaxDuration)

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_20 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_10) / var_90_20

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_10 + var_90_20 and arg_87_1.time_ < var_90_10 + var_90_20 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319961022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319961022
		arg_91_1.duration_ = 10.3

		local var_91_0 = {
			zh = 5.9,
			ja = 10.3
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
				arg_91_0:Play319961023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10014ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect10014ui_story == nil then
				arg_91_1.var_.characterEffect10014ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect10014ui_story then
					arg_91_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect10014ui_story then
				arg_91_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1095ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story == nil then
				arg_91_1.var_.characterEffect1095ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.200000002980232

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1095ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_9
			end

			local var_94_10 = 0
			local var_94_11 = 0.625

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_12 = arg_91_1:FormatText(StoryNameCfg[264].name)

				arg_91_1.leftNameTxt_.text = var_94_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_13 = arg_91_1:GetWordFromCfg(319961022)
				local var_94_14 = arg_91_1:FormatText(var_94_13.content)

				arg_91_1.text_.text = var_94_14

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_15 = 25
				local var_94_16 = utf8.len(var_94_14)
				local var_94_17 = var_94_15 <= 0 and var_94_11 or var_94_11 * (var_94_16 / var_94_15)

				if var_94_17 > 0 and var_94_11 < var_94_17 then
					arg_91_1.talkMaxDuration = var_94_17

					if var_94_17 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_17 + var_94_10
					end
				end

				arg_91_1.text_.text = var_94_14
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961022", "story_v_out_319961.awb") ~= 0 then
					local var_94_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961022", "story_v_out_319961.awb") / 1000

					if var_94_18 + var_94_10 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_18 + var_94_10
					end

					if var_94_13.prefab_name ~= "" and arg_91_1.actors_[var_94_13.prefab_name] ~= nil then
						local var_94_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_13.prefab_name].transform, "story_v_out_319961", "319961022", "story_v_out_319961.awb")

						arg_91_1:RecordAudio("319961022", var_94_19)
						arg_91_1:RecordAudio("319961022", var_94_19)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319961", "319961022", "story_v_out_319961.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319961", "319961022", "story_v_out_319961.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_20 = math.max(var_94_11, arg_91_1.talkMaxDuration)

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_20 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_10) / var_94_20

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_10 + var_94_20 and arg_91_1.time_ < var_94_10 + var_94_20 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319961023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319961023
		arg_95_1.duration_ = 2.17

		local var_95_0 = {
			zh = 1.999999999999,
			ja = 2.166
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
				arg_95_0:Play319961024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1095ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1095ui_story == nil then
				arg_95_1.var_.characterEffect1095ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1095ui_story then
					arg_95_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1095ui_story then
				arg_95_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_98_4 = 0

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_98_6 = arg_95_1.actors_["10014ui_story"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.characterEffect10014ui_story == nil then
				arg_95_1.var_.characterEffect10014ui_story = var_98_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_8 = 0.200000002980232

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.characterEffect10014ui_story then
					local var_98_10 = Mathf.Lerp(0, 0.5, var_98_9)

					arg_95_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10014ui_story.fillRatio = var_98_10
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.characterEffect10014ui_story then
				local var_98_11 = 0.5

				arg_95_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10014ui_story.fillRatio = var_98_11
			end

			local var_98_12 = 0
			local var_98_13 = 0.125

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[471].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(319961023)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 5
				local var_98_18 = utf8.len(var_98_16)
				local var_98_19 = var_98_17 <= 0 and var_98_13 or var_98_13 * (var_98_18 / var_98_17)

				if var_98_19 > 0 and var_98_13 < var_98_19 then
					arg_95_1.talkMaxDuration = var_98_19

					if var_98_19 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_19 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_16
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961023", "story_v_out_319961.awb") ~= 0 then
					local var_98_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961023", "story_v_out_319961.awb") / 1000

					if var_98_20 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_12
					end

					if var_98_15.prefab_name ~= "" and arg_95_1.actors_[var_98_15.prefab_name] ~= nil then
						local var_98_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_15.prefab_name].transform, "story_v_out_319961", "319961023", "story_v_out_319961.awb")

						arg_95_1:RecordAudio("319961023", var_98_21)
						arg_95_1:RecordAudio("319961023", var_98_21)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319961", "319961023", "story_v_out_319961.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319961", "319961023", "story_v_out_319961.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_22 and arg_95_1.time_ < var_98_12 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319961024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319961024
		arg_99_1.duration_ = 7.23

		local var_99_0 = {
			zh = 5.3,
			ja = 7.233
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
				arg_99_0:Play319961025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10014ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10014ui_story == nil then
				arg_99_1.var_.characterEffect10014ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10014ui_story then
					arg_99_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10014ui_story then
				arg_99_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_102_4 = 0

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_2")
			end

			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 then
				arg_99_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_6 = arg_99_1.actors_["1095ui_story"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story == nil then
				arg_99_1.var_.characterEffect1095ui_story = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.200000002980232

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect1095ui_story then
					local var_102_10 = Mathf.Lerp(0, 0.5, var_102_9)

					arg_99_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1095ui_story.fillRatio = var_102_10
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story then
				local var_102_11 = 0.5

				arg_99_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1095ui_story.fillRatio = var_102_11
			end

			local var_102_12 = 0
			local var_102_13 = 0.525

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[264].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(319961024)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961024", "story_v_out_319961.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961024", "story_v_out_319961.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_319961", "319961024", "story_v_out_319961.awb")

						arg_99_1:RecordAudio("319961024", var_102_21)
						arg_99_1:RecordAudio("319961024", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319961", "319961024", "story_v_out_319961.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319961", "319961024", "story_v_out_319961.awb")
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
	Play319961025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319961025
		arg_103_1.duration_ = 4.47

		local var_103_0 = {
			zh = 2.766,
			ja = 4.466
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
				arg_103_0:Play319961026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.3

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[264].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(319961025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 12
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961025", "story_v_out_319961.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961025", "story_v_out_319961.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_319961", "319961025", "story_v_out_319961.awb")

						arg_103_1:RecordAudio("319961025", var_106_9)
						arg_103_1:RecordAudio("319961025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319961", "319961025", "story_v_out_319961.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319961", "319961025", "story_v_out_319961.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319961026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319961026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play319961027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				local var_110_2 = "play"
				local var_110_3 = "effect"

				arg_107_1:AudioAction(var_110_2, var_110_3, "se_story_16", "se_story_16_energy02", "")
			end

			local var_110_4 = arg_107_1.actors_["10014ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect10014ui_story == nil then
				arg_107_1.var_.characterEffect10014ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.200000002980232

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect10014ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_107_1.var_.characterEffect10014ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect10014ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_107_1.var_.characterEffect10014ui_story.fillRatio = var_110_9
			end

			local var_110_10 = arg_107_1.actors_["10014ui_story"].transform
			local var_110_11 = 0

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.var_.moveOldPos10014ui_story = var_110_10.localPosition
			end

			local var_110_12 = 0.001

			if var_110_11 <= arg_107_1.time_ and arg_107_1.time_ < var_110_11 + var_110_12 then
				local var_110_13 = (arg_107_1.time_ - var_110_11) / var_110_12
				local var_110_14 = Vector3.New(0, 100, 0)

				var_110_10.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10014ui_story, var_110_14, var_110_13)

				local var_110_15 = manager.ui.mainCamera.transform.position - var_110_10.position

				var_110_10.forward = Vector3.New(var_110_15.x, var_110_15.y, var_110_15.z)

				local var_110_16 = var_110_10.localEulerAngles

				var_110_16.z = 0
				var_110_16.x = 0
				var_110_10.localEulerAngles = var_110_16
			end

			if arg_107_1.time_ >= var_110_11 + var_110_12 and arg_107_1.time_ < var_110_11 + var_110_12 + arg_110_0 then
				var_110_10.localPosition = Vector3.New(0, 100, 0)

				local var_110_17 = manager.ui.mainCamera.transform.position - var_110_10.position

				var_110_10.forward = Vector3.New(var_110_17.x, var_110_17.y, var_110_17.z)

				local var_110_18 = var_110_10.localEulerAngles

				var_110_18.z = 0
				var_110_18.x = 0
				var_110_10.localEulerAngles = var_110_18
			end

			local var_110_19 = arg_107_1.actors_["1095ui_story"].transform
			local var_110_20 = 0

			if var_110_20 < arg_107_1.time_ and arg_107_1.time_ <= var_110_20 + arg_110_0 then
				arg_107_1.var_.moveOldPos1095ui_story = var_110_19.localPosition
			end

			local var_110_21 = 0.001

			if var_110_20 <= arg_107_1.time_ and arg_107_1.time_ < var_110_20 + var_110_21 then
				local var_110_22 = (arg_107_1.time_ - var_110_20) / var_110_21
				local var_110_23 = Vector3.New(0, 100, 0)

				var_110_19.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1095ui_story, var_110_23, var_110_22)

				local var_110_24 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_24.x, var_110_24.y, var_110_24.z)

				local var_110_25 = var_110_19.localEulerAngles

				var_110_25.z = 0
				var_110_25.x = 0
				var_110_19.localEulerAngles = var_110_25
			end

			if arg_107_1.time_ >= var_110_20 + var_110_21 and arg_107_1.time_ < var_110_20 + var_110_21 + arg_110_0 then
				var_110_19.localPosition = Vector3.New(0, 100, 0)

				local var_110_26 = manager.ui.mainCamera.transform.position - var_110_19.position

				var_110_19.forward = Vector3.New(var_110_26.x, var_110_26.y, var_110_26.z)

				local var_110_27 = var_110_19.localEulerAngles

				var_110_27.z = 0
				var_110_27.x = 0
				var_110_19.localEulerAngles = var_110_27
			end

			local var_110_28 = 0
			local var_110_29 = 0.9

			if var_110_28 < arg_107_1.time_ and arg_107_1.time_ <= var_110_28 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_30 = arg_107_1:GetWordFromCfg(319961026)
				local var_110_31 = arg_107_1:FormatText(var_110_30.content)

				arg_107_1.text_.text = var_110_31

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_32 = 36
				local var_110_33 = utf8.len(var_110_31)
				local var_110_34 = var_110_32 <= 0 and var_110_29 or var_110_29 * (var_110_33 / var_110_32)

				if var_110_34 > 0 and var_110_29 < var_110_34 then
					arg_107_1.talkMaxDuration = var_110_34

					if var_110_34 + var_110_28 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_34 + var_110_28
					end
				end

				arg_107_1.text_.text = var_110_31
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_35 = math.max(var_110_29, arg_107_1.talkMaxDuration)

			if var_110_28 <= arg_107_1.time_ and arg_107_1.time_ < var_110_28 + var_110_35 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_28) / var_110_35

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_28 + var_110_35 and arg_107_1.time_ < var_110_28 + var_110_35 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319961027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319961027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play319961028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.575

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_2 = arg_111_1:GetWordFromCfg(319961027)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 63
				local var_114_5 = utf8.len(var_114_3)
				local var_114_6 = var_114_4 <= 0 and var_114_1 or var_114_1 * (var_114_5 / var_114_4)

				if var_114_6 > 0 and var_114_1 < var_114_6 then
					arg_111_1.talkMaxDuration = var_114_6

					if var_114_6 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_6 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_3
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_7 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_7 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_7

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_7 and arg_111_1.time_ < var_114_0 + var_114_7 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319961028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319961028
		arg_115_1.duration_ = 2.33

		local var_115_0 = {
			zh = 2,
			ja = 2.333
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
				arg_115_0:Play319961029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = "1284ui_story"

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

			local var_118_4 = arg_115_1.actors_["1284ui_story"].transform
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 then
				arg_115_1.var_.moveOldPos1284ui_story = var_118_4.localPosition

				local var_118_6 = "1284ui_story"

				arg_115_1:ShowWeapon(arg_115_1.var_[var_118_6 .. "Animator"].transform, false)
			end

			local var_118_7 = 0.001

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_7 then
				local var_118_8 = (arg_115_1.time_ - var_118_5) / var_118_7
				local var_118_9 = Vector3.New(0, -0.985, -6.22)

				var_118_4.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1284ui_story, var_118_9, var_118_8)

				local var_118_10 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_10.x, var_118_10.y, var_118_10.z)

				local var_118_11 = var_118_4.localEulerAngles

				var_118_11.z = 0
				var_118_11.x = 0
				var_118_4.localEulerAngles = var_118_11
			end

			if arg_115_1.time_ >= var_118_5 + var_118_7 and arg_115_1.time_ < var_118_5 + var_118_7 + arg_118_0 then
				var_118_4.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_118_12 = manager.ui.mainCamera.transform.position - var_118_4.position

				var_118_4.forward = Vector3.New(var_118_12.x, var_118_12.y, var_118_12.z)

				local var_118_13 = var_118_4.localEulerAngles

				var_118_13.z = 0
				var_118_13.x = 0
				var_118_4.localEulerAngles = var_118_13
			end

			local var_118_14 = arg_115_1.actors_["1284ui_story"]
			local var_118_15 = 0

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 and arg_115_1.var_.characterEffect1284ui_story == nil then
				arg_115_1.var_.characterEffect1284ui_story = var_118_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_16 = 0.200000002980232

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_16 then
				local var_118_17 = (arg_115_1.time_ - var_118_15) / var_118_16

				if arg_115_1.var_.characterEffect1284ui_story then
					arg_115_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_15 + var_118_16 and arg_115_1.time_ < var_118_15 + var_118_16 + arg_118_0 and arg_115_1.var_.characterEffect1284ui_story then
				arg_115_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_118_18 = 0

			if var_118_18 < arg_115_1.time_ and arg_115_1.time_ <= var_118_18 + arg_118_0 then
				arg_115_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action10_2")
			end

			local var_118_19 = 0

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_118_20 = 0
			local var_118_21 = 0.075

			if var_118_20 < arg_115_1.time_ and arg_115_1.time_ <= var_118_20 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_22 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_23 = arg_115_1:GetWordFromCfg(319961028)
				local var_118_24 = arg_115_1:FormatText(var_118_23.content)

				arg_115_1.text_.text = var_118_24

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_25 = 3
				local var_118_26 = utf8.len(var_118_24)
				local var_118_27 = var_118_25 <= 0 and var_118_21 or var_118_21 * (var_118_26 / var_118_25)

				if var_118_27 > 0 and var_118_21 < var_118_27 then
					arg_115_1.talkMaxDuration = var_118_27

					if var_118_27 + var_118_20 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_20
					end
				end

				arg_115_1.text_.text = var_118_24
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961028", "story_v_out_319961.awb") ~= 0 then
					local var_118_28 = manager.audio:GetVoiceLength("story_v_out_319961", "319961028", "story_v_out_319961.awb") / 1000

					if var_118_28 + var_118_20 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_28 + var_118_20
					end

					if var_118_23.prefab_name ~= "" and arg_115_1.actors_[var_118_23.prefab_name] ~= nil then
						local var_118_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_23.prefab_name].transform, "story_v_out_319961", "319961028", "story_v_out_319961.awb")

						arg_115_1:RecordAudio("319961028", var_118_29)
						arg_115_1:RecordAudio("319961028", var_118_29)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319961", "319961028", "story_v_out_319961.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319961", "319961028", "story_v_out_319961.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_30 = math.max(var_118_21, arg_115_1.talkMaxDuration)

			if var_118_20 <= arg_115_1.time_ and arg_115_1.time_ < var_118_20 + var_118_30 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_20) / var_118_30

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_20 + var_118_30 and arg_115_1.time_ < var_118_20 + var_118_30 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319961029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319961029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play319961030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1284ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1284ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1284ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, 100, 0)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1284ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1284ui_story == nil then
				arg_119_1.var_.characterEffect1284ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1284ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1284ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1284ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1284ui_story.fillRatio = var_122_14
			end

			local var_122_15 = 0
			local var_122_16 = 0.475

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_17 = arg_119_1:GetWordFromCfg(319961029)
				local var_122_18 = arg_119_1:FormatText(var_122_17.content)

				arg_119_1.text_.text = var_122_18

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_19 = 19
				local var_122_20 = utf8.len(var_122_18)
				local var_122_21 = var_122_19 <= 0 and var_122_16 or var_122_16 * (var_122_20 / var_122_19)

				if var_122_21 > 0 and var_122_16 < var_122_21 then
					arg_119_1.talkMaxDuration = var_122_21

					if var_122_21 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_18
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_22 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_22 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_22

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_22 and arg_119_1.time_ < var_122_15 + var_122_22 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319961030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319961030
		arg_123_1.duration_ = 2.63

		local var_123_0 = {
			zh = 1.4,
			ja = 2.633
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
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play319961031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10014ui_story"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos10014ui_story = var_126_0.localPosition
			end

			local var_126_2 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2
				local var_126_4 = Vector3.New(0, -1.06, -6.2)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10014ui_story, var_126_4, var_126_3)

				local var_126_5 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_5.x, var_126_5.y, var_126_5.z)

				local var_126_6 = var_126_0.localEulerAngles

				var_126_6.z = 0
				var_126_6.x = 0
				var_126_0.localEulerAngles = var_126_6
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_126_7 = manager.ui.mainCamera.transform.position - var_126_0.position

				var_126_0.forward = Vector3.New(var_126_7.x, var_126_7.y, var_126_7.z)

				local var_126_8 = var_126_0.localEulerAngles

				var_126_8.z = 0
				var_126_8.x = 0
				var_126_0.localEulerAngles = var_126_8
			end

			local var_126_9 = arg_123_1.actors_["10014ui_story"]
			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 and arg_123_1.var_.characterEffect10014ui_story == nil then
				arg_123_1.var_.characterEffect10014ui_story = var_126_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_11 = 0.200000002980232

			if var_126_10 <= arg_123_1.time_ and arg_123_1.time_ < var_126_10 + var_126_11 then
				local var_126_12 = (arg_123_1.time_ - var_126_10) / var_126_11

				if arg_123_1.var_.characterEffect10014ui_story then
					arg_123_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_10 + var_126_11 and arg_123_1.time_ < var_126_10 + var_126_11 + arg_126_0 and arg_123_1.var_.characterEffect10014ui_story then
				arg_123_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_126_13 = 0

			if var_126_13 < arg_123_1.time_ and arg_123_1.time_ <= var_126_13 + arg_126_0 then
				arg_123_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 then
				arg_123_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_126_15 = 0
			local var_126_16 = 0.2

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[264].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(319961030)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 8
				local var_126_21 = utf8.len(var_126_19)
				local var_126_22 = var_126_20 <= 0 and var_126_16 or var_126_16 * (var_126_21 / var_126_20)

				if var_126_22 > 0 and var_126_16 < var_126_22 then
					arg_123_1.talkMaxDuration = var_126_22

					if var_126_22 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_22 + var_126_15
					end
				end

				arg_123_1.text_.text = var_126_19
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961030", "story_v_out_319961.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961030", "story_v_out_319961.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_319961", "319961030", "story_v_out_319961.awb")

						arg_123_1:RecordAudio("319961030", var_126_24)
						arg_123_1:RecordAudio("319961030", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319961", "319961030", "story_v_out_319961.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319961", "319961030", "story_v_out_319961.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_25 = math.max(var_126_16, arg_123_1.talkMaxDuration)

			if var_126_15 <= arg_123_1.time_ and arg_123_1.time_ < var_126_15 + var_126_25 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_15) / var_126_25

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_15 + var_126_25 and arg_123_1.time_ < var_126_15 + var_126_25 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319961031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 319961031
		arg_127_1.duration_ = 2.8

		local var_127_0 = {
			zh = 2.8,
			ja = 2.5
		}
		local var_127_1 = manager.audio:GetLocalizationFlag()

		if var_127_0[var_127_1] ~= nil then
			arg_127_1.duration_ = var_127_0[var_127_1]
		end

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play319961032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10014ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10014ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, -1.06, -6.2)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10014ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["10014ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect10014ui_story == nil then
				arg_127_1.var_.characterEffect10014ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect10014ui_story then
					arg_127_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect10014ui_story then
				arg_127_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.35

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[264].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(319961031)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 14
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961031", "story_v_out_319961.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961031", "story_v_out_319961.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_out_319961", "319961031", "story_v_out_319961.awb")

						arg_127_1:RecordAudio("319961031", var_130_24)
						arg_127_1:RecordAudio("319961031", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_319961", "319961031", "story_v_out_319961.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_319961", "319961031", "story_v_out_319961.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_25 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_25 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_25

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_25 and arg_127_1.time_ < var_130_15 + var_130_25 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play319961032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 319961032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play319961033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10014ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect10014ui_story == nil then
				arg_131_1.var_.characterEffect10014ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect10014ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_131_1.var_.characterEffect10014ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect10014ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_131_1.var_.characterEffect10014ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 1.275

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_8 = arg_131_1:GetWordFromCfg(319961032)
				local var_134_9 = arg_131_1:FormatText(var_134_8.content)

				arg_131_1.text_.text = var_134_9

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_10 = 51
				local var_134_11 = utf8.len(var_134_9)
				local var_134_12 = var_134_10 <= 0 and var_134_7 or var_134_7 * (var_134_11 / var_134_10)

				if var_134_12 > 0 and var_134_7 < var_134_12 then
					arg_131_1.talkMaxDuration = var_134_12

					if var_134_12 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_12 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_9
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_13 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_13 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_13

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_13 and arg_131_1.time_ < var_134_6 + var_134_13 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play319961033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 319961033
		arg_135_1.duration_ = 2.3

		local var_135_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_135_0:Play319961034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1284ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1284ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0.7, -0.985, -6.22)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1284ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1284ui_story"]
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 and arg_135_1.var_.characterEffect1284ui_story == nil then
				arg_135_1.var_.characterEffect1284ui_story = var_138_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_11 = 0.200000002980232

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11

				if arg_135_1.var_.characterEffect1284ui_story then
					arg_135_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 and arg_135_1.var_.characterEffect1284ui_story then
				arg_135_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action8_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_138_15 = arg_135_1.actors_["10014ui_story"].transform
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 then
				arg_135_1.var_.moveOldPos10014ui_story = var_138_15.localPosition
			end

			local var_138_17 = 0.001

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17
				local var_138_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_138_15.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10014ui_story, var_138_19, var_138_18)

				local var_138_20 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_20.x, var_138_20.y, var_138_20.z)

				local var_138_21 = var_138_15.localEulerAngles

				var_138_21.z = 0
				var_138_21.x = 0
				var_138_15.localEulerAngles = var_138_21
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 then
				var_138_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_138_22 = manager.ui.mainCamera.transform.position - var_138_15.position

				var_138_15.forward = Vector3.New(var_138_22.x, var_138_22.y, var_138_22.z)

				local var_138_23 = var_138_15.localEulerAngles

				var_138_23.z = 0
				var_138_23.x = 0
				var_138_15.localEulerAngles = var_138_23
			end

			local var_138_24 = arg_135_1.actors_["10014ui_story"]
			local var_138_25 = 0

			if var_138_25 < arg_135_1.time_ and arg_135_1.time_ <= var_138_25 + arg_138_0 and arg_135_1.var_.characterEffect10014ui_story == nil then
				arg_135_1.var_.characterEffect10014ui_story = var_138_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_26 = 0.200000002980232

			if var_138_25 <= arg_135_1.time_ and arg_135_1.time_ < var_138_25 + var_138_26 then
				local var_138_27 = (arg_135_1.time_ - var_138_25) / var_138_26

				if arg_135_1.var_.characterEffect10014ui_story then
					local var_138_28 = Mathf.Lerp(0, 0.5, var_138_27)

					arg_135_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_135_1.var_.characterEffect10014ui_story.fillRatio = var_138_28
				end
			end

			if arg_135_1.time_ >= var_138_25 + var_138_26 and arg_135_1.time_ < var_138_25 + var_138_26 + arg_138_0 and arg_135_1.var_.characterEffect10014ui_story then
				local var_138_29 = 0.5

				arg_135_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_135_1.var_.characterEffect10014ui_story.fillRatio = var_138_29
			end

			local var_138_30 = 0
			local var_138_31 = 0.2

			if var_138_30 < arg_135_1.time_ and arg_135_1.time_ <= var_138_30 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_32 = arg_135_1:FormatText(StoryNameCfg[6].name)

				arg_135_1.leftNameTxt_.text = var_138_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_33 = arg_135_1:GetWordFromCfg(319961033)
				local var_138_34 = arg_135_1:FormatText(var_138_33.content)

				arg_135_1.text_.text = var_138_34

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_35 = 8
				local var_138_36 = utf8.len(var_138_34)
				local var_138_37 = var_138_35 <= 0 and var_138_31 or var_138_31 * (var_138_36 / var_138_35)

				if var_138_37 > 0 and var_138_31 < var_138_37 then
					arg_135_1.talkMaxDuration = var_138_37

					if var_138_37 + var_138_30 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_37 + var_138_30
					end
				end

				arg_135_1.text_.text = var_138_34
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961033", "story_v_out_319961.awb") ~= 0 then
					local var_138_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961033", "story_v_out_319961.awb") / 1000

					if var_138_38 + var_138_30 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_38 + var_138_30
					end

					if var_138_33.prefab_name ~= "" and arg_135_1.actors_[var_138_33.prefab_name] ~= nil then
						local var_138_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_33.prefab_name].transform, "story_v_out_319961", "319961033", "story_v_out_319961.awb")

						arg_135_1:RecordAudio("319961033", var_138_39)
						arg_135_1:RecordAudio("319961033", var_138_39)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_319961", "319961033", "story_v_out_319961.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_319961", "319961033", "story_v_out_319961.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_40 = math.max(var_138_31, arg_135_1.talkMaxDuration)

			if var_138_30 <= arg_135_1.time_ and arg_135_1.time_ < var_138_30 + var_138_40 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_30) / var_138_40

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_30 + var_138_40 and arg_135_1.time_ < var_138_30 + var_138_40 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play319961034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 319961034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play319961035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1284ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1284ui_story == nil then
				arg_139_1.var_.characterEffect1284ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.200000002980232

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1284ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1284ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1284ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1284ui_story.fillRatio = var_142_5
			end

			local var_142_6 = arg_139_1.actors_["1284ui_story"].transform
			local var_142_7 = 0

			if var_142_7 < arg_139_1.time_ and arg_139_1.time_ <= var_142_7 + arg_142_0 then
				arg_139_1.var_.moveOldPos1284ui_story = var_142_6.localPosition
			end

			local var_142_8 = 0.001

			if var_142_7 <= arg_139_1.time_ and arg_139_1.time_ < var_142_7 + var_142_8 then
				local var_142_9 = (arg_139_1.time_ - var_142_7) / var_142_8
				local var_142_10 = Vector3.New(0, 100, 0)

				var_142_6.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1284ui_story, var_142_10, var_142_9)

				local var_142_11 = manager.ui.mainCamera.transform.position - var_142_6.position

				var_142_6.forward = Vector3.New(var_142_11.x, var_142_11.y, var_142_11.z)

				local var_142_12 = var_142_6.localEulerAngles

				var_142_12.z = 0
				var_142_12.x = 0
				var_142_6.localEulerAngles = var_142_12
			end

			if arg_139_1.time_ >= var_142_7 + var_142_8 and arg_139_1.time_ < var_142_7 + var_142_8 + arg_142_0 then
				var_142_6.localPosition = Vector3.New(0, 100, 0)

				local var_142_13 = manager.ui.mainCamera.transform.position - var_142_6.position

				var_142_6.forward = Vector3.New(var_142_13.x, var_142_13.y, var_142_13.z)

				local var_142_14 = var_142_6.localEulerAngles

				var_142_14.z = 0
				var_142_14.x = 0
				var_142_6.localEulerAngles = var_142_14
			end

			local var_142_15 = arg_139_1.actors_["10014ui_story"].transform
			local var_142_16 = 0

			if var_142_16 < arg_139_1.time_ and arg_139_1.time_ <= var_142_16 + arg_142_0 then
				arg_139_1.var_.moveOldPos10014ui_story = var_142_15.localPosition
			end

			local var_142_17 = 0.001

			if var_142_16 <= arg_139_1.time_ and arg_139_1.time_ < var_142_16 + var_142_17 then
				local var_142_18 = (arg_139_1.time_ - var_142_16) / var_142_17
				local var_142_19 = Vector3.New(0, 100, 0)

				var_142_15.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10014ui_story, var_142_19, var_142_18)

				local var_142_20 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_20.x, var_142_20.y, var_142_20.z)

				local var_142_21 = var_142_15.localEulerAngles

				var_142_21.z = 0
				var_142_21.x = 0
				var_142_15.localEulerAngles = var_142_21
			end

			if arg_139_1.time_ >= var_142_16 + var_142_17 and arg_139_1.time_ < var_142_16 + var_142_17 + arg_142_0 then
				var_142_15.localPosition = Vector3.New(0, 100, 0)

				local var_142_22 = manager.ui.mainCamera.transform.position - var_142_15.position

				var_142_15.forward = Vector3.New(var_142_22.x, var_142_22.y, var_142_22.z)

				local var_142_23 = var_142_15.localEulerAngles

				var_142_23.z = 0
				var_142_23.x = 0
				var_142_15.localEulerAngles = var_142_23
			end

			local var_142_24 = 0
			local var_142_25 = 1.35

			if var_142_24 < arg_139_1.time_ and arg_139_1.time_ <= var_142_24 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_26 = arg_139_1:GetWordFromCfg(319961034)
				local var_142_27 = arg_139_1:FormatText(var_142_26.content)

				arg_139_1.text_.text = var_142_27

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_28 = 54
				local var_142_29 = utf8.len(var_142_27)
				local var_142_30 = var_142_28 <= 0 and var_142_25 or var_142_25 * (var_142_29 / var_142_28)

				if var_142_30 > 0 and var_142_25 < var_142_30 then
					arg_139_1.talkMaxDuration = var_142_30

					if var_142_30 + var_142_24 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_30 + var_142_24
					end
				end

				arg_139_1.text_.text = var_142_27
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_31 = math.max(var_142_25, arg_139_1.talkMaxDuration)

			if var_142_24 <= arg_139_1.time_ and arg_139_1.time_ < var_142_24 + var_142_31 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_24) / var_142_31

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_24 + var_142_31 and arg_139_1.time_ < var_142_24 + var_142_31 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play319961035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 319961035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play319961036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 1.3

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_2 = arg_143_1:GetWordFromCfg(319961035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 52
				local var_146_5 = utf8.len(var_146_3)
				local var_146_6 = var_146_4 <= 0 and var_146_1 or var_146_1 * (var_146_5 / var_146_4)

				if var_146_6 > 0 and var_146_1 < var_146_6 then
					arg_143_1.talkMaxDuration = var_146_6

					if var_146_6 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_6 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_3
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_7 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_7 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_7

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_7 and arg_143_1.time_ < var_146_0 + var_146_7 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play319961036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 319961036
		arg_147_1.duration_ = 2.37

		local var_147_0 = {
			zh = 2.033,
			ja = 2.366
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
				arg_147_0:Play319961037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1284ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1284ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, -0.985, -6.22)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1284ui_story, var_150_4, var_150_3)

				local var_150_5 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_5.x, var_150_5.y, var_150_5.z)

				local var_150_6 = var_150_0.localEulerAngles

				var_150_6.z = 0
				var_150_6.x = 0
				var_150_0.localEulerAngles = var_150_6
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_150_7 = manager.ui.mainCamera.transform.position - var_150_0.position

				var_150_0.forward = Vector3.New(var_150_7.x, var_150_7.y, var_150_7.z)

				local var_150_8 = var_150_0.localEulerAngles

				var_150_8.z = 0
				var_150_8.x = 0
				var_150_0.localEulerAngles = var_150_8
			end

			local var_150_9 = 0

			if var_150_9 < arg_147_1.time_ and arg_147_1.time_ <= var_150_9 + arg_150_0 then
				arg_147_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_150_10 = 0

			if var_150_10 < arg_147_1.time_ and arg_147_1.time_ <= var_150_10 + arg_150_0 then
				arg_147_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_150_11 = arg_147_1.actors_["1284ui_story"]
			local var_150_12 = 0

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 and arg_147_1.var_.characterEffect1284ui_story == nil then
				arg_147_1.var_.characterEffect1284ui_story = var_150_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_13 = 0.2

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_13 then
				local var_150_14 = (arg_147_1.time_ - var_150_12) / var_150_13

				if arg_147_1.var_.characterEffect1284ui_story then
					arg_147_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_12 + var_150_13 and arg_147_1.time_ < var_150_12 + var_150_13 + arg_150_0 and arg_147_1.var_.characterEffect1284ui_story then
				arg_147_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_150_15 = 0
			local var_150_16 = 0.175

			if var_150_15 < arg_147_1.time_ and arg_147_1.time_ <= var_150_15 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_17 = arg_147_1:FormatText(StoryNameCfg[6].name)

				arg_147_1.leftNameTxt_.text = var_150_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_18 = arg_147_1:GetWordFromCfg(319961036)
				local var_150_19 = arg_147_1:FormatText(var_150_18.content)

				arg_147_1.text_.text = var_150_19

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_20 = 7
				local var_150_21 = utf8.len(var_150_19)
				local var_150_22 = var_150_20 <= 0 and var_150_16 or var_150_16 * (var_150_21 / var_150_20)

				if var_150_22 > 0 and var_150_16 < var_150_22 then
					arg_147_1.talkMaxDuration = var_150_22

					if var_150_22 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_22 + var_150_15
					end
				end

				arg_147_1.text_.text = var_150_19
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961036", "story_v_out_319961.awb") ~= 0 then
					local var_150_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961036", "story_v_out_319961.awb") / 1000

					if var_150_23 + var_150_15 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_23 + var_150_15
					end

					if var_150_18.prefab_name ~= "" and arg_147_1.actors_[var_150_18.prefab_name] ~= nil then
						local var_150_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_18.prefab_name].transform, "story_v_out_319961", "319961036", "story_v_out_319961.awb")

						arg_147_1:RecordAudio("319961036", var_150_24)
						arg_147_1:RecordAudio("319961036", var_150_24)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_319961", "319961036", "story_v_out_319961.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_319961", "319961036", "story_v_out_319961.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_25 = math.max(var_150_16, arg_147_1.talkMaxDuration)

			if var_150_15 <= arg_147_1.time_ and arg_147_1.time_ < var_150_15 + var_150_25 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_15) / var_150_25

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_15 + var_150_25 and arg_147_1.time_ < var_150_15 + var_150_25 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play319961037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 319961037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play319961038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1284ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect1284ui_story == nil then
				arg_151_1.var_.characterEffect1284ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect1284ui_story then
					local var_154_4 = Mathf.Lerp(0, 0.5, var_154_3)

					arg_151_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_151_1.var_.characterEffect1284ui_story.fillRatio = var_154_4
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect1284ui_story then
				local var_154_5 = 0.5

				arg_151_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_151_1.var_.characterEffect1284ui_story.fillRatio = var_154_5
			end

			local var_154_6 = 0
			local var_154_7 = 1.2

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_8 = arg_151_1:GetWordFromCfg(319961037)
				local var_154_9 = arg_151_1:FormatText(var_154_8.content)

				arg_151_1.text_.text = var_154_9

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_10 = 48
				local var_154_11 = utf8.len(var_154_9)
				local var_154_12 = var_154_10 <= 0 and var_154_7 or var_154_7 * (var_154_11 / var_154_10)

				if var_154_12 > 0 and var_154_7 < var_154_12 then
					arg_151_1.talkMaxDuration = var_154_12

					if var_154_12 + var_154_6 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_12 + var_154_6
					end
				end

				arg_151_1.text_.text = var_154_9
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_13 = math.max(var_154_7, arg_151_1.talkMaxDuration)

			if var_154_6 <= arg_151_1.time_ and arg_151_1.time_ < var_154_6 + var_154_13 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_6) / var_154_13

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_6 + var_154_13 and arg_151_1.time_ < var_154_6 + var_154_13 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play319961038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319961038
		arg_155_1.duration_ = 5.33

		local var_155_0 = {
			zh = 4.466,
			ja = 5.333
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
				arg_155_0:Play319961039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1284ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1284ui_story == nil then
				arg_155_1.var_.characterEffect1284ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1284ui_story then
					arg_155_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1284ui_story then
				arg_155_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_158_4 = 0

			if var_158_4 < arg_155_1.time_ and arg_155_1.time_ <= var_158_4 + arg_158_0 then
				arg_155_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_1")
			end

			local var_158_5 = 0

			if var_158_5 < arg_155_1.time_ and arg_155_1.time_ <= var_158_5 + arg_158_0 then
				arg_155_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_158_6 = 0
			local var_158_7 = 0.5

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_8 = arg_155_1:FormatText(StoryNameCfg[6].name)

				arg_155_1.leftNameTxt_.text = var_158_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_9 = arg_155_1:GetWordFromCfg(319961038)
				local var_158_10 = arg_155_1:FormatText(var_158_9.content)

				arg_155_1.text_.text = var_158_10

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_11 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961038", "story_v_out_319961.awb") ~= 0 then
					local var_158_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961038", "story_v_out_319961.awb") / 1000

					if var_158_14 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_14 + var_158_6
					end

					if var_158_9.prefab_name ~= "" and arg_155_1.actors_[var_158_9.prefab_name] ~= nil then
						local var_158_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_9.prefab_name].transform, "story_v_out_319961", "319961038", "story_v_out_319961.awb")

						arg_155_1:RecordAudio("319961038", var_158_15)
						arg_155_1:RecordAudio("319961038", var_158_15)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_319961", "319961038", "story_v_out_319961.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_319961", "319961038", "story_v_out_319961.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_16 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_16 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_16

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_16 and arg_155_1.time_ < var_158_6 + var_158_16 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319961039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319961039
		arg_159_1.duration_ = 7.87

		local var_159_0 = {
			zh = 5.5,
			ja = 7.866
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
				arg_159_0:Play319961040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10014ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10014ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10014ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["10014ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect10014ui_story == nil then
				arg_159_1.var_.characterEffect10014ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect10014ui_story then
					arg_159_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect10014ui_story then
				arg_159_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_162_15 = arg_159_1.actors_["1284ui_story"]
			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 and arg_159_1.var_.characterEffect1284ui_story == nil then
				arg_159_1.var_.characterEffect1284ui_story = var_162_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_17 = 0.200000002980232

			if var_162_16 <= arg_159_1.time_ and arg_159_1.time_ < var_162_16 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_16) / var_162_17

				if arg_159_1.var_.characterEffect1284ui_story then
					local var_162_19 = Mathf.Lerp(0, 0.5, var_162_18)

					arg_159_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1284ui_story.fillRatio = var_162_19
				end
			end

			if arg_159_1.time_ >= var_162_16 + var_162_17 and arg_159_1.time_ < var_162_16 + var_162_17 + arg_162_0 and arg_159_1.var_.characterEffect1284ui_story then
				local var_162_20 = 0.5

				arg_159_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1284ui_story.fillRatio = var_162_20
			end

			local var_162_21 = arg_159_1.actors_["1284ui_story"].transform
			local var_162_22 = 0

			if var_162_22 < arg_159_1.time_ and arg_159_1.time_ <= var_162_22 + arg_162_0 then
				arg_159_1.var_.moveOldPos1284ui_story = var_162_21.localPosition
			end

			local var_162_23 = 0.001

			if var_162_22 <= arg_159_1.time_ and arg_159_1.time_ < var_162_22 + var_162_23 then
				local var_162_24 = (arg_159_1.time_ - var_162_22) / var_162_23
				local var_162_25 = Vector3.New(0.7, -0.985, -6.22)

				var_162_21.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1284ui_story, var_162_25, var_162_24)

				local var_162_26 = manager.ui.mainCamera.transform.position - var_162_21.position

				var_162_21.forward = Vector3.New(var_162_26.x, var_162_26.y, var_162_26.z)

				local var_162_27 = var_162_21.localEulerAngles

				var_162_27.z = 0
				var_162_27.x = 0
				var_162_21.localEulerAngles = var_162_27
			end

			if arg_159_1.time_ >= var_162_22 + var_162_23 and arg_159_1.time_ < var_162_22 + var_162_23 + arg_162_0 then
				var_162_21.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_162_28 = manager.ui.mainCamera.transform.position - var_162_21.position

				var_162_21.forward = Vector3.New(var_162_28.x, var_162_28.y, var_162_28.z)

				local var_162_29 = var_162_21.localEulerAngles

				var_162_29.z = 0
				var_162_29.x = 0
				var_162_21.localEulerAngles = var_162_29
			end

			local var_162_30 = 0
			local var_162_31 = 0.65

			if var_162_30 < arg_159_1.time_ and arg_159_1.time_ <= var_162_30 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_32 = arg_159_1:FormatText(StoryNameCfg[264].name)

				arg_159_1.leftNameTxt_.text = var_162_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_33 = arg_159_1:GetWordFromCfg(319961039)
				local var_162_34 = arg_159_1:FormatText(var_162_33.content)

				arg_159_1.text_.text = var_162_34

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_35 = 26
				local var_162_36 = utf8.len(var_162_34)
				local var_162_37 = var_162_35 <= 0 and var_162_31 or var_162_31 * (var_162_36 / var_162_35)

				if var_162_37 > 0 and var_162_31 < var_162_37 then
					arg_159_1.talkMaxDuration = var_162_37

					if var_162_37 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_37 + var_162_30
					end
				end

				arg_159_1.text_.text = var_162_34
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961039", "story_v_out_319961.awb") ~= 0 then
					local var_162_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961039", "story_v_out_319961.awb") / 1000

					if var_162_38 + var_162_30 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_38 + var_162_30
					end

					if var_162_33.prefab_name ~= "" and arg_159_1.actors_[var_162_33.prefab_name] ~= nil then
						local var_162_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_33.prefab_name].transform, "story_v_out_319961", "319961039", "story_v_out_319961.awb")

						arg_159_1:RecordAudio("319961039", var_162_39)
						arg_159_1:RecordAudio("319961039", var_162_39)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_319961", "319961039", "story_v_out_319961.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_319961", "319961039", "story_v_out_319961.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_40 = math.max(var_162_31, arg_159_1.talkMaxDuration)

			if var_162_30 <= arg_159_1.time_ and arg_159_1.time_ < var_162_30 + var_162_40 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_30) / var_162_40

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_30 + var_162_40 and arg_159_1.time_ < var_162_30 + var_162_40 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play319961040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319961040
		arg_163_1.duration_ = 7.9

		local var_163_0 = {
			zh = 7.9,
			ja = 5.566
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
				arg_163_0:Play319961041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10014ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect10014ui_story == nil then
				arg_163_1.var_.characterEffect10014ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.200000002980232

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect10014ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_163_1.var_.characterEffect10014ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect10014ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_163_1.var_.characterEffect10014ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1284ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1284ui_story == nil then
				arg_163_1.var_.characterEffect1284ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.200000002980232

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1284ui_story then
					arg_163_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1284ui_story then
				arg_163_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_166_12 = 0
			local var_166_13 = 0.95

			if var_166_12 < arg_163_1.time_ and arg_163_1.time_ <= var_166_12 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_14 = arg_163_1:FormatText(StoryNameCfg[6].name)

				arg_163_1.leftNameTxt_.text = var_166_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_15 = arg_163_1:GetWordFromCfg(319961040)
				local var_166_16 = arg_163_1:FormatText(var_166_15.content)

				arg_163_1.text_.text = var_166_16

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_17 = 38
				local var_166_18 = utf8.len(var_166_16)
				local var_166_19 = var_166_17 <= 0 and var_166_13 or var_166_13 * (var_166_18 / var_166_17)

				if var_166_19 > 0 and var_166_13 < var_166_19 then
					arg_163_1.talkMaxDuration = var_166_19

					if var_166_19 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_12
					end
				end

				arg_163_1.text_.text = var_166_16
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961040", "story_v_out_319961.awb") ~= 0 then
					local var_166_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961040", "story_v_out_319961.awb") / 1000

					if var_166_20 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_12
					end

					if var_166_15.prefab_name ~= "" and arg_163_1.actors_[var_166_15.prefab_name] ~= nil then
						local var_166_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_15.prefab_name].transform, "story_v_out_319961", "319961040", "story_v_out_319961.awb")

						arg_163_1:RecordAudio("319961040", var_166_21)
						arg_163_1:RecordAudio("319961040", var_166_21)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_319961", "319961040", "story_v_out_319961.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_319961", "319961040", "story_v_out_319961.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_22 = math.max(var_166_13, arg_163_1.talkMaxDuration)

			if var_166_12 <= arg_163_1.time_ and arg_163_1.time_ < var_166_12 + var_166_22 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_12) / var_166_22

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_12 + var_166_22 and arg_163_1.time_ < var_166_12 + var_166_22 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319961041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319961041
		arg_167_1.duration_ = 5.3

		local var_167_0 = {
			zh = 2.866,
			ja = 5.3
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
				arg_167_0:Play319961042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10014ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect10014ui_story == nil then
				arg_167_1.var_.characterEffect10014ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect10014ui_story then
					arg_167_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect10014ui_story then
				arg_167_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_170_4 = arg_167_1.actors_["1284ui_story"]
			local var_170_5 = 0

			if var_170_5 < arg_167_1.time_ and arg_167_1.time_ <= var_170_5 + arg_170_0 and arg_167_1.var_.characterEffect1284ui_story == nil then
				arg_167_1.var_.characterEffect1284ui_story = var_170_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_6 = 0.200000002980232

			if var_170_5 <= arg_167_1.time_ and arg_167_1.time_ < var_170_5 + var_170_6 then
				local var_170_7 = (arg_167_1.time_ - var_170_5) / var_170_6

				if arg_167_1.var_.characterEffect1284ui_story then
					local var_170_8 = Mathf.Lerp(0, 0.5, var_170_7)

					arg_167_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1284ui_story.fillRatio = var_170_8
				end
			end

			if arg_167_1.time_ >= var_170_5 + var_170_6 and arg_167_1.time_ < var_170_5 + var_170_6 + arg_170_0 and arg_167_1.var_.characterEffect1284ui_story then
				local var_170_9 = 0.5

				arg_167_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1284ui_story.fillRatio = var_170_9
			end

			local var_170_10 = 0
			local var_170_11 = 0.275

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_12 = arg_167_1:FormatText(StoryNameCfg[264].name)

				arg_167_1.leftNameTxt_.text = var_170_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_13 = arg_167_1:GetWordFromCfg(319961041)
				local var_170_14 = arg_167_1:FormatText(var_170_13.content)

				arg_167_1.text_.text = var_170_14

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_15 = 11
				local var_170_16 = utf8.len(var_170_14)
				local var_170_17 = var_170_15 <= 0 and var_170_11 or var_170_11 * (var_170_16 / var_170_15)

				if var_170_17 > 0 and var_170_11 < var_170_17 then
					arg_167_1.talkMaxDuration = var_170_17

					if var_170_17 + var_170_10 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_17 + var_170_10
					end
				end

				arg_167_1.text_.text = var_170_14
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961041", "story_v_out_319961.awb") ~= 0 then
					local var_170_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961041", "story_v_out_319961.awb") / 1000

					if var_170_18 + var_170_10 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_18 + var_170_10
					end

					if var_170_13.prefab_name ~= "" and arg_167_1.actors_[var_170_13.prefab_name] ~= nil then
						local var_170_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_13.prefab_name].transform, "story_v_out_319961", "319961041", "story_v_out_319961.awb")

						arg_167_1:RecordAudio("319961041", var_170_19)
						arg_167_1:RecordAudio("319961041", var_170_19)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_319961", "319961041", "story_v_out_319961.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_319961", "319961041", "story_v_out_319961.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_20 = math.max(var_170_11, arg_167_1.talkMaxDuration)

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_20 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_10) / var_170_20

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_10 + var_170_20 and arg_167_1.time_ < var_170_10 + var_170_20 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319961042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319961042
		arg_171_1.duration_ = 3.17

		local var_171_0 = {
			zh = 1.433,
			ja = 3.166
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
				arg_171_0:Play319961043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10014ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect10014ui_story == nil then
				arg_171_1.var_.characterEffect10014ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.200000002980232

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect10014ui_story then
					local var_174_4 = Mathf.Lerp(0, 0.5, var_174_3)

					arg_171_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_171_1.var_.characterEffect10014ui_story.fillRatio = var_174_4
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect10014ui_story then
				local var_174_5 = 0.5

				arg_171_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_171_1.var_.characterEffect10014ui_story.fillRatio = var_174_5
			end

			local var_174_6 = arg_171_1.actors_["1284ui_story"]
			local var_174_7 = 0

			if var_174_7 < arg_171_1.time_ and arg_171_1.time_ <= var_174_7 + arg_174_0 and arg_171_1.var_.characterEffect1284ui_story == nil then
				arg_171_1.var_.characterEffect1284ui_story = var_174_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_8 = 0.200000002980232

			if var_174_7 <= arg_171_1.time_ and arg_171_1.time_ < var_174_7 + var_174_8 then
				local var_174_9 = (arg_171_1.time_ - var_174_7) / var_174_8

				if arg_171_1.var_.characterEffect1284ui_story then
					arg_171_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_7 + var_174_8 and arg_171_1.time_ < var_174_7 + var_174_8 + arg_174_0 and arg_171_1.var_.characterEffect1284ui_story then
				arg_171_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_174_10 = 0
			local var_174_11 = 0.125

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_12 = arg_171_1:FormatText(StoryNameCfg[6].name)

				arg_171_1.leftNameTxt_.text = var_174_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_13 = arg_171_1:GetWordFromCfg(319961042)
				local var_174_14 = arg_171_1:FormatText(var_174_13.content)

				arg_171_1.text_.text = var_174_14

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_15 = 5
				local var_174_16 = utf8.len(var_174_14)
				local var_174_17 = var_174_15 <= 0 and var_174_11 or var_174_11 * (var_174_16 / var_174_15)

				if var_174_17 > 0 and var_174_11 < var_174_17 then
					arg_171_1.talkMaxDuration = var_174_17

					if var_174_17 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_17 + var_174_10
					end
				end

				arg_171_1.text_.text = var_174_14
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961042", "story_v_out_319961.awb") ~= 0 then
					local var_174_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961042", "story_v_out_319961.awb") / 1000

					if var_174_18 + var_174_10 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_10
					end

					if var_174_13.prefab_name ~= "" and arg_171_1.actors_[var_174_13.prefab_name] ~= nil then
						local var_174_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_13.prefab_name].transform, "story_v_out_319961", "319961042", "story_v_out_319961.awb")

						arg_171_1:RecordAudio("319961042", var_174_19)
						arg_171_1:RecordAudio("319961042", var_174_19)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319961", "319961042", "story_v_out_319961.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319961", "319961042", "story_v_out_319961.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_20 = math.max(var_174_11, arg_171_1.talkMaxDuration)

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_20 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_10) / var_174_20

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_10 + var_174_20 and arg_171_1.time_ < var_174_10 + var_174_20 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319961043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319961043
		arg_175_1.duration_ = 10

		local var_175_0 = {
			zh = 9.1,
			ja = 10
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
				arg_175_0:Play319961044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10014ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect10014ui_story == nil then
				arg_175_1.var_.characterEffect10014ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect10014ui_story then
					arg_175_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect10014ui_story then
				arg_175_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_178_4 = 0

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				arg_175_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014actionlink/10014action425")
			end

			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_178_6 = arg_175_1.actors_["1284ui_story"]
			local var_178_7 = 0

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 and arg_175_1.var_.characterEffect1284ui_story == nil then
				arg_175_1.var_.characterEffect1284ui_story = var_178_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_8 = 0.200000002980232

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_8 then
				local var_178_9 = (arg_175_1.time_ - var_178_7) / var_178_8

				if arg_175_1.var_.characterEffect1284ui_story then
					local var_178_10 = Mathf.Lerp(0, 0.5, var_178_9)

					arg_175_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1284ui_story.fillRatio = var_178_10
				end
			end

			if arg_175_1.time_ >= var_178_7 + var_178_8 and arg_175_1.time_ < var_178_7 + var_178_8 + arg_178_0 and arg_175_1.var_.characterEffect1284ui_story then
				local var_178_11 = 0.5

				arg_175_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1284ui_story.fillRatio = var_178_11
			end

			local var_178_12 = 0
			local var_178_13 = 1.1

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_14 = arg_175_1:FormatText(StoryNameCfg[264].name)

				arg_175_1.leftNameTxt_.text = var_178_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_15 = arg_175_1:GetWordFromCfg(319961043)
				local var_178_16 = arg_175_1:FormatText(var_178_15.content)

				arg_175_1.text_.text = var_178_16

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_17 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961043", "story_v_out_319961.awb") ~= 0 then
					local var_178_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961043", "story_v_out_319961.awb") / 1000

					if var_178_20 + var_178_12 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_20 + var_178_12
					end

					if var_178_15.prefab_name ~= "" and arg_175_1.actors_[var_178_15.prefab_name] ~= nil then
						local var_178_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_15.prefab_name].transform, "story_v_out_319961", "319961043", "story_v_out_319961.awb")

						arg_175_1:RecordAudio("319961043", var_178_21)
						arg_175_1:RecordAudio("319961043", var_178_21)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_319961", "319961043", "story_v_out_319961.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_319961", "319961043", "story_v_out_319961.awb")
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
	Play319961044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319961044
		arg_179_1.duration_ = 11.5

		local var_179_0 = {
			zh = 11.5,
			ja = 9.933
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play319961045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.4

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[264].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(319961044)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 56
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961044", "story_v_out_319961.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961044", "story_v_out_319961.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_319961", "319961044", "story_v_out_319961.awb")

						arg_179_1:RecordAudio("319961044", var_182_9)
						arg_179_1:RecordAudio("319961044", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319961", "319961044", "story_v_out_319961.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319961", "319961044", "story_v_out_319961.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319961045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319961045
		arg_183_1.duration_ = 4.17

		local var_183_0 = {
			zh = 2.4,
			ja = 4.166
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
				arg_183_0:Play319961046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1284ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1284ui_story == nil then
				arg_183_1.var_.characterEffect1284ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.200000002980232

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1284ui_story then
					arg_183_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1284ui_story then
				arg_183_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_186_4 = 0

			if var_186_4 < arg_183_1.time_ and arg_183_1.time_ <= var_186_4 + arg_186_0 then
				arg_183_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_186_5 = 0

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_6 = arg_183_1.actors_["10014ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect10014ui_story == nil then
				arg_183_1.var_.characterEffect10014ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.200000002980232

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect10014ui_story then
					local var_186_10 = Mathf.Lerp(0, 0.5, var_186_9)

					arg_183_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_183_1.var_.characterEffect10014ui_story.fillRatio = var_186_10
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect10014ui_story then
				local var_186_11 = 0.5

				arg_183_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_183_1.var_.characterEffect10014ui_story.fillRatio = var_186_11
			end

			local var_186_12 = 0
			local var_186_13 = 0.225

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[6].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(319961045)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 9
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961045", "story_v_out_319961.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961045", "story_v_out_319961.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_319961", "319961045", "story_v_out_319961.awb")

						arg_183_1:RecordAudio("319961045", var_186_21)
						arg_183_1:RecordAudio("319961045", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319961", "319961045", "story_v_out_319961.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319961", "319961045", "story_v_out_319961.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319961046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319961046
		arg_187_1.duration_ = 1.93

		local var_187_0 = {
			zh = 1.7,
			ja = 1.933
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
				arg_187_0:Play319961047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1284ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1284ui_story == nil then
				arg_187_1.var_.characterEffect1284ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1284ui_story then
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1284ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1284ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1284ui_story.fillRatio = var_190_5
			end

			local var_190_6 = arg_187_1.actors_["10014ui_story"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.characterEffect10014ui_story == nil then
				arg_187_1.var_.characterEffect10014ui_story = var_190_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_8 = 0.200000002980232

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.characterEffect10014ui_story then
					arg_187_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.characterEffect10014ui_story then
				arg_187_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_190_10 = 0
			local var_190_11 = 0.175

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_12 = arg_187_1:FormatText(StoryNameCfg[264].name)

				arg_187_1.leftNameTxt_.text = var_190_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_13 = arg_187_1:GetWordFromCfg(319961046)
				local var_190_14 = arg_187_1:FormatText(var_190_13.content)

				arg_187_1.text_.text = var_190_14

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_15 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961046", "story_v_out_319961.awb") ~= 0 then
					local var_190_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961046", "story_v_out_319961.awb") / 1000

					if var_190_18 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_18 + var_190_10
					end

					if var_190_13.prefab_name ~= "" and arg_187_1.actors_[var_190_13.prefab_name] ~= nil then
						local var_190_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_13.prefab_name].transform, "story_v_out_319961", "319961046", "story_v_out_319961.awb")

						arg_187_1:RecordAudio("319961046", var_190_19)
						arg_187_1:RecordAudio("319961046", var_190_19)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_319961", "319961046", "story_v_out_319961.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_319961", "319961046", "story_v_out_319961.awb")
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
	Play319961047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319961047
		arg_191_1.duration_ = 10.2

		local var_191_0 = {
			zh = 8.166,
			ja = 10.2
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
				arg_191_0:Play319961048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10014ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect10014ui_story == nil then
				arg_191_1.var_.characterEffect10014ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.200000002980232

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect10014ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_191_1.var_.characterEffect10014ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect10014ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_191_1.var_.characterEffect10014ui_story.fillRatio = var_194_5
			end

			local var_194_6 = arg_191_1.actors_["1284ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1284ui_story == nil then
				arg_191_1.var_.characterEffect1284ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.200000002980232

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1284ui_story then
					arg_191_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1284ui_story then
				arg_191_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_194_10 = 0
			local var_194_11 = 0.975

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_12 = arg_191_1:FormatText(StoryNameCfg[6].name)

				arg_191_1.leftNameTxt_.text = var_194_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_13 = arg_191_1:GetWordFromCfg(319961047)
				local var_194_14 = arg_191_1:FormatText(var_194_13.content)

				arg_191_1.text_.text = var_194_14

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_15 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961047", "story_v_out_319961.awb") ~= 0 then
					local var_194_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961047", "story_v_out_319961.awb") / 1000

					if var_194_18 + var_194_10 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_10
					end

					if var_194_13.prefab_name ~= "" and arg_191_1.actors_[var_194_13.prefab_name] ~= nil then
						local var_194_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_13.prefab_name].transform, "story_v_out_319961", "319961047", "story_v_out_319961.awb")

						arg_191_1:RecordAudio("319961047", var_194_19)
						arg_191_1:RecordAudio("319961047", var_194_19)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319961", "319961047", "story_v_out_319961.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319961", "319961047", "story_v_out_319961.awb")
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
	Play319961048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319961048
		arg_195_1.duration_ = 4.5

		local var_195_0 = {
			zh = 2.566,
			ja = 4.5
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
				arg_195_0:Play319961049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10014ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect10014ui_story == nil then
				arg_195_1.var_.characterEffect10014ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect10014ui_story then
					arg_195_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect10014ui_story then
				arg_195_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_198_4 = arg_195_1.actors_["1284ui_story"]
			local var_198_5 = 0

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 and arg_195_1.var_.characterEffect1284ui_story == nil then
				arg_195_1.var_.characterEffect1284ui_story = var_198_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_6 = 0.200000002980232

			if var_198_5 <= arg_195_1.time_ and arg_195_1.time_ < var_198_5 + var_198_6 then
				local var_198_7 = (arg_195_1.time_ - var_198_5) / var_198_6

				if arg_195_1.var_.characterEffect1284ui_story then
					local var_198_8 = Mathf.Lerp(0, 0.5, var_198_7)

					arg_195_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1284ui_story.fillRatio = var_198_8
				end
			end

			if arg_195_1.time_ >= var_198_5 + var_198_6 and arg_195_1.time_ < var_198_5 + var_198_6 + arg_198_0 and arg_195_1.var_.characterEffect1284ui_story then
				local var_198_9 = 0.5

				arg_195_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1284ui_story.fillRatio = var_198_9
			end

			local var_198_10 = 0
			local var_198_11 = 0.275

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_12 = arg_195_1:FormatText(StoryNameCfg[264].name)

				arg_195_1.leftNameTxt_.text = var_198_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_13 = arg_195_1:GetWordFromCfg(319961048)
				local var_198_14 = arg_195_1:FormatText(var_198_13.content)

				arg_195_1.text_.text = var_198_14

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_15 = 11
				local var_198_16 = utf8.len(var_198_14)
				local var_198_17 = var_198_15 <= 0 and var_198_11 or var_198_11 * (var_198_16 / var_198_15)

				if var_198_17 > 0 and var_198_11 < var_198_17 then
					arg_195_1.talkMaxDuration = var_198_17

					if var_198_17 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_17 + var_198_10
					end
				end

				arg_195_1.text_.text = var_198_14
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961048", "story_v_out_319961.awb") ~= 0 then
					local var_198_18 = manager.audio:GetVoiceLength("story_v_out_319961", "319961048", "story_v_out_319961.awb") / 1000

					if var_198_18 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_18 + var_198_10
					end

					if var_198_13.prefab_name ~= "" and arg_195_1.actors_[var_198_13.prefab_name] ~= nil then
						local var_198_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_13.prefab_name].transform, "story_v_out_319961", "319961048", "story_v_out_319961.awb")

						arg_195_1:RecordAudio("319961048", var_198_19)
						arg_195_1:RecordAudio("319961048", var_198_19)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_319961", "319961048", "story_v_out_319961.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_319961", "319961048", "story_v_out_319961.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_20 = math.max(var_198_11, arg_195_1.talkMaxDuration)

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_20 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_10) / var_198_20

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_10 + var_198_20 and arg_195_1.time_ < var_198_10 + var_198_20 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319961049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319961049
		arg_199_1.duration_ = 6.43

		local var_199_0 = {
			zh = 2.2,
			ja = 6.433
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
				arg_199_0:Play319961050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10014ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect10014ui_story == nil then
				arg_199_1.var_.characterEffect10014ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect10014ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_199_1.var_.characterEffect10014ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10014ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_199_1.var_.characterEffect10014ui_story.fillRatio = var_202_5
			end

			local var_202_6 = arg_199_1.actors_["1284ui_story"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.characterEffect1284ui_story == nil then
				arg_199_1.var_.characterEffect1284ui_story = var_202_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_8 = 0.200000002980232

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.characterEffect1284ui_story then
					arg_199_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.characterEffect1284ui_story then
				arg_199_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.325

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[6].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(319961049)
				local var_202_16 = arg_199_1:FormatText(var_202_15.content)

				arg_199_1.text_.text = var_202_16

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_17 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961049", "story_v_out_319961.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961049", "story_v_out_319961.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_319961", "319961049", "story_v_out_319961.awb")

						arg_199_1:RecordAudio("319961049", var_202_21)
						arg_199_1:RecordAudio("319961049", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319961", "319961049", "story_v_out_319961.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319961", "319961049", "story_v_out_319961.awb")
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
	Play319961050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319961050
		arg_203_1.duration_ = 2.1

		local var_203_0 = {
			zh = 1.999999999999,
			ja = 2.1
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
				arg_203_0:Play319961051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10014ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect10014ui_story == nil then
				arg_203_1.var_.characterEffect10014ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect10014ui_story then
					arg_203_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect10014ui_story then
				arg_203_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_206_4 = 0

			if var_206_4 < arg_203_1.time_ and arg_203_1.time_ <= var_206_4 + arg_206_0 then
				arg_203_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action5_2")
			end

			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 then
				arg_203_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_206_6 = arg_203_1.actors_["1284ui_story"]
			local var_206_7 = 0

			if var_206_7 < arg_203_1.time_ and arg_203_1.time_ <= var_206_7 + arg_206_0 and arg_203_1.var_.characterEffect1284ui_story == nil then
				arg_203_1.var_.characterEffect1284ui_story = var_206_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_8 = 0.200000002980232

			if var_206_7 <= arg_203_1.time_ and arg_203_1.time_ < var_206_7 + var_206_8 then
				local var_206_9 = (arg_203_1.time_ - var_206_7) / var_206_8

				if arg_203_1.var_.characterEffect1284ui_story then
					local var_206_10 = Mathf.Lerp(0, 0.5, var_206_9)

					arg_203_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1284ui_story.fillRatio = var_206_10
				end
			end

			if arg_203_1.time_ >= var_206_7 + var_206_8 and arg_203_1.time_ < var_206_7 + var_206_8 + arg_206_0 and arg_203_1.var_.characterEffect1284ui_story then
				local var_206_11 = 0.5

				arg_203_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1284ui_story.fillRatio = var_206_11
			end

			local var_206_12 = 0
			local var_206_13 = 0.125

			if var_206_12 < arg_203_1.time_ and arg_203_1.time_ <= var_206_12 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_14 = arg_203_1:FormatText(StoryNameCfg[264].name)

				arg_203_1.leftNameTxt_.text = var_206_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_15 = arg_203_1:GetWordFromCfg(319961050)
				local var_206_16 = arg_203_1:FormatText(var_206_15.content)

				arg_203_1.text_.text = var_206_16

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_17 = 5
				local var_206_18 = utf8.len(var_206_16)
				local var_206_19 = var_206_17 <= 0 and var_206_13 or var_206_13 * (var_206_18 / var_206_17)

				if var_206_19 > 0 and var_206_13 < var_206_19 then
					arg_203_1.talkMaxDuration = var_206_19

					if var_206_19 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_19 + var_206_12
					end
				end

				arg_203_1.text_.text = var_206_16
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961050", "story_v_out_319961.awb") ~= 0 then
					local var_206_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961050", "story_v_out_319961.awb") / 1000

					if var_206_20 + var_206_12 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_12
					end

					if var_206_15.prefab_name ~= "" and arg_203_1.actors_[var_206_15.prefab_name] ~= nil then
						local var_206_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_15.prefab_name].transform, "story_v_out_319961", "319961050", "story_v_out_319961.awb")

						arg_203_1:RecordAudio("319961050", var_206_21)
						arg_203_1:RecordAudio("319961050", var_206_21)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319961", "319961050", "story_v_out_319961.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319961", "319961050", "story_v_out_319961.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_22 = math.max(var_206_13, arg_203_1.talkMaxDuration)

			if var_206_12 <= arg_203_1.time_ and arg_203_1.time_ < var_206_12 + var_206_22 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_12) / var_206_22

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_12 + var_206_22 and arg_203_1.time_ < var_206_12 + var_206_22 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319961051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319961051
		arg_207_1.duration_ = 2.33

		local var_207_0 = {
			zh = 1.999999999999,
			ja = 2.333
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play319961052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1284ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1284ui_story == nil then
				arg_207_1.var_.characterEffect1284ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1284ui_story then
					arg_207_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1284ui_story then
				arg_207_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_210_4 = 0

			if var_210_4 < arg_207_1.time_ and arg_207_1.time_ <= var_210_4 + arg_210_0 then
				arg_207_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_1")
			end

			local var_210_5 = 0

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 then
				arg_207_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_210_6 = arg_207_1.actors_["10014ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect10014ui_story == nil then
				arg_207_1.var_.characterEffect10014ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.200000002980232

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect10014ui_story then
					local var_210_10 = Mathf.Lerp(0, 0.5, var_210_9)

					arg_207_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10014ui_story.fillRatio = var_210_10
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect10014ui_story then
				local var_210_11 = 0.5

				arg_207_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10014ui_story.fillRatio = var_210_11
			end

			local var_210_12 = 0
			local var_210_13 = 0.3

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[6].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(319961051)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 12
				local var_210_18 = utf8.len(var_210_16)
				local var_210_19 = var_210_17 <= 0 and var_210_13 or var_210_13 * (var_210_18 / var_210_17)

				if var_210_19 > 0 and var_210_13 < var_210_19 then
					arg_207_1.talkMaxDuration = var_210_19

					if var_210_19 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_12
					end
				end

				arg_207_1.text_.text = var_210_16
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961051", "story_v_out_319961.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_out_319961", "319961051", "story_v_out_319961.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_out_319961", "319961051", "story_v_out_319961.awb")

						arg_207_1:RecordAudio("319961051", var_210_21)
						arg_207_1:RecordAudio("319961051", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319961", "319961051", "story_v_out_319961.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319961", "319961051", "story_v_out_319961.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_13, arg_207_1.talkMaxDuration)

			if var_210_12 <= arg_207_1.time_ and arg_207_1.time_ < var_210_12 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_12) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_12 + var_210_22 and arg_207_1.time_ < var_210_12 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319961052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319961052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play319961053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1284ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1284ui_story == nil then
				arg_211_1.var_.characterEffect1284ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1284ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1284ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1284ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1284ui_story.fillRatio = var_214_5
			end

			local var_214_6 = 0
			local var_214_7 = 0.7

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_8 = arg_211_1:GetWordFromCfg(319961052)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 28
				local var_214_11 = utf8.len(var_214_9)
				local var_214_12 = var_214_10 <= 0 and var_214_7 or var_214_7 * (var_214_11 / var_214_10)

				if var_214_12 > 0 and var_214_7 < var_214_12 then
					arg_211_1.talkMaxDuration = var_214_12

					if var_214_12 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_9
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_13 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_13 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_13

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_13 and arg_211_1.time_ < var_214_6 + var_214_13 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319961053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319961053
		arg_215_1.duration_ = 10.6

		local var_215_0 = {
			zh = 4.9,
			ja = 10.6
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play319961054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1284ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1284ui_story == nil then
				arg_215_1.var_.characterEffect1284ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1284ui_story then
					arg_215_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1284ui_story then
				arg_215_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_218_4 = 0

			if var_218_4 < arg_215_1.time_ and arg_215_1.time_ <= var_218_4 + arg_218_0 then
				arg_215_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_2")
			end

			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_218_6 = 0
			local var_218_7 = 0.725

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(319961053)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 29
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961053", "story_v_out_319961.awb") ~= 0 then
					local var_218_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961053", "story_v_out_319961.awb") / 1000

					if var_218_14 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_14 + var_218_6
					end

					if var_218_9.prefab_name ~= "" and arg_215_1.actors_[var_218_9.prefab_name] ~= nil then
						local var_218_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_9.prefab_name].transform, "story_v_out_319961", "319961053", "story_v_out_319961.awb")

						arg_215_1:RecordAudio("319961053", var_218_15)
						arg_215_1:RecordAudio("319961053", var_218_15)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_319961", "319961053", "story_v_out_319961.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_319961", "319961053", "story_v_out_319961.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_16 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_16 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_16

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_16 and arg_215_1.time_ < var_218_6 + var_218_16 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319961054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319961054
		arg_219_1.duration_ = 6.07

		local var_219_0 = {
			zh = 6.066,
			ja = 5.4
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
				arg_219_0:Play319961055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_222_1 = 0
			local var_222_2 = 0.825

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_3 = arg_219_1:FormatText(StoryNameCfg[6].name)

				arg_219_1.leftNameTxt_.text = var_222_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_4 = arg_219_1:GetWordFromCfg(319961054)
				local var_222_5 = arg_219_1:FormatText(var_222_4.content)

				arg_219_1.text_.text = var_222_5

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_6 = 33
				local var_222_7 = utf8.len(var_222_5)
				local var_222_8 = var_222_6 <= 0 and var_222_2 or var_222_2 * (var_222_7 / var_222_6)

				if var_222_8 > 0 and var_222_2 < var_222_8 then
					arg_219_1.talkMaxDuration = var_222_8

					if var_222_8 + var_222_1 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_1
					end
				end

				arg_219_1.text_.text = var_222_5
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961054", "story_v_out_319961.awb") ~= 0 then
					local var_222_9 = manager.audio:GetVoiceLength("story_v_out_319961", "319961054", "story_v_out_319961.awb") / 1000

					if var_222_9 + var_222_1 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_9 + var_222_1
					end

					if var_222_4.prefab_name ~= "" and arg_219_1.actors_[var_222_4.prefab_name] ~= nil then
						local var_222_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_4.prefab_name].transform, "story_v_out_319961", "319961054", "story_v_out_319961.awb")

						arg_219_1:RecordAudio("319961054", var_222_10)
						arg_219_1:RecordAudio("319961054", var_222_10)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319961", "319961054", "story_v_out_319961.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319961", "319961054", "story_v_out_319961.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_11 = math.max(var_222_2, arg_219_1.talkMaxDuration)

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_11 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_1) / var_222_11

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_1 + var_222_11 and arg_219_1.time_ < var_222_1 + var_222_11 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319961055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319961055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play319961056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1284ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos1284ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0, 100, 0)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos1284ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, 100, 0)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["10014ui_story"].transform
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1.var_.moveOldPos10014ui_story = var_226_9.localPosition
			end

			local var_226_11 = 0.001

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11
				local var_226_13 = Vector3.New(0, 100, 0)

				var_226_9.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10014ui_story, var_226_13, var_226_12)

				local var_226_14 = manager.ui.mainCamera.transform.position - var_226_9.position

				var_226_9.forward = Vector3.New(var_226_14.x, var_226_14.y, var_226_14.z)

				local var_226_15 = var_226_9.localEulerAngles

				var_226_15.z = 0
				var_226_15.x = 0
				var_226_9.localEulerAngles = var_226_15
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 then
				var_226_9.localPosition = Vector3.New(0, 100, 0)

				local var_226_16 = manager.ui.mainCamera.transform.position - var_226_9.position

				var_226_9.forward = Vector3.New(var_226_16.x, var_226_16.y, var_226_16.z)

				local var_226_17 = var_226_9.localEulerAngles

				var_226_17.z = 0
				var_226_17.x = 0
				var_226_9.localEulerAngles = var_226_17
			end

			local var_226_18 = 0
			local var_226_19 = 1.225

			if var_226_18 < arg_223_1.time_ and arg_223_1.time_ <= var_226_18 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_20 = arg_223_1:GetWordFromCfg(319961055)
				local var_226_21 = arg_223_1:FormatText(var_226_20.content)

				arg_223_1.text_.text = var_226_21

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_22 = 49
				local var_226_23 = utf8.len(var_226_21)
				local var_226_24 = var_226_22 <= 0 and var_226_19 or var_226_19 * (var_226_23 / var_226_22)

				if var_226_24 > 0 and var_226_19 < var_226_24 then
					arg_223_1.talkMaxDuration = var_226_24

					if var_226_24 + var_226_18 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_24 + var_226_18
					end
				end

				arg_223_1.text_.text = var_226_21
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_25 = math.max(var_226_19, arg_223_1.talkMaxDuration)

			if var_226_18 <= arg_223_1.time_ and arg_223_1.time_ < var_226_18 + var_226_25 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_18) / var_226_25

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_18 + var_226_25 and arg_223_1.time_ < var_226_18 + var_226_25 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319961056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319961056
		arg_227_1.duration_ = 2.43

		local var_227_0 = {
			zh = 2.366,
			ja = 2.433
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
				arg_227_0:Play319961057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10014ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos10014ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, -1.06, -6.2)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos10014ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["10014ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and arg_227_1.var_.characterEffect10014ui_story == nil then
				arg_227_1.var_.characterEffect10014ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect10014ui_story then
					arg_227_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and arg_227_1.var_.characterEffect10014ui_story then
				arg_227_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_230_13 = 0

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_15 = 0
			local var_230_16 = 0.325

			if var_230_15 < arg_227_1.time_ and arg_227_1.time_ <= var_230_15 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_17 = arg_227_1:FormatText(StoryNameCfg[264].name)

				arg_227_1.leftNameTxt_.text = var_230_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_18 = arg_227_1:GetWordFromCfg(319961056)
				local var_230_19 = arg_227_1:FormatText(var_230_18.content)

				arg_227_1.text_.text = var_230_19

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_20 = 13
				local var_230_21 = utf8.len(var_230_19)
				local var_230_22 = var_230_20 <= 0 and var_230_16 or var_230_16 * (var_230_21 / var_230_20)

				if var_230_22 > 0 and var_230_16 < var_230_22 then
					arg_227_1.talkMaxDuration = var_230_22

					if var_230_22 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_22 + var_230_15
					end
				end

				arg_227_1.text_.text = var_230_19
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961056", "story_v_out_319961.awb") ~= 0 then
					local var_230_23 = manager.audio:GetVoiceLength("story_v_out_319961", "319961056", "story_v_out_319961.awb") / 1000

					if var_230_23 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_23 + var_230_15
					end

					if var_230_18.prefab_name ~= "" and arg_227_1.actors_[var_230_18.prefab_name] ~= nil then
						local var_230_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_18.prefab_name].transform, "story_v_out_319961", "319961056", "story_v_out_319961.awb")

						arg_227_1:RecordAudio("319961056", var_230_24)
						arg_227_1:RecordAudio("319961056", var_230_24)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319961", "319961056", "story_v_out_319961.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319961", "319961056", "story_v_out_319961.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_25 = math.max(var_230_16, arg_227_1.talkMaxDuration)

			if var_230_15 <= arg_227_1.time_ and arg_227_1.time_ < var_230_15 + var_230_25 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_15) / var_230_25

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_15 + var_230_25 and arg_227_1.time_ < var_230_15 + var_230_25 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play319961057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319961057
		arg_231_1.duration_ = 2.43

		local var_231_0 = {
			zh = 2.233,
			ja = 2.433
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
				arg_231_0:Play319961058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1284ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1284ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, -0.985, -6.22)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1284ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1284ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1284ui_story == nil then
				arg_231_1.var_.characterEffect1284ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1284ui_story then
					arg_231_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1284ui_story then
				arg_231_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_234_15 = arg_231_1.actors_["10014ui_story"].transform
			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.var_.moveOldPos10014ui_story = var_234_15.localPosition
			end

			local var_234_17 = 0.001

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17
				local var_234_19 = Vector3.New(0, 100, 0)

				var_234_15.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10014ui_story, var_234_19, var_234_18)

				local var_234_20 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_20.x, var_234_20.y, var_234_20.z)

				local var_234_21 = var_234_15.localEulerAngles

				var_234_21.z = 0
				var_234_21.x = 0
				var_234_15.localEulerAngles = var_234_21
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 then
				var_234_15.localPosition = Vector3.New(0, 100, 0)

				local var_234_22 = manager.ui.mainCamera.transform.position - var_234_15.position

				var_234_15.forward = Vector3.New(var_234_22.x, var_234_22.y, var_234_22.z)

				local var_234_23 = var_234_15.localEulerAngles

				var_234_23.z = 0
				var_234_23.x = 0
				var_234_15.localEulerAngles = var_234_23
			end

			local var_234_24 = 0
			local var_234_25 = 0.3

			if var_234_24 < arg_231_1.time_ and arg_231_1.time_ <= var_234_24 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_26 = arg_231_1:FormatText(StoryNameCfg[6].name)

				arg_231_1.leftNameTxt_.text = var_234_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_27 = arg_231_1:GetWordFromCfg(319961057)
				local var_234_28 = arg_231_1:FormatText(var_234_27.content)

				arg_231_1.text_.text = var_234_28

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_29 = 12
				local var_234_30 = utf8.len(var_234_28)
				local var_234_31 = var_234_29 <= 0 and var_234_25 or var_234_25 * (var_234_30 / var_234_29)

				if var_234_31 > 0 and var_234_25 < var_234_31 then
					arg_231_1.talkMaxDuration = var_234_31

					if var_234_31 + var_234_24 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_31 + var_234_24
					end
				end

				arg_231_1.text_.text = var_234_28
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961057", "story_v_out_319961.awb") ~= 0 then
					local var_234_32 = manager.audio:GetVoiceLength("story_v_out_319961", "319961057", "story_v_out_319961.awb") / 1000

					if var_234_32 + var_234_24 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_32 + var_234_24
					end

					if var_234_27.prefab_name ~= "" and arg_231_1.actors_[var_234_27.prefab_name] ~= nil then
						local var_234_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_27.prefab_name].transform, "story_v_out_319961", "319961057", "story_v_out_319961.awb")

						arg_231_1:RecordAudio("319961057", var_234_33)
						arg_231_1:RecordAudio("319961057", var_234_33)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_319961", "319961057", "story_v_out_319961.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_319961", "319961057", "story_v_out_319961.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_34 = math.max(var_234_25, arg_231_1.talkMaxDuration)

			if var_234_24 <= arg_231_1.time_ and arg_231_1.time_ < var_234_24 + var_234_34 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_24) / var_234_34

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_24 + var_234_34 and arg_231_1.time_ < var_234_24 + var_234_34 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play319961058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 319961058
		arg_235_1.duration_ = 7.6

		local var_235_0 = {
			zh = 1.999999999999,
			ja = 7.6
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
				arg_235_0:Play319961059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10014ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10014ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10014ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["10014ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and arg_235_1.var_.characterEffect10014ui_story == nil then
				arg_235_1.var_.characterEffect10014ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect10014ui_story then
					arg_235_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and arg_235_1.var_.characterEffect10014ui_story then
				arg_235_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_238_15 = arg_235_1.actors_["1284ui_story"]
			local var_238_16 = 0

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 and arg_235_1.var_.characterEffect1284ui_story == nil then
				arg_235_1.var_.characterEffect1284ui_story = var_238_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_17 = 0.200000002980232

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_17 then
				local var_238_18 = (arg_235_1.time_ - var_238_16) / var_238_17

				if arg_235_1.var_.characterEffect1284ui_story then
					local var_238_19 = Mathf.Lerp(0, 0.5, var_238_18)

					arg_235_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1284ui_story.fillRatio = var_238_19
				end
			end

			if arg_235_1.time_ >= var_238_16 + var_238_17 and arg_235_1.time_ < var_238_16 + var_238_17 + arg_238_0 and arg_235_1.var_.characterEffect1284ui_story then
				local var_238_20 = 0.5

				arg_235_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1284ui_story.fillRatio = var_238_20
			end

			local var_238_21 = arg_235_1.actors_["1284ui_story"].transform
			local var_238_22 = 0

			if var_238_22 < arg_235_1.time_ and arg_235_1.time_ <= var_238_22 + arg_238_0 then
				arg_235_1.var_.moveOldPos1284ui_story = var_238_21.localPosition
			end

			local var_238_23 = 0.001

			if var_238_22 <= arg_235_1.time_ and arg_235_1.time_ < var_238_22 + var_238_23 then
				local var_238_24 = (arg_235_1.time_ - var_238_22) / var_238_23
				local var_238_25 = Vector3.New(0.7, -0.985, -6.22)

				var_238_21.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1284ui_story, var_238_25, var_238_24)

				local var_238_26 = manager.ui.mainCamera.transform.position - var_238_21.position

				var_238_21.forward = Vector3.New(var_238_26.x, var_238_26.y, var_238_26.z)

				local var_238_27 = var_238_21.localEulerAngles

				var_238_27.z = 0
				var_238_27.x = 0
				var_238_21.localEulerAngles = var_238_27
			end

			if arg_235_1.time_ >= var_238_22 + var_238_23 and arg_235_1.time_ < var_238_22 + var_238_23 + arg_238_0 then
				var_238_21.localPosition = Vector3.New(0.7, -0.985, -6.22)

				local var_238_28 = manager.ui.mainCamera.transform.position - var_238_21.position

				var_238_21.forward = Vector3.New(var_238_28.x, var_238_28.y, var_238_28.z)

				local var_238_29 = var_238_21.localEulerAngles

				var_238_29.z = 0
				var_238_29.x = 0
				var_238_21.localEulerAngles = var_238_29
			end

			local var_238_30 = 0
			local var_238_31 = 0.225

			if var_238_30 < arg_235_1.time_ and arg_235_1.time_ <= var_238_30 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_32 = arg_235_1:FormatText(StoryNameCfg[264].name)

				arg_235_1.leftNameTxt_.text = var_238_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_33 = arg_235_1:GetWordFromCfg(319961058)
				local var_238_34 = arg_235_1:FormatText(var_238_33.content)

				arg_235_1.text_.text = var_238_34

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_35 = 9
				local var_238_36 = utf8.len(var_238_34)
				local var_238_37 = var_238_35 <= 0 and var_238_31 or var_238_31 * (var_238_36 / var_238_35)

				if var_238_37 > 0 and var_238_31 < var_238_37 then
					arg_235_1.talkMaxDuration = var_238_37

					if var_238_37 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_37 + var_238_30
					end
				end

				arg_235_1.text_.text = var_238_34
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961058", "story_v_out_319961.awb") ~= 0 then
					local var_238_38 = manager.audio:GetVoiceLength("story_v_out_319961", "319961058", "story_v_out_319961.awb") / 1000

					if var_238_38 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_38 + var_238_30
					end

					if var_238_33.prefab_name ~= "" and arg_235_1.actors_[var_238_33.prefab_name] ~= nil then
						local var_238_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_33.prefab_name].transform, "story_v_out_319961", "319961058", "story_v_out_319961.awb")

						arg_235_1:RecordAudio("319961058", var_238_39)
						arg_235_1:RecordAudio("319961058", var_238_39)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_319961", "319961058", "story_v_out_319961.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_319961", "319961058", "story_v_out_319961.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_40 = math.max(var_238_31, arg_235_1.talkMaxDuration)

			if var_238_30 <= arg_235_1.time_ and arg_235_1.time_ < var_238_30 + var_238_40 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_30) / var_238_40

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_30 + var_238_40 and arg_235_1.time_ < var_238_30 + var_238_40 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play319961059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 319961059
		arg_239_1.duration_ = 2

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play319961060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10014ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect10014ui_story == nil then
				arg_239_1.var_.characterEffect10014ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect10014ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_239_1.var_.characterEffect10014ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect10014ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_239_1.var_.characterEffect10014ui_story.fillRatio = var_242_5
			end

			local var_242_6 = 0

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				local var_242_7 = manager.ui.mainCamera.transform.localPosition
				local var_242_8 = Vector3.New(0, 0, 10) + Vector3.New(var_242_7.x, var_242_7.y, 0)
				local var_242_9 = arg_239_1.bgs_.STblack

				var_242_9.transform.localPosition = var_242_8
				var_242_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_242_10 = var_242_9:GetComponent("SpriteRenderer")

				if var_242_10 and var_242_10.sprite then
					local var_242_11 = (var_242_9.transform.localPosition - var_242_7).z
					local var_242_12 = manager.ui.mainCameraCom_
					local var_242_13 = 2 * var_242_11 * Mathf.Tan(var_242_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_242_14 = var_242_13 * var_242_12.aspect
					local var_242_15 = var_242_10.sprite.bounds.size.x
					local var_242_16 = var_242_10.sprite.bounds.size.y
					local var_242_17 = var_242_14 / var_242_15
					local var_242_18 = var_242_13 / var_242_16
					local var_242_19 = var_242_18 < var_242_17 and var_242_17 or var_242_18

					var_242_9.transform.localScale = Vector3.New(var_242_19, var_242_19, 0)
				end

				for iter_242_0, iter_242_1 in pairs(arg_239_1.bgs_) do
					if iter_242_0 ~= "STblack" then
						iter_242_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_242_20 = 0

			if var_242_20 < arg_239_1.time_ and arg_239_1.time_ <= var_242_20 + arg_242_0 then
				arg_239_1.fswbg_:SetActive(true)
				arg_239_1.dialog_:SetActive(false)

				arg_239_1.fswtw_.percent = 0

				local var_242_21 = arg_239_1:GetWordFromCfg(319961059)
				local var_242_22 = arg_239_1:FormatText(var_242_21.content)

				arg_239_1.fswt_.text = var_242_22

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.fswt_)

				arg_239_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_239_1.fswtw_:SetDirty()

				arg_239_1.typewritterCharCountI18N = 0

				SetActive(arg_239_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_239_1:ShowNextGo(false)
			end

			local var_242_23 = 0.334000001847744

			if var_242_23 < arg_239_1.time_ and arg_239_1.time_ <= var_242_23 + arg_242_0 then
				arg_239_1.var_.oldValueTypewriter = arg_239_1.fswtw_.percent

				arg_239_1:ShowNextGo(false)
			end

			local var_242_24 = 7
			local var_242_25 = 0.466666666666667
			local var_242_26 = arg_239_1:GetWordFromCfg(319961059)
			local var_242_27 = arg_239_1:FormatText(var_242_26.content)
			local var_242_28, var_242_29 = arg_239_1:GetPercentByPara(var_242_27, 1)

			if var_242_23 < arg_239_1.time_ and arg_239_1.time_ <= var_242_23 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0

				local var_242_30 = var_242_24 <= 0 and var_242_25 or var_242_25 * ((var_242_29 - arg_239_1.typewritterCharCountI18N) / var_242_24)

				if var_242_30 > 0 and var_242_25 < var_242_30 then
					arg_239_1.talkMaxDuration = var_242_30

					if var_242_30 + var_242_23 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_30 + var_242_23
					end
				end
			end

			local var_242_31 = 0.466666666666667
			local var_242_32 = math.max(var_242_31, arg_239_1.talkMaxDuration)

			if var_242_23 <= arg_239_1.time_ and arg_239_1.time_ < var_242_23 + var_242_32 then
				local var_242_33 = (arg_239_1.time_ - var_242_23) / var_242_32

				arg_239_1.fswtw_.percent = Mathf.Lerp(arg_239_1.var_.oldValueTypewriter, var_242_28, var_242_33)
				arg_239_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_239_1.fswtw_:SetDirty()
			end

			if arg_239_1.time_ >= var_242_23 + var_242_32 and arg_239_1.time_ < var_242_23 + var_242_32 + arg_242_0 then
				arg_239_1.fswtw_.percent = var_242_28

				arg_239_1.fswtw_:SetDirty()
				arg_239_1:ShowNextGo(true)

				arg_239_1.typewritterCharCountI18N = var_242_29
			end

			local var_242_34 = arg_239_1.actors_["10014ui_story"].transform
			local var_242_35 = 0

			if var_242_35 < arg_239_1.time_ and arg_239_1.time_ <= var_242_35 + arg_242_0 then
				arg_239_1.var_.moveOldPos10014ui_story = var_242_34.localPosition
			end

			local var_242_36 = 0.001

			if var_242_35 <= arg_239_1.time_ and arg_239_1.time_ < var_242_35 + var_242_36 then
				local var_242_37 = (arg_239_1.time_ - var_242_35) / var_242_36
				local var_242_38 = Vector3.New(0, 100, 0)

				var_242_34.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10014ui_story, var_242_38, var_242_37)

				local var_242_39 = manager.ui.mainCamera.transform.position - var_242_34.position

				var_242_34.forward = Vector3.New(var_242_39.x, var_242_39.y, var_242_39.z)

				local var_242_40 = var_242_34.localEulerAngles

				var_242_40.z = 0
				var_242_40.x = 0
				var_242_34.localEulerAngles = var_242_40
			end

			if arg_239_1.time_ >= var_242_35 + var_242_36 and arg_239_1.time_ < var_242_35 + var_242_36 + arg_242_0 then
				var_242_34.localPosition = Vector3.New(0, 100, 0)

				local var_242_41 = manager.ui.mainCamera.transform.position - var_242_34.position

				var_242_34.forward = Vector3.New(var_242_41.x, var_242_41.y, var_242_41.z)

				local var_242_42 = var_242_34.localEulerAngles

				var_242_42.z = 0
				var_242_42.x = 0
				var_242_34.localEulerAngles = var_242_42
			end

			local var_242_43 = arg_239_1.actors_["1284ui_story"].transform
			local var_242_44 = 0

			if var_242_44 < arg_239_1.time_ and arg_239_1.time_ <= var_242_44 + arg_242_0 then
				arg_239_1.var_.moveOldPos1284ui_story = var_242_43.localPosition
			end

			local var_242_45 = 0.001

			if var_242_44 <= arg_239_1.time_ and arg_239_1.time_ < var_242_44 + var_242_45 then
				local var_242_46 = (arg_239_1.time_ - var_242_44) / var_242_45
				local var_242_47 = Vector3.New(0, 100, 0)

				var_242_43.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1284ui_story, var_242_47, var_242_46)

				local var_242_48 = manager.ui.mainCamera.transform.position - var_242_43.position

				var_242_43.forward = Vector3.New(var_242_48.x, var_242_48.y, var_242_48.z)

				local var_242_49 = var_242_43.localEulerAngles

				var_242_49.z = 0
				var_242_49.x = 0
				var_242_43.localEulerAngles = var_242_49
			end

			if arg_239_1.time_ >= var_242_44 + var_242_45 and arg_239_1.time_ < var_242_44 + var_242_45 + arg_242_0 then
				var_242_43.localPosition = Vector3.New(0, 100, 0)

				local var_242_50 = manager.ui.mainCamera.transform.position - var_242_43.position

				var_242_43.forward = Vector3.New(var_242_50.x, var_242_50.y, var_242_50.z)

				local var_242_51 = var_242_43.localEulerAngles

				var_242_51.z = 0
				var_242_51.x = 0
				var_242_43.localEulerAngles = var_242_51
			end

			local var_242_52 = 0

			if var_242_52 < arg_239_1.time_ and arg_239_1.time_ <= var_242_52 + arg_242_0 then
				local var_242_53 = arg_239_1.fswbg_.transform:Find("textbox/adapt/content") or arg_239_1.fswbg_.transform:Find("textbox/content")
				local var_242_54 = var_242_53:GetComponent("Text")
				local var_242_55 = var_242_53:GetComponent("RectTransform")

				var_242_54.alignment = UnityEngine.TextAnchor.LowerCenter
				var_242_55.offsetMin = Vector2.New(0, 0)
				var_242_55.offsetMax = Vector2.New(0, 0)
			end

			local var_242_56 = 0

			if var_242_56 < arg_239_1.time_ and arg_239_1.time_ <= var_242_56 + arg_242_0 then
				arg_239_1.cswbg_:SetActive(true)

				local var_242_57 = arg_239_1.cswt_:GetComponent("RectTransform")

				arg_239_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_242_57.offsetMin = Vector2.New(0, 100)
				var_242_57.offsetMax = Vector2.New(0, 0)

				local var_242_58 = arg_239_1:GetWordFromCfg(419086)
				local var_242_59 = arg_239_1:FormatText(var_242_58.content)

				arg_239_1.cswt_.text = var_242_59

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.cswt_)

				arg_239_1.cswt_.fontSize = 155
				arg_239_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_239_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	Play319961060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 319961060
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play319961061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.2

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				local var_246_2 = "play"
				local var_246_3 = "music"

				arg_243_1:AudioAction(var_246_2, var_246_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_246_4 = ""
				local var_246_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_246_5 ~= "" then
					if arg_243_1.bgmTxt_.text ~= var_246_5 and arg_243_1.bgmTxt_.text ~= "" then
						if arg_243_1.bgmTxt2_.text ~= "" then
							arg_243_1.bgmTxt_.text = arg_243_1.bgmTxt2_.text
						end

						arg_243_1.bgmTxt2_.text = var_246_5

						arg_243_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_243_1.bgmTxt_.text = var_246_5
					end

					if arg_243_1.bgmTimer then
						arg_243_1.bgmTimer:Stop()

						arg_243_1.bgmTimer = nil
					end

					if arg_243_1.settingData.show_music_name == 1 then
						arg_243_1.musicController:SetSelectedState("show")
						arg_243_1.musicAnimator_:Play("open", 0, 0)

						if arg_243_1.settingData.music_time ~= 0 then
							arg_243_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_243_1.settingData.music_time), function()
								if arg_243_1 == nil or isNil(arg_243_1.bgmTxt_) then
									return
								end

								arg_243_1.musicController:SetSelectedState("hide")
								arg_243_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_246_6 = 0

			if var_246_6 < arg_243_1.time_ and arg_243_1.time_ <= var_246_6 + arg_246_0 then
				local var_246_7 = manager.ui.mainCamera.transform.localPosition
				local var_246_8 = Vector3.New(0, 0, 10) + Vector3.New(var_246_7.x, var_246_7.y, 0)
				local var_246_9 = arg_243_1.bgs_.I07

				var_246_9.transform.localPosition = var_246_8
				var_246_9.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_246_10 = var_246_9:GetComponent("SpriteRenderer")

				if var_246_10 and var_246_10.sprite then
					local var_246_11 = (var_246_9.transform.localPosition - var_246_7).z
					local var_246_12 = manager.ui.mainCameraCom_
					local var_246_13 = 2 * var_246_11 * Mathf.Tan(var_246_12.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_246_14 = var_246_13 * var_246_12.aspect
					local var_246_15 = var_246_10.sprite.bounds.size.x
					local var_246_16 = var_246_10.sprite.bounds.size.y
					local var_246_17 = var_246_14 / var_246_15
					local var_246_18 = var_246_13 / var_246_16
					local var_246_19 = var_246_18 < var_246_17 and var_246_17 or var_246_18

					var_246_9.transform.localScale = Vector3.New(var_246_19, var_246_19, 0)
				end

				for iter_246_0, iter_246_1 in pairs(arg_243_1.bgs_) do
					if iter_246_0 ~= "I07" then
						iter_246_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_246_20 = 0

			if var_246_20 < arg_243_1.time_ and arg_243_1.time_ <= var_246_20 + arg_246_0 then
				arg_243_1.fswbg_:SetActive(false)
				arg_243_1.dialog_:SetActive(true)
				arg_243_1:ShowNextGo(false)
			end

			local var_246_21 = 0

			if var_246_21 < arg_243_1.time_ and arg_243_1.time_ <= var_246_21 + arg_246_0 then
				arg_243_1.cswbg_:SetActive(false)
			end

			local var_246_22 = 0
			local var_246_23 = 0.425

			if var_246_22 < arg_243_1.time_ and arg_243_1.time_ <= var_246_22 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_24 = arg_243_1:GetWordFromCfg(319961060)
				local var_246_25 = arg_243_1:FormatText(var_246_24.content)

				arg_243_1.text_.text = var_246_25

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_26 = 17
				local var_246_27 = utf8.len(var_246_25)
				local var_246_28 = var_246_26 <= 0 and var_246_23 or var_246_23 * (var_246_27 / var_246_26)

				if var_246_28 > 0 and var_246_23 < var_246_28 then
					arg_243_1.talkMaxDuration = var_246_28

					if var_246_28 + var_246_22 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_28 + var_246_22
					end
				end

				arg_243_1.text_.text = var_246_25
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_29 = math.max(var_246_23, arg_243_1.talkMaxDuration)

			if var_246_22 <= arg_243_1.time_ and arg_243_1.time_ < var_246_22 + var_246_29 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_22) / var_246_29

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_22 + var_246_29 and arg_243_1.time_ < var_246_22 + var_246_29 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play319961061 = function(arg_248_0, arg_248_1)
		arg_248_1.time_ = 0
		arg_248_1.frameCnt_ = 0
		arg_248_1.state_ = "playing"
		arg_248_1.curTalkId_ = 319961061
		arg_248_1.duration_ = 5

		SetActive(arg_248_1.tipsGo_, false)

		function arg_248_1.onSingleLineFinish_()
			arg_248_1.onSingleLineUpdate_ = nil
			arg_248_1.onSingleLineFinish_ = nil
			arg_248_1.state_ = "waiting"
		end

		function arg_248_1.playNext_(arg_250_0)
			if arg_250_0 == 1 then
				arg_248_0:Play319961062(arg_248_1)
			end
		end

		function arg_248_1.onSingleLineUpdate_(arg_251_0)
			local var_251_0 = 0
			local var_251_1 = 0.875

			if var_251_0 < arg_248_1.time_ and arg_248_1.time_ <= var_251_0 + arg_251_0 then
				arg_248_1.talkMaxDuration = 0
				arg_248_1.dialogCg_.alpha = 1

				arg_248_1.dialog_:SetActive(true)
				SetActive(arg_248_1.leftNameGo_, false)

				arg_248_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_248_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_248_1:RecordName(arg_248_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_248_1.iconTrs_.gameObject, false)
				arg_248_1.callingController_:SetSelectedState("normal")

				local var_251_2 = arg_248_1:GetWordFromCfg(319961061)
				local var_251_3 = arg_248_1:FormatText(var_251_2.content)

				arg_248_1.text_.text = var_251_3

				LuaForUtil.ClearLinePrefixSymbol(arg_248_1.text_)

				local var_251_4 = 35
				local var_251_5 = utf8.len(var_251_3)
				local var_251_6 = var_251_4 <= 0 and var_251_1 or var_251_1 * (var_251_5 / var_251_4)

				if var_251_6 > 0 and var_251_1 < var_251_6 then
					arg_248_1.talkMaxDuration = var_251_6

					if var_251_6 + var_251_0 > arg_248_1.duration_ then
						arg_248_1.duration_ = var_251_6 + var_251_0
					end
				end

				arg_248_1.text_.text = var_251_3
				arg_248_1.typewritter.percent = 0

				arg_248_1.typewritter:SetDirty()
				arg_248_1:ShowNextGo(false)
				arg_248_1:RecordContent(arg_248_1.text_.text)
			end

			local var_251_7 = math.max(var_251_1, arg_248_1.talkMaxDuration)

			if var_251_0 <= arg_248_1.time_ and arg_248_1.time_ < var_251_0 + var_251_7 then
				arg_248_1.typewritter.percent = (arg_248_1.time_ - var_251_0) / var_251_7

				arg_248_1.typewritter:SetDirty()
			end

			if arg_248_1.time_ >= var_251_0 + var_251_7 and arg_248_1.time_ < var_251_0 + var_251_7 + arg_251_0 then
				arg_248_1.typewritter.percent = 1

				arg_248_1.typewritter:SetDirty()
				arg_248_1:ShowNextGo(true)
			end
		end
	end,
	Play319961062 = function(arg_252_0, arg_252_1)
		arg_252_1.time_ = 0
		arg_252_1.frameCnt_ = 0
		arg_252_1.state_ = "playing"
		arg_252_1.curTalkId_ = 319961062
		arg_252_1.duration_ = 5

		SetActive(arg_252_1.tipsGo_, false)

		function arg_252_1.onSingleLineFinish_()
			arg_252_1.onSingleLineUpdate_ = nil
			arg_252_1.onSingleLineFinish_ = nil
			arg_252_1.state_ = "waiting"
		end

		function arg_252_1.playNext_(arg_254_0)
			if arg_254_0 == 1 then
				arg_252_0:Play319961063(arg_252_1)
			end
		end

		function arg_252_1.onSingleLineUpdate_(arg_255_0)
			local var_255_0 = 0
			local var_255_1 = 0.725

			if var_255_0 < arg_252_1.time_ and arg_252_1.time_ <= var_255_0 + arg_255_0 then
				arg_252_1.talkMaxDuration = 0
				arg_252_1.dialogCg_.alpha = 1

				arg_252_1.dialog_:SetActive(true)
				SetActive(arg_252_1.leftNameGo_, false)

				arg_252_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_252_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_252_1:RecordName(arg_252_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_252_1.iconTrs_.gameObject, false)
				arg_252_1.callingController_:SetSelectedState("normal")

				local var_255_2 = arg_252_1:GetWordFromCfg(319961062)
				local var_255_3 = arg_252_1:FormatText(var_255_2.content)

				arg_252_1.text_.text = var_255_3

				LuaForUtil.ClearLinePrefixSymbol(arg_252_1.text_)

				local var_255_4 = 29
				local var_255_5 = utf8.len(var_255_3)
				local var_255_6 = var_255_4 <= 0 and var_255_1 or var_255_1 * (var_255_5 / var_255_4)

				if var_255_6 > 0 and var_255_1 < var_255_6 then
					arg_252_1.talkMaxDuration = var_255_6

					if var_255_6 + var_255_0 > arg_252_1.duration_ then
						arg_252_1.duration_ = var_255_6 + var_255_0
					end
				end

				arg_252_1.text_.text = var_255_3
				arg_252_1.typewritter.percent = 0

				arg_252_1.typewritter:SetDirty()
				arg_252_1:ShowNextGo(false)
				arg_252_1:RecordContent(arg_252_1.text_.text)
			end

			local var_255_7 = math.max(var_255_1, arg_252_1.talkMaxDuration)

			if var_255_0 <= arg_252_1.time_ and arg_252_1.time_ < var_255_0 + var_255_7 then
				arg_252_1.typewritter.percent = (arg_252_1.time_ - var_255_0) / var_255_7

				arg_252_1.typewritter:SetDirty()
			end

			if arg_252_1.time_ >= var_255_0 + var_255_7 and arg_252_1.time_ < var_255_0 + var_255_7 + arg_255_0 then
				arg_252_1.typewritter.percent = 1

				arg_252_1.typewritter:SetDirty()
				arg_252_1:ShowNextGo(true)
			end
		end
	end,
	Play319961063 = function(arg_256_0, arg_256_1)
		arg_256_1.time_ = 0
		arg_256_1.frameCnt_ = 0
		arg_256_1.state_ = "playing"
		arg_256_1.curTalkId_ = 319961063
		arg_256_1.duration_ = 2

		SetActive(arg_256_1.tipsGo_, false)

		function arg_256_1.onSingleLineFinish_()
			arg_256_1.onSingleLineUpdate_ = nil
			arg_256_1.onSingleLineFinish_ = nil
			arg_256_1.state_ = "waiting"
		end

		function arg_256_1.playNext_(arg_258_0)
			if arg_258_0 == 1 then
				arg_256_0:Play319961064(arg_256_1)
			end
		end

		function arg_256_1.onSingleLineUpdate_(arg_259_0)
			local var_259_0 = 0

			if var_259_0 < arg_256_1.time_ and arg_256_1.time_ <= var_259_0 + arg_259_0 then
				local var_259_1 = manager.ui.mainCamera.transform.localPosition
				local var_259_2 = Vector3.New(0, 0, 10) + Vector3.New(var_259_1.x, var_259_1.y, 0)
				local var_259_3 = arg_256_1.bgs_.STblack

				var_259_3.transform.localPosition = var_259_2
				var_259_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_259_4 = var_259_3:GetComponent("SpriteRenderer")

				if var_259_4 and var_259_4.sprite then
					local var_259_5 = (var_259_3.transform.localPosition - var_259_1).z
					local var_259_6 = manager.ui.mainCameraCom_
					local var_259_7 = 2 * var_259_5 * Mathf.Tan(var_259_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_259_8 = var_259_7 * var_259_6.aspect
					local var_259_9 = var_259_4.sprite.bounds.size.x
					local var_259_10 = var_259_4.sprite.bounds.size.y
					local var_259_11 = var_259_8 / var_259_9
					local var_259_12 = var_259_7 / var_259_10
					local var_259_13 = var_259_12 < var_259_11 and var_259_11 or var_259_12

					var_259_3.transform.localScale = Vector3.New(var_259_13, var_259_13, 0)
				end

				for iter_259_0, iter_259_1 in pairs(arg_256_1.bgs_) do
					if iter_259_0 ~= "STblack" then
						iter_259_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_259_14 = 0

			if var_259_14 < arg_256_1.time_ and arg_256_1.time_ <= var_259_14 + arg_259_0 then
				arg_256_1.cswbg_:SetActive(true)

				local var_259_15 = arg_256_1.cswt_:GetComponent("RectTransform")

				arg_256_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_259_15.offsetMin = Vector2.New(0, 330)
				var_259_15.offsetMax = Vector2.New(0, -175)

				local var_259_16 = arg_256_1:GetWordFromCfg(419087)
				local var_259_17 = arg_256_1:FormatText(var_259_16.content)

				arg_256_1.cswt_.text = var_259_17

				LuaForUtil.ClearLinePrefixSymbol(arg_256_1.cswt_)

				arg_256_1.cswt_.fontSize = 180
				arg_256_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_256_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_259_18 = 0

			if var_259_18 < arg_256_1.time_ and arg_256_1.time_ <= var_259_18 + arg_259_0 then
				arg_256_1.fswbg_:SetActive(true)
				arg_256_1.dialog_:SetActive(false)

				arg_256_1.fswtw_.percent = 0

				local var_259_19 = arg_256_1:GetWordFromCfg(319961063)
				local var_259_20 = arg_256_1:FormatText(var_259_19.content)

				arg_256_1.fswt_.text = var_259_20

				LuaForUtil.ClearLinePrefixSymbol(arg_256_1.fswt_)

				arg_256_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_256_1.fswtw_:SetDirty()

				arg_256_1.typewritterCharCountI18N = 0

				SetActive(arg_256_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_256_1:ShowNextGo(false)
			end

			local var_259_21 = 0.0166666666666667

			if var_259_21 < arg_256_1.time_ and arg_256_1.time_ <= var_259_21 + arg_259_0 then
				arg_256_1.var_.oldValueTypewriter = arg_256_1.fswtw_.percent

				arg_256_1:ShowNextGo(false)
			end

			local var_259_22 = 2
			local var_259_23 = 0.133333333333333
			local var_259_24 = arg_256_1:GetWordFromCfg(319961063)
			local var_259_25 = arg_256_1:FormatText(var_259_24.content)
			local var_259_26, var_259_27 = arg_256_1:GetPercentByPara(var_259_25, 1)

			if var_259_21 < arg_256_1.time_ and arg_256_1.time_ <= var_259_21 + arg_259_0 then
				arg_256_1.talkMaxDuration = 0

				local var_259_28 = var_259_22 <= 0 and var_259_23 or var_259_23 * ((var_259_27 - arg_256_1.typewritterCharCountI18N) / var_259_22)

				if var_259_28 > 0 and var_259_23 < var_259_28 then
					arg_256_1.talkMaxDuration = var_259_28

					if var_259_28 + var_259_21 > arg_256_1.duration_ then
						arg_256_1.duration_ = var_259_28 + var_259_21
					end
				end
			end

			local var_259_29 = 0.133333333333333
			local var_259_30 = math.max(var_259_29, arg_256_1.talkMaxDuration)

			if var_259_21 <= arg_256_1.time_ and arg_256_1.time_ < var_259_21 + var_259_30 then
				local var_259_31 = (arg_256_1.time_ - var_259_21) / var_259_30

				arg_256_1.fswtw_.percent = Mathf.Lerp(arg_256_1.var_.oldValueTypewriter, var_259_26, var_259_31)
				arg_256_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_256_1.fswtw_:SetDirty()
			end

			if arg_256_1.time_ >= var_259_21 + var_259_30 and arg_256_1.time_ < var_259_21 + var_259_30 + arg_259_0 then
				arg_256_1.fswtw_.percent = var_259_26

				arg_256_1.fswtw_:SetDirty()
				arg_256_1:ShowNextGo(true)

				arg_256_1.typewritterCharCountI18N = var_259_27
			end

			local var_259_32 = 0

			if var_259_32 < arg_256_1.time_ and arg_256_1.time_ <= var_259_32 + arg_259_0 then
				local var_259_33 = arg_256_1.fswbg_.transform:Find("textbox/adapt/content") or arg_256_1.fswbg_.transform:Find("textbox/content")
				local var_259_34 = var_259_33:GetComponent("Text")
				local var_259_35 = var_259_33:GetComponent("RectTransform")

				var_259_34.alignment = UnityEngine.TextAnchor.LowerCenter
				var_259_35.offsetMin = Vector2.New(0, 0)
				var_259_35.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play319961064 = function(arg_260_0, arg_260_1)
		arg_260_1.time_ = 0
		arg_260_1.frameCnt_ = 0
		arg_260_1.state_ = "playing"
		arg_260_1.curTalkId_ = 319961064
		arg_260_1.duration_ = 5

		SetActive(arg_260_1.tipsGo_, false)

		function arg_260_1.onSingleLineFinish_()
			arg_260_1.onSingleLineUpdate_ = nil
			arg_260_1.onSingleLineFinish_ = nil
			arg_260_1.state_ = "waiting"
		end

		function arg_260_1.playNext_(arg_262_0)
			if arg_262_0 == 1 then
				arg_260_0:Play319961065(arg_260_1)
			end
		end

		function arg_260_1.onSingleLineUpdate_(arg_263_0)
			local var_263_0 = 0

			if var_263_0 < arg_260_1.time_ and arg_260_1.time_ <= var_263_0 + arg_263_0 then
				arg_260_1.cswbg_:SetActive(false)
			end

			local var_263_1 = 0

			if var_263_1 < arg_260_1.time_ and arg_260_1.time_ <= var_263_1 + arg_263_0 then
				arg_260_1.fswbg_:SetActive(false)
				arg_260_1.dialog_:SetActive(true)
				arg_260_1:ShowNextGo(false)
			end

			local var_263_2 = 0
			local var_263_3 = 1.075

			if var_263_2 < arg_260_1.time_ and arg_260_1.time_ <= var_263_2 + arg_263_0 then
				arg_260_1.talkMaxDuration = 0
				arg_260_1.dialogCg_.alpha = 1

				arg_260_1.dialog_:SetActive(true)
				SetActive(arg_260_1.leftNameGo_, false)

				arg_260_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_260_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_260_1:RecordName(arg_260_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_260_1.iconTrs_.gameObject, false)
				arg_260_1.callingController_:SetSelectedState("normal")

				local var_263_4 = arg_260_1:GetWordFromCfg(319961064)
				local var_263_5 = arg_260_1:FormatText(var_263_4.content)

				arg_260_1.text_.text = var_263_5

				LuaForUtil.ClearLinePrefixSymbol(arg_260_1.text_)

				local var_263_6 = 43
				local var_263_7 = utf8.len(var_263_5)
				local var_263_8 = var_263_6 <= 0 and var_263_3 or var_263_3 * (var_263_7 / var_263_6)

				if var_263_8 > 0 and var_263_3 < var_263_8 then
					arg_260_1.talkMaxDuration = var_263_8

					if var_263_8 + var_263_2 > arg_260_1.duration_ then
						arg_260_1.duration_ = var_263_8 + var_263_2
					end
				end

				arg_260_1.text_.text = var_263_5
				arg_260_1.typewritter.percent = 0

				arg_260_1.typewritter:SetDirty()
				arg_260_1:ShowNextGo(false)
				arg_260_1:RecordContent(arg_260_1.text_.text)
			end

			local var_263_9 = math.max(var_263_3, arg_260_1.talkMaxDuration)

			if var_263_2 <= arg_260_1.time_ and arg_260_1.time_ < var_263_2 + var_263_9 then
				arg_260_1.typewritter.percent = (arg_260_1.time_ - var_263_2) / var_263_9

				arg_260_1.typewritter:SetDirty()
			end

			if arg_260_1.time_ >= var_263_2 + var_263_9 and arg_260_1.time_ < var_263_2 + var_263_9 + arg_263_0 then
				arg_260_1.typewritter.percent = 1

				arg_260_1.typewritter:SetDirty()
				arg_260_1:ShowNextGo(true)
			end
		end
	end,
	Play319961065 = function(arg_264_0, arg_264_1)
		arg_264_1.time_ = 0
		arg_264_1.frameCnt_ = 0
		arg_264_1.state_ = "playing"
		arg_264_1.curTalkId_ = 319961065
		arg_264_1.duration_ = 3.9

		local var_264_0 = {
			zh = 1.999999999999,
			ja = 3.9
		}
		local var_264_1 = manager.audio:GetLocalizationFlag()

		if var_264_0[var_264_1] ~= nil then
			arg_264_1.duration_ = var_264_0[var_264_1]
		end

		SetActive(arg_264_1.tipsGo_, false)

		function arg_264_1.onSingleLineFinish_()
			arg_264_1.onSingleLineUpdate_ = nil
			arg_264_1.onSingleLineFinish_ = nil
			arg_264_1.state_ = "waiting"
		end

		function arg_264_1.playNext_(arg_266_0)
			if arg_266_0 == 1 then
				arg_264_0:Play319961066(arg_264_1)
			end
		end

		function arg_264_1.onSingleLineUpdate_(arg_267_0)
			local var_267_0 = 0
			local var_267_1 = 0.2

			if var_267_0 < arg_264_1.time_ and arg_264_1.time_ <= var_267_0 + arg_267_0 then
				local var_267_2 = "play"
				local var_267_3 = "music"

				arg_264_1:AudioAction(var_267_2, var_267_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_267_4 = ""
				local var_267_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_267_5 ~= "" then
					if arg_264_1.bgmTxt_.text ~= var_267_5 and arg_264_1.bgmTxt_.text ~= "" then
						if arg_264_1.bgmTxt2_.text ~= "" then
							arg_264_1.bgmTxt_.text = arg_264_1.bgmTxt2_.text
						end

						arg_264_1.bgmTxt2_.text = var_267_5

						arg_264_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_264_1.bgmTxt_.text = var_267_5
					end

					if arg_264_1.bgmTimer then
						arg_264_1.bgmTimer:Stop()

						arg_264_1.bgmTimer = nil
					end

					if arg_264_1.settingData.show_music_name == 1 then
						arg_264_1.musicController:SetSelectedState("show")
						arg_264_1.musicAnimator_:Play("open", 0, 0)

						if arg_264_1.settingData.music_time ~= 0 then
							arg_264_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_264_1.settingData.music_time), function()
								if arg_264_1 == nil or isNil(arg_264_1.bgmTxt_) then
									return
								end

								arg_264_1.musicController:SetSelectedState("hide")
								arg_264_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_267_6 = 0.233333333333333
			local var_267_7 = 1

			if var_267_6 < arg_264_1.time_ and arg_264_1.time_ <= var_267_6 + arg_267_0 then
				local var_267_8 = "play"
				local var_267_9 = "music"

				arg_264_1:AudioAction(var_267_8, var_267_9, "bgm_activity_3_0_story_theme_orgel", "bgm_activity_3_0_story_theme_orgel", "bgm_activity_3_0_story_theme_orgel.awb")

				local var_267_10 = ""
				local var_267_11 = manager.audio:GetAudioName("bgm_activity_3_0_story_theme_orgel", "bgm_activity_3_0_story_theme_orgel")

				if var_267_11 ~= "" then
					if arg_264_1.bgmTxt_.text ~= var_267_11 and arg_264_1.bgmTxt_.text ~= "" then
						if arg_264_1.bgmTxt2_.text ~= "" then
							arg_264_1.bgmTxt_.text = arg_264_1.bgmTxt2_.text
						end

						arg_264_1.bgmTxt2_.text = var_267_11

						arg_264_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_264_1.bgmTxt_.text = var_267_11
					end

					if arg_264_1.bgmTimer then
						arg_264_1.bgmTimer:Stop()

						arg_264_1.bgmTimer = nil
					end

					if arg_264_1.settingData.show_music_name == 1 then
						arg_264_1.musicController:SetSelectedState("show")
						arg_264_1.musicAnimator_:Play("open", 0, 0)

						if arg_264_1.settingData.music_time ~= 0 then
							arg_264_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_264_1.settingData.music_time), function()
								if arg_264_1 == nil or isNil(arg_264_1.bgmTxt_) then
									return
								end

								arg_264_1.musicController:SetSelectedState("hide")
								arg_264_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_267_12 = arg_264_1.actors_["1284ui_story"].transform
			local var_267_13 = 0

			if var_267_13 < arg_264_1.time_ and arg_264_1.time_ <= var_267_13 + arg_267_0 then
				arg_264_1.var_.moveOldPos1284ui_story = var_267_12.localPosition
			end

			local var_267_14 = 0.001

			if var_267_13 <= arg_264_1.time_ and arg_264_1.time_ < var_267_13 + var_267_14 then
				local var_267_15 = (arg_264_1.time_ - var_267_13) / var_267_14
				local var_267_16 = Vector3.New(0, -0.985, -6.22)

				var_267_12.localPosition = Vector3.Lerp(arg_264_1.var_.moveOldPos1284ui_story, var_267_16, var_267_15)

				local var_267_17 = manager.ui.mainCamera.transform.position - var_267_12.position

				var_267_12.forward = Vector3.New(var_267_17.x, var_267_17.y, var_267_17.z)

				local var_267_18 = var_267_12.localEulerAngles

				var_267_18.z = 0
				var_267_18.x = 0
				var_267_12.localEulerAngles = var_267_18
			end

			if arg_264_1.time_ >= var_267_13 + var_267_14 and arg_264_1.time_ < var_267_13 + var_267_14 + arg_267_0 then
				var_267_12.localPosition = Vector3.New(0, -0.985, -6.22)

				local var_267_19 = manager.ui.mainCamera.transform.position - var_267_12.position

				var_267_12.forward = Vector3.New(var_267_19.x, var_267_19.y, var_267_19.z)

				local var_267_20 = var_267_12.localEulerAngles

				var_267_20.z = 0
				var_267_20.x = 0
				var_267_12.localEulerAngles = var_267_20
			end

			local var_267_21 = 0

			if var_267_21 < arg_264_1.time_ and arg_264_1.time_ <= var_267_21 + arg_267_0 then
				arg_264_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action1_1")
			end

			local var_267_22 = 0

			if var_267_22 < arg_264_1.time_ and arg_264_1.time_ <= var_267_22 + arg_267_0 then
				arg_264_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_267_23 = arg_264_1.actors_["1284ui_story"]
			local var_267_24 = 0

			if var_267_24 < arg_264_1.time_ and arg_264_1.time_ <= var_267_24 + arg_267_0 and arg_264_1.var_.characterEffect1284ui_story == nil then
				arg_264_1.var_.characterEffect1284ui_story = var_267_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_267_25 = 0.2

			if var_267_24 <= arg_264_1.time_ and arg_264_1.time_ < var_267_24 + var_267_25 then
				local var_267_26 = (arg_264_1.time_ - var_267_24) / var_267_25

				if arg_264_1.var_.characterEffect1284ui_story then
					arg_264_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_264_1.time_ >= var_267_24 + var_267_25 and arg_264_1.time_ < var_267_24 + var_267_25 + arg_267_0 and arg_264_1.var_.characterEffect1284ui_story then
				arg_264_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_267_27 = 0
			local var_267_28 = 0.125

			if var_267_27 < arg_264_1.time_ and arg_264_1.time_ <= var_267_27 + arg_267_0 then
				arg_264_1.talkMaxDuration = 0

				arg_264_1.dialog_:SetActive(true)

				local var_267_29 = LeanTween.value(arg_264_1.dialog_, 0, 1, 0.3)

				var_267_29:setOnUpdate(LuaHelper.FloatAction(function(arg_270_0)
					arg_264_1.dialogCg_.alpha = arg_270_0
				end))
				var_267_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_264_1.dialog_)
					var_267_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_264_1.duration_ = arg_264_1.duration_ + 0.3

				SetActive(arg_264_1.leftNameGo_, true)

				local var_267_30 = arg_264_1:FormatText(StoryNameCfg[6].name)

				arg_264_1.leftNameTxt_.text = var_267_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_264_1.leftNameTxt_.transform)

				arg_264_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_264_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_264_1:RecordName(arg_264_1.leftNameTxt_.text)
				SetActive(arg_264_1.iconTrs_.gameObject, false)
				arg_264_1.callingController_:SetSelectedState("normal")

				local var_267_31 = arg_264_1:GetWordFromCfg(319961065)
				local var_267_32 = arg_264_1:FormatText(var_267_31.content)

				arg_264_1.text_.text = var_267_32

				LuaForUtil.ClearLinePrefixSymbol(arg_264_1.text_)

				local var_267_33 = 5
				local var_267_34 = utf8.len(var_267_32)
				local var_267_35 = var_267_33 <= 0 and var_267_28 or var_267_28 * (var_267_34 / var_267_33)

				if var_267_35 > 0 and var_267_28 < var_267_35 then
					arg_264_1.talkMaxDuration = var_267_35
					var_267_27 = var_267_27 + 0.3

					if var_267_35 + var_267_27 > arg_264_1.duration_ then
						arg_264_1.duration_ = var_267_35 + var_267_27
					end
				end

				arg_264_1.text_.text = var_267_32
				arg_264_1.typewritter.percent = 0

				arg_264_1.typewritter:SetDirty()
				arg_264_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961065", "story_v_out_319961.awb") ~= 0 then
					local var_267_36 = manager.audio:GetVoiceLength("story_v_out_319961", "319961065", "story_v_out_319961.awb") / 1000

					if var_267_36 + var_267_27 > arg_264_1.duration_ then
						arg_264_1.duration_ = var_267_36 + var_267_27
					end

					if var_267_31.prefab_name ~= "" and arg_264_1.actors_[var_267_31.prefab_name] ~= nil then
						local var_267_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_264_1.actors_[var_267_31.prefab_name].transform, "story_v_out_319961", "319961065", "story_v_out_319961.awb")

						arg_264_1:RecordAudio("319961065", var_267_37)
						arg_264_1:RecordAudio("319961065", var_267_37)
					else
						arg_264_1:AudioAction("play", "voice", "story_v_out_319961", "319961065", "story_v_out_319961.awb")
					end

					arg_264_1:RecordHistoryTalkVoice("story_v_out_319961", "319961065", "story_v_out_319961.awb")
				end

				arg_264_1:RecordContent(arg_264_1.text_.text)
			end

			local var_267_38 = var_267_27 + 0.3
			local var_267_39 = math.max(var_267_28, arg_264_1.talkMaxDuration)

			if var_267_38 <= arg_264_1.time_ and arg_264_1.time_ < var_267_38 + var_267_39 then
				arg_264_1.typewritter.percent = (arg_264_1.time_ - var_267_38) / var_267_39

				arg_264_1.typewritter:SetDirty()
			end

			if arg_264_1.time_ >= var_267_38 + var_267_39 and arg_264_1.time_ < var_267_38 + var_267_39 + arg_267_0 then
				arg_264_1.typewritter.percent = 1

				arg_264_1.typewritter:SetDirty()
				arg_264_1:ShowNextGo(true)
			end
		end
	end,
	Play319961066 = function(arg_272_0, arg_272_1)
		arg_272_1.time_ = 0
		arg_272_1.frameCnt_ = 0
		arg_272_1.state_ = "playing"
		arg_272_1.curTalkId_ = 319961066
		arg_272_1.duration_ = 3.9

		local var_272_0 = {
			zh = 2.633,
			ja = 3.9
		}
		local var_272_1 = manager.audio:GetLocalizationFlag()

		if var_272_0[var_272_1] ~= nil then
			arg_272_1.duration_ = var_272_0[var_272_1]
		end

		SetActive(arg_272_1.tipsGo_, false)

		function arg_272_1.onSingleLineFinish_()
			arg_272_1.onSingleLineUpdate_ = nil
			arg_272_1.onSingleLineFinish_ = nil
			arg_272_1.state_ = "waiting"
		end

		function arg_272_1.playNext_(arg_274_0)
			if arg_274_0 == 1 then
				arg_272_0:Play319961067(arg_272_1)
			end
		end

		function arg_272_1.onSingleLineUpdate_(arg_275_0)
			local var_275_0 = 0

			if var_275_0 < arg_272_1.time_ and arg_272_1.time_ <= var_275_0 + arg_275_0 then
				arg_272_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_275_1 = 0

			if var_275_1 < arg_272_1.time_ and arg_272_1.time_ <= var_275_1 + arg_275_0 then
				arg_272_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_1")
			end

			local var_275_2 = 0
			local var_275_3 = 0.2

			if var_275_2 < arg_272_1.time_ and arg_272_1.time_ <= var_275_2 + arg_275_0 then
				arg_272_1.talkMaxDuration = 0
				arg_272_1.dialogCg_.alpha = 1

				arg_272_1.dialog_:SetActive(true)
				SetActive(arg_272_1.leftNameGo_, true)

				local var_275_4 = arg_272_1:FormatText(StoryNameCfg[6].name)

				arg_272_1.leftNameTxt_.text = var_275_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_272_1.leftNameTxt_.transform)

				arg_272_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_272_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_272_1:RecordName(arg_272_1.leftNameTxt_.text)
				SetActive(arg_272_1.iconTrs_.gameObject, false)
				arg_272_1.callingController_:SetSelectedState("normal")

				local var_275_5 = arg_272_1:GetWordFromCfg(319961066)
				local var_275_6 = arg_272_1:FormatText(var_275_5.content)

				arg_272_1.text_.text = var_275_6

				LuaForUtil.ClearLinePrefixSymbol(arg_272_1.text_)

				local var_275_7 = 8
				local var_275_8 = utf8.len(var_275_6)
				local var_275_9 = var_275_7 <= 0 and var_275_3 or var_275_3 * (var_275_8 / var_275_7)

				if var_275_9 > 0 and var_275_3 < var_275_9 then
					arg_272_1.talkMaxDuration = var_275_9

					if var_275_9 + var_275_2 > arg_272_1.duration_ then
						arg_272_1.duration_ = var_275_9 + var_275_2
					end
				end

				arg_272_1.text_.text = var_275_6
				arg_272_1.typewritter.percent = 0

				arg_272_1.typewritter:SetDirty()
				arg_272_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961066", "story_v_out_319961.awb") ~= 0 then
					local var_275_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961066", "story_v_out_319961.awb") / 1000

					if var_275_10 + var_275_2 > arg_272_1.duration_ then
						arg_272_1.duration_ = var_275_10 + var_275_2
					end

					if var_275_5.prefab_name ~= "" and arg_272_1.actors_[var_275_5.prefab_name] ~= nil then
						local var_275_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_272_1.actors_[var_275_5.prefab_name].transform, "story_v_out_319961", "319961066", "story_v_out_319961.awb")

						arg_272_1:RecordAudio("319961066", var_275_11)
						arg_272_1:RecordAudio("319961066", var_275_11)
					else
						arg_272_1:AudioAction("play", "voice", "story_v_out_319961", "319961066", "story_v_out_319961.awb")
					end

					arg_272_1:RecordHistoryTalkVoice("story_v_out_319961", "319961066", "story_v_out_319961.awb")
				end

				arg_272_1:RecordContent(arg_272_1.text_.text)
			end

			local var_275_12 = math.max(var_275_3, arg_272_1.talkMaxDuration)

			if var_275_2 <= arg_272_1.time_ and arg_272_1.time_ < var_275_2 + var_275_12 then
				arg_272_1.typewritter.percent = (arg_272_1.time_ - var_275_2) / var_275_12

				arg_272_1.typewritter:SetDirty()
			end

			if arg_272_1.time_ >= var_275_2 + var_275_12 and arg_272_1.time_ < var_275_2 + var_275_12 + arg_275_0 then
				arg_272_1.typewritter.percent = 1

				arg_272_1.typewritter:SetDirty()
				arg_272_1:ShowNextGo(true)
			end
		end
	end,
	Play319961067 = function(arg_276_0, arg_276_1)
		arg_276_1.time_ = 0
		arg_276_1.frameCnt_ = 0
		arg_276_1.state_ = "playing"
		arg_276_1.curTalkId_ = 319961067
		arg_276_1.duration_ = 0.8

		SetActive(arg_276_1.tipsGo_, false)

		function arg_276_1.onSingleLineFinish_()
			arg_276_1.onSingleLineUpdate_ = nil
			arg_276_1.onSingleLineFinish_ = nil
			arg_276_1.state_ = "waiting"

			SetActive(arg_276_1.choicesGo_, true)

			for iter_277_0, iter_277_1 in ipairs(arg_276_1.choices_) do
				local var_277_0 = iter_277_0 <= 1

				SetActive(iter_277_1.go, var_277_0)
			end

			arg_276_1.choices_[1].txt.text = arg_276_1:FormatText(StoryChoiceCfg[800].name)
		end

		function arg_276_1.playNext_(arg_278_0)
			if arg_278_0 == 1 then
				arg_276_0:Play319961068(arg_276_1)
			end
		end

		function arg_276_1.onSingleLineUpdate_(arg_279_0)
			local var_279_0 = 0

			if var_279_0 < arg_276_1.time_ and arg_276_1.time_ <= var_279_0 + arg_279_0 then
				arg_276_1.allBtn_.enabled = false
			end

			local var_279_1 = 0.6

			if arg_276_1.time_ >= var_279_0 + var_279_1 and arg_276_1.time_ < var_279_0 + var_279_1 + arg_279_0 then
				arg_276_1.allBtn_.enabled = true
			end

			local var_279_2 = arg_276_1.actors_["1284ui_story"]
			local var_279_3 = 0

			if var_279_3 < arg_276_1.time_ and arg_276_1.time_ <= var_279_3 + arg_279_0 and arg_276_1.var_.characterEffect1284ui_story == nil then
				arg_276_1.var_.characterEffect1284ui_story = var_279_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_279_4 = 0.2

			if var_279_3 <= arg_276_1.time_ and arg_276_1.time_ < var_279_3 + var_279_4 then
				local var_279_5 = (arg_276_1.time_ - var_279_3) / var_279_4

				if arg_276_1.var_.characterEffect1284ui_story then
					local var_279_6 = Mathf.Lerp(0, 0.5, var_279_5)

					arg_276_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_276_1.var_.characterEffect1284ui_story.fillRatio = var_279_6
				end
			end

			if arg_276_1.time_ >= var_279_3 + var_279_4 and arg_276_1.time_ < var_279_3 + var_279_4 + arg_279_0 and arg_276_1.var_.characterEffect1284ui_story then
				local var_279_7 = 0.5

				arg_276_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_276_1.var_.characterEffect1284ui_story.fillRatio = var_279_7
			end
		end
	end,
	Play319961068 = function(arg_280_0, arg_280_1)
		arg_280_1.time_ = 0
		arg_280_1.frameCnt_ = 0
		arg_280_1.state_ = "playing"
		arg_280_1.curTalkId_ = 319961068
		arg_280_1.duration_ = 7.83

		local var_280_0 = {
			zh = 4.933,
			ja = 7.833
		}
		local var_280_1 = manager.audio:GetLocalizationFlag()

		if var_280_0[var_280_1] ~= nil then
			arg_280_1.duration_ = var_280_0[var_280_1]
		end

		SetActive(arg_280_1.tipsGo_, false)

		function arg_280_1.onSingleLineFinish_()
			arg_280_1.onSingleLineUpdate_ = nil
			arg_280_1.onSingleLineFinish_ = nil
			arg_280_1.state_ = "waiting"
		end

		function arg_280_1.playNext_(arg_282_0)
			if arg_282_0 == 1 then
				arg_280_0:Play319961069(arg_280_1)
			end
		end

		function arg_280_1.onSingleLineUpdate_(arg_283_0)
			local var_283_0 = arg_280_1.actors_["1284ui_story"]
			local var_283_1 = 0

			if var_283_1 < arg_280_1.time_ and arg_280_1.time_ <= var_283_1 + arg_283_0 and arg_280_1.var_.characterEffect1284ui_story == nil then
				arg_280_1.var_.characterEffect1284ui_story = var_283_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_283_2 = 0.2

			if var_283_1 <= arg_280_1.time_ and arg_280_1.time_ < var_283_1 + var_283_2 then
				local var_283_3 = (arg_280_1.time_ - var_283_1) / var_283_2

				if arg_280_1.var_.characterEffect1284ui_story then
					arg_280_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_280_1.time_ >= var_283_1 + var_283_2 and arg_280_1.time_ < var_283_1 + var_283_2 + arg_283_0 and arg_280_1.var_.characterEffect1284ui_story then
				arg_280_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_283_4 = 0

			if var_283_4 < arg_280_1.time_ and arg_280_1.time_ <= var_283_4 + arg_283_0 then
				arg_280_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_283_5 = 0
			local var_283_6 = 0.425

			if var_283_5 < arg_280_1.time_ and arg_280_1.time_ <= var_283_5 + arg_283_0 then
				arg_280_1.talkMaxDuration = 0
				arg_280_1.dialogCg_.alpha = 1

				arg_280_1.dialog_:SetActive(true)
				SetActive(arg_280_1.leftNameGo_, true)

				local var_283_7 = arg_280_1:FormatText(StoryNameCfg[6].name)

				arg_280_1.leftNameTxt_.text = var_283_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_280_1.leftNameTxt_.transform)

				arg_280_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_280_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_280_1:RecordName(arg_280_1.leftNameTxt_.text)
				SetActive(arg_280_1.iconTrs_.gameObject, false)
				arg_280_1.callingController_:SetSelectedState("normal")

				local var_283_8 = arg_280_1:GetWordFromCfg(319961068)
				local var_283_9 = arg_280_1:FormatText(var_283_8.content)

				arg_280_1.text_.text = var_283_9

				LuaForUtil.ClearLinePrefixSymbol(arg_280_1.text_)

				local var_283_10 = 17
				local var_283_11 = utf8.len(var_283_9)
				local var_283_12 = var_283_10 <= 0 and var_283_6 or var_283_6 * (var_283_11 / var_283_10)

				if var_283_12 > 0 and var_283_6 < var_283_12 then
					arg_280_1.talkMaxDuration = var_283_12

					if var_283_12 + var_283_5 > arg_280_1.duration_ then
						arg_280_1.duration_ = var_283_12 + var_283_5
					end
				end

				arg_280_1.text_.text = var_283_9
				arg_280_1.typewritter.percent = 0

				arg_280_1.typewritter:SetDirty()
				arg_280_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961068", "story_v_out_319961.awb") ~= 0 then
					local var_283_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961068", "story_v_out_319961.awb") / 1000

					if var_283_13 + var_283_5 > arg_280_1.duration_ then
						arg_280_1.duration_ = var_283_13 + var_283_5
					end

					if var_283_8.prefab_name ~= "" and arg_280_1.actors_[var_283_8.prefab_name] ~= nil then
						local var_283_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_280_1.actors_[var_283_8.prefab_name].transform, "story_v_out_319961", "319961068", "story_v_out_319961.awb")

						arg_280_1:RecordAudio("319961068", var_283_14)
						arg_280_1:RecordAudio("319961068", var_283_14)
					else
						arg_280_1:AudioAction("play", "voice", "story_v_out_319961", "319961068", "story_v_out_319961.awb")
					end

					arg_280_1:RecordHistoryTalkVoice("story_v_out_319961", "319961068", "story_v_out_319961.awb")
				end

				arg_280_1:RecordContent(arg_280_1.text_.text)
			end

			local var_283_15 = math.max(var_283_6, arg_280_1.talkMaxDuration)

			if var_283_5 <= arg_280_1.time_ and arg_280_1.time_ < var_283_5 + var_283_15 then
				arg_280_1.typewritter.percent = (arg_280_1.time_ - var_283_5) / var_283_15

				arg_280_1.typewritter:SetDirty()
			end

			if arg_280_1.time_ >= var_283_5 + var_283_15 and arg_280_1.time_ < var_283_5 + var_283_15 + arg_283_0 then
				arg_280_1.typewritter.percent = 1

				arg_280_1.typewritter:SetDirty()
				arg_280_1:ShowNextGo(true)
			end
		end
	end,
	Play319961069 = function(arg_284_0, arg_284_1)
		arg_284_1.time_ = 0
		arg_284_1.frameCnt_ = 0
		arg_284_1.state_ = "playing"
		arg_284_1.curTalkId_ = 319961069
		arg_284_1.duration_ = 5.27

		local var_284_0 = {
			zh = 2.3,
			ja = 5.266
		}
		local var_284_1 = manager.audio:GetLocalizationFlag()

		if var_284_0[var_284_1] ~= nil then
			arg_284_1.duration_ = var_284_0[var_284_1]
		end

		SetActive(arg_284_1.tipsGo_, false)

		function arg_284_1.onSingleLineFinish_()
			arg_284_1.onSingleLineUpdate_ = nil
			arg_284_1.onSingleLineFinish_ = nil
			arg_284_1.state_ = "waiting"
		end

		function arg_284_1.playNext_(arg_286_0)
			if arg_286_0 == 1 then
				arg_284_0:Play319961070(arg_284_1)
			end
		end

		function arg_284_1.onSingleLineUpdate_(arg_287_0)
			local var_287_0 = 0

			if var_287_0 < arg_284_1.time_ and arg_284_1.time_ <= var_287_0 + arg_287_0 then
				arg_284_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_287_1 = 0
			local var_287_2 = 0.225

			if var_287_1 < arg_284_1.time_ and arg_284_1.time_ <= var_287_1 + arg_287_0 then
				arg_284_1.talkMaxDuration = 0
				arg_284_1.dialogCg_.alpha = 1

				arg_284_1.dialog_:SetActive(true)
				SetActive(arg_284_1.leftNameGo_, true)

				local var_287_3 = arg_284_1:FormatText(StoryNameCfg[6].name)

				arg_284_1.leftNameTxt_.text = var_287_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_284_1.leftNameTxt_.transform)

				arg_284_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_284_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_284_1:RecordName(arg_284_1.leftNameTxt_.text)
				SetActive(arg_284_1.iconTrs_.gameObject, false)
				arg_284_1.callingController_:SetSelectedState("normal")

				local var_287_4 = arg_284_1:GetWordFromCfg(319961069)
				local var_287_5 = arg_284_1:FormatText(var_287_4.content)

				arg_284_1.text_.text = var_287_5

				LuaForUtil.ClearLinePrefixSymbol(arg_284_1.text_)

				local var_287_6 = 9
				local var_287_7 = utf8.len(var_287_5)
				local var_287_8 = var_287_6 <= 0 and var_287_2 or var_287_2 * (var_287_7 / var_287_6)

				if var_287_8 > 0 and var_287_2 < var_287_8 then
					arg_284_1.talkMaxDuration = var_287_8

					if var_287_8 + var_287_1 > arg_284_1.duration_ then
						arg_284_1.duration_ = var_287_8 + var_287_1
					end
				end

				arg_284_1.text_.text = var_287_5
				arg_284_1.typewritter.percent = 0

				arg_284_1.typewritter:SetDirty()
				arg_284_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961069", "story_v_out_319961.awb") ~= 0 then
					local var_287_9 = manager.audio:GetVoiceLength("story_v_out_319961", "319961069", "story_v_out_319961.awb") / 1000

					if var_287_9 + var_287_1 > arg_284_1.duration_ then
						arg_284_1.duration_ = var_287_9 + var_287_1
					end

					if var_287_4.prefab_name ~= "" and arg_284_1.actors_[var_287_4.prefab_name] ~= nil then
						local var_287_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_284_1.actors_[var_287_4.prefab_name].transform, "story_v_out_319961", "319961069", "story_v_out_319961.awb")

						arg_284_1:RecordAudio("319961069", var_287_10)
						arg_284_1:RecordAudio("319961069", var_287_10)
					else
						arg_284_1:AudioAction("play", "voice", "story_v_out_319961", "319961069", "story_v_out_319961.awb")
					end

					arg_284_1:RecordHistoryTalkVoice("story_v_out_319961", "319961069", "story_v_out_319961.awb")
				end

				arg_284_1:RecordContent(arg_284_1.text_.text)
			end

			local var_287_11 = math.max(var_287_2, arg_284_1.talkMaxDuration)

			if var_287_1 <= arg_284_1.time_ and arg_284_1.time_ < var_287_1 + var_287_11 then
				arg_284_1.typewritter.percent = (arg_284_1.time_ - var_287_1) / var_287_11

				arg_284_1.typewritter:SetDirty()
			end

			if arg_284_1.time_ >= var_287_1 + var_287_11 and arg_284_1.time_ < var_287_1 + var_287_11 + arg_287_0 then
				arg_284_1.typewritter.percent = 1

				arg_284_1.typewritter:SetDirty()
				arg_284_1:ShowNextGo(true)
			end
		end
	end,
	Play319961070 = function(arg_288_0, arg_288_1)
		arg_288_1.time_ = 0
		arg_288_1.frameCnt_ = 0
		arg_288_1.state_ = "playing"
		arg_288_1.curTalkId_ = 319961070
		arg_288_1.duration_ = 1

		SetActive(arg_288_1.tipsGo_, false)

		function arg_288_1.onSingleLineFinish_()
			arg_288_1.onSingleLineUpdate_ = nil
			arg_288_1.onSingleLineFinish_ = nil
			arg_288_1.state_ = "waiting"

			SetActive(arg_288_1.choicesGo_, true)

			for iter_289_0, iter_289_1 in ipairs(arg_288_1.choices_) do
				local var_289_0 = iter_289_0 <= 1

				SetActive(iter_289_1.go, var_289_0)
			end

			arg_288_1.choices_[1].txt.text = arg_288_1:FormatText(StoryChoiceCfg[801].name)
		end

		function arg_288_1.playNext_(arg_290_0)
			if arg_290_0 == 1 then
				arg_288_0:Play319961071(arg_288_1)
			end
		end

		function arg_288_1.onSingleLineUpdate_(arg_291_0)
			local var_291_0 = 0

			if var_291_0 < arg_288_1.time_ and arg_288_1.time_ <= var_291_0 + arg_291_0 then
				arg_288_1.allBtn_.enabled = false
			end

			local var_291_1 = 0.999999999999

			if arg_288_1.time_ >= var_291_0 + var_291_1 and arg_288_1.time_ < var_291_0 + var_291_1 + arg_291_0 then
				arg_288_1.allBtn_.enabled = true
			end

			local var_291_2 = arg_288_1.actors_["1284ui_story"]
			local var_291_3 = 0

			if var_291_3 < arg_288_1.time_ and arg_288_1.time_ <= var_291_3 + arg_291_0 and arg_288_1.var_.characterEffect1284ui_story == nil then
				arg_288_1.var_.characterEffect1284ui_story = var_291_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_291_4 = 0.2

			if var_291_3 <= arg_288_1.time_ and arg_288_1.time_ < var_291_3 + var_291_4 then
				local var_291_5 = (arg_288_1.time_ - var_291_3) / var_291_4

				if arg_288_1.var_.characterEffect1284ui_story then
					local var_291_6 = Mathf.Lerp(0, 0.5, var_291_5)

					arg_288_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_288_1.var_.characterEffect1284ui_story.fillRatio = var_291_6
				end
			end

			if arg_288_1.time_ >= var_291_3 + var_291_4 and arg_288_1.time_ < var_291_3 + var_291_4 + arg_291_0 and arg_288_1.var_.characterEffect1284ui_story then
				local var_291_7 = 0.5

				arg_288_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_288_1.var_.characterEffect1284ui_story.fillRatio = var_291_7
			end
		end
	end,
	Play319961071 = function(arg_292_0, arg_292_1)
		arg_292_1.time_ = 0
		arg_292_1.frameCnt_ = 0
		arg_292_1.state_ = "playing"
		arg_292_1.curTalkId_ = 319961071
		arg_292_1.duration_ = 2.6

		local var_292_0 = {
			zh = 1.999999999999,
			ja = 2.6
		}
		local var_292_1 = manager.audio:GetLocalizationFlag()

		if var_292_0[var_292_1] ~= nil then
			arg_292_1.duration_ = var_292_0[var_292_1]
		end

		SetActive(arg_292_1.tipsGo_, false)

		function arg_292_1.onSingleLineFinish_()
			arg_292_1.onSingleLineUpdate_ = nil
			arg_292_1.onSingleLineFinish_ = nil
			arg_292_1.state_ = "waiting"
		end

		function arg_292_1.playNext_(arg_294_0)
			if arg_294_0 == 1 then
				arg_292_0:Play319961072(arg_292_1)
			end
		end

		function arg_292_1.onSingleLineUpdate_(arg_295_0)
			local var_295_0 = arg_292_1.actors_["1284ui_story"]
			local var_295_1 = 0

			if var_295_1 < arg_292_1.time_ and arg_292_1.time_ <= var_295_1 + arg_295_0 and arg_292_1.var_.characterEffect1284ui_story == nil then
				arg_292_1.var_.characterEffect1284ui_story = var_295_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_295_2 = 0.2

			if var_295_1 <= arg_292_1.time_ and arg_292_1.time_ < var_295_1 + var_295_2 then
				local var_295_3 = (arg_292_1.time_ - var_295_1) / var_295_2

				if arg_292_1.var_.characterEffect1284ui_story then
					arg_292_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_292_1.time_ >= var_295_1 + var_295_2 and arg_292_1.time_ < var_295_1 + var_295_2 + arg_295_0 and arg_292_1.var_.characterEffect1284ui_story then
				arg_292_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_295_4 = 0

			if var_295_4 < arg_292_1.time_ and arg_292_1.time_ <= var_295_4 + arg_295_0 then
				arg_292_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_295_5 = 0
			local var_295_6 = 0.125

			if var_295_5 < arg_292_1.time_ and arg_292_1.time_ <= var_295_5 + arg_295_0 then
				arg_292_1.talkMaxDuration = 0
				arg_292_1.dialogCg_.alpha = 1

				arg_292_1.dialog_:SetActive(true)
				SetActive(arg_292_1.leftNameGo_, true)

				local var_295_7 = arg_292_1:FormatText(StoryNameCfg[6].name)

				arg_292_1.leftNameTxt_.text = var_295_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_292_1.leftNameTxt_.transform)

				arg_292_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_292_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_292_1:RecordName(arg_292_1.leftNameTxt_.text)
				SetActive(arg_292_1.iconTrs_.gameObject, false)
				arg_292_1.callingController_:SetSelectedState("normal")

				local var_295_8 = arg_292_1:GetWordFromCfg(319961071)
				local var_295_9 = arg_292_1:FormatText(var_295_8.content)

				arg_292_1.text_.text = var_295_9

				LuaForUtil.ClearLinePrefixSymbol(arg_292_1.text_)

				local var_295_10 = 5
				local var_295_11 = utf8.len(var_295_9)
				local var_295_12 = var_295_10 <= 0 and var_295_6 or var_295_6 * (var_295_11 / var_295_10)

				if var_295_12 > 0 and var_295_6 < var_295_12 then
					arg_292_1.talkMaxDuration = var_295_12

					if var_295_12 + var_295_5 > arg_292_1.duration_ then
						arg_292_1.duration_ = var_295_12 + var_295_5
					end
				end

				arg_292_1.text_.text = var_295_9
				arg_292_1.typewritter.percent = 0

				arg_292_1.typewritter:SetDirty()
				arg_292_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961071", "story_v_out_319961.awb") ~= 0 then
					local var_295_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961071", "story_v_out_319961.awb") / 1000

					if var_295_13 + var_295_5 > arg_292_1.duration_ then
						arg_292_1.duration_ = var_295_13 + var_295_5
					end

					if var_295_8.prefab_name ~= "" and arg_292_1.actors_[var_295_8.prefab_name] ~= nil then
						local var_295_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_292_1.actors_[var_295_8.prefab_name].transform, "story_v_out_319961", "319961071", "story_v_out_319961.awb")

						arg_292_1:RecordAudio("319961071", var_295_14)
						arg_292_1:RecordAudio("319961071", var_295_14)
					else
						arg_292_1:AudioAction("play", "voice", "story_v_out_319961", "319961071", "story_v_out_319961.awb")
					end

					arg_292_1:RecordHistoryTalkVoice("story_v_out_319961", "319961071", "story_v_out_319961.awb")
				end

				arg_292_1:RecordContent(arg_292_1.text_.text)
			end

			local var_295_15 = math.max(var_295_6, arg_292_1.talkMaxDuration)

			if var_295_5 <= arg_292_1.time_ and arg_292_1.time_ < var_295_5 + var_295_15 then
				arg_292_1.typewritter.percent = (arg_292_1.time_ - var_295_5) / var_295_15

				arg_292_1.typewritter:SetDirty()
			end

			if arg_292_1.time_ >= var_295_5 + var_295_15 and arg_292_1.time_ < var_295_5 + var_295_15 + arg_295_0 then
				arg_292_1.typewritter.percent = 1

				arg_292_1.typewritter:SetDirty()
				arg_292_1:ShowNextGo(true)
			end
		end
	end,
	Play319961072 = function(arg_296_0, arg_296_1)
		arg_296_1.time_ = 0
		arg_296_1.frameCnt_ = 0
		arg_296_1.state_ = "playing"
		arg_296_1.curTalkId_ = 319961072
		arg_296_1.duration_ = 1

		SetActive(arg_296_1.tipsGo_, false)

		function arg_296_1.onSingleLineFinish_()
			arg_296_1.onSingleLineUpdate_ = nil
			arg_296_1.onSingleLineFinish_ = nil
			arg_296_1.state_ = "waiting"

			SetActive(arg_296_1.choicesGo_, true)

			for iter_297_0, iter_297_1 in ipairs(arg_296_1.choices_) do
				local var_297_0 = iter_297_0 <= 1

				SetActive(iter_297_1.go, var_297_0)
			end

			arg_296_1.choices_[1].txt.text = arg_296_1:FormatText(StoryChoiceCfg[802].name)
		end

		function arg_296_1.playNext_(arg_298_0)
			if arg_298_0 == 1 then
				arg_296_0:Play319961073(arg_296_1)
			end
		end

		function arg_296_1.onSingleLineUpdate_(arg_299_0)
			local var_299_0 = 0

			if var_299_0 < arg_296_1.time_ and arg_296_1.time_ <= var_299_0 + arg_299_0 then
				arg_296_1.allBtn_.enabled = false
			end

			local var_299_1 = 0.6

			if arg_296_1.time_ >= var_299_0 + var_299_1 and arg_296_1.time_ < var_299_0 + var_299_1 + arg_299_0 then
				arg_296_1.allBtn_.enabled = true
			end

			local var_299_2 = arg_296_1.actors_["1284ui_story"]
			local var_299_3 = 0

			if var_299_3 < arg_296_1.time_ and arg_296_1.time_ <= var_299_3 + arg_299_0 and arg_296_1.var_.characterEffect1284ui_story == nil then
				arg_296_1.var_.characterEffect1284ui_story = var_299_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_299_4 = 0.2

			if var_299_3 <= arg_296_1.time_ and arg_296_1.time_ < var_299_3 + var_299_4 then
				local var_299_5 = (arg_296_1.time_ - var_299_3) / var_299_4

				if arg_296_1.var_.characterEffect1284ui_story then
					local var_299_6 = Mathf.Lerp(0, 0.5, var_299_5)

					arg_296_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_296_1.var_.characterEffect1284ui_story.fillRatio = var_299_6
				end
			end

			if arg_296_1.time_ >= var_299_3 + var_299_4 and arg_296_1.time_ < var_299_3 + var_299_4 + arg_299_0 and arg_296_1.var_.characterEffect1284ui_story then
				local var_299_7 = 0.5

				arg_296_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_296_1.var_.characterEffect1284ui_story.fillRatio = var_299_7
			end
		end
	end,
	Play319961073 = function(arg_300_0, arg_300_1)
		arg_300_1.time_ = 0
		arg_300_1.frameCnt_ = 0
		arg_300_1.state_ = "playing"
		arg_300_1.curTalkId_ = 319961073
		arg_300_1.duration_ = 1

		SetActive(arg_300_1.tipsGo_, false)

		function arg_300_1.onSingleLineFinish_()
			arg_300_1.onSingleLineUpdate_ = nil
			arg_300_1.onSingleLineFinish_ = nil
			arg_300_1.state_ = "waiting"

			SetActive(arg_300_1.choicesGo_, true)

			for iter_301_0, iter_301_1 in ipairs(arg_300_1.choices_) do
				local var_301_0 = iter_301_0 <= 1

				SetActive(iter_301_1.go, var_301_0)
			end

			arg_300_1.choices_[1].txt.text = arg_300_1:FormatText(StoryChoiceCfg[803].name)
		end

		function arg_300_1.playNext_(arg_302_0)
			if arg_302_0 == 1 then
				arg_300_0:Play319961074(arg_300_1)
			end
		end

		function arg_300_1.onSingleLineUpdate_(arg_303_0)
			local var_303_0 = 0

			if var_303_0 < arg_300_1.time_ and arg_300_1.time_ <= var_303_0 + arg_303_0 then
				arg_300_1.allBtn_.enabled = false
			end

			local var_303_1 = 0.6

			if arg_300_1.time_ >= var_303_0 + var_303_1 and arg_300_1.time_ < var_303_0 + var_303_1 + arg_303_0 then
				arg_300_1.allBtn_.enabled = true
			end
		end
	end,
	Play319961074 = function(arg_304_0, arg_304_1)
		arg_304_1.time_ = 0
		arg_304_1.frameCnt_ = 0
		arg_304_1.state_ = "playing"
		arg_304_1.curTalkId_ = 319961074
		arg_304_1.duration_ = 6.4

		local var_304_0 = {
			zh = 6.1,
			ja = 6.4
		}
		local var_304_1 = manager.audio:GetLocalizationFlag()

		if var_304_0[var_304_1] ~= nil then
			arg_304_1.duration_ = var_304_0[var_304_1]
		end

		SetActive(arg_304_1.tipsGo_, false)

		function arg_304_1.onSingleLineFinish_()
			arg_304_1.onSingleLineUpdate_ = nil
			arg_304_1.onSingleLineFinish_ = nil
			arg_304_1.state_ = "waiting"
		end

		function arg_304_1.playNext_(arg_306_0)
			if arg_306_0 == 1 then
				arg_304_0:Play319961075(arg_304_1)
			end
		end

		function arg_304_1.onSingleLineUpdate_(arg_307_0)
			local var_307_0 = arg_304_1.actors_["1284ui_story"]
			local var_307_1 = 0

			if var_307_1 < arg_304_1.time_ and arg_304_1.time_ <= var_307_1 + arg_307_0 and arg_304_1.var_.characterEffect1284ui_story == nil then
				arg_304_1.var_.characterEffect1284ui_story = var_307_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_307_2 = 0.2

			if var_307_1 <= arg_304_1.time_ and arg_304_1.time_ < var_307_1 + var_307_2 then
				local var_307_3 = (arg_304_1.time_ - var_307_1) / var_307_2

				if arg_304_1.var_.characterEffect1284ui_story then
					arg_304_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_304_1.time_ >= var_307_1 + var_307_2 and arg_304_1.time_ < var_307_1 + var_307_2 + arg_307_0 and arg_304_1.var_.characterEffect1284ui_story then
				arg_304_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_307_4 = 0

			if var_307_4 < arg_304_1.time_ and arg_304_1.time_ <= var_307_4 + arg_307_0 then
				arg_304_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action5_1")
			end

			local var_307_5 = 0
			local var_307_6 = 0.575

			if var_307_5 < arg_304_1.time_ and arg_304_1.time_ <= var_307_5 + arg_307_0 then
				arg_304_1.talkMaxDuration = 0
				arg_304_1.dialogCg_.alpha = 1

				arg_304_1.dialog_:SetActive(true)
				SetActive(arg_304_1.leftNameGo_, true)

				local var_307_7 = arg_304_1:FormatText(StoryNameCfg[6].name)

				arg_304_1.leftNameTxt_.text = var_307_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_304_1.leftNameTxt_.transform)

				arg_304_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_304_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_304_1:RecordName(arg_304_1.leftNameTxt_.text)
				SetActive(arg_304_1.iconTrs_.gameObject, false)
				arg_304_1.callingController_:SetSelectedState("normal")

				local var_307_8 = arg_304_1:GetWordFromCfg(319961074)
				local var_307_9 = arg_304_1:FormatText(var_307_8.content)

				arg_304_1.text_.text = var_307_9

				LuaForUtil.ClearLinePrefixSymbol(arg_304_1.text_)

				local var_307_10 = 23
				local var_307_11 = utf8.len(var_307_9)
				local var_307_12 = var_307_10 <= 0 and var_307_6 or var_307_6 * (var_307_11 / var_307_10)

				if var_307_12 > 0 and var_307_6 < var_307_12 then
					arg_304_1.talkMaxDuration = var_307_12

					if var_307_12 + var_307_5 > arg_304_1.duration_ then
						arg_304_1.duration_ = var_307_12 + var_307_5
					end
				end

				arg_304_1.text_.text = var_307_9
				arg_304_1.typewritter.percent = 0

				arg_304_1.typewritter:SetDirty()
				arg_304_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961074", "story_v_out_319961.awb") ~= 0 then
					local var_307_13 = manager.audio:GetVoiceLength("story_v_out_319961", "319961074", "story_v_out_319961.awb") / 1000

					if var_307_13 + var_307_5 > arg_304_1.duration_ then
						arg_304_1.duration_ = var_307_13 + var_307_5
					end

					if var_307_8.prefab_name ~= "" and arg_304_1.actors_[var_307_8.prefab_name] ~= nil then
						local var_307_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_304_1.actors_[var_307_8.prefab_name].transform, "story_v_out_319961", "319961074", "story_v_out_319961.awb")

						arg_304_1:RecordAudio("319961074", var_307_14)
						arg_304_1:RecordAudio("319961074", var_307_14)
					else
						arg_304_1:AudioAction("play", "voice", "story_v_out_319961", "319961074", "story_v_out_319961.awb")
					end

					arg_304_1:RecordHistoryTalkVoice("story_v_out_319961", "319961074", "story_v_out_319961.awb")
				end

				arg_304_1:RecordContent(arg_304_1.text_.text)
			end

			local var_307_15 = math.max(var_307_6, arg_304_1.talkMaxDuration)

			if var_307_5 <= arg_304_1.time_ and arg_304_1.time_ < var_307_5 + var_307_15 then
				arg_304_1.typewritter.percent = (arg_304_1.time_ - var_307_5) / var_307_15

				arg_304_1.typewritter:SetDirty()
			end

			if arg_304_1.time_ >= var_307_5 + var_307_15 and arg_304_1.time_ < var_307_5 + var_307_15 + arg_307_0 then
				arg_304_1.typewritter.percent = 1

				arg_304_1.typewritter:SetDirty()
				arg_304_1:ShowNextGo(true)
			end
		end
	end,
	Play319961075 = function(arg_308_0, arg_308_1)
		arg_308_1.time_ = 0
		arg_308_1.frameCnt_ = 0
		arg_308_1.state_ = "playing"
		arg_308_1.curTalkId_ = 319961075
		arg_308_1.duration_ = 6

		local var_308_0 = {
			zh = 4.8,
			ja = 6
		}
		local var_308_1 = manager.audio:GetLocalizationFlag()

		if var_308_0[var_308_1] ~= nil then
			arg_308_1.duration_ = var_308_0[var_308_1]
		end

		SetActive(arg_308_1.tipsGo_, false)

		function arg_308_1.onSingleLineFinish_()
			arg_308_1.onSingleLineUpdate_ = nil
			arg_308_1.onSingleLineFinish_ = nil
			arg_308_1.state_ = "waiting"
		end

		function arg_308_1.playNext_(arg_310_0)
			if arg_310_0 == 1 then
				arg_308_0:Play319961076(arg_308_1)
			end
		end

		function arg_308_1.onSingleLineUpdate_(arg_311_0)
			local var_311_0 = 0

			if var_311_0 < arg_308_1.time_ and arg_308_1.time_ <= var_311_0 + arg_311_0 then
				arg_308_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284actionlink/1284action459")
			end

			local var_311_1 = 0

			if var_311_1 < arg_308_1.time_ and arg_308_1.time_ <= var_311_1 + arg_311_0 then
				arg_308_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_311_2 = 0
			local var_311_3 = 0.0329999998211861

			if var_311_2 < arg_308_1.time_ and arg_308_1.time_ <= var_311_2 + arg_311_0 then
				arg_308_1.talkMaxDuration = 0
				arg_308_1.dialogCg_.alpha = 1

				arg_308_1.dialog_:SetActive(true)
				SetActive(arg_308_1.leftNameGo_, true)

				local var_311_4 = arg_308_1:FormatText(StoryNameCfg[6].name)

				arg_308_1.leftNameTxt_.text = var_311_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_308_1.leftNameTxt_.transform)

				arg_308_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_308_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_308_1:RecordName(arg_308_1.leftNameTxt_.text)
				SetActive(arg_308_1.iconTrs_.gameObject, false)
				arg_308_1.callingController_:SetSelectedState("normal")

				local var_311_5 = arg_308_1:GetWordFromCfg(319961075)
				local var_311_6 = arg_308_1:FormatText(var_311_5.content)

				arg_308_1.text_.text = var_311_6

				LuaForUtil.ClearLinePrefixSymbol(arg_308_1.text_)

				local var_311_7 = 18
				local var_311_8 = utf8.len(var_311_6)
				local var_311_9 = var_311_7 <= 0 and var_311_3 or var_311_3 * (var_311_8 / var_311_7)

				if var_311_9 > 0 and var_311_3 < var_311_9 then
					arg_308_1.talkMaxDuration = var_311_9

					if var_311_9 + var_311_2 > arg_308_1.duration_ then
						arg_308_1.duration_ = var_311_9 + var_311_2
					end
				end

				arg_308_1.text_.text = var_311_6
				arg_308_1.typewritter.percent = 0

				arg_308_1.typewritter:SetDirty()
				arg_308_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961075", "story_v_out_319961.awb") ~= 0 then
					local var_311_10 = manager.audio:GetVoiceLength("story_v_out_319961", "319961075", "story_v_out_319961.awb") / 1000

					if var_311_10 + var_311_2 > arg_308_1.duration_ then
						arg_308_1.duration_ = var_311_10 + var_311_2
					end

					if var_311_5.prefab_name ~= "" and arg_308_1.actors_[var_311_5.prefab_name] ~= nil then
						local var_311_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_308_1.actors_[var_311_5.prefab_name].transform, "story_v_out_319961", "319961075", "story_v_out_319961.awb")

						arg_308_1:RecordAudio("319961075", var_311_11)
						arg_308_1:RecordAudio("319961075", var_311_11)
					else
						arg_308_1:AudioAction("play", "voice", "story_v_out_319961", "319961075", "story_v_out_319961.awb")
					end

					arg_308_1:RecordHistoryTalkVoice("story_v_out_319961", "319961075", "story_v_out_319961.awb")
				end

				arg_308_1:RecordContent(arg_308_1.text_.text)
			end

			local var_311_12 = math.max(var_311_3, arg_308_1.talkMaxDuration)

			if var_311_2 <= arg_308_1.time_ and arg_308_1.time_ < var_311_2 + var_311_12 then
				arg_308_1.typewritter.percent = (arg_308_1.time_ - var_311_2) / var_311_12

				arg_308_1.typewritter:SetDirty()
			end

			if arg_308_1.time_ >= var_311_2 + var_311_12 and arg_308_1.time_ < var_311_2 + var_311_12 + arg_311_0 then
				arg_308_1.typewritter.percent = 1

				arg_308_1.typewritter:SetDirty()
				arg_308_1:ShowNextGo(true)
			end
		end
	end,
	Play319961076 = function(arg_312_0, arg_312_1)
		arg_312_1.time_ = 0
		arg_312_1.frameCnt_ = 0
		arg_312_1.state_ = "playing"
		arg_312_1.curTalkId_ = 319961076
		arg_312_1.duration_ = 8.7

		local var_312_0 = {
			zh = 6.4,
			ja = 8.7
		}
		local var_312_1 = manager.audio:GetLocalizationFlag()

		if var_312_0[var_312_1] ~= nil then
			arg_312_1.duration_ = var_312_0[var_312_1]
		end

		SetActive(arg_312_1.tipsGo_, false)

		function arg_312_1.onSingleLineFinish_()
			arg_312_1.onSingleLineUpdate_ = nil
			arg_312_1.onSingleLineFinish_ = nil
			arg_312_1.state_ = "waiting"
		end

		function arg_312_1.playNext_(arg_314_0)
			if arg_314_0 == 1 then
				arg_312_0:Play319961077(arg_312_1)
			end
		end

		function arg_312_1.onSingleLineUpdate_(arg_315_0)
			local var_315_0 = 0
			local var_315_1 = 0.55

			if var_315_0 < arg_312_1.time_ and arg_312_1.time_ <= var_315_0 + arg_315_0 then
				arg_312_1.talkMaxDuration = 0
				arg_312_1.dialogCg_.alpha = 1

				arg_312_1.dialog_:SetActive(true)
				SetActive(arg_312_1.leftNameGo_, true)

				local var_315_2 = arg_312_1:FormatText(StoryNameCfg[6].name)

				arg_312_1.leftNameTxt_.text = var_315_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_312_1.leftNameTxt_.transform)

				arg_312_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_312_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_312_1:RecordName(arg_312_1.leftNameTxt_.text)
				SetActive(arg_312_1.iconTrs_.gameObject, false)
				arg_312_1.callingController_:SetSelectedState("normal")

				local var_315_3 = arg_312_1:GetWordFromCfg(319961076)
				local var_315_4 = arg_312_1:FormatText(var_315_3.content)

				arg_312_1.text_.text = var_315_4

				LuaForUtil.ClearLinePrefixSymbol(arg_312_1.text_)

				local var_315_5 = 22
				local var_315_6 = utf8.len(var_315_4)
				local var_315_7 = var_315_5 <= 0 and var_315_1 or var_315_1 * (var_315_6 / var_315_5)

				if var_315_7 > 0 and var_315_1 < var_315_7 then
					arg_312_1.talkMaxDuration = var_315_7

					if var_315_7 + var_315_0 > arg_312_1.duration_ then
						arg_312_1.duration_ = var_315_7 + var_315_0
					end
				end

				arg_312_1.text_.text = var_315_4
				arg_312_1.typewritter.percent = 0

				arg_312_1.typewritter:SetDirty()
				arg_312_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961076", "story_v_out_319961.awb") ~= 0 then
					local var_315_8 = manager.audio:GetVoiceLength("story_v_out_319961", "319961076", "story_v_out_319961.awb") / 1000

					if var_315_8 + var_315_0 > arg_312_1.duration_ then
						arg_312_1.duration_ = var_315_8 + var_315_0
					end

					if var_315_3.prefab_name ~= "" and arg_312_1.actors_[var_315_3.prefab_name] ~= nil then
						local var_315_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_312_1.actors_[var_315_3.prefab_name].transform, "story_v_out_319961", "319961076", "story_v_out_319961.awb")

						arg_312_1:RecordAudio("319961076", var_315_9)
						arg_312_1:RecordAudio("319961076", var_315_9)
					else
						arg_312_1:AudioAction("play", "voice", "story_v_out_319961", "319961076", "story_v_out_319961.awb")
					end

					arg_312_1:RecordHistoryTalkVoice("story_v_out_319961", "319961076", "story_v_out_319961.awb")
				end

				arg_312_1:RecordContent(arg_312_1.text_.text)
			end

			local var_315_10 = math.max(var_315_1, arg_312_1.talkMaxDuration)

			if var_315_0 <= arg_312_1.time_ and arg_312_1.time_ < var_315_0 + var_315_10 then
				arg_312_1.typewritter.percent = (arg_312_1.time_ - var_315_0) / var_315_10

				arg_312_1.typewritter:SetDirty()
			end

			if arg_312_1.time_ >= var_315_0 + var_315_10 and arg_312_1.time_ < var_315_0 + var_315_10 + arg_315_0 then
				arg_312_1.typewritter.percent = 1

				arg_312_1.typewritter:SetDirty()
				arg_312_1:ShowNextGo(true)
			end
		end
	end,
	Play319961077 = function(arg_316_0, arg_316_1)
		arg_316_1.time_ = 0
		arg_316_1.frameCnt_ = 0
		arg_316_1.state_ = "playing"
		arg_316_1.curTalkId_ = 319961077
		arg_316_1.duration_ = 1

		SetActive(arg_316_1.tipsGo_, false)

		function arg_316_1.onSingleLineFinish_()
			arg_316_1.onSingleLineUpdate_ = nil
			arg_316_1.onSingleLineFinish_ = nil
			arg_316_1.state_ = "waiting"

			SetActive(arg_316_1.choicesGo_, true)

			for iter_317_0, iter_317_1 in ipairs(arg_316_1.choices_) do
				local var_317_0 = iter_317_0 <= 1

				SetActive(iter_317_1.go, var_317_0)
			end

			arg_316_1.choices_[1].txt.text = arg_316_1:FormatText(StoryChoiceCfg[804].name)
		end

		function arg_316_1.playNext_(arg_318_0)
			if arg_318_0 == 1 then
				arg_316_0:Play319961078(arg_316_1)
			end
		end

		function arg_316_1.onSingleLineUpdate_(arg_319_0)
			local var_319_0 = 0

			if var_319_0 < arg_316_1.time_ and arg_316_1.time_ <= var_319_0 + arg_319_0 then
				arg_316_1.allBtn_.enabled = false
			end

			local var_319_1 = 0.6

			if arg_316_1.time_ >= var_319_0 + var_319_1 and arg_316_1.time_ < var_319_0 + var_319_1 + arg_319_0 then
				arg_316_1.allBtn_.enabled = true
			end

			local var_319_2 = arg_316_1.actors_["1284ui_story"]
			local var_319_3 = 0

			if var_319_3 < arg_316_1.time_ and arg_316_1.time_ <= var_319_3 + arg_319_0 and arg_316_1.var_.characterEffect1284ui_story == nil then
				arg_316_1.var_.characterEffect1284ui_story = var_319_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_319_4 = 0.2

			if var_319_3 <= arg_316_1.time_ and arg_316_1.time_ < var_319_3 + var_319_4 then
				local var_319_5 = (arg_316_1.time_ - var_319_3) / var_319_4

				if arg_316_1.var_.characterEffect1284ui_story then
					local var_319_6 = Mathf.Lerp(0, 0.5, var_319_5)

					arg_316_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_316_1.var_.characterEffect1284ui_story.fillRatio = var_319_6
				end
			end

			if arg_316_1.time_ >= var_319_3 + var_319_4 and arg_316_1.time_ < var_319_3 + var_319_4 + arg_319_0 and arg_316_1.var_.characterEffect1284ui_story then
				local var_319_7 = 0.5

				arg_316_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_316_1.var_.characterEffect1284ui_story.fillRatio = var_319_7
			end
		end
	end,
	Play319961078 = function(arg_320_0, arg_320_1)
		arg_320_1.time_ = 0
		arg_320_1.frameCnt_ = 0
		arg_320_1.state_ = "playing"
		arg_320_1.curTalkId_ = 319961078
		arg_320_1.duration_ = 3.47

		local var_320_0 = {
			zh = 3.466,
			ja = 3.333
		}
		local var_320_1 = manager.audio:GetLocalizationFlag()

		if var_320_0[var_320_1] ~= nil then
			arg_320_1.duration_ = var_320_0[var_320_1]
		end

		SetActive(arg_320_1.tipsGo_, false)

		function arg_320_1.onSingleLineFinish_()
			arg_320_1.onSingleLineUpdate_ = nil
			arg_320_1.onSingleLineFinish_ = nil
			arg_320_1.state_ = "waiting"
		end

		function arg_320_1.playNext_(arg_322_0)
			if arg_322_0 == 1 then
				arg_320_0:Play319961079(arg_320_1)
			end
		end

		function arg_320_1.onSingleLineUpdate_(arg_323_0)
			local var_323_0 = 0

			if var_323_0 < arg_320_1.time_ and arg_320_1.time_ <= var_323_0 + arg_323_0 then
				arg_320_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/story1284/story1284action/1284action9_2")
			end

			local var_323_1 = 0

			if var_323_1 < arg_320_1.time_ and arg_320_1.time_ <= var_323_1 + arg_323_0 then
				arg_320_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_323_2 = arg_320_1.actors_["1284ui_story"]
			local var_323_3 = 0

			if var_323_3 < arg_320_1.time_ and arg_320_1.time_ <= var_323_3 + arg_323_0 and arg_320_1.var_.characterEffect1284ui_story == nil then
				arg_320_1.var_.characterEffect1284ui_story = var_323_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_323_4 = 0.2

			if var_323_3 <= arg_320_1.time_ and arg_320_1.time_ < var_323_3 + var_323_4 then
				local var_323_5 = (arg_320_1.time_ - var_323_3) / var_323_4

				if arg_320_1.var_.characterEffect1284ui_story then
					arg_320_1.var_.characterEffect1284ui_story.fillFlat = false
				end
			end

			if arg_320_1.time_ >= var_323_3 + var_323_4 and arg_320_1.time_ < var_323_3 + var_323_4 + arg_323_0 and arg_320_1.var_.characterEffect1284ui_story then
				arg_320_1.var_.characterEffect1284ui_story.fillFlat = false
			end

			local var_323_6 = 0
			local var_323_7 = 0.4

			if var_323_6 < arg_320_1.time_ and arg_320_1.time_ <= var_323_6 + arg_323_0 then
				arg_320_1.talkMaxDuration = 0
				arg_320_1.dialogCg_.alpha = 1

				arg_320_1.dialog_:SetActive(true)
				SetActive(arg_320_1.leftNameGo_, true)

				local var_323_8 = arg_320_1:FormatText(StoryNameCfg[6].name)

				arg_320_1.leftNameTxt_.text = var_323_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_320_1.leftNameTxt_.transform)

				arg_320_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_320_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_320_1:RecordName(arg_320_1.leftNameTxt_.text)
				SetActive(arg_320_1.iconTrs_.gameObject, false)
				arg_320_1.callingController_:SetSelectedState("normal")

				local var_323_9 = arg_320_1:GetWordFromCfg(319961078)
				local var_323_10 = arg_320_1:FormatText(var_323_9.content)

				arg_320_1.text_.text = var_323_10

				LuaForUtil.ClearLinePrefixSymbol(arg_320_1.text_)

				local var_323_11 = 16
				local var_323_12 = utf8.len(var_323_10)
				local var_323_13 = var_323_11 <= 0 and var_323_7 or var_323_7 * (var_323_12 / var_323_11)

				if var_323_13 > 0 and var_323_7 < var_323_13 then
					arg_320_1.talkMaxDuration = var_323_13

					if var_323_13 + var_323_6 > arg_320_1.duration_ then
						arg_320_1.duration_ = var_323_13 + var_323_6
					end
				end

				arg_320_1.text_.text = var_323_10
				arg_320_1.typewritter.percent = 0

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319961", "319961078", "story_v_out_319961.awb") ~= 0 then
					local var_323_14 = manager.audio:GetVoiceLength("story_v_out_319961", "319961078", "story_v_out_319961.awb") / 1000

					if var_323_14 + var_323_6 > arg_320_1.duration_ then
						arg_320_1.duration_ = var_323_14 + var_323_6
					end

					if var_323_9.prefab_name ~= "" and arg_320_1.actors_[var_323_9.prefab_name] ~= nil then
						local var_323_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_320_1.actors_[var_323_9.prefab_name].transform, "story_v_out_319961", "319961078", "story_v_out_319961.awb")

						arg_320_1:RecordAudio("319961078", var_323_15)
						arg_320_1:RecordAudio("319961078", var_323_15)
					else
						arg_320_1:AudioAction("play", "voice", "story_v_out_319961", "319961078", "story_v_out_319961.awb")
					end

					arg_320_1:RecordHistoryTalkVoice("story_v_out_319961", "319961078", "story_v_out_319961.awb")
				end

				arg_320_1:RecordContent(arg_320_1.text_.text)
			end

			local var_323_16 = math.max(var_323_7, arg_320_1.talkMaxDuration)

			if var_323_6 <= arg_320_1.time_ and arg_320_1.time_ < var_323_6 + var_323_16 then
				arg_320_1.typewritter.percent = (arg_320_1.time_ - var_323_6) / var_323_16

				arg_320_1.typewritter:SetDirty()
			end

			if arg_320_1.time_ >= var_323_6 + var_323_16 and arg_320_1.time_ < var_323_6 + var_323_16 + arg_323_0 then
				arg_320_1.typewritter.percent = 1

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(true)
			end
		end
	end,
	Play319961079 = function(arg_324_0, arg_324_1)
		arg_324_1.time_ = 0
		arg_324_1.frameCnt_ = 0
		arg_324_1.state_ = "playing"
		arg_324_1.curTalkId_ = 319961079
		arg_324_1.duration_ = 1

		SetActive(arg_324_1.tipsGo_, false)

		function arg_324_1.onSingleLineFinish_()
			arg_324_1.onSingleLineUpdate_ = nil
			arg_324_1.onSingleLineFinish_ = nil
			arg_324_1.state_ = "waiting"

			SetActive(arg_324_1.choicesGo_, true)

			for iter_325_0, iter_325_1 in ipairs(arg_324_1.choices_) do
				local var_325_0 = iter_325_0 <= 1

				SetActive(iter_325_1.go, var_325_0)
			end

			arg_324_1.choices_[1].txt.text = arg_324_1:FormatText(StoryChoiceCfg[805].name)
		end

		function arg_324_1.playNext_(arg_326_0)
			if arg_326_0 == 1 then
				arg_324_0:Play319961080(arg_324_1)
			end
		end

		function arg_324_1.onSingleLineUpdate_(arg_327_0)
			local var_327_0 = 0

			if var_327_0 < arg_324_1.time_ and arg_324_1.time_ <= var_327_0 + arg_327_0 then
				arg_324_1.allBtn_.enabled = false
			end

			local var_327_1 = 0.6

			if arg_324_1.time_ >= var_327_0 + var_327_1 and arg_324_1.time_ < var_327_0 + var_327_1 + arg_327_0 then
				arg_324_1.allBtn_.enabled = true
			end

			local var_327_2 = arg_324_1.actors_["1284ui_story"]
			local var_327_3 = 0

			if var_327_3 < arg_324_1.time_ and arg_324_1.time_ <= var_327_3 + arg_327_0 and arg_324_1.var_.characterEffect1284ui_story == nil then
				arg_324_1.var_.characterEffect1284ui_story = var_327_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_327_4 = 0.2

			if var_327_3 <= arg_324_1.time_ and arg_324_1.time_ < var_327_3 + var_327_4 then
				local var_327_5 = (arg_324_1.time_ - var_327_3) / var_327_4

				if arg_324_1.var_.characterEffect1284ui_story then
					local var_327_6 = Mathf.Lerp(0, 0.5, var_327_5)

					arg_324_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_324_1.var_.characterEffect1284ui_story.fillRatio = var_327_6
				end
			end

			if arg_324_1.time_ >= var_327_3 + var_327_4 and arg_324_1.time_ < var_327_3 + var_327_4 + arg_327_0 and arg_324_1.var_.characterEffect1284ui_story then
				local var_327_7 = 0.5

				arg_324_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_324_1.var_.characterEffect1284ui_story.fillRatio = var_327_7
			end
		end
	end,
	Play319961080 = function(arg_328_0, arg_328_1)
		arg_328_1.time_ = 0
		arg_328_1.frameCnt_ = 0
		arg_328_1.state_ = "playing"
		arg_328_1.curTalkId_ = 319961080
		arg_328_1.duration_ = 1

		SetActive(arg_328_1.tipsGo_, false)

		function arg_328_1.onSingleLineFinish_()
			arg_328_1.onSingleLineUpdate_ = nil
			arg_328_1.onSingleLineFinish_ = nil
			arg_328_1.state_ = "waiting"

			SetActive(arg_328_1.choicesGo_, true)

			for iter_329_0, iter_329_1 in ipairs(arg_328_1.choices_) do
				local var_329_0 = iter_329_0 <= 1

				SetActive(iter_329_1.go, var_329_0)
			end

			arg_328_1.choices_[1].txt.text = arg_328_1:FormatText(StoryChoiceCfg[806].name)
		end

		function arg_328_1.playNext_(arg_330_0)
			if arg_330_0 == 1 then
				arg_328_0:Play319961081(arg_328_1)
			end
		end

		function arg_328_1.onSingleLineUpdate_(arg_331_0)
			local var_331_0 = 0

			if var_331_0 < arg_328_1.time_ and arg_328_1.time_ <= var_331_0 + arg_331_0 then
				arg_328_1.allBtn_.enabled = false
			end

			local var_331_1 = 0.6

			if arg_328_1.time_ >= var_331_0 + var_331_1 and arg_328_1.time_ < var_331_0 + var_331_1 + arg_331_0 then
				arg_328_1.allBtn_.enabled = true
			end
		end
	end,
	Play319961081 = function(arg_332_0, arg_332_1)
		arg_332_1.time_ = 0
		arg_332_1.frameCnt_ = 0
		arg_332_1.state_ = "playing"
		arg_332_1.curTalkId_ = 319961081
		arg_332_1.duration_ = 5

		SetActive(arg_332_1.tipsGo_, false)

		function arg_332_1.onSingleLineFinish_()
			arg_332_1.onSingleLineUpdate_ = nil
			arg_332_1.onSingleLineFinish_ = nil
			arg_332_1.state_ = "waiting"
		end

		function arg_332_1.playNext_(arg_334_0)
			if arg_334_0 == 1 then
				arg_332_0:Play319961082(arg_332_1)
			end
		end

		function arg_332_1.onSingleLineUpdate_(arg_335_0)
			local var_335_0 = 0

			if var_335_0 < arg_332_1.time_ and arg_332_1.time_ <= var_335_0 + arg_335_0 then
				arg_332_1:PlayTimeline("1284ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_335_1 = 0
			local var_335_2 = 0.625

			if var_335_1 < arg_332_1.time_ and arg_332_1.time_ <= var_335_1 + arg_335_0 then
				arg_332_1.talkMaxDuration = 0
				arg_332_1.dialogCg_.alpha = 1

				arg_332_1.dialog_:SetActive(true)
				SetActive(arg_332_1.leftNameGo_, false)

				arg_332_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_332_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_332_1:RecordName(arg_332_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_332_1.iconTrs_.gameObject, false)
				arg_332_1.callingController_:SetSelectedState("normal")

				local var_335_3 = arg_332_1:GetWordFromCfg(319961081)
				local var_335_4 = arg_332_1:FormatText(var_335_3.content)

				arg_332_1.text_.text = var_335_4

				LuaForUtil.ClearLinePrefixSymbol(arg_332_1.text_)

				local var_335_5 = 25
				local var_335_6 = utf8.len(var_335_4)
				local var_335_7 = var_335_5 <= 0 and var_335_2 or var_335_2 * (var_335_6 / var_335_5)

				if var_335_7 > 0 and var_335_2 < var_335_7 then
					arg_332_1.talkMaxDuration = var_335_7

					if var_335_7 + var_335_1 > arg_332_1.duration_ then
						arg_332_1.duration_ = var_335_7 + var_335_1
					end
				end

				arg_332_1.text_.text = var_335_4
				arg_332_1.typewritter.percent = 0

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(false)
				arg_332_1:RecordContent(arg_332_1.text_.text)
			end

			local var_335_8 = math.max(var_335_2, arg_332_1.talkMaxDuration)

			if var_335_1 <= arg_332_1.time_ and arg_332_1.time_ < var_335_1 + var_335_8 then
				arg_332_1.typewritter.percent = (arg_332_1.time_ - var_335_1) / var_335_8

				arg_332_1.typewritter:SetDirty()
			end

			if arg_332_1.time_ >= var_335_1 + var_335_8 and arg_332_1.time_ < var_335_1 + var_335_8 + arg_335_0 then
				arg_332_1.typewritter.percent = 1

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(true)
			end
		end
	end,
	Play319961082 = function(arg_336_0, arg_336_1)
		arg_336_1.time_ = 0
		arg_336_1.frameCnt_ = 0
		arg_336_1.state_ = "playing"
		arg_336_1.curTalkId_ = 319961082
		arg_336_1.duration_ = 2.03

		SetActive(arg_336_1.tipsGo_, false)

		function arg_336_1.onSingleLineFinish_()
			arg_336_1.onSingleLineUpdate_ = nil
			arg_336_1.onSingleLineFinish_ = nil
			arg_336_1.state_ = "waiting"
			arg_336_1.auto_ = false
		end

		function arg_336_1.playNext_(arg_338_0)
			arg_336_1.onStoryFinished_()
		end

		function arg_336_1.onSingleLineUpdate_(arg_339_0)
			local var_339_0 = arg_336_1.actors_["1284ui_story"]
			local var_339_1 = 0

			if var_339_1 < arg_336_1.time_ and arg_336_1.time_ <= var_339_1 + arg_339_0 and arg_336_1.var_.characterEffect1284ui_story == nil then
				arg_336_1.var_.characterEffect1284ui_story = var_339_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_339_2 = 0.2

			if var_339_1 <= arg_336_1.time_ and arg_336_1.time_ < var_339_1 + var_339_2 then
				local var_339_3 = (arg_336_1.time_ - var_339_1) / var_339_2

				if arg_336_1.var_.characterEffect1284ui_story then
					local var_339_4 = Mathf.Lerp(0, 0.5, var_339_3)

					arg_336_1.var_.characterEffect1284ui_story.fillFlat = true
					arg_336_1.var_.characterEffect1284ui_story.fillRatio = var_339_4
				end
			end

			if arg_336_1.time_ >= var_339_1 + var_339_2 and arg_336_1.time_ < var_339_1 + var_339_2 + arg_339_0 and arg_336_1.var_.characterEffect1284ui_story then
				local var_339_5 = 0.5

				arg_336_1.var_.characterEffect1284ui_story.fillFlat = true
				arg_336_1.var_.characterEffect1284ui_story.fillRatio = var_339_5
			end

			local var_339_6 = 0

			if var_339_6 < arg_336_1.time_ and arg_336_1.time_ <= var_339_6 + arg_339_0 then
				arg_336_1.fswbg_:SetActive(true)
				arg_336_1.dialog_:SetActive(false)

				arg_336_1.fswtw_.percent = 0

				local var_339_7 = arg_336_1:GetWordFromCfg(319961082)
				local var_339_8 = arg_336_1:FormatText(var_339_7.content)

				arg_336_1.fswt_.text = var_339_8

				LuaForUtil.ClearLinePrefixSymbol(arg_336_1.fswt_)

				arg_336_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_336_1.fswtw_:SetDirty()

				arg_336_1.typewritterCharCountI18N = 0

				SetActive(arg_336_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_336_1:ShowNextGo(false)
			end

			local var_339_9 = 0.0166666666666667

			if var_339_9 < arg_336_1.time_ and arg_336_1.time_ <= var_339_9 + arg_339_0 then
				arg_336_1.var_.oldValueTypewriter = arg_336_1.fswtw_.percent

				arg_336_1:ShowNextGo(false)
			end

			local var_339_10 = 2
			local var_339_11 = 0.215999998152256
			local var_339_12 = arg_336_1:GetWordFromCfg(319961082)
			local var_339_13 = arg_336_1:FormatText(var_339_12.content)
			local var_339_14, var_339_15 = arg_336_1:GetPercentByPara(var_339_13, 1)

			if var_339_9 < arg_336_1.time_ and arg_336_1.time_ <= var_339_9 + arg_339_0 then
				arg_336_1.talkMaxDuration = 0

				local var_339_16 = var_339_10 <= 0 and var_339_11 or var_339_11 * ((var_339_15 - arg_336_1.typewritterCharCountI18N) / var_339_10)

				if var_339_16 > 0 and var_339_11 < var_339_16 then
					arg_336_1.talkMaxDuration = var_339_16

					if var_339_16 + var_339_9 > arg_336_1.duration_ then
						arg_336_1.duration_ = var_339_16 + var_339_9
					end
				end
			end

			local var_339_17 = 0.215999998152256
			local var_339_18 = math.max(var_339_17, arg_336_1.talkMaxDuration)

			if var_339_9 <= arg_336_1.time_ and arg_336_1.time_ < var_339_9 + var_339_18 then
				local var_339_19 = (arg_336_1.time_ - var_339_9) / var_339_18

				arg_336_1.fswtw_.percent = Mathf.Lerp(arg_336_1.var_.oldValueTypewriter, var_339_14, var_339_19)
				arg_336_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_336_1.fswtw_:SetDirty()
			end

			if arg_336_1.time_ >= var_339_9 + var_339_18 and arg_336_1.time_ < var_339_9 + var_339_18 + arg_339_0 then
				arg_336_1.fswtw_.percent = var_339_14

				arg_336_1.fswtw_:SetDirty()
				arg_336_1:ShowNextGo(true)

				arg_336_1.typewritterCharCountI18N = var_339_15
			end

			local var_339_20 = 0

			if var_339_20 < arg_336_1.time_ and arg_336_1.time_ <= var_339_20 + arg_339_0 then
				local var_339_21 = arg_336_1.fswbg_.transform:Find("textbox/adapt/content") or arg_336_1.fswbg_.transform:Find("textbox/content")
				local var_339_22 = var_339_21:GetComponent("Text")
				local var_339_23 = var_339_21:GetComponent("RectTransform")

				var_339_22.alignment = UnityEngine.TextAnchor.LowerCenter
				var_339_23.offsetMin = Vector2.New(0, 0)
				var_339_23.offsetMax = Vector2.New(0, 0)
			end

			local var_339_24 = arg_336_1.actors_["1284ui_story"].transform
			local var_339_25 = 0

			if var_339_25 < arg_336_1.time_ and arg_336_1.time_ <= var_339_25 + arg_339_0 then
				arg_336_1.var_.moveOldPos1284ui_story = var_339_24.localPosition
			end

			local var_339_26 = 0.001

			if var_339_25 <= arg_336_1.time_ and arg_336_1.time_ < var_339_25 + var_339_26 then
				local var_339_27 = (arg_336_1.time_ - var_339_25) / var_339_26
				local var_339_28 = Vector3.New(0, 100, 0)

				var_339_24.localPosition = Vector3.Lerp(arg_336_1.var_.moveOldPos1284ui_story, var_339_28, var_339_27)

				local var_339_29 = manager.ui.mainCamera.transform.position - var_339_24.position

				var_339_24.forward = Vector3.New(var_339_29.x, var_339_29.y, var_339_29.z)

				local var_339_30 = var_339_24.localEulerAngles

				var_339_30.z = 0
				var_339_30.x = 0
				var_339_24.localEulerAngles = var_339_30
			end

			if arg_336_1.time_ >= var_339_25 + var_339_26 and arg_336_1.time_ < var_339_25 + var_339_26 + arg_339_0 then
				var_339_24.localPosition = Vector3.New(0, 100, 0)

				local var_339_31 = manager.ui.mainCamera.transform.position - var_339_24.position

				var_339_24.forward = Vector3.New(var_339_31.x, var_339_31.y, var_339_31.z)

				local var_339_32 = var_339_24.localEulerAngles

				var_339_32.z = 0
				var_339_32.x = 0
				var_339_24.localEulerAngles = var_339_32
			end

			local var_339_33 = 0
			local var_339_34 = 2.033
			local var_339_35 = manager.audio:GetVoiceLength("story_v_out_319961", "319961082", "story_v_out_319961.awb") / 1000

			if var_339_35 > 0 and var_339_34 < var_339_35 and var_339_35 + var_339_33 > arg_336_1.duration_ then
				local var_339_36 = var_339_35

				arg_336_1.duration_ = var_339_35 + var_339_33
			end

			if var_339_33 < arg_336_1.time_ and arg_336_1.time_ <= var_339_33 + arg_339_0 then
				local var_339_37 = "play"
				local var_339_38 = "voice"

				arg_336_1:AudioAction(var_339_37, var_339_38, "story_v_out_319961", "319961082", "story_v_out_319961.awb")
			end

			local var_339_39 = 0

			if var_339_39 < arg_336_1.time_ and arg_336_1.time_ <= var_339_39 + arg_339_0 then
				local var_339_40 = manager.ui.mainCamera.transform.localPosition
				local var_339_41 = Vector3.New(0, 0, 10) + Vector3.New(var_339_40.x, var_339_40.y, 0)
				local var_339_42 = arg_336_1.bgs_.STblack

				var_339_42.transform.localPosition = var_339_41
				var_339_42.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_339_43 = var_339_42:GetComponent("SpriteRenderer")

				if var_339_43 and var_339_43.sprite then
					local var_339_44 = (var_339_42.transform.localPosition - var_339_40).z
					local var_339_45 = manager.ui.mainCameraCom_
					local var_339_46 = 2 * var_339_44 * Mathf.Tan(var_339_45.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_339_47 = var_339_46 * var_339_45.aspect
					local var_339_48 = var_339_43.sprite.bounds.size.x
					local var_339_49 = var_339_43.sprite.bounds.size.y
					local var_339_50 = var_339_47 / var_339_48
					local var_339_51 = var_339_46 / var_339_49
					local var_339_52 = var_339_51 < var_339_50 and var_339_50 or var_339_51

					var_339_42.transform.localScale = Vector3.New(var_339_52, var_339_52, 0)
				end

				for iter_339_0, iter_339_1 in pairs(arg_336_1.bgs_) do
					if iter_339_0 ~= "STblack" then
						iter_339_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_339_53 = 0

			if var_339_53 < arg_336_1.time_ and arg_336_1.time_ <= var_339_53 + arg_339_0 then
				arg_336_1.cswbg_:SetActive(true)

				local var_339_54 = arg_336_1.cswt_:GetComponent("RectTransform")

				arg_336_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_339_54.offsetMin = Vector2.New(0, 100)
				var_339_54.offsetMax = Vector2.New(0, 0)

				local var_339_55 = arg_336_1:GetWordFromCfg(419088)
				local var_339_56 = arg_336_1:FormatText(var_339_55.content)

				arg_336_1.cswt_.text = var_339_56

				LuaForUtil.ClearLinePrefixSymbol(arg_336_1.cswt_)

				arg_336_1.cswt_.fontSize = 100
				arg_336_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_336_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I07"
	},
	voices = {
		"story_v_out_319961.awb"
	}
}
