return {
	Play116141001 = function(arg_1_0, arg_1_1)
		arg_1_1.marker = "Mark1"
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 116141001
		arg_1_1.duration_ = 9.7

		local var_1_0 = {
			zh = 9.69999999999999,
			ja = 9.19999999999999
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
			arg_1_1.marker = ""

			if arg_3_0 == 1 then
				arg_1_0:Play116141002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST07b"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 3.8

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				if arg_1_0.sceneSettingEffect_ then
					arg_1_1.sceneSettingEffect_.enabled = false
				end

				arg_1_1.sceneSettingGo_:SetActive(true)

				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.ST07b

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
					if iter_4_0 ~= "ST07b" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = "1059ui_story"

			if arg_1_1.actors_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(Asset.Load("Char/" .. var_4_16), arg_1_1.stage_.transform)

				var_4_17.name = var_4_16
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_16] = var_4_17

				local var_4_18 = var_4_17:GetComponentInChildren(typeof(CharacterEffect))

				var_4_18.enabled = true

				local var_4_19 = GameObjectTools.GetOrAddComponent(var_4_17, typeof(DynamicBoneHelper))

				if var_4_19 then
					var_4_19:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_18.transform, false)

				arg_1_1.var_[var_4_16 .. "Animator"] = var_4_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_16 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_16 .. "LipSync"] = var_4_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_20 = arg_1_1.actors_["1059ui_story"].transform
			local var_4_21 = 5.7

			if var_4_21 < arg_1_1.time_ and arg_1_1.time_ <= var_4_21 + arg_4_0 then
				arg_1_1.var_.moveOldPos1059ui_story = var_4_20.localPosition
			end

			local var_4_22 = 0.001

			if var_4_21 <= arg_1_1.time_ and arg_1_1.time_ < var_4_21 + var_4_22 then
				local var_4_23 = (arg_1_1.time_ - var_4_21) / var_4_22
				local var_4_24 = Vector3.New(0, -1.05, -6)

				var_4_20.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1059ui_story, var_4_24, var_4_23)

				local var_4_25 = manager.ui.mainCamera.transform.position - var_4_20.position

				var_4_20.forward = Vector3.New(var_4_25.x, var_4_25.y, var_4_25.z)

				local var_4_26 = var_4_20.localEulerAngles

				var_4_26.z = 0
				var_4_26.x = 0
				var_4_20.localEulerAngles = var_4_26
			end

			if arg_1_1.time_ >= var_4_21 + var_4_22 and arg_1_1.time_ < var_4_21 + var_4_22 + arg_4_0 then
				var_4_20.localPosition = Vector3.New(0, -1.05, -6)

				local var_4_27 = manager.ui.mainCamera.transform.position - var_4_20.position

				var_4_20.forward = Vector3.New(var_4_27.x, var_4_27.y, var_4_27.z)

				local var_4_28 = var_4_20.localEulerAngles

				var_4_28.z = 0
				var_4_28.x = 0
				var_4_20.localEulerAngles = var_4_28
			end

			local var_4_29 = 5.7

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_4_30 = 5.7

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_4_31 = 3.666667

			if var_4_31 < arg_1_1.time_ and arg_1_1.time_ <= var_4_31 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_32 = 2.13333299999999

			if var_4_31 <= arg_1_1.time_ and arg_1_1.time_ < var_4_31 + var_4_32 then
				local var_4_33 = (arg_1_1.time_ - var_4_31) / var_4_32
				local var_4_34 = Color.New(0, 0, 0)

				var_4_34.a = Mathf.Lerp(1, 0, var_4_33)
				arg_1_1.mask_.color = var_4_34
			end

			if arg_1_1.time_ >= var_4_31 + var_4_32 and arg_1_1.time_ < var_4_31 + var_4_32 + arg_4_0 then
				local var_4_35 = Color.New(0, 0, 0)
				local var_4_36 = 0

				arg_1_1.mask_.enabled = false
				var_4_35.a = var_4_36
				arg_1_1.mask_.color = var_4_35
			end

			local var_4_37 = arg_1_1.actors_["1059ui_story"]
			local var_4_38 = 5.63333333333333

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1059ui_story == nil then
				arg_1_1.var_.characterEffect1059ui_story = var_4_37:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_39 = 0.0833333333333366

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39

				if arg_1_1.var_.characterEffect1059ui_story then
					arg_1_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 and arg_1_1.var_.characterEffect1059ui_story then
				arg_1_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_4_41 = 0
			local var_4_42 = 1

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_45 = ""
				local var_4_46 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_46 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_46 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_46

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_46
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

			local var_4_47 = 5.8
			local var_4_48 = 0.733333333333333

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")

				local var_4_51 = ""
				local var_4_52 = manager.audio:GetAudioName("bgm_side_daily03", "bgm_side_daily03")

				if var_4_52 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_52 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_52

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_52
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

			local var_4_53 = 0

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				SetActive(arg_1_1.dialog_, false)
				SetActive(arg_1_1.allBtn_.gameObject, true)
				arg_1_1.hideBtnsController_:SetSelectedIndex(1)

				arg_1_1.marker = "PlayCantSkipVideo"

				manager.video:Play("SofdecAsset/story/story_101161201.usm", function(arg_7_0)
					manager.video:Dispose()
				end, nil, nil, function(arg_8_0)
					if arg_8_0 then
						arg_1_1.state_ = "pause"
					else
						arg_1_1.state_ = "playing"
					end
				end)
				manager.video.transform_:SetSiblingIndex(1)
			end

			local var_4_54 = 3.66666666666667

			if var_4_53 <= arg_1_1.time_ and arg_1_1.time_ < var_4_53 + var_4_54 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_53 + var_4_54 and arg_1_1.time_ < var_4_53 + var_4_54 + arg_4_0 then
				arg_1_1.marker = ""
			end

			local var_4_55 = 3.666667

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				SetActive(arg_1_1.dialog_, true)
				SetActive(arg_1_1.allBtn_.gameObject, true)
				arg_1_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_4_56 = 0.0166666666666667

			if var_4_55 <= arg_1_1.time_ and arg_1_1.time_ < var_4_55 + var_4_56 then
				-- block empty
			end

			if arg_1_1.time_ >= var_4_55 + var_4_56 and arg_1_1.time_ < var_4_55 + var_4_56 + arg_4_0 then
				-- block empty
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_57 = 5.79999999999999
			local var_4_58 = 0.475

			if var_4_57 < arg_1_1.time_ and arg_1_1.time_ <= var_4_57 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_59 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_59:setOnUpdate(LuaHelper.FloatAction(function(arg_9_0)
					arg_1_1.dialogCg_.alpha = arg_9_0
				end))
				var_4_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_60 = arg_1_1:FormatText(StoryNameCfg[28].name)

				arg_1_1.leftNameTxt_.text = var_4_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_61 = arg_1_1:GetWordFromCfg(116141001)
				local var_4_62 = arg_1_1:FormatText(var_4_61.content)

				arg_1_1.text_.text = var_4_62

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_63 = 19
				local var_4_64 = utf8.len(var_4_62)
				local var_4_65 = var_4_63 <= 0 and var_4_58 or var_4_58 * (var_4_64 / var_4_63)

				if var_4_65 > 0 and var_4_58 < var_4_65 then
					arg_1_1.talkMaxDuration = var_4_65
					var_4_57 = var_4_57 + 0.3

					if var_4_65 + var_4_57 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_65 + var_4_57
					end
				end

				arg_1_1.text_.text = var_4_62
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141001", "story_v_out_116141.awb") ~= 0 then
					local var_4_66 = manager.audio:GetVoiceLength("story_v_out_116141", "116141001", "story_v_out_116141.awb") / 1000

					if var_4_66 + var_4_57 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_66 + var_4_57
					end

					if var_4_61.prefab_name ~= "" and arg_1_1.actors_[var_4_61.prefab_name] ~= nil then
						local var_4_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_61.prefab_name].transform, "story_v_out_116141", "116141001", "story_v_out_116141.awb")

						arg_1_1:RecordAudio("116141001", var_4_67)
						arg_1_1:RecordAudio("116141001", var_4_67)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_116141", "116141001", "story_v_out_116141.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_116141", "116141001", "story_v_out_116141.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_68 = var_4_57 + 0.3
			local var_4_69 = math.max(var_4_58, arg_1_1.talkMaxDuration)

			if var_4_68 <= arg_1_1.time_ and arg_1_1.time_ < var_4_68 + var_4_69 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_68) / var_4_69

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_68 + var_4_69 and arg_1_1.time_ < var_4_68 + var_4_69 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play116141002 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 116141002
		arg_11_1.duration_ = 6.53

		local var_11_0 = {
			zh = 5.3,
			ja = 6.533
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
				arg_11_0:Play116141003(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action436")
			end

			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_14_2 = 0
			local var_14_3 = 0.65

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_4 = arg_11_1:FormatText(StoryNameCfg[28].name)

				arg_11_1.leftNameTxt_.text = var_14_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_5 = arg_11_1:GetWordFromCfg(116141002)
				local var_14_6 = arg_11_1:FormatText(var_14_5.content)

				arg_11_1.text_.text = var_14_6

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_7 = 26
				local var_14_8 = utf8.len(var_14_6)
				local var_14_9 = var_14_7 <= 0 and var_14_3 or var_14_3 * (var_14_8 / var_14_7)

				if var_14_9 > 0 and var_14_3 < var_14_9 then
					arg_11_1.talkMaxDuration = var_14_9

					if var_14_9 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_2
					end
				end

				arg_11_1.text_.text = var_14_6
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141002", "story_v_out_116141.awb") ~= 0 then
					local var_14_10 = manager.audio:GetVoiceLength("story_v_out_116141", "116141002", "story_v_out_116141.awb") / 1000

					if var_14_10 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_2
					end

					if var_14_5.prefab_name ~= "" and arg_11_1.actors_[var_14_5.prefab_name] ~= nil then
						local var_14_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_5.prefab_name].transform, "story_v_out_116141", "116141002", "story_v_out_116141.awb")

						arg_11_1:RecordAudio("116141002", var_14_11)
						arg_11_1:RecordAudio("116141002", var_14_11)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_116141", "116141002", "story_v_out_116141.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_116141", "116141002", "story_v_out_116141.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_12 = math.max(var_14_3, arg_11_1.talkMaxDuration)

			if var_14_2 <= arg_11_1.time_ and arg_11_1.time_ < var_14_2 + var_14_12 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_2) / var_14_12

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_2 + var_14_12 and arg_11_1.time_ < var_14_2 + var_14_12 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play116141003 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 116141003
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play116141004(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1059ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1059ui_story == nil then
				arg_15_1.var_.characterEffect1059ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1059ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1059ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1059ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1059ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_18_7 = 0
			local var_18_8 = 0.85

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(116141003)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 34
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_8 or var_18_8 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_8 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_7 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_7
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_14 = math.max(var_18_8, arg_15_1.talkMaxDuration)

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_14 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_7) / var_18_14

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_7 + var_18_14 and arg_15_1.time_ < var_18_7 + var_18_14 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play116141004 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 116141004
		arg_19_1.duration_ = 6.57

		local var_19_0 = {
			zh = 5.933,
			ja = 6.566
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
				arg_19_0:Play116141005(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1059ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1059ui_story == nil then
				arg_19_1.var_.characterEffect1059ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1059ui_story then
					arg_19_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1059ui_story then
				arg_19_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action464")
			end

			local var_22_6 = 0
			local var_22_7 = 0.45

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[28].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(116141004)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 18
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_7 or var_22_7 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_7 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141004", "story_v_out_116141.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_116141", "116141004", "story_v_out_116141.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_116141", "116141004", "story_v_out_116141.awb")

						arg_19_1:RecordAudio("116141004", var_22_15)
						arg_19_1:RecordAudio("116141004", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_116141", "116141004", "story_v_out_116141.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_116141", "116141004", "story_v_out_116141.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play116141005 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 116141005
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play116141006(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 1

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_2 = "play"
				local var_26_3 = "effect"

				arg_23_1:AudioAction(var_26_2, var_26_3, "se_story_16", "se_story_16_beat", "")
			end

			local var_26_4 = 0.85
			local var_26_5 = 1

			if var_26_4 < arg_23_1.time_ and arg_23_1.time_ <= var_26_4 + arg_26_0 then
				local var_26_6 = "play"
				local var_26_7 = "effect"

				arg_23_1:AudioAction(var_26_6, var_26_7, "se_story_16", "se_story_16_door04", "")
			end

			local var_26_8 = arg_23_1.actors_["1059ui_story"].transform
			local var_26_9 = 0

			if var_26_9 < arg_23_1.time_ and arg_23_1.time_ <= var_26_9 + arg_26_0 then
				arg_23_1.var_.moveOldPos1059ui_story = var_26_8.localPosition
			end

			local var_26_10 = 0.001

			if var_26_9 <= arg_23_1.time_ and arg_23_1.time_ < var_26_9 + var_26_10 then
				local var_26_11 = (arg_23_1.time_ - var_26_9) / var_26_10
				local var_26_12 = Vector3.New(0, 100, 0)

				var_26_8.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1059ui_story, var_26_12, var_26_11)

				local var_26_13 = manager.ui.mainCamera.transform.position - var_26_8.position

				var_26_8.forward = Vector3.New(var_26_13.x, var_26_13.y, var_26_13.z)

				local var_26_14 = var_26_8.localEulerAngles

				var_26_14.z = 0
				var_26_14.x = 0
				var_26_8.localEulerAngles = var_26_14
			end

			if arg_23_1.time_ >= var_26_9 + var_26_10 and arg_23_1.time_ < var_26_9 + var_26_10 + arg_26_0 then
				var_26_8.localPosition = Vector3.New(0, 100, 0)

				local var_26_15 = manager.ui.mainCamera.transform.position - var_26_8.position

				var_26_8.forward = Vector3.New(var_26_15.x, var_26_15.y, var_26_15.z)

				local var_26_16 = var_26_8.localEulerAngles

				var_26_16.z = 0
				var_26_16.x = 0
				var_26_8.localEulerAngles = var_26_16
			end

			local var_26_17 = 0
			local var_26_18 = 0.85

			if var_26_17 < arg_23_1.time_ and arg_23_1.time_ <= var_26_17 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_19 = arg_23_1:GetWordFromCfg(116141005)
				local var_26_20 = arg_23_1:FormatText(var_26_19.content)

				arg_23_1.text_.text = var_26_20

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_21 = 34
				local var_26_22 = utf8.len(var_26_20)
				local var_26_23 = var_26_21 <= 0 and var_26_18 or var_26_18 * (var_26_22 / var_26_21)

				if var_26_23 > 0 and var_26_18 < var_26_23 then
					arg_23_1.talkMaxDuration = var_26_23

					if var_26_23 + var_26_17 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_23 + var_26_17
					end
				end

				arg_23_1.text_.text = var_26_20
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_24 = math.max(var_26_18, arg_23_1.talkMaxDuration)

			if var_26_17 <= arg_23_1.time_ and arg_23_1.time_ < var_26_17 + var_26_24 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_17) / var_26_24

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_17 + var_26_24 and arg_23_1.time_ < var_26_17 + var_26_24 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play116141006 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 116141006
		arg_27_1.duration_ = 3.5

		local var_27_0 = {
			zh = 2.166,
			ja = 3.5
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
				arg_27_0:Play116141007(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1028ui_story"

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

			local var_30_4 = arg_27_1.actors_["1028ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1028ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(-0.7, -0.9, -5.9)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1028ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = arg_27_1.actors_["1028ui_story"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story == nil then
				arg_27_1.var_.characterEffect1028ui_story = var_30_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_15 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.characterEffect1028ui_story then
					arg_27_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1028ui_story then
				arg_27_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_30_19 = 0
			local var_30_20 = 0.25

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[327].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(116141006)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 10
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141006", "story_v_out_116141.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_out_116141", "116141006", "story_v_out_116141.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_out_116141", "116141006", "story_v_out_116141.awb")

						arg_27_1:RecordAudio("116141006", var_30_28)
						arg_27_1:RecordAudio("116141006", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_116141", "116141006", "story_v_out_116141.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_116141", "116141006", "story_v_out_116141.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play116141007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 116141007
		arg_31_1.duration_ = 6

		local var_31_0 = {
			zh = 6,
			ja = 3.533
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
				arg_31_0:Play116141008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1059ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story == nil then
				arg_31_1.var_.characterEffect1059ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.2

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1059ui_story then
					arg_31_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1059ui_story then
				arg_31_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_34_4 = arg_31_1.actors_["1028ui_story"]
			local var_34_5 = 0

			if var_34_5 < arg_31_1.time_ and arg_31_1.time_ <= var_34_5 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story == nil then
				arg_31_1.var_.characterEffect1028ui_story = var_34_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_6 = 0.2

			if var_34_5 <= arg_31_1.time_ and arg_31_1.time_ < var_34_5 + var_34_6 then
				local var_34_7 = (arg_31_1.time_ - var_34_5) / var_34_6

				if arg_31_1.var_.characterEffect1028ui_story then
					local var_34_8 = Mathf.Lerp(0, 0.5, var_34_7)

					arg_31_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1028ui_story.fillRatio = var_34_8
				end
			end

			if arg_31_1.time_ >= var_34_5 + var_34_6 and arg_31_1.time_ < var_34_5 + var_34_6 + arg_34_0 and arg_31_1.var_.characterEffect1028ui_story then
				local var_34_9 = 0.5

				arg_31_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1028ui_story.fillRatio = var_34_9
			end

			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_34_11 = 0

			if var_34_11 < arg_31_1.time_ and arg_31_1.time_ <= var_34_11 + arg_34_0 then
				arg_31_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_34_12 = arg_31_1.actors_["1059ui_story"].transform
			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.var_.moveOldPos1059ui_story = var_34_12.localPosition
			end

			local var_34_14 = 0.001

			if var_34_13 <= arg_31_1.time_ and arg_31_1.time_ < var_34_13 + var_34_14 then
				local var_34_15 = (arg_31_1.time_ - var_34_13) / var_34_14
				local var_34_16 = Vector3.New(0.7, -1.05, -6)

				var_34_12.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1059ui_story, var_34_16, var_34_15)

				local var_34_17 = manager.ui.mainCamera.transform.position - var_34_12.position

				var_34_12.forward = Vector3.New(var_34_17.x, var_34_17.y, var_34_17.z)

				local var_34_18 = var_34_12.localEulerAngles

				var_34_18.z = 0
				var_34_18.x = 0
				var_34_12.localEulerAngles = var_34_18
			end

			if arg_31_1.time_ >= var_34_13 + var_34_14 and arg_31_1.time_ < var_34_13 + var_34_14 + arg_34_0 then
				var_34_12.localPosition = Vector3.New(0.7, -1.05, -6)

				local var_34_19 = manager.ui.mainCamera.transform.position - var_34_12.position

				var_34_12.forward = Vector3.New(var_34_19.x, var_34_19.y, var_34_19.z)

				local var_34_20 = var_34_12.localEulerAngles

				var_34_20.z = 0
				var_34_20.x = 0
				var_34_12.localEulerAngles = var_34_20
			end

			local var_34_21 = 0
			local var_34_22 = 0.8

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[28].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(116141007)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 32
				local var_34_27 = utf8.len(var_34_25)
				local var_34_28 = var_34_26 <= 0 and var_34_22 or var_34_22 * (var_34_27 / var_34_26)

				if var_34_28 > 0 and var_34_22 < var_34_28 then
					arg_31_1.talkMaxDuration = var_34_28

					if var_34_28 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_25
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141007", "story_v_out_116141.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_116141", "116141007", "story_v_out_116141.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_116141", "116141007", "story_v_out_116141.awb")

						arg_31_1:RecordAudio("116141007", var_34_30)
						arg_31_1:RecordAudio("116141007", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_116141", "116141007", "story_v_out_116141.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_116141", "116141007", "story_v_out_116141.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_31 and arg_31_1.time_ < var_34_21 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play116141008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 116141008
		arg_35_1.duration_ = 5.93

		local var_35_0 = {
			zh = 5.933,
			ja = 4.666
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
				arg_35_0:Play116141009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1028ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1028ui_story == nil then
				arg_35_1.var_.characterEffect1028ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1028ui_story then
					arg_35_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1028ui_story then
				arg_35_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1059ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story == nil then
				arg_35_1.var_.characterEffect1059ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.2

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1059ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1059ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1059ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1059ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_38_11 = 0
			local var_38_12 = 0.675

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_13 = arg_35_1:FormatText(StoryNameCfg[327].name)

				arg_35_1.leftNameTxt_.text = var_38_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(116141008)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 27
				local var_38_17 = utf8.len(var_38_15)
				local var_38_18 = var_38_16 <= 0 and var_38_12 or var_38_12 * (var_38_17 / var_38_16)

				if var_38_18 > 0 and var_38_12 < var_38_18 then
					arg_35_1.talkMaxDuration = var_38_18

					if var_38_18 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_11
					end
				end

				arg_35_1.text_.text = var_38_15
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141008", "story_v_out_116141.awb") ~= 0 then
					local var_38_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141008", "story_v_out_116141.awb") / 1000

					if var_38_19 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_11
					end

					if var_38_14.prefab_name ~= "" and arg_35_1.actors_[var_38_14.prefab_name] ~= nil then
						local var_38_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_14.prefab_name].transform, "story_v_out_116141", "116141008", "story_v_out_116141.awb")

						arg_35_1:RecordAudio("116141008", var_38_20)
						arg_35_1:RecordAudio("116141008", var_38_20)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_116141", "116141008", "story_v_out_116141.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_116141", "116141008", "story_v_out_116141.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_21 = math.max(var_38_12, arg_35_1.talkMaxDuration)

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_21 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_11) / var_38_21

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_11 + var_38_21 and arg_35_1.time_ < var_38_11 + var_38_21 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play116141009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 116141009
		arg_39_1.duration_ = 9.13

		local var_39_0 = {
			zh = 8.5,
			ja = 9.133
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
				arg_39_0:Play116141010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1059ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story == nil then
				arg_39_1.var_.characterEffect1059ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1059ui_story then
					arg_39_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1059ui_story then
				arg_39_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_42_4 = arg_39_1.actors_["1028ui_story"]
			local var_42_5 = 0

			if var_42_5 < arg_39_1.time_ and arg_39_1.time_ <= var_42_5 + arg_42_0 and arg_39_1.var_.characterEffect1028ui_story == nil then
				arg_39_1.var_.characterEffect1028ui_story = var_42_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_6 = 0.2

			if var_42_5 <= arg_39_1.time_ and arg_39_1.time_ < var_42_5 + var_42_6 then
				local var_42_7 = (arg_39_1.time_ - var_42_5) / var_42_6

				if arg_39_1.var_.characterEffect1028ui_story then
					local var_42_8 = Mathf.Lerp(0, 0.5, var_42_7)

					arg_39_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1028ui_story.fillRatio = var_42_8
				end
			end

			if arg_39_1.time_ >= var_42_5 + var_42_6 and arg_39_1.time_ < var_42_5 + var_42_6 + arg_42_0 and arg_39_1.var_.characterEffect1028ui_story then
				local var_42_9 = 0.5

				arg_39_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1028ui_story.fillRatio = var_42_9
			end

			local var_42_10 = 0

			if var_42_10 < arg_39_1.time_ and arg_39_1.time_ <= var_42_10 + arg_42_0 then
				arg_39_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_42_11 = 0

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_42_12 = 0
			local var_42_13 = 1.075

			if var_42_12 < arg_39_1.time_ and arg_39_1.time_ <= var_42_12 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_14 = arg_39_1:FormatText(StoryNameCfg[28].name)

				arg_39_1.leftNameTxt_.text = var_42_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_15 = arg_39_1:GetWordFromCfg(116141009)
				local var_42_16 = arg_39_1:FormatText(var_42_15.content)

				arg_39_1.text_.text = var_42_16

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_17 = 43
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141009", "story_v_out_116141.awb") ~= 0 then
					local var_42_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141009", "story_v_out_116141.awb") / 1000

					if var_42_20 + var_42_12 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_20 + var_42_12
					end

					if var_42_15.prefab_name ~= "" and arg_39_1.actors_[var_42_15.prefab_name] ~= nil then
						local var_42_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_15.prefab_name].transform, "story_v_out_116141", "116141009", "story_v_out_116141.awb")

						arg_39_1:RecordAudio("116141009", var_42_21)
						arg_39_1:RecordAudio("116141009", var_42_21)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_116141", "116141009", "story_v_out_116141.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_116141", "116141009", "story_v_out_116141.awb")
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
	Play116141010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 116141010
		arg_43_1.duration_ = 8.07

		local var_43_0 = {
			zh = 8.066,
			ja = 7.466
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
				arg_43_0:Play116141011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1028ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1028ui_story == nil then
				arg_43_1.var_.characterEffect1028ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1028ui_story then
					arg_43_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1028ui_story then
				arg_43_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_46_4 = arg_43_1.actors_["1059ui_story"]
			local var_46_5 = 0

			if var_46_5 < arg_43_1.time_ and arg_43_1.time_ <= var_46_5 + arg_46_0 and arg_43_1.var_.characterEffect1059ui_story == nil then
				arg_43_1.var_.characterEffect1059ui_story = var_46_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_6 = 0.2

			if var_46_5 <= arg_43_1.time_ and arg_43_1.time_ < var_46_5 + var_46_6 then
				local var_46_7 = (arg_43_1.time_ - var_46_5) / var_46_6

				if arg_43_1.var_.characterEffect1059ui_story then
					local var_46_8 = Mathf.Lerp(0, 0.5, var_46_7)

					arg_43_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1059ui_story.fillRatio = var_46_8
				end
			end

			if arg_43_1.time_ >= var_46_5 + var_46_6 and arg_43_1.time_ < var_46_5 + var_46_6 + arg_46_0 and arg_43_1.var_.characterEffect1059ui_story then
				local var_46_9 = 0.5

				arg_43_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1059ui_story.fillRatio = var_46_9
			end

			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_46_11 = 0
			local var_46_12 = 0.775

			if var_46_11 < arg_43_1.time_ and arg_43_1.time_ <= var_46_11 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_13 = arg_43_1:FormatText(StoryNameCfg[327].name)

				arg_43_1.leftNameTxt_.text = var_46_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_14 = arg_43_1:GetWordFromCfg(116141010)
				local var_46_15 = arg_43_1:FormatText(var_46_14.content)

				arg_43_1.text_.text = var_46_15

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_16 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141010", "story_v_out_116141.awb") ~= 0 then
					local var_46_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141010", "story_v_out_116141.awb") / 1000

					if var_46_19 + var_46_11 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_19 + var_46_11
					end

					if var_46_14.prefab_name ~= "" and arg_43_1.actors_[var_46_14.prefab_name] ~= nil then
						local var_46_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_14.prefab_name].transform, "story_v_out_116141", "116141010", "story_v_out_116141.awb")

						arg_43_1:RecordAudio("116141010", var_46_20)
						arg_43_1:RecordAudio("116141010", var_46_20)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_116141", "116141010", "story_v_out_116141.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_116141", "116141010", "story_v_out_116141.awb")
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
	Play116141011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 116141011
		arg_47_1.duration_ = 2

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play116141012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1059ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story == nil then
				arg_47_1.var_.characterEffect1059ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1059ui_story then
					arg_47_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1059ui_story then
				arg_47_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_50_4 = arg_47_1.actors_["1028ui_story"]
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story == nil then
				arg_47_1.var_.characterEffect1028ui_story = var_50_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_6 = 0.2

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6

				if arg_47_1.var_.characterEffect1028ui_story then
					local var_50_8 = Mathf.Lerp(0, 0.5, var_50_7)

					arg_47_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1028ui_story.fillRatio = var_50_8
				end
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 and arg_47_1.var_.characterEffect1028ui_story then
				local var_50_9 = 0.5

				arg_47_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1028ui_story.fillRatio = var_50_9
			end

			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 then
				arg_47_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action452")
			end

			local var_50_11 = 0

			if var_50_11 < arg_47_1.time_ and arg_47_1.time_ <= var_50_11 + arg_50_0 then
				arg_47_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_50_12 = 0
			local var_50_13 = 0.1

			if var_50_12 < arg_47_1.time_ and arg_47_1.time_ <= var_50_12 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_14 = arg_47_1:FormatText(StoryNameCfg[28].name)

				arg_47_1.leftNameTxt_.text = var_50_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_15 = arg_47_1:GetWordFromCfg(116141011)
				local var_50_16 = arg_47_1:FormatText(var_50_15.content)

				arg_47_1.text_.text = var_50_16

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_17 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141011", "story_v_out_116141.awb") ~= 0 then
					local var_50_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141011", "story_v_out_116141.awb") / 1000

					if var_50_20 + var_50_12 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_20 + var_50_12
					end

					if var_50_15.prefab_name ~= "" and arg_47_1.actors_[var_50_15.prefab_name] ~= nil then
						local var_50_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_15.prefab_name].transform, "story_v_out_116141", "116141011", "story_v_out_116141.awb")

						arg_47_1:RecordAudio("116141011", var_50_21)
						arg_47_1:RecordAudio("116141011", var_50_21)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_116141", "116141011", "story_v_out_116141.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_116141", "116141011", "story_v_out_116141.awb")
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
	Play116141012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 116141012
		arg_51_1.duration_ = 2

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play116141013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1028ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story == nil then
				arg_51_1.var_.characterEffect1028ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1028ui_story then
					arg_51_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1028ui_story then
				arg_51_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_54_4 = arg_51_1.actors_["1059ui_story"]
			local var_54_5 = 0

			if var_54_5 < arg_51_1.time_ and arg_51_1.time_ <= var_54_5 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story == nil then
				arg_51_1.var_.characterEffect1059ui_story = var_54_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_6 = 0.2

			if var_54_5 <= arg_51_1.time_ and arg_51_1.time_ < var_54_5 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_5) / var_54_6

				if arg_51_1.var_.characterEffect1059ui_story then
					local var_54_8 = Mathf.Lerp(0, 0.5, var_54_7)

					arg_51_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1059ui_story.fillRatio = var_54_8
				end
			end

			if arg_51_1.time_ >= var_54_5 + var_54_6 and arg_51_1.time_ < var_54_5 + var_54_6 + arg_54_0 and arg_51_1.var_.characterEffect1059ui_story then
				local var_54_9 = 0.5

				arg_51_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1059ui_story.fillRatio = var_54_9
			end

			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 then
				arg_51_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_54_11 = 0

			if var_54_11 < arg_51_1.time_ and arg_51_1.time_ <= var_54_11 + arg_54_0 then
				arg_51_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_54_12 = 0
			local var_54_13 = 0.1

			if var_54_12 < arg_51_1.time_ and arg_51_1.time_ <= var_54_12 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_14 = arg_51_1:FormatText(StoryNameCfg[327].name)

				arg_51_1.leftNameTxt_.text = var_54_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_15 = arg_51_1:GetWordFromCfg(116141012)
				local var_54_16 = arg_51_1:FormatText(var_54_15.content)

				arg_51_1.text_.text = var_54_16

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_17 = 4
				local var_54_18 = utf8.len(var_54_16)
				local var_54_19 = var_54_17 <= 0 and var_54_13 or var_54_13 * (var_54_18 / var_54_17)

				if var_54_19 > 0 and var_54_13 < var_54_19 then
					arg_51_1.talkMaxDuration = var_54_19

					if var_54_19 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_19 + var_54_12
					end
				end

				arg_51_1.text_.text = var_54_16
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141012", "story_v_out_116141.awb") ~= 0 then
					local var_54_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141012", "story_v_out_116141.awb") / 1000

					if var_54_20 + var_54_12 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_20 + var_54_12
					end

					if var_54_15.prefab_name ~= "" and arg_51_1.actors_[var_54_15.prefab_name] ~= nil then
						local var_54_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_15.prefab_name].transform, "story_v_out_116141", "116141012", "story_v_out_116141.awb")

						arg_51_1:RecordAudio("116141012", var_54_21)
						arg_51_1:RecordAudio("116141012", var_54_21)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_116141", "116141012", "story_v_out_116141.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_116141", "116141012", "story_v_out_116141.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_22 = math.max(var_54_13, arg_51_1.talkMaxDuration)

			if var_54_12 <= arg_51_1.time_ and arg_51_1.time_ < var_54_12 + var_54_22 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_12) / var_54_22

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_12 + var_54_22 and arg_51_1.time_ < var_54_12 + var_54_22 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play116141013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 116141013
		arg_55_1.duration_ = 12.47

		local var_55_0 = {
			zh = 10,
			ja = 12.466
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
				arg_55_0:Play116141014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1059ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1059ui_story == nil then
				arg_55_1.var_.characterEffect1059ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1059ui_story then
					arg_55_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1059ui_story then
				arg_55_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_58_4 = arg_55_1.actors_["1028ui_story"]
			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 and arg_55_1.var_.characterEffect1028ui_story == nil then
				arg_55_1.var_.characterEffect1028ui_story = var_58_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_6 = 0.2

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6

				if arg_55_1.var_.characterEffect1028ui_story then
					local var_58_8 = Mathf.Lerp(0, 0.5, var_58_7)

					arg_55_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1028ui_story.fillRatio = var_58_8
				end
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 and arg_55_1.var_.characterEffect1028ui_story then
				local var_58_9 = 0.5

				arg_55_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1028ui_story.fillRatio = var_58_9
			end

			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 then
				arg_55_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_2")
			end

			local var_58_11 = 0

			if var_58_11 < arg_55_1.time_ and arg_55_1.time_ <= var_58_11 + arg_58_0 then
				arg_55_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_58_12 = 0
			local var_58_13 = 1.15

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_14 = arg_55_1:FormatText(StoryNameCfg[28].name)

				arg_55_1.leftNameTxt_.text = var_58_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_15 = arg_55_1:GetWordFromCfg(116141013)
				local var_58_16 = arg_55_1:FormatText(var_58_15.content)

				arg_55_1.text_.text = var_58_16

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_17 = 46
				local var_58_18 = utf8.len(var_58_16)
				local var_58_19 = var_58_17 <= 0 and var_58_13 or var_58_13 * (var_58_18 / var_58_17)

				if var_58_19 > 0 and var_58_13 < var_58_19 then
					arg_55_1.talkMaxDuration = var_58_19

					if var_58_19 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_19 + var_58_12
					end
				end

				arg_55_1.text_.text = var_58_16
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141013", "story_v_out_116141.awb") ~= 0 then
					local var_58_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141013", "story_v_out_116141.awb") / 1000

					if var_58_20 + var_58_12 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_20 + var_58_12
					end

					if var_58_15.prefab_name ~= "" and arg_55_1.actors_[var_58_15.prefab_name] ~= nil then
						local var_58_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_15.prefab_name].transform, "story_v_out_116141", "116141013", "story_v_out_116141.awb")

						arg_55_1:RecordAudio("116141013", var_58_21)
						arg_55_1:RecordAudio("116141013", var_58_21)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_116141", "116141013", "story_v_out_116141.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_116141", "116141013", "story_v_out_116141.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_22 = math.max(var_58_13, arg_55_1.talkMaxDuration)

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_22 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_12) / var_58_22

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_12 + var_58_22 and arg_55_1.time_ < var_58_12 + var_58_22 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play116141014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 116141014
		arg_59_1.duration_ = 4.8

		local var_59_0 = {
			zh = 4.8,
			ja = 4.033
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
				arg_59_0:Play116141015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1028ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1028ui_story == nil then
				arg_59_1.var_.characterEffect1028ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.2

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1028ui_story then
					arg_59_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1028ui_story then
				arg_59_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_62_4 = arg_59_1.actors_["1059ui_story"]
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 and arg_59_1.var_.characterEffect1059ui_story == nil then
				arg_59_1.var_.characterEffect1059ui_story = var_62_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_6 = 0.2

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6

				if arg_59_1.var_.characterEffect1059ui_story then
					local var_62_8 = Mathf.Lerp(0, 0.5, var_62_7)

					arg_59_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1059ui_story.fillRatio = var_62_8
				end
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 and arg_59_1.var_.characterEffect1059ui_story then
				local var_62_9 = 0.5

				arg_59_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1059ui_story.fillRatio = var_62_9
			end

			local var_62_10 = 0

			if var_62_10 < arg_59_1.time_ and arg_59_1.time_ <= var_62_10 + arg_62_0 then
				arg_59_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_62_11 = 0

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_62_12 = 0
			local var_62_13 = 0.575

			if var_62_12 < arg_59_1.time_ and arg_59_1.time_ <= var_62_12 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_14 = arg_59_1:FormatText(StoryNameCfg[327].name)

				arg_59_1.leftNameTxt_.text = var_62_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_15 = arg_59_1:GetWordFromCfg(116141014)
				local var_62_16 = arg_59_1:FormatText(var_62_15.content)

				arg_59_1.text_.text = var_62_16

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_17 = 23
				local var_62_18 = utf8.len(var_62_16)
				local var_62_19 = var_62_17 <= 0 and var_62_13 or var_62_13 * (var_62_18 / var_62_17)

				if var_62_19 > 0 and var_62_13 < var_62_19 then
					arg_59_1.talkMaxDuration = var_62_19

					if var_62_19 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_19 + var_62_12
					end
				end

				arg_59_1.text_.text = var_62_16
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141014", "story_v_out_116141.awb") ~= 0 then
					local var_62_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141014", "story_v_out_116141.awb") / 1000

					if var_62_20 + var_62_12 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_20 + var_62_12
					end

					if var_62_15.prefab_name ~= "" and arg_59_1.actors_[var_62_15.prefab_name] ~= nil then
						local var_62_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_15.prefab_name].transform, "story_v_out_116141", "116141014", "story_v_out_116141.awb")

						arg_59_1:RecordAudio("116141014", var_62_21)
						arg_59_1:RecordAudio("116141014", var_62_21)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_116141", "116141014", "story_v_out_116141.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_116141", "116141014", "story_v_out_116141.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_22 = math.max(var_62_13, arg_59_1.talkMaxDuration)

			if var_62_12 <= arg_59_1.time_ and arg_59_1.time_ < var_62_12 + var_62_22 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_12) / var_62_22

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_12 + var_62_22 and arg_59_1.time_ < var_62_12 + var_62_22 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play116141015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 116141015
		arg_63_1.duration_ = 5.4

		local var_63_0 = {
			zh = 5.2,
			ja = 5.4
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
				arg_63_0:Play116141016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1059ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story == nil then
				arg_63_1.var_.characterEffect1059ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1059ui_story then
					arg_63_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1059ui_story then
				arg_63_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1028ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1028ui_story == nil then
				arg_63_1.var_.characterEffect1028ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.2

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1028ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1028ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1028ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1028ui_story.fillRatio = var_66_9
			end

			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_66_11 = 0

			if var_66_11 < arg_63_1.time_ and arg_63_1.time_ <= var_66_11 + arg_66_0 then
				arg_63_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_66_12 = 0
			local var_66_13 = 0.525

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_14 = arg_63_1:FormatText(StoryNameCfg[28].name)

				arg_63_1.leftNameTxt_.text = var_66_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_15 = arg_63_1:GetWordFromCfg(116141015)
				local var_66_16 = arg_63_1:FormatText(var_66_15.content)

				arg_63_1.text_.text = var_66_16

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_17 = 21
				local var_66_18 = utf8.len(var_66_16)
				local var_66_19 = var_66_17 <= 0 and var_66_13 or var_66_13 * (var_66_18 / var_66_17)

				if var_66_19 > 0 and var_66_13 < var_66_19 then
					arg_63_1.talkMaxDuration = var_66_19

					if var_66_19 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_19 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_16
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141015", "story_v_out_116141.awb") ~= 0 then
					local var_66_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141015", "story_v_out_116141.awb") / 1000

					if var_66_20 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_12
					end

					if var_66_15.prefab_name ~= "" and arg_63_1.actors_[var_66_15.prefab_name] ~= nil then
						local var_66_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_15.prefab_name].transform, "story_v_out_116141", "116141015", "story_v_out_116141.awb")

						arg_63_1:RecordAudio("116141015", var_66_21)
						arg_63_1:RecordAudio("116141015", var_66_21)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_116141", "116141015", "story_v_out_116141.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_116141", "116141015", "story_v_out_116141.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_22 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_22 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_22

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_22 and arg_63_1.time_ < var_66_12 + var_66_22 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play116141016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 116141016
		arg_67_1.duration_ = 7.97

		local var_67_0 = {
			zh = 4.566,
			ja = 7.966
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
				arg_67_0:Play116141017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_70_1 = 0
			local var_70_2 = 0.65

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_3 = arg_67_1:FormatText(StoryNameCfg[28].name)

				arg_67_1.leftNameTxt_.text = var_70_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_4 = arg_67_1:GetWordFromCfg(116141016)
				local var_70_5 = arg_67_1:FormatText(var_70_4.content)

				arg_67_1.text_.text = var_70_5

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_6 = 26
				local var_70_7 = utf8.len(var_70_5)
				local var_70_8 = var_70_6 <= 0 and var_70_2 or var_70_2 * (var_70_7 / var_70_6)

				if var_70_8 > 0 and var_70_2 < var_70_8 then
					arg_67_1.talkMaxDuration = var_70_8

					if var_70_8 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_1
					end
				end

				arg_67_1.text_.text = var_70_5
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141016", "story_v_out_116141.awb") ~= 0 then
					local var_70_9 = manager.audio:GetVoiceLength("story_v_out_116141", "116141016", "story_v_out_116141.awb") / 1000

					if var_70_9 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_9 + var_70_1
					end

					if var_70_4.prefab_name ~= "" and arg_67_1.actors_[var_70_4.prefab_name] ~= nil then
						local var_70_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_4.prefab_name].transform, "story_v_out_116141", "116141016", "story_v_out_116141.awb")

						arg_67_1:RecordAudio("116141016", var_70_10)
						arg_67_1:RecordAudio("116141016", var_70_10)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_116141", "116141016", "story_v_out_116141.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_116141", "116141016", "story_v_out_116141.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_11 = math.max(var_70_2, arg_67_1.talkMaxDuration)

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_11 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_1) / var_70_11

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_1 + var_70_11 and arg_67_1.time_ < var_70_1 + var_70_11 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play116141017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 116141017
		arg_71_1.duration_ = 7.03

		local var_71_0 = {
			zh = 7.033,
			ja = 4.6
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
				arg_71_0:Play116141018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1028ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1028ui_story == nil then
				arg_71_1.var_.characterEffect1028ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.2

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1028ui_story then
					arg_71_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1028ui_story then
				arg_71_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_74_4 = arg_71_1.actors_["1059ui_story"]
			local var_74_5 = 0

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 and arg_71_1.var_.characterEffect1059ui_story == nil then
				arg_71_1.var_.characterEffect1059ui_story = var_74_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_6 = 0.2

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_6 then
				local var_74_7 = (arg_71_1.time_ - var_74_5) / var_74_6

				if arg_71_1.var_.characterEffect1059ui_story then
					local var_74_8 = Mathf.Lerp(0, 0.5, var_74_7)

					arg_71_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1059ui_story.fillRatio = var_74_8
				end
			end

			if arg_71_1.time_ >= var_74_5 + var_74_6 and arg_71_1.time_ < var_74_5 + var_74_6 + arg_74_0 and arg_71_1.var_.characterEffect1059ui_story then
				local var_74_9 = 0.5

				arg_71_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1059ui_story.fillRatio = var_74_9
			end

			local var_74_10 = 0

			if var_74_10 < arg_71_1.time_ and arg_71_1.time_ <= var_74_10 + arg_74_0 then
				arg_71_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action456")
			end

			local var_74_11 = 0

			if var_74_11 < arg_71_1.time_ and arg_71_1.time_ <= var_74_11 + arg_74_0 then
				arg_71_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_74_12 = 0
			local var_74_13 = 0.45

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_14 = arg_71_1:FormatText(StoryNameCfg[327].name)

				arg_71_1.leftNameTxt_.text = var_74_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_15 = arg_71_1:GetWordFromCfg(116141017)
				local var_74_16 = arg_71_1:FormatText(var_74_15.content)

				arg_71_1.text_.text = var_74_16

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_17 = 18
				local var_74_18 = utf8.len(var_74_16)
				local var_74_19 = var_74_17 <= 0 and var_74_13 or var_74_13 * (var_74_18 / var_74_17)

				if var_74_19 > 0 and var_74_13 < var_74_19 then
					arg_71_1.talkMaxDuration = var_74_19

					if var_74_19 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_19 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_16
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141017", "story_v_out_116141.awb") ~= 0 then
					local var_74_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141017", "story_v_out_116141.awb") / 1000

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end

					if var_74_15.prefab_name ~= "" and arg_71_1.actors_[var_74_15.prefab_name] ~= nil then
						local var_74_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_15.prefab_name].transform, "story_v_out_116141", "116141017", "story_v_out_116141.awb")

						arg_71_1:RecordAudio("116141017", var_74_21)
						arg_71_1:RecordAudio("116141017", var_74_21)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_116141", "116141017", "story_v_out_116141.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_116141", "116141017", "story_v_out_116141.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_22 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_12 <= arg_71_1.time_ and arg_71_1.time_ < var_74_12 + var_74_22 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_12) / var_74_22

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_12 + var_74_22 and arg_71_1.time_ < var_74_12 + var_74_22 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play116141018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 116141018
		arg_75_1.duration_ = 19.73

		local var_75_0 = {
			zh = 9.433,
			ja = 19.733
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
				arg_75_0:Play116141019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1059ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1059ui_story == nil then
				arg_75_1.var_.characterEffect1059ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.2

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1059ui_story then
					arg_75_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1059ui_story then
				arg_75_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1028ui_story"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect1028ui_story == nil then
				arg_75_1.var_.characterEffect1028ui_story = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.2

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect1028ui_story then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1028ui_story.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1028ui_story then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1028ui_story.fillRatio = var_78_9
			end

			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_2")
			end

			local var_78_11 = 0

			if var_78_11 < arg_75_1.time_ and arg_75_1.time_ <= var_78_11 + arg_78_0 then
				arg_75_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_78_12 = 0
			local var_78_13 = 1.125

			if var_78_12 < arg_75_1.time_ and arg_75_1.time_ <= var_78_12 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_14 = arg_75_1:FormatText(StoryNameCfg[28].name)

				arg_75_1.leftNameTxt_.text = var_78_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_15 = arg_75_1:GetWordFromCfg(116141018)
				local var_78_16 = arg_75_1:FormatText(var_78_15.content)

				arg_75_1.text_.text = var_78_16

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_17 = 45
				local var_78_18 = utf8.len(var_78_16)
				local var_78_19 = var_78_17 <= 0 and var_78_13 or var_78_13 * (var_78_18 / var_78_17)

				if var_78_19 > 0 and var_78_13 < var_78_19 then
					arg_75_1.talkMaxDuration = var_78_19

					if var_78_19 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_19 + var_78_12
					end
				end

				arg_75_1.text_.text = var_78_16
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141018", "story_v_out_116141.awb") ~= 0 then
					local var_78_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141018", "story_v_out_116141.awb") / 1000

					if var_78_20 + var_78_12 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_12
					end

					if var_78_15.prefab_name ~= "" and arg_75_1.actors_[var_78_15.prefab_name] ~= nil then
						local var_78_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_15.prefab_name].transform, "story_v_out_116141", "116141018", "story_v_out_116141.awb")

						arg_75_1:RecordAudio("116141018", var_78_21)
						arg_75_1:RecordAudio("116141018", var_78_21)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_116141", "116141018", "story_v_out_116141.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_116141", "116141018", "story_v_out_116141.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_22 = math.max(var_78_13, arg_75_1.talkMaxDuration)

			if var_78_12 <= arg_75_1.time_ and arg_75_1.time_ < var_78_12 + var_78_22 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_12) / var_78_22

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_12 + var_78_22 and arg_75_1.time_ < var_78_12 + var_78_22 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play116141019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 116141019
		arg_79_1.duration_ = 9.4

		local var_79_0 = {
			zh = 4.8,
			ja = 9.4
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
				arg_79_0:Play116141020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1028ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1028ui_story == nil then
				arg_79_1.var_.characterEffect1028ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1028ui_story then
					arg_79_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1028ui_story then
				arg_79_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_82_4 = arg_79_1.actors_["1059ui_story"]
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 and arg_79_1.var_.characterEffect1059ui_story == nil then
				arg_79_1.var_.characterEffect1059ui_story = var_82_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_6 = 0.2

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6

				if arg_79_1.var_.characterEffect1059ui_story then
					local var_82_8 = Mathf.Lerp(0, 0.5, var_82_7)

					arg_79_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1059ui_story.fillRatio = var_82_8
				end
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 and arg_79_1.var_.characterEffect1059ui_story then
				local var_82_9 = 0.5

				arg_79_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1059ui_story.fillRatio = var_82_9
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_2")
			end

			local var_82_11 = 0

			if var_82_11 < arg_79_1.time_ and arg_79_1.time_ <= var_82_11 + arg_82_0 then
				arg_79_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_82_12 = 0
			local var_82_13 = 0.55

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_14 = arg_79_1:FormatText(StoryNameCfg[327].name)

				arg_79_1.leftNameTxt_.text = var_82_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_15 = arg_79_1:GetWordFromCfg(116141019)
				local var_82_16 = arg_79_1:FormatText(var_82_15.content)

				arg_79_1.text_.text = var_82_16

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_17 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141019", "story_v_out_116141.awb") ~= 0 then
					local var_82_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141019", "story_v_out_116141.awb") / 1000

					if var_82_20 + var_82_12 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_20 + var_82_12
					end

					if var_82_15.prefab_name ~= "" and arg_79_1.actors_[var_82_15.prefab_name] ~= nil then
						local var_82_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_15.prefab_name].transform, "story_v_out_116141", "116141019", "story_v_out_116141.awb")

						arg_79_1:RecordAudio("116141019", var_82_21)
						arg_79_1:RecordAudio("116141019", var_82_21)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_116141", "116141019", "story_v_out_116141.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_116141", "116141019", "story_v_out_116141.awb")
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
	Play116141020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 116141020
		arg_83_1.duration_ = 7.13

		local var_83_0 = {
			zh = 4.9,
			ja = 7.133
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
				arg_83_0:Play116141021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1059ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story == nil then
				arg_83_1.var_.characterEffect1059ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1059ui_story then
					arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1059ui_story then
				arg_83_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_86_4 = arg_83_1.actors_["1028ui_story"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect1028ui_story == nil then
				arg_83_1.var_.characterEffect1028ui_story = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.2

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect1028ui_story then
					local var_86_8 = Mathf.Lerp(0, 0.5, var_86_7)

					arg_83_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1028ui_story.fillRatio = var_86_8
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect1028ui_story then
				local var_86_9 = 0.5

				arg_83_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1028ui_story.fillRatio = var_86_9
			end

			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_86_11 = 0
			local var_86_12 = 0.525

			if var_86_11 < arg_83_1.time_ and arg_83_1.time_ <= var_86_11 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_13 = arg_83_1:FormatText(StoryNameCfg[28].name)

				arg_83_1.leftNameTxt_.text = var_86_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_14 = arg_83_1:GetWordFromCfg(116141020)
				local var_86_15 = arg_83_1:FormatText(var_86_14.content)

				arg_83_1.text_.text = var_86_15

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_16 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141020", "story_v_out_116141.awb") ~= 0 then
					local var_86_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141020", "story_v_out_116141.awb") / 1000

					if var_86_19 + var_86_11 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_19 + var_86_11
					end

					if var_86_14.prefab_name ~= "" and arg_83_1.actors_[var_86_14.prefab_name] ~= nil then
						local var_86_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_14.prefab_name].transform, "story_v_out_116141", "116141020", "story_v_out_116141.awb")

						arg_83_1:RecordAudio("116141020", var_86_20)
						arg_83_1:RecordAudio("116141020", var_86_20)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_116141", "116141020", "story_v_out_116141.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_116141", "116141020", "story_v_out_116141.awb")
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
	Play116141021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 116141021
		arg_87_1.duration_ = 4.23

		local var_87_0 = {
			zh = 4.233,
			ja = 2.9
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
				arg_87_0:Play116141022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1028ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1028ui_story == nil then
				arg_87_1.var_.characterEffect1028ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.2

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1028ui_story then
					arg_87_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1028ui_story then
				arg_87_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_90_4 = arg_87_1.actors_["1059ui_story"]
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story == nil then
				arg_87_1.var_.characterEffect1059ui_story = var_90_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_6 = 0.2

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6

				if arg_87_1.var_.characterEffect1059ui_story then
					local var_90_8 = Mathf.Lerp(0, 0.5, var_90_7)

					arg_87_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1059ui_story.fillRatio = var_90_8
				end
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 and arg_87_1.var_.characterEffect1059ui_story then
				local var_90_9 = 0.5

				arg_87_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1059ui_story.fillRatio = var_90_9
			end

			local var_90_10 = 0

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_90_11 = 0

			if var_90_11 < arg_87_1.time_ and arg_87_1.time_ <= var_90_11 + arg_90_0 then
				arg_87_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_90_12 = 0
			local var_90_13 = 0.4

			if var_90_12 < arg_87_1.time_ and arg_87_1.time_ <= var_90_12 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_14 = arg_87_1:FormatText(StoryNameCfg[327].name)

				arg_87_1.leftNameTxt_.text = var_90_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_15 = arg_87_1:GetWordFromCfg(116141021)
				local var_90_16 = arg_87_1:FormatText(var_90_15.content)

				arg_87_1.text_.text = var_90_16

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_17 = 16
				local var_90_18 = utf8.len(var_90_16)
				local var_90_19 = var_90_17 <= 0 and var_90_13 or var_90_13 * (var_90_18 / var_90_17)

				if var_90_19 > 0 and var_90_13 < var_90_19 then
					arg_87_1.talkMaxDuration = var_90_19

					if var_90_19 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_12
					end
				end

				arg_87_1.text_.text = var_90_16
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141021", "story_v_out_116141.awb") ~= 0 then
					local var_90_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141021", "story_v_out_116141.awb") / 1000

					if var_90_20 + var_90_12 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_20 + var_90_12
					end

					if var_90_15.prefab_name ~= "" and arg_87_1.actors_[var_90_15.prefab_name] ~= nil then
						local var_90_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_15.prefab_name].transform, "story_v_out_116141", "116141021", "story_v_out_116141.awb")

						arg_87_1:RecordAudio("116141021", var_90_21)
						arg_87_1:RecordAudio("116141021", var_90_21)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_116141", "116141021", "story_v_out_116141.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_116141", "116141021", "story_v_out_116141.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_22 = math.max(var_90_13, arg_87_1.talkMaxDuration)

			if var_90_12 <= arg_87_1.time_ and arg_87_1.time_ < var_90_12 + var_90_22 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_12) / var_90_22

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_12 + var_90_22 and arg_87_1.time_ < var_90_12 + var_90_22 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play116141022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 116141022
		arg_91_1.duration_ = 3.73

		local var_91_0 = {
			zh = 2.333,
			ja = 3.733
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
				arg_91_0:Play116141023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1059ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1059ui_story == nil then
				arg_91_1.var_.characterEffect1059ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1059ui_story then
					arg_91_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1059ui_story then
				arg_91_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_94_4 = arg_91_1.actors_["1028ui_story"]
			local var_94_5 = 0

			if var_94_5 < arg_91_1.time_ and arg_91_1.time_ <= var_94_5 + arg_94_0 and arg_91_1.var_.characterEffect1028ui_story == nil then
				arg_91_1.var_.characterEffect1028ui_story = var_94_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_6 = 0.2

			if var_94_5 <= arg_91_1.time_ and arg_91_1.time_ < var_94_5 + var_94_6 then
				local var_94_7 = (arg_91_1.time_ - var_94_5) / var_94_6

				if arg_91_1.var_.characterEffect1028ui_story then
					local var_94_8 = Mathf.Lerp(0, 0.5, var_94_7)

					arg_91_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1028ui_story.fillRatio = var_94_8
				end
			end

			if arg_91_1.time_ >= var_94_5 + var_94_6 and arg_91_1.time_ < var_94_5 + var_94_6 + arg_94_0 and arg_91_1.var_.characterEffect1028ui_story then
				local var_94_9 = 0.5

				arg_91_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1028ui_story.fillRatio = var_94_9
			end

			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 then
				arg_91_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action7_1")
			end

			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 then
				arg_91_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_94_12 = 0
			local var_94_13 = 0.175

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_14 = arg_91_1:FormatText(StoryNameCfg[28].name)

				arg_91_1.leftNameTxt_.text = var_94_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_15 = arg_91_1:GetWordFromCfg(116141022)
				local var_94_16 = arg_91_1:FormatText(var_94_15.content)

				arg_91_1.text_.text = var_94_16

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_17 = 7
				local var_94_18 = utf8.len(var_94_16)
				local var_94_19 = var_94_17 <= 0 and var_94_13 or var_94_13 * (var_94_18 / var_94_17)

				if var_94_19 > 0 and var_94_13 < var_94_19 then
					arg_91_1.talkMaxDuration = var_94_19

					if var_94_19 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_12
					end
				end

				arg_91_1.text_.text = var_94_16
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141022", "story_v_out_116141.awb") ~= 0 then
					local var_94_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141022", "story_v_out_116141.awb") / 1000

					if var_94_20 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_12
					end

					if var_94_15.prefab_name ~= "" and arg_91_1.actors_[var_94_15.prefab_name] ~= nil then
						local var_94_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_15.prefab_name].transform, "story_v_out_116141", "116141022", "story_v_out_116141.awb")

						arg_91_1:RecordAudio("116141022", var_94_21)
						arg_91_1:RecordAudio("116141022", var_94_21)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_116141", "116141022", "story_v_out_116141.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_116141", "116141022", "story_v_out_116141.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_13, arg_91_1.talkMaxDuration)

			if var_94_12 <= arg_91_1.time_ and arg_91_1.time_ < var_94_12 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_12) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_12 + var_94_22 and arg_91_1.time_ < var_94_12 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play116141023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 116141023
		arg_95_1.duration_ = 5.97

		local var_95_0 = {
			zh = 5.966,
			ja = 5.7
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
				arg_95_0:Play116141024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1028ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1028ui_story == nil then
				arg_95_1.var_.characterEffect1028ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.2

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1028ui_story then
					arg_95_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1028ui_story then
				arg_95_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_98_4 = arg_95_1.actors_["1059ui_story"]
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 and arg_95_1.var_.characterEffect1059ui_story == nil then
				arg_95_1.var_.characterEffect1059ui_story = var_98_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_6 = 0.2

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6

				if arg_95_1.var_.characterEffect1059ui_story then
					local var_98_8 = Mathf.Lerp(0, 0.5, var_98_7)

					arg_95_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1059ui_story.fillRatio = var_98_8
				end
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 and arg_95_1.var_.characterEffect1059ui_story then
				local var_98_9 = 0.5

				arg_95_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1059ui_story.fillRatio = var_98_9
			end

			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 then
				arg_95_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action465")
			end

			local var_98_11 = 0

			if var_98_11 < arg_95_1.time_ and arg_95_1.time_ <= var_98_11 + arg_98_0 then
				arg_95_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_98_12 = 0
			local var_98_13 = 0.2

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_14 = arg_95_1:FormatText(StoryNameCfg[327].name)

				arg_95_1.leftNameTxt_.text = var_98_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_15 = arg_95_1:GetWordFromCfg(116141023)
				local var_98_16 = arg_95_1:FormatText(var_98_15.content)

				arg_95_1.text_.text = var_98_16

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_17 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141023", "story_v_out_116141.awb") ~= 0 then
					local var_98_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141023", "story_v_out_116141.awb") / 1000

					if var_98_20 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_20 + var_98_12
					end

					if var_98_15.prefab_name ~= "" and arg_95_1.actors_[var_98_15.prefab_name] ~= nil then
						local var_98_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_15.prefab_name].transform, "story_v_out_116141", "116141023", "story_v_out_116141.awb")

						arg_95_1:RecordAudio("116141023", var_98_21)
						arg_95_1:RecordAudio("116141023", var_98_21)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_116141", "116141023", "story_v_out_116141.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_116141", "116141023", "story_v_out_116141.awb")
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
	Play116141024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 116141024
		arg_99_1.duration_ = 3.73

		local var_99_0 = {
			zh = 3.733,
			ja = 3.6
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
				arg_99_0:Play116141025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1059ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1059ui_story == nil then
				arg_99_1.var_.characterEffect1059ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1059ui_story then
					arg_99_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1059ui_story then
				arg_99_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["1028ui_story"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect1028ui_story == nil then
				arg_99_1.var_.characterEffect1028ui_story = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.2

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect1028ui_story then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1028ui_story.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect1028ui_story then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1028ui_story.fillRatio = var_102_9
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action7_2")
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_102_12 = 0
			local var_102_13 = 0.35

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[28].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(116141024)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141024", "story_v_out_116141.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141024", "story_v_out_116141.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_116141", "116141024", "story_v_out_116141.awb")

						arg_99_1:RecordAudio("116141024", var_102_21)
						arg_99_1:RecordAudio("116141024", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_116141", "116141024", "story_v_out_116141.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_116141", "116141024", "story_v_out_116141.awb")
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
	Play116141025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 116141025
		arg_103_1.duration_ = 8.73

		local var_103_0 = {
			zh = 5.3,
			ja = 8.733
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
				arg_103_0:Play116141026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1028ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1028ui_story == nil then
				arg_103_1.var_.characterEffect1028ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1028ui_story then
					arg_103_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1028ui_story then
				arg_103_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_106_4 = arg_103_1.actors_["1059ui_story"]
			local var_106_5 = 0

			if var_106_5 < arg_103_1.time_ and arg_103_1.time_ <= var_106_5 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story == nil then
				arg_103_1.var_.characterEffect1059ui_story = var_106_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_6 = 0.2

			if var_106_5 <= arg_103_1.time_ and arg_103_1.time_ < var_106_5 + var_106_6 then
				local var_106_7 = (arg_103_1.time_ - var_106_5) / var_106_6

				if arg_103_1.var_.characterEffect1059ui_story then
					local var_106_8 = Mathf.Lerp(0, 0.5, var_106_7)

					arg_103_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1059ui_story.fillRatio = var_106_8
				end
			end

			if arg_103_1.time_ >= var_106_5 + var_106_6 and arg_103_1.time_ < var_106_5 + var_106_6 + arg_106_0 and arg_103_1.var_.characterEffect1059ui_story then
				local var_106_9 = 0.5

				arg_103_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1059ui_story.fillRatio = var_106_9
			end

			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 then
				arg_103_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_2")
			end

			local var_106_11 = 0

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_106_12 = 0
			local var_106_13 = 0.575

			if var_106_12 < arg_103_1.time_ and arg_103_1.time_ <= var_106_12 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_14 = arg_103_1:FormatText(StoryNameCfg[327].name)

				arg_103_1.leftNameTxt_.text = var_106_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_15 = arg_103_1:GetWordFromCfg(116141025)
				local var_106_16 = arg_103_1:FormatText(var_106_15.content)

				arg_103_1.text_.text = var_106_16

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_17 = 23
				local var_106_18 = utf8.len(var_106_16)
				local var_106_19 = var_106_17 <= 0 and var_106_13 or var_106_13 * (var_106_18 / var_106_17)

				if var_106_19 > 0 and var_106_13 < var_106_19 then
					arg_103_1.talkMaxDuration = var_106_19

					if var_106_19 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_12
					end
				end

				arg_103_1.text_.text = var_106_16
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141025", "story_v_out_116141.awb") ~= 0 then
					local var_106_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141025", "story_v_out_116141.awb") / 1000

					if var_106_20 + var_106_12 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_20 + var_106_12
					end

					if var_106_15.prefab_name ~= "" and arg_103_1.actors_[var_106_15.prefab_name] ~= nil then
						local var_106_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_15.prefab_name].transform, "story_v_out_116141", "116141025", "story_v_out_116141.awb")

						arg_103_1:RecordAudio("116141025", var_106_21)
						arg_103_1:RecordAudio("116141025", var_106_21)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_116141", "116141025", "story_v_out_116141.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_116141", "116141025", "story_v_out_116141.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_22 = math.max(var_106_13, arg_103_1.talkMaxDuration)

			if var_106_12 <= arg_103_1.time_ and arg_103_1.time_ < var_106_12 + var_106_22 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_12) / var_106_22

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_12 + var_106_22 and arg_103_1.time_ < var_106_12 + var_106_22 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play116141026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 116141026
		arg_107_1.duration_ = 2.87

		local var_107_0 = {
			zh = 1.999999999999,
			ja = 2.866
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
				arg_107_0:Play116141027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1059ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story == nil then
				arg_107_1.var_.characterEffect1059ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.2

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1059ui_story then
					arg_107_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1059ui_story then
				arg_107_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_110_4 = arg_107_1.actors_["1028ui_story"]
			local var_110_5 = 0

			if var_110_5 < arg_107_1.time_ and arg_107_1.time_ <= var_110_5 + arg_110_0 and arg_107_1.var_.characterEffect1028ui_story == nil then
				arg_107_1.var_.characterEffect1028ui_story = var_110_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_6 = 0.2

			if var_110_5 <= arg_107_1.time_ and arg_107_1.time_ < var_110_5 + var_110_6 then
				local var_110_7 = (arg_107_1.time_ - var_110_5) / var_110_6

				if arg_107_1.var_.characterEffect1028ui_story then
					local var_110_8 = Mathf.Lerp(0, 0.5, var_110_7)

					arg_107_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1028ui_story.fillRatio = var_110_8
				end
			end

			if arg_107_1.time_ >= var_110_5 + var_110_6 and arg_107_1.time_ < var_110_5 + var_110_6 + arg_110_0 and arg_107_1.var_.characterEffect1028ui_story then
				local var_110_9 = 0.5

				arg_107_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1028ui_story.fillRatio = var_110_9
			end

			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_110_11 = 0
			local var_110_12 = 0.15

			if var_110_11 < arg_107_1.time_ and arg_107_1.time_ <= var_110_11 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_13 = arg_107_1:FormatText(StoryNameCfg[28].name)

				arg_107_1.leftNameTxt_.text = var_110_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_14 = arg_107_1:GetWordFromCfg(116141026)
				local var_110_15 = arg_107_1:FormatText(var_110_14.content)

				arg_107_1.text_.text = var_110_15

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_16 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141026", "story_v_out_116141.awb") ~= 0 then
					local var_110_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141026", "story_v_out_116141.awb") / 1000

					if var_110_19 + var_110_11 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_19 + var_110_11
					end

					if var_110_14.prefab_name ~= "" and arg_107_1.actors_[var_110_14.prefab_name] ~= nil then
						local var_110_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_14.prefab_name].transform, "story_v_out_116141", "116141026", "story_v_out_116141.awb")

						arg_107_1:RecordAudio("116141026", var_110_20)
						arg_107_1:RecordAudio("116141026", var_110_20)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_116141", "116141026", "story_v_out_116141.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_116141", "116141026", "story_v_out_116141.awb")
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
	Play116141027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 116141027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play116141028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1028ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1028ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(0, 100, 0)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1028ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, 100, 0)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = arg_111_1.actors_["1059ui_story"].transform
			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.var_.moveOldPos1059ui_story = var_114_9.localPosition
			end

			local var_114_11 = 0.001

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_11 then
				local var_114_12 = (arg_111_1.time_ - var_114_10) / var_114_11
				local var_114_13 = Vector3.New(0, 100, 0)

				var_114_9.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1059ui_story, var_114_13, var_114_12)

				local var_114_14 = manager.ui.mainCamera.transform.position - var_114_9.position

				var_114_9.forward = Vector3.New(var_114_14.x, var_114_14.y, var_114_14.z)

				local var_114_15 = var_114_9.localEulerAngles

				var_114_15.z = 0
				var_114_15.x = 0
				var_114_9.localEulerAngles = var_114_15
			end

			if arg_111_1.time_ >= var_114_10 + var_114_11 and arg_111_1.time_ < var_114_10 + var_114_11 + arg_114_0 then
				var_114_9.localPosition = Vector3.New(0, 100, 0)

				local var_114_16 = manager.ui.mainCamera.transform.position - var_114_9.position

				var_114_9.forward = Vector3.New(var_114_16.x, var_114_16.y, var_114_16.z)

				local var_114_17 = var_114_9.localEulerAngles

				var_114_17.z = 0
				var_114_17.x = 0
				var_114_9.localEulerAngles = var_114_17
			end

			local var_114_18 = 0
			local var_114_19 = 1.3

			if var_114_18 < arg_111_1.time_ and arg_111_1.time_ <= var_114_18 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_20 = arg_111_1:GetWordFromCfg(116141027)
				local var_114_21 = arg_111_1:FormatText(var_114_20.content)

				arg_111_1.text_.text = var_114_21

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_22 = 52
				local var_114_23 = utf8.len(var_114_21)
				local var_114_24 = var_114_22 <= 0 and var_114_19 or var_114_19 * (var_114_23 / var_114_22)

				if var_114_24 > 0 and var_114_19 < var_114_24 then
					arg_111_1.talkMaxDuration = var_114_24

					if var_114_24 + var_114_18 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_24 + var_114_18
					end
				end

				arg_111_1.text_.text = var_114_21
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_25 = math.max(var_114_19, arg_111_1.talkMaxDuration)

			if var_114_18 <= arg_111_1.time_ and arg_111_1.time_ < var_114_18 + var_114_25 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_18) / var_114_25

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_18 + var_114_25 and arg_111_1.time_ < var_114_18 + var_114_25 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play116141028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 116141028
		arg_115_1.duration_ = 8.63

		local var_115_0 = {
			zh = 6.766,
			ja = 8.633
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
				arg_115_0:Play116141029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1028ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1028ui_story == nil then
				arg_115_1.var_.characterEffect1028ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1028ui_story then
					arg_115_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1028ui_story then
				arg_115_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["1059ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect1059ui_story == nil then
				arg_115_1.var_.characterEffect1059ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.2

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect1059ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1059ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect1059ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1059ui_story.fillRatio = var_118_9
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_118_12 = arg_115_1.actors_["1028ui_story"].transform
			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1.var_.moveOldPos1028ui_story = var_118_12.localPosition
			end

			local var_118_14 = 0.001

			if var_118_13 <= arg_115_1.time_ and arg_115_1.time_ < var_118_13 + var_118_14 then
				local var_118_15 = (arg_115_1.time_ - var_118_13) / var_118_14
				local var_118_16 = Vector3.New(0, -0.9, -5.9)

				var_118_12.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1028ui_story, var_118_16, var_118_15)

				local var_118_17 = manager.ui.mainCamera.transform.position - var_118_12.position

				var_118_12.forward = Vector3.New(var_118_17.x, var_118_17.y, var_118_17.z)

				local var_118_18 = var_118_12.localEulerAngles

				var_118_18.z = 0
				var_118_18.x = 0
				var_118_12.localEulerAngles = var_118_18
			end

			if arg_115_1.time_ >= var_118_13 + var_118_14 and arg_115_1.time_ < var_118_13 + var_118_14 + arg_118_0 then
				var_118_12.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_118_19 = manager.ui.mainCamera.transform.position - var_118_12.position

				var_118_12.forward = Vector3.New(var_118_19.x, var_118_19.y, var_118_19.z)

				local var_118_20 = var_118_12.localEulerAngles

				var_118_20.z = 0
				var_118_20.x = 0
				var_118_12.localEulerAngles = var_118_20
			end

			local var_118_21 = 0
			local var_118_22 = 0.7

			if var_118_21 < arg_115_1.time_ and arg_115_1.time_ <= var_118_21 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_23 = arg_115_1:FormatText(StoryNameCfg[327].name)

				arg_115_1.leftNameTxt_.text = var_118_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_24 = arg_115_1:GetWordFromCfg(116141028)
				local var_118_25 = arg_115_1:FormatText(var_118_24.content)

				arg_115_1.text_.text = var_118_25

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_26 = 28
				local var_118_27 = utf8.len(var_118_25)
				local var_118_28 = var_118_26 <= 0 and var_118_22 or var_118_22 * (var_118_27 / var_118_26)

				if var_118_28 > 0 and var_118_22 < var_118_28 then
					arg_115_1.talkMaxDuration = var_118_28

					if var_118_28 + var_118_21 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_28 + var_118_21
					end
				end

				arg_115_1.text_.text = var_118_25
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141028", "story_v_out_116141.awb") ~= 0 then
					local var_118_29 = manager.audio:GetVoiceLength("story_v_out_116141", "116141028", "story_v_out_116141.awb") / 1000

					if var_118_29 + var_118_21 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_29 + var_118_21
					end

					if var_118_24.prefab_name ~= "" and arg_115_1.actors_[var_118_24.prefab_name] ~= nil then
						local var_118_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_24.prefab_name].transform, "story_v_out_116141", "116141028", "story_v_out_116141.awb")

						arg_115_1:RecordAudio("116141028", var_118_30)
						arg_115_1:RecordAudio("116141028", var_118_30)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_116141", "116141028", "story_v_out_116141.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_116141", "116141028", "story_v_out_116141.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_31 = math.max(var_118_22, arg_115_1.talkMaxDuration)

			if var_118_21 <= arg_115_1.time_ and arg_115_1.time_ < var_118_21 + var_118_31 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_21) / var_118_31

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_21 + var_118_31 and arg_115_1.time_ < var_118_21 + var_118_31 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play116141029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 116141029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play116141030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1028ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1028ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1028ui_story, var_122_4, var_122_3)

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

			local var_122_9 = arg_119_1.actors_["1059ui_story"].transform
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1.var_.moveOldPos1059ui_story = var_122_9.localPosition
			end

			local var_122_11 = 0.001

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11
				local var_122_13 = Vector3.New(0, 100, 0)

				var_122_9.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1059ui_story, var_122_13, var_122_12)

				local var_122_14 = manager.ui.mainCamera.transform.position - var_122_9.position

				var_122_9.forward = Vector3.New(var_122_14.x, var_122_14.y, var_122_14.z)

				local var_122_15 = var_122_9.localEulerAngles

				var_122_15.z = 0
				var_122_15.x = 0
				var_122_9.localEulerAngles = var_122_15
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 then
				var_122_9.localPosition = Vector3.New(0, 100, 0)

				local var_122_16 = manager.ui.mainCamera.transform.position - var_122_9.position

				var_122_9.forward = Vector3.New(var_122_16.x, var_122_16.y, var_122_16.z)

				local var_122_17 = var_122_9.localEulerAngles

				var_122_17.z = 0
				var_122_17.x = 0
				var_122_9.localEulerAngles = var_122_17
			end

			local var_122_18 = 0
			local var_122_19 = 0.75

			if var_122_18 < arg_119_1.time_ and arg_119_1.time_ <= var_122_18 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_20 = arg_119_1:GetWordFromCfg(116141029)
				local var_122_21 = arg_119_1:FormatText(var_122_20.content)

				arg_119_1.text_.text = var_122_21

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_22 = 30
				local var_122_23 = utf8.len(var_122_21)
				local var_122_24 = var_122_22 <= 0 and var_122_19 or var_122_19 * (var_122_23 / var_122_22)

				if var_122_24 > 0 and var_122_19 < var_122_24 then
					arg_119_1.talkMaxDuration = var_122_24

					if var_122_24 + var_122_18 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_24 + var_122_18
					end
				end

				arg_119_1.text_.text = var_122_21
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_19, arg_119_1.talkMaxDuration)

			if var_122_18 <= arg_119_1.time_ and arg_119_1.time_ < var_122_18 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_18) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_18 + var_122_25 and arg_119_1.time_ < var_122_18 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play116141030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 116141030
		arg_123_1.duration_ = 5.3

		local var_123_0 = {
			zh = 2.3,
			ja = 5.3
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
				arg_123_0:Play116141031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1059ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story == nil then
				arg_123_1.var_.characterEffect1059ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1059ui_story then
					arg_123_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1059ui_story then
				arg_123_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_126_4 = 0

			if var_126_4 < arg_123_1.time_ and arg_123_1.time_ <= var_126_4 + arg_126_0 then
				arg_123_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_1")
			end

			local var_126_5 = 0

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_126_6 = arg_123_1.actors_["1059ui_story"].transform
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 then
				arg_123_1.var_.moveOldPos1059ui_story = var_126_6.localPosition
			end

			local var_126_8 = 0.001

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8
				local var_126_10 = Vector3.New(0, -1.05, -6)

				var_126_6.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1059ui_story, var_126_10, var_126_9)

				local var_126_11 = manager.ui.mainCamera.transform.position - var_126_6.position

				var_126_6.forward = Vector3.New(var_126_11.x, var_126_11.y, var_126_11.z)

				local var_126_12 = var_126_6.localEulerAngles

				var_126_12.z = 0
				var_126_12.x = 0
				var_126_6.localEulerAngles = var_126_12
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 then
				var_126_6.localPosition = Vector3.New(0, -1.05, -6)

				local var_126_13 = manager.ui.mainCamera.transform.position - var_126_6.position

				var_126_6.forward = Vector3.New(var_126_13.x, var_126_13.y, var_126_13.z)

				local var_126_14 = var_126_6.localEulerAngles

				var_126_14.z = 0
				var_126_14.x = 0
				var_126_6.localEulerAngles = var_126_14
			end

			local var_126_15 = 0
			local var_126_16 = 0.275

			if var_126_15 < arg_123_1.time_ and arg_123_1.time_ <= var_126_15 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_17 = arg_123_1:FormatText(StoryNameCfg[28].name)

				arg_123_1.leftNameTxt_.text = var_126_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_18 = arg_123_1:GetWordFromCfg(116141030)
				local var_126_19 = arg_123_1:FormatText(var_126_18.content)

				arg_123_1.text_.text = var_126_19

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_20 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141030", "story_v_out_116141.awb") ~= 0 then
					local var_126_23 = manager.audio:GetVoiceLength("story_v_out_116141", "116141030", "story_v_out_116141.awb") / 1000

					if var_126_23 + var_126_15 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_23 + var_126_15
					end

					if var_126_18.prefab_name ~= "" and arg_123_1.actors_[var_126_18.prefab_name] ~= nil then
						local var_126_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_18.prefab_name].transform, "story_v_out_116141", "116141030", "story_v_out_116141.awb")

						arg_123_1:RecordAudio("116141030", var_126_24)
						arg_123_1:RecordAudio("116141030", var_126_24)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_116141", "116141030", "story_v_out_116141.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_116141", "116141030", "story_v_out_116141.awb")
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
	Play116141031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 116141031
		arg_127_1.duration_ = 8.97

		local var_127_0 = {
			zh = 6.133,
			ja = 8.966
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
				arg_127_0:Play116141032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_130_1 = 0
			local var_130_2 = 0.775

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_3 = arg_127_1:FormatText(StoryNameCfg[28].name)

				arg_127_1.leftNameTxt_.text = var_130_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_4 = arg_127_1:GetWordFromCfg(116141031)
				local var_130_5 = arg_127_1:FormatText(var_130_4.content)

				arg_127_1.text_.text = var_130_5

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_6 = 31
				local var_130_7 = utf8.len(var_130_5)
				local var_130_8 = var_130_6 <= 0 and var_130_2 or var_130_2 * (var_130_7 / var_130_6)

				if var_130_8 > 0 and var_130_2 < var_130_8 then
					arg_127_1.talkMaxDuration = var_130_8

					if var_130_8 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_1
					end
				end

				arg_127_1.text_.text = var_130_5
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141031", "story_v_out_116141.awb") ~= 0 then
					local var_130_9 = manager.audio:GetVoiceLength("story_v_out_116141", "116141031", "story_v_out_116141.awb") / 1000

					if var_130_9 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_9 + var_130_1
					end

					if var_130_4.prefab_name ~= "" and arg_127_1.actors_[var_130_4.prefab_name] ~= nil then
						local var_130_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_4.prefab_name].transform, "story_v_out_116141", "116141031", "story_v_out_116141.awb")

						arg_127_1:RecordAudio("116141031", var_130_10)
						arg_127_1:RecordAudio("116141031", var_130_10)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_116141", "116141031", "story_v_out_116141.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_116141", "116141031", "story_v_out_116141.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_11 = math.max(var_130_2, arg_127_1.talkMaxDuration)

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_11 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_1) / var_130_11

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_1 + var_130_11 and arg_127_1.time_ < var_130_1 + var_130_11 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play116141032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 116141032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play116141033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1059ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story == nil then
				arg_131_1.var_.characterEffect1059ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.2

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1059ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1059ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1059ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 1

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				local var_134_8 = "play"
				local var_134_9 = "effect"

				arg_131_1:AudioAction(var_134_8, var_134_9, "se_story_16", "se_story_16_beat02", "")
			end

			local var_134_10 = 0

			if var_134_10 < arg_131_1.time_ and arg_131_1.time_ <= var_134_10 + arg_134_0 then
				arg_131_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_134_11 = 0
			local var_134_12 = 0.3

			if var_134_11 < arg_131_1.time_ and arg_131_1.time_ <= var_134_11 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_13 = arg_131_1:GetWordFromCfg(116141032)
				local var_134_14 = arg_131_1:FormatText(var_134_13.content)

				arg_131_1.text_.text = var_134_14

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_15 = 12
				local var_134_16 = utf8.len(var_134_14)
				local var_134_17 = var_134_15 <= 0 and var_134_12 or var_134_12 * (var_134_16 / var_134_15)

				if var_134_17 > 0 and var_134_12 < var_134_17 then
					arg_131_1.talkMaxDuration = var_134_17

					if var_134_17 + var_134_11 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_17 + var_134_11
					end
				end

				arg_131_1.text_.text = var_134_14
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_18 = math.max(var_134_12, arg_131_1.talkMaxDuration)

			if var_134_11 <= arg_131_1.time_ and arg_131_1.time_ < var_134_11 + var_134_18 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_11) / var_134_18

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_11 + var_134_18 and arg_131_1.time_ < var_134_11 + var_134_18 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play116141033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 116141033
		arg_135_1.duration_ = 7.1

		local var_135_0 = {
			zh = 4.4,
			ja = 7.1
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
				arg_135_0:Play116141034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1059ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1059ui_story == nil then
				arg_135_1.var_.characterEffect1059ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.2

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1059ui_story then
					arg_135_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1059ui_story then
				arg_135_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_138_4 = 0

			if var_138_4 < arg_135_1.time_ and arg_135_1.time_ <= var_138_4 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_2")
			end

			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_138_6 = 0
			local var_138_7 = 0.35

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_8 = arg_135_1:FormatText(StoryNameCfg[28].name)

				arg_135_1.leftNameTxt_.text = var_138_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_9 = arg_135_1:GetWordFromCfg(116141033)
				local var_138_10 = arg_135_1:FormatText(var_138_9.content)

				arg_135_1.text_.text = var_138_10

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_11 = 14
				local var_138_12 = utf8.len(var_138_10)
				local var_138_13 = var_138_11 <= 0 and var_138_7 or var_138_7 * (var_138_12 / var_138_11)

				if var_138_13 > 0 and var_138_7 < var_138_13 then
					arg_135_1.talkMaxDuration = var_138_13

					if var_138_13 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_13 + var_138_6
					end
				end

				arg_135_1.text_.text = var_138_10
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141033", "story_v_out_116141.awb") ~= 0 then
					local var_138_14 = manager.audio:GetVoiceLength("story_v_out_116141", "116141033", "story_v_out_116141.awb") / 1000

					if var_138_14 + var_138_6 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_14 + var_138_6
					end

					if var_138_9.prefab_name ~= "" and arg_135_1.actors_[var_138_9.prefab_name] ~= nil then
						local var_138_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_9.prefab_name].transform, "story_v_out_116141", "116141033", "story_v_out_116141.awb")

						arg_135_1:RecordAudio("116141033", var_138_15)
						arg_135_1:RecordAudio("116141033", var_138_15)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_116141", "116141033", "story_v_out_116141.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_116141", "116141033", "story_v_out_116141.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_16 = math.max(var_138_7, arg_135_1.talkMaxDuration)

			if var_138_6 <= arg_135_1.time_ and arg_135_1.time_ < var_138_6 + var_138_16 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_6) / var_138_16

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_6 + var_138_16 and arg_135_1.time_ < var_138_6 + var_138_16 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play116141034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 116141034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play116141035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1059ui_story"]
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 and arg_139_1.var_.characterEffect1059ui_story == nil then
				arg_139_1.var_.characterEffect1059ui_story = var_142_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_2 = 0.2

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2

				if arg_139_1.var_.characterEffect1059ui_story then
					local var_142_4 = Mathf.Lerp(0, 0.5, var_142_3)

					arg_139_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1059ui_story.fillRatio = var_142_4
				end
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1059ui_story then
				local var_142_5 = 0.5

				arg_139_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1059ui_story.fillRatio = var_142_5
			end

			local var_142_6 = 0
			local var_142_7 = 0.375

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_8 = arg_139_1:GetWordFromCfg(116141034)
				local var_142_9 = arg_139_1:FormatText(var_142_8.content)

				arg_139_1.text_.text = var_142_9

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_10 = 15
				local var_142_11 = utf8.len(var_142_9)
				local var_142_12 = var_142_10 <= 0 and var_142_7 or var_142_7 * (var_142_11 / var_142_10)

				if var_142_12 > 0 and var_142_7 < var_142_12 then
					arg_139_1.talkMaxDuration = var_142_12

					if var_142_12 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_12 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_9
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_13 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_13 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_13

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_13 and arg_139_1.time_ < var_142_6 + var_142_13 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play116141035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 116141035
		arg_143_1.duration_ = 12.83

		local var_143_0 = {
			zh = 12.833,
			ja = 9.633
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
				arg_143_0:Play116141036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1059ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1059ui_story == nil then
				arg_143_1.var_.characterEffect1059ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.2

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1059ui_story then
					arg_143_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1059ui_story then
				arg_143_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_146_4 = 0

			if var_146_4 < arg_143_1.time_ and arg_143_1.time_ <= var_146_4 + arg_146_0 then
				arg_143_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_146_5 = 0

			if var_146_5 < arg_143_1.time_ and arg_143_1.time_ <= var_146_5 + arg_146_0 then
				arg_143_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_146_6 = 0
			local var_146_7 = 1.175

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_8 = arg_143_1:FormatText(StoryNameCfg[28].name)

				arg_143_1.leftNameTxt_.text = var_146_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_9 = arg_143_1:GetWordFromCfg(116141035)
				local var_146_10 = arg_143_1:FormatText(var_146_9.content)

				arg_143_1.text_.text = var_146_10

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_11 = 47
				local var_146_12 = utf8.len(var_146_10)
				local var_146_13 = var_146_11 <= 0 and var_146_7 or var_146_7 * (var_146_12 / var_146_11)

				if var_146_13 > 0 and var_146_7 < var_146_13 then
					arg_143_1.talkMaxDuration = var_146_13

					if var_146_13 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_13 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_10
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141035", "story_v_out_116141.awb") ~= 0 then
					local var_146_14 = manager.audio:GetVoiceLength("story_v_out_116141", "116141035", "story_v_out_116141.awb") / 1000

					if var_146_14 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_14 + var_146_6
					end

					if var_146_9.prefab_name ~= "" and arg_143_1.actors_[var_146_9.prefab_name] ~= nil then
						local var_146_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_9.prefab_name].transform, "story_v_out_116141", "116141035", "story_v_out_116141.awb")

						arg_143_1:RecordAudio("116141035", var_146_15)
						arg_143_1:RecordAudio("116141035", var_146_15)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_116141", "116141035", "story_v_out_116141.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_116141", "116141035", "story_v_out_116141.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_16 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_16 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_16

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_16 and arg_143_1.time_ < var_146_6 + var_146_16 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play116141036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 116141036
		arg_147_1.duration_ = 8.73

		local var_147_0 = {
			zh = 3.8,
			ja = 8.733
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
				arg_147_0:Play116141037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1059ui_story"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos1059ui_story = var_150_0.localPosition
			end

			local var_150_2 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2
				local var_150_4 = Vector3.New(0, 100, 0)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos1059ui_story, var_150_4, var_150_3)

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

			local var_150_9 = "10025ui_story"

			if arg_147_1.actors_[var_150_9] == nil then
				local var_150_10 = Object.Instantiate(Asset.Load("Char/" .. var_150_9), arg_147_1.stage_.transform)

				var_150_10.name = var_150_9
				var_150_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_147_1.actors_[var_150_9] = var_150_10

				local var_150_11 = var_150_10:GetComponentInChildren(typeof(CharacterEffect))

				var_150_11.enabled = true

				local var_150_12 = GameObjectTools.GetOrAddComponent(var_150_10, typeof(DynamicBoneHelper))

				if var_150_12 then
					var_150_12:EnableDynamicBone(false)
				end

				arg_147_1:ShowWeapon(var_150_11.transform, false)

				arg_147_1.var_[var_150_9 .. "Animator"] = var_150_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_147_1.var_[var_150_9 .. "Animator"].applyRootMotion = true
				arg_147_1.var_[var_150_9 .. "LipSync"] = var_150_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_150_13 = arg_147_1.actors_["10025ui_story"].transform
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 then
				arg_147_1.var_.moveOldPos10025ui_story = var_150_13.localPosition
			end

			local var_150_15 = 0.001

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15
				local var_150_17 = Vector3.New(0, -1.1, -5.9)

				var_150_13.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10025ui_story, var_150_17, var_150_16)

				local var_150_18 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_18.x, var_150_18.y, var_150_18.z)

				local var_150_19 = var_150_13.localEulerAngles

				var_150_19.z = 0
				var_150_19.x = 0
				var_150_13.localEulerAngles = var_150_19
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 then
				var_150_13.localPosition = Vector3.New(0, -1.1, -5.9)

				local var_150_20 = manager.ui.mainCamera.transform.position - var_150_13.position

				var_150_13.forward = Vector3.New(var_150_20.x, var_150_20.y, var_150_20.z)

				local var_150_21 = var_150_13.localEulerAngles

				var_150_21.z = 0
				var_150_21.x = 0
				var_150_13.localEulerAngles = var_150_21
			end

			local var_150_22 = arg_147_1.actors_["1059ui_story"]
			local var_150_23 = 0

			if var_150_23 < arg_147_1.time_ and arg_147_1.time_ <= var_150_23 + arg_150_0 and arg_147_1.var_.characterEffect1059ui_story == nil then
				arg_147_1.var_.characterEffect1059ui_story = var_150_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_24 = 0.2

			if var_150_23 <= arg_147_1.time_ and arg_147_1.time_ < var_150_23 + var_150_24 then
				local var_150_25 = (arg_147_1.time_ - var_150_23) / var_150_24

				if arg_147_1.var_.characterEffect1059ui_story then
					local var_150_26 = Mathf.Lerp(0, 0.5, var_150_25)

					arg_147_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1059ui_story.fillRatio = var_150_26
				end
			end

			if arg_147_1.time_ >= var_150_23 + var_150_24 and arg_147_1.time_ < var_150_23 + var_150_24 + arg_150_0 and arg_147_1.var_.characterEffect1059ui_story then
				local var_150_27 = 0.5

				arg_147_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1059ui_story.fillRatio = var_150_27
			end

			local var_150_28 = arg_147_1.actors_["10025ui_story"]
			local var_150_29 = 0

			if var_150_29 < arg_147_1.time_ and arg_147_1.time_ <= var_150_29 + arg_150_0 and arg_147_1.var_.characterEffect10025ui_story == nil then
				arg_147_1.var_.characterEffect10025ui_story = var_150_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_30 = 0.2

			if var_150_29 <= arg_147_1.time_ and arg_147_1.time_ < var_150_29 + var_150_30 then
				local var_150_31 = (arg_147_1.time_ - var_150_29) / var_150_30

				if arg_147_1.var_.characterEffect10025ui_story then
					arg_147_1.var_.characterEffect10025ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_29 + var_150_30 and arg_147_1.time_ < var_150_29 + var_150_30 + arg_150_0 and arg_147_1.var_.characterEffect10025ui_story then
				arg_147_1.var_.characterEffect10025ui_story.fillFlat = false
			end

			local var_150_32 = 0

			if var_150_32 < arg_147_1.time_ and arg_147_1.time_ <= var_150_32 + arg_150_0 then
				arg_147_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_150_33 = 0

			if var_150_33 < arg_147_1.time_ and arg_147_1.time_ <= var_150_33 + arg_150_0 then
				arg_147_1:PlayTimeline("10025ui_story", "StoryTimeline/CharAction/story10025/story10025action/10025action7_1")
			end

			local var_150_34 = 0
			local var_150_35 = 0.325

			if var_150_34 < arg_147_1.time_ and arg_147_1.time_ <= var_150_34 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_36 = arg_147_1:FormatText(StoryNameCfg[328].name)

				arg_147_1.leftNameTxt_.text = var_150_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_37 = arg_147_1:GetWordFromCfg(116141036)
				local var_150_38 = arg_147_1:FormatText(var_150_37.content)

				arg_147_1.text_.text = var_150_38

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_39 = 13
				local var_150_40 = utf8.len(var_150_38)
				local var_150_41 = var_150_39 <= 0 and var_150_35 or var_150_35 * (var_150_40 / var_150_39)

				if var_150_41 > 0 and var_150_35 < var_150_41 then
					arg_147_1.talkMaxDuration = var_150_41

					if var_150_41 + var_150_34 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_41 + var_150_34
					end
				end

				arg_147_1.text_.text = var_150_38
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141036", "story_v_out_116141.awb") ~= 0 then
					local var_150_42 = manager.audio:GetVoiceLength("story_v_out_116141", "116141036", "story_v_out_116141.awb") / 1000

					if var_150_42 + var_150_34 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_42 + var_150_34
					end

					if var_150_37.prefab_name ~= "" and arg_147_1.actors_[var_150_37.prefab_name] ~= nil then
						local var_150_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_37.prefab_name].transform, "story_v_out_116141", "116141036", "story_v_out_116141.awb")

						arg_147_1:RecordAudio("116141036", var_150_43)
						arg_147_1:RecordAudio("116141036", var_150_43)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_116141", "116141036", "story_v_out_116141.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_116141", "116141036", "story_v_out_116141.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_44 = math.max(var_150_35, arg_147_1.talkMaxDuration)

			if var_150_34 <= arg_147_1.time_ and arg_147_1.time_ < var_150_34 + var_150_44 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_34) / var_150_44

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_34 + var_150_44 and arg_147_1.time_ < var_150_34 + var_150_44 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play116141037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 116141037
		arg_151_1.duration_ = 3.53

		local var_151_0 = {
			zh = 2.066,
			ja = 3.533
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
				arg_151_0:Play116141038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10025ui_story"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.characterEffect10025ui_story == nil then
				arg_151_1.var_.characterEffect10025ui_story = var_154_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_2 = 0.2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.characterEffect10025ui_story then
					local var_154_4 = Mathf.Lerp(0, 0.5, var_154_3)

					arg_151_1.var_.characterEffect10025ui_story.fillFlat = true
					arg_151_1.var_.characterEffect10025ui_story.fillRatio = var_154_4
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.characterEffect10025ui_story then
				local var_154_5 = 0.5

				arg_151_1.var_.characterEffect10025ui_story.fillFlat = true
				arg_151_1.var_.characterEffect10025ui_story.fillRatio = var_154_5
			end

			local var_154_6 = 0

			if var_154_6 < arg_151_1.time_ and arg_151_1.time_ <= var_154_6 + arg_154_0 then
				arg_151_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_154_7 = 0
			local var_154_8 = 0.225

			if var_154_7 < arg_151_1.time_ and arg_151_1.time_ <= var_154_7 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_9 = arg_151_1:FormatText(StoryNameCfg[28].name)

				arg_151_1.leftNameTxt_.text = var_154_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, true)
				arg_151_1.iconController_:SetSelectedState("hero")

				arg_151_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1059")

				arg_151_1.callingController_:SetSelectedState("normal")

				arg_151_1.keyicon_.color = Color.New(1, 1, 1)
				arg_151_1.icon_.color = Color.New(1, 1, 1)

				local var_154_10 = arg_151_1:GetWordFromCfg(116141037)
				local var_154_11 = arg_151_1:FormatText(var_154_10.content)

				arg_151_1.text_.text = var_154_11

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_12 = 9
				local var_154_13 = utf8.len(var_154_11)
				local var_154_14 = var_154_12 <= 0 and var_154_8 or var_154_8 * (var_154_13 / var_154_12)

				if var_154_14 > 0 and var_154_8 < var_154_14 then
					arg_151_1.talkMaxDuration = var_154_14

					if var_154_14 + var_154_7 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_14 + var_154_7
					end
				end

				arg_151_1.text_.text = var_154_11
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141037", "story_v_out_116141.awb") ~= 0 then
					local var_154_15 = manager.audio:GetVoiceLength("story_v_out_116141", "116141037", "story_v_out_116141.awb") / 1000

					if var_154_15 + var_154_7 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_15 + var_154_7
					end

					if var_154_10.prefab_name ~= "" and arg_151_1.actors_[var_154_10.prefab_name] ~= nil then
						local var_154_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_10.prefab_name].transform, "story_v_out_116141", "116141037", "story_v_out_116141.awb")

						arg_151_1:RecordAudio("116141037", var_154_16)
						arg_151_1:RecordAudio("116141037", var_154_16)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_116141", "116141037", "story_v_out_116141.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_116141", "116141037", "story_v_out_116141.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_17 = math.max(var_154_8, arg_151_1.talkMaxDuration)

			if var_154_7 <= arg_151_1.time_ and arg_151_1.time_ < var_154_7 + var_154_17 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_7) / var_154_17

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_7 + var_154_17 and arg_151_1.time_ < var_154_7 + var_154_17 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play116141038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 116141038
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play116141039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10025ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10025ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0, 100, 0)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10025ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, 100, 0)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = 0
			local var_158_10 = 0.875

			if var_158_9 < arg_155_1.time_ and arg_155_1.time_ <= var_158_9 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_11 = arg_155_1:GetWordFromCfg(116141038)
				local var_158_12 = arg_155_1:FormatText(var_158_11.content)

				arg_155_1.text_.text = var_158_12

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_13 = 35
				local var_158_14 = utf8.len(var_158_12)
				local var_158_15 = var_158_13 <= 0 and var_158_10 or var_158_10 * (var_158_14 / var_158_13)

				if var_158_15 > 0 and var_158_10 < var_158_15 then
					arg_155_1.talkMaxDuration = var_158_15

					if var_158_15 + var_158_9 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_15 + var_158_9
					end
				end

				arg_155_1.text_.text = var_158_12
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_16 = math.max(var_158_10, arg_155_1.talkMaxDuration)

			if var_158_9 <= arg_155_1.time_ and arg_155_1.time_ < var_158_9 + var_158_16 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_9) / var_158_16

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_9 + var_158_16 and arg_155_1.time_ < var_158_9 + var_158_16 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play116141039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 116141039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play116141040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.8

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_2 = arg_159_1:GetWordFromCfg(116141039)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 32
				local var_162_5 = utf8.len(var_162_3)
				local var_162_6 = var_162_4 <= 0 and var_162_1 or var_162_1 * (var_162_5 / var_162_4)

				if var_162_6 > 0 and var_162_1 < var_162_6 then
					arg_159_1.talkMaxDuration = var_162_6

					if var_162_6 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_6 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_3
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_7 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_7 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_7

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_7 and arg_159_1.time_ < var_162_0 + var_162_7 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play116141040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 116141040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play116141041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.425

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(116141040)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 17
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play116141041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 116141041
		arg_167_1.duration_ = 7

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play116141042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = "STwhite"

			if arg_167_1.bgs_[var_170_0] == nil then
				local var_170_1 = Object.Instantiate(arg_167_1.paintGo_)

				var_170_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_170_0)
				var_170_1.name = var_170_0
				var_170_1.transform.parent = arg_167_1.stage_.transform
				var_170_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_167_1.bgs_[var_170_0] = var_170_1
			end

			local var_170_2 = 0

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 then
				local var_170_3 = manager.ui.mainCamera.transform.localPosition
				local var_170_4 = Vector3.New(0, 0, 10) + Vector3.New(var_170_3.x, var_170_3.y, 0)
				local var_170_5 = arg_167_1.bgs_.STwhite

				var_170_5.transform.localPosition = var_170_4
				var_170_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_170_6 = var_170_5:GetComponent("SpriteRenderer")

				if var_170_6 and var_170_6.sprite then
					local var_170_7 = (var_170_5.transform.localPosition - var_170_3).z
					local var_170_8 = manager.ui.mainCameraCom_
					local var_170_9 = 2 * var_170_7 * Mathf.Tan(var_170_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_170_10 = var_170_9 * var_170_8.aspect
					local var_170_11 = var_170_6.sprite.bounds.size.x
					local var_170_12 = var_170_6.sprite.bounds.size.y
					local var_170_13 = var_170_10 / var_170_11
					local var_170_14 = var_170_9 / var_170_12
					local var_170_15 = var_170_14 < var_170_13 and var_170_13 or var_170_14

					var_170_5.transform.localScale = Vector3.New(var_170_15, var_170_15, 0)
				end

				for iter_170_0, iter_170_1 in pairs(arg_167_1.bgs_) do
					if iter_170_0 ~= "STwhite" then
						iter_170_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_170_16 = 0

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 then
				arg_167_1.mask_.enabled = true
				arg_167_1.mask_.raycastTarget = true

				arg_167_1:SetGaussion(false)
			end

			local var_170_17 = 2

			if var_170_16 <= arg_167_1.time_ and arg_167_1.time_ < var_170_16 + var_170_17 then
				local var_170_18 = (arg_167_1.time_ - var_170_16) / var_170_17
				local var_170_19 = Color.New(1, 1, 1)

				var_170_19.a = Mathf.Lerp(1, 0, var_170_18)
				arg_167_1.mask_.color = var_170_19
			end

			if arg_167_1.time_ >= var_170_16 + var_170_17 and arg_167_1.time_ < var_170_16 + var_170_17 + arg_170_0 then
				local var_170_20 = Color.New(1, 1, 1)
				local var_170_21 = 0

				arg_167_1.mask_.enabled = false
				var_170_20.a = var_170_21
				arg_167_1.mask_.color = var_170_20
			end

			local var_170_22 = arg_167_1.bgs_.STwhite.transform
			local var_170_23 = 0

			if var_170_23 < arg_167_1.time_ and arg_167_1.time_ <= var_170_23 + arg_170_0 then
				arg_167_1.var_.moveOldPosSTwhite = var_170_22.localPosition
				var_170_22.localScale = Vector3.New(12, 12, 12)
			end

			local var_170_24 = 0.001

			if var_170_23 <= arg_167_1.time_ and arg_167_1.time_ < var_170_23 + var_170_24 then
				local var_170_25 = (arg_167_1.time_ - var_170_23) / var_170_24
				local var_170_26 = Vector3.New(0, 0, 0)

				var_170_22.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPosSTwhite, var_170_26, var_170_25)
			end

			if arg_167_1.time_ >= var_170_23 + var_170_24 and arg_167_1.time_ < var_170_23 + var_170_24 + arg_170_0 then
				var_170_22.localPosition = Vector3.New(0, 0, 0)
			end

			if arg_167_1.frameCnt_ <= 1 then
				arg_167_1.dialog_:SetActive(false)
			end

			local var_170_27 = 2
			local var_170_28 = 0.05

			if var_170_27 < arg_167_1.time_ and arg_167_1.time_ <= var_170_27 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0

				arg_167_1.dialog_:SetActive(true)

				local var_170_29 = LeanTween.value(arg_167_1.dialog_, 0, 1, 0.3)

				var_170_29:setOnUpdate(LuaHelper.FloatAction(function(arg_171_0)
					arg_167_1.dialogCg_.alpha = arg_171_0
				end))
				var_170_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_167_1.dialog_)
					var_170_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_167_1.duration_ = arg_167_1.duration_ + 0.3

				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_30 = arg_167_1:GetWordFromCfg(116141041)
				local var_170_31 = arg_167_1:FormatText(var_170_30.content)

				arg_167_1.text_.text = var_170_31

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_32 = 2
				local var_170_33 = utf8.len(var_170_31)
				local var_170_34 = var_170_32 <= 0 and var_170_28 or var_170_28 * (var_170_33 / var_170_32)

				if var_170_34 > 0 and var_170_28 < var_170_34 then
					arg_167_1.talkMaxDuration = var_170_34
					var_170_27 = var_170_27 + 0.3

					if var_170_34 + var_170_27 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_34 + var_170_27
					end
				end

				arg_167_1.text_.text = var_170_31
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_35 = var_170_27 + 0.3
			local var_170_36 = math.max(var_170_28, arg_167_1.talkMaxDuration)

			if var_170_35 <= arg_167_1.time_ and arg_167_1.time_ < var_170_35 + var_170_36 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_35) / var_170_36

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_35 + var_170_36 and arg_167_1.time_ < var_170_35 + var_170_36 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play116141042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 116141042
		arg_173_1.duration_ = 7

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play116141043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				local var_176_1 = manager.ui.mainCamera.transform.localPosition
				local var_176_2 = Vector3.New(0, 0, 10) + Vector3.New(var_176_1.x, var_176_1.y, 0)
				local var_176_3 = arg_173_1.bgs_.ST07b

				var_176_3.transform.localPosition = var_176_2
				var_176_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_176_4 = var_176_3:GetComponent("SpriteRenderer")

				if var_176_4 and var_176_4.sprite then
					local var_176_5 = (var_176_3.transform.localPosition - var_176_1).z
					local var_176_6 = manager.ui.mainCameraCom_
					local var_176_7 = 2 * var_176_5 * Mathf.Tan(var_176_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_176_8 = var_176_7 * var_176_6.aspect
					local var_176_9 = var_176_4.sprite.bounds.size.x
					local var_176_10 = var_176_4.sprite.bounds.size.y
					local var_176_11 = var_176_8 / var_176_9
					local var_176_12 = var_176_7 / var_176_10
					local var_176_13 = var_176_12 < var_176_11 and var_176_11 or var_176_12

					var_176_3.transform.localScale = Vector3.New(var_176_13, var_176_13, 0)
				end

				for iter_176_0, iter_176_1 in pairs(arg_173_1.bgs_) do
					if iter_176_0 ~= "ST07b" then
						iter_176_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1.mask_.enabled = true
				arg_173_1.mask_.raycastTarget = true

				arg_173_1:SetGaussion(false)
			end

			local var_176_15 = 2

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15
				local var_176_17 = Color.New(1, 1, 1)

				var_176_17.a = Mathf.Lerp(1, 0, var_176_16)
				arg_173_1.mask_.color = var_176_17
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 then
				local var_176_18 = Color.New(1, 1, 1)
				local var_176_19 = 0

				arg_173_1.mask_.enabled = false
				var_176_18.a = var_176_19
				arg_173_1.mask_.color = var_176_18
			end

			local var_176_20 = 0
			local var_176_21 = 1

			if var_176_20 < arg_173_1.time_ and arg_173_1.time_ <= var_176_20 + arg_176_0 then
				local var_176_22 = "play"
				local var_176_23 = "music"

				arg_173_1:AudioAction(var_176_22, var_176_23, "ui_battle", "ui_battle_stopbgm", "")

				local var_176_24 = ""
				local var_176_25 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_176_25 ~= "" then
					if arg_173_1.bgmTxt_.text ~= var_176_25 and arg_173_1.bgmTxt_.text ~= "" then
						if arg_173_1.bgmTxt2_.text ~= "" then
							arg_173_1.bgmTxt_.text = arg_173_1.bgmTxt2_.text
						end

						arg_173_1.bgmTxt2_.text = var_176_25

						arg_173_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_173_1.bgmTxt_.text = var_176_25
					end

					if arg_173_1.bgmTimer then
						arg_173_1.bgmTimer:Stop()

						arg_173_1.bgmTimer = nil
					end

					if arg_173_1.settingData.show_music_name == 1 then
						arg_173_1.musicController:SetSelectedState("show")
						arg_173_1.musicAnimator_:Play("open", 0, 0)

						if arg_173_1.settingData.music_time ~= 0 then
							arg_173_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_173_1.settingData.music_time), function()
								if arg_173_1 == nil or isNil(arg_173_1.bgmTxt_) then
									return
								end

								arg_173_1.musicController:SetSelectedState("hide")
								arg_173_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_173_1.frameCnt_ <= 1 then
				arg_173_1.dialog_:SetActive(false)
			end

			local var_176_26 = 2
			local var_176_27 = 1.025

			if var_176_26 < arg_173_1.time_ and arg_173_1.time_ <= var_176_26 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0

				arg_173_1.dialog_:SetActive(true)

				local var_176_28 = LeanTween.value(arg_173_1.dialog_, 0, 1, 0.3)

				var_176_28:setOnUpdate(LuaHelper.FloatAction(function(arg_178_0)
					arg_173_1.dialogCg_.alpha = arg_178_0
				end))
				var_176_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_173_1.dialog_)
					var_176_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_173_1.duration_ = arg_173_1.duration_ + 0.3

				SetActive(arg_173_1.leftNameGo_, false)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_29 = arg_173_1:GetWordFromCfg(116141042)
				local var_176_30 = arg_173_1:FormatText(var_176_29.content)

				arg_173_1.text_.text = var_176_30

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_31 = 41
				local var_176_32 = utf8.len(var_176_30)
				local var_176_33 = var_176_31 <= 0 and var_176_27 or var_176_27 * (var_176_32 / var_176_31)

				if var_176_33 > 0 and var_176_27 < var_176_33 then
					arg_173_1.talkMaxDuration = var_176_33
					var_176_26 = var_176_26 + 0.3

					if var_176_33 + var_176_26 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_33 + var_176_26
					end
				end

				arg_173_1.text_.text = var_176_30
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)
				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_34 = var_176_26 + 0.3
			local var_176_35 = math.max(var_176_27, arg_173_1.talkMaxDuration)

			if var_176_34 <= arg_173_1.time_ and arg_173_1.time_ < var_176_34 + var_176_35 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_34) / var_176_35

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_34 + var_176_35 and arg_173_1.time_ < var_176_34 + var_176_35 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play116141043 = function(arg_180_0, arg_180_1)
		arg_180_1.time_ = 0
		arg_180_1.frameCnt_ = 0
		arg_180_1.state_ = "playing"
		arg_180_1.curTalkId_ = 116141043
		arg_180_1.duration_ = 5

		SetActive(arg_180_1.tipsGo_, false)

		function arg_180_1.onSingleLineFinish_()
			arg_180_1.onSingleLineUpdate_ = nil
			arg_180_1.onSingleLineFinish_ = nil
			arg_180_1.state_ = "waiting"
		end

		function arg_180_1.playNext_(arg_182_0)
			if arg_182_0 == 1 then
				arg_180_0:Play116141044(arg_180_1)
			end
		end

		function arg_180_1.onSingleLineUpdate_(arg_183_0)
			local var_183_0 = 0
			local var_183_1 = 0.725

			if var_183_0 < arg_180_1.time_ and arg_180_1.time_ <= var_183_0 + arg_183_0 then
				arg_180_1.talkMaxDuration = 0
				arg_180_1.dialogCg_.alpha = 1

				arg_180_1.dialog_:SetActive(true)
				SetActive(arg_180_1.leftNameGo_, false)

				arg_180_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_180_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_180_1:RecordName(arg_180_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_180_1.iconTrs_.gameObject, false)
				arg_180_1.callingController_:SetSelectedState("normal")

				local var_183_2 = arg_180_1:GetWordFromCfg(116141043)
				local var_183_3 = arg_180_1:FormatText(var_183_2.content)

				arg_180_1.text_.text = var_183_3

				LuaForUtil.ClearLinePrefixSymbol(arg_180_1.text_)

				local var_183_4 = 29
				local var_183_5 = utf8.len(var_183_3)
				local var_183_6 = var_183_4 <= 0 and var_183_1 or var_183_1 * (var_183_5 / var_183_4)

				if var_183_6 > 0 and var_183_1 < var_183_6 then
					arg_180_1.talkMaxDuration = var_183_6

					if var_183_6 + var_183_0 > arg_180_1.duration_ then
						arg_180_1.duration_ = var_183_6 + var_183_0
					end
				end

				arg_180_1.text_.text = var_183_3
				arg_180_1.typewritter.percent = 0

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(false)
				arg_180_1:RecordContent(arg_180_1.text_.text)
			end

			local var_183_7 = math.max(var_183_1, arg_180_1.talkMaxDuration)

			if var_183_0 <= arg_180_1.time_ and arg_180_1.time_ < var_183_0 + var_183_7 then
				arg_180_1.typewritter.percent = (arg_180_1.time_ - var_183_0) / var_183_7

				arg_180_1.typewritter:SetDirty()
			end

			if arg_180_1.time_ >= var_183_0 + var_183_7 and arg_180_1.time_ < var_183_0 + var_183_7 + arg_183_0 then
				arg_180_1.typewritter.percent = 1

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(true)
			end
		end
	end,
	Play116141044 = function(arg_184_0, arg_184_1)
		arg_184_1.time_ = 0
		arg_184_1.frameCnt_ = 0
		arg_184_1.state_ = "playing"
		arg_184_1.curTalkId_ = 116141044
		arg_184_1.duration_ = 5

		SetActive(arg_184_1.tipsGo_, false)

		function arg_184_1.onSingleLineFinish_()
			arg_184_1.onSingleLineUpdate_ = nil
			arg_184_1.onSingleLineFinish_ = nil
			arg_184_1.state_ = "waiting"
		end

		function arg_184_1.playNext_(arg_186_0)
			if arg_186_0 == 1 then
				arg_184_0:Play116141045(arg_184_1)
			end
		end

		function arg_184_1.onSingleLineUpdate_(arg_187_0)
			local var_187_0 = 0
			local var_187_1 = 0.5

			if var_187_0 < arg_184_1.time_ and arg_184_1.time_ <= var_187_0 + arg_187_0 then
				local var_187_2 = "play"
				local var_187_3 = "effect"

				arg_184_1:AudioAction(var_187_2, var_187_3, "se_story_16", "se_story_16_door04", "")
			end

			local var_187_4 = 0.433333333333333
			local var_187_5 = 0.566666666666667

			if var_187_4 < arg_184_1.time_ and arg_184_1.time_ <= var_187_4 + arg_187_0 then
				local var_187_6 = "play"
				local var_187_7 = "effect"

				arg_184_1:AudioAction(var_187_6, var_187_7, "se_story_16", "se_story_16_arch", "")
			end

			local var_187_8 = 0
			local var_187_9 = 0.775

			if var_187_8 < arg_184_1.time_ and arg_184_1.time_ <= var_187_8 + arg_187_0 then
				arg_184_1.talkMaxDuration = 0
				arg_184_1.dialogCg_.alpha = 1

				arg_184_1.dialog_:SetActive(true)
				SetActive(arg_184_1.leftNameGo_, false)

				arg_184_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_184_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_184_1:RecordName(arg_184_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_184_1.iconTrs_.gameObject, false)
				arg_184_1.callingController_:SetSelectedState("normal")

				local var_187_10 = arg_184_1:GetWordFromCfg(116141044)
				local var_187_11 = arg_184_1:FormatText(var_187_10.content)

				arg_184_1.text_.text = var_187_11

				LuaForUtil.ClearLinePrefixSymbol(arg_184_1.text_)

				local var_187_12 = 31
				local var_187_13 = utf8.len(var_187_11)
				local var_187_14 = var_187_12 <= 0 and var_187_9 or var_187_9 * (var_187_13 / var_187_12)

				if var_187_14 > 0 and var_187_9 < var_187_14 then
					arg_184_1.talkMaxDuration = var_187_14

					if var_187_14 + var_187_8 > arg_184_1.duration_ then
						arg_184_1.duration_ = var_187_14 + var_187_8
					end
				end

				arg_184_1.text_.text = var_187_11
				arg_184_1.typewritter.percent = 0

				arg_184_1.typewritter:SetDirty()
				arg_184_1:ShowNextGo(false)
				arg_184_1:RecordContent(arg_184_1.text_.text)
			end

			local var_187_15 = math.max(var_187_9, arg_184_1.talkMaxDuration)

			if var_187_8 <= arg_184_1.time_ and arg_184_1.time_ < var_187_8 + var_187_15 then
				arg_184_1.typewritter.percent = (arg_184_1.time_ - var_187_8) / var_187_15

				arg_184_1.typewritter:SetDirty()
			end

			if arg_184_1.time_ >= var_187_8 + var_187_15 and arg_184_1.time_ < var_187_8 + var_187_15 + arg_187_0 then
				arg_184_1.typewritter.percent = 1

				arg_184_1.typewritter:SetDirty()
				arg_184_1:ShowNextGo(true)
			end
		end
	end,
	Play116141045 = function(arg_188_0, arg_188_1)
		arg_188_1.time_ = 0
		arg_188_1.frameCnt_ = 0
		arg_188_1.state_ = "playing"
		arg_188_1.curTalkId_ = 116141045
		arg_188_1.duration_ = 2.43

		local var_188_0 = {
			zh = 2.433,
			ja = 2.366
		}
		local var_188_1 = manager.audio:GetLocalizationFlag()

		if var_188_0[var_188_1] ~= nil then
			arg_188_1.duration_ = var_188_0[var_188_1]
		end

		SetActive(arg_188_1.tipsGo_, false)

		function arg_188_1.onSingleLineFinish_()
			arg_188_1.onSingleLineUpdate_ = nil
			arg_188_1.onSingleLineFinish_ = nil
			arg_188_1.state_ = "waiting"
		end

		function arg_188_1.playNext_(arg_190_0)
			if arg_190_0 == 1 then
				arg_188_0:Play116141046(arg_188_1)
			end
		end

		function arg_188_1.onSingleLineUpdate_(arg_191_0)
			local var_191_0 = arg_188_1.actors_["1059ui_story"].transform
			local var_191_1 = 0

			if var_191_1 < arg_188_1.time_ and arg_188_1.time_ <= var_191_1 + arg_191_0 then
				arg_188_1.var_.moveOldPos1059ui_story = var_191_0.localPosition
			end

			local var_191_2 = 0.001

			if var_191_1 <= arg_188_1.time_ and arg_188_1.time_ < var_191_1 + var_191_2 then
				local var_191_3 = (arg_188_1.time_ - var_191_1) / var_191_2
				local var_191_4 = Vector3.New(-0.7, -1.05, -6)

				var_191_0.localPosition = Vector3.Lerp(arg_188_1.var_.moveOldPos1059ui_story, var_191_4, var_191_3)

				local var_191_5 = manager.ui.mainCamera.transform.position - var_191_0.position

				var_191_0.forward = Vector3.New(var_191_5.x, var_191_5.y, var_191_5.z)

				local var_191_6 = var_191_0.localEulerAngles

				var_191_6.z = 0
				var_191_6.x = 0
				var_191_0.localEulerAngles = var_191_6
			end

			if arg_188_1.time_ >= var_191_1 + var_191_2 and arg_188_1.time_ < var_191_1 + var_191_2 + arg_191_0 then
				var_191_0.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_191_7 = manager.ui.mainCamera.transform.position - var_191_0.position

				var_191_0.forward = Vector3.New(var_191_7.x, var_191_7.y, var_191_7.z)

				local var_191_8 = var_191_0.localEulerAngles

				var_191_8.z = 0
				var_191_8.x = 0
				var_191_0.localEulerAngles = var_191_8
			end

			local var_191_9 = arg_188_1.actors_["1059ui_story"]
			local var_191_10 = 0

			if var_191_10 < arg_188_1.time_ and arg_188_1.time_ <= var_191_10 + arg_191_0 and arg_188_1.var_.characterEffect1059ui_story == nil then
				arg_188_1.var_.characterEffect1059ui_story = var_191_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_191_11 = 0.2

			if var_191_10 <= arg_188_1.time_ and arg_188_1.time_ < var_191_10 + var_191_11 then
				local var_191_12 = (arg_188_1.time_ - var_191_10) / var_191_11

				if arg_188_1.var_.characterEffect1059ui_story then
					arg_188_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_188_1.time_ >= var_191_10 + var_191_11 and arg_188_1.time_ < var_191_10 + var_191_11 + arg_191_0 and arg_188_1.var_.characterEffect1059ui_story then
				arg_188_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_191_13 = 0

			if var_191_13 < arg_188_1.time_ and arg_188_1.time_ <= var_191_13 + arg_191_0 then
				arg_188_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_191_14 = 0

			if var_191_14 < arg_188_1.time_ and arg_188_1.time_ <= var_191_14 + arg_191_0 then
				arg_188_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_191_15 = 0
			local var_191_16 = 0.2

			if var_191_15 < arg_188_1.time_ and arg_188_1.time_ <= var_191_15 + arg_191_0 then
				local var_191_17 = "play"
				local var_191_18 = "music"

				arg_188_1:AudioAction(var_191_17, var_191_18, "ui_battle", "ui_battle_stopbgm", "")

				local var_191_19 = ""
				local var_191_20 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_191_20 ~= "" then
					if arg_188_1.bgmTxt_.text ~= var_191_20 and arg_188_1.bgmTxt_.text ~= "" then
						if arg_188_1.bgmTxt2_.text ~= "" then
							arg_188_1.bgmTxt_.text = arg_188_1.bgmTxt2_.text
						end

						arg_188_1.bgmTxt2_.text = var_191_20

						arg_188_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_188_1.bgmTxt_.text = var_191_20
					end

					if arg_188_1.bgmTimer then
						arg_188_1.bgmTimer:Stop()

						arg_188_1.bgmTimer = nil
					end

					if arg_188_1.settingData.show_music_name == 1 then
						arg_188_1.musicController:SetSelectedState("show")
						arg_188_1.musicAnimator_:Play("open", 0, 0)

						if arg_188_1.settingData.music_time ~= 0 then
							arg_188_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_188_1.settingData.music_time), function()
								if arg_188_1 == nil or isNil(arg_188_1.bgmTxt_) then
									return
								end

								arg_188_1.musicController:SetSelectedState("hide")
								arg_188_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_191_21 = 0.225
			local var_191_22 = 0.775

			if var_191_21 < arg_188_1.time_ and arg_188_1.time_ <= var_191_21 + arg_191_0 then
				local var_191_23 = "play"
				local var_191_24 = "music"

				arg_188_1:AudioAction(var_191_23, var_191_24, "bgm_activity_1_6_story_intense", "bgm_activity_1_6_story_intense", "bgm_activity_1_6_story_intense.awb")

				local var_191_25 = ""
				local var_191_26 = manager.audio:GetAudioName("bgm_activity_1_6_story_intense", "bgm_activity_1_6_story_intense")

				if var_191_26 ~= "" then
					if arg_188_1.bgmTxt_.text ~= var_191_26 and arg_188_1.bgmTxt_.text ~= "" then
						if arg_188_1.bgmTxt2_.text ~= "" then
							arg_188_1.bgmTxt_.text = arg_188_1.bgmTxt2_.text
						end

						arg_188_1.bgmTxt2_.text = var_191_26

						arg_188_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_188_1.bgmTxt_.text = var_191_26
					end

					if arg_188_1.bgmTimer then
						arg_188_1.bgmTimer:Stop()

						arg_188_1.bgmTimer = nil
					end

					if arg_188_1.settingData.show_music_name == 1 then
						arg_188_1.musicController:SetSelectedState("show")
						arg_188_1.musicAnimator_:Play("open", 0, 0)

						if arg_188_1.settingData.music_time ~= 0 then
							arg_188_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_188_1.settingData.music_time), function()
								if arg_188_1 == nil or isNil(arg_188_1.bgmTxt_) then
									return
								end

								arg_188_1.musicController:SetSelectedState("hide")
								arg_188_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_191_27 = 0.366666666666667
			local var_191_28 = 0.633333333333333

			if var_191_27 < arg_188_1.time_ and arg_188_1.time_ <= var_191_27 + arg_191_0 then
				local var_191_29 = "play"
				local var_191_30 = "music"

				arg_188_1:AudioAction(var_191_29, var_191_30, "bgm_activity_1_6_story_intense", "OG", "bgm_activity_1_6_story_intense.awb")

				local var_191_31 = ""
				local var_191_32 = manager.audio:GetAudioName("bgm_activity_1_6_story_intense", "OG")

				if var_191_32 ~= "" then
					if arg_188_1.bgmTxt_.text ~= var_191_32 and arg_188_1.bgmTxt_.text ~= "" then
						if arg_188_1.bgmTxt2_.text ~= "" then
							arg_188_1.bgmTxt_.text = arg_188_1.bgmTxt2_.text
						end

						arg_188_1.bgmTxt2_.text = var_191_32

						arg_188_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_188_1.bgmTxt_.text = var_191_32
					end

					if arg_188_1.bgmTimer then
						arg_188_1.bgmTimer:Stop()

						arg_188_1.bgmTimer = nil
					end

					if arg_188_1.settingData.show_music_name == 1 then
						arg_188_1.musicController:SetSelectedState("show")
						arg_188_1.musicAnimator_:Play("open", 0, 0)

						if arg_188_1.settingData.music_time ~= 0 then
							arg_188_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_188_1.settingData.music_time), function()
								if arg_188_1 == nil or isNil(arg_188_1.bgmTxt_) then
									return
								end

								arg_188_1.musicController:SetSelectedState("hide")
								arg_188_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_191_33 = 0
			local var_191_34 = 0.225

			if var_191_33 < arg_188_1.time_ and arg_188_1.time_ <= var_191_33 + arg_191_0 then
				arg_188_1.talkMaxDuration = 0
				arg_188_1.dialogCg_.alpha = 1

				arg_188_1.dialog_:SetActive(true)
				SetActive(arg_188_1.leftNameGo_, true)

				local var_191_35 = arg_188_1:FormatText(StoryNameCfg[28].name)

				arg_188_1.leftNameTxt_.text = var_191_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_188_1.leftNameTxt_.transform)

				arg_188_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_188_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_188_1:RecordName(arg_188_1.leftNameTxt_.text)
				SetActive(arg_188_1.iconTrs_.gameObject, false)
				arg_188_1.callingController_:SetSelectedState("normal")

				local var_191_36 = arg_188_1:GetWordFromCfg(116141045)
				local var_191_37 = arg_188_1:FormatText(var_191_36.content)

				arg_188_1.text_.text = var_191_37

				LuaForUtil.ClearLinePrefixSymbol(arg_188_1.text_)

				local var_191_38 = 9
				local var_191_39 = utf8.len(var_191_37)
				local var_191_40 = var_191_38 <= 0 and var_191_34 or var_191_34 * (var_191_39 / var_191_38)

				if var_191_40 > 0 and var_191_34 < var_191_40 then
					arg_188_1.talkMaxDuration = var_191_40

					if var_191_40 + var_191_33 > arg_188_1.duration_ then
						arg_188_1.duration_ = var_191_40 + var_191_33
					end
				end

				arg_188_1.text_.text = var_191_37
				arg_188_1.typewritter.percent = 0

				arg_188_1.typewritter:SetDirty()
				arg_188_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141045", "story_v_out_116141.awb") ~= 0 then
					local var_191_41 = manager.audio:GetVoiceLength("story_v_out_116141", "116141045", "story_v_out_116141.awb") / 1000

					if var_191_41 + var_191_33 > arg_188_1.duration_ then
						arg_188_1.duration_ = var_191_41 + var_191_33
					end

					if var_191_36.prefab_name ~= "" and arg_188_1.actors_[var_191_36.prefab_name] ~= nil then
						local var_191_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_188_1.actors_[var_191_36.prefab_name].transform, "story_v_out_116141", "116141045", "story_v_out_116141.awb")

						arg_188_1:RecordAudio("116141045", var_191_42)
						arg_188_1:RecordAudio("116141045", var_191_42)
					else
						arg_188_1:AudioAction("play", "voice", "story_v_out_116141", "116141045", "story_v_out_116141.awb")
					end

					arg_188_1:RecordHistoryTalkVoice("story_v_out_116141", "116141045", "story_v_out_116141.awb")
				end

				arg_188_1:RecordContent(arg_188_1.text_.text)
			end

			local var_191_43 = math.max(var_191_34, arg_188_1.talkMaxDuration)

			if var_191_33 <= arg_188_1.time_ and arg_188_1.time_ < var_191_33 + var_191_43 then
				arg_188_1.typewritter.percent = (arg_188_1.time_ - var_191_33) / var_191_43

				arg_188_1.typewritter:SetDirty()
			end

			if arg_188_1.time_ >= var_191_33 + var_191_43 and arg_188_1.time_ < var_191_33 + var_191_43 + arg_191_0 then
				arg_188_1.typewritter.percent = 1

				arg_188_1.typewritter:SetDirty()
				arg_188_1:ShowNextGo(true)
			end
		end
	end,
	Play116141046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 116141046
		arg_195_1.duration_ = 6.13

		local var_195_0 = {
			zh = 4.9,
			ja = 6.133
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
				arg_195_0:Play116141047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1028ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1028ui_story == nil then
				arg_195_1.var_.characterEffect1028ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1028ui_story then
					arg_195_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1028ui_story then
				arg_195_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_198_4 = arg_195_1.actors_["1059ui_story"]
			local var_198_5 = 0

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 and arg_195_1.var_.characterEffect1059ui_story == nil then
				arg_195_1.var_.characterEffect1059ui_story = var_198_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_6 = 0.2

			if var_198_5 <= arg_195_1.time_ and arg_195_1.time_ < var_198_5 + var_198_6 then
				local var_198_7 = (arg_195_1.time_ - var_198_5) / var_198_6

				if arg_195_1.var_.characterEffect1059ui_story then
					local var_198_8 = Mathf.Lerp(0, 0.5, var_198_7)

					arg_195_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1059ui_story.fillRatio = var_198_8
				end
			end

			if arg_195_1.time_ >= var_198_5 + var_198_6 and arg_195_1.time_ < var_198_5 + var_198_6 + arg_198_0 and arg_195_1.var_.characterEffect1059ui_story then
				local var_198_9 = 0.5

				arg_195_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1059ui_story.fillRatio = var_198_9
			end

			local var_198_10 = arg_195_1.actors_["1059ui_story"].transform
			local var_198_11 = 0

			if var_198_11 < arg_195_1.time_ and arg_195_1.time_ <= var_198_11 + arg_198_0 then
				arg_195_1.var_.moveOldPos1059ui_story = var_198_10.localPosition
			end

			local var_198_12 = 0.001

			if var_198_11 <= arg_195_1.time_ and arg_195_1.time_ < var_198_11 + var_198_12 then
				local var_198_13 = (arg_195_1.time_ - var_198_11) / var_198_12
				local var_198_14 = Vector3.New(-0.7, -1.05, -6)

				var_198_10.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1059ui_story, var_198_14, var_198_13)

				local var_198_15 = manager.ui.mainCamera.transform.position - var_198_10.position

				var_198_10.forward = Vector3.New(var_198_15.x, var_198_15.y, var_198_15.z)

				local var_198_16 = var_198_10.localEulerAngles

				var_198_16.z = 0
				var_198_16.x = 0
				var_198_10.localEulerAngles = var_198_16
			end

			if arg_195_1.time_ >= var_198_11 + var_198_12 and arg_195_1.time_ < var_198_11 + var_198_12 + arg_198_0 then
				var_198_10.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_198_17 = manager.ui.mainCamera.transform.position - var_198_10.position

				var_198_10.forward = Vector3.New(var_198_17.x, var_198_17.y, var_198_17.z)

				local var_198_18 = var_198_10.localEulerAngles

				var_198_18.z = 0
				var_198_18.x = 0
				var_198_10.localEulerAngles = var_198_18
			end

			local var_198_19 = arg_195_1.actors_["1028ui_story"].transform
			local var_198_20 = 0

			if var_198_20 < arg_195_1.time_ and arg_195_1.time_ <= var_198_20 + arg_198_0 then
				arg_195_1.var_.moveOldPos1028ui_story = var_198_19.localPosition
			end

			local var_198_21 = 0.001

			if var_198_20 <= arg_195_1.time_ and arg_195_1.time_ < var_198_20 + var_198_21 then
				local var_198_22 = (arg_195_1.time_ - var_198_20) / var_198_21
				local var_198_23 = Vector3.New(0.7, -0.9, -5.9)

				var_198_19.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1028ui_story, var_198_23, var_198_22)

				local var_198_24 = manager.ui.mainCamera.transform.position - var_198_19.position

				var_198_19.forward = Vector3.New(var_198_24.x, var_198_24.y, var_198_24.z)

				local var_198_25 = var_198_19.localEulerAngles

				var_198_25.z = 0
				var_198_25.x = 0
				var_198_19.localEulerAngles = var_198_25
			end

			if arg_195_1.time_ >= var_198_20 + var_198_21 and arg_195_1.time_ < var_198_20 + var_198_21 + arg_198_0 then
				var_198_19.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_198_26 = manager.ui.mainCamera.transform.position - var_198_19.position

				var_198_19.forward = Vector3.New(var_198_26.x, var_198_26.y, var_198_26.z)

				local var_198_27 = var_198_19.localEulerAngles

				var_198_27.z = 0
				var_198_27.x = 0
				var_198_19.localEulerAngles = var_198_27
			end

			local var_198_28 = 0

			if var_198_28 < arg_195_1.time_ and arg_195_1.time_ <= var_198_28 + arg_198_0 then
				arg_195_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_198_29 = 0

			if var_198_29 < arg_195_1.time_ and arg_195_1.time_ <= var_198_29 + arg_198_0 then
				arg_195_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_198_30 = 0
			local var_198_31 = 0.475

			if var_198_30 < arg_195_1.time_ and arg_195_1.time_ <= var_198_30 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_32 = arg_195_1:FormatText(StoryNameCfg[327].name)

				arg_195_1.leftNameTxt_.text = var_198_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_33 = arg_195_1:GetWordFromCfg(116141046)
				local var_198_34 = arg_195_1:FormatText(var_198_33.content)

				arg_195_1.text_.text = var_198_34

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_35 = 19
				local var_198_36 = utf8.len(var_198_34)
				local var_198_37 = var_198_35 <= 0 and var_198_31 or var_198_31 * (var_198_36 / var_198_35)

				if var_198_37 > 0 and var_198_31 < var_198_37 then
					arg_195_1.talkMaxDuration = var_198_37

					if var_198_37 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_37 + var_198_30
					end
				end

				arg_195_1.text_.text = var_198_34
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141046", "story_v_out_116141.awb") ~= 0 then
					local var_198_38 = manager.audio:GetVoiceLength("story_v_out_116141", "116141046", "story_v_out_116141.awb") / 1000

					if var_198_38 + var_198_30 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_38 + var_198_30
					end

					if var_198_33.prefab_name ~= "" and arg_195_1.actors_[var_198_33.prefab_name] ~= nil then
						local var_198_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_33.prefab_name].transform, "story_v_out_116141", "116141046", "story_v_out_116141.awb")

						arg_195_1:RecordAudio("116141046", var_198_39)
						arg_195_1:RecordAudio("116141046", var_198_39)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_116141", "116141046", "story_v_out_116141.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_116141", "116141046", "story_v_out_116141.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_40 = math.max(var_198_31, arg_195_1.talkMaxDuration)

			if var_198_30 <= arg_195_1.time_ and arg_195_1.time_ < var_198_30 + var_198_40 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_30) / var_198_40

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_30 + var_198_40 and arg_195_1.time_ < var_198_30 + var_198_40 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play116141047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 116141047
		arg_199_1.duration_ = 4.63

		local var_199_0 = {
			zh = 4.633,
			ja = 3.2
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
				arg_199_0:Play116141048(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["1028ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect1028ui_story == nil then
				arg_199_1.var_.characterEffect1028ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.2

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect1028ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1028ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1028ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1028ui_story.fillRatio = var_202_5
			end

			local var_202_6 = arg_199_1.actors_["1059ui_story"]
			local var_202_7 = 0

			if var_202_7 < arg_199_1.time_ and arg_199_1.time_ <= var_202_7 + arg_202_0 and arg_199_1.var_.characterEffect1059ui_story == nil then
				arg_199_1.var_.characterEffect1059ui_story = var_202_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_8 = 0.2

			if var_202_7 <= arg_199_1.time_ and arg_199_1.time_ < var_202_7 + var_202_8 then
				local var_202_9 = (arg_199_1.time_ - var_202_7) / var_202_8

				if arg_199_1.var_.characterEffect1059ui_story then
					arg_199_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_7 + var_202_8 and arg_199_1.time_ < var_202_7 + var_202_8 + arg_202_0 and arg_199_1.var_.characterEffect1059ui_story then
				arg_199_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_202_11 = 0

			if var_202_11 < arg_199_1.time_ and arg_199_1.time_ <= var_202_11 + arg_202_0 then
				arg_199_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_202_12 = 0
			local var_202_13 = 0.425

			if var_202_12 < arg_199_1.time_ and arg_199_1.time_ <= var_202_12 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_14 = arg_199_1:FormatText(StoryNameCfg[28].name)

				arg_199_1.leftNameTxt_.text = var_202_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_15 = arg_199_1:GetWordFromCfg(116141047)
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141047", "story_v_out_116141.awb") ~= 0 then
					local var_202_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141047", "story_v_out_116141.awb") / 1000

					if var_202_20 + var_202_12 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_20 + var_202_12
					end

					if var_202_15.prefab_name ~= "" and arg_199_1.actors_[var_202_15.prefab_name] ~= nil then
						local var_202_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_15.prefab_name].transform, "story_v_out_116141", "116141047", "story_v_out_116141.awb")

						arg_199_1:RecordAudio("116141047", var_202_21)
						arg_199_1:RecordAudio("116141047", var_202_21)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_116141", "116141047", "story_v_out_116141.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_116141", "116141047", "story_v_out_116141.awb")
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
	Play116141048 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 116141048
		arg_203_1.duration_ = 8.33

		local var_203_0 = {
			zh = 8.333,
			ja = 4.966
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
				arg_203_0:Play116141049(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1028ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1028ui_story == nil then
				arg_203_1.var_.characterEffect1028ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1028ui_story then
					arg_203_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1028ui_story then
				arg_203_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_206_4 = arg_203_1.actors_["1059ui_story"]
			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 and arg_203_1.var_.characterEffect1059ui_story == nil then
				arg_203_1.var_.characterEffect1059ui_story = var_206_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_6 = 0.2

			if var_206_5 <= arg_203_1.time_ and arg_203_1.time_ < var_206_5 + var_206_6 then
				local var_206_7 = (arg_203_1.time_ - var_206_5) / var_206_6

				if arg_203_1.var_.characterEffect1059ui_story then
					local var_206_8 = Mathf.Lerp(0, 0.5, var_206_7)

					arg_203_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1059ui_story.fillRatio = var_206_8
				end
			end

			if arg_203_1.time_ >= var_206_5 + var_206_6 and arg_203_1.time_ < var_206_5 + var_206_6 + arg_206_0 and arg_203_1.var_.characterEffect1059ui_story then
				local var_206_9 = 0.5

				arg_203_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1059ui_story.fillRatio = var_206_9
			end

			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 then
				arg_203_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action2_1")
			end

			local var_206_11 = 0

			if var_206_11 < arg_203_1.time_ and arg_203_1.time_ <= var_206_11 + arg_206_0 then
				arg_203_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_206_12 = arg_203_1.actors_["1028ui_story"].transform
			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1.var_.moveOldPos1028ui_story = var_206_12.localPosition

				local var_206_14 = "1028ui_story"

				arg_203_1:ShowWeapon(arg_203_1.var_[var_206_14 .. "Animator"].transform, true)
			end

			local var_206_15 = 0.001

			if var_206_13 <= arg_203_1.time_ and arg_203_1.time_ < var_206_13 + var_206_15 then
				local var_206_16 = (arg_203_1.time_ - var_206_13) / var_206_15
				local var_206_17 = Vector3.New(0.7, -0.9, -5.9)

				var_206_12.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1028ui_story, var_206_17, var_206_16)

				local var_206_18 = manager.ui.mainCamera.transform.position - var_206_12.position

				var_206_12.forward = Vector3.New(var_206_18.x, var_206_18.y, var_206_18.z)

				local var_206_19 = var_206_12.localEulerAngles

				var_206_19.z = 0
				var_206_19.x = 0
				var_206_12.localEulerAngles = var_206_19
			end

			if arg_203_1.time_ >= var_206_13 + var_206_15 and arg_203_1.time_ < var_206_13 + var_206_15 + arg_206_0 then
				var_206_12.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_206_20 = manager.ui.mainCamera.transform.position - var_206_12.position

				var_206_12.forward = Vector3.New(var_206_20.x, var_206_20.y, var_206_20.z)

				local var_206_21 = var_206_12.localEulerAngles

				var_206_21.z = 0
				var_206_21.x = 0
				var_206_12.localEulerAngles = var_206_21
			end

			local var_206_22 = 0
			local var_206_23 = 0.375

			if var_206_22 < arg_203_1.time_ and arg_203_1.time_ <= var_206_22 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_24 = arg_203_1:FormatText(StoryNameCfg[327].name)

				arg_203_1.leftNameTxt_.text = var_206_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_25 = arg_203_1:GetWordFromCfg(116141048)
				local var_206_26 = arg_203_1:FormatText(var_206_25.content)

				arg_203_1.text_.text = var_206_26

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_27 = 15
				local var_206_28 = utf8.len(var_206_26)
				local var_206_29 = var_206_27 <= 0 and var_206_23 or var_206_23 * (var_206_28 / var_206_27)

				if var_206_29 > 0 and var_206_23 < var_206_29 then
					arg_203_1.talkMaxDuration = var_206_29

					if var_206_29 + var_206_22 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_29 + var_206_22
					end
				end

				arg_203_1.text_.text = var_206_26
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141048", "story_v_out_116141.awb") ~= 0 then
					local var_206_30 = manager.audio:GetVoiceLength("story_v_out_116141", "116141048", "story_v_out_116141.awb") / 1000

					if var_206_30 + var_206_22 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_30 + var_206_22
					end

					if var_206_25.prefab_name ~= "" and arg_203_1.actors_[var_206_25.prefab_name] ~= nil then
						local var_206_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_25.prefab_name].transform, "story_v_out_116141", "116141048", "story_v_out_116141.awb")

						arg_203_1:RecordAudio("116141048", var_206_31)
						arg_203_1:RecordAudio("116141048", var_206_31)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_116141", "116141048", "story_v_out_116141.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_116141", "116141048", "story_v_out_116141.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_32 = math.max(var_206_23, arg_203_1.talkMaxDuration)

			if var_206_22 <= arg_203_1.time_ and arg_203_1.time_ < var_206_22 + var_206_32 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_22) / var_206_32

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_22 + var_206_32 and arg_203_1.time_ < var_206_22 + var_206_32 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play116141049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 116141049
		arg_207_1.duration_ = 11.53

		local var_207_0 = {
			zh = 10.6,
			ja = 11.533
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
				arg_207_0:Play116141050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1028ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1028ui_story == nil then
				arg_207_1.var_.characterEffect1028ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.2

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1028ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1028ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1028ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1028ui_story.fillRatio = var_210_5
			end

			local var_210_6 = arg_207_1.actors_["1059ui_story"]
			local var_210_7 = 0

			if var_210_7 < arg_207_1.time_ and arg_207_1.time_ <= var_210_7 + arg_210_0 and arg_207_1.var_.characterEffect1059ui_story == nil then
				arg_207_1.var_.characterEffect1059ui_story = var_210_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_8 = 0.2

			if var_210_7 <= arg_207_1.time_ and arg_207_1.time_ < var_210_7 + var_210_8 then
				local var_210_9 = (arg_207_1.time_ - var_210_7) / var_210_8

				if arg_207_1.var_.characterEffect1059ui_story then
					arg_207_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_7 + var_210_8 and arg_207_1.time_ < var_210_7 + var_210_8 + arg_210_0 and arg_207_1.var_.characterEffect1059ui_story then
				arg_207_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action4_1")
			end

			local var_210_11 = 0

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_210_12 = 0
			local var_210_13 = 1.175

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[28].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(116141049)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141049", "story_v_out_116141.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141049", "story_v_out_116141.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_out_116141", "116141049", "story_v_out_116141.awb")

						arg_207_1:RecordAudio("116141049", var_210_21)
						arg_207_1:RecordAudio("116141049", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_116141", "116141049", "story_v_out_116141.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_116141", "116141049", "story_v_out_116141.awb")
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
	Play116141050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 116141050
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play116141051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1028ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos1028ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(0, 100, 0)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1028ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, 100, 0)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["1059ui_story"].transform
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1.var_.moveOldPos1059ui_story = var_214_9.localPosition
			end

			local var_214_11 = 0.001

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11
				local var_214_13 = Vector3.New(0, 100, 0)

				var_214_9.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1059ui_story, var_214_13, var_214_12)

				local var_214_14 = manager.ui.mainCamera.transform.position - var_214_9.position

				var_214_9.forward = Vector3.New(var_214_14.x, var_214_14.y, var_214_14.z)

				local var_214_15 = var_214_9.localEulerAngles

				var_214_15.z = 0
				var_214_15.x = 0
				var_214_9.localEulerAngles = var_214_15
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 then
				var_214_9.localPosition = Vector3.New(0, 100, 0)

				local var_214_16 = manager.ui.mainCamera.transform.position - var_214_9.position

				var_214_9.forward = Vector3.New(var_214_16.x, var_214_16.y, var_214_16.z)

				local var_214_17 = var_214_9.localEulerAngles

				var_214_17.z = 0
				var_214_17.x = 0
				var_214_9.localEulerAngles = var_214_17
			end

			local var_214_18 = 0
			local var_214_19 = 1

			if var_214_18 < arg_211_1.time_ and arg_211_1.time_ <= var_214_18 + arg_214_0 then
				local var_214_20 = "play"
				local var_214_21 = "effect"

				arg_211_1:AudioAction(var_214_20, var_214_21, "se_story_16", "se_story_16_shine", "")
			end

			local var_214_22 = 0
			local var_214_23 = 1.175

			if var_214_22 < arg_211_1.time_ and arg_211_1.time_ <= var_214_22 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_24 = arg_211_1:GetWordFromCfg(116141050)
				local var_214_25 = arg_211_1:FormatText(var_214_24.content)

				arg_211_1.text_.text = var_214_25

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_26 = 47
				local var_214_27 = utf8.len(var_214_25)
				local var_214_28 = var_214_26 <= 0 and var_214_23 or var_214_23 * (var_214_27 / var_214_26)

				if var_214_28 > 0 and var_214_23 < var_214_28 then
					arg_211_1.talkMaxDuration = var_214_28

					if var_214_28 + var_214_22 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_28 + var_214_22
					end
				end

				arg_211_1.text_.text = var_214_25
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_29 = math.max(var_214_23, arg_211_1.talkMaxDuration)

			if var_214_22 <= arg_211_1.time_ and arg_211_1.time_ < var_214_22 + var_214_29 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_22) / var_214_29

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_22 + var_214_29 and arg_211_1.time_ < var_214_22 + var_214_29 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play116141051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 116141051
		arg_215_1.duration_ = 2.47

		local var_215_0 = {
			zh = 2.466,
			ja = 2
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
				arg_215_0:Play116141052(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["1028ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story == nil then
				arg_215_1.var_.characterEffect1028ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect1028ui_story then
					arg_215_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1028ui_story then
				arg_215_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_218_4 = arg_215_1.actors_["1059ui_story"]
			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 and arg_215_1.var_.characterEffect1059ui_story == nil then
				arg_215_1.var_.characterEffect1059ui_story = var_218_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_6 = 0.2

			if var_218_5 <= arg_215_1.time_ and arg_215_1.time_ < var_218_5 + var_218_6 then
				local var_218_7 = (arg_215_1.time_ - var_218_5) / var_218_6

				if arg_215_1.var_.characterEffect1059ui_story then
					local var_218_8 = Mathf.Lerp(0, 0.5, var_218_7)

					arg_215_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_215_1.var_.characterEffect1059ui_story.fillRatio = var_218_8
				end
			end

			if arg_215_1.time_ >= var_218_5 + var_218_6 and arg_215_1.time_ < var_218_5 + var_218_6 + arg_218_0 and arg_215_1.var_.characterEffect1059ui_story then
				local var_218_9 = 0.5

				arg_215_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_215_1.var_.characterEffect1059ui_story.fillRatio = var_218_9
			end

			local var_218_10 = arg_215_1.actors_["1028ui_story"].transform
			local var_218_11 = 0

			if var_218_11 < arg_215_1.time_ and arg_215_1.time_ <= var_218_11 + arg_218_0 then
				arg_215_1.var_.moveOldPos1028ui_story = var_218_10.localPosition
			end

			local var_218_12 = 0.001

			if var_218_11 <= arg_215_1.time_ and arg_215_1.time_ < var_218_11 + var_218_12 then
				local var_218_13 = (arg_215_1.time_ - var_218_11) / var_218_12
				local var_218_14 = Vector3.New(0.7, -0.9, -5.9)

				var_218_10.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1028ui_story, var_218_14, var_218_13)

				local var_218_15 = manager.ui.mainCamera.transform.position - var_218_10.position

				var_218_10.forward = Vector3.New(var_218_15.x, var_218_15.y, var_218_15.z)

				local var_218_16 = var_218_10.localEulerAngles

				var_218_16.z = 0
				var_218_16.x = 0
				var_218_10.localEulerAngles = var_218_16
			end

			if arg_215_1.time_ >= var_218_11 + var_218_12 and arg_215_1.time_ < var_218_11 + var_218_12 + arg_218_0 then
				var_218_10.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_218_17 = manager.ui.mainCamera.transform.position - var_218_10.position

				var_218_10.forward = Vector3.New(var_218_17.x, var_218_17.y, var_218_17.z)

				local var_218_18 = var_218_10.localEulerAngles

				var_218_18.z = 0
				var_218_18.x = 0
				var_218_10.localEulerAngles = var_218_18
			end

			local var_218_19 = arg_215_1.actors_["1059ui_story"].transform
			local var_218_20 = 0

			if var_218_20 < arg_215_1.time_ and arg_215_1.time_ <= var_218_20 + arg_218_0 then
				arg_215_1.var_.moveOldPos1059ui_story = var_218_19.localPosition
			end

			local var_218_21 = 0.001

			if var_218_20 <= arg_215_1.time_ and arg_215_1.time_ < var_218_20 + var_218_21 then
				local var_218_22 = (arg_215_1.time_ - var_218_20) / var_218_21
				local var_218_23 = Vector3.New(-0.7, -1.05, -6)

				var_218_19.localPosition = Vector3.Lerp(arg_215_1.var_.moveOldPos1059ui_story, var_218_23, var_218_22)

				local var_218_24 = manager.ui.mainCamera.transform.position - var_218_19.position

				var_218_19.forward = Vector3.New(var_218_24.x, var_218_24.y, var_218_24.z)

				local var_218_25 = var_218_19.localEulerAngles

				var_218_25.z = 0
				var_218_25.x = 0
				var_218_19.localEulerAngles = var_218_25
			end

			if arg_215_1.time_ >= var_218_20 + var_218_21 and arg_215_1.time_ < var_218_20 + var_218_21 + arg_218_0 then
				var_218_19.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_218_26 = manager.ui.mainCamera.transform.position - var_218_19.position

				var_218_19.forward = Vector3.New(var_218_26.x, var_218_26.y, var_218_26.z)

				local var_218_27 = var_218_19.localEulerAngles

				var_218_27.z = 0
				var_218_27.x = 0
				var_218_19.localEulerAngles = var_218_27
			end

			local var_218_28 = 0

			if var_218_28 < arg_215_1.time_ and arg_215_1.time_ <= var_218_28 + arg_218_0 then
				arg_215_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_218_29 = 0
			local var_218_30 = 0.3

			if var_218_29 < arg_215_1.time_ and arg_215_1.time_ <= var_218_29 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_31 = arg_215_1:FormatText(StoryNameCfg[327].name)

				arg_215_1.leftNameTxt_.text = var_218_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_32 = arg_215_1:GetWordFromCfg(116141051)
				local var_218_33 = arg_215_1:FormatText(var_218_32.content)

				arg_215_1.text_.text = var_218_33

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_34 = 12
				local var_218_35 = utf8.len(var_218_33)
				local var_218_36 = var_218_34 <= 0 and var_218_30 or var_218_30 * (var_218_35 / var_218_34)

				if var_218_36 > 0 and var_218_30 < var_218_36 then
					arg_215_1.talkMaxDuration = var_218_36

					if var_218_36 + var_218_29 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_36 + var_218_29
					end
				end

				arg_215_1.text_.text = var_218_33
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141051", "story_v_out_116141.awb") ~= 0 then
					local var_218_37 = manager.audio:GetVoiceLength("story_v_out_116141", "116141051", "story_v_out_116141.awb") / 1000

					if var_218_37 + var_218_29 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_37 + var_218_29
					end

					if var_218_32.prefab_name ~= "" and arg_215_1.actors_[var_218_32.prefab_name] ~= nil then
						local var_218_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_32.prefab_name].transform, "story_v_out_116141", "116141051", "story_v_out_116141.awb")

						arg_215_1:RecordAudio("116141051", var_218_38)
						arg_215_1:RecordAudio("116141051", var_218_38)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_116141", "116141051", "story_v_out_116141.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_116141", "116141051", "story_v_out_116141.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_39 = math.max(var_218_30, arg_215_1.talkMaxDuration)

			if var_218_29 <= arg_215_1.time_ and arg_215_1.time_ < var_218_29 + var_218_39 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_29) / var_218_39

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_29 + var_218_39 and arg_215_1.time_ < var_218_29 + var_218_39 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play116141052 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 116141052
		arg_219_1.duration_ = 6.33

		local var_219_0 = {
			zh = 6,
			ja = 6.333
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
				arg_219_0:Play116141053(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1028ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story == nil then
				arg_219_1.var_.characterEffect1028ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1028ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1028ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1028ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1028ui_story.fillRatio = var_222_5
			end

			local var_222_6 = arg_219_1.actors_["1059ui_story"]
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 and arg_219_1.var_.characterEffect1059ui_story == nil then
				arg_219_1.var_.characterEffect1059ui_story = var_222_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_8 = 0.2

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8

				if arg_219_1.var_.characterEffect1059ui_story then
					arg_219_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 and arg_219_1.var_.characterEffect1059ui_story then
				arg_219_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 then
				arg_219_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action4_1")
			end

			local var_222_11 = 0

			if var_222_11 < arg_219_1.time_ and arg_219_1.time_ <= var_222_11 + arg_222_0 then
				arg_219_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_222_12 = 0
			local var_222_13 = 0.65

			if var_222_12 < arg_219_1.time_ and arg_219_1.time_ <= var_222_12 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_14 = arg_219_1:FormatText(StoryNameCfg[28].name)

				arg_219_1.leftNameTxt_.text = var_222_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_15 = arg_219_1:GetWordFromCfg(116141052)
				local var_222_16 = arg_219_1:FormatText(var_222_15.content)

				arg_219_1.text_.text = var_222_16

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_17 = 26
				local var_222_18 = utf8.len(var_222_16)
				local var_222_19 = var_222_17 <= 0 and var_222_13 or var_222_13 * (var_222_18 / var_222_17)

				if var_222_19 > 0 and var_222_13 < var_222_19 then
					arg_219_1.talkMaxDuration = var_222_19

					if var_222_19 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_19 + var_222_12
					end
				end

				arg_219_1.text_.text = var_222_16
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141052", "story_v_out_116141.awb") ~= 0 then
					local var_222_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141052", "story_v_out_116141.awb") / 1000

					if var_222_20 + var_222_12 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_12
					end

					if var_222_15.prefab_name ~= "" and arg_219_1.actors_[var_222_15.prefab_name] ~= nil then
						local var_222_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_15.prefab_name].transform, "story_v_out_116141", "116141052", "story_v_out_116141.awb")

						arg_219_1:RecordAudio("116141052", var_222_21)
						arg_219_1:RecordAudio("116141052", var_222_21)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_116141", "116141052", "story_v_out_116141.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_116141", "116141052", "story_v_out_116141.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_22 = math.max(var_222_13, arg_219_1.talkMaxDuration)

			if var_222_12 <= arg_219_1.time_ and arg_219_1.time_ < var_222_12 + var_222_22 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_12) / var_222_22

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_12 + var_222_22 and arg_219_1.time_ < var_222_12 + var_222_22 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play116141053 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 116141053
		arg_223_1.duration_ = 10.9

		local var_223_0 = {
			zh = 9.666,
			ja = 10.9
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
				arg_223_0:Play116141054(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_226_1 = 0
			local var_226_2 = 1.275

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_3 = arg_223_1:FormatText(StoryNameCfg[28].name)

				arg_223_1.leftNameTxt_.text = var_226_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_4 = arg_223_1:GetWordFromCfg(116141053)
				local var_226_5 = arg_223_1:FormatText(var_226_4.content)

				arg_223_1.text_.text = var_226_5

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_6 = 51
				local var_226_7 = utf8.len(var_226_5)
				local var_226_8 = var_226_6 <= 0 and var_226_2 or var_226_2 * (var_226_7 / var_226_6)

				if var_226_8 > 0 and var_226_2 < var_226_8 then
					arg_223_1.talkMaxDuration = var_226_8

					if var_226_8 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_1
					end
				end

				arg_223_1.text_.text = var_226_5
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141053", "story_v_out_116141.awb") ~= 0 then
					local var_226_9 = manager.audio:GetVoiceLength("story_v_out_116141", "116141053", "story_v_out_116141.awb") / 1000

					if var_226_9 + var_226_1 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_9 + var_226_1
					end

					if var_226_4.prefab_name ~= "" and arg_223_1.actors_[var_226_4.prefab_name] ~= nil then
						local var_226_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_4.prefab_name].transform, "story_v_out_116141", "116141053", "story_v_out_116141.awb")

						arg_223_1:RecordAudio("116141053", var_226_10)
						arg_223_1:RecordAudio("116141053", var_226_10)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_116141", "116141053", "story_v_out_116141.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_116141", "116141053", "story_v_out_116141.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_11 = math.max(var_226_2, arg_223_1.talkMaxDuration)

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_11 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_1) / var_226_11

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_1 + var_226_11 and arg_223_1.time_ < var_226_1 + var_226_11 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play116141054 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 116141054
		arg_227_1.duration_ = 4.5

		local var_227_0 = {
			zh = 4.333,
			ja = 4.5
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
				arg_227_0:Play116141055(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1028ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1028ui_story == nil then
				arg_227_1.var_.characterEffect1028ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1028ui_story then
					arg_227_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1028ui_story then
				arg_227_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_230_4 = arg_227_1.actors_["1059ui_story"]
			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 and arg_227_1.var_.characterEffect1059ui_story == nil then
				arg_227_1.var_.characterEffect1059ui_story = var_230_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_6 = 0.2

			if var_230_5 <= arg_227_1.time_ and arg_227_1.time_ < var_230_5 + var_230_6 then
				local var_230_7 = (arg_227_1.time_ - var_230_5) / var_230_6

				if arg_227_1.var_.characterEffect1059ui_story then
					local var_230_8 = Mathf.Lerp(0, 0.5, var_230_7)

					arg_227_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1059ui_story.fillRatio = var_230_8
				end
			end

			if arg_227_1.time_ >= var_230_5 + var_230_6 and arg_227_1.time_ < var_230_5 + var_230_6 + arg_230_0 and arg_227_1.var_.characterEffect1059ui_story then
				local var_230_9 = 0.5

				arg_227_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1059ui_story.fillRatio = var_230_9
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_230_11 = 0
			local var_230_12 = 0.4

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_13 = arg_227_1:FormatText(StoryNameCfg[327].name)

				arg_227_1.leftNameTxt_.text = var_230_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_14 = arg_227_1:GetWordFromCfg(116141054)
				local var_230_15 = arg_227_1:FormatText(var_230_14.content)

				arg_227_1.text_.text = var_230_15

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_16 = 16
				local var_230_17 = utf8.len(var_230_15)
				local var_230_18 = var_230_16 <= 0 and var_230_12 or var_230_12 * (var_230_17 / var_230_16)

				if var_230_18 > 0 and var_230_12 < var_230_18 then
					arg_227_1.talkMaxDuration = var_230_18

					if var_230_18 + var_230_11 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_18 + var_230_11
					end
				end

				arg_227_1.text_.text = var_230_15
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141054", "story_v_out_116141.awb") ~= 0 then
					local var_230_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141054", "story_v_out_116141.awb") / 1000

					if var_230_19 + var_230_11 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_11
					end

					if var_230_14.prefab_name ~= "" and arg_227_1.actors_[var_230_14.prefab_name] ~= nil then
						local var_230_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_14.prefab_name].transform, "story_v_out_116141", "116141054", "story_v_out_116141.awb")

						arg_227_1:RecordAudio("116141054", var_230_20)
						arg_227_1:RecordAudio("116141054", var_230_20)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_116141", "116141054", "story_v_out_116141.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_116141", "116141054", "story_v_out_116141.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_21 = math.max(var_230_12, arg_227_1.talkMaxDuration)

			if var_230_11 <= arg_227_1.time_ and arg_227_1.time_ < var_230_11 + var_230_21 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_11) / var_230_21

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_11 + var_230_21 and arg_227_1.time_ < var_230_11 + var_230_21 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play116141055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 116141055
		arg_231_1.duration_ = 6

		local var_231_0 = {
			zh = 4.1,
			ja = 6
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
				arg_231_0:Play116141056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1028ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1028ui_story == nil then
				arg_231_1.var_.characterEffect1028ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1028ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1028ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1028ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1028ui_story.fillRatio = var_234_5
			end

			local var_234_6 = arg_231_1.actors_["1059ui_story"]
			local var_234_7 = 0

			if var_234_7 < arg_231_1.time_ and arg_231_1.time_ <= var_234_7 + arg_234_0 and arg_231_1.var_.characterEffect1059ui_story == nil then
				arg_231_1.var_.characterEffect1059ui_story = var_234_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_8 = 0.2

			if var_234_7 <= arg_231_1.time_ and arg_231_1.time_ < var_234_7 + var_234_8 then
				local var_234_9 = (arg_231_1.time_ - var_234_7) / var_234_8

				if arg_231_1.var_.characterEffect1059ui_story then
					arg_231_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_7 + var_234_8 and arg_231_1.time_ < var_234_7 + var_234_8 + arg_234_0 and arg_231_1.var_.characterEffect1059ui_story then
				arg_231_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 then
				arg_231_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059actionlink/1059action442")
			end

			local var_234_11 = 0

			if var_234_11 < arg_231_1.time_ and arg_231_1.time_ <= var_234_11 + arg_234_0 then
				arg_231_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_234_12 = 0
			local var_234_13 = 0.4

			if var_234_12 < arg_231_1.time_ and arg_231_1.time_ <= var_234_12 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_14 = arg_231_1:FormatText(StoryNameCfg[28].name)

				arg_231_1.leftNameTxt_.text = var_234_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_15 = arg_231_1:GetWordFromCfg(116141055)
				local var_234_16 = arg_231_1:FormatText(var_234_15.content)

				arg_231_1.text_.text = var_234_16

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_17 = 16
				local var_234_18 = utf8.len(var_234_16)
				local var_234_19 = var_234_17 <= 0 and var_234_13 or var_234_13 * (var_234_18 / var_234_17)

				if var_234_19 > 0 and var_234_13 < var_234_19 then
					arg_231_1.talkMaxDuration = var_234_19

					if var_234_19 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_19 + var_234_12
					end
				end

				arg_231_1.text_.text = var_234_16
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141055", "story_v_out_116141.awb") ~= 0 then
					local var_234_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141055", "story_v_out_116141.awb") / 1000

					if var_234_20 + var_234_12 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_20 + var_234_12
					end

					if var_234_15.prefab_name ~= "" and arg_231_1.actors_[var_234_15.prefab_name] ~= nil then
						local var_234_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_15.prefab_name].transform, "story_v_out_116141", "116141055", "story_v_out_116141.awb")

						arg_231_1:RecordAudio("116141055", var_234_21)
						arg_231_1:RecordAudio("116141055", var_234_21)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_116141", "116141055", "story_v_out_116141.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_116141", "116141055", "story_v_out_116141.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_22 = math.max(var_234_13, arg_231_1.talkMaxDuration)

			if var_234_12 <= arg_231_1.time_ and arg_231_1.time_ < var_234_12 + var_234_22 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_12) / var_234_22

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_12 + var_234_22 and arg_231_1.time_ < var_234_12 + var_234_22 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play116141056 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 116141056
		arg_235_1.duration_ = 6.9

		local var_235_0 = {
			zh = 6.5,
			ja = 6.9
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
				arg_235_0:Play116141057(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1028ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1028ui_story == nil then
				arg_235_1.var_.characterEffect1028ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1028ui_story then
					arg_235_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1028ui_story then
				arg_235_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_238_4 = arg_235_1.actors_["1059ui_story"]
			local var_238_5 = 0

			if var_238_5 < arg_235_1.time_ and arg_235_1.time_ <= var_238_5 + arg_238_0 and arg_235_1.var_.characterEffect1059ui_story == nil then
				arg_235_1.var_.characterEffect1059ui_story = var_238_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_6 = 0.2

			if var_238_5 <= arg_235_1.time_ and arg_235_1.time_ < var_238_5 + var_238_6 then
				local var_238_7 = (arg_235_1.time_ - var_238_5) / var_238_6

				if arg_235_1.var_.characterEffect1059ui_story then
					local var_238_8 = Mathf.Lerp(0, 0.5, var_238_7)

					arg_235_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1059ui_story.fillRatio = var_238_8
				end
			end

			if arg_235_1.time_ >= var_238_5 + var_238_6 and arg_235_1.time_ < var_238_5 + var_238_6 + arg_238_0 and arg_235_1.var_.characterEffect1059ui_story then
				local var_238_9 = 0.5

				arg_235_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1059ui_story.fillRatio = var_238_9
			end

			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_238_11 = 0
			local var_238_12 = 0.5

			if var_238_11 < arg_235_1.time_ and arg_235_1.time_ <= var_238_11 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_13 = arg_235_1:FormatText(StoryNameCfg[327].name)

				arg_235_1.leftNameTxt_.text = var_238_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_14 = arg_235_1:GetWordFromCfg(116141056)
				local var_238_15 = arg_235_1:FormatText(var_238_14.content)

				arg_235_1.text_.text = var_238_15

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_16 = 20
				local var_238_17 = utf8.len(var_238_15)
				local var_238_18 = var_238_16 <= 0 and var_238_12 or var_238_12 * (var_238_17 / var_238_16)

				if var_238_18 > 0 and var_238_12 < var_238_18 then
					arg_235_1.talkMaxDuration = var_238_18

					if var_238_18 + var_238_11 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_18 + var_238_11
					end
				end

				arg_235_1.text_.text = var_238_15
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141056", "story_v_out_116141.awb") ~= 0 then
					local var_238_19 = manager.audio:GetVoiceLength("story_v_out_116141", "116141056", "story_v_out_116141.awb") / 1000

					if var_238_19 + var_238_11 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_19 + var_238_11
					end

					if var_238_14.prefab_name ~= "" and arg_235_1.actors_[var_238_14.prefab_name] ~= nil then
						local var_238_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_14.prefab_name].transform, "story_v_out_116141", "116141056", "story_v_out_116141.awb")

						arg_235_1:RecordAudio("116141056", var_238_20)
						arg_235_1:RecordAudio("116141056", var_238_20)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_116141", "116141056", "story_v_out_116141.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_116141", "116141056", "story_v_out_116141.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_21 = math.max(var_238_12, arg_235_1.talkMaxDuration)

			if var_238_11 <= arg_235_1.time_ and arg_235_1.time_ < var_238_11 + var_238_21 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_11) / var_238_21

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_11 + var_238_21 and arg_235_1.time_ < var_238_11 + var_238_21 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play116141057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 116141057
		arg_239_1.duration_ = 5.5

		local var_239_0 = {
			zh = 5.5,
			ja = 2.933
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
				arg_239_0:Play116141058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1028ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1028ui_story == nil then
				arg_239_1.var_.characterEffect1028ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1028ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1028ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1028ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1028ui_story.fillRatio = var_242_5
			end

			local var_242_6 = arg_239_1.actors_["1059ui_story"]
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 and arg_239_1.var_.characterEffect1059ui_story == nil then
				arg_239_1.var_.characterEffect1059ui_story = var_242_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_8 = 0.2

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8

				if arg_239_1.var_.characterEffect1059ui_story then
					arg_239_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 and arg_239_1.var_.characterEffect1059ui_story then
				arg_239_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 then
				arg_239_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action2_2")
			end

			local var_242_11 = 0

			if var_242_11 < arg_239_1.time_ and arg_239_1.time_ <= var_242_11 + arg_242_0 then
				arg_239_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_242_12 = 0
			local var_242_13 = 0.625

			if var_242_12 < arg_239_1.time_ and arg_239_1.time_ <= var_242_12 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_14 = arg_239_1:FormatText(StoryNameCfg[28].name)

				arg_239_1.leftNameTxt_.text = var_242_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_15 = arg_239_1:GetWordFromCfg(116141057)
				local var_242_16 = arg_239_1:FormatText(var_242_15.content)

				arg_239_1.text_.text = var_242_16

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_17 = 23
				local var_242_18 = utf8.len(var_242_16)
				local var_242_19 = var_242_17 <= 0 and var_242_13 or var_242_13 * (var_242_18 / var_242_17)

				if var_242_19 > 0 and var_242_13 < var_242_19 then
					arg_239_1.talkMaxDuration = var_242_19

					if var_242_19 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_19 + var_242_12
					end
				end

				arg_239_1.text_.text = var_242_16
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141057", "story_v_out_116141.awb") ~= 0 then
					local var_242_20 = manager.audio:GetVoiceLength("story_v_out_116141", "116141057", "story_v_out_116141.awb") / 1000

					if var_242_20 + var_242_12 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_20 + var_242_12
					end

					if var_242_15.prefab_name ~= "" and arg_239_1.actors_[var_242_15.prefab_name] ~= nil then
						local var_242_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_15.prefab_name].transform, "story_v_out_116141", "116141057", "story_v_out_116141.awb")

						arg_239_1:RecordAudio("116141057", var_242_21)
						arg_239_1:RecordAudio("116141057", var_242_21)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_116141", "116141057", "story_v_out_116141.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_116141", "116141057", "story_v_out_116141.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_22 = math.max(var_242_13, arg_239_1.talkMaxDuration)

			if var_242_12 <= arg_239_1.time_ and arg_239_1.time_ < var_242_12 + var_242_22 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_12) / var_242_22

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_12 + var_242_22 and arg_239_1.time_ < var_242_12 + var_242_22 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play116141058 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 116141058
		arg_243_1.duration_ = 7

		local var_243_0 = {
			zh = 7,
			ja = 5.233
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
				arg_243_0:Play116141059(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_246_1 = 0
			local var_246_2 = 1.025

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_3 = arg_243_1:FormatText(StoryNameCfg[28].name)

				arg_243_1.leftNameTxt_.text = var_246_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_4 = arg_243_1:GetWordFromCfg(116141058)
				local var_246_5 = arg_243_1:FormatText(var_246_4.content)

				arg_243_1.text_.text = var_246_5

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_6 = 40
				local var_246_7 = utf8.len(var_246_5)
				local var_246_8 = var_246_6 <= 0 and var_246_2 or var_246_2 * (var_246_7 / var_246_6)

				if var_246_8 > 0 and var_246_2 < var_246_8 then
					arg_243_1.talkMaxDuration = var_246_8

					if var_246_8 + var_246_1 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_1
					end
				end

				arg_243_1.text_.text = var_246_5
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141058", "story_v_out_116141.awb") ~= 0 then
					local var_246_9 = manager.audio:GetVoiceLength("story_v_out_116141", "116141058", "story_v_out_116141.awb") / 1000

					if var_246_9 + var_246_1 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_9 + var_246_1
					end

					if var_246_4.prefab_name ~= "" and arg_243_1.actors_[var_246_4.prefab_name] ~= nil then
						local var_246_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_4.prefab_name].transform, "story_v_out_116141", "116141058", "story_v_out_116141.awb")

						arg_243_1:RecordAudio("116141058", var_246_10)
						arg_243_1:RecordAudio("116141058", var_246_10)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_116141", "116141058", "story_v_out_116141.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_116141", "116141058", "story_v_out_116141.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_11 = math.max(var_246_2, arg_243_1.talkMaxDuration)

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_11 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_1) / var_246_11

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_1 + var_246_11 and arg_243_1.time_ < var_246_1 + var_246_11 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play116141059 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 116141059
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play116141060(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1028ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1028ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, 100, 0)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1028ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, 100, 0)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = arg_247_1.actors_["1059ui_story"].transform
			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1.var_.moveOldPos1059ui_story = var_250_9.localPosition
			end

			local var_250_11 = 0.001

			if var_250_10 <= arg_247_1.time_ and arg_247_1.time_ < var_250_10 + var_250_11 then
				local var_250_12 = (arg_247_1.time_ - var_250_10) / var_250_11
				local var_250_13 = Vector3.New(0, 100, 0)

				var_250_9.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1059ui_story, var_250_13, var_250_12)

				local var_250_14 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_14.x, var_250_14.y, var_250_14.z)

				local var_250_15 = var_250_9.localEulerAngles

				var_250_15.z = 0
				var_250_15.x = 0
				var_250_9.localEulerAngles = var_250_15
			end

			if arg_247_1.time_ >= var_250_10 + var_250_11 and arg_247_1.time_ < var_250_10 + var_250_11 + arg_250_0 then
				var_250_9.localPosition = Vector3.New(0, 100, 0)

				local var_250_16 = manager.ui.mainCamera.transform.position - var_250_9.position

				var_250_9.forward = Vector3.New(var_250_16.x, var_250_16.y, var_250_16.z)

				local var_250_17 = var_250_9.localEulerAngles

				var_250_17.z = 0
				var_250_17.x = 0
				var_250_9.localEulerAngles = var_250_17
			end

			local var_250_18 = 0
			local var_250_19 = 0.9

			if var_250_18 < arg_247_1.time_ and arg_247_1.time_ <= var_250_18 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_20 = arg_247_1:GetWordFromCfg(116141059)
				local var_250_21 = arg_247_1:FormatText(var_250_20.content)

				arg_247_1.text_.text = var_250_21

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_22 = 36
				local var_250_23 = utf8.len(var_250_21)
				local var_250_24 = var_250_22 <= 0 and var_250_19 or var_250_19 * (var_250_23 / var_250_22)

				if var_250_24 > 0 and var_250_19 < var_250_24 then
					arg_247_1.talkMaxDuration = var_250_24

					if var_250_24 + var_250_18 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_24 + var_250_18
					end
				end

				arg_247_1.text_.text = var_250_21
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_25 = math.max(var_250_19, arg_247_1.talkMaxDuration)

			if var_250_18 <= arg_247_1.time_ and arg_247_1.time_ < var_250_18 + var_250_25 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_18) / var_250_25

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_18 + var_250_25 and arg_247_1.time_ < var_250_18 + var_250_25 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play116141060 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 116141060
		arg_251_1.duration_ = 9.4

		local var_251_0 = {
			zh = 9.4,
			ja = 6.9
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
				arg_251_0:Play116141061(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1028ui_story"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.characterEffect1028ui_story == nil then
				arg_251_1.var_.characterEffect1028ui_story = var_254_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_2 = 0.2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.characterEffect1028ui_story then
					arg_251_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.characterEffect1028ui_story then
				arg_251_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_254_4 = 0

			if var_254_4 < arg_251_1.time_ and arg_251_1.time_ <= var_254_4 + arg_254_0 then
				arg_251_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_254_5 = 0

			if var_254_5 < arg_251_1.time_ and arg_251_1.time_ <= var_254_5 + arg_254_0 then
				arg_251_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_254_6 = arg_251_1.actors_["1028ui_story"].transform
			local var_254_7 = 0

			if var_254_7 < arg_251_1.time_ and arg_251_1.time_ <= var_254_7 + arg_254_0 then
				arg_251_1.var_.moveOldPos1028ui_story = var_254_6.localPosition

				local var_254_8 = "1028ui_story"

				arg_251_1:ShowWeapon(arg_251_1.var_[var_254_8 .. "Animator"].transform, false)
			end

			local var_254_9 = 0.001

			if var_254_7 <= arg_251_1.time_ and arg_251_1.time_ < var_254_7 + var_254_9 then
				local var_254_10 = (arg_251_1.time_ - var_254_7) / var_254_9
				local var_254_11 = Vector3.New(0, -0.9, -5.9)

				var_254_6.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1028ui_story, var_254_11, var_254_10)

				local var_254_12 = manager.ui.mainCamera.transform.position - var_254_6.position

				var_254_6.forward = Vector3.New(var_254_12.x, var_254_12.y, var_254_12.z)

				local var_254_13 = var_254_6.localEulerAngles

				var_254_13.z = 0
				var_254_13.x = 0
				var_254_6.localEulerAngles = var_254_13
			end

			if arg_251_1.time_ >= var_254_7 + var_254_9 and arg_251_1.time_ < var_254_7 + var_254_9 + arg_254_0 then
				var_254_6.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_254_14 = manager.ui.mainCamera.transform.position - var_254_6.position

				var_254_6.forward = Vector3.New(var_254_14.x, var_254_14.y, var_254_14.z)

				local var_254_15 = var_254_6.localEulerAngles

				var_254_15.z = 0
				var_254_15.x = 0
				var_254_6.localEulerAngles = var_254_15
			end

			local var_254_16 = 0
			local var_254_17 = 0.475

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_18 = arg_251_1:FormatText(StoryNameCfg[327].name)

				arg_251_1.leftNameTxt_.text = var_254_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_19 = arg_251_1:GetWordFromCfg(116141060)
				local var_254_20 = arg_251_1:FormatText(var_254_19.content)

				arg_251_1.text_.text = var_254_20

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_21 = 19
				local var_254_22 = utf8.len(var_254_20)
				local var_254_23 = var_254_21 <= 0 and var_254_17 or var_254_17 * (var_254_22 / var_254_21)

				if var_254_23 > 0 and var_254_17 < var_254_23 then
					arg_251_1.talkMaxDuration = var_254_23

					if var_254_23 + var_254_16 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_23 + var_254_16
					end
				end

				arg_251_1.text_.text = var_254_20
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141060", "story_v_out_116141.awb") ~= 0 then
					local var_254_24 = manager.audio:GetVoiceLength("story_v_out_116141", "116141060", "story_v_out_116141.awb") / 1000

					if var_254_24 + var_254_16 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_24 + var_254_16
					end

					if var_254_19.prefab_name ~= "" and arg_251_1.actors_[var_254_19.prefab_name] ~= nil then
						local var_254_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_19.prefab_name].transform, "story_v_out_116141", "116141060", "story_v_out_116141.awb")

						arg_251_1:RecordAudio("116141060", var_254_25)
						arg_251_1:RecordAudio("116141060", var_254_25)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_116141", "116141060", "story_v_out_116141.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_116141", "116141060", "story_v_out_116141.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_26 = math.max(var_254_17, arg_251_1.talkMaxDuration)

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_26 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_16) / var_254_26

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_16 + var_254_26 and arg_251_1.time_ < var_254_16 + var_254_26 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play116141061 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 116141061
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play116141062(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 1

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				local var_258_2 = "play"
				local var_258_3 = "effect"

				arg_255_1:AudioAction(var_258_2, var_258_3, "se_story_6", "se_story_6_purple_lightning_loop", "")
			end

			local var_258_4 = arg_255_1.actors_["1028ui_story"].transform
			local var_258_5 = 0

			if var_258_5 < arg_255_1.time_ and arg_255_1.time_ <= var_258_5 + arg_258_0 then
				arg_255_1.var_.moveOldPos1028ui_story = var_258_4.localPosition
			end

			local var_258_6 = 0.001

			if var_258_5 <= arg_255_1.time_ and arg_255_1.time_ < var_258_5 + var_258_6 then
				local var_258_7 = (arg_255_1.time_ - var_258_5) / var_258_6
				local var_258_8 = Vector3.New(0, 100, 0)

				var_258_4.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1028ui_story, var_258_8, var_258_7)

				local var_258_9 = manager.ui.mainCamera.transform.position - var_258_4.position

				var_258_4.forward = Vector3.New(var_258_9.x, var_258_9.y, var_258_9.z)

				local var_258_10 = var_258_4.localEulerAngles

				var_258_10.z = 0
				var_258_10.x = 0
				var_258_4.localEulerAngles = var_258_10
			end

			if arg_255_1.time_ >= var_258_5 + var_258_6 and arg_255_1.time_ < var_258_5 + var_258_6 + arg_258_0 then
				var_258_4.localPosition = Vector3.New(0, 100, 0)

				local var_258_11 = manager.ui.mainCamera.transform.position - var_258_4.position

				var_258_4.forward = Vector3.New(var_258_11.x, var_258_11.y, var_258_11.z)

				local var_258_12 = var_258_4.localEulerAngles

				var_258_12.z = 0
				var_258_12.x = 0
				var_258_4.localEulerAngles = var_258_12
			end

			local var_258_13 = 0
			local var_258_14 = 1.4

			if var_258_13 < arg_255_1.time_ and arg_255_1.time_ <= var_258_13 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_15 = arg_255_1:GetWordFromCfg(116141061)
				local var_258_16 = arg_255_1:FormatText(var_258_15.content)

				arg_255_1.text_.text = var_258_16

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_17 = 56
				local var_258_18 = utf8.len(var_258_16)
				local var_258_19 = var_258_17 <= 0 and var_258_14 or var_258_14 * (var_258_18 / var_258_17)

				if var_258_19 > 0 and var_258_14 < var_258_19 then
					arg_255_1.talkMaxDuration = var_258_19

					if var_258_19 + var_258_13 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_19 + var_258_13
					end
				end

				arg_255_1.text_.text = var_258_16
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_20 = math.max(var_258_14, arg_255_1.talkMaxDuration)

			if var_258_13 <= arg_255_1.time_ and arg_255_1.time_ < var_258_13 + var_258_20 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_13) / var_258_20

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_13 + var_258_20 and arg_255_1.time_ < var_258_13 + var_258_20 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play116141062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 116141062
		arg_259_1.duration_ = 8.2

		local var_259_0 = {
			zh = 6.033,
			ja = 8.2
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play116141063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1028ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1028ui_story == nil then
				arg_259_1.var_.characterEffect1028ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1028ui_story then
					arg_259_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1028ui_story then
				arg_259_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_262_4 = 0

			if var_262_4 < arg_259_1.time_ and arg_259_1.time_ <= var_262_4 + arg_262_0 then
				arg_259_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_262_5 = 0

			if var_262_5 < arg_259_1.time_ and arg_259_1.time_ <= var_262_5 + arg_262_0 then
				arg_259_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_262_6 = arg_259_1.actors_["1028ui_story"].transform
			local var_262_7 = 0

			if var_262_7 < arg_259_1.time_ and arg_259_1.time_ <= var_262_7 + arg_262_0 then
				arg_259_1.var_.moveOldPos1028ui_story = var_262_6.localPosition
			end

			local var_262_8 = 0.001

			if var_262_7 <= arg_259_1.time_ and arg_259_1.time_ < var_262_7 + var_262_8 then
				local var_262_9 = (arg_259_1.time_ - var_262_7) / var_262_8
				local var_262_10 = Vector3.New(0, -0.9, -5.9)

				var_262_6.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos1028ui_story, var_262_10, var_262_9)

				local var_262_11 = manager.ui.mainCamera.transform.position - var_262_6.position

				var_262_6.forward = Vector3.New(var_262_11.x, var_262_11.y, var_262_11.z)

				local var_262_12 = var_262_6.localEulerAngles

				var_262_12.z = 0
				var_262_12.x = 0
				var_262_6.localEulerAngles = var_262_12
			end

			if arg_259_1.time_ >= var_262_7 + var_262_8 and arg_259_1.time_ < var_262_7 + var_262_8 + arg_262_0 then
				var_262_6.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_262_13 = manager.ui.mainCamera.transform.position - var_262_6.position

				var_262_6.forward = Vector3.New(var_262_13.x, var_262_13.y, var_262_13.z)

				local var_262_14 = var_262_6.localEulerAngles

				var_262_14.z = 0
				var_262_14.x = 0
				var_262_6.localEulerAngles = var_262_14
			end

			local var_262_15 = 0
			local var_262_16 = 0.45

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_17 = arg_259_1:FormatText(StoryNameCfg[327].name)

				arg_259_1.leftNameTxt_.text = var_262_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_18 = arg_259_1:GetWordFromCfg(116141062)
				local var_262_19 = arg_259_1:FormatText(var_262_18.content)

				arg_259_1.text_.text = var_262_19

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_20 = 18
				local var_262_21 = utf8.len(var_262_19)
				local var_262_22 = var_262_20 <= 0 and var_262_16 or var_262_16 * (var_262_21 / var_262_20)

				if var_262_22 > 0 and var_262_16 < var_262_22 then
					arg_259_1.talkMaxDuration = var_262_22

					if var_262_22 + var_262_15 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_22 + var_262_15
					end
				end

				arg_259_1.text_.text = var_262_19
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141062", "story_v_out_116141.awb") ~= 0 then
					local var_262_23 = manager.audio:GetVoiceLength("story_v_out_116141", "116141062", "story_v_out_116141.awb") / 1000

					if var_262_23 + var_262_15 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_23 + var_262_15
					end

					if var_262_18.prefab_name ~= "" and arg_259_1.actors_[var_262_18.prefab_name] ~= nil then
						local var_262_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_18.prefab_name].transform, "story_v_out_116141", "116141062", "story_v_out_116141.awb")

						arg_259_1:RecordAudio("116141062", var_262_24)
						arg_259_1:RecordAudio("116141062", var_262_24)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_116141", "116141062", "story_v_out_116141.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_116141", "116141062", "story_v_out_116141.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_25 = math.max(var_262_16, arg_259_1.talkMaxDuration)

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_25 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_15) / var_262_25

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_15 + var_262_25 and arg_259_1.time_ < var_262_15 + var_262_25 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play116141063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 116141063
		arg_263_1.duration_ = 7.47

		local var_263_0 = {
			zh = 7.466,
			ja = 3.8
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
				arg_263_0:Play116141064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_266_1 = 0
			local var_266_2 = 0.725

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_3 = arg_263_1:FormatText(StoryNameCfg[327].name)

				arg_263_1.leftNameTxt_.text = var_266_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_4 = arg_263_1:GetWordFromCfg(116141063)
				local var_266_5 = arg_263_1:FormatText(var_266_4.content)

				arg_263_1.text_.text = var_266_5

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_6 = 29
				local var_266_7 = utf8.len(var_266_5)
				local var_266_8 = var_266_6 <= 0 and var_266_2 or var_266_2 * (var_266_7 / var_266_6)

				if var_266_8 > 0 and var_266_2 < var_266_8 then
					arg_263_1.talkMaxDuration = var_266_8

					if var_266_8 + var_266_1 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_8 + var_266_1
					end
				end

				arg_263_1.text_.text = var_266_5
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141063", "story_v_out_116141.awb") ~= 0 then
					local var_266_9 = manager.audio:GetVoiceLength("story_v_out_116141", "116141063", "story_v_out_116141.awb") / 1000

					if var_266_9 + var_266_1 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_9 + var_266_1
					end

					if var_266_4.prefab_name ~= "" and arg_263_1.actors_[var_266_4.prefab_name] ~= nil then
						local var_266_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_4.prefab_name].transform, "story_v_out_116141", "116141063", "story_v_out_116141.awb")

						arg_263_1:RecordAudio("116141063", var_266_10)
						arg_263_1:RecordAudio("116141063", var_266_10)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_116141", "116141063", "story_v_out_116141.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_116141", "116141063", "story_v_out_116141.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_11 = math.max(var_266_2, arg_263_1.talkMaxDuration)

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_11 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_1) / var_266_11

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_1 + var_266_11 and arg_263_1.time_ < var_266_1 + var_266_11 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play116141064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 116141064
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play116141065(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1028ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1028ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1028ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, 100, 0)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = 0
			local var_270_10 = 1.15

			if var_270_9 < arg_267_1.time_ and arg_267_1.time_ <= var_270_9 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_11 = arg_267_1:GetWordFromCfg(116141064)
				local var_270_12 = arg_267_1:FormatText(var_270_11.content)

				arg_267_1.text_.text = var_270_12

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_13 = 47
				local var_270_14 = utf8.len(var_270_12)
				local var_270_15 = var_270_13 <= 0 and var_270_10 or var_270_10 * (var_270_14 / var_270_13)

				if var_270_15 > 0 and var_270_10 < var_270_15 then
					arg_267_1.talkMaxDuration = var_270_15

					if var_270_15 + var_270_9 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_15 + var_270_9
					end
				end

				arg_267_1.text_.text = var_270_12
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_16 = math.max(var_270_10, arg_267_1.talkMaxDuration)

			if var_270_9 <= arg_267_1.time_ and arg_267_1.time_ < var_270_9 + var_270_16 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_9) / var_270_16

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_9 + var_270_16 and arg_267_1.time_ < var_270_9 + var_270_16 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play116141065 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 116141065
		arg_271_1.duration_ = 9.53

		local var_271_0 = {
			zh = 7.333,
			ja = 9.533
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
			arg_271_1.auto_ = false
		end

		function arg_271_1.playNext_(arg_273_0)
			arg_271_1.onStoryFinished_()
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1028ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story == nil then
				arg_271_1.var_.characterEffect1028ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.2

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1028ui_story then
					local var_274_4 = Mathf.Lerp(0, 0.5, var_274_3)

					arg_271_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1028ui_story.fillRatio = var_274_4
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1028ui_story then
				local var_274_5 = 0.5

				arg_271_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1028ui_story.fillRatio = var_274_5
			end

			local var_274_6 = arg_271_1.actors_["1059ui_story"]
			local var_274_7 = 0

			if var_274_7 < arg_271_1.time_ and arg_271_1.time_ <= var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect1059ui_story == nil then
				arg_271_1.var_.characterEffect1059ui_story = var_274_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_8 = 0.2

			if var_274_7 <= arg_271_1.time_ and arg_271_1.time_ < var_274_7 + var_274_8 then
				local var_274_9 = (arg_271_1.time_ - var_274_7) / var_274_8

				if arg_271_1.var_.characterEffect1059ui_story then
					arg_271_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_7 + var_274_8 and arg_271_1.time_ < var_274_7 + var_274_8 + arg_274_0 and arg_271_1.var_.characterEffect1059ui_story then
				arg_271_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_274_11 = 0

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_274_12 = arg_271_1.actors_["1059ui_story"].transform
			local var_274_13 = 0

			if var_274_13 < arg_271_1.time_ and arg_271_1.time_ <= var_274_13 + arg_274_0 then
				arg_271_1.var_.moveOldPos1059ui_story = var_274_12.localPosition
			end

			local var_274_14 = 0.001

			if var_274_13 <= arg_271_1.time_ and arg_271_1.time_ < var_274_13 + var_274_14 then
				local var_274_15 = (arg_271_1.time_ - var_274_13) / var_274_14
				local var_274_16 = Vector3.New(0, -1.05, -6)

				var_274_12.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1059ui_story, var_274_16, var_274_15)

				local var_274_17 = manager.ui.mainCamera.transform.position - var_274_12.position

				var_274_12.forward = Vector3.New(var_274_17.x, var_274_17.y, var_274_17.z)

				local var_274_18 = var_274_12.localEulerAngles

				var_274_18.z = 0
				var_274_18.x = 0
				var_274_12.localEulerAngles = var_274_18
			end

			if arg_271_1.time_ >= var_274_13 + var_274_14 and arg_271_1.time_ < var_274_13 + var_274_14 + arg_274_0 then
				var_274_12.localPosition = Vector3.New(0, -1.05, -6)

				local var_274_19 = manager.ui.mainCamera.transform.position - var_274_12.position

				var_274_12.forward = Vector3.New(var_274_19.x, var_274_19.y, var_274_19.z)

				local var_274_20 = var_274_12.localEulerAngles

				var_274_20.z = 0
				var_274_20.x = 0
				var_274_12.localEulerAngles = var_274_20
			end

			local var_274_21 = 0
			local var_274_22 = 0.825

			if var_274_21 < arg_271_1.time_ and arg_271_1.time_ <= var_274_21 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_23 = arg_271_1:FormatText(StoryNameCfg[28].name)

				arg_271_1.leftNameTxt_.text = var_274_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_24 = arg_271_1:GetWordFromCfg(116141065)
				local var_274_25 = arg_271_1:FormatText(var_274_24.content)

				arg_271_1.text_.text = var_274_25

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_26 = 33
				local var_274_27 = utf8.len(var_274_25)
				local var_274_28 = var_274_26 <= 0 and var_274_22 or var_274_22 * (var_274_27 / var_274_26)

				if var_274_28 > 0 and var_274_22 < var_274_28 then
					arg_271_1.talkMaxDuration = var_274_28

					if var_274_28 + var_274_21 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_28 + var_274_21
					end
				end

				arg_271_1.text_.text = var_274_25
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_116141", "116141065", "story_v_out_116141.awb") ~= 0 then
					local var_274_29 = manager.audio:GetVoiceLength("story_v_out_116141", "116141065", "story_v_out_116141.awb") / 1000

					if var_274_29 + var_274_21 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_29 + var_274_21
					end

					if var_274_24.prefab_name ~= "" and arg_271_1.actors_[var_274_24.prefab_name] ~= nil then
						local var_274_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_24.prefab_name].transform, "story_v_out_116141", "116141065", "story_v_out_116141.awb")

						arg_271_1:RecordAudio("116141065", var_274_30)
						arg_271_1:RecordAudio("116141065", var_274_30)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_116141", "116141065", "story_v_out_116141.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_116141", "116141065", "story_v_out_116141.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_31 = math.max(var_274_22, arg_271_1.talkMaxDuration)

			if var_274_21 <= arg_271_1.time_ and arg_271_1.time_ < var_274_21 + var_274_31 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_21) / var_274_31

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_21 + var_274_31 and arg_271_1.time_ < var_274_21 + var_274_31 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST07b",
		"SofdecAsset/story/story_101161201.usm",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite"
	},
	voices = {
		"story_v_out_116141.awb"
	},
	skipMarkers = {
		116141001
	}
}
