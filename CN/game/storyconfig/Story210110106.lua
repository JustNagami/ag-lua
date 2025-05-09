﻿return {
	Play1101106001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1101106001
		arg_1_1.duration_ = 5.6

		local var_1_0 = {
			zh = 5.266,
			ja = 5.6
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
				arg_1_0:Play1101106002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST19"

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
				local var_4_5 = arg_1_1.bgs_.ST19

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
					if iter_4_0 ~= "ST19" then
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

			local var_4_22 = "1111ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Asset.Load("Char/" .. "1111ui_story")

				if not isNil(var_4_23) then
					local var_4_24 = Object.Instantiate(Asset.Load("Char/" .. "1111ui_story"), arg_1_1.stage_.transform)

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

			local var_4_27 = arg_1_1.actors_["1111ui_story"].transform
			local var_4_28 = 2

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.var_.moveOldPos1111ui_story = var_4_27.localPosition
			end

			local var_4_29 = 0.001

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_28) / var_4_29
				local var_4_31 = Vector3.New(-0.79, -0.87, -5.7)

				var_4_27.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1111ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_27.position

				var_4_27.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_27.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_27.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				var_4_27.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_27.position

				var_4_27.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_27.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_27.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1111ui_story"]
			local var_4_37 = 2

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and not isNil(var_4_36) and arg_1_1.var_.characterEffect1111ui_story == nil then
				arg_1_1.var_.characterEffect1111ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 and not isNil(var_4_36) then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1111ui_story and not isNil(var_4_36) then
					arg_1_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and not isNil(var_4_36) and arg_1_1.var_.characterEffect1111ui_story then
				arg_1_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action1_1")
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_4_42 = "1011ui_story"

			if arg_1_1.actors_[var_4_42] == nil then
				local var_4_43 = Asset.Load("Char/" .. "1011ui_story")

				if not isNil(var_4_43) then
					local var_4_44 = Object.Instantiate(Asset.Load("Char/" .. "1011ui_story"), arg_1_1.stage_.transform)

					var_4_44.name = var_4_42
					var_4_44.transform.localPosition = Vector3.New(0, 100, 0)
					arg_1_1.actors_[var_4_42] = var_4_44

					local var_4_45 = var_4_44:GetComponentInChildren(typeof(CharacterEffect))

					var_4_45.enabled = true

					local var_4_46 = GameObjectTools.GetOrAddComponent(var_4_44, typeof(DynamicBoneHelper))

					if var_4_46 then
						var_4_46:EnableDynamicBone(false)
					end

					arg_1_1:ShowWeapon(var_4_45.transform, false)

					arg_1_1.var_[var_4_42 .. "Animator"] = var_4_45.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_1_1.var_[var_4_42 .. "Animator"].applyRootMotion = true
					arg_1_1.var_[var_4_42 .. "LipSync"] = var_4_45.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_4_47 = arg_1_1.actors_["1011ui_story"].transform
			local var_4_48 = 2

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				arg_1_1.var_.moveOldPos1011ui_story = var_4_47.localPosition
			end

			local var_4_49 = 0.001

			if var_4_48 <= arg_1_1.time_ and arg_1_1.time_ < var_4_48 + var_4_49 then
				local var_4_50 = (arg_1_1.time_ - var_4_48) / var_4_49
				local var_4_51 = Vector3.New(0.7, -0.71, -6)

				var_4_47.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1011ui_story, var_4_51, var_4_50)

				local var_4_52 = manager.ui.mainCamera.transform.position - var_4_47.position

				var_4_47.forward = Vector3.New(var_4_52.x, var_4_52.y, var_4_52.z)

				local var_4_53 = var_4_47.localEulerAngles

				var_4_53.z = 0
				var_4_53.x = 0
				var_4_47.localEulerAngles = var_4_53
			end

			if arg_1_1.time_ >= var_4_48 + var_4_49 and arg_1_1.time_ < var_4_48 + var_4_49 + arg_4_0 then
				var_4_47.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_4_54 = manager.ui.mainCamera.transform.position - var_4_47.position

				var_4_47.forward = Vector3.New(var_4_54.x, var_4_54.y, var_4_54.z)

				local var_4_55 = var_4_47.localEulerAngles

				var_4_55.z = 0
				var_4_55.x = 0
				var_4_47.localEulerAngles = var_4_55
			end

			local var_4_56 = arg_1_1.actors_["1011ui_story"]
			local var_4_57 = 2

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 and not isNil(var_4_56) and arg_1_1.var_.characterEffect1011ui_story == nil then
				arg_1_1.var_.characterEffect1011ui_story = var_4_56:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_58 = 0.200000002980232

			if var_4_57 <= arg_1_1.time_ and arg_1_1.time_ < var_4_57 + var_4_58 and not isNil(var_4_56) then
				local var_4_59 = (arg_1_1.time_ - var_4_57) / var_4_58

				if arg_1_1.var_.characterEffect1011ui_story and not isNil(var_4_56) then
					local var_4_60 = Mathf.Lerp(0, 0.5, var_4_59)

					arg_1_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_1_1.var_.characterEffect1011ui_story.fillRatio = var_4_60
				end
			end

			if arg_1_1.time_ >= var_4_57 + var_4_58 and arg_1_1.time_ < var_4_57 + var_4_58 + arg_4_0 and not isNil(var_4_56) and arg_1_1.var_.characterEffect1011ui_story then
				local var_4_61 = 0.5

				arg_1_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_1_1.var_.characterEffect1011ui_story.fillRatio = var_4_61
			end

			local var_4_62 = 0
			local var_4_63 = 0.3

			if var_4_62 < arg_1_1.time_ and arg_1_1.time_ <= var_4_62 + arg_4_0 then
				local var_4_64 = "play"
				local var_4_65 = "music"

				arg_1_1:AudioAction(var_4_64, var_4_65, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_66 = ""
				local var_4_67 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_67 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_67 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_67

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_67
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

			local var_4_68 = 0.533333333333333
			local var_4_69 = 1

			if var_4_68 < arg_1_1.time_ and arg_1_1.time_ <= var_4_68 + arg_4_0 then
				local var_4_70 = "play"
				local var_4_71 = "music"

				arg_1_1:AudioAction(var_4_70, var_4_71, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")

				local var_4_72 = ""
				local var_4_73 = manager.audio:GetAudioName("bgm_side_daily02", "bgm_side_daily02")

				if var_4_73 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_73 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_73

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_73
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

			local var_4_74 = 2

			if var_4_74 < arg_1_1.time_ and arg_1_1.time_ <= var_4_74 + arg_4_0 then
				arg_1_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_4_75 = 2

			if var_4_75 < arg_1_1.time_ and arg_1_1.time_ <= var_4_75 + arg_4_0 then
				arg_1_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_76 = 2
			local var_4_77 = 0.3

			if var_4_76 < arg_1_1.time_ and arg_1_1.time_ <= var_4_76 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_78 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_78:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_78:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_78:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_79 = arg_1_1:FormatText(StoryNameCfg[67].name)

				arg_1_1.leftNameTxt_.text = var_4_79

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_80 = arg_1_1:GetWordFromCfg(1101106001)
				local var_4_81 = arg_1_1:FormatText(var_4_80.content)

				arg_1_1.text_.text = var_4_81

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_82 = 12
				local var_4_83 = utf8.len(var_4_81)
				local var_4_84 = var_4_82 <= 0 and var_4_77 or var_4_77 * (var_4_83 / var_4_82)

				if var_4_84 > 0 and var_4_77 < var_4_84 then
					arg_1_1.talkMaxDuration = var_4_84
					var_4_76 = var_4_76 + 0.3

					if var_4_84 + var_4_76 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_84 + var_4_76
					end
				end

				arg_1_1.text_.text = var_4_81
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb") ~= 0 then
					local var_4_85 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb") / 1000

					if var_4_85 + var_4_76 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_85 + var_4_76
					end

					if var_4_80.prefab_name ~= "" and arg_1_1.actors_[var_4_80.prefab_name] ~= nil then
						local var_4_86 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_80.prefab_name].transform, "story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")

						arg_1_1:RecordAudio("1101106001", var_4_86)
						arg_1_1:RecordAudio("1101106001", var_4_86)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_87 = var_4_76 + 0.3
			local var_4_88 = math.max(var_4_77, arg_1_1.talkMaxDuration)

			if var_4_87 <= arg_1_1.time_ and arg_1_1.time_ < var_4_87 + var_4_88 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_87) / var_4_88

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_87 + var_4_88 and arg_1_1.time_ < var_4_87 + var_4_88 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 1101106002
		arg_9_1.duration_ = 5.97

		local var_9_0 = {
			zh = 5.033,
			ja = 5.966
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
				arg_9_0:Play1101106003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_12_1 = 0
			local var_12_2 = 0.65

			if var_12_1 < arg_9_1.time_ and arg_9_1.time_ <= var_12_1 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_3 = arg_9_1:FormatText(StoryNameCfg[67].name)

				arg_9_1.leftNameTxt_.text = var_12_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_4 = arg_9_1:GetWordFromCfg(1101106002)
				local var_12_5 = arg_9_1:FormatText(var_12_4.content)

				arg_9_1.text_.text = var_12_5

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_6 = 26
				local var_12_7 = utf8.len(var_12_5)
				local var_12_8 = var_12_6 <= 0 and var_12_2 or var_12_2 * (var_12_7 / var_12_6)

				if var_12_8 > 0 and var_12_2 < var_12_8 then
					arg_9_1.talkMaxDuration = var_12_8

					if var_12_8 + var_12_1 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_8 + var_12_1
					end
				end

				arg_9_1.text_.text = var_12_5
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb") ~= 0 then
					local var_12_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb") / 1000

					if var_12_9 + var_12_1 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_9 + var_12_1
					end

					if var_12_4.prefab_name ~= "" and arg_9_1.actors_[var_12_4.prefab_name] ~= nil then
						local var_12_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_4.prefab_name].transform, "story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")

						arg_9_1:RecordAudio("1101106002", var_12_10)
						arg_9_1:RecordAudio("1101106002", var_12_10)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_11 = math.max(var_12_2, arg_9_1.talkMaxDuration)

			if var_12_1 <= arg_9_1.time_ and arg_9_1.time_ < var_12_1 + var_12_11 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_1) / var_12_11

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_1 + var_12_11 and arg_9_1.time_ < var_12_1 + var_12_11 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 1101106003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play1101106004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["1111ui_story"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1111ui_story == nil then
				arg_13_1.var_.characterEffect1111ui_story = var_16_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_2 = 0.200000002980232

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 and not isNil(var_16_0) then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.characterEffect1111ui_story and not isNil(var_16_0) then
					local var_16_4 = Mathf.Lerp(0, 0.5, var_16_3)

					arg_13_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_13_1.var_.characterEffect1111ui_story.fillRatio = var_16_4
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and not isNil(var_16_0) and arg_13_1.var_.characterEffect1111ui_story then
				local var_16_5 = 0.5

				arg_13_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_13_1.var_.characterEffect1111ui_story.fillRatio = var_16_5
			end

			local var_16_6 = 0
			local var_16_7 = 0.85

			if var_16_6 < arg_13_1.time_ and arg_13_1.time_ <= var_16_6 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_8 = arg_13_1:GetWordFromCfg(1101106003)
				local var_16_9 = arg_13_1:FormatText(var_16_8.content)

				arg_13_1.text_.text = var_16_9

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_10 = 34
				local var_16_11 = utf8.len(var_16_9)
				local var_16_12 = var_16_10 <= 0 and var_16_7 or var_16_7 * (var_16_11 / var_16_10)

				if var_16_12 > 0 and var_16_7 < var_16_12 then
					arg_13_1.talkMaxDuration = var_16_12

					if var_16_12 + var_16_6 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_12 + var_16_6
					end
				end

				arg_13_1.text_.text = var_16_9
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_13 = math.max(var_16_7, arg_13_1.talkMaxDuration)

			if var_16_6 <= arg_13_1.time_ and arg_13_1.time_ < var_16_6 + var_16_13 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_6) / var_16_13

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_6 + var_16_13 and arg_13_1.time_ < var_16_6 + var_16_13 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 1101106004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play1101106005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.75

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[7].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_3 = arg_17_1:GetWordFromCfg(1101106004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 30
				local var_20_6 = utf8.len(var_20_4)
				local var_20_7 = var_20_5 <= 0 and var_20_1 or var_20_1 * (var_20_6 / var_20_5)

				if var_20_7 > 0 and var_20_1 < var_20_7 then
					arg_17_1.talkMaxDuration = var_20_7

					if var_20_7 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_7 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_4
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_8 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_8 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_8

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_8 and arg_17_1.time_ < var_20_0 + var_20_8 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 1101106005
		arg_21_1.duration_ = 2.97

		local var_21_0 = {
			zh = 1.999999999999,
			ja = 2.966
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play1101106006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["1111ui_story"].transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.moveOldPos1111ui_story = var_24_0.localPosition
			end

			local var_24_2 = 0.001

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / var_24_2
				local var_24_4 = Vector3.New(-0.79, -0.87, -5.7)

				var_24_0.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1111ui_story, var_24_4, var_24_3)

				local var_24_5 = manager.ui.mainCamera.transform.position - var_24_0.position

				var_24_0.forward = Vector3.New(var_24_5.x, var_24_5.y, var_24_5.z)

				local var_24_6 = var_24_0.localEulerAngles

				var_24_6.z = 0
				var_24_6.x = 0
				var_24_0.localEulerAngles = var_24_6
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 then
				var_24_0.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_24_7 = manager.ui.mainCamera.transform.position - var_24_0.position

				var_24_0.forward = Vector3.New(var_24_7.x, var_24_7.y, var_24_7.z)

				local var_24_8 = var_24_0.localEulerAngles

				var_24_8.z = 0
				var_24_8.x = 0
				var_24_0.localEulerAngles = var_24_8
			end

			local var_24_9 = arg_21_1.actors_["1111ui_story"]
			local var_24_10 = 0

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 and not isNil(var_24_9) and arg_21_1.var_.characterEffect1111ui_story == nil then
				arg_21_1.var_.characterEffect1111ui_story = var_24_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_24_11 = 0.200000002980232

			if var_24_10 <= arg_21_1.time_ and arg_21_1.time_ < var_24_10 + var_24_11 and not isNil(var_24_9) then
				local var_24_12 = (arg_21_1.time_ - var_24_10) / var_24_11

				if arg_21_1.var_.characterEffect1111ui_story and not isNil(var_24_9) then
					arg_21_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_21_1.time_ >= var_24_10 + var_24_11 and arg_21_1.time_ < var_24_10 + var_24_11 + arg_24_0 and not isNil(var_24_9) and arg_21_1.var_.characterEffect1111ui_story then
				arg_21_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_24_13 = 0

			if var_24_13 < arg_21_1.time_ and arg_21_1.time_ <= var_24_13 + arg_24_0 then
				arg_21_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action486")
			end

			local var_24_14 = 0

			if var_24_14 < arg_21_1.time_ and arg_21_1.time_ <= var_24_14 + arg_24_0 then
				arg_21_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_24_15 = 0
			local var_24_16 = 0.125

			if var_24_15 < arg_21_1.time_ and arg_21_1.time_ <= var_24_15 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_17 = arg_21_1:FormatText(StoryNameCfg[67].name)

				arg_21_1.leftNameTxt_.text = var_24_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_18 = arg_21_1:GetWordFromCfg(1101106005)
				local var_24_19 = arg_21_1:FormatText(var_24_18.content)

				arg_21_1.text_.text = var_24_19

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_20 = 5
				local var_24_21 = utf8.len(var_24_19)
				local var_24_22 = var_24_20 <= 0 and var_24_16 or var_24_16 * (var_24_21 / var_24_20)

				if var_24_22 > 0 and var_24_16 < var_24_22 then
					arg_21_1.talkMaxDuration = var_24_22

					if var_24_22 + var_24_15 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_22 + var_24_15
					end
				end

				arg_21_1.text_.text = var_24_19
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb") ~= 0 then
					local var_24_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb") / 1000

					if var_24_23 + var_24_15 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_23 + var_24_15
					end

					if var_24_18.prefab_name ~= "" and arg_21_1.actors_[var_24_18.prefab_name] ~= nil then
						local var_24_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_18.prefab_name].transform, "story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")

						arg_21_1:RecordAudio("1101106005", var_24_24)
						arg_21_1:RecordAudio("1101106005", var_24_24)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_25 = math.max(var_24_16, arg_21_1.talkMaxDuration)

			if var_24_15 <= arg_21_1.time_ and arg_21_1.time_ < var_24_15 + var_24_25 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_15) / var_24_25

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_15 + var_24_25 and arg_21_1.time_ < var_24_15 + var_24_25 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 1101106006
		arg_25_1.duration_ = 6.57

		local var_25_0 = {
			zh = 6.566,
			ja = 5.333
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play1101106007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["1011ui_story"].transform
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 then
				arg_25_1.var_.moveOldPos1011ui_story = var_28_0.localPosition
			end

			local var_28_2 = 0.001

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2
				local var_28_4 = Vector3.New(0.7, -0.71, -6)

				var_28_0.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1011ui_story, var_28_4, var_28_3)

				local var_28_5 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_5.x, var_28_5.y, var_28_5.z)

				local var_28_6 = var_28_0.localEulerAngles

				var_28_6.z = 0
				var_28_6.x = 0
				var_28_0.localEulerAngles = var_28_6
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 then
				var_28_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_28_7 = manager.ui.mainCamera.transform.position - var_28_0.position

				var_28_0.forward = Vector3.New(var_28_7.x, var_28_7.y, var_28_7.z)

				local var_28_8 = var_28_0.localEulerAngles

				var_28_8.z = 0
				var_28_8.x = 0
				var_28_0.localEulerAngles = var_28_8
			end

			local var_28_9 = arg_25_1.actors_["1011ui_story"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and not isNil(var_28_9) and arg_25_1.var_.characterEffect1011ui_story == nil then
				arg_25_1.var_.characterEffect1011ui_story = var_28_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_11 = 0.200000002980232

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 and not isNil(var_28_9) then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.characterEffect1011ui_story and not isNil(var_28_9) then
					arg_25_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and not isNil(var_28_9) and arg_25_1.var_.characterEffect1011ui_story then
				arg_25_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_28_13 = 0

			if var_28_13 < arg_25_1.time_ and arg_25_1.time_ <= var_28_13 + arg_28_0 then
				arg_25_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 then
				arg_25_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_15 = arg_25_1.actors_["1111ui_story"]
			local var_28_16 = 0

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 and not isNil(var_28_15) and arg_25_1.var_.characterEffect1111ui_story == nil then
				arg_25_1.var_.characterEffect1111ui_story = var_28_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_17 = 0.200000002980232

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_17 and not isNil(var_28_15) then
				local var_28_18 = (arg_25_1.time_ - var_28_16) / var_28_17

				if arg_25_1.var_.characterEffect1111ui_story and not isNil(var_28_15) then
					local var_28_19 = Mathf.Lerp(0, 0.5, var_28_18)

					arg_25_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_25_1.var_.characterEffect1111ui_story.fillRatio = var_28_19
				end
			end

			if arg_25_1.time_ >= var_28_16 + var_28_17 and arg_25_1.time_ < var_28_16 + var_28_17 + arg_28_0 and not isNil(var_28_15) and arg_25_1.var_.characterEffect1111ui_story then
				local var_28_20 = 0.5

				arg_25_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_25_1.var_.characterEffect1111ui_story.fillRatio = var_28_20
			end

			local var_28_21 = 0
			local var_28_22 = 0.7

			if var_28_21 < arg_25_1.time_ and arg_25_1.time_ <= var_28_21 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_23 = arg_25_1:FormatText(StoryNameCfg[37].name)

				arg_25_1.leftNameTxt_.text = var_28_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_24 = arg_25_1:GetWordFromCfg(1101106006)
				local var_28_25 = arg_25_1:FormatText(var_28_24.content)

				arg_25_1.text_.text = var_28_25

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_26 = 28
				local var_28_27 = utf8.len(var_28_25)
				local var_28_28 = var_28_26 <= 0 and var_28_22 or var_28_22 * (var_28_27 / var_28_26)

				if var_28_28 > 0 and var_28_22 < var_28_28 then
					arg_25_1.talkMaxDuration = var_28_28

					if var_28_28 + var_28_21 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_28 + var_28_21
					end
				end

				arg_25_1.text_.text = var_28_25
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb") ~= 0 then
					local var_28_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb") / 1000

					if var_28_29 + var_28_21 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_29 + var_28_21
					end

					if var_28_24.prefab_name ~= "" and arg_25_1.actors_[var_28_24.prefab_name] ~= nil then
						local var_28_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_24.prefab_name].transform, "story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")

						arg_25_1:RecordAudio("1101106006", var_28_30)
						arg_25_1:RecordAudio("1101106006", var_28_30)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_31 = math.max(var_28_22, arg_25_1.talkMaxDuration)

			if var_28_21 <= arg_25_1.time_ and arg_25_1.time_ < var_28_21 + var_28_31 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_21) / var_28_31

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_21 + var_28_31 and arg_25_1.time_ < var_28_21 + var_28_31 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 1101106007
		arg_29_1.duration_ = 2.83

		local var_29_0 = {
			zh = 2.833,
			ja = 1.999999999999
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play1101106008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1111ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1111ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(-0.79, -0.87, -5.7)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1111ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["1111ui_story"]
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 and not isNil(var_32_9) and arg_29_1.var_.characterEffect1111ui_story == nil then
				arg_29_1.var_.characterEffect1111ui_story = var_32_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_11 = 0.200000002980232

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 and not isNil(var_32_9) then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11

				if arg_29_1.var_.characterEffect1111ui_story and not isNil(var_32_9) then
					arg_29_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 and not isNil(var_32_9) and arg_29_1.var_.characterEffect1111ui_story then
				arg_29_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_32_13 = 0

			if var_32_13 < arg_29_1.time_ and arg_29_1.time_ <= var_32_13 + arg_32_0 then
				arg_29_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_2")
			end

			local var_32_14 = 0

			if var_32_14 < arg_29_1.time_ and arg_29_1.time_ <= var_32_14 + arg_32_0 then
				arg_29_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_32_15 = arg_29_1.actors_["1011ui_story"]
			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 and not isNil(var_32_15) and arg_29_1.var_.characterEffect1011ui_story == nil then
				arg_29_1.var_.characterEffect1011ui_story = var_32_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_17 = 0.200000002980232

			if var_32_16 <= arg_29_1.time_ and arg_29_1.time_ < var_32_16 + var_32_17 and not isNil(var_32_15) then
				local var_32_18 = (arg_29_1.time_ - var_32_16) / var_32_17

				if arg_29_1.var_.characterEffect1011ui_story and not isNil(var_32_15) then
					local var_32_19 = Mathf.Lerp(0, 0.5, var_32_18)

					arg_29_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1011ui_story.fillRatio = var_32_19
				end
			end

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 and not isNil(var_32_15) and arg_29_1.var_.characterEffect1011ui_story then
				local var_32_20 = 0.5

				arg_29_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1011ui_story.fillRatio = var_32_20
			end

			local var_32_21 = 0
			local var_32_22 = 0.275

			if var_32_21 < arg_29_1.time_ and arg_29_1.time_ <= var_32_21 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_23 = arg_29_1:FormatText(StoryNameCfg[67].name)

				arg_29_1.leftNameTxt_.text = var_32_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_24 = arg_29_1:GetWordFromCfg(1101106007)
				local var_32_25 = arg_29_1:FormatText(var_32_24.content)

				arg_29_1.text_.text = var_32_25

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_26 = 11
				local var_32_27 = utf8.len(var_32_25)
				local var_32_28 = var_32_26 <= 0 and var_32_22 or var_32_22 * (var_32_27 / var_32_26)

				if var_32_28 > 0 and var_32_22 < var_32_28 then
					arg_29_1.talkMaxDuration = var_32_28

					if var_32_28 + var_32_21 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_28 + var_32_21
					end
				end

				arg_29_1.text_.text = var_32_25
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb") ~= 0 then
					local var_32_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb") / 1000

					if var_32_29 + var_32_21 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_29 + var_32_21
					end

					if var_32_24.prefab_name ~= "" and arg_29_1.actors_[var_32_24.prefab_name] ~= nil then
						local var_32_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_24.prefab_name].transform, "story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")

						arg_29_1:RecordAudio("1101106007", var_32_30)
						arg_29_1:RecordAudio("1101106007", var_32_30)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_31 = math.max(var_32_22, arg_29_1.talkMaxDuration)

			if var_32_21 <= arg_29_1.time_ and arg_29_1.time_ < var_32_21 + var_32_31 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_21) / var_32_31

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_21 + var_32_31 and arg_29_1.time_ < var_32_21 + var_32_31 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 1101106008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play1101106009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1111ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and not isNil(var_36_0) and arg_33_1.var_.characterEffect1111ui_story == nil then
				arg_33_1.var_.characterEffect1111ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 and not isNil(var_36_0) then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1111ui_story and not isNil(var_36_0) then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1111ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and not isNil(var_36_0) and arg_33_1.var_.characterEffect1111ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1111ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.525

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[7].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(1101106008)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 21
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_14 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_14 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_14

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_14 and arg_33_1.time_ < var_36_6 + var_36_14 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 1101106009
		arg_37_1.duration_ = 7.17

		local var_37_0 = {
			zh = 4.9,
			ja = 7.166
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play1101106010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1111ui_story"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos1111ui_story = var_40_0.localPosition
			end

			local var_40_2 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2
				local var_40_4 = Vector3.New(-0.79, -0.87, -5.7)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1111ui_story, var_40_4, var_40_3)

				local var_40_5 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_5.x, var_40_5.y, var_40_5.z)

				local var_40_6 = var_40_0.localEulerAngles

				var_40_6.z = 0
				var_40_6.x = 0
				var_40_0.localEulerAngles = var_40_6
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_40_7 = manager.ui.mainCamera.transform.position - var_40_0.position

				var_40_0.forward = Vector3.New(var_40_7.x, var_40_7.y, var_40_7.z)

				local var_40_8 = var_40_0.localEulerAngles

				var_40_8.z = 0
				var_40_8.x = 0
				var_40_0.localEulerAngles = var_40_8
			end

			local var_40_9 = arg_37_1.actors_["1111ui_story"]
			local var_40_10 = 0

			if var_40_10 < arg_37_1.time_ and arg_37_1.time_ <= var_40_10 + arg_40_0 and not isNil(var_40_9) and arg_37_1.var_.characterEffect1111ui_story == nil then
				arg_37_1.var_.characterEffect1111ui_story = var_40_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_11 = 0.200000002980232

			if var_40_10 <= arg_37_1.time_ and arg_37_1.time_ < var_40_10 + var_40_11 and not isNil(var_40_9) then
				local var_40_12 = (arg_37_1.time_ - var_40_10) / var_40_11

				if arg_37_1.var_.characterEffect1111ui_story and not isNil(var_40_9) then
					arg_37_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_10 + var_40_11 and arg_37_1.time_ < var_40_10 + var_40_11 + arg_40_0 and not isNil(var_40_9) and arg_37_1.var_.characterEffect1111ui_story then
				arg_37_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_40_13 = 0

			if var_40_13 < arg_37_1.time_ and arg_37_1.time_ <= var_40_13 + arg_40_0 then
				arg_37_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 then
				arg_37_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_40_15 = 0
			local var_40_16 = 0.775

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[67].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(1101106009)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 18
				local var_40_21 = utf8.len(var_40_19)
				local var_40_22 = var_40_20 <= 0 and var_40_16 or var_40_16 * (var_40_21 / var_40_20)

				if var_40_22 > 0 and var_40_16 < var_40_22 then
					arg_37_1.talkMaxDuration = var_40_22

					if var_40_22 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_22 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_19
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")

						arg_37_1:RecordAudio("1101106009", var_40_24)
						arg_37_1:RecordAudio("1101106009", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_25 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_25 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_25

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_25 and arg_37_1.time_ < var_40_15 + var_40_25 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 1101106010
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play1101106011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1111ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and not isNil(var_44_0) and arg_41_1.var_.characterEffect1111ui_story == nil then
				arg_41_1.var_.characterEffect1111ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 and not isNil(var_44_0) then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1111ui_story and not isNil(var_44_0) then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1111ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and not isNil(var_44_0) and arg_41_1.var_.characterEffect1111ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1111ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 0.475

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_8 = arg_41_1:GetWordFromCfg(1101106010)
				local var_44_9 = arg_41_1:FormatText(var_44_8.content)

				arg_41_1.text_.text = var_44_9

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_10 = 19
				local var_44_11 = utf8.len(var_44_9)
				local var_44_12 = var_44_10 <= 0 and var_44_7 or var_44_7 * (var_44_11 / var_44_10)

				if var_44_12 > 0 and var_44_7 < var_44_12 then
					arg_41_1.talkMaxDuration = var_44_12

					if var_44_12 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_12 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_9
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_13 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_13 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_13

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_13 and arg_41_1.time_ < var_44_6 + var_44_13 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 1101106011
		arg_45_1.duration_ = 2

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play1101106012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1111ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1111ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(-0.79, -0.87, -5.7)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1111ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = arg_45_1.actors_["1111ui_story"]
			local var_48_10 = 0

			if var_48_10 < arg_45_1.time_ and arg_45_1.time_ <= var_48_10 + arg_48_0 and not isNil(var_48_9) and arg_45_1.var_.characterEffect1111ui_story == nil then
				arg_45_1.var_.characterEffect1111ui_story = var_48_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_11 = 0.200000002980232

			if var_48_10 <= arg_45_1.time_ and arg_45_1.time_ < var_48_10 + var_48_11 and not isNil(var_48_9) then
				local var_48_12 = (arg_45_1.time_ - var_48_10) / var_48_11

				if arg_45_1.var_.characterEffect1111ui_story and not isNil(var_48_9) then
					local var_48_13 = Mathf.Lerp(0, 0.5, var_48_12)

					arg_45_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1111ui_story.fillRatio = var_48_13
				end
			end

			if arg_45_1.time_ >= var_48_10 + var_48_11 and arg_45_1.time_ < var_48_10 + var_48_11 + arg_48_0 and not isNil(var_48_9) and arg_45_1.var_.characterEffect1111ui_story then
				local var_48_14 = 0.5

				arg_45_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1111ui_story.fillRatio = var_48_14
			end

			local var_48_15 = arg_45_1.actors_["1011ui_story"].transform
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.var_.moveOldPos1011ui_story = var_48_15.localPosition
			end

			local var_48_17 = 0.001

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17
				local var_48_19 = Vector3.New(0.7, -0.71, -6)

				var_48_15.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1011ui_story, var_48_19, var_48_18)

				local var_48_20 = manager.ui.mainCamera.transform.position - var_48_15.position

				var_48_15.forward = Vector3.New(var_48_20.x, var_48_20.y, var_48_20.z)

				local var_48_21 = var_48_15.localEulerAngles

				var_48_21.z = 0
				var_48_21.x = 0
				var_48_15.localEulerAngles = var_48_21
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 then
				var_48_15.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_48_22 = manager.ui.mainCamera.transform.position - var_48_15.position

				var_48_15.forward = Vector3.New(var_48_22.x, var_48_22.y, var_48_22.z)

				local var_48_23 = var_48_15.localEulerAngles

				var_48_23.z = 0
				var_48_23.x = 0
				var_48_15.localEulerAngles = var_48_23
			end

			local var_48_24 = arg_45_1.actors_["1011ui_story"]
			local var_48_25 = 0

			if var_48_25 < arg_45_1.time_ and arg_45_1.time_ <= var_48_25 + arg_48_0 and not isNil(var_48_24) and arg_45_1.var_.characterEffect1011ui_story == nil then
				arg_45_1.var_.characterEffect1011ui_story = var_48_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_26 = 0.200000002980232

			if var_48_25 <= arg_45_1.time_ and arg_45_1.time_ < var_48_25 + var_48_26 and not isNil(var_48_24) then
				local var_48_27 = (arg_45_1.time_ - var_48_25) / var_48_26

				if arg_45_1.var_.characterEffect1011ui_story and not isNil(var_48_24) then
					arg_45_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_25 + var_48_26 and arg_45_1.time_ < var_48_25 + var_48_26 + arg_48_0 and not isNil(var_48_24) and arg_45_1.var_.characterEffect1011ui_story then
				arg_45_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_48_28 = 0

			if var_48_28 < arg_45_1.time_ and arg_45_1.time_ <= var_48_28 + arg_48_0 then
				arg_45_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_48_29 = 0

			if var_48_29 < arg_45_1.time_ and arg_45_1.time_ <= var_48_29 + arg_48_0 then
				arg_45_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_48_30 = 0

			if var_48_30 < arg_45_1.time_ and arg_45_1.time_ <= var_48_30 + arg_48_0 then
				arg_45_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_48_31 = 0
			local var_48_32 = 0.075

			if var_48_31 < arg_45_1.time_ and arg_45_1.time_ <= var_48_31 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_33 = arg_45_1:FormatText(StoryNameCfg[37].name)

				arg_45_1.leftNameTxt_.text = var_48_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_34 = arg_45_1:GetWordFromCfg(1101106011)
				local var_48_35 = arg_45_1:FormatText(var_48_34.content)

				arg_45_1.text_.text = var_48_35

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_36 = 3
				local var_48_37 = utf8.len(var_48_35)
				local var_48_38 = var_48_36 <= 0 and var_48_32 or var_48_32 * (var_48_37 / var_48_36)

				if var_48_38 > 0 and var_48_32 < var_48_38 then
					arg_45_1.talkMaxDuration = var_48_38

					if var_48_38 + var_48_31 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_38 + var_48_31
					end
				end

				arg_45_1.text_.text = var_48_35
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb") ~= 0 then
					local var_48_39 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb") / 1000

					if var_48_39 + var_48_31 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_39 + var_48_31
					end

					if var_48_34.prefab_name ~= "" and arg_45_1.actors_[var_48_34.prefab_name] ~= nil then
						local var_48_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_34.prefab_name].transform, "story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")

						arg_45_1:RecordAudio("1101106011", var_48_40)
						arg_45_1:RecordAudio("1101106011", var_48_40)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_41 = math.max(var_48_32, arg_45_1.talkMaxDuration)

			if var_48_31 <= arg_45_1.time_ and arg_45_1.time_ < var_48_31 + var_48_41 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_31) / var_48_41

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_31 + var_48_41 and arg_45_1.time_ < var_48_31 + var_48_41 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 1101106012
		arg_49_1.duration_ = 2.6

		local var_49_0 = {
			zh = 1.999999999999,
			ja = 2.6
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play1101106013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1111ui_story"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos1111ui_story = var_52_0.localPosition
			end

			local var_52_2 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2
				local var_52_4 = Vector3.New(-0.79, -0.87, -5.7)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1111ui_story, var_52_4, var_52_3)

				local var_52_5 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_5.x, var_52_5.y, var_52_5.z)

				local var_52_6 = var_52_0.localEulerAngles

				var_52_6.z = 0
				var_52_6.x = 0
				var_52_0.localEulerAngles = var_52_6
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(-0.79, -0.87, -5.7)

				local var_52_7 = manager.ui.mainCamera.transform.position - var_52_0.position

				var_52_0.forward = Vector3.New(var_52_7.x, var_52_7.y, var_52_7.z)

				local var_52_8 = var_52_0.localEulerAngles

				var_52_8.z = 0
				var_52_8.x = 0
				var_52_0.localEulerAngles = var_52_8
			end

			local var_52_9 = arg_49_1.actors_["1111ui_story"]
			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 and not isNil(var_52_9) and arg_49_1.var_.characterEffect1111ui_story == nil then
				arg_49_1.var_.characterEffect1111ui_story = var_52_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_11 = 0.200000002980232

			if var_52_10 <= arg_49_1.time_ and arg_49_1.time_ < var_52_10 + var_52_11 and not isNil(var_52_9) then
				local var_52_12 = (arg_49_1.time_ - var_52_10) / var_52_11

				if arg_49_1.var_.characterEffect1111ui_story and not isNil(var_52_9) then
					arg_49_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_10 + var_52_11 and arg_49_1.time_ < var_52_10 + var_52_11 + arg_52_0 and not isNil(var_52_9) and arg_49_1.var_.characterEffect1111ui_story then
				arg_49_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_52_13 = 0

			if var_52_13 < arg_49_1.time_ and arg_49_1.time_ <= var_52_13 + arg_52_0 then
				arg_49_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_52_14 = arg_49_1.actors_["1011ui_story"]
			local var_52_15 = 0

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 and not isNil(var_52_14) and arg_49_1.var_.characterEffect1011ui_story == nil then
				arg_49_1.var_.characterEffect1011ui_story = var_52_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_16 = 0.200000002980232

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_16 and not isNil(var_52_14) then
				local var_52_17 = (arg_49_1.time_ - var_52_15) / var_52_16

				if arg_49_1.var_.characterEffect1011ui_story and not isNil(var_52_14) then
					local var_52_18 = Mathf.Lerp(0, 0.5, var_52_17)

					arg_49_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_49_1.var_.characterEffect1011ui_story.fillRatio = var_52_18
				end
			end

			if arg_49_1.time_ >= var_52_15 + var_52_16 and arg_49_1.time_ < var_52_15 + var_52_16 + arg_52_0 and not isNil(var_52_14) and arg_49_1.var_.characterEffect1011ui_story then
				local var_52_19 = 0.5

				arg_49_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_49_1.var_.characterEffect1011ui_story.fillRatio = var_52_19
			end

			local var_52_20 = 0
			local var_52_21 = 0.125

			if var_52_20 < arg_49_1.time_ and arg_49_1.time_ <= var_52_20 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_22 = arg_49_1:FormatText(StoryNameCfg[67].name)

				arg_49_1.leftNameTxt_.text = var_52_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_23 = arg_49_1:GetWordFromCfg(1101106012)
				local var_52_24 = arg_49_1:FormatText(var_52_23.content)

				arg_49_1.text_.text = var_52_24

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_25 = 5
				local var_52_26 = utf8.len(var_52_24)
				local var_52_27 = var_52_25 <= 0 and var_52_21 or var_52_21 * (var_52_26 / var_52_25)

				if var_52_27 > 0 and var_52_21 < var_52_27 then
					arg_49_1.talkMaxDuration = var_52_27

					if var_52_27 + var_52_20 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_27 + var_52_20
					end
				end

				arg_49_1.text_.text = var_52_24
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb") ~= 0 then
					local var_52_28 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb") / 1000

					if var_52_28 + var_52_20 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_28 + var_52_20
					end

					if var_52_23.prefab_name ~= "" and arg_49_1.actors_[var_52_23.prefab_name] ~= nil then
						local var_52_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_23.prefab_name].transform, "story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")

						arg_49_1:RecordAudio("1101106012", var_52_29)
						arg_49_1:RecordAudio("1101106012", var_52_29)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_30 = math.max(var_52_21, arg_49_1.talkMaxDuration)

			if var_52_20 <= arg_49_1.time_ and arg_49_1.time_ < var_52_20 + var_52_30 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_20) / var_52_30

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_20 + var_52_30 and arg_49_1.time_ < var_52_20 + var_52_30 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 1101106013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play1101106014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1011ui_story"].transform
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 then
				arg_53_1.var_.moveOldPos1011ui_story = var_56_0.localPosition
			end

			local var_56_2 = 0.001

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2
				local var_56_4 = Vector3.New(0.7, -0.71, -6)

				var_56_0.localPosition = Vector3.Lerp(arg_53_1.var_.moveOldPos1011ui_story, var_56_4, var_56_3)

				local var_56_5 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_5.x, var_56_5.y, var_56_5.z)

				local var_56_6 = var_56_0.localEulerAngles

				var_56_6.z = 0
				var_56_6.x = 0
				var_56_0.localEulerAngles = var_56_6
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 then
				var_56_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_56_7 = manager.ui.mainCamera.transform.position - var_56_0.position

				var_56_0.forward = Vector3.New(var_56_7.x, var_56_7.y, var_56_7.z)

				local var_56_8 = var_56_0.localEulerAngles

				var_56_8.z = 0
				var_56_8.x = 0
				var_56_0.localEulerAngles = var_56_8
			end

			local var_56_9 = arg_53_1.actors_["1111ui_story"]
			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 and not isNil(var_56_9) and arg_53_1.var_.characterEffect1111ui_story == nil then
				arg_53_1.var_.characterEffect1111ui_story = var_56_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_11 = 0.200000002980232

			if var_56_10 <= arg_53_1.time_ and arg_53_1.time_ < var_56_10 + var_56_11 and not isNil(var_56_9) then
				local var_56_12 = (arg_53_1.time_ - var_56_10) / var_56_11

				if arg_53_1.var_.characterEffect1111ui_story and not isNil(var_56_9) then
					local var_56_13 = Mathf.Lerp(0, 0.5, var_56_12)

					arg_53_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1111ui_story.fillRatio = var_56_13
				end
			end

			if arg_53_1.time_ >= var_56_10 + var_56_11 and arg_53_1.time_ < var_56_10 + var_56_11 + arg_56_0 and not isNil(var_56_9) and arg_53_1.var_.characterEffect1111ui_story then
				local var_56_14 = 0.5

				arg_53_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1111ui_story.fillRatio = var_56_14
			end

			local var_56_15 = 0

			if var_56_15 < arg_53_1.time_ and arg_53_1.time_ <= var_56_15 + arg_56_0 then
				arg_53_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_56_16 = 0
			local var_56_17 = 0.25

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_18 = arg_53_1:FormatText(StoryNameCfg[7].name)

				arg_53_1.leftNameTxt_.text = var_56_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_19 = arg_53_1:GetWordFromCfg(1101106013)
				local var_56_20 = arg_53_1:FormatText(var_56_19.content)

				arg_53_1.text_.text = var_56_20

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_21 = 10
				local var_56_22 = utf8.len(var_56_20)
				local var_56_23 = var_56_21 <= 0 and var_56_17 or var_56_17 * (var_56_22 / var_56_21)

				if var_56_23 > 0 and var_56_17 < var_56_23 then
					arg_53_1.talkMaxDuration = var_56_23

					if var_56_23 + var_56_16 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_16
					end
				end

				arg_53_1.text_.text = var_56_20
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_24 = math.max(var_56_17, arg_53_1.talkMaxDuration)

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_24 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_16) / var_56_24

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_16 + var_56_24 and arg_53_1.time_ < var_56_16 + var_56_24 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 1101106014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play1101106015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_2")
			end

			local var_60_2 = 0
			local var_60_3 = 0.925

			if var_60_2 < arg_57_1.time_ and arg_57_1.time_ <= var_60_2 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_4 = arg_57_1:GetWordFromCfg(1101106014)
				local var_60_5 = arg_57_1:FormatText(var_60_4.content)

				arg_57_1.text_.text = var_60_5

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_6 = 37
				local var_60_7 = utf8.len(var_60_5)
				local var_60_8 = var_60_6 <= 0 and var_60_3 or var_60_3 * (var_60_7 / var_60_6)

				if var_60_8 > 0 and var_60_3 < var_60_8 then
					arg_57_1.talkMaxDuration = var_60_8

					if var_60_8 + var_60_2 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_8 + var_60_2
					end
				end

				arg_57_1.text_.text = var_60_5
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_9 = math.max(var_60_3, arg_57_1.talkMaxDuration)

			if var_60_2 <= arg_57_1.time_ and arg_57_1.time_ < var_60_2 + var_60_9 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_2) / var_60_9

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_2 + var_60_9 and arg_57_1.time_ < var_60_2 + var_60_9 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 1101106015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play1101106016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.55

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_2 = arg_61_1:GetWordFromCfg(1101106015)
				local var_64_3 = arg_61_1:FormatText(var_64_2.content)

				arg_61_1.text_.text = var_64_3

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_4 = 22
				local var_64_5 = utf8.len(var_64_3)
				local var_64_6 = var_64_4 <= 0 and var_64_1 or var_64_1 * (var_64_5 / var_64_4)

				if var_64_6 > 0 and var_64_1 < var_64_6 then
					arg_61_1.talkMaxDuration = var_64_6

					if var_64_6 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_6 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_3
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_7 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_7 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_7

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_7 and arg_61_1.time_ < var_64_0 + var_64_7 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 1101106016
		arg_65_1.duration_ = 4.35

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play1101106017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = "STblack"

			if arg_65_1.bgs_[var_68_0] == nil then
				local var_68_1 = Object.Instantiate(arg_65_1.paintGo_)

				var_68_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_68_0)
				var_68_1.name = var_68_0
				var_68_1.transform.parent = arg_65_1.stage_.transform
				var_68_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_65_1.bgs_[var_68_0] = var_68_1
			end

			local var_68_2 = 2

			if var_68_2 < arg_65_1.time_ and arg_65_1.time_ <= var_68_2 + arg_68_0 then
				local var_68_3 = manager.ui.mainCamera.transform.localPosition
				local var_68_4 = Vector3.New(0, 0, 10) + Vector3.New(var_68_3.x, var_68_3.y, 0)
				local var_68_5 = arg_65_1.bgs_.STblack

				var_68_5.transform.localPosition = var_68_4
				var_68_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_68_6 = var_68_5:GetComponent("SpriteRenderer")

				if var_68_6 and var_68_6.sprite then
					local var_68_7 = (var_68_5.transform.localPosition - var_68_3).z
					local var_68_8 = manager.ui.mainCameraCom_
					local var_68_9 = 2 * var_68_7 * Mathf.Tan(var_68_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_68_10 = var_68_9 * var_68_8.aspect
					local var_68_11 = var_68_6.sprite.bounds.size.x
					local var_68_12 = var_68_6.sprite.bounds.size.y
					local var_68_13 = var_68_10 / var_68_11
					local var_68_14 = var_68_9 / var_68_12
					local var_68_15 = var_68_14 < var_68_13 and var_68_13 or var_68_14

					var_68_5.transform.localScale = Vector3.New(var_68_15, var_68_15, 0)
				end

				for iter_68_0, iter_68_1 in pairs(arg_65_1.bgs_) do
					if iter_68_0 ~= "STblack" then
						iter_68_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_68_16 = 0

			if var_68_16 < arg_65_1.time_ and arg_65_1.time_ <= var_68_16 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_17 = 2

			if var_68_16 <= arg_65_1.time_ and arg_65_1.time_ < var_68_16 + var_68_17 then
				local var_68_18 = (arg_65_1.time_ - var_68_16) / var_68_17
				local var_68_19 = Color.New(0, 0, 0)

				var_68_19.a = Mathf.Lerp(0, 1, var_68_18)
				arg_65_1.mask_.color = var_68_19
			end

			if arg_65_1.time_ >= var_68_16 + var_68_17 and arg_65_1.time_ < var_68_16 + var_68_17 + arg_68_0 then
				local var_68_20 = Color.New(0, 0, 0)

				var_68_20.a = 1
				arg_65_1.mask_.color = var_68_20
			end

			local var_68_21 = 2

			if var_68_21 < arg_65_1.time_ and arg_65_1.time_ <= var_68_21 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_22 = 2

			if var_68_21 <= arg_65_1.time_ and arg_65_1.time_ < var_68_21 + var_68_22 then
				local var_68_23 = (arg_65_1.time_ - var_68_21) / var_68_22
				local var_68_24 = Color.New(0, 0, 0)

				var_68_24.a = Mathf.Lerp(1, 0, var_68_23)
				arg_65_1.mask_.color = var_68_24
			end

			if arg_65_1.time_ >= var_68_21 + var_68_22 and arg_65_1.time_ < var_68_21 + var_68_22 + arg_68_0 then
				local var_68_25 = Color.New(0, 0, 0)
				local var_68_26 = 0

				arg_65_1.mask_.enabled = false
				var_68_25.a = var_68_26
				arg_65_1.mask_.color = var_68_25
			end

			local var_68_27 = 2

			if var_68_27 < arg_65_1.time_ and arg_65_1.time_ <= var_68_27 + arg_68_0 then
				arg_65_1.fswbg_:SetActive(true)
				arg_65_1.dialog_:SetActive(false)

				arg_65_1.fswtw_.percent = 0

				local var_68_28 = arg_65_1:GetWordFromCfg(1101106016)
				local var_68_29 = arg_65_1:FormatText(var_68_28.content)

				arg_65_1.fswt_.text = var_68_29

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.fswt_)

				arg_65_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_65_1.fswtw_:SetDirty()

				arg_65_1.typewritterCharCountI18N = 0
				arg_65_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_65_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_65_1:ShowNextGo(false)
			end

			local var_68_30 = 4.01666666666667

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.var_.oldValueTypewriter = arg_65_1.fswtw_.percent
				arg_65_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_65_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, true)
				arg_65_1:ShowNextGo(false)
			end

			local var_68_31 = 5
			local var_68_32 = 0.333333333333333
			local var_68_33 = arg_65_1:GetWordFromCfg(1101106016)
			local var_68_34 = arg_65_1:FormatText(var_68_33.content)
			local var_68_35, var_68_36 = arg_65_1:GetPercentByPara(var_68_34, 1)

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				local var_68_37 = var_68_31 <= 0 and var_68_32 or var_68_32 * ((var_68_36 - arg_65_1.typewritterCharCountI18N) / var_68_31)

				if var_68_37 > 0 and var_68_32 < var_68_37 then
					arg_65_1.talkMaxDuration = var_68_37

					if var_68_37 + var_68_30 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_37 + var_68_30
					end
				end
			end

			local var_68_38 = 0.333333333333333
			local var_68_39 = math.max(var_68_38, arg_65_1.talkMaxDuration)

			if var_68_30 <= arg_65_1.time_ and arg_65_1.time_ < var_68_30 + var_68_39 then
				local var_68_40 = (arg_65_1.time_ - var_68_30) / var_68_39

				arg_65_1.fswtw_.percent = Mathf.Lerp(arg_65_1.var_.oldValueTypewriter, var_68_35, var_68_40)
				arg_65_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_65_1.fswtw_:SetDirty()
			end

			if arg_65_1.time_ >= var_68_30 + var_68_39 and arg_65_1.time_ < var_68_30 + var_68_39 + arg_68_0 then
				arg_65_1.fswtw_.percent = var_68_35

				arg_65_1.fswtw_:SetDirty()
				arg_65_1:ShowNextGo(true)

				arg_65_1.typewritterCharCountI18N = var_68_36
			end

			local var_68_41 = 4

			if var_68_41 < arg_65_1.time_ and arg_65_1.time_ <= var_68_41 + arg_68_0 then
				local var_68_42 = arg_65_1.fswbg_.transform:Find("textbox/adapt/content") or arg_65_1.fswbg_.transform:Find("textbox/content")

				arg_65_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				local var_68_43 = var_68_42:GetComponent("Text")
				local var_68_44 = var_68_42:GetComponent("RectTransform")

				var_68_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_68_44.offsetMin = Vector2.New(0, 0)
				var_68_44.offsetMax = Vector2.New(0, 0)
			end

			local var_68_45 = arg_65_1.actors_["1111ui_story"].transform
			local var_68_46 = 2

			if var_68_46 < arg_65_1.time_ and arg_65_1.time_ <= var_68_46 + arg_68_0 then
				arg_65_1.var_.moveOldPos1111ui_story = var_68_45.localPosition
			end

			local var_68_47 = 0.001

			if var_68_46 <= arg_65_1.time_ and arg_65_1.time_ < var_68_46 + var_68_47 then
				local var_68_48 = (arg_65_1.time_ - var_68_46) / var_68_47
				local var_68_49 = Vector3.New(0, 100, 0)

				var_68_45.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1111ui_story, var_68_49, var_68_48)

				local var_68_50 = manager.ui.mainCamera.transform.position - var_68_45.position

				var_68_45.forward = Vector3.New(var_68_50.x, var_68_50.y, var_68_50.z)

				local var_68_51 = var_68_45.localEulerAngles

				var_68_51.z = 0
				var_68_51.x = 0
				var_68_45.localEulerAngles = var_68_51
			end

			if arg_65_1.time_ >= var_68_46 + var_68_47 and arg_65_1.time_ < var_68_46 + var_68_47 + arg_68_0 then
				var_68_45.localPosition = Vector3.New(0, 100, 0)

				local var_68_52 = manager.ui.mainCamera.transform.position - var_68_45.position

				var_68_45.forward = Vector3.New(var_68_52.x, var_68_52.y, var_68_52.z)

				local var_68_53 = var_68_45.localEulerAngles

				var_68_53.z = 0
				var_68_53.x = 0
				var_68_45.localEulerAngles = var_68_53
			end

			local var_68_54 = arg_65_1.actors_["1011ui_story"].transform
			local var_68_55 = 2

			if var_68_55 < arg_65_1.time_ and arg_65_1.time_ <= var_68_55 + arg_68_0 then
				arg_65_1.var_.moveOldPos1011ui_story = var_68_54.localPosition
			end

			local var_68_56 = 0.001

			if var_68_55 <= arg_65_1.time_ and arg_65_1.time_ < var_68_55 + var_68_56 then
				local var_68_57 = (arg_65_1.time_ - var_68_55) / var_68_56
				local var_68_58 = Vector3.New(0, 100, 0)

				var_68_54.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1011ui_story, var_68_58, var_68_57)

				local var_68_59 = manager.ui.mainCamera.transform.position - var_68_54.position

				var_68_54.forward = Vector3.New(var_68_59.x, var_68_59.y, var_68_59.z)

				local var_68_60 = var_68_54.localEulerAngles

				var_68_60.z = 0
				var_68_60.x = 0
				var_68_54.localEulerAngles = var_68_60
			end

			if arg_65_1.time_ >= var_68_55 + var_68_56 and arg_65_1.time_ < var_68_55 + var_68_56 + arg_68_0 then
				var_68_54.localPosition = Vector3.New(0, 100, 0)

				local var_68_61 = manager.ui.mainCamera.transform.position - var_68_54.position

				var_68_54.forward = Vector3.New(var_68_61.x, var_68_61.y, var_68_61.z)

				local var_68_62 = var_68_54.localEulerAngles

				var_68_62.z = 0
				var_68_62.x = 0
				var_68_54.localEulerAngles = var_68_62
			end
		end
	end,
	Play1101106017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1101106017
		arg_69_1.duration_ = 6.83

		local var_69_0 = {
			zh = 5.933,
			ja = 6.833
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
				arg_69_0:Play1101106018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "ST18"

			if arg_69_1.bgs_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(arg_69_1.paintGo_)

				var_72_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_72_0)
				var_72_1.name = var_72_0
				var_72_1.transform.parent = arg_69_1.stage_.transform
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.bgs_[var_72_0] = var_72_1
			end

			local var_72_2 = 0

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 then
				local var_72_3 = manager.ui.mainCamera.transform.localPosition
				local var_72_4 = Vector3.New(0, 0, 10) + Vector3.New(var_72_3.x, var_72_3.y, 0)
				local var_72_5 = arg_69_1.bgs_.ST18

				var_72_5.transform.localPosition = var_72_4
				var_72_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_6 = var_72_5:GetComponent("SpriteRenderer")

				if var_72_6 and var_72_6.sprite then
					local var_72_7 = (var_72_5.transform.localPosition - var_72_3).z
					local var_72_8 = manager.ui.mainCameraCom_
					local var_72_9 = 2 * var_72_7 * Mathf.Tan(var_72_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_10 = var_72_9 * var_72_8.aspect
					local var_72_11 = var_72_6.sprite.bounds.size.x
					local var_72_12 = var_72_6.sprite.bounds.size.y
					local var_72_13 = var_72_10 / var_72_11
					local var_72_14 = var_72_9 / var_72_12
					local var_72_15 = var_72_14 < var_72_13 and var_72_13 or var_72_14

					var_72_5.transform.localScale = Vector3.New(var_72_15, var_72_15, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "ST18" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_17 = 2

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_17 then
				local var_72_18 = (arg_69_1.time_ - var_72_16) / var_72_17
				local var_72_19 = Color.New(0, 0, 0)

				var_72_19.a = Mathf.Lerp(1, 0, var_72_18)
				arg_69_1.mask_.color = var_72_19
			end

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 then
				local var_72_20 = Color.New(0, 0, 0)
				local var_72_21 = 0

				arg_69_1.mask_.enabled = false
				var_72_20.a = var_72_21
				arg_69_1.mask_.color = var_72_20
			end

			local var_72_22 = "1033ui_story"

			if arg_69_1.actors_[var_72_22] == nil then
				local var_72_23 = Asset.Load("Char/" .. "1033ui_story")

				if not isNil(var_72_23) then
					local var_72_24 = Object.Instantiate(Asset.Load("Char/" .. "1033ui_story"), arg_69_1.stage_.transform)

					var_72_24.name = var_72_22
					var_72_24.transform.localPosition = Vector3.New(0, 100, 0)
					arg_69_1.actors_[var_72_22] = var_72_24

					local var_72_25 = var_72_24:GetComponentInChildren(typeof(CharacterEffect))

					var_72_25.enabled = true

					local var_72_26 = GameObjectTools.GetOrAddComponent(var_72_24, typeof(DynamicBoneHelper))

					if var_72_26 then
						var_72_26:EnableDynamicBone(false)
					end

					arg_69_1:ShowWeapon(var_72_25.transform, false)

					arg_69_1.var_[var_72_22 .. "Animator"] = var_72_25.gameObject:GetComponent(typeof(UnityEngine.Animator))
					arg_69_1.var_[var_72_22 .. "Animator"].applyRootMotion = true
					arg_69_1.var_[var_72_22 .. "LipSync"] = var_72_25.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
				end
			end

			local var_72_27 = arg_69_1.actors_["1033ui_story"].transform
			local var_72_28 = 2

			if var_72_28 < arg_69_1.time_ and arg_69_1.time_ <= var_72_28 + arg_72_0 then
				arg_69_1.var_.moveOldPos1033ui_story = var_72_27.localPosition
			end

			local var_72_29 = 0.001

			if var_72_28 <= arg_69_1.time_ and arg_69_1.time_ < var_72_28 + var_72_29 then
				local var_72_30 = (arg_69_1.time_ - var_72_28) / var_72_29
				local var_72_31 = Vector3.New(0, -1.01, -6.13)

				var_72_27.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1033ui_story, var_72_31, var_72_30)

				local var_72_32 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_32.x, var_72_32.y, var_72_32.z)

				local var_72_33 = var_72_27.localEulerAngles

				var_72_33.z = 0
				var_72_33.x = 0
				var_72_27.localEulerAngles = var_72_33
			end

			if arg_69_1.time_ >= var_72_28 + var_72_29 and arg_69_1.time_ < var_72_28 + var_72_29 + arg_72_0 then
				var_72_27.localPosition = Vector3.New(0, -1.01, -6.13)

				local var_72_34 = manager.ui.mainCamera.transform.position - var_72_27.position

				var_72_27.forward = Vector3.New(var_72_34.x, var_72_34.y, var_72_34.z)

				local var_72_35 = var_72_27.localEulerAngles

				var_72_35.z = 0
				var_72_35.x = 0
				var_72_27.localEulerAngles = var_72_35
			end

			local var_72_36 = arg_69_1.actors_["1033ui_story"]
			local var_72_37 = 2

			if var_72_37 < arg_69_1.time_ and arg_69_1.time_ <= var_72_37 + arg_72_0 and not isNil(var_72_36) and arg_69_1.var_.characterEffect1033ui_story == nil then
				arg_69_1.var_.characterEffect1033ui_story = var_72_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_38 = 0.200000002980232

			if var_72_37 <= arg_69_1.time_ and arg_69_1.time_ < var_72_37 + var_72_38 and not isNil(var_72_36) then
				local var_72_39 = (arg_69_1.time_ - var_72_37) / var_72_38

				if arg_69_1.var_.characterEffect1033ui_story and not isNil(var_72_36) then
					arg_69_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_37 + var_72_38 and arg_69_1.time_ < var_72_37 + var_72_38 + arg_72_0 and not isNil(var_72_36) and arg_69_1.var_.characterEffect1033ui_story then
				arg_69_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_72_40 = 2

			if var_72_40 < arg_69_1.time_ and arg_69_1.time_ <= var_72_40 + arg_72_0 then
				arg_69_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action3_1")
			end

			local var_72_41 = 2

			if var_72_41 < arg_69_1.time_ and arg_69_1.time_ <= var_72_41 + arg_72_0 then
				arg_69_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_72_42 = 0

			if var_72_42 < arg_69_1.time_ and arg_69_1.time_ <= var_72_42 + arg_72_0 then
				arg_69_1.fswbg_:SetActive(false)
				arg_69_1.dialog_:SetActive(false)

				arg_69_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_69_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_69_1:ShowNextGo(false)
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_43 = 2
			local var_72_44 = 0.475

			if var_72_43 < arg_69_1.time_ and arg_69_1.time_ <= var_72_43 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_45 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_45:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_46 = arg_69_1:FormatText(StoryNameCfg[236].name)

				arg_69_1.leftNameTxt_.text = var_72_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_47 = arg_69_1:GetWordFromCfg(1101106017)
				local var_72_48 = arg_69_1:FormatText(var_72_47.content)

				arg_69_1.text_.text = var_72_48

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_49 = 19
				local var_72_50 = utf8.len(var_72_48)
				local var_72_51 = var_72_49 <= 0 and var_72_44 or var_72_44 * (var_72_50 / var_72_49)

				if var_72_51 > 0 and var_72_44 < var_72_51 then
					arg_69_1.talkMaxDuration = var_72_51
					var_72_43 = var_72_43 + 0.3

					if var_72_51 + var_72_43 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_51 + var_72_43
					end
				end

				arg_69_1.text_.text = var_72_48
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb") ~= 0 then
					local var_72_52 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb") / 1000

					if var_72_52 + var_72_43 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_52 + var_72_43
					end

					if var_72_47.prefab_name ~= "" and arg_69_1.actors_[var_72_47.prefab_name] ~= nil then
						local var_72_53 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_47.prefab_name].transform, "story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")

						arg_69_1:RecordAudio("1101106017", var_72_53)
						arg_69_1:RecordAudio("1101106017", var_72_53)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_54 = var_72_43 + 0.3
			local var_72_55 = math.max(var_72_44, arg_69_1.talkMaxDuration)

			if var_72_54 <= arg_69_1.time_ and arg_69_1.time_ < var_72_54 + var_72_55 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_54) / var_72_55

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_54 + var_72_55 and arg_69_1.time_ < var_72_54 + var_72_55 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 1101106018
		arg_75_1.duration_ = 14.1

		local var_75_0 = {
			zh = 9.8,
			ja = 14.1
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
				arg_75_0:Play1101106019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.25

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[236].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(1101106018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")

						arg_75_1:RecordAudio("1101106018", var_78_9)
						arg_75_1:RecordAudio("1101106018", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")
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
	Play1101106019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 1101106019
		arg_79_1.duration_ = 12.53

		local var_79_0 = {
			zh = 12.533,
			ja = 9.5
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
				arg_79_0:Play1101106020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 1.65

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[236].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(1101106019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 66
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")

						arg_79_1:RecordAudio("1101106019", var_82_9)
						arg_79_1:RecordAudio("1101106019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 1101106020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play1101106021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1033ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and not isNil(var_86_0) and arg_83_1.var_.characterEffect1033ui_story == nil then
				arg_83_1.var_.characterEffect1033ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 and not isNil(var_86_0) then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1033ui_story and not isNil(var_86_0) then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1033ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and not isNil(var_86_0) and arg_83_1.var_.characterEffect1033ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1033ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.6

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_8 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_9 = arg_83_1:GetWordFromCfg(1101106020)
				local var_86_10 = arg_83_1:FormatText(var_86_9.content)

				arg_83_1.text_.text = var_86_10

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_11 = 24
				local var_86_12 = utf8.len(var_86_10)
				local var_86_13 = var_86_11 <= 0 and var_86_7 or var_86_7 * (var_86_12 / var_86_11)

				if var_86_13 > 0 and var_86_7 < var_86_13 then
					arg_83_1.talkMaxDuration = var_86_13

					if var_86_13 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_13 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_10
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_14 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_14 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_14

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_14 and arg_83_1.time_ < var_86_6 + var_86_14 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 1101106021
		arg_87_1.duration_ = 6.73

		local var_87_0 = {
			zh = 5.833,
			ja = 6.733
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
				arg_87_0:Play1101106022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1033ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1033ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, -1.01, -6.13)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1033ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, -1.01, -6.13)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = arg_87_1.actors_["1033ui_story"]
			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 and not isNil(var_90_9) and arg_87_1.var_.characterEffect1033ui_story == nil then
				arg_87_1.var_.characterEffect1033ui_story = var_90_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_11 = 0.200000002980232

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_11 and not isNil(var_90_9) then
				local var_90_12 = (arg_87_1.time_ - var_90_10) / var_90_11

				if arg_87_1.var_.characterEffect1033ui_story and not isNil(var_90_9) then
					arg_87_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_10 + var_90_11 and arg_87_1.time_ < var_90_10 + var_90_11 + arg_90_0 and not isNil(var_90_9) and arg_87_1.var_.characterEffect1033ui_story then
				arg_87_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_90_13 = 0

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action3_2")
			end

			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 then
				arg_87_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_90_15 = 0
			local var_90_16 = 0.75

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_17 = arg_87_1:FormatText(StoryNameCfg[236].name)

				arg_87_1.leftNameTxt_.text = var_90_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_18 = arg_87_1:GetWordFromCfg(1101106021)
				local var_90_19 = arg_87_1:FormatText(var_90_18.content)

				arg_87_1.text_.text = var_90_19

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_20 = 30
				local var_90_21 = utf8.len(var_90_19)
				local var_90_22 = var_90_20 <= 0 and var_90_16 or var_90_16 * (var_90_21 / var_90_20)

				if var_90_22 > 0 and var_90_16 < var_90_22 then
					arg_87_1.talkMaxDuration = var_90_22

					if var_90_22 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_22 + var_90_15
					end
				end

				arg_87_1.text_.text = var_90_19
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb") ~= 0 then
					local var_90_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb") / 1000

					if var_90_23 + var_90_15 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_23 + var_90_15
					end

					if var_90_18.prefab_name ~= "" and arg_87_1.actors_[var_90_18.prefab_name] ~= nil then
						local var_90_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_18.prefab_name].transform, "story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")

						arg_87_1:RecordAudio("1101106021", var_90_24)
						arg_87_1:RecordAudio("1101106021", var_90_24)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_25 = math.max(var_90_16, arg_87_1.talkMaxDuration)

			if var_90_15 <= arg_87_1.time_ and arg_87_1.time_ < var_90_15 + var_90_25 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_15) / var_90_25

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_15 + var_90_25 and arg_87_1.time_ < var_90_15 + var_90_25 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 1101106022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play1101106023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1033ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and not isNil(var_94_0) and arg_91_1.var_.characterEffect1033ui_story == nil then
				arg_91_1.var_.characterEffect1033ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.200000002980232

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 and not isNil(var_94_0) then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1033ui_story and not isNil(var_94_0) then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1033ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and not isNil(var_94_0) and arg_91_1.var_.characterEffect1033ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1033ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 0.05

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_8 = arg_91_1:FormatText(StoryNameCfg[7].name)

				arg_91_1.leftNameTxt_.text = var_94_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_9 = arg_91_1:GetWordFromCfg(1101106022)
				local var_94_10 = arg_91_1:FormatText(var_94_9.content)

				arg_91_1.text_.text = var_94_10

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_11 = 2
				local var_94_12 = utf8.len(var_94_10)
				local var_94_13 = var_94_11 <= 0 and var_94_7 or var_94_7 * (var_94_12 / var_94_11)

				if var_94_13 > 0 and var_94_7 < var_94_13 then
					arg_91_1.talkMaxDuration = var_94_13

					if var_94_13 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_13 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_10
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_14 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_14 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_14

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_14 and arg_91_1.time_ < var_94_6 + var_94_14 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 1101106023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play1101106024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1033ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1033ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1033ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = arg_95_1.actors_["1033ui_story"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 and not isNil(var_98_9) and arg_95_1.var_.characterEffect1033ui_story == nil then
				arg_95_1.var_.characterEffect1033ui_story = var_98_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_11 = 0.200000002980232

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_11 and not isNil(var_98_9) then
				local var_98_12 = (arg_95_1.time_ - var_98_10) / var_98_11

				if arg_95_1.var_.characterEffect1033ui_story and not isNil(var_98_9) then
					local var_98_13 = Mathf.Lerp(0, 0.5, var_98_12)

					arg_95_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1033ui_story.fillRatio = var_98_13
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_11 and arg_95_1.time_ < var_98_10 + var_98_11 + arg_98_0 and not isNil(var_98_9) and arg_95_1.var_.characterEffect1033ui_story then
				local var_98_14 = 0.5

				arg_95_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1033ui_story.fillRatio = var_98_14
			end

			local var_98_15 = 0
			local var_98_16 = 0.45

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_17 = arg_95_1:GetWordFromCfg(1101106023)
				local var_98_18 = arg_95_1:FormatText(var_98_17.content)

				arg_95_1.text_.text = var_98_18

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_19 = 18
				local var_98_20 = utf8.len(var_98_18)
				local var_98_21 = var_98_19 <= 0 and var_98_16 or var_98_16 * (var_98_20 / var_98_19)

				if var_98_21 > 0 and var_98_16 < var_98_21 then
					arg_95_1.talkMaxDuration = var_98_21

					if var_98_21 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_21 + var_98_15
					end
				end

				arg_95_1.text_.text = var_98_18
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_22 = math.max(var_98_16, arg_95_1.talkMaxDuration)

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_22 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_15) / var_98_22

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_15 + var_98_22 and arg_95_1.time_ < var_98_15 + var_98_22 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 1101106024
		arg_99_1.duration_ = 9.6

		local var_99_0 = {
			zh = 7.166,
			ja = 9.6
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
				arg_99_0:Play1101106025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1033ui_story"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos1033ui_story = var_102_0.localPosition
			end

			local var_102_2 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2
				local var_102_4 = Vector3.New(0, -1.01, -6.13)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1033ui_story, var_102_4, var_102_3)

				local var_102_5 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_5.x, var_102_5.y, var_102_5.z)

				local var_102_6 = var_102_0.localEulerAngles

				var_102_6.z = 0
				var_102_6.x = 0
				var_102_0.localEulerAngles = var_102_6
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(0, -1.01, -6.13)

				local var_102_7 = manager.ui.mainCamera.transform.position - var_102_0.position

				var_102_0.forward = Vector3.New(var_102_7.x, var_102_7.y, var_102_7.z)

				local var_102_8 = var_102_0.localEulerAngles

				var_102_8.z = 0
				var_102_8.x = 0
				var_102_0.localEulerAngles = var_102_8
			end

			local var_102_9 = arg_99_1.actors_["1033ui_story"]
			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 and not isNil(var_102_9) and arg_99_1.var_.characterEffect1033ui_story == nil then
				arg_99_1.var_.characterEffect1033ui_story = var_102_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_11 = 0.200000002980232

			if var_102_10 <= arg_99_1.time_ and arg_99_1.time_ < var_102_10 + var_102_11 and not isNil(var_102_9) then
				local var_102_12 = (arg_99_1.time_ - var_102_10) / var_102_11

				if arg_99_1.var_.characterEffect1033ui_story and not isNil(var_102_9) then
					arg_99_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_10 + var_102_11 and arg_99_1.time_ < var_102_10 + var_102_11 + arg_102_0 and not isNil(var_102_9) and arg_99_1.var_.characterEffect1033ui_story then
				arg_99_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_102_13 = 0

			if var_102_13 < arg_99_1.time_ and arg_99_1.time_ <= var_102_13 + arg_102_0 then
				arg_99_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action8_1")
			end

			local var_102_14 = 0

			if var_102_14 < arg_99_1.time_ and arg_99_1.time_ <= var_102_14 + arg_102_0 then
				arg_99_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_102_15 = 0
			local var_102_16 = 0.975

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_17 = arg_99_1:FormatText(StoryNameCfg[236].name)

				arg_99_1.leftNameTxt_.text = var_102_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_18 = arg_99_1:GetWordFromCfg(1101106024)
				local var_102_19 = arg_99_1:FormatText(var_102_18.content)

				arg_99_1.text_.text = var_102_19

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_20 = 39
				local var_102_21 = utf8.len(var_102_19)
				local var_102_22 = var_102_20 <= 0 and var_102_16 or var_102_16 * (var_102_21 / var_102_20)

				if var_102_22 > 0 and var_102_16 < var_102_22 then
					arg_99_1.talkMaxDuration = var_102_22

					if var_102_22 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_22 + var_102_15
					end
				end

				arg_99_1.text_.text = var_102_19
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb") ~= 0 then
					local var_102_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb") / 1000

					if var_102_23 + var_102_15 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_23 + var_102_15
					end

					if var_102_18.prefab_name ~= "" and arg_99_1.actors_[var_102_18.prefab_name] ~= nil then
						local var_102_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_18.prefab_name].transform, "story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")

						arg_99_1:RecordAudio("1101106024", var_102_24)
						arg_99_1:RecordAudio("1101106024", var_102_24)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_25 = math.max(var_102_16, arg_99_1.talkMaxDuration)

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_25 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_15) / var_102_25

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_15 + var_102_25 and arg_99_1.time_ < var_102_15 + var_102_25 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 1101106025
		arg_103_1.duration_ = 11.8

		local var_103_0 = {
			zh = 10.433,
			ja = 11.8
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
				arg_103_0:Play1101106026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = "ST04a"

			if arg_103_1.bgs_[var_106_0] == nil then
				local var_106_1 = Object.Instantiate(arg_103_1.paintGo_)

				var_106_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_106_0)
				var_106_1.name = var_106_0
				var_106_1.transform.parent = arg_103_1.stage_.transform
				var_106_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_103_1.bgs_[var_106_0] = var_106_1
			end

			local var_106_2 = 2

			if var_106_2 < arg_103_1.time_ and arg_103_1.time_ <= var_106_2 + arg_106_0 then
				local var_106_3 = manager.ui.mainCamera.transform.localPosition
				local var_106_4 = Vector3.New(0, 0, 10) + Vector3.New(var_106_3.x, var_106_3.y, 0)
				local var_106_5 = arg_103_1.bgs_.ST04a

				var_106_5.transform.localPosition = var_106_4
				var_106_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_106_6 = var_106_5:GetComponent("SpriteRenderer")

				if var_106_6 and var_106_6.sprite then
					local var_106_7 = (var_106_5.transform.localPosition - var_106_3).z
					local var_106_8 = manager.ui.mainCameraCom_
					local var_106_9 = 2 * var_106_7 * Mathf.Tan(var_106_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_106_10 = var_106_9 * var_106_8.aspect
					local var_106_11 = var_106_6.sprite.bounds.size.x
					local var_106_12 = var_106_6.sprite.bounds.size.y
					local var_106_13 = var_106_10 / var_106_11
					local var_106_14 = var_106_9 / var_106_12
					local var_106_15 = var_106_14 < var_106_13 and var_106_13 or var_106_14

					var_106_5.transform.localScale = Vector3.New(var_106_15, var_106_15, 0)
				end

				for iter_106_0, iter_106_1 in pairs(arg_103_1.bgs_) do
					if iter_106_0 ~= "ST04a" then
						iter_106_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_17 = 2

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Color.New(0, 0, 0)

				var_106_19.a = Mathf.Lerp(0, 1, var_106_18)
				arg_103_1.mask_.color = var_106_19
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				local var_106_20 = Color.New(0, 0, 0)

				var_106_20.a = 1
				arg_103_1.mask_.color = var_106_20
			end

			local var_106_21 = 2

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.mask_.enabled = true
				arg_103_1.mask_.raycastTarget = true

				arg_103_1:SetGaussion(false)
			end

			local var_106_22 = 2

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_22 then
				local var_106_23 = (arg_103_1.time_ - var_106_21) / var_106_22
				local var_106_24 = Color.New(0, 0, 0)

				var_106_24.a = Mathf.Lerp(1, 0, var_106_23)
				arg_103_1.mask_.color = var_106_24
			end

			if arg_103_1.time_ >= var_106_21 + var_106_22 and arg_103_1.time_ < var_106_21 + var_106_22 + arg_106_0 then
				local var_106_25 = Color.New(0, 0, 0)
				local var_106_26 = 0

				arg_103_1.mask_.enabled = false
				var_106_25.a = var_106_26
				arg_103_1.mask_.color = var_106_25
			end

			local var_106_27 = arg_103_1.actors_["1033ui_story"].transform
			local var_106_28 = 2

			if var_106_28 < arg_103_1.time_ and arg_103_1.time_ <= var_106_28 + arg_106_0 then
				arg_103_1.var_.moveOldPos1033ui_story = var_106_27.localPosition
			end

			local var_106_29 = 0.001

			if var_106_28 <= arg_103_1.time_ and arg_103_1.time_ < var_106_28 + var_106_29 then
				local var_106_30 = (arg_103_1.time_ - var_106_28) / var_106_29
				local var_106_31 = Vector3.New(0, 100, 0)

				var_106_27.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1033ui_story, var_106_31, var_106_30)

				local var_106_32 = manager.ui.mainCamera.transform.position - var_106_27.position

				var_106_27.forward = Vector3.New(var_106_32.x, var_106_32.y, var_106_32.z)

				local var_106_33 = var_106_27.localEulerAngles

				var_106_33.z = 0
				var_106_33.x = 0
				var_106_27.localEulerAngles = var_106_33
			end

			if arg_103_1.time_ >= var_106_28 + var_106_29 and arg_103_1.time_ < var_106_28 + var_106_29 + arg_106_0 then
				var_106_27.localPosition = Vector3.New(0, 100, 0)

				local var_106_34 = manager.ui.mainCamera.transform.position - var_106_27.position

				var_106_27.forward = Vector3.New(var_106_34.x, var_106_34.y, var_106_34.z)

				local var_106_35 = var_106_27.localEulerAngles

				var_106_35.z = 0
				var_106_35.x = 0
				var_106_27.localEulerAngles = var_106_35
			end

			local var_106_36 = arg_103_1.actors_["1111ui_story"].transform
			local var_106_37 = 4

			if var_106_37 < arg_103_1.time_ and arg_103_1.time_ <= var_106_37 + arg_106_0 then
				arg_103_1.var_.moveOldPos1111ui_story = var_106_36.localPosition
			end

			local var_106_38 = 0.001

			if var_106_37 <= arg_103_1.time_ and arg_103_1.time_ < var_106_37 + var_106_38 then
				local var_106_39 = (arg_103_1.time_ - var_106_37) / var_106_38
				local var_106_40 = Vector3.New(0.7, -0.87, -5.7)

				var_106_36.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1111ui_story, var_106_40, var_106_39)

				local var_106_41 = manager.ui.mainCamera.transform.position - var_106_36.position

				var_106_36.forward = Vector3.New(var_106_41.x, var_106_41.y, var_106_41.z)

				local var_106_42 = var_106_36.localEulerAngles

				var_106_42.z = 0
				var_106_42.x = 0
				var_106_36.localEulerAngles = var_106_42
			end

			if arg_103_1.time_ >= var_106_37 + var_106_38 and arg_103_1.time_ < var_106_37 + var_106_38 + arg_106_0 then
				var_106_36.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_106_43 = manager.ui.mainCamera.transform.position - var_106_36.position

				var_106_36.forward = Vector3.New(var_106_43.x, var_106_43.y, var_106_43.z)

				local var_106_44 = var_106_36.localEulerAngles

				var_106_44.z = 0
				var_106_44.x = 0
				var_106_36.localEulerAngles = var_106_44
			end

			local var_106_45 = arg_103_1.actors_["1111ui_story"]
			local var_106_46 = 4

			if var_106_46 < arg_103_1.time_ and arg_103_1.time_ <= var_106_46 + arg_106_0 and not isNil(var_106_45) and arg_103_1.var_.characterEffect1111ui_story == nil then
				arg_103_1.var_.characterEffect1111ui_story = var_106_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_47 = 0.200000002980232

			if var_106_46 <= arg_103_1.time_ and arg_103_1.time_ < var_106_46 + var_106_47 and not isNil(var_106_45) then
				local var_106_48 = (arg_103_1.time_ - var_106_46) / var_106_47

				if arg_103_1.var_.characterEffect1111ui_story and not isNil(var_106_45) then
					arg_103_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_46 + var_106_47 and arg_103_1.time_ < var_106_46 + var_106_47 + arg_106_0 and not isNil(var_106_45) and arg_103_1.var_.characterEffect1111ui_story then
				arg_103_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_106_49 = 4

			if var_106_49 < arg_103_1.time_ and arg_103_1.time_ <= var_106_49 + arg_106_0 then
				arg_103_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_106_50 = 4

			if var_106_50 < arg_103_1.time_ and arg_103_1.time_ <= var_106_50 + arg_106_0 then
				arg_103_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_106_51 = arg_103_1.actors_["1011ui_story"].transform
			local var_106_52 = 4

			if var_106_52 < arg_103_1.time_ and arg_103_1.time_ <= var_106_52 + arg_106_0 then
				arg_103_1.var_.moveOldPos1011ui_story = var_106_51.localPosition
			end

			local var_106_53 = 0.001

			if var_106_52 <= arg_103_1.time_ and arg_103_1.time_ < var_106_52 + var_106_53 then
				local var_106_54 = (arg_103_1.time_ - var_106_52) / var_106_53
				local var_106_55 = Vector3.New(-0.7, -0.71, -6)

				var_106_51.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1011ui_story, var_106_55, var_106_54)

				local var_106_56 = manager.ui.mainCamera.transform.position - var_106_51.position

				var_106_51.forward = Vector3.New(var_106_56.x, var_106_56.y, var_106_56.z)

				local var_106_57 = var_106_51.localEulerAngles

				var_106_57.z = 0
				var_106_57.x = 0
				var_106_51.localEulerAngles = var_106_57
			end

			if arg_103_1.time_ >= var_106_52 + var_106_53 and arg_103_1.time_ < var_106_52 + var_106_53 + arg_106_0 then
				var_106_51.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_106_58 = manager.ui.mainCamera.transform.position - var_106_51.position

				var_106_51.forward = Vector3.New(var_106_58.x, var_106_58.y, var_106_58.z)

				local var_106_59 = var_106_51.localEulerAngles

				var_106_59.z = 0
				var_106_59.x = 0
				var_106_51.localEulerAngles = var_106_59
			end

			local var_106_60 = arg_103_1.actors_["1011ui_story"]
			local var_106_61 = 4

			if var_106_61 < arg_103_1.time_ and arg_103_1.time_ <= var_106_61 + arg_106_0 and not isNil(var_106_60) and arg_103_1.var_.characterEffect1011ui_story == nil then
				arg_103_1.var_.characterEffect1011ui_story = var_106_60:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_62 = 0.200000002980232

			if var_106_61 <= arg_103_1.time_ and arg_103_1.time_ < var_106_61 + var_106_62 and not isNil(var_106_60) then
				local var_106_63 = (arg_103_1.time_ - var_106_61) / var_106_62

				if arg_103_1.var_.characterEffect1011ui_story and not isNil(var_106_60) then
					local var_106_64 = Mathf.Lerp(0, 0.5, var_106_63)

					arg_103_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1011ui_story.fillRatio = var_106_64
				end
			end

			if arg_103_1.time_ >= var_106_61 + var_106_62 and arg_103_1.time_ < var_106_61 + var_106_62 + arg_106_0 and not isNil(var_106_60) and arg_103_1.var_.characterEffect1011ui_story then
				local var_106_65 = 0.5

				arg_103_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1011ui_story.fillRatio = var_106_65
			end

			local var_106_66 = 4

			if var_106_66 < arg_103_1.time_ and arg_103_1.time_ <= var_106_66 + arg_106_0 then
				arg_103_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_106_67 = 4

			if var_106_67 < arg_103_1.time_ and arg_103_1.time_ <= var_106_67 + arg_106_0 then
				arg_103_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_103_1.frameCnt_ <= 1 then
				arg_103_1.dialog_:SetActive(false)
			end

			local var_106_68 = 4
			local var_106_69 = 0.675

			if var_106_68 < arg_103_1.time_ and arg_103_1.time_ <= var_106_68 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0

				arg_103_1.dialog_:SetActive(true)

				local var_106_70 = LeanTween.value(arg_103_1.dialog_, 0, 1, 0.3)

				var_106_70:setOnUpdate(LuaHelper.FloatAction(function(arg_107_0)
					arg_103_1.dialogCg_.alpha = arg_107_0
				end))
				var_106_70:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_103_1.dialog_)
					var_106_70:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_103_1.duration_ = arg_103_1.duration_ + 0.3

				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_71 = arg_103_1:FormatText(StoryNameCfg[67].name)

				arg_103_1.leftNameTxt_.text = var_106_71

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_72 = arg_103_1:GetWordFromCfg(1101106025)
				local var_106_73 = arg_103_1:FormatText(var_106_72.content)

				arg_103_1.text_.text = var_106_73

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_74 = 27
				local var_106_75 = utf8.len(var_106_73)
				local var_106_76 = var_106_74 <= 0 and var_106_69 or var_106_69 * (var_106_75 / var_106_74)

				if var_106_76 > 0 and var_106_69 < var_106_76 then
					arg_103_1.talkMaxDuration = var_106_76
					var_106_68 = var_106_68 + 0.3

					if var_106_76 + var_106_68 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_76 + var_106_68
					end
				end

				arg_103_1.text_.text = var_106_73
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb") ~= 0 then
					local var_106_77 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb") / 1000

					if var_106_77 + var_106_68 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_77 + var_106_68
					end

					if var_106_72.prefab_name ~= "" and arg_103_1.actors_[var_106_72.prefab_name] ~= nil then
						local var_106_78 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_72.prefab_name].transform, "story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")

						arg_103_1:RecordAudio("1101106025", var_106_78)
						arg_103_1:RecordAudio("1101106025", var_106_78)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_79 = var_106_68 + 0.3
			local var_106_80 = math.max(var_106_69, arg_103_1.talkMaxDuration)

			if var_106_79 <= arg_103_1.time_ and arg_103_1.time_ < var_106_79 + var_106_80 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_79) / var_106_80

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_79 + var_106_80 and arg_103_1.time_ < var_106_79 + var_106_80 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106026 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1101106026
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1101106027(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1111ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1111ui_story == nil then
				arg_109_1.var_.characterEffect1111ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 and not isNil(var_112_0) then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1111ui_story and not isNil(var_112_0) then
					local var_112_4 = Mathf.Lerp(0, 0.5, var_112_3)

					arg_109_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_109_1.var_.characterEffect1111ui_story.fillRatio = var_112_4
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and not isNil(var_112_0) and arg_109_1.var_.characterEffect1111ui_story then
				local var_112_5 = 0.5

				arg_109_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_109_1.var_.characterEffect1111ui_story.fillRatio = var_112_5
			end

			local var_112_6 = 0
			local var_112_7 = 0.95

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_8 = arg_109_1:FormatText(StoryNameCfg[7].name)

				arg_109_1.leftNameTxt_.text = var_112_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_9 = arg_109_1:GetWordFromCfg(1101106026)
				local var_112_10 = arg_109_1:FormatText(var_112_9.content)

				arg_109_1.text_.text = var_112_10

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_11 = 38
				local var_112_12 = utf8.len(var_112_10)
				local var_112_13 = var_112_11 <= 0 and var_112_7 or var_112_7 * (var_112_12 / var_112_11)

				if var_112_13 > 0 and var_112_7 < var_112_13 then
					arg_109_1.talkMaxDuration = var_112_13

					if var_112_13 + var_112_6 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_13 + var_112_6
					end
				end

				arg_109_1.text_.text = var_112_10
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_14 = math.max(var_112_7, arg_109_1.talkMaxDuration)

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_14 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_6) / var_112_14

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_6 + var_112_14 and arg_109_1.time_ < var_112_6 + var_112_14 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106027 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1101106027
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play1101106028(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.275

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[7].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(1101106027)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 11
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_8 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_8 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_8

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_8 and arg_113_1.time_ < var_116_0 + var_116_8 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106028 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1101106028
		arg_117_1.duration_ = 11.7

		local var_117_0 = {
			zh = 6.466,
			ja = 11.7
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
				arg_117_0:Play1101106029(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1111ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1111ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0.7, -0.87, -5.7)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1111ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1111ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and not isNil(var_120_9) and arg_117_1.var_.characterEffect1111ui_story == nil then
				arg_117_1.var_.characterEffect1111ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 and not isNil(var_120_9) then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1111ui_story and not isNil(var_120_9) then
					arg_117_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and not isNil(var_120_9) and arg_117_1.var_.characterEffect1111ui_story then
				arg_117_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_120_13 = 0

			if var_120_13 < arg_117_1.time_ and arg_117_1.time_ <= var_120_13 + arg_120_0 then
				arg_117_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_2")
			end

			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_120_15 = 0
			local var_120_16 = 0.725

			if var_120_15 < arg_117_1.time_ and arg_117_1.time_ <= var_120_15 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_17 = arg_117_1:FormatText(StoryNameCfg[67].name)

				arg_117_1.leftNameTxt_.text = var_120_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_18 = arg_117_1:GetWordFromCfg(1101106028)
				local var_120_19 = arg_117_1:FormatText(var_120_18.content)

				arg_117_1.text_.text = var_120_19

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_20 = 29
				local var_120_21 = utf8.len(var_120_19)
				local var_120_22 = var_120_20 <= 0 and var_120_16 or var_120_16 * (var_120_21 / var_120_20)

				if var_120_22 > 0 and var_120_16 < var_120_22 then
					arg_117_1.talkMaxDuration = var_120_22

					if var_120_22 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_22 + var_120_15
					end
				end

				arg_117_1.text_.text = var_120_19
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb") ~= 0 then
					local var_120_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb") / 1000

					if var_120_23 + var_120_15 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_23 + var_120_15
					end

					if var_120_18.prefab_name ~= "" and arg_117_1.actors_[var_120_18.prefab_name] ~= nil then
						local var_120_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_18.prefab_name].transform, "story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")

						arg_117_1:RecordAudio("1101106028", var_120_24)
						arg_117_1:RecordAudio("1101106028", var_120_24)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_25 = math.max(var_120_16, arg_117_1.talkMaxDuration)

			if var_120_15 <= arg_117_1.time_ and arg_117_1.time_ < var_120_15 + var_120_25 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_15) / var_120_25

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_15 + var_120_25 and arg_117_1.time_ < var_120_15 + var_120_25 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1101106029
		arg_121_1.duration_ = 4.6

		local var_121_0 = {
			zh = 4.6,
			ja = 4.1
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
				arg_121_0:Play1101106030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1011ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1011ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(-0.7, -0.71, -6)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1011ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1011ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and not isNil(var_124_9) and arg_121_1.var_.characterEffect1011ui_story == nil then
				arg_121_1.var_.characterEffect1011ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 and not isNil(var_124_9) then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1011ui_story and not isNil(var_124_9) then
					arg_121_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and not isNil(var_124_9) and arg_121_1.var_.characterEffect1011ui_story then
				arg_121_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_124_15 = arg_121_1.actors_["1111ui_story"]
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 and not isNil(var_124_15) and arg_121_1.var_.characterEffect1111ui_story == nil then
				arg_121_1.var_.characterEffect1111ui_story = var_124_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_17 = 0.200000002980232

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 and not isNil(var_124_15) then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17

				if arg_121_1.var_.characterEffect1111ui_story and not isNil(var_124_15) then
					local var_124_19 = Mathf.Lerp(0, 0.5, var_124_18)

					arg_121_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1111ui_story.fillRatio = var_124_19
				end
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 and not isNil(var_124_15) and arg_121_1.var_.characterEffect1111ui_story then
				local var_124_20 = 0.5

				arg_121_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1111ui_story.fillRatio = var_124_20
			end

			local var_124_21 = 0
			local var_124_22 = 0.475

			if var_124_21 < arg_121_1.time_ and arg_121_1.time_ <= var_124_21 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_23 = arg_121_1:FormatText(StoryNameCfg[37].name)

				arg_121_1.leftNameTxt_.text = var_124_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_24 = arg_121_1:GetWordFromCfg(1101106029)
				local var_124_25 = arg_121_1:FormatText(var_124_24.content)

				arg_121_1.text_.text = var_124_25

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_26 = 19
				local var_124_27 = utf8.len(var_124_25)
				local var_124_28 = var_124_26 <= 0 and var_124_22 or var_124_22 * (var_124_27 / var_124_26)

				if var_124_28 > 0 and var_124_22 < var_124_28 then
					arg_121_1.talkMaxDuration = var_124_28

					if var_124_28 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_28 + var_124_21
					end
				end

				arg_121_1.text_.text = var_124_25
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb") ~= 0 then
					local var_124_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb") / 1000

					if var_124_29 + var_124_21 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_29 + var_124_21
					end

					if var_124_24.prefab_name ~= "" and arg_121_1.actors_[var_124_24.prefab_name] ~= nil then
						local var_124_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_24.prefab_name].transform, "story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")

						arg_121_1:RecordAudio("1101106029", var_124_30)
						arg_121_1:RecordAudio("1101106029", var_124_30)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_31 = math.max(var_124_22, arg_121_1.talkMaxDuration)

			if var_124_21 <= arg_121_1.time_ and arg_121_1.time_ < var_124_21 + var_124_31 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_21) / var_124_31

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_21 + var_124_31 and arg_121_1.time_ < var_124_21 + var_124_31 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1101106030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1101106031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1011ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and not isNil(var_128_0) and arg_125_1.var_.characterEffect1011ui_story == nil then
				arg_125_1.var_.characterEffect1011ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 and not isNil(var_128_0) then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1011ui_story and not isNil(var_128_0) then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1011ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and not isNil(var_128_0) and arg_125_1.var_.characterEffect1011ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1011ui_story.fillRatio = var_128_5
			end

			local var_128_6 = 0
			local var_128_7 = 0.075

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[7].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(1101106030)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 3
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_14 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_14 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_14

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_14 and arg_125_1.time_ < var_128_6 + var_128_14 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1101106031
		arg_129_1.duration_ = 5.9

		local var_129_0 = {
			zh = 3.8,
			ja = 5.9
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
				arg_129_0:Play1101106032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1011ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1011ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(-0.7, -0.71, -6)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1011ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1011ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and not isNil(var_132_9) and arg_129_1.var_.characterEffect1011ui_story == nil then
				arg_129_1.var_.characterEffect1011ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 and not isNil(var_132_9) then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1011ui_story and not isNil(var_132_9) then
					arg_129_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and not isNil(var_132_9) and arg_129_1.var_.characterEffect1011ui_story then
				arg_129_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action445")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_132_15 = 0
			local var_132_16 = 0.35

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_17 = arg_129_1:FormatText(StoryNameCfg[37].name)

				arg_129_1.leftNameTxt_.text = var_132_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_18 = arg_129_1:GetWordFromCfg(1101106031)
				local var_132_19 = arg_129_1:FormatText(var_132_18.content)

				arg_129_1.text_.text = var_132_19

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_20 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb") ~= 0 then
					local var_132_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb") / 1000

					if var_132_23 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_23 + var_132_15
					end

					if var_132_18.prefab_name ~= "" and arg_129_1.actors_[var_132_18.prefab_name] ~= nil then
						local var_132_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_18.prefab_name].transform, "story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")

						arg_129_1:RecordAudio("1101106031", var_132_24)
						arg_129_1:RecordAudio("1101106031", var_132_24)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")
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
	Play1101106032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1101106032
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1101106033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1011ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect1011ui_story == nil then
				arg_133_1.var_.characterEffect1011ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 and not isNil(var_136_0) then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1011ui_story and not isNil(var_136_0) then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1011ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.characterEffect1011ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1011ui_story.fillRatio = var_136_5
			end

			local var_136_6 = 0
			local var_136_7 = 0.45

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_8 = arg_133_1:FormatText(StoryNameCfg[7].name)

				arg_133_1.leftNameTxt_.text = var_136_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_9 = arg_133_1:GetWordFromCfg(1101106032)
				local var_136_10 = arg_133_1:FormatText(var_136_9.content)

				arg_133_1.text_.text = var_136_10

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_11 = 18
				local var_136_12 = utf8.len(var_136_10)
				local var_136_13 = var_136_11 <= 0 and var_136_7 or var_136_7 * (var_136_12 / var_136_11)

				if var_136_13 > 0 and var_136_7 < var_136_13 then
					arg_133_1.talkMaxDuration = var_136_13

					if var_136_13 + var_136_6 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_13 + var_136_6
					end
				end

				arg_133_1.text_.text = var_136_10
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_14 = math.max(var_136_7, arg_133_1.talkMaxDuration)

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_14 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_6) / var_136_14

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_6 + var_136_14 and arg_133_1.time_ < var_136_6 + var_136_14 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1101106033
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1101106034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1111ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1111ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, 100, 0)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1111ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, 100, 0)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1011ui_story"].transform
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.var_.moveOldPos1011ui_story = var_140_9.localPosition
			end

			local var_140_11 = 0.001

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11
				local var_140_13 = Vector3.New(0, 100, 0)

				var_140_9.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1011ui_story, var_140_13, var_140_12)

				local var_140_14 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_14.x, var_140_14.y, var_140_14.z)

				local var_140_15 = var_140_9.localEulerAngles

				var_140_15.z = 0
				var_140_15.x = 0
				var_140_9.localEulerAngles = var_140_15
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 then
				var_140_9.localPosition = Vector3.New(0, 100, 0)

				local var_140_16 = manager.ui.mainCamera.transform.position - var_140_9.position

				var_140_9.forward = Vector3.New(var_140_16.x, var_140_16.y, var_140_16.z)

				local var_140_17 = var_140_9.localEulerAngles

				var_140_17.z = 0
				var_140_17.x = 0
				var_140_9.localEulerAngles = var_140_17
			end

			local var_140_18 = 0
			local var_140_19 = 0.75

			if var_140_18 < arg_137_1.time_ and arg_137_1.time_ <= var_140_18 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_20 = arg_137_1:GetWordFromCfg(1101106033)
				local var_140_21 = arg_137_1:FormatText(var_140_20.content)

				arg_137_1.text_.text = var_140_21

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_22 = 30
				local var_140_23 = utf8.len(var_140_21)
				local var_140_24 = var_140_22 <= 0 and var_140_19 or var_140_19 * (var_140_23 / var_140_22)

				if var_140_24 > 0 and var_140_19 < var_140_24 then
					arg_137_1.talkMaxDuration = var_140_24

					if var_140_24 + var_140_18 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_24 + var_140_18
					end
				end

				arg_137_1.text_.text = var_140_21
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_25 = math.max(var_140_19, arg_137_1.talkMaxDuration)

			if var_140_18 <= arg_137_1.time_ and arg_137_1.time_ < var_140_18 + var_140_25 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_18) / var_140_25

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_18 + var_140_25 and arg_137_1.time_ < var_140_18 + var_140_25 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1101106034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1101106035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[7].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(1101106034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 40
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_8 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_8 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_8

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_8 and arg_141_1.time_ < var_144_0 + var_144_8 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1101106035
		arg_145_1.duration_ = 4.9

		local var_145_0 = {
			zh = 3.333,
			ja = 4.9
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1101106036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1011ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1011ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, -0.71, -6)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1011ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1011ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and not isNil(var_148_9) and arg_145_1.var_.characterEffect1011ui_story == nil then
				arg_145_1.var_.characterEffect1011ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 and not isNil(var_148_9) then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1011ui_story and not isNil(var_148_9) then
					arg_145_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and not isNil(var_148_9) and arg_145_1.var_.characterEffect1011ui_story then
				arg_145_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_148_13 = 0

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_148_15 = 0
			local var_148_16 = 0.35

			if var_148_15 < arg_145_1.time_ and arg_145_1.time_ <= var_148_15 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_17 = arg_145_1:FormatText(StoryNameCfg[37].name)

				arg_145_1.leftNameTxt_.text = var_148_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_18 = arg_145_1:GetWordFromCfg(1101106035)
				local var_148_19 = arg_145_1:FormatText(var_148_18.content)

				arg_145_1.text_.text = var_148_19

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_20 = 14
				local var_148_21 = utf8.len(var_148_19)
				local var_148_22 = var_148_20 <= 0 and var_148_16 or var_148_16 * (var_148_21 / var_148_20)

				if var_148_22 > 0 and var_148_16 < var_148_22 then
					arg_145_1.talkMaxDuration = var_148_22

					if var_148_22 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_22 + var_148_15
					end
				end

				arg_145_1.text_.text = var_148_19
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb") ~= 0 then
					local var_148_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb") / 1000

					if var_148_23 + var_148_15 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_23 + var_148_15
					end

					if var_148_18.prefab_name ~= "" and arg_145_1.actors_[var_148_18.prefab_name] ~= nil then
						local var_148_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_18.prefab_name].transform, "story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")

						arg_145_1:RecordAudio("1101106035", var_148_24)
						arg_145_1:RecordAudio("1101106035", var_148_24)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_25 = math.max(var_148_16, arg_145_1.talkMaxDuration)

			if var_148_15 <= arg_145_1.time_ and arg_145_1.time_ < var_148_15 + var_148_25 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_15) / var_148_25

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_15 + var_148_25 and arg_145_1.time_ < var_148_15 + var_148_25 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1101106036
		arg_149_1.duration_ = 5

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1101106037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1011ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and not isNil(var_152_0) and arg_149_1.var_.characterEffect1011ui_story == nil then
				arg_149_1.var_.characterEffect1011ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 and not isNil(var_152_0) then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1011ui_story and not isNil(var_152_0) then
					local var_152_4 = Mathf.Lerp(0, 0.5, var_152_3)

					arg_149_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1011ui_story.fillRatio = var_152_4
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and not isNil(var_152_0) and arg_149_1.var_.characterEffect1011ui_story then
				local var_152_5 = 0.5

				arg_149_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1011ui_story.fillRatio = var_152_5
			end

			local var_152_6 = 0
			local var_152_7 = 0.475

			if var_152_6 < arg_149_1.time_ and arg_149_1.time_ <= var_152_6 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, false)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_8 = arg_149_1:GetWordFromCfg(1101106036)
				local var_152_9 = arg_149_1:FormatText(var_152_8.content)

				arg_149_1.text_.text = var_152_9

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_10 = 19
				local var_152_11 = utf8.len(var_152_9)
				local var_152_12 = var_152_10 <= 0 and var_152_7 or var_152_7 * (var_152_11 / var_152_10)

				if var_152_12 > 0 and var_152_7 < var_152_12 then
					arg_149_1.talkMaxDuration = var_152_12

					if var_152_12 + var_152_6 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_12 + var_152_6
					end
				end

				arg_149_1.text_.text = var_152_9
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)
				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_13 = math.max(var_152_7, arg_149_1.talkMaxDuration)

			if var_152_6 <= arg_149_1.time_ and arg_149_1.time_ < var_152_6 + var_152_13 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_6) / var_152_13

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_6 + var_152_13 and arg_149_1.time_ < var_152_6 + var_152_13 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1101106037
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1101106038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.4

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[7].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(1101106037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 16
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_8 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_8 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_8

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_8 and arg_153_1.time_ < var_156_0 + var_156_8 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1101106038
		arg_157_1.duration_ = 3.43

		local var_157_0 = {
			zh = 3.433,
			ja = 1.999999999999
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1101106039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1011ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1011ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, -0.71, -6)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1011ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1011ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and not isNil(var_160_9) and arg_157_1.var_.characterEffect1011ui_story == nil then
				arg_157_1.var_.characterEffect1011ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 and not isNil(var_160_9) then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1011ui_story and not isNil(var_160_9) then
					arg_157_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and not isNil(var_160_9) and arg_157_1.var_.characterEffect1011ui_story then
				arg_157_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_160_13 = 0

			if var_160_13 < arg_157_1.time_ and arg_157_1.time_ <= var_160_13 + arg_160_0 then
				arg_157_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_2")
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_160_15 = 0
			local var_160_16 = 0.225

			if var_160_15 < arg_157_1.time_ and arg_157_1.time_ <= var_160_15 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_17 = arg_157_1:FormatText(StoryNameCfg[37].name)

				arg_157_1.leftNameTxt_.text = var_160_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_18 = arg_157_1:GetWordFromCfg(1101106038)
				local var_160_19 = arg_157_1:FormatText(var_160_18.content)

				arg_157_1.text_.text = var_160_19

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_20 = 9
				local var_160_21 = utf8.len(var_160_19)
				local var_160_22 = var_160_20 <= 0 and var_160_16 or var_160_16 * (var_160_21 / var_160_20)

				if var_160_22 > 0 and var_160_16 < var_160_22 then
					arg_157_1.talkMaxDuration = var_160_22

					if var_160_22 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_22 + var_160_15
					end
				end

				arg_157_1.text_.text = var_160_19
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb") ~= 0 then
					local var_160_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb") / 1000

					if var_160_23 + var_160_15 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_23 + var_160_15
					end

					if var_160_18.prefab_name ~= "" and arg_157_1.actors_[var_160_18.prefab_name] ~= nil then
						local var_160_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_18.prefab_name].transform, "story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")

						arg_157_1:RecordAudio("1101106038", var_160_24)
						arg_157_1:RecordAudio("1101106038", var_160_24)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_25 = math.max(var_160_16, arg_157_1.talkMaxDuration)

			if var_160_15 <= arg_157_1.time_ and arg_157_1.time_ < var_160_15 + var_160_25 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_15) / var_160_25

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_15 + var_160_25 and arg_157_1.time_ < var_160_15 + var_160_25 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 1101106039
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play1101106040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1011ui_story"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.characterEffect1011ui_story == nil then
				arg_161_1.var_.characterEffect1011ui_story = var_164_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_2 = 0.200000002980232

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 and not isNil(var_164_0) then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.characterEffect1011ui_story and not isNil(var_164_0) then
					local var_164_4 = Mathf.Lerp(0, 0.5, var_164_3)

					arg_161_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1011ui_story.fillRatio = var_164_4
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.characterEffect1011ui_story then
				local var_164_5 = 0.5

				arg_161_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1011ui_story.fillRatio = var_164_5
			end

			local var_164_6 = 0
			local var_164_7 = 0.425

			if var_164_6 < arg_161_1.time_ and arg_161_1.time_ <= var_164_6 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_8 = arg_161_1:GetWordFromCfg(1101106039)
				local var_164_9 = arg_161_1:FormatText(var_164_8.content)

				arg_161_1.text_.text = var_164_9

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_10 = 17
				local var_164_11 = utf8.len(var_164_9)
				local var_164_12 = var_164_10 <= 0 and var_164_7 or var_164_7 * (var_164_11 / var_164_10)

				if var_164_12 > 0 and var_164_7 < var_164_12 then
					arg_161_1.talkMaxDuration = var_164_12

					if var_164_12 + var_164_6 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_12 + var_164_6
					end
				end

				arg_161_1.text_.text = var_164_9
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_13 = math.max(var_164_7, arg_161_1.talkMaxDuration)

			if var_164_6 <= arg_161_1.time_ and arg_161_1.time_ < var_164_6 + var_164_13 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_6) / var_164_13

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_6 + var_164_13 and arg_161_1.time_ < var_164_6 + var_164_13 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 1101106040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play1101106041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.325

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[7].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(1101106040)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 13
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_8 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_8 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_8

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_8 and arg_165_1.time_ < var_168_0 + var_168_8 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1101106041
		arg_169_1.duration_ = 2.43

		local var_169_0 = {
			zh = 1.999999999999,
			ja = 2.433
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1101106042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1011ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1011ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, 100, 0)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1011ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, 100, 0)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1011ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and not isNil(var_172_9) and arg_169_1.var_.characterEffect1011ui_story == nil then
				arg_169_1.var_.characterEffect1011ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 and not isNil(var_172_9) then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1011ui_story and not isNil(var_172_9) then
					local var_172_13 = Mathf.Lerp(0, 0.5, var_172_12)

					arg_169_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1011ui_story.fillRatio = var_172_13
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and not isNil(var_172_9) and arg_169_1.var_.characterEffect1011ui_story then
				local var_172_14 = 0.5

				arg_169_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1011ui_story.fillRatio = var_172_14
			end

			local var_172_15 = arg_169_1.actors_["1111ui_story"].transform
			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 then
				arg_169_1.var_.moveOldPos1111ui_story = var_172_15.localPosition
			end

			local var_172_17 = 0.001

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17
				local var_172_19 = Vector3.New(0, -0.87, -5.7)

				var_172_15.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1111ui_story, var_172_19, var_172_18)

				local var_172_20 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_20.x, var_172_20.y, var_172_20.z)

				local var_172_21 = var_172_15.localEulerAngles

				var_172_21.z = 0
				var_172_21.x = 0
				var_172_15.localEulerAngles = var_172_21
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 then
				var_172_15.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_172_22 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_22.x, var_172_22.y, var_172_22.z)

				local var_172_23 = var_172_15.localEulerAngles

				var_172_23.z = 0
				var_172_23.x = 0
				var_172_15.localEulerAngles = var_172_23
			end

			local var_172_24 = arg_169_1.actors_["1111ui_story"]
			local var_172_25 = 0

			if var_172_25 < arg_169_1.time_ and arg_169_1.time_ <= var_172_25 + arg_172_0 and not isNil(var_172_24) and arg_169_1.var_.characterEffect1111ui_story == nil then
				arg_169_1.var_.characterEffect1111ui_story = var_172_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_26 = 0.200000002980232

			if var_172_25 <= arg_169_1.time_ and arg_169_1.time_ < var_172_25 + var_172_26 and not isNil(var_172_24) then
				local var_172_27 = (arg_169_1.time_ - var_172_25) / var_172_26

				if arg_169_1.var_.characterEffect1111ui_story and not isNil(var_172_24) then
					arg_169_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_25 + var_172_26 and arg_169_1.time_ < var_172_25 + var_172_26 + arg_172_0 and not isNil(var_172_24) and arg_169_1.var_.characterEffect1111ui_story then
				arg_169_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_172_28 = 0

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				arg_169_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_172_29 = 0

			if var_172_29 < arg_169_1.time_ and arg_169_1.time_ <= var_172_29 + arg_172_0 then
				arg_169_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_172_30 = 0
			local var_172_31 = 0.075

			if var_172_30 < arg_169_1.time_ and arg_169_1.time_ <= var_172_30 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_32 = arg_169_1:FormatText(StoryNameCfg[67].name)

				arg_169_1.leftNameTxt_.text = var_172_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_33 = arg_169_1:GetWordFromCfg(1101106041)
				local var_172_34 = arg_169_1:FormatText(var_172_33.content)

				arg_169_1.text_.text = var_172_34

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_35 = 3
				local var_172_36 = utf8.len(var_172_34)
				local var_172_37 = var_172_35 <= 0 and var_172_31 or var_172_31 * (var_172_36 / var_172_35)

				if var_172_37 > 0 and var_172_31 < var_172_37 then
					arg_169_1.talkMaxDuration = var_172_37

					if var_172_37 + var_172_30 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_37 + var_172_30
					end
				end

				arg_169_1.text_.text = var_172_34
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb") ~= 0 then
					local var_172_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb") / 1000

					if var_172_38 + var_172_30 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_38 + var_172_30
					end

					if var_172_33.prefab_name ~= "" and arg_169_1.actors_[var_172_33.prefab_name] ~= nil then
						local var_172_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_33.prefab_name].transform, "story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")

						arg_169_1:RecordAudio("1101106041", var_172_39)
						arg_169_1:RecordAudio("1101106041", var_172_39)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_40 = math.max(var_172_31, arg_169_1.talkMaxDuration)

			if var_172_30 <= arg_169_1.time_ and arg_169_1.time_ < var_172_30 + var_172_40 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_30) / var_172_40

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_30 + var_172_40 and arg_169_1.time_ < var_172_30 + var_172_40 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1101106042
		arg_173_1.duration_ = 2.9

		local var_173_0 = {
			zh = 2.6,
			ja = 2.9
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play1101106043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1011ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1011ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(-0.7, -0.71, -6)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1011ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1011ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and not isNil(var_176_9) and arg_173_1.var_.characterEffect1011ui_story == nil then
				arg_173_1.var_.characterEffect1011ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 and not isNil(var_176_9) then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1011ui_story and not isNil(var_176_9) then
					arg_173_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and not isNil(var_176_9) and arg_173_1.var_.characterEffect1011ui_story then
				arg_173_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_176_15 = arg_173_1.actors_["1111ui_story"].transform
			local var_176_16 = 0

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 then
				arg_173_1.var_.moveOldPos1111ui_story = var_176_15.localPosition
			end

			local var_176_17 = 0.001

			if var_176_16 <= arg_173_1.time_ and arg_173_1.time_ < var_176_16 + var_176_17 then
				local var_176_18 = (arg_173_1.time_ - var_176_16) / var_176_17
				local var_176_19 = Vector3.New(0.7, -0.87, -5.7)

				var_176_15.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1111ui_story, var_176_19, var_176_18)

				local var_176_20 = manager.ui.mainCamera.transform.position - var_176_15.position

				var_176_15.forward = Vector3.New(var_176_20.x, var_176_20.y, var_176_20.z)

				local var_176_21 = var_176_15.localEulerAngles

				var_176_21.z = 0
				var_176_21.x = 0
				var_176_15.localEulerAngles = var_176_21
			end

			if arg_173_1.time_ >= var_176_16 + var_176_17 and arg_173_1.time_ < var_176_16 + var_176_17 + arg_176_0 then
				var_176_15.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_176_22 = manager.ui.mainCamera.transform.position - var_176_15.position

				var_176_15.forward = Vector3.New(var_176_22.x, var_176_22.y, var_176_22.z)

				local var_176_23 = var_176_15.localEulerAngles

				var_176_23.z = 0
				var_176_23.x = 0
				var_176_15.localEulerAngles = var_176_23
			end

			local var_176_24 = arg_173_1.actors_["1111ui_story"]
			local var_176_25 = 0

			if var_176_25 < arg_173_1.time_ and arg_173_1.time_ <= var_176_25 + arg_176_0 and not isNil(var_176_24) and arg_173_1.var_.characterEffect1111ui_story == nil then
				arg_173_1.var_.characterEffect1111ui_story = var_176_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_26 = 0.200000002980232

			if var_176_25 <= arg_173_1.time_ and arg_173_1.time_ < var_176_25 + var_176_26 and not isNil(var_176_24) then
				local var_176_27 = (arg_173_1.time_ - var_176_25) / var_176_26

				if arg_173_1.var_.characterEffect1111ui_story and not isNil(var_176_24) then
					local var_176_28 = Mathf.Lerp(0, 0.5, var_176_27)

					arg_173_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1111ui_story.fillRatio = var_176_28
				end
			end

			if arg_173_1.time_ >= var_176_25 + var_176_26 and arg_173_1.time_ < var_176_25 + var_176_26 + arg_176_0 and not isNil(var_176_24) and arg_173_1.var_.characterEffect1111ui_story then
				local var_176_29 = 0.5

				arg_173_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1111ui_story.fillRatio = var_176_29
			end

			local var_176_30 = 0
			local var_176_31 = 0.225

			if var_176_30 < arg_173_1.time_ and arg_173_1.time_ <= var_176_30 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_32 = arg_173_1:FormatText(StoryNameCfg[37].name)

				arg_173_1.leftNameTxt_.text = var_176_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_33 = arg_173_1:GetWordFromCfg(1101106042)
				local var_176_34 = arg_173_1:FormatText(var_176_33.content)

				arg_173_1.text_.text = var_176_34

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_35 = 9
				local var_176_36 = utf8.len(var_176_34)
				local var_176_37 = var_176_35 <= 0 and var_176_31 or var_176_31 * (var_176_36 / var_176_35)

				if var_176_37 > 0 and var_176_31 < var_176_37 then
					arg_173_1.talkMaxDuration = var_176_37

					if var_176_37 + var_176_30 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_37 + var_176_30
					end
				end

				arg_173_1.text_.text = var_176_34
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb") ~= 0 then
					local var_176_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb") / 1000

					if var_176_38 + var_176_30 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_38 + var_176_30
					end

					if var_176_33.prefab_name ~= "" and arg_173_1.actors_[var_176_33.prefab_name] ~= nil then
						local var_176_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_33.prefab_name].transform, "story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")

						arg_173_1:RecordAudio("1101106042", var_176_39)
						arg_173_1:RecordAudio("1101106042", var_176_39)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_40 = math.max(var_176_31, arg_173_1.talkMaxDuration)

			if var_176_30 <= arg_173_1.time_ and arg_173_1.time_ < var_176_30 + var_176_40 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_30) / var_176_40

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_30 + var_176_40 and arg_173_1.time_ < var_176_30 + var_176_40 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1101106043
		arg_177_1.duration_ = 2.73

		local var_177_0 = {
			zh = 2.333,
			ja = 2.733
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1101106044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1111ui_story"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1111ui_story = var_180_0.localPosition
			end

			local var_180_2 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2
				local var_180_4 = Vector3.New(0.7, -0.87, -5.7)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1111ui_story, var_180_4, var_180_3)

				local var_180_5 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_5.x, var_180_5.y, var_180_5.z)

				local var_180_6 = var_180_0.localEulerAngles

				var_180_6.z = 0
				var_180_6.x = 0
				var_180_0.localEulerAngles = var_180_6
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 then
				var_180_0.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_180_7 = manager.ui.mainCamera.transform.position - var_180_0.position

				var_180_0.forward = Vector3.New(var_180_7.x, var_180_7.y, var_180_7.z)

				local var_180_8 = var_180_0.localEulerAngles

				var_180_8.z = 0
				var_180_8.x = 0
				var_180_0.localEulerAngles = var_180_8
			end

			local var_180_9 = arg_177_1.actors_["1111ui_story"]
			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 and not isNil(var_180_9) and arg_177_1.var_.characterEffect1111ui_story == nil then
				arg_177_1.var_.characterEffect1111ui_story = var_180_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_11 = 0.200000002980232

			if var_180_10 <= arg_177_1.time_ and arg_177_1.time_ < var_180_10 + var_180_11 and not isNil(var_180_9) then
				local var_180_12 = (arg_177_1.time_ - var_180_10) / var_180_11

				if arg_177_1.var_.characterEffect1111ui_story and not isNil(var_180_9) then
					arg_177_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_10 + var_180_11 and arg_177_1.time_ < var_180_10 + var_180_11 + arg_180_0 and not isNil(var_180_9) and arg_177_1.var_.characterEffect1111ui_story then
				arg_177_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_180_13 = 0

			if var_180_13 < arg_177_1.time_ and arg_177_1.time_ <= var_180_13 + arg_180_0 then
				arg_177_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_2")
			end

			local var_180_14 = 0

			if var_180_14 < arg_177_1.time_ and arg_177_1.time_ <= var_180_14 + arg_180_0 then
				arg_177_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_180_15 = arg_177_1.actors_["1011ui_story"]
			local var_180_16 = 0

			if var_180_16 < arg_177_1.time_ and arg_177_1.time_ <= var_180_16 + arg_180_0 and not isNil(var_180_15) and arg_177_1.var_.characterEffect1011ui_story == nil then
				arg_177_1.var_.characterEffect1011ui_story = var_180_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_17 = 0.200000002980232

			if var_180_16 <= arg_177_1.time_ and arg_177_1.time_ < var_180_16 + var_180_17 and not isNil(var_180_15) then
				local var_180_18 = (arg_177_1.time_ - var_180_16) / var_180_17

				if arg_177_1.var_.characterEffect1011ui_story and not isNil(var_180_15) then
					local var_180_19 = Mathf.Lerp(0, 0.5, var_180_18)

					arg_177_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1011ui_story.fillRatio = var_180_19
				end
			end

			if arg_177_1.time_ >= var_180_16 + var_180_17 and arg_177_1.time_ < var_180_16 + var_180_17 + arg_180_0 and not isNil(var_180_15) and arg_177_1.var_.characterEffect1011ui_story then
				local var_180_20 = 0.5

				arg_177_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1011ui_story.fillRatio = var_180_20
			end

			local var_180_21 = 0
			local var_180_22 = 0.175

			if var_180_21 < arg_177_1.time_ and arg_177_1.time_ <= var_180_21 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_23 = arg_177_1:FormatText(StoryNameCfg[67].name)

				arg_177_1.leftNameTxt_.text = var_180_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_24 = arg_177_1:GetWordFromCfg(1101106043)
				local var_180_25 = arg_177_1:FormatText(var_180_24.content)

				arg_177_1.text_.text = var_180_25

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_26 = 7
				local var_180_27 = utf8.len(var_180_25)
				local var_180_28 = var_180_26 <= 0 and var_180_22 or var_180_22 * (var_180_27 / var_180_26)

				if var_180_28 > 0 and var_180_22 < var_180_28 then
					arg_177_1.talkMaxDuration = var_180_28

					if var_180_28 + var_180_21 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_28 + var_180_21
					end
				end

				arg_177_1.text_.text = var_180_25
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb") ~= 0 then
					local var_180_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb") / 1000

					if var_180_29 + var_180_21 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_29 + var_180_21
					end

					if var_180_24.prefab_name ~= "" and arg_177_1.actors_[var_180_24.prefab_name] ~= nil then
						local var_180_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_24.prefab_name].transform, "story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")

						arg_177_1:RecordAudio("1101106043", var_180_30)
						arg_177_1:RecordAudio("1101106043", var_180_30)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_31 = math.max(var_180_22, arg_177_1.talkMaxDuration)

			if var_180_21 <= arg_177_1.time_ and arg_177_1.time_ < var_180_21 + var_180_31 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_21) / var_180_31

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_21 + var_180_31 and arg_177_1.time_ < var_180_21 + var_180_31 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1101106044
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1101106045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1011ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1011ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(0, 100, 0)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1011ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, 100, 0)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1111ui_story"].transform
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1.var_.moveOldPos1111ui_story = var_184_9.localPosition
			end

			local var_184_11 = 0.001

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11
				local var_184_13 = Vector3.New(0, 100, 0)

				var_184_9.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1111ui_story, var_184_13, var_184_12)

				local var_184_14 = manager.ui.mainCamera.transform.position - var_184_9.position

				var_184_9.forward = Vector3.New(var_184_14.x, var_184_14.y, var_184_14.z)

				local var_184_15 = var_184_9.localEulerAngles

				var_184_15.z = 0
				var_184_15.x = 0
				var_184_9.localEulerAngles = var_184_15
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 then
				var_184_9.localPosition = Vector3.New(0, 100, 0)

				local var_184_16 = manager.ui.mainCamera.transform.position - var_184_9.position

				var_184_9.forward = Vector3.New(var_184_16.x, var_184_16.y, var_184_16.z)

				local var_184_17 = var_184_9.localEulerAngles

				var_184_17.z = 0
				var_184_17.x = 0
				var_184_9.localEulerAngles = var_184_17
			end

			local var_184_18 = 0
			local var_184_19 = 0.5

			if var_184_18 < arg_181_1.time_ and arg_181_1.time_ <= var_184_18 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_20 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_21 = arg_181_1:GetWordFromCfg(1101106044)
				local var_184_22 = arg_181_1:FormatText(var_184_21.content)

				arg_181_1.text_.text = var_184_22

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_23 = 20
				local var_184_24 = utf8.len(var_184_22)
				local var_184_25 = var_184_23 <= 0 and var_184_19 or var_184_19 * (var_184_24 / var_184_23)

				if var_184_25 > 0 and var_184_19 < var_184_25 then
					arg_181_1.talkMaxDuration = var_184_25

					if var_184_25 + var_184_18 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_25 + var_184_18
					end
				end

				arg_181_1.text_.text = var_184_22
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_26 = math.max(var_184_19, arg_181_1.talkMaxDuration)

			if var_184_18 <= arg_181_1.time_ and arg_181_1.time_ < var_184_18 + var_184_26 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_18) / var_184_26

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_18 + var_184_26 and arg_181_1.time_ < var_184_18 + var_184_26 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1101106045
		arg_185_1.duration_ = 9

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1101106046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = "ST04b"

			if arg_185_1.bgs_[var_188_0] == nil then
				local var_188_1 = Object.Instantiate(arg_185_1.paintGo_)

				var_188_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_188_0)
				var_188_1.name = var_188_0
				var_188_1.transform.parent = arg_185_1.stage_.transform
				var_188_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_185_1.bgs_[var_188_0] = var_188_1
			end

			local var_188_2 = 2

			if var_188_2 < arg_185_1.time_ and arg_185_1.time_ <= var_188_2 + arg_188_0 then
				local var_188_3 = manager.ui.mainCamera.transform.localPosition
				local var_188_4 = Vector3.New(0, 0, 10) + Vector3.New(var_188_3.x, var_188_3.y, 0)
				local var_188_5 = arg_185_1.bgs_.ST04b

				var_188_5.transform.localPosition = var_188_4
				var_188_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_188_6 = var_188_5:GetComponent("SpriteRenderer")

				if var_188_6 and var_188_6.sprite then
					local var_188_7 = (var_188_5.transform.localPosition - var_188_3).z
					local var_188_8 = manager.ui.mainCameraCom_
					local var_188_9 = 2 * var_188_7 * Mathf.Tan(var_188_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_188_10 = var_188_9 * var_188_8.aspect
					local var_188_11 = var_188_6.sprite.bounds.size.x
					local var_188_12 = var_188_6.sprite.bounds.size.y
					local var_188_13 = var_188_10 / var_188_11
					local var_188_14 = var_188_9 / var_188_12
					local var_188_15 = var_188_14 < var_188_13 and var_188_13 or var_188_14

					var_188_5.transform.localScale = Vector3.New(var_188_15, var_188_15, 0)
				end

				for iter_188_0, iter_188_1 in pairs(arg_185_1.bgs_) do
					if iter_188_0 ~= "ST04b" then
						iter_188_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_188_16 = 0

			if var_188_16 < arg_185_1.time_ and arg_185_1.time_ <= var_188_16 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_17 = 2

			if var_188_16 <= arg_185_1.time_ and arg_185_1.time_ < var_188_16 + var_188_17 then
				local var_188_18 = (arg_185_1.time_ - var_188_16) / var_188_17
				local var_188_19 = Color.New(0, 0, 0)

				var_188_19.a = Mathf.Lerp(0, 1, var_188_18)
				arg_185_1.mask_.color = var_188_19
			end

			if arg_185_1.time_ >= var_188_16 + var_188_17 and arg_185_1.time_ < var_188_16 + var_188_17 + arg_188_0 then
				local var_188_20 = Color.New(0, 0, 0)

				var_188_20.a = 1
				arg_185_1.mask_.color = var_188_20
			end

			local var_188_21 = 2

			if var_188_21 < arg_185_1.time_ and arg_185_1.time_ <= var_188_21 + arg_188_0 then
				arg_185_1.mask_.enabled = true
				arg_185_1.mask_.raycastTarget = true

				arg_185_1:SetGaussion(false)
			end

			local var_188_22 = 2

			if var_188_21 <= arg_185_1.time_ and arg_185_1.time_ < var_188_21 + var_188_22 then
				local var_188_23 = (arg_185_1.time_ - var_188_21) / var_188_22
				local var_188_24 = Color.New(0, 0, 0)

				var_188_24.a = Mathf.Lerp(1, 0, var_188_23)
				arg_185_1.mask_.color = var_188_24
			end

			if arg_185_1.time_ >= var_188_21 + var_188_22 and arg_185_1.time_ < var_188_21 + var_188_22 + arg_188_0 then
				local var_188_25 = Color.New(0, 0, 0)
				local var_188_26 = 0

				arg_185_1.mask_.enabled = false
				var_188_25.a = var_188_26
				arg_185_1.mask_.color = var_188_25
			end

			if arg_185_1.frameCnt_ <= 1 then
				arg_185_1.dialog_:SetActive(false)
			end

			local var_188_27 = 4
			local var_188_28 = 1.05

			if var_188_27 < arg_185_1.time_ and arg_185_1.time_ <= var_188_27 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0

				arg_185_1.dialog_:SetActive(true)

				local var_188_29 = LeanTween.value(arg_185_1.dialog_, 0, 1, 0.3)

				var_188_29:setOnUpdate(LuaHelper.FloatAction(function(arg_189_0)
					arg_185_1.dialogCg_.alpha = arg_189_0
				end))
				var_188_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_185_1.dialog_)
					var_188_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_185_1.duration_ = arg_185_1.duration_ + 0.3

				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_30 = arg_185_1:GetWordFromCfg(1101106045)
				local var_188_31 = arg_185_1:FormatText(var_188_30.content)

				arg_185_1.text_.text = var_188_31

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_32 = 42
				local var_188_33 = utf8.len(var_188_31)
				local var_188_34 = var_188_32 <= 0 and var_188_28 or var_188_28 * (var_188_33 / var_188_32)

				if var_188_34 > 0 and var_188_28 < var_188_34 then
					arg_185_1.talkMaxDuration = var_188_34
					var_188_27 = var_188_27 + 0.3

					if var_188_34 + var_188_27 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_34 + var_188_27
					end
				end

				arg_185_1.text_.text = var_188_31
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_35 = var_188_27 + 0.3
			local var_188_36 = math.max(var_188_28, arg_185_1.talkMaxDuration)

			if var_188_35 <= arg_185_1.time_ and arg_185_1.time_ < var_188_35 + var_188_36 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_35) / var_188_36

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_35 + var_188_36 and arg_185_1.time_ < var_188_35 + var_188_36 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 1101106046
		arg_191_1.duration_ = 9.97

		local var_191_0 = {
			zh = 7.9,
			ja = 9.966
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
				arg_191_0:Play1101106047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1111ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1111ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(0, -0.87, -5.7)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1111ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["1111ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and not isNil(var_194_9) and arg_191_1.var_.characterEffect1111ui_story == nil then
				arg_191_1.var_.characterEffect1111ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 and not isNil(var_194_9) then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect1111ui_story and not isNil(var_194_9) then
					arg_191_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and not isNil(var_194_9) and arg_191_1.var_.characterEffect1111ui_story then
				arg_191_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_194_13 = 0

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 then
				arg_191_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_194_15 = 0
			local var_194_16 = 0.925

			if var_194_15 < arg_191_1.time_ and arg_191_1.time_ <= var_194_15 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_17 = arg_191_1:FormatText(StoryNameCfg[67].name)

				arg_191_1.leftNameTxt_.text = var_194_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_18 = arg_191_1:GetWordFromCfg(1101106046)
				local var_194_19 = arg_191_1:FormatText(var_194_18.content)

				arg_191_1.text_.text = var_194_19

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_20 = 37
				local var_194_21 = utf8.len(var_194_19)
				local var_194_22 = var_194_20 <= 0 and var_194_16 or var_194_16 * (var_194_21 / var_194_20)

				if var_194_22 > 0 and var_194_16 < var_194_22 then
					arg_191_1.talkMaxDuration = var_194_22

					if var_194_22 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_22 + var_194_15
					end
				end

				arg_191_1.text_.text = var_194_19
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb") ~= 0 then
					local var_194_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb") / 1000

					if var_194_23 + var_194_15 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_23 + var_194_15
					end

					if var_194_18.prefab_name ~= "" and arg_191_1.actors_[var_194_18.prefab_name] ~= nil then
						local var_194_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_18.prefab_name].transform, "story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")

						arg_191_1:RecordAudio("1101106046", var_194_24)
						arg_191_1:RecordAudio("1101106046", var_194_24)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_25 = math.max(var_194_16, arg_191_1.talkMaxDuration)

			if var_194_15 <= arg_191_1.time_ and arg_191_1.time_ < var_194_15 + var_194_25 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_15) / var_194_25

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_15 + var_194_25 and arg_191_1.time_ < var_194_15 + var_194_25 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 1101106047
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play1101106048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1111ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and not isNil(var_198_0) and arg_195_1.var_.characterEffect1111ui_story == nil then
				arg_195_1.var_.characterEffect1111ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 and not isNil(var_198_0) then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1111ui_story and not isNil(var_198_0) then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1111ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and not isNil(var_198_0) and arg_195_1.var_.characterEffect1111ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1111ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0
			local var_198_7 = 0.05

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_8 = arg_195_1:FormatText(StoryNameCfg[583].name)

				arg_195_1.leftNameTxt_.text = var_198_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_9 = arg_195_1:GetWordFromCfg(1101106047)
				local var_198_10 = arg_195_1:FormatText(var_198_9.content)

				arg_195_1.text_.text = var_198_10

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_11 = 2
				local var_198_12 = utf8.len(var_198_10)
				local var_198_13 = var_198_11 <= 0 and var_198_7 or var_198_7 * (var_198_12 / var_198_11)

				if var_198_13 > 0 and var_198_7 < var_198_13 then
					arg_195_1.talkMaxDuration = var_198_13

					if var_198_13 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_13 + var_198_6
					end
				end

				arg_195_1.text_.text = var_198_10
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_14 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_14 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_14

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_14 and arg_195_1.time_ < var_198_6 + var_198_14 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 1101106048
		arg_199_1.duration_ = 3.7

		local var_199_0 = {
			zh = 2.166,
			ja = 3.7
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
				arg_199_0:Play1101106049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1111ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos1111ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0, -0.87, -5.7)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1111ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1111ui_story"]
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 and not isNil(var_202_9) and arg_199_1.var_.characterEffect1111ui_story == nil then
				arg_199_1.var_.characterEffect1111ui_story = var_202_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_11 = 0.200000002980232

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 and not isNil(var_202_9) then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11

				if arg_199_1.var_.characterEffect1111ui_story and not isNil(var_202_9) then
					arg_199_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 and not isNil(var_202_9) and arg_199_1.var_.characterEffect1111ui_story then
				arg_199_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_202_13 = 0

			if var_202_13 < arg_199_1.time_ and arg_199_1.time_ <= var_202_13 + arg_202_0 then
				arg_199_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_202_14 = 0
			local var_202_15 = 0.175

			if var_202_14 < arg_199_1.time_ and arg_199_1.time_ <= var_202_14 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_16 = arg_199_1:FormatText(StoryNameCfg[67].name)

				arg_199_1.leftNameTxt_.text = var_202_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_17 = arg_199_1:GetWordFromCfg(1101106048)
				local var_202_18 = arg_199_1:FormatText(var_202_17.content)

				arg_199_1.text_.text = var_202_18

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_19 = 7
				local var_202_20 = utf8.len(var_202_18)
				local var_202_21 = var_202_19 <= 0 and var_202_15 or var_202_15 * (var_202_20 / var_202_19)

				if var_202_21 > 0 and var_202_15 < var_202_21 then
					arg_199_1.talkMaxDuration = var_202_21

					if var_202_21 + var_202_14 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_21 + var_202_14
					end
				end

				arg_199_1.text_.text = var_202_18
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb") ~= 0 then
					local var_202_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb") / 1000

					if var_202_22 + var_202_14 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_22 + var_202_14
					end

					if var_202_17.prefab_name ~= "" and arg_199_1.actors_[var_202_17.prefab_name] ~= nil then
						local var_202_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_17.prefab_name].transform, "story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")

						arg_199_1:RecordAudio("1101106048", var_202_23)
						arg_199_1:RecordAudio("1101106048", var_202_23)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_24 = math.max(var_202_15, arg_199_1.talkMaxDuration)

			if var_202_14 <= arg_199_1.time_ and arg_199_1.time_ < var_202_14 + var_202_24 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_14) / var_202_24

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_14 + var_202_24 and arg_199_1.time_ < var_202_14 + var_202_24 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 1101106049
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play1101106050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1111ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and not isNil(var_206_0) and arg_203_1.var_.characterEffect1111ui_story == nil then
				arg_203_1.var_.characterEffect1111ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 and not isNil(var_206_0) then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1111ui_story and not isNil(var_206_0) then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1111ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and not isNil(var_206_0) and arg_203_1.var_.characterEffect1111ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1111ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 0.625

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[7].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(1101106049)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 25
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_14 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_14 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_14

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_14 and arg_203_1.time_ < var_206_6 + var_206_14 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 1101106050
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play1101106051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1111ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1111ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(0, 100, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1111ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(0, 100, 0)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = 0
			local var_210_10 = 0.725

			if var_210_9 < arg_207_1.time_ and arg_207_1.time_ <= var_210_9 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_11 = arg_207_1:GetWordFromCfg(1101106050)
				local var_210_12 = arg_207_1:FormatText(var_210_11.content)

				arg_207_1.text_.text = var_210_12

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_13 = 29
				local var_210_14 = utf8.len(var_210_12)
				local var_210_15 = var_210_13 <= 0 and var_210_10 or var_210_10 * (var_210_14 / var_210_13)

				if var_210_15 > 0 and var_210_10 < var_210_15 then
					arg_207_1.talkMaxDuration = var_210_15

					if var_210_15 + var_210_9 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_15 + var_210_9
					end
				end

				arg_207_1.text_.text = var_210_12
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_16 = math.max(var_210_10, arg_207_1.talkMaxDuration)

			if var_210_9 <= arg_207_1.time_ and arg_207_1.time_ < var_210_9 + var_210_16 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_9) / var_210_16

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_9 + var_210_16 and arg_207_1.time_ < var_210_9 + var_210_16 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 1101106051
		arg_211_1.duration_ = 5.2

		local var_211_0 = {
			zh = 5.2,
			ja = 4.466
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
				arg_211_0:Play1101106052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1111ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1111ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(0, -0.87, -5.7)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1111ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["1111ui_story"]
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 and not isNil(var_214_9) and arg_211_1.var_.characterEffect1111ui_story == nil then
				arg_211_1.var_.characterEffect1111ui_story = var_214_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_11 = 0.200000002980232

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 and not isNil(var_214_9) then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11

				if arg_211_1.var_.characterEffect1111ui_story and not isNil(var_214_9) then
					arg_211_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 and not isNil(var_214_9) and arg_211_1.var_.characterEffect1111ui_story then
				arg_211_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_214_13 = 0

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action9_1")
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_214_15 = 0
			local var_214_16 = 0.5

			if var_214_15 < arg_211_1.time_ and arg_211_1.time_ <= var_214_15 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_17 = arg_211_1:FormatText(StoryNameCfg[67].name)

				arg_211_1.leftNameTxt_.text = var_214_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_18 = arg_211_1:GetWordFromCfg(1101106051)
				local var_214_19 = arg_211_1:FormatText(var_214_18.content)

				arg_211_1.text_.text = var_214_19

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_20 = 20
				local var_214_21 = utf8.len(var_214_19)
				local var_214_22 = var_214_20 <= 0 and var_214_16 or var_214_16 * (var_214_21 / var_214_20)

				if var_214_22 > 0 and var_214_16 < var_214_22 then
					arg_211_1.talkMaxDuration = var_214_22

					if var_214_22 + var_214_15 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_22 + var_214_15
					end
				end

				arg_211_1.text_.text = var_214_19
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb") ~= 0 then
					local var_214_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb") / 1000

					if var_214_23 + var_214_15 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_23 + var_214_15
					end

					if var_214_18.prefab_name ~= "" and arg_211_1.actors_[var_214_18.prefab_name] ~= nil then
						local var_214_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_18.prefab_name].transform, "story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")

						arg_211_1:RecordAudio("1101106051", var_214_24)
						arg_211_1:RecordAudio("1101106051", var_214_24)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_25 = math.max(var_214_16, arg_211_1.talkMaxDuration)

			if var_214_15 <= arg_211_1.time_ and arg_211_1.time_ < var_214_15 + var_214_25 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_15) / var_214_25

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_15 + var_214_25 and arg_211_1.time_ < var_214_15 + var_214_25 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 1101106052
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play1101106053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1111ui_story"].transform
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.var_.moveOldPos1111ui_story = var_218_0.localPosition
			end

			local var_218_2 = 0.001

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2
				local var_218_4 = Vector3.New(0, 100, 0)

				var_218_0.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1111ui_story, var_218_4, var_218_3)

				local var_218_5 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_5.x, var_218_5.y, var_218_5.z)

				local var_218_6 = var_218_0.localEulerAngles

				var_218_6.z = 0
				var_218_6.x = 0
				var_218_0.localEulerAngles = var_218_6
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 then
				var_218_0.localPosition = Vector3.New(0, 100, 0)

				local var_218_7 = manager.ui.mainCamera.transform.position - var_218_0.position

				var_218_0.forward = Vector3.New(var_218_7.x, var_218_7.y, var_218_7.z)

				local var_218_8 = var_218_0.localEulerAngles

				var_218_8.z = 0
				var_218_8.x = 0
				var_218_0.localEulerAngles = var_218_8
			end

			local var_218_9 = arg_215_1.actors_["1111ui_story"]
			local var_218_10 = 0

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 and not isNil(var_218_9) and arg_215_1.var_.characterEffect1111ui_story == nil then
				arg_215_1.var_.characterEffect1111ui_story = var_218_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_11 = 0.200000002980232

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_11 and not isNil(var_218_9) then
				local var_218_12 = (arg_215_1.time_ - var_218_10) / var_218_11

				if arg_215_1.var_.characterEffect1111ui_story and not isNil(var_218_9) then
					local var_218_13 = Mathf.Lerp(0, 0.5, var_218_12)

					arg_215_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1111ui_story.fillRatio = var_218_13
				end
			end

			if arg_215_1.time_ >= var_218_10 + var_218_11 and arg_215_1.time_ < var_218_10 + var_218_11 + arg_218_0 and not isNil(var_218_9) and arg_215_1.var_.characterEffect1111ui_story then
				local var_218_14 = 0.5

				arg_215_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1111ui_story.fillRatio = var_218_14
			end

			local var_218_15 = 0
			local var_218_16 = 0.4

			if var_218_15 < arg_215_1.time_ and arg_215_1.time_ <= var_218_15 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_17 = arg_215_1:GetWordFromCfg(1101106052)
				local var_218_18 = arg_215_1:FormatText(var_218_17.content)

				arg_215_1.text_.text = var_218_18

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_19 = 16
				local var_218_20 = utf8.len(var_218_18)
				local var_218_21 = var_218_19 <= 0 and var_218_16 or var_218_16 * (var_218_20 / var_218_19)

				if var_218_21 > 0 and var_218_16 < var_218_21 then
					arg_215_1.talkMaxDuration = var_218_21

					if var_218_21 + var_218_15 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_21 + var_218_15
					end
				end

				arg_215_1.text_.text = var_218_18
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_22 = math.max(var_218_16, arg_215_1.talkMaxDuration)

			if var_218_15 <= arg_215_1.time_ and arg_215_1.time_ < var_218_15 + var_218_22 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_15) / var_218_22

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_15 + var_218_22 and arg_215_1.time_ < var_218_15 + var_218_22 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 1101106053
		arg_219_1.duration_ = 8

		local var_219_0 = {
			zh = 5.4,
			ja = 8
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
				arg_219_0:Play1101106054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1011ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1011ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(0, -0.71, -6)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1011ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1011ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and not isNil(var_222_9) and arg_219_1.var_.characterEffect1011ui_story == nil then
				arg_219_1.var_.characterEffect1011ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 and not isNil(var_222_9) then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1011ui_story and not isNil(var_222_9) then
					arg_219_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and not isNil(var_222_9) and arg_219_1.var_.characterEffect1011ui_story then
				arg_219_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_222_13 = 0

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_222_14 = 0

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_222_15 = 0
			local var_222_16 = 0.6

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[37].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(1101106053)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 24
				local var_222_21 = utf8.len(var_222_19)
				local var_222_22 = var_222_20 <= 0 and var_222_16 or var_222_16 * (var_222_21 / var_222_20)

				if var_222_22 > 0 and var_222_16 < var_222_22 then
					arg_219_1.talkMaxDuration = var_222_22

					if var_222_22 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_22 + var_222_15
					end
				end

				arg_219_1.text_.text = var_222_19
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")

						arg_219_1:RecordAudio("1101106053", var_222_24)
						arg_219_1:RecordAudio("1101106053", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_25 = math.max(var_222_16, arg_219_1.talkMaxDuration)

			if var_222_15 <= arg_219_1.time_ and arg_219_1.time_ < var_222_15 + var_222_25 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_15) / var_222_25

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_15 + var_222_25 and arg_219_1.time_ < var_222_15 + var_222_25 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 1101106054
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play1101106055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1011ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and not isNil(var_226_0) and arg_223_1.var_.characterEffect1011ui_story == nil then
				arg_223_1.var_.characterEffect1011ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.200000002980232

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 and not isNil(var_226_0) then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1011ui_story and not isNil(var_226_0) then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1011ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and not isNil(var_226_0) and arg_223_1.var_.characterEffect1011ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1011ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.5

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[7].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(1101106054)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 20
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_14 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_14 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_14

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_14 and arg_223_1.time_ < var_226_6 + var_226_14 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 1101106055
		arg_227_1.duration_ = 7.9

		local var_227_0 = {
			zh = 6.1,
			ja = 7.9
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
				arg_227_0:Play1101106056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1011ui_story"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos1011ui_story = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, -0.71, -6)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1011ui_story, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = arg_227_1.actors_["1011ui_story"]
			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 and not isNil(var_230_9) and arg_227_1.var_.characterEffect1011ui_story == nil then
				arg_227_1.var_.characterEffect1011ui_story = var_230_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_11 = 0.200000002980232

			if var_230_10 <= arg_227_1.time_ and arg_227_1.time_ < var_230_10 + var_230_11 and not isNil(var_230_9) then
				local var_230_12 = (arg_227_1.time_ - var_230_10) / var_230_11

				if arg_227_1.var_.characterEffect1011ui_story and not isNil(var_230_9) then
					arg_227_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_10 + var_230_11 and arg_227_1.time_ < var_230_10 + var_230_11 + arg_230_0 and not isNil(var_230_9) and arg_227_1.var_.characterEffect1011ui_story then
				arg_227_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_230_13 = 0

			if var_230_13 < arg_227_1.time_ and arg_227_1.time_ <= var_230_13 + arg_230_0 then
				arg_227_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_230_15 = 0
			local var_230_16 = 0.65

			if var_230_15 < arg_227_1.time_ and arg_227_1.time_ <= var_230_15 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_17 = arg_227_1:FormatText(StoryNameCfg[37].name)

				arg_227_1.leftNameTxt_.text = var_230_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_18 = arg_227_1:GetWordFromCfg(1101106055)
				local var_230_19 = arg_227_1:FormatText(var_230_18.content)

				arg_227_1.text_.text = var_230_19

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_20 = 26
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb") ~= 0 then
					local var_230_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb") / 1000

					if var_230_23 + var_230_15 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_23 + var_230_15
					end

					if var_230_18.prefab_name ~= "" and arg_227_1.actors_[var_230_18.prefab_name] ~= nil then
						local var_230_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_18.prefab_name].transform, "story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")

						arg_227_1:RecordAudio("1101106055", var_230_24)
						arg_227_1:RecordAudio("1101106055", var_230_24)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")
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
	Play1101106056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 1101106056
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play1101106057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1011ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and not isNil(var_234_0) and arg_231_1.var_.characterEffect1011ui_story == nil then
				arg_231_1.var_.characterEffect1011ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 and not isNil(var_234_0) then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1011ui_story and not isNil(var_234_0) then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1011ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and not isNil(var_234_0) and arg_231_1.var_.characterEffect1011ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1011ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 0.725

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_8 = arg_231_1:FormatText(StoryNameCfg[7].name)

				arg_231_1.leftNameTxt_.text = var_234_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_9 = arg_231_1:GetWordFromCfg(1101106056)
				local var_234_10 = arg_231_1:FormatText(var_234_9.content)

				arg_231_1.text_.text = var_234_10

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_11 = 29
				local var_234_12 = utf8.len(var_234_10)
				local var_234_13 = var_234_11 <= 0 and var_234_7 or var_234_7 * (var_234_12 / var_234_11)

				if var_234_13 > 0 and var_234_7 < var_234_13 then
					arg_231_1.talkMaxDuration = var_234_13

					if var_234_13 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_10
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_14 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_14 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_14

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_14 and arg_231_1.time_ < var_234_6 + var_234_14 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 1101106057
		arg_235_1.duration_ = 4.2

		local var_235_0 = {
			zh = 2.466,
			ja = 4.2
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
				arg_235_0:Play1101106058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1011ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1011ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, -0.71, -6)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1011ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.actors_["1011ui_story"]
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 and not isNil(var_238_9) and arg_235_1.var_.characterEffect1011ui_story == nil then
				arg_235_1.var_.characterEffect1011ui_story = var_238_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_11 = 0.200000002980232

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 and not isNil(var_238_9) then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11

				if arg_235_1.var_.characterEffect1011ui_story and not isNil(var_238_9) then
					arg_235_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 and not isNil(var_238_9) and arg_235_1.var_.characterEffect1011ui_story then
				arg_235_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_238_13 = 0

			if var_238_13 < arg_235_1.time_ and arg_235_1.time_ <= var_238_13 + arg_238_0 then
				arg_235_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_2")
			end

			local var_238_14 = 0

			if var_238_14 < arg_235_1.time_ and arg_235_1.time_ <= var_238_14 + arg_238_0 then
				arg_235_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_238_15 = 0
			local var_238_16 = 0.225

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_17 = arg_235_1:FormatText(StoryNameCfg[37].name)

				arg_235_1.leftNameTxt_.text = var_238_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_18 = arg_235_1:GetWordFromCfg(1101106057)
				local var_238_19 = arg_235_1:FormatText(var_238_18.content)

				arg_235_1.text_.text = var_238_19

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_20 = 9
				local var_238_21 = utf8.len(var_238_19)
				local var_238_22 = var_238_20 <= 0 and var_238_16 or var_238_16 * (var_238_21 / var_238_20)

				if var_238_22 > 0 and var_238_16 < var_238_22 then
					arg_235_1.talkMaxDuration = var_238_22

					if var_238_22 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_22 + var_238_15
					end
				end

				arg_235_1.text_.text = var_238_19
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb") ~= 0 then
					local var_238_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb") / 1000

					if var_238_23 + var_238_15 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_23 + var_238_15
					end

					if var_238_18.prefab_name ~= "" and arg_235_1.actors_[var_238_18.prefab_name] ~= nil then
						local var_238_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_18.prefab_name].transform, "story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")

						arg_235_1:RecordAudio("1101106057", var_238_24)
						arg_235_1:RecordAudio("1101106057", var_238_24)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_25 = math.max(var_238_16, arg_235_1.talkMaxDuration)

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_25 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_15) / var_238_25

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_15 + var_238_25 and arg_235_1.time_ < var_238_15 + var_238_25 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 1101106058
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play1101106059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1011ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and not isNil(var_242_0) and arg_239_1.var_.characterEffect1011ui_story == nil then
				arg_239_1.var_.characterEffect1011ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.200000002980232

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 and not isNil(var_242_0) then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1011ui_story and not isNil(var_242_0) then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1011ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and not isNil(var_242_0) and arg_239_1.var_.characterEffect1011ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1011ui_story.fillRatio = var_242_5
			end

			local var_242_6 = 0
			local var_242_7 = 1.05

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(1101106058)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 42
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_14 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_14 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_14

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_14 and arg_239_1.time_ < var_242_6 + var_242_14 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 1101106059
		arg_243_1.duration_ = 5

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play1101106060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_246_1 = 0
			local var_246_2 = 1.075

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, false)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(1101106059)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 43
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_2 or var_246_2 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_2 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_1 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_1
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)
				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_8 = math.max(var_246_2, arg_243_1.talkMaxDuration)

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_8 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_1) / var_246_8

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_1 + var_246_8 and arg_243_1.time_ < var_246_1 + var_246_8 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 1101106060
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play1101106061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.125

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[7].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(1101106060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 5
				local var_250_6 = utf8.len(var_250_4)
				local var_250_7 = var_250_5 <= 0 and var_250_1 or var_250_1 * (var_250_6 / var_250_5)

				if var_250_7 > 0 and var_250_1 < var_250_7 then
					arg_247_1.talkMaxDuration = var_250_7

					if var_250_7 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_7 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_4
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_8 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_8 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_8

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_8 and arg_247_1.time_ < var_250_0 + var_250_8 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 1101106061
		arg_251_1.duration_ = 4.3

		local var_251_0 = {
			zh = 4.166,
			ja = 4.3
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
				arg_251_0:Play1101106062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1011ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1011ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(0, -0.71, -6)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1011ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1011ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and not isNil(var_254_9) and arg_251_1.var_.characterEffect1011ui_story == nil then
				arg_251_1.var_.characterEffect1011ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 and not isNil(var_254_9) then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1011ui_story and not isNil(var_254_9) then
					arg_251_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and not isNil(var_254_9) and arg_251_1.var_.characterEffect1011ui_story then
				arg_251_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_254_15 = 0
			local var_254_16 = 0.375

			if var_254_15 < arg_251_1.time_ and arg_251_1.time_ <= var_254_15 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_17 = arg_251_1:FormatText(StoryNameCfg[37].name)

				arg_251_1.leftNameTxt_.text = var_254_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_18 = arg_251_1:GetWordFromCfg(1101106061)
				local var_254_19 = arg_251_1:FormatText(var_254_18.content)

				arg_251_1.text_.text = var_254_19

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_20 = 15
				local var_254_21 = utf8.len(var_254_19)
				local var_254_22 = var_254_20 <= 0 and var_254_16 or var_254_16 * (var_254_21 / var_254_20)

				if var_254_22 > 0 and var_254_16 < var_254_22 then
					arg_251_1.talkMaxDuration = var_254_22

					if var_254_22 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_22 + var_254_15
					end
				end

				arg_251_1.text_.text = var_254_19
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb") ~= 0 then
					local var_254_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb") / 1000

					if var_254_23 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_23 + var_254_15
					end

					if var_254_18.prefab_name ~= "" and arg_251_1.actors_[var_254_18.prefab_name] ~= nil then
						local var_254_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_18.prefab_name].transform, "story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")

						arg_251_1:RecordAudio("1101106061", var_254_24)
						arg_251_1:RecordAudio("1101106061", var_254_24)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_25 = math.max(var_254_16, arg_251_1.talkMaxDuration)

			if var_254_15 <= arg_251_1.time_ and arg_251_1.time_ < var_254_15 + var_254_25 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_15) / var_254_25

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_15 + var_254_25 and arg_251_1.time_ < var_254_15 + var_254_25 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 1101106062
		arg_255_1.duration_ = 5.93

		local var_255_0 = {
			zh = 3.933,
			ja = 5.933
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
				arg_255_0:Play1101106063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.375

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[37].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(1101106062)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 15
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")

						arg_255_1:RecordAudio("1101106062", var_258_9)
						arg_255_1:RecordAudio("1101106062", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 1101106063
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play1101106064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1011ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and not isNil(var_262_0) and arg_259_1.var_.characterEffect1011ui_story == nil then
				arg_259_1.var_.characterEffect1011ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 and not isNil(var_262_0) then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1011ui_story and not isNil(var_262_0) then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1011ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and not isNil(var_262_0) and arg_259_1.var_.characterEffect1011ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1011ui_story.fillRatio = var_262_5
			end

			local var_262_6 = 0

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_262_7 = 0
			local var_262_8 = 1.1

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_9 = arg_259_1:GetWordFromCfg(1101106063)
				local var_262_10 = arg_259_1:FormatText(var_262_9.content)

				arg_259_1.text_.text = var_262_10

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_11 = 44
				local var_262_12 = utf8.len(var_262_10)
				local var_262_13 = var_262_11 <= 0 and var_262_8 or var_262_8 * (var_262_12 / var_262_11)

				if var_262_13 > 0 and var_262_8 < var_262_13 then
					arg_259_1.talkMaxDuration = var_262_13

					if var_262_13 + var_262_7 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_13 + var_262_7
					end
				end

				arg_259_1.text_.text = var_262_10
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_14 = math.max(var_262_8, arg_259_1.talkMaxDuration)

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_14 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_7) / var_262_14

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_7 + var_262_14 and arg_259_1.time_ < var_262_7 + var_262_14 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1101106064
		arg_263_1.duration_ = 4.47

		local var_263_0 = {
			zh = 1.533,
			ja = 4.466
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
				arg_263_0:Play1101106065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.175

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[146].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, true)
				arg_263_1.iconController_:SetSelectedState("hero")

				arg_263_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_263_1.callingController_:SetSelectedState("normal")

				arg_263_1.keyicon_.color = Color.New(1, 1, 1)
				arg_263_1.icon_.color = Color.New(1, 1, 1)

				local var_266_3 = arg_263_1:GetWordFromCfg(1101106064)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb") ~= 0 then
					local var_266_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb") / 1000

					if var_266_8 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_0
					end

					if var_266_3.prefab_name ~= "" and arg_263_1.actors_[var_266_3.prefab_name] ~= nil then
						local var_266_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_3.prefab_name].transform, "story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")

						arg_263_1:RecordAudio("1101106064", var_266_9)
						arg_263_1:RecordAudio("1101106064", var_266_9)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_10 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_10 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_10

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_10 and arg_263_1.time_ < var_266_0 + var_266_10 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1101106065
		arg_267_1.duration_ = 2

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1101106066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1011ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1011ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, -0.71, -6)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1011ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = arg_267_1.actors_["1011ui_story"]
			local var_270_10 = 0

			if var_270_10 < arg_267_1.time_ and arg_267_1.time_ <= var_270_10 + arg_270_0 and not isNil(var_270_9) and arg_267_1.var_.characterEffect1011ui_story == nil then
				arg_267_1.var_.characterEffect1011ui_story = var_270_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_11 = 0.200000002980232

			if var_270_10 <= arg_267_1.time_ and arg_267_1.time_ < var_270_10 + var_270_11 and not isNil(var_270_9) then
				local var_270_12 = (arg_267_1.time_ - var_270_10) / var_270_11

				if arg_267_1.var_.characterEffect1011ui_story and not isNil(var_270_9) then
					arg_267_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_267_1.time_ >= var_270_10 + var_270_11 and arg_267_1.time_ < var_270_10 + var_270_11 + arg_270_0 and not isNil(var_270_9) and arg_267_1.var_.characterEffect1011ui_story then
				arg_267_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_270_13 = 0

			if var_270_13 < arg_267_1.time_ and arg_267_1.time_ <= var_270_13 + arg_270_0 then
				arg_267_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 then
				arg_267_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_270_15 = 0
			local var_270_16 = 0.075

			if var_270_15 < arg_267_1.time_ and arg_267_1.time_ <= var_270_15 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_17 = arg_267_1:FormatText(StoryNameCfg[37].name)

				arg_267_1.leftNameTxt_.text = var_270_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_18 = arg_267_1:GetWordFromCfg(1101106065)
				local var_270_19 = arg_267_1:FormatText(var_270_18.content)

				arg_267_1.text_.text = var_270_19

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_20 = 3
				local var_270_21 = utf8.len(var_270_19)
				local var_270_22 = var_270_20 <= 0 and var_270_16 or var_270_16 * (var_270_21 / var_270_20)

				if var_270_22 > 0 and var_270_16 < var_270_22 then
					arg_267_1.talkMaxDuration = var_270_22

					if var_270_22 + var_270_15 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_22 + var_270_15
					end
				end

				arg_267_1.text_.text = var_270_19
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb") ~= 0 then
					local var_270_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb") / 1000

					if var_270_23 + var_270_15 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_23 + var_270_15
					end

					if var_270_18.prefab_name ~= "" and arg_267_1.actors_[var_270_18.prefab_name] ~= nil then
						local var_270_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_18.prefab_name].transform, "story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")

						arg_267_1:RecordAudio("1101106065", var_270_24)
						arg_267_1:RecordAudio("1101106065", var_270_24)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_25 = math.max(var_270_16, arg_267_1.talkMaxDuration)

			if var_270_15 <= arg_267_1.time_ and arg_267_1.time_ < var_270_15 + var_270_25 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_15) / var_270_25

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_15 + var_270_25 and arg_267_1.time_ < var_270_15 + var_270_25 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 1101106066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play1101106067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1011ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and not isNil(var_274_0) and arg_271_1.var_.characterEffect1011ui_story == nil then
				arg_271_1.var_.characterEffect1011ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 and not isNil(var_274_0) then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1011ui_story and not isNil(var_274_0) then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1011ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and not isNil(var_274_0) and arg_271_1.var_.characterEffect1011ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1011ui_story.fillRatio = var_274_5
			end

			local var_274_6 = 0
			local var_274_7 = 0.525

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_8 = arg_271_1:GetWordFromCfg(1101106066)
				local var_274_9 = arg_271_1:FormatText(var_274_8.content)

				arg_271_1.text_.text = var_274_9

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_10 = 38
				local var_274_11 = utf8.len(var_274_9)
				local var_274_12 = var_274_10 <= 0 and var_274_7 or var_274_7 * (var_274_11 / var_274_10)

				if var_274_12 > 0 and var_274_7 < var_274_12 then
					arg_271_1.talkMaxDuration = var_274_12

					if var_274_12 + var_274_6 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_12 + var_274_6
					end
				end

				arg_271_1.text_.text = var_274_9
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_13 = math.max(var_274_7, arg_271_1.talkMaxDuration)

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_13 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_6) / var_274_13

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_6 + var_274_13 and arg_271_1.time_ < var_274_6 + var_274_13 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 1101106067
		arg_275_1.duration_ = 6.73

		local var_275_0 = {
			zh = 3.7,
			ja = 6.733
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play1101106068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.525

			if var_278_0 < arg_275_1.time_ and arg_275_1.time_ <= var_278_0 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_2 = arg_275_1:FormatText(StoryNameCfg[146].name)

				arg_275_1.leftNameTxt_.text = var_278_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, true)
				arg_275_1.iconController_:SetSelectedState("hero")

				arg_275_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_275_1.callingController_:SetSelectedState("normal")

				arg_275_1.keyicon_.color = Color.New(1, 1, 1)
				arg_275_1.icon_.color = Color.New(1, 1, 1)

				local var_278_3 = arg_275_1:GetWordFromCfg(1101106067)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 21
				local var_278_6 = utf8.len(var_278_4)
				local var_278_7 = var_278_5 <= 0 and var_278_1 or var_278_1 * (var_278_6 / var_278_5)

				if var_278_7 > 0 and var_278_1 < var_278_7 then
					arg_275_1.talkMaxDuration = var_278_7

					if var_278_7 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_7 + var_278_0
					end
				end

				arg_275_1.text_.text = var_278_4
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb") ~= 0 then
					local var_278_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb") / 1000

					if var_278_8 + var_278_0 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_8 + var_278_0
					end

					if var_278_3.prefab_name ~= "" and arg_275_1.actors_[var_278_3.prefab_name] ~= nil then
						local var_278_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_3.prefab_name].transform, "story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")

						arg_275_1:RecordAudio("1101106067", var_278_9)
						arg_275_1:RecordAudio("1101106067", var_278_9)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_10 = math.max(var_278_1, arg_275_1.talkMaxDuration)

			if var_278_0 <= arg_275_1.time_ and arg_275_1.time_ < var_278_0 + var_278_10 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_0) / var_278_10

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_0 + var_278_10 and arg_275_1.time_ < var_278_0 + var_278_10 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 1101106068
		arg_279_1.duration_ = 4.63

		local var_279_0 = {
			zh = 3.566,
			ja = 4.633
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
				arg_279_0:Play1101106069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1011ui_story"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos1011ui_story = var_282_0.localPosition
			end

			local var_282_2 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2
				local var_282_4 = Vector3.New(0, -0.71, -6)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos1011ui_story, var_282_4, var_282_3)

				local var_282_5 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_5.x, var_282_5.y, var_282_5.z)

				local var_282_6 = var_282_0.localEulerAngles

				var_282_6.z = 0
				var_282_6.x = 0
				var_282_0.localEulerAngles = var_282_6
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_282_7 = manager.ui.mainCamera.transform.position - var_282_0.position

				var_282_0.forward = Vector3.New(var_282_7.x, var_282_7.y, var_282_7.z)

				local var_282_8 = var_282_0.localEulerAngles

				var_282_8.z = 0
				var_282_8.x = 0
				var_282_0.localEulerAngles = var_282_8
			end

			local var_282_9 = arg_279_1.actors_["1011ui_story"]
			local var_282_10 = 0

			if var_282_10 < arg_279_1.time_ and arg_279_1.time_ <= var_282_10 + arg_282_0 and not isNil(var_282_9) and arg_279_1.var_.characterEffect1011ui_story == nil then
				arg_279_1.var_.characterEffect1011ui_story = var_282_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_11 = 0.200000002980232

			if var_282_10 <= arg_279_1.time_ and arg_279_1.time_ < var_282_10 + var_282_11 and not isNil(var_282_9) then
				local var_282_12 = (arg_279_1.time_ - var_282_10) / var_282_11

				if arg_279_1.var_.characterEffect1011ui_story and not isNil(var_282_9) then
					arg_279_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_10 + var_282_11 and arg_279_1.time_ < var_282_10 + var_282_11 + arg_282_0 and not isNil(var_282_9) and arg_279_1.var_.characterEffect1011ui_story then
				arg_279_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_282_13 = 0

			if var_282_13 < arg_279_1.time_ and arg_279_1.time_ <= var_282_13 + arg_282_0 then
				arg_279_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_282_14 = 0
			local var_282_15 = 0.3

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_16 = arg_279_1:FormatText(StoryNameCfg[37].name)

				arg_279_1.leftNameTxt_.text = var_282_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_17 = arg_279_1:GetWordFromCfg(1101106068)
				local var_282_18 = arg_279_1:FormatText(var_282_17.content)

				arg_279_1.text_.text = var_282_18

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_19 = 12
				local var_282_20 = utf8.len(var_282_18)
				local var_282_21 = var_282_19 <= 0 and var_282_15 or var_282_15 * (var_282_20 / var_282_19)

				if var_282_21 > 0 and var_282_15 < var_282_21 then
					arg_279_1.talkMaxDuration = var_282_21

					if var_282_21 + var_282_14 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_21 + var_282_14
					end
				end

				arg_279_1.text_.text = var_282_18
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb") ~= 0 then
					local var_282_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb") / 1000

					if var_282_22 + var_282_14 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_22 + var_282_14
					end

					if var_282_17.prefab_name ~= "" and arg_279_1.actors_[var_282_17.prefab_name] ~= nil then
						local var_282_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_17.prefab_name].transform, "story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")

						arg_279_1:RecordAudio("1101106068", var_282_23)
						arg_279_1:RecordAudio("1101106068", var_282_23)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_24 = math.max(var_282_15, arg_279_1.talkMaxDuration)

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_24 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_14) / var_282_24

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_14 + var_282_24 and arg_279_1.time_ < var_282_14 + var_282_24 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 1101106069
		arg_283_1.duration_ = 5

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play1101106070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1011ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1011ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(0, 100, 0)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1011ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0, 100, 0)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["1011ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and not isNil(var_286_9) and arg_283_1.var_.characterEffect1011ui_story == nil then
				arg_283_1.var_.characterEffect1011ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 and not isNil(var_286_9) then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect1011ui_story and not isNil(var_286_9) then
					local var_286_13 = Mathf.Lerp(0, 0.5, var_286_12)

					arg_283_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1011ui_story.fillRatio = var_286_13
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and not isNil(var_286_9) and arg_283_1.var_.characterEffect1011ui_story then
				local var_286_14 = 0.5

				arg_283_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1011ui_story.fillRatio = var_286_14
			end

			local var_286_15 = 0
			local var_286_16 = 1.1

			if var_286_15 < arg_283_1.time_ and arg_283_1.time_ <= var_286_15 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, false)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_17 = arg_283_1:GetWordFromCfg(1101106069)
				local var_286_18 = arg_283_1:FormatText(var_286_17.content)

				arg_283_1.text_.text = var_286_18

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_19 = 57
				local var_286_20 = utf8.len(var_286_18)
				local var_286_21 = var_286_19 <= 0 and var_286_16 or var_286_16 * (var_286_20 / var_286_19)

				if var_286_21 > 0 and var_286_16 < var_286_21 then
					arg_283_1.talkMaxDuration = var_286_21

					if var_286_21 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_21 + var_286_15
					end
				end

				arg_283_1.text_.text = var_286_18
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)
				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_22 = math.max(var_286_16, arg_283_1.talkMaxDuration)

			if var_286_15 <= arg_283_1.time_ and arg_283_1.time_ < var_286_15 + var_286_22 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_15) / var_286_22

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_15 + var_286_22 and arg_283_1.time_ < var_286_15 + var_286_22 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 1101106070
		arg_287_1.duration_ = 9

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play1101106071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 2

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				local var_290_1 = manager.ui.mainCamera.transform.localPosition
				local var_290_2 = Vector3.New(0, 0, 10) + Vector3.New(var_290_1.x, var_290_1.y, 0)
				local var_290_3 = arg_287_1.bgs_.STblack

				var_290_3.transform.localPosition = var_290_2
				var_290_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_290_4 = var_290_3:GetComponent("SpriteRenderer")

				if var_290_4 and var_290_4.sprite then
					local var_290_5 = (var_290_3.transform.localPosition - var_290_1).z
					local var_290_6 = manager.ui.mainCameraCom_
					local var_290_7 = 2 * var_290_5 * Mathf.Tan(var_290_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_290_8 = var_290_7 * var_290_6.aspect
					local var_290_9 = var_290_4.sprite.bounds.size.x
					local var_290_10 = var_290_4.sprite.bounds.size.y
					local var_290_11 = var_290_8 / var_290_9
					local var_290_12 = var_290_7 / var_290_10
					local var_290_13 = var_290_12 < var_290_11 and var_290_11 or var_290_12

					var_290_3.transform.localScale = Vector3.New(var_290_13, var_290_13, 0)
				end

				for iter_290_0, iter_290_1 in pairs(arg_287_1.bgs_) do
					if iter_290_0 ~= "STblack" then
						iter_290_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 then
				arg_287_1.mask_.enabled = true
				arg_287_1.mask_.raycastTarget = true

				arg_287_1:SetGaussion(false)
			end

			local var_290_15 = 2

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_15 then
				local var_290_16 = (arg_287_1.time_ - var_290_14) / var_290_15
				local var_290_17 = Color.New(0, 0, 0)

				var_290_17.a = Mathf.Lerp(0, 1, var_290_16)
				arg_287_1.mask_.color = var_290_17
			end

			if arg_287_1.time_ >= var_290_14 + var_290_15 and arg_287_1.time_ < var_290_14 + var_290_15 + arg_290_0 then
				local var_290_18 = Color.New(0, 0, 0)

				var_290_18.a = 1
				arg_287_1.mask_.color = var_290_18
			end

			local var_290_19 = 2

			if var_290_19 < arg_287_1.time_ and arg_287_1.time_ <= var_290_19 + arg_290_0 then
				arg_287_1.mask_.enabled = true
				arg_287_1.mask_.raycastTarget = true

				arg_287_1:SetGaussion(false)
			end

			local var_290_20 = 2

			if var_290_19 <= arg_287_1.time_ and arg_287_1.time_ < var_290_19 + var_290_20 then
				local var_290_21 = (arg_287_1.time_ - var_290_19) / var_290_20
				local var_290_22 = Color.New(0, 0, 0)

				var_290_22.a = Mathf.Lerp(1, 0, var_290_21)
				arg_287_1.mask_.color = var_290_22
			end

			if arg_287_1.time_ >= var_290_19 + var_290_20 and arg_287_1.time_ < var_290_19 + var_290_20 + arg_290_0 then
				local var_290_23 = Color.New(0, 0, 0)
				local var_290_24 = 0

				arg_287_1.mask_.enabled = false
				var_290_23.a = var_290_24
				arg_287_1.mask_.color = var_290_23
			end

			if arg_287_1.frameCnt_ <= 1 then
				arg_287_1.dialog_:SetActive(false)
			end

			local var_290_25 = 4
			local var_290_26 = 0.2

			if var_290_25 < arg_287_1.time_ and arg_287_1.time_ <= var_290_25 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0

				arg_287_1.dialog_:SetActive(true)

				local var_290_27 = LeanTween.value(arg_287_1.dialog_, 0, 1, 0.3)

				var_290_27:setOnUpdate(LuaHelper.FloatAction(function(arg_291_0)
					arg_287_1.dialogCg_.alpha = arg_291_0
				end))
				var_290_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_287_1.dialog_)
					var_290_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_287_1.duration_ = arg_287_1.duration_ + 0.3

				SetActive(arg_287_1.leftNameGo_, false)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_28 = arg_287_1:GetWordFromCfg(1101106070)
				local var_290_29 = arg_287_1:FormatText(var_290_28.content)

				arg_287_1.text_.text = var_290_29

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_30 = 8
				local var_290_31 = utf8.len(var_290_29)
				local var_290_32 = var_290_30 <= 0 and var_290_26 or var_290_26 * (var_290_31 / var_290_30)

				if var_290_32 > 0 and var_290_26 < var_290_32 then
					arg_287_1.talkMaxDuration = var_290_32
					var_290_25 = var_290_25 + 0.3

					if var_290_32 + var_290_25 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_32 + var_290_25
					end
				end

				arg_287_1.text_.text = var_290_29
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)
				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_33 = var_290_25 + 0.3
			local var_290_34 = math.max(var_290_26, arg_287_1.talkMaxDuration)

			if var_290_33 <= arg_287_1.time_ and arg_287_1.time_ < var_290_33 + var_290_34 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_33) / var_290_34

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_33 + var_290_34 and arg_287_1.time_ < var_290_33 + var_290_34 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106071 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 1101106071
		arg_293_1.duration_ = 7

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play1101106072(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "ST14"

			if arg_293_1.bgs_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(arg_293_1.paintGo_)

				var_296_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_296_0)
				var_296_1.name = var_296_0
				var_296_1.transform.parent = arg_293_1.stage_.transform
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.bgs_[var_296_0] = var_296_1
			end

			local var_296_2 = 0

			if var_296_2 < arg_293_1.time_ and arg_293_1.time_ <= var_296_2 + arg_296_0 then
				local var_296_3 = manager.ui.mainCamera.transform.localPosition
				local var_296_4 = Vector3.New(0, 0, 10) + Vector3.New(var_296_3.x, var_296_3.y, 0)
				local var_296_5 = arg_293_1.bgs_.ST14

				var_296_5.transform.localPosition = var_296_4
				var_296_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_296_6 = var_296_5:GetComponent("SpriteRenderer")

				if var_296_6 and var_296_6.sprite then
					local var_296_7 = (var_296_5.transform.localPosition - var_296_3).z
					local var_296_8 = manager.ui.mainCameraCom_
					local var_296_9 = 2 * var_296_7 * Mathf.Tan(var_296_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_296_10 = var_296_9 * var_296_8.aspect
					local var_296_11 = var_296_6.sprite.bounds.size.x
					local var_296_12 = var_296_6.sprite.bounds.size.y
					local var_296_13 = var_296_10 / var_296_11
					local var_296_14 = var_296_9 / var_296_12
					local var_296_15 = var_296_14 < var_296_13 and var_296_13 or var_296_14

					var_296_5.transform.localScale = Vector3.New(var_296_15, var_296_15, 0)
				end

				for iter_296_0, iter_296_1 in pairs(arg_293_1.bgs_) do
					if iter_296_0 ~= "ST14" then
						iter_296_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_296_16 = 0

			if var_296_16 < arg_293_1.time_ and arg_293_1.time_ <= var_296_16 + arg_296_0 then
				arg_293_1.mask_.enabled = true
				arg_293_1.mask_.raycastTarget = true

				arg_293_1:SetGaussion(false)
			end

			local var_296_17 = 2

			if var_296_16 <= arg_293_1.time_ and arg_293_1.time_ < var_296_16 + var_296_17 then
				local var_296_18 = (arg_293_1.time_ - var_296_16) / var_296_17
				local var_296_19 = Color.New(0, 0, 0)

				var_296_19.a = Mathf.Lerp(1, 0, var_296_18)
				arg_293_1.mask_.color = var_296_19
			end

			if arg_293_1.time_ >= var_296_16 + var_296_17 and arg_293_1.time_ < var_296_16 + var_296_17 + arg_296_0 then
				local var_296_20 = Color.New(0, 0, 0)
				local var_296_21 = 0

				arg_293_1.mask_.enabled = false
				var_296_20.a = var_296_21
				arg_293_1.mask_.color = var_296_20
			end

			if arg_293_1.frameCnt_ <= 1 then
				arg_293_1.dialog_:SetActive(false)
			end

			local var_296_22 = 2
			local var_296_23 = 0.75

			if var_296_22 < arg_293_1.time_ and arg_293_1.time_ <= var_296_22 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0

				arg_293_1.dialog_:SetActive(true)

				local var_296_24 = LeanTween.value(arg_293_1.dialog_, 0, 1, 0.3)

				var_296_24:setOnUpdate(LuaHelper.FloatAction(function(arg_297_0)
					arg_293_1.dialogCg_.alpha = arg_297_0
				end))
				var_296_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_293_1.dialog_)
					var_296_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_293_1.duration_ = arg_293_1.duration_ + 0.3

				SetActive(arg_293_1.leftNameGo_, false)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_25 = arg_293_1:GetWordFromCfg(1101106071)
				local var_296_26 = arg_293_1:FormatText(var_296_25.content)

				arg_293_1.text_.text = var_296_26

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_27 = 30
				local var_296_28 = utf8.len(var_296_26)
				local var_296_29 = var_296_27 <= 0 and var_296_23 or var_296_23 * (var_296_28 / var_296_27)

				if var_296_29 > 0 and var_296_23 < var_296_29 then
					arg_293_1.talkMaxDuration = var_296_29
					var_296_22 = var_296_22 + 0.3

					if var_296_29 + var_296_22 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_29 + var_296_22
					end
				end

				arg_293_1.text_.text = var_296_26
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)
				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_30 = var_296_22 + 0.3
			local var_296_31 = math.max(var_296_23, arg_293_1.talkMaxDuration)

			if var_296_30 <= arg_293_1.time_ and arg_293_1.time_ < var_296_30 + var_296_31 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_30) / var_296_31

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_30 + var_296_31 and arg_293_1.time_ < var_296_30 + var_296_31 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106072 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 1101106072
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play1101106073(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_302_1 = arg_299_1.actors_["1011ui_story"].transform
			local var_302_2 = 0

			if var_302_2 < arg_299_1.time_ and arg_299_1.time_ <= var_302_2 + arg_302_0 then
				arg_299_1.var_.moveOldPos1011ui_story = var_302_1.localPosition
			end

			local var_302_3 = 0.001

			if var_302_2 <= arg_299_1.time_ and arg_299_1.time_ < var_302_2 + var_302_3 then
				local var_302_4 = (arg_299_1.time_ - var_302_2) / var_302_3
				local var_302_5 = Vector3.New(0, -0.71, -6)

				var_302_1.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos1011ui_story, var_302_5, var_302_4)

				local var_302_6 = manager.ui.mainCamera.transform.position - var_302_1.position

				var_302_1.forward = Vector3.New(var_302_6.x, var_302_6.y, var_302_6.z)

				local var_302_7 = var_302_1.localEulerAngles

				var_302_7.z = 0
				var_302_7.x = 0
				var_302_1.localEulerAngles = var_302_7
			end

			if arg_299_1.time_ >= var_302_2 + var_302_3 and arg_299_1.time_ < var_302_2 + var_302_3 + arg_302_0 then
				var_302_1.localPosition = Vector3.New(0, -0.71, -6)

				local var_302_8 = manager.ui.mainCamera.transform.position - var_302_1.position

				var_302_1.forward = Vector3.New(var_302_8.x, var_302_8.y, var_302_8.z)

				local var_302_9 = var_302_1.localEulerAngles

				var_302_9.z = 0
				var_302_9.x = 0
				var_302_1.localEulerAngles = var_302_9
			end

			local var_302_10 = 0

			if var_302_10 < arg_299_1.time_ and arg_299_1.time_ <= var_302_10 + arg_302_0 then
				arg_299_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_302_11 = arg_299_1.actors_["1011ui_story"]
			local var_302_12 = 0

			if var_302_12 < arg_299_1.time_ and arg_299_1.time_ <= var_302_12 + arg_302_0 and not isNil(var_302_11) and arg_299_1.var_.characterEffect1011ui_story == nil then
				arg_299_1.var_.characterEffect1011ui_story = var_302_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_13 = 0.0166666666666667

			if var_302_12 <= arg_299_1.time_ and arg_299_1.time_ < var_302_12 + var_302_13 and not isNil(var_302_11) then
				local var_302_14 = (arg_299_1.time_ - var_302_12) / var_302_13

				if arg_299_1.var_.characterEffect1011ui_story and not isNil(var_302_11) then
					local var_302_15 = Mathf.Lerp(0, 0.5, var_302_14)

					arg_299_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1011ui_story.fillRatio = var_302_15
				end
			end

			if arg_299_1.time_ >= var_302_12 + var_302_13 and arg_299_1.time_ < var_302_12 + var_302_13 + arg_302_0 and not isNil(var_302_11) and arg_299_1.var_.characterEffect1011ui_story then
				local var_302_16 = 0.5

				arg_299_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1011ui_story.fillRatio = var_302_16
			end

			local var_302_17 = 0
			local var_302_18 = 0.675

			if var_302_17 < arg_299_1.time_ and arg_299_1.time_ <= var_302_17 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_19 = arg_299_1:GetWordFromCfg(1101106072)
				local var_302_20 = arg_299_1:FormatText(var_302_19.content)

				arg_299_1.text_.text = var_302_20

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_21 = 27
				local var_302_22 = utf8.len(var_302_20)
				local var_302_23 = var_302_21 <= 0 and var_302_18 or var_302_18 * (var_302_22 / var_302_21)

				if var_302_23 > 0 and var_302_18 < var_302_23 then
					arg_299_1.talkMaxDuration = var_302_23

					if var_302_23 + var_302_17 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_23 + var_302_17
					end
				end

				arg_299_1.text_.text = var_302_20
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_24 = math.max(var_302_18, arg_299_1.talkMaxDuration)

			if var_302_17 <= arg_299_1.time_ and arg_299_1.time_ < var_302_17 + var_302_24 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_17) / var_302_24

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_17 + var_302_24 and arg_299_1.time_ < var_302_17 + var_302_24 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106073 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 1101106073
		arg_303_1.duration_ = 3.7

		local var_303_0 = {
			zh = 3.1,
			ja = 3.7
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
				arg_303_0:Play1101106074(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1111ui_story"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1111ui_story = var_306_0.localPosition
			end

			local var_306_2 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2
				local var_306_4 = Vector3.New(0, -0.87, -5.7)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1111ui_story, var_306_4, var_306_3)

				local var_306_5 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_5.x, var_306_5.y, var_306_5.z)

				local var_306_6 = var_306_0.localEulerAngles

				var_306_6.z = 0
				var_306_6.x = 0
				var_306_0.localEulerAngles = var_306_6
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_306_7 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_7.x, var_306_7.y, var_306_7.z)

				local var_306_8 = var_306_0.localEulerAngles

				var_306_8.z = 0
				var_306_8.x = 0
				var_306_0.localEulerAngles = var_306_8
			end

			local var_306_9 = arg_303_1.actors_["1111ui_story"]
			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 and not isNil(var_306_9) and arg_303_1.var_.characterEffect1111ui_story == nil then
				arg_303_1.var_.characterEffect1111ui_story = var_306_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_11 = 0.200000002980232

			if var_306_10 <= arg_303_1.time_ and arg_303_1.time_ < var_306_10 + var_306_11 and not isNil(var_306_9) then
				local var_306_12 = (arg_303_1.time_ - var_306_10) / var_306_11

				if arg_303_1.var_.characterEffect1111ui_story and not isNil(var_306_9) then
					arg_303_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_10 + var_306_11 and arg_303_1.time_ < var_306_10 + var_306_11 + arg_306_0 and not isNil(var_306_9) and arg_303_1.var_.characterEffect1111ui_story then
				arg_303_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_306_13 = 0

			if var_306_13 < arg_303_1.time_ and arg_303_1.time_ <= var_306_13 + arg_306_0 then
				arg_303_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 then
				arg_303_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_306_15 = arg_303_1.actors_["1011ui_story"].transform
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.var_.moveOldPos1011ui_story = var_306_15.localPosition
			end

			local var_306_17 = 0.001

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Vector3.New(0, 100, 0)

				var_306_15.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1011ui_story, var_306_19, var_306_18)

				local var_306_20 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_20.x, var_306_20.y, var_306_20.z)

				local var_306_21 = var_306_15.localEulerAngles

				var_306_21.z = 0
				var_306_21.x = 0
				var_306_15.localEulerAngles = var_306_21
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				var_306_15.localPosition = Vector3.New(0, 100, 0)

				local var_306_22 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_22.x, var_306_22.y, var_306_22.z)

				local var_306_23 = var_306_15.localEulerAngles

				var_306_23.z = 0
				var_306_23.x = 0
				var_306_15.localEulerAngles = var_306_23
			end

			local var_306_24 = 0
			local var_306_25 = 0.3

			if var_306_24 < arg_303_1.time_ and arg_303_1.time_ <= var_306_24 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_26 = arg_303_1:FormatText(StoryNameCfg[67].name)

				arg_303_1.leftNameTxt_.text = var_306_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_27 = arg_303_1:GetWordFromCfg(1101106073)
				local var_306_28 = arg_303_1:FormatText(var_306_27.content)

				arg_303_1.text_.text = var_306_28

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_29 = 12
				local var_306_30 = utf8.len(var_306_28)
				local var_306_31 = var_306_29 <= 0 and var_306_25 or var_306_25 * (var_306_30 / var_306_29)

				if var_306_31 > 0 and var_306_25 < var_306_31 then
					arg_303_1.talkMaxDuration = var_306_31

					if var_306_31 + var_306_24 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_31 + var_306_24
					end
				end

				arg_303_1.text_.text = var_306_28
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb") ~= 0 then
					local var_306_32 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb") / 1000

					if var_306_32 + var_306_24 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_32 + var_306_24
					end

					if var_306_27.prefab_name ~= "" and arg_303_1.actors_[var_306_27.prefab_name] ~= nil then
						local var_306_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_27.prefab_name].transform, "story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")

						arg_303_1:RecordAudio("1101106073", var_306_33)
						arg_303_1:RecordAudio("1101106073", var_306_33)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_34 = math.max(var_306_25, arg_303_1.talkMaxDuration)

			if var_306_24 <= arg_303_1.time_ and arg_303_1.time_ < var_306_24 + var_306_34 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_24) / var_306_34

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_24 + var_306_34 and arg_303_1.time_ < var_306_24 + var_306_34 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106074 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 1101106074
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play1101106075(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1111ui_story"]
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 and not isNil(var_310_0) and arg_307_1.var_.characterEffect1111ui_story == nil then
				arg_307_1.var_.characterEffect1111ui_story = var_310_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_2 = 0.200000002980232

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 and not isNil(var_310_0) then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2

				if arg_307_1.var_.characterEffect1111ui_story and not isNil(var_310_0) then
					local var_310_4 = Mathf.Lerp(0, 0.5, var_310_3)

					arg_307_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1111ui_story.fillRatio = var_310_4
				end
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 and not isNil(var_310_0) and arg_307_1.var_.characterEffect1111ui_story then
				local var_310_5 = 0.5

				arg_307_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1111ui_story.fillRatio = var_310_5
			end

			local var_310_6 = 0
			local var_310_7 = 0.425

			if var_310_6 < arg_307_1.time_ and arg_307_1.time_ <= var_310_6 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_8 = arg_307_1:FormatText(StoryNameCfg[7].name)

				arg_307_1.leftNameTxt_.text = var_310_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_9 = arg_307_1:GetWordFromCfg(1101106074)
				local var_310_10 = arg_307_1:FormatText(var_310_9.content)

				arg_307_1.text_.text = var_310_10

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_11 = 17
				local var_310_12 = utf8.len(var_310_10)
				local var_310_13 = var_310_11 <= 0 and var_310_7 or var_310_7 * (var_310_12 / var_310_11)

				if var_310_13 > 0 and var_310_7 < var_310_13 then
					arg_307_1.talkMaxDuration = var_310_13

					if var_310_13 + var_310_6 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_13 + var_310_6
					end
				end

				arg_307_1.text_.text = var_310_10
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_14 = math.max(var_310_7, arg_307_1.talkMaxDuration)

			if var_310_6 <= arg_307_1.time_ and arg_307_1.time_ < var_310_6 + var_310_14 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_6) / var_310_14

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_6 + var_310_14 and arg_307_1.time_ < var_310_6 + var_310_14 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106075 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 1101106075
		arg_311_1.duration_ = 4.1

		local var_311_0 = {
			zh = 3.8,
			ja = 4.1
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
				arg_311_0:Play1101106076(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1011ui_story"].transform
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1.var_.moveOldPos1011ui_story = var_314_0.localPosition
			end

			local var_314_2 = 0.001

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2
				local var_314_4 = Vector3.New(0, -0.71, -6)

				var_314_0.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1011ui_story, var_314_4, var_314_3)

				local var_314_5 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_5.x, var_314_5.y, var_314_5.z)

				local var_314_6 = var_314_0.localEulerAngles

				var_314_6.z = 0
				var_314_6.x = 0
				var_314_0.localEulerAngles = var_314_6
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 then
				var_314_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_314_7 = manager.ui.mainCamera.transform.position - var_314_0.position

				var_314_0.forward = Vector3.New(var_314_7.x, var_314_7.y, var_314_7.z)

				local var_314_8 = var_314_0.localEulerAngles

				var_314_8.z = 0
				var_314_8.x = 0
				var_314_0.localEulerAngles = var_314_8
			end

			local var_314_9 = arg_311_1.actors_["1011ui_story"]
			local var_314_10 = 0

			if var_314_10 < arg_311_1.time_ and arg_311_1.time_ <= var_314_10 + arg_314_0 and not isNil(var_314_9) and arg_311_1.var_.characterEffect1011ui_story == nil then
				arg_311_1.var_.characterEffect1011ui_story = var_314_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_11 = 0.200000002980232

			if var_314_10 <= arg_311_1.time_ and arg_311_1.time_ < var_314_10 + var_314_11 and not isNil(var_314_9) then
				local var_314_12 = (arg_311_1.time_ - var_314_10) / var_314_11

				if arg_311_1.var_.characterEffect1011ui_story and not isNil(var_314_9) then
					arg_311_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_10 + var_314_11 and arg_311_1.time_ < var_314_10 + var_314_11 + arg_314_0 and not isNil(var_314_9) and arg_311_1.var_.characterEffect1011ui_story then
				arg_311_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_314_13 = 0

			if var_314_13 < arg_311_1.time_ and arg_311_1.time_ <= var_314_13 + arg_314_0 then
				arg_311_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_314_15 = arg_311_1.actors_["1111ui_story"].transform
			local var_314_16 = 0

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.var_.moveOldPos1111ui_story = var_314_15.localPosition
			end

			local var_314_17 = 0.001

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Vector3.New(0, 100, 0)

				var_314_15.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1111ui_story, var_314_19, var_314_18)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_15.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_15.localEulerAngles = var_314_21
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				var_314_15.localPosition = Vector3.New(0, 100, 0)

				local var_314_22 = manager.ui.mainCamera.transform.position - var_314_15.position

				var_314_15.forward = Vector3.New(var_314_22.x, var_314_22.y, var_314_22.z)

				local var_314_23 = var_314_15.localEulerAngles

				var_314_23.z = 0
				var_314_23.x = 0
				var_314_15.localEulerAngles = var_314_23
			end

			local var_314_24 = arg_311_1.actors_["1111ui_story"]
			local var_314_25 = 0

			if var_314_25 < arg_311_1.time_ and arg_311_1.time_ <= var_314_25 + arg_314_0 and not isNil(var_314_24) and arg_311_1.var_.characterEffect1111ui_story == nil then
				arg_311_1.var_.characterEffect1111ui_story = var_314_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_26 = 0.200000002980232

			if var_314_25 <= arg_311_1.time_ and arg_311_1.time_ < var_314_25 + var_314_26 and not isNil(var_314_24) then
				local var_314_27 = (arg_311_1.time_ - var_314_25) / var_314_26

				if arg_311_1.var_.characterEffect1111ui_story and not isNil(var_314_24) then
					local var_314_28 = Mathf.Lerp(0, 0.5, var_314_27)

					arg_311_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_311_1.var_.characterEffect1111ui_story.fillRatio = var_314_28
				end
			end

			if arg_311_1.time_ >= var_314_25 + var_314_26 and arg_311_1.time_ < var_314_25 + var_314_26 + arg_314_0 and not isNil(var_314_24) and arg_311_1.var_.characterEffect1111ui_story then
				local var_314_29 = 0.5

				arg_311_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_311_1.var_.characterEffect1111ui_story.fillRatio = var_314_29
			end

			local var_314_30 = 0
			local var_314_31 = 0.35

			if var_314_30 < arg_311_1.time_ and arg_311_1.time_ <= var_314_30 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_32 = arg_311_1:FormatText(StoryNameCfg[37].name)

				arg_311_1.leftNameTxt_.text = var_314_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_33 = arg_311_1:GetWordFromCfg(1101106075)
				local var_314_34 = arg_311_1:FormatText(var_314_33.content)

				arg_311_1.text_.text = var_314_34

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_35 = 14
				local var_314_36 = utf8.len(var_314_34)
				local var_314_37 = var_314_35 <= 0 and var_314_31 or var_314_31 * (var_314_36 / var_314_35)

				if var_314_37 > 0 and var_314_31 < var_314_37 then
					arg_311_1.talkMaxDuration = var_314_37

					if var_314_37 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_37 + var_314_30
					end
				end

				arg_311_1.text_.text = var_314_34
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb") ~= 0 then
					local var_314_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb") / 1000

					if var_314_38 + var_314_30 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_38 + var_314_30
					end

					if var_314_33.prefab_name ~= "" and arg_311_1.actors_[var_314_33.prefab_name] ~= nil then
						local var_314_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_33.prefab_name].transform, "story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")

						arg_311_1:RecordAudio("1101106075", var_314_39)
						arg_311_1:RecordAudio("1101106075", var_314_39)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_40 = math.max(var_314_31, arg_311_1.talkMaxDuration)

			if var_314_30 <= arg_311_1.time_ and arg_311_1.time_ < var_314_30 + var_314_40 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_30) / var_314_40

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_30 + var_314_40 and arg_311_1.time_ < var_314_30 + var_314_40 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106076 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 1101106076
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play1101106077(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1011ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and not isNil(var_318_0) and arg_315_1.var_.characterEffect1011ui_story == nil then
				arg_315_1.var_.characterEffect1011ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.200000002980232

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 and not isNil(var_318_0) then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1011ui_story and not isNil(var_318_0) then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1011ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and not isNil(var_318_0) and arg_315_1.var_.characterEffect1011ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1011ui_story.fillRatio = var_318_5
			end

			local var_318_6 = 0
			local var_318_7 = 0.325

			if var_318_6 < arg_315_1.time_ and arg_315_1.time_ <= var_318_6 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_8 = arg_315_1:FormatText(StoryNameCfg[7].name)

				arg_315_1.leftNameTxt_.text = var_318_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_9 = arg_315_1:GetWordFromCfg(1101106076)
				local var_318_10 = arg_315_1:FormatText(var_318_9.content)

				arg_315_1.text_.text = var_318_10

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_11 = 13
				local var_318_12 = utf8.len(var_318_10)
				local var_318_13 = var_318_11 <= 0 and var_318_7 or var_318_7 * (var_318_12 / var_318_11)

				if var_318_13 > 0 and var_318_7 < var_318_13 then
					arg_315_1.talkMaxDuration = var_318_13

					if var_318_13 + var_318_6 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_13 + var_318_6
					end
				end

				arg_315_1.text_.text = var_318_10
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_14 = math.max(var_318_7, arg_315_1.talkMaxDuration)

			if var_318_6 <= arg_315_1.time_ and arg_315_1.time_ < var_318_6 + var_318_14 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_6) / var_318_14

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_6 + var_318_14 and arg_315_1.time_ < var_318_6 + var_318_14 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106077 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 1101106077
		arg_319_1.duration_ = 4.93

		local var_319_0 = {
			zh = 4.433,
			ja = 4.933
		}
		local var_319_1 = manager.audio:GetLocalizationFlag()

		if var_319_0[var_319_1] ~= nil then
			arg_319_1.duration_ = var_319_0[var_319_1]
		end

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play1101106078(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1111ui_story"].transform
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 then
				arg_319_1.var_.moveOldPos1111ui_story = var_322_0.localPosition
			end

			local var_322_2 = 0.001

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2
				local var_322_4 = Vector3.New(0, -0.87, -5.7)

				var_322_0.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1111ui_story, var_322_4, var_322_3)

				local var_322_5 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_5.x, var_322_5.y, var_322_5.z)

				local var_322_6 = var_322_0.localEulerAngles

				var_322_6.z = 0
				var_322_6.x = 0
				var_322_0.localEulerAngles = var_322_6
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 then
				var_322_0.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_322_7 = manager.ui.mainCamera.transform.position - var_322_0.position

				var_322_0.forward = Vector3.New(var_322_7.x, var_322_7.y, var_322_7.z)

				local var_322_8 = var_322_0.localEulerAngles

				var_322_8.z = 0
				var_322_8.x = 0
				var_322_0.localEulerAngles = var_322_8
			end

			local var_322_9 = arg_319_1.actors_["1111ui_story"]
			local var_322_10 = 0

			if var_322_10 < arg_319_1.time_ and arg_319_1.time_ <= var_322_10 + arg_322_0 and not isNil(var_322_9) and arg_319_1.var_.characterEffect1111ui_story == nil then
				arg_319_1.var_.characterEffect1111ui_story = var_322_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_11 = 0.200000002980232

			if var_322_10 <= arg_319_1.time_ and arg_319_1.time_ < var_322_10 + var_322_11 and not isNil(var_322_9) then
				local var_322_12 = (arg_319_1.time_ - var_322_10) / var_322_11

				if arg_319_1.var_.characterEffect1111ui_story and not isNil(var_322_9) then
					arg_319_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_10 + var_322_11 and arg_319_1.time_ < var_322_10 + var_322_11 + arg_322_0 and not isNil(var_322_9) and arg_319_1.var_.characterEffect1111ui_story then
				arg_319_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_322_13 = 0

			if var_322_13 < arg_319_1.time_ and arg_319_1.time_ <= var_322_13 + arg_322_0 then
				arg_319_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_322_15 = arg_319_1.actors_["1011ui_story"].transform
			local var_322_16 = 0

			if var_322_16 < arg_319_1.time_ and arg_319_1.time_ <= var_322_16 + arg_322_0 then
				arg_319_1.var_.moveOldPos1011ui_story = var_322_15.localPosition
			end

			local var_322_17 = 0.001

			if var_322_16 <= arg_319_1.time_ and arg_319_1.time_ < var_322_16 + var_322_17 then
				local var_322_18 = (arg_319_1.time_ - var_322_16) / var_322_17
				local var_322_19 = Vector3.New(0, 100, 0)

				var_322_15.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1011ui_story, var_322_19, var_322_18)

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

			local var_322_24 = arg_319_1.actors_["1011ui_story"]
			local var_322_25 = 0

			if var_322_25 < arg_319_1.time_ and arg_319_1.time_ <= var_322_25 + arg_322_0 and not isNil(var_322_24) and arg_319_1.var_.characterEffect1011ui_story == nil then
				arg_319_1.var_.characterEffect1011ui_story = var_322_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_26 = 0.200000002980232

			if var_322_25 <= arg_319_1.time_ and arg_319_1.time_ < var_322_25 + var_322_26 and not isNil(var_322_24) then
				local var_322_27 = (arg_319_1.time_ - var_322_25) / var_322_26

				if arg_319_1.var_.characterEffect1011ui_story and not isNil(var_322_24) then
					local var_322_28 = Mathf.Lerp(0, 0.5, var_322_27)

					arg_319_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_319_1.var_.characterEffect1011ui_story.fillRatio = var_322_28
				end
			end

			if arg_319_1.time_ >= var_322_25 + var_322_26 and arg_319_1.time_ < var_322_25 + var_322_26 + arg_322_0 and not isNil(var_322_24) and arg_319_1.var_.characterEffect1011ui_story then
				local var_322_29 = 0.5

				arg_319_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_319_1.var_.characterEffect1011ui_story.fillRatio = var_322_29
			end

			local var_322_30 = 0
			local var_322_31 = 0.3

			if var_322_30 < arg_319_1.time_ and arg_319_1.time_ <= var_322_30 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_32 = arg_319_1:FormatText(StoryNameCfg[67].name)

				arg_319_1.leftNameTxt_.text = var_322_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_33 = arg_319_1:GetWordFromCfg(1101106077)
				local var_322_34 = arg_319_1:FormatText(var_322_33.content)

				arg_319_1.text_.text = var_322_34

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_35 = 12
				local var_322_36 = utf8.len(var_322_34)
				local var_322_37 = var_322_35 <= 0 and var_322_31 or var_322_31 * (var_322_36 / var_322_35)

				if var_322_37 > 0 and var_322_31 < var_322_37 then
					arg_319_1.talkMaxDuration = var_322_37

					if var_322_37 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_37 + var_322_30
					end
				end

				arg_319_1.text_.text = var_322_34
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb") ~= 0 then
					local var_322_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb") / 1000

					if var_322_38 + var_322_30 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_38 + var_322_30
					end

					if var_322_33.prefab_name ~= "" and arg_319_1.actors_[var_322_33.prefab_name] ~= nil then
						local var_322_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_33.prefab_name].transform, "story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")

						arg_319_1:RecordAudio("1101106077", var_322_39)
						arg_319_1:RecordAudio("1101106077", var_322_39)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_40 = math.max(var_322_31, arg_319_1.talkMaxDuration)

			if var_322_30 <= arg_319_1.time_ and arg_319_1.time_ < var_322_30 + var_322_40 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_30) / var_322_40

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_30 + var_322_40 and arg_319_1.time_ < var_322_30 + var_322_40 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106078 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 1101106078
		arg_323_1.duration_ = 5

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play1101106079(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1111ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and not isNil(var_326_0) and arg_323_1.var_.characterEffect1111ui_story == nil then
				arg_323_1.var_.characterEffect1111ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.200000002980232

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 and not isNil(var_326_0) then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1111ui_story and not isNil(var_326_0) then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1111ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and not isNil(var_326_0) and arg_323_1.var_.characterEffect1111ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1111ui_story.fillRatio = var_326_5
			end

			local var_326_6 = 0
			local var_326_7 = 0.55

			if var_326_6 < arg_323_1.time_ and arg_323_1.time_ <= var_326_6 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, false)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_8 = arg_323_1:GetWordFromCfg(1101106078)
				local var_326_9 = arg_323_1:FormatText(var_326_8.content)

				arg_323_1.text_.text = var_326_9

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_10 = 22
				local var_326_11 = utf8.len(var_326_9)
				local var_326_12 = var_326_10 <= 0 and var_326_7 or var_326_7 * (var_326_11 / var_326_10)

				if var_326_12 > 0 and var_326_7 < var_326_12 then
					arg_323_1.talkMaxDuration = var_326_12

					if var_326_12 + var_326_6 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_12 + var_326_6
					end
				end

				arg_323_1.text_.text = var_326_9
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)
				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_13 = math.max(var_326_7, arg_323_1.talkMaxDuration)

			if var_326_6 <= arg_323_1.time_ and arg_323_1.time_ < var_326_6 + var_326_13 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_6) / var_326_13

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_6 + var_326_13 and arg_323_1.time_ < var_326_6 + var_326_13 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106079 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 1101106079
		arg_327_1.duration_ = 5

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play1101106080(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = 0
			local var_330_1 = 0.975

			if var_330_0 < arg_327_1.time_ and arg_327_1.time_ <= var_330_0 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, false)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_2 = arg_327_1:GetWordFromCfg(1101106079)
				local var_330_3 = arg_327_1:FormatText(var_330_2.content)

				arg_327_1.text_.text = var_330_3

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_4 = 39
				local var_330_5 = utf8.len(var_330_3)
				local var_330_6 = var_330_4 <= 0 and var_330_1 or var_330_1 * (var_330_5 / var_330_4)

				if var_330_6 > 0 and var_330_1 < var_330_6 then
					arg_327_1.talkMaxDuration = var_330_6

					if var_330_6 + var_330_0 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_6 + var_330_0
					end
				end

				arg_327_1.text_.text = var_330_3
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)
				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_7 = math.max(var_330_1, arg_327_1.talkMaxDuration)

			if var_330_0 <= arg_327_1.time_ and arg_327_1.time_ < var_330_0 + var_330_7 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_0) / var_330_7

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_0 + var_330_7 and arg_327_1.time_ < var_330_0 + var_330_7 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106080 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 1101106080
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play1101106081(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1011ui_story"].transform
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 then
				arg_331_1.var_.moveOldPos1011ui_story = var_334_0.localPosition
			end

			local var_334_2 = 0.001

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2
				local var_334_4 = Vector3.New(-0.7, -0.71, -6)

				var_334_0.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1011ui_story, var_334_4, var_334_3)

				local var_334_5 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_5.x, var_334_5.y, var_334_5.z)

				local var_334_6 = var_334_0.localEulerAngles

				var_334_6.z = 0
				var_334_6.x = 0
				var_334_0.localEulerAngles = var_334_6
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 then
				var_334_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_334_7 = manager.ui.mainCamera.transform.position - var_334_0.position

				var_334_0.forward = Vector3.New(var_334_7.x, var_334_7.y, var_334_7.z)

				local var_334_8 = var_334_0.localEulerAngles

				var_334_8.z = 0
				var_334_8.x = 0
				var_334_0.localEulerAngles = var_334_8
			end

			local var_334_9 = arg_331_1.actors_["1011ui_story"]
			local var_334_10 = 0

			if var_334_10 < arg_331_1.time_ and arg_331_1.time_ <= var_334_10 + arg_334_0 and not isNil(var_334_9) and arg_331_1.var_.characterEffect1011ui_story == nil then
				arg_331_1.var_.characterEffect1011ui_story = var_334_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_11 = 0.034000001847744

			if var_334_10 <= arg_331_1.time_ and arg_331_1.time_ < var_334_10 + var_334_11 and not isNil(var_334_9) then
				local var_334_12 = (arg_331_1.time_ - var_334_10) / var_334_11

				if arg_331_1.var_.characterEffect1011ui_story and not isNil(var_334_9) then
					local var_334_13 = Mathf.Lerp(0, 0.5, var_334_12)

					arg_331_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1011ui_story.fillRatio = var_334_13
				end
			end

			if arg_331_1.time_ >= var_334_10 + var_334_11 and arg_331_1.time_ < var_334_10 + var_334_11 + arg_334_0 and not isNil(var_334_9) and arg_331_1.var_.characterEffect1011ui_story then
				local var_334_14 = 0.5

				arg_331_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1011ui_story.fillRatio = var_334_14
			end

			local var_334_15 = arg_331_1.actors_["1111ui_story"].transform
			local var_334_16 = 0

			if var_334_16 < arg_331_1.time_ and arg_331_1.time_ <= var_334_16 + arg_334_0 then
				arg_331_1.var_.moveOldPos1111ui_story = var_334_15.localPosition
			end

			local var_334_17 = 0.001

			if var_334_16 <= arg_331_1.time_ and arg_331_1.time_ < var_334_16 + var_334_17 then
				local var_334_18 = (arg_331_1.time_ - var_334_16) / var_334_17
				local var_334_19 = Vector3.New(0.7, -0.87, -5.7)

				var_334_15.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1111ui_story, var_334_19, var_334_18)

				local var_334_20 = manager.ui.mainCamera.transform.position - var_334_15.position

				var_334_15.forward = Vector3.New(var_334_20.x, var_334_20.y, var_334_20.z)

				local var_334_21 = var_334_15.localEulerAngles

				var_334_21.z = 0
				var_334_21.x = 0
				var_334_15.localEulerAngles = var_334_21
			end

			if arg_331_1.time_ >= var_334_16 + var_334_17 and arg_331_1.time_ < var_334_16 + var_334_17 + arg_334_0 then
				var_334_15.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_334_22 = manager.ui.mainCamera.transform.position - var_334_15.position

				var_334_15.forward = Vector3.New(var_334_22.x, var_334_22.y, var_334_22.z)

				local var_334_23 = var_334_15.localEulerAngles

				var_334_23.z = 0
				var_334_23.x = 0
				var_334_15.localEulerAngles = var_334_23
			end

			local var_334_24 = arg_331_1.actors_["1111ui_story"]
			local var_334_25 = 0

			if var_334_25 < arg_331_1.time_ and arg_331_1.time_ <= var_334_25 + arg_334_0 and not isNil(var_334_24) and arg_331_1.var_.characterEffect1111ui_story == nil then
				arg_331_1.var_.characterEffect1111ui_story = var_334_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_26 = 0.034000001847744

			if var_334_25 <= arg_331_1.time_ and arg_331_1.time_ < var_334_25 + var_334_26 and not isNil(var_334_24) then
				local var_334_27 = (arg_331_1.time_ - var_334_25) / var_334_26

				if arg_331_1.var_.characterEffect1111ui_story and not isNil(var_334_24) then
					local var_334_28 = Mathf.Lerp(0, 0.5, var_334_27)

					arg_331_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1111ui_story.fillRatio = var_334_28
				end
			end

			if arg_331_1.time_ >= var_334_25 + var_334_26 and arg_331_1.time_ < var_334_25 + var_334_26 + arg_334_0 and not isNil(var_334_24) and arg_331_1.var_.characterEffect1111ui_story then
				local var_334_29 = 0.5

				arg_331_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1111ui_story.fillRatio = var_334_29
			end

			local var_334_30 = 0
			local var_334_31 = 0.525

			if var_334_30 < arg_331_1.time_ and arg_331_1.time_ <= var_334_30 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_32 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_33 = arg_331_1:GetWordFromCfg(1101106080)
				local var_334_34 = arg_331_1:FormatText(var_334_33.content)

				arg_331_1.text_.text = var_334_34

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_35 = 21
				local var_334_36 = utf8.len(var_334_34)
				local var_334_37 = var_334_35 <= 0 and var_334_31 or var_334_31 * (var_334_36 / var_334_35)

				if var_334_37 > 0 and var_334_31 < var_334_37 then
					arg_331_1.talkMaxDuration = var_334_37

					if var_334_37 + var_334_30 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_37 + var_334_30
					end
				end

				arg_331_1.text_.text = var_334_34
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_38 = math.max(var_334_31, arg_331_1.talkMaxDuration)

			if var_334_30 <= arg_331_1.time_ and arg_331_1.time_ < var_334_30 + var_334_38 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_30) / var_334_38

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_30 + var_334_38 and arg_331_1.time_ < var_334_30 + var_334_38 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106081 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 1101106081
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play1101106082(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.675

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, false)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_2 = arg_335_1:GetWordFromCfg(1101106081)
				local var_338_3 = arg_335_1:FormatText(var_338_2.content)

				arg_335_1.text_.text = var_338_3

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_4 = 27
				local var_338_5 = utf8.len(var_338_3)
				local var_338_6 = var_338_4 <= 0 and var_338_1 or var_338_1 * (var_338_5 / var_338_4)

				if var_338_6 > 0 and var_338_1 < var_338_6 then
					arg_335_1.talkMaxDuration = var_338_6

					if var_338_6 + var_338_0 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_6 + var_338_0
					end
				end

				arg_335_1.text_.text = var_338_3
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_7 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_7 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_7

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_7 and arg_335_1.time_ < var_338_0 + var_338_7 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106082 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 1101106082
		arg_339_1.duration_ = 6.6

		local var_339_0 = {
			zh = 6.6,
			ja = 6
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
				arg_339_0:Play1101106083(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1111ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1111ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0.7, -0.87, -5.7)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1111ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0.7, -0.87, -5.7)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1111ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and not isNil(var_342_9) and arg_339_1.var_.characterEffect1111ui_story == nil then
				arg_339_1.var_.characterEffect1111ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 and not isNil(var_342_9) then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1111ui_story and not isNil(var_342_9) then
					arg_339_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and not isNil(var_342_9) and arg_339_1.var_.characterEffect1111ui_story then
				arg_339_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action464")
			end

			local var_342_14 = 0

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_342_15 = 0
			local var_342_16 = 0.725

			if var_342_15 < arg_339_1.time_ and arg_339_1.time_ <= var_342_15 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_17 = arg_339_1:FormatText(StoryNameCfg[67].name)

				arg_339_1.leftNameTxt_.text = var_342_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_18 = arg_339_1:GetWordFromCfg(1101106082)
				local var_342_19 = arg_339_1:FormatText(var_342_18.content)

				arg_339_1.text_.text = var_342_19

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_20 = 29
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb") ~= 0 then
					local var_342_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb") / 1000

					if var_342_23 + var_342_15 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_23 + var_342_15
					end

					if var_342_18.prefab_name ~= "" and arg_339_1.actors_[var_342_18.prefab_name] ~= nil then
						local var_342_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_18.prefab_name].transform, "story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")

						arg_339_1:RecordAudio("1101106082", var_342_24)
						arg_339_1:RecordAudio("1101106082", var_342_24)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")
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
	Play1101106083 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 1101106083
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play1101106084(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1111ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.characterEffect1111ui_story == nil then
				arg_343_1.var_.characterEffect1111ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 and not isNil(var_346_0) then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1111ui_story and not isNil(var_346_0) then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1111ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and not isNil(var_346_0) and arg_343_1.var_.characterEffect1111ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1111ui_story.fillRatio = var_346_5
			end

			local var_346_6 = arg_343_1.actors_["1111ui_story"].transform
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 then
				arg_343_1.var_.moveOldPos1111ui_story = var_346_6.localPosition
			end

			local var_346_8 = 0.001

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_8 then
				local var_346_9 = (arg_343_1.time_ - var_346_7) / var_346_8
				local var_346_10 = Vector3.New(0, -0.87, -5.7)

				var_346_6.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1111ui_story, var_346_10, var_346_9)

				local var_346_11 = manager.ui.mainCamera.transform.position - var_346_6.position

				var_346_6.forward = Vector3.New(var_346_11.x, var_346_11.y, var_346_11.z)

				local var_346_12 = var_346_6.localEulerAngles

				var_346_12.z = 0
				var_346_12.x = 0
				var_346_6.localEulerAngles = var_346_12
			end

			if arg_343_1.time_ >= var_346_7 + var_346_8 and arg_343_1.time_ < var_346_7 + var_346_8 + arg_346_0 then
				var_346_6.localPosition = Vector3.New(0, -0.87, -5.7)

				local var_346_13 = manager.ui.mainCamera.transform.position - var_346_6.position

				var_346_6.forward = Vector3.New(var_346_13.x, var_346_13.y, var_346_13.z)

				local var_346_14 = var_346_6.localEulerAngles

				var_346_14.z = 0
				var_346_14.x = 0
				var_346_6.localEulerAngles = var_346_14
			end

			local var_346_15 = arg_343_1.actors_["1011ui_story"].transform
			local var_346_16 = 0

			if var_346_16 < arg_343_1.time_ and arg_343_1.time_ <= var_346_16 + arg_346_0 then
				arg_343_1.var_.moveOldPos1011ui_story = var_346_15.localPosition
			end

			local var_346_17 = 0.001

			if var_346_16 <= arg_343_1.time_ and arg_343_1.time_ < var_346_16 + var_346_17 then
				local var_346_18 = (arg_343_1.time_ - var_346_16) / var_346_17
				local var_346_19 = Vector3.New(0, 100, 0)

				var_346_15.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1011ui_story, var_346_19, var_346_18)

				local var_346_20 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_20.x, var_346_20.y, var_346_20.z)

				local var_346_21 = var_346_15.localEulerAngles

				var_346_21.z = 0
				var_346_21.x = 0
				var_346_15.localEulerAngles = var_346_21
			end

			if arg_343_1.time_ >= var_346_16 + var_346_17 and arg_343_1.time_ < var_346_16 + var_346_17 + arg_346_0 then
				var_346_15.localPosition = Vector3.New(0, 100, 0)

				local var_346_22 = manager.ui.mainCamera.transform.position - var_346_15.position

				var_346_15.forward = Vector3.New(var_346_22.x, var_346_22.y, var_346_22.z)

				local var_346_23 = var_346_15.localEulerAngles

				var_346_23.z = 0
				var_346_23.x = 0
				var_346_15.localEulerAngles = var_346_23
			end

			local var_346_24 = arg_343_1.bgs_.ST14.transform
			local var_346_25 = 0

			if var_346_25 < arg_343_1.time_ and arg_343_1.time_ <= var_346_25 + arg_346_0 then
				arg_343_1.var_.moveOldPosST14 = var_346_24.localPosition
			end

			local var_346_26 = 3

			if var_346_25 <= arg_343_1.time_ and arg_343_1.time_ < var_346_25 + var_346_26 then
				local var_346_27 = (arg_343_1.time_ - var_346_25) / var_346_26
				local var_346_28 = Vector3.New(0, 1, 8)

				var_346_24.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPosST14, var_346_28, var_346_27)
			end

			if arg_343_1.time_ >= var_346_25 + var_346_26 and arg_343_1.time_ < var_346_25 + var_346_26 + arg_346_0 then
				var_346_24.localPosition = Vector3.New(0, 1, 8)
			end

			local var_346_29 = 0
			local var_346_30 = 0.4

			if var_346_29 < arg_343_1.time_ and arg_343_1.time_ <= var_346_29 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_31 = arg_343_1:GetWordFromCfg(1101106083)
				local var_346_32 = arg_343_1:FormatText(var_346_31.content)

				arg_343_1.text_.text = var_346_32

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_33 = 16
				local var_346_34 = utf8.len(var_346_32)
				local var_346_35 = var_346_33 <= 0 and var_346_30 or var_346_30 * (var_346_34 / var_346_33)

				if var_346_35 > 0 and var_346_30 < var_346_35 then
					arg_343_1.talkMaxDuration = var_346_35

					if var_346_35 + var_346_29 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_35 + var_346_29
					end
				end

				arg_343_1.text_.text = var_346_32
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_36 = math.max(var_346_30, arg_343_1.talkMaxDuration)

			if var_346_29 <= arg_343_1.time_ and arg_343_1.time_ < var_346_29 + var_346_36 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_29) / var_346_36

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_29 + var_346_36 and arg_343_1.time_ < var_346_29 + var_346_36 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106084 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 1101106084
		arg_347_1.duration_ = 4.8

		local var_347_0 = {
			zh = 4.066,
			ja = 4.8
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
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play1101106085(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1011ui_story"].transform
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 then
				arg_347_1.var_.moveOldPos1011ui_story = var_350_0.localPosition
			end

			local var_350_2 = 0.001

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2
				local var_350_4 = Vector3.New(0, -0.71, -6)

				var_350_0.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1011ui_story, var_350_4, var_350_3)

				local var_350_5 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_5.x, var_350_5.y, var_350_5.z)

				local var_350_6 = var_350_0.localEulerAngles

				var_350_6.z = 0
				var_350_6.x = 0
				var_350_0.localEulerAngles = var_350_6
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 then
				var_350_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_350_7 = manager.ui.mainCamera.transform.position - var_350_0.position

				var_350_0.forward = Vector3.New(var_350_7.x, var_350_7.y, var_350_7.z)

				local var_350_8 = var_350_0.localEulerAngles

				var_350_8.z = 0
				var_350_8.x = 0
				var_350_0.localEulerAngles = var_350_8
			end

			local var_350_9 = arg_347_1.actors_["1011ui_story"]
			local var_350_10 = 0

			if var_350_10 < arg_347_1.time_ and arg_347_1.time_ <= var_350_10 + arg_350_0 and not isNil(var_350_9) and arg_347_1.var_.characterEffect1011ui_story == nil then
				arg_347_1.var_.characterEffect1011ui_story = var_350_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_11 = 0.200000002980232

			if var_350_10 <= arg_347_1.time_ and arg_347_1.time_ < var_350_10 + var_350_11 and not isNil(var_350_9) then
				local var_350_12 = (arg_347_1.time_ - var_350_10) / var_350_11

				if arg_347_1.var_.characterEffect1011ui_story and not isNil(var_350_9) then
					arg_347_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_10 + var_350_11 and arg_347_1.time_ < var_350_10 + var_350_11 + arg_350_0 and not isNil(var_350_9) and arg_347_1.var_.characterEffect1011ui_story then
				arg_347_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_350_13 = 0

			if var_350_13 < arg_347_1.time_ and arg_347_1.time_ <= var_350_13 + arg_350_0 then
				arg_347_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_350_14 = 0

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_350_15 = arg_347_1.actors_["1111ui_story"].transform
			local var_350_16 = 0

			if var_350_16 < arg_347_1.time_ and arg_347_1.time_ <= var_350_16 + arg_350_0 then
				arg_347_1.var_.moveOldPos1111ui_story = var_350_15.localPosition
			end

			local var_350_17 = 0.001

			if var_350_16 <= arg_347_1.time_ and arg_347_1.time_ < var_350_16 + var_350_17 then
				local var_350_18 = (arg_347_1.time_ - var_350_16) / var_350_17
				local var_350_19 = Vector3.New(0, 100, 0)

				var_350_15.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1111ui_story, var_350_19, var_350_18)

				local var_350_20 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_20.x, var_350_20.y, var_350_20.z)

				local var_350_21 = var_350_15.localEulerAngles

				var_350_21.z = 0
				var_350_21.x = 0
				var_350_15.localEulerAngles = var_350_21
			end

			if arg_347_1.time_ >= var_350_16 + var_350_17 and arg_347_1.time_ < var_350_16 + var_350_17 + arg_350_0 then
				var_350_15.localPosition = Vector3.New(0, 100, 0)

				local var_350_22 = manager.ui.mainCamera.transform.position - var_350_15.position

				var_350_15.forward = Vector3.New(var_350_22.x, var_350_22.y, var_350_22.z)

				local var_350_23 = var_350_15.localEulerAngles

				var_350_23.z = 0
				var_350_23.x = 0
				var_350_15.localEulerAngles = var_350_23
			end

			local var_350_24 = 0
			local var_350_25 = 0.4

			if var_350_24 < arg_347_1.time_ and arg_347_1.time_ <= var_350_24 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_26 = arg_347_1:FormatText(StoryNameCfg[37].name)

				arg_347_1.leftNameTxt_.text = var_350_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_27 = arg_347_1:GetWordFromCfg(1101106084)
				local var_350_28 = arg_347_1:FormatText(var_350_27.content)

				arg_347_1.text_.text = var_350_28

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_29 = 16
				local var_350_30 = utf8.len(var_350_28)
				local var_350_31 = var_350_29 <= 0 and var_350_25 or var_350_25 * (var_350_30 / var_350_29)

				if var_350_31 > 0 and var_350_25 < var_350_31 then
					arg_347_1.talkMaxDuration = var_350_31

					if var_350_31 + var_350_24 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_31 + var_350_24
					end
				end

				arg_347_1.text_.text = var_350_28
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb") ~= 0 then
					local var_350_32 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb") / 1000

					if var_350_32 + var_350_24 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_32 + var_350_24
					end

					if var_350_27.prefab_name ~= "" and arg_347_1.actors_[var_350_27.prefab_name] ~= nil then
						local var_350_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_27.prefab_name].transform, "story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")

						arg_347_1:RecordAudio("1101106084", var_350_33)
						arg_347_1:RecordAudio("1101106084", var_350_33)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_34 = math.max(var_350_25, arg_347_1.talkMaxDuration)

			if var_350_24 <= arg_347_1.time_ and arg_347_1.time_ < var_350_24 + var_350_34 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_24) / var_350_34

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_24 + var_350_34 and arg_347_1.time_ < var_350_24 + var_350_34 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106085 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1101106085
		arg_351_1.duration_ = 9

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play1101106086(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = 2

			if var_354_0 < arg_351_1.time_ and arg_351_1.time_ <= var_354_0 + arg_354_0 then
				local var_354_1 = manager.ui.mainCamera.transform.localPosition
				local var_354_2 = Vector3.New(0, 0, 10) + Vector3.New(var_354_1.x, var_354_1.y, 0)
				local var_354_3 = arg_351_1.bgs_.ST14

				var_354_3.transform.localPosition = var_354_2
				var_354_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_354_4 = var_354_3:GetComponent("SpriteRenderer")

				if var_354_4 and var_354_4.sprite then
					local var_354_5 = (var_354_3.transform.localPosition - var_354_1).z
					local var_354_6 = manager.ui.mainCameraCom_
					local var_354_7 = 2 * var_354_5 * Mathf.Tan(var_354_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_354_8 = var_354_7 * var_354_6.aspect
					local var_354_9 = var_354_4.sprite.bounds.size.x
					local var_354_10 = var_354_4.sprite.bounds.size.y
					local var_354_11 = var_354_8 / var_354_9
					local var_354_12 = var_354_7 / var_354_10
					local var_354_13 = var_354_12 < var_354_11 and var_354_11 or var_354_12

					var_354_3.transform.localScale = Vector3.New(var_354_13, var_354_13, 0)
				end

				for iter_354_0, iter_354_1 in pairs(arg_351_1.bgs_) do
					if iter_354_0 ~= "ST14" then
						iter_354_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				arg_351_1.mask_.enabled = true
				arg_351_1.mask_.raycastTarget = true

				arg_351_1:SetGaussion(false)
			end

			local var_354_15 = 2

			if var_354_14 <= arg_351_1.time_ and arg_351_1.time_ < var_354_14 + var_354_15 then
				local var_354_16 = (arg_351_1.time_ - var_354_14) / var_354_15
				local var_354_17 = Color.New(0, 0, 0)

				var_354_17.a = Mathf.Lerp(0, 1, var_354_16)
				arg_351_1.mask_.color = var_354_17
			end

			if arg_351_1.time_ >= var_354_14 + var_354_15 and arg_351_1.time_ < var_354_14 + var_354_15 + arg_354_0 then
				local var_354_18 = Color.New(0, 0, 0)

				var_354_18.a = 1
				arg_351_1.mask_.color = var_354_18
			end

			local var_354_19 = 2

			if var_354_19 < arg_351_1.time_ and arg_351_1.time_ <= var_354_19 + arg_354_0 then
				arg_351_1.mask_.enabled = true
				arg_351_1.mask_.raycastTarget = true

				arg_351_1:SetGaussion(false)
			end

			local var_354_20 = 2

			if var_354_19 <= arg_351_1.time_ and arg_351_1.time_ < var_354_19 + var_354_20 then
				local var_354_21 = (arg_351_1.time_ - var_354_19) / var_354_20
				local var_354_22 = Color.New(0, 0, 0)

				var_354_22.a = Mathf.Lerp(1, 0, var_354_21)
				arg_351_1.mask_.color = var_354_22
			end

			if arg_351_1.time_ >= var_354_19 + var_354_20 and arg_351_1.time_ < var_354_19 + var_354_20 + arg_354_0 then
				local var_354_23 = Color.New(0, 0, 0)
				local var_354_24 = 0

				arg_351_1.mask_.enabled = false
				var_354_23.a = var_354_24
				arg_351_1.mask_.color = var_354_23
			end

			local var_354_25 = arg_351_1.actors_["1011ui_story"].transform
			local var_354_26 = 2

			if var_354_26 < arg_351_1.time_ and arg_351_1.time_ <= var_354_26 + arg_354_0 then
				arg_351_1.var_.moveOldPos1011ui_story = var_354_25.localPosition
			end

			local var_354_27 = 0.001

			if var_354_26 <= arg_351_1.time_ and arg_351_1.time_ < var_354_26 + var_354_27 then
				local var_354_28 = (arg_351_1.time_ - var_354_26) / var_354_27
				local var_354_29 = Vector3.New(0, 100, 0)

				var_354_25.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1011ui_story, var_354_29, var_354_28)

				local var_354_30 = manager.ui.mainCamera.transform.position - var_354_25.position

				var_354_25.forward = Vector3.New(var_354_30.x, var_354_30.y, var_354_30.z)

				local var_354_31 = var_354_25.localEulerAngles

				var_354_31.z = 0
				var_354_31.x = 0
				var_354_25.localEulerAngles = var_354_31
			end

			if arg_351_1.time_ >= var_354_26 + var_354_27 and arg_351_1.time_ < var_354_26 + var_354_27 + arg_354_0 then
				var_354_25.localPosition = Vector3.New(0, 100, 0)

				local var_354_32 = manager.ui.mainCamera.transform.position - var_354_25.position

				var_354_25.forward = Vector3.New(var_354_32.x, var_354_32.y, var_354_32.z)

				local var_354_33 = var_354_25.localEulerAngles

				var_354_33.z = 0
				var_354_33.x = 0
				var_354_25.localEulerAngles = var_354_33
			end

			local var_354_34 = arg_351_1.actors_["1111ui_story"].transform
			local var_354_35 = 2

			if var_354_35 < arg_351_1.time_ and arg_351_1.time_ <= var_354_35 + arg_354_0 then
				arg_351_1.var_.moveOldPos1111ui_story = var_354_34.localPosition
			end

			local var_354_36 = 0.001

			if var_354_35 <= arg_351_1.time_ and arg_351_1.time_ < var_354_35 + var_354_36 then
				local var_354_37 = (arg_351_1.time_ - var_354_35) / var_354_36
				local var_354_38 = Vector3.New(0, 100, 0)

				var_354_34.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1111ui_story, var_354_38, var_354_37)

				local var_354_39 = manager.ui.mainCamera.transform.position - var_354_34.position

				var_354_34.forward = Vector3.New(var_354_39.x, var_354_39.y, var_354_39.z)

				local var_354_40 = var_354_34.localEulerAngles

				var_354_40.z = 0
				var_354_40.x = 0
				var_354_34.localEulerAngles = var_354_40
			end

			if arg_351_1.time_ >= var_354_35 + var_354_36 and arg_351_1.time_ < var_354_35 + var_354_36 + arg_354_0 then
				var_354_34.localPosition = Vector3.New(0, 100, 0)

				local var_354_41 = manager.ui.mainCamera.transform.position - var_354_34.position

				var_354_34.forward = Vector3.New(var_354_41.x, var_354_41.y, var_354_41.z)

				local var_354_42 = var_354_34.localEulerAngles

				var_354_42.z = 0
				var_354_42.x = 0
				var_354_34.localEulerAngles = var_354_42
			end

			local var_354_43 = arg_351_1.actors_["1011ui_story"].transform
			local var_354_44 = 4

			if var_354_44 < arg_351_1.time_ and arg_351_1.time_ <= var_354_44 + arg_354_0 then
				arg_351_1.var_.moveOldPos1011ui_story = var_354_43.localPosition
			end

			local var_354_45 = 0.001

			if var_354_44 <= arg_351_1.time_ and arg_351_1.time_ < var_354_44 + var_354_45 then
				local var_354_46 = (arg_351_1.time_ - var_354_44) / var_354_45
				local var_354_47 = Vector3.New(0, -0.71, -6)

				var_354_43.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1011ui_story, var_354_47, var_354_46)

				local var_354_48 = manager.ui.mainCamera.transform.position - var_354_43.position

				var_354_43.forward = Vector3.New(var_354_48.x, var_354_48.y, var_354_48.z)

				local var_354_49 = var_354_43.localEulerAngles

				var_354_49.z = 0
				var_354_49.x = 0
				var_354_43.localEulerAngles = var_354_49
			end

			if arg_351_1.time_ >= var_354_44 + var_354_45 and arg_351_1.time_ < var_354_44 + var_354_45 + arg_354_0 then
				var_354_43.localPosition = Vector3.New(0, -0.71, -6)

				local var_354_50 = manager.ui.mainCamera.transform.position - var_354_43.position

				var_354_43.forward = Vector3.New(var_354_50.x, var_354_50.y, var_354_50.z)

				local var_354_51 = var_354_43.localEulerAngles

				var_354_51.z = 0
				var_354_51.x = 0
				var_354_43.localEulerAngles = var_354_51
			end

			local var_354_52 = 4

			if var_354_52 < arg_351_1.time_ and arg_351_1.time_ <= var_354_52 + arg_354_0 then
				arg_351_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_354_53 = 2

			if var_354_53 < arg_351_1.time_ and arg_351_1.time_ <= var_354_53 + arg_354_0 then
				arg_351_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_354_54 = arg_351_1.actors_["1011ui_story"]
			local var_354_55 = 4

			if var_354_55 < arg_351_1.time_ and arg_351_1.time_ <= var_354_55 + arg_354_0 and not isNil(var_354_54) and arg_351_1.var_.characterEffect1011ui_story == nil then
				arg_351_1.var_.characterEffect1011ui_story = var_354_54:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_56 = 0.0166666666666667

			if var_354_55 <= arg_351_1.time_ and arg_351_1.time_ < var_354_55 + var_354_56 and not isNil(var_354_54) then
				local var_354_57 = (arg_351_1.time_ - var_354_55) / var_354_56

				if arg_351_1.var_.characterEffect1011ui_story and not isNil(var_354_54) then
					local var_354_58 = Mathf.Lerp(0, 0.5, var_354_57)

					arg_351_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1011ui_story.fillRatio = var_354_58
				end
			end

			if arg_351_1.time_ >= var_354_55 + var_354_56 and arg_351_1.time_ < var_354_55 + var_354_56 + arg_354_0 and not isNil(var_354_54) and arg_351_1.var_.characterEffect1011ui_story then
				local var_354_59 = 0.5

				arg_351_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1011ui_story.fillRatio = var_354_59
			end

			if arg_351_1.frameCnt_ <= 1 then
				arg_351_1.dialog_:SetActive(false)
			end

			local var_354_60 = 4
			local var_354_61 = 1

			if var_354_60 < arg_351_1.time_ and arg_351_1.time_ <= var_354_60 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0

				arg_351_1.dialog_:SetActive(true)

				local var_354_62 = LeanTween.value(arg_351_1.dialog_, 0, 1, 0.3)

				var_354_62:setOnUpdate(LuaHelper.FloatAction(function(arg_355_0)
					arg_351_1.dialogCg_.alpha = arg_355_0
				end))
				var_354_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_351_1.dialog_)
					var_354_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_351_1.duration_ = arg_351_1.duration_ + 0.3

				SetActive(arg_351_1.leftNameGo_, false)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_63 = arg_351_1:GetWordFromCfg(1101106085)
				local var_354_64 = arg_351_1:FormatText(var_354_63.content)

				arg_351_1.text_.text = var_354_64

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_65 = 40
				local var_354_66 = utf8.len(var_354_64)
				local var_354_67 = var_354_65 <= 0 and var_354_61 or var_354_61 * (var_354_66 / var_354_65)

				if var_354_67 > 0 and var_354_61 < var_354_67 then
					arg_351_1.talkMaxDuration = var_354_67
					var_354_60 = var_354_60 + 0.3

					if var_354_67 + var_354_60 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_67 + var_354_60
					end
				end

				arg_351_1.text_.text = var_354_64
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)
				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_68 = var_354_60 + 0.3
			local var_354_69 = math.max(var_354_61, arg_351_1.talkMaxDuration)

			if var_354_68 <= arg_351_1.time_ and arg_351_1.time_ < var_354_68 + var_354_69 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_68) / var_354_69

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_68 + var_354_69 and arg_351_1.time_ < var_354_68 + var_354_69 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106086 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 1101106086
		arg_357_1.duration_ = 5

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play1101106087(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_360_1 = arg_357_1.actors_["1011ui_story"]
			local var_360_2 = 0

			if var_360_2 < arg_357_1.time_ and arg_357_1.time_ <= var_360_2 + arg_360_0 and not isNil(var_360_1) and arg_357_1.var_.characterEffect1011ui_story == nil then
				arg_357_1.var_.characterEffect1011ui_story = var_360_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_3 = 0.2

			if var_360_2 <= arg_357_1.time_ and arg_357_1.time_ < var_360_2 + var_360_3 and not isNil(var_360_1) then
				local var_360_4 = (arg_357_1.time_ - var_360_2) / var_360_3

				if arg_357_1.var_.characterEffect1011ui_story and not isNil(var_360_1) then
					arg_357_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_2 + var_360_3 and arg_357_1.time_ < var_360_2 + var_360_3 + arg_360_0 and not isNil(var_360_1) and arg_357_1.var_.characterEffect1011ui_story then
				arg_357_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_360_5 = 0
			local var_360_6 = 0.45

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_7 = arg_357_1:FormatText(StoryNameCfg[7].name)

				arg_357_1.leftNameTxt_.text = var_360_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_8 = arg_357_1:GetWordFromCfg(1101106086)
				local var_360_9 = arg_357_1:FormatText(var_360_8.content)

				arg_357_1.text_.text = var_360_9

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_10 = 18
				local var_360_11 = utf8.len(var_360_9)
				local var_360_12 = var_360_10 <= 0 and var_360_6 or var_360_6 * (var_360_11 / var_360_10)

				if var_360_12 > 0 and var_360_6 < var_360_12 then
					arg_357_1.talkMaxDuration = var_360_12

					if var_360_12 + var_360_5 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_12 + var_360_5
					end
				end

				arg_357_1.text_.text = var_360_9
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)
				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_13 = math.max(var_360_6, arg_357_1.talkMaxDuration)

			if var_360_5 <= arg_357_1.time_ and arg_357_1.time_ < var_360_5 + var_360_13 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_5) / var_360_13

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_5 + var_360_13 and arg_357_1.time_ < var_360_5 + var_360_13 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106087 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 1101106087
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play1101106088(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.575

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

				local var_364_3 = arg_361_1:GetWordFromCfg(1101106087)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 23
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
	Play1101106088 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 1101106088
		arg_365_1.duration_ = 6.97

		local var_365_0 = {
			zh = 4.766,
			ja = 6.966
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
				arg_365_0:Play1101106089(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1011ui_story"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos1011ui_story = var_368_0.localPosition
			end

			local var_368_2 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2
				local var_368_4 = Vector3.New(0, -0.71, -6)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos1011ui_story, var_368_4, var_368_3)

				local var_368_5 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_5.x, var_368_5.y, var_368_5.z)

				local var_368_6 = var_368_0.localEulerAngles

				var_368_6.z = 0
				var_368_6.x = 0
				var_368_0.localEulerAngles = var_368_6
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_368_7 = manager.ui.mainCamera.transform.position - var_368_0.position

				var_368_0.forward = Vector3.New(var_368_7.x, var_368_7.y, var_368_7.z)

				local var_368_8 = var_368_0.localEulerAngles

				var_368_8.z = 0
				var_368_8.x = 0
				var_368_0.localEulerAngles = var_368_8
			end

			local var_368_9 = 0

			if var_368_9 < arg_365_1.time_ and arg_365_1.time_ <= var_368_9 + arg_368_0 then
				arg_365_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_368_10 = 0

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 then
				arg_365_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_368_11 = 0
			local var_368_12 = 0.625

			if var_368_11 < arg_365_1.time_ and arg_365_1.time_ <= var_368_11 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_13 = arg_365_1:FormatText(StoryNameCfg[37].name)

				arg_365_1.leftNameTxt_.text = var_368_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_14 = arg_365_1:GetWordFromCfg(1101106088)
				local var_368_15 = arg_365_1:FormatText(var_368_14.content)

				arg_365_1.text_.text = var_368_15

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_16 = 25
				local var_368_17 = utf8.len(var_368_15)
				local var_368_18 = var_368_16 <= 0 and var_368_12 or var_368_12 * (var_368_17 / var_368_16)

				if var_368_18 > 0 and var_368_12 < var_368_18 then
					arg_365_1.talkMaxDuration = var_368_18

					if var_368_18 + var_368_11 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_18 + var_368_11
					end
				end

				arg_365_1.text_.text = var_368_15
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb") ~= 0 then
					local var_368_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb") / 1000

					if var_368_19 + var_368_11 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_19 + var_368_11
					end

					if var_368_14.prefab_name ~= "" and arg_365_1.actors_[var_368_14.prefab_name] ~= nil then
						local var_368_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_14.prefab_name].transform, "story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")

						arg_365_1:RecordAudio("1101106088", var_368_20)
						arg_365_1:RecordAudio("1101106088", var_368_20)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_21 = math.max(var_368_12, arg_365_1.talkMaxDuration)

			if var_368_11 <= arg_365_1.time_ and arg_365_1.time_ < var_368_11 + var_368_21 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_11) / var_368_21

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_11 + var_368_21 and arg_365_1.time_ < var_368_11 + var_368_21 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106089 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 1101106089
		arg_369_1.duration_ = 5

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play1101106090(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["1011ui_story"]
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 and not isNil(var_372_0) and arg_369_1.var_.characterEffect1011ui_story == nil then
				arg_369_1.var_.characterEffect1011ui_story = var_372_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_372_2 = 0.200000002980232

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_2 and not isNil(var_372_0) then
				local var_372_3 = (arg_369_1.time_ - var_372_1) / var_372_2

				if arg_369_1.var_.characterEffect1011ui_story and not isNil(var_372_0) then
					local var_372_4 = Mathf.Lerp(0, 0.5, var_372_3)

					arg_369_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_369_1.var_.characterEffect1011ui_story.fillRatio = var_372_4
				end
			end

			if arg_369_1.time_ >= var_372_1 + var_372_2 and arg_369_1.time_ < var_372_1 + var_372_2 + arg_372_0 and not isNil(var_372_0) and arg_369_1.var_.characterEffect1011ui_story then
				local var_372_5 = 0.5

				arg_369_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_369_1.var_.characterEffect1011ui_story.fillRatio = var_372_5
			end

			local var_372_6 = 0
			local var_372_7 = 0.125

			if var_372_6 < arg_369_1.time_ and arg_369_1.time_ <= var_372_6 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_8 = arg_369_1:FormatText(StoryNameCfg[7].name)

				arg_369_1.leftNameTxt_.text = var_372_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_9 = arg_369_1:GetWordFromCfg(1101106089)
				local var_372_10 = arg_369_1:FormatText(var_372_9.content)

				arg_369_1.text_.text = var_372_10

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_11 = 5
				local var_372_12 = utf8.len(var_372_10)
				local var_372_13 = var_372_11 <= 0 and var_372_7 or var_372_7 * (var_372_12 / var_372_11)

				if var_372_13 > 0 and var_372_7 < var_372_13 then
					arg_369_1.talkMaxDuration = var_372_13

					if var_372_13 + var_372_6 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_13 + var_372_6
					end
				end

				arg_369_1.text_.text = var_372_10
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)
				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_14 = math.max(var_372_7, arg_369_1.talkMaxDuration)

			if var_372_6 <= arg_369_1.time_ and arg_369_1.time_ < var_372_6 + var_372_14 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_6) / var_372_14

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_6 + var_372_14 and arg_369_1.time_ < var_372_6 + var_372_14 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 1101106090
		arg_373_1.duration_ = 8.1

		local var_373_0 = {
			zh = 4.5,
			ja = 8.1
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play1101106091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1011ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1011ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(0, -0.71, -6)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1011ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = 0

			if var_376_9 < arg_373_1.time_ and arg_373_1.time_ <= var_376_9 + arg_376_0 then
				arg_373_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action484")
			end

			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_376_11 = 0
			local var_376_12 = 0.275

			if var_376_11 < arg_373_1.time_ and arg_373_1.time_ <= var_376_11 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_13 = arg_373_1:FormatText(StoryNameCfg[37].name)

				arg_373_1.leftNameTxt_.text = var_376_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_14 = arg_373_1:GetWordFromCfg(1101106090)
				local var_376_15 = arg_373_1:FormatText(var_376_14.content)

				arg_373_1.text_.text = var_376_15

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_16 = 11
				local var_376_17 = utf8.len(var_376_15)
				local var_376_18 = var_376_16 <= 0 and var_376_12 or var_376_12 * (var_376_17 / var_376_16)

				if var_376_18 > 0 and var_376_12 < var_376_18 then
					arg_373_1.talkMaxDuration = var_376_18

					if var_376_18 + var_376_11 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_18 + var_376_11
					end
				end

				arg_373_1.text_.text = var_376_15
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb") ~= 0 then
					local var_376_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb") / 1000

					if var_376_19 + var_376_11 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_19 + var_376_11
					end

					if var_376_14.prefab_name ~= "" and arg_373_1.actors_[var_376_14.prefab_name] ~= nil then
						local var_376_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_14.prefab_name].transform, "story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")

						arg_373_1:RecordAudio("1101106090", var_376_20)
						arg_373_1:RecordAudio("1101106090", var_376_20)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_21 = math.max(var_376_12, arg_373_1.talkMaxDuration)

			if var_376_11 <= arg_373_1.time_ and arg_373_1.time_ < var_376_11 + var_376_21 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_11) / var_376_21

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_11 + var_376_21 and arg_373_1.time_ < var_376_11 + var_376_21 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106091 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 1101106091
		arg_377_1.duration_ = 6.3

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play1101106092(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 1

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				local var_380_1 = manager.ui.mainCamera.transform.localPosition
				local var_380_2 = Vector3.New(0, 0, 10) + Vector3.New(var_380_1.x, var_380_1.y, 0)
				local var_380_3 = arg_377_1.bgs_.STblack

				var_380_3.transform.localPosition = var_380_2
				var_380_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_380_4 = var_380_3:GetComponent("SpriteRenderer")

				if var_380_4 and var_380_4.sprite then
					local var_380_5 = (var_380_3.transform.localPosition - var_380_1).z
					local var_380_6 = manager.ui.mainCameraCom_
					local var_380_7 = 2 * var_380_5 * Mathf.Tan(var_380_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_380_8 = var_380_7 * var_380_6.aspect
					local var_380_9 = var_380_4.sprite.bounds.size.x
					local var_380_10 = var_380_4.sprite.bounds.size.y
					local var_380_11 = var_380_8 / var_380_9
					local var_380_12 = var_380_7 / var_380_10
					local var_380_13 = var_380_12 < var_380_11 and var_380_11 or var_380_12

					var_380_3.transform.localScale = Vector3.New(var_380_13, var_380_13, 0)
				end

				for iter_380_0, iter_380_1 in pairs(arg_377_1.bgs_) do
					if iter_380_0 ~= "STblack" then
						iter_380_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_380_14 = arg_377_1.actors_["1011ui_story"]
			local var_380_15 = 0

			if var_380_15 < arg_377_1.time_ and arg_377_1.time_ <= var_380_15 + arg_380_0 and not isNil(var_380_14) and arg_377_1.var_.characterEffect1011ui_story == nil then
				arg_377_1.var_.characterEffect1011ui_story = var_380_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_16 = 0.200000002980232

			if var_380_15 <= arg_377_1.time_ and arg_377_1.time_ < var_380_15 + var_380_16 and not isNil(var_380_14) then
				local var_380_17 = (arg_377_1.time_ - var_380_15) / var_380_16

				if arg_377_1.var_.characterEffect1011ui_story and not isNil(var_380_14) then
					local var_380_18 = Mathf.Lerp(0, 0.5, var_380_17)

					arg_377_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1011ui_story.fillRatio = var_380_18
				end
			end

			if arg_377_1.time_ >= var_380_15 + var_380_16 and arg_377_1.time_ < var_380_15 + var_380_16 + arg_380_0 and not isNil(var_380_14) and arg_377_1.var_.characterEffect1011ui_story then
				local var_380_19 = 0.5

				arg_377_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1011ui_story.fillRatio = var_380_19
			end

			local var_380_20 = 0

			if var_380_20 < arg_377_1.time_ and arg_377_1.time_ <= var_380_20 + arg_380_0 then
				arg_377_1.mask_.enabled = true
				arg_377_1.mask_.raycastTarget = true

				arg_377_1:SetGaussion(false)
			end

			local var_380_21 = 1

			if var_380_20 <= arg_377_1.time_ and arg_377_1.time_ < var_380_20 + var_380_21 then
				local var_380_22 = (arg_377_1.time_ - var_380_20) / var_380_21
				local var_380_23 = Color.New(0, 0, 0)

				var_380_23.a = Mathf.Lerp(0, 1, var_380_22)
				arg_377_1.mask_.color = var_380_23
			end

			if arg_377_1.time_ >= var_380_20 + var_380_21 and arg_377_1.time_ < var_380_20 + var_380_21 + arg_380_0 then
				local var_380_24 = Color.New(0, 0, 0)

				var_380_24.a = 1
				arg_377_1.mask_.color = var_380_24
			end

			local var_380_25 = 1

			if var_380_25 < arg_377_1.time_ and arg_377_1.time_ <= var_380_25 + arg_380_0 then
				arg_377_1.mask_.enabled = true
				arg_377_1.mask_.raycastTarget = true

				arg_377_1:SetGaussion(false)
			end

			local var_380_26 = 0.3

			if var_380_25 <= arg_377_1.time_ and arg_377_1.time_ < var_380_25 + var_380_26 then
				local var_380_27 = (arg_377_1.time_ - var_380_25) / var_380_26
				local var_380_28 = Color.New(0, 0, 0)

				var_380_28.a = Mathf.Lerp(1, 0, var_380_27)
				arg_377_1.mask_.color = var_380_28
			end

			if arg_377_1.time_ >= var_380_25 + var_380_26 and arg_377_1.time_ < var_380_25 + var_380_26 + arg_380_0 then
				local var_380_29 = Color.New(0, 0, 0)
				local var_380_30 = 0

				arg_377_1.mask_.enabled = false
				var_380_29.a = var_380_30
				arg_377_1.mask_.color = var_380_29
			end

			local var_380_31 = arg_377_1.actors_["1011ui_story"].transform
			local var_380_32 = 1

			if var_380_32 < arg_377_1.time_ and arg_377_1.time_ <= var_380_32 + arg_380_0 then
				arg_377_1.var_.moveOldPos1011ui_story = var_380_31.localPosition
			end

			local var_380_33 = 0.001

			if var_380_32 <= arg_377_1.time_ and arg_377_1.time_ < var_380_32 + var_380_33 then
				local var_380_34 = (arg_377_1.time_ - var_380_32) / var_380_33
				local var_380_35 = Vector3.New(0, 100, 0)

				var_380_31.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1011ui_story, var_380_35, var_380_34)

				local var_380_36 = manager.ui.mainCamera.transform.position - var_380_31.position

				var_380_31.forward = Vector3.New(var_380_36.x, var_380_36.y, var_380_36.z)

				local var_380_37 = var_380_31.localEulerAngles

				var_380_37.z = 0
				var_380_37.x = 0
				var_380_31.localEulerAngles = var_380_37
			end

			if arg_377_1.time_ >= var_380_32 + var_380_33 and arg_377_1.time_ < var_380_32 + var_380_33 + arg_380_0 then
				var_380_31.localPosition = Vector3.New(0, 100, 0)

				local var_380_38 = manager.ui.mainCamera.transform.position - var_380_31.position

				var_380_31.forward = Vector3.New(var_380_38.x, var_380_38.y, var_380_38.z)

				local var_380_39 = var_380_31.localEulerAngles

				var_380_39.z = 0
				var_380_39.x = 0
				var_380_31.localEulerAngles = var_380_39
			end

			local var_380_40 = 1.1
			local var_380_41 = 0.75

			if var_380_40 < arg_377_1.time_ and arg_377_1.time_ <= var_380_40 + arg_380_0 then
				local var_380_42 = "play"
				local var_380_43 = "effect"

				arg_377_1:AudioAction(var_380_42, var_380_43, "se_story_side_1011", "se_story_side_1011_whale", "")
			end

			if arg_377_1.frameCnt_ <= 1 then
				arg_377_1.dialog_:SetActive(false)
			end

			local var_380_44 = 1.3
			local var_380_45 = 0.55

			if var_380_44 < arg_377_1.time_ and arg_377_1.time_ <= var_380_44 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0

				arg_377_1.dialog_:SetActive(true)

				local var_380_46 = LeanTween.value(arg_377_1.dialog_, 0, 1, 0.3)

				var_380_46:setOnUpdate(LuaHelper.FloatAction(function(arg_381_0)
					arg_377_1.dialogCg_.alpha = arg_381_0
				end))
				var_380_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_377_1.dialog_)
					var_380_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_377_1.duration_ = arg_377_1.duration_ + 0.3

				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_47 = arg_377_1:GetWordFromCfg(1101106091)
				local var_380_48 = arg_377_1:FormatText(var_380_47.content)

				arg_377_1.text_.text = var_380_48

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_49 = 22
				local var_380_50 = utf8.len(var_380_48)
				local var_380_51 = var_380_49 <= 0 and var_380_45 or var_380_45 * (var_380_50 / var_380_49)

				if var_380_51 > 0 and var_380_45 < var_380_51 then
					arg_377_1.talkMaxDuration = var_380_51
					var_380_44 = var_380_44 + 0.3

					if var_380_51 + var_380_44 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_51 + var_380_44
					end
				end

				arg_377_1.text_.text = var_380_48
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_52 = var_380_44 + 0.3
			local var_380_53 = math.max(var_380_45, arg_377_1.talkMaxDuration)

			if var_380_52 <= arg_377_1.time_ and arg_377_1.time_ < var_380_52 + var_380_53 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_52) / var_380_53

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_52 + var_380_53 and arg_377_1.time_ < var_380_52 + var_380_53 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106092 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 1101106092
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play1101106093(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = 0
			local var_386_1 = 0.95

			if var_386_0 < arg_383_1.time_ and arg_383_1.time_ <= var_386_0 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_2 = arg_383_1:GetWordFromCfg(1101106092)
				local var_386_3 = arg_383_1:FormatText(var_386_2.content)

				arg_383_1.text_.text = var_386_3

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_4 = 38
				local var_386_5 = utf8.len(var_386_3)
				local var_386_6 = var_386_4 <= 0 and var_386_1 or var_386_1 * (var_386_5 / var_386_4)

				if var_386_6 > 0 and var_386_1 < var_386_6 then
					arg_383_1.talkMaxDuration = var_386_6

					if var_386_6 + var_386_0 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_6 + var_386_0
					end
				end

				arg_383_1.text_.text = var_386_3
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_7 = math.max(var_386_1, arg_383_1.talkMaxDuration)

			if var_386_0 <= arg_383_1.time_ and arg_383_1.time_ < var_386_0 + var_386_7 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_0) / var_386_7

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_0 + var_386_7 and arg_383_1.time_ < var_386_0 + var_386_7 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106093 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 1101106093
		arg_387_1.duration_ = 5

		SetActive(arg_387_1.tipsGo_, false)

		function arg_387_1.onSingleLineFinish_()
			arg_387_1.onSingleLineUpdate_ = nil
			arg_387_1.onSingleLineFinish_ = nil
			arg_387_1.state_ = "waiting"
		end

		function arg_387_1.playNext_(arg_389_0)
			if arg_389_0 == 1 then
				arg_387_0:Play1101106094(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.65

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[7].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(1101106093)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 26
				local var_390_6 = utf8.len(var_390_4)
				local var_390_7 = var_390_5 <= 0 and var_390_1 or var_390_1 * (var_390_6 / var_390_5)

				if var_390_7 > 0 and var_390_1 < var_390_7 then
					arg_387_1.talkMaxDuration = var_390_7

					if var_390_7 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_7 + var_390_0
					end
				end

				arg_387_1.text_.text = var_390_4
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)
				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_8 = math.max(var_390_1, arg_387_1.talkMaxDuration)

			if var_390_0 <= arg_387_1.time_ and arg_387_1.time_ < var_390_0 + var_390_8 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_0) / var_390_8

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_0 + var_390_8 and arg_387_1.time_ < var_390_0 + var_390_8 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106094 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 1101106094
		arg_391_1.duration_ = 3.17

		local var_391_0 = {
			zh = 2.966,
			ja = 3.166
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play1101106095(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1011ui_story"].transform
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 then
				arg_391_1.var_.moveOldPos1011ui_story = var_394_0.localPosition
			end

			local var_394_2 = 0.001

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2
				local var_394_4 = Vector3.New(0, -0.71, -6)

				var_394_0.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1011ui_story, var_394_4, var_394_3)

				local var_394_5 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_5.x, var_394_5.y, var_394_5.z)

				local var_394_6 = var_394_0.localEulerAngles

				var_394_6.z = 0
				var_394_6.x = 0
				var_394_0.localEulerAngles = var_394_6
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 then
				var_394_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_394_7 = manager.ui.mainCamera.transform.position - var_394_0.position

				var_394_0.forward = Vector3.New(var_394_7.x, var_394_7.y, var_394_7.z)

				local var_394_8 = var_394_0.localEulerAngles

				var_394_8.z = 0
				var_394_8.x = 0
				var_394_0.localEulerAngles = var_394_8
			end

			local var_394_9 = arg_391_1.actors_["1011ui_story"]
			local var_394_10 = 0

			if var_394_10 < arg_391_1.time_ and arg_391_1.time_ <= var_394_10 + arg_394_0 and not isNil(var_394_9) and arg_391_1.var_.characterEffect1011ui_story == nil then
				arg_391_1.var_.characterEffect1011ui_story = var_394_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_11 = 0.200000002980232

			if var_394_10 <= arg_391_1.time_ and arg_391_1.time_ < var_394_10 + var_394_11 and not isNil(var_394_9) then
				local var_394_12 = (arg_391_1.time_ - var_394_10) / var_394_11

				if arg_391_1.var_.characterEffect1011ui_story and not isNil(var_394_9) then
					arg_391_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_10 + var_394_11 and arg_391_1.time_ < var_394_10 + var_394_11 + arg_394_0 and not isNil(var_394_9) and arg_391_1.var_.characterEffect1011ui_story then
				arg_391_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_394_13 = 0

			if var_394_13 < arg_391_1.time_ and arg_391_1.time_ <= var_394_13 + arg_394_0 then
				arg_391_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_394_14 = 0

			if var_394_14 < arg_391_1.time_ and arg_391_1.time_ <= var_394_14 + arg_394_0 then
				arg_391_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_394_15 = 0
			local var_394_16 = 0.175

			if var_394_15 < arg_391_1.time_ and arg_391_1.time_ <= var_394_15 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_17 = arg_391_1:FormatText(StoryNameCfg[37].name)

				arg_391_1.leftNameTxt_.text = var_394_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_18 = arg_391_1:GetWordFromCfg(1101106094)
				local var_394_19 = arg_391_1:FormatText(var_394_18.content)

				arg_391_1.text_.text = var_394_19

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_20 = 7
				local var_394_21 = utf8.len(var_394_19)
				local var_394_22 = var_394_20 <= 0 and var_394_16 or var_394_16 * (var_394_21 / var_394_20)

				if var_394_22 > 0 and var_394_16 < var_394_22 then
					arg_391_1.talkMaxDuration = var_394_22

					if var_394_22 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_22 + var_394_15
					end
				end

				arg_391_1.text_.text = var_394_19
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb") ~= 0 then
					local var_394_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb") / 1000

					if var_394_23 + var_394_15 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_23 + var_394_15
					end

					if var_394_18.prefab_name ~= "" and arg_391_1.actors_[var_394_18.prefab_name] ~= nil then
						local var_394_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_18.prefab_name].transform, "story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")

						arg_391_1:RecordAudio("1101106094", var_394_24)
						arg_391_1:RecordAudio("1101106094", var_394_24)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_25 = math.max(var_394_16, arg_391_1.talkMaxDuration)

			if var_394_15 <= arg_391_1.time_ and arg_391_1.time_ < var_394_15 + var_394_25 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_15) / var_394_25

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_15 + var_394_25 and arg_391_1.time_ < var_394_15 + var_394_25 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106095 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 1101106095
		arg_395_1.duration_ = 5

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play1101106096(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1011ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and not isNil(var_398_0) and arg_395_1.var_.characterEffect1011ui_story == nil then
				arg_395_1.var_.characterEffect1011ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.200000002980232

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 and not isNil(var_398_0) then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect1011ui_story and not isNil(var_398_0) then
					local var_398_4 = Mathf.Lerp(0, 0.5, var_398_3)

					arg_395_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1011ui_story.fillRatio = var_398_4
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and not isNil(var_398_0) and arg_395_1.var_.characterEffect1011ui_story then
				local var_398_5 = 0.5

				arg_395_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1011ui_story.fillRatio = var_398_5
			end

			local var_398_6 = 0
			local var_398_7 = 0.225

			if var_398_6 < arg_395_1.time_ and arg_395_1.time_ <= var_398_6 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_8 = arg_395_1:FormatText(StoryNameCfg[7].name)

				arg_395_1.leftNameTxt_.text = var_398_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_9 = arg_395_1:GetWordFromCfg(1101106095)
				local var_398_10 = arg_395_1:FormatText(var_398_9.content)

				arg_395_1.text_.text = var_398_10

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_11 = 9
				local var_398_12 = utf8.len(var_398_10)
				local var_398_13 = var_398_11 <= 0 and var_398_7 or var_398_7 * (var_398_12 / var_398_11)

				if var_398_13 > 0 and var_398_7 < var_398_13 then
					arg_395_1.talkMaxDuration = var_398_13

					if var_398_13 + var_398_6 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_13 + var_398_6
					end
				end

				arg_395_1.text_.text = var_398_10
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)
				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_14 = math.max(var_398_7, arg_395_1.talkMaxDuration)

			if var_398_6 <= arg_395_1.time_ and arg_395_1.time_ < var_398_6 + var_398_14 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_6) / var_398_14

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_6 + var_398_14 and arg_395_1.time_ < var_398_6 + var_398_14 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106096 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 1101106096
		arg_399_1.duration_ = 5.13

		local var_399_0 = {
			zh = 5.133,
			ja = 1.5
		}
		local var_399_1 = manager.audio:GetLocalizationFlag()

		if var_399_0[var_399_1] ~= nil then
			arg_399_1.duration_ = var_399_0[var_399_1]
		end

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play1101106097(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1011ui_story"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and not isNil(var_402_0) and arg_399_1.var_.characterEffect1011ui_story == nil then
				arg_399_1.var_.characterEffect1011ui_story = var_402_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_2 = 0.200000002980232

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 and not isNil(var_402_0) then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.characterEffect1011ui_story and not isNil(var_402_0) then
					arg_399_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and not isNil(var_402_0) and arg_399_1.var_.characterEffect1011ui_story then
				arg_399_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_402_4 = 0
			local var_402_5 = 0.3

			if var_402_4 < arg_399_1.time_ and arg_399_1.time_ <= var_402_4 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_6 = arg_399_1:FormatText(StoryNameCfg[37].name)

				arg_399_1.leftNameTxt_.text = var_402_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_7 = arg_399_1:GetWordFromCfg(1101106096)
				local var_402_8 = arg_399_1:FormatText(var_402_7.content)

				arg_399_1.text_.text = var_402_8

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_9 = 12
				local var_402_10 = utf8.len(var_402_8)
				local var_402_11 = var_402_9 <= 0 and var_402_5 or var_402_5 * (var_402_10 / var_402_9)

				if var_402_11 > 0 and var_402_5 < var_402_11 then
					arg_399_1.talkMaxDuration = var_402_11

					if var_402_11 + var_402_4 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_11 + var_402_4
					end
				end

				arg_399_1.text_.text = var_402_8
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb") ~= 0 then
					local var_402_12 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb") / 1000

					if var_402_12 + var_402_4 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_12 + var_402_4
					end

					if var_402_7.prefab_name ~= "" and arg_399_1.actors_[var_402_7.prefab_name] ~= nil then
						local var_402_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_7.prefab_name].transform, "story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")

						arg_399_1:RecordAudio("1101106096", var_402_13)
						arg_399_1:RecordAudio("1101106096", var_402_13)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_14 = math.max(var_402_5, arg_399_1.talkMaxDuration)

			if var_402_4 <= arg_399_1.time_ and arg_399_1.time_ < var_402_4 + var_402_14 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_4) / var_402_14

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_4 + var_402_14 and arg_399_1.time_ < var_402_4 + var_402_14 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106097 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 1101106097
		arg_403_1.duration_ = 5

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play1101106098(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1011ui_story"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and not isNil(var_406_0) and arg_403_1.var_.characterEffect1011ui_story == nil then
				arg_403_1.var_.characterEffect1011ui_story = var_406_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_2 = 0.200000002980232

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 and not isNil(var_406_0) then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.characterEffect1011ui_story and not isNil(var_406_0) then
					local var_406_4 = Mathf.Lerp(0, 0.5, var_406_3)

					arg_403_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_403_1.var_.characterEffect1011ui_story.fillRatio = var_406_4
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and not isNil(var_406_0) and arg_403_1.var_.characterEffect1011ui_story then
				local var_406_5 = 0.5

				arg_403_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_403_1.var_.characterEffect1011ui_story.fillRatio = var_406_5
			end

			local var_406_6 = 0
			local var_406_7 = 0.8

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, false)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_8 = arg_403_1:GetWordFromCfg(1101106097)
				local var_406_9 = arg_403_1:FormatText(var_406_8.content)

				arg_403_1.text_.text = var_406_9

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_10 = 32
				local var_406_11 = utf8.len(var_406_9)
				local var_406_12 = var_406_10 <= 0 and var_406_7 or var_406_7 * (var_406_11 / var_406_10)

				if var_406_12 > 0 and var_406_7 < var_406_12 then
					arg_403_1.talkMaxDuration = var_406_12

					if var_406_12 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_12 + var_406_6
					end
				end

				arg_403_1.text_.text = var_406_9
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)
				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_13 = math.max(var_406_7, arg_403_1.talkMaxDuration)

			if var_406_6 <= arg_403_1.time_ and arg_403_1.time_ < var_406_6 + var_406_13 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_6) / var_406_13

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_6 + var_406_13 and arg_403_1.time_ < var_406_6 + var_406_13 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106098 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 1101106098
		arg_407_1.duration_ = 5

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play1101106099(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.65

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, false)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_2 = arg_407_1:GetWordFromCfg(1101106098)
				local var_410_3 = arg_407_1:FormatText(var_410_2.content)

				arg_407_1.text_.text = var_410_3

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_4 = 26
				local var_410_5 = utf8.len(var_410_3)
				local var_410_6 = var_410_4 <= 0 and var_410_1 or var_410_1 * (var_410_5 / var_410_4)

				if var_410_6 > 0 and var_410_1 < var_410_6 then
					arg_407_1.talkMaxDuration = var_410_6

					if var_410_6 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_6 + var_410_0
					end
				end

				arg_407_1.text_.text = var_410_3
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)
				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_7 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_7 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_7

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_7 and arg_407_1.time_ < var_410_0 + var_410_7 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106099 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 1101106099
		arg_411_1.duration_ = 2

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play1101106100(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1011ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos1011ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0, -0.71, -6)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1011ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = arg_411_1.actors_["1011ui_story"]
			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect1011ui_story == nil then
				arg_411_1.var_.characterEffect1011ui_story = var_414_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_11 = 0.200000002980232

			if var_414_10 <= arg_411_1.time_ and arg_411_1.time_ < var_414_10 + var_414_11 and not isNil(var_414_9) then
				local var_414_12 = (arg_411_1.time_ - var_414_10) / var_414_11

				if arg_411_1.var_.characterEffect1011ui_story and not isNil(var_414_9) then
					arg_411_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_10 + var_414_11 and arg_411_1.time_ < var_414_10 + var_414_11 + arg_414_0 and not isNil(var_414_9) and arg_411_1.var_.characterEffect1011ui_story then
				arg_411_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_414_13 = 0

			if var_414_13 < arg_411_1.time_ and arg_411_1.time_ <= var_414_13 + arg_414_0 then
				arg_411_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_414_14 = 0
			local var_414_15 = 0.125

			if var_414_14 < arg_411_1.time_ and arg_411_1.time_ <= var_414_14 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_16 = arg_411_1:FormatText(StoryNameCfg[37].name)

				arg_411_1.leftNameTxt_.text = var_414_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_17 = arg_411_1:GetWordFromCfg(1101106099)
				local var_414_18 = arg_411_1:FormatText(var_414_17.content)

				arg_411_1.text_.text = var_414_18

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_19 = 5
				local var_414_20 = utf8.len(var_414_18)
				local var_414_21 = var_414_19 <= 0 and var_414_15 or var_414_15 * (var_414_20 / var_414_19)

				if var_414_21 > 0 and var_414_15 < var_414_21 then
					arg_411_1.talkMaxDuration = var_414_21

					if var_414_21 + var_414_14 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_21 + var_414_14
					end
				end

				arg_411_1.text_.text = var_414_18
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb") ~= 0 then
					local var_414_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb") / 1000

					if var_414_22 + var_414_14 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_22 + var_414_14
					end

					if var_414_17.prefab_name ~= "" and arg_411_1.actors_[var_414_17.prefab_name] ~= nil then
						local var_414_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_17.prefab_name].transform, "story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")

						arg_411_1:RecordAudio("1101106099", var_414_23)
						arg_411_1:RecordAudio("1101106099", var_414_23)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_24 = math.max(var_414_15, arg_411_1.talkMaxDuration)

			if var_414_14 <= arg_411_1.time_ and arg_411_1.time_ < var_414_14 + var_414_24 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_14) / var_414_24

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_14 + var_414_24 and arg_411_1.time_ < var_414_14 + var_414_24 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106100 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 1101106100
		arg_415_1.duration_ = 5

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play1101106101(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1011ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect1011ui_story == nil then
				arg_415_1.var_.characterEffect1011ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 and not isNil(var_418_0) then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect1011ui_story and not isNil(var_418_0) then
					local var_418_4 = Mathf.Lerp(0, 0.5, var_418_3)

					arg_415_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_415_1.var_.characterEffect1011ui_story.fillRatio = var_418_4
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and not isNil(var_418_0) and arg_415_1.var_.characterEffect1011ui_story then
				local var_418_5 = 0.5

				arg_415_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_415_1.var_.characterEffect1011ui_story.fillRatio = var_418_5
			end

			local var_418_6 = 0
			local var_418_7 = 0.8

			if var_418_6 < arg_415_1.time_ and arg_415_1.time_ <= var_418_6 + arg_418_0 then
				local var_418_8 = "play"
				local var_418_9 = "effect"

				arg_415_1:AudioAction(var_418_8, var_418_9, "se_story_side_1011", "se_story_side_1011_tour", "")
			end

			local var_418_10 = 0
			local var_418_11 = 0.8

			if var_418_10 < arg_415_1.time_ and arg_415_1.time_ <= var_418_10 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_12 = arg_415_1:GetWordFromCfg(1101106100)
				local var_418_13 = arg_415_1:FormatText(var_418_12.content)

				arg_415_1.text_.text = var_418_13

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_14 = 32
				local var_418_15 = utf8.len(var_418_13)
				local var_418_16 = var_418_14 <= 0 and var_418_11 or var_418_11 * (var_418_15 / var_418_14)

				if var_418_16 > 0 and var_418_11 < var_418_16 then
					arg_415_1.talkMaxDuration = var_418_16

					if var_418_16 + var_418_10 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_16 + var_418_10
					end
				end

				arg_415_1.text_.text = var_418_13
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_17 = math.max(var_418_11, arg_415_1.talkMaxDuration)

			if var_418_10 <= arg_415_1.time_ and arg_415_1.time_ < var_418_10 + var_418_17 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_10) / var_418_17

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_10 + var_418_17 and arg_415_1.time_ < var_418_10 + var_418_17 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106101 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1101106101
		arg_419_1.duration_ = 9.1

		local var_419_0 = {
			zh = 4.233,
			ja = 9.1
		}
		local var_419_1 = manager.audio:GetLocalizationFlag()

		if var_419_0[var_419_1] ~= nil then
			arg_419_1.duration_ = var_419_0[var_419_1]
		end

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1101106102(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = arg_419_1.actors_["1011ui_story"].transform
			local var_422_1 = 0

			if var_422_1 < arg_419_1.time_ and arg_419_1.time_ <= var_422_1 + arg_422_0 then
				arg_419_1.var_.moveOldPos1011ui_story = var_422_0.localPosition
			end

			local var_422_2 = 0.001

			if var_422_1 <= arg_419_1.time_ and arg_419_1.time_ < var_422_1 + var_422_2 then
				local var_422_3 = (arg_419_1.time_ - var_422_1) / var_422_2
				local var_422_4 = Vector3.New(0, -0.71, -6)

				var_422_0.localPosition = Vector3.Lerp(arg_419_1.var_.moveOldPos1011ui_story, var_422_4, var_422_3)

				local var_422_5 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_5.x, var_422_5.y, var_422_5.z)

				local var_422_6 = var_422_0.localEulerAngles

				var_422_6.z = 0
				var_422_6.x = 0
				var_422_0.localEulerAngles = var_422_6
			end

			if arg_419_1.time_ >= var_422_1 + var_422_2 and arg_419_1.time_ < var_422_1 + var_422_2 + arg_422_0 then
				var_422_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_422_7 = manager.ui.mainCamera.transform.position - var_422_0.position

				var_422_0.forward = Vector3.New(var_422_7.x, var_422_7.y, var_422_7.z)

				local var_422_8 = var_422_0.localEulerAngles

				var_422_8.z = 0
				var_422_8.x = 0
				var_422_0.localEulerAngles = var_422_8
			end

			local var_422_9 = arg_419_1.actors_["1011ui_story"]
			local var_422_10 = 0

			if var_422_10 < arg_419_1.time_ and arg_419_1.time_ <= var_422_10 + arg_422_0 and not isNil(var_422_9) and arg_419_1.var_.characterEffect1011ui_story == nil then
				arg_419_1.var_.characterEffect1011ui_story = var_422_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_422_11 = 0.200000002980232

			if var_422_10 <= arg_419_1.time_ and arg_419_1.time_ < var_422_10 + var_422_11 and not isNil(var_422_9) then
				local var_422_12 = (arg_419_1.time_ - var_422_10) / var_422_11

				if arg_419_1.var_.characterEffect1011ui_story and not isNil(var_422_9) then
					arg_419_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_419_1.time_ >= var_422_10 + var_422_11 and arg_419_1.time_ < var_422_10 + var_422_11 + arg_422_0 and not isNil(var_422_9) and arg_419_1.var_.characterEffect1011ui_story then
				arg_419_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_422_13 = 0

			if var_422_13 < arg_419_1.time_ and arg_419_1.time_ <= var_422_13 + arg_422_0 then
				arg_419_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_422_14 = 0

			if var_422_14 < arg_419_1.time_ and arg_419_1.time_ <= var_422_14 + arg_422_0 then
				arg_419_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_422_15 = 0
			local var_422_16 = 0.25

			if var_422_15 < arg_419_1.time_ and arg_419_1.time_ <= var_422_15 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_17 = arg_419_1:FormatText(StoryNameCfg[37].name)

				arg_419_1.leftNameTxt_.text = var_422_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_18 = arg_419_1:GetWordFromCfg(1101106101)
				local var_422_19 = arg_419_1:FormatText(var_422_18.content)

				arg_419_1.text_.text = var_422_19

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_20 = 12
				local var_422_21 = utf8.len(var_422_19)
				local var_422_22 = var_422_20 <= 0 and var_422_16 or var_422_16 * (var_422_21 / var_422_20)

				if var_422_22 > 0 and var_422_16 < var_422_22 then
					arg_419_1.talkMaxDuration = var_422_22

					if var_422_22 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_22 + var_422_15
					end
				end

				arg_419_1.text_.text = var_422_19
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb") ~= 0 then
					local var_422_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb") / 1000

					if var_422_23 + var_422_15 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_23 + var_422_15
					end

					if var_422_18.prefab_name ~= "" and arg_419_1.actors_[var_422_18.prefab_name] ~= nil then
						local var_422_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_18.prefab_name].transform, "story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")

						arg_419_1:RecordAudio("1101106101", var_422_24)
						arg_419_1:RecordAudio("1101106101", var_422_24)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_25 = math.max(var_422_16, arg_419_1.talkMaxDuration)

			if var_422_15 <= arg_419_1.time_ and arg_419_1.time_ < var_422_15 + var_422_25 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_15) / var_422_25

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_15 + var_422_25 and arg_419_1.time_ < var_422_15 + var_422_25 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106102 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1101106102
		arg_423_1.duration_ = 9

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1101106103(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = "I06"

			if arg_423_1.bgs_[var_426_0] == nil then
				local var_426_1 = Object.Instantiate(arg_423_1.paintGo_)

				var_426_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_426_0)
				var_426_1.name = var_426_0
				var_426_1.transform.parent = arg_423_1.stage_.transform
				var_426_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_423_1.bgs_[var_426_0] = var_426_1
			end

			local var_426_2 = 2

			if var_426_2 < arg_423_1.time_ and arg_423_1.time_ <= var_426_2 + arg_426_0 then
				local var_426_3 = manager.ui.mainCamera.transform.localPosition
				local var_426_4 = Vector3.New(0, 0, 10) + Vector3.New(var_426_3.x, var_426_3.y, 0)
				local var_426_5 = arg_423_1.bgs_.I06

				var_426_5.transform.localPosition = var_426_4
				var_426_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_426_6 = var_426_5:GetComponent("SpriteRenderer")

				if var_426_6 and var_426_6.sprite then
					local var_426_7 = (var_426_5.transform.localPosition - var_426_3).z
					local var_426_8 = manager.ui.mainCameraCom_
					local var_426_9 = 2 * var_426_7 * Mathf.Tan(var_426_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_426_10 = var_426_9 * var_426_8.aspect
					local var_426_11 = var_426_6.sprite.bounds.size.x
					local var_426_12 = var_426_6.sprite.bounds.size.y
					local var_426_13 = var_426_10 / var_426_11
					local var_426_14 = var_426_9 / var_426_12
					local var_426_15 = var_426_14 < var_426_13 and var_426_13 or var_426_14

					var_426_5.transform.localScale = Vector3.New(var_426_15, var_426_15, 0)
				end

				for iter_426_0, iter_426_1 in pairs(arg_423_1.bgs_) do
					if iter_426_0 ~= "I06" then
						iter_426_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_426_16 = 0

			if var_426_16 < arg_423_1.time_ and arg_423_1.time_ <= var_426_16 + arg_426_0 then
				arg_423_1.mask_.enabled = true
				arg_423_1.mask_.raycastTarget = true

				arg_423_1:SetGaussion(false)
			end

			local var_426_17 = 2

			if var_426_16 <= arg_423_1.time_ and arg_423_1.time_ < var_426_16 + var_426_17 then
				local var_426_18 = (arg_423_1.time_ - var_426_16) / var_426_17
				local var_426_19 = Color.New(0, 0, 0)

				var_426_19.a = Mathf.Lerp(0, 1, var_426_18)
				arg_423_1.mask_.color = var_426_19
			end

			if arg_423_1.time_ >= var_426_16 + var_426_17 and arg_423_1.time_ < var_426_16 + var_426_17 + arg_426_0 then
				local var_426_20 = Color.New(0, 0, 0)

				var_426_20.a = 1
				arg_423_1.mask_.color = var_426_20
			end

			local var_426_21 = 2

			if var_426_21 < arg_423_1.time_ and arg_423_1.time_ <= var_426_21 + arg_426_0 then
				arg_423_1.mask_.enabled = true
				arg_423_1.mask_.raycastTarget = true

				arg_423_1:SetGaussion(false)
			end

			local var_426_22 = 2

			if var_426_21 <= arg_423_1.time_ and arg_423_1.time_ < var_426_21 + var_426_22 then
				local var_426_23 = (arg_423_1.time_ - var_426_21) / var_426_22
				local var_426_24 = Color.New(0, 0, 0)

				var_426_24.a = Mathf.Lerp(1, 0, var_426_23)
				arg_423_1.mask_.color = var_426_24
			end

			if arg_423_1.time_ >= var_426_21 + var_426_22 and arg_423_1.time_ < var_426_21 + var_426_22 + arg_426_0 then
				local var_426_25 = Color.New(0, 0, 0)
				local var_426_26 = 0

				arg_423_1.mask_.enabled = false
				var_426_25.a = var_426_26
				arg_423_1.mask_.color = var_426_25
			end

			local var_426_27 = arg_423_1.actors_["1011ui_story"].transform
			local var_426_28 = 2

			if var_426_28 < arg_423_1.time_ and arg_423_1.time_ <= var_426_28 + arg_426_0 then
				arg_423_1.var_.moveOldPos1011ui_story = var_426_27.localPosition
			end

			local var_426_29 = 0.001

			if var_426_28 <= arg_423_1.time_ and arg_423_1.time_ < var_426_28 + var_426_29 then
				local var_426_30 = (arg_423_1.time_ - var_426_28) / var_426_29
				local var_426_31 = Vector3.New(0, 100, 0)

				var_426_27.localPosition = Vector3.Lerp(arg_423_1.var_.moveOldPos1011ui_story, var_426_31, var_426_30)

				local var_426_32 = manager.ui.mainCamera.transform.position - var_426_27.position

				var_426_27.forward = Vector3.New(var_426_32.x, var_426_32.y, var_426_32.z)

				local var_426_33 = var_426_27.localEulerAngles

				var_426_33.z = 0
				var_426_33.x = 0
				var_426_27.localEulerAngles = var_426_33
			end

			if arg_423_1.time_ >= var_426_28 + var_426_29 and arg_423_1.time_ < var_426_28 + var_426_29 + arg_426_0 then
				var_426_27.localPosition = Vector3.New(0, 100, 0)

				local var_426_34 = manager.ui.mainCamera.transform.position - var_426_27.position

				var_426_27.forward = Vector3.New(var_426_34.x, var_426_34.y, var_426_34.z)

				local var_426_35 = var_426_27.localEulerAngles

				var_426_35.z = 0
				var_426_35.x = 0
				var_426_27.localEulerAngles = var_426_35
			end

			local var_426_36 = arg_423_1.actors_["1011ui_story"]
			local var_426_37 = 2

			if var_426_37 < arg_423_1.time_ and arg_423_1.time_ <= var_426_37 + arg_426_0 and not isNil(var_426_36) and arg_423_1.var_.characterEffect1011ui_story == nil then
				arg_423_1.var_.characterEffect1011ui_story = var_426_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_38 = 0.200000002980232

			if var_426_37 <= arg_423_1.time_ and arg_423_1.time_ < var_426_37 + var_426_38 and not isNil(var_426_36) then
				local var_426_39 = (arg_423_1.time_ - var_426_37) / var_426_38

				if arg_423_1.var_.characterEffect1011ui_story and not isNil(var_426_36) then
					local var_426_40 = Mathf.Lerp(0, 0.5, var_426_39)

					arg_423_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_423_1.var_.characterEffect1011ui_story.fillRatio = var_426_40
				end
			end

			if arg_423_1.time_ >= var_426_37 + var_426_38 and arg_423_1.time_ < var_426_37 + var_426_38 + arg_426_0 and not isNil(var_426_36) and arg_423_1.var_.characterEffect1011ui_story then
				local var_426_41 = 0.5

				arg_423_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_423_1.var_.characterEffect1011ui_story.fillRatio = var_426_41
			end

			if arg_423_1.frameCnt_ <= 1 then
				arg_423_1.dialog_:SetActive(false)
			end

			local var_426_42 = 4
			local var_426_43 = 0.875

			if var_426_42 < arg_423_1.time_ and arg_423_1.time_ <= var_426_42 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0

				arg_423_1.dialog_:SetActive(true)

				local var_426_44 = LeanTween.value(arg_423_1.dialog_, 0, 1, 0.3)

				var_426_44:setOnUpdate(LuaHelper.FloatAction(function(arg_427_0)
					arg_423_1.dialogCg_.alpha = arg_427_0
				end))
				var_426_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_423_1.dialog_)
					var_426_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_423_1.duration_ = arg_423_1.duration_ + 0.3

				SetActive(arg_423_1.leftNameGo_, false)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_45 = arg_423_1:GetWordFromCfg(1101106102)
				local var_426_46 = arg_423_1:FormatText(var_426_45.content)

				arg_423_1.text_.text = var_426_46

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_47 = 35
				local var_426_48 = utf8.len(var_426_46)
				local var_426_49 = var_426_47 <= 0 and var_426_43 or var_426_43 * (var_426_48 / var_426_47)

				if var_426_49 > 0 and var_426_43 < var_426_49 then
					arg_423_1.talkMaxDuration = var_426_49
					var_426_42 = var_426_42 + 0.3

					if var_426_49 + var_426_42 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_49 + var_426_42
					end
				end

				arg_423_1.text_.text = var_426_46
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_50 = var_426_42 + 0.3
			local var_426_51 = math.max(var_426_43, arg_423_1.talkMaxDuration)

			if var_426_50 <= arg_423_1.time_ and arg_423_1.time_ < var_426_50 + var_426_51 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_50) / var_426_51

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_50 + var_426_51 and arg_423_1.time_ < var_426_50 + var_426_51 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106103 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 1101106103
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play1101106104(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0
			local var_432_1 = 0.4

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_2 = arg_429_1:FormatText(StoryNameCfg[7].name)

				arg_429_1.leftNameTxt_.text = var_432_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_3 = arg_429_1:GetWordFromCfg(1101106103)
				local var_432_4 = arg_429_1:FormatText(var_432_3.content)

				arg_429_1.text_.text = var_432_4

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_5 = 16
				local var_432_6 = utf8.len(var_432_4)
				local var_432_7 = var_432_5 <= 0 and var_432_1 or var_432_1 * (var_432_6 / var_432_5)

				if var_432_7 > 0 and var_432_1 < var_432_7 then
					arg_429_1.talkMaxDuration = var_432_7

					if var_432_7 + var_432_0 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_7 + var_432_0
					end
				end

				arg_429_1.text_.text = var_432_4
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_8 = math.max(var_432_1, arg_429_1.talkMaxDuration)

			if var_432_0 <= arg_429_1.time_ and arg_429_1.time_ < var_432_0 + var_432_8 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_0) / var_432_8

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_0 + var_432_8 and arg_429_1.time_ < var_432_0 + var_432_8 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106104 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 1101106104
		arg_433_1.duration_ = 9.7

		local var_433_0 = {
			zh = 9.7,
			ja = 6.7
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play1101106105(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["1011ui_story"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos1011ui_story = var_436_0.localPosition
			end

			local var_436_2 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_2 then
				local var_436_3 = (arg_433_1.time_ - var_436_1) / var_436_2
				local var_436_4 = Vector3.New(0, -0.71, -6)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos1011ui_story, var_436_4, var_436_3)

				local var_436_5 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_5.x, var_436_5.y, var_436_5.z)

				local var_436_6 = var_436_0.localEulerAngles

				var_436_6.z = 0
				var_436_6.x = 0
				var_436_0.localEulerAngles = var_436_6
			end

			if arg_433_1.time_ >= var_436_1 + var_436_2 and arg_433_1.time_ < var_436_1 + var_436_2 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_436_7 = manager.ui.mainCamera.transform.position - var_436_0.position

				var_436_0.forward = Vector3.New(var_436_7.x, var_436_7.y, var_436_7.z)

				local var_436_8 = var_436_0.localEulerAngles

				var_436_8.z = 0
				var_436_8.x = 0
				var_436_0.localEulerAngles = var_436_8
			end

			local var_436_9 = arg_433_1.actors_["1011ui_story"]
			local var_436_10 = 0

			if var_436_10 < arg_433_1.time_ and arg_433_1.time_ <= var_436_10 + arg_436_0 and not isNil(var_436_9) and arg_433_1.var_.characterEffect1011ui_story == nil then
				arg_433_1.var_.characterEffect1011ui_story = var_436_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_436_11 = 0.200000002980232

			if var_436_10 <= arg_433_1.time_ and arg_433_1.time_ < var_436_10 + var_436_11 and not isNil(var_436_9) then
				local var_436_12 = (arg_433_1.time_ - var_436_10) / var_436_11

				if arg_433_1.var_.characterEffect1011ui_story and not isNil(var_436_9) then
					arg_433_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_433_1.time_ >= var_436_10 + var_436_11 and arg_433_1.time_ < var_436_10 + var_436_11 + arg_436_0 and not isNil(var_436_9) and arg_433_1.var_.characterEffect1011ui_story then
				arg_433_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_436_13 = 0

			if var_436_13 < arg_433_1.time_ and arg_433_1.time_ <= var_436_13 + arg_436_0 then
				arg_433_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_436_14 = 0

			if var_436_14 < arg_433_1.time_ and arg_433_1.time_ <= var_436_14 + arg_436_0 then
				arg_433_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_436_15 = 0
			local var_436_16 = 0.8

			if var_436_15 < arg_433_1.time_ and arg_433_1.time_ <= var_436_15 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_17 = arg_433_1:FormatText(StoryNameCfg[37].name)

				arg_433_1.leftNameTxt_.text = var_436_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_18 = arg_433_1:GetWordFromCfg(1101106104)
				local var_436_19 = arg_433_1:FormatText(var_436_18.content)

				arg_433_1.text_.text = var_436_19

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_20 = 32
				local var_436_21 = utf8.len(var_436_19)
				local var_436_22 = var_436_20 <= 0 and var_436_16 or var_436_16 * (var_436_21 / var_436_20)

				if var_436_22 > 0 and var_436_16 < var_436_22 then
					arg_433_1.talkMaxDuration = var_436_22

					if var_436_22 + var_436_15 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_22 + var_436_15
					end
				end

				arg_433_1.text_.text = var_436_19
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb") ~= 0 then
					local var_436_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb") / 1000

					if var_436_23 + var_436_15 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_23 + var_436_15
					end

					if var_436_18.prefab_name ~= "" and arg_433_1.actors_[var_436_18.prefab_name] ~= nil then
						local var_436_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_18.prefab_name].transform, "story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")

						arg_433_1:RecordAudio("1101106104", var_436_24)
						arg_433_1:RecordAudio("1101106104", var_436_24)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_25 = math.max(var_436_16, arg_433_1.talkMaxDuration)

			if var_436_15 <= arg_433_1.time_ and arg_433_1.time_ < var_436_15 + var_436_25 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_15) / var_436_25

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_15 + var_436_25 and arg_433_1.time_ < var_436_15 + var_436_25 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106105 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 1101106105
		arg_437_1.duration_ = 5

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play1101106106(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1011ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and not isNil(var_440_0) and arg_437_1.var_.characterEffect1011ui_story == nil then
				arg_437_1.var_.characterEffect1011ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.200000002980232

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 and not isNil(var_440_0) then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1011ui_story and not isNil(var_440_0) then
					local var_440_4 = Mathf.Lerp(0, 0.5, var_440_3)

					arg_437_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1011ui_story.fillRatio = var_440_4
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and not isNil(var_440_0) and arg_437_1.var_.characterEffect1011ui_story then
				local var_440_5 = 0.5

				arg_437_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1011ui_story.fillRatio = var_440_5
			end

			local var_440_6 = 0
			local var_440_7 = 0.15

			if var_440_6 < arg_437_1.time_ and arg_437_1.time_ <= var_440_6 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_8 = arg_437_1:FormatText(StoryNameCfg[7].name)

				arg_437_1.leftNameTxt_.text = var_440_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_9 = arg_437_1:GetWordFromCfg(1101106105)
				local var_440_10 = arg_437_1:FormatText(var_440_9.content)

				arg_437_1.text_.text = var_440_10

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_11 = 6
				local var_440_12 = utf8.len(var_440_10)
				local var_440_13 = var_440_11 <= 0 and var_440_7 or var_440_7 * (var_440_12 / var_440_11)

				if var_440_13 > 0 and var_440_7 < var_440_13 then
					arg_437_1.talkMaxDuration = var_440_13

					if var_440_13 + var_440_6 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_13 + var_440_6
					end
				end

				arg_437_1.text_.text = var_440_10
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)
				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_14 = math.max(var_440_7, arg_437_1.talkMaxDuration)

			if var_440_6 <= arg_437_1.time_ and arg_437_1.time_ < var_440_6 + var_440_14 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_6) / var_440_14

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_6 + var_440_14 and arg_437_1.time_ < var_440_6 + var_440_14 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106106 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 1101106106
		arg_441_1.duration_ = 3

		local var_441_0 = {
			zh = 3,
			ja = 2.733
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play1101106107(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1011ui_story"]
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 and not isNil(var_444_0) and arg_441_1.var_.characterEffect1011ui_story == nil then
				arg_441_1.var_.characterEffect1011ui_story = var_444_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_2 = 0.200000002980232

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 and not isNil(var_444_0) then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2

				if arg_441_1.var_.characterEffect1011ui_story and not isNil(var_444_0) then
					arg_441_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 and not isNil(var_444_0) and arg_441_1.var_.characterEffect1011ui_story then
				arg_441_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_444_4 = 0

			if var_444_4 < arg_441_1.time_ and arg_441_1.time_ <= var_444_4 + arg_444_0 then
				arg_441_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_444_5 = 0
			local var_444_6 = 0.225

			if var_444_5 < arg_441_1.time_ and arg_441_1.time_ <= var_444_5 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_7 = arg_441_1:FormatText(StoryNameCfg[37].name)

				arg_441_1.leftNameTxt_.text = var_444_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_8 = arg_441_1:GetWordFromCfg(1101106106)
				local var_444_9 = arg_441_1:FormatText(var_444_8.content)

				arg_441_1.text_.text = var_444_9

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_10 = 9
				local var_444_11 = utf8.len(var_444_9)
				local var_444_12 = var_444_10 <= 0 and var_444_6 or var_444_6 * (var_444_11 / var_444_10)

				if var_444_12 > 0 and var_444_6 < var_444_12 then
					arg_441_1.talkMaxDuration = var_444_12

					if var_444_12 + var_444_5 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_12 + var_444_5
					end
				end

				arg_441_1.text_.text = var_444_9
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb") ~= 0 then
					local var_444_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb") / 1000

					if var_444_13 + var_444_5 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_13 + var_444_5
					end

					if var_444_8.prefab_name ~= "" and arg_441_1.actors_[var_444_8.prefab_name] ~= nil then
						local var_444_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_8.prefab_name].transform, "story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")

						arg_441_1:RecordAudio("1101106106", var_444_14)
						arg_441_1:RecordAudio("1101106106", var_444_14)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_15 = math.max(var_444_6, arg_441_1.talkMaxDuration)

			if var_444_5 <= arg_441_1.time_ and arg_441_1.time_ < var_444_5 + var_444_15 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_5) / var_444_15

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_5 + var_444_15 and arg_441_1.time_ < var_444_5 + var_444_15 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106107 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 1101106107
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play1101106108(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1011ui_story"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos1011ui_story = var_448_0.localPosition
			end

			local var_448_2 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2
				local var_448_4 = Vector3.New(0, -0.71, -6)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos1011ui_story, var_448_4, var_448_3)

				local var_448_5 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_5.x, var_448_5.y, var_448_5.z)

				local var_448_6 = var_448_0.localEulerAngles

				var_448_6.z = 0
				var_448_6.x = 0
				var_448_0.localEulerAngles = var_448_6
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_448_7 = manager.ui.mainCamera.transform.position - var_448_0.position

				var_448_0.forward = Vector3.New(var_448_7.x, var_448_7.y, var_448_7.z)

				local var_448_8 = var_448_0.localEulerAngles

				var_448_8.z = 0
				var_448_8.x = 0
				var_448_0.localEulerAngles = var_448_8
			end

			local var_448_9 = 0

			if var_448_9 < arg_445_1.time_ and arg_445_1.time_ <= var_448_9 + arg_448_0 then
				arg_445_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action428")
			end

			local var_448_10 = 0
			local var_448_11 = 0.325

			if var_448_10 < arg_445_1.time_ and arg_445_1.time_ <= var_448_10 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, false)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_12 = arg_445_1:GetWordFromCfg(1101106107)
				local var_448_13 = arg_445_1:FormatText(var_448_12.content)

				arg_445_1.text_.text = var_448_13

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_14 = 13
				local var_448_15 = utf8.len(var_448_13)
				local var_448_16 = var_448_14 <= 0 and var_448_11 or var_448_11 * (var_448_15 / var_448_14)

				if var_448_16 > 0 and var_448_11 < var_448_16 then
					arg_445_1.talkMaxDuration = var_448_16

					if var_448_16 + var_448_10 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_16 + var_448_10
					end
				end

				arg_445_1.text_.text = var_448_13
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_17 = math.max(var_448_11, arg_445_1.talkMaxDuration)

			if var_448_10 <= arg_445_1.time_ and arg_445_1.time_ < var_448_10 + var_448_17 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_10) / var_448_17

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_10 + var_448_17 and arg_445_1.time_ < var_448_10 + var_448_17 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106108 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 1101106108
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play1101106109(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 1.075

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(1101106108)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 43
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_8 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_8 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_8

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_8 and arg_449_1.time_ < var_452_0 + var_452_8 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106109 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 1101106109
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play1101106110(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1011ui_story"].transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPos1011ui_story = var_456_0.localPosition
			end

			local var_456_2 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2
				local var_456_4 = Vector3.New(0, 100, 0)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPos1011ui_story, var_456_4, var_456_3)

				local var_456_5 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_5.x, var_456_5.y, var_456_5.z)

				local var_456_6 = var_456_0.localEulerAngles

				var_456_6.z = 0
				var_456_6.x = 0
				var_456_0.localEulerAngles = var_456_6
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(0, 100, 0)

				local var_456_7 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_7.x, var_456_7.y, var_456_7.z)

				local var_456_8 = var_456_0.localEulerAngles

				var_456_8.z = 0
				var_456_8.x = 0
				var_456_0.localEulerAngles = var_456_8
			end

			local var_456_9 = 0
			local var_456_10 = 0.925

			if var_456_9 < arg_453_1.time_ and arg_453_1.time_ <= var_456_9 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_11 = arg_453_1:GetWordFromCfg(1101106109)
				local var_456_12 = arg_453_1:FormatText(var_456_11.content)

				arg_453_1.text_.text = var_456_12

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_13 = 37
				local var_456_14 = utf8.len(var_456_12)
				local var_456_15 = var_456_13 <= 0 and var_456_10 or var_456_10 * (var_456_14 / var_456_13)

				if var_456_15 > 0 and var_456_10 < var_456_15 then
					arg_453_1.talkMaxDuration = var_456_15

					if var_456_15 + var_456_9 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_15 + var_456_9
					end
				end

				arg_453_1.text_.text = var_456_12
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_16 = math.max(var_456_10, arg_453_1.talkMaxDuration)

			if var_456_9 <= arg_453_1.time_ and arg_453_1.time_ < var_456_9 + var_456_16 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_9) / var_456_16

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_9 + var_456_16 and arg_453_1.time_ < var_456_9 + var_456_16 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106110 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 1101106110
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play1101106111(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.7

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[7].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(1101106110)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 28
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_8 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_8 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_8

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_8 and arg_457_1.time_ < var_460_0 + var_460_8 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106111 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 1101106111
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play1101106112(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.2

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_2 = arg_461_1:FormatText(StoryNameCfg[7].name)

				arg_461_1.leftNameTxt_.text = var_464_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_3 = arg_461_1:GetWordFromCfg(1101106111)
				local var_464_4 = arg_461_1:FormatText(var_464_3.content)

				arg_461_1.text_.text = var_464_4

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_5 = 8
				local var_464_6 = utf8.len(var_464_4)
				local var_464_7 = var_464_5 <= 0 and var_464_1 or var_464_1 * (var_464_6 / var_464_5)

				if var_464_7 > 0 and var_464_1 < var_464_7 then
					arg_461_1.talkMaxDuration = var_464_7

					if var_464_7 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_7 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_4
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_8 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_8 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_8

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_8 and arg_461_1.time_ < var_464_0 + var_464_8 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106112 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 1101106112
		arg_465_1.duration_ = 7.03

		local var_465_0 = {
			zh = 7.033,
			ja = 5.4
		}
		local var_465_1 = manager.audio:GetLocalizationFlag()

		if var_465_0[var_465_1] ~= nil then
			arg_465_1.duration_ = var_465_0[var_465_1]
		end

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play1101106113(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = arg_465_1.actors_["1011ui_story"].transform
			local var_468_1 = 0

			if var_468_1 < arg_465_1.time_ and arg_465_1.time_ <= var_468_1 + arg_468_0 then
				arg_465_1.var_.moveOldPos1011ui_story = var_468_0.localPosition
			end

			local var_468_2 = 0.001

			if var_468_1 <= arg_465_1.time_ and arg_465_1.time_ < var_468_1 + var_468_2 then
				local var_468_3 = (arg_465_1.time_ - var_468_1) / var_468_2
				local var_468_4 = Vector3.New(0, -0.71, -6)

				var_468_0.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1011ui_story, var_468_4, var_468_3)

				local var_468_5 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_5.x, var_468_5.y, var_468_5.z)

				local var_468_6 = var_468_0.localEulerAngles

				var_468_6.z = 0
				var_468_6.x = 0
				var_468_0.localEulerAngles = var_468_6
			end

			if arg_465_1.time_ >= var_468_1 + var_468_2 and arg_465_1.time_ < var_468_1 + var_468_2 + arg_468_0 then
				var_468_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_468_7 = manager.ui.mainCamera.transform.position - var_468_0.position

				var_468_0.forward = Vector3.New(var_468_7.x, var_468_7.y, var_468_7.z)

				local var_468_8 = var_468_0.localEulerAngles

				var_468_8.z = 0
				var_468_8.x = 0
				var_468_0.localEulerAngles = var_468_8
			end

			local var_468_9 = arg_465_1.actors_["1011ui_story"]
			local var_468_10 = 0

			if var_468_10 < arg_465_1.time_ and arg_465_1.time_ <= var_468_10 + arg_468_0 and not isNil(var_468_9) and arg_465_1.var_.characterEffect1011ui_story == nil then
				arg_465_1.var_.characterEffect1011ui_story = var_468_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_468_11 = 0.200000002980232

			if var_468_10 <= arg_465_1.time_ and arg_465_1.time_ < var_468_10 + var_468_11 and not isNil(var_468_9) then
				local var_468_12 = (arg_465_1.time_ - var_468_10) / var_468_11

				if arg_465_1.var_.characterEffect1011ui_story and not isNil(var_468_9) then
					arg_465_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_465_1.time_ >= var_468_10 + var_468_11 and arg_465_1.time_ < var_468_10 + var_468_11 + arg_468_0 and not isNil(var_468_9) and arg_465_1.var_.characterEffect1011ui_story then
				arg_465_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_468_13 = 0

			if var_468_13 < arg_465_1.time_ and arg_465_1.time_ <= var_468_13 + arg_468_0 then
				arg_465_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_468_14 = 0
			local var_468_15 = 0.8

			if var_468_14 < arg_465_1.time_ and arg_465_1.time_ <= var_468_14 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_16 = arg_465_1:FormatText(StoryNameCfg[37].name)

				arg_465_1.leftNameTxt_.text = var_468_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_17 = arg_465_1:GetWordFromCfg(1101106112)
				local var_468_18 = arg_465_1:FormatText(var_468_17.content)

				arg_465_1.text_.text = var_468_18

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_19 = 32
				local var_468_20 = utf8.len(var_468_18)
				local var_468_21 = var_468_19 <= 0 and var_468_15 or var_468_15 * (var_468_20 / var_468_19)

				if var_468_21 > 0 and var_468_15 < var_468_21 then
					arg_465_1.talkMaxDuration = var_468_21

					if var_468_21 + var_468_14 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_21 + var_468_14
					end
				end

				arg_465_1.text_.text = var_468_18
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb") ~= 0 then
					local var_468_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb") / 1000

					if var_468_22 + var_468_14 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_22 + var_468_14
					end

					if var_468_17.prefab_name ~= "" and arg_465_1.actors_[var_468_17.prefab_name] ~= nil then
						local var_468_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_17.prefab_name].transform, "story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")

						arg_465_1:RecordAudio("1101106112", var_468_23)
						arg_465_1:RecordAudio("1101106112", var_468_23)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_24 = math.max(var_468_15, arg_465_1.talkMaxDuration)

			if var_468_14 <= arg_465_1.time_ and arg_465_1.time_ < var_468_14 + var_468_24 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_14) / var_468_24

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_14 + var_468_24 and arg_465_1.time_ < var_468_14 + var_468_24 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106113 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 1101106113
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play1101106114(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = arg_469_1.actors_["1011ui_story"]
			local var_472_1 = 0

			if var_472_1 < arg_469_1.time_ and arg_469_1.time_ <= var_472_1 + arg_472_0 and not isNil(var_472_0) and arg_469_1.var_.characterEffect1011ui_story == nil then
				arg_469_1.var_.characterEffect1011ui_story = var_472_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_472_2 = 0.200000002980232

			if var_472_1 <= arg_469_1.time_ and arg_469_1.time_ < var_472_1 + var_472_2 and not isNil(var_472_0) then
				local var_472_3 = (arg_469_1.time_ - var_472_1) / var_472_2

				if arg_469_1.var_.characterEffect1011ui_story and not isNil(var_472_0) then
					local var_472_4 = Mathf.Lerp(0, 0.5, var_472_3)

					arg_469_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_469_1.var_.characterEffect1011ui_story.fillRatio = var_472_4
				end
			end

			if arg_469_1.time_ >= var_472_1 + var_472_2 and arg_469_1.time_ < var_472_1 + var_472_2 + arg_472_0 and not isNil(var_472_0) and arg_469_1.var_.characterEffect1011ui_story then
				local var_472_5 = 0.5

				arg_469_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_469_1.var_.characterEffect1011ui_story.fillRatio = var_472_5
			end

			local var_472_6 = 0
			local var_472_7 = 0.275

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_8 = arg_469_1:FormatText(StoryNameCfg[7].name)

				arg_469_1.leftNameTxt_.text = var_472_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_9 = arg_469_1:GetWordFromCfg(1101106113)
				local var_472_10 = arg_469_1:FormatText(var_472_9.content)

				arg_469_1.text_.text = var_472_10

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_11 = 11
				local var_472_12 = utf8.len(var_472_10)
				local var_472_13 = var_472_11 <= 0 and var_472_7 or var_472_7 * (var_472_12 / var_472_11)

				if var_472_13 > 0 and var_472_7 < var_472_13 then
					arg_469_1.talkMaxDuration = var_472_13

					if var_472_13 + var_472_6 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_13 + var_472_6
					end
				end

				arg_469_1.text_.text = var_472_10
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_14 = math.max(var_472_7, arg_469_1.talkMaxDuration)

			if var_472_6 <= arg_469_1.time_ and arg_469_1.time_ < var_472_6 + var_472_14 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_6) / var_472_14

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_6 + var_472_14 and arg_469_1.time_ < var_472_6 + var_472_14 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106114 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 1101106114
		arg_473_1.duration_ = 5

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play1101106115(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 0.6

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, false)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_473_1.iconTrs_.gameObject, false)
				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_2 = arg_473_1:GetWordFromCfg(1101106114)
				local var_476_3 = arg_473_1:FormatText(var_476_2.content)

				arg_473_1.text_.text = var_476_3

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_4 = 24
				local var_476_5 = utf8.len(var_476_3)
				local var_476_6 = var_476_4 <= 0 and var_476_1 or var_476_1 * (var_476_5 / var_476_4)

				if var_476_6 > 0 and var_476_1 < var_476_6 then
					arg_473_1.talkMaxDuration = var_476_6

					if var_476_6 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_6 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_3
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)
				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_7 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_7 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_7

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_7 and arg_473_1.time_ < var_476_0 + var_476_7 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106115 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1101106115
		arg_477_1.duration_ = 5

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1101106116(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 0.65

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_2 = arg_477_1:FormatText(StoryNameCfg[7].name)

				arg_477_1.leftNameTxt_.text = var_480_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_3 = arg_477_1:GetWordFromCfg(1101106115)
				local var_480_4 = arg_477_1:FormatText(var_480_3.content)

				arg_477_1.text_.text = var_480_4

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_5 = 26
				local var_480_6 = utf8.len(var_480_4)
				local var_480_7 = var_480_5 <= 0 and var_480_1 or var_480_1 * (var_480_6 / var_480_5)

				if var_480_7 > 0 and var_480_1 < var_480_7 then
					arg_477_1.talkMaxDuration = var_480_7

					if var_480_7 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_7 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_4
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)
				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_8 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_8 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_8

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_8 and arg_477_1.time_ < var_480_0 + var_480_8 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106116 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 1101106116
		arg_481_1.duration_ = 3.8

		local var_481_0 = {
			zh = 3.233,
			ja = 3.8
		}
		local var_481_1 = manager.audio:GetLocalizationFlag()

		if var_481_0[var_481_1] ~= nil then
			arg_481_1.duration_ = var_481_0[var_481_1]
		end

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play1101106117(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = arg_481_1.actors_["1011ui_story"].transform
			local var_484_1 = 0

			if var_484_1 < arg_481_1.time_ and arg_481_1.time_ <= var_484_1 + arg_484_0 then
				arg_481_1.var_.moveOldPos1011ui_story = var_484_0.localPosition
			end

			local var_484_2 = 0.001

			if var_484_1 <= arg_481_1.time_ and arg_481_1.time_ < var_484_1 + var_484_2 then
				local var_484_3 = (arg_481_1.time_ - var_484_1) / var_484_2
				local var_484_4 = Vector3.New(0, -0.71, -6)

				var_484_0.localPosition = Vector3.Lerp(arg_481_1.var_.moveOldPos1011ui_story, var_484_4, var_484_3)

				local var_484_5 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_5.x, var_484_5.y, var_484_5.z)

				local var_484_6 = var_484_0.localEulerAngles

				var_484_6.z = 0
				var_484_6.x = 0
				var_484_0.localEulerAngles = var_484_6
			end

			if arg_481_1.time_ >= var_484_1 + var_484_2 and arg_481_1.time_ < var_484_1 + var_484_2 + arg_484_0 then
				var_484_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_484_7 = manager.ui.mainCamera.transform.position - var_484_0.position

				var_484_0.forward = Vector3.New(var_484_7.x, var_484_7.y, var_484_7.z)

				local var_484_8 = var_484_0.localEulerAngles

				var_484_8.z = 0
				var_484_8.x = 0
				var_484_0.localEulerAngles = var_484_8
			end

			local var_484_9 = arg_481_1.actors_["1011ui_story"]
			local var_484_10 = 0

			if var_484_10 < arg_481_1.time_ and arg_481_1.time_ <= var_484_10 + arg_484_0 and not isNil(var_484_9) and arg_481_1.var_.characterEffect1011ui_story == nil then
				arg_481_1.var_.characterEffect1011ui_story = var_484_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_484_11 = 0.200000002980232

			if var_484_10 <= arg_481_1.time_ and arg_481_1.time_ < var_484_10 + var_484_11 and not isNil(var_484_9) then
				local var_484_12 = (arg_481_1.time_ - var_484_10) / var_484_11

				if arg_481_1.var_.characterEffect1011ui_story and not isNil(var_484_9) then
					arg_481_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_481_1.time_ >= var_484_10 + var_484_11 and arg_481_1.time_ < var_484_10 + var_484_11 + arg_484_0 and not isNil(var_484_9) and arg_481_1.var_.characterEffect1011ui_story then
				arg_481_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_484_13 = 0

			if var_484_13 < arg_481_1.time_ and arg_481_1.time_ <= var_484_13 + arg_484_0 then
				arg_481_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_2")
			end

			local var_484_14 = 0

			if var_484_14 < arg_481_1.time_ and arg_481_1.time_ <= var_484_14 + arg_484_0 then
				arg_481_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_484_15 = 0
			local var_484_16 = 0.2

			if var_484_15 < arg_481_1.time_ and arg_481_1.time_ <= var_484_15 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_17 = arg_481_1:FormatText(StoryNameCfg[37].name)

				arg_481_1.leftNameTxt_.text = var_484_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, false)
				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_18 = arg_481_1:GetWordFromCfg(1101106116)
				local var_484_19 = arg_481_1:FormatText(var_484_18.content)

				arg_481_1.text_.text = var_484_19

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_20 = 8
				local var_484_21 = utf8.len(var_484_19)
				local var_484_22 = var_484_20 <= 0 and var_484_16 or var_484_16 * (var_484_21 / var_484_20)

				if var_484_22 > 0 and var_484_16 < var_484_22 then
					arg_481_1.talkMaxDuration = var_484_22

					if var_484_22 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_22 + var_484_15
					end
				end

				arg_481_1.text_.text = var_484_19
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb") ~= 0 then
					local var_484_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb") / 1000

					if var_484_23 + var_484_15 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_23 + var_484_15
					end

					if var_484_18.prefab_name ~= "" and arg_481_1.actors_[var_484_18.prefab_name] ~= nil then
						local var_484_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_18.prefab_name].transform, "story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")

						arg_481_1:RecordAudio("1101106116", var_484_24)
						arg_481_1:RecordAudio("1101106116", var_484_24)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_25 = math.max(var_484_16, arg_481_1.talkMaxDuration)

			if var_484_15 <= arg_481_1.time_ and arg_481_1.time_ < var_484_15 + var_484_25 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_15) / var_484_25

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_15 + var_484_25 and arg_481_1.time_ < var_484_15 + var_484_25 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106117 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 1101106117
		arg_485_1.duration_ = 5

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play1101106118(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = arg_485_1.actors_["1011ui_story"]
			local var_488_1 = 0

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect1011ui_story == nil then
				arg_485_1.var_.characterEffect1011ui_story = var_488_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_488_2 = 0.200000002980232

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_2 and not isNil(var_488_0) then
				local var_488_3 = (arg_485_1.time_ - var_488_1) / var_488_2

				if arg_485_1.var_.characterEffect1011ui_story and not isNil(var_488_0) then
					local var_488_4 = Mathf.Lerp(0, 0.5, var_488_3)

					arg_485_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_485_1.var_.characterEffect1011ui_story.fillRatio = var_488_4
				end
			end

			if arg_485_1.time_ >= var_488_1 + var_488_2 and arg_485_1.time_ < var_488_1 + var_488_2 + arg_488_0 and not isNil(var_488_0) and arg_485_1.var_.characterEffect1011ui_story then
				local var_488_5 = 0.5

				arg_485_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_485_1.var_.characterEffect1011ui_story.fillRatio = var_488_5
			end

			local var_488_6 = 0
			local var_488_7 = 0.3

			if var_488_6 < arg_485_1.time_ and arg_485_1.time_ <= var_488_6 + arg_488_0 then
				local var_488_8 = "play"
				local var_488_9 = "music"

				arg_485_1:AudioAction(var_488_8, var_488_9, "ui_battle", "ui_battle_stopbgm", "")

				local var_488_10 = ""
				local var_488_11 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_488_11 ~= "" then
					if arg_485_1.bgmTxt_.text ~= var_488_11 and arg_485_1.bgmTxt_.text ~= "" then
						if arg_485_1.bgmTxt2_.text ~= "" then
							arg_485_1.bgmTxt_.text = arg_485_1.bgmTxt2_.text
						end

						arg_485_1.bgmTxt2_.text = var_488_11

						arg_485_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_485_1.bgmTxt_.text = var_488_11
					end

					if arg_485_1.bgmTimer then
						arg_485_1.bgmTimer:Stop()

						arg_485_1.bgmTimer = nil
					end

					if arg_485_1.settingData.show_music_name == 1 then
						arg_485_1.musicController:SetSelectedState("show")
						arg_485_1.musicAnimator_:Play("open", 0, 0)

						if arg_485_1.settingData.music_time ~= 0 then
							arg_485_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_485_1.settingData.music_time), function()
								if arg_485_1 == nil or isNil(arg_485_1.bgmTxt_) then
									return
								end

								arg_485_1.musicController:SetSelectedState("hide")
								arg_485_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_488_12 = 0
			local var_488_13 = 0.6

			if var_488_12 < arg_485_1.time_ and arg_485_1.time_ <= var_488_12 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_14 = arg_485_1:FormatText(StoryNameCfg[7].name)

				arg_485_1.leftNameTxt_.text = var_488_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_15 = arg_485_1:GetWordFromCfg(1101106117)
				local var_488_16 = arg_485_1:FormatText(var_488_15.content)

				arg_485_1.text_.text = var_488_16

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_17 = 24
				local var_488_18 = utf8.len(var_488_16)
				local var_488_19 = var_488_17 <= 0 and var_488_13 or var_488_13 * (var_488_18 / var_488_17)

				if var_488_19 > 0 and var_488_13 < var_488_19 then
					arg_485_1.talkMaxDuration = var_488_19

					if var_488_19 + var_488_12 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_19 + var_488_12
					end
				end

				arg_485_1.text_.text = var_488_16
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)
				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_20 = math.max(var_488_13, arg_485_1.talkMaxDuration)

			if var_488_12 <= arg_485_1.time_ and arg_485_1.time_ < var_488_12 + var_488_20 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_12) / var_488_20

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_12 + var_488_20 and arg_485_1.time_ < var_488_12 + var_488_20 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106118 = function(arg_490_0, arg_490_1)
		arg_490_1.time_ = 0
		arg_490_1.frameCnt_ = 0
		arg_490_1.state_ = "playing"
		arg_490_1.curTalkId_ = 1101106118
		arg_490_1.duration_ = 10.97

		local var_490_0 = {
			zh = 8.5,
			ja = 10.966
		}
		local var_490_1 = manager.audio:GetLocalizationFlag()

		if var_490_0[var_490_1] ~= nil then
			arg_490_1.duration_ = var_490_0[var_490_1]
		end

		SetActive(arg_490_1.tipsGo_, false)

		function arg_490_1.onSingleLineFinish_()
			arg_490_1.onSingleLineUpdate_ = nil
			arg_490_1.onSingleLineFinish_ = nil
			arg_490_1.state_ = "waiting"
		end

		function arg_490_1.playNext_(arg_492_0)
			if arg_492_0 == 1 then
				arg_490_0:Play1101106119(arg_490_1)
			end
		end

		function arg_490_1.onSingleLineUpdate_(arg_493_0)
			local var_493_0 = 2

			if var_493_0 < arg_490_1.time_ and arg_490_1.time_ <= var_493_0 + arg_493_0 then
				local var_493_1 = manager.ui.mainCamera.transform.localPosition
				local var_493_2 = Vector3.New(0, 0, 10) + Vector3.New(var_493_1.x, var_493_1.y, 0)
				local var_493_3 = arg_490_1.bgs_.ST14

				var_493_3.transform.localPosition = var_493_2
				var_493_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_493_4 = var_493_3:GetComponent("SpriteRenderer")

				if var_493_4 and var_493_4.sprite then
					local var_493_5 = (var_493_3.transform.localPosition - var_493_1).z
					local var_493_6 = manager.ui.mainCameraCom_
					local var_493_7 = 2 * var_493_5 * Mathf.Tan(var_493_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_493_8 = var_493_7 * var_493_6.aspect
					local var_493_9 = var_493_4.sprite.bounds.size.x
					local var_493_10 = var_493_4.sprite.bounds.size.y
					local var_493_11 = var_493_8 / var_493_9
					local var_493_12 = var_493_7 / var_493_10
					local var_493_13 = var_493_12 < var_493_11 and var_493_11 or var_493_12

					var_493_3.transform.localScale = Vector3.New(var_493_13, var_493_13, 0)
				end

				for iter_493_0, iter_493_1 in pairs(arg_490_1.bgs_) do
					if iter_493_0 ~= "ST14" then
						iter_493_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_493_14 = 0

			if var_493_14 < arg_490_1.time_ and arg_490_1.time_ <= var_493_14 + arg_493_0 then
				arg_490_1.mask_.enabled = true
				arg_490_1.mask_.raycastTarget = true

				arg_490_1:SetGaussion(false)
			end

			local var_493_15 = 2

			if var_493_14 <= arg_490_1.time_ and arg_490_1.time_ < var_493_14 + var_493_15 then
				local var_493_16 = (arg_490_1.time_ - var_493_14) / var_493_15
				local var_493_17 = Color.New(0, 0, 0)

				var_493_17.a = Mathf.Lerp(0, 1, var_493_16)
				arg_490_1.mask_.color = var_493_17
			end

			if arg_490_1.time_ >= var_493_14 + var_493_15 and arg_490_1.time_ < var_493_14 + var_493_15 + arg_493_0 then
				local var_493_18 = Color.New(0, 0, 0)

				var_493_18.a = 1
				arg_490_1.mask_.color = var_493_18
			end

			local var_493_19 = 2

			if var_493_19 < arg_490_1.time_ and arg_490_1.time_ <= var_493_19 + arg_493_0 then
				arg_490_1.mask_.enabled = true
				arg_490_1.mask_.raycastTarget = true

				arg_490_1:SetGaussion(false)
			end

			local var_493_20 = 2

			if var_493_19 <= arg_490_1.time_ and arg_490_1.time_ < var_493_19 + var_493_20 then
				local var_493_21 = (arg_490_1.time_ - var_493_19) / var_493_20
				local var_493_22 = Color.New(0, 0, 0)

				var_493_22.a = Mathf.Lerp(1, 0, var_493_21)
				arg_490_1.mask_.color = var_493_22
			end

			if arg_490_1.time_ >= var_493_19 + var_493_20 and arg_490_1.time_ < var_493_19 + var_493_20 + arg_493_0 then
				local var_493_23 = Color.New(0, 0, 0)
				local var_493_24 = 0

				arg_490_1.mask_.enabled = false
				var_493_23.a = var_493_24
				arg_490_1.mask_.color = var_493_23
			end

			local var_493_25 = arg_490_1.actors_["1011ui_story"].transform
			local var_493_26 = 2

			if var_493_26 < arg_490_1.time_ and arg_490_1.time_ <= var_493_26 + arg_493_0 then
				arg_490_1.var_.moveOldPos1011ui_story = var_493_25.localPosition
			end

			local var_493_27 = 0.001

			if var_493_26 <= arg_490_1.time_ and arg_490_1.time_ < var_493_26 + var_493_27 then
				local var_493_28 = (arg_490_1.time_ - var_493_26) / var_493_27
				local var_493_29 = Vector3.New(0, 100, 0)

				var_493_25.localPosition = Vector3.Lerp(arg_490_1.var_.moveOldPos1011ui_story, var_493_29, var_493_28)

				local var_493_30 = manager.ui.mainCamera.transform.position - var_493_25.position

				var_493_25.forward = Vector3.New(var_493_30.x, var_493_30.y, var_493_30.z)

				local var_493_31 = var_493_25.localEulerAngles

				var_493_31.z = 0
				var_493_31.x = 0
				var_493_25.localEulerAngles = var_493_31
			end

			if arg_490_1.time_ >= var_493_26 + var_493_27 and arg_490_1.time_ < var_493_26 + var_493_27 + arg_493_0 then
				var_493_25.localPosition = Vector3.New(0, 100, 0)

				local var_493_32 = manager.ui.mainCamera.transform.position - var_493_25.position

				var_493_25.forward = Vector3.New(var_493_32.x, var_493_32.y, var_493_32.z)

				local var_493_33 = var_493_25.localEulerAngles

				var_493_33.z = 0
				var_493_33.x = 0
				var_493_25.localEulerAngles = var_493_33
			end

			local var_493_34 = 2

			arg_490_1.isInRecall_ = false

			if var_493_34 < arg_490_1.time_ and arg_490_1.time_ <= var_493_34 + arg_493_0 then
				arg_490_1.screenFilterGo_:SetActive(true)

				arg_490_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")

				for iter_493_2, iter_493_3 in pairs(arg_490_1.actors_) do
					local var_493_35 = iter_493_3:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_493_4, iter_493_5 in ipairs(var_493_35) do
						if iter_493_5.color.r > 0.51 then
							iter_493_5.color = Color.New(1, 1, 1)
						else
							iter_493_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_493_36 = 0.0166666666666667

			if var_493_34 <= arg_490_1.time_ and arg_490_1.time_ < var_493_34 + var_493_36 then
				local var_493_37 = (arg_490_1.time_ - var_493_34) / var_493_36

				arg_490_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_493_37)
			end

			if arg_490_1.time_ >= var_493_34 + var_493_36 and arg_490_1.time_ < var_493_34 + var_493_36 + arg_493_0 then
				arg_490_1.screenFilterEffect_.weight = 1
			end

			local var_493_38 = arg_490_1.actors_["1011ui_story"].transform
			local var_493_39 = 4

			if var_493_39 < arg_490_1.time_ and arg_490_1.time_ <= var_493_39 + arg_493_0 then
				arg_490_1.var_.moveOldPos1011ui_story = var_493_38.localPosition
			end

			local var_493_40 = 0.001

			if var_493_39 <= arg_490_1.time_ and arg_490_1.time_ < var_493_39 + var_493_40 then
				local var_493_41 = (arg_490_1.time_ - var_493_39) / var_493_40
				local var_493_42 = Vector3.New(0, -0.71, -6)

				var_493_38.localPosition = Vector3.Lerp(arg_490_1.var_.moveOldPos1011ui_story, var_493_42, var_493_41)

				local var_493_43 = manager.ui.mainCamera.transform.position - var_493_38.position

				var_493_38.forward = Vector3.New(var_493_43.x, var_493_43.y, var_493_43.z)

				local var_493_44 = var_493_38.localEulerAngles

				var_493_44.z = 0
				var_493_44.x = 0
				var_493_38.localEulerAngles = var_493_44
			end

			if arg_490_1.time_ >= var_493_39 + var_493_40 and arg_490_1.time_ < var_493_39 + var_493_40 + arg_493_0 then
				var_493_38.localPosition = Vector3.New(0, -0.71, -6)

				local var_493_45 = manager.ui.mainCamera.transform.position - var_493_38.position

				var_493_38.forward = Vector3.New(var_493_45.x, var_493_45.y, var_493_45.z)

				local var_493_46 = var_493_38.localEulerAngles

				var_493_46.z = 0
				var_493_46.x = 0
				var_493_38.localEulerAngles = var_493_46
			end

			local var_493_47 = 4

			if var_493_47 < arg_490_1.time_ and arg_490_1.time_ <= var_493_47 + arg_493_0 then
				arg_490_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action484")
			end

			local var_493_48 = 4

			if var_493_48 < arg_490_1.time_ and arg_490_1.time_ <= var_493_48 + arg_493_0 then
				arg_490_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_493_49 = arg_490_1.actors_["1011ui_story"]
			local var_493_50 = 4

			if var_493_50 < arg_490_1.time_ and arg_490_1.time_ <= var_493_50 + arg_493_0 and not isNil(var_493_49) and arg_490_1.var_.characterEffect1011ui_story == nil then
				arg_490_1.var_.characterEffect1011ui_story = var_493_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_493_51 = 0.2

			if var_493_50 <= arg_490_1.time_ and arg_490_1.time_ < var_493_50 + var_493_51 and not isNil(var_493_49) then
				local var_493_52 = (arg_490_1.time_ - var_493_50) / var_493_51

				if arg_490_1.var_.characterEffect1011ui_story and not isNil(var_493_49) then
					arg_490_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_490_1.time_ >= var_493_50 + var_493_51 and arg_490_1.time_ < var_493_50 + var_493_51 + arg_493_0 and not isNil(var_493_49) and arg_490_1.var_.characterEffect1011ui_story then
				arg_490_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			if arg_490_1.frameCnt_ <= 1 then
				arg_490_1.dialog_:SetActive(false)
			end

			local var_493_53 = 4
			local var_493_54 = 0.275

			if var_493_53 < arg_490_1.time_ and arg_490_1.time_ <= var_493_53 + arg_493_0 then
				arg_490_1.talkMaxDuration = 0

				arg_490_1.dialog_:SetActive(true)

				local var_493_55 = LeanTween.value(arg_490_1.dialog_, 0, 1, 0.3)

				var_493_55:setOnUpdate(LuaHelper.FloatAction(function(arg_494_0)
					arg_490_1.dialogCg_.alpha = arg_494_0
				end))
				var_493_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_490_1.dialog_)
					var_493_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_490_1.duration_ = arg_490_1.duration_ + 0.3

				SetActive(arg_490_1.leftNameGo_, true)

				local var_493_56 = arg_490_1:FormatText(StoryNameCfg[37].name)

				arg_490_1.leftNameTxt_.text = var_493_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_490_1.leftNameTxt_.transform)

				arg_490_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_490_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_490_1:RecordName(arg_490_1.leftNameTxt_.text)
				SetActive(arg_490_1.iconTrs_.gameObject, false)
				arg_490_1.callingController_:SetSelectedState("normal")

				local var_493_57 = arg_490_1:GetWordFromCfg(1101106118)
				local var_493_58 = arg_490_1:FormatText(var_493_57.content)

				arg_490_1.text_.text = var_493_58

				LuaForUtil.ClearLinePrefixSymbol(arg_490_1.text_)

				local var_493_59 = 11
				local var_493_60 = utf8.len(var_493_58)
				local var_493_61 = var_493_59 <= 0 and var_493_54 or var_493_54 * (var_493_60 / var_493_59)

				if var_493_61 > 0 and var_493_54 < var_493_61 then
					arg_490_1.talkMaxDuration = var_493_61
					var_493_53 = var_493_53 + 0.3

					if var_493_61 + var_493_53 > arg_490_1.duration_ then
						arg_490_1.duration_ = var_493_61 + var_493_53
					end
				end

				arg_490_1.text_.text = var_493_58
				arg_490_1.typewritter.percent = 0

				arg_490_1.typewritter:SetDirty()
				arg_490_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb") ~= 0 then
					local var_493_62 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb") / 1000

					if var_493_62 + var_493_53 > arg_490_1.duration_ then
						arg_490_1.duration_ = var_493_62 + var_493_53
					end

					if var_493_57.prefab_name ~= "" and arg_490_1.actors_[var_493_57.prefab_name] ~= nil then
						local var_493_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_490_1.actors_[var_493_57.prefab_name].transform, "story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")

						arg_490_1:RecordAudio("1101106118", var_493_63)
						arg_490_1:RecordAudio("1101106118", var_493_63)
					else
						arg_490_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")
					end

					arg_490_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")
				end

				arg_490_1:RecordContent(arg_490_1.text_.text)
			end

			local var_493_64 = var_493_53 + 0.3
			local var_493_65 = math.max(var_493_54, arg_490_1.talkMaxDuration)

			if var_493_64 <= arg_490_1.time_ and arg_490_1.time_ < var_493_64 + var_493_65 then
				arg_490_1.typewritter.percent = (arg_490_1.time_ - var_493_64) / var_493_65

				arg_490_1.typewritter:SetDirty()
			end

			if arg_490_1.time_ >= var_493_64 + var_493_65 and arg_490_1.time_ < var_493_64 + var_493_65 + arg_493_0 then
				arg_490_1.typewritter.percent = 1

				arg_490_1.typewritter:SetDirty()
				arg_490_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106119 = function(arg_496_0, arg_496_1)
		arg_496_1.time_ = 0
		arg_496_1.frameCnt_ = 0
		arg_496_1.state_ = "playing"
		arg_496_1.curTalkId_ = 1101106119
		arg_496_1.duration_ = 9

		SetActive(arg_496_1.tipsGo_, false)

		function arg_496_1.onSingleLineFinish_()
			arg_496_1.onSingleLineUpdate_ = nil
			arg_496_1.onSingleLineFinish_ = nil
			arg_496_1.state_ = "waiting"
		end

		function arg_496_1.playNext_(arg_498_0)
			if arg_498_0 == 1 then
				arg_496_0:Play1101106120(arg_496_1)
			end
		end

		function arg_496_1.onSingleLineUpdate_(arg_499_0)
			local var_499_0 = 2
			local var_499_1 = 0.3

			if var_499_0 < arg_496_1.time_ and arg_496_1.time_ <= var_499_0 + arg_499_0 then
				local var_499_2 = "play"
				local var_499_3 = "music"

				arg_496_1:AudioAction(var_499_2, var_499_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_499_4 = ""
				local var_499_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_499_5 ~= "" then
					if arg_496_1.bgmTxt_.text ~= var_499_5 and arg_496_1.bgmTxt_.text ~= "" then
						if arg_496_1.bgmTxt2_.text ~= "" then
							arg_496_1.bgmTxt_.text = arg_496_1.bgmTxt2_.text
						end

						arg_496_1.bgmTxt2_.text = var_499_5

						arg_496_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_496_1.bgmTxt_.text = var_499_5
					end

					if arg_496_1.bgmTimer then
						arg_496_1.bgmTimer:Stop()

						arg_496_1.bgmTimer = nil
					end

					if arg_496_1.settingData.show_music_name == 1 then
						arg_496_1.musicController:SetSelectedState("show")
						arg_496_1.musicAnimator_:Play("open", 0, 0)

						if arg_496_1.settingData.music_time ~= 0 then
							arg_496_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_496_1.settingData.music_time), function()
								if arg_496_1 == nil or isNil(arg_496_1.bgmTxt_) then
									return
								end

								arg_496_1.musicController:SetSelectedState("hide")
								arg_496_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_499_6 = 2.53333333333333
			local var_499_7 = 1

			if var_499_6 < arg_496_1.time_ and arg_496_1.time_ <= var_499_6 + arg_499_0 then
				local var_499_8 = "play"
				local var_499_9 = "music"

				arg_496_1:AudioAction(var_499_8, var_499_9, "bgm_side_daily07", "bgm_side_daily07", "bgm_side_daily07.awb")

				local var_499_10 = ""
				local var_499_11 = manager.audio:GetAudioName("bgm_side_daily07", "bgm_side_daily07")

				if var_499_11 ~= "" then
					if arg_496_1.bgmTxt_.text ~= var_499_11 and arg_496_1.bgmTxt_.text ~= "" then
						if arg_496_1.bgmTxt2_.text ~= "" then
							arg_496_1.bgmTxt_.text = arg_496_1.bgmTxt2_.text
						end

						arg_496_1.bgmTxt2_.text = var_499_11

						arg_496_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_496_1.bgmTxt_.text = var_499_11
					end

					if arg_496_1.bgmTimer then
						arg_496_1.bgmTimer:Stop()

						arg_496_1.bgmTimer = nil
					end

					if arg_496_1.settingData.show_music_name == 1 then
						arg_496_1.musicController:SetSelectedState("show")
						arg_496_1.musicAnimator_:Play("open", 0, 0)

						if arg_496_1.settingData.music_time ~= 0 then
							arg_496_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_496_1.settingData.music_time), function()
								if arg_496_1 == nil or isNil(arg_496_1.bgmTxt_) then
									return
								end

								arg_496_1.musicController:SetSelectedState("hide")
								arg_496_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_499_12 = 2

			arg_496_1.isInRecall_ = false

			if var_499_12 < arg_496_1.time_ and arg_496_1.time_ <= var_499_12 + arg_499_0 then
				arg_496_1.screenFilterGo_:SetActive(false)

				for iter_499_0, iter_499_1 in pairs(arg_496_1.actors_) do
					local var_499_13 = iter_499_1:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_499_2, iter_499_3 in ipairs(var_499_13) do
						if iter_499_3.color.r > 0.51 then
							iter_499_3.color = Color.New(1, 1, 1)
						else
							iter_499_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_499_14 = 0.0166666666666667

			if var_499_12 <= arg_496_1.time_ and arg_496_1.time_ < var_499_12 + var_499_14 then
				local var_499_15 = (arg_496_1.time_ - var_499_12) / var_499_14

				arg_496_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_499_15)
			end

			if arg_496_1.time_ >= var_499_12 + var_499_14 and arg_496_1.time_ < var_499_12 + var_499_14 + arg_499_0 then
				arg_496_1.screenFilterEffect_.weight = 0
			end

			local var_499_16 = 2

			if var_499_16 < arg_496_1.time_ and arg_496_1.time_ <= var_499_16 + arg_499_0 then
				local var_499_17 = manager.ui.mainCamera.transform.localPosition
				local var_499_18 = Vector3.New(0, 0, 10) + Vector3.New(var_499_17.x, var_499_17.y, 0)
				local var_499_19 = arg_496_1.bgs_.I06

				var_499_19.transform.localPosition = var_499_18
				var_499_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_499_20 = var_499_19:GetComponent("SpriteRenderer")

				if var_499_20 and var_499_20.sprite then
					local var_499_21 = (var_499_19.transform.localPosition - var_499_17).z
					local var_499_22 = manager.ui.mainCameraCom_
					local var_499_23 = 2 * var_499_21 * Mathf.Tan(var_499_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_499_24 = var_499_23 * var_499_22.aspect
					local var_499_25 = var_499_20.sprite.bounds.size.x
					local var_499_26 = var_499_20.sprite.bounds.size.y
					local var_499_27 = var_499_24 / var_499_25
					local var_499_28 = var_499_23 / var_499_26
					local var_499_29 = var_499_28 < var_499_27 and var_499_27 or var_499_28

					var_499_19.transform.localScale = Vector3.New(var_499_29, var_499_29, 0)
				end

				for iter_499_4, iter_499_5 in pairs(arg_496_1.bgs_) do
					if iter_499_4 ~= "I06" then
						iter_499_5.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_499_30 = 0

			if var_499_30 < arg_496_1.time_ and arg_496_1.time_ <= var_499_30 + arg_499_0 then
				arg_496_1.mask_.enabled = true
				arg_496_1.mask_.raycastTarget = true

				arg_496_1:SetGaussion(false)
			end

			local var_499_31 = 2

			if var_499_30 <= arg_496_1.time_ and arg_496_1.time_ < var_499_30 + var_499_31 then
				local var_499_32 = (arg_496_1.time_ - var_499_30) / var_499_31
				local var_499_33 = Color.New(0, 0, 0)

				var_499_33.a = Mathf.Lerp(0, 1, var_499_32)
				arg_496_1.mask_.color = var_499_33
			end

			if arg_496_1.time_ >= var_499_30 + var_499_31 and arg_496_1.time_ < var_499_30 + var_499_31 + arg_499_0 then
				local var_499_34 = Color.New(0, 0, 0)

				var_499_34.a = 1
				arg_496_1.mask_.color = var_499_34
			end

			local var_499_35 = 2

			if var_499_35 < arg_496_1.time_ and arg_496_1.time_ <= var_499_35 + arg_499_0 then
				arg_496_1.mask_.enabled = true
				arg_496_1.mask_.raycastTarget = true

				arg_496_1:SetGaussion(false)
			end

			local var_499_36 = 2

			if var_499_35 <= arg_496_1.time_ and arg_496_1.time_ < var_499_35 + var_499_36 then
				local var_499_37 = (arg_496_1.time_ - var_499_35) / var_499_36
				local var_499_38 = Color.New(0, 0, 0)

				var_499_38.a = Mathf.Lerp(1, 0, var_499_37)
				arg_496_1.mask_.color = var_499_38
			end

			if arg_496_1.time_ >= var_499_35 + var_499_36 and arg_496_1.time_ < var_499_35 + var_499_36 + arg_499_0 then
				local var_499_39 = Color.New(0, 0, 0)
				local var_499_40 = 0

				arg_496_1.mask_.enabled = false
				var_499_39.a = var_499_40
				arg_496_1.mask_.color = var_499_39
			end

			local var_499_41 = arg_496_1.actors_["1011ui_story"].transform
			local var_499_42 = 4

			if var_499_42 < arg_496_1.time_ and arg_496_1.time_ <= var_499_42 + arg_499_0 then
				arg_496_1.var_.moveOldPos1011ui_story = var_499_41.localPosition
			end

			local var_499_43 = 0.001

			if var_499_42 <= arg_496_1.time_ and arg_496_1.time_ < var_499_42 + var_499_43 then
				local var_499_44 = (arg_496_1.time_ - var_499_42) / var_499_43
				local var_499_45 = Vector3.New(0, -0.71, -6)

				var_499_41.localPosition = Vector3.Lerp(arg_496_1.var_.moveOldPos1011ui_story, var_499_45, var_499_44)

				local var_499_46 = manager.ui.mainCamera.transform.position - var_499_41.position

				var_499_41.forward = Vector3.New(var_499_46.x, var_499_46.y, var_499_46.z)

				local var_499_47 = var_499_41.localEulerAngles

				var_499_47.z = 0
				var_499_47.x = 0
				var_499_41.localEulerAngles = var_499_47
			end

			if arg_496_1.time_ >= var_499_42 + var_499_43 and arg_496_1.time_ < var_499_42 + var_499_43 + arg_499_0 then
				var_499_41.localPosition = Vector3.New(0, -0.71, -6)

				local var_499_48 = manager.ui.mainCamera.transform.position - var_499_41.position

				var_499_41.forward = Vector3.New(var_499_48.x, var_499_48.y, var_499_48.z)

				local var_499_49 = var_499_41.localEulerAngles

				var_499_49.z = 0
				var_499_49.x = 0
				var_499_41.localEulerAngles = var_499_49
			end

			local var_499_50 = arg_496_1.actors_["1011ui_story"]
			local var_499_51 = 4

			if var_499_51 < arg_496_1.time_ and arg_496_1.time_ <= var_499_51 + arg_499_0 and not isNil(var_499_50) and arg_496_1.var_.characterEffect1011ui_story == nil then
				arg_496_1.var_.characterEffect1011ui_story = var_499_50:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_499_52 = 0.200000002980232

			if var_499_51 <= arg_496_1.time_ and arg_496_1.time_ < var_499_51 + var_499_52 and not isNil(var_499_50) then
				local var_499_53 = (arg_496_1.time_ - var_499_51) / var_499_52

				if arg_496_1.var_.characterEffect1011ui_story and not isNil(var_499_50) then
					arg_496_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_496_1.time_ >= var_499_51 + var_499_52 and arg_496_1.time_ < var_499_51 + var_499_52 + arg_499_0 and not isNil(var_499_50) and arg_496_1.var_.characterEffect1011ui_story then
				arg_496_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_499_54 = 4

			if var_499_54 < arg_496_1.time_ and arg_496_1.time_ <= var_499_54 + arg_499_0 then
				arg_496_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_499_55 = 4

			if var_499_55 < arg_496_1.time_ and arg_496_1.time_ <= var_499_55 + arg_499_0 then
				arg_496_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_499_56 = arg_496_1.actors_["1011ui_story"].transform
			local var_499_57 = 2

			if var_499_57 < arg_496_1.time_ and arg_496_1.time_ <= var_499_57 + arg_499_0 then
				arg_496_1.var_.moveOldPos1011ui_story = var_499_56.localPosition
			end

			local var_499_58 = 0.001

			if var_499_57 <= arg_496_1.time_ and arg_496_1.time_ < var_499_57 + var_499_58 then
				local var_499_59 = (arg_496_1.time_ - var_499_57) / var_499_58
				local var_499_60 = Vector3.New(0, 100, 0)

				var_499_56.localPosition = Vector3.Lerp(arg_496_1.var_.moveOldPos1011ui_story, var_499_60, var_499_59)

				local var_499_61 = manager.ui.mainCamera.transform.position - var_499_56.position

				var_499_56.forward = Vector3.New(var_499_61.x, var_499_61.y, var_499_61.z)

				local var_499_62 = var_499_56.localEulerAngles

				var_499_62.z = 0
				var_499_62.x = 0
				var_499_56.localEulerAngles = var_499_62
			end

			if arg_496_1.time_ >= var_499_57 + var_499_58 and arg_496_1.time_ < var_499_57 + var_499_58 + arg_499_0 then
				var_499_56.localPosition = Vector3.New(0, 100, 0)

				local var_499_63 = manager.ui.mainCamera.transform.position - var_499_56.position

				var_499_56.forward = Vector3.New(var_499_63.x, var_499_63.y, var_499_63.z)

				local var_499_64 = var_499_56.localEulerAngles

				var_499_64.z = 0
				var_499_64.x = 0
				var_499_56.localEulerAngles = var_499_64
			end

			if arg_496_1.frameCnt_ <= 1 then
				arg_496_1.dialog_:SetActive(false)
			end

			local var_499_65 = 4
			local var_499_66 = 0.525

			if var_499_65 < arg_496_1.time_ and arg_496_1.time_ <= var_499_65 + arg_499_0 then
				arg_496_1.talkMaxDuration = 0

				arg_496_1.dialog_:SetActive(true)

				local var_499_67 = LeanTween.value(arg_496_1.dialog_, 0, 1, 0.3)

				var_499_67:setOnUpdate(LuaHelper.FloatAction(function(arg_502_0)
					arg_496_1.dialogCg_.alpha = arg_502_0
				end))
				var_499_67:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_496_1.dialog_)
					var_499_67:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_496_1.duration_ = arg_496_1.duration_ + 0.3

				SetActive(arg_496_1.leftNameGo_, true)

				local var_499_68 = arg_496_1:FormatText(StoryNameCfg[7].name)

				arg_496_1.leftNameTxt_.text = var_499_68

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_496_1.leftNameTxt_.transform)

				arg_496_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_496_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_496_1:RecordName(arg_496_1.leftNameTxt_.text)
				SetActive(arg_496_1.iconTrs_.gameObject, false)
				arg_496_1.callingController_:SetSelectedState("normal")

				local var_499_69 = arg_496_1:GetWordFromCfg(1101106119)
				local var_499_70 = arg_496_1:FormatText(var_499_69.content)

				arg_496_1.text_.text = var_499_70

				LuaForUtil.ClearLinePrefixSymbol(arg_496_1.text_)

				local var_499_71 = 21
				local var_499_72 = utf8.len(var_499_70)
				local var_499_73 = var_499_71 <= 0 and var_499_66 or var_499_66 * (var_499_72 / var_499_71)

				if var_499_73 > 0 and var_499_66 < var_499_73 then
					arg_496_1.talkMaxDuration = var_499_73
					var_499_65 = var_499_65 + 0.3

					if var_499_73 + var_499_65 > arg_496_1.duration_ then
						arg_496_1.duration_ = var_499_73 + var_499_65
					end
				end

				arg_496_1.text_.text = var_499_70
				arg_496_1.typewritter.percent = 0

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(false)
				arg_496_1:RecordContent(arg_496_1.text_.text)
			end

			local var_499_74 = var_499_65 + 0.3
			local var_499_75 = math.max(var_499_66, arg_496_1.talkMaxDuration)

			if var_499_74 <= arg_496_1.time_ and arg_496_1.time_ < var_499_74 + var_499_75 then
				arg_496_1.typewritter.percent = (arg_496_1.time_ - var_499_74) / var_499_75

				arg_496_1.typewritter:SetDirty()
			end

			if arg_496_1.time_ >= var_499_74 + var_499_75 and arg_496_1.time_ < var_499_74 + var_499_75 + arg_499_0 then
				arg_496_1.typewritter.percent = 1

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106120 = function(arg_504_0, arg_504_1)
		arg_504_1.time_ = 0
		arg_504_1.frameCnt_ = 0
		arg_504_1.state_ = "playing"
		arg_504_1.curTalkId_ = 1101106120
		arg_504_1.duration_ = 3.83

		local var_504_0 = {
			zh = 3.833,
			ja = 3.3
		}
		local var_504_1 = manager.audio:GetLocalizationFlag()

		if var_504_0[var_504_1] ~= nil then
			arg_504_1.duration_ = var_504_0[var_504_1]
		end

		SetActive(arg_504_1.tipsGo_, false)

		function arg_504_1.onSingleLineFinish_()
			arg_504_1.onSingleLineUpdate_ = nil
			arg_504_1.onSingleLineFinish_ = nil
			arg_504_1.state_ = "waiting"
		end

		function arg_504_1.playNext_(arg_506_0)
			if arg_506_0 == 1 then
				arg_504_0:Play1101106121(arg_504_1)
			end
		end

		function arg_504_1.onSingleLineUpdate_(arg_507_0)
			local var_507_0 = arg_504_1.actors_["1011ui_story"].transform
			local var_507_1 = 0

			if var_507_1 < arg_504_1.time_ and arg_504_1.time_ <= var_507_1 + arg_507_0 then
				arg_504_1.var_.moveOldPos1011ui_story = var_507_0.localPosition
			end

			local var_507_2 = 0.001

			if var_507_1 <= arg_504_1.time_ and arg_504_1.time_ < var_507_1 + var_507_2 then
				local var_507_3 = (arg_504_1.time_ - var_507_1) / var_507_2
				local var_507_4 = Vector3.New(0, -0.71, -6)

				var_507_0.localPosition = Vector3.Lerp(arg_504_1.var_.moveOldPos1011ui_story, var_507_4, var_507_3)

				local var_507_5 = manager.ui.mainCamera.transform.position - var_507_0.position

				var_507_0.forward = Vector3.New(var_507_5.x, var_507_5.y, var_507_5.z)

				local var_507_6 = var_507_0.localEulerAngles

				var_507_6.z = 0
				var_507_6.x = 0
				var_507_0.localEulerAngles = var_507_6
			end

			if arg_504_1.time_ >= var_507_1 + var_507_2 and arg_504_1.time_ < var_507_1 + var_507_2 + arg_507_0 then
				var_507_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_507_7 = manager.ui.mainCamera.transform.position - var_507_0.position

				var_507_0.forward = Vector3.New(var_507_7.x, var_507_7.y, var_507_7.z)

				local var_507_8 = var_507_0.localEulerAngles

				var_507_8.z = 0
				var_507_8.x = 0
				var_507_0.localEulerAngles = var_507_8
			end

			local var_507_9 = arg_504_1.actors_["1011ui_story"]
			local var_507_10 = 0

			if var_507_10 < arg_504_1.time_ and arg_504_1.time_ <= var_507_10 + arg_507_0 and not isNil(var_507_9) and arg_504_1.var_.characterEffect1011ui_story == nil then
				arg_504_1.var_.characterEffect1011ui_story = var_507_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_507_11 = 0.200000002980232

			if var_507_10 <= arg_504_1.time_ and arg_504_1.time_ < var_507_10 + var_507_11 and not isNil(var_507_9) then
				local var_507_12 = (arg_504_1.time_ - var_507_10) / var_507_11

				if arg_504_1.var_.characterEffect1011ui_story and not isNil(var_507_9) then
					arg_504_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_504_1.time_ >= var_507_10 + var_507_11 and arg_504_1.time_ < var_507_10 + var_507_11 + arg_507_0 and not isNil(var_507_9) and arg_504_1.var_.characterEffect1011ui_story then
				arg_504_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_507_13 = 0

			if var_507_13 < arg_504_1.time_ and arg_504_1.time_ <= var_507_13 + arg_507_0 then
				arg_504_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_507_14 = 0

			if var_507_14 < arg_504_1.time_ and arg_504_1.time_ <= var_507_14 + arg_507_0 then
				arg_504_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_507_15 = 0
			local var_507_16 = 0.2

			if var_507_15 < arg_504_1.time_ and arg_504_1.time_ <= var_507_15 + arg_507_0 then
				arg_504_1.talkMaxDuration = 0
				arg_504_1.dialogCg_.alpha = 1

				arg_504_1.dialog_:SetActive(true)
				SetActive(arg_504_1.leftNameGo_, true)

				local var_507_17 = arg_504_1:FormatText(StoryNameCfg[37].name)

				arg_504_1.leftNameTxt_.text = var_507_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_504_1.leftNameTxt_.transform)

				arg_504_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_504_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_504_1:RecordName(arg_504_1.leftNameTxt_.text)
				SetActive(arg_504_1.iconTrs_.gameObject, false)
				arg_504_1.callingController_:SetSelectedState("normal")

				local var_507_18 = arg_504_1:GetWordFromCfg(1101106120)
				local var_507_19 = arg_504_1:FormatText(var_507_18.content)

				arg_504_1.text_.text = var_507_19

				LuaForUtil.ClearLinePrefixSymbol(arg_504_1.text_)

				local var_507_20 = 8
				local var_507_21 = utf8.len(var_507_19)
				local var_507_22 = var_507_20 <= 0 and var_507_16 or var_507_16 * (var_507_21 / var_507_20)

				if var_507_22 > 0 and var_507_16 < var_507_22 then
					arg_504_1.talkMaxDuration = var_507_22

					if var_507_22 + var_507_15 > arg_504_1.duration_ then
						arg_504_1.duration_ = var_507_22 + var_507_15
					end
				end

				arg_504_1.text_.text = var_507_19
				arg_504_1.typewritter.percent = 0

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb") ~= 0 then
					local var_507_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb") / 1000

					if var_507_23 + var_507_15 > arg_504_1.duration_ then
						arg_504_1.duration_ = var_507_23 + var_507_15
					end

					if var_507_18.prefab_name ~= "" and arg_504_1.actors_[var_507_18.prefab_name] ~= nil then
						local var_507_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_504_1.actors_[var_507_18.prefab_name].transform, "story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")

						arg_504_1:RecordAudio("1101106120", var_507_24)
						arg_504_1:RecordAudio("1101106120", var_507_24)
					else
						arg_504_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")
					end

					arg_504_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")
				end

				arg_504_1:RecordContent(arg_504_1.text_.text)
			end

			local var_507_25 = math.max(var_507_16, arg_504_1.talkMaxDuration)

			if var_507_15 <= arg_504_1.time_ and arg_504_1.time_ < var_507_15 + var_507_25 then
				arg_504_1.typewritter.percent = (arg_504_1.time_ - var_507_15) / var_507_25

				arg_504_1.typewritter:SetDirty()
			end

			if arg_504_1.time_ >= var_507_15 + var_507_25 and arg_504_1.time_ < var_507_15 + var_507_25 + arg_507_0 then
				arg_504_1.typewritter.percent = 1

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106121 = function(arg_508_0, arg_508_1)
		arg_508_1.time_ = 0
		arg_508_1.frameCnt_ = 0
		arg_508_1.state_ = "playing"
		arg_508_1.curTalkId_ = 1101106121
		arg_508_1.duration_ = 3.7

		local var_508_0 = {
			zh = 3.7,
			ja = 2.3
		}
		local var_508_1 = manager.audio:GetLocalizationFlag()

		if var_508_0[var_508_1] ~= nil then
			arg_508_1.duration_ = var_508_0[var_508_1]
		end

		SetActive(arg_508_1.tipsGo_, false)

		function arg_508_1.onSingleLineFinish_()
			arg_508_1.onSingleLineUpdate_ = nil
			arg_508_1.onSingleLineFinish_ = nil
			arg_508_1.state_ = "waiting"
		end

		function arg_508_1.playNext_(arg_510_0)
			if arg_510_0 == 1 then
				arg_508_0:Play1101106122(arg_508_1)
			end
		end

		function arg_508_1.onSingleLineUpdate_(arg_511_0)
			local var_511_0 = arg_508_1.actors_["1011ui_story"].transform
			local var_511_1 = 0

			if var_511_1 < arg_508_1.time_ and arg_508_1.time_ <= var_511_1 + arg_511_0 then
				arg_508_1.var_.moveOldPos1011ui_story = var_511_0.localPosition
			end

			local var_511_2 = 0.001

			if var_511_1 <= arg_508_1.time_ and arg_508_1.time_ < var_511_1 + var_511_2 then
				local var_511_3 = (arg_508_1.time_ - var_511_1) / var_511_2
				local var_511_4 = Vector3.New(0, -0.71, -6)

				var_511_0.localPosition = Vector3.Lerp(arg_508_1.var_.moveOldPos1011ui_story, var_511_4, var_511_3)

				local var_511_5 = manager.ui.mainCamera.transform.position - var_511_0.position

				var_511_0.forward = Vector3.New(var_511_5.x, var_511_5.y, var_511_5.z)

				local var_511_6 = var_511_0.localEulerAngles

				var_511_6.z = 0
				var_511_6.x = 0
				var_511_0.localEulerAngles = var_511_6
			end

			if arg_508_1.time_ >= var_511_1 + var_511_2 and arg_508_1.time_ < var_511_1 + var_511_2 + arg_511_0 then
				var_511_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_511_7 = manager.ui.mainCamera.transform.position - var_511_0.position

				var_511_0.forward = Vector3.New(var_511_7.x, var_511_7.y, var_511_7.z)

				local var_511_8 = var_511_0.localEulerAngles

				var_511_8.z = 0
				var_511_8.x = 0
				var_511_0.localEulerAngles = var_511_8
			end

			local var_511_9 = arg_508_1.actors_["1011ui_story"]
			local var_511_10 = 0

			if var_511_10 < arg_508_1.time_ and arg_508_1.time_ <= var_511_10 + arg_511_0 and not isNil(var_511_9) and arg_508_1.var_.characterEffect1011ui_story == nil then
				arg_508_1.var_.characterEffect1011ui_story = var_511_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_511_11 = 0.200000002980232

			if var_511_10 <= arg_508_1.time_ and arg_508_1.time_ < var_511_10 + var_511_11 and not isNil(var_511_9) then
				local var_511_12 = (arg_508_1.time_ - var_511_10) / var_511_11

				if arg_508_1.var_.characterEffect1011ui_story and not isNil(var_511_9) then
					arg_508_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_508_1.time_ >= var_511_10 + var_511_11 and arg_508_1.time_ < var_511_10 + var_511_11 + arg_511_0 and not isNil(var_511_9) and arg_508_1.var_.characterEffect1011ui_story then
				arg_508_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_511_13 = 0

			if var_511_13 < arg_508_1.time_ and arg_508_1.time_ <= var_511_13 + arg_511_0 then
				arg_508_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action435")
			end

			local var_511_14 = 0

			if var_511_14 < arg_508_1.time_ and arg_508_1.time_ <= var_511_14 + arg_511_0 then
				arg_508_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_511_15 = 0
			local var_511_16 = 0.225

			if var_511_15 < arg_508_1.time_ and arg_508_1.time_ <= var_511_15 + arg_511_0 then
				arg_508_1.talkMaxDuration = 0
				arg_508_1.dialogCg_.alpha = 1

				arg_508_1.dialog_:SetActive(true)
				SetActive(arg_508_1.leftNameGo_, true)

				local var_511_17 = arg_508_1:FormatText(StoryNameCfg[37].name)

				arg_508_1.leftNameTxt_.text = var_511_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_508_1.leftNameTxt_.transform)

				arg_508_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_508_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_508_1:RecordName(arg_508_1.leftNameTxt_.text)
				SetActive(arg_508_1.iconTrs_.gameObject, false)
				arg_508_1.callingController_:SetSelectedState("normal")

				local var_511_18 = arg_508_1:GetWordFromCfg(1101106121)
				local var_511_19 = arg_508_1:FormatText(var_511_18.content)

				arg_508_1.text_.text = var_511_19

				LuaForUtil.ClearLinePrefixSymbol(arg_508_1.text_)

				local var_511_20 = 9
				local var_511_21 = utf8.len(var_511_19)
				local var_511_22 = var_511_20 <= 0 and var_511_16 or var_511_16 * (var_511_21 / var_511_20)

				if var_511_22 > 0 and var_511_16 < var_511_22 then
					arg_508_1.talkMaxDuration = var_511_22

					if var_511_22 + var_511_15 > arg_508_1.duration_ then
						arg_508_1.duration_ = var_511_22 + var_511_15
					end
				end

				arg_508_1.text_.text = var_511_19
				arg_508_1.typewritter.percent = 0

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb") ~= 0 then
					local var_511_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb") / 1000

					if var_511_23 + var_511_15 > arg_508_1.duration_ then
						arg_508_1.duration_ = var_511_23 + var_511_15
					end

					if var_511_18.prefab_name ~= "" and arg_508_1.actors_[var_511_18.prefab_name] ~= nil then
						local var_511_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_508_1.actors_[var_511_18.prefab_name].transform, "story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")

						arg_508_1:RecordAudio("1101106121", var_511_24)
						arg_508_1:RecordAudio("1101106121", var_511_24)
					else
						arg_508_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")
					end

					arg_508_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")
				end

				arg_508_1:RecordContent(arg_508_1.text_.text)
			end

			local var_511_25 = math.max(var_511_16, arg_508_1.talkMaxDuration)

			if var_511_15 <= arg_508_1.time_ and arg_508_1.time_ < var_511_15 + var_511_25 then
				arg_508_1.typewritter.percent = (arg_508_1.time_ - var_511_15) / var_511_25

				arg_508_1.typewritter:SetDirty()
			end

			if arg_508_1.time_ >= var_511_15 + var_511_25 and arg_508_1.time_ < var_511_15 + var_511_25 + arg_511_0 then
				arg_508_1.typewritter.percent = 1

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106122 = function(arg_512_0, arg_512_1)
		arg_512_1.time_ = 0
		arg_512_1.frameCnt_ = 0
		arg_512_1.state_ = "playing"
		arg_512_1.curTalkId_ = 1101106122
		arg_512_1.duration_ = 5

		SetActive(arg_512_1.tipsGo_, false)

		function arg_512_1.onSingleLineFinish_()
			arg_512_1.onSingleLineUpdate_ = nil
			arg_512_1.onSingleLineFinish_ = nil
			arg_512_1.state_ = "waiting"
		end

		function arg_512_1.playNext_(arg_514_0)
			if arg_514_0 == 1 then
				arg_512_0:Play1101106123(arg_512_1)
			end
		end

		function arg_512_1.onSingleLineUpdate_(arg_515_0)
			local var_515_0 = arg_512_1.actors_["1011ui_story"]
			local var_515_1 = 0

			if var_515_1 < arg_512_1.time_ and arg_512_1.time_ <= var_515_1 + arg_515_0 and not isNil(var_515_0) and arg_512_1.var_.characterEffect1011ui_story == nil then
				arg_512_1.var_.characterEffect1011ui_story = var_515_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_515_2 = 0.200000002980232

			if var_515_1 <= arg_512_1.time_ and arg_512_1.time_ < var_515_1 + var_515_2 and not isNil(var_515_0) then
				local var_515_3 = (arg_512_1.time_ - var_515_1) / var_515_2

				if arg_512_1.var_.characterEffect1011ui_story and not isNil(var_515_0) then
					local var_515_4 = Mathf.Lerp(0, 0.5, var_515_3)

					arg_512_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_512_1.var_.characterEffect1011ui_story.fillRatio = var_515_4
				end
			end

			if arg_512_1.time_ >= var_515_1 + var_515_2 and arg_512_1.time_ < var_515_1 + var_515_2 + arg_515_0 and not isNil(var_515_0) and arg_512_1.var_.characterEffect1011ui_story then
				local var_515_5 = 0.5

				arg_512_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_512_1.var_.characterEffect1011ui_story.fillRatio = var_515_5
			end

			local var_515_6 = 0
			local var_515_7 = 0.45

			if var_515_6 < arg_512_1.time_ and arg_512_1.time_ <= var_515_6 + arg_515_0 then
				arg_512_1.talkMaxDuration = 0
				arg_512_1.dialogCg_.alpha = 1

				arg_512_1.dialog_:SetActive(true)
				SetActive(arg_512_1.leftNameGo_, true)

				local var_515_8 = arg_512_1:FormatText(StoryNameCfg[7].name)

				arg_512_1.leftNameTxt_.text = var_515_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_512_1.leftNameTxt_.transform)

				arg_512_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_512_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_512_1:RecordName(arg_512_1.leftNameTxt_.text)
				SetActive(arg_512_1.iconTrs_.gameObject, false)
				arg_512_1.callingController_:SetSelectedState("normal")

				local var_515_9 = arg_512_1:GetWordFromCfg(1101106122)
				local var_515_10 = arg_512_1:FormatText(var_515_9.content)

				arg_512_1.text_.text = var_515_10

				LuaForUtil.ClearLinePrefixSymbol(arg_512_1.text_)

				local var_515_11 = 18
				local var_515_12 = utf8.len(var_515_10)
				local var_515_13 = var_515_11 <= 0 and var_515_7 or var_515_7 * (var_515_12 / var_515_11)

				if var_515_13 > 0 and var_515_7 < var_515_13 then
					arg_512_1.talkMaxDuration = var_515_13

					if var_515_13 + var_515_6 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_13 + var_515_6
					end
				end

				arg_512_1.text_.text = var_515_10
				arg_512_1.typewritter.percent = 0

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(false)
				arg_512_1:RecordContent(arg_512_1.text_.text)
			end

			local var_515_14 = math.max(var_515_7, arg_512_1.talkMaxDuration)

			if var_515_6 <= arg_512_1.time_ and arg_512_1.time_ < var_515_6 + var_515_14 then
				arg_512_1.typewritter.percent = (arg_512_1.time_ - var_515_6) / var_515_14

				arg_512_1.typewritter:SetDirty()
			end

			if arg_512_1.time_ >= var_515_6 + var_515_14 and arg_512_1.time_ < var_515_6 + var_515_14 + arg_515_0 then
				arg_512_1.typewritter.percent = 1

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106123 = function(arg_516_0, arg_516_1)
		arg_516_1.time_ = 0
		arg_516_1.frameCnt_ = 0
		arg_516_1.state_ = "playing"
		arg_516_1.curTalkId_ = 1101106123
		arg_516_1.duration_ = 6.13

		local var_516_0 = {
			zh = 6.133,
			ja = 5.1
		}
		local var_516_1 = manager.audio:GetLocalizationFlag()

		if var_516_0[var_516_1] ~= nil then
			arg_516_1.duration_ = var_516_0[var_516_1]
		end

		SetActive(arg_516_1.tipsGo_, false)

		function arg_516_1.onSingleLineFinish_()
			arg_516_1.onSingleLineUpdate_ = nil
			arg_516_1.onSingleLineFinish_ = nil
			arg_516_1.state_ = "waiting"
		end

		function arg_516_1.playNext_(arg_518_0)
			if arg_518_0 == 1 then
				arg_516_0:Play1101106124(arg_516_1)
			end
		end

		function arg_516_1.onSingleLineUpdate_(arg_519_0)
			local var_519_0 = arg_516_1.actors_["1011ui_story"].transform
			local var_519_1 = 0

			if var_519_1 < arg_516_1.time_ and arg_516_1.time_ <= var_519_1 + arg_519_0 then
				arg_516_1.var_.moveOldPos1011ui_story = var_519_0.localPosition
			end

			local var_519_2 = 0.001

			if var_519_1 <= arg_516_1.time_ and arg_516_1.time_ < var_519_1 + var_519_2 then
				local var_519_3 = (arg_516_1.time_ - var_519_1) / var_519_2
				local var_519_4 = Vector3.New(0, -0.71, -6)

				var_519_0.localPosition = Vector3.Lerp(arg_516_1.var_.moveOldPos1011ui_story, var_519_4, var_519_3)

				local var_519_5 = manager.ui.mainCamera.transform.position - var_519_0.position

				var_519_0.forward = Vector3.New(var_519_5.x, var_519_5.y, var_519_5.z)

				local var_519_6 = var_519_0.localEulerAngles

				var_519_6.z = 0
				var_519_6.x = 0
				var_519_0.localEulerAngles = var_519_6
			end

			if arg_516_1.time_ >= var_519_1 + var_519_2 and arg_516_1.time_ < var_519_1 + var_519_2 + arg_519_0 then
				var_519_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_519_7 = manager.ui.mainCamera.transform.position - var_519_0.position

				var_519_0.forward = Vector3.New(var_519_7.x, var_519_7.y, var_519_7.z)

				local var_519_8 = var_519_0.localEulerAngles

				var_519_8.z = 0
				var_519_8.x = 0
				var_519_0.localEulerAngles = var_519_8
			end

			local var_519_9 = arg_516_1.actors_["1011ui_story"]
			local var_519_10 = 0

			if var_519_10 < arg_516_1.time_ and arg_516_1.time_ <= var_519_10 + arg_519_0 and not isNil(var_519_9) and arg_516_1.var_.characterEffect1011ui_story == nil then
				arg_516_1.var_.characterEffect1011ui_story = var_519_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_519_11 = 0.200000002980232

			if var_519_10 <= arg_516_1.time_ and arg_516_1.time_ < var_519_10 + var_519_11 and not isNil(var_519_9) then
				local var_519_12 = (arg_516_1.time_ - var_519_10) / var_519_11

				if arg_516_1.var_.characterEffect1011ui_story and not isNil(var_519_9) then
					arg_516_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_516_1.time_ >= var_519_10 + var_519_11 and arg_516_1.time_ < var_519_10 + var_519_11 + arg_519_0 and not isNil(var_519_9) and arg_516_1.var_.characterEffect1011ui_story then
				arg_516_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_519_13 = 0

			if var_519_13 < arg_516_1.time_ and arg_516_1.time_ <= var_519_13 + arg_519_0 then
				arg_516_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_519_14 = 0
			local var_519_15 = 0.425

			if var_519_14 < arg_516_1.time_ and arg_516_1.time_ <= var_519_14 + arg_519_0 then
				arg_516_1.talkMaxDuration = 0
				arg_516_1.dialogCg_.alpha = 1

				arg_516_1.dialog_:SetActive(true)
				SetActive(arg_516_1.leftNameGo_, true)

				local var_519_16 = arg_516_1:FormatText(StoryNameCfg[37].name)

				arg_516_1.leftNameTxt_.text = var_519_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_516_1.leftNameTxt_.transform)

				arg_516_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_516_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_516_1:RecordName(arg_516_1.leftNameTxt_.text)
				SetActive(arg_516_1.iconTrs_.gameObject, false)
				arg_516_1.callingController_:SetSelectedState("normal")

				local var_519_17 = arg_516_1:GetWordFromCfg(1101106123)
				local var_519_18 = arg_516_1:FormatText(var_519_17.content)

				arg_516_1.text_.text = var_519_18

				LuaForUtil.ClearLinePrefixSymbol(arg_516_1.text_)

				local var_519_19 = 17
				local var_519_20 = utf8.len(var_519_18)
				local var_519_21 = var_519_19 <= 0 and var_519_15 or var_519_15 * (var_519_20 / var_519_19)

				if var_519_21 > 0 and var_519_15 < var_519_21 then
					arg_516_1.talkMaxDuration = var_519_21

					if var_519_21 + var_519_14 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_21 + var_519_14
					end
				end

				arg_516_1.text_.text = var_519_18
				arg_516_1.typewritter.percent = 0

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb") ~= 0 then
					local var_519_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb") / 1000

					if var_519_22 + var_519_14 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_22 + var_519_14
					end

					if var_519_17.prefab_name ~= "" and arg_516_1.actors_[var_519_17.prefab_name] ~= nil then
						local var_519_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_516_1.actors_[var_519_17.prefab_name].transform, "story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")

						arg_516_1:RecordAudio("1101106123", var_519_23)
						arg_516_1:RecordAudio("1101106123", var_519_23)
					else
						arg_516_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")
					end

					arg_516_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")
				end

				arg_516_1:RecordContent(arg_516_1.text_.text)
			end

			local var_519_24 = math.max(var_519_15, arg_516_1.talkMaxDuration)

			if var_519_14 <= arg_516_1.time_ and arg_516_1.time_ < var_519_14 + var_519_24 then
				arg_516_1.typewritter.percent = (arg_516_1.time_ - var_519_14) / var_519_24

				arg_516_1.typewritter:SetDirty()
			end

			if arg_516_1.time_ >= var_519_14 + var_519_24 and arg_516_1.time_ < var_519_14 + var_519_24 + arg_519_0 then
				arg_516_1.typewritter.percent = 1

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106124 = function(arg_520_0, arg_520_1)
		arg_520_1.time_ = 0
		arg_520_1.frameCnt_ = 0
		arg_520_1.state_ = "playing"
		arg_520_1.curTalkId_ = 1101106124
		arg_520_1.duration_ = 5

		SetActive(arg_520_1.tipsGo_, false)

		function arg_520_1.onSingleLineFinish_()
			arg_520_1.onSingleLineUpdate_ = nil
			arg_520_1.onSingleLineFinish_ = nil
			arg_520_1.state_ = "waiting"
		end

		function arg_520_1.playNext_(arg_522_0)
			if arg_522_0 == 1 then
				arg_520_0:Play1101106125(arg_520_1)
			end
		end

		function arg_520_1.onSingleLineUpdate_(arg_523_0)
			local var_523_0 = arg_520_1.actors_["1011ui_story"].transform
			local var_523_1 = 0

			if var_523_1 < arg_520_1.time_ and arg_520_1.time_ <= var_523_1 + arg_523_0 then
				arg_520_1.var_.moveOldPos1011ui_story = var_523_0.localPosition
			end

			local var_523_2 = 0.001

			if var_523_1 <= arg_520_1.time_ and arg_520_1.time_ < var_523_1 + var_523_2 then
				local var_523_3 = (arg_520_1.time_ - var_523_1) / var_523_2
				local var_523_4 = Vector3.New(0, -0.71, -6)

				var_523_0.localPosition = Vector3.Lerp(arg_520_1.var_.moveOldPos1011ui_story, var_523_4, var_523_3)

				local var_523_5 = manager.ui.mainCamera.transform.position - var_523_0.position

				var_523_0.forward = Vector3.New(var_523_5.x, var_523_5.y, var_523_5.z)

				local var_523_6 = var_523_0.localEulerAngles

				var_523_6.z = 0
				var_523_6.x = 0
				var_523_0.localEulerAngles = var_523_6
			end

			if arg_520_1.time_ >= var_523_1 + var_523_2 and arg_520_1.time_ < var_523_1 + var_523_2 + arg_523_0 then
				var_523_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_523_7 = manager.ui.mainCamera.transform.position - var_523_0.position

				var_523_0.forward = Vector3.New(var_523_7.x, var_523_7.y, var_523_7.z)

				local var_523_8 = var_523_0.localEulerAngles

				var_523_8.z = 0
				var_523_8.x = 0
				var_523_0.localEulerAngles = var_523_8
			end

			local var_523_9 = arg_520_1.actors_["1011ui_story"]
			local var_523_10 = 0

			if var_523_10 < arg_520_1.time_ and arg_520_1.time_ <= var_523_10 + arg_523_0 and not isNil(var_523_9) and arg_520_1.var_.characterEffect1011ui_story == nil then
				arg_520_1.var_.characterEffect1011ui_story = var_523_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_523_11 = 0.2

			if var_523_10 <= arg_520_1.time_ and arg_520_1.time_ < var_523_10 + var_523_11 and not isNil(var_523_9) then
				local var_523_12 = (arg_520_1.time_ - var_523_10) / var_523_11

				if arg_520_1.var_.characterEffect1011ui_story and not isNil(var_523_9) then
					local var_523_13 = Mathf.Lerp(0, 0.5, var_523_12)

					arg_520_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_520_1.var_.characterEffect1011ui_story.fillRatio = var_523_13
				end
			end

			if arg_520_1.time_ >= var_523_10 + var_523_11 and arg_520_1.time_ < var_523_10 + var_523_11 + arg_523_0 and not isNil(var_523_9) and arg_520_1.var_.characterEffect1011ui_story then
				local var_523_14 = 0.5

				arg_520_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_520_1.var_.characterEffect1011ui_story.fillRatio = var_523_14
			end

			local var_523_15 = 0
			local var_523_16 = 0.775

			if var_523_15 < arg_520_1.time_ and arg_520_1.time_ <= var_523_15 + arg_523_0 then
				arg_520_1.talkMaxDuration = 0

				arg_520_1.dialog_:SetActive(true)

				local var_523_17 = LeanTween.value(arg_520_1.dialog_, 0, 1, 0.3)

				var_523_17:setOnUpdate(LuaHelper.FloatAction(function(arg_524_0)
					arg_520_1.dialogCg_.alpha = arg_524_0
				end))
				var_523_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_520_1.dialog_)
					var_523_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_520_1.duration_ = arg_520_1.duration_ + 0.3

				SetActive(arg_520_1.leftNameGo_, false)

				arg_520_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_520_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_520_1:RecordName(arg_520_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_520_1.iconTrs_.gameObject, false)
				arg_520_1.callingController_:SetSelectedState("normal")

				local var_523_18 = arg_520_1:GetWordFromCfg(1101106124)
				local var_523_19 = arg_520_1:FormatText(var_523_18.content)

				arg_520_1.text_.text = var_523_19

				LuaForUtil.ClearLinePrefixSymbol(arg_520_1.text_)

				local var_523_20 = 31
				local var_523_21 = utf8.len(var_523_19)
				local var_523_22 = var_523_20 <= 0 and var_523_16 or var_523_16 * (var_523_21 / var_523_20)

				if var_523_22 > 0 and var_523_16 < var_523_22 then
					arg_520_1.talkMaxDuration = var_523_22
					var_523_15 = var_523_15 + 0.3

					if var_523_22 + var_523_15 > arg_520_1.duration_ then
						arg_520_1.duration_ = var_523_22 + var_523_15
					end
				end

				arg_520_1.text_.text = var_523_19
				arg_520_1.typewritter.percent = 0

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(false)
				arg_520_1:RecordContent(arg_520_1.text_.text)
			end

			local var_523_23 = var_523_15 + 0.3
			local var_523_24 = math.max(var_523_16, arg_520_1.talkMaxDuration)

			if var_523_23 <= arg_520_1.time_ and arg_520_1.time_ < var_523_23 + var_523_24 then
				arg_520_1.typewritter.percent = (arg_520_1.time_ - var_523_23) / var_523_24

				arg_520_1.typewritter:SetDirty()
			end

			if arg_520_1.time_ >= var_523_23 + var_523_24 and arg_520_1.time_ < var_523_23 + var_523_24 + arg_523_0 then
				arg_520_1.typewritter.percent = 1

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106125 = function(arg_526_0, arg_526_1)
		arg_526_1.time_ = 0
		arg_526_1.frameCnt_ = 0
		arg_526_1.state_ = "playing"
		arg_526_1.curTalkId_ = 1101106125
		arg_526_1.duration_ = 5

		SetActive(arg_526_1.tipsGo_, false)

		function arg_526_1.onSingleLineFinish_()
			arg_526_1.onSingleLineUpdate_ = nil
			arg_526_1.onSingleLineFinish_ = nil
			arg_526_1.state_ = "waiting"
		end

		function arg_526_1.playNext_(arg_528_0)
			if arg_528_0 == 1 then
				arg_526_0:Play1101106126(arg_526_1)
			end
		end

		function arg_526_1.onSingleLineUpdate_(arg_529_0)
			local var_529_0 = 0
			local var_529_1 = 0.125

			if var_529_0 < arg_526_1.time_ and arg_526_1.time_ <= var_529_0 + arg_529_0 then
				arg_526_1.talkMaxDuration = 0
				arg_526_1.dialogCg_.alpha = 1

				arg_526_1.dialog_:SetActive(true)
				SetActive(arg_526_1.leftNameGo_, false)

				arg_526_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_526_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_526_1:RecordName(arg_526_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_526_1.iconTrs_.gameObject, false)
				arg_526_1.callingController_:SetSelectedState("normal")

				local var_529_2 = arg_526_1:GetWordFromCfg(1101106125)
				local var_529_3 = arg_526_1:FormatText(var_529_2.content)

				arg_526_1.text_.text = var_529_3

				LuaForUtil.ClearLinePrefixSymbol(arg_526_1.text_)

				local var_529_4 = 5
				local var_529_5 = utf8.len(var_529_3)
				local var_529_6 = var_529_4 <= 0 and var_529_1 or var_529_1 * (var_529_5 / var_529_4)

				if var_529_6 > 0 and var_529_1 < var_529_6 then
					arg_526_1.talkMaxDuration = var_529_6

					if var_529_6 + var_529_0 > arg_526_1.duration_ then
						arg_526_1.duration_ = var_529_6 + var_529_0
					end
				end

				arg_526_1.text_.text = var_529_3
				arg_526_1.typewritter.percent = 0

				arg_526_1.typewritter:SetDirty()
				arg_526_1:ShowNextGo(false)
				arg_526_1:RecordContent(arg_526_1.text_.text)
			end

			local var_529_7 = math.max(var_529_1, arg_526_1.talkMaxDuration)

			if var_529_0 <= arg_526_1.time_ and arg_526_1.time_ < var_529_0 + var_529_7 then
				arg_526_1.typewritter.percent = (arg_526_1.time_ - var_529_0) / var_529_7

				arg_526_1.typewritter:SetDirty()
			end

			if arg_526_1.time_ >= var_529_0 + var_529_7 and arg_526_1.time_ < var_529_0 + var_529_7 + arg_529_0 then
				arg_526_1.typewritter.percent = 1

				arg_526_1.typewritter:SetDirty()
				arg_526_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106126 = function(arg_530_0, arg_530_1)
		arg_530_1.time_ = 0
		arg_530_1.frameCnt_ = 0
		arg_530_1.state_ = "playing"
		arg_530_1.curTalkId_ = 1101106126
		arg_530_1.duration_ = 5

		SetActive(arg_530_1.tipsGo_, false)

		function arg_530_1.onSingleLineFinish_()
			arg_530_1.onSingleLineUpdate_ = nil
			arg_530_1.onSingleLineFinish_ = nil
			arg_530_1.state_ = "waiting"
		end

		function arg_530_1.playNext_(arg_532_0)
			if arg_532_0 == 1 then
				arg_530_0:Play1101106127(arg_530_1)
			end
		end

		function arg_530_1.onSingleLineUpdate_(arg_533_0)
			local var_533_0 = 0
			local var_533_1 = 0.325

			if var_533_0 < arg_530_1.time_ and arg_530_1.time_ <= var_533_0 + arg_533_0 then
				arg_530_1.talkMaxDuration = 0
				arg_530_1.dialogCg_.alpha = 1

				arg_530_1.dialog_:SetActive(true)
				SetActive(arg_530_1.leftNameGo_, false)

				arg_530_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_530_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_530_1:RecordName(arg_530_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_530_1.iconTrs_.gameObject, false)
				arg_530_1.callingController_:SetSelectedState("normal")

				local var_533_2 = arg_530_1:GetWordFromCfg(1101106126)
				local var_533_3 = arg_530_1:FormatText(var_533_2.content)

				arg_530_1.text_.text = var_533_3

				LuaForUtil.ClearLinePrefixSymbol(arg_530_1.text_)

				local var_533_4 = 13
				local var_533_5 = utf8.len(var_533_3)
				local var_533_6 = var_533_4 <= 0 and var_533_1 or var_533_1 * (var_533_5 / var_533_4)

				if var_533_6 > 0 and var_533_1 < var_533_6 then
					arg_530_1.talkMaxDuration = var_533_6

					if var_533_6 + var_533_0 > arg_530_1.duration_ then
						arg_530_1.duration_ = var_533_6 + var_533_0
					end
				end

				arg_530_1.text_.text = var_533_3
				arg_530_1.typewritter.percent = 0

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(false)
				arg_530_1:RecordContent(arg_530_1.text_.text)
			end

			local var_533_7 = math.max(var_533_1, arg_530_1.talkMaxDuration)

			if var_533_0 <= arg_530_1.time_ and arg_530_1.time_ < var_533_0 + var_533_7 then
				arg_530_1.typewritter.percent = (arg_530_1.time_ - var_533_0) / var_533_7

				arg_530_1.typewritter:SetDirty()
			end

			if arg_530_1.time_ >= var_533_0 + var_533_7 and arg_530_1.time_ < var_533_0 + var_533_7 + arg_533_0 then
				arg_530_1.typewritter.percent = 1

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106127 = function(arg_534_0, arg_534_1)
		arg_534_1.time_ = 0
		arg_534_1.frameCnt_ = 0
		arg_534_1.state_ = "playing"
		arg_534_1.curTalkId_ = 1101106127
		arg_534_1.duration_ = 5

		SetActive(arg_534_1.tipsGo_, false)

		function arg_534_1.onSingleLineFinish_()
			arg_534_1.onSingleLineUpdate_ = nil
			arg_534_1.onSingleLineFinish_ = nil
			arg_534_1.state_ = "waiting"
		end

		function arg_534_1.playNext_(arg_536_0)
			if arg_536_0 == 1 then
				arg_534_0:Play1101106128(arg_534_1)
			end
		end

		function arg_534_1.onSingleLineUpdate_(arg_537_0)
			local var_537_0 = arg_534_1.actors_["1011ui_story"].transform
			local var_537_1 = 0

			if var_537_1 < arg_534_1.time_ and arg_534_1.time_ <= var_537_1 + arg_537_0 then
				arg_534_1.var_.moveOldPos1011ui_story = var_537_0.localPosition
			end

			local var_537_2 = 0.001

			if var_537_1 <= arg_534_1.time_ and arg_534_1.time_ < var_537_1 + var_537_2 then
				local var_537_3 = (arg_534_1.time_ - var_537_1) / var_537_2
				local var_537_4 = Vector3.New(0, -0.71, -6)

				var_537_0.localPosition = Vector3.Lerp(arg_534_1.var_.moveOldPos1011ui_story, var_537_4, var_537_3)

				local var_537_5 = manager.ui.mainCamera.transform.position - var_537_0.position

				var_537_0.forward = Vector3.New(var_537_5.x, var_537_5.y, var_537_5.z)

				local var_537_6 = var_537_0.localEulerAngles

				var_537_6.z = 0
				var_537_6.x = 0
				var_537_0.localEulerAngles = var_537_6
			end

			if arg_534_1.time_ >= var_537_1 + var_537_2 and arg_534_1.time_ < var_537_1 + var_537_2 + arg_537_0 then
				var_537_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_537_7 = manager.ui.mainCamera.transform.position - var_537_0.position

				var_537_0.forward = Vector3.New(var_537_7.x, var_537_7.y, var_537_7.z)

				local var_537_8 = var_537_0.localEulerAngles

				var_537_8.z = 0
				var_537_8.x = 0
				var_537_0.localEulerAngles = var_537_8
			end

			local var_537_9 = arg_534_1.actors_["1011ui_story"]
			local var_537_10 = 0

			if var_537_10 < arg_534_1.time_ and arg_534_1.time_ <= var_537_10 + arg_537_0 and not isNil(var_537_9) and arg_534_1.var_.characterEffect1011ui_story == nil then
				arg_534_1.var_.characterEffect1011ui_story = var_537_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_537_11 = 0.200000002980232

			if var_537_10 <= arg_534_1.time_ and arg_534_1.time_ < var_537_10 + var_537_11 and not isNil(var_537_9) then
				local var_537_12 = (arg_534_1.time_ - var_537_10) / var_537_11

				if arg_534_1.var_.characterEffect1011ui_story and not isNil(var_537_9) then
					arg_534_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_534_1.time_ >= var_537_10 + var_537_11 and arg_534_1.time_ < var_537_10 + var_537_11 + arg_537_0 and not isNil(var_537_9) and arg_534_1.var_.characterEffect1011ui_story then
				arg_534_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_537_13 = 0

			if var_537_13 < arg_534_1.time_ and arg_534_1.time_ <= var_537_13 + arg_537_0 then
				arg_534_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_2")
			end

			local var_537_14 = 0

			if var_537_14 < arg_534_1.time_ and arg_534_1.time_ <= var_537_14 + arg_537_0 then
				arg_534_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_537_15 = 0
			local var_537_16 = 1.075

			if var_537_15 < arg_534_1.time_ and arg_534_1.time_ <= var_537_15 + arg_537_0 then
				arg_534_1.talkMaxDuration = 0
				arg_534_1.dialogCg_.alpha = 1

				arg_534_1.dialog_:SetActive(true)
				SetActive(arg_534_1.leftNameGo_, false)

				arg_534_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_534_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_534_1:RecordName(arg_534_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_534_1.iconTrs_.gameObject, false)
				arg_534_1.callingController_:SetSelectedState("normal")

				local var_537_17 = arg_534_1:GetWordFromCfg(1101106127)
				local var_537_18 = arg_534_1:FormatText(var_537_17.content)

				arg_534_1.text_.text = var_537_18

				LuaForUtil.ClearLinePrefixSymbol(arg_534_1.text_)

				local var_537_19 = 43
				local var_537_20 = utf8.len(var_537_18)
				local var_537_21 = var_537_19 <= 0 and var_537_16 or var_537_16 * (var_537_20 / var_537_19)

				if var_537_21 > 0 and var_537_16 < var_537_21 then
					arg_534_1.talkMaxDuration = var_537_21

					if var_537_21 + var_537_15 > arg_534_1.duration_ then
						arg_534_1.duration_ = var_537_21 + var_537_15
					end
				end

				arg_534_1.text_.text = var_537_18
				arg_534_1.typewritter.percent = 0

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(false)
				arg_534_1:RecordContent(arg_534_1.text_.text)
			end

			local var_537_22 = math.max(var_537_16, arg_534_1.talkMaxDuration)

			if var_537_15 <= arg_534_1.time_ and arg_534_1.time_ < var_537_15 + var_537_22 then
				arg_534_1.typewritter.percent = (arg_534_1.time_ - var_537_15) / var_537_22

				arg_534_1.typewritter:SetDirty()
			end

			if arg_534_1.time_ >= var_537_15 + var_537_22 and arg_534_1.time_ < var_537_15 + var_537_22 + arg_537_0 then
				arg_534_1.typewritter.percent = 1

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106128 = function(arg_538_0, arg_538_1)
		arg_538_1.time_ = 0
		arg_538_1.frameCnt_ = 0
		arg_538_1.state_ = "playing"
		arg_538_1.curTalkId_ = 1101106128
		arg_538_1.duration_ = 5

		SetActive(arg_538_1.tipsGo_, false)

		function arg_538_1.onSingleLineFinish_()
			arg_538_1.onSingleLineUpdate_ = nil
			arg_538_1.onSingleLineFinish_ = nil
			arg_538_1.state_ = "waiting"
		end

		function arg_538_1.playNext_(arg_540_0)
			if arg_540_0 == 1 then
				arg_538_0:Play1101106129(arg_538_1)
			end
		end

		function arg_538_1.onSingleLineUpdate_(arg_541_0)
			local var_541_0 = 0
			local var_541_1 = 0.925

			if var_541_0 < arg_538_1.time_ and arg_538_1.time_ <= var_541_0 + arg_541_0 then
				arg_538_1.talkMaxDuration = 0
				arg_538_1.dialogCg_.alpha = 1

				arg_538_1.dialog_:SetActive(true)
				SetActive(arg_538_1.leftNameGo_, true)

				local var_541_2 = arg_538_1:FormatText(StoryNameCfg[7].name)

				arg_538_1.leftNameTxt_.text = var_541_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_538_1.leftNameTxt_.transform)

				arg_538_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_538_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_538_1:RecordName(arg_538_1.leftNameTxt_.text)
				SetActive(arg_538_1.iconTrs_.gameObject, false)
				arg_538_1.callingController_:SetSelectedState("normal")

				local var_541_3 = arg_538_1:GetWordFromCfg(1101106128)
				local var_541_4 = arg_538_1:FormatText(var_541_3.content)

				arg_538_1.text_.text = var_541_4

				LuaForUtil.ClearLinePrefixSymbol(arg_538_1.text_)

				local var_541_5 = 42
				local var_541_6 = utf8.len(var_541_4)
				local var_541_7 = var_541_5 <= 0 and var_541_1 or var_541_1 * (var_541_6 / var_541_5)

				if var_541_7 > 0 and var_541_1 < var_541_7 then
					arg_538_1.talkMaxDuration = var_541_7

					if var_541_7 + var_541_0 > arg_538_1.duration_ then
						arg_538_1.duration_ = var_541_7 + var_541_0
					end
				end

				arg_538_1.text_.text = var_541_4
				arg_538_1.typewritter.percent = 0

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(false)
				arg_538_1:RecordContent(arg_538_1.text_.text)
			end

			local var_541_8 = math.max(var_541_1, arg_538_1.talkMaxDuration)

			if var_541_0 <= arg_538_1.time_ and arg_538_1.time_ < var_541_0 + var_541_8 then
				arg_538_1.typewritter.percent = (arg_538_1.time_ - var_541_0) / var_541_8

				arg_538_1.typewritter:SetDirty()
			end

			if arg_538_1.time_ >= var_541_0 + var_541_8 and arg_538_1.time_ < var_541_0 + var_541_8 + arg_541_0 then
				arg_538_1.typewritter.percent = 1

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106129 = function(arg_542_0, arg_542_1)
		arg_542_1.time_ = 0
		arg_542_1.frameCnt_ = 0
		arg_542_1.state_ = "playing"
		arg_542_1.curTalkId_ = 1101106129
		arg_542_1.duration_ = 2

		SetActive(arg_542_1.tipsGo_, false)

		function arg_542_1.onSingleLineFinish_()
			arg_542_1.onSingleLineUpdate_ = nil
			arg_542_1.onSingleLineFinish_ = nil
			arg_542_1.state_ = "waiting"
		end

		function arg_542_1.playNext_(arg_544_0)
			if arg_544_0 == 1 then
				arg_542_0:Play1101106130(arg_542_1)
			end
		end

		function arg_542_1.onSingleLineUpdate_(arg_545_0)
			local var_545_0 = arg_542_1.actors_["1011ui_story"].transform
			local var_545_1 = 0

			if var_545_1 < arg_542_1.time_ and arg_542_1.time_ <= var_545_1 + arg_545_0 then
				arg_542_1.var_.moveOldPos1011ui_story = var_545_0.localPosition
			end

			local var_545_2 = 0.001

			if var_545_1 <= arg_542_1.time_ and arg_542_1.time_ < var_545_1 + var_545_2 then
				local var_545_3 = (arg_542_1.time_ - var_545_1) / var_545_2
				local var_545_4 = Vector3.New(0, -0.71, -6)

				var_545_0.localPosition = Vector3.Lerp(arg_542_1.var_.moveOldPos1011ui_story, var_545_4, var_545_3)

				local var_545_5 = manager.ui.mainCamera.transform.position - var_545_0.position

				var_545_0.forward = Vector3.New(var_545_5.x, var_545_5.y, var_545_5.z)

				local var_545_6 = var_545_0.localEulerAngles

				var_545_6.z = 0
				var_545_6.x = 0
				var_545_0.localEulerAngles = var_545_6
			end

			if arg_542_1.time_ >= var_545_1 + var_545_2 and arg_542_1.time_ < var_545_1 + var_545_2 + arg_545_0 then
				var_545_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_545_7 = manager.ui.mainCamera.transform.position - var_545_0.position

				var_545_0.forward = Vector3.New(var_545_7.x, var_545_7.y, var_545_7.z)

				local var_545_8 = var_545_0.localEulerAngles

				var_545_8.z = 0
				var_545_8.x = 0
				var_545_0.localEulerAngles = var_545_8
			end

			local var_545_9 = 0

			if var_545_9 < arg_542_1.time_ and arg_542_1.time_ <= var_545_9 + arg_545_0 then
				arg_542_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_545_10 = 0

			if var_545_10 < arg_542_1.time_ and arg_542_1.time_ <= var_545_10 + arg_545_0 then
				arg_542_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_545_11 = 0
			local var_545_12 = 0.125

			if var_545_11 < arg_542_1.time_ and arg_542_1.time_ <= var_545_11 + arg_545_0 then
				arg_542_1.talkMaxDuration = 0
				arg_542_1.dialogCg_.alpha = 1

				arg_542_1.dialog_:SetActive(true)
				SetActive(arg_542_1.leftNameGo_, true)

				local var_545_13 = arg_542_1:FormatText(StoryNameCfg[37].name)

				arg_542_1.leftNameTxt_.text = var_545_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_542_1.leftNameTxt_.transform)

				arg_542_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_542_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_542_1:RecordName(arg_542_1.leftNameTxt_.text)
				SetActive(arg_542_1.iconTrs_.gameObject, false)
				arg_542_1.callingController_:SetSelectedState("normal")

				local var_545_14 = arg_542_1:GetWordFromCfg(1101106129)
				local var_545_15 = arg_542_1:FormatText(var_545_14.content)

				arg_542_1.text_.text = var_545_15

				LuaForUtil.ClearLinePrefixSymbol(arg_542_1.text_)

				local var_545_16 = 5
				local var_545_17 = utf8.len(var_545_15)
				local var_545_18 = var_545_16 <= 0 and var_545_12 or var_545_12 * (var_545_17 / var_545_16)

				if var_545_18 > 0 and var_545_12 < var_545_18 then
					arg_542_1.talkMaxDuration = var_545_18

					if var_545_18 + var_545_11 > arg_542_1.duration_ then
						arg_542_1.duration_ = var_545_18 + var_545_11
					end
				end

				arg_542_1.text_.text = var_545_15
				arg_542_1.typewritter.percent = 0

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb") ~= 0 then
					local var_545_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb") / 1000

					if var_545_19 + var_545_11 > arg_542_1.duration_ then
						arg_542_1.duration_ = var_545_19 + var_545_11
					end

					if var_545_14.prefab_name ~= "" and arg_542_1.actors_[var_545_14.prefab_name] ~= nil then
						local var_545_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_542_1.actors_[var_545_14.prefab_name].transform, "story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")

						arg_542_1:RecordAudio("1101106129", var_545_20)
						arg_542_1:RecordAudio("1101106129", var_545_20)
					else
						arg_542_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")
					end

					arg_542_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")
				end

				arg_542_1:RecordContent(arg_542_1.text_.text)
			end

			local var_545_21 = math.max(var_545_12, arg_542_1.talkMaxDuration)

			if var_545_11 <= arg_542_1.time_ and arg_542_1.time_ < var_545_11 + var_545_21 then
				arg_542_1.typewritter.percent = (arg_542_1.time_ - var_545_11) / var_545_21

				arg_542_1.typewritter:SetDirty()
			end

			if arg_542_1.time_ >= var_545_11 + var_545_21 and arg_542_1.time_ < var_545_11 + var_545_21 + arg_545_0 then
				arg_542_1.typewritter.percent = 1

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106130 = function(arg_546_0, arg_546_1)
		arg_546_1.time_ = 0
		arg_546_1.frameCnt_ = 0
		arg_546_1.state_ = "playing"
		arg_546_1.curTalkId_ = 1101106130
		arg_546_1.duration_ = 5

		SetActive(arg_546_1.tipsGo_, false)

		function arg_546_1.onSingleLineFinish_()
			arg_546_1.onSingleLineUpdate_ = nil
			arg_546_1.onSingleLineFinish_ = nil
			arg_546_1.state_ = "waiting"
		end

		function arg_546_1.playNext_(arg_548_0)
			if arg_548_0 == 1 then
				arg_546_0:Play1101106131(arg_546_1)
			end
		end

		function arg_546_1.onSingleLineUpdate_(arg_549_0)
			local var_549_0 = 0

			if var_549_0 < arg_546_1.time_ and arg_546_1.time_ <= var_549_0 + arg_549_0 then
				arg_546_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_549_1 = 0

			if var_549_1 < arg_546_1.time_ and arg_546_1.time_ <= var_549_1 + arg_549_0 then
				arg_546_1.allBtn_.enabled = false
			end

			local var_549_2 = 2

			if arg_546_1.time_ >= var_549_1 + var_549_2 and arg_546_1.time_ < var_549_1 + var_549_2 + arg_549_0 then
				arg_546_1.allBtn_.enabled = true
			end

			local var_549_3 = 0
			local var_549_4 = 1.025

			if var_549_3 < arg_546_1.time_ and arg_546_1.time_ <= var_549_3 + arg_549_0 then
				arg_546_1.talkMaxDuration = 0
				arg_546_1.dialogCg_.alpha = 1

				arg_546_1.dialog_:SetActive(true)
				SetActive(arg_546_1.leftNameGo_, true)

				local var_549_5 = arg_546_1:FormatText(StoryNameCfg[7].name)

				arg_546_1.leftNameTxt_.text = var_549_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_546_1.leftNameTxt_.transform)

				arg_546_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_546_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_546_1:RecordName(arg_546_1.leftNameTxt_.text)
				SetActive(arg_546_1.iconTrs_.gameObject, false)
				arg_546_1.callingController_:SetSelectedState("normal")

				local var_549_6 = arg_546_1:GetWordFromCfg(1101106130)
				local var_549_7 = arg_546_1:FormatText(var_549_6.content)

				arg_546_1.text_.text = var_549_7

				LuaForUtil.ClearLinePrefixSymbol(arg_546_1.text_)

				local var_549_8 = 41
				local var_549_9 = utf8.len(var_549_7)
				local var_549_10 = var_549_8 <= 0 and var_549_4 or var_549_4 * (var_549_9 / var_549_8)

				if var_549_10 > 0 and var_549_4 < var_549_10 then
					arg_546_1.talkMaxDuration = var_549_10

					if var_549_10 + var_549_3 > arg_546_1.duration_ then
						arg_546_1.duration_ = var_549_10 + var_549_3
					end
				end

				arg_546_1.text_.text = var_549_7
				arg_546_1.typewritter.percent = 0

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(false)
				arg_546_1:RecordContent(arg_546_1.text_.text)
			end

			local var_549_11 = math.max(var_549_4, arg_546_1.talkMaxDuration)

			if var_549_3 <= arg_546_1.time_ and arg_546_1.time_ < var_549_3 + var_549_11 then
				arg_546_1.typewritter.percent = (arg_546_1.time_ - var_549_3) / var_549_11

				arg_546_1.typewritter:SetDirty()
			end

			if arg_546_1.time_ >= var_549_3 + var_549_11 and arg_546_1.time_ < var_549_3 + var_549_11 + arg_549_0 then
				arg_546_1.typewritter.percent = 1

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106131 = function(arg_550_0, arg_550_1)
		arg_550_1.time_ = 0
		arg_550_1.frameCnt_ = 0
		arg_550_1.state_ = "playing"
		arg_550_1.curTalkId_ = 1101106131
		arg_550_1.duration_ = 5

		SetActive(arg_550_1.tipsGo_, false)

		function arg_550_1.onSingleLineFinish_()
			arg_550_1.onSingleLineUpdate_ = nil
			arg_550_1.onSingleLineFinish_ = nil
			arg_550_1.state_ = "waiting"
		end

		function arg_550_1.playNext_(arg_552_0)
			if arg_552_0 == 1 then
				arg_550_0:Play1101106132(arg_550_1)
			end
		end

		function arg_550_1.onSingleLineUpdate_(arg_553_0)
			local var_553_0 = 0

			if var_553_0 < arg_550_1.time_ and arg_550_1.time_ <= var_553_0 + arg_553_0 then
				arg_550_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_553_1 = 0

			if var_553_1 < arg_550_1.time_ and arg_550_1.time_ <= var_553_1 + arg_553_0 then
				arg_550_1.allBtn_.enabled = false
			end

			local var_553_2 = 1.43333333333333

			if arg_550_1.time_ >= var_553_1 + var_553_2 and arg_550_1.time_ < var_553_1 + var_553_2 + arg_553_0 then
				arg_550_1.allBtn_.enabled = true
			end

			local var_553_3 = 0
			local var_553_4 = 0.7

			if var_553_3 < arg_550_1.time_ and arg_550_1.time_ <= var_553_3 + arg_553_0 then
				arg_550_1.talkMaxDuration = 0
				arg_550_1.dialogCg_.alpha = 1

				arg_550_1.dialog_:SetActive(true)
				SetActive(arg_550_1.leftNameGo_, true)

				local var_553_5 = arg_550_1:FormatText(StoryNameCfg[7].name)

				arg_550_1.leftNameTxt_.text = var_553_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_550_1.leftNameTxt_.transform)

				arg_550_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_550_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_550_1:RecordName(arg_550_1.leftNameTxt_.text)
				SetActive(arg_550_1.iconTrs_.gameObject, false)
				arg_550_1.callingController_:SetSelectedState("normal")

				local var_553_6 = arg_550_1:GetWordFromCfg(1101106131)
				local var_553_7 = arg_550_1:FormatText(var_553_6.content)

				arg_550_1.text_.text = var_553_7

				LuaForUtil.ClearLinePrefixSymbol(arg_550_1.text_)

				local var_553_8 = 28
				local var_553_9 = utf8.len(var_553_7)
				local var_553_10 = var_553_8 <= 0 and var_553_4 or var_553_4 * (var_553_9 / var_553_8)

				if var_553_10 > 0 and var_553_4 < var_553_10 then
					arg_550_1.talkMaxDuration = var_553_10

					if var_553_10 + var_553_3 > arg_550_1.duration_ then
						arg_550_1.duration_ = var_553_10 + var_553_3
					end
				end

				arg_550_1.text_.text = var_553_7
				arg_550_1.typewritter.percent = 0

				arg_550_1.typewritter:SetDirty()
				arg_550_1:ShowNextGo(false)
				arg_550_1:RecordContent(arg_550_1.text_.text)
			end

			local var_553_11 = math.max(var_553_4, arg_550_1.talkMaxDuration)

			if var_553_3 <= arg_550_1.time_ and arg_550_1.time_ < var_553_3 + var_553_11 then
				arg_550_1.typewritter.percent = (arg_550_1.time_ - var_553_3) / var_553_11

				arg_550_1.typewritter:SetDirty()
			end

			if arg_550_1.time_ >= var_553_3 + var_553_11 and arg_550_1.time_ < var_553_3 + var_553_11 + arg_553_0 then
				arg_550_1.typewritter.percent = 1

				arg_550_1.typewritter:SetDirty()
				arg_550_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106132 = function(arg_554_0, arg_554_1)
		arg_554_1.time_ = 0
		arg_554_1.frameCnt_ = 0
		arg_554_1.state_ = "playing"
		arg_554_1.curTalkId_ = 1101106132
		arg_554_1.duration_ = 5

		SetActive(arg_554_1.tipsGo_, false)

		function arg_554_1.onSingleLineFinish_()
			arg_554_1.onSingleLineUpdate_ = nil
			arg_554_1.onSingleLineFinish_ = nil
			arg_554_1.state_ = "waiting"
		end

		function arg_554_1.playNext_(arg_556_0)
			if arg_556_0 == 1 then
				arg_554_0:Play1101106133(arg_554_1)
			end
		end

		function arg_554_1.onSingleLineUpdate_(arg_557_0)
			local var_557_0 = 0

			if var_557_0 < arg_554_1.time_ and arg_554_1.time_ <= var_557_0 + arg_557_0 then
				arg_554_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_557_1 = 0

			if var_557_1 < arg_554_1.time_ and arg_554_1.time_ <= var_557_1 + arg_557_0 then
				arg_554_1.allBtn_.enabled = false
			end

			local var_557_2 = 2

			if arg_554_1.time_ >= var_557_1 + var_557_2 and arg_554_1.time_ < var_557_1 + var_557_2 + arg_557_0 then
				arg_554_1.allBtn_.enabled = true
			end

			local var_557_3 = 0
			local var_557_4 = 0.3

			if var_557_3 < arg_554_1.time_ and arg_554_1.time_ <= var_557_3 + arg_557_0 then
				arg_554_1.talkMaxDuration = 0
				arg_554_1.dialogCg_.alpha = 1

				arg_554_1.dialog_:SetActive(true)
				SetActive(arg_554_1.leftNameGo_, true)

				local var_557_5 = arg_554_1:FormatText(StoryNameCfg[7].name)

				arg_554_1.leftNameTxt_.text = var_557_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_554_1.leftNameTxt_.transform)

				arg_554_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_554_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_554_1:RecordName(arg_554_1.leftNameTxt_.text)
				SetActive(arg_554_1.iconTrs_.gameObject, false)
				arg_554_1.callingController_:SetSelectedState("normal")

				local var_557_6 = arg_554_1:GetWordFromCfg(1101106132)
				local var_557_7 = arg_554_1:FormatText(var_557_6.content)

				arg_554_1.text_.text = var_557_7

				LuaForUtil.ClearLinePrefixSymbol(arg_554_1.text_)

				local var_557_8 = 12
				local var_557_9 = utf8.len(var_557_7)
				local var_557_10 = var_557_8 <= 0 and var_557_4 or var_557_4 * (var_557_9 / var_557_8)

				if var_557_10 > 0 and var_557_4 < var_557_10 then
					arg_554_1.talkMaxDuration = var_557_10

					if var_557_10 + var_557_3 > arg_554_1.duration_ then
						arg_554_1.duration_ = var_557_10 + var_557_3
					end
				end

				arg_554_1.text_.text = var_557_7
				arg_554_1.typewritter.percent = 0

				arg_554_1.typewritter:SetDirty()
				arg_554_1:ShowNextGo(false)
				arg_554_1:RecordContent(arg_554_1.text_.text)
			end

			local var_557_11 = math.max(var_557_4, arg_554_1.talkMaxDuration)

			if var_557_3 <= arg_554_1.time_ and arg_554_1.time_ < var_557_3 + var_557_11 then
				arg_554_1.typewritter.percent = (arg_554_1.time_ - var_557_3) / var_557_11

				arg_554_1.typewritter:SetDirty()
			end

			if arg_554_1.time_ >= var_557_3 + var_557_11 and arg_554_1.time_ < var_557_3 + var_557_11 + arg_557_0 then
				arg_554_1.typewritter.percent = 1

				arg_554_1.typewritter:SetDirty()
				arg_554_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106133 = function(arg_558_0, arg_558_1)
		arg_558_1.time_ = 0
		arg_558_1.frameCnt_ = 0
		arg_558_1.state_ = "playing"
		arg_558_1.curTalkId_ = 1101106133
		arg_558_1.duration_ = 9.2

		local var_558_0 = {
			zh = 9,
			ja = 9.2
		}
		local var_558_1 = manager.audio:GetLocalizationFlag()

		if var_558_0[var_558_1] ~= nil then
			arg_558_1.duration_ = var_558_0[var_558_1]
		end

		SetActive(arg_558_1.tipsGo_, false)

		function arg_558_1.onSingleLineFinish_()
			arg_558_1.onSingleLineUpdate_ = nil
			arg_558_1.onSingleLineFinish_ = nil
			arg_558_1.state_ = "waiting"
		end

		function arg_558_1.playNext_(arg_560_0)
			if arg_560_0 == 1 then
				arg_558_0:Play1101106134(arg_558_1)
			end
		end

		function arg_558_1.onSingleLineUpdate_(arg_561_0)
			local var_561_0 = arg_558_1.actors_["1011ui_story"].transform
			local var_561_1 = 4

			if var_561_1 < arg_558_1.time_ and arg_558_1.time_ <= var_561_1 + arg_561_0 then
				arg_558_1.var_.moveOldPos1011ui_story = var_561_0.localPosition
			end

			local var_561_2 = 0.001

			if var_561_1 <= arg_558_1.time_ and arg_558_1.time_ < var_561_1 + var_561_2 then
				local var_561_3 = (arg_558_1.time_ - var_561_1) / var_561_2
				local var_561_4 = Vector3.New(0, 100, 0)

				var_561_0.localPosition = Vector3.Lerp(arg_558_1.var_.moveOldPos1011ui_story, var_561_4, var_561_3)

				local var_561_5 = manager.ui.mainCamera.transform.position - var_561_0.position

				var_561_0.forward = Vector3.New(var_561_5.x, var_561_5.y, var_561_5.z)

				local var_561_6 = var_561_0.localEulerAngles

				var_561_6.z = 0
				var_561_6.x = 0
				var_561_0.localEulerAngles = var_561_6
			end

			if arg_558_1.time_ >= var_561_1 + var_561_2 and arg_558_1.time_ < var_561_1 + var_561_2 + arg_561_0 then
				var_561_0.localPosition = Vector3.New(0, 100, 0)

				local var_561_7 = manager.ui.mainCamera.transform.position - var_561_0.position

				var_561_0.forward = Vector3.New(var_561_7.x, var_561_7.y, var_561_7.z)

				local var_561_8 = var_561_0.localEulerAngles

				var_561_8.z = 0
				var_561_8.x = 0
				var_561_0.localEulerAngles = var_561_8
			end

			local var_561_9 = "R1102a"

			if arg_558_1.bgs_[var_561_9] == nil then
				local var_561_10 = Object.Instantiate(arg_558_1.paintGo_)

				var_561_10:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_561_9)
				var_561_10.name = var_561_9
				var_561_10.transform.parent = arg_558_1.stage_.transform
				var_561_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_558_1.bgs_[var_561_9] = var_561_10
			end

			local var_561_11 = arg_558_1.bgs_.R1102a.transform
			local var_561_12 = 4

			if var_561_12 < arg_558_1.time_ and arg_558_1.time_ <= var_561_12 + arg_561_0 then
				arg_558_1.var_.moveOldPosR1102a = var_561_11.localPosition
			end

			local var_561_13 = 0.001

			if var_561_12 <= arg_558_1.time_ and arg_558_1.time_ < var_561_12 + var_561_13 then
				local var_561_14 = (arg_558_1.time_ - var_561_12) / var_561_13
				local var_561_15 = Vector3.New(0.4, -1.1, 2.15)

				var_561_11.localPosition = Vector3.Lerp(arg_558_1.var_.moveOldPosR1102a, var_561_15, var_561_14)
			end

			if arg_558_1.time_ >= var_561_12 + var_561_13 and arg_558_1.time_ < var_561_12 + var_561_13 + arg_561_0 then
				var_561_11.localPosition = Vector3.New(0.4, -1.1, 2.15)
			end

			local var_561_16 = arg_558_1.bgs_.R1102a.transform
			local var_561_17 = 4.034

			if var_561_17 < arg_558_1.time_ and arg_558_1.time_ <= var_561_17 + arg_561_0 then
				arg_558_1.var_.moveOldPosR1102a = var_561_16.localPosition
			end

			local var_561_18 = 4.641

			if var_561_17 <= arg_558_1.time_ and arg_558_1.time_ < var_561_17 + var_561_18 then
				local var_561_19 = (arg_558_1.time_ - var_561_17) / var_561_18
				local var_561_20 = Vector3.New(0.4, -1.1, 2)

				var_561_16.localPosition = Vector3.Lerp(arg_558_1.var_.moveOldPosR1102a, var_561_20, var_561_19)
			end

			if arg_558_1.time_ >= var_561_17 + var_561_18 and arg_558_1.time_ < var_561_17 + var_561_18 + arg_561_0 then
				var_561_16.localPosition = Vector3.New(0.4, -1.1, 2)
			end

			local var_561_21 = arg_558_1.actors_.R1102a
			local var_561_22 = 4.00000000184774

			if var_561_22 < arg_558_1.time_ and arg_558_1.time_ <= var_561_22 + arg_561_0 then
				local var_561_23 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_561_23 then
					var_561_23.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_561_23.radialBlurScale = 0
					var_561_23.radialBlurGradient = 0
					var_561_23.radialBlurIntensity = 0

					if var_561_21 then
						var_561_23.radialBlurTarget = var_561_21.transform
					end
				end
			end

			local var_561_24 = 3.59933333148559

			if var_561_22 <= arg_558_1.time_ and arg_558_1.time_ < var_561_22 + var_561_24 then
				local var_561_25 = (arg_558_1.time_ - var_561_22) / var_561_24
				local var_561_26 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_561_26 then
					var_561_26.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_561_26.radialBlurScale = Mathf.Lerp(0, 0.35, var_561_25)
					var_561_26.radialBlurGradient = Mathf.Lerp(0, 1, var_561_25)
					var_561_26.radialBlurIntensity = Mathf.Lerp(0, 1, var_561_25)
				end
			end

			if arg_558_1.time_ >= var_561_22 + var_561_24 and arg_558_1.time_ < var_561_22 + var_561_24 + arg_561_0 then
				local var_561_27 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_561_27 then
					var_561_27.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_561_27.radialBlurScale = 0.35
					var_561_27.radialBlurGradient = 1
					var_561_27.radialBlurIntensity = 1
				end
			end

			local var_561_28 = 4

			if var_561_28 < arg_558_1.time_ and arg_558_1.time_ <= var_561_28 + arg_561_0 then
				arg_558_1.allBtn_.enabled = false
			end

			local var_561_29 = 3.59933333333333

			if arg_558_1.time_ >= var_561_28 + var_561_29 and arg_558_1.time_ < var_561_28 + var_561_29 + arg_561_0 then
				arg_558_1.allBtn_.enabled = true
			end

			local var_561_30 = 0

			if var_561_30 < arg_558_1.time_ and arg_558_1.time_ <= var_561_30 + arg_561_0 then
				arg_558_1.mask_.enabled = true
				arg_558_1.mask_.raycastTarget = true

				arg_558_1:SetGaussion(false)
			end

			local var_561_31 = 4

			if var_561_30 <= arg_558_1.time_ and arg_558_1.time_ < var_561_30 + var_561_31 then
				local var_561_32 = (arg_558_1.time_ - var_561_30) / var_561_31
				local var_561_33 = Color.New(0, 0, 0)

				var_561_33.a = Mathf.Lerp(0, 1, var_561_32)
				arg_558_1.mask_.color = var_561_33
			end

			if arg_558_1.time_ >= var_561_30 + var_561_31 and arg_558_1.time_ < var_561_30 + var_561_31 + arg_561_0 then
				local var_561_34 = Color.New(0, 0, 0)

				var_561_34.a = 1
				arg_558_1.mask_.color = var_561_34
			end

			local var_561_35 = 4

			if var_561_35 < arg_558_1.time_ and arg_558_1.time_ <= var_561_35 + arg_561_0 then
				arg_558_1.mask_.enabled = true
				arg_558_1.mask_.raycastTarget = true

				arg_558_1:SetGaussion(false)
			end

			local var_561_36 = 4

			if var_561_35 <= arg_558_1.time_ and arg_558_1.time_ < var_561_35 + var_561_36 then
				local var_561_37 = (arg_558_1.time_ - var_561_35) / var_561_36
				local var_561_38 = Color.New(0, 0, 0)

				var_561_38.a = Mathf.Lerp(1, 0, var_561_37)
				arg_558_1.mask_.color = var_561_38
			end

			if arg_558_1.time_ >= var_561_35 + var_561_36 and arg_558_1.time_ < var_561_35 + var_561_36 + arg_561_0 then
				local var_561_39 = Color.New(0, 0, 0)
				local var_561_40 = 0

				arg_558_1.mask_.enabled = false
				var_561_39.a = var_561_40
				arg_558_1.mask_.color = var_561_39
			end

			if arg_558_1.frameCnt_ <= 1 then
				arg_558_1.dialog_:SetActive(false)
			end

			local var_561_41 = 8
			local var_561_42 = 0.075

			if var_561_41 < arg_558_1.time_ and arg_558_1.time_ <= var_561_41 + arg_561_0 then
				arg_558_1.talkMaxDuration = 0

				arg_558_1.dialog_:SetActive(true)

				local var_561_43 = LeanTween.value(arg_558_1.dialog_, 0, 1, 0.3)

				var_561_43:setOnUpdate(LuaHelper.FloatAction(function(arg_562_0)
					arg_558_1.dialogCg_.alpha = arg_562_0
				end))
				var_561_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_558_1.dialog_)
					var_561_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_558_1.duration_ = arg_558_1.duration_ + 0.3

				SetActive(arg_558_1.leftNameGo_, true)

				local var_561_44 = arg_558_1:FormatText(StoryNameCfg[37].name)

				arg_558_1.leftNameTxt_.text = var_561_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_558_1.leftNameTxt_.transform)

				arg_558_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_558_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_558_1:RecordName(arg_558_1.leftNameTxt_.text)
				SetActive(arg_558_1.iconTrs_.gameObject, false)
				arg_558_1.callingController_:SetSelectedState("normal")

				local var_561_45 = arg_558_1:GetWordFromCfg(1101106133)
				local var_561_46 = arg_558_1:FormatText(var_561_45.content)

				arg_558_1.text_.text = var_561_46

				LuaForUtil.ClearLinePrefixSymbol(arg_558_1.text_)

				local var_561_47 = 3
				local var_561_48 = utf8.len(var_561_46)
				local var_561_49 = var_561_47 <= 0 and var_561_42 or var_561_42 * (var_561_48 / var_561_47)

				if var_561_49 > 0 and var_561_42 < var_561_49 then
					arg_558_1.talkMaxDuration = var_561_49
					var_561_41 = var_561_41 + 0.3

					if var_561_49 + var_561_41 > arg_558_1.duration_ then
						arg_558_1.duration_ = var_561_49 + var_561_41
					end
				end

				arg_558_1.text_.text = var_561_46
				arg_558_1.typewritter.percent = 0

				arg_558_1.typewritter:SetDirty()
				arg_558_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb") ~= 0 then
					local var_561_50 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb") / 1000

					if var_561_50 + var_561_41 > arg_558_1.duration_ then
						arg_558_1.duration_ = var_561_50 + var_561_41
					end

					if var_561_45.prefab_name ~= "" and arg_558_1.actors_[var_561_45.prefab_name] ~= nil then
						local var_561_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_558_1.actors_[var_561_45.prefab_name].transform, "story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")

						arg_558_1:RecordAudio("1101106133", var_561_51)
						arg_558_1:RecordAudio("1101106133", var_561_51)
					else
						arg_558_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")
					end

					arg_558_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")
				end

				arg_558_1:RecordContent(arg_558_1.text_.text)
			end

			local var_561_52 = var_561_41 + 0.3
			local var_561_53 = math.max(var_561_42, arg_558_1.talkMaxDuration)

			if var_561_52 <= arg_558_1.time_ and arg_558_1.time_ < var_561_52 + var_561_53 then
				arg_558_1.typewritter.percent = (arg_558_1.time_ - var_561_52) / var_561_53

				arg_558_1.typewritter:SetDirty()
			end

			if arg_558_1.time_ >= var_561_52 + var_561_53 and arg_558_1.time_ < var_561_52 + var_561_53 + arg_561_0 then
				arg_558_1.typewritter.percent = 1

				arg_558_1.typewritter:SetDirty()
				arg_558_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106134 = function(arg_564_0, arg_564_1)
		arg_564_1.time_ = 0
		arg_564_1.frameCnt_ = 0
		arg_564_1.state_ = "playing"
		arg_564_1.curTalkId_ = 1101106134
		arg_564_1.duration_ = 5

		SetActive(arg_564_1.tipsGo_, false)

		function arg_564_1.onSingleLineFinish_()
			arg_564_1.onSingleLineUpdate_ = nil
			arg_564_1.onSingleLineFinish_ = nil
			arg_564_1.state_ = "waiting"
		end

		function arg_564_1.playNext_(arg_566_0)
			if arg_566_0 == 1 then
				arg_564_0:Play1101106135(arg_564_1)
			end
		end

		function arg_564_1.onSingleLineUpdate_(arg_567_0)
			local var_567_0 = arg_564_1.actors_.R1102a
			local var_567_1 = 0

			if var_567_1 < arg_564_1.time_ and arg_564_1.time_ <= var_567_1 + arg_567_0 then
				local var_567_2 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_567_2 then
					var_567_2.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_567_2.radialBlurScale = 0
					var_567_2.radialBlurGradient = 0
					var_567_2.radialBlurIntensity = 0

					if var_567_0 then
						var_567_2.radialBlurTarget = var_567_0.transform
					end
				end
			end

			local var_567_3 = 3.59933333148559

			if var_567_1 <= arg_564_1.time_ and arg_564_1.time_ < var_567_1 + var_567_3 then
				local var_567_4 = (arg_564_1.time_ - var_567_1) / var_567_3
				local var_567_5 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_567_5 then
					var_567_5.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_567_5.radialBlurScale = Mathf.Lerp(0, 0.35, var_567_4)
					var_567_5.radialBlurGradient = Mathf.Lerp(0, 1, var_567_4)
					var_567_5.radialBlurIntensity = Mathf.Lerp(0, 1, var_567_4)
				end
			end

			if arg_564_1.time_ >= var_567_1 + var_567_3 and arg_564_1.time_ < var_567_1 + var_567_3 + arg_567_0 then
				local var_567_6 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_567_6 then
					var_567_6.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_567_6.radialBlurScale = 0.35
					var_567_6.radialBlurGradient = 1
					var_567_6.radialBlurIntensity = 1
				end
			end

			local var_567_7 = 0
			local var_567_8 = 0.5

			if var_567_7 < arg_564_1.time_ and arg_564_1.time_ <= var_567_7 + arg_567_0 then
				arg_564_1.talkMaxDuration = 0
				arg_564_1.dialogCg_.alpha = 1

				arg_564_1.dialog_:SetActive(true)
				SetActive(arg_564_1.leftNameGo_, false)

				arg_564_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_564_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_564_1:RecordName(arg_564_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_564_1.iconTrs_.gameObject, false)
				arg_564_1.callingController_:SetSelectedState("normal")

				local var_567_9 = arg_564_1:GetWordFromCfg(1101106134)
				local var_567_10 = arg_564_1:FormatText(var_567_9.content)

				arg_564_1.text_.text = var_567_10

				LuaForUtil.ClearLinePrefixSymbol(arg_564_1.text_)

				local var_567_11 = 20
				local var_567_12 = utf8.len(var_567_10)
				local var_567_13 = var_567_11 <= 0 and var_567_8 or var_567_8 * (var_567_12 / var_567_11)

				if var_567_13 > 0 and var_567_8 < var_567_13 then
					arg_564_1.talkMaxDuration = var_567_13

					if var_567_13 + var_567_7 > arg_564_1.duration_ then
						arg_564_1.duration_ = var_567_13 + var_567_7
					end
				end

				arg_564_1.text_.text = var_567_10
				arg_564_1.typewritter.percent = 0

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(false)
				arg_564_1:RecordContent(arg_564_1.text_.text)
			end

			local var_567_14 = math.max(var_567_8, arg_564_1.talkMaxDuration)

			if var_567_7 <= arg_564_1.time_ and arg_564_1.time_ < var_567_7 + var_567_14 then
				arg_564_1.typewritter.percent = (arg_564_1.time_ - var_567_7) / var_567_14

				arg_564_1.typewritter:SetDirty()
			end

			if arg_564_1.time_ >= var_567_7 + var_567_14 and arg_564_1.time_ < var_567_7 + var_567_14 + arg_567_0 then
				arg_564_1.typewritter.percent = 1

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106135 = function(arg_568_0, arg_568_1)
		arg_568_1.time_ = 0
		arg_568_1.frameCnt_ = 0
		arg_568_1.state_ = "playing"
		arg_568_1.curTalkId_ = 1101106135
		arg_568_1.duration_ = 2.67

		local var_568_0 = {
			zh = 2.466,
			ja = 2.666
		}
		local var_568_1 = manager.audio:GetLocalizationFlag()

		if var_568_0[var_568_1] ~= nil then
			arg_568_1.duration_ = var_568_0[var_568_1]
		end

		SetActive(arg_568_1.tipsGo_, false)

		function arg_568_1.onSingleLineFinish_()
			arg_568_1.onSingleLineUpdate_ = nil
			arg_568_1.onSingleLineFinish_ = nil
			arg_568_1.state_ = "waiting"
		end

		function arg_568_1.playNext_(arg_570_0)
			if arg_570_0 == 1 then
				arg_568_0:Play1101106136(arg_568_1)
			end
		end

		function arg_568_1.onSingleLineUpdate_(arg_571_0)
			local var_571_0 = 0
			local var_571_1 = 0.125

			if var_571_0 < arg_568_1.time_ and arg_568_1.time_ <= var_571_0 + arg_571_0 then
				arg_568_1.talkMaxDuration = 0
				arg_568_1.dialogCg_.alpha = 1

				arg_568_1.dialog_:SetActive(true)
				SetActive(arg_568_1.leftNameGo_, true)

				local var_571_2 = arg_568_1:FormatText(StoryNameCfg[37].name)

				arg_568_1.leftNameTxt_.text = var_571_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_568_1.leftNameTxt_.transform)

				arg_568_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_568_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_568_1:RecordName(arg_568_1.leftNameTxt_.text)
				SetActive(arg_568_1.iconTrs_.gameObject, false)
				arg_568_1.callingController_:SetSelectedState("normal")

				local var_571_3 = arg_568_1:GetWordFromCfg(1101106135)
				local var_571_4 = arg_568_1:FormatText(var_571_3.content)

				arg_568_1.text_.text = var_571_4

				LuaForUtil.ClearLinePrefixSymbol(arg_568_1.text_)

				local var_571_5 = 5
				local var_571_6 = utf8.len(var_571_4)
				local var_571_7 = var_571_5 <= 0 and var_571_1 or var_571_1 * (var_571_6 / var_571_5)

				if var_571_7 > 0 and var_571_1 < var_571_7 then
					arg_568_1.talkMaxDuration = var_571_7

					if var_571_7 + var_571_0 > arg_568_1.duration_ then
						arg_568_1.duration_ = var_571_7 + var_571_0
					end
				end

				arg_568_1.text_.text = var_571_4
				arg_568_1.typewritter.percent = 0

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb") ~= 0 then
					local var_571_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb") / 1000

					if var_571_8 + var_571_0 > arg_568_1.duration_ then
						arg_568_1.duration_ = var_571_8 + var_571_0
					end

					if var_571_3.prefab_name ~= "" and arg_568_1.actors_[var_571_3.prefab_name] ~= nil then
						local var_571_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_568_1.actors_[var_571_3.prefab_name].transform, "story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")

						arg_568_1:RecordAudio("1101106135", var_571_9)
						arg_568_1:RecordAudio("1101106135", var_571_9)
					else
						arg_568_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")
					end

					arg_568_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")
				end

				arg_568_1:RecordContent(arg_568_1.text_.text)
			end

			local var_571_10 = math.max(var_571_1, arg_568_1.talkMaxDuration)

			if var_571_0 <= arg_568_1.time_ and arg_568_1.time_ < var_571_0 + var_571_10 then
				arg_568_1.typewritter.percent = (arg_568_1.time_ - var_571_0) / var_571_10

				arg_568_1.typewritter:SetDirty()
			end

			if arg_568_1.time_ >= var_571_0 + var_571_10 and arg_568_1.time_ < var_571_0 + var_571_10 + arg_571_0 then
				arg_568_1.typewritter.percent = 1

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106136 = function(arg_572_0, arg_572_1)
		arg_572_1.time_ = 0
		arg_572_1.frameCnt_ = 0
		arg_572_1.state_ = "playing"
		arg_572_1.curTalkId_ = 1101106136
		arg_572_1.duration_ = 8.73

		local var_572_0 = {
			zh = 8.733,
			ja = 8.366
		}
		local var_572_1 = manager.audio:GetLocalizationFlag()

		if var_572_0[var_572_1] ~= nil then
			arg_572_1.duration_ = var_572_0[var_572_1]
		end

		SetActive(arg_572_1.tipsGo_, false)

		function arg_572_1.onSingleLineFinish_()
			arg_572_1.onSingleLineUpdate_ = nil
			arg_572_1.onSingleLineFinish_ = nil
			arg_572_1.state_ = "waiting"
		end

		function arg_572_1.playNext_(arg_574_0)
			if arg_574_0 == 1 then
				arg_572_0:Play1101106137(arg_572_1)
			end
		end

		function arg_572_1.onSingleLineUpdate_(arg_575_0)
			local var_575_0 = 0
			local var_575_1 = 0.625

			if var_575_0 < arg_572_1.time_ and arg_572_1.time_ <= var_575_0 + arg_575_0 then
				arg_572_1.talkMaxDuration = 0
				arg_572_1.dialogCg_.alpha = 1

				arg_572_1.dialog_:SetActive(true)
				SetActive(arg_572_1.leftNameGo_, true)

				local var_575_2 = arg_572_1:FormatText(StoryNameCfg[37].name)

				arg_572_1.leftNameTxt_.text = var_575_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_572_1.leftNameTxt_.transform)

				arg_572_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_572_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_572_1:RecordName(arg_572_1.leftNameTxt_.text)
				SetActive(arg_572_1.iconTrs_.gameObject, false)
				arg_572_1.callingController_:SetSelectedState("normal")

				local var_575_3 = arg_572_1:GetWordFromCfg(1101106136)
				local var_575_4 = arg_572_1:FormatText(var_575_3.content)

				arg_572_1.text_.text = var_575_4

				LuaForUtil.ClearLinePrefixSymbol(arg_572_1.text_)

				local var_575_5 = 25
				local var_575_6 = utf8.len(var_575_4)
				local var_575_7 = var_575_5 <= 0 and var_575_1 or var_575_1 * (var_575_6 / var_575_5)

				if var_575_7 > 0 and var_575_1 < var_575_7 then
					arg_572_1.talkMaxDuration = var_575_7

					if var_575_7 + var_575_0 > arg_572_1.duration_ then
						arg_572_1.duration_ = var_575_7 + var_575_0
					end
				end

				arg_572_1.text_.text = var_575_4
				arg_572_1.typewritter.percent = 0

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb") ~= 0 then
					local var_575_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb") / 1000

					if var_575_8 + var_575_0 > arg_572_1.duration_ then
						arg_572_1.duration_ = var_575_8 + var_575_0
					end

					if var_575_3.prefab_name ~= "" and arg_572_1.actors_[var_575_3.prefab_name] ~= nil then
						local var_575_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_572_1.actors_[var_575_3.prefab_name].transform, "story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")

						arg_572_1:RecordAudio("1101106136", var_575_9)
						arg_572_1:RecordAudio("1101106136", var_575_9)
					else
						arg_572_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")
					end

					arg_572_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")
				end

				arg_572_1:RecordContent(arg_572_1.text_.text)
			end

			local var_575_10 = math.max(var_575_1, arg_572_1.talkMaxDuration)

			if var_575_0 <= arg_572_1.time_ and arg_572_1.time_ < var_575_0 + var_575_10 then
				arg_572_1.typewritter.percent = (arg_572_1.time_ - var_575_0) / var_575_10

				arg_572_1.typewritter:SetDirty()
			end

			if arg_572_1.time_ >= var_575_0 + var_575_10 and arg_572_1.time_ < var_575_0 + var_575_10 + arg_575_0 then
				arg_572_1.typewritter.percent = 1

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106137 = function(arg_576_0, arg_576_1)
		arg_576_1.time_ = 0
		arg_576_1.frameCnt_ = 0
		arg_576_1.state_ = "playing"
		arg_576_1.curTalkId_ = 1101106137
		arg_576_1.duration_ = 9

		SetActive(arg_576_1.tipsGo_, false)

		function arg_576_1.onSingleLineFinish_()
			arg_576_1.onSingleLineUpdate_ = nil
			arg_576_1.onSingleLineFinish_ = nil
			arg_576_1.state_ = "waiting"
		end

		function arg_576_1.playNext_(arg_578_0)
			if arg_578_0 == 1 then
				arg_576_0:Play1101106138(arg_576_1)
			end
		end

		function arg_576_1.onSingleLineUpdate_(arg_579_0)
			local var_579_0 = "A00"

			if arg_576_1.bgs_[var_579_0] == nil then
				local var_579_1 = Object.Instantiate(arg_576_1.paintGo_)

				var_579_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_579_0)
				var_579_1.name = var_579_0
				var_579_1.transform.parent = arg_576_1.stage_.transform
				var_579_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_576_1.bgs_[var_579_0] = var_579_1
			end

			local var_579_2 = 2

			if var_579_2 < arg_576_1.time_ and arg_576_1.time_ <= var_579_2 + arg_579_0 then
				local var_579_3 = manager.ui.mainCamera.transform.localPosition
				local var_579_4 = Vector3.New(0, 0, 10) + Vector3.New(var_579_3.x, var_579_3.y, 0)
				local var_579_5 = arg_576_1.bgs_.A00

				var_579_5.transform.localPosition = var_579_4
				var_579_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_579_6 = var_579_5:GetComponent("SpriteRenderer")

				if var_579_6 and var_579_6.sprite then
					local var_579_7 = (var_579_5.transform.localPosition - var_579_3).z
					local var_579_8 = manager.ui.mainCameraCom_
					local var_579_9 = 2 * var_579_7 * Mathf.Tan(var_579_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_579_10 = var_579_9 * var_579_8.aspect
					local var_579_11 = var_579_6.sprite.bounds.size.x
					local var_579_12 = var_579_6.sprite.bounds.size.y
					local var_579_13 = var_579_10 / var_579_11
					local var_579_14 = var_579_9 / var_579_12
					local var_579_15 = var_579_14 < var_579_13 and var_579_13 or var_579_14

					var_579_5.transform.localScale = Vector3.New(var_579_15, var_579_15, 0)
				end

				for iter_579_0, iter_579_1 in pairs(arg_576_1.bgs_) do
					if iter_579_0 ~= "A00" then
						iter_579_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_579_16 = arg_576_1.actors_["1011ui_story"].transform
			local var_579_17 = 2

			if var_579_17 < arg_576_1.time_ and arg_576_1.time_ <= var_579_17 + arg_579_0 then
				arg_576_1.var_.moveOldPos1011ui_story = var_579_16.localPosition
			end

			local var_579_18 = 0.001

			if var_579_17 <= arg_576_1.time_ and arg_576_1.time_ < var_579_17 + var_579_18 then
				local var_579_19 = (arg_576_1.time_ - var_579_17) / var_579_18
				local var_579_20 = Vector3.New(0, -0.71, -6)

				var_579_16.localPosition = Vector3.Lerp(arg_576_1.var_.moveOldPos1011ui_story, var_579_20, var_579_19)

				local var_579_21 = manager.ui.mainCamera.transform.position - var_579_16.position

				var_579_16.forward = Vector3.New(var_579_21.x, var_579_21.y, var_579_21.z)

				local var_579_22 = var_579_16.localEulerAngles

				var_579_22.z = 0
				var_579_22.x = 0
				var_579_16.localEulerAngles = var_579_22
			end

			if arg_576_1.time_ >= var_579_17 + var_579_18 and arg_576_1.time_ < var_579_17 + var_579_18 + arg_579_0 then
				var_579_16.localPosition = Vector3.New(0, -0.71, -6)

				local var_579_23 = manager.ui.mainCamera.transform.position - var_579_16.position

				var_579_16.forward = Vector3.New(var_579_23.x, var_579_23.y, var_579_23.z)

				local var_579_24 = var_579_16.localEulerAngles

				var_579_24.z = 0
				var_579_24.x = 0
				var_579_16.localEulerAngles = var_579_24
			end

			local var_579_25 = arg_576_1.actors_["1011ui_story"]
			local var_579_26 = 2

			if var_579_26 < arg_576_1.time_ and arg_576_1.time_ <= var_579_26 + arg_579_0 and not isNil(var_579_25) and arg_576_1.var_.characterEffect1011ui_story == nil then
				arg_576_1.var_.characterEffect1011ui_story = var_579_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_579_27 = 0.200000002980232

			if var_579_26 <= arg_576_1.time_ and arg_576_1.time_ < var_579_26 + var_579_27 and not isNil(var_579_25) then
				local var_579_28 = (arg_576_1.time_ - var_579_26) / var_579_27

				if arg_576_1.var_.characterEffect1011ui_story and not isNil(var_579_25) then
					arg_576_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_576_1.time_ >= var_579_26 + var_579_27 and arg_576_1.time_ < var_579_26 + var_579_27 + arg_579_0 and not isNil(var_579_25) and arg_576_1.var_.characterEffect1011ui_story then
				arg_576_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_579_29 = 0

			if var_579_29 < arg_576_1.time_ and arg_576_1.time_ <= var_579_29 + arg_579_0 then
				arg_576_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_579_30 = 0

			if var_579_30 < arg_576_1.time_ and arg_576_1.time_ <= var_579_30 + arg_579_0 then
				arg_576_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_579_31 = 0

			if var_579_31 < arg_576_1.time_ and arg_576_1.time_ <= var_579_31 + arg_579_0 then
				arg_576_1.mask_.enabled = true
				arg_576_1.mask_.raycastTarget = true

				arg_576_1:SetGaussion(false)
			end

			local var_579_32 = 2

			if var_579_31 <= arg_576_1.time_ and arg_576_1.time_ < var_579_31 + var_579_32 then
				local var_579_33 = (arg_576_1.time_ - var_579_31) / var_579_32
				local var_579_34 = Color.New(0, 0, 0)

				var_579_34.a = Mathf.Lerp(0, 1, var_579_33)
				arg_576_1.mask_.color = var_579_34
			end

			if arg_576_1.time_ >= var_579_31 + var_579_32 and arg_576_1.time_ < var_579_31 + var_579_32 + arg_579_0 then
				local var_579_35 = Color.New(0, 0, 0)

				var_579_35.a = 1
				arg_576_1.mask_.color = var_579_35
			end

			local var_579_36 = 2

			if var_579_36 < arg_576_1.time_ and arg_576_1.time_ <= var_579_36 + arg_579_0 then
				arg_576_1.mask_.enabled = true
				arg_576_1.mask_.raycastTarget = true

				arg_576_1:SetGaussion(false)
			end

			local var_579_37 = 2

			if var_579_36 <= arg_576_1.time_ and arg_576_1.time_ < var_579_36 + var_579_37 then
				local var_579_38 = (arg_576_1.time_ - var_579_36) / var_579_37
				local var_579_39 = Color.New(0, 0, 0)

				var_579_39.a = Mathf.Lerp(1, 0, var_579_38)
				arg_576_1.mask_.color = var_579_39
			end

			if arg_576_1.time_ >= var_579_36 + var_579_37 and arg_576_1.time_ < var_579_36 + var_579_37 + arg_579_0 then
				local var_579_40 = Color.New(0, 0, 0)
				local var_579_41 = 0

				arg_576_1.mask_.enabled = false
				var_579_40.a = var_579_41
				arg_576_1.mask_.color = var_579_40
			end

			local var_579_42 = 2

			arg_576_1.isInRecall_ = false

			if var_579_42 < arg_576_1.time_ and arg_576_1.time_ <= var_579_42 + arg_579_0 then
				arg_576_1.screenFilterGo_:SetActive(true)

				arg_576_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")

				for iter_579_2, iter_579_3 in pairs(arg_576_1.actors_) do
					local var_579_43 = iter_579_3:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_579_4, iter_579_5 in ipairs(var_579_43) do
						if iter_579_5.color.r > 0.51 then
							iter_579_5.color = Color.New(1, 1, 1)
						else
							iter_579_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_579_44 = 0.034000001847744

			if var_579_42 <= arg_576_1.time_ and arg_576_1.time_ < var_579_42 + var_579_44 then
				local var_579_45 = (arg_576_1.time_ - var_579_42) / var_579_44

				arg_576_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_579_45)
			end

			if arg_576_1.time_ >= var_579_42 + var_579_44 and arg_576_1.time_ < var_579_42 + var_579_44 + arg_579_0 then
				arg_576_1.screenFilterEffect_.weight = 1
			end

			if arg_576_1.frameCnt_ <= 1 then
				arg_576_1.dialog_:SetActive(false)
			end

			local var_579_46 = 4
			local var_579_47 = 0.575

			if var_579_46 < arg_576_1.time_ and arg_576_1.time_ <= var_579_46 + arg_579_0 then
				arg_576_1.talkMaxDuration = 0

				arg_576_1.dialog_:SetActive(true)

				local var_579_48 = LeanTween.value(arg_576_1.dialog_, 0, 1, 0.3)

				var_579_48:setOnUpdate(LuaHelper.FloatAction(function(arg_580_0)
					arg_576_1.dialogCg_.alpha = arg_580_0
				end))
				var_579_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_576_1.dialog_)
					var_579_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_576_1.duration_ = arg_576_1.duration_ + 0.3

				SetActive(arg_576_1.leftNameGo_, false)

				arg_576_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_576_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_576_1:RecordName(arg_576_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_576_1.iconTrs_.gameObject, false)
				arg_576_1.callingController_:SetSelectedState("normal")

				local var_579_49 = arg_576_1:GetWordFromCfg(1101106137)
				local var_579_50 = arg_576_1:FormatText(var_579_49.content)

				arg_576_1.text_.text = var_579_50

				LuaForUtil.ClearLinePrefixSymbol(arg_576_1.text_)

				local var_579_51 = 23
				local var_579_52 = utf8.len(var_579_50)
				local var_579_53 = var_579_51 <= 0 and var_579_47 or var_579_47 * (var_579_52 / var_579_51)

				if var_579_53 > 0 and var_579_47 < var_579_53 then
					arg_576_1.talkMaxDuration = var_579_53
					var_579_46 = var_579_46 + 0.3

					if var_579_53 + var_579_46 > arg_576_1.duration_ then
						arg_576_1.duration_ = var_579_53 + var_579_46
					end
				end

				arg_576_1.text_.text = var_579_50
				arg_576_1.typewritter.percent = 0

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(false)
				arg_576_1:RecordContent(arg_576_1.text_.text)
			end

			local var_579_54 = var_579_46 + 0.3
			local var_579_55 = math.max(var_579_47, arg_576_1.talkMaxDuration)

			if var_579_54 <= arg_576_1.time_ and arg_576_1.time_ < var_579_54 + var_579_55 then
				arg_576_1.typewritter.percent = (arg_576_1.time_ - var_579_54) / var_579_55

				arg_576_1.typewritter:SetDirty()
			end

			if arg_576_1.time_ >= var_579_54 + var_579_55 and arg_576_1.time_ < var_579_54 + var_579_55 + arg_579_0 then
				arg_576_1.typewritter.percent = 1

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106138 = function(arg_582_0, arg_582_1)
		arg_582_1.time_ = 0
		arg_582_1.frameCnt_ = 0
		arg_582_1.state_ = "playing"
		arg_582_1.curTalkId_ = 1101106138
		arg_582_1.duration_ = 9

		SetActive(arg_582_1.tipsGo_, false)

		function arg_582_1.onSingleLineFinish_()
			arg_582_1.onSingleLineUpdate_ = nil
			arg_582_1.onSingleLineFinish_ = nil
			arg_582_1.state_ = "waiting"
		end

		function arg_582_1.playNext_(arg_584_0)
			if arg_584_0 == 1 then
				arg_582_0:Play1101106139(arg_582_1)
			end
		end

		function arg_582_1.onSingleLineUpdate_(arg_585_0)
			local var_585_0 = "ST12"

			if arg_582_1.bgs_[var_585_0] == nil then
				local var_585_1 = Object.Instantiate(arg_582_1.paintGo_)

				var_585_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_585_0)
				var_585_1.name = var_585_0
				var_585_1.transform.parent = arg_582_1.stage_.transform
				var_585_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_582_1.bgs_[var_585_0] = var_585_1
			end

			local var_585_2 = 2

			if var_585_2 < arg_582_1.time_ and arg_582_1.time_ <= var_585_2 + arg_585_0 then
				local var_585_3 = manager.ui.mainCamera.transform.localPosition
				local var_585_4 = Vector3.New(0, 0, 10) + Vector3.New(var_585_3.x, var_585_3.y, 0)
				local var_585_5 = arg_582_1.bgs_.ST12

				var_585_5.transform.localPosition = var_585_4
				var_585_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_585_6 = var_585_5:GetComponent("SpriteRenderer")

				if var_585_6 and var_585_6.sprite then
					local var_585_7 = (var_585_5.transform.localPosition - var_585_3).z
					local var_585_8 = manager.ui.mainCameraCom_
					local var_585_9 = 2 * var_585_7 * Mathf.Tan(var_585_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_585_10 = var_585_9 * var_585_8.aspect
					local var_585_11 = var_585_6.sprite.bounds.size.x
					local var_585_12 = var_585_6.sprite.bounds.size.y
					local var_585_13 = var_585_10 / var_585_11
					local var_585_14 = var_585_9 / var_585_12
					local var_585_15 = var_585_14 < var_585_13 and var_585_13 or var_585_14

					var_585_5.transform.localScale = Vector3.New(var_585_15, var_585_15, 0)
				end

				for iter_585_0, iter_585_1 in pairs(arg_582_1.bgs_) do
					if iter_585_0 ~= "ST12" then
						iter_585_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_585_16 = 0

			if var_585_16 < arg_582_1.time_ and arg_582_1.time_ <= var_585_16 + arg_585_0 then
				arg_582_1.mask_.enabled = true
				arg_582_1.mask_.raycastTarget = true

				arg_582_1:SetGaussion(false)
			end

			local var_585_17 = 2

			if var_585_16 <= arg_582_1.time_ and arg_582_1.time_ < var_585_16 + var_585_17 then
				local var_585_18 = (arg_582_1.time_ - var_585_16) / var_585_17
				local var_585_19 = Color.New(0, 0, 0)

				var_585_19.a = Mathf.Lerp(0, 1, var_585_18)
				arg_582_1.mask_.color = var_585_19
			end

			if arg_582_1.time_ >= var_585_16 + var_585_17 and arg_582_1.time_ < var_585_16 + var_585_17 + arg_585_0 then
				local var_585_20 = Color.New(0, 0, 0)

				var_585_20.a = 1
				arg_582_1.mask_.color = var_585_20
			end

			local var_585_21 = 2

			if var_585_21 < arg_582_1.time_ and arg_582_1.time_ <= var_585_21 + arg_585_0 then
				arg_582_1.mask_.enabled = true
				arg_582_1.mask_.raycastTarget = true

				arg_582_1:SetGaussion(false)
			end

			local var_585_22 = 2

			if var_585_21 <= arg_582_1.time_ and arg_582_1.time_ < var_585_21 + var_585_22 then
				local var_585_23 = (arg_582_1.time_ - var_585_21) / var_585_22
				local var_585_24 = Color.New(0, 0, 0)

				var_585_24.a = Mathf.Lerp(1, 0, var_585_23)
				arg_582_1.mask_.color = var_585_24
			end

			if arg_582_1.time_ >= var_585_21 + var_585_22 and arg_582_1.time_ < var_585_21 + var_585_22 + arg_585_0 then
				local var_585_25 = Color.New(0, 0, 0)
				local var_585_26 = 0

				arg_582_1.mask_.enabled = false
				var_585_25.a = var_585_26
				arg_582_1.mask_.color = var_585_25
			end

			local var_585_27 = arg_582_1.actors_["1011ui_story"].transform
			local var_585_28 = 4

			if var_585_28 < arg_582_1.time_ and arg_582_1.time_ <= var_585_28 + arg_585_0 then
				arg_582_1.var_.moveOldPos1011ui_story = var_585_27.localPosition
			end

			local var_585_29 = 0.001

			if var_585_28 <= arg_582_1.time_ and arg_582_1.time_ < var_585_28 + var_585_29 then
				local var_585_30 = (arg_582_1.time_ - var_585_28) / var_585_29
				local var_585_31 = Vector3.New(0, -0.71, -6)

				var_585_27.localPosition = Vector3.Lerp(arg_582_1.var_.moveOldPos1011ui_story, var_585_31, var_585_30)

				local var_585_32 = manager.ui.mainCamera.transform.position - var_585_27.position

				var_585_27.forward = Vector3.New(var_585_32.x, var_585_32.y, var_585_32.z)

				local var_585_33 = var_585_27.localEulerAngles

				var_585_33.z = 0
				var_585_33.x = 0
				var_585_27.localEulerAngles = var_585_33
			end

			if arg_582_1.time_ >= var_585_28 + var_585_29 and arg_582_1.time_ < var_585_28 + var_585_29 + arg_585_0 then
				var_585_27.localPosition = Vector3.New(0, -0.71, -6)

				local var_585_34 = manager.ui.mainCamera.transform.position - var_585_27.position

				var_585_27.forward = Vector3.New(var_585_34.x, var_585_34.y, var_585_34.z)

				local var_585_35 = var_585_27.localEulerAngles

				var_585_35.z = 0
				var_585_35.x = 0
				var_585_27.localEulerAngles = var_585_35
			end

			local var_585_36 = arg_582_1.actors_["1011ui_story"]
			local var_585_37 = 4

			if var_585_37 < arg_582_1.time_ and arg_582_1.time_ <= var_585_37 + arg_585_0 and not isNil(var_585_36) and arg_582_1.var_.characterEffect1011ui_story == nil then
				arg_582_1.var_.characterEffect1011ui_story = var_585_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_585_38 = 0.200000002980232

			if var_585_37 <= arg_582_1.time_ and arg_582_1.time_ < var_585_37 + var_585_38 and not isNil(var_585_36) then
				local var_585_39 = (arg_582_1.time_ - var_585_37) / var_585_38

				if arg_582_1.var_.characterEffect1011ui_story and not isNil(var_585_36) then
					arg_582_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_582_1.time_ >= var_585_37 + var_585_38 and arg_582_1.time_ < var_585_37 + var_585_38 + arg_585_0 and not isNil(var_585_36) and arg_582_1.var_.characterEffect1011ui_story then
				arg_582_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_585_40 = 2

			if var_585_40 < arg_582_1.time_ and arg_582_1.time_ <= var_585_40 + arg_585_0 then
				arg_582_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_585_41 = 4

			if var_585_41 < arg_582_1.time_ and arg_582_1.time_ <= var_585_41 + arg_585_0 then
				arg_582_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			if arg_582_1.frameCnt_ <= 1 then
				arg_582_1.dialog_:SetActive(false)
			end

			local var_585_42 = 4
			local var_585_43 = 0.325

			if var_585_42 < arg_582_1.time_ and arg_582_1.time_ <= var_585_42 + arg_585_0 then
				arg_582_1.talkMaxDuration = 0

				arg_582_1.dialog_:SetActive(true)

				local var_585_44 = LeanTween.value(arg_582_1.dialog_, 0, 1, 0.3)

				var_585_44:setOnUpdate(LuaHelper.FloatAction(function(arg_586_0)
					arg_582_1.dialogCg_.alpha = arg_586_0
				end))
				var_585_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_582_1.dialog_)
					var_585_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_582_1.duration_ = arg_582_1.duration_ + 0.3

				SetActive(arg_582_1.leftNameGo_, false)

				arg_582_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_582_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_582_1:RecordName(arg_582_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_582_1.iconTrs_.gameObject, false)
				arg_582_1.callingController_:SetSelectedState("normal")

				local var_585_45 = arg_582_1:GetWordFromCfg(1101106138)
				local var_585_46 = arg_582_1:FormatText(var_585_45.content)

				arg_582_1.text_.text = var_585_46

				LuaForUtil.ClearLinePrefixSymbol(arg_582_1.text_)

				local var_585_47 = 13
				local var_585_48 = utf8.len(var_585_46)
				local var_585_49 = var_585_47 <= 0 and var_585_43 or var_585_43 * (var_585_48 / var_585_47)

				if var_585_49 > 0 and var_585_43 < var_585_49 then
					arg_582_1.talkMaxDuration = var_585_49
					var_585_42 = var_585_42 + 0.3

					if var_585_49 + var_585_42 > arg_582_1.duration_ then
						arg_582_1.duration_ = var_585_49 + var_585_42
					end
				end

				arg_582_1.text_.text = var_585_46
				arg_582_1.typewritter.percent = 0

				arg_582_1.typewritter:SetDirty()
				arg_582_1:ShowNextGo(false)
				arg_582_1:RecordContent(arg_582_1.text_.text)
			end

			local var_585_50 = var_585_42 + 0.3
			local var_585_51 = math.max(var_585_43, arg_582_1.talkMaxDuration)

			if var_585_50 <= arg_582_1.time_ and arg_582_1.time_ < var_585_50 + var_585_51 then
				arg_582_1.typewritter.percent = (arg_582_1.time_ - var_585_50) / var_585_51

				arg_582_1.typewritter:SetDirty()
			end

			if arg_582_1.time_ >= var_585_50 + var_585_51 and arg_582_1.time_ < var_585_50 + var_585_51 + arg_585_0 then
				arg_582_1.typewritter.percent = 1

				arg_582_1.typewritter:SetDirty()
				arg_582_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106139 = function(arg_588_0, arg_588_1)
		arg_588_1.time_ = 0
		arg_588_1.frameCnt_ = 0
		arg_588_1.state_ = "playing"
		arg_588_1.curTalkId_ = 1101106139
		arg_588_1.duration_ = 5

		SetActive(arg_588_1.tipsGo_, false)

		function arg_588_1.onSingleLineFinish_()
			arg_588_1.onSingleLineUpdate_ = nil
			arg_588_1.onSingleLineFinish_ = nil
			arg_588_1.state_ = "waiting"

			SetActive(arg_588_1.choicesGo_, true)

			for iter_589_0, iter_589_1 in ipairs(arg_588_1.choices_) do
				local var_589_0 = iter_589_0 <= 1

				SetActive(iter_589_1.go, var_589_0)
			end

			arg_588_1.choices_[1].txt.text = arg_588_1:FormatText(StoryChoiceCfg[622].name)
		end

		function arg_588_1.playNext_(arg_590_0)
			if arg_590_0 == 1 then
				arg_588_0:Play1101106140(arg_588_1)
			end

			arg_588_1:RecordChoiceLog(1101106139, 1101106140)
		end

		function arg_588_1.onSingleLineUpdate_(arg_591_0)
			local var_591_0 = 4

			if var_591_0 < arg_588_1.time_ and arg_588_1.time_ <= var_591_0 + arg_591_0 then
				arg_588_1.allBtn_.enabled = false
			end

			local var_591_1 = 0.5

			if arg_588_1.time_ >= var_591_0 + var_591_1 and arg_588_1.time_ < var_591_0 + var_591_1 + arg_591_0 then
				arg_588_1.allBtn_.enabled = true
			end

			local var_591_2 = 0

			if var_591_2 < arg_588_1.time_ and arg_588_1.time_ <= var_591_2 + arg_591_0 then
				arg_588_1.mask_.enabled = true
				arg_588_1.mask_.raycastTarget = true

				arg_588_1:SetGaussion(false)
			end

			local var_591_3 = 2

			if var_591_2 <= arg_588_1.time_ and arg_588_1.time_ < var_591_2 + var_591_3 then
				local var_591_4 = (arg_588_1.time_ - var_591_2) / var_591_3
				local var_591_5 = Color.New(0, 0, 0)

				var_591_5.a = Mathf.Lerp(0, 1, var_591_4)
				arg_588_1.mask_.color = var_591_5
			end

			if arg_588_1.time_ >= var_591_2 + var_591_3 and arg_588_1.time_ < var_591_2 + var_591_3 + arg_591_0 then
				local var_591_6 = Color.New(0, 0, 0)

				var_591_6.a = 1
				arg_588_1.mask_.color = var_591_6
			end

			local var_591_7 = 2

			if var_591_7 < arg_588_1.time_ and arg_588_1.time_ <= var_591_7 + arg_591_0 then
				arg_588_1.mask_.enabled = true
				arg_588_1.mask_.raycastTarget = true

				arg_588_1:SetGaussion(false)
			end

			local var_591_8 = 2

			if var_591_7 <= arg_588_1.time_ and arg_588_1.time_ < var_591_7 + var_591_8 then
				local var_591_9 = (arg_588_1.time_ - var_591_7) / var_591_8
				local var_591_10 = Color.New(0, 0, 0)

				var_591_10.a = Mathf.Lerp(1, 0, var_591_9)
				arg_588_1.mask_.color = var_591_10
			end

			if arg_588_1.time_ >= var_591_7 + var_591_8 and arg_588_1.time_ < var_591_7 + var_591_8 + arg_591_0 then
				local var_591_11 = Color.New(0, 0, 0)
				local var_591_12 = 0

				arg_588_1.mask_.enabled = false
				var_591_11.a = var_591_12
				arg_588_1.mask_.color = var_591_11
			end

			local var_591_13 = arg_588_1.actors_["1011ui_story"].transform
			local var_591_14 = 2

			if var_591_14 < arg_588_1.time_ and arg_588_1.time_ <= var_591_14 + arg_591_0 then
				arg_588_1.var_.moveOldPos1011ui_story = var_591_13.localPosition
			end

			local var_591_15 = 0.001

			if var_591_14 <= arg_588_1.time_ and arg_588_1.time_ < var_591_14 + var_591_15 then
				local var_591_16 = (arg_588_1.time_ - var_591_14) / var_591_15
				local var_591_17 = Vector3.New(0, 100, 0)

				var_591_13.localPosition = Vector3.Lerp(arg_588_1.var_.moveOldPos1011ui_story, var_591_17, var_591_16)

				local var_591_18 = manager.ui.mainCamera.transform.position - var_591_13.position

				var_591_13.forward = Vector3.New(var_591_18.x, var_591_18.y, var_591_18.z)

				local var_591_19 = var_591_13.localEulerAngles

				var_591_19.z = 0
				var_591_19.x = 0
				var_591_13.localEulerAngles = var_591_19
			end

			if arg_588_1.time_ >= var_591_14 + var_591_15 and arg_588_1.time_ < var_591_14 + var_591_15 + arg_591_0 then
				var_591_13.localPosition = Vector3.New(0, 100, 0)

				local var_591_20 = manager.ui.mainCamera.transform.position - var_591_13.position

				var_591_13.forward = Vector3.New(var_591_20.x, var_591_20.y, var_591_20.z)

				local var_591_21 = var_591_13.localEulerAngles

				var_591_21.z = 0
				var_591_21.x = 0
				var_591_13.localEulerAngles = var_591_21
			end

			local var_591_22 = 2

			arg_588_1.isInRecall_ = false

			if var_591_22 < arg_588_1.time_ and arg_588_1.time_ <= var_591_22 + arg_591_0 then
				arg_588_1.screenFilterGo_:SetActive(false)

				for iter_591_0, iter_591_1 in pairs(arg_588_1.actors_) do
					local var_591_23 = iter_591_1:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_591_2, iter_591_3 in ipairs(var_591_23) do
						if iter_591_3.color.r > 0.51 then
							iter_591_3.color = Color.New(1, 1, 1)
						else
							iter_591_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_591_24 = 0.0166666666666667

			if var_591_22 <= arg_588_1.time_ and arg_588_1.time_ < var_591_22 + var_591_24 then
				local var_591_25 = (arg_588_1.time_ - var_591_22) / var_591_24

				arg_588_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_591_25)
			end

			if arg_588_1.time_ >= var_591_22 + var_591_24 and arg_588_1.time_ < var_591_22 + var_591_24 + arg_591_0 then
				arg_588_1.screenFilterEffect_.weight = 0
			end

			local var_591_26 = arg_588_1.bgs_.R1102a.transform
			local var_591_27 = 2

			if var_591_27 < arg_588_1.time_ and arg_588_1.time_ <= var_591_27 + arg_591_0 then
				arg_588_1.var_.moveOldPosR1102a = var_591_26.localPosition
			end

			local var_591_28 = 0.001

			if var_591_27 <= arg_588_1.time_ and arg_588_1.time_ < var_591_27 + var_591_28 then
				local var_591_29 = (arg_588_1.time_ - var_591_27) / var_591_28
				local var_591_30 = Vector3.New(0.4, -1.1, 2)

				var_591_26.localPosition = Vector3.Lerp(arg_588_1.var_.moveOldPosR1102a, var_591_30, var_591_29)
			end

			if arg_588_1.time_ >= var_591_27 + var_591_28 and arg_588_1.time_ < var_591_27 + var_591_28 + arg_591_0 then
				var_591_26.localPosition = Vector3.New(0.4, -1.1, 2)
			end
		end
	end,
	Play1101106140 = function(arg_592_0, arg_592_1)
		arg_592_1.time_ = 0
		arg_592_1.frameCnt_ = 0
		arg_592_1.state_ = "playing"
		arg_592_1.curTalkId_ = 1101106140
		arg_592_1.duration_ = 4.43

		local var_592_0 = {
			zh = 3.433,
			ja = 4.433
		}
		local var_592_1 = manager.audio:GetLocalizationFlag()

		if var_592_0[var_592_1] ~= nil then
			arg_592_1.duration_ = var_592_0[var_592_1]
		end

		SetActive(arg_592_1.tipsGo_, false)

		function arg_592_1.onSingleLineFinish_()
			arg_592_1.onSingleLineUpdate_ = nil
			arg_592_1.onSingleLineFinish_ = nil
			arg_592_1.state_ = "waiting"
		end

		function arg_592_1.playNext_(arg_594_0)
			if arg_594_0 == 1 then
				arg_592_0:Play1101106141(arg_592_1)
			end
		end

		function arg_592_1.onSingleLineUpdate_(arg_595_0)
			local var_595_0 = 0
			local var_595_1 = 0.175

			if var_595_0 < arg_592_1.time_ and arg_592_1.time_ <= var_595_0 + arg_595_0 then
				arg_592_1.talkMaxDuration = 0
				arg_592_1.dialogCg_.alpha = 1

				arg_592_1.dialog_:SetActive(true)
				SetActive(arg_592_1.leftNameGo_, true)

				local var_595_2 = arg_592_1:FormatText(StoryNameCfg[37].name)

				arg_592_1.leftNameTxt_.text = var_595_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_592_1.leftNameTxt_.transform)

				arg_592_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_592_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_592_1:RecordName(arg_592_1.leftNameTxt_.text)
				SetActive(arg_592_1.iconTrs_.gameObject, false)
				arg_592_1.callingController_:SetSelectedState("normal")

				local var_595_3 = arg_592_1:GetWordFromCfg(1101106140)
				local var_595_4 = arg_592_1:FormatText(var_595_3.content)

				arg_592_1.text_.text = var_595_4

				LuaForUtil.ClearLinePrefixSymbol(arg_592_1.text_)

				local var_595_5 = 7
				local var_595_6 = utf8.len(var_595_4)
				local var_595_7 = var_595_5 <= 0 and var_595_1 or var_595_1 * (var_595_6 / var_595_5)

				if var_595_7 > 0 and var_595_1 < var_595_7 then
					arg_592_1.talkMaxDuration = var_595_7

					if var_595_7 + var_595_0 > arg_592_1.duration_ then
						arg_592_1.duration_ = var_595_7 + var_595_0
					end
				end

				arg_592_1.text_.text = var_595_4
				arg_592_1.typewritter.percent = 0

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb") ~= 0 then
					local var_595_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb") / 1000

					if var_595_8 + var_595_0 > arg_592_1.duration_ then
						arg_592_1.duration_ = var_595_8 + var_595_0
					end

					if var_595_3.prefab_name ~= "" and arg_592_1.actors_[var_595_3.prefab_name] ~= nil then
						local var_595_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_592_1.actors_[var_595_3.prefab_name].transform, "story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")

						arg_592_1:RecordAudio("1101106140", var_595_9)
						arg_592_1:RecordAudio("1101106140", var_595_9)
					else
						arg_592_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")
					end

					arg_592_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")
				end

				arg_592_1:RecordContent(arg_592_1.text_.text)
			end

			local var_595_10 = math.max(var_595_1, arg_592_1.talkMaxDuration)

			if var_595_0 <= arg_592_1.time_ and arg_592_1.time_ < var_595_0 + var_595_10 then
				arg_592_1.typewritter.percent = (arg_592_1.time_ - var_595_0) / var_595_10

				arg_592_1.typewritter:SetDirty()
			end

			if arg_592_1.time_ >= var_595_0 + var_595_10 and arg_592_1.time_ < var_595_0 + var_595_10 + arg_595_0 then
				arg_592_1.typewritter.percent = 1

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106141 = function(arg_596_0, arg_596_1)
		arg_596_1.time_ = 0
		arg_596_1.frameCnt_ = 0
		arg_596_1.state_ = "playing"
		arg_596_1.curTalkId_ = 1101106141
		arg_596_1.duration_ = 5

		SetActive(arg_596_1.tipsGo_, false)

		function arg_596_1.onSingleLineFinish_()
			arg_596_1.onSingleLineUpdate_ = nil
			arg_596_1.onSingleLineFinish_ = nil
			arg_596_1.state_ = "waiting"
		end

		function arg_596_1.playNext_(arg_598_0)
			if arg_598_0 == 1 then
				arg_596_0:Play1101106142(arg_596_1)
			end
		end

		function arg_596_1.onSingleLineUpdate_(arg_599_0)
			local var_599_0 = 0
			local var_599_1 = 0.05

			if var_599_0 < arg_596_1.time_ and arg_596_1.time_ <= var_599_0 + arg_599_0 then
				arg_596_1.talkMaxDuration = 0
				arg_596_1.dialogCg_.alpha = 1

				arg_596_1.dialog_:SetActive(true)
				SetActive(arg_596_1.leftNameGo_, false)

				arg_596_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_596_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_596_1:RecordName(arg_596_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_596_1.iconTrs_.gameObject, false)
				arg_596_1.callingController_:SetSelectedState("normal")

				local var_599_2 = arg_596_1:GetWordFromCfg(1101106141)
				local var_599_3 = arg_596_1:FormatText(var_599_2.content)

				arg_596_1.text_.text = var_599_3

				LuaForUtil.ClearLinePrefixSymbol(arg_596_1.text_)

				local var_599_4 = 2
				local var_599_5 = utf8.len(var_599_3)
				local var_599_6 = var_599_4 <= 0 and var_599_1 or var_599_1 * (var_599_5 / var_599_4)

				if var_599_6 > 0 and var_599_1 < var_599_6 then
					arg_596_1.talkMaxDuration = var_599_6

					if var_599_6 + var_599_0 > arg_596_1.duration_ then
						arg_596_1.duration_ = var_599_6 + var_599_0
					end
				end

				arg_596_1.text_.text = var_599_3
				arg_596_1.typewritter.percent = 0

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(false)
				arg_596_1:RecordContent(arg_596_1.text_.text)
			end

			local var_599_7 = math.max(var_599_1, arg_596_1.talkMaxDuration)

			if var_599_0 <= arg_596_1.time_ and arg_596_1.time_ < var_599_0 + var_599_7 then
				arg_596_1.typewritter.percent = (arg_596_1.time_ - var_599_0) / var_599_7

				arg_596_1.typewritter:SetDirty()
			end

			if arg_596_1.time_ >= var_599_0 + var_599_7 and arg_596_1.time_ < var_599_0 + var_599_7 + arg_599_0 then
				arg_596_1.typewritter.percent = 1

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106142 = function(arg_600_0, arg_600_1)
		arg_600_1.time_ = 0
		arg_600_1.frameCnt_ = 0
		arg_600_1.state_ = "playing"
		arg_600_1.curTalkId_ = 1101106142
		arg_600_1.duration_ = 5

		SetActive(arg_600_1.tipsGo_, false)

		function arg_600_1.onSingleLineFinish_()
			arg_600_1.onSingleLineUpdate_ = nil
			arg_600_1.onSingleLineFinish_ = nil
			arg_600_1.state_ = "waiting"
		end

		function arg_600_1.playNext_(arg_602_0)
			if arg_602_0 == 1 then
				arg_600_0:Play1101106143(arg_600_1)
			end
		end

		function arg_600_1.onSingleLineUpdate_(arg_603_0)
			local var_603_0 = 0
			local var_603_1 = 0.675

			if var_603_0 < arg_600_1.time_ and arg_600_1.time_ <= var_603_0 + arg_603_0 then
				arg_600_1.talkMaxDuration = 0
				arg_600_1.dialogCg_.alpha = 1

				arg_600_1.dialog_:SetActive(true)
				SetActive(arg_600_1.leftNameGo_, false)

				arg_600_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_600_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_600_1:RecordName(arg_600_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_600_1.iconTrs_.gameObject, false)
				arg_600_1.callingController_:SetSelectedState("normal")

				local var_603_2 = arg_600_1:GetWordFromCfg(1101106142)
				local var_603_3 = arg_600_1:FormatText(var_603_2.content)

				arg_600_1.text_.text = var_603_3

				LuaForUtil.ClearLinePrefixSymbol(arg_600_1.text_)

				local var_603_4 = 27
				local var_603_5 = utf8.len(var_603_3)
				local var_603_6 = var_603_4 <= 0 and var_603_1 or var_603_1 * (var_603_5 / var_603_4)

				if var_603_6 > 0 and var_603_1 < var_603_6 then
					arg_600_1.talkMaxDuration = var_603_6

					if var_603_6 + var_603_0 > arg_600_1.duration_ then
						arg_600_1.duration_ = var_603_6 + var_603_0
					end
				end

				arg_600_1.text_.text = var_603_3
				arg_600_1.typewritter.percent = 0

				arg_600_1.typewritter:SetDirty()
				arg_600_1:ShowNextGo(false)
				arg_600_1:RecordContent(arg_600_1.text_.text)
			end

			local var_603_7 = math.max(var_603_1, arg_600_1.talkMaxDuration)

			if var_603_0 <= arg_600_1.time_ and arg_600_1.time_ < var_603_0 + var_603_7 then
				arg_600_1.typewritter.percent = (arg_600_1.time_ - var_603_0) / var_603_7

				arg_600_1.typewritter:SetDirty()
			end

			if arg_600_1.time_ >= var_603_0 + var_603_7 and arg_600_1.time_ < var_603_0 + var_603_7 + arg_603_0 then
				arg_600_1.typewritter.percent = 1

				arg_600_1.typewritter:SetDirty()
				arg_600_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106143 = function(arg_604_0, arg_604_1)
		arg_604_1.time_ = 0
		arg_604_1.frameCnt_ = 0
		arg_604_1.state_ = "playing"
		arg_604_1.curTalkId_ = 1101106143
		arg_604_1.duration_ = 5

		SetActive(arg_604_1.tipsGo_, false)

		function arg_604_1.onSingleLineFinish_()
			arg_604_1.onSingleLineUpdate_ = nil
			arg_604_1.onSingleLineFinish_ = nil
			arg_604_1.state_ = "waiting"
		end

		function arg_604_1.playNext_(arg_606_0)
			if arg_606_0 == 1 then
				arg_604_0:Play1101106144(arg_604_1)
			end
		end

		function arg_604_1.onSingleLineUpdate_(arg_607_0)
			local var_607_0 = 0
			local var_607_1 = 0.925

			if var_607_0 < arg_604_1.time_ and arg_604_1.time_ <= var_607_0 + arg_607_0 then
				arg_604_1.talkMaxDuration = 0
				arg_604_1.dialogCg_.alpha = 1

				arg_604_1.dialog_:SetActive(true)
				SetActive(arg_604_1.leftNameGo_, true)

				local var_607_2 = arg_604_1:FormatText(StoryNameCfg[7].name)

				arg_604_1.leftNameTxt_.text = var_607_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_604_1.leftNameTxt_.transform)

				arg_604_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_604_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_604_1:RecordName(arg_604_1.leftNameTxt_.text)
				SetActive(arg_604_1.iconTrs_.gameObject, false)
				arg_604_1.callingController_:SetSelectedState("normal")

				local var_607_3 = arg_604_1:GetWordFromCfg(1101106143)
				local var_607_4 = arg_604_1:FormatText(var_607_3.content)

				arg_604_1.text_.text = var_607_4

				LuaForUtil.ClearLinePrefixSymbol(arg_604_1.text_)

				local var_607_5 = 37
				local var_607_6 = utf8.len(var_607_4)
				local var_607_7 = var_607_5 <= 0 and var_607_1 or var_607_1 * (var_607_6 / var_607_5)

				if var_607_7 > 0 and var_607_1 < var_607_7 then
					arg_604_1.talkMaxDuration = var_607_7

					if var_607_7 + var_607_0 > arg_604_1.duration_ then
						arg_604_1.duration_ = var_607_7 + var_607_0
					end
				end

				arg_604_1.text_.text = var_607_4
				arg_604_1.typewritter.percent = 0

				arg_604_1.typewritter:SetDirty()
				arg_604_1:ShowNextGo(false)
				arg_604_1:RecordContent(arg_604_1.text_.text)
			end

			local var_607_8 = math.max(var_607_1, arg_604_1.talkMaxDuration)

			if var_607_0 <= arg_604_1.time_ and arg_604_1.time_ < var_607_0 + var_607_8 then
				arg_604_1.typewritter.percent = (arg_604_1.time_ - var_607_0) / var_607_8

				arg_604_1.typewritter:SetDirty()
			end

			if arg_604_1.time_ >= var_607_0 + var_607_8 and arg_604_1.time_ < var_607_0 + var_607_8 + arg_607_0 then
				arg_604_1.typewritter.percent = 1

				arg_604_1.typewritter:SetDirty()
				arg_604_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106144 = function(arg_608_0, arg_608_1)
		arg_608_1.time_ = 0
		arg_608_1.frameCnt_ = 0
		arg_608_1.state_ = "playing"
		arg_608_1.curTalkId_ = 1101106144
		arg_608_1.duration_ = 5

		SetActive(arg_608_1.tipsGo_, false)

		function arg_608_1.onSingleLineFinish_()
			arg_608_1.onSingleLineUpdate_ = nil
			arg_608_1.onSingleLineFinish_ = nil
			arg_608_1.state_ = "waiting"
		end

		function arg_608_1.playNext_(arg_610_0)
			if arg_610_0 == 1 then
				arg_608_0:Play1101106145(arg_608_1)
			end
		end

		function arg_608_1.onSingleLineUpdate_(arg_611_0)
			local var_611_0 = 0
			local var_611_1 = 0.675

			if var_611_0 < arg_608_1.time_ and arg_608_1.time_ <= var_611_0 + arg_611_0 then
				arg_608_1.talkMaxDuration = 0
				arg_608_1.dialogCg_.alpha = 1

				arg_608_1.dialog_:SetActive(true)
				SetActive(arg_608_1.leftNameGo_, false)

				arg_608_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_608_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_608_1:RecordName(arg_608_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_608_1.iconTrs_.gameObject, false)
				arg_608_1.callingController_:SetSelectedState("normal")

				local var_611_2 = arg_608_1:GetWordFromCfg(1101106144)
				local var_611_3 = arg_608_1:FormatText(var_611_2.content)

				arg_608_1.text_.text = var_611_3

				LuaForUtil.ClearLinePrefixSymbol(arg_608_1.text_)

				local var_611_4 = 27
				local var_611_5 = utf8.len(var_611_3)
				local var_611_6 = var_611_4 <= 0 and var_611_1 or var_611_1 * (var_611_5 / var_611_4)

				if var_611_6 > 0 and var_611_1 < var_611_6 then
					arg_608_1.talkMaxDuration = var_611_6

					if var_611_6 + var_611_0 > arg_608_1.duration_ then
						arg_608_1.duration_ = var_611_6 + var_611_0
					end
				end

				arg_608_1.text_.text = var_611_3
				arg_608_1.typewritter.percent = 0

				arg_608_1.typewritter:SetDirty()
				arg_608_1:ShowNextGo(false)
				arg_608_1:RecordContent(arg_608_1.text_.text)
			end

			local var_611_7 = math.max(var_611_1, arg_608_1.talkMaxDuration)

			if var_611_0 <= arg_608_1.time_ and arg_608_1.time_ < var_611_0 + var_611_7 then
				arg_608_1.typewritter.percent = (arg_608_1.time_ - var_611_0) / var_611_7

				arg_608_1.typewritter:SetDirty()
			end

			if arg_608_1.time_ >= var_611_0 + var_611_7 and arg_608_1.time_ < var_611_0 + var_611_7 + arg_611_0 then
				arg_608_1.typewritter.percent = 1

				arg_608_1.typewritter:SetDirty()
				arg_608_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106145 = function(arg_612_0, arg_612_1)
		arg_612_1.time_ = 0
		arg_612_1.frameCnt_ = 0
		arg_612_1.state_ = "playing"
		arg_612_1.curTalkId_ = 1101106145
		arg_612_1.duration_ = 5

		SetActive(arg_612_1.tipsGo_, false)

		function arg_612_1.onSingleLineFinish_()
			arg_612_1.onSingleLineUpdate_ = nil
			arg_612_1.onSingleLineFinish_ = nil
			arg_612_1.state_ = "waiting"
		end

		function arg_612_1.playNext_(arg_614_0)
			if arg_614_0 == 1 then
				arg_612_0:Play1101106146(arg_612_1)
			end
		end

		function arg_612_1.onSingleLineUpdate_(arg_615_0)
			local var_615_0 = 0
			local var_615_1 = 0.05

			if var_615_0 < arg_612_1.time_ and arg_612_1.time_ <= var_615_0 + arg_615_0 then
				arg_612_1.talkMaxDuration = 0
				arg_612_1.dialogCg_.alpha = 1

				arg_612_1.dialog_:SetActive(true)
				SetActive(arg_612_1.leftNameGo_, false)

				arg_612_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_612_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_612_1:RecordName(arg_612_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_612_1.iconTrs_.gameObject, false)
				arg_612_1.callingController_:SetSelectedState("normal")

				local var_615_2 = arg_612_1:GetWordFromCfg(1101106145)
				local var_615_3 = arg_612_1:FormatText(var_615_2.content)

				arg_612_1.text_.text = var_615_3

				LuaForUtil.ClearLinePrefixSymbol(arg_612_1.text_)

				local var_615_4 = 2
				local var_615_5 = utf8.len(var_615_3)
				local var_615_6 = var_615_4 <= 0 and var_615_1 or var_615_1 * (var_615_5 / var_615_4)

				if var_615_6 > 0 and var_615_1 < var_615_6 then
					arg_612_1.talkMaxDuration = var_615_6

					if var_615_6 + var_615_0 > arg_612_1.duration_ then
						arg_612_1.duration_ = var_615_6 + var_615_0
					end
				end

				arg_612_1.text_.text = var_615_3
				arg_612_1.typewritter.percent = 0

				arg_612_1.typewritter:SetDirty()
				arg_612_1:ShowNextGo(false)
				arg_612_1:RecordContent(arg_612_1.text_.text)
			end

			local var_615_7 = math.max(var_615_1, arg_612_1.talkMaxDuration)

			if var_615_0 <= arg_612_1.time_ and arg_612_1.time_ < var_615_0 + var_615_7 then
				arg_612_1.typewritter.percent = (arg_612_1.time_ - var_615_0) / var_615_7

				arg_612_1.typewritter:SetDirty()
			end

			if arg_612_1.time_ >= var_615_0 + var_615_7 and arg_612_1.time_ < var_615_0 + var_615_7 + arg_615_0 then
				arg_612_1.typewritter.percent = 1

				arg_612_1.typewritter:SetDirty()
				arg_612_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106146 = function(arg_616_0, arg_616_1)
		arg_616_1.time_ = 0
		arg_616_1.frameCnt_ = 0
		arg_616_1.state_ = "playing"
		arg_616_1.curTalkId_ = 1101106146
		arg_616_1.duration_ = 5

		SetActive(arg_616_1.tipsGo_, false)

		function arg_616_1.onSingleLineFinish_()
			arg_616_1.onSingleLineUpdate_ = nil
			arg_616_1.onSingleLineFinish_ = nil
			arg_616_1.state_ = "waiting"
		end

		function arg_616_1.playNext_(arg_618_0)
			if arg_618_0 == 1 then
				arg_616_0:Play1101106147(arg_616_1)
			end
		end

		function arg_616_1.onSingleLineUpdate_(arg_619_0)
			local var_619_0 = 0
			local var_619_1 = 0.55

			if var_619_0 < arg_616_1.time_ and arg_616_1.time_ <= var_619_0 + arg_619_0 then
				arg_616_1.talkMaxDuration = 0
				arg_616_1.dialogCg_.alpha = 1

				arg_616_1.dialog_:SetActive(true)
				SetActive(arg_616_1.leftNameGo_, false)

				arg_616_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_616_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_616_1:RecordName(arg_616_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_616_1.iconTrs_.gameObject, false)
				arg_616_1.callingController_:SetSelectedState("normal")

				local var_619_2 = arg_616_1:GetWordFromCfg(1101106146)
				local var_619_3 = arg_616_1:FormatText(var_619_2.content)

				arg_616_1.text_.text = var_619_3

				LuaForUtil.ClearLinePrefixSymbol(arg_616_1.text_)

				local var_619_4 = 22
				local var_619_5 = utf8.len(var_619_3)
				local var_619_6 = var_619_4 <= 0 and var_619_1 or var_619_1 * (var_619_5 / var_619_4)

				if var_619_6 > 0 and var_619_1 < var_619_6 then
					arg_616_1.talkMaxDuration = var_619_6

					if var_619_6 + var_619_0 > arg_616_1.duration_ then
						arg_616_1.duration_ = var_619_6 + var_619_0
					end
				end

				arg_616_1.text_.text = var_619_3
				arg_616_1.typewritter.percent = 0

				arg_616_1.typewritter:SetDirty()
				arg_616_1:ShowNextGo(false)
				arg_616_1:RecordContent(arg_616_1.text_.text)
			end

			local var_619_7 = math.max(var_619_1, arg_616_1.talkMaxDuration)

			if var_619_0 <= arg_616_1.time_ and arg_616_1.time_ < var_619_0 + var_619_7 then
				arg_616_1.typewritter.percent = (arg_616_1.time_ - var_619_0) / var_619_7

				arg_616_1.typewritter:SetDirty()
			end

			if arg_616_1.time_ >= var_619_0 + var_619_7 and arg_616_1.time_ < var_619_0 + var_619_7 + arg_619_0 then
				arg_616_1.typewritter.percent = 1

				arg_616_1.typewritter:SetDirty()
				arg_616_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106147 = function(arg_620_0, arg_620_1)
		arg_620_1.time_ = 0
		arg_620_1.frameCnt_ = 0
		arg_620_1.state_ = "playing"
		arg_620_1.curTalkId_ = 1101106147
		arg_620_1.duration_ = 2.93

		local var_620_0 = {
			zh = 2.933,
			ja = 1.9
		}
		local var_620_1 = manager.audio:GetLocalizationFlag()

		if var_620_0[var_620_1] ~= nil then
			arg_620_1.duration_ = var_620_0[var_620_1]
		end

		SetActive(arg_620_1.tipsGo_, false)

		function arg_620_1.onSingleLineFinish_()
			arg_620_1.onSingleLineUpdate_ = nil
			arg_620_1.onSingleLineFinish_ = nil
			arg_620_1.state_ = "waiting"
		end

		function arg_620_1.playNext_(arg_622_0)
			if arg_622_0 == 1 then
				arg_620_0:Play1101106148(arg_620_1)
			end
		end

		function arg_620_1.onSingleLineUpdate_(arg_623_0)
			local var_623_0 = 0
			local var_623_1 = 0.35

			if var_623_0 < arg_620_1.time_ and arg_620_1.time_ <= var_623_0 + arg_623_0 then
				arg_620_1.talkMaxDuration = 0

				arg_620_1.dialog_:SetActive(true)

				local var_623_2 = LeanTween.value(arg_620_1.dialog_, 0, 1, 0.3)

				var_623_2:setOnUpdate(LuaHelper.FloatAction(function(arg_624_0)
					arg_620_1.dialogCg_.alpha = arg_624_0
				end))
				var_623_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_620_1.dialog_)
					var_623_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_620_1.duration_ = arg_620_1.duration_ + 0.3

				SetActive(arg_620_1.leftNameGo_, true)

				local var_623_3 = arg_620_1:FormatText(StoryNameCfg[37].name)

				arg_620_1.leftNameTxt_.text = var_623_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_620_1.leftNameTxt_.transform)

				arg_620_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_620_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_620_1:RecordName(arg_620_1.leftNameTxt_.text)
				SetActive(arg_620_1.iconTrs_.gameObject, false)
				arg_620_1.callingController_:SetSelectedState("normal")

				local var_623_4 = arg_620_1:GetWordFromCfg(1101106147)
				local var_623_5 = arg_620_1:FormatText(var_623_4.content)

				arg_620_1.text_.text = var_623_5

				LuaForUtil.ClearLinePrefixSymbol(arg_620_1.text_)

				local var_623_6 = 14
				local var_623_7 = utf8.len(var_623_5)
				local var_623_8 = var_623_6 <= 0 and var_623_1 or var_623_1 * (var_623_7 / var_623_6)

				if var_623_8 > 0 and var_623_1 < var_623_8 then
					arg_620_1.talkMaxDuration = var_623_8
					var_623_0 = var_623_0 + 0.3

					if var_623_8 + var_623_0 > arg_620_1.duration_ then
						arg_620_1.duration_ = var_623_8 + var_623_0
					end
				end

				arg_620_1.text_.text = var_623_5
				arg_620_1.typewritter.percent = 0

				arg_620_1.typewritter:SetDirty()
				arg_620_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb") ~= 0 then
					local var_623_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb") / 1000

					if var_623_9 + var_623_0 > arg_620_1.duration_ then
						arg_620_1.duration_ = var_623_9 + var_623_0
					end

					if var_623_4.prefab_name ~= "" and arg_620_1.actors_[var_623_4.prefab_name] ~= nil then
						local var_623_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_620_1.actors_[var_623_4.prefab_name].transform, "story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")

						arg_620_1:RecordAudio("1101106147", var_623_10)
						arg_620_1:RecordAudio("1101106147", var_623_10)
					else
						arg_620_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")
					end

					arg_620_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")
				end

				arg_620_1:RecordContent(arg_620_1.text_.text)
			end

			local var_623_11 = var_623_0 + 0.3
			local var_623_12 = math.max(var_623_1, arg_620_1.talkMaxDuration)

			if var_623_11 <= arg_620_1.time_ and arg_620_1.time_ < var_623_11 + var_623_12 then
				arg_620_1.typewritter.percent = (arg_620_1.time_ - var_623_11) / var_623_12

				arg_620_1.typewritter:SetDirty()
			end

			if arg_620_1.time_ >= var_623_11 + var_623_12 and arg_620_1.time_ < var_623_11 + var_623_12 + arg_623_0 then
				arg_620_1.typewritter.percent = 1

				arg_620_1.typewritter:SetDirty()
				arg_620_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106148 = function(arg_626_0, arg_626_1)
		arg_626_1.time_ = 0
		arg_626_1.frameCnt_ = 0
		arg_626_1.state_ = "playing"
		arg_626_1.curTalkId_ = 1101106148
		arg_626_1.duration_ = 5

		SetActive(arg_626_1.tipsGo_, false)

		function arg_626_1.onSingleLineFinish_()
			arg_626_1.onSingleLineUpdate_ = nil
			arg_626_1.onSingleLineFinish_ = nil
			arg_626_1.state_ = "waiting"
		end

		function arg_626_1.playNext_(arg_628_0)
			if arg_628_0 == 1 then
				arg_626_0:Play1101106149(arg_626_1)
			end
		end

		function arg_626_1.onSingleLineUpdate_(arg_629_0)
			local var_629_0 = 0
			local var_629_1 = 0.15

			if var_629_0 < arg_626_1.time_ and arg_626_1.time_ <= var_629_0 + arg_629_0 then
				arg_626_1.talkMaxDuration = 0
				arg_626_1.dialogCg_.alpha = 1

				arg_626_1.dialog_:SetActive(true)
				SetActive(arg_626_1.leftNameGo_, false)

				arg_626_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_626_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_626_1:RecordName(arg_626_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_626_1.iconTrs_.gameObject, false)
				arg_626_1.callingController_:SetSelectedState("normal")

				local var_629_2 = arg_626_1:GetWordFromCfg(1101106148)
				local var_629_3 = arg_626_1:FormatText(var_629_2.content)

				arg_626_1.text_.text = var_629_3

				LuaForUtil.ClearLinePrefixSymbol(arg_626_1.text_)

				local var_629_4 = 9
				local var_629_5 = utf8.len(var_629_3)
				local var_629_6 = var_629_4 <= 0 and var_629_1 or var_629_1 * (var_629_5 / var_629_4)

				if var_629_6 > 0 and var_629_1 < var_629_6 then
					arg_626_1.talkMaxDuration = var_629_6

					if var_629_6 + var_629_0 > arg_626_1.duration_ then
						arg_626_1.duration_ = var_629_6 + var_629_0
					end
				end

				arg_626_1.text_.text = var_629_3
				arg_626_1.typewritter.percent = 0

				arg_626_1.typewritter:SetDirty()
				arg_626_1:ShowNextGo(false)
				arg_626_1:RecordContent(arg_626_1.text_.text)
			end

			local var_629_7 = math.max(var_629_1, arg_626_1.talkMaxDuration)

			if var_629_0 <= arg_626_1.time_ and arg_626_1.time_ < var_629_0 + var_629_7 then
				arg_626_1.typewritter.percent = (arg_626_1.time_ - var_629_0) / var_629_7

				arg_626_1.typewritter:SetDirty()
			end

			if arg_626_1.time_ >= var_629_0 + var_629_7 and arg_626_1.time_ < var_629_0 + var_629_7 + arg_629_0 then
				arg_626_1.typewritter.percent = 1

				arg_626_1.typewritter:SetDirty()
				arg_626_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106149 = function(arg_630_0, arg_630_1)
		arg_630_1.time_ = 0
		arg_630_1.frameCnt_ = 0
		arg_630_1.state_ = "playing"
		arg_630_1.curTalkId_ = 1101106149
		arg_630_1.duration_ = 3.4

		local var_630_0 = {
			zh = 3.4,
			ja = 2.5
		}
		local var_630_1 = manager.audio:GetLocalizationFlag()

		if var_630_0[var_630_1] ~= nil then
			arg_630_1.duration_ = var_630_0[var_630_1]
		end

		SetActive(arg_630_1.tipsGo_, false)

		function arg_630_1.onSingleLineFinish_()
			arg_630_1.onSingleLineUpdate_ = nil
			arg_630_1.onSingleLineFinish_ = nil
			arg_630_1.state_ = "waiting"
		end

		function arg_630_1.playNext_(arg_632_0)
			if arg_632_0 == 1 then
				arg_630_0:Play1101106150(arg_630_1)
			end
		end

		function arg_630_1.onSingleLineUpdate_(arg_633_0)
			local var_633_0 = 0
			local var_633_1 = 0.325

			if var_633_0 < arg_630_1.time_ and arg_630_1.time_ <= var_633_0 + arg_633_0 then
				arg_630_1.talkMaxDuration = 0
				arg_630_1.dialogCg_.alpha = 1

				arg_630_1.dialog_:SetActive(true)
				SetActive(arg_630_1.leftNameGo_, true)

				local var_633_2 = arg_630_1:FormatText(StoryNameCfg[37].name)

				arg_630_1.leftNameTxt_.text = var_633_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_630_1.leftNameTxt_.transform)

				arg_630_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_630_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_630_1:RecordName(arg_630_1.leftNameTxt_.text)
				SetActive(arg_630_1.iconTrs_.gameObject, false)
				arg_630_1.callingController_:SetSelectedState("normal")

				local var_633_3 = arg_630_1:GetWordFromCfg(1101106149)
				local var_633_4 = arg_630_1:FormatText(var_633_3.content)

				arg_630_1.text_.text = var_633_4

				LuaForUtil.ClearLinePrefixSymbol(arg_630_1.text_)

				local var_633_5 = 13
				local var_633_6 = utf8.len(var_633_4)
				local var_633_7 = var_633_5 <= 0 and var_633_1 or var_633_1 * (var_633_6 / var_633_5)

				if var_633_7 > 0 and var_633_1 < var_633_7 then
					arg_630_1.talkMaxDuration = var_633_7

					if var_633_7 + var_633_0 > arg_630_1.duration_ then
						arg_630_1.duration_ = var_633_7 + var_633_0
					end
				end

				arg_630_1.text_.text = var_633_4
				arg_630_1.typewritter.percent = 0

				arg_630_1.typewritter:SetDirty()
				arg_630_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb") ~= 0 then
					local var_633_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb") / 1000

					if var_633_8 + var_633_0 > arg_630_1.duration_ then
						arg_630_1.duration_ = var_633_8 + var_633_0
					end

					if var_633_3.prefab_name ~= "" and arg_630_1.actors_[var_633_3.prefab_name] ~= nil then
						local var_633_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_630_1.actors_[var_633_3.prefab_name].transform, "story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")

						arg_630_1:RecordAudio("1101106149", var_633_9)
						arg_630_1:RecordAudio("1101106149", var_633_9)
					else
						arg_630_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")
					end

					arg_630_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")
				end

				arg_630_1:RecordContent(arg_630_1.text_.text)
			end

			local var_633_10 = math.max(var_633_1, arg_630_1.talkMaxDuration)

			if var_633_0 <= arg_630_1.time_ and arg_630_1.time_ < var_633_0 + var_633_10 then
				arg_630_1.typewritter.percent = (arg_630_1.time_ - var_633_0) / var_633_10

				arg_630_1.typewritter:SetDirty()
			end

			if arg_630_1.time_ >= var_633_0 + var_633_10 and arg_630_1.time_ < var_633_0 + var_633_10 + arg_633_0 then
				arg_630_1.typewritter.percent = 1

				arg_630_1.typewritter:SetDirty()
				arg_630_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106150 = function(arg_634_0, arg_634_1)
		arg_634_1.time_ = 0
		arg_634_1.frameCnt_ = 0
		arg_634_1.state_ = "playing"
		arg_634_1.curTalkId_ = 1101106150
		arg_634_1.duration_ = 5

		SetActive(arg_634_1.tipsGo_, false)

		function arg_634_1.onSingleLineFinish_()
			arg_634_1.onSingleLineUpdate_ = nil
			arg_634_1.onSingleLineFinish_ = nil
			arg_634_1.state_ = "waiting"
		end

		function arg_634_1.playNext_(arg_636_0)
			if arg_636_0 == 1 then
				arg_634_0:Play1101106151(arg_634_1)
			end
		end

		function arg_634_1.onSingleLineUpdate_(arg_637_0)
			local var_637_0 = 0
			local var_637_1 = 0.225

			if var_637_0 < arg_634_1.time_ and arg_634_1.time_ <= var_637_0 + arg_637_0 then
				arg_634_1.talkMaxDuration = 0
				arg_634_1.dialogCg_.alpha = 1

				arg_634_1.dialog_:SetActive(true)
				SetActive(arg_634_1.leftNameGo_, false)

				arg_634_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_634_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_634_1:RecordName(arg_634_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_634_1.iconTrs_.gameObject, false)
				arg_634_1.callingController_:SetSelectedState("normal")

				local var_637_2 = arg_634_1:GetWordFromCfg(1101106150)
				local var_637_3 = arg_634_1:FormatText(var_637_2.content)

				arg_634_1.text_.text = var_637_3

				LuaForUtil.ClearLinePrefixSymbol(arg_634_1.text_)

				local var_637_4 = 6
				local var_637_5 = utf8.len(var_637_3)
				local var_637_6 = var_637_4 <= 0 and var_637_1 or var_637_1 * (var_637_5 / var_637_4)

				if var_637_6 > 0 and var_637_1 < var_637_6 then
					arg_634_1.talkMaxDuration = var_637_6

					if var_637_6 + var_637_0 > arg_634_1.duration_ then
						arg_634_1.duration_ = var_637_6 + var_637_0
					end
				end

				arg_634_1.text_.text = var_637_3
				arg_634_1.typewritter.percent = 0

				arg_634_1.typewritter:SetDirty()
				arg_634_1:ShowNextGo(false)
				arg_634_1:RecordContent(arg_634_1.text_.text)
			end

			local var_637_7 = math.max(var_637_1, arg_634_1.talkMaxDuration)

			if var_637_0 <= arg_634_1.time_ and arg_634_1.time_ < var_637_0 + var_637_7 then
				arg_634_1.typewritter.percent = (arg_634_1.time_ - var_637_0) / var_637_7

				arg_634_1.typewritter:SetDirty()
			end

			if arg_634_1.time_ >= var_637_0 + var_637_7 and arg_634_1.time_ < var_637_0 + var_637_7 + arg_637_0 then
				arg_634_1.typewritter.percent = 1

				arg_634_1.typewritter:SetDirty()
				arg_634_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106151 = function(arg_638_0, arg_638_1)
		arg_638_1.time_ = 0
		arg_638_1.frameCnt_ = 0
		arg_638_1.state_ = "playing"
		arg_638_1.curTalkId_ = 1101106151
		arg_638_1.duration_ = 2.83

		local var_638_0 = {
			zh = 1.6,
			ja = 2.833
		}
		local var_638_1 = manager.audio:GetLocalizationFlag()

		if var_638_0[var_638_1] ~= nil then
			arg_638_1.duration_ = var_638_0[var_638_1]
		end

		SetActive(arg_638_1.tipsGo_, false)

		function arg_638_1.onSingleLineFinish_()
			arg_638_1.onSingleLineUpdate_ = nil
			arg_638_1.onSingleLineFinish_ = nil
			arg_638_1.state_ = "waiting"
		end

		function arg_638_1.playNext_(arg_640_0)
			if arg_640_0 == 1 then
				arg_638_0:Play1101106152(arg_638_1)
			end
		end

		function arg_638_1.onSingleLineUpdate_(arg_641_0)
			local var_641_0 = 0
			local var_641_1 = 0.325

			if var_641_0 < arg_638_1.time_ and arg_638_1.time_ <= var_641_0 + arg_641_0 then
				arg_638_1.talkMaxDuration = 0
				arg_638_1.dialogCg_.alpha = 1

				arg_638_1.dialog_:SetActive(true)
				SetActive(arg_638_1.leftNameGo_, true)

				local var_641_2 = arg_638_1:FormatText(StoryNameCfg[37].name)

				arg_638_1.leftNameTxt_.text = var_641_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_638_1.leftNameTxt_.transform)

				arg_638_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_638_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_638_1:RecordName(arg_638_1.leftNameTxt_.text)
				SetActive(arg_638_1.iconTrs_.gameObject, false)
				arg_638_1.callingController_:SetSelectedState("normal")

				local var_641_3 = arg_638_1:GetWordFromCfg(1101106151)
				local var_641_4 = arg_638_1:FormatText(var_641_3.content)

				arg_638_1.text_.text = var_641_4

				LuaForUtil.ClearLinePrefixSymbol(arg_638_1.text_)

				local var_641_5 = 13
				local var_641_6 = utf8.len(var_641_4)
				local var_641_7 = var_641_5 <= 0 and var_641_1 or var_641_1 * (var_641_6 / var_641_5)

				if var_641_7 > 0 and var_641_1 < var_641_7 then
					arg_638_1.talkMaxDuration = var_641_7

					if var_641_7 + var_641_0 > arg_638_1.duration_ then
						arg_638_1.duration_ = var_641_7 + var_641_0
					end
				end

				arg_638_1.text_.text = var_641_4
				arg_638_1.typewritter.percent = 0

				arg_638_1.typewritter:SetDirty()
				arg_638_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb") ~= 0 then
					local var_641_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb") / 1000

					if var_641_8 + var_641_0 > arg_638_1.duration_ then
						arg_638_1.duration_ = var_641_8 + var_641_0
					end

					if var_641_3.prefab_name ~= "" and arg_638_1.actors_[var_641_3.prefab_name] ~= nil then
						local var_641_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_638_1.actors_[var_641_3.prefab_name].transform, "story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")

						arg_638_1:RecordAudio("1101106151", var_641_9)
						arg_638_1:RecordAudio("1101106151", var_641_9)
					else
						arg_638_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")
					end

					arg_638_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")
				end

				arg_638_1:RecordContent(arg_638_1.text_.text)
			end

			local var_641_10 = math.max(var_641_1, arg_638_1.talkMaxDuration)

			if var_641_0 <= arg_638_1.time_ and arg_638_1.time_ < var_641_0 + var_641_10 then
				arg_638_1.typewritter.percent = (arg_638_1.time_ - var_641_0) / var_641_10

				arg_638_1.typewritter:SetDirty()
			end

			if arg_638_1.time_ >= var_641_0 + var_641_10 and arg_638_1.time_ < var_641_0 + var_641_10 + arg_641_0 then
				arg_638_1.typewritter.percent = 1

				arg_638_1.typewritter:SetDirty()
				arg_638_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106152 = function(arg_642_0, arg_642_1)
		arg_642_1.time_ = 0
		arg_642_1.frameCnt_ = 0
		arg_642_1.state_ = "playing"
		arg_642_1.curTalkId_ = 1101106152
		arg_642_1.duration_ = 1.43

		local var_642_0 = {
			zh = 1.433,
			ja = 1.4
		}
		local var_642_1 = manager.audio:GetLocalizationFlag()

		if var_642_0[var_642_1] ~= nil then
			arg_642_1.duration_ = var_642_0[var_642_1]
		end

		SetActive(arg_642_1.tipsGo_, false)

		function arg_642_1.onSingleLineFinish_()
			arg_642_1.onSingleLineUpdate_ = nil
			arg_642_1.onSingleLineFinish_ = nil
			arg_642_1.state_ = "waiting"
		end

		function arg_642_1.playNext_(arg_644_0)
			if arg_644_0 == 1 then
				arg_642_0:Play1101106153(arg_642_1)
			end
		end

		function arg_642_1.onSingleLineUpdate_(arg_645_0)
			local var_645_0 = 0
			local var_645_1 = 0.075

			if var_645_0 < arg_642_1.time_ and arg_642_1.time_ <= var_645_0 + arg_645_0 then
				arg_642_1.talkMaxDuration = 0
				arg_642_1.dialogCg_.alpha = 1

				arg_642_1.dialog_:SetActive(true)
				SetActive(arg_642_1.leftNameGo_, true)

				local var_645_2 = arg_642_1:FormatText(StoryNameCfg[37].name)

				arg_642_1.leftNameTxt_.text = var_645_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_642_1.leftNameTxt_.transform)

				arg_642_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_642_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_642_1:RecordName(arg_642_1.leftNameTxt_.text)
				SetActive(arg_642_1.iconTrs_.gameObject, false)
				arg_642_1.callingController_:SetSelectedState("normal")

				local var_645_3 = arg_642_1:GetWordFromCfg(1101106152)
				local var_645_4 = arg_642_1:FormatText(var_645_3.content)

				arg_642_1.text_.text = var_645_4

				LuaForUtil.ClearLinePrefixSymbol(arg_642_1.text_)

				local var_645_5 = 3
				local var_645_6 = utf8.len(var_645_4)
				local var_645_7 = var_645_5 <= 0 and var_645_1 or var_645_1 * (var_645_6 / var_645_5)

				if var_645_7 > 0 and var_645_1 < var_645_7 then
					arg_642_1.talkMaxDuration = var_645_7

					if var_645_7 + var_645_0 > arg_642_1.duration_ then
						arg_642_1.duration_ = var_645_7 + var_645_0
					end
				end

				arg_642_1.text_.text = var_645_4
				arg_642_1.typewritter.percent = 0

				arg_642_1.typewritter:SetDirty()
				arg_642_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb") ~= 0 then
					local var_645_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb") / 1000

					if var_645_8 + var_645_0 > arg_642_1.duration_ then
						arg_642_1.duration_ = var_645_8 + var_645_0
					end

					if var_645_3.prefab_name ~= "" and arg_642_1.actors_[var_645_3.prefab_name] ~= nil then
						local var_645_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_642_1.actors_[var_645_3.prefab_name].transform, "story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")

						arg_642_1:RecordAudio("1101106152", var_645_9)
						arg_642_1:RecordAudio("1101106152", var_645_9)
					else
						arg_642_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")
					end

					arg_642_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")
				end

				arg_642_1:RecordContent(arg_642_1.text_.text)
			end

			local var_645_10 = math.max(var_645_1, arg_642_1.talkMaxDuration)

			if var_645_0 <= arg_642_1.time_ and arg_642_1.time_ < var_645_0 + var_645_10 then
				arg_642_1.typewritter.percent = (arg_642_1.time_ - var_645_0) / var_645_10

				arg_642_1.typewritter:SetDirty()
			end

			if arg_642_1.time_ >= var_645_0 + var_645_10 and arg_642_1.time_ < var_645_0 + var_645_10 + arg_645_0 then
				arg_642_1.typewritter.percent = 1

				arg_642_1.typewritter:SetDirty()
				arg_642_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106153 = function(arg_646_0, arg_646_1)
		arg_646_1.time_ = 0
		arg_646_1.frameCnt_ = 0
		arg_646_1.state_ = "playing"
		arg_646_1.curTalkId_ = 1101106153
		arg_646_1.duration_ = 5

		SetActive(arg_646_1.tipsGo_, false)

		function arg_646_1.onSingleLineFinish_()
			arg_646_1.onSingleLineUpdate_ = nil
			arg_646_1.onSingleLineFinish_ = nil
			arg_646_1.state_ = "waiting"
		end

		function arg_646_1.playNext_(arg_648_0)
			if arg_648_0 == 1 then
				arg_646_0:Play1101106154(arg_646_1)
			end
		end

		function arg_646_1.onSingleLineUpdate_(arg_649_0)
			local var_649_0 = 0
			local var_649_1 = 0.2

			if var_649_0 < arg_646_1.time_ and arg_646_1.time_ <= var_649_0 + arg_649_0 then
				arg_646_1.talkMaxDuration = 0
				arg_646_1.dialogCg_.alpha = 1

				arg_646_1.dialog_:SetActive(true)
				SetActive(arg_646_1.leftNameGo_, true)

				local var_649_2 = arg_646_1:FormatText(StoryNameCfg[7].name)

				arg_646_1.leftNameTxt_.text = var_649_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_646_1.leftNameTxt_.transform)

				arg_646_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_646_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_646_1:RecordName(arg_646_1.leftNameTxt_.text)
				SetActive(arg_646_1.iconTrs_.gameObject, false)
				arg_646_1.callingController_:SetSelectedState("normal")

				local var_649_3 = arg_646_1:GetWordFromCfg(1101106153)
				local var_649_4 = arg_646_1:FormatText(var_649_3.content)

				arg_646_1.text_.text = var_649_4

				LuaForUtil.ClearLinePrefixSymbol(arg_646_1.text_)

				local var_649_5 = 8
				local var_649_6 = utf8.len(var_649_4)
				local var_649_7 = var_649_5 <= 0 and var_649_1 or var_649_1 * (var_649_6 / var_649_5)

				if var_649_7 > 0 and var_649_1 < var_649_7 then
					arg_646_1.talkMaxDuration = var_649_7

					if var_649_7 + var_649_0 > arg_646_1.duration_ then
						arg_646_1.duration_ = var_649_7 + var_649_0
					end
				end

				arg_646_1.text_.text = var_649_4
				arg_646_1.typewritter.percent = 0

				arg_646_1.typewritter:SetDirty()
				arg_646_1:ShowNextGo(false)
				arg_646_1:RecordContent(arg_646_1.text_.text)
			end

			local var_649_8 = math.max(var_649_1, arg_646_1.talkMaxDuration)

			if var_649_0 <= arg_646_1.time_ and arg_646_1.time_ < var_649_0 + var_649_8 then
				arg_646_1.typewritter.percent = (arg_646_1.time_ - var_649_0) / var_649_8

				arg_646_1.typewritter:SetDirty()
			end

			if arg_646_1.time_ >= var_649_0 + var_649_8 and arg_646_1.time_ < var_649_0 + var_649_8 + arg_649_0 then
				arg_646_1.typewritter.percent = 1

				arg_646_1.typewritter:SetDirty()
				arg_646_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106154 = function(arg_650_0, arg_650_1)
		arg_650_1.time_ = 0
		arg_650_1.frameCnt_ = 0
		arg_650_1.state_ = "playing"
		arg_650_1.curTalkId_ = 1101106154
		arg_650_1.duration_ = 5

		SetActive(arg_650_1.tipsGo_, false)

		function arg_650_1.onSingleLineFinish_()
			arg_650_1.onSingleLineUpdate_ = nil
			arg_650_1.onSingleLineFinish_ = nil
			arg_650_1.state_ = "waiting"
		end

		function arg_650_1.playNext_(arg_652_0)
			if arg_652_0 == 1 then
				arg_650_0:Play1101106155(arg_650_1)
			end
		end

		function arg_650_1.onSingleLineUpdate_(arg_653_0)
			local var_653_0 = 0
			local var_653_1 = 0.7

			if var_653_0 < arg_650_1.time_ and arg_650_1.time_ <= var_653_0 + arg_653_0 then
				arg_650_1.talkMaxDuration = 0
				arg_650_1.dialogCg_.alpha = 1

				arg_650_1.dialog_:SetActive(true)
				SetActive(arg_650_1.leftNameGo_, false)

				arg_650_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_650_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_650_1:RecordName(arg_650_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_650_1.iconTrs_.gameObject, false)
				arg_650_1.callingController_:SetSelectedState("normal")

				local var_653_2 = arg_650_1:GetWordFromCfg(1101106154)
				local var_653_3 = arg_650_1:FormatText(var_653_2.content)

				arg_650_1.text_.text = var_653_3

				LuaForUtil.ClearLinePrefixSymbol(arg_650_1.text_)

				local var_653_4 = 40
				local var_653_5 = utf8.len(var_653_3)
				local var_653_6 = var_653_4 <= 0 and var_653_1 or var_653_1 * (var_653_5 / var_653_4)

				if var_653_6 > 0 and var_653_1 < var_653_6 then
					arg_650_1.talkMaxDuration = var_653_6

					if var_653_6 + var_653_0 > arg_650_1.duration_ then
						arg_650_1.duration_ = var_653_6 + var_653_0
					end
				end

				arg_650_1.text_.text = var_653_3
				arg_650_1.typewritter.percent = 0

				arg_650_1.typewritter:SetDirty()
				arg_650_1:ShowNextGo(false)
				arg_650_1:RecordContent(arg_650_1.text_.text)
			end

			local var_653_7 = math.max(var_653_1, arg_650_1.talkMaxDuration)

			if var_653_0 <= arg_650_1.time_ and arg_650_1.time_ < var_653_0 + var_653_7 then
				arg_650_1.typewritter.percent = (arg_650_1.time_ - var_653_0) / var_653_7

				arg_650_1.typewritter:SetDirty()
			end

			if arg_650_1.time_ >= var_653_0 + var_653_7 and arg_650_1.time_ < var_653_0 + var_653_7 + arg_653_0 then
				arg_650_1.typewritter.percent = 1

				arg_650_1.typewritter:SetDirty()
				arg_650_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106155 = function(arg_654_0, arg_654_1)
		arg_654_1.time_ = 0
		arg_654_1.frameCnt_ = 0
		arg_654_1.state_ = "playing"
		arg_654_1.curTalkId_ = 1101106155
		arg_654_1.duration_ = 3.5

		local var_654_0 = {
			zh = 3.5,
			ja = 1.8
		}
		local var_654_1 = manager.audio:GetLocalizationFlag()

		if var_654_0[var_654_1] ~= nil then
			arg_654_1.duration_ = var_654_0[var_654_1]
		end

		SetActive(arg_654_1.tipsGo_, false)

		function arg_654_1.onSingleLineFinish_()
			arg_654_1.onSingleLineUpdate_ = nil
			arg_654_1.onSingleLineFinish_ = nil
			arg_654_1.state_ = "waiting"
		end

		function arg_654_1.playNext_(arg_656_0)
			if arg_656_0 == 1 then
				arg_654_0:Play1101106156(arg_654_1)
			end
		end

		function arg_654_1.onSingleLineUpdate_(arg_657_0)
			local var_657_0 = 0
			local var_657_1 = 0.15

			if var_657_0 < arg_654_1.time_ and arg_654_1.time_ <= var_657_0 + arg_657_0 then
				arg_654_1.talkMaxDuration = 0
				arg_654_1.dialogCg_.alpha = 1

				arg_654_1.dialog_:SetActive(true)
				SetActive(arg_654_1.leftNameGo_, true)

				local var_657_2 = arg_654_1:FormatText(StoryNameCfg[37].name)

				arg_654_1.leftNameTxt_.text = var_657_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_654_1.leftNameTxt_.transform)

				arg_654_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_654_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_654_1:RecordName(arg_654_1.leftNameTxt_.text)
				SetActive(arg_654_1.iconTrs_.gameObject, false)
				arg_654_1.callingController_:SetSelectedState("normal")

				local var_657_3 = arg_654_1:GetWordFromCfg(1101106155)
				local var_657_4 = arg_654_1:FormatText(var_657_3.content)

				arg_654_1.text_.text = var_657_4

				LuaForUtil.ClearLinePrefixSymbol(arg_654_1.text_)

				local var_657_5 = 6
				local var_657_6 = utf8.len(var_657_4)
				local var_657_7 = var_657_5 <= 0 and var_657_1 or var_657_1 * (var_657_6 / var_657_5)

				if var_657_7 > 0 and var_657_1 < var_657_7 then
					arg_654_1.talkMaxDuration = var_657_7

					if var_657_7 + var_657_0 > arg_654_1.duration_ then
						arg_654_1.duration_ = var_657_7 + var_657_0
					end
				end

				arg_654_1.text_.text = var_657_4
				arg_654_1.typewritter.percent = 0

				arg_654_1.typewritter:SetDirty()
				arg_654_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb") ~= 0 then
					local var_657_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb") / 1000

					if var_657_8 + var_657_0 > arg_654_1.duration_ then
						arg_654_1.duration_ = var_657_8 + var_657_0
					end

					if var_657_3.prefab_name ~= "" and arg_654_1.actors_[var_657_3.prefab_name] ~= nil then
						local var_657_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_654_1.actors_[var_657_3.prefab_name].transform, "story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")

						arg_654_1:RecordAudio("1101106155", var_657_9)
						arg_654_1:RecordAudio("1101106155", var_657_9)
					else
						arg_654_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")
					end

					arg_654_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")
				end

				arg_654_1:RecordContent(arg_654_1.text_.text)
			end

			local var_657_10 = math.max(var_657_1, arg_654_1.talkMaxDuration)

			if var_657_0 <= arg_654_1.time_ and arg_654_1.time_ < var_657_0 + var_657_10 then
				arg_654_1.typewritter.percent = (arg_654_1.time_ - var_657_0) / var_657_10

				arg_654_1.typewritter:SetDirty()
			end

			if arg_654_1.time_ >= var_657_0 + var_657_10 and arg_654_1.time_ < var_657_0 + var_657_10 + arg_657_0 then
				arg_654_1.typewritter.percent = 1

				arg_654_1.typewritter:SetDirty()
				arg_654_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106156 = function(arg_658_0, arg_658_1)
		arg_658_1.time_ = 0
		arg_658_1.frameCnt_ = 0
		arg_658_1.state_ = "playing"
		arg_658_1.curTalkId_ = 1101106156
		arg_658_1.duration_ = 9

		SetActive(arg_658_1.tipsGo_, false)

		function arg_658_1.onSingleLineFinish_()
			arg_658_1.onSingleLineUpdate_ = nil
			arg_658_1.onSingleLineFinish_ = nil
			arg_658_1.state_ = "waiting"
		end

		function arg_658_1.playNext_(arg_660_0)
			if arg_660_0 == 1 then
				arg_658_0:Play1101106157(arg_658_1)
			end
		end

		function arg_658_1.onSingleLineUpdate_(arg_661_0)
			local var_661_0 = 2

			if var_661_0 < arg_658_1.time_ and arg_658_1.time_ <= var_661_0 + arg_661_0 then
				local var_661_1 = manager.ui.mainCamera.transform.localPosition
				local var_661_2 = Vector3.New(0, 0, 10) + Vector3.New(var_661_1.x, var_661_1.y, 0)
				local var_661_3 = arg_658_1.bgs_.R1102a

				var_661_3.transform.localPosition = var_661_2
				var_661_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_661_4 = var_661_3:GetComponent("SpriteRenderer")

				if var_661_4 and var_661_4.sprite then
					local var_661_5 = (var_661_3.transform.localPosition - var_661_1).z
					local var_661_6 = manager.ui.mainCameraCom_
					local var_661_7 = 2 * var_661_5 * Mathf.Tan(var_661_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_661_8 = var_661_7 * var_661_6.aspect
					local var_661_9 = var_661_4.sprite.bounds.size.x
					local var_661_10 = var_661_4.sprite.bounds.size.y
					local var_661_11 = var_661_8 / var_661_9
					local var_661_12 = var_661_7 / var_661_10
					local var_661_13 = var_661_12 < var_661_11 and var_661_11 or var_661_12

					var_661_3.transform.localScale = Vector3.New(var_661_13, var_661_13, 0)
				end

				for iter_661_0, iter_661_1 in pairs(arg_658_1.bgs_) do
					if iter_661_0 ~= "R1102a" then
						iter_661_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_661_14 = 0

			if var_661_14 < arg_658_1.time_ and arg_658_1.time_ <= var_661_14 + arg_661_0 then
				arg_658_1.mask_.enabled = true
				arg_658_1.mask_.raycastTarget = true

				arg_658_1:SetGaussion(false)
			end

			local var_661_15 = 2

			if var_661_14 <= arg_658_1.time_ and arg_658_1.time_ < var_661_14 + var_661_15 then
				local var_661_16 = (arg_658_1.time_ - var_661_14) / var_661_15
				local var_661_17 = Color.New(0, 0, 0)

				var_661_17.a = Mathf.Lerp(0, 1, var_661_16)
				arg_658_1.mask_.color = var_661_17
			end

			if arg_658_1.time_ >= var_661_14 + var_661_15 and arg_658_1.time_ < var_661_14 + var_661_15 + arg_661_0 then
				local var_661_18 = Color.New(0, 0, 0)

				var_661_18.a = 1
				arg_658_1.mask_.color = var_661_18
			end

			local var_661_19 = 2

			if var_661_19 < arg_658_1.time_ and arg_658_1.time_ <= var_661_19 + arg_661_0 then
				arg_658_1.mask_.enabled = true
				arg_658_1.mask_.raycastTarget = true

				arg_658_1:SetGaussion(false)
			end

			local var_661_20 = 2

			if var_661_19 <= arg_658_1.time_ and arg_658_1.time_ < var_661_19 + var_661_20 then
				local var_661_21 = (arg_658_1.time_ - var_661_19) / var_661_20
				local var_661_22 = Color.New(0, 0, 0)

				var_661_22.a = Mathf.Lerp(1, 0, var_661_21)
				arg_658_1.mask_.color = var_661_22
			end

			if arg_658_1.time_ >= var_661_19 + var_661_20 and arg_658_1.time_ < var_661_19 + var_661_20 + arg_661_0 then
				local var_661_23 = Color.New(0, 0, 0)
				local var_661_24 = 0

				arg_658_1.mask_.enabled = false
				var_661_23.a = var_661_24
				arg_658_1.mask_.color = var_661_23
			end

			local var_661_25
			local var_661_26 = 2

			if var_661_26 < arg_658_1.time_ and arg_658_1.time_ <= var_661_26 + arg_661_0 then
				local var_661_27 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_661_27 then
					var_661_27.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_661_27.radialBlurScale = 0
					var_661_27.radialBlurGradient = 1
					var_661_27.radialBlurIntensity = 1

					if var_661_25 then
						var_661_27.radialBlurTarget = var_661_25.transform
					end
				end
			end

			local var_661_28 = 0.0166666666666667

			if var_661_26 <= arg_658_1.time_ and arg_658_1.time_ < var_661_26 + var_661_28 then
				local var_661_29 = (arg_658_1.time_ - var_661_26) / var_661_28
				local var_661_30 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_661_30 then
					var_661_30.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_661_30.radialBlurScale = Mathf.Lerp(0, 0, var_661_29)
					var_661_30.radialBlurGradient = Mathf.Lerp(1, 1, var_661_29)
					var_661_30.radialBlurIntensity = Mathf.Lerp(1, 1, var_661_29)
				end
			end

			if arg_658_1.time_ >= var_661_26 + var_661_28 and arg_658_1.time_ < var_661_26 + var_661_28 + arg_661_0 then
				local var_661_31 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_661_31 then
					var_661_31.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_661_31.radialBlurScale = 0
					var_661_31.radialBlurGradient = 1
					var_661_31.radialBlurIntensity = 1
				end
			end

			if arg_658_1.frameCnt_ <= 1 then
				arg_658_1.dialog_:SetActive(false)
			end

			local var_661_32 = 4
			local var_661_33 = 0.6

			if var_661_32 < arg_658_1.time_ and arg_658_1.time_ <= var_661_32 + arg_661_0 then
				arg_658_1.talkMaxDuration = 0

				arg_658_1.dialog_:SetActive(true)

				local var_661_34 = LeanTween.value(arg_658_1.dialog_, 0, 1, 0.3)

				var_661_34:setOnUpdate(LuaHelper.FloatAction(function(arg_662_0)
					arg_658_1.dialogCg_.alpha = arg_662_0
				end))
				var_661_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_658_1.dialog_)
					var_661_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_658_1.duration_ = arg_658_1.duration_ + 0.3

				SetActive(arg_658_1.leftNameGo_, false)

				arg_658_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_658_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_658_1:RecordName(arg_658_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_658_1.iconTrs_.gameObject, false)
				arg_658_1.callingController_:SetSelectedState("normal")

				local var_661_35 = arg_658_1:GetWordFromCfg(1101106156)
				local var_661_36 = arg_658_1:FormatText(var_661_35.content)

				arg_658_1.text_.text = var_661_36

				LuaForUtil.ClearLinePrefixSymbol(arg_658_1.text_)

				local var_661_37 = 24
				local var_661_38 = utf8.len(var_661_36)
				local var_661_39 = var_661_37 <= 0 and var_661_33 or var_661_33 * (var_661_38 / var_661_37)

				if var_661_39 > 0 and var_661_33 < var_661_39 then
					arg_658_1.talkMaxDuration = var_661_39
					var_661_32 = var_661_32 + 0.3

					if var_661_39 + var_661_32 > arg_658_1.duration_ then
						arg_658_1.duration_ = var_661_39 + var_661_32
					end
				end

				arg_658_1.text_.text = var_661_36
				arg_658_1.typewritter.percent = 0

				arg_658_1.typewritter:SetDirty()
				arg_658_1:ShowNextGo(false)
				arg_658_1:RecordContent(arg_658_1.text_.text)
			end

			local var_661_40 = var_661_32 + 0.3
			local var_661_41 = math.max(var_661_33, arg_658_1.talkMaxDuration)

			if var_661_40 <= arg_658_1.time_ and arg_658_1.time_ < var_661_40 + var_661_41 then
				arg_658_1.typewritter.percent = (arg_658_1.time_ - var_661_40) / var_661_41

				arg_658_1.typewritter:SetDirty()
			end

			if arg_658_1.time_ >= var_661_40 + var_661_41 and arg_658_1.time_ < var_661_40 + var_661_41 + arg_661_0 then
				arg_658_1.typewritter.percent = 1

				arg_658_1.typewritter:SetDirty()
				arg_658_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106157 = function(arg_664_0, arg_664_1)
		arg_664_1.time_ = 0
		arg_664_1.frameCnt_ = 0
		arg_664_1.state_ = "playing"
		arg_664_1.curTalkId_ = 1101106157
		arg_664_1.duration_ = 5

		SetActive(arg_664_1.tipsGo_, false)

		function arg_664_1.onSingleLineFinish_()
			arg_664_1.onSingleLineUpdate_ = nil
			arg_664_1.onSingleLineFinish_ = nil
			arg_664_1.state_ = "waiting"
		end

		function arg_664_1.playNext_(arg_666_0)
			if arg_666_0 == 1 then
				arg_664_0:Play1101106158(arg_664_1)
			end
		end

		function arg_664_1.onSingleLineUpdate_(arg_667_0)
			local var_667_0 = 0
			local var_667_1 = 0.775

			if var_667_0 < arg_664_1.time_ and arg_664_1.time_ <= var_667_0 + arg_667_0 then
				arg_664_1.talkMaxDuration = 0
				arg_664_1.dialogCg_.alpha = 1

				arg_664_1.dialog_:SetActive(true)
				SetActive(arg_664_1.leftNameGo_, false)

				arg_664_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_664_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_664_1:RecordName(arg_664_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_664_1.iconTrs_.gameObject, false)
				arg_664_1.callingController_:SetSelectedState("normal")

				local var_667_2 = arg_664_1:GetWordFromCfg(1101106157)
				local var_667_3 = arg_664_1:FormatText(var_667_2.content)

				arg_664_1.text_.text = var_667_3

				LuaForUtil.ClearLinePrefixSymbol(arg_664_1.text_)

				local var_667_4 = 31
				local var_667_5 = utf8.len(var_667_3)
				local var_667_6 = var_667_4 <= 0 and var_667_1 or var_667_1 * (var_667_5 / var_667_4)

				if var_667_6 > 0 and var_667_1 < var_667_6 then
					arg_664_1.talkMaxDuration = var_667_6

					if var_667_6 + var_667_0 > arg_664_1.duration_ then
						arg_664_1.duration_ = var_667_6 + var_667_0
					end
				end

				arg_664_1.text_.text = var_667_3
				arg_664_1.typewritter.percent = 0

				arg_664_1.typewritter:SetDirty()
				arg_664_1:ShowNextGo(false)
				arg_664_1:RecordContent(arg_664_1.text_.text)
			end

			local var_667_7 = math.max(var_667_1, arg_664_1.talkMaxDuration)

			if var_667_0 <= arg_664_1.time_ and arg_664_1.time_ < var_667_0 + var_667_7 then
				arg_664_1.typewritter.percent = (arg_664_1.time_ - var_667_0) / var_667_7

				arg_664_1.typewritter:SetDirty()
			end

			if arg_664_1.time_ >= var_667_0 + var_667_7 and arg_664_1.time_ < var_667_0 + var_667_7 + arg_667_0 then
				arg_664_1.typewritter.percent = 1

				arg_664_1.typewritter:SetDirty()
				arg_664_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106158 = function(arg_668_0, arg_668_1)
		arg_668_1.time_ = 0
		arg_668_1.frameCnt_ = 0
		arg_668_1.state_ = "playing"
		arg_668_1.curTalkId_ = 1101106158
		arg_668_1.duration_ = 5

		SetActive(arg_668_1.tipsGo_, false)

		function arg_668_1.onSingleLineFinish_()
			arg_668_1.onSingleLineUpdate_ = nil
			arg_668_1.onSingleLineFinish_ = nil
			arg_668_1.state_ = "waiting"
		end

		function arg_668_1.playNext_(arg_670_0)
			if arg_670_0 == 1 then
				arg_668_0:Play1101106159(arg_668_1)
			end
		end

		function arg_668_1.onSingleLineUpdate_(arg_671_0)
			local var_671_0 = 0
			local var_671_1 = 0.65

			if var_671_0 < arg_668_1.time_ and arg_668_1.time_ <= var_671_0 + arg_671_0 then
				arg_668_1.talkMaxDuration = 0
				arg_668_1.dialogCg_.alpha = 1

				arg_668_1.dialog_:SetActive(true)
				SetActive(arg_668_1.leftNameGo_, false)

				arg_668_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_668_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_668_1:RecordName(arg_668_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_668_1.iconTrs_.gameObject, false)
				arg_668_1.callingController_:SetSelectedState("normal")

				local var_671_2 = arg_668_1:GetWordFromCfg(1101106158)
				local var_671_3 = arg_668_1:FormatText(var_671_2.content)

				arg_668_1.text_.text = var_671_3

				LuaForUtil.ClearLinePrefixSymbol(arg_668_1.text_)

				local var_671_4 = 26
				local var_671_5 = utf8.len(var_671_3)
				local var_671_6 = var_671_4 <= 0 and var_671_1 or var_671_1 * (var_671_5 / var_671_4)

				if var_671_6 > 0 and var_671_1 < var_671_6 then
					arg_668_1.talkMaxDuration = var_671_6

					if var_671_6 + var_671_0 > arg_668_1.duration_ then
						arg_668_1.duration_ = var_671_6 + var_671_0
					end
				end

				arg_668_1.text_.text = var_671_3
				arg_668_1.typewritter.percent = 0

				arg_668_1.typewritter:SetDirty()
				arg_668_1:ShowNextGo(false)
				arg_668_1:RecordContent(arg_668_1.text_.text)
			end

			local var_671_7 = math.max(var_671_1, arg_668_1.talkMaxDuration)

			if var_671_0 <= arg_668_1.time_ and arg_668_1.time_ < var_671_0 + var_671_7 then
				arg_668_1.typewritter.percent = (arg_668_1.time_ - var_671_0) / var_671_7

				arg_668_1.typewritter:SetDirty()
			end

			if arg_668_1.time_ >= var_671_0 + var_671_7 and arg_668_1.time_ < var_671_0 + var_671_7 + arg_671_0 then
				arg_668_1.typewritter.percent = 1

				arg_668_1.typewritter:SetDirty()
				arg_668_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106159 = function(arg_672_0, arg_672_1)
		arg_672_1.time_ = 0
		arg_672_1.frameCnt_ = 0
		arg_672_1.state_ = "playing"
		arg_672_1.curTalkId_ = 1101106159
		arg_672_1.duration_ = 5

		SetActive(arg_672_1.tipsGo_, false)

		function arg_672_1.onSingleLineFinish_()
			arg_672_1.onSingleLineUpdate_ = nil
			arg_672_1.onSingleLineFinish_ = nil
			arg_672_1.state_ = "waiting"
		end

		function arg_672_1.playNext_(arg_674_0)
			if arg_674_0 == 1 then
				arg_672_0:Play1101106160(arg_672_1)
			end
		end

		function arg_672_1.onSingleLineUpdate_(arg_675_0)
			local var_675_0 = 0
			local var_675_1 = 0.15

			if var_675_0 < arg_672_1.time_ and arg_672_1.time_ <= var_675_0 + arg_675_0 then
				arg_672_1.talkMaxDuration = 0
				arg_672_1.dialogCg_.alpha = 1

				arg_672_1.dialog_:SetActive(true)
				SetActive(arg_672_1.leftNameGo_, false)

				arg_672_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_672_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_672_1:RecordName(arg_672_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_672_1.iconTrs_.gameObject, false)
				arg_672_1.callingController_:SetSelectedState("normal")

				local var_675_2 = arg_672_1:GetWordFromCfg(1101106159)
				local var_675_3 = arg_672_1:FormatText(var_675_2.content)

				arg_672_1.text_.text = var_675_3

				LuaForUtil.ClearLinePrefixSymbol(arg_672_1.text_)

				local var_675_4 = 6
				local var_675_5 = utf8.len(var_675_3)
				local var_675_6 = var_675_4 <= 0 and var_675_1 or var_675_1 * (var_675_5 / var_675_4)

				if var_675_6 > 0 and var_675_1 < var_675_6 then
					arg_672_1.talkMaxDuration = var_675_6

					if var_675_6 + var_675_0 > arg_672_1.duration_ then
						arg_672_1.duration_ = var_675_6 + var_675_0
					end
				end

				arg_672_1.text_.text = var_675_3
				arg_672_1.typewritter.percent = 0

				arg_672_1.typewritter:SetDirty()
				arg_672_1:ShowNextGo(false)
				arg_672_1:RecordContent(arg_672_1.text_.text)
			end

			local var_675_7 = math.max(var_675_1, arg_672_1.talkMaxDuration)

			if var_675_0 <= arg_672_1.time_ and arg_672_1.time_ < var_675_0 + var_675_7 then
				arg_672_1.typewritter.percent = (arg_672_1.time_ - var_675_0) / var_675_7

				arg_672_1.typewritter:SetDirty()
			end

			if arg_672_1.time_ >= var_675_0 + var_675_7 and arg_672_1.time_ < var_675_0 + var_675_7 + arg_675_0 then
				arg_672_1.typewritter.percent = 1

				arg_672_1.typewritter:SetDirty()
				arg_672_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106160 = function(arg_676_0, arg_676_1)
		arg_676_1.time_ = 0
		arg_676_1.frameCnt_ = 0
		arg_676_1.state_ = "playing"
		arg_676_1.curTalkId_ = 1101106160
		arg_676_1.duration_ = 5

		SetActive(arg_676_1.tipsGo_, false)

		function arg_676_1.onSingleLineFinish_()
			arg_676_1.onSingleLineUpdate_ = nil
			arg_676_1.onSingleLineFinish_ = nil
			arg_676_1.state_ = "waiting"
		end

		function arg_676_1.playNext_(arg_678_0)
			if arg_678_0 == 1 then
				arg_676_0:Play1101106161(arg_676_1)
			end
		end

		function arg_676_1.onSingleLineUpdate_(arg_679_0)
			local var_679_0 = 0
			local var_679_1 = 0.15

			if var_679_0 < arg_676_1.time_ and arg_676_1.time_ <= var_679_0 + arg_679_0 then
				arg_676_1.talkMaxDuration = 0
				arg_676_1.dialogCg_.alpha = 1

				arg_676_1.dialog_:SetActive(true)
				SetActive(arg_676_1.leftNameGo_, true)

				local var_679_2 = arg_676_1:FormatText(StoryNameCfg[7].name)

				arg_676_1.leftNameTxt_.text = var_679_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_676_1.leftNameTxt_.transform)

				arg_676_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_676_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_676_1:RecordName(arg_676_1.leftNameTxt_.text)
				SetActive(arg_676_1.iconTrs_.gameObject, false)
				arg_676_1.callingController_:SetSelectedState("normal")

				local var_679_3 = arg_676_1:GetWordFromCfg(1101106160)
				local var_679_4 = arg_676_1:FormatText(var_679_3.content)

				arg_676_1.text_.text = var_679_4

				LuaForUtil.ClearLinePrefixSymbol(arg_676_1.text_)

				local var_679_5 = 6
				local var_679_6 = utf8.len(var_679_4)
				local var_679_7 = var_679_5 <= 0 and var_679_1 or var_679_1 * (var_679_6 / var_679_5)

				if var_679_7 > 0 and var_679_1 < var_679_7 then
					arg_676_1.talkMaxDuration = var_679_7

					if var_679_7 + var_679_0 > arg_676_1.duration_ then
						arg_676_1.duration_ = var_679_7 + var_679_0
					end
				end

				arg_676_1.text_.text = var_679_4
				arg_676_1.typewritter.percent = 0

				arg_676_1.typewritter:SetDirty()
				arg_676_1:ShowNextGo(false)
				arg_676_1:RecordContent(arg_676_1.text_.text)
			end

			local var_679_8 = math.max(var_679_1, arg_676_1.talkMaxDuration)

			if var_679_0 <= arg_676_1.time_ and arg_676_1.time_ < var_679_0 + var_679_8 then
				arg_676_1.typewritter.percent = (arg_676_1.time_ - var_679_0) / var_679_8

				arg_676_1.typewritter:SetDirty()
			end

			if arg_676_1.time_ >= var_679_0 + var_679_8 and arg_676_1.time_ < var_679_0 + var_679_8 + arg_679_0 then
				arg_676_1.typewritter.percent = 1

				arg_676_1.typewritter:SetDirty()
				arg_676_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106161 = function(arg_680_0, arg_680_1)
		arg_680_1.time_ = 0
		arg_680_1.frameCnt_ = 0
		arg_680_1.state_ = "playing"
		arg_680_1.curTalkId_ = 1101106161
		arg_680_1.duration_ = 8.27

		local var_680_0 = {
			zh = 7.7,
			ja = 8.266
		}
		local var_680_1 = manager.audio:GetLocalizationFlag()

		if var_680_0[var_680_1] ~= nil then
			arg_680_1.duration_ = var_680_0[var_680_1]
		end

		SetActive(arg_680_1.tipsGo_, false)

		function arg_680_1.onSingleLineFinish_()
			arg_680_1.onSingleLineUpdate_ = nil
			arg_680_1.onSingleLineFinish_ = nil
			arg_680_1.state_ = "waiting"
		end

		function arg_680_1.playNext_(arg_682_0)
			if arg_682_0 == 1 then
				arg_680_0:Play1101106162(arg_680_1)
			end
		end

		function arg_680_1.onSingleLineUpdate_(arg_683_0)
			local var_683_0 = 0
			local var_683_1 = 0.525

			if var_683_0 < arg_680_1.time_ and arg_680_1.time_ <= var_683_0 + arg_683_0 then
				arg_680_1.talkMaxDuration = 0
				arg_680_1.dialogCg_.alpha = 1

				arg_680_1.dialog_:SetActive(true)
				SetActive(arg_680_1.leftNameGo_, true)

				local var_683_2 = arg_680_1:FormatText(StoryNameCfg[37].name)

				arg_680_1.leftNameTxt_.text = var_683_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_680_1.leftNameTxt_.transform)

				arg_680_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_680_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_680_1:RecordName(arg_680_1.leftNameTxt_.text)
				SetActive(arg_680_1.iconTrs_.gameObject, false)
				arg_680_1.callingController_:SetSelectedState("normal")

				local var_683_3 = arg_680_1:GetWordFromCfg(1101106161)
				local var_683_4 = arg_680_1:FormatText(var_683_3.content)

				arg_680_1.text_.text = var_683_4

				LuaForUtil.ClearLinePrefixSymbol(arg_680_1.text_)

				local var_683_5 = 21
				local var_683_6 = utf8.len(var_683_4)
				local var_683_7 = var_683_5 <= 0 and var_683_1 or var_683_1 * (var_683_6 / var_683_5)

				if var_683_7 > 0 and var_683_1 < var_683_7 then
					arg_680_1.talkMaxDuration = var_683_7

					if var_683_7 + var_683_0 > arg_680_1.duration_ then
						arg_680_1.duration_ = var_683_7 + var_683_0
					end
				end

				arg_680_1.text_.text = var_683_4
				arg_680_1.typewritter.percent = 0

				arg_680_1.typewritter:SetDirty()
				arg_680_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb") ~= 0 then
					local var_683_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb") / 1000

					if var_683_8 + var_683_0 > arg_680_1.duration_ then
						arg_680_1.duration_ = var_683_8 + var_683_0
					end

					if var_683_3.prefab_name ~= "" and arg_680_1.actors_[var_683_3.prefab_name] ~= nil then
						local var_683_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_680_1.actors_[var_683_3.prefab_name].transform, "story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")

						arg_680_1:RecordAudio("1101106161", var_683_9)
						arg_680_1:RecordAudio("1101106161", var_683_9)
					else
						arg_680_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")
					end

					arg_680_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")
				end

				arg_680_1:RecordContent(arg_680_1.text_.text)
			end

			local var_683_10 = math.max(var_683_1, arg_680_1.talkMaxDuration)

			if var_683_0 <= arg_680_1.time_ and arg_680_1.time_ < var_683_0 + var_683_10 then
				arg_680_1.typewritter.percent = (arg_680_1.time_ - var_683_0) / var_683_10

				arg_680_1.typewritter:SetDirty()
			end

			if arg_680_1.time_ >= var_683_0 + var_683_10 and arg_680_1.time_ < var_683_0 + var_683_10 + arg_683_0 then
				arg_680_1.typewritter.percent = 1

				arg_680_1.typewritter:SetDirty()
				arg_680_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106162 = function(arg_684_0, arg_684_1)
		arg_684_1.time_ = 0
		arg_684_1.frameCnt_ = 0
		arg_684_1.state_ = "playing"
		arg_684_1.curTalkId_ = 1101106162
		arg_684_1.duration_ = 5

		SetActive(arg_684_1.tipsGo_, false)

		function arg_684_1.onSingleLineFinish_()
			arg_684_1.onSingleLineUpdate_ = nil
			arg_684_1.onSingleLineFinish_ = nil
			arg_684_1.state_ = "waiting"
		end

		function arg_684_1.playNext_(arg_686_0)
			if arg_686_0 == 1 then
				arg_684_0:Play1101106163(arg_684_1)
			end
		end

		function arg_684_1.onSingleLineUpdate_(arg_687_0)
			local var_687_0 = 0
			local var_687_1 = 0.425

			if var_687_0 < arg_684_1.time_ and arg_684_1.time_ <= var_687_0 + arg_687_0 then
				arg_684_1.talkMaxDuration = 0
				arg_684_1.dialogCg_.alpha = 1

				arg_684_1.dialog_:SetActive(true)
				SetActive(arg_684_1.leftNameGo_, true)

				local var_687_2 = arg_684_1:FormatText(StoryNameCfg[7].name)

				arg_684_1.leftNameTxt_.text = var_687_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_684_1.leftNameTxt_.transform)

				arg_684_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_684_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_684_1:RecordName(arg_684_1.leftNameTxt_.text)
				SetActive(arg_684_1.iconTrs_.gameObject, false)
				arg_684_1.callingController_:SetSelectedState("normal")

				local var_687_3 = arg_684_1:GetWordFromCfg(1101106162)
				local var_687_4 = arg_684_1:FormatText(var_687_3.content)

				arg_684_1.text_.text = var_687_4

				LuaForUtil.ClearLinePrefixSymbol(arg_684_1.text_)

				local var_687_5 = 17
				local var_687_6 = utf8.len(var_687_4)
				local var_687_7 = var_687_5 <= 0 and var_687_1 or var_687_1 * (var_687_6 / var_687_5)

				if var_687_7 > 0 and var_687_1 < var_687_7 then
					arg_684_1.talkMaxDuration = var_687_7

					if var_687_7 + var_687_0 > arg_684_1.duration_ then
						arg_684_1.duration_ = var_687_7 + var_687_0
					end
				end

				arg_684_1.text_.text = var_687_4
				arg_684_1.typewritter.percent = 0

				arg_684_1.typewritter:SetDirty()
				arg_684_1:ShowNextGo(false)
				arg_684_1:RecordContent(arg_684_1.text_.text)
			end

			local var_687_8 = math.max(var_687_1, arg_684_1.talkMaxDuration)

			if var_687_0 <= arg_684_1.time_ and arg_684_1.time_ < var_687_0 + var_687_8 then
				arg_684_1.typewritter.percent = (arg_684_1.time_ - var_687_0) / var_687_8

				arg_684_1.typewritter:SetDirty()
			end

			if arg_684_1.time_ >= var_687_0 + var_687_8 and arg_684_1.time_ < var_687_0 + var_687_8 + arg_687_0 then
				arg_684_1.typewritter.percent = 1

				arg_684_1.typewritter:SetDirty()
				arg_684_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106163 = function(arg_688_0, arg_688_1)
		arg_688_1.time_ = 0
		arg_688_1.frameCnt_ = 0
		arg_688_1.state_ = "playing"
		arg_688_1.curTalkId_ = 1101106163
		arg_688_1.duration_ = 5.1

		local var_688_0 = {
			zh = 5.1,
			ja = 3.233
		}
		local var_688_1 = manager.audio:GetLocalizationFlag()

		if var_688_0[var_688_1] ~= nil then
			arg_688_1.duration_ = var_688_0[var_688_1]
		end

		SetActive(arg_688_1.tipsGo_, false)

		function arg_688_1.onSingleLineFinish_()
			arg_688_1.onSingleLineUpdate_ = nil
			arg_688_1.onSingleLineFinish_ = nil
			arg_688_1.state_ = "waiting"
		end

		function arg_688_1.playNext_(arg_690_0)
			if arg_690_0 == 1 then
				arg_688_0:Play1101106164(arg_688_1)
			end
		end

		function arg_688_1.onSingleLineUpdate_(arg_691_0)
			local var_691_0 = 0
			local var_691_1 = 0.35

			if var_691_0 < arg_688_1.time_ and arg_688_1.time_ <= var_691_0 + arg_691_0 then
				arg_688_1.talkMaxDuration = 0
				arg_688_1.dialogCg_.alpha = 1

				arg_688_1.dialog_:SetActive(true)
				SetActive(arg_688_1.leftNameGo_, true)

				local var_691_2 = arg_688_1:FormatText(StoryNameCfg[37].name)

				arg_688_1.leftNameTxt_.text = var_691_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_688_1.leftNameTxt_.transform)

				arg_688_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_688_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_688_1:RecordName(arg_688_1.leftNameTxt_.text)
				SetActive(arg_688_1.iconTrs_.gameObject, false)
				arg_688_1.callingController_:SetSelectedState("normal")

				local var_691_3 = arg_688_1:GetWordFromCfg(1101106163)
				local var_691_4 = arg_688_1:FormatText(var_691_3.content)

				arg_688_1.text_.text = var_691_4

				LuaForUtil.ClearLinePrefixSymbol(arg_688_1.text_)

				local var_691_5 = 14
				local var_691_6 = utf8.len(var_691_4)
				local var_691_7 = var_691_5 <= 0 and var_691_1 or var_691_1 * (var_691_6 / var_691_5)

				if var_691_7 > 0 and var_691_1 < var_691_7 then
					arg_688_1.talkMaxDuration = var_691_7

					if var_691_7 + var_691_0 > arg_688_1.duration_ then
						arg_688_1.duration_ = var_691_7 + var_691_0
					end
				end

				arg_688_1.text_.text = var_691_4
				arg_688_1.typewritter.percent = 0

				arg_688_1.typewritter:SetDirty()
				arg_688_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb") ~= 0 then
					local var_691_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb") / 1000

					if var_691_8 + var_691_0 > arg_688_1.duration_ then
						arg_688_1.duration_ = var_691_8 + var_691_0
					end

					if var_691_3.prefab_name ~= "" and arg_688_1.actors_[var_691_3.prefab_name] ~= nil then
						local var_691_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_688_1.actors_[var_691_3.prefab_name].transform, "story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")

						arg_688_1:RecordAudio("1101106163", var_691_9)
						arg_688_1:RecordAudio("1101106163", var_691_9)
					else
						arg_688_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")
					end

					arg_688_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")
				end

				arg_688_1:RecordContent(arg_688_1.text_.text)
			end

			local var_691_10 = math.max(var_691_1, arg_688_1.talkMaxDuration)

			if var_691_0 <= arg_688_1.time_ and arg_688_1.time_ < var_691_0 + var_691_10 then
				arg_688_1.typewritter.percent = (arg_688_1.time_ - var_691_0) / var_691_10

				arg_688_1.typewritter:SetDirty()
			end

			if arg_688_1.time_ >= var_691_0 + var_691_10 and arg_688_1.time_ < var_691_0 + var_691_10 + arg_691_0 then
				arg_688_1.typewritter.percent = 1

				arg_688_1.typewritter:SetDirty()
				arg_688_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106164 = function(arg_692_0, arg_692_1)
		arg_692_1.time_ = 0
		arg_692_1.frameCnt_ = 0
		arg_692_1.state_ = "playing"
		arg_692_1.curTalkId_ = 1101106164
		arg_692_1.duration_ = 4.3

		local var_692_0 = {
			zh = 3.533,
			ja = 4.3
		}
		local var_692_1 = manager.audio:GetLocalizationFlag()

		if var_692_0[var_692_1] ~= nil then
			arg_692_1.duration_ = var_692_0[var_692_1]
		end

		SetActive(arg_692_1.tipsGo_, false)

		function arg_692_1.onSingleLineFinish_()
			arg_692_1.onSingleLineUpdate_ = nil
			arg_692_1.onSingleLineFinish_ = nil
			arg_692_1.state_ = "waiting"
		end

		function arg_692_1.playNext_(arg_694_0)
			if arg_694_0 == 1 then
				arg_692_0:Play1101106165(arg_692_1)
			end
		end

		function arg_692_1.onSingleLineUpdate_(arg_695_0)
			local var_695_0 = 0
			local var_695_1 = 0.3

			if var_695_0 < arg_692_1.time_ and arg_692_1.time_ <= var_695_0 + arg_695_0 then
				arg_692_1.talkMaxDuration = 0
				arg_692_1.dialogCg_.alpha = 1

				arg_692_1.dialog_:SetActive(true)
				SetActive(arg_692_1.leftNameGo_, true)

				local var_695_2 = arg_692_1:FormatText(StoryNameCfg[67].name)

				arg_692_1.leftNameTxt_.text = var_695_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_692_1.leftNameTxt_.transform)

				arg_692_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_692_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_692_1:RecordName(arg_692_1.leftNameTxt_.text)
				SetActive(arg_692_1.iconTrs_.gameObject, true)
				arg_692_1.iconController_:SetSelectedState("hero")

				arg_692_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1111")

				arg_692_1.callingController_:SetSelectedState("normal")

				arg_692_1.keyicon_.color = Color.New(1, 1, 1)
				arg_692_1.icon_.color = Color.New(1, 1, 1)

				local var_695_3 = arg_692_1:GetWordFromCfg(1101106164)
				local var_695_4 = arg_692_1:FormatText(var_695_3.content)

				arg_692_1.text_.text = var_695_4

				LuaForUtil.ClearLinePrefixSymbol(arg_692_1.text_)

				local var_695_5 = 12
				local var_695_6 = utf8.len(var_695_4)
				local var_695_7 = var_695_5 <= 0 and var_695_1 or var_695_1 * (var_695_6 / var_695_5)

				if var_695_7 > 0 and var_695_1 < var_695_7 then
					arg_692_1.talkMaxDuration = var_695_7

					if var_695_7 + var_695_0 > arg_692_1.duration_ then
						arg_692_1.duration_ = var_695_7 + var_695_0
					end
				end

				arg_692_1.text_.text = var_695_4
				arg_692_1.typewritter.percent = 0

				arg_692_1.typewritter:SetDirty()
				arg_692_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb") ~= 0 then
					local var_695_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb") / 1000

					if var_695_8 + var_695_0 > arg_692_1.duration_ then
						arg_692_1.duration_ = var_695_8 + var_695_0
					end

					if var_695_3.prefab_name ~= "" and arg_692_1.actors_[var_695_3.prefab_name] ~= nil then
						local var_695_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_692_1.actors_[var_695_3.prefab_name].transform, "story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")

						arg_692_1:RecordAudio("1101106164", var_695_9)
						arg_692_1:RecordAudio("1101106164", var_695_9)
					else
						arg_692_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")
					end

					arg_692_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")
				end

				arg_692_1:RecordContent(arg_692_1.text_.text)
			end

			local var_695_10 = math.max(var_695_1, arg_692_1.talkMaxDuration)

			if var_695_0 <= arg_692_1.time_ and arg_692_1.time_ < var_695_0 + var_695_10 then
				arg_692_1.typewritter.percent = (arg_692_1.time_ - var_695_0) / var_695_10

				arg_692_1.typewritter:SetDirty()
			end

			if arg_692_1.time_ >= var_695_0 + var_695_10 and arg_692_1.time_ < var_695_0 + var_695_10 + arg_695_0 then
				arg_692_1.typewritter.percent = 1

				arg_692_1.typewritter:SetDirty()
				arg_692_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106165 = function(arg_696_0, arg_696_1)
		arg_696_1.time_ = 0
		arg_696_1.frameCnt_ = 0
		arg_696_1.state_ = "playing"
		arg_696_1.curTalkId_ = 1101106165
		arg_696_1.duration_ = 5

		SetActive(arg_696_1.tipsGo_, false)

		function arg_696_1.onSingleLineFinish_()
			arg_696_1.onSingleLineUpdate_ = nil
			arg_696_1.onSingleLineFinish_ = nil
			arg_696_1.state_ = "waiting"
		end

		function arg_696_1.playNext_(arg_698_0)
			if arg_698_0 == 1 then
				arg_696_0:Play1101106166(arg_696_1)
			end
		end

		function arg_696_1.onSingleLineUpdate_(arg_699_0)
			local var_699_0 = 0
			local var_699_1 = 0.6

			if var_699_0 < arg_696_1.time_ and arg_696_1.time_ <= var_699_0 + arg_699_0 then
				arg_696_1.talkMaxDuration = 0
				arg_696_1.dialogCg_.alpha = 1

				arg_696_1.dialog_:SetActive(true)
				SetActive(arg_696_1.leftNameGo_, false)

				arg_696_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_696_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_696_1:RecordName(arg_696_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_696_1.iconTrs_.gameObject, false)
				arg_696_1.callingController_:SetSelectedState("normal")

				local var_699_2 = arg_696_1:GetWordFromCfg(1101106165)
				local var_699_3 = arg_696_1:FormatText(var_699_2.content)

				arg_696_1.text_.text = var_699_3

				LuaForUtil.ClearLinePrefixSymbol(arg_696_1.text_)

				local var_699_4 = 24
				local var_699_5 = utf8.len(var_699_3)
				local var_699_6 = var_699_4 <= 0 and var_699_1 or var_699_1 * (var_699_5 / var_699_4)

				if var_699_6 > 0 and var_699_1 < var_699_6 then
					arg_696_1.talkMaxDuration = var_699_6

					if var_699_6 + var_699_0 > arg_696_1.duration_ then
						arg_696_1.duration_ = var_699_6 + var_699_0
					end
				end

				arg_696_1.text_.text = var_699_3
				arg_696_1.typewritter.percent = 0

				arg_696_1.typewritter:SetDirty()
				arg_696_1:ShowNextGo(false)
				arg_696_1:RecordContent(arg_696_1.text_.text)
			end

			local var_699_7 = math.max(var_699_1, arg_696_1.talkMaxDuration)

			if var_699_0 <= arg_696_1.time_ and arg_696_1.time_ < var_699_0 + var_699_7 then
				arg_696_1.typewritter.percent = (arg_696_1.time_ - var_699_0) / var_699_7

				arg_696_1.typewritter:SetDirty()
			end

			if arg_696_1.time_ >= var_699_0 + var_699_7 and arg_696_1.time_ < var_699_0 + var_699_7 + arg_699_0 then
				arg_696_1.typewritter.percent = 1

				arg_696_1.typewritter:SetDirty()
				arg_696_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106166 = function(arg_700_0, arg_700_1)
		arg_700_1.time_ = 0
		arg_700_1.frameCnt_ = 0
		arg_700_1.state_ = "playing"
		arg_700_1.curTalkId_ = 1101106166
		arg_700_1.duration_ = 9.23

		local var_700_0 = {
			zh = 9.233,
			ja = 5.433
		}
		local var_700_1 = manager.audio:GetLocalizationFlag()

		if var_700_0[var_700_1] ~= nil then
			arg_700_1.duration_ = var_700_0[var_700_1]
		end

		SetActive(arg_700_1.tipsGo_, false)

		function arg_700_1.onSingleLineFinish_()
			arg_700_1.onSingleLineUpdate_ = nil
			arg_700_1.onSingleLineFinish_ = nil
			arg_700_1.state_ = "waiting"
		end

		function arg_700_1.playNext_(arg_702_0)
			if arg_702_0 == 1 then
				arg_700_0:Play1101106167(arg_700_1)
			end
		end

		function arg_700_1.onSingleLineUpdate_(arg_703_0)
			local var_703_0 = 0
			local var_703_1 = 0.5

			if var_703_0 < arg_700_1.time_ and arg_700_1.time_ <= var_703_0 + arg_703_0 then
				arg_700_1.talkMaxDuration = 0
				arg_700_1.dialogCg_.alpha = 1

				arg_700_1.dialog_:SetActive(true)
				SetActive(arg_700_1.leftNameGo_, true)

				local var_703_2 = arg_700_1:FormatText(StoryNameCfg[37].name)

				arg_700_1.leftNameTxt_.text = var_703_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_700_1.leftNameTxt_.transform)

				arg_700_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_700_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_700_1:RecordName(arg_700_1.leftNameTxt_.text)
				SetActive(arg_700_1.iconTrs_.gameObject, false)
				arg_700_1.callingController_:SetSelectedState("normal")

				local var_703_3 = arg_700_1:GetWordFromCfg(1101106166)
				local var_703_4 = arg_700_1:FormatText(var_703_3.content)

				arg_700_1.text_.text = var_703_4

				LuaForUtil.ClearLinePrefixSymbol(arg_700_1.text_)

				local var_703_5 = 20
				local var_703_6 = utf8.len(var_703_4)
				local var_703_7 = var_703_5 <= 0 and var_703_1 or var_703_1 * (var_703_6 / var_703_5)

				if var_703_7 > 0 and var_703_1 < var_703_7 then
					arg_700_1.talkMaxDuration = var_703_7

					if var_703_7 + var_703_0 > arg_700_1.duration_ then
						arg_700_1.duration_ = var_703_7 + var_703_0
					end
				end

				arg_700_1.text_.text = var_703_4
				arg_700_1.typewritter.percent = 0

				arg_700_1.typewritter:SetDirty()
				arg_700_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb") ~= 0 then
					local var_703_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb") / 1000

					if var_703_8 + var_703_0 > arg_700_1.duration_ then
						arg_700_1.duration_ = var_703_8 + var_703_0
					end

					if var_703_3.prefab_name ~= "" and arg_700_1.actors_[var_703_3.prefab_name] ~= nil then
						local var_703_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_700_1.actors_[var_703_3.prefab_name].transform, "story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")

						arg_700_1:RecordAudio("1101106166", var_703_9)
						arg_700_1:RecordAudio("1101106166", var_703_9)
					else
						arg_700_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")
					end

					arg_700_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")
				end

				arg_700_1:RecordContent(arg_700_1.text_.text)
			end

			local var_703_10 = math.max(var_703_1, arg_700_1.talkMaxDuration)

			if var_703_0 <= arg_700_1.time_ and arg_700_1.time_ < var_703_0 + var_703_10 then
				arg_700_1.typewritter.percent = (arg_700_1.time_ - var_703_0) / var_703_10

				arg_700_1.typewritter:SetDirty()
			end

			if arg_700_1.time_ >= var_703_0 + var_703_10 and arg_700_1.time_ < var_703_0 + var_703_10 + arg_703_0 then
				arg_700_1.typewritter.percent = 1

				arg_700_1.typewritter:SetDirty()
				arg_700_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106167 = function(arg_704_0, arg_704_1)
		arg_704_1.time_ = 0
		arg_704_1.frameCnt_ = 0
		arg_704_1.state_ = "playing"
		arg_704_1.curTalkId_ = 1101106167
		arg_704_1.duration_ = 4.57

		local var_704_0 = {
			zh = 4.566,
			ja = 4.5
		}
		local var_704_1 = manager.audio:GetLocalizationFlag()

		if var_704_0[var_704_1] ~= nil then
			arg_704_1.duration_ = var_704_0[var_704_1]
		end

		SetActive(arg_704_1.tipsGo_, false)

		function arg_704_1.onSingleLineFinish_()
			arg_704_1.onSingleLineUpdate_ = nil
			arg_704_1.onSingleLineFinish_ = nil
			arg_704_1.state_ = "waiting"
		end

		function arg_704_1.playNext_(arg_706_0)
			if arg_706_0 == 1 then
				arg_704_0:Play1101106168(arg_704_1)
			end
		end

		function arg_704_1.onSingleLineUpdate_(arg_707_0)
			local var_707_0 = 0
			local var_707_1 = 0.4

			if var_707_0 < arg_704_1.time_ and arg_704_1.time_ <= var_707_0 + arg_707_0 then
				arg_704_1.talkMaxDuration = 0
				arg_704_1.dialogCg_.alpha = 1

				arg_704_1.dialog_:SetActive(true)
				SetActive(arg_704_1.leftNameGo_, true)

				local var_707_2 = arg_704_1:FormatText(StoryNameCfg[37].name)

				arg_704_1.leftNameTxt_.text = var_707_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_704_1.leftNameTxt_.transform)

				arg_704_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_704_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_704_1:RecordName(arg_704_1.leftNameTxt_.text)
				SetActive(arg_704_1.iconTrs_.gameObject, false)
				arg_704_1.callingController_:SetSelectedState("normal")

				local var_707_3 = arg_704_1:GetWordFromCfg(1101106167)
				local var_707_4 = arg_704_1:FormatText(var_707_3.content)

				arg_704_1.text_.text = var_707_4

				LuaForUtil.ClearLinePrefixSymbol(arg_704_1.text_)

				local var_707_5 = 16
				local var_707_6 = utf8.len(var_707_4)
				local var_707_7 = var_707_5 <= 0 and var_707_1 or var_707_1 * (var_707_6 / var_707_5)

				if var_707_7 > 0 and var_707_1 < var_707_7 then
					arg_704_1.talkMaxDuration = var_707_7

					if var_707_7 + var_707_0 > arg_704_1.duration_ then
						arg_704_1.duration_ = var_707_7 + var_707_0
					end
				end

				arg_704_1.text_.text = var_707_4
				arg_704_1.typewritter.percent = 0

				arg_704_1.typewritter:SetDirty()
				arg_704_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb") ~= 0 then
					local var_707_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb") / 1000

					if var_707_8 + var_707_0 > arg_704_1.duration_ then
						arg_704_1.duration_ = var_707_8 + var_707_0
					end

					if var_707_3.prefab_name ~= "" and arg_704_1.actors_[var_707_3.prefab_name] ~= nil then
						local var_707_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_704_1.actors_[var_707_3.prefab_name].transform, "story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")

						arg_704_1:RecordAudio("1101106167", var_707_9)
						arg_704_1:RecordAudio("1101106167", var_707_9)
					else
						arg_704_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")
					end

					arg_704_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")
				end

				arg_704_1:RecordContent(arg_704_1.text_.text)
			end

			local var_707_10 = math.max(var_707_1, arg_704_1.talkMaxDuration)

			if var_707_0 <= arg_704_1.time_ and arg_704_1.time_ < var_707_0 + var_707_10 then
				arg_704_1.typewritter.percent = (arg_704_1.time_ - var_707_0) / var_707_10

				arg_704_1.typewritter:SetDirty()
			end

			if arg_704_1.time_ >= var_707_0 + var_707_10 and arg_704_1.time_ < var_707_0 + var_707_10 + arg_707_0 then
				arg_704_1.typewritter.percent = 1

				arg_704_1.typewritter:SetDirty()
				arg_704_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106168 = function(arg_708_0, arg_708_1)
		arg_708_1.time_ = 0
		arg_708_1.frameCnt_ = 0
		arg_708_1.state_ = "playing"
		arg_708_1.curTalkId_ = 1101106168
		arg_708_1.duration_ = 5

		SetActive(arg_708_1.tipsGo_, false)

		function arg_708_1.onSingleLineFinish_()
			arg_708_1.onSingleLineUpdate_ = nil
			arg_708_1.onSingleLineFinish_ = nil
			arg_708_1.state_ = "waiting"
		end

		function arg_708_1.playNext_(arg_710_0)
			if arg_710_0 == 1 then
				arg_708_0:Play1101106169(arg_708_1)
			end
		end

		function arg_708_1.onSingleLineUpdate_(arg_711_0)
			local var_711_0 = 0
			local var_711_1 = 0.375

			if var_711_0 < arg_708_1.time_ and arg_708_1.time_ <= var_711_0 + arg_711_0 then
				arg_708_1.talkMaxDuration = 0
				arg_708_1.dialogCg_.alpha = 1

				arg_708_1.dialog_:SetActive(true)
				SetActive(arg_708_1.leftNameGo_, true)

				local var_711_2 = arg_708_1:FormatText(StoryNameCfg[7].name)

				arg_708_1.leftNameTxt_.text = var_711_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_708_1.leftNameTxt_.transform)

				arg_708_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_708_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_708_1:RecordName(arg_708_1.leftNameTxt_.text)
				SetActive(arg_708_1.iconTrs_.gameObject, false)
				arg_708_1.callingController_:SetSelectedState("normal")

				local var_711_3 = arg_708_1:GetWordFromCfg(1101106168)
				local var_711_4 = arg_708_1:FormatText(var_711_3.content)

				arg_708_1.text_.text = var_711_4

				LuaForUtil.ClearLinePrefixSymbol(arg_708_1.text_)

				local var_711_5 = 15
				local var_711_6 = utf8.len(var_711_4)
				local var_711_7 = var_711_5 <= 0 and var_711_1 or var_711_1 * (var_711_6 / var_711_5)

				if var_711_7 > 0 and var_711_1 < var_711_7 then
					arg_708_1.talkMaxDuration = var_711_7

					if var_711_7 + var_711_0 > arg_708_1.duration_ then
						arg_708_1.duration_ = var_711_7 + var_711_0
					end
				end

				arg_708_1.text_.text = var_711_4
				arg_708_1.typewritter.percent = 0

				arg_708_1.typewritter:SetDirty()
				arg_708_1:ShowNextGo(false)
				arg_708_1:RecordContent(arg_708_1.text_.text)
			end

			local var_711_8 = math.max(var_711_1, arg_708_1.talkMaxDuration)

			if var_711_0 <= arg_708_1.time_ and arg_708_1.time_ < var_711_0 + var_711_8 then
				arg_708_1.typewritter.percent = (arg_708_1.time_ - var_711_0) / var_711_8

				arg_708_1.typewritter:SetDirty()
			end

			if arg_708_1.time_ >= var_711_0 + var_711_8 and arg_708_1.time_ < var_711_0 + var_711_8 + arg_711_0 then
				arg_708_1.typewritter.percent = 1

				arg_708_1.typewritter:SetDirty()
				arg_708_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106169 = function(arg_712_0, arg_712_1)
		arg_712_1.time_ = 0
		arg_712_1.frameCnt_ = 0
		arg_712_1.state_ = "playing"
		arg_712_1.curTalkId_ = 1101106169
		arg_712_1.duration_ = 5.6

		SetActive(arg_712_1.tipsGo_, false)

		function arg_712_1.onSingleLineFinish_()
			arg_712_1.onSingleLineUpdate_ = nil
			arg_712_1.onSingleLineFinish_ = nil
			arg_712_1.state_ = "waiting"
		end

		function arg_712_1.playNext_(arg_714_0)
			if arg_714_0 == 1 then
				arg_712_0:Play1101106170(arg_712_1)
			end
		end

		function arg_712_1.onSingleLineUpdate_(arg_715_0)
			local var_715_0 = 2

			if var_715_0 < arg_712_1.time_ and arg_712_1.time_ <= var_715_0 + arg_715_0 then
				local var_715_1 = manager.ui.mainCamera.transform.localPosition
				local var_715_2 = Vector3.New(0, 0, 10) + Vector3.New(var_715_1.x, var_715_1.y, 0)
				local var_715_3 = arg_712_1.bgs_.STblack

				var_715_3.transform.localPosition = var_715_2
				var_715_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_715_4 = var_715_3:GetComponent("SpriteRenderer")

				if var_715_4 and var_715_4.sprite then
					local var_715_5 = (var_715_3.transform.localPosition - var_715_1).z
					local var_715_6 = manager.ui.mainCameraCom_
					local var_715_7 = 2 * var_715_5 * Mathf.Tan(var_715_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_715_8 = var_715_7 * var_715_6.aspect
					local var_715_9 = var_715_4.sprite.bounds.size.x
					local var_715_10 = var_715_4.sprite.bounds.size.y
					local var_715_11 = var_715_8 / var_715_9
					local var_715_12 = var_715_7 / var_715_10
					local var_715_13 = var_715_12 < var_715_11 and var_715_11 or var_715_12

					var_715_3.transform.localScale = Vector3.New(var_715_13, var_715_13, 0)
				end

				for iter_715_0, iter_715_1 in pairs(arg_712_1.bgs_) do
					if iter_715_0 ~= "STblack" then
						iter_715_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_715_14 = 0

			if var_715_14 < arg_712_1.time_ and arg_712_1.time_ <= var_715_14 + arg_715_0 then
				arg_712_1.mask_.enabled = true
				arg_712_1.mask_.raycastTarget = true

				arg_712_1:SetGaussion(false)
			end

			local var_715_15 = 2

			if var_715_14 <= arg_712_1.time_ and arg_712_1.time_ < var_715_14 + var_715_15 then
				local var_715_16 = (arg_712_1.time_ - var_715_14) / var_715_15
				local var_715_17 = Color.New(0, 0, 0)

				var_715_17.a = Mathf.Lerp(0, 1, var_715_16)
				arg_712_1.mask_.color = var_715_17
			end

			if arg_712_1.time_ >= var_715_14 + var_715_15 and arg_712_1.time_ < var_715_14 + var_715_15 + arg_715_0 then
				local var_715_18 = Color.New(0, 0, 0)

				var_715_18.a = 1
				arg_712_1.mask_.color = var_715_18
			end

			local var_715_19 = 2

			if var_715_19 < arg_712_1.time_ and arg_712_1.time_ <= var_715_19 + arg_715_0 then
				arg_712_1.mask_.enabled = true
				arg_712_1.mask_.raycastTarget = true

				arg_712_1:SetGaussion(false)
			end

			local var_715_20 = 2

			if var_715_19 <= arg_712_1.time_ and arg_712_1.time_ < var_715_19 + var_715_20 then
				local var_715_21 = (arg_712_1.time_ - var_715_19) / var_715_20
				local var_715_22 = Color.New(0, 0, 0)

				var_715_22.a = Mathf.Lerp(1, 0, var_715_21)
				arg_712_1.mask_.color = var_715_22
			end

			if arg_712_1.time_ >= var_715_19 + var_715_20 and arg_712_1.time_ < var_715_19 + var_715_20 + arg_715_0 then
				local var_715_23 = Color.New(0, 0, 0)
				local var_715_24 = 0

				arg_712_1.mask_.enabled = false
				var_715_23.a = var_715_24
				arg_712_1.mask_.color = var_715_23
			end

			local var_715_25 = 2

			if var_715_25 < arg_712_1.time_ and arg_712_1.time_ <= var_715_25 + arg_715_0 then
				arg_712_1.fswbg_:SetActive(true)
				arg_712_1.dialog_:SetActive(false)

				arg_712_1.fswtw_.percent = 0

				local var_715_26 = arg_712_1:GetWordFromCfg(1101106169)
				local var_715_27 = arg_712_1:FormatText(var_715_26.content)

				arg_712_1.fswt_.text = var_715_27

				LuaForUtil.ClearLinePrefixSymbol(arg_712_1.fswt_)

				arg_712_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_712_1.fswtw_:SetDirty()

				arg_712_1.typewritterCharCountI18N = 0
				arg_712_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_712_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_712_1:ShowNextGo(false)
			end

			local var_715_28 = 4

			if var_715_28 < arg_712_1.time_ and arg_712_1.time_ <= var_715_28 + arg_715_0 then
				arg_712_1.var_.oldValueTypewriter = arg_712_1.fswtw_.percent
				arg_712_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_712_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_712_1:ShowNextGo(false)
			end

			local var_715_29 = 24
			local var_715_30 = 1.6
			local var_715_31 = arg_712_1:GetWordFromCfg(1101106169)
			local var_715_32 = arg_712_1:FormatText(var_715_31.content)
			local var_715_33, var_715_34 = arg_712_1:GetPercentByPara(var_715_32, 1)

			if var_715_28 < arg_712_1.time_ and arg_712_1.time_ <= var_715_28 + arg_715_0 then
				arg_712_1.talkMaxDuration = 0

				local var_715_35 = var_715_29 <= 0 and var_715_30 or var_715_30 * ((var_715_34 - arg_712_1.typewritterCharCountI18N) / var_715_29)

				if var_715_35 > 0 and var_715_30 < var_715_35 then
					arg_712_1.talkMaxDuration = var_715_35

					if var_715_35 + var_715_28 > arg_712_1.duration_ then
						arg_712_1.duration_ = var_715_35 + var_715_28
					end
				end
			end

			local var_715_36 = 1.6
			local var_715_37 = math.max(var_715_36, arg_712_1.talkMaxDuration)

			if var_715_28 <= arg_712_1.time_ and arg_712_1.time_ < var_715_28 + var_715_37 then
				local var_715_38 = (arg_712_1.time_ - var_715_28) / var_715_37

				arg_712_1.fswtw_.percent = Mathf.Lerp(arg_712_1.var_.oldValueTypewriter, var_715_33, var_715_38)
				arg_712_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_712_1.fswtw_:SetDirty()
			end

			if arg_712_1.time_ >= var_715_28 + var_715_37 and arg_712_1.time_ < var_715_28 + var_715_37 + arg_715_0 then
				arg_712_1.fswtw_.percent = var_715_33

				arg_712_1.fswtw_:SetDirty()
				arg_712_1:ShowNextGo(true)

				arg_712_1.typewritterCharCountI18N = var_715_34
			end

			local var_715_39 = 4.01666666666667

			if var_715_39 < arg_712_1.time_ and arg_712_1.time_ <= var_715_39 + arg_715_0 then
				local var_715_40 = arg_712_1.fswbg_.transform:Find("textbox/adapt/content") or arg_712_1.fswbg_.transform:Find("textbox/content")

				arg_712_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				local var_715_41 = var_715_40:GetComponent("Text")
				local var_715_42 = var_715_40:GetComponent("RectTransform")

				var_715_41.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_715_42.offsetMin = Vector2.New(0, 0)
				var_715_42.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play1101106170 = function(arg_716_0, arg_716_1)
		arg_716_1.time_ = 0
		arg_716_1.frameCnt_ = 0
		arg_716_1.state_ = "playing"
		arg_716_1.curTalkId_ = 1101106170
		arg_716_1.duration_ = 3.97

		local var_716_0 = {
			zh = 2.133,
			ja = 3.966
		}
		local var_716_1 = manager.audio:GetLocalizationFlag()

		if var_716_0[var_716_1] ~= nil then
			arg_716_1.duration_ = var_716_0[var_716_1]
		end

		SetActive(arg_716_1.tipsGo_, false)

		function arg_716_1.onSingleLineFinish_()
			arg_716_1.onSingleLineUpdate_ = nil
			arg_716_1.onSingleLineFinish_ = nil
			arg_716_1.state_ = "waiting"
		end

		function arg_716_1.playNext_(arg_718_0)
			if arg_718_0 == 1 then
				arg_716_0:Play1101106171(arg_716_1)
			end
		end

		function arg_716_1.onSingleLineUpdate_(arg_719_0)
			local var_719_0 = 0

			if var_719_0 < arg_716_1.time_ and arg_716_1.time_ <= var_719_0 + arg_719_0 then
				arg_716_1.fswbg_:SetActive(false)
				arg_716_1.dialog_:SetActive(true)

				arg_716_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_716_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_716_1:ShowNextGo(false)
			end

			local var_719_1 = 0
			local var_719_2 = 0.125

			if var_719_1 < arg_716_1.time_ and arg_716_1.time_ <= var_719_1 + arg_719_0 then
				arg_716_1.talkMaxDuration = 0
				arg_716_1.dialogCg_.alpha = 1

				arg_716_1.dialog_:SetActive(true)
				SetActive(arg_716_1.leftNameGo_, true)

				local var_719_3 = arg_716_1:FormatText(StoryNameCfg[37].name)

				arg_716_1.leftNameTxt_.text = var_719_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_716_1.leftNameTxt_.transform)

				arg_716_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_716_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_716_1:RecordName(arg_716_1.leftNameTxt_.text)
				SetActive(arg_716_1.iconTrs_.gameObject, true)
				arg_716_1.iconController_:SetSelectedState("hero")

				arg_716_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_716_1.callingController_:SetSelectedState("normal")

				arg_716_1.keyicon_.color = Color.New(1, 1, 1)
				arg_716_1.icon_.color = Color.New(1, 1, 1)

				local var_719_4 = arg_716_1:GetWordFromCfg(1101106170)
				local var_719_5 = arg_716_1:FormatText(var_719_4.content)

				arg_716_1.text_.text = var_719_5

				LuaForUtil.ClearLinePrefixSymbol(arg_716_1.text_)

				local var_719_6 = 5
				local var_719_7 = utf8.len(var_719_5)
				local var_719_8 = var_719_6 <= 0 and var_719_2 or var_719_2 * (var_719_7 / var_719_6)

				if var_719_8 > 0 and var_719_2 < var_719_8 then
					arg_716_1.talkMaxDuration = var_719_8

					if var_719_8 + var_719_1 > arg_716_1.duration_ then
						arg_716_1.duration_ = var_719_8 + var_719_1
					end
				end

				arg_716_1.text_.text = var_719_5
				arg_716_1.typewritter.percent = 0

				arg_716_1.typewritter:SetDirty()
				arg_716_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb") ~= 0 then
					local var_719_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb") / 1000

					if var_719_9 + var_719_1 > arg_716_1.duration_ then
						arg_716_1.duration_ = var_719_9 + var_719_1
					end

					if var_719_4.prefab_name ~= "" and arg_716_1.actors_[var_719_4.prefab_name] ~= nil then
						local var_719_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_716_1.actors_[var_719_4.prefab_name].transform, "story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")

						arg_716_1:RecordAudio("1101106170", var_719_10)
						arg_716_1:RecordAudio("1101106170", var_719_10)
					else
						arg_716_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")
					end

					arg_716_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")
				end

				arg_716_1:RecordContent(arg_716_1.text_.text)
			end

			local var_719_11 = math.max(var_719_2, arg_716_1.talkMaxDuration)

			if var_719_1 <= arg_716_1.time_ and arg_716_1.time_ < var_719_1 + var_719_11 then
				arg_716_1.typewritter.percent = (arg_716_1.time_ - var_719_1) / var_719_11

				arg_716_1.typewritter:SetDirty()
			end

			if arg_716_1.time_ >= var_719_1 + var_719_11 and arg_716_1.time_ < var_719_1 + var_719_11 + arg_719_0 then
				arg_716_1.typewritter.percent = 1

				arg_716_1.typewritter:SetDirty()
				arg_716_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106171 = function(arg_720_0, arg_720_1)
		arg_720_1.time_ = 0
		arg_720_1.frameCnt_ = 0
		arg_720_1.state_ = "playing"
		arg_720_1.curTalkId_ = 1101106171
		arg_720_1.duration_ = 5

		SetActive(arg_720_1.tipsGo_, false)

		function arg_720_1.onSingleLineFinish_()
			arg_720_1.onSingleLineUpdate_ = nil
			arg_720_1.onSingleLineFinish_ = nil
			arg_720_1.state_ = "waiting"
		end

		function arg_720_1.playNext_(arg_722_0)
			if arg_722_0 == 1 then
				arg_720_0:Play1101106172(arg_720_1)
			end
		end

		function arg_720_1.onSingleLineUpdate_(arg_723_0)
			local var_723_0 = 0
			local var_723_1 = 0.175

			if var_723_0 < arg_720_1.time_ and arg_720_1.time_ <= var_723_0 + arg_723_0 then
				arg_720_1.talkMaxDuration = 0
				arg_720_1.dialogCg_.alpha = 1

				arg_720_1.dialog_:SetActive(true)
				SetActive(arg_720_1.leftNameGo_, true)

				local var_723_2 = arg_720_1:FormatText(StoryNameCfg[7].name)

				arg_720_1.leftNameTxt_.text = var_723_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_720_1.leftNameTxt_.transform)

				arg_720_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_720_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_720_1:RecordName(arg_720_1.leftNameTxt_.text)
				SetActive(arg_720_1.iconTrs_.gameObject, false)
				arg_720_1.callingController_:SetSelectedState("normal")

				local var_723_3 = arg_720_1:GetWordFromCfg(1101106171)
				local var_723_4 = arg_720_1:FormatText(var_723_3.content)

				arg_720_1.text_.text = var_723_4

				LuaForUtil.ClearLinePrefixSymbol(arg_720_1.text_)

				local var_723_5 = 7
				local var_723_6 = utf8.len(var_723_4)
				local var_723_7 = var_723_5 <= 0 and var_723_1 or var_723_1 * (var_723_6 / var_723_5)

				if var_723_7 > 0 and var_723_1 < var_723_7 then
					arg_720_1.talkMaxDuration = var_723_7

					if var_723_7 + var_723_0 > arg_720_1.duration_ then
						arg_720_1.duration_ = var_723_7 + var_723_0
					end
				end

				arg_720_1.text_.text = var_723_4
				arg_720_1.typewritter.percent = 0

				arg_720_1.typewritter:SetDirty()
				arg_720_1:ShowNextGo(false)
				arg_720_1:RecordContent(arg_720_1.text_.text)
			end

			local var_723_8 = math.max(var_723_1, arg_720_1.talkMaxDuration)

			if var_723_0 <= arg_720_1.time_ and arg_720_1.time_ < var_723_0 + var_723_8 then
				arg_720_1.typewritter.percent = (arg_720_1.time_ - var_723_0) / var_723_8

				arg_720_1.typewritter:SetDirty()
			end

			if arg_720_1.time_ >= var_723_0 + var_723_8 and arg_720_1.time_ < var_723_0 + var_723_8 + arg_723_0 then
				arg_720_1.typewritter.percent = 1

				arg_720_1.typewritter:SetDirty()
				arg_720_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106172 = function(arg_724_0, arg_724_1)
		arg_724_1.time_ = 0
		arg_724_1.frameCnt_ = 0
		arg_724_1.state_ = "playing"
		arg_724_1.curTalkId_ = 1101106172
		arg_724_1.duration_ = 3.8

		local var_724_0 = {
			zh = 3.166,
			ja = 3.8
		}
		local var_724_1 = manager.audio:GetLocalizationFlag()

		if var_724_0[var_724_1] ~= nil then
			arg_724_1.duration_ = var_724_0[var_724_1]
		end

		SetActive(arg_724_1.tipsGo_, false)

		function arg_724_1.onSingleLineFinish_()
			arg_724_1.onSingleLineUpdate_ = nil
			arg_724_1.onSingleLineFinish_ = nil
			arg_724_1.state_ = "waiting"
		end

		function arg_724_1.playNext_(arg_726_0)
			if arg_726_0 == 1 then
				arg_724_0:Play1101106173(arg_724_1)
			end
		end

		function arg_724_1.onSingleLineUpdate_(arg_727_0)
			local var_727_0 = 0
			local var_727_1 = 0.2

			if var_727_0 < arg_724_1.time_ and arg_724_1.time_ <= var_727_0 + arg_727_0 then
				arg_724_1.talkMaxDuration = 0
				arg_724_1.dialogCg_.alpha = 1

				arg_724_1.dialog_:SetActive(true)
				SetActive(arg_724_1.leftNameGo_, true)

				local var_727_2 = arg_724_1:FormatText(StoryNameCfg[37].name)

				arg_724_1.leftNameTxt_.text = var_727_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_724_1.leftNameTxt_.transform)

				arg_724_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_724_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_724_1:RecordName(arg_724_1.leftNameTxt_.text)
				SetActive(arg_724_1.iconTrs_.gameObject, true)
				arg_724_1.iconController_:SetSelectedState("hero")

				arg_724_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_724_1.callingController_:SetSelectedState("normal")

				arg_724_1.keyicon_.color = Color.New(1, 1, 1)
				arg_724_1.icon_.color = Color.New(1, 1, 1)

				local var_727_3 = arg_724_1:GetWordFromCfg(1101106172)
				local var_727_4 = arg_724_1:FormatText(var_727_3.content)

				arg_724_1.text_.text = var_727_4

				LuaForUtil.ClearLinePrefixSymbol(arg_724_1.text_)

				local var_727_5 = 8
				local var_727_6 = utf8.len(var_727_4)
				local var_727_7 = var_727_5 <= 0 and var_727_1 or var_727_1 * (var_727_6 / var_727_5)

				if var_727_7 > 0 and var_727_1 < var_727_7 then
					arg_724_1.talkMaxDuration = var_727_7

					if var_727_7 + var_727_0 > arg_724_1.duration_ then
						arg_724_1.duration_ = var_727_7 + var_727_0
					end
				end

				arg_724_1.text_.text = var_727_4
				arg_724_1.typewritter.percent = 0

				arg_724_1.typewritter:SetDirty()
				arg_724_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb") ~= 0 then
					local var_727_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb") / 1000

					if var_727_8 + var_727_0 > arg_724_1.duration_ then
						arg_724_1.duration_ = var_727_8 + var_727_0
					end

					if var_727_3.prefab_name ~= "" and arg_724_1.actors_[var_727_3.prefab_name] ~= nil then
						local var_727_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_724_1.actors_[var_727_3.prefab_name].transform, "story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")

						arg_724_1:RecordAudio("1101106172", var_727_9)
						arg_724_1:RecordAudio("1101106172", var_727_9)
					else
						arg_724_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")
					end

					arg_724_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")
				end

				arg_724_1:RecordContent(arg_724_1.text_.text)
			end

			local var_727_10 = math.max(var_727_1, arg_724_1.talkMaxDuration)

			if var_727_0 <= arg_724_1.time_ and arg_724_1.time_ < var_727_0 + var_727_10 then
				arg_724_1.typewritter.percent = (arg_724_1.time_ - var_727_0) / var_727_10

				arg_724_1.typewritter:SetDirty()
			end

			if arg_724_1.time_ >= var_727_0 + var_727_10 and arg_724_1.time_ < var_727_0 + var_727_10 + arg_727_0 then
				arg_724_1.typewritter.percent = 1

				arg_724_1.typewritter:SetDirty()
				arg_724_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106173 = function(arg_728_0, arg_728_1)
		arg_728_1.time_ = 0
		arg_728_1.frameCnt_ = 0
		arg_728_1.state_ = "playing"
		arg_728_1.curTalkId_ = 1101106173
		arg_728_1.duration_ = 5

		SetActive(arg_728_1.tipsGo_, false)

		function arg_728_1.onSingleLineFinish_()
			arg_728_1.onSingleLineUpdate_ = nil
			arg_728_1.onSingleLineFinish_ = nil
			arg_728_1.state_ = "waiting"
		end

		function arg_728_1.playNext_(arg_730_0)
			if arg_730_0 == 1 then
				arg_728_0:Play1101106174(arg_728_1)
			end
		end

		function arg_728_1.onSingleLineUpdate_(arg_731_0)
			local var_731_0 = 0
			local var_731_1 = 0.55

			if var_731_0 < arg_728_1.time_ and arg_728_1.time_ <= var_731_0 + arg_731_0 then
				arg_728_1.talkMaxDuration = 0
				arg_728_1.dialogCg_.alpha = 1

				arg_728_1.dialog_:SetActive(true)
				SetActive(arg_728_1.leftNameGo_, true)

				local var_731_2 = arg_728_1:FormatText(StoryNameCfg[7].name)

				arg_728_1.leftNameTxt_.text = var_731_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_728_1.leftNameTxt_.transform)

				arg_728_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_728_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_728_1:RecordName(arg_728_1.leftNameTxt_.text)
				SetActive(arg_728_1.iconTrs_.gameObject, false)
				arg_728_1.callingController_:SetSelectedState("normal")

				local var_731_3 = arg_728_1:GetWordFromCfg(1101106173)
				local var_731_4 = arg_728_1:FormatText(var_731_3.content)

				arg_728_1.text_.text = var_731_4

				LuaForUtil.ClearLinePrefixSymbol(arg_728_1.text_)

				local var_731_5 = 22
				local var_731_6 = utf8.len(var_731_4)
				local var_731_7 = var_731_5 <= 0 and var_731_1 or var_731_1 * (var_731_6 / var_731_5)

				if var_731_7 > 0 and var_731_1 < var_731_7 then
					arg_728_1.talkMaxDuration = var_731_7

					if var_731_7 + var_731_0 > arg_728_1.duration_ then
						arg_728_1.duration_ = var_731_7 + var_731_0
					end
				end

				arg_728_1.text_.text = var_731_4
				arg_728_1.typewritter.percent = 0

				arg_728_1.typewritter:SetDirty()
				arg_728_1:ShowNextGo(false)
				arg_728_1:RecordContent(arg_728_1.text_.text)
			end

			local var_731_8 = math.max(var_731_1, arg_728_1.talkMaxDuration)

			if var_731_0 <= arg_728_1.time_ and arg_728_1.time_ < var_731_0 + var_731_8 then
				arg_728_1.typewritter.percent = (arg_728_1.time_ - var_731_0) / var_731_8

				arg_728_1.typewritter:SetDirty()
			end

			if arg_728_1.time_ >= var_731_0 + var_731_8 and arg_728_1.time_ < var_731_0 + var_731_8 + arg_731_0 then
				arg_728_1.typewritter.percent = 1

				arg_728_1.typewritter:SetDirty()
				arg_728_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106174 = function(arg_732_0, arg_732_1)
		arg_732_1.time_ = 0
		arg_732_1.frameCnt_ = 0
		arg_732_1.state_ = "playing"
		arg_732_1.curTalkId_ = 1101106174
		arg_732_1.duration_ = 5

		SetActive(arg_732_1.tipsGo_, false)

		function arg_732_1.onSingleLineFinish_()
			arg_732_1.onSingleLineUpdate_ = nil
			arg_732_1.onSingleLineFinish_ = nil
			arg_732_1.state_ = "waiting"
		end

		function arg_732_1.playNext_(arg_734_0)
			if arg_734_0 == 1 then
				arg_732_0:Play1101106175(arg_732_1)
			end
		end

		function arg_732_1.onSingleLineUpdate_(arg_735_0)
			local var_735_0 = 0
			local var_735_1 = 0.575

			if var_735_0 < arg_732_1.time_ and arg_732_1.time_ <= var_735_0 + arg_735_0 then
				arg_732_1.talkMaxDuration = 0
				arg_732_1.dialogCg_.alpha = 1

				arg_732_1.dialog_:SetActive(true)
				SetActive(arg_732_1.leftNameGo_, true)

				local var_735_2 = arg_732_1:FormatText(StoryNameCfg[7].name)

				arg_732_1.leftNameTxt_.text = var_735_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_732_1.leftNameTxt_.transform)

				arg_732_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_732_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_732_1:RecordName(arg_732_1.leftNameTxt_.text)
				SetActive(arg_732_1.iconTrs_.gameObject, false)
				arg_732_1.callingController_:SetSelectedState("normal")

				local var_735_3 = arg_732_1:GetWordFromCfg(1101106174)
				local var_735_4 = arg_732_1:FormatText(var_735_3.content)

				arg_732_1.text_.text = var_735_4

				LuaForUtil.ClearLinePrefixSymbol(arg_732_1.text_)

				local var_735_5 = 23
				local var_735_6 = utf8.len(var_735_4)
				local var_735_7 = var_735_5 <= 0 and var_735_1 or var_735_1 * (var_735_6 / var_735_5)

				if var_735_7 > 0 and var_735_1 < var_735_7 then
					arg_732_1.talkMaxDuration = var_735_7

					if var_735_7 + var_735_0 > arg_732_1.duration_ then
						arg_732_1.duration_ = var_735_7 + var_735_0
					end
				end

				arg_732_1.text_.text = var_735_4
				arg_732_1.typewritter.percent = 0

				arg_732_1.typewritter:SetDirty()
				arg_732_1:ShowNextGo(false)
				arg_732_1:RecordContent(arg_732_1.text_.text)
			end

			local var_735_8 = math.max(var_735_1, arg_732_1.talkMaxDuration)

			if var_735_0 <= arg_732_1.time_ and arg_732_1.time_ < var_735_0 + var_735_8 then
				arg_732_1.typewritter.percent = (arg_732_1.time_ - var_735_0) / var_735_8

				arg_732_1.typewritter:SetDirty()
			end

			if arg_732_1.time_ >= var_735_0 + var_735_8 and arg_732_1.time_ < var_735_0 + var_735_8 + arg_735_0 then
				arg_732_1.typewritter.percent = 1

				arg_732_1.typewritter:SetDirty()
				arg_732_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106175 = function(arg_736_0, arg_736_1)
		arg_736_1.time_ = 0
		arg_736_1.frameCnt_ = 0
		arg_736_1.state_ = "playing"
		arg_736_1.curTalkId_ = 1101106175
		arg_736_1.duration_ = 3.47

		local var_736_0 = {
			zh = 1.833,
			ja = 3.466
		}
		local var_736_1 = manager.audio:GetLocalizationFlag()

		if var_736_0[var_736_1] ~= nil then
			arg_736_1.duration_ = var_736_0[var_736_1]
		end

		SetActive(arg_736_1.tipsGo_, false)

		function arg_736_1.onSingleLineFinish_()
			arg_736_1.onSingleLineUpdate_ = nil
			arg_736_1.onSingleLineFinish_ = nil
			arg_736_1.state_ = "waiting"
		end

		function arg_736_1.playNext_(arg_738_0)
			if arg_738_0 == 1 then
				arg_736_0:Play1101106176(arg_736_1)
			end
		end

		function arg_736_1.onSingleLineUpdate_(arg_739_0)
			local var_739_0 = 0
			local var_739_1 = 0.125

			if var_739_0 < arg_736_1.time_ and arg_736_1.time_ <= var_739_0 + arg_739_0 then
				arg_736_1.talkMaxDuration = 0
				arg_736_1.dialogCg_.alpha = 1

				arg_736_1.dialog_:SetActive(true)
				SetActive(arg_736_1.leftNameGo_, true)

				local var_739_2 = arg_736_1:FormatText(StoryNameCfg[37].name)

				arg_736_1.leftNameTxt_.text = var_739_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_736_1.leftNameTxt_.transform)

				arg_736_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_736_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_736_1:RecordName(arg_736_1.leftNameTxt_.text)
				SetActive(arg_736_1.iconTrs_.gameObject, true)
				arg_736_1.iconController_:SetSelectedState("hero")

				arg_736_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_736_1.callingController_:SetSelectedState("normal")

				arg_736_1.keyicon_.color = Color.New(1, 1, 1)
				arg_736_1.icon_.color = Color.New(1, 1, 1)

				local var_739_3 = arg_736_1:GetWordFromCfg(1101106175)
				local var_739_4 = arg_736_1:FormatText(var_739_3.content)

				arg_736_1.text_.text = var_739_4

				LuaForUtil.ClearLinePrefixSymbol(arg_736_1.text_)

				local var_739_5 = 5
				local var_739_6 = utf8.len(var_739_4)
				local var_739_7 = var_739_5 <= 0 and var_739_1 or var_739_1 * (var_739_6 / var_739_5)

				if var_739_7 > 0 and var_739_1 < var_739_7 then
					arg_736_1.talkMaxDuration = var_739_7

					if var_739_7 + var_739_0 > arg_736_1.duration_ then
						arg_736_1.duration_ = var_739_7 + var_739_0
					end
				end

				arg_736_1.text_.text = var_739_4
				arg_736_1.typewritter.percent = 0

				arg_736_1.typewritter:SetDirty()
				arg_736_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb") ~= 0 then
					local var_739_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb") / 1000

					if var_739_8 + var_739_0 > arg_736_1.duration_ then
						arg_736_1.duration_ = var_739_8 + var_739_0
					end

					if var_739_3.prefab_name ~= "" and arg_736_1.actors_[var_739_3.prefab_name] ~= nil then
						local var_739_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_736_1.actors_[var_739_3.prefab_name].transform, "story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")

						arg_736_1:RecordAudio("1101106175", var_739_9)
						arg_736_1:RecordAudio("1101106175", var_739_9)
					else
						arg_736_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")
					end

					arg_736_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")
				end

				arg_736_1:RecordContent(arg_736_1.text_.text)
			end

			local var_739_10 = math.max(var_739_1, arg_736_1.talkMaxDuration)

			if var_739_0 <= arg_736_1.time_ and arg_736_1.time_ < var_739_0 + var_739_10 then
				arg_736_1.typewritter.percent = (arg_736_1.time_ - var_739_0) / var_739_10

				arg_736_1.typewritter:SetDirty()
			end

			if arg_736_1.time_ >= var_739_0 + var_739_10 and arg_736_1.time_ < var_739_0 + var_739_10 + arg_739_0 then
				arg_736_1.typewritter.percent = 1

				arg_736_1.typewritter:SetDirty()
				arg_736_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106176 = function(arg_740_0, arg_740_1)
		arg_740_1.time_ = 0
		arg_740_1.frameCnt_ = 0
		arg_740_1.state_ = "playing"
		arg_740_1.curTalkId_ = 1101106176
		arg_740_1.duration_ = 8

		SetActive(arg_740_1.tipsGo_, false)

		function arg_740_1.onSingleLineFinish_()
			arg_740_1.onSingleLineUpdate_ = nil
			arg_740_1.onSingleLineFinish_ = nil
			arg_740_1.state_ = "waiting"
		end

		function arg_740_1.playNext_(arg_742_0)
			if arg_742_0 == 1 then
				arg_740_0:Play1101106177(arg_740_1)
			end
		end

		function arg_740_1.onSingleLineUpdate_(arg_743_0)
			local var_743_0 = 0

			if var_743_0 < arg_740_1.time_ and arg_740_1.time_ <= var_743_0 + arg_743_0 then
				arg_740_1.mask_.enabled = true
				arg_740_1.mask_.raycastTarget = true

				arg_740_1:SetGaussion(false)
			end

			local var_743_1 = 3

			if var_743_0 <= arg_740_1.time_ and arg_740_1.time_ < var_743_0 + var_743_1 then
				local var_743_2 = (arg_740_1.time_ - var_743_0) / var_743_1
				local var_743_3 = Color.New(0, 0, 0)

				var_743_3.a = Mathf.Lerp(1, 0, var_743_2)
				arg_740_1.mask_.color = var_743_3
			end

			if arg_740_1.time_ >= var_743_0 + var_743_1 and arg_740_1.time_ < var_743_0 + var_743_1 + arg_743_0 then
				local var_743_4 = Color.New(0, 0, 0)
				local var_743_5 = 0

				arg_740_1.mask_.enabled = false
				var_743_4.a = var_743_5
				arg_740_1.mask_.color = var_743_4
			end

			local var_743_6 = "R1102"

			if arg_740_1.bgs_[var_743_6] == nil then
				local var_743_7 = Object.Instantiate(arg_740_1.paintGo_)

				var_743_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_743_6)
				var_743_7.name = var_743_6
				var_743_7.transform.parent = arg_740_1.stage_.transform
				var_743_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_740_1.bgs_[var_743_6] = var_743_7
			end

			local var_743_8 = arg_740_1.bgs_.R1102.transform
			local var_743_9 = 0

			if var_743_9 < arg_740_1.time_ and arg_740_1.time_ <= var_743_9 + arg_743_0 then
				arg_740_1.var_.moveOldPosR1102 = var_743_8.localPosition
			end

			local var_743_10 = 0.001

			if var_743_9 <= arg_740_1.time_ and arg_740_1.time_ < var_743_9 + var_743_10 then
				local var_743_11 = (arg_740_1.time_ - var_743_9) / var_743_10
				local var_743_12 = Vector3.New(0, 1, 10)

				var_743_8.localPosition = Vector3.Lerp(arg_740_1.var_.moveOldPosR1102, var_743_12, var_743_11)
			end

			if arg_740_1.time_ >= var_743_9 + var_743_10 and arg_740_1.time_ < var_743_9 + var_743_10 + arg_743_0 then
				var_743_8.localPosition = Vector3.New(0, 1, 10)
			end

			local var_743_13 = arg_740_1.bgs_.R1102.transform
			local var_743_14 = 0.034

			if var_743_14 < arg_740_1.time_ and arg_740_1.time_ <= var_743_14 + arg_743_0 then
				arg_740_1.var_.moveOldPosR1102 = var_743_13.localPosition
			end

			local var_743_15 = 7

			if var_743_14 <= arg_740_1.time_ and arg_740_1.time_ < var_743_14 + var_743_15 then
				local var_743_16 = (arg_740_1.time_ - var_743_14) / var_743_15
				local var_743_17 = Vector3.New(0, 1, 8)

				var_743_13.localPosition = Vector3.Lerp(arg_740_1.var_.moveOldPosR1102, var_743_17, var_743_16)
			end

			if arg_740_1.time_ >= var_743_14 + var_743_15 and arg_740_1.time_ < var_743_14 + var_743_15 + arg_743_0 then
				var_743_13.localPosition = Vector3.New(0, 1, 8)
			end

			local var_743_18 = 3

			if var_743_18 < arg_740_1.time_ and arg_740_1.time_ <= var_743_18 + arg_743_0 then
				arg_740_1.allBtn_.enabled = false
			end

			local var_743_19 = 1.63333333333333

			if arg_740_1.time_ >= var_743_18 + var_743_19 and arg_740_1.time_ < var_743_18 + var_743_19 + arg_743_0 then
				arg_740_1.allBtn_.enabled = true
			end

			if arg_740_1.frameCnt_ <= 1 then
				arg_740_1.dialog_:SetActive(false)
			end

			local var_743_20 = 3
			local var_743_21 = 0.925

			if var_743_20 < arg_740_1.time_ and arg_740_1.time_ <= var_743_20 + arg_743_0 then
				arg_740_1.talkMaxDuration = 0

				arg_740_1.dialog_:SetActive(true)

				local var_743_22 = LeanTween.value(arg_740_1.dialog_, 0, 1, 0.3)

				var_743_22:setOnUpdate(LuaHelper.FloatAction(function(arg_744_0)
					arg_740_1.dialogCg_.alpha = arg_744_0
				end))
				var_743_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_740_1.dialog_)
					var_743_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_740_1.duration_ = arg_740_1.duration_ + 0.3

				SetActive(arg_740_1.leftNameGo_, false)

				arg_740_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_740_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_740_1:RecordName(arg_740_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_740_1.iconTrs_.gameObject, false)
				arg_740_1.callingController_:SetSelectedState("normal")

				local var_743_23 = arg_740_1:GetWordFromCfg(1101106176)
				local var_743_24 = arg_740_1:FormatText(var_743_23.content)

				arg_740_1.text_.text = var_743_24

				LuaForUtil.ClearLinePrefixSymbol(arg_740_1.text_)

				local var_743_25 = 37
				local var_743_26 = utf8.len(var_743_24)
				local var_743_27 = var_743_25 <= 0 and var_743_21 or var_743_21 * (var_743_26 / var_743_25)

				if var_743_27 > 0 and var_743_21 < var_743_27 then
					arg_740_1.talkMaxDuration = var_743_27
					var_743_20 = var_743_20 + 0.3

					if var_743_27 + var_743_20 > arg_740_1.duration_ then
						arg_740_1.duration_ = var_743_27 + var_743_20
					end
				end

				arg_740_1.text_.text = var_743_24
				arg_740_1.typewritter.percent = 0

				arg_740_1.typewritter:SetDirty()
				arg_740_1:ShowNextGo(false)
				arg_740_1:RecordContent(arg_740_1.text_.text)
			end

			local var_743_28 = var_743_20 + 0.3
			local var_743_29 = math.max(var_743_21, arg_740_1.talkMaxDuration)

			if var_743_28 <= arg_740_1.time_ and arg_740_1.time_ < var_743_28 + var_743_29 then
				arg_740_1.typewritter.percent = (arg_740_1.time_ - var_743_28) / var_743_29

				arg_740_1.typewritter:SetDirty()
			end

			if arg_740_1.time_ >= var_743_28 + var_743_29 and arg_740_1.time_ < var_743_28 + var_743_29 + arg_743_0 then
				arg_740_1.typewritter.percent = 1

				arg_740_1.typewritter:SetDirty()
				arg_740_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106177 = function(arg_746_0, arg_746_1)
		arg_746_1.time_ = 0
		arg_746_1.frameCnt_ = 0
		arg_746_1.state_ = "playing"
		arg_746_1.curTalkId_ = 1101106177
		arg_746_1.duration_ = 13

		SetActive(arg_746_1.tipsGo_, false)

		function arg_746_1.onSingleLineFinish_()
			arg_746_1.onSingleLineUpdate_ = nil
			arg_746_1.onSingleLineFinish_ = nil
			arg_746_1.state_ = "waiting"
		end

		function arg_746_1.playNext_(arg_748_0)
			if arg_748_0 == 1 then
				arg_746_0:Play1101106178(arg_746_1)
			end
		end

		function arg_746_1.onSingleLineUpdate_(arg_749_0)
			local var_749_0 = 0

			if var_749_0 < arg_746_1.time_ and arg_746_1.time_ <= var_749_0 + arg_749_0 then
				arg_746_1.fswbg_:SetActive(true)
				arg_746_1.dialog_:SetActive(false)

				arg_746_1.fswtw_.percent = 0

				local var_749_1 = arg_746_1:GetWordFromCfg(1101106177)
				local var_749_2 = arg_746_1:FormatText(var_749_1.content)

				arg_746_1.fswt_.text = var_749_2

				LuaForUtil.ClearLinePrefixSymbol(arg_746_1.fswt_)

				arg_746_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_746_1.fswtw_:SetDirty()

				arg_746_1.typewritterCharCountI18N = 0
				arg_746_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_746_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_746_1:ShowNextGo(false)
			end

			local var_749_3 = 0.0166666666666667

			if var_749_3 < arg_746_1.time_ and arg_746_1.time_ <= var_749_3 + arg_749_0 then
				arg_746_1.var_.oldValueTypewriter = arg_746_1.fswtw_.percent
				arg_746_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_746_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_746_1:ShowNextGo(false)
			end

			local var_749_4 = 50
			local var_749_5 = 3.33333333333333
			local var_749_6 = arg_746_1:GetWordFromCfg(1101106177)
			local var_749_7 = arg_746_1:FormatText(var_749_6.content)
			local var_749_8, var_749_9 = arg_746_1:GetPercentByPara(var_749_7, 1)

			if var_749_3 < arg_746_1.time_ and arg_746_1.time_ <= var_749_3 + arg_749_0 then
				arg_746_1.talkMaxDuration = 0

				local var_749_10 = var_749_4 <= 0 and var_749_5 or var_749_5 * ((var_749_9 - arg_746_1.typewritterCharCountI18N) / var_749_4)

				if var_749_10 > 0 and var_749_5 < var_749_10 then
					arg_746_1.talkMaxDuration = var_749_10

					if var_749_10 + var_749_3 > arg_746_1.duration_ then
						arg_746_1.duration_ = var_749_10 + var_749_3
					end
				end
			end

			local var_749_11 = 3.33333333333333
			local var_749_12 = math.max(var_749_11, arg_746_1.talkMaxDuration)

			if var_749_3 <= arg_746_1.time_ and arg_746_1.time_ < var_749_3 + var_749_12 then
				local var_749_13 = (arg_746_1.time_ - var_749_3) / var_749_12

				arg_746_1.fswtw_.percent = Mathf.Lerp(arg_746_1.var_.oldValueTypewriter, var_749_8, var_749_13)
				arg_746_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_746_1.fswtw_:SetDirty()
			end

			if arg_746_1.time_ >= var_749_3 + var_749_12 and arg_746_1.time_ < var_749_3 + var_749_12 + arg_749_0 then
				arg_746_1.fswtw_.percent = var_749_8

				arg_746_1.fswtw_:SetDirty()
				arg_746_1:ShowNextGo(true)

				arg_746_1.typewritterCharCountI18N = var_749_9
			end

			local var_749_14 = 0

			if var_749_14 < arg_746_1.time_ and arg_746_1.time_ <= var_749_14 + arg_749_0 then
				local var_749_15 = arg_746_1.fswbg_.transform:Find("textbox/adapt/content") or arg_746_1.fswbg_.transform:Find("textbox/content")

				arg_746_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				local var_749_16 = var_749_15:GetComponent("Text")
				local var_749_17 = var_749_15:GetComponent("RectTransform")

				var_749_16.alignment = UnityEngine.TextAnchor.UpperLeft
				var_749_17.offsetMin = Vector2.New(0, 0)
				var_749_17.offsetMax = Vector2.New(0, 0)
			end

			local var_749_18 = 0
			local var_749_19 = 13
			local var_749_20 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106177", "story_v_side_new_1101106.awb") / 1000

			if var_749_20 > 0 and var_749_19 < var_749_20 and var_749_20 + var_749_18 > arg_746_1.duration_ then
				local var_749_21 = var_749_20

				arg_746_1.duration_ = var_749_20 + var_749_18
			end

			if var_749_18 < arg_746_1.time_ and arg_746_1.time_ <= var_749_18 + arg_749_0 then
				local var_749_22 = "play"
				local var_749_23 = "voice"

				arg_746_1:AudioAction(var_749_22, var_749_23, "story_v_side_new_1101106", "1101106177", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106178 = function(arg_750_0, arg_750_1)
		arg_750_1.time_ = 0
		arg_750_1.frameCnt_ = 0
		arg_750_1.state_ = "playing"
		arg_750_1.curTalkId_ = 1101106178
		arg_750_1.duration_ = 12.93

		SetActive(arg_750_1.tipsGo_, false)

		function arg_750_1.onSingleLineFinish_()
			arg_750_1.onSingleLineUpdate_ = nil
			arg_750_1.onSingleLineFinish_ = nil
			arg_750_1.state_ = "waiting"
		end

		function arg_750_1.playNext_(arg_752_0)
			if arg_752_0 == 1 then
				arg_750_0:Play1101106179(arg_750_1)
			end
		end

		function arg_750_1.onSingleLineUpdate_(arg_753_0)
			local var_753_0 = 0

			if var_753_0 < arg_750_1.time_ and arg_750_1.time_ <= var_753_0 + arg_753_0 then
				arg_750_1.var_.oldValueTypewriter = arg_750_1.fswtw_.percent
				arg_750_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_750_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_750_1:ShowNextGo(false)
			end

			local var_753_1 = 53
			local var_753_2 = 3.53333333333333
			local var_753_3 = arg_750_1:GetWordFromCfg(1101106177)
			local var_753_4 = arg_750_1:FormatText(var_753_3.content)
			local var_753_5, var_753_6 = arg_750_1:GetPercentByPara(var_753_4, 2)

			if var_753_0 < arg_750_1.time_ and arg_750_1.time_ <= var_753_0 + arg_753_0 then
				arg_750_1.talkMaxDuration = 0

				local var_753_7 = var_753_1 <= 0 and var_753_2 or var_753_2 * ((var_753_6 - arg_750_1.typewritterCharCountI18N) / var_753_1)

				if var_753_7 > 0 and var_753_2 < var_753_7 then
					arg_750_1.talkMaxDuration = var_753_7

					if var_753_7 + var_753_0 > arg_750_1.duration_ then
						arg_750_1.duration_ = var_753_7 + var_753_0
					end
				end
			end

			local var_753_8 = 3.53333333333333
			local var_753_9 = math.max(var_753_8, arg_750_1.talkMaxDuration)

			if var_753_0 <= arg_750_1.time_ and arg_750_1.time_ < var_753_0 + var_753_9 then
				local var_753_10 = (arg_750_1.time_ - var_753_0) / var_753_9

				arg_750_1.fswtw_.percent = Mathf.Lerp(arg_750_1.var_.oldValueTypewriter, var_753_5, var_753_10)
				arg_750_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_750_1.fswtw_:SetDirty()
			end

			if arg_750_1.time_ >= var_753_0 + var_753_9 and arg_750_1.time_ < var_753_0 + var_753_9 + arg_753_0 then
				arg_750_1.fswtw_.percent = var_753_5

				arg_750_1.fswtw_:SetDirty()
				arg_750_1:ShowNextGo(true)

				arg_750_1.typewritterCharCountI18N = var_753_6
			end

			local var_753_11 = 0
			local var_753_12 = 12.933
			local var_753_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106178", "story_v_side_new_1101106.awb") / 1000

			if var_753_13 > 0 and var_753_12 < var_753_13 and var_753_13 + var_753_11 > arg_750_1.duration_ then
				local var_753_14 = var_753_13

				arg_750_1.duration_ = var_753_13 + var_753_11
			end

			if var_753_11 < arg_750_1.time_ and arg_750_1.time_ <= var_753_11 + arg_753_0 then
				local var_753_15 = "play"
				local var_753_16 = "voice"

				arg_750_1:AudioAction(var_753_15, var_753_16, "story_v_side_new_1101106", "1101106178", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106179 = function(arg_754_0, arg_754_1)
		arg_754_1.time_ = 0
		arg_754_1.frameCnt_ = 0
		arg_754_1.state_ = "playing"
		arg_754_1.curTalkId_ = 1101106179
		arg_754_1.duration_ = 10.47

		SetActive(arg_754_1.tipsGo_, false)

		function arg_754_1.onSingleLineFinish_()
			arg_754_1.onSingleLineUpdate_ = nil
			arg_754_1.onSingleLineFinish_ = nil
			arg_754_1.state_ = "waiting"
		end

		function arg_754_1.playNext_(arg_756_0)
			if arg_756_0 == 1 then
				arg_754_0:Play1101106180(arg_754_1)
			end
		end

		function arg_754_1.onSingleLineUpdate_(arg_757_0)
			local var_757_0 = 0

			if var_757_0 < arg_754_1.time_ and arg_754_1.time_ <= var_757_0 + arg_757_0 then
				arg_754_1.var_.oldValueTypewriter = arg_754_1.fswtw_.percent
				arg_754_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_754_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_754_1:ShowNextGo(false)
			end

			local var_757_1 = 36
			local var_757_2 = 2.4
			local var_757_3 = arg_754_1:GetWordFromCfg(1101106177)
			local var_757_4 = arg_754_1:FormatText(var_757_3.content)
			local var_757_5, var_757_6 = arg_754_1:GetPercentByPara(var_757_4, 3)

			if var_757_0 < arg_754_1.time_ and arg_754_1.time_ <= var_757_0 + arg_757_0 then
				arg_754_1.talkMaxDuration = 0

				local var_757_7 = var_757_1 <= 0 and var_757_2 or var_757_2 * ((var_757_6 - arg_754_1.typewritterCharCountI18N) / var_757_1)

				if var_757_7 > 0 and var_757_2 < var_757_7 then
					arg_754_1.talkMaxDuration = var_757_7

					if var_757_7 + var_757_0 > arg_754_1.duration_ then
						arg_754_1.duration_ = var_757_7 + var_757_0
					end
				end
			end

			local var_757_8 = 2.4
			local var_757_9 = math.max(var_757_8, arg_754_1.talkMaxDuration)

			if var_757_0 <= arg_754_1.time_ and arg_754_1.time_ < var_757_0 + var_757_9 then
				local var_757_10 = (arg_754_1.time_ - var_757_0) / var_757_9

				arg_754_1.fswtw_.percent = Mathf.Lerp(arg_754_1.var_.oldValueTypewriter, var_757_5, var_757_10)
				arg_754_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_754_1.fswtw_:SetDirty()
			end

			if arg_754_1.time_ >= var_757_0 + var_757_9 and arg_754_1.time_ < var_757_0 + var_757_9 + arg_757_0 then
				arg_754_1.fswtw_.percent = var_757_5

				arg_754_1.fswtw_:SetDirty()
				arg_754_1:ShowNextGo(true)

				arg_754_1.typewritterCharCountI18N = var_757_6
			end

			local var_757_11 = 0
			local var_757_12 = 10.466
			local var_757_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106179", "story_v_side_new_1101106.awb") / 1000

			if var_757_13 > 0 and var_757_12 < var_757_13 and var_757_13 + var_757_11 > arg_754_1.duration_ then
				local var_757_14 = var_757_13

				arg_754_1.duration_ = var_757_13 + var_757_11
			end

			if var_757_11 < arg_754_1.time_ and arg_754_1.time_ <= var_757_11 + arg_757_0 then
				local var_757_15 = "play"
				local var_757_16 = "voice"

				arg_754_1:AudioAction(var_757_15, var_757_16, "story_v_side_new_1101106", "1101106179", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106180 = function(arg_758_0, arg_758_1)
		arg_758_1.time_ = 0
		arg_758_1.frameCnt_ = 0
		arg_758_1.state_ = "playing"
		arg_758_1.curTalkId_ = 1101106180
		arg_758_1.duration_ = 6.4

		SetActive(arg_758_1.tipsGo_, false)

		function arg_758_1.onSingleLineFinish_()
			arg_758_1.onSingleLineUpdate_ = nil
			arg_758_1.onSingleLineFinish_ = nil
			arg_758_1.state_ = "waiting"
		end

		function arg_758_1.playNext_(arg_760_0)
			if arg_760_0 == 1 then
				arg_758_0:Play1101106181(arg_758_1)
			end
		end

		function arg_758_1.onSingleLineUpdate_(arg_761_0)
			local var_761_0 = 0

			if var_761_0 < arg_758_1.time_ and arg_758_1.time_ <= var_761_0 + arg_761_0 then
				arg_758_1.var_.oldValueTypewriter = arg_758_1.fswtw_.percent
				arg_758_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_758_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_758_1:ShowNextGo(false)
			end

			local var_761_1 = 25
			local var_761_2 = 1.66666666666667
			local var_761_3 = arg_758_1:GetWordFromCfg(1101106177)
			local var_761_4 = arg_758_1:FormatText(var_761_3.content)
			local var_761_5, var_761_6 = arg_758_1:GetPercentByPara(var_761_4, 4)

			if var_761_0 < arg_758_1.time_ and arg_758_1.time_ <= var_761_0 + arg_761_0 then
				arg_758_1.talkMaxDuration = 0

				local var_761_7 = var_761_1 <= 0 and var_761_2 or var_761_2 * ((var_761_6 - arg_758_1.typewritterCharCountI18N) / var_761_1)

				if var_761_7 > 0 and var_761_2 < var_761_7 then
					arg_758_1.talkMaxDuration = var_761_7

					if var_761_7 + var_761_0 > arg_758_1.duration_ then
						arg_758_1.duration_ = var_761_7 + var_761_0
					end
				end
			end

			local var_761_8 = 1.66666666666667
			local var_761_9 = math.max(var_761_8, arg_758_1.talkMaxDuration)

			if var_761_0 <= arg_758_1.time_ and arg_758_1.time_ < var_761_0 + var_761_9 then
				local var_761_10 = (arg_758_1.time_ - var_761_0) / var_761_9

				arg_758_1.fswtw_.percent = Mathf.Lerp(arg_758_1.var_.oldValueTypewriter, var_761_5, var_761_10)
				arg_758_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_758_1.fswtw_:SetDirty()
			end

			if arg_758_1.time_ >= var_761_0 + var_761_9 and arg_758_1.time_ < var_761_0 + var_761_9 + arg_761_0 then
				arg_758_1.fswtw_.percent = var_761_5

				arg_758_1.fswtw_:SetDirty()
				arg_758_1:ShowNextGo(true)

				arg_758_1.typewritterCharCountI18N = var_761_6
			end

			local var_761_11 = 0
			local var_761_12 = 6.4
			local var_761_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106180", "story_v_side_new_1101106.awb") / 1000

			if var_761_13 > 0 and var_761_12 < var_761_13 and var_761_13 + var_761_11 > arg_758_1.duration_ then
				local var_761_14 = var_761_13

				arg_758_1.duration_ = var_761_13 + var_761_11
			end

			if var_761_11 < arg_758_1.time_ and arg_758_1.time_ <= var_761_11 + arg_761_0 then
				local var_761_15 = "play"
				local var_761_16 = "voice"

				arg_758_1:AudioAction(var_761_15, var_761_16, "story_v_side_new_1101106", "1101106180", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106181 = function(arg_762_0, arg_762_1)
		arg_762_1.time_ = 0
		arg_762_1.frameCnt_ = 0
		arg_762_1.state_ = "playing"
		arg_762_1.curTalkId_ = 1101106181
		arg_762_1.duration_ = 11.13

		SetActive(arg_762_1.tipsGo_, false)

		function arg_762_1.onSingleLineFinish_()
			arg_762_1.onSingleLineUpdate_ = nil
			arg_762_1.onSingleLineFinish_ = nil
			arg_762_1.state_ = "waiting"
		end

		function arg_762_1.playNext_(arg_764_0)
			if arg_764_0 == 1 then
				arg_762_0:Play1101106182(arg_762_1)
			end
		end

		function arg_762_1.onSingleLineUpdate_(arg_765_0)
			local var_765_0 = 0

			if var_765_0 < arg_762_1.time_ and arg_762_1.time_ <= var_765_0 + arg_765_0 then
				arg_762_1.var_.oldValueTypewriter = arg_762_1.fswtw_.percent
				arg_762_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_762_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_762_1:ShowNextGo(false)
			end

			local var_765_1 = 39
			local var_765_2 = 2.6
			local var_765_3 = arg_762_1:GetWordFromCfg(1101106177)
			local var_765_4 = arg_762_1:FormatText(var_765_3.content)
			local var_765_5, var_765_6 = arg_762_1:GetPercentByPara(var_765_4, 5)

			if var_765_0 < arg_762_1.time_ and arg_762_1.time_ <= var_765_0 + arg_765_0 then
				arg_762_1.talkMaxDuration = 0

				local var_765_7 = var_765_1 <= 0 and var_765_2 or var_765_2 * ((var_765_6 - arg_762_1.typewritterCharCountI18N) / var_765_1)

				if var_765_7 > 0 and var_765_2 < var_765_7 then
					arg_762_1.talkMaxDuration = var_765_7

					if var_765_7 + var_765_0 > arg_762_1.duration_ then
						arg_762_1.duration_ = var_765_7 + var_765_0
					end
				end
			end

			local var_765_8 = 2.6
			local var_765_9 = math.max(var_765_8, arg_762_1.talkMaxDuration)

			if var_765_0 <= arg_762_1.time_ and arg_762_1.time_ < var_765_0 + var_765_9 then
				local var_765_10 = (arg_762_1.time_ - var_765_0) / var_765_9

				arg_762_1.fswtw_.percent = Mathf.Lerp(arg_762_1.var_.oldValueTypewriter, var_765_5, var_765_10)
				arg_762_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_762_1.fswtw_:SetDirty()
			end

			if arg_762_1.time_ >= var_765_0 + var_765_9 and arg_762_1.time_ < var_765_0 + var_765_9 + arg_765_0 then
				arg_762_1.fswtw_.percent = var_765_5

				arg_762_1.fswtw_:SetDirty()
				arg_762_1:ShowNextGo(true)

				arg_762_1.typewritterCharCountI18N = var_765_6
			end

			local var_765_11 = 0
			local var_765_12 = 11.133
			local var_765_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106181", "story_v_side_new_1101106.awb") / 1000

			if var_765_13 > 0 and var_765_12 < var_765_13 and var_765_13 + var_765_11 > arg_762_1.duration_ then
				local var_765_14 = var_765_13

				arg_762_1.duration_ = var_765_13 + var_765_11
			end

			if var_765_11 < arg_762_1.time_ and arg_762_1.time_ <= var_765_11 + arg_765_0 then
				local var_765_15 = "play"
				local var_765_16 = "voice"

				arg_762_1:AudioAction(var_765_15, var_765_16, "story_v_side_new_1101106", "1101106181", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106182 = function(arg_766_0, arg_766_1)
		arg_766_1.time_ = 0
		arg_766_1.frameCnt_ = 0
		arg_766_1.state_ = "playing"
		arg_766_1.curTalkId_ = 1101106182
		arg_766_1.duration_ = 6.63

		SetActive(arg_766_1.tipsGo_, false)

		function arg_766_1.onSingleLineFinish_()
			arg_766_1.onSingleLineUpdate_ = nil
			arg_766_1.onSingleLineFinish_ = nil
			arg_766_1.state_ = "waiting"
		end

		function arg_766_1.playNext_(arg_768_0)
			if arg_768_0 == 1 then
				arg_766_0:Play1101106183(arg_766_1)
			end
		end

		function arg_766_1.onSingleLineUpdate_(arg_769_0)
			local var_769_0 = 0

			if var_769_0 < arg_766_1.time_ and arg_766_1.time_ <= var_769_0 + arg_769_0 then
				arg_766_1.var_.oldValueTypewriter = arg_766_1.fswtw_.percent
				arg_766_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_766_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_766_1:ShowNextGo(false)
			end

			local var_769_1 = 26
			local var_769_2 = 1.73333333333333
			local var_769_3 = arg_766_1:GetWordFromCfg(1101106177)
			local var_769_4 = arg_766_1:FormatText(var_769_3.content)
			local var_769_5, var_769_6 = arg_766_1:GetPercentByPara(var_769_4, 6)

			if var_769_0 < arg_766_1.time_ and arg_766_1.time_ <= var_769_0 + arg_769_0 then
				arg_766_1.talkMaxDuration = 0

				local var_769_7 = var_769_1 <= 0 and var_769_2 or var_769_2 * ((var_769_6 - arg_766_1.typewritterCharCountI18N) / var_769_1)

				if var_769_7 > 0 and var_769_2 < var_769_7 then
					arg_766_1.talkMaxDuration = var_769_7

					if var_769_7 + var_769_0 > arg_766_1.duration_ then
						arg_766_1.duration_ = var_769_7 + var_769_0
					end
				end
			end

			local var_769_8 = 1.73333333333333
			local var_769_9 = math.max(var_769_8, arg_766_1.talkMaxDuration)

			if var_769_0 <= arg_766_1.time_ and arg_766_1.time_ < var_769_0 + var_769_9 then
				local var_769_10 = (arg_766_1.time_ - var_769_0) / var_769_9

				arg_766_1.fswtw_.percent = Mathf.Lerp(arg_766_1.var_.oldValueTypewriter, var_769_5, var_769_10)
				arg_766_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_766_1.fswtw_:SetDirty()
			end

			if arg_766_1.time_ >= var_769_0 + var_769_9 and arg_766_1.time_ < var_769_0 + var_769_9 + arg_769_0 then
				arg_766_1.fswtw_.percent = var_769_5

				arg_766_1.fswtw_:SetDirty()
				arg_766_1:ShowNextGo(true)

				arg_766_1.typewritterCharCountI18N = var_769_6
			end

			local var_769_11 = 0
			local var_769_12 = 6.633
			local var_769_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106182", "story_v_side_new_1101106.awb") / 1000

			if var_769_13 > 0 and var_769_12 < var_769_13 and var_769_13 + var_769_11 > arg_766_1.duration_ then
				local var_769_14 = var_769_13

				arg_766_1.duration_ = var_769_13 + var_769_11
			end

			if var_769_11 < arg_766_1.time_ and arg_766_1.time_ <= var_769_11 + arg_769_0 then
				local var_769_15 = "play"
				local var_769_16 = "voice"

				arg_766_1:AudioAction(var_769_15, var_769_16, "story_v_side_new_1101106", "1101106182", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106183 = function(arg_770_0, arg_770_1)
		arg_770_1.time_ = 0
		arg_770_1.frameCnt_ = 0
		arg_770_1.state_ = "playing"
		arg_770_1.curTalkId_ = 1101106183
		arg_770_1.duration_ = 9.07

		SetActive(arg_770_1.tipsGo_, false)

		function arg_770_1.onSingleLineFinish_()
			arg_770_1.onSingleLineUpdate_ = nil
			arg_770_1.onSingleLineFinish_ = nil
			arg_770_1.state_ = "waiting"
		end

		function arg_770_1.playNext_(arg_772_0)
			if arg_772_0 == 1 then
				arg_770_0:Play1101106184(arg_770_1)
			end
		end

		function arg_770_1.onSingleLineUpdate_(arg_773_0)
			local var_773_0 = 0

			if var_773_0 < arg_770_1.time_ and arg_770_1.time_ <= var_773_0 + arg_773_0 then
				arg_770_1.fswbg_:SetActive(true)
				arg_770_1.dialog_:SetActive(false)

				arg_770_1.fswtw_.percent = 0

				local var_773_1 = arg_770_1:GetWordFromCfg(1101106183)
				local var_773_2 = arg_770_1:FormatText(var_773_1.content)

				arg_770_1.fswt_.text = var_773_2

				LuaForUtil.ClearLinePrefixSymbol(arg_770_1.fswt_)

				arg_770_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_770_1.fswtw_:SetDirty()

				arg_770_1.typewritterCharCountI18N = 0
				arg_770_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_770_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_770_1:ShowNextGo(false)
			end

			local var_773_3 = 0.0166666666666667

			if var_773_3 < arg_770_1.time_ and arg_770_1.time_ <= var_773_3 + arg_773_0 then
				arg_770_1.var_.oldValueTypewriter = arg_770_1.fswtw_.percent
				arg_770_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_770_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_770_1:ShowNextGo(false)
			end

			local var_773_4 = 29
			local var_773_5 = 1.93333333333333
			local var_773_6 = arg_770_1:GetWordFromCfg(1101106183)
			local var_773_7 = arg_770_1:FormatText(var_773_6.content)
			local var_773_8, var_773_9 = arg_770_1:GetPercentByPara(var_773_7, 1)

			if var_773_3 < arg_770_1.time_ and arg_770_1.time_ <= var_773_3 + arg_773_0 then
				arg_770_1.talkMaxDuration = 0

				local var_773_10 = var_773_4 <= 0 and var_773_5 or var_773_5 * ((var_773_9 - arg_770_1.typewritterCharCountI18N) / var_773_4)

				if var_773_10 > 0 and var_773_5 < var_773_10 then
					arg_770_1.talkMaxDuration = var_773_10

					if var_773_10 + var_773_3 > arg_770_1.duration_ then
						arg_770_1.duration_ = var_773_10 + var_773_3
					end
				end
			end

			local var_773_11 = 1.93333333333333
			local var_773_12 = math.max(var_773_11, arg_770_1.talkMaxDuration)

			if var_773_3 <= arg_770_1.time_ and arg_770_1.time_ < var_773_3 + var_773_12 then
				local var_773_13 = (arg_770_1.time_ - var_773_3) / var_773_12

				arg_770_1.fswtw_.percent = Mathf.Lerp(arg_770_1.var_.oldValueTypewriter, var_773_8, var_773_13)
				arg_770_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_770_1.fswtw_:SetDirty()
			end

			if arg_770_1.time_ >= var_773_3 + var_773_12 and arg_770_1.time_ < var_773_3 + var_773_12 + arg_773_0 then
				arg_770_1.fswtw_.percent = var_773_8

				arg_770_1.fswtw_:SetDirty()
				arg_770_1:ShowNextGo(true)

				arg_770_1.typewritterCharCountI18N = var_773_9
			end

			local var_773_14 = 0
			local var_773_15 = 9.066
			local var_773_16 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106183", "story_v_side_new_1101106.awb") / 1000

			if var_773_16 > 0 and var_773_15 < var_773_16 and var_773_16 + var_773_14 > arg_770_1.duration_ then
				local var_773_17 = var_773_16

				arg_770_1.duration_ = var_773_16 + var_773_14
			end

			if var_773_14 < arg_770_1.time_ and arg_770_1.time_ <= var_773_14 + arg_773_0 then
				local var_773_18 = "play"
				local var_773_19 = "voice"

				arg_770_1:AudioAction(var_773_18, var_773_19, "story_v_side_new_1101106", "1101106183", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106184 = function(arg_774_0, arg_774_1)
		arg_774_1.time_ = 0
		arg_774_1.frameCnt_ = 0
		arg_774_1.state_ = "playing"
		arg_774_1.curTalkId_ = 1101106184
		arg_774_1.duration_ = 8.53

		SetActive(arg_774_1.tipsGo_, false)

		function arg_774_1.onSingleLineFinish_()
			arg_774_1.onSingleLineUpdate_ = nil
			arg_774_1.onSingleLineFinish_ = nil
			arg_774_1.state_ = "waiting"
		end

		function arg_774_1.playNext_(arg_776_0)
			if arg_776_0 == 1 then
				arg_774_0:Play1101106185(arg_774_1)
			end
		end

		function arg_774_1.onSingleLineUpdate_(arg_777_0)
			local var_777_0 = 0

			if var_777_0 < arg_774_1.time_ and arg_774_1.time_ <= var_777_0 + arg_777_0 then
				arg_774_1.var_.oldValueTypewriter = arg_774_1.fswtw_.percent
				arg_774_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_774_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_774_1:ShowNextGo(false)
			end

			local var_777_1 = 34
			local var_777_2 = 2.26666666666667
			local var_777_3 = arg_774_1:GetWordFromCfg(1101106183)
			local var_777_4 = arg_774_1:FormatText(var_777_3.content)
			local var_777_5, var_777_6 = arg_774_1:GetPercentByPara(var_777_4, 2)

			if var_777_0 < arg_774_1.time_ and arg_774_1.time_ <= var_777_0 + arg_777_0 then
				arg_774_1.talkMaxDuration = 0

				local var_777_7 = var_777_1 <= 0 and var_777_2 or var_777_2 * ((var_777_6 - arg_774_1.typewritterCharCountI18N) / var_777_1)

				if var_777_7 > 0 and var_777_2 < var_777_7 then
					arg_774_1.talkMaxDuration = var_777_7

					if var_777_7 + var_777_0 > arg_774_1.duration_ then
						arg_774_1.duration_ = var_777_7 + var_777_0
					end
				end
			end

			local var_777_8 = 2.26666666666667
			local var_777_9 = math.max(var_777_8, arg_774_1.talkMaxDuration)

			if var_777_0 <= arg_774_1.time_ and arg_774_1.time_ < var_777_0 + var_777_9 then
				local var_777_10 = (arg_774_1.time_ - var_777_0) / var_777_9

				arg_774_1.fswtw_.percent = Mathf.Lerp(arg_774_1.var_.oldValueTypewriter, var_777_5, var_777_10)
				arg_774_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_774_1.fswtw_:SetDirty()
			end

			if arg_774_1.time_ >= var_777_0 + var_777_9 and arg_774_1.time_ < var_777_0 + var_777_9 + arg_777_0 then
				arg_774_1.fswtw_.percent = var_777_5

				arg_774_1.fswtw_:SetDirty()
				arg_774_1:ShowNextGo(true)

				arg_774_1.typewritterCharCountI18N = var_777_6
			end

			local var_777_11 = 0
			local var_777_12 = 8.533
			local var_777_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106184", "story_v_side_new_1101106.awb") / 1000

			if var_777_13 > 0 and var_777_12 < var_777_13 and var_777_13 + var_777_11 > arg_774_1.duration_ then
				local var_777_14 = var_777_13

				arg_774_1.duration_ = var_777_13 + var_777_11
			end

			if var_777_11 < arg_774_1.time_ and arg_774_1.time_ <= var_777_11 + arg_777_0 then
				local var_777_15 = "play"
				local var_777_16 = "voice"

				arg_774_1:AudioAction(var_777_15, var_777_16, "story_v_side_new_1101106", "1101106184", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106185 = function(arg_778_0, arg_778_1)
		arg_778_1.time_ = 0
		arg_778_1.frameCnt_ = 0
		arg_778_1.state_ = "playing"
		arg_778_1.curTalkId_ = 1101106185
		arg_778_1.duration_ = 4.4

		SetActive(arg_778_1.tipsGo_, false)

		function arg_778_1.onSingleLineFinish_()
			arg_778_1.onSingleLineUpdate_ = nil
			arg_778_1.onSingleLineFinish_ = nil
			arg_778_1.state_ = "waiting"
		end

		function arg_778_1.playNext_(arg_780_0)
			if arg_780_0 == 1 then
				arg_778_0:Play1101106186(arg_778_1)
			end
		end

		function arg_778_1.onSingleLineUpdate_(arg_781_0)
			local var_781_0 = 0

			if var_781_0 < arg_778_1.time_ and arg_778_1.time_ <= var_781_0 + arg_781_0 then
				arg_778_1.var_.oldValueTypewriter = arg_778_1.fswtw_.percent
				arg_778_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_778_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_778_1:ShowNextGo(false)
			end

			local var_781_1 = 20
			local var_781_2 = 1.33333333333333
			local var_781_3 = arg_778_1:GetWordFromCfg(1101106183)
			local var_781_4 = arg_778_1:FormatText(var_781_3.content)
			local var_781_5, var_781_6 = arg_778_1:GetPercentByPara(var_781_4, 3)

			if var_781_0 < arg_778_1.time_ and arg_778_1.time_ <= var_781_0 + arg_781_0 then
				arg_778_1.talkMaxDuration = 0

				local var_781_7 = var_781_1 <= 0 and var_781_2 or var_781_2 * ((var_781_6 - arg_778_1.typewritterCharCountI18N) / var_781_1)

				if var_781_7 > 0 and var_781_2 < var_781_7 then
					arg_778_1.talkMaxDuration = var_781_7

					if var_781_7 + var_781_0 > arg_778_1.duration_ then
						arg_778_1.duration_ = var_781_7 + var_781_0
					end
				end
			end

			local var_781_8 = 1.33333333333333
			local var_781_9 = math.max(var_781_8, arg_778_1.talkMaxDuration)

			if var_781_0 <= arg_778_1.time_ and arg_778_1.time_ < var_781_0 + var_781_9 then
				local var_781_10 = (arg_778_1.time_ - var_781_0) / var_781_9

				arg_778_1.fswtw_.percent = Mathf.Lerp(arg_778_1.var_.oldValueTypewriter, var_781_5, var_781_10)
				arg_778_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_778_1.fswtw_:SetDirty()
			end

			if arg_778_1.time_ >= var_781_0 + var_781_9 and arg_778_1.time_ < var_781_0 + var_781_9 + arg_781_0 then
				arg_778_1.fswtw_.percent = var_781_5

				arg_778_1.fswtw_:SetDirty()
				arg_778_1:ShowNextGo(true)

				arg_778_1.typewritterCharCountI18N = var_781_6
			end

			local var_781_11 = 0
			local var_781_12 = 4.4
			local var_781_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106185", "story_v_side_new_1101106.awb") / 1000

			if var_781_13 > 0 and var_781_12 < var_781_13 and var_781_13 + var_781_11 > arg_778_1.duration_ then
				local var_781_14 = var_781_13

				arg_778_1.duration_ = var_781_13 + var_781_11
			end

			if var_781_11 < arg_778_1.time_ and arg_778_1.time_ <= var_781_11 + arg_781_0 then
				local var_781_15 = "play"
				local var_781_16 = "voice"

				arg_778_1:AudioAction(var_781_15, var_781_16, "story_v_side_new_1101106", "1101106185", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106186 = function(arg_782_0, arg_782_1)
		arg_782_1.time_ = 0
		arg_782_1.frameCnt_ = 0
		arg_782_1.state_ = "playing"
		arg_782_1.curTalkId_ = 1101106186
		arg_782_1.duration_ = 4.27

		SetActive(arg_782_1.tipsGo_, false)

		function arg_782_1.onSingleLineFinish_()
			arg_782_1.onSingleLineUpdate_ = nil
			arg_782_1.onSingleLineFinish_ = nil
			arg_782_1.state_ = "waiting"
		end

		function arg_782_1.playNext_(arg_784_0)
			if arg_784_0 == 1 then
				arg_782_0:Play1101106187(arg_782_1)
			end
		end

		function arg_782_1.onSingleLineUpdate_(arg_785_0)
			local var_785_0 = 0

			if var_785_0 < arg_782_1.time_ and arg_782_1.time_ <= var_785_0 + arg_785_0 then
				arg_782_1.var_.oldValueTypewriter = arg_782_1.fswtw_.percent
				arg_782_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_782_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_782_1:ShowNextGo(false)
			end

			local var_785_1 = 18
			local var_785_2 = 1.2
			local var_785_3 = arg_782_1:GetWordFromCfg(1101106183)
			local var_785_4 = arg_782_1:FormatText(var_785_3.content)
			local var_785_5, var_785_6 = arg_782_1:GetPercentByPara(var_785_4, 4)

			if var_785_0 < arg_782_1.time_ and arg_782_1.time_ <= var_785_0 + arg_785_0 then
				arg_782_1.talkMaxDuration = 0

				local var_785_7 = var_785_1 <= 0 and var_785_2 or var_785_2 * ((var_785_6 - arg_782_1.typewritterCharCountI18N) / var_785_1)

				if var_785_7 > 0 and var_785_2 < var_785_7 then
					arg_782_1.talkMaxDuration = var_785_7

					if var_785_7 + var_785_0 > arg_782_1.duration_ then
						arg_782_1.duration_ = var_785_7 + var_785_0
					end
				end
			end

			local var_785_8 = 1.2
			local var_785_9 = math.max(var_785_8, arg_782_1.talkMaxDuration)

			if var_785_0 <= arg_782_1.time_ and arg_782_1.time_ < var_785_0 + var_785_9 then
				local var_785_10 = (arg_782_1.time_ - var_785_0) / var_785_9

				arg_782_1.fswtw_.percent = Mathf.Lerp(arg_782_1.var_.oldValueTypewriter, var_785_5, var_785_10)
				arg_782_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_782_1.fswtw_:SetDirty()
			end

			if arg_782_1.time_ >= var_785_0 + var_785_9 and arg_782_1.time_ < var_785_0 + var_785_9 + arg_785_0 then
				arg_782_1.fswtw_.percent = var_785_5

				arg_782_1.fswtw_:SetDirty()
				arg_782_1:ShowNextGo(true)

				arg_782_1.typewritterCharCountI18N = var_785_6
			end

			local var_785_11 = 0
			local var_785_12 = 4.266
			local var_785_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106186", "story_v_side_new_1101106.awb") / 1000

			if var_785_13 > 0 and var_785_12 < var_785_13 and var_785_13 + var_785_11 > arg_782_1.duration_ then
				local var_785_14 = var_785_13

				arg_782_1.duration_ = var_785_13 + var_785_11
			end

			if var_785_11 < arg_782_1.time_ and arg_782_1.time_ <= var_785_11 + arg_785_0 then
				local var_785_15 = "play"
				local var_785_16 = "voice"

				arg_782_1:AudioAction(var_785_15, var_785_16, "story_v_side_new_1101106", "1101106186", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106187 = function(arg_786_0, arg_786_1)
		arg_786_1.time_ = 0
		arg_786_1.frameCnt_ = 0
		arg_786_1.state_ = "playing"
		arg_786_1.curTalkId_ = 1101106187
		arg_786_1.duration_ = 5.13

		SetActive(arg_786_1.tipsGo_, false)

		function arg_786_1.onSingleLineFinish_()
			arg_786_1.onSingleLineUpdate_ = nil
			arg_786_1.onSingleLineFinish_ = nil
			arg_786_1.state_ = "waiting"
		end

		function arg_786_1.playNext_(arg_788_0)
			if arg_788_0 == 1 then
				arg_786_0:Play1101106188(arg_786_1)
			end
		end

		function arg_786_1.onSingleLineUpdate_(arg_789_0)
			local var_789_0 = 0

			if var_789_0 < arg_786_1.time_ and arg_786_1.time_ <= var_789_0 + arg_789_0 then
				arg_786_1.var_.oldValueTypewriter = arg_786_1.fswtw_.percent
				arg_786_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_786_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_786_1:ShowNextGo(false)
			end

			local var_789_1 = 17
			local var_789_2 = 1.13333333333333
			local var_789_3 = arg_786_1:GetWordFromCfg(1101106183)
			local var_789_4 = arg_786_1:FormatText(var_789_3.content)
			local var_789_5, var_789_6 = arg_786_1:GetPercentByPara(var_789_4, 5)

			if var_789_0 < arg_786_1.time_ and arg_786_1.time_ <= var_789_0 + arg_789_0 then
				arg_786_1.talkMaxDuration = 0

				local var_789_7 = var_789_1 <= 0 and var_789_2 or var_789_2 * ((var_789_6 - arg_786_1.typewritterCharCountI18N) / var_789_1)

				if var_789_7 > 0 and var_789_2 < var_789_7 then
					arg_786_1.talkMaxDuration = var_789_7

					if var_789_7 + var_789_0 > arg_786_1.duration_ then
						arg_786_1.duration_ = var_789_7 + var_789_0
					end
				end
			end

			local var_789_8 = 1.13333333333333
			local var_789_9 = math.max(var_789_8, arg_786_1.talkMaxDuration)

			if var_789_0 <= arg_786_1.time_ and arg_786_1.time_ < var_789_0 + var_789_9 then
				local var_789_10 = (arg_786_1.time_ - var_789_0) / var_789_9

				arg_786_1.fswtw_.percent = Mathf.Lerp(arg_786_1.var_.oldValueTypewriter, var_789_5, var_789_10)
				arg_786_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_786_1.fswtw_:SetDirty()
			end

			if arg_786_1.time_ >= var_789_0 + var_789_9 and arg_786_1.time_ < var_789_0 + var_789_9 + arg_789_0 then
				arg_786_1.fswtw_.percent = var_789_5

				arg_786_1.fswtw_:SetDirty()
				arg_786_1:ShowNextGo(true)

				arg_786_1.typewritterCharCountI18N = var_789_6
			end

			local var_789_11 = 0
			local var_789_12 = 5.133
			local var_789_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106187", "story_v_side_new_1101106.awb") / 1000

			if var_789_13 > 0 and var_789_12 < var_789_13 and var_789_13 + var_789_11 > arg_786_1.duration_ then
				local var_789_14 = var_789_13

				arg_786_1.duration_ = var_789_13 + var_789_11
			end

			if var_789_11 < arg_786_1.time_ and arg_786_1.time_ <= var_789_11 + arg_789_0 then
				local var_789_15 = "play"
				local var_789_16 = "voice"

				arg_786_1:AudioAction(var_789_15, var_789_16, "story_v_side_new_1101106", "1101106187", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106188 = function(arg_790_0, arg_790_1)
		arg_790_1.time_ = 0
		arg_790_1.frameCnt_ = 0
		arg_790_1.state_ = "playing"
		arg_790_1.curTalkId_ = 1101106188
		arg_790_1.duration_ = 9.97

		SetActive(arg_790_1.tipsGo_, false)

		function arg_790_1.onSingleLineFinish_()
			arg_790_1.onSingleLineUpdate_ = nil
			arg_790_1.onSingleLineFinish_ = nil
			arg_790_1.state_ = "waiting"
		end

		function arg_790_1.playNext_(arg_792_0)
			if arg_792_0 == 1 then
				arg_790_0:Play1101106189(arg_790_1)
			end
		end

		function arg_790_1.onSingleLineUpdate_(arg_793_0)
			local var_793_0 = 0

			if var_793_0 < arg_790_1.time_ and arg_790_1.time_ <= var_793_0 + arg_793_0 then
				arg_790_1.var_.oldValueTypewriter = arg_790_1.fswtw_.percent
				arg_790_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_790_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_790_1:ShowNextGo(false)
			end

			local var_793_1 = 27
			local var_793_2 = 1.8
			local var_793_3 = arg_790_1:GetWordFromCfg(1101106183)
			local var_793_4 = arg_790_1:FormatText(var_793_3.content)
			local var_793_5, var_793_6 = arg_790_1:GetPercentByPara(var_793_4, 6)

			if var_793_0 < arg_790_1.time_ and arg_790_1.time_ <= var_793_0 + arg_793_0 then
				arg_790_1.talkMaxDuration = 0

				local var_793_7 = var_793_1 <= 0 and var_793_2 or var_793_2 * ((var_793_6 - arg_790_1.typewritterCharCountI18N) / var_793_1)

				if var_793_7 > 0 and var_793_2 < var_793_7 then
					arg_790_1.talkMaxDuration = var_793_7

					if var_793_7 + var_793_0 > arg_790_1.duration_ then
						arg_790_1.duration_ = var_793_7 + var_793_0
					end
				end
			end

			local var_793_8 = 1.8
			local var_793_9 = math.max(var_793_8, arg_790_1.talkMaxDuration)

			if var_793_0 <= arg_790_1.time_ and arg_790_1.time_ < var_793_0 + var_793_9 then
				local var_793_10 = (arg_790_1.time_ - var_793_0) / var_793_9

				arg_790_1.fswtw_.percent = Mathf.Lerp(arg_790_1.var_.oldValueTypewriter, var_793_5, var_793_10)
				arg_790_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_790_1.fswtw_:SetDirty()
			end

			if arg_790_1.time_ >= var_793_0 + var_793_9 and arg_790_1.time_ < var_793_0 + var_793_9 + arg_793_0 then
				arg_790_1.fswtw_.percent = var_793_5

				arg_790_1.fswtw_:SetDirty()
				arg_790_1:ShowNextGo(true)

				arg_790_1.typewritterCharCountI18N = var_793_6
			end

			local var_793_11 = 0
			local var_793_12 = 9.966
			local var_793_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106188", "story_v_side_new_1101106.awb") / 1000

			if var_793_13 > 0 and var_793_12 < var_793_13 and var_793_13 + var_793_11 > arg_790_1.duration_ then
				local var_793_14 = var_793_13

				arg_790_1.duration_ = var_793_13 + var_793_11
			end

			if var_793_11 < arg_790_1.time_ and arg_790_1.time_ <= var_793_11 + arg_793_0 then
				local var_793_15 = "play"
				local var_793_16 = "voice"

				arg_790_1:AudioAction(var_793_15, var_793_16, "story_v_side_new_1101106", "1101106188", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106189 = function(arg_794_0, arg_794_1)
		arg_794_1.time_ = 0
		arg_794_1.frameCnt_ = 0
		arg_794_1.state_ = "playing"
		arg_794_1.curTalkId_ = 1101106189
		arg_794_1.duration_ = 4.6

		SetActive(arg_794_1.tipsGo_, false)

		function arg_794_1.onSingleLineFinish_()
			arg_794_1.onSingleLineUpdate_ = nil
			arg_794_1.onSingleLineFinish_ = nil
			arg_794_1.state_ = "waiting"
		end

		function arg_794_1.playNext_(arg_796_0)
			if arg_796_0 == 1 then
				arg_794_0:Play1101106190(arg_794_1)
			end
		end

		function arg_794_1.onSingleLineUpdate_(arg_797_0)
			local var_797_0 = 0

			if var_797_0 < arg_794_1.time_ and arg_794_1.time_ <= var_797_0 + arg_797_0 then
				arg_794_1.var_.oldValueTypewriter = arg_794_1.fswtw_.percent
				arg_794_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_794_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_794_1:ShowNextGo(false)
			end

			local var_797_1 = 10
			local var_797_2 = 0.666666666666667
			local var_797_3 = arg_794_1:GetWordFromCfg(1101106183)
			local var_797_4 = arg_794_1:FormatText(var_797_3.content)
			local var_797_5, var_797_6 = arg_794_1:GetPercentByPara(var_797_4, 7)

			if var_797_0 < arg_794_1.time_ and arg_794_1.time_ <= var_797_0 + arg_797_0 then
				arg_794_1.talkMaxDuration = 0

				local var_797_7 = var_797_1 <= 0 and var_797_2 or var_797_2 * ((var_797_6 - arg_794_1.typewritterCharCountI18N) / var_797_1)

				if var_797_7 > 0 and var_797_2 < var_797_7 then
					arg_794_1.talkMaxDuration = var_797_7

					if var_797_7 + var_797_0 > arg_794_1.duration_ then
						arg_794_1.duration_ = var_797_7 + var_797_0
					end
				end
			end

			local var_797_8 = 0.666666666666667
			local var_797_9 = math.max(var_797_8, arg_794_1.talkMaxDuration)

			if var_797_0 <= arg_794_1.time_ and arg_794_1.time_ < var_797_0 + var_797_9 then
				local var_797_10 = (arg_794_1.time_ - var_797_0) / var_797_9

				arg_794_1.fswtw_.percent = Mathf.Lerp(arg_794_1.var_.oldValueTypewriter, var_797_5, var_797_10)
				arg_794_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_794_1.fswtw_:SetDirty()
			end

			if arg_794_1.time_ >= var_797_0 + var_797_9 and arg_794_1.time_ < var_797_0 + var_797_9 + arg_797_0 then
				arg_794_1.fswtw_.percent = var_797_5

				arg_794_1.fswtw_:SetDirty()
				arg_794_1:ShowNextGo(true)

				arg_794_1.typewritterCharCountI18N = var_797_6
			end

			local var_797_11 = 0
			local var_797_12 = 4.6
			local var_797_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106189", "story_v_side_new_1101106.awb") / 1000

			if var_797_13 > 0 and var_797_12 < var_797_13 and var_797_13 + var_797_11 > arg_794_1.duration_ then
				local var_797_14 = var_797_13

				arg_794_1.duration_ = var_797_13 + var_797_11
			end

			if var_797_11 < arg_794_1.time_ and arg_794_1.time_ <= var_797_11 + arg_797_0 then
				local var_797_15 = "play"
				local var_797_16 = "voice"

				arg_794_1:AudioAction(var_797_15, var_797_16, "story_v_side_new_1101106", "1101106189", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106190 = function(arg_798_0, arg_798_1)
		arg_798_1.time_ = 0
		arg_798_1.frameCnt_ = 0
		arg_798_1.state_ = "playing"
		arg_798_1.curTalkId_ = 1101106190
		arg_798_1.duration_ = 13

		SetActive(arg_798_1.tipsGo_, false)

		function arg_798_1.onSingleLineFinish_()
			arg_798_1.onSingleLineUpdate_ = nil
			arg_798_1.onSingleLineFinish_ = nil
			arg_798_1.state_ = "waiting"
		end

		function arg_798_1.playNext_(arg_800_0)
			if arg_800_0 == 1 then
				arg_798_0:Play1101106191(arg_798_1)
			end
		end

		function arg_798_1.onSingleLineUpdate_(arg_801_0)
			local var_801_0 = 4

			if var_801_0 < arg_798_1.time_ and arg_798_1.time_ <= var_801_0 + arg_801_0 then
				local var_801_1 = manager.ui.mainCamera.transform.localPosition
				local var_801_2 = Vector3.New(0, 0, 10) + Vector3.New(var_801_1.x, var_801_1.y, 0)
				local var_801_3 = arg_798_1.bgs_.I06

				var_801_3.transform.localPosition = var_801_2
				var_801_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_801_4 = var_801_3:GetComponent("SpriteRenderer")

				if var_801_4 and var_801_4.sprite then
					local var_801_5 = (var_801_3.transform.localPosition - var_801_1).z
					local var_801_6 = manager.ui.mainCameraCom_
					local var_801_7 = 2 * var_801_5 * Mathf.Tan(var_801_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_801_8 = var_801_7 * var_801_6.aspect
					local var_801_9 = var_801_4.sprite.bounds.size.x
					local var_801_10 = var_801_4.sprite.bounds.size.y
					local var_801_11 = var_801_8 / var_801_9
					local var_801_12 = var_801_7 / var_801_10
					local var_801_13 = var_801_12 < var_801_11 and var_801_11 or var_801_12

					var_801_3.transform.localScale = Vector3.New(var_801_13, var_801_13, 0)
				end

				for iter_801_0, iter_801_1 in pairs(arg_798_1.bgs_) do
					if iter_801_0 ~= "I06" then
						iter_801_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_801_14 = 0

			if var_801_14 < arg_798_1.time_ and arg_798_1.time_ <= var_801_14 + arg_801_0 then
				arg_798_1.mask_.enabled = true
				arg_798_1.mask_.raycastTarget = true

				arg_798_1:SetGaussion(false)
			end

			local var_801_15 = 4

			if var_801_14 <= arg_798_1.time_ and arg_798_1.time_ < var_801_14 + var_801_15 then
				local var_801_16 = (arg_798_1.time_ - var_801_14) / var_801_15
				local var_801_17 = Color.New(0, 0, 0)

				var_801_17.a = Mathf.Lerp(0, 1, var_801_16)
				arg_798_1.mask_.color = var_801_17
			end

			if arg_798_1.time_ >= var_801_14 + var_801_15 and arg_798_1.time_ < var_801_14 + var_801_15 + arg_801_0 then
				local var_801_18 = Color.New(0, 0, 0)

				var_801_18.a = 1
				arg_798_1.mask_.color = var_801_18
			end

			local var_801_19 = 4

			if var_801_19 < arg_798_1.time_ and arg_798_1.time_ <= var_801_19 + arg_801_0 then
				arg_798_1.mask_.enabled = true
				arg_798_1.mask_.raycastTarget = true

				arg_798_1:SetGaussion(false)
			end

			local var_801_20 = 4

			if var_801_19 <= arg_798_1.time_ and arg_798_1.time_ < var_801_19 + var_801_20 then
				local var_801_21 = (arg_798_1.time_ - var_801_19) / var_801_20
				local var_801_22 = Color.New(0, 0, 0)

				var_801_22.a = Mathf.Lerp(1, 0, var_801_21)
				arg_798_1.mask_.color = var_801_22
			end

			if arg_798_1.time_ >= var_801_19 + var_801_20 and arg_798_1.time_ < var_801_19 + var_801_20 + arg_801_0 then
				local var_801_23 = Color.New(0, 0, 0)
				local var_801_24 = 0

				arg_798_1.mask_.enabled = false
				var_801_23.a = var_801_24
				arg_798_1.mask_.color = var_801_23
			end

			local var_801_25 = arg_798_1.actors_["1011ui_story"].transform
			local var_801_26 = 8

			if var_801_26 < arg_798_1.time_ and arg_798_1.time_ <= var_801_26 + arg_801_0 then
				arg_798_1.var_.moveOldPos1011ui_story = var_801_25.localPosition
			end

			local var_801_27 = 0.001

			if var_801_26 <= arg_798_1.time_ and arg_798_1.time_ < var_801_26 + var_801_27 then
				local var_801_28 = (arg_798_1.time_ - var_801_26) / var_801_27
				local var_801_29 = Vector3.New(0, -0.71, -6)

				var_801_25.localPosition = Vector3.Lerp(arg_798_1.var_.moveOldPos1011ui_story, var_801_29, var_801_28)

				local var_801_30 = manager.ui.mainCamera.transform.position - var_801_25.position

				var_801_25.forward = Vector3.New(var_801_30.x, var_801_30.y, var_801_30.z)

				local var_801_31 = var_801_25.localEulerAngles

				var_801_31.z = 0
				var_801_31.x = 0
				var_801_25.localEulerAngles = var_801_31
			end

			if arg_798_1.time_ >= var_801_26 + var_801_27 and arg_798_1.time_ < var_801_26 + var_801_27 + arg_801_0 then
				var_801_25.localPosition = Vector3.New(0, -0.71, -6)

				local var_801_32 = manager.ui.mainCamera.transform.position - var_801_25.position

				var_801_25.forward = Vector3.New(var_801_32.x, var_801_32.y, var_801_32.z)

				local var_801_33 = var_801_25.localEulerAngles

				var_801_33.z = 0
				var_801_33.x = 0
				var_801_25.localEulerAngles = var_801_33
			end

			local var_801_34 = arg_798_1.actors_["1011ui_story"]
			local var_801_35 = 8

			if var_801_35 < arg_798_1.time_ and arg_798_1.time_ <= var_801_35 + arg_801_0 and not isNil(var_801_34) and arg_798_1.var_.characterEffect1011ui_story == nil then
				arg_798_1.var_.characterEffect1011ui_story = var_801_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_801_36 = 0.200000002980232

			if var_801_35 <= arg_798_1.time_ and arg_798_1.time_ < var_801_35 + var_801_36 and not isNil(var_801_34) then
				local var_801_37 = (arg_798_1.time_ - var_801_35) / var_801_36

				if arg_798_1.var_.characterEffect1011ui_story and not isNil(var_801_34) then
					arg_798_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_798_1.time_ >= var_801_35 + var_801_36 and arg_798_1.time_ < var_801_35 + var_801_36 + arg_801_0 and not isNil(var_801_34) and arg_798_1.var_.characterEffect1011ui_story then
				arg_798_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_801_38 = 2

			if var_801_38 < arg_798_1.time_ and arg_798_1.time_ <= var_801_38 + arg_801_0 then
				arg_798_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_801_39 = 8

			if var_801_39 < arg_798_1.time_ and arg_798_1.time_ <= var_801_39 + arg_801_0 then
				arg_798_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_801_40 = 4

			if var_801_40 < arg_798_1.time_ and arg_798_1.time_ <= var_801_40 + arg_801_0 then
				arg_798_1.fswbg_:SetActive(false)
				arg_798_1.dialog_:SetActive(false)

				arg_798_1.fswbg_.transform:Find("textbox/bg"):GetComponent("Image").enabled = true

				SetActive(arg_798_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_798_1:ShowNextGo(false)
			end

			if arg_798_1.frameCnt_ <= 1 then
				arg_798_1.dialog_:SetActive(false)
			end

			local var_801_41 = 8
			local var_801_42 = 0.1

			if var_801_41 < arg_798_1.time_ and arg_798_1.time_ <= var_801_41 + arg_801_0 then
				arg_798_1.talkMaxDuration = 0

				arg_798_1.dialog_:SetActive(true)

				local var_801_43 = LeanTween.value(arg_798_1.dialog_, 0, 1, 0.3)

				var_801_43:setOnUpdate(LuaHelper.FloatAction(function(arg_802_0)
					arg_798_1.dialogCg_.alpha = arg_802_0
				end))
				var_801_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_798_1.dialog_)
					var_801_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_798_1.duration_ = arg_798_1.duration_ + 0.3

				SetActive(arg_798_1.leftNameGo_, true)

				local var_801_44 = arg_798_1:FormatText(StoryNameCfg[7].name)

				arg_798_1.leftNameTxt_.text = var_801_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_798_1.leftNameTxt_.transform)

				arg_798_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_798_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_798_1:RecordName(arg_798_1.leftNameTxt_.text)
				SetActive(arg_798_1.iconTrs_.gameObject, false)
				arg_798_1.callingController_:SetSelectedState("normal")

				local var_801_45 = arg_798_1:GetWordFromCfg(1101106190)
				local var_801_46 = arg_798_1:FormatText(var_801_45.content)

				arg_798_1.text_.text = var_801_46

				LuaForUtil.ClearLinePrefixSymbol(arg_798_1.text_)

				local var_801_47 = 4
				local var_801_48 = utf8.len(var_801_46)
				local var_801_49 = var_801_47 <= 0 and var_801_42 or var_801_42 * (var_801_48 / var_801_47)

				if var_801_49 > 0 and var_801_42 < var_801_49 then
					arg_798_1.talkMaxDuration = var_801_49
					var_801_41 = var_801_41 + 0.3

					if var_801_49 + var_801_41 > arg_798_1.duration_ then
						arg_798_1.duration_ = var_801_49 + var_801_41
					end
				end

				arg_798_1.text_.text = var_801_46
				arg_798_1.typewritter.percent = 0

				arg_798_1.typewritter:SetDirty()
				arg_798_1:ShowNextGo(false)
				arg_798_1:RecordContent(arg_798_1.text_.text)
			end

			local var_801_50 = var_801_41 + 0.3
			local var_801_51 = math.max(var_801_42, arg_798_1.talkMaxDuration)

			if var_801_50 <= arg_798_1.time_ and arg_798_1.time_ < var_801_50 + var_801_51 then
				arg_798_1.typewritter.percent = (arg_798_1.time_ - var_801_50) / var_801_51

				arg_798_1.typewritter:SetDirty()
			end

			if arg_798_1.time_ >= var_801_50 + var_801_51 and arg_798_1.time_ < var_801_50 + var_801_51 + arg_801_0 then
				arg_798_1.typewritter.percent = 1

				arg_798_1.typewritter:SetDirty()
				arg_798_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106191 = function(arg_804_0, arg_804_1)
		arg_804_1.time_ = 0
		arg_804_1.frameCnt_ = 0
		arg_804_1.state_ = "playing"
		arg_804_1.curTalkId_ = 1101106191
		arg_804_1.duration_ = 5

		SetActive(arg_804_1.tipsGo_, false)

		function arg_804_1.onSingleLineFinish_()
			arg_804_1.onSingleLineUpdate_ = nil
			arg_804_1.onSingleLineFinish_ = nil
			arg_804_1.state_ = "waiting"
		end

		function arg_804_1.playNext_(arg_806_0)
			if arg_806_0 == 1 then
				arg_804_0:Play1101106192(arg_804_1)
			end
		end

		function arg_804_1.onSingleLineUpdate_(arg_807_0)
			local var_807_0 = arg_804_1.actors_["1011ui_story"]
			local var_807_1 = 0

			if var_807_1 < arg_804_1.time_ and arg_804_1.time_ <= var_807_1 + arg_807_0 and not isNil(var_807_0) and arg_804_1.var_.characterEffect1011ui_story == nil then
				arg_804_1.var_.characterEffect1011ui_story = var_807_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_807_2 = 0.200000002980232

			if var_807_1 <= arg_804_1.time_ and arg_804_1.time_ < var_807_1 + var_807_2 and not isNil(var_807_0) then
				local var_807_3 = (arg_804_1.time_ - var_807_1) / var_807_2

				if arg_804_1.var_.characterEffect1011ui_story and not isNil(var_807_0) then
					local var_807_4 = Mathf.Lerp(0, 0.5, var_807_3)

					arg_804_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_804_1.var_.characterEffect1011ui_story.fillRatio = var_807_4
				end
			end

			if arg_804_1.time_ >= var_807_1 + var_807_2 and arg_804_1.time_ < var_807_1 + var_807_2 + arg_807_0 and not isNil(var_807_0) and arg_804_1.var_.characterEffect1011ui_story then
				local var_807_5 = 0.5

				arg_804_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_804_1.var_.characterEffect1011ui_story.fillRatio = var_807_5
			end

			local var_807_6 = 0
			local var_807_7 = 0.425

			if var_807_6 < arg_804_1.time_ and arg_804_1.time_ <= var_807_6 + arg_807_0 then
				arg_804_1.talkMaxDuration = 0
				arg_804_1.dialogCg_.alpha = 1

				arg_804_1.dialog_:SetActive(true)
				SetActive(arg_804_1.leftNameGo_, false)

				arg_804_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_804_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_804_1:RecordName(arg_804_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_804_1.iconTrs_.gameObject, false)
				arg_804_1.callingController_:SetSelectedState("normal")

				local var_807_8 = arg_804_1:GetWordFromCfg(1101106191)
				local var_807_9 = arg_804_1:FormatText(var_807_8.content)

				arg_804_1.text_.text = var_807_9

				LuaForUtil.ClearLinePrefixSymbol(arg_804_1.text_)

				local var_807_10 = 17
				local var_807_11 = utf8.len(var_807_9)
				local var_807_12 = var_807_10 <= 0 and var_807_7 or var_807_7 * (var_807_11 / var_807_10)

				if var_807_12 > 0 and var_807_7 < var_807_12 then
					arg_804_1.talkMaxDuration = var_807_12

					if var_807_12 + var_807_6 > arg_804_1.duration_ then
						arg_804_1.duration_ = var_807_12 + var_807_6
					end
				end

				arg_804_1.text_.text = var_807_9
				arg_804_1.typewritter.percent = 0

				arg_804_1.typewritter:SetDirty()
				arg_804_1:ShowNextGo(false)
				arg_804_1:RecordContent(arg_804_1.text_.text)
			end

			local var_807_13 = math.max(var_807_7, arg_804_1.talkMaxDuration)

			if var_807_6 <= arg_804_1.time_ and arg_804_1.time_ < var_807_6 + var_807_13 then
				arg_804_1.typewritter.percent = (arg_804_1.time_ - var_807_6) / var_807_13

				arg_804_1.typewritter:SetDirty()
			end

			if arg_804_1.time_ >= var_807_6 + var_807_13 and arg_804_1.time_ < var_807_6 + var_807_13 + arg_807_0 then
				arg_804_1.typewritter.percent = 1

				arg_804_1.typewritter:SetDirty()
				arg_804_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106192 = function(arg_808_0, arg_808_1)
		arg_808_1.time_ = 0
		arg_808_1.frameCnt_ = 0
		arg_808_1.state_ = "playing"
		arg_808_1.curTalkId_ = 1101106192
		arg_808_1.duration_ = 4.5

		local var_808_0 = {
			zh = 4.5,
			ja = 2.9
		}
		local var_808_1 = manager.audio:GetLocalizationFlag()

		if var_808_0[var_808_1] ~= nil then
			arg_808_1.duration_ = var_808_0[var_808_1]
		end

		SetActive(arg_808_1.tipsGo_, false)

		function arg_808_1.onSingleLineFinish_()
			arg_808_1.onSingleLineUpdate_ = nil
			arg_808_1.onSingleLineFinish_ = nil
			arg_808_1.state_ = "waiting"
		end

		function arg_808_1.playNext_(arg_810_0)
			if arg_810_0 == 1 then
				arg_808_0:Play1101106193(arg_808_1)
			end
		end

		function arg_808_1.onSingleLineUpdate_(arg_811_0)
			local var_811_0 = 0

			if var_811_0 < arg_808_1.time_ and arg_808_1.time_ <= var_811_0 + arg_811_0 then
				arg_808_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_811_1 = arg_808_1.actors_["1011ui_story"]
			local var_811_2 = 0

			if var_811_2 < arg_808_1.time_ and arg_808_1.time_ <= var_811_2 + arg_811_0 and not isNil(var_811_1) and arg_808_1.var_.characterEffect1011ui_story == nil then
				arg_808_1.var_.characterEffect1011ui_story = var_811_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_811_3 = 0.200000002980232

			if var_811_2 <= arg_808_1.time_ and arg_808_1.time_ < var_811_2 + var_811_3 and not isNil(var_811_1) then
				local var_811_4 = (arg_808_1.time_ - var_811_2) / var_811_3

				if arg_808_1.var_.characterEffect1011ui_story and not isNil(var_811_1) then
					arg_808_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_808_1.time_ >= var_811_2 + var_811_3 and arg_808_1.time_ < var_811_2 + var_811_3 + arg_811_0 and not isNil(var_811_1) and arg_808_1.var_.characterEffect1011ui_story then
				arg_808_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_811_5 = 0
			local var_811_6 = 0.35

			if var_811_5 < arg_808_1.time_ and arg_808_1.time_ <= var_811_5 + arg_811_0 then
				arg_808_1.talkMaxDuration = 0
				arg_808_1.dialogCg_.alpha = 1

				arg_808_1.dialog_:SetActive(true)
				SetActive(arg_808_1.leftNameGo_, true)

				local var_811_7 = arg_808_1:FormatText(StoryNameCfg[37].name)

				arg_808_1.leftNameTxt_.text = var_811_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_808_1.leftNameTxt_.transform)

				arg_808_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_808_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_808_1:RecordName(arg_808_1.leftNameTxt_.text)
				SetActive(arg_808_1.iconTrs_.gameObject, false)
				arg_808_1.callingController_:SetSelectedState("normal")

				local var_811_8 = arg_808_1:GetWordFromCfg(1101106192)
				local var_811_9 = arg_808_1:FormatText(var_811_8.content)

				arg_808_1.text_.text = var_811_9

				LuaForUtil.ClearLinePrefixSymbol(arg_808_1.text_)

				local var_811_10 = 14
				local var_811_11 = utf8.len(var_811_9)
				local var_811_12 = var_811_10 <= 0 and var_811_6 or var_811_6 * (var_811_11 / var_811_10)

				if var_811_12 > 0 and var_811_6 < var_811_12 then
					arg_808_1.talkMaxDuration = var_811_12

					if var_811_12 + var_811_5 > arg_808_1.duration_ then
						arg_808_1.duration_ = var_811_12 + var_811_5
					end
				end

				arg_808_1.text_.text = var_811_9
				arg_808_1.typewritter.percent = 0

				arg_808_1.typewritter:SetDirty()
				arg_808_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb") ~= 0 then
					local var_811_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb") / 1000

					if var_811_13 + var_811_5 > arg_808_1.duration_ then
						arg_808_1.duration_ = var_811_13 + var_811_5
					end

					if var_811_8.prefab_name ~= "" and arg_808_1.actors_[var_811_8.prefab_name] ~= nil then
						local var_811_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_808_1.actors_[var_811_8.prefab_name].transform, "story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")

						arg_808_1:RecordAudio("1101106192", var_811_14)
						arg_808_1:RecordAudio("1101106192", var_811_14)
					else
						arg_808_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")
					end

					arg_808_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")
				end

				arg_808_1:RecordContent(arg_808_1.text_.text)
			end

			local var_811_15 = math.max(var_811_6, arg_808_1.talkMaxDuration)

			if var_811_5 <= arg_808_1.time_ and arg_808_1.time_ < var_811_5 + var_811_15 then
				arg_808_1.typewritter.percent = (arg_808_1.time_ - var_811_5) / var_811_15

				arg_808_1.typewritter:SetDirty()
			end

			if arg_808_1.time_ >= var_811_5 + var_811_15 and arg_808_1.time_ < var_811_5 + var_811_15 + arg_811_0 then
				arg_808_1.typewritter.percent = 1

				arg_808_1.typewritter:SetDirty()
				arg_808_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106193 = function(arg_812_0, arg_812_1)
		arg_812_1.time_ = 0
		arg_812_1.frameCnt_ = 0
		arg_812_1.state_ = "playing"
		arg_812_1.curTalkId_ = 1101106193
		arg_812_1.duration_ = 5

		SetActive(arg_812_1.tipsGo_, false)

		function arg_812_1.onSingleLineFinish_()
			arg_812_1.onSingleLineUpdate_ = nil
			arg_812_1.onSingleLineFinish_ = nil
			arg_812_1.state_ = "waiting"
		end

		function arg_812_1.playNext_(arg_814_0)
			if arg_814_0 == 1 then
				arg_812_0:Play1101106194(arg_812_1)
			end
		end

		function arg_812_1.onSingleLineUpdate_(arg_815_0)
			local var_815_0 = 0
			local var_815_1 = 0.1

			if var_815_0 < arg_812_1.time_ and arg_812_1.time_ <= var_815_0 + arg_815_0 then
				arg_812_1.talkMaxDuration = 0
				arg_812_1.dialogCg_.alpha = 1

				arg_812_1.dialog_:SetActive(true)
				SetActive(arg_812_1.leftNameGo_, false)

				arg_812_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_812_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_812_1:RecordName(arg_812_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_812_1.iconTrs_.gameObject, false)
				arg_812_1.callingController_:SetSelectedState("normal")

				local var_815_2 = arg_812_1:GetWordFromCfg(1101106193)
				local var_815_3 = arg_812_1:FormatText(var_815_2.content)

				arg_812_1.text_.text = var_815_3

				LuaForUtil.ClearLinePrefixSymbol(arg_812_1.text_)

				local var_815_4 = 4
				local var_815_5 = utf8.len(var_815_3)
				local var_815_6 = var_815_4 <= 0 and var_815_1 or var_815_1 * (var_815_5 / var_815_4)

				if var_815_6 > 0 and var_815_1 < var_815_6 then
					arg_812_1.talkMaxDuration = var_815_6

					if var_815_6 + var_815_0 > arg_812_1.duration_ then
						arg_812_1.duration_ = var_815_6 + var_815_0
					end
				end

				arg_812_1.text_.text = var_815_3
				arg_812_1.typewritter.percent = 0

				arg_812_1.typewritter:SetDirty()
				arg_812_1:ShowNextGo(false)
				arg_812_1:RecordContent(arg_812_1.text_.text)
			end

			local var_815_7 = math.max(var_815_1, arg_812_1.talkMaxDuration)

			if var_815_0 <= arg_812_1.time_ and arg_812_1.time_ < var_815_0 + var_815_7 then
				arg_812_1.typewritter.percent = (arg_812_1.time_ - var_815_0) / var_815_7

				arg_812_1.typewritter:SetDirty()
			end

			if arg_812_1.time_ >= var_815_0 + var_815_7 and arg_812_1.time_ < var_815_0 + var_815_7 + arg_815_0 then
				arg_812_1.typewritter.percent = 1

				arg_812_1.typewritter:SetDirty()
				arg_812_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106194 = function(arg_816_0, arg_816_1)
		arg_816_1.time_ = 0
		arg_816_1.frameCnt_ = 0
		arg_816_1.state_ = "playing"
		arg_816_1.curTalkId_ = 1101106194
		arg_816_1.duration_ = 5

		SetActive(arg_816_1.tipsGo_, false)

		function arg_816_1.onSingleLineFinish_()
			arg_816_1.onSingleLineUpdate_ = nil
			arg_816_1.onSingleLineFinish_ = nil
			arg_816_1.state_ = "waiting"
			arg_816_1.auto_ = false
		end

		function arg_816_1.playNext_(arg_818_0)
			arg_816_1.onStoryFinished_()
		end

		function arg_816_1.onSingleLineUpdate_(arg_819_0)
			local var_819_0 = 0
			local var_819_1 = 0.2

			if var_819_0 < arg_816_1.time_ and arg_816_1.time_ <= var_819_0 + arg_819_0 then
				arg_816_1.talkMaxDuration = 0
				arg_816_1.dialogCg_.alpha = 1

				arg_816_1.dialog_:SetActive(true)
				SetActive(arg_816_1.leftNameGo_, true)

				local var_819_2 = arg_816_1:FormatText(StoryNameCfg[7].name)

				arg_816_1.leftNameTxt_.text = var_819_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_816_1.leftNameTxt_.transform)

				arg_816_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_816_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_816_1:RecordName(arg_816_1.leftNameTxt_.text)
				SetActive(arg_816_1.iconTrs_.gameObject, false)
				arg_816_1.callingController_:SetSelectedState("normal")

				local var_819_3 = arg_816_1:GetWordFromCfg(1101106194)
				local var_819_4 = arg_816_1:FormatText(var_819_3.content)

				arg_816_1.text_.text = var_819_4

				LuaForUtil.ClearLinePrefixSymbol(arg_816_1.text_)

				local var_819_5 = 8
				local var_819_6 = utf8.len(var_819_4)
				local var_819_7 = var_819_5 <= 0 and var_819_1 or var_819_1 * (var_819_6 / var_819_5)

				if var_819_7 > 0 and var_819_1 < var_819_7 then
					arg_816_1.talkMaxDuration = var_819_7

					if var_819_7 + var_819_0 > arg_816_1.duration_ then
						arg_816_1.duration_ = var_819_7 + var_819_0
					end
				end

				arg_816_1.text_.text = var_819_4
				arg_816_1.typewritter.percent = 0

				arg_816_1.typewritter:SetDirty()
				arg_816_1:ShowNextGo(false)
				arg_816_1:RecordContent(arg_816_1.text_.text)
			end

			local var_819_8 = math.max(var_819_1, arg_816_1.talkMaxDuration)

			if var_819_0 <= arg_816_1.time_ and arg_816_1.time_ < var_819_0 + var_819_8 then
				arg_816_1.typewritter.percent = (arg_816_1.time_ - var_819_0) / var_819_8

				arg_816_1.typewritter:SetDirty()
			end

			if arg_816_1.time_ >= var_819_0 + var_819_8 and arg_816_1.time_ < var_819_0 + var_819_8 + arg_819_0 then
				arg_816_1.typewritter.percent = 1

				arg_816_1.typewritter:SetDirty()
				arg_816_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST19",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST18",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST04a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST04b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST14",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R1102a"
	},
	voices = {
		"story_v_side_new_1101106.awb"
	}
}
