﻿return {
	Play112012001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 112012001
		arg_1_1.duration_ = 5.27

		local var_1_0 = {
			ja = 5.2,
			ko = 5.266,
			zh = 3.799999999999,
			en = 4.6
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
				arg_1_0:Play112012002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "H02"

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
				local var_4_5 = arg_1_1.bgs_.H02

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
					if iter_4_0 ~= "H02" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.H02
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueH02 = var_4_20.a
					arg_1_1.var_.alphaMatValueH02 = var_4_19
				end

				arg_1_1.var_.alphaOldValueH02 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueH02, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueH02 then
					local var_4_24 = arg_1_1.var_.alphaMatValueH02
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueH02 then
				local var_4_26 = arg_1_1.var_.alphaMatValueH02
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = "1084ui_story"

			if arg_1_1.actors_[var_4_28] == nil then
				local var_4_29 = Object.Instantiate(Asset.Load("Char/" .. var_4_28), arg_1_1.stage_.transform)

				var_4_29.name = var_4_28
				var_4_29.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_28] = var_4_29

				local var_4_30 = var_4_29:GetComponentInChildren(typeof(CharacterEffect))

				var_4_30.enabled = true

				local var_4_31 = GameObjectTools.GetOrAddComponent(var_4_29, typeof(DynamicBoneHelper))

				if var_4_31 then
					var_4_31:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_30.transform, false)

				arg_1_1.var_[var_4_28 .. "Animator"] = var_4_30.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_28 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_28 .. "LipSync"] = var_4_30.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_32 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_33 = 1.8

			if var_4_33 < arg_1_1.time_ and arg_1_1.time_ <= var_4_33 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_32.localPosition
			end

			local var_4_34 = 0.001

			if var_4_33 <= arg_1_1.time_ and arg_1_1.time_ < var_4_33 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_33) / var_4_34
				local var_4_36 = Vector3.New(0, -0.97, -6)

				var_4_32.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_36, var_4_35)

				local var_4_37 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_37.x, var_4_37.y, var_4_37.z)

				local var_4_38 = var_4_32.localEulerAngles

				var_4_38.z = 0
				var_4_38.x = 0
				var_4_32.localEulerAngles = var_4_38
			end

			if arg_1_1.time_ >= var_4_33 + var_4_34 and arg_1_1.time_ < var_4_33 + var_4_34 + arg_4_0 then
				var_4_32.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_39 = manager.ui.mainCamera.transform.position - var_4_32.position

				var_4_32.forward = Vector3.New(var_4_39.x, var_4_39.y, var_4_39.z)

				local var_4_40 = var_4_32.localEulerAngles

				var_4_40.z = 0
				var_4_40.x = 0
				var_4_32.localEulerAngles = var_4_40
			end

			local var_4_41 = 1.8

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_4_42 = 1.8

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_4_43 = arg_1_1.actors_["1084ui_story"]
			local var_4_44 = 1.8

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_45 = 0.2

			if var_4_44 <= arg_1_1.time_ and arg_1_1.time_ < var_4_44 + var_4_45 then
				local var_4_46 = (arg_1_1.time_ - var_4_44) / var_4_45

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_47 = 0

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_48 = 2

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_49 = 2
			local var_4_50 = 1

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense.awb")

				local var_4_53 = ""
				local var_4_54 = manager.audio:GetAudioName("bgm_activity_1_2_summer1_story_intense", "bgm_activity_1_2_summer1_story_intense")

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
			local var_4_56 = 0.15

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_57 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_57:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_58 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_59 = arg_1_1:GetWordFromCfg(112012001)
				local var_4_60 = arg_1_1:FormatText(var_4_59.content)

				arg_1_1.text_.text = var_4_60

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_61 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012001", "story_v_out_112012.awb") ~= 0 then
					local var_4_64 = manager.audio:GetVoiceLength("story_v_out_112012", "112012001", "story_v_out_112012.awb") / 1000

					if var_4_64 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_55
					end

					if var_4_59.prefab_name ~= "" and arg_1_1.actors_[var_4_59.prefab_name] ~= nil then
						local var_4_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_59.prefab_name].transform, "story_v_out_112012", "112012001", "story_v_out_112012.awb")

						arg_1_1:RecordAudio("112012001", var_4_65)
						arg_1_1:RecordAudio("112012001", var_4_65)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_112012", "112012001", "story_v_out_112012.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_112012", "112012001", "story_v_out_112012.awb")
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
	Play112012002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 112012002
		arg_8_1.duration_ = 7.7

		local var_8_0 = {
			ja = 7.7,
			ko = 7.566,
			zh = 4.9,
			en = 6.8
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
				arg_8_0:Play112012003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = "1027ui_story"

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

			local var_11_4 = arg_8_1.actors_["1027ui_story"].transform
			local var_11_5 = 0

			if var_11_5 < arg_8_1.time_ and arg_8_1.time_ <= var_11_5 + arg_11_0 then
				arg_8_1.var_.moveOldPos1027ui_story = var_11_4.localPosition
			end

			local var_11_6 = 0.001

			if var_11_5 <= arg_8_1.time_ and arg_8_1.time_ < var_11_5 + var_11_6 then
				local var_11_7 = (arg_8_1.time_ - var_11_5) / var_11_6
				local var_11_8 = Vector3.New(-0.7, -0.81, -5.8)

				var_11_4.localPosition = Vector3.Lerp(arg_8_1.var_.moveOldPos1027ui_story, var_11_8, var_11_7)

				local var_11_9 = manager.ui.mainCamera.transform.position - var_11_4.position

				var_11_4.forward = Vector3.New(var_11_9.x, var_11_9.y, var_11_9.z)

				local var_11_10 = var_11_4.localEulerAngles

				var_11_10.z = 0
				var_11_10.x = 0
				var_11_4.localEulerAngles = var_11_10
			end

			if arg_8_1.time_ >= var_11_5 + var_11_6 and arg_8_1.time_ < var_11_5 + var_11_6 + arg_11_0 then
				var_11_4.localPosition = Vector3.New(-0.7, -0.81, -5.8)

				local var_11_11 = manager.ui.mainCamera.transform.position - var_11_4.position

				var_11_4.forward = Vector3.New(var_11_11.x, var_11_11.y, var_11_11.z)

				local var_11_12 = var_11_4.localEulerAngles

				var_11_12.z = 0
				var_11_12.x = 0
				var_11_4.localEulerAngles = var_11_12
			end

			local var_11_13 = 0

			if var_11_13 < arg_8_1.time_ and arg_8_1.time_ <= var_11_13 + arg_11_0 then
				arg_8_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1027/1027action/1027action2_1")
			end

			local var_11_14 = 0

			if var_11_14 < arg_8_1.time_ and arg_8_1.time_ <= var_11_14 + arg_11_0 then
				arg_8_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_11_15 = arg_8_1.actors_["1027ui_story"]
			local var_11_16 = 0

			if var_11_16 < arg_8_1.time_ and arg_8_1.time_ <= var_11_16 + arg_11_0 and arg_8_1.var_.characterEffect1027ui_story == nil then
				arg_8_1.var_.characterEffect1027ui_story = var_11_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_11_17 = 0.2

			if var_11_16 <= arg_8_1.time_ and arg_8_1.time_ < var_11_16 + var_11_17 then
				local var_11_18 = (arg_8_1.time_ - var_11_16) / var_11_17

				if arg_8_1.var_.characterEffect1027ui_story then
					arg_8_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_8_1.time_ >= var_11_16 + var_11_17 and arg_8_1.time_ < var_11_16 + var_11_17 + arg_11_0 and arg_8_1.var_.characterEffect1027ui_story then
				arg_8_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_11_19 = arg_8_1.actors_["1084ui_story"].transform
			local var_11_20 = 0

			if var_11_20 < arg_8_1.time_ and arg_8_1.time_ <= var_11_20 + arg_11_0 then
				arg_8_1.var_.moveOldPos1084ui_story = var_11_19.localPosition
			end

			local var_11_21 = 0.001

			if var_11_20 <= arg_8_1.time_ and arg_8_1.time_ < var_11_20 + var_11_21 then
				local var_11_22 = (arg_8_1.time_ - var_11_20) / var_11_21
				local var_11_23 = Vector3.New(0, 100, 0)

				var_11_19.localPosition = Vector3.Lerp(arg_8_1.var_.moveOldPos1084ui_story, var_11_23, var_11_22)

				local var_11_24 = manager.ui.mainCamera.transform.position - var_11_19.position

				var_11_19.forward = Vector3.New(var_11_24.x, var_11_24.y, var_11_24.z)

				local var_11_25 = var_11_19.localEulerAngles

				var_11_25.z = 0
				var_11_25.x = 0
				var_11_19.localEulerAngles = var_11_25
			end

			if arg_8_1.time_ >= var_11_20 + var_11_21 and arg_8_1.time_ < var_11_20 + var_11_21 + arg_11_0 then
				var_11_19.localPosition = Vector3.New(0, 100, 0)

				local var_11_26 = manager.ui.mainCamera.transform.position - var_11_19.position

				var_11_19.forward = Vector3.New(var_11_26.x, var_11_26.y, var_11_26.z)

				local var_11_27 = var_11_19.localEulerAngles

				var_11_27.z = 0
				var_11_27.x = 0
				var_11_19.localEulerAngles = var_11_27
			end

			local var_11_28 = 0
			local var_11_29 = 1

			if var_11_28 < arg_8_1.time_ and arg_8_1.time_ <= var_11_28 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_30 = arg_8_1:FormatText(StoryNameCfg[56].name)

				arg_8_1.leftNameTxt_.text = var_11_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_31 = arg_8_1:GetWordFromCfg(112012002)
				local var_11_32 = arg_8_1:FormatText(var_11_31.content)

				arg_8_1.text_.text = var_11_32

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_33 = 25
				local var_11_34 = utf8.len(var_11_32)
				local var_11_35 = var_11_33 <= 0 and var_11_29 or var_11_29 * (var_11_34 / var_11_33)

				if var_11_35 > 0 and var_11_29 < var_11_35 then
					arg_8_1.talkMaxDuration = var_11_35

					if var_11_35 + var_11_28 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_35 + var_11_28
					end
				end

				arg_8_1.text_.text = var_11_32
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012002", "story_v_out_112012.awb") ~= 0 then
					local var_11_36 = manager.audio:GetVoiceLength("story_v_out_112012", "112012002", "story_v_out_112012.awb") / 1000

					if var_11_36 + var_11_28 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_36 + var_11_28
					end

					if var_11_31.prefab_name ~= "" and arg_8_1.actors_[var_11_31.prefab_name] ~= nil then
						local var_11_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_8_1.actors_[var_11_31.prefab_name].transform, "story_v_out_112012", "112012002", "story_v_out_112012.awb")

						arg_8_1:RecordAudio("112012002", var_11_37)
						arg_8_1:RecordAudio("112012002", var_11_37)
					else
						arg_8_1:AudioAction("play", "voice", "story_v_out_112012", "112012002", "story_v_out_112012.awb")
					end

					arg_8_1:RecordHistoryTalkVoice("story_v_out_112012", "112012002", "story_v_out_112012.awb")
				end

				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_38 = math.max(var_11_29, arg_8_1.talkMaxDuration)

			if var_11_28 <= arg_8_1.time_ and arg_8_1.time_ < var_11_28 + var_11_38 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_28) / var_11_38

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_28 + var_11_38 and arg_8_1.time_ < var_11_28 + var_11_38 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play112012003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 112012003
		arg_12_1.duration_ = 7.7

		local var_12_0 = {
			ja = 7.7,
			ko = 6.4,
			zh = 5.533,
			en = 7.5
		}
		local var_12_1 = manager.audio:GetLocalizationFlag()

		if var_12_0[var_12_1] ~= nil then
			arg_12_1.duration_ = var_12_0[var_12_1]
		end

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play112012004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = "1148ui_story"

			if arg_12_1.actors_[var_15_0] == nil then
				local var_15_1 = Object.Instantiate(Asset.Load("Char/" .. var_15_0), arg_12_1.stage_.transform)

				var_15_1.name = var_15_0
				var_15_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_12_1.actors_[var_15_0] = var_15_1

				local var_15_2 = var_15_1:GetComponentInChildren(typeof(CharacterEffect))

				var_15_2.enabled = true

				local var_15_3 = GameObjectTools.GetOrAddComponent(var_15_1, typeof(DynamicBoneHelper))

				if var_15_3 then
					var_15_3:EnableDynamicBone(false)
				end

				arg_12_1:ShowWeapon(var_15_2.transform, false)

				arg_12_1.var_[var_15_0 .. "Animator"] = var_15_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_12_1.var_[var_15_0 .. "Animator"].applyRootMotion = true
				arg_12_1.var_[var_15_0 .. "LipSync"] = var_15_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_15_4 = arg_12_1.actors_["1148ui_story"].transform
			local var_15_5 = 0

			if var_15_5 < arg_12_1.time_ and arg_12_1.time_ <= var_15_5 + arg_15_0 then
				arg_12_1.var_.moveOldPos1148ui_story = var_15_4.localPosition
			end

			local var_15_6 = 0.001

			if var_15_5 <= arg_12_1.time_ and arg_12_1.time_ < var_15_5 + var_15_6 then
				local var_15_7 = (arg_12_1.time_ - var_15_5) / var_15_6
				local var_15_8 = Vector3.New(0.7, -0.8, -6.2)

				var_15_4.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1148ui_story, var_15_8, var_15_7)

				local var_15_9 = manager.ui.mainCamera.transform.position - var_15_4.position

				var_15_4.forward = Vector3.New(var_15_9.x, var_15_9.y, var_15_9.z)

				local var_15_10 = var_15_4.localEulerAngles

				var_15_10.z = 0
				var_15_10.x = 0
				var_15_4.localEulerAngles = var_15_10
			end

			if arg_12_1.time_ >= var_15_5 + var_15_6 and arg_12_1.time_ < var_15_5 + var_15_6 + arg_15_0 then
				var_15_4.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_15_11 = manager.ui.mainCamera.transform.position - var_15_4.position

				var_15_4.forward = Vector3.New(var_15_11.x, var_15_11.y, var_15_11.z)

				local var_15_12 = var_15_4.localEulerAngles

				var_15_12.z = 0
				var_15_12.x = 0
				var_15_4.localEulerAngles = var_15_12
			end

			local var_15_13 = 0

			if var_15_13 < arg_12_1.time_ and arg_12_1.time_ <= var_15_13 + arg_15_0 then
				arg_12_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/1148/1148action/1148action9_1")
			end

			local var_15_14 = 0

			if var_15_14 < arg_12_1.time_ and arg_12_1.time_ <= var_15_14 + arg_15_0 then
				arg_12_1:PlayTimeline("1148ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_15_15 = arg_12_1.actors_["1148ui_story"]
			local var_15_16 = 0

			if var_15_16 < arg_12_1.time_ and arg_12_1.time_ <= var_15_16 + arg_15_0 and arg_12_1.var_.characterEffect1148ui_story == nil then
				arg_12_1.var_.characterEffect1148ui_story = var_15_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_17 = 0.2

			if var_15_16 <= arg_12_1.time_ and arg_12_1.time_ < var_15_16 + var_15_17 then
				local var_15_18 = (arg_12_1.time_ - var_15_16) / var_15_17

				if arg_12_1.var_.characterEffect1148ui_story then
					arg_12_1.var_.characterEffect1148ui_story.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_16 + var_15_17 and arg_12_1.time_ < var_15_16 + var_15_17 + arg_15_0 and arg_12_1.var_.characterEffect1148ui_story then
				arg_12_1.var_.characterEffect1148ui_story.fillFlat = false
			end

			local var_15_19 = arg_12_1.actors_["1027ui_story"]
			local var_15_20 = 0

			if var_15_20 < arg_12_1.time_ and arg_12_1.time_ <= var_15_20 + arg_15_0 and arg_12_1.var_.characterEffect1027ui_story == nil then
				arg_12_1.var_.characterEffect1027ui_story = var_15_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_21 = 0.2

			if var_15_20 <= arg_12_1.time_ and arg_12_1.time_ < var_15_20 + var_15_21 then
				local var_15_22 = (arg_12_1.time_ - var_15_20) / var_15_21

				if arg_12_1.var_.characterEffect1027ui_story then
					local var_15_23 = Mathf.Lerp(0, 0.5, var_15_22)

					arg_12_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_12_1.var_.characterEffect1027ui_story.fillRatio = var_15_23
				end
			end

			if arg_12_1.time_ >= var_15_20 + var_15_21 and arg_12_1.time_ < var_15_20 + var_15_21 + arg_15_0 and arg_12_1.var_.characterEffect1027ui_story then
				local var_15_24 = 0.5

				arg_12_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_12_1.var_.characterEffect1027ui_story.fillRatio = var_15_24
			end

			local var_15_25 = 0
			local var_15_26 = 1

			if var_15_25 < arg_12_1.time_ and arg_12_1.time_ <= var_15_25 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_27 = arg_12_1:FormatText(StoryNameCfg[8].name)

				arg_12_1.leftNameTxt_.text = var_15_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_28 = arg_12_1:GetWordFromCfg(112012003)
				local var_15_29 = arg_12_1:FormatText(var_15_28.content)

				arg_12_1.text_.text = var_15_29

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_30 = 25
				local var_15_31 = utf8.len(var_15_29)
				local var_15_32 = var_15_30 <= 0 and var_15_26 or var_15_26 * (var_15_31 / var_15_30)

				if var_15_32 > 0 and var_15_26 < var_15_32 then
					arg_12_1.talkMaxDuration = var_15_32

					if var_15_32 + var_15_25 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_32 + var_15_25
					end
				end

				arg_12_1.text_.text = var_15_29
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012003", "story_v_out_112012.awb") ~= 0 then
					local var_15_33 = manager.audio:GetVoiceLength("story_v_out_112012", "112012003", "story_v_out_112012.awb") / 1000

					if var_15_33 + var_15_25 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_33 + var_15_25
					end

					if var_15_28.prefab_name ~= "" and arg_12_1.actors_[var_15_28.prefab_name] ~= nil then
						local var_15_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_12_1.actors_[var_15_28.prefab_name].transform, "story_v_out_112012", "112012003", "story_v_out_112012.awb")

						arg_12_1:RecordAudio("112012003", var_15_34)
						arg_12_1:RecordAudio("112012003", var_15_34)
					else
						arg_12_1:AudioAction("play", "voice", "story_v_out_112012", "112012003", "story_v_out_112012.awb")
					end

					arg_12_1:RecordHistoryTalkVoice("story_v_out_112012", "112012003", "story_v_out_112012.awb")
				end

				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_35 = math.max(var_15_26, arg_12_1.talkMaxDuration)

			if var_15_25 <= arg_12_1.time_ and arg_12_1.time_ < var_15_25 + var_15_35 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_25) / var_15_35

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_25 + var_15_35 and arg_12_1.time_ < var_15_25 + var_15_35 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play112012004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 112012004
		arg_16_1.duration_ = 13.6

		local var_16_0 = {
			ja = 13.6,
			ko = 11.4,
			zh = 9.733,
			en = 12.433
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
				arg_16_0:Play112012005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = arg_16_1.actors_["1148ui_story"].transform
			local var_19_1 = 0

			if var_19_1 < arg_16_1.time_ and arg_16_1.time_ <= var_19_1 + arg_19_0 then
				arg_16_1.var_.moveOldPos1148ui_story = var_19_0.localPosition
			end

			local var_19_2 = 0.001

			if var_19_1 <= arg_16_1.time_ and arg_16_1.time_ < var_19_1 + var_19_2 then
				local var_19_3 = (arg_16_1.time_ - var_19_1) / var_19_2
				local var_19_4 = Vector3.New(0, 100, 0)

				var_19_0.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1148ui_story, var_19_4, var_19_3)

				local var_19_5 = manager.ui.mainCamera.transform.position - var_19_0.position

				var_19_0.forward = Vector3.New(var_19_5.x, var_19_5.y, var_19_5.z)

				local var_19_6 = var_19_0.localEulerAngles

				var_19_6.z = 0
				var_19_6.x = 0
				var_19_0.localEulerAngles = var_19_6
			end

			if arg_16_1.time_ >= var_19_1 + var_19_2 and arg_16_1.time_ < var_19_1 + var_19_2 + arg_19_0 then
				var_19_0.localPosition = Vector3.New(0, 100, 0)

				local var_19_7 = manager.ui.mainCamera.transform.position - var_19_0.position

				var_19_0.forward = Vector3.New(var_19_7.x, var_19_7.y, var_19_7.z)

				local var_19_8 = var_19_0.localEulerAngles

				var_19_8.z = 0
				var_19_8.x = 0
				var_19_0.localEulerAngles = var_19_8
			end

			local var_19_9 = arg_16_1.actors_["1027ui_story"].transform
			local var_19_10 = 0

			if var_19_10 < arg_16_1.time_ and arg_16_1.time_ <= var_19_10 + arg_19_0 then
				arg_16_1.var_.moveOldPos1027ui_story = var_19_9.localPosition
			end

			local var_19_11 = 0.001

			if var_19_10 <= arg_16_1.time_ and arg_16_1.time_ < var_19_10 + var_19_11 then
				local var_19_12 = (arg_16_1.time_ - var_19_10) / var_19_11
				local var_19_13 = Vector3.New(0, 100, 0)

				var_19_9.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1027ui_story, var_19_13, var_19_12)

				local var_19_14 = manager.ui.mainCamera.transform.position - var_19_9.position

				var_19_9.forward = Vector3.New(var_19_14.x, var_19_14.y, var_19_14.z)

				local var_19_15 = var_19_9.localEulerAngles

				var_19_15.z = 0
				var_19_15.x = 0
				var_19_9.localEulerAngles = var_19_15
			end

			if arg_16_1.time_ >= var_19_10 + var_19_11 and arg_16_1.time_ < var_19_10 + var_19_11 + arg_19_0 then
				var_19_9.localPosition = Vector3.New(0, 100, 0)

				local var_19_16 = manager.ui.mainCamera.transform.position - var_19_9.position

				var_19_9.forward = Vector3.New(var_19_16.x, var_19_16.y, var_19_16.z)

				local var_19_17 = var_19_9.localEulerAngles

				var_19_17.z = 0
				var_19_17.x = 0
				var_19_9.localEulerAngles = var_19_17
			end

			local var_19_18 = "1081ui_story"

			if arg_16_1.actors_[var_19_18] == nil then
				local var_19_19 = Object.Instantiate(Asset.Load("Char/" .. var_19_18), arg_16_1.stage_.transform)

				var_19_19.name = var_19_18
				var_19_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_16_1.actors_[var_19_18] = var_19_19

				local var_19_20 = var_19_19:GetComponentInChildren(typeof(CharacterEffect))

				var_19_20.enabled = true

				local var_19_21 = GameObjectTools.GetOrAddComponent(var_19_19, typeof(DynamicBoneHelper))

				if var_19_21 then
					var_19_21:EnableDynamicBone(false)
				end

				arg_16_1:ShowWeapon(var_19_20.transform, false)

				arg_16_1.var_[var_19_18 .. "Animator"] = var_19_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_16_1.var_[var_19_18 .. "Animator"].applyRootMotion = true
				arg_16_1.var_[var_19_18 .. "LipSync"] = var_19_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_19_22 = 0

			if var_19_22 < arg_16_1.time_ and arg_16_1.time_ <= var_19_22 + arg_19_0 then
				arg_16_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_1")
			end

			local var_19_23 = 0

			if var_19_23 < arg_16_1.time_ and arg_16_1.time_ <= var_19_23 + arg_19_0 then
				arg_16_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_19_24 = arg_16_1.actors_["1081ui_story"]
			local var_19_25 = 0

			if var_19_25 < arg_16_1.time_ and arg_16_1.time_ <= var_19_25 + arg_19_0 and arg_16_1.var_.characterEffect1081ui_story == nil then
				arg_16_1.var_.characterEffect1081ui_story = var_19_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_26 = 0.2

			if var_19_25 <= arg_16_1.time_ and arg_16_1.time_ < var_19_25 + var_19_26 then
				local var_19_27 = (arg_16_1.time_ - var_19_25) / var_19_26

				if arg_16_1.var_.characterEffect1081ui_story then
					arg_16_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_16_1.time_ >= var_19_25 + var_19_26 and arg_16_1.time_ < var_19_25 + var_19_26 + arg_19_0 and arg_16_1.var_.characterEffect1081ui_story then
				arg_16_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_19_28 = arg_16_1.actors_["1081ui_story"].transform
			local var_19_29 = 0

			if var_19_29 < arg_16_1.time_ and arg_16_1.time_ <= var_19_29 + arg_19_0 then
				arg_16_1.var_.moveOldPos1081ui_story = var_19_28.localPosition
			end

			local var_19_30 = 0.001

			if var_19_29 <= arg_16_1.time_ and arg_16_1.time_ < var_19_29 + var_19_30 then
				local var_19_31 = (arg_16_1.time_ - var_19_29) / var_19_30
				local var_19_32 = Vector3.New(0, -0.92, -5.8)

				var_19_28.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos1081ui_story, var_19_32, var_19_31)

				local var_19_33 = manager.ui.mainCamera.transform.position - var_19_28.position

				var_19_28.forward = Vector3.New(var_19_33.x, var_19_33.y, var_19_33.z)

				local var_19_34 = var_19_28.localEulerAngles

				var_19_34.z = 0
				var_19_34.x = 0
				var_19_28.localEulerAngles = var_19_34
			end

			if arg_16_1.time_ >= var_19_29 + var_19_30 and arg_16_1.time_ < var_19_29 + var_19_30 + arg_19_0 then
				var_19_28.localPosition = Vector3.New(0, -0.92, -5.8)

				local var_19_35 = manager.ui.mainCamera.transform.position - var_19_28.position

				var_19_28.forward = Vector3.New(var_19_35.x, var_19_35.y, var_19_35.z)

				local var_19_36 = var_19_28.localEulerAngles

				var_19_36.z = 0
				var_19_36.x = 0
				var_19_28.localEulerAngles = var_19_36
			end

			local var_19_37 = 0
			local var_19_38 = 1

			if var_19_37 < arg_16_1.time_ and arg_16_1.time_ <= var_19_37 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_39 = arg_16_1:FormatText(StoryNameCfg[202].name)

				arg_16_1.leftNameTxt_.text = var_19_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_40 = arg_16_1:GetWordFromCfg(112012004)
				local var_19_41 = arg_16_1:FormatText(var_19_40.content)

				arg_16_1.text_.text = var_19_41

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_42 = 49
				local var_19_43 = utf8.len(var_19_41)
				local var_19_44 = var_19_42 <= 0 and var_19_38 or var_19_38 * (var_19_43 / var_19_42)

				if var_19_44 > 0 and var_19_38 < var_19_44 then
					arg_16_1.talkMaxDuration = var_19_44

					if var_19_44 + var_19_37 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_44 + var_19_37
					end
				end

				arg_16_1.text_.text = var_19_41
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012004", "story_v_out_112012.awb") ~= 0 then
					local var_19_45 = manager.audio:GetVoiceLength("story_v_out_112012", "112012004", "story_v_out_112012.awb") / 1000

					if var_19_45 + var_19_37 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_45 + var_19_37
					end

					if var_19_40.prefab_name ~= "" and arg_16_1.actors_[var_19_40.prefab_name] ~= nil then
						local var_19_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_16_1.actors_[var_19_40.prefab_name].transform, "story_v_out_112012", "112012004", "story_v_out_112012.awb")

						arg_16_1:RecordAudio("112012004", var_19_46)
						arg_16_1:RecordAudio("112012004", var_19_46)
					else
						arg_16_1:AudioAction("play", "voice", "story_v_out_112012", "112012004", "story_v_out_112012.awb")
					end

					arg_16_1:RecordHistoryTalkVoice("story_v_out_112012", "112012004", "story_v_out_112012.awb")
				end

				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_47 = math.max(var_19_38, arg_16_1.talkMaxDuration)

			if var_19_37 <= arg_16_1.time_ and arg_16_1.time_ < var_19_37 + var_19_47 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_37) / var_19_47

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_37 + var_19_47 and arg_16_1.time_ < var_19_37 + var_19_47 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play112012005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 112012005
		arg_20_1.duration_ = 5

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play112012006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = arg_20_1.actors_["1081ui_story"]
			local var_23_1 = 0

			if var_23_1 < arg_20_1.time_ and arg_20_1.time_ <= var_23_1 + arg_23_0 and arg_20_1.var_.characterEffect1081ui_story == nil then
				arg_20_1.var_.characterEffect1081ui_story = var_23_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_2 = 0.2

			if var_23_1 <= arg_20_1.time_ and arg_20_1.time_ < var_23_1 + var_23_2 then
				local var_23_3 = (arg_20_1.time_ - var_23_1) / var_23_2

				if arg_20_1.var_.characterEffect1081ui_story then
					local var_23_4 = Mathf.Lerp(0, 0.5, var_23_3)

					arg_20_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_20_1.var_.characterEffect1081ui_story.fillRatio = var_23_4
				end
			end

			if arg_20_1.time_ >= var_23_1 + var_23_2 and arg_20_1.time_ < var_23_1 + var_23_2 + arg_23_0 and arg_20_1.var_.characterEffect1081ui_story then
				local var_23_5 = 0.5

				arg_20_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_20_1.var_.characterEffect1081ui_story.fillRatio = var_23_5
			end

			local var_23_6 = 0
			local var_23_7 = 0.35

			if var_23_6 < arg_20_1.time_ and arg_20_1.time_ <= var_23_6 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_8 = arg_20_1:FormatText(StoryNameCfg[7].name)

				arg_20_1.leftNameTxt_.text = var_23_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_9 = arg_20_1:GetWordFromCfg(112012005)
				local var_23_10 = arg_20_1:FormatText(var_23_9.content)

				arg_20_1.text_.text = var_23_10

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_11 = 14
				local var_23_12 = utf8.len(var_23_10)
				local var_23_13 = var_23_11 <= 0 and var_23_7 or var_23_7 * (var_23_12 / var_23_11)

				if var_23_13 > 0 and var_23_7 < var_23_13 then
					arg_20_1.talkMaxDuration = var_23_13

					if var_23_13 + var_23_6 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_13 + var_23_6
					end
				end

				arg_20_1.text_.text = var_23_10
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)
				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_14 = math.max(var_23_7, arg_20_1.talkMaxDuration)

			if var_23_6 <= arg_20_1.time_ and arg_20_1.time_ < var_23_6 + var_23_14 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_6) / var_23_14

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_6 + var_23_14 and arg_20_1.time_ < var_23_6 + var_23_14 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play112012006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 112012006
		arg_24_1.duration_ = 3.2

		local var_24_0 = {
			ja = 3.2,
			ko = 2.333,
			zh = 2.233,
			en = 1.999999999999
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
				arg_24_0:Play112012007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = 0

			if var_27_0 < arg_24_1.time_ and arg_24_1.time_ <= var_27_0 + arg_27_0 then
				arg_24_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action7_2")
			end

			local var_27_1 = 0

			if var_27_1 < arg_24_1.time_ and arg_24_1.time_ <= var_27_1 + arg_27_0 then
				arg_24_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_27_2 = arg_24_1.actors_["1081ui_story"]
			local var_27_3 = 0

			if var_27_3 < arg_24_1.time_ and arg_24_1.time_ <= var_27_3 + arg_27_0 and arg_24_1.var_.characterEffect1081ui_story == nil then
				arg_24_1.var_.characterEffect1081ui_story = var_27_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_4 = 0.2

			if var_27_3 <= arg_24_1.time_ and arg_24_1.time_ < var_27_3 + var_27_4 then
				local var_27_5 = (arg_24_1.time_ - var_27_3) / var_27_4

				if arg_24_1.var_.characterEffect1081ui_story then
					arg_24_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_3 + var_27_4 and arg_24_1.time_ < var_27_3 + var_27_4 + arg_27_0 and arg_24_1.var_.characterEffect1081ui_story then
				arg_24_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_27_6 = 0
			local var_27_7 = 0.225

			if var_27_6 < arg_24_1.time_ and arg_24_1.time_ <= var_27_6 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_8 = arg_24_1:FormatText(StoryNameCfg[202].name)

				arg_24_1.leftNameTxt_.text = var_27_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_9 = arg_24_1:GetWordFromCfg(112012006)
				local var_27_10 = arg_24_1:FormatText(var_27_9.content)

				arg_24_1.text_.text = var_27_10

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_11 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012006", "story_v_out_112012.awb") ~= 0 then
					local var_27_14 = manager.audio:GetVoiceLength("story_v_out_112012", "112012006", "story_v_out_112012.awb") / 1000

					if var_27_14 + var_27_6 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_14 + var_27_6
					end

					if var_27_9.prefab_name ~= "" and arg_24_1.actors_[var_27_9.prefab_name] ~= nil then
						local var_27_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_24_1.actors_[var_27_9.prefab_name].transform, "story_v_out_112012", "112012006", "story_v_out_112012.awb")

						arg_24_1:RecordAudio("112012006", var_27_15)
						arg_24_1:RecordAudio("112012006", var_27_15)
					else
						arg_24_1:AudioAction("play", "voice", "story_v_out_112012", "112012006", "story_v_out_112012.awb")
					end

					arg_24_1:RecordHistoryTalkVoice("story_v_out_112012", "112012006", "story_v_out_112012.awb")
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
	Play112012007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 112012007
		arg_28_1.duration_ = 5

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play112012008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = arg_28_1.actors_["1081ui_story"]
			local var_31_1 = 0

			if var_31_1 < arg_28_1.time_ and arg_28_1.time_ <= var_31_1 + arg_31_0 and arg_28_1.var_.characterEffect1081ui_story == nil then
				arg_28_1.var_.characterEffect1081ui_story = var_31_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_2 = 0.2

			if var_31_1 <= arg_28_1.time_ and arg_28_1.time_ < var_31_1 + var_31_2 then
				local var_31_3 = (arg_28_1.time_ - var_31_1) / var_31_2

				if arg_28_1.var_.characterEffect1081ui_story then
					local var_31_4 = Mathf.Lerp(0, 0.5, var_31_3)

					arg_28_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_28_1.var_.characterEffect1081ui_story.fillRatio = var_31_4
				end
			end

			if arg_28_1.time_ >= var_31_1 + var_31_2 and arg_28_1.time_ < var_31_1 + var_31_2 + arg_31_0 and arg_28_1.var_.characterEffect1081ui_story then
				local var_31_5 = 0.5

				arg_28_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_28_1.var_.characterEffect1081ui_story.fillRatio = var_31_5
			end

			local var_31_6 = 0
			local var_31_7 = 0.55

			if var_31_6 < arg_28_1.time_ and arg_28_1.time_ <= var_31_6 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_8 = arg_28_1:FormatText(StoryNameCfg[7].name)

				arg_28_1.leftNameTxt_.text = var_31_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_9 = arg_28_1:GetWordFromCfg(112012007)
				local var_31_10 = arg_28_1:FormatText(var_31_9.content)

				arg_28_1.text_.text = var_31_10

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_11 = 22
				local var_31_12 = utf8.len(var_31_10)
				local var_31_13 = var_31_11 <= 0 and var_31_7 or var_31_7 * (var_31_12 / var_31_11)

				if var_31_13 > 0 and var_31_7 < var_31_13 then
					arg_28_1.talkMaxDuration = var_31_13

					if var_31_13 + var_31_6 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_13 + var_31_6
					end
				end

				arg_28_1.text_.text = var_31_10
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)
				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_14 = math.max(var_31_7, arg_28_1.talkMaxDuration)

			if var_31_6 <= arg_28_1.time_ and arg_28_1.time_ < var_31_6 + var_31_14 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_6) / var_31_14

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_6 + var_31_14 and arg_28_1.time_ < var_31_6 + var_31_14 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play112012008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 112012008
		arg_32_1.duration_ = 5

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play112012009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = 0
			local var_35_1 = 0.7

			if var_35_0 < arg_32_1.time_ and arg_32_1.time_ <= var_35_0 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_2 = arg_32_1:FormatText(StoryNameCfg[7].name)

				arg_32_1.leftNameTxt_.text = var_35_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_3 = arg_32_1:GetWordFromCfg(112012008)
				local var_35_4 = arg_32_1:FormatText(var_35_3.content)

				arg_32_1.text_.text = var_35_4

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_5 = 28
				local var_35_6 = utf8.len(var_35_4)
				local var_35_7 = var_35_5 <= 0 and var_35_1 or var_35_1 * (var_35_6 / var_35_5)

				if var_35_7 > 0 and var_35_1 < var_35_7 then
					arg_32_1.talkMaxDuration = var_35_7

					if var_35_7 + var_35_0 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_7 + var_35_0
					end
				end

				arg_32_1.text_.text = var_35_4
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)
				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_8 = math.max(var_35_1, arg_32_1.talkMaxDuration)

			if var_35_0 <= arg_32_1.time_ and arg_32_1.time_ < var_35_0 + var_35_8 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_0) / var_35_8

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_0 + var_35_8 and arg_32_1.time_ < var_35_0 + var_35_8 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play112012009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 112012009
		arg_36_1.duration_ = 9.03

		local var_36_0 = {
			ja = 9.033,
			ko = 7.066,
			zh = 7.033,
			en = 7.1
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
				arg_36_0:Play112012010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = 0

			if var_39_0 < arg_36_1.time_ and arg_36_1.time_ <= var_39_0 + arg_39_0 then
				arg_36_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action5_1")
			end

			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 then
				arg_36_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_39_2 = arg_36_1.actors_["1081ui_story"]
			local var_39_3 = 0

			if var_39_3 < arg_36_1.time_ and arg_36_1.time_ <= var_39_3 + arg_39_0 and arg_36_1.var_.characterEffect1081ui_story == nil then
				arg_36_1.var_.characterEffect1081ui_story = var_39_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_4 = 0.2

			if var_39_3 <= arg_36_1.time_ and arg_36_1.time_ < var_39_3 + var_39_4 then
				local var_39_5 = (arg_36_1.time_ - var_39_3) / var_39_4

				if arg_36_1.var_.characterEffect1081ui_story then
					arg_36_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_3 + var_39_4 and arg_36_1.time_ < var_39_3 + var_39_4 + arg_39_0 and arg_36_1.var_.characterEffect1081ui_story then
				arg_36_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_39_6 = 0
			local var_39_7 = 1

			if var_39_6 < arg_36_1.time_ and arg_36_1.time_ <= var_39_6 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_8 = arg_36_1:FormatText(StoryNameCfg[202].name)

				arg_36_1.leftNameTxt_.text = var_39_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_9 = arg_36_1:GetWordFromCfg(112012009)
				local var_39_10 = arg_36_1:FormatText(var_39_9.content)

				arg_36_1.text_.text = var_39_10

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_11 = 27
				local var_39_12 = utf8.len(var_39_10)
				local var_39_13 = var_39_11 <= 0 and var_39_7 or var_39_7 * (var_39_12 / var_39_11)

				if var_39_13 > 0 and var_39_7 < var_39_13 then
					arg_36_1.talkMaxDuration = var_39_13

					if var_39_13 + var_39_6 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_13 + var_39_6
					end
				end

				arg_36_1.text_.text = var_39_10
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012009", "story_v_out_112012.awb") ~= 0 then
					local var_39_14 = manager.audio:GetVoiceLength("story_v_out_112012", "112012009", "story_v_out_112012.awb") / 1000

					if var_39_14 + var_39_6 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_14 + var_39_6
					end

					if var_39_9.prefab_name ~= "" and arg_36_1.actors_[var_39_9.prefab_name] ~= nil then
						local var_39_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_9.prefab_name].transform, "story_v_out_112012", "112012009", "story_v_out_112012.awb")

						arg_36_1:RecordAudio("112012009", var_39_15)
						arg_36_1:RecordAudio("112012009", var_39_15)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_112012", "112012009", "story_v_out_112012.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_112012", "112012009", "story_v_out_112012.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_16 = math.max(var_39_7, arg_36_1.talkMaxDuration)

			if var_39_6 <= arg_36_1.time_ and arg_36_1.time_ < var_39_6 + var_39_16 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_6) / var_39_16

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_6 + var_39_16 and arg_36_1.time_ < var_39_6 + var_39_16 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play112012010 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 112012010
		arg_40_1.duration_ = 5

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play112012011(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = 0
			local var_43_1 = 1

			if var_43_0 < arg_40_1.time_ and arg_40_1.time_ <= var_43_0 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, false)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_40_1.iconTrs_.gameObject, false)
				arg_40_1.callingController_:SetSelectedState("normal")

				local var_43_2 = arg_40_1:GetWordFromCfg(112012010)
				local var_43_3 = arg_40_1:FormatText(var_43_2.content)

				arg_40_1.text_.text = var_43_3

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_4 = 25
				local var_43_5 = utf8.len(var_43_3)
				local var_43_6 = var_43_4 <= 0 and var_43_1 or var_43_1 * (var_43_5 / var_43_4)

				if var_43_6 > 0 and var_43_1 < var_43_6 then
					arg_40_1.talkMaxDuration = var_43_6

					if var_43_6 + var_43_0 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_6 + var_43_0
					end
				end

				arg_40_1.text_.text = var_43_3
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)
				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_7 = math.max(var_43_1, arg_40_1.talkMaxDuration)

			if var_43_0 <= arg_40_1.time_ and arg_40_1.time_ < var_43_0 + var_43_7 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_0) / var_43_7

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_0 + var_43_7 and arg_40_1.time_ < var_43_0 + var_43_7 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play112012011 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 112012011
		arg_44_1.duration_ = 5

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
		end

		function arg_44_1.playNext_(arg_46_0)
			if arg_46_0 == 1 then
				arg_44_0:Play112012012(arg_44_1)
			end
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = arg_44_1.actors_["1081ui_story"].transform
			local var_47_1 = 0

			if var_47_1 < arg_44_1.time_ and arg_44_1.time_ <= var_47_1 + arg_47_0 then
				arg_44_1.var_.moveOldPos1081ui_story = var_47_0.localPosition
			end

			local var_47_2 = 0.001

			if var_47_1 <= arg_44_1.time_ and arg_44_1.time_ < var_47_1 + var_47_2 then
				local var_47_3 = (arg_44_1.time_ - var_47_1) / var_47_2
				local var_47_4 = Vector3.New(0, 100, 0)

				var_47_0.localPosition = Vector3.Lerp(arg_44_1.var_.moveOldPos1081ui_story, var_47_4, var_47_3)

				local var_47_5 = manager.ui.mainCamera.transform.position - var_47_0.position

				var_47_0.forward = Vector3.New(var_47_5.x, var_47_5.y, var_47_5.z)

				local var_47_6 = var_47_0.localEulerAngles

				var_47_6.z = 0
				var_47_6.x = 0
				var_47_0.localEulerAngles = var_47_6
			end

			if arg_44_1.time_ >= var_47_1 + var_47_2 and arg_44_1.time_ < var_47_1 + var_47_2 + arg_47_0 then
				var_47_0.localPosition = Vector3.New(0, 100, 0)

				local var_47_7 = manager.ui.mainCamera.transform.position - var_47_0.position

				var_47_0.forward = Vector3.New(var_47_7.x, var_47_7.y, var_47_7.z)

				local var_47_8 = var_47_0.localEulerAngles

				var_47_8.z = 0
				var_47_8.x = 0
				var_47_0.localEulerAngles = var_47_8
			end

			local var_47_9 = 0
			local var_47_10 = 1

			if var_47_9 < arg_44_1.time_ and arg_44_1.time_ <= var_47_9 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0
				arg_44_1.dialogCg_.alpha = 1

				arg_44_1.dialog_:SetActive(true)
				SetActive(arg_44_1.leftNameGo_, false)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_44_1.iconTrs_.gameObject, false)
				arg_44_1.callingController_:SetSelectedState("normal")

				local var_47_11 = arg_44_1:GetWordFromCfg(112012011)
				local var_47_12 = arg_44_1:FormatText(var_47_11.content)

				arg_44_1.text_.text = var_47_12

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_13 = 59
				local var_47_14 = utf8.len(var_47_12)
				local var_47_15 = var_47_13 <= 0 and var_47_10 or var_47_10 * (var_47_14 / var_47_13)

				if var_47_15 > 0 and var_47_10 < var_47_15 then
					arg_44_1.talkMaxDuration = var_47_15

					if var_47_15 + var_47_9 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_15 + var_47_9
					end
				end

				arg_44_1.text_.text = var_47_12
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)
				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_16 = math.max(var_47_10, arg_44_1.talkMaxDuration)

			if var_47_9 <= arg_44_1.time_ and arg_44_1.time_ < var_47_9 + var_47_16 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_9) / var_47_16

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_9 + var_47_16 and arg_44_1.time_ < var_47_9 + var_47_16 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	Play112012012 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 112012012
		arg_48_1.duration_ = 12.17

		local var_48_0 = {
			ja = 11.8,
			ko = 12.166,
			zh = 9.033,
			en = 10.933
		}
		local var_48_1 = manager.audio:GetLocalizationFlag()

		if var_48_0[var_48_1] ~= nil then
			arg_48_1.duration_ = var_48_0[var_48_1]
		end

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play112012013(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = "1039ui_story"

			if arg_48_1.actors_[var_51_0] == nil then
				local var_51_1 = Object.Instantiate(Asset.Load("Char/" .. var_51_0), arg_48_1.stage_.transform)

				var_51_1.name = var_51_0
				var_51_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_48_1.actors_[var_51_0] = var_51_1

				local var_51_2 = var_51_1:GetComponentInChildren(typeof(CharacterEffect))

				var_51_2.enabled = true

				local var_51_3 = GameObjectTools.GetOrAddComponent(var_51_1, typeof(DynamicBoneHelper))

				if var_51_3 then
					var_51_3:EnableDynamicBone(false)
				end

				arg_48_1:ShowWeapon(var_51_2.transform, false)

				arg_48_1.var_[var_51_0 .. "Animator"] = var_51_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_48_1.var_[var_51_0 .. "Animator"].applyRootMotion = true
				arg_48_1.var_[var_51_0 .. "LipSync"] = var_51_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_51_4 = arg_48_1.actors_["1039ui_story"].transform
			local var_51_5 = 0

			if var_51_5 < arg_48_1.time_ and arg_48_1.time_ <= var_51_5 + arg_51_0 then
				arg_48_1.var_.moveOldPos1039ui_story = var_51_4.localPosition
			end

			local var_51_6 = 0.001

			if var_51_5 <= arg_48_1.time_ and arg_48_1.time_ < var_51_5 + var_51_6 then
				local var_51_7 = (arg_48_1.time_ - var_51_5) / var_51_6
				local var_51_8 = Vector3.New(-0.7, -1.01, -5.9)

				var_51_4.localPosition = Vector3.Lerp(arg_48_1.var_.moveOldPos1039ui_story, var_51_8, var_51_7)

				local var_51_9 = manager.ui.mainCamera.transform.position - var_51_4.position

				var_51_4.forward = Vector3.New(var_51_9.x, var_51_9.y, var_51_9.z)

				local var_51_10 = var_51_4.localEulerAngles

				var_51_10.z = 0
				var_51_10.x = 0
				var_51_4.localEulerAngles = var_51_10
			end

			if arg_48_1.time_ >= var_51_5 + var_51_6 and arg_48_1.time_ < var_51_5 + var_51_6 + arg_51_0 then
				var_51_4.localPosition = Vector3.New(-0.7, -1.01, -5.9)

				local var_51_11 = manager.ui.mainCamera.transform.position - var_51_4.position

				var_51_4.forward = Vector3.New(var_51_11.x, var_51_11.y, var_51_11.z)

				local var_51_12 = var_51_4.localEulerAngles

				var_51_12.z = 0
				var_51_12.x = 0
				var_51_4.localEulerAngles = var_51_12
			end

			local var_51_13 = 0

			if var_51_13 < arg_48_1.time_ and arg_48_1.time_ <= var_51_13 + arg_51_0 then
				arg_48_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039action/1039action5_1")
			end

			local var_51_14 = 0

			if var_51_14 < arg_48_1.time_ and arg_48_1.time_ <= var_51_14 + arg_51_0 then
				arg_48_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_51_15 = arg_48_1.actors_["1039ui_story"]
			local var_51_16 = 0

			if var_51_16 < arg_48_1.time_ and arg_48_1.time_ <= var_51_16 + arg_51_0 and arg_48_1.var_.characterEffect1039ui_story == nil then
				arg_48_1.var_.characterEffect1039ui_story = var_51_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_17 = 0.2

			if var_51_16 <= arg_48_1.time_ and arg_48_1.time_ < var_51_16 + var_51_17 then
				local var_51_18 = (arg_48_1.time_ - var_51_16) / var_51_17

				if arg_48_1.var_.characterEffect1039ui_story then
					arg_48_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_48_1.time_ >= var_51_16 + var_51_17 and arg_48_1.time_ < var_51_16 + var_51_17 + arg_51_0 and arg_48_1.var_.characterEffect1039ui_story then
				arg_48_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_51_19 = 0
			local var_51_20 = 1.2

			if var_51_19 < arg_48_1.time_ and arg_48_1.time_ <= var_51_19 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0
				arg_48_1.dialogCg_.alpha = 1

				arg_48_1.dialog_:SetActive(true)
				SetActive(arg_48_1.leftNameGo_, true)

				local var_51_21 = arg_48_1:FormatText(StoryNameCfg[9].name)

				arg_48_1.leftNameTxt_.text = var_51_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_48_1.leftNameTxt_.transform)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1.leftNameTxt_.text)
				SetActive(arg_48_1.iconTrs_.gameObject, false)
				arg_48_1.callingController_:SetSelectedState("normal")

				local var_51_22 = arg_48_1:GetWordFromCfg(112012012)
				local var_51_23 = arg_48_1:FormatText(var_51_22.content)

				arg_48_1.text_.text = var_51_23

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_24 = 48
				local var_51_25 = utf8.len(var_51_23)
				local var_51_26 = var_51_24 <= 0 and var_51_20 or var_51_20 * (var_51_25 / var_51_24)

				if var_51_26 > 0 and var_51_20 < var_51_26 then
					arg_48_1.talkMaxDuration = var_51_26

					if var_51_26 + var_51_19 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_26 + var_51_19
					end
				end

				arg_48_1.text_.text = var_51_23
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012012", "story_v_out_112012.awb") ~= 0 then
					local var_51_27 = manager.audio:GetVoiceLength("story_v_out_112012", "112012012", "story_v_out_112012.awb") / 1000

					if var_51_27 + var_51_19 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_27 + var_51_19
					end

					if var_51_22.prefab_name ~= "" and arg_48_1.actors_[var_51_22.prefab_name] ~= nil then
						local var_51_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_48_1.actors_[var_51_22.prefab_name].transform, "story_v_out_112012", "112012012", "story_v_out_112012.awb")

						arg_48_1:RecordAudio("112012012", var_51_28)
						arg_48_1:RecordAudio("112012012", var_51_28)
					else
						arg_48_1:AudioAction("play", "voice", "story_v_out_112012", "112012012", "story_v_out_112012.awb")
					end

					arg_48_1:RecordHistoryTalkVoice("story_v_out_112012", "112012012", "story_v_out_112012.awb")
				end

				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_29 = math.max(var_51_20, arg_48_1.talkMaxDuration)

			if var_51_19 <= arg_48_1.time_ and arg_48_1.time_ < var_51_19 + var_51_29 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_19) / var_51_29

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_19 + var_51_29 and arg_48_1.time_ < var_51_19 + var_51_29 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play112012013 = function(arg_52_0, arg_52_1)
		arg_52_1.time_ = 0
		arg_52_1.frameCnt_ = 0
		arg_52_1.state_ = "playing"
		arg_52_1.curTalkId_ = 112012013
		arg_52_1.duration_ = 5.47

		local var_52_0 = {
			ja = 4.866,
			ko = 2.7,
			zh = 4.733,
			en = 5.466
		}
		local var_52_1 = manager.audio:GetLocalizationFlag()

		if var_52_0[var_52_1] ~= nil then
			arg_52_1.duration_ = var_52_0[var_52_1]
		end

		SetActive(arg_52_1.tipsGo_, false)

		function arg_52_1.onSingleLineFinish_()
			arg_52_1.onSingleLineUpdate_ = nil
			arg_52_1.onSingleLineFinish_ = nil
			arg_52_1.state_ = "waiting"
		end

		function arg_52_1.playNext_(arg_54_0)
			if arg_54_0 == 1 then
				arg_52_0:Play112012014(arg_52_1)
			end
		end

		function arg_52_1.onSingleLineUpdate_(arg_55_0)
			local var_55_0 = arg_52_1.actors_["1039ui_story"]
			local var_55_1 = 0

			if var_55_1 < arg_52_1.time_ and arg_52_1.time_ <= var_55_1 + arg_55_0 and arg_52_1.var_.characterEffect1039ui_story == nil then
				arg_52_1.var_.characterEffect1039ui_story = var_55_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_55_2 = 0.2

			if var_55_1 <= arg_52_1.time_ and arg_52_1.time_ < var_55_1 + var_55_2 then
				local var_55_3 = (arg_52_1.time_ - var_55_1) / var_55_2

				if arg_52_1.var_.characterEffect1039ui_story then
					local var_55_4 = Mathf.Lerp(0, 0.5, var_55_3)

					arg_52_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_52_1.var_.characterEffect1039ui_story.fillRatio = var_55_4
				end
			end

			if arg_52_1.time_ >= var_55_1 + var_55_2 and arg_52_1.time_ < var_55_1 + var_55_2 + arg_55_0 and arg_52_1.var_.characterEffect1039ui_story then
				local var_55_5 = 0.5

				arg_52_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_52_1.var_.characterEffect1039ui_story.fillRatio = var_55_5
			end

			local var_55_6 = 0

			if var_55_6 < arg_52_1.time_ and arg_52_1.time_ <= var_55_6 + arg_55_0 then
				arg_52_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/1081/1081action/1081action1_1")
			end

			local var_55_7 = 0

			if var_55_7 < arg_52_1.time_ and arg_52_1.time_ <= var_55_7 + arg_55_0 then
				arg_52_1:PlayTimeline("1081ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_55_8 = arg_52_1.actors_["1081ui_story"]
			local var_55_9 = 0

			if var_55_9 < arg_52_1.time_ and arg_52_1.time_ <= var_55_9 + arg_55_0 and arg_52_1.var_.characterEffect1081ui_story == nil then
				arg_52_1.var_.characterEffect1081ui_story = var_55_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_55_10 = 0.2

			if var_55_9 <= arg_52_1.time_ and arg_52_1.time_ < var_55_9 + var_55_10 then
				local var_55_11 = (arg_52_1.time_ - var_55_9) / var_55_10

				if arg_52_1.var_.characterEffect1081ui_story then
					arg_52_1.var_.characterEffect1081ui_story.fillFlat = false
				end
			end

			if arg_52_1.time_ >= var_55_9 + var_55_10 and arg_52_1.time_ < var_55_9 + var_55_10 + arg_55_0 and arg_52_1.var_.characterEffect1081ui_story then
				arg_52_1.var_.characterEffect1081ui_story.fillFlat = false
			end

			local var_55_12 = arg_52_1.actors_["1081ui_story"].transform
			local var_55_13 = 0

			if var_55_13 < arg_52_1.time_ and arg_52_1.time_ <= var_55_13 + arg_55_0 then
				arg_52_1.var_.moveOldPos1081ui_story = var_55_12.localPosition
			end

			local var_55_14 = 0.001

			if var_55_13 <= arg_52_1.time_ and arg_52_1.time_ < var_55_13 + var_55_14 then
				local var_55_15 = (arg_52_1.time_ - var_55_13) / var_55_14
				local var_55_16 = Vector3.New(0.7, -0.92, -5.8)

				var_55_12.localPosition = Vector3.Lerp(arg_52_1.var_.moveOldPos1081ui_story, var_55_16, var_55_15)

				local var_55_17 = manager.ui.mainCamera.transform.position - var_55_12.position

				var_55_12.forward = Vector3.New(var_55_17.x, var_55_17.y, var_55_17.z)

				local var_55_18 = var_55_12.localEulerAngles

				var_55_18.z = 0
				var_55_18.x = 0
				var_55_12.localEulerAngles = var_55_18
			end

			if arg_52_1.time_ >= var_55_13 + var_55_14 and arg_52_1.time_ < var_55_13 + var_55_14 + arg_55_0 then
				var_55_12.localPosition = Vector3.New(0.7, -0.92, -5.8)

				local var_55_19 = manager.ui.mainCamera.transform.position - var_55_12.position

				var_55_12.forward = Vector3.New(var_55_19.x, var_55_19.y, var_55_19.z)

				local var_55_20 = var_55_12.localEulerAngles

				var_55_20.z = 0
				var_55_20.x = 0
				var_55_12.localEulerAngles = var_55_20
			end

			local var_55_21 = 0
			local var_55_22 = 0.4

			if var_55_21 < arg_52_1.time_ and arg_52_1.time_ <= var_55_21 + arg_55_0 then
				arg_52_1.talkMaxDuration = 0
				arg_52_1.dialogCg_.alpha = 1

				arg_52_1.dialog_:SetActive(true)
				SetActive(arg_52_1.leftNameGo_, true)

				local var_55_23 = arg_52_1:FormatText(StoryNameCfg[202].name)

				arg_52_1.leftNameTxt_.text = var_55_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_52_1.leftNameTxt_.transform)

				arg_52_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_52_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_52_1:RecordName(arg_52_1.leftNameTxt_.text)
				SetActive(arg_52_1.iconTrs_.gameObject, false)
				arg_52_1.callingController_:SetSelectedState("normal")

				local var_55_24 = arg_52_1:GetWordFromCfg(112012013)
				local var_55_25 = arg_52_1:FormatText(var_55_24.content)

				arg_52_1.text_.text = var_55_25

				LuaForUtil.ClearLinePrefixSymbol(arg_52_1.text_)

				local var_55_26 = 16
				local var_55_27 = utf8.len(var_55_25)
				local var_55_28 = var_55_26 <= 0 and var_55_22 or var_55_22 * (var_55_27 / var_55_26)

				if var_55_28 > 0 and var_55_22 < var_55_28 then
					arg_52_1.talkMaxDuration = var_55_28

					if var_55_28 + var_55_21 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_28 + var_55_21
					end
				end

				arg_52_1.text_.text = var_55_25
				arg_52_1.typewritter.percent = 0

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012013", "story_v_out_112012.awb") ~= 0 then
					local var_55_29 = manager.audio:GetVoiceLength("story_v_out_112012", "112012013", "story_v_out_112012.awb") / 1000

					if var_55_29 + var_55_21 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_29 + var_55_21
					end

					if var_55_24.prefab_name ~= "" and arg_52_1.actors_[var_55_24.prefab_name] ~= nil then
						local var_55_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_52_1.actors_[var_55_24.prefab_name].transform, "story_v_out_112012", "112012013", "story_v_out_112012.awb")

						arg_52_1:RecordAudio("112012013", var_55_30)
						arg_52_1:RecordAudio("112012013", var_55_30)
					else
						arg_52_1:AudioAction("play", "voice", "story_v_out_112012", "112012013", "story_v_out_112012.awb")
					end

					arg_52_1:RecordHistoryTalkVoice("story_v_out_112012", "112012013", "story_v_out_112012.awb")
				end

				arg_52_1:RecordContent(arg_52_1.text_.text)
			end

			local var_55_31 = math.max(var_55_22, arg_52_1.talkMaxDuration)

			if var_55_21 <= arg_52_1.time_ and arg_52_1.time_ < var_55_21 + var_55_31 then
				arg_52_1.typewritter.percent = (arg_52_1.time_ - var_55_21) / var_55_31

				arg_52_1.typewritter:SetDirty()
			end

			if arg_52_1.time_ >= var_55_21 + var_55_31 and arg_52_1.time_ < var_55_21 + var_55_31 + arg_55_0 then
				arg_52_1.typewritter.percent = 1

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(true)
			end
		end
	end,
	Play112012014 = function(arg_56_0, arg_56_1)
		arg_56_1.time_ = 0
		arg_56_1.frameCnt_ = 0
		arg_56_1.state_ = "playing"
		arg_56_1.curTalkId_ = 112012014
		arg_56_1.duration_ = 5

		SetActive(arg_56_1.tipsGo_, false)

		function arg_56_1.onSingleLineFinish_()
			arg_56_1.onSingleLineUpdate_ = nil
			arg_56_1.onSingleLineFinish_ = nil
			arg_56_1.state_ = "waiting"
		end

		function arg_56_1.playNext_(arg_58_0)
			if arg_58_0 == 1 then
				arg_56_0:Play112012015(arg_56_1)
			end
		end

		function arg_56_1.onSingleLineUpdate_(arg_59_0)
			local var_59_0 = arg_56_1.actors_["1081ui_story"]
			local var_59_1 = 0

			if var_59_1 < arg_56_1.time_ and arg_56_1.time_ <= var_59_1 + arg_59_0 and arg_56_1.var_.characterEffect1081ui_story == nil then
				arg_56_1.var_.characterEffect1081ui_story = var_59_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_59_2 = 0.2

			if var_59_1 <= arg_56_1.time_ and arg_56_1.time_ < var_59_1 + var_59_2 then
				local var_59_3 = (arg_56_1.time_ - var_59_1) / var_59_2

				if arg_56_1.var_.characterEffect1081ui_story then
					local var_59_4 = Mathf.Lerp(0, 0.5, var_59_3)

					arg_56_1.var_.characterEffect1081ui_story.fillFlat = true
					arg_56_1.var_.characterEffect1081ui_story.fillRatio = var_59_4
				end
			end

			if arg_56_1.time_ >= var_59_1 + var_59_2 and arg_56_1.time_ < var_59_1 + var_59_2 + arg_59_0 and arg_56_1.var_.characterEffect1081ui_story then
				local var_59_5 = 0.5

				arg_56_1.var_.characterEffect1081ui_story.fillFlat = true
				arg_56_1.var_.characterEffect1081ui_story.fillRatio = var_59_5
			end

			local var_59_6 = 0
			local var_59_7 = 0.225

			if var_59_6 < arg_56_1.time_ and arg_56_1.time_ <= var_59_6 + arg_59_0 then
				arg_56_1.talkMaxDuration = 0
				arg_56_1.dialogCg_.alpha = 1

				arg_56_1.dialog_:SetActive(true)
				SetActive(arg_56_1.leftNameGo_, true)

				local var_59_8 = arg_56_1:FormatText(StoryNameCfg[7].name)

				arg_56_1.leftNameTxt_.text = var_59_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_56_1.leftNameTxt_.transform)

				arg_56_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_56_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_56_1:RecordName(arg_56_1.leftNameTxt_.text)
				SetActive(arg_56_1.iconTrs_.gameObject, false)
				arg_56_1.callingController_:SetSelectedState("normal")

				local var_59_9 = arg_56_1:GetWordFromCfg(112012014)
				local var_59_10 = arg_56_1:FormatText(var_59_9.content)

				arg_56_1.text_.text = var_59_10

				LuaForUtil.ClearLinePrefixSymbol(arg_56_1.text_)

				local var_59_11 = 9
				local var_59_12 = utf8.len(var_59_10)
				local var_59_13 = var_59_11 <= 0 and var_59_7 or var_59_7 * (var_59_12 / var_59_11)

				if var_59_13 > 0 and var_59_7 < var_59_13 then
					arg_56_1.talkMaxDuration = var_59_13

					if var_59_13 + var_59_6 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_13 + var_59_6
					end
				end

				arg_56_1.text_.text = var_59_10
				arg_56_1.typewritter.percent = 0

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(false)
				arg_56_1:RecordContent(arg_56_1.text_.text)
			end

			local var_59_14 = math.max(var_59_7, arg_56_1.talkMaxDuration)

			if var_59_6 <= arg_56_1.time_ and arg_56_1.time_ < var_59_6 + var_59_14 then
				arg_56_1.typewritter.percent = (arg_56_1.time_ - var_59_6) / var_59_14

				arg_56_1.typewritter:SetDirty()
			end

			if arg_56_1.time_ >= var_59_6 + var_59_14 and arg_56_1.time_ < var_59_6 + var_59_14 + arg_59_0 then
				arg_56_1.typewritter.percent = 1

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(true)
			end
		end
	end,
	Play112012015 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 112012015
		arg_60_1.duration_ = 7.23

		local var_60_0 = {
			ja = 6.3,
			ko = 5.8,
			zh = 4.4,
			en = 7.233
		}
		local var_60_1 = manager.audio:GetLocalizationFlag()

		if var_60_0[var_60_1] ~= nil then
			arg_60_1.duration_ = var_60_0[var_60_1]
		end

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play112012016(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = 0

			if var_63_0 < arg_60_1.time_ and arg_60_1.time_ <= var_63_0 + arg_63_0 then
				arg_60_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/1039/1039actionlink/1039action454")
			end

			local var_63_1 = 0

			if var_63_1 < arg_60_1.time_ and arg_60_1.time_ <= var_63_1 + arg_63_0 then
				arg_60_1:PlayTimeline("1039ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_63_2 = arg_60_1.actors_["1039ui_story"]
			local var_63_3 = 0

			if var_63_3 < arg_60_1.time_ and arg_60_1.time_ <= var_63_3 + arg_63_0 and arg_60_1.var_.characterEffect1039ui_story == nil then
				arg_60_1.var_.characterEffect1039ui_story = var_63_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_4 = 0.2

			if var_63_3 <= arg_60_1.time_ and arg_60_1.time_ < var_63_3 + var_63_4 then
				local var_63_5 = (arg_60_1.time_ - var_63_3) / var_63_4

				if arg_60_1.var_.characterEffect1039ui_story then
					arg_60_1.var_.characterEffect1039ui_story.fillFlat = false
				end
			end

			if arg_60_1.time_ >= var_63_3 + var_63_4 and arg_60_1.time_ < var_63_3 + var_63_4 + arg_63_0 and arg_60_1.var_.characterEffect1039ui_story then
				arg_60_1.var_.characterEffect1039ui_story.fillFlat = false
			end

			local var_63_6 = 0
			local var_63_7 = 0.65

			if var_63_6 < arg_60_1.time_ and arg_60_1.time_ <= var_63_6 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, true)

				local var_63_8 = arg_60_1:FormatText(StoryNameCfg[9].name)

				arg_60_1.leftNameTxt_.text = var_63_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_60_1.leftNameTxt_.transform)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1.leftNameTxt_.text)
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_9 = arg_60_1:GetWordFromCfg(112012015)
				local var_63_10 = arg_60_1:FormatText(var_63_9.content)

				arg_60_1.text_.text = var_63_10

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_11 = 26
				local var_63_12 = utf8.len(var_63_10)
				local var_63_13 = var_63_11 <= 0 and var_63_7 or var_63_7 * (var_63_12 / var_63_11)

				if var_63_13 > 0 and var_63_7 < var_63_13 then
					arg_60_1.talkMaxDuration = var_63_13

					if var_63_13 + var_63_6 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_13 + var_63_6
					end
				end

				arg_60_1.text_.text = var_63_10
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_112012", "112012015", "story_v_out_112012.awb") ~= 0 then
					local var_63_14 = manager.audio:GetVoiceLength("story_v_out_112012", "112012015", "story_v_out_112012.awb") / 1000

					if var_63_14 + var_63_6 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_14 + var_63_6
					end

					if var_63_9.prefab_name ~= "" and arg_60_1.actors_[var_63_9.prefab_name] ~= nil then
						local var_63_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_60_1.actors_[var_63_9.prefab_name].transform, "story_v_out_112012", "112012015", "story_v_out_112012.awb")

						arg_60_1:RecordAudio("112012015", var_63_15)
						arg_60_1:RecordAudio("112012015", var_63_15)
					else
						arg_60_1:AudioAction("play", "voice", "story_v_out_112012", "112012015", "story_v_out_112012.awb")
					end

					arg_60_1:RecordHistoryTalkVoice("story_v_out_112012", "112012015", "story_v_out_112012.awb")
				end

				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_16 = math.max(var_63_7, arg_60_1.talkMaxDuration)

			if var_63_6 <= arg_60_1.time_ and arg_60_1.time_ < var_63_6 + var_63_16 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_6) / var_63_16

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_6 + var_63_16 and arg_60_1.time_ < var_63_6 + var_63_16 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play112012016 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 112012016
		arg_64_1.duration_ = 5

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
			arg_64_1.auto_ = false
		end

		function arg_64_1.playNext_(arg_66_0)
			arg_64_1.onStoryFinished_()
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = arg_64_1.actors_["1039ui_story"]
			local var_67_1 = 0

			if var_67_1 < arg_64_1.time_ and arg_64_1.time_ <= var_67_1 + arg_67_0 and arg_64_1.var_.characterEffect1039ui_story == nil then
				arg_64_1.var_.characterEffect1039ui_story = var_67_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_67_2 = 0.2

			if var_67_1 <= arg_64_1.time_ and arg_64_1.time_ < var_67_1 + var_67_2 then
				local var_67_3 = (arg_64_1.time_ - var_67_1) / var_67_2

				if arg_64_1.var_.characterEffect1039ui_story then
					local var_67_4 = Mathf.Lerp(0, 0.5, var_67_3)

					arg_64_1.var_.characterEffect1039ui_story.fillFlat = true
					arg_64_1.var_.characterEffect1039ui_story.fillRatio = var_67_4
				end
			end

			if arg_64_1.time_ >= var_67_1 + var_67_2 and arg_64_1.time_ < var_67_1 + var_67_2 + arg_67_0 and arg_64_1.var_.characterEffect1039ui_story then
				local var_67_5 = 0.5

				arg_64_1.var_.characterEffect1039ui_story.fillFlat = true
				arg_64_1.var_.characterEffect1039ui_story.fillRatio = var_67_5
			end

			local var_67_6 = 0
			local var_67_7 = 0.775

			if var_67_6 < arg_64_1.time_ and arg_64_1.time_ <= var_67_6 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, true)

				local var_67_8 = arg_64_1:FormatText(StoryNameCfg[7].name)

				arg_64_1.leftNameTxt_.text = var_67_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_64_1.leftNameTxt_.transform)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1.leftNameTxt_.text)
				SetActive(arg_64_1.iconTrs_.gameObject, false)
				arg_64_1.callingController_:SetSelectedState("normal")

				local var_67_9 = arg_64_1:GetWordFromCfg(112012016)
				local var_67_10 = arg_64_1:FormatText(var_67_9.content)

				arg_64_1.text_.text = var_67_10

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_11 = 31
				local var_67_12 = utf8.len(var_67_10)
				local var_67_13 = var_67_11 <= 0 and var_67_7 or var_67_7 * (var_67_12 / var_67_11)

				if var_67_13 > 0 and var_67_7 < var_67_13 then
					arg_64_1.talkMaxDuration = var_67_13

					if var_67_13 + var_67_6 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_13 + var_67_6
					end
				end

				arg_64_1.text_.text = var_67_10
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)
				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_14 = math.max(var_67_7, arg_64_1.talkMaxDuration)

			if var_67_6 <= arg_64_1.time_ and arg_64_1.time_ < var_67_6 + var_67_14 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_6) / var_67_14

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_6 + var_67_14 and arg_64_1.time_ < var_67_6 + var_67_14 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/H02"
	},
	voices = {
		"story_v_out_112012.awb"
	}
}
