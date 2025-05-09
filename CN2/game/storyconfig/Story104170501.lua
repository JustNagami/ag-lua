﻿return {
	Play417051001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 417051001
		arg_1_1.duration_ = 8.4

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play417051002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "I02f"

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
				local var_4_5 = arg_1_1.bgs_.I02f

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
					if iter_4_0 ~= "I02f" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 5.4
			local var_4_17 = 1

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				local var_4_18 = "play"
				local var_4_19 = "effect"

				arg_1_1:AudioAction(var_4_18, var_4_19, "se_story_16", "se_story_16_channel", "")
			end

			local var_4_20 = 0
			local var_4_21 = 0.2

			if var_4_20 < arg_1_1.time_ and arg_1_1.time_ <= var_4_20 + arg_4_0 then
				local var_4_22 = "play"
				local var_4_23 = "music"

				arg_1_1:AudioAction(var_4_22, var_4_23, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_24 = ""
				local var_4_25 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_25 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_25 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_25

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_25
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

			local var_4_26 = 0.466666666666667
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_3_10_story_scheme_2", "bgm_activity_3_10_story_scheme_2", "bgm_activity_3_10_story_scheme_2.awb")

				local var_4_30 = ""
				local var_4_31 = manager.audio:GetAudioName("bgm_activity_3_10_story_scheme_2", "bgm_activity_3_10_story_scheme_2")

				if var_4_31 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_31 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_31

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_31
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

			local var_4_32 = 0
			local var_4_33 = 3
			local var_4_34 = "I02f"

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.timestampController_:SetSelectedState("show")
				arg_1_1.timestampAni_:Play("in")

				arg_1_1.timeTicketbgImg_.sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_34)

				arg_1_1.timestampColorController_:SetSelectedState("cold")

				local var_4_35 = arg_1_1:GetWordFromCfg(501017)
				local var_4_36 = arg_1_1:FormatText(var_4_35.content)

				arg_1_1.text_timeText_.text = var_4_36

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_timeText_)

				local var_4_37 = arg_1_1:GetWordFromCfg(501018)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_siteText_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_siteText_)
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				AnimatorTools.PlayAnimationWithCallback(arg_1_1.timestampAni_, "out", function()
					arg_1_1.timestampController_:SetSelectedState("hide")
				end)
			end

			local var_4_39 = 3

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_40 = 1.2

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_39) / var_4_40
				local var_4_42 = Color.New(0, 0, 0)

				var_4_42.a = Mathf.Lerp(0, 1, var_4_41)
				arg_1_1.mask_.color = var_4_42
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				local var_4_43 = Color.New(0, 0, 0)

				var_4_43.a = 1
				arg_1_1.mask_.color = var_4_43
			end

			local var_4_44 = 4.2

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_45 = 1.2

			if var_4_44 <= arg_1_1.time_ and arg_1_1.time_ < var_4_44 + var_4_45 then
				local var_4_46 = (arg_1_1.time_ - var_4_44) / var_4_45
				local var_4_47 = Color.New(0, 0, 0)

				var_4_47.a = Mathf.Lerp(1, 0, var_4_46)
				arg_1_1.mask_.color = var_4_47
			end

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 then
				local var_4_48 = Color.New(0, 0, 0)
				local var_4_49 = 0

				arg_1_1.mask_.enabled = false
				var_4_48.a = var_4_49
				arg_1_1.mask_.color = var_4_48
			end

			local var_4_50 = 0

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_51 = 1

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				local var_4_52 = (arg_1_1.time_ - var_4_50) / var_4_51
				local var_4_53 = Color.New(0, 0, 0)

				var_4_53.a = Mathf.Lerp(1, 0, var_4_52)
				arg_1_1.mask_.color = var_4_53
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				local var_4_54 = Color.New(0, 0, 0)
				local var_4_55 = 0

				arg_1_1.mask_.enabled = false
				var_4_54.a = var_4_55
				arg_1_1.mask_.color = var_4_54
			end

			local var_4_56 = 0

			if var_4_56 < arg_1_1.time_ and arg_1_1.time_ <= var_4_56 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_57 = 3

			if arg_1_1.time_ >= var_4_56 + var_4_57 and arg_1_1.time_ < var_4_56 + var_4_57 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_58 = 5.4
			local var_4_59 = 0.25

			if var_4_58 < arg_1_1.time_ and arg_1_1.time_ <= var_4_58 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_60 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_60:setOnUpdate(LuaHelper.FloatAction(function(arg_8_0)
					arg_1_1.dialogCg_.alpha = arg_8_0
				end))
				var_4_60:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_60:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_61 = arg_1_1:FormatText(StoryNameCfg[1113].name)

				arg_1_1.leftNameTxt_.text = var_4_61

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_1_1.callingController_:SetSelectedState("calling")

				arg_1_1.keyicon_.color = Color.New(1, 1, 1)
				arg_1_1.icon_.color = Color.New(1, 1, 1)

				local var_4_62 = arg_1_1:GetWordFromCfg(417051001)
				local var_4_63 = arg_1_1:FormatText(var_4_62.content)

				arg_1_1.text_.text = var_4_63

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_64 = 10
				local var_4_65 = utf8.len(var_4_63)
				local var_4_66 = var_4_64 <= 0 and var_4_59 or var_4_59 * (var_4_65 / var_4_64)

				if var_4_66 > 0 and var_4_59 < var_4_66 then
					arg_1_1.talkMaxDuration = var_4_66
					var_4_58 = var_4_58 + 0.3

					if var_4_66 + var_4_58 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_66 + var_4_58
					end
				end

				arg_1_1.text_.text = var_4_63
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051001", "story_v_out_417051.awb") ~= 0 then
					local var_4_67 = manager.audio:GetVoiceLength("story_v_out_417051", "417051001", "story_v_out_417051.awb") / 1000

					if var_4_67 + var_4_58 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_67 + var_4_58
					end

					if var_4_62.prefab_name ~= "" and arg_1_1.actors_[var_4_62.prefab_name] ~= nil then
						local var_4_68 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_62.prefab_name].transform, "story_v_out_417051", "417051001", "story_v_out_417051.awb")

						arg_1_1:RecordAudio("417051001", var_4_68)
						arg_1_1:RecordAudio("417051001", var_4_68)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_417051", "417051001", "story_v_out_417051.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_417051", "417051001", "story_v_out_417051.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_69 = var_4_58 + 0.3
			local var_4_70 = math.max(var_4_59, arg_1_1.talkMaxDuration)

			if var_4_69 <= arg_1_1.time_ and arg_1_1.time_ < var_4_69 + var_4_70 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_69) / var_4_70

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_69 + var_4_70 and arg_1_1.time_ < var_4_69 + var_4_70 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play417051002 = function(arg_10_0, arg_10_1)
		arg_10_1.time_ = 0
		arg_10_1.frameCnt_ = 0
		arg_10_1.state_ = "playing"
		arg_10_1.curTalkId_ = 417051002
		arg_10_1.duration_ = 1.6

		local var_10_0 = {
			zh = 1.533,
			ja = 1.6
		}
		local var_10_1 = manager.audio:GetLocalizationFlag()

		if var_10_0[var_10_1] ~= nil then
			arg_10_1.duration_ = var_10_0[var_10_1]
		end

		SetActive(arg_10_1.tipsGo_, false)

		function arg_10_1.onSingleLineFinish_()
			arg_10_1.onSingleLineUpdate_ = nil
			arg_10_1.onSingleLineFinish_ = nil
			arg_10_1.state_ = "waiting"
		end

		function arg_10_1.playNext_(arg_12_0)
			if arg_12_0 == 1 then
				arg_10_0:Play417051003(arg_10_1)
			end
		end

		function arg_10_1.onSingleLineUpdate_(arg_13_0)
			local var_13_0 = 0
			local var_13_1 = 0.15

			if var_13_0 < arg_10_1.time_ and arg_10_1.time_ <= var_13_0 + arg_13_0 then
				arg_10_1.talkMaxDuration = 0
				arg_10_1.dialogCg_.alpha = 1

				arg_10_1.dialog_:SetActive(true)
				SetActive(arg_10_1.leftNameGo_, true)

				local var_13_2 = arg_10_1:FormatText(StoryNameCfg[1109].name)

				arg_10_1.leftNameTxt_.text = var_13_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_10_1.leftNameTxt_.transform)

				arg_10_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_10_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_10_1:RecordName(arg_10_1.leftNameTxt_.text)
				SetActive(arg_10_1.iconTrs_.gameObject, true)
				arg_10_1.iconController_:SetSelectedState("hero")

				arg_10_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1034_split_1")

				arg_10_1.callingController_:SetSelectedState("normal")

				arg_10_1.keyicon_.color = Color.New(1, 1, 1)
				arg_10_1.icon_.color = Color.New(1, 1, 1)

				local var_13_3 = arg_10_1:GetWordFromCfg(417051002)
				local var_13_4 = arg_10_1:FormatText(var_13_3.content)

				arg_10_1.text_.text = var_13_4

				LuaForUtil.ClearLinePrefixSymbol(arg_10_1.text_)

				local var_13_5 = 6
				local var_13_6 = utf8.len(var_13_4)
				local var_13_7 = var_13_5 <= 0 and var_13_1 or var_13_1 * (var_13_6 / var_13_5)

				if var_13_7 > 0 and var_13_1 < var_13_7 then
					arg_10_1.talkMaxDuration = var_13_7

					if var_13_7 + var_13_0 > arg_10_1.duration_ then
						arg_10_1.duration_ = var_13_7 + var_13_0
					end
				end

				arg_10_1.text_.text = var_13_4
				arg_10_1.typewritter.percent = 0

				arg_10_1.typewritter:SetDirty()
				arg_10_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051002", "story_v_out_417051.awb") ~= 0 then
					local var_13_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051002", "story_v_out_417051.awb") / 1000

					if var_13_8 + var_13_0 > arg_10_1.duration_ then
						arg_10_1.duration_ = var_13_8 + var_13_0
					end

					if var_13_3.prefab_name ~= "" and arg_10_1.actors_[var_13_3.prefab_name] ~= nil then
						local var_13_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_10_1.actors_[var_13_3.prefab_name].transform, "story_v_out_417051", "417051002", "story_v_out_417051.awb")

						arg_10_1:RecordAudio("417051002", var_13_9)
						arg_10_1:RecordAudio("417051002", var_13_9)
					else
						arg_10_1:AudioAction("play", "voice", "story_v_out_417051", "417051002", "story_v_out_417051.awb")
					end

					arg_10_1:RecordHistoryTalkVoice("story_v_out_417051", "417051002", "story_v_out_417051.awb")
				end

				arg_10_1:RecordContent(arg_10_1.text_.text)
			end

			local var_13_10 = math.max(var_13_1, arg_10_1.talkMaxDuration)

			if var_13_0 <= arg_10_1.time_ and arg_10_1.time_ < var_13_0 + var_13_10 then
				arg_10_1.typewritter.percent = (arg_10_1.time_ - var_13_0) / var_13_10

				arg_10_1.typewritter:SetDirty()
			end

			if arg_10_1.time_ >= var_13_0 + var_13_10 and arg_10_1.time_ < var_13_0 + var_13_10 + arg_13_0 then
				arg_10_1.typewritter.percent = 1

				arg_10_1.typewritter:SetDirty()
				arg_10_1:ShowNextGo(true)
			end
		end
	end,
	Play417051003 = function(arg_14_0, arg_14_1)
		arg_14_1.time_ = 0
		arg_14_1.frameCnt_ = 0
		arg_14_1.state_ = "playing"
		arg_14_1.curTalkId_ = 417051003
		arg_14_1.duration_ = 5

		SetActive(arg_14_1.tipsGo_, false)

		function arg_14_1.onSingleLineFinish_()
			arg_14_1.onSingleLineUpdate_ = nil
			arg_14_1.onSingleLineFinish_ = nil
			arg_14_1.state_ = "waiting"
		end

		function arg_14_1.playNext_(arg_16_0)
			if arg_16_0 == 1 then
				arg_14_0:Play417051004(arg_14_1)
			end
		end

		function arg_14_1.onSingleLineUpdate_(arg_17_0)
			local var_17_0 = 0
			local var_17_1 = 1.325

			if var_17_0 < arg_14_1.time_ and arg_14_1.time_ <= var_17_0 + arg_17_0 then
				arg_14_1.talkMaxDuration = 0
				arg_14_1.dialogCg_.alpha = 1

				arg_14_1.dialog_:SetActive(true)
				SetActive(arg_14_1.leftNameGo_, false)

				arg_14_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_14_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_14_1:RecordName(arg_14_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_14_1.iconTrs_.gameObject, false)
				arg_14_1.callingController_:SetSelectedState("normal")

				local var_17_2 = arg_14_1:GetWordFromCfg(417051003)
				local var_17_3 = arg_14_1:FormatText(var_17_2.content)

				arg_14_1.text_.text = var_17_3

				LuaForUtil.ClearLinePrefixSymbol(arg_14_1.text_)

				local var_17_4 = 53
				local var_17_5 = utf8.len(var_17_3)
				local var_17_6 = var_17_4 <= 0 and var_17_1 or var_17_1 * (var_17_5 / var_17_4)

				if var_17_6 > 0 and var_17_1 < var_17_6 then
					arg_14_1.talkMaxDuration = var_17_6

					if var_17_6 + var_17_0 > arg_14_1.duration_ then
						arg_14_1.duration_ = var_17_6 + var_17_0
					end
				end

				arg_14_1.text_.text = var_17_3
				arg_14_1.typewritter.percent = 0

				arg_14_1.typewritter:SetDirty()
				arg_14_1:ShowNextGo(false)
				arg_14_1:RecordContent(arg_14_1.text_.text)
			end

			local var_17_7 = math.max(var_17_1, arg_14_1.talkMaxDuration)

			if var_17_0 <= arg_14_1.time_ and arg_14_1.time_ < var_17_0 + var_17_7 then
				arg_14_1.typewritter.percent = (arg_14_1.time_ - var_17_0) / var_17_7

				arg_14_1.typewritter:SetDirty()
			end

			if arg_14_1.time_ >= var_17_0 + var_17_7 and arg_14_1.time_ < var_17_0 + var_17_7 + arg_17_0 then
				arg_14_1.typewritter.percent = 1

				arg_14_1.typewritter:SetDirty()
				arg_14_1:ShowNextGo(true)
			end
		end
	end,
	Play417051004 = function(arg_18_0, arg_18_1)
		arg_18_1.time_ = 0
		arg_18_1.frameCnt_ = 0
		arg_18_1.state_ = "playing"
		arg_18_1.curTalkId_ = 417051004
		arg_18_1.duration_ = 7.27

		local var_18_0 = {
			zh = 5.866,
			ja = 7.266
		}
		local var_18_1 = manager.audio:GetLocalizationFlag()

		if var_18_0[var_18_1] ~= nil then
			arg_18_1.duration_ = var_18_0[var_18_1]
		end

		SetActive(arg_18_1.tipsGo_, false)

		function arg_18_1.onSingleLineFinish_()
			arg_18_1.onSingleLineUpdate_ = nil
			arg_18_1.onSingleLineFinish_ = nil
			arg_18_1.state_ = "waiting"
		end

		function arg_18_1.playNext_(arg_20_0)
			if arg_20_0 == 1 then
				arg_18_0:Play417051005(arg_18_1)
			end
		end

		function arg_18_1.onSingleLineUpdate_(arg_21_0)
			local var_21_0 = "1034"

			if arg_18_1.actors_[var_21_0] == nil then
				local var_21_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1034")

				if not isNil(var_21_1) then
					local var_21_2 = Object.Instantiate(var_21_1, arg_18_1.canvasGo_.transform)

					var_21_2.transform:SetSiblingIndex(1)

					var_21_2.name = var_21_0
					var_21_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_18_1.actors_[var_21_0] = var_21_2

					local var_21_3 = var_21_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_18_1.isInRecall_ then
						for iter_21_0, iter_21_1 in ipairs(var_21_3) do
							iter_21_1.color = arg_18_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_21_4 = arg_18_1.actors_["1034"]
			local var_21_5 = 0

			if var_21_5 < arg_18_1.time_ and arg_18_1.time_ <= var_21_5 + arg_21_0 and not isNil(var_21_4) and arg_18_1.var_.actorSpriteComps1034 == nil then
				arg_18_1.var_.actorSpriteComps1034 = var_21_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_21_6 = 0.2

			if var_21_5 <= arg_18_1.time_ and arg_18_1.time_ < var_21_5 + var_21_6 and not isNil(var_21_4) then
				local var_21_7 = (arg_18_1.time_ - var_21_5) / var_21_6

				if arg_18_1.var_.actorSpriteComps1034 then
					for iter_21_2, iter_21_3 in pairs(arg_18_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_21_3 then
							if arg_18_1.isInRecall_ then
								local var_21_8 = Mathf.Lerp(iter_21_3.color.r, arg_18_1.hightColor1.r, var_21_7)
								local var_21_9 = Mathf.Lerp(iter_21_3.color.g, arg_18_1.hightColor1.g, var_21_7)
								local var_21_10 = Mathf.Lerp(iter_21_3.color.b, arg_18_1.hightColor1.b, var_21_7)

								iter_21_3.color = Color.New(var_21_8, var_21_9, var_21_10)
							else
								local var_21_11 = Mathf.Lerp(iter_21_3.color.r, 1, var_21_7)

								iter_21_3.color = Color.New(var_21_11, var_21_11, var_21_11)
							end
						end
					end
				end
			end

			if arg_18_1.time_ >= var_21_5 + var_21_6 and arg_18_1.time_ < var_21_5 + var_21_6 + arg_21_0 and not isNil(var_21_4) and arg_18_1.var_.actorSpriteComps1034 then
				for iter_21_4, iter_21_5 in pairs(arg_18_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_21_5 then
						if arg_18_1.isInRecall_ then
							iter_21_5.color = arg_18_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_21_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_18_1.var_.actorSpriteComps1034 = nil
			end

			local var_21_12 = arg_18_1.actors_["1034"].transform
			local var_21_13 = 0

			if var_21_13 < arg_18_1.time_ and arg_18_1.time_ <= var_21_13 + arg_21_0 then
				arg_18_1.var_.moveOldPos1034 = var_21_12.localPosition
				var_21_12.localScale = Vector3.New(1, 1, 1)

				arg_18_1:CheckSpriteTmpPos("1034", 3)

				local var_21_14 = var_21_12.childCount

				for iter_21_6 = 0, var_21_14 - 1 do
					local var_21_15 = var_21_12:GetChild(iter_21_6)

					if var_21_15.name == "" or not string.find(var_21_15.name, "split") then
						var_21_15.gameObject:SetActive(true)
					else
						var_21_15.gameObject:SetActive(false)
					end
				end
			end

			local var_21_16 = 0.001

			if var_21_13 <= arg_18_1.time_ and arg_18_1.time_ < var_21_13 + var_21_16 then
				local var_21_17 = (arg_18_1.time_ - var_21_13) / var_21_16
				local var_21_18 = Vector3.New(0, -331.9, -324)

				var_21_12.localPosition = Vector3.Lerp(arg_18_1.var_.moveOldPos1034, var_21_18, var_21_17)
			end

			if arg_18_1.time_ >= var_21_13 + var_21_16 and arg_18_1.time_ < var_21_13 + var_21_16 + arg_21_0 then
				var_21_12.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_21_19 = 0
			local var_21_20 = 0.65

			if var_21_19 < arg_18_1.time_ and arg_18_1.time_ <= var_21_19 + arg_21_0 then
				arg_18_1.talkMaxDuration = 0
				arg_18_1.dialogCg_.alpha = 1

				arg_18_1.dialog_:SetActive(true)
				SetActive(arg_18_1.leftNameGo_, true)

				local var_21_21 = arg_18_1:FormatText(StoryNameCfg[1109].name)

				arg_18_1.leftNameTxt_.text = var_21_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_18_1.leftNameTxt_.transform)

				arg_18_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_18_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_18_1:RecordName(arg_18_1.leftNameTxt_.text)
				SetActive(arg_18_1.iconTrs_.gameObject, false)
				arg_18_1.callingController_:SetSelectedState("normal")

				local var_21_22 = arg_18_1:GetWordFromCfg(417051004)
				local var_21_23 = arg_18_1:FormatText(var_21_22.content)

				arg_18_1.text_.text = var_21_23

				LuaForUtil.ClearLinePrefixSymbol(arg_18_1.text_)

				local var_21_24 = 26
				local var_21_25 = utf8.len(var_21_23)
				local var_21_26 = var_21_24 <= 0 and var_21_20 or var_21_20 * (var_21_25 / var_21_24)

				if var_21_26 > 0 and var_21_20 < var_21_26 then
					arg_18_1.talkMaxDuration = var_21_26

					if var_21_26 + var_21_19 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_26 + var_21_19
					end
				end

				arg_18_1.text_.text = var_21_23
				arg_18_1.typewritter.percent = 0

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051004", "story_v_out_417051.awb") ~= 0 then
					local var_21_27 = manager.audio:GetVoiceLength("story_v_out_417051", "417051004", "story_v_out_417051.awb") / 1000

					if var_21_27 + var_21_19 > arg_18_1.duration_ then
						arg_18_1.duration_ = var_21_27 + var_21_19
					end

					if var_21_22.prefab_name ~= "" and arg_18_1.actors_[var_21_22.prefab_name] ~= nil then
						local var_21_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_18_1.actors_[var_21_22.prefab_name].transform, "story_v_out_417051", "417051004", "story_v_out_417051.awb")

						arg_18_1:RecordAudio("417051004", var_21_28)
						arg_18_1:RecordAudio("417051004", var_21_28)
					else
						arg_18_1:AudioAction("play", "voice", "story_v_out_417051", "417051004", "story_v_out_417051.awb")
					end

					arg_18_1:RecordHistoryTalkVoice("story_v_out_417051", "417051004", "story_v_out_417051.awb")
				end

				arg_18_1:RecordContent(arg_18_1.text_.text)
			end

			local var_21_29 = math.max(var_21_20, arg_18_1.talkMaxDuration)

			if var_21_19 <= arg_18_1.time_ and arg_18_1.time_ < var_21_19 + var_21_29 then
				arg_18_1.typewritter.percent = (arg_18_1.time_ - var_21_19) / var_21_29

				arg_18_1.typewritter:SetDirty()
			end

			if arg_18_1.time_ >= var_21_19 + var_21_29 and arg_18_1.time_ < var_21_19 + var_21_29 + arg_21_0 then
				arg_18_1.typewritter.percent = 1

				arg_18_1.typewritter:SetDirty()
				arg_18_1:ShowNextGo(true)
			end
		end
	end,
	Play417051005 = function(arg_22_0, arg_22_1)
		arg_22_1.time_ = 0
		arg_22_1.frameCnt_ = 0
		arg_22_1.state_ = "playing"
		arg_22_1.curTalkId_ = 417051005
		arg_22_1.duration_ = 2.9

		local var_22_0 = {
			zh = 1.8,
			ja = 2.9
		}
		local var_22_1 = manager.audio:GetLocalizationFlag()

		if var_22_0[var_22_1] ~= nil then
			arg_22_1.duration_ = var_22_0[var_22_1]
		end

		SetActive(arg_22_1.tipsGo_, false)

		function arg_22_1.onSingleLineFinish_()
			arg_22_1.onSingleLineUpdate_ = nil
			arg_22_1.onSingleLineFinish_ = nil
			arg_22_1.state_ = "waiting"
		end

		function arg_22_1.playNext_(arg_24_0)
			if arg_24_0 == 1 then
				arg_22_0:Play417051006(arg_22_1)
			end
		end

		function arg_22_1.onSingleLineUpdate_(arg_25_0)
			local var_25_0 = arg_22_1.actors_["1034"]
			local var_25_1 = 0

			if var_25_1 < arg_22_1.time_ and arg_22_1.time_ <= var_25_1 + arg_25_0 and not isNil(var_25_0) and arg_22_1.var_.actorSpriteComps1034 == nil then
				arg_22_1.var_.actorSpriteComps1034 = var_25_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_25_2 = 0.2

			if var_25_1 <= arg_22_1.time_ and arg_22_1.time_ < var_25_1 + var_25_2 and not isNil(var_25_0) then
				local var_25_3 = (arg_22_1.time_ - var_25_1) / var_25_2

				if arg_22_1.var_.actorSpriteComps1034 then
					for iter_25_0, iter_25_1 in pairs(arg_22_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_25_1 then
							if arg_22_1.isInRecall_ then
								local var_25_4 = Mathf.Lerp(iter_25_1.color.r, arg_22_1.hightColor2.r, var_25_3)
								local var_25_5 = Mathf.Lerp(iter_25_1.color.g, arg_22_1.hightColor2.g, var_25_3)
								local var_25_6 = Mathf.Lerp(iter_25_1.color.b, arg_22_1.hightColor2.b, var_25_3)

								iter_25_1.color = Color.New(var_25_4, var_25_5, var_25_6)
							else
								local var_25_7 = Mathf.Lerp(iter_25_1.color.r, 0.5, var_25_3)

								iter_25_1.color = Color.New(var_25_7, var_25_7, var_25_7)
							end
						end
					end
				end
			end

			if arg_22_1.time_ >= var_25_1 + var_25_2 and arg_22_1.time_ < var_25_1 + var_25_2 + arg_25_0 and not isNil(var_25_0) and arg_22_1.var_.actorSpriteComps1034 then
				for iter_25_2, iter_25_3 in pairs(arg_22_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_25_3 then
						if arg_22_1.isInRecall_ then
							iter_25_3.color = arg_22_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_25_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_22_1.var_.actorSpriteComps1034 = nil
			end

			local var_25_8 = 0
			local var_25_9 = 0.2

			if var_25_8 < arg_22_1.time_ and arg_22_1.time_ <= var_25_8 + arg_25_0 then
				arg_22_1.talkMaxDuration = 0
				arg_22_1.dialogCg_.alpha = 1

				arg_22_1.dialog_:SetActive(true)
				SetActive(arg_22_1.leftNameGo_, true)

				local var_25_10 = arg_22_1:FormatText(StoryNameCfg[1113].name)

				arg_22_1.leftNameTxt_.text = var_25_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_22_1.leftNameTxt_.transform)

				arg_22_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_22_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_22_1:RecordName(arg_22_1.leftNameTxt_.text)
				SetActive(arg_22_1.iconTrs_.gameObject, true)
				arg_22_1.iconController_:SetSelectedState("hero")

				arg_22_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_22_1.callingController_:SetSelectedState("calling")

				arg_22_1.keyicon_.color = Color.New(1, 1, 1)
				arg_22_1.icon_.color = Color.New(1, 1, 1)

				local var_25_11 = arg_22_1:GetWordFromCfg(417051005)
				local var_25_12 = arg_22_1:FormatText(var_25_11.content)

				arg_22_1.text_.text = var_25_12

				LuaForUtil.ClearLinePrefixSymbol(arg_22_1.text_)

				local var_25_13 = 8
				local var_25_14 = utf8.len(var_25_12)
				local var_25_15 = var_25_13 <= 0 and var_25_9 or var_25_9 * (var_25_14 / var_25_13)

				if var_25_15 > 0 and var_25_9 < var_25_15 then
					arg_22_1.talkMaxDuration = var_25_15

					if var_25_15 + var_25_8 > arg_22_1.duration_ then
						arg_22_1.duration_ = var_25_15 + var_25_8
					end
				end

				arg_22_1.text_.text = var_25_12
				arg_22_1.typewritter.percent = 0

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051005", "story_v_out_417051.awb") ~= 0 then
					local var_25_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051005", "story_v_out_417051.awb") / 1000

					if var_25_16 + var_25_8 > arg_22_1.duration_ then
						arg_22_1.duration_ = var_25_16 + var_25_8
					end

					if var_25_11.prefab_name ~= "" and arg_22_1.actors_[var_25_11.prefab_name] ~= nil then
						local var_25_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_22_1.actors_[var_25_11.prefab_name].transform, "story_v_out_417051", "417051005", "story_v_out_417051.awb")

						arg_22_1:RecordAudio("417051005", var_25_17)
						arg_22_1:RecordAudio("417051005", var_25_17)
					else
						arg_22_1:AudioAction("play", "voice", "story_v_out_417051", "417051005", "story_v_out_417051.awb")
					end

					arg_22_1:RecordHistoryTalkVoice("story_v_out_417051", "417051005", "story_v_out_417051.awb")
				end

				arg_22_1:RecordContent(arg_22_1.text_.text)
			end

			local var_25_18 = math.max(var_25_9, arg_22_1.talkMaxDuration)

			if var_25_8 <= arg_22_1.time_ and arg_22_1.time_ < var_25_8 + var_25_18 then
				arg_22_1.typewritter.percent = (arg_22_1.time_ - var_25_8) / var_25_18

				arg_22_1.typewritter:SetDirty()
			end

			if arg_22_1.time_ >= var_25_8 + var_25_18 and arg_22_1.time_ < var_25_8 + var_25_18 + arg_25_0 then
				arg_22_1.typewritter.percent = 1

				arg_22_1.typewritter:SetDirty()
				arg_22_1:ShowNextGo(true)
			end
		end
	end,
	Play417051006 = function(arg_26_0, arg_26_1)
		arg_26_1.time_ = 0
		arg_26_1.frameCnt_ = 0
		arg_26_1.state_ = "playing"
		arg_26_1.curTalkId_ = 417051006
		arg_26_1.duration_ = 3.63

		local var_26_0 = {
			zh = 1.266,
			ja = 3.633
		}
		local var_26_1 = manager.audio:GetLocalizationFlag()

		if var_26_0[var_26_1] ~= nil then
			arg_26_1.duration_ = var_26_0[var_26_1]
		end

		SetActive(arg_26_1.tipsGo_, false)

		function arg_26_1.onSingleLineFinish_()
			arg_26_1.onSingleLineUpdate_ = nil
			arg_26_1.onSingleLineFinish_ = nil
			arg_26_1.state_ = "waiting"
		end

		function arg_26_1.playNext_(arg_28_0)
			if arg_28_0 == 1 then
				arg_26_0:Play417051007(arg_26_1)
			end
		end

		function arg_26_1.onSingleLineUpdate_(arg_29_0)
			local var_29_0 = arg_26_1.actors_["1034"]
			local var_29_1 = 0

			if var_29_1 < arg_26_1.time_ and arg_26_1.time_ <= var_29_1 + arg_29_0 and not isNil(var_29_0) and arg_26_1.var_.actorSpriteComps1034 == nil then
				arg_26_1.var_.actorSpriteComps1034 = var_29_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_29_2 = 0.2

			if var_29_1 <= arg_26_1.time_ and arg_26_1.time_ < var_29_1 + var_29_2 and not isNil(var_29_0) then
				local var_29_3 = (arg_26_1.time_ - var_29_1) / var_29_2

				if arg_26_1.var_.actorSpriteComps1034 then
					for iter_29_0, iter_29_1 in pairs(arg_26_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_29_1 then
							if arg_26_1.isInRecall_ then
								local var_29_4 = Mathf.Lerp(iter_29_1.color.r, arg_26_1.hightColor1.r, var_29_3)
								local var_29_5 = Mathf.Lerp(iter_29_1.color.g, arg_26_1.hightColor1.g, var_29_3)
								local var_29_6 = Mathf.Lerp(iter_29_1.color.b, arg_26_1.hightColor1.b, var_29_3)

								iter_29_1.color = Color.New(var_29_4, var_29_5, var_29_6)
							else
								local var_29_7 = Mathf.Lerp(iter_29_1.color.r, 1, var_29_3)

								iter_29_1.color = Color.New(var_29_7, var_29_7, var_29_7)
							end
						end
					end
				end
			end

			if arg_26_1.time_ >= var_29_1 + var_29_2 and arg_26_1.time_ < var_29_1 + var_29_2 + arg_29_0 and not isNil(var_29_0) and arg_26_1.var_.actorSpriteComps1034 then
				for iter_29_2, iter_29_3 in pairs(arg_26_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_29_3 then
						if arg_26_1.isInRecall_ then
							iter_29_3.color = arg_26_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_29_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_26_1.var_.actorSpriteComps1034 = nil
			end

			local var_29_8 = 0
			local var_29_9 = 0.125

			if var_29_8 < arg_26_1.time_ and arg_26_1.time_ <= var_29_8 + arg_29_0 then
				arg_26_1.talkMaxDuration = 0
				arg_26_1.dialogCg_.alpha = 1

				arg_26_1.dialog_:SetActive(true)
				SetActive(arg_26_1.leftNameGo_, true)

				local var_29_10 = arg_26_1:FormatText(StoryNameCfg[1109].name)

				arg_26_1.leftNameTxt_.text = var_29_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_26_1.leftNameTxt_.transform)

				arg_26_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_26_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_26_1:RecordName(arg_26_1.leftNameTxt_.text)
				SetActive(arg_26_1.iconTrs_.gameObject, false)
				arg_26_1.callingController_:SetSelectedState("normal")

				local var_29_11 = arg_26_1:GetWordFromCfg(417051006)
				local var_29_12 = arg_26_1:FormatText(var_29_11.content)

				arg_26_1.text_.text = var_29_12

				LuaForUtil.ClearLinePrefixSymbol(arg_26_1.text_)

				local var_29_13 = 5
				local var_29_14 = utf8.len(var_29_12)
				local var_29_15 = var_29_13 <= 0 and var_29_9 or var_29_9 * (var_29_14 / var_29_13)

				if var_29_15 > 0 and var_29_9 < var_29_15 then
					arg_26_1.talkMaxDuration = var_29_15

					if var_29_15 + var_29_8 > arg_26_1.duration_ then
						arg_26_1.duration_ = var_29_15 + var_29_8
					end
				end

				arg_26_1.text_.text = var_29_12
				arg_26_1.typewritter.percent = 0

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051006", "story_v_out_417051.awb") ~= 0 then
					local var_29_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051006", "story_v_out_417051.awb") / 1000

					if var_29_16 + var_29_8 > arg_26_1.duration_ then
						arg_26_1.duration_ = var_29_16 + var_29_8
					end

					if var_29_11.prefab_name ~= "" and arg_26_1.actors_[var_29_11.prefab_name] ~= nil then
						local var_29_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_26_1.actors_[var_29_11.prefab_name].transform, "story_v_out_417051", "417051006", "story_v_out_417051.awb")

						arg_26_1:RecordAudio("417051006", var_29_17)
						arg_26_1:RecordAudio("417051006", var_29_17)
					else
						arg_26_1:AudioAction("play", "voice", "story_v_out_417051", "417051006", "story_v_out_417051.awb")
					end

					arg_26_1:RecordHistoryTalkVoice("story_v_out_417051", "417051006", "story_v_out_417051.awb")
				end

				arg_26_1:RecordContent(arg_26_1.text_.text)
			end

			local var_29_18 = math.max(var_29_9, arg_26_1.talkMaxDuration)

			if var_29_8 <= arg_26_1.time_ and arg_26_1.time_ < var_29_8 + var_29_18 then
				arg_26_1.typewritter.percent = (arg_26_1.time_ - var_29_8) / var_29_18

				arg_26_1.typewritter:SetDirty()
			end

			if arg_26_1.time_ >= var_29_8 + var_29_18 and arg_26_1.time_ < var_29_8 + var_29_18 + arg_29_0 then
				arg_26_1.typewritter.percent = 1

				arg_26_1.typewritter:SetDirty()
				arg_26_1:ShowNextGo(true)
			end
		end
	end,
	Play417051007 = function(arg_30_0, arg_30_1)
		arg_30_1.time_ = 0
		arg_30_1.frameCnt_ = 0
		arg_30_1.state_ = "playing"
		arg_30_1.curTalkId_ = 417051007
		arg_30_1.duration_ = 4.23

		local var_30_0 = {
			zh = 4.233,
			ja = 3.333
		}
		local var_30_1 = manager.audio:GetLocalizationFlag()

		if var_30_0[var_30_1] ~= nil then
			arg_30_1.duration_ = var_30_0[var_30_1]
		end

		SetActive(arg_30_1.tipsGo_, false)

		function arg_30_1.onSingleLineFinish_()
			arg_30_1.onSingleLineUpdate_ = nil
			arg_30_1.onSingleLineFinish_ = nil
			arg_30_1.state_ = "waiting"
		end

		function arg_30_1.playNext_(arg_32_0)
			if arg_32_0 == 1 then
				arg_30_0:Play417051008(arg_30_1)
			end
		end

		function arg_30_1.onSingleLineUpdate_(arg_33_0)
			local var_33_0 = arg_30_1.actors_["1034"]
			local var_33_1 = 0

			if var_33_1 < arg_30_1.time_ and arg_30_1.time_ <= var_33_1 + arg_33_0 and not isNil(var_33_0) and arg_30_1.var_.actorSpriteComps1034 == nil then
				arg_30_1.var_.actorSpriteComps1034 = var_33_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_33_2 = 0.2

			if var_33_1 <= arg_30_1.time_ and arg_30_1.time_ < var_33_1 + var_33_2 and not isNil(var_33_0) then
				local var_33_3 = (arg_30_1.time_ - var_33_1) / var_33_2

				if arg_30_1.var_.actorSpriteComps1034 then
					for iter_33_0, iter_33_1 in pairs(arg_30_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_33_1 then
							if arg_30_1.isInRecall_ then
								local var_33_4 = Mathf.Lerp(iter_33_1.color.r, arg_30_1.hightColor2.r, var_33_3)
								local var_33_5 = Mathf.Lerp(iter_33_1.color.g, arg_30_1.hightColor2.g, var_33_3)
								local var_33_6 = Mathf.Lerp(iter_33_1.color.b, arg_30_1.hightColor2.b, var_33_3)

								iter_33_1.color = Color.New(var_33_4, var_33_5, var_33_6)
							else
								local var_33_7 = Mathf.Lerp(iter_33_1.color.r, 0.5, var_33_3)

								iter_33_1.color = Color.New(var_33_7, var_33_7, var_33_7)
							end
						end
					end
				end
			end

			if arg_30_1.time_ >= var_33_1 + var_33_2 and arg_30_1.time_ < var_33_1 + var_33_2 + arg_33_0 and not isNil(var_33_0) and arg_30_1.var_.actorSpriteComps1034 then
				for iter_33_2, iter_33_3 in pairs(arg_30_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_33_3 then
						if arg_30_1.isInRecall_ then
							iter_33_3.color = arg_30_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_33_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_30_1.var_.actorSpriteComps1034 = nil
			end

			local var_33_8 = 0
			local var_33_9 = 0.425

			if var_33_8 < arg_30_1.time_ and arg_30_1.time_ <= var_33_8 + arg_33_0 then
				arg_30_1.talkMaxDuration = 0
				arg_30_1.dialogCg_.alpha = 1

				arg_30_1.dialog_:SetActive(true)
				SetActive(arg_30_1.leftNameGo_, true)

				local var_33_10 = arg_30_1:FormatText(StoryNameCfg[1113].name)

				arg_30_1.leftNameTxt_.text = var_33_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_30_1.leftNameTxt_.transform)

				arg_30_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_30_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_30_1:RecordName(arg_30_1.leftNameTxt_.text)
				SetActive(arg_30_1.iconTrs_.gameObject, true)
				arg_30_1.iconController_:SetSelectedState("hero")

				arg_30_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_30_1.callingController_:SetSelectedState("calling")

				arg_30_1.keyicon_.color = Color.New(1, 1, 1)
				arg_30_1.icon_.color = Color.New(1, 1, 1)

				local var_33_11 = arg_30_1:GetWordFromCfg(417051007)
				local var_33_12 = arg_30_1:FormatText(var_33_11.content)

				arg_30_1.text_.text = var_33_12

				LuaForUtil.ClearLinePrefixSymbol(arg_30_1.text_)

				local var_33_13 = 17
				local var_33_14 = utf8.len(var_33_12)
				local var_33_15 = var_33_13 <= 0 and var_33_9 or var_33_9 * (var_33_14 / var_33_13)

				if var_33_15 > 0 and var_33_9 < var_33_15 then
					arg_30_1.talkMaxDuration = var_33_15

					if var_33_15 + var_33_8 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_15 + var_33_8
					end
				end

				arg_30_1.text_.text = var_33_12
				arg_30_1.typewritter.percent = 0

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051007", "story_v_out_417051.awb") ~= 0 then
					local var_33_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051007", "story_v_out_417051.awb") / 1000

					if var_33_16 + var_33_8 > arg_30_1.duration_ then
						arg_30_1.duration_ = var_33_16 + var_33_8
					end

					if var_33_11.prefab_name ~= "" and arg_30_1.actors_[var_33_11.prefab_name] ~= nil then
						local var_33_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_30_1.actors_[var_33_11.prefab_name].transform, "story_v_out_417051", "417051007", "story_v_out_417051.awb")

						arg_30_1:RecordAudio("417051007", var_33_17)
						arg_30_1:RecordAudio("417051007", var_33_17)
					else
						arg_30_1:AudioAction("play", "voice", "story_v_out_417051", "417051007", "story_v_out_417051.awb")
					end

					arg_30_1:RecordHistoryTalkVoice("story_v_out_417051", "417051007", "story_v_out_417051.awb")
				end

				arg_30_1:RecordContent(arg_30_1.text_.text)
			end

			local var_33_18 = math.max(var_33_9, arg_30_1.talkMaxDuration)

			if var_33_8 <= arg_30_1.time_ and arg_30_1.time_ < var_33_8 + var_33_18 then
				arg_30_1.typewritter.percent = (arg_30_1.time_ - var_33_8) / var_33_18

				arg_30_1.typewritter:SetDirty()
			end

			if arg_30_1.time_ >= var_33_8 + var_33_18 and arg_30_1.time_ < var_33_8 + var_33_18 + arg_33_0 then
				arg_30_1.typewritter.percent = 1

				arg_30_1.typewritter:SetDirty()
				arg_30_1:ShowNextGo(true)
			end
		end
	end,
	Play417051008 = function(arg_34_0, arg_34_1)
		arg_34_1.time_ = 0
		arg_34_1.frameCnt_ = 0
		arg_34_1.state_ = "playing"
		arg_34_1.curTalkId_ = 417051008
		arg_34_1.duration_ = 5

		SetActive(arg_34_1.tipsGo_, false)

		function arg_34_1.onSingleLineFinish_()
			arg_34_1.onSingleLineUpdate_ = nil
			arg_34_1.onSingleLineFinish_ = nil
			arg_34_1.state_ = "waiting"
		end

		function arg_34_1.playNext_(arg_36_0)
			if arg_36_0 == 1 then
				arg_34_0:Play417051009(arg_34_1)
			end
		end

		function arg_34_1.onSingleLineUpdate_(arg_37_0)
			local var_37_0 = "1029"

			if arg_34_1.actors_[var_37_0] == nil then
				local var_37_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1029")

				if not isNil(var_37_1) then
					local var_37_2 = Object.Instantiate(var_37_1, arg_34_1.canvasGo_.transform)

					var_37_2.transform:SetSiblingIndex(1)

					var_37_2.name = var_37_0
					var_37_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_34_1.actors_[var_37_0] = var_37_2

					local var_37_3 = var_37_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_34_1.isInRecall_ then
						for iter_37_0, iter_37_1 in ipairs(var_37_3) do
							iter_37_1.color = arg_34_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_37_4 = arg_34_1.actors_["1029"]
			local var_37_5 = 0

			if var_37_5 < arg_34_1.time_ and arg_34_1.time_ <= var_37_5 + arg_37_0 and not isNil(var_37_4) and arg_34_1.var_.actorSpriteComps1029 == nil then
				arg_34_1.var_.actorSpriteComps1029 = var_37_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_37_6 = 0.2

			if var_37_5 <= arg_34_1.time_ and arg_34_1.time_ < var_37_5 + var_37_6 and not isNil(var_37_4) then
				local var_37_7 = (arg_34_1.time_ - var_37_5) / var_37_6

				if arg_34_1.var_.actorSpriteComps1029 then
					for iter_37_2, iter_37_3 in pairs(arg_34_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_37_3 then
							if arg_34_1.isInRecall_ then
								local var_37_8 = Mathf.Lerp(iter_37_3.color.r, arg_34_1.hightColor2.r, var_37_7)
								local var_37_9 = Mathf.Lerp(iter_37_3.color.g, arg_34_1.hightColor2.g, var_37_7)
								local var_37_10 = Mathf.Lerp(iter_37_3.color.b, arg_34_1.hightColor2.b, var_37_7)

								iter_37_3.color = Color.New(var_37_8, var_37_9, var_37_10)
							else
								local var_37_11 = Mathf.Lerp(iter_37_3.color.r, 0.5, var_37_7)

								iter_37_3.color = Color.New(var_37_11, var_37_11, var_37_11)
							end
						end
					end
				end
			end

			if arg_34_1.time_ >= var_37_5 + var_37_6 and arg_34_1.time_ < var_37_5 + var_37_6 + arg_37_0 and not isNil(var_37_4) and arg_34_1.var_.actorSpriteComps1029 then
				for iter_37_4, iter_37_5 in pairs(arg_34_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_37_5 then
						if arg_34_1.isInRecall_ then
							iter_37_5.color = arg_34_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_37_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_34_1.var_.actorSpriteComps1029 = nil
			end

			local var_37_12 = arg_34_1.actors_["1034"].transform
			local var_37_13 = 0

			if var_37_13 < arg_34_1.time_ and arg_34_1.time_ <= var_37_13 + arg_37_0 then
				arg_34_1.var_.moveOldPos1034 = var_37_12.localPosition
				var_37_12.localScale = Vector3.New(1, 1, 1)

				arg_34_1:CheckSpriteTmpPos("1034", 7)

				local var_37_14 = var_37_12.childCount

				for iter_37_6 = 0, var_37_14 - 1 do
					local var_37_15 = var_37_12:GetChild(iter_37_6)

					if var_37_15.name == "" or not string.find(var_37_15.name, "split") then
						var_37_15.gameObject:SetActive(true)
					else
						var_37_15.gameObject:SetActive(false)
					end
				end
			end

			local var_37_16 = 0.001

			if var_37_13 <= arg_34_1.time_ and arg_34_1.time_ < var_37_13 + var_37_16 then
				local var_37_17 = (arg_34_1.time_ - var_37_13) / var_37_16
				local var_37_18 = Vector3.New(0, -2000, 0)

				var_37_12.localPosition = Vector3.Lerp(arg_34_1.var_.moveOldPos1034, var_37_18, var_37_17)
			end

			if arg_34_1.time_ >= var_37_13 + var_37_16 and arg_34_1.time_ < var_37_13 + var_37_16 + arg_37_0 then
				var_37_12.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_37_19 = 0.2
			local var_37_20 = 1

			if var_37_19 < arg_34_1.time_ and arg_34_1.time_ <= var_37_19 + arg_37_0 then
				local var_37_21 = "play"
				local var_37_22 = "effect"

				arg_34_1:AudioAction(var_37_21, var_37_22, "se_story_1310", "se_story_1310_opensafe", "")
			end

			local var_37_23 = 0
			local var_37_24 = 1.2

			if var_37_23 < arg_34_1.time_ and arg_34_1.time_ <= var_37_23 + arg_37_0 then
				arg_34_1.talkMaxDuration = 0
				arg_34_1.dialogCg_.alpha = 1

				arg_34_1.dialog_:SetActive(true)
				SetActive(arg_34_1.leftNameGo_, false)

				arg_34_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_34_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_34_1:RecordName(arg_34_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_34_1.iconTrs_.gameObject, false)
				arg_34_1.callingController_:SetSelectedState("normal")

				local var_37_25 = arg_34_1:GetWordFromCfg(417051008)
				local var_37_26 = arg_34_1:FormatText(var_37_25.content)

				arg_34_1.text_.text = var_37_26

				LuaForUtil.ClearLinePrefixSymbol(arg_34_1.text_)

				local var_37_27 = 48
				local var_37_28 = utf8.len(var_37_26)
				local var_37_29 = var_37_27 <= 0 and var_37_24 or var_37_24 * (var_37_28 / var_37_27)

				if var_37_29 > 0 and var_37_24 < var_37_29 then
					arg_34_1.talkMaxDuration = var_37_29

					if var_37_29 + var_37_23 > arg_34_1.duration_ then
						arg_34_1.duration_ = var_37_29 + var_37_23
					end
				end

				arg_34_1.text_.text = var_37_26
				arg_34_1.typewritter.percent = 0

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(false)
				arg_34_1:RecordContent(arg_34_1.text_.text)
			end

			local var_37_30 = math.max(var_37_24, arg_34_1.talkMaxDuration)

			if var_37_23 <= arg_34_1.time_ and arg_34_1.time_ < var_37_23 + var_37_30 then
				arg_34_1.typewritter.percent = (arg_34_1.time_ - var_37_23) / var_37_30

				arg_34_1.typewritter:SetDirty()
			end

			if arg_34_1.time_ >= var_37_23 + var_37_30 and arg_34_1.time_ < var_37_23 + var_37_30 + arg_37_0 then
				arg_34_1.typewritter.percent = 1

				arg_34_1.typewritter:SetDirty()
				arg_34_1:ShowNextGo(true)
			end
		end
	end,
	Play417051009 = function(arg_38_0, arg_38_1)
		arg_38_1.time_ = 0
		arg_38_1.frameCnt_ = 0
		arg_38_1.state_ = "playing"
		arg_38_1.curTalkId_ = 417051009
		arg_38_1.duration_ = 7.97

		local var_38_0 = {
			zh = 5.533,
			ja = 7.966
		}
		local var_38_1 = manager.audio:GetLocalizationFlag()

		if var_38_0[var_38_1] ~= nil then
			arg_38_1.duration_ = var_38_0[var_38_1]
		end

		SetActive(arg_38_1.tipsGo_, false)

		function arg_38_1.onSingleLineFinish_()
			arg_38_1.onSingleLineUpdate_ = nil
			arg_38_1.onSingleLineFinish_ = nil
			arg_38_1.state_ = "waiting"
		end

		function arg_38_1.playNext_(arg_40_0)
			if arg_40_0 == 1 then
				arg_38_0:Play417051010(arg_38_1)
			end
		end

		function arg_38_1.onSingleLineUpdate_(arg_41_0)
			local var_41_0 = arg_38_1.actors_["1034"]
			local var_41_1 = 0

			if var_41_1 < arg_38_1.time_ and arg_38_1.time_ <= var_41_1 + arg_41_0 and not isNil(var_41_0) and arg_38_1.var_.actorSpriteComps1034 == nil then
				arg_38_1.var_.actorSpriteComps1034 = var_41_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_41_2 = 0.2

			if var_41_1 <= arg_38_1.time_ and arg_38_1.time_ < var_41_1 + var_41_2 and not isNil(var_41_0) then
				local var_41_3 = (arg_38_1.time_ - var_41_1) / var_41_2

				if arg_38_1.var_.actorSpriteComps1034 then
					for iter_41_0, iter_41_1 in pairs(arg_38_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_41_1 then
							if arg_38_1.isInRecall_ then
								local var_41_4 = Mathf.Lerp(iter_41_1.color.r, arg_38_1.hightColor1.r, var_41_3)
								local var_41_5 = Mathf.Lerp(iter_41_1.color.g, arg_38_1.hightColor1.g, var_41_3)
								local var_41_6 = Mathf.Lerp(iter_41_1.color.b, arg_38_1.hightColor1.b, var_41_3)

								iter_41_1.color = Color.New(var_41_4, var_41_5, var_41_6)
							else
								local var_41_7 = Mathf.Lerp(iter_41_1.color.r, 1, var_41_3)

								iter_41_1.color = Color.New(var_41_7, var_41_7, var_41_7)
							end
						end
					end
				end
			end

			if arg_38_1.time_ >= var_41_1 + var_41_2 and arg_38_1.time_ < var_41_1 + var_41_2 + arg_41_0 and not isNil(var_41_0) and arg_38_1.var_.actorSpriteComps1034 then
				for iter_41_2, iter_41_3 in pairs(arg_38_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_41_3 then
						if arg_38_1.isInRecall_ then
							iter_41_3.color = arg_38_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_41_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_38_1.var_.actorSpriteComps1034 = nil
			end

			local var_41_8 = arg_38_1.actors_["1034"].transform
			local var_41_9 = 0

			if var_41_9 < arg_38_1.time_ and arg_38_1.time_ <= var_41_9 + arg_41_0 then
				arg_38_1.var_.moveOldPos1034 = var_41_8.localPosition
				var_41_8.localScale = Vector3.New(1, 1, 1)

				arg_38_1:CheckSpriteTmpPos("1034", 3)

				local var_41_10 = var_41_8.childCount

				for iter_41_4 = 0, var_41_10 - 1 do
					local var_41_11 = var_41_8:GetChild(iter_41_4)

					if var_41_11.name == "split_4" or not string.find(var_41_11.name, "split") then
						var_41_11.gameObject:SetActive(true)
					else
						var_41_11.gameObject:SetActive(false)
					end
				end
			end

			local var_41_12 = 0.001

			if var_41_9 <= arg_38_1.time_ and arg_38_1.time_ < var_41_9 + var_41_12 then
				local var_41_13 = (arg_38_1.time_ - var_41_9) / var_41_12
				local var_41_14 = Vector3.New(0, -331.9, -324)

				var_41_8.localPosition = Vector3.Lerp(arg_38_1.var_.moveOldPos1034, var_41_14, var_41_13)
			end

			if arg_38_1.time_ >= var_41_9 + var_41_12 and arg_38_1.time_ < var_41_9 + var_41_12 + arg_41_0 then
				var_41_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_41_15 = 0
			local var_41_16 = 0.65

			if var_41_15 < arg_38_1.time_ and arg_38_1.time_ <= var_41_15 + arg_41_0 then
				arg_38_1.talkMaxDuration = 0
				arg_38_1.dialogCg_.alpha = 1

				arg_38_1.dialog_:SetActive(true)
				SetActive(arg_38_1.leftNameGo_, true)

				local var_41_17 = arg_38_1:FormatText(StoryNameCfg[1109].name)

				arg_38_1.leftNameTxt_.text = var_41_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_38_1.leftNameTxt_.transform)

				arg_38_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_38_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_38_1:RecordName(arg_38_1.leftNameTxt_.text)
				SetActive(arg_38_1.iconTrs_.gameObject, false)
				arg_38_1.callingController_:SetSelectedState("normal")

				local var_41_18 = arg_38_1:GetWordFromCfg(417051009)
				local var_41_19 = arg_38_1:FormatText(var_41_18.content)

				arg_38_1.text_.text = var_41_19

				LuaForUtil.ClearLinePrefixSymbol(arg_38_1.text_)

				local var_41_20 = 26
				local var_41_21 = utf8.len(var_41_19)
				local var_41_22 = var_41_20 <= 0 and var_41_16 or var_41_16 * (var_41_21 / var_41_20)

				if var_41_22 > 0 and var_41_16 < var_41_22 then
					arg_38_1.talkMaxDuration = var_41_22

					if var_41_22 + var_41_15 > arg_38_1.duration_ then
						arg_38_1.duration_ = var_41_22 + var_41_15
					end
				end

				arg_38_1.text_.text = var_41_19
				arg_38_1.typewritter.percent = 0

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051009", "story_v_out_417051.awb") ~= 0 then
					local var_41_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051009", "story_v_out_417051.awb") / 1000

					if var_41_23 + var_41_15 > arg_38_1.duration_ then
						arg_38_1.duration_ = var_41_23 + var_41_15
					end

					if var_41_18.prefab_name ~= "" and arg_38_1.actors_[var_41_18.prefab_name] ~= nil then
						local var_41_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_38_1.actors_[var_41_18.prefab_name].transform, "story_v_out_417051", "417051009", "story_v_out_417051.awb")

						arg_38_1:RecordAudio("417051009", var_41_24)
						arg_38_1:RecordAudio("417051009", var_41_24)
					else
						arg_38_1:AudioAction("play", "voice", "story_v_out_417051", "417051009", "story_v_out_417051.awb")
					end

					arg_38_1:RecordHistoryTalkVoice("story_v_out_417051", "417051009", "story_v_out_417051.awb")
				end

				arg_38_1:RecordContent(arg_38_1.text_.text)
			end

			local var_41_25 = math.max(var_41_16, arg_38_1.talkMaxDuration)

			if var_41_15 <= arg_38_1.time_ and arg_38_1.time_ < var_41_15 + var_41_25 then
				arg_38_1.typewritter.percent = (arg_38_1.time_ - var_41_15) / var_41_25

				arg_38_1.typewritter:SetDirty()
			end

			if arg_38_1.time_ >= var_41_15 + var_41_25 and arg_38_1.time_ < var_41_15 + var_41_25 + arg_41_0 then
				arg_38_1.typewritter.percent = 1

				arg_38_1.typewritter:SetDirty()
				arg_38_1:ShowNextGo(true)
			end
		end
	end,
	Play417051010 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 417051010
		arg_42_1.duration_ = 6.4

		local var_42_0 = {
			zh = 2.166,
			ja = 6.4
		}
		local var_42_1 = manager.audio:GetLocalizationFlag()

		if var_42_0[var_42_1] ~= nil then
			arg_42_1.duration_ = var_42_0[var_42_1]
		end

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play417051011(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = arg_42_1.actors_["1029"]
			local var_45_1 = 0

			if var_45_1 < arg_42_1.time_ and arg_42_1.time_ <= var_45_1 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.actorSpriteComps1029 == nil then
				arg_42_1.var_.actorSpriteComps1029 = var_45_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_45_2 = 0.2

			if var_45_1 <= arg_42_1.time_ and arg_42_1.time_ < var_45_1 + var_45_2 and not isNil(var_45_0) then
				local var_45_3 = (arg_42_1.time_ - var_45_1) / var_45_2

				if arg_42_1.var_.actorSpriteComps1029 then
					for iter_45_0, iter_45_1 in pairs(arg_42_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_45_1 then
							if arg_42_1.isInRecall_ then
								local var_45_4 = Mathf.Lerp(iter_45_1.color.r, arg_42_1.hightColor1.r, var_45_3)
								local var_45_5 = Mathf.Lerp(iter_45_1.color.g, arg_42_1.hightColor1.g, var_45_3)
								local var_45_6 = Mathf.Lerp(iter_45_1.color.b, arg_42_1.hightColor1.b, var_45_3)

								iter_45_1.color = Color.New(var_45_4, var_45_5, var_45_6)
							else
								local var_45_7 = Mathf.Lerp(iter_45_1.color.r, 1, var_45_3)

								iter_45_1.color = Color.New(var_45_7, var_45_7, var_45_7)
							end
						end
					end
				end
			end

			if arg_42_1.time_ >= var_45_1 + var_45_2 and arg_42_1.time_ < var_45_1 + var_45_2 + arg_45_0 and not isNil(var_45_0) and arg_42_1.var_.actorSpriteComps1029 then
				for iter_45_2, iter_45_3 in pairs(arg_42_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_45_3 then
						if arg_42_1.isInRecall_ then
							iter_45_3.color = arg_42_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_45_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_42_1.var_.actorSpriteComps1029 = nil
			end

			local var_45_8 = arg_42_1.actors_["1034"]
			local var_45_9 = 0

			if var_45_9 < arg_42_1.time_ and arg_42_1.time_ <= var_45_9 + arg_45_0 and not isNil(var_45_8) and arg_42_1.var_.actorSpriteComps1034 == nil then
				arg_42_1.var_.actorSpriteComps1034 = var_45_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_45_10 = 0.2

			if var_45_9 <= arg_42_1.time_ and arg_42_1.time_ < var_45_9 + var_45_10 and not isNil(var_45_8) then
				local var_45_11 = (arg_42_1.time_ - var_45_9) / var_45_10

				if arg_42_1.var_.actorSpriteComps1034 then
					for iter_45_4, iter_45_5 in pairs(arg_42_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_45_5 then
							if arg_42_1.isInRecall_ then
								local var_45_12 = Mathf.Lerp(iter_45_5.color.r, arg_42_1.hightColor2.r, var_45_11)
								local var_45_13 = Mathf.Lerp(iter_45_5.color.g, arg_42_1.hightColor2.g, var_45_11)
								local var_45_14 = Mathf.Lerp(iter_45_5.color.b, arg_42_1.hightColor2.b, var_45_11)

								iter_45_5.color = Color.New(var_45_12, var_45_13, var_45_14)
							else
								local var_45_15 = Mathf.Lerp(iter_45_5.color.r, 0.5, var_45_11)

								iter_45_5.color = Color.New(var_45_15, var_45_15, var_45_15)
							end
						end
					end
				end
			end

			if arg_42_1.time_ >= var_45_9 + var_45_10 and arg_42_1.time_ < var_45_9 + var_45_10 + arg_45_0 and not isNil(var_45_8) and arg_42_1.var_.actorSpriteComps1034 then
				for iter_45_6, iter_45_7 in pairs(arg_42_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_45_7 then
						if arg_42_1.isInRecall_ then
							iter_45_7.color = arg_42_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_45_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_42_1.var_.actorSpriteComps1034 = nil
			end

			local var_45_16 = 0
			local var_45_17 = 0.325

			if var_45_16 < arg_42_1.time_ and arg_42_1.time_ <= var_45_16 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0
				arg_42_1.dialogCg_.alpha = 1

				arg_42_1.dialog_:SetActive(true)
				SetActive(arg_42_1.leftNameGo_, true)

				local var_45_18 = arg_42_1:FormatText(StoryNameCfg[1113].name)

				arg_42_1.leftNameTxt_.text = var_45_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_42_1.leftNameTxt_.transform)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1.leftNameTxt_.text)
				SetActive(arg_42_1.iconTrs_.gameObject, true)
				arg_42_1.iconController_:SetSelectedState("hero")

				arg_42_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_42_1.callingController_:SetSelectedState("calling")

				arg_42_1.keyicon_.color = Color.New(1, 1, 1)
				arg_42_1.icon_.color = Color.New(1, 1, 1)

				local var_45_19 = arg_42_1:GetWordFromCfg(417051010)
				local var_45_20 = arg_42_1:FormatText(var_45_19.content)

				arg_42_1.text_.text = var_45_20

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_21 = 13
				local var_45_22 = utf8.len(var_45_20)
				local var_45_23 = var_45_21 <= 0 and var_45_17 or var_45_17 * (var_45_22 / var_45_21)

				if var_45_23 > 0 and var_45_17 < var_45_23 then
					arg_42_1.talkMaxDuration = var_45_23

					if var_45_23 + var_45_16 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_23 + var_45_16
					end
				end

				arg_42_1.text_.text = var_45_20
				arg_42_1.typewritter.percent = 0

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051010", "story_v_out_417051.awb") ~= 0 then
					local var_45_24 = manager.audio:GetVoiceLength("story_v_out_417051", "417051010", "story_v_out_417051.awb") / 1000

					if var_45_24 + var_45_16 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_24 + var_45_16
					end

					if var_45_19.prefab_name ~= "" and arg_42_1.actors_[var_45_19.prefab_name] ~= nil then
						local var_45_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_42_1.actors_[var_45_19.prefab_name].transform, "story_v_out_417051", "417051010", "story_v_out_417051.awb")

						arg_42_1:RecordAudio("417051010", var_45_25)
						arg_42_1:RecordAudio("417051010", var_45_25)
					else
						arg_42_1:AudioAction("play", "voice", "story_v_out_417051", "417051010", "story_v_out_417051.awb")
					end

					arg_42_1:RecordHistoryTalkVoice("story_v_out_417051", "417051010", "story_v_out_417051.awb")
				end

				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_26 = math.max(var_45_17, arg_42_1.talkMaxDuration)

			if var_45_16 <= arg_42_1.time_ and arg_42_1.time_ < var_45_16 + var_45_26 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_16) / var_45_26

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_16 + var_45_26 and arg_42_1.time_ < var_45_16 + var_45_26 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play417051011 = function(arg_46_0, arg_46_1)
		arg_46_1.time_ = 0
		arg_46_1.frameCnt_ = 0
		arg_46_1.state_ = "playing"
		arg_46_1.curTalkId_ = 417051011
		arg_46_1.duration_ = 4.27

		local var_46_0 = {
			zh = 3.3,
			ja = 4.266
		}
		local var_46_1 = manager.audio:GetLocalizationFlag()

		if var_46_0[var_46_1] ~= nil then
			arg_46_1.duration_ = var_46_0[var_46_1]
		end

		SetActive(arg_46_1.tipsGo_, false)

		function arg_46_1.onSingleLineFinish_()
			arg_46_1.onSingleLineUpdate_ = nil
			arg_46_1.onSingleLineFinish_ = nil
			arg_46_1.state_ = "waiting"
		end

		function arg_46_1.playNext_(arg_48_0)
			if arg_48_0 == 1 then
				arg_46_0:Play417051012(arg_46_1)
			end
		end

		function arg_46_1.onSingleLineUpdate_(arg_49_0)
			local var_49_0 = arg_46_1.actors_["1034"]
			local var_49_1 = 0

			if var_49_1 < arg_46_1.time_ and arg_46_1.time_ <= var_49_1 + arg_49_0 and not isNil(var_49_0) and arg_46_1.var_.actorSpriteComps1034 == nil then
				arg_46_1.var_.actorSpriteComps1034 = var_49_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_49_2 = 0.2

			if var_49_1 <= arg_46_1.time_ and arg_46_1.time_ < var_49_1 + var_49_2 and not isNil(var_49_0) then
				local var_49_3 = (arg_46_1.time_ - var_49_1) / var_49_2

				if arg_46_1.var_.actorSpriteComps1034 then
					for iter_49_0, iter_49_1 in pairs(arg_46_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_49_1 then
							if arg_46_1.isInRecall_ then
								local var_49_4 = Mathf.Lerp(iter_49_1.color.r, arg_46_1.hightColor1.r, var_49_3)
								local var_49_5 = Mathf.Lerp(iter_49_1.color.g, arg_46_1.hightColor1.g, var_49_3)
								local var_49_6 = Mathf.Lerp(iter_49_1.color.b, arg_46_1.hightColor1.b, var_49_3)

								iter_49_1.color = Color.New(var_49_4, var_49_5, var_49_6)
							else
								local var_49_7 = Mathf.Lerp(iter_49_1.color.r, 1, var_49_3)

								iter_49_1.color = Color.New(var_49_7, var_49_7, var_49_7)
							end
						end
					end
				end
			end

			if arg_46_1.time_ >= var_49_1 + var_49_2 and arg_46_1.time_ < var_49_1 + var_49_2 + arg_49_0 and not isNil(var_49_0) and arg_46_1.var_.actorSpriteComps1034 then
				for iter_49_2, iter_49_3 in pairs(arg_46_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_49_3 then
						if arg_46_1.isInRecall_ then
							iter_49_3.color = arg_46_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_49_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_46_1.var_.actorSpriteComps1034 = nil
			end

			local var_49_8 = arg_46_1.actors_["1029"]
			local var_49_9 = 0

			if var_49_9 < arg_46_1.time_ and arg_46_1.time_ <= var_49_9 + arg_49_0 and not isNil(var_49_8) and arg_46_1.var_.actorSpriteComps1029 == nil then
				arg_46_1.var_.actorSpriteComps1029 = var_49_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_49_10 = 0.2

			if var_49_9 <= arg_46_1.time_ and arg_46_1.time_ < var_49_9 + var_49_10 and not isNil(var_49_8) then
				local var_49_11 = (arg_46_1.time_ - var_49_9) / var_49_10

				if arg_46_1.var_.actorSpriteComps1029 then
					for iter_49_4, iter_49_5 in pairs(arg_46_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_49_5 then
							if arg_46_1.isInRecall_ then
								local var_49_12 = Mathf.Lerp(iter_49_5.color.r, arg_46_1.hightColor2.r, var_49_11)
								local var_49_13 = Mathf.Lerp(iter_49_5.color.g, arg_46_1.hightColor2.g, var_49_11)
								local var_49_14 = Mathf.Lerp(iter_49_5.color.b, arg_46_1.hightColor2.b, var_49_11)

								iter_49_5.color = Color.New(var_49_12, var_49_13, var_49_14)
							else
								local var_49_15 = Mathf.Lerp(iter_49_5.color.r, 0.5, var_49_11)

								iter_49_5.color = Color.New(var_49_15, var_49_15, var_49_15)
							end
						end
					end
				end
			end

			if arg_46_1.time_ >= var_49_9 + var_49_10 and arg_46_1.time_ < var_49_9 + var_49_10 + arg_49_0 and not isNil(var_49_8) and arg_46_1.var_.actorSpriteComps1029 then
				for iter_49_6, iter_49_7 in pairs(arg_46_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_49_7 then
						if arg_46_1.isInRecall_ then
							iter_49_7.color = arg_46_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_49_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_46_1.var_.actorSpriteComps1029 = nil
			end

			local var_49_16 = arg_46_1.actors_["1034"].transform
			local var_49_17 = 0

			if var_49_17 < arg_46_1.time_ and arg_46_1.time_ <= var_49_17 + arg_49_0 then
				arg_46_1.var_.moveOldPos1034 = var_49_16.localPosition
				var_49_16.localScale = Vector3.New(1, 1, 1)

				arg_46_1:CheckSpriteTmpPos("1034", 3)

				local var_49_18 = var_49_16.childCount

				for iter_49_8 = 0, var_49_18 - 1 do
					local var_49_19 = var_49_16:GetChild(iter_49_8)

					if var_49_19.name == "split_5" or not string.find(var_49_19.name, "split") then
						var_49_19.gameObject:SetActive(true)
					else
						var_49_19.gameObject:SetActive(false)
					end
				end
			end

			local var_49_20 = 0.001

			if var_49_17 <= arg_46_1.time_ and arg_46_1.time_ < var_49_17 + var_49_20 then
				local var_49_21 = (arg_46_1.time_ - var_49_17) / var_49_20
				local var_49_22 = Vector3.New(0, -331.9, -324)

				var_49_16.localPosition = Vector3.Lerp(arg_46_1.var_.moveOldPos1034, var_49_22, var_49_21)
			end

			if arg_46_1.time_ >= var_49_17 + var_49_20 and arg_46_1.time_ < var_49_17 + var_49_20 + arg_49_0 then
				var_49_16.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_49_23 = 0
			local var_49_24 = 0.325

			if var_49_23 < arg_46_1.time_ and arg_46_1.time_ <= var_49_23 + arg_49_0 then
				arg_46_1.talkMaxDuration = 0
				arg_46_1.dialogCg_.alpha = 1

				arg_46_1.dialog_:SetActive(true)
				SetActive(arg_46_1.leftNameGo_, true)

				local var_49_25 = arg_46_1:FormatText(StoryNameCfg[1109].name)

				arg_46_1.leftNameTxt_.text = var_49_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_46_1.leftNameTxt_.transform)

				arg_46_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_46_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_46_1:RecordName(arg_46_1.leftNameTxt_.text)
				SetActive(arg_46_1.iconTrs_.gameObject, false)
				arg_46_1.callingController_:SetSelectedState("normal")

				local var_49_26 = arg_46_1:GetWordFromCfg(417051011)
				local var_49_27 = arg_46_1:FormatText(var_49_26.content)

				arg_46_1.text_.text = var_49_27

				LuaForUtil.ClearLinePrefixSymbol(arg_46_1.text_)

				local var_49_28 = 13
				local var_49_29 = utf8.len(var_49_27)
				local var_49_30 = var_49_28 <= 0 and var_49_24 or var_49_24 * (var_49_29 / var_49_28)

				if var_49_30 > 0 and var_49_24 < var_49_30 then
					arg_46_1.talkMaxDuration = var_49_30

					if var_49_30 + var_49_23 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_30 + var_49_23
					end
				end

				arg_46_1.text_.text = var_49_27
				arg_46_1.typewritter.percent = 0

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051011", "story_v_out_417051.awb") ~= 0 then
					local var_49_31 = manager.audio:GetVoiceLength("story_v_out_417051", "417051011", "story_v_out_417051.awb") / 1000

					if var_49_31 + var_49_23 > arg_46_1.duration_ then
						arg_46_1.duration_ = var_49_31 + var_49_23
					end

					if var_49_26.prefab_name ~= "" and arg_46_1.actors_[var_49_26.prefab_name] ~= nil then
						local var_49_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_46_1.actors_[var_49_26.prefab_name].transform, "story_v_out_417051", "417051011", "story_v_out_417051.awb")

						arg_46_1:RecordAudio("417051011", var_49_32)
						arg_46_1:RecordAudio("417051011", var_49_32)
					else
						arg_46_1:AudioAction("play", "voice", "story_v_out_417051", "417051011", "story_v_out_417051.awb")
					end

					arg_46_1:RecordHistoryTalkVoice("story_v_out_417051", "417051011", "story_v_out_417051.awb")
				end

				arg_46_1:RecordContent(arg_46_1.text_.text)
			end

			local var_49_33 = math.max(var_49_24, arg_46_1.talkMaxDuration)

			if var_49_23 <= arg_46_1.time_ and arg_46_1.time_ < var_49_23 + var_49_33 then
				arg_46_1.typewritter.percent = (arg_46_1.time_ - var_49_23) / var_49_33

				arg_46_1.typewritter:SetDirty()
			end

			if arg_46_1.time_ >= var_49_23 + var_49_33 and arg_46_1.time_ < var_49_23 + var_49_33 + arg_49_0 then
				arg_46_1.typewritter.percent = 1

				arg_46_1.typewritter:SetDirty()
				arg_46_1:ShowNextGo(true)
			end
		end
	end,
	Play417051012 = function(arg_50_0, arg_50_1)
		arg_50_1.time_ = 0
		arg_50_1.frameCnt_ = 0
		arg_50_1.state_ = "playing"
		arg_50_1.curTalkId_ = 417051012
		arg_50_1.duration_ = 6.23

		local var_50_0 = {
			zh = 4.7,
			ja = 6.233
		}
		local var_50_1 = manager.audio:GetLocalizationFlag()

		if var_50_0[var_50_1] ~= nil then
			arg_50_1.duration_ = var_50_0[var_50_1]
		end

		SetActive(arg_50_1.tipsGo_, false)

		function arg_50_1.onSingleLineFinish_()
			arg_50_1.onSingleLineUpdate_ = nil
			arg_50_1.onSingleLineFinish_ = nil
			arg_50_1.state_ = "waiting"
		end

		function arg_50_1.playNext_(arg_52_0)
			if arg_52_0 == 1 then
				arg_50_0:Play417051013(arg_50_1)
			end
		end

		function arg_50_1.onSingleLineUpdate_(arg_53_0)
			local var_53_0 = arg_50_1.actors_["1034"]
			local var_53_1 = 0

			if var_53_1 < arg_50_1.time_ and arg_50_1.time_ <= var_53_1 + arg_53_0 and not isNil(var_53_0) and arg_50_1.var_.actorSpriteComps1034 == nil then
				arg_50_1.var_.actorSpriteComps1034 = var_53_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_53_2 = 0.2

			if var_53_1 <= arg_50_1.time_ and arg_50_1.time_ < var_53_1 + var_53_2 and not isNil(var_53_0) then
				local var_53_3 = (arg_50_1.time_ - var_53_1) / var_53_2

				if arg_50_1.var_.actorSpriteComps1034 then
					for iter_53_0, iter_53_1 in pairs(arg_50_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_53_1 then
							if arg_50_1.isInRecall_ then
								local var_53_4 = Mathf.Lerp(iter_53_1.color.r, arg_50_1.hightColor2.r, var_53_3)
								local var_53_5 = Mathf.Lerp(iter_53_1.color.g, arg_50_1.hightColor2.g, var_53_3)
								local var_53_6 = Mathf.Lerp(iter_53_1.color.b, arg_50_1.hightColor2.b, var_53_3)

								iter_53_1.color = Color.New(var_53_4, var_53_5, var_53_6)
							else
								local var_53_7 = Mathf.Lerp(iter_53_1.color.r, 0.5, var_53_3)

								iter_53_1.color = Color.New(var_53_7, var_53_7, var_53_7)
							end
						end
					end
				end
			end

			if arg_50_1.time_ >= var_53_1 + var_53_2 and arg_50_1.time_ < var_53_1 + var_53_2 + arg_53_0 and not isNil(var_53_0) and arg_50_1.var_.actorSpriteComps1034 then
				for iter_53_2, iter_53_3 in pairs(arg_50_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_53_3 then
						if arg_50_1.isInRecall_ then
							iter_53_3.color = arg_50_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_53_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_50_1.var_.actorSpriteComps1034 = nil
			end

			local var_53_8 = 0
			local var_53_9 = 0.55

			if var_53_8 < arg_50_1.time_ and arg_50_1.time_ <= var_53_8 + arg_53_0 then
				arg_50_1.talkMaxDuration = 0
				arg_50_1.dialogCg_.alpha = 1

				arg_50_1.dialog_:SetActive(true)
				SetActive(arg_50_1.leftNameGo_, true)

				local var_53_10 = arg_50_1:FormatText(StoryNameCfg[1113].name)

				arg_50_1.leftNameTxt_.text = var_53_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_50_1.leftNameTxt_.transform)

				arg_50_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_50_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_50_1:RecordName(arg_50_1.leftNameTxt_.text)
				SetActive(arg_50_1.iconTrs_.gameObject, true)
				arg_50_1.iconController_:SetSelectedState("hero")

				arg_50_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_2")

				arg_50_1.callingController_:SetSelectedState("calling")

				arg_50_1.keyicon_.color = Color.New(1, 1, 1)
				arg_50_1.icon_.color = Color.New(1, 1, 1)

				local var_53_11 = arg_50_1:GetWordFromCfg(417051012)
				local var_53_12 = arg_50_1:FormatText(var_53_11.content)

				arg_50_1.text_.text = var_53_12

				LuaForUtil.ClearLinePrefixSymbol(arg_50_1.text_)

				local var_53_13 = 22
				local var_53_14 = utf8.len(var_53_12)
				local var_53_15 = var_53_13 <= 0 and var_53_9 or var_53_9 * (var_53_14 / var_53_13)

				if var_53_15 > 0 and var_53_9 < var_53_15 then
					arg_50_1.talkMaxDuration = var_53_15

					if var_53_15 + var_53_8 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_15 + var_53_8
					end
				end

				arg_50_1.text_.text = var_53_12
				arg_50_1.typewritter.percent = 0

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051012", "story_v_out_417051.awb") ~= 0 then
					local var_53_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051012", "story_v_out_417051.awb") / 1000

					if var_53_16 + var_53_8 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_16 + var_53_8
					end

					if var_53_11.prefab_name ~= "" and arg_50_1.actors_[var_53_11.prefab_name] ~= nil then
						local var_53_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_50_1.actors_[var_53_11.prefab_name].transform, "story_v_out_417051", "417051012", "story_v_out_417051.awb")

						arg_50_1:RecordAudio("417051012", var_53_17)
						arg_50_1:RecordAudio("417051012", var_53_17)
					else
						arg_50_1:AudioAction("play", "voice", "story_v_out_417051", "417051012", "story_v_out_417051.awb")
					end

					arg_50_1:RecordHistoryTalkVoice("story_v_out_417051", "417051012", "story_v_out_417051.awb")
				end

				arg_50_1:RecordContent(arg_50_1.text_.text)
			end

			local var_53_18 = math.max(var_53_9, arg_50_1.talkMaxDuration)

			if var_53_8 <= arg_50_1.time_ and arg_50_1.time_ < var_53_8 + var_53_18 then
				arg_50_1.typewritter.percent = (arg_50_1.time_ - var_53_8) / var_53_18

				arg_50_1.typewritter:SetDirty()
			end

			if arg_50_1.time_ >= var_53_8 + var_53_18 and arg_50_1.time_ < var_53_8 + var_53_18 + arg_53_0 then
				arg_50_1.typewritter.percent = 1

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(true)
			end
		end
	end,
	Play417051013 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 417051013
		arg_54_1.duration_ = 10.4

		local var_54_0 = {
			zh = 7.433,
			ja = 10.4
		}
		local var_54_1 = manager.audio:GetLocalizationFlag()

		if var_54_0[var_54_1] ~= nil then
			arg_54_1.duration_ = var_54_0[var_54_1]
		end

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play417051014(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = 0
			local var_57_1 = 0.975

			if var_57_0 < arg_54_1.time_ and arg_54_1.time_ <= var_57_0 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0
				arg_54_1.dialogCg_.alpha = 1

				arg_54_1.dialog_:SetActive(true)
				SetActive(arg_54_1.leftNameGo_, true)

				local var_57_2 = arg_54_1:FormatText(StoryNameCfg[1113].name)

				arg_54_1.leftNameTxt_.text = var_57_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_54_1.leftNameTxt_.transform)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1.leftNameTxt_.text)
				SetActive(arg_54_1.iconTrs_.gameObject, true)
				arg_54_1.iconController_:SetSelectedState("hero")

				arg_54_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_54_1.callingController_:SetSelectedState("calling")

				arg_54_1.keyicon_.color = Color.New(1, 1, 1)
				arg_54_1.icon_.color = Color.New(1, 1, 1)

				local var_57_3 = arg_54_1:GetWordFromCfg(417051013)
				local var_57_4 = arg_54_1:FormatText(var_57_3.content)

				arg_54_1.text_.text = var_57_4

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_5 = 39
				local var_57_6 = utf8.len(var_57_4)
				local var_57_7 = var_57_5 <= 0 and var_57_1 or var_57_1 * (var_57_6 / var_57_5)

				if var_57_7 > 0 and var_57_1 < var_57_7 then
					arg_54_1.talkMaxDuration = var_57_7

					if var_57_7 + var_57_0 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_7 + var_57_0
					end
				end

				arg_54_1.text_.text = var_57_4
				arg_54_1.typewritter.percent = 0

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051013", "story_v_out_417051.awb") ~= 0 then
					local var_57_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051013", "story_v_out_417051.awb") / 1000

					if var_57_8 + var_57_0 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_8 + var_57_0
					end

					if var_57_3.prefab_name ~= "" and arg_54_1.actors_[var_57_3.prefab_name] ~= nil then
						local var_57_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_54_1.actors_[var_57_3.prefab_name].transform, "story_v_out_417051", "417051013", "story_v_out_417051.awb")

						arg_54_1:RecordAudio("417051013", var_57_9)
						arg_54_1:RecordAudio("417051013", var_57_9)
					else
						arg_54_1:AudioAction("play", "voice", "story_v_out_417051", "417051013", "story_v_out_417051.awb")
					end

					arg_54_1:RecordHistoryTalkVoice("story_v_out_417051", "417051013", "story_v_out_417051.awb")
				end

				arg_54_1:RecordContent(arg_54_1.text_.text)
			end

			local var_57_10 = math.max(var_57_1, arg_54_1.talkMaxDuration)

			if var_57_0 <= arg_54_1.time_ and arg_54_1.time_ < var_57_0 + var_57_10 then
				arg_54_1.typewritter.percent = (arg_54_1.time_ - var_57_0) / var_57_10

				arg_54_1.typewritter:SetDirty()
			end

			if arg_54_1.time_ >= var_57_0 + var_57_10 and arg_54_1.time_ < var_57_0 + var_57_10 + arg_57_0 then
				arg_54_1.typewritter.percent = 1

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(true)
			end
		end
	end,
	Play417051014 = function(arg_58_0, arg_58_1)
		arg_58_1.time_ = 0
		arg_58_1.frameCnt_ = 0
		arg_58_1.state_ = "playing"
		arg_58_1.curTalkId_ = 417051014
		arg_58_1.duration_ = 7.57

		local var_58_0 = {
			zh = 2.433,
			ja = 7.566
		}
		local var_58_1 = manager.audio:GetLocalizationFlag()

		if var_58_0[var_58_1] ~= nil then
			arg_58_1.duration_ = var_58_0[var_58_1]
		end

		SetActive(arg_58_1.tipsGo_, false)

		function arg_58_1.onSingleLineFinish_()
			arg_58_1.onSingleLineUpdate_ = nil
			arg_58_1.onSingleLineFinish_ = nil
			arg_58_1.state_ = "waiting"
		end

		function arg_58_1.playNext_(arg_60_0)
			if arg_60_0 == 1 then
				arg_58_0:Play417051015(arg_58_1)
			end
		end

		function arg_58_1.onSingleLineUpdate_(arg_61_0)
			local var_61_0 = arg_58_1.actors_["1034"]
			local var_61_1 = 0

			if var_61_1 < arg_58_1.time_ and arg_58_1.time_ <= var_61_1 + arg_61_0 and not isNil(var_61_0) and arg_58_1.var_.actorSpriteComps1034 == nil then
				arg_58_1.var_.actorSpriteComps1034 = var_61_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_61_2 = 0.2

			if var_61_1 <= arg_58_1.time_ and arg_58_1.time_ < var_61_1 + var_61_2 and not isNil(var_61_0) then
				local var_61_3 = (arg_58_1.time_ - var_61_1) / var_61_2

				if arg_58_1.var_.actorSpriteComps1034 then
					for iter_61_0, iter_61_1 in pairs(arg_58_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_61_1 then
							if arg_58_1.isInRecall_ then
								local var_61_4 = Mathf.Lerp(iter_61_1.color.r, arg_58_1.hightColor1.r, var_61_3)
								local var_61_5 = Mathf.Lerp(iter_61_1.color.g, arg_58_1.hightColor1.g, var_61_3)
								local var_61_6 = Mathf.Lerp(iter_61_1.color.b, arg_58_1.hightColor1.b, var_61_3)

								iter_61_1.color = Color.New(var_61_4, var_61_5, var_61_6)
							else
								local var_61_7 = Mathf.Lerp(iter_61_1.color.r, 1, var_61_3)

								iter_61_1.color = Color.New(var_61_7, var_61_7, var_61_7)
							end
						end
					end
				end
			end

			if arg_58_1.time_ >= var_61_1 + var_61_2 and arg_58_1.time_ < var_61_1 + var_61_2 + arg_61_0 and not isNil(var_61_0) and arg_58_1.var_.actorSpriteComps1034 then
				for iter_61_2, iter_61_3 in pairs(arg_58_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_61_3 then
						if arg_58_1.isInRecall_ then
							iter_61_3.color = arg_58_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_61_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_58_1.var_.actorSpriteComps1034 = nil
			end

			local var_61_8 = arg_58_1.actors_["1034"].transform
			local var_61_9 = 0

			if var_61_9 < arg_58_1.time_ and arg_58_1.time_ <= var_61_9 + arg_61_0 then
				arg_58_1.var_.moveOldPos1034 = var_61_8.localPosition
				var_61_8.localScale = Vector3.New(1, 1, 1)

				arg_58_1:CheckSpriteTmpPos("1034", 3)

				local var_61_10 = var_61_8.childCount

				for iter_61_4 = 0, var_61_10 - 1 do
					local var_61_11 = var_61_8:GetChild(iter_61_4)

					if var_61_11.name == "split_4" or not string.find(var_61_11.name, "split") then
						var_61_11.gameObject:SetActive(true)
					else
						var_61_11.gameObject:SetActive(false)
					end
				end
			end

			local var_61_12 = 0.001

			if var_61_9 <= arg_58_1.time_ and arg_58_1.time_ < var_61_9 + var_61_12 then
				local var_61_13 = (arg_58_1.time_ - var_61_9) / var_61_12
				local var_61_14 = Vector3.New(0, -331.9, -324)

				var_61_8.localPosition = Vector3.Lerp(arg_58_1.var_.moveOldPos1034, var_61_14, var_61_13)
			end

			if arg_58_1.time_ >= var_61_9 + var_61_12 and arg_58_1.time_ < var_61_9 + var_61_12 + arg_61_0 then
				var_61_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_61_15 = 0
			local var_61_16 = 0.25

			if var_61_15 < arg_58_1.time_ and arg_58_1.time_ <= var_61_15 + arg_61_0 then
				arg_58_1.talkMaxDuration = 0
				arg_58_1.dialogCg_.alpha = 1

				arg_58_1.dialog_:SetActive(true)
				SetActive(arg_58_1.leftNameGo_, true)

				local var_61_17 = arg_58_1:FormatText(StoryNameCfg[1109].name)

				arg_58_1.leftNameTxt_.text = var_61_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_58_1.leftNameTxt_.transform)

				arg_58_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_58_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_58_1:RecordName(arg_58_1.leftNameTxt_.text)
				SetActive(arg_58_1.iconTrs_.gameObject, false)
				arg_58_1.callingController_:SetSelectedState("normal")

				local var_61_18 = arg_58_1:GetWordFromCfg(417051014)
				local var_61_19 = arg_58_1:FormatText(var_61_18.content)

				arg_58_1.text_.text = var_61_19

				LuaForUtil.ClearLinePrefixSymbol(arg_58_1.text_)

				local var_61_20 = 10
				local var_61_21 = utf8.len(var_61_19)
				local var_61_22 = var_61_20 <= 0 and var_61_16 or var_61_16 * (var_61_21 / var_61_20)

				if var_61_22 > 0 and var_61_16 < var_61_22 then
					arg_58_1.talkMaxDuration = var_61_22

					if var_61_22 + var_61_15 > arg_58_1.duration_ then
						arg_58_1.duration_ = var_61_22 + var_61_15
					end
				end

				arg_58_1.text_.text = var_61_19
				arg_58_1.typewritter.percent = 0

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051014", "story_v_out_417051.awb") ~= 0 then
					local var_61_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051014", "story_v_out_417051.awb") / 1000

					if var_61_23 + var_61_15 > arg_58_1.duration_ then
						arg_58_1.duration_ = var_61_23 + var_61_15
					end

					if var_61_18.prefab_name ~= "" and arg_58_1.actors_[var_61_18.prefab_name] ~= nil then
						local var_61_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_58_1.actors_[var_61_18.prefab_name].transform, "story_v_out_417051", "417051014", "story_v_out_417051.awb")

						arg_58_1:RecordAudio("417051014", var_61_24)
						arg_58_1:RecordAudio("417051014", var_61_24)
					else
						arg_58_1:AudioAction("play", "voice", "story_v_out_417051", "417051014", "story_v_out_417051.awb")
					end

					arg_58_1:RecordHistoryTalkVoice("story_v_out_417051", "417051014", "story_v_out_417051.awb")
				end

				arg_58_1:RecordContent(arg_58_1.text_.text)
			end

			local var_61_25 = math.max(var_61_16, arg_58_1.talkMaxDuration)

			if var_61_15 <= arg_58_1.time_ and arg_58_1.time_ < var_61_15 + var_61_25 then
				arg_58_1.typewritter.percent = (arg_58_1.time_ - var_61_15) / var_61_25

				arg_58_1.typewritter:SetDirty()
			end

			if arg_58_1.time_ >= var_61_15 + var_61_25 and arg_58_1.time_ < var_61_15 + var_61_25 + arg_61_0 then
				arg_58_1.typewritter.percent = 1

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(true)
			end
		end
	end,
	Play417051015 = function(arg_62_0, arg_62_1)
		arg_62_1.time_ = 0
		arg_62_1.frameCnt_ = 0
		arg_62_1.state_ = "playing"
		arg_62_1.curTalkId_ = 417051015
		arg_62_1.duration_ = 3.27

		local var_62_0 = {
			zh = 3.266,
			ja = 2.433
		}
		local var_62_1 = manager.audio:GetLocalizationFlag()

		if var_62_0[var_62_1] ~= nil then
			arg_62_1.duration_ = var_62_0[var_62_1]
		end

		SetActive(arg_62_1.tipsGo_, false)

		function arg_62_1.onSingleLineFinish_()
			arg_62_1.onSingleLineUpdate_ = nil
			arg_62_1.onSingleLineFinish_ = nil
			arg_62_1.state_ = "waiting"
		end

		function arg_62_1.playNext_(arg_64_0)
			if arg_64_0 == 1 then
				arg_62_0:Play417051016(arg_62_1)
			end
		end

		function arg_62_1.onSingleLineUpdate_(arg_65_0)
			local var_65_0 = arg_62_1.actors_["1034"]
			local var_65_1 = 0

			if var_65_1 < arg_62_1.time_ and arg_62_1.time_ <= var_65_1 + arg_65_0 and not isNil(var_65_0) and arg_62_1.var_.actorSpriteComps1034 == nil then
				arg_62_1.var_.actorSpriteComps1034 = var_65_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_65_2 = 0.2

			if var_65_1 <= arg_62_1.time_ and arg_62_1.time_ < var_65_1 + var_65_2 and not isNil(var_65_0) then
				local var_65_3 = (arg_62_1.time_ - var_65_1) / var_65_2

				if arg_62_1.var_.actorSpriteComps1034 then
					for iter_65_0, iter_65_1 in pairs(arg_62_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_65_1 then
							if arg_62_1.isInRecall_ then
								local var_65_4 = Mathf.Lerp(iter_65_1.color.r, arg_62_1.hightColor2.r, var_65_3)
								local var_65_5 = Mathf.Lerp(iter_65_1.color.g, arg_62_1.hightColor2.g, var_65_3)
								local var_65_6 = Mathf.Lerp(iter_65_1.color.b, arg_62_1.hightColor2.b, var_65_3)

								iter_65_1.color = Color.New(var_65_4, var_65_5, var_65_6)
							else
								local var_65_7 = Mathf.Lerp(iter_65_1.color.r, 0.5, var_65_3)

								iter_65_1.color = Color.New(var_65_7, var_65_7, var_65_7)
							end
						end
					end
				end
			end

			if arg_62_1.time_ >= var_65_1 + var_65_2 and arg_62_1.time_ < var_65_1 + var_65_2 + arg_65_0 and not isNil(var_65_0) and arg_62_1.var_.actorSpriteComps1034 then
				for iter_65_2, iter_65_3 in pairs(arg_62_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_65_3 then
						if arg_62_1.isInRecall_ then
							iter_65_3.color = arg_62_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_65_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_62_1.var_.actorSpriteComps1034 = nil
			end

			local var_65_8 = 0
			local var_65_9 = 0.4

			if var_65_8 < arg_62_1.time_ and arg_62_1.time_ <= var_65_8 + arg_65_0 then
				arg_62_1.talkMaxDuration = 0
				arg_62_1.dialogCg_.alpha = 1

				arg_62_1.dialog_:SetActive(true)
				SetActive(arg_62_1.leftNameGo_, true)

				local var_65_10 = arg_62_1:FormatText(StoryNameCfg[1113].name)

				arg_62_1.leftNameTxt_.text = var_65_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_62_1.leftNameTxt_.transform)

				arg_62_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_62_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_62_1:RecordName(arg_62_1.leftNameTxt_.text)
				SetActive(arg_62_1.iconTrs_.gameObject, true)
				arg_62_1.iconController_:SetSelectedState("hero")

				arg_62_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_1")

				arg_62_1.callingController_:SetSelectedState("calling")

				arg_62_1.keyicon_.color = Color.New(1, 1, 1)
				arg_62_1.icon_.color = Color.New(1, 1, 1)

				local var_65_11 = arg_62_1:GetWordFromCfg(417051015)
				local var_65_12 = arg_62_1:FormatText(var_65_11.content)

				arg_62_1.text_.text = var_65_12

				LuaForUtil.ClearLinePrefixSymbol(arg_62_1.text_)

				local var_65_13 = 16
				local var_65_14 = utf8.len(var_65_12)
				local var_65_15 = var_65_13 <= 0 and var_65_9 or var_65_9 * (var_65_14 / var_65_13)

				if var_65_15 > 0 and var_65_9 < var_65_15 then
					arg_62_1.talkMaxDuration = var_65_15

					if var_65_15 + var_65_8 > arg_62_1.duration_ then
						arg_62_1.duration_ = var_65_15 + var_65_8
					end
				end

				arg_62_1.text_.text = var_65_12
				arg_62_1.typewritter.percent = 0

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051015", "story_v_out_417051.awb") ~= 0 then
					local var_65_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051015", "story_v_out_417051.awb") / 1000

					if var_65_16 + var_65_8 > arg_62_1.duration_ then
						arg_62_1.duration_ = var_65_16 + var_65_8
					end

					if var_65_11.prefab_name ~= "" and arg_62_1.actors_[var_65_11.prefab_name] ~= nil then
						local var_65_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_62_1.actors_[var_65_11.prefab_name].transform, "story_v_out_417051", "417051015", "story_v_out_417051.awb")

						arg_62_1:RecordAudio("417051015", var_65_17)
						arg_62_1:RecordAudio("417051015", var_65_17)
					else
						arg_62_1:AudioAction("play", "voice", "story_v_out_417051", "417051015", "story_v_out_417051.awb")
					end

					arg_62_1:RecordHistoryTalkVoice("story_v_out_417051", "417051015", "story_v_out_417051.awb")
				end

				arg_62_1:RecordContent(arg_62_1.text_.text)
			end

			local var_65_18 = math.max(var_65_9, arg_62_1.talkMaxDuration)

			if var_65_8 <= arg_62_1.time_ and arg_62_1.time_ < var_65_8 + var_65_18 then
				arg_62_1.typewritter.percent = (arg_62_1.time_ - var_65_8) / var_65_18

				arg_62_1.typewritter:SetDirty()
			end

			if arg_62_1.time_ >= var_65_8 + var_65_18 and arg_62_1.time_ < var_65_8 + var_65_18 + arg_65_0 then
				arg_62_1.typewritter.percent = 1

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(true)
			end
		end
	end,
	Play417051016 = function(arg_66_0, arg_66_1)
		arg_66_1.time_ = 0
		arg_66_1.frameCnt_ = 0
		arg_66_1.state_ = "playing"
		arg_66_1.curTalkId_ = 417051016
		arg_66_1.duration_ = 4.9

		local var_66_0 = {
			zh = 2.866,
			ja = 4.9
		}
		local var_66_1 = manager.audio:GetLocalizationFlag()

		if var_66_0[var_66_1] ~= nil then
			arg_66_1.duration_ = var_66_0[var_66_1]
		end

		SetActive(arg_66_1.tipsGo_, false)

		function arg_66_1.onSingleLineFinish_()
			arg_66_1.onSingleLineUpdate_ = nil
			arg_66_1.onSingleLineFinish_ = nil
			arg_66_1.state_ = "waiting"
		end

		function arg_66_1.playNext_(arg_68_0)
			if arg_68_0 == 1 then
				arg_66_0:Play417051017(arg_66_1)
			end
		end

		function arg_66_1.onSingleLineUpdate_(arg_69_0)
			local var_69_0 = arg_66_1.actors_["1034"]
			local var_69_1 = 0

			if var_69_1 < arg_66_1.time_ and arg_66_1.time_ <= var_69_1 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.actorSpriteComps1034 == nil then
				arg_66_1.var_.actorSpriteComps1034 = var_69_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_69_2 = 0.2

			if var_69_1 <= arg_66_1.time_ and arg_66_1.time_ < var_69_1 + var_69_2 and not isNil(var_69_0) then
				local var_69_3 = (arg_66_1.time_ - var_69_1) / var_69_2

				if arg_66_1.var_.actorSpriteComps1034 then
					for iter_69_0, iter_69_1 in pairs(arg_66_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_69_1 then
							if arg_66_1.isInRecall_ then
								local var_69_4 = Mathf.Lerp(iter_69_1.color.r, arg_66_1.hightColor1.r, var_69_3)
								local var_69_5 = Mathf.Lerp(iter_69_1.color.g, arg_66_1.hightColor1.g, var_69_3)
								local var_69_6 = Mathf.Lerp(iter_69_1.color.b, arg_66_1.hightColor1.b, var_69_3)

								iter_69_1.color = Color.New(var_69_4, var_69_5, var_69_6)
							else
								local var_69_7 = Mathf.Lerp(iter_69_1.color.r, 1, var_69_3)

								iter_69_1.color = Color.New(var_69_7, var_69_7, var_69_7)
							end
						end
					end
				end
			end

			if arg_66_1.time_ >= var_69_1 + var_69_2 and arg_66_1.time_ < var_69_1 + var_69_2 + arg_69_0 and not isNil(var_69_0) and arg_66_1.var_.actorSpriteComps1034 then
				for iter_69_2, iter_69_3 in pairs(arg_66_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_69_3 then
						if arg_66_1.isInRecall_ then
							iter_69_3.color = arg_66_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_69_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_66_1.var_.actorSpriteComps1034 = nil
			end

			local var_69_8 = arg_66_1.actors_["1034"].transform
			local var_69_9 = 0

			if var_69_9 < arg_66_1.time_ and arg_66_1.time_ <= var_69_9 + arg_69_0 then
				arg_66_1.var_.moveOldPos1034 = var_69_8.localPosition
				var_69_8.localScale = Vector3.New(1, 1, 1)

				arg_66_1:CheckSpriteTmpPos("1034", 3)

				local var_69_10 = var_69_8.childCount

				for iter_69_4 = 0, var_69_10 - 1 do
					local var_69_11 = var_69_8:GetChild(iter_69_4)

					if var_69_11.name == "split_4" or not string.find(var_69_11.name, "split") then
						var_69_11.gameObject:SetActive(true)
					else
						var_69_11.gameObject:SetActive(false)
					end
				end
			end

			local var_69_12 = 0.001

			if var_69_9 <= arg_66_1.time_ and arg_66_1.time_ < var_69_9 + var_69_12 then
				local var_69_13 = (arg_66_1.time_ - var_69_9) / var_69_12
				local var_69_14 = Vector3.New(0, -331.9, -324)

				var_69_8.localPosition = Vector3.Lerp(arg_66_1.var_.moveOldPos1034, var_69_14, var_69_13)
			end

			if arg_66_1.time_ >= var_69_9 + var_69_12 and arg_66_1.time_ < var_69_9 + var_69_12 + arg_69_0 then
				var_69_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_69_15 = 0
			local var_69_16 = 0.25

			if var_69_15 < arg_66_1.time_ and arg_66_1.time_ <= var_69_15 + arg_69_0 then
				arg_66_1.talkMaxDuration = 0
				arg_66_1.dialogCg_.alpha = 1

				arg_66_1.dialog_:SetActive(true)
				SetActive(arg_66_1.leftNameGo_, true)

				local var_69_17 = arg_66_1:FormatText(StoryNameCfg[1109].name)

				arg_66_1.leftNameTxt_.text = var_69_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_66_1.leftNameTxt_.transform)

				arg_66_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_66_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_66_1:RecordName(arg_66_1.leftNameTxt_.text)
				SetActive(arg_66_1.iconTrs_.gameObject, false)
				arg_66_1.callingController_:SetSelectedState("normal")

				local var_69_18 = arg_66_1:GetWordFromCfg(417051016)
				local var_69_19 = arg_66_1:FormatText(var_69_18.content)

				arg_66_1.text_.text = var_69_19

				LuaForUtil.ClearLinePrefixSymbol(arg_66_1.text_)

				local var_69_20 = 10
				local var_69_21 = utf8.len(var_69_19)
				local var_69_22 = var_69_20 <= 0 and var_69_16 or var_69_16 * (var_69_21 / var_69_20)

				if var_69_22 > 0 and var_69_16 < var_69_22 then
					arg_66_1.talkMaxDuration = var_69_22

					if var_69_22 + var_69_15 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_22 + var_69_15
					end
				end

				arg_66_1.text_.text = var_69_19
				arg_66_1.typewritter.percent = 0

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051016", "story_v_out_417051.awb") ~= 0 then
					local var_69_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051016", "story_v_out_417051.awb") / 1000

					if var_69_23 + var_69_15 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_23 + var_69_15
					end

					if var_69_18.prefab_name ~= "" and arg_66_1.actors_[var_69_18.prefab_name] ~= nil then
						local var_69_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_66_1.actors_[var_69_18.prefab_name].transform, "story_v_out_417051", "417051016", "story_v_out_417051.awb")

						arg_66_1:RecordAudio("417051016", var_69_24)
						arg_66_1:RecordAudio("417051016", var_69_24)
					else
						arg_66_1:AudioAction("play", "voice", "story_v_out_417051", "417051016", "story_v_out_417051.awb")
					end

					arg_66_1:RecordHistoryTalkVoice("story_v_out_417051", "417051016", "story_v_out_417051.awb")
				end

				arg_66_1:RecordContent(arg_66_1.text_.text)
			end

			local var_69_25 = math.max(var_69_16, arg_66_1.talkMaxDuration)

			if var_69_15 <= arg_66_1.time_ and arg_66_1.time_ < var_69_15 + var_69_25 then
				arg_66_1.typewritter.percent = (arg_66_1.time_ - var_69_15) / var_69_25

				arg_66_1.typewritter:SetDirty()
			end

			if arg_66_1.time_ >= var_69_15 + var_69_25 and arg_66_1.time_ < var_69_15 + var_69_25 + arg_69_0 then
				arg_66_1.typewritter.percent = 1

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(true)
			end
		end
	end,
	Play417051017 = function(arg_70_0, arg_70_1)
		arg_70_1.time_ = 0
		arg_70_1.frameCnt_ = 0
		arg_70_1.state_ = "playing"
		arg_70_1.curTalkId_ = 417051017
		arg_70_1.duration_ = 6.7

		local var_70_0 = {
			zh = 3.7,
			ja = 6.7
		}
		local var_70_1 = manager.audio:GetLocalizationFlag()

		if var_70_0[var_70_1] ~= nil then
			arg_70_1.duration_ = var_70_0[var_70_1]
		end

		SetActive(arg_70_1.tipsGo_, false)

		function arg_70_1.onSingleLineFinish_()
			arg_70_1.onSingleLineUpdate_ = nil
			arg_70_1.onSingleLineFinish_ = nil
			arg_70_1.state_ = "waiting"
		end

		function arg_70_1.playNext_(arg_72_0)
			if arg_72_0 == 1 then
				arg_70_0:Play417051018(arg_70_1)
			end
		end

		function arg_70_1.onSingleLineUpdate_(arg_73_0)
			local var_73_0 = 0
			local var_73_1 = 0.525

			if var_73_0 < arg_70_1.time_ and arg_70_1.time_ <= var_73_0 + arg_73_0 then
				arg_70_1.talkMaxDuration = 0
				arg_70_1.dialogCg_.alpha = 1

				arg_70_1.dialog_:SetActive(true)
				SetActive(arg_70_1.leftNameGo_, true)

				local var_73_2 = arg_70_1:FormatText(StoryNameCfg[1109].name)

				arg_70_1.leftNameTxt_.text = var_73_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_70_1.leftNameTxt_.transform)

				arg_70_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_70_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_70_1:RecordName(arg_70_1.leftNameTxt_.text)
				SetActive(arg_70_1.iconTrs_.gameObject, false)
				arg_70_1.callingController_:SetSelectedState("normal")

				local var_73_3 = arg_70_1:GetWordFromCfg(417051017)
				local var_73_4 = arg_70_1:FormatText(var_73_3.content)

				arg_70_1.text_.text = var_73_4

				LuaForUtil.ClearLinePrefixSymbol(arg_70_1.text_)

				local var_73_5 = 21
				local var_73_6 = utf8.len(var_73_4)
				local var_73_7 = var_73_5 <= 0 and var_73_1 or var_73_1 * (var_73_6 / var_73_5)

				if var_73_7 > 0 and var_73_1 < var_73_7 then
					arg_70_1.talkMaxDuration = var_73_7

					if var_73_7 + var_73_0 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_7 + var_73_0
					end
				end

				arg_70_1.text_.text = var_73_4
				arg_70_1.typewritter.percent = 0

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051017", "story_v_out_417051.awb") ~= 0 then
					local var_73_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051017", "story_v_out_417051.awb") / 1000

					if var_73_8 + var_73_0 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_8 + var_73_0
					end

					if var_73_3.prefab_name ~= "" and arg_70_1.actors_[var_73_3.prefab_name] ~= nil then
						local var_73_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_70_1.actors_[var_73_3.prefab_name].transform, "story_v_out_417051", "417051017", "story_v_out_417051.awb")

						arg_70_1:RecordAudio("417051017", var_73_9)
						arg_70_1:RecordAudio("417051017", var_73_9)
					else
						arg_70_1:AudioAction("play", "voice", "story_v_out_417051", "417051017", "story_v_out_417051.awb")
					end

					arg_70_1:RecordHistoryTalkVoice("story_v_out_417051", "417051017", "story_v_out_417051.awb")
				end

				arg_70_1:RecordContent(arg_70_1.text_.text)
			end

			local var_73_10 = math.max(var_73_1, arg_70_1.talkMaxDuration)

			if var_73_0 <= arg_70_1.time_ and arg_70_1.time_ < var_73_0 + var_73_10 then
				arg_70_1.typewritter.percent = (arg_70_1.time_ - var_73_0) / var_73_10

				arg_70_1.typewritter:SetDirty()
			end

			if arg_70_1.time_ >= var_73_0 + var_73_10 and arg_70_1.time_ < var_73_0 + var_73_10 + arg_73_0 then
				arg_70_1.typewritter.percent = 1

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(true)
			end
		end
	end,
	Play417051018 = function(arg_74_0, arg_74_1)
		arg_74_1.time_ = 0
		arg_74_1.frameCnt_ = 0
		arg_74_1.state_ = "playing"
		arg_74_1.curTalkId_ = 417051018
		arg_74_1.duration_ = 9.83

		local var_74_0 = {
			zh = 4.7,
			ja = 9.833
		}
		local var_74_1 = manager.audio:GetLocalizationFlag()

		if var_74_0[var_74_1] ~= nil then
			arg_74_1.duration_ = var_74_0[var_74_1]
		end

		SetActive(arg_74_1.tipsGo_, false)

		function arg_74_1.onSingleLineFinish_()
			arg_74_1.onSingleLineUpdate_ = nil
			arg_74_1.onSingleLineFinish_ = nil
			arg_74_1.state_ = "waiting"
		end

		function arg_74_1.playNext_(arg_76_0)
			if arg_76_0 == 1 then
				arg_74_0:Play417051019(arg_74_1)
			end
		end

		function arg_74_1.onSingleLineUpdate_(arg_77_0)
			local var_77_0 = arg_74_1.actors_["1029"]
			local var_77_1 = 0

			if var_77_1 < arg_74_1.time_ and arg_74_1.time_ <= var_77_1 + arg_77_0 and not isNil(var_77_0) and arg_74_1.var_.actorSpriteComps1029 == nil then
				arg_74_1.var_.actorSpriteComps1029 = var_77_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_77_2 = 0.2

			if var_77_1 <= arg_74_1.time_ and arg_74_1.time_ < var_77_1 + var_77_2 and not isNil(var_77_0) then
				local var_77_3 = (arg_74_1.time_ - var_77_1) / var_77_2

				if arg_74_1.var_.actorSpriteComps1029 then
					for iter_77_0, iter_77_1 in pairs(arg_74_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_77_1 then
							if arg_74_1.isInRecall_ then
								local var_77_4 = Mathf.Lerp(iter_77_1.color.r, arg_74_1.hightColor1.r, var_77_3)
								local var_77_5 = Mathf.Lerp(iter_77_1.color.g, arg_74_1.hightColor1.g, var_77_3)
								local var_77_6 = Mathf.Lerp(iter_77_1.color.b, arg_74_1.hightColor1.b, var_77_3)

								iter_77_1.color = Color.New(var_77_4, var_77_5, var_77_6)
							else
								local var_77_7 = Mathf.Lerp(iter_77_1.color.r, 1, var_77_3)

								iter_77_1.color = Color.New(var_77_7, var_77_7, var_77_7)
							end
						end
					end
				end
			end

			if arg_74_1.time_ >= var_77_1 + var_77_2 and arg_74_1.time_ < var_77_1 + var_77_2 + arg_77_0 and not isNil(var_77_0) and arg_74_1.var_.actorSpriteComps1029 then
				for iter_77_2, iter_77_3 in pairs(arg_74_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_77_3 then
						if arg_74_1.isInRecall_ then
							iter_77_3.color = arg_74_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_77_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_74_1.var_.actorSpriteComps1029 = nil
			end

			local var_77_8 = arg_74_1.actors_["1034"]
			local var_77_9 = 0

			if var_77_9 < arg_74_1.time_ and arg_74_1.time_ <= var_77_9 + arg_77_0 and not isNil(var_77_8) and arg_74_1.var_.actorSpriteComps1034 == nil then
				arg_74_1.var_.actorSpriteComps1034 = var_77_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_77_10 = 0.2

			if var_77_9 <= arg_74_1.time_ and arg_74_1.time_ < var_77_9 + var_77_10 and not isNil(var_77_8) then
				local var_77_11 = (arg_74_1.time_ - var_77_9) / var_77_10

				if arg_74_1.var_.actorSpriteComps1034 then
					for iter_77_4, iter_77_5 in pairs(arg_74_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_77_5 then
							if arg_74_1.isInRecall_ then
								local var_77_12 = Mathf.Lerp(iter_77_5.color.r, arg_74_1.hightColor2.r, var_77_11)
								local var_77_13 = Mathf.Lerp(iter_77_5.color.g, arg_74_1.hightColor2.g, var_77_11)
								local var_77_14 = Mathf.Lerp(iter_77_5.color.b, arg_74_1.hightColor2.b, var_77_11)

								iter_77_5.color = Color.New(var_77_12, var_77_13, var_77_14)
							else
								local var_77_15 = Mathf.Lerp(iter_77_5.color.r, 0.5, var_77_11)

								iter_77_5.color = Color.New(var_77_15, var_77_15, var_77_15)
							end
						end
					end
				end
			end

			if arg_74_1.time_ >= var_77_9 + var_77_10 and arg_74_1.time_ < var_77_9 + var_77_10 + arg_77_0 and not isNil(var_77_8) and arg_74_1.var_.actorSpriteComps1034 then
				for iter_77_6, iter_77_7 in pairs(arg_74_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_77_7 then
						if arg_74_1.isInRecall_ then
							iter_77_7.color = arg_74_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_77_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_74_1.var_.actorSpriteComps1034 = nil
			end

			local var_77_16 = 0
			local var_77_17 = 0.55

			if var_77_16 < arg_74_1.time_ and arg_74_1.time_ <= var_77_16 + arg_77_0 then
				arg_74_1.talkMaxDuration = 0
				arg_74_1.dialogCg_.alpha = 1

				arg_74_1.dialog_:SetActive(true)
				SetActive(arg_74_1.leftNameGo_, true)

				local var_77_18 = arg_74_1:FormatText(StoryNameCfg[1113].name)

				arg_74_1.leftNameTxt_.text = var_77_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_74_1.leftNameTxt_.transform)

				arg_74_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_74_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_74_1:RecordName(arg_74_1.leftNameTxt_.text)
				SetActive(arg_74_1.iconTrs_.gameObject, true)
				arg_74_1.iconController_:SetSelectedState("hero")

				arg_74_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10115_split_4")

				arg_74_1.callingController_:SetSelectedState("calling")

				arg_74_1.keyicon_.color = Color.New(1, 1, 1)
				arg_74_1.icon_.color = Color.New(1, 1, 1)

				local var_77_19 = arg_74_1:GetWordFromCfg(417051018)
				local var_77_20 = arg_74_1:FormatText(var_77_19.content)

				arg_74_1.text_.text = var_77_20

				LuaForUtil.ClearLinePrefixSymbol(arg_74_1.text_)

				local var_77_21 = 22
				local var_77_22 = utf8.len(var_77_20)
				local var_77_23 = var_77_21 <= 0 and var_77_17 or var_77_17 * (var_77_22 / var_77_21)

				if var_77_23 > 0 and var_77_17 < var_77_23 then
					arg_74_1.talkMaxDuration = var_77_23

					if var_77_23 + var_77_16 > arg_74_1.duration_ then
						arg_74_1.duration_ = var_77_23 + var_77_16
					end
				end

				arg_74_1.text_.text = var_77_20
				arg_74_1.typewritter.percent = 0

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051018", "story_v_out_417051.awb") ~= 0 then
					local var_77_24 = manager.audio:GetVoiceLength("story_v_out_417051", "417051018", "story_v_out_417051.awb") / 1000

					if var_77_24 + var_77_16 > arg_74_1.duration_ then
						arg_74_1.duration_ = var_77_24 + var_77_16
					end

					if var_77_19.prefab_name ~= "" and arg_74_1.actors_[var_77_19.prefab_name] ~= nil then
						local var_77_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_74_1.actors_[var_77_19.prefab_name].transform, "story_v_out_417051", "417051018", "story_v_out_417051.awb")

						arg_74_1:RecordAudio("417051018", var_77_25)
						arg_74_1:RecordAudio("417051018", var_77_25)
					else
						arg_74_1:AudioAction("play", "voice", "story_v_out_417051", "417051018", "story_v_out_417051.awb")
					end

					arg_74_1:RecordHistoryTalkVoice("story_v_out_417051", "417051018", "story_v_out_417051.awb")
				end

				arg_74_1:RecordContent(arg_74_1.text_.text)
			end

			local var_77_26 = math.max(var_77_17, arg_74_1.talkMaxDuration)

			if var_77_16 <= arg_74_1.time_ and arg_74_1.time_ < var_77_16 + var_77_26 then
				arg_74_1.typewritter.percent = (arg_74_1.time_ - var_77_16) / var_77_26

				arg_74_1.typewritter:SetDirty()
			end

			if arg_74_1.time_ >= var_77_16 + var_77_26 and arg_74_1.time_ < var_77_16 + var_77_26 + arg_77_0 then
				arg_74_1.typewritter.percent = 1

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(true)
			end
		end
	end,
	Play417051019 = function(arg_78_0, arg_78_1)
		arg_78_1.time_ = 0
		arg_78_1.frameCnt_ = 0
		arg_78_1.state_ = "playing"
		arg_78_1.curTalkId_ = 417051019
		arg_78_1.duration_ = 5

		SetActive(arg_78_1.tipsGo_, false)

		function arg_78_1.onSingleLineFinish_()
			arg_78_1.onSingleLineUpdate_ = nil
			arg_78_1.onSingleLineFinish_ = nil
			arg_78_1.state_ = "waiting"
		end

		function arg_78_1.playNext_(arg_80_0)
			if arg_80_0 == 1 then
				arg_78_0:Play417051020(arg_78_1)
			end
		end

		function arg_78_1.onSingleLineUpdate_(arg_81_0)
			local var_81_0 = arg_78_1.actors_["1029"]
			local var_81_1 = 0

			if var_81_1 < arg_78_1.time_ and arg_78_1.time_ <= var_81_1 + arg_81_0 and not isNil(var_81_0) and arg_78_1.var_.actorSpriteComps1029 == nil then
				arg_78_1.var_.actorSpriteComps1029 = var_81_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_81_2 = 0.2

			if var_81_1 <= arg_78_1.time_ and arg_78_1.time_ < var_81_1 + var_81_2 and not isNil(var_81_0) then
				local var_81_3 = (arg_78_1.time_ - var_81_1) / var_81_2

				if arg_78_1.var_.actorSpriteComps1029 then
					for iter_81_0, iter_81_1 in pairs(arg_78_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_81_1 then
							if arg_78_1.isInRecall_ then
								local var_81_4 = Mathf.Lerp(iter_81_1.color.r, arg_78_1.hightColor2.r, var_81_3)
								local var_81_5 = Mathf.Lerp(iter_81_1.color.g, arg_78_1.hightColor2.g, var_81_3)
								local var_81_6 = Mathf.Lerp(iter_81_1.color.b, arg_78_1.hightColor2.b, var_81_3)

								iter_81_1.color = Color.New(var_81_4, var_81_5, var_81_6)
							else
								local var_81_7 = Mathf.Lerp(iter_81_1.color.r, 0.5, var_81_3)

								iter_81_1.color = Color.New(var_81_7, var_81_7, var_81_7)
							end
						end
					end
				end
			end

			if arg_78_1.time_ >= var_81_1 + var_81_2 and arg_78_1.time_ < var_81_1 + var_81_2 + arg_81_0 and not isNil(var_81_0) and arg_78_1.var_.actorSpriteComps1029 then
				for iter_81_2, iter_81_3 in pairs(arg_78_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_81_3 then
						if arg_78_1.isInRecall_ then
							iter_81_3.color = arg_78_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_81_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_78_1.var_.actorSpriteComps1029 = nil
			end

			local var_81_8 = arg_78_1.actors_["1034"].transform
			local var_81_9 = 0

			if var_81_9 < arg_78_1.time_ and arg_78_1.time_ <= var_81_9 + arg_81_0 then
				arg_78_1.var_.moveOldPos1034 = var_81_8.localPosition
				var_81_8.localScale = Vector3.New(1, 1, 1)

				arg_78_1:CheckSpriteTmpPos("1034", 7)

				local var_81_10 = var_81_8.childCount

				for iter_81_4 = 0, var_81_10 - 1 do
					local var_81_11 = var_81_8:GetChild(iter_81_4)

					if var_81_11.name == "" or not string.find(var_81_11.name, "split") then
						var_81_11.gameObject:SetActive(true)
					else
						var_81_11.gameObject:SetActive(false)
					end
				end
			end

			local var_81_12 = 0.001

			if var_81_9 <= arg_78_1.time_ and arg_78_1.time_ < var_81_9 + var_81_12 then
				local var_81_13 = (arg_78_1.time_ - var_81_9) / var_81_12
				local var_81_14 = Vector3.New(0, -2000, 0)

				var_81_8.localPosition = Vector3.Lerp(arg_78_1.var_.moveOldPos1034, var_81_14, var_81_13)
			end

			if arg_78_1.time_ >= var_81_9 + var_81_12 and arg_78_1.time_ < var_81_9 + var_81_12 + arg_81_0 then
				var_81_8.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_81_15 = 0
			local var_81_16 = 1.075

			if var_81_15 < arg_78_1.time_ and arg_78_1.time_ <= var_81_15 + arg_81_0 then
				arg_78_1.talkMaxDuration = 0
				arg_78_1.dialogCg_.alpha = 1

				arg_78_1.dialog_:SetActive(true)
				SetActive(arg_78_1.leftNameGo_, false)

				arg_78_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_78_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_78_1:RecordName(arg_78_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_78_1.iconTrs_.gameObject, false)
				arg_78_1.callingController_:SetSelectedState("normal")

				local var_81_17 = arg_78_1:GetWordFromCfg(417051019)
				local var_81_18 = arg_78_1:FormatText(var_81_17.content)

				arg_78_1.text_.text = var_81_18

				LuaForUtil.ClearLinePrefixSymbol(arg_78_1.text_)

				local var_81_19 = 43
				local var_81_20 = utf8.len(var_81_18)
				local var_81_21 = var_81_19 <= 0 and var_81_16 or var_81_16 * (var_81_20 / var_81_19)

				if var_81_21 > 0 and var_81_16 < var_81_21 then
					arg_78_1.talkMaxDuration = var_81_21

					if var_81_21 + var_81_15 > arg_78_1.duration_ then
						arg_78_1.duration_ = var_81_21 + var_81_15
					end
				end

				arg_78_1.text_.text = var_81_18
				arg_78_1.typewritter.percent = 0

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(false)
				arg_78_1:RecordContent(arg_78_1.text_.text)
			end

			local var_81_22 = math.max(var_81_16, arg_78_1.talkMaxDuration)

			if var_81_15 <= arg_78_1.time_ and arg_78_1.time_ < var_81_15 + var_81_22 then
				arg_78_1.typewritter.percent = (arg_78_1.time_ - var_81_15) / var_81_22

				arg_78_1.typewritter:SetDirty()
			end

			if arg_78_1.time_ >= var_81_15 + var_81_22 and arg_78_1.time_ < var_81_15 + var_81_22 + arg_81_0 then
				arg_78_1.typewritter.percent = 1

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(true)
			end
		end
	end,
	Play417051020 = function(arg_82_0, arg_82_1)
		arg_82_1.time_ = 0
		arg_82_1.frameCnt_ = 0
		arg_82_1.state_ = "playing"
		arg_82_1.curTalkId_ = 417051020
		arg_82_1.duration_ = 6.77

		local var_82_0 = {
			zh = 3.4,
			ja = 6.766
		}
		local var_82_1 = manager.audio:GetLocalizationFlag()

		if var_82_0[var_82_1] ~= nil then
			arg_82_1.duration_ = var_82_0[var_82_1]
		end

		SetActive(arg_82_1.tipsGo_, false)

		function arg_82_1.onSingleLineFinish_()
			arg_82_1.onSingleLineUpdate_ = nil
			arg_82_1.onSingleLineFinish_ = nil
			arg_82_1.state_ = "waiting"
		end

		function arg_82_1.playNext_(arg_84_0)
			if arg_84_0 == 1 then
				arg_82_0:Play417051021(arg_82_1)
			end
		end

		function arg_82_1.onSingleLineUpdate_(arg_85_0)
			local var_85_0 = arg_82_1.actors_["1034"]
			local var_85_1 = 0

			if var_85_1 < arg_82_1.time_ and arg_82_1.time_ <= var_85_1 + arg_85_0 and not isNil(var_85_0) and arg_82_1.var_.actorSpriteComps1034 == nil then
				arg_82_1.var_.actorSpriteComps1034 = var_85_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_85_2 = 0.2

			if var_85_1 <= arg_82_1.time_ and arg_82_1.time_ < var_85_1 + var_85_2 and not isNil(var_85_0) then
				local var_85_3 = (arg_82_1.time_ - var_85_1) / var_85_2

				if arg_82_1.var_.actorSpriteComps1034 then
					for iter_85_0, iter_85_1 in pairs(arg_82_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_85_1 then
							if arg_82_1.isInRecall_ then
								local var_85_4 = Mathf.Lerp(iter_85_1.color.r, arg_82_1.hightColor1.r, var_85_3)
								local var_85_5 = Mathf.Lerp(iter_85_1.color.g, arg_82_1.hightColor1.g, var_85_3)
								local var_85_6 = Mathf.Lerp(iter_85_1.color.b, arg_82_1.hightColor1.b, var_85_3)

								iter_85_1.color = Color.New(var_85_4, var_85_5, var_85_6)
							else
								local var_85_7 = Mathf.Lerp(iter_85_1.color.r, 1, var_85_3)

								iter_85_1.color = Color.New(var_85_7, var_85_7, var_85_7)
							end
						end
					end
				end
			end

			if arg_82_1.time_ >= var_85_1 + var_85_2 and arg_82_1.time_ < var_85_1 + var_85_2 + arg_85_0 and not isNil(var_85_0) and arg_82_1.var_.actorSpriteComps1034 then
				for iter_85_2, iter_85_3 in pairs(arg_82_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_85_3 then
						if arg_82_1.isInRecall_ then
							iter_85_3.color = arg_82_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_85_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_82_1.var_.actorSpriteComps1034 = nil
			end

			local var_85_8 = arg_82_1.actors_["1034"].transform
			local var_85_9 = 0

			if var_85_9 < arg_82_1.time_ and arg_82_1.time_ <= var_85_9 + arg_85_0 then
				arg_82_1.var_.moveOldPos1034 = var_85_8.localPosition
				var_85_8.localScale = Vector3.New(1, 1, 1)

				arg_82_1:CheckSpriteTmpPos("1034", 3)

				local var_85_10 = var_85_8.childCount

				for iter_85_4 = 0, var_85_10 - 1 do
					local var_85_11 = var_85_8:GetChild(iter_85_4)

					if var_85_11.name == "split_6" or not string.find(var_85_11.name, "split") then
						var_85_11.gameObject:SetActive(true)
					else
						var_85_11.gameObject:SetActive(false)
					end
				end
			end

			local var_85_12 = 0.001

			if var_85_9 <= arg_82_1.time_ and arg_82_1.time_ < var_85_9 + var_85_12 then
				local var_85_13 = (arg_82_1.time_ - var_85_9) / var_85_12
				local var_85_14 = Vector3.New(0, -331.9, -324)

				var_85_8.localPosition = Vector3.Lerp(arg_82_1.var_.moveOldPos1034, var_85_14, var_85_13)
			end

			if arg_82_1.time_ >= var_85_9 + var_85_12 and arg_82_1.time_ < var_85_9 + var_85_12 + arg_85_0 then
				var_85_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_85_15 = 0
			local var_85_16 = 0.3

			if var_85_15 < arg_82_1.time_ and arg_82_1.time_ <= var_85_15 + arg_85_0 then
				arg_82_1.talkMaxDuration = 0
				arg_82_1.dialogCg_.alpha = 1

				arg_82_1.dialog_:SetActive(true)
				SetActive(arg_82_1.leftNameGo_, true)

				local var_85_17 = arg_82_1:FormatText(StoryNameCfg[1109].name)

				arg_82_1.leftNameTxt_.text = var_85_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_82_1.leftNameTxt_.transform)

				arg_82_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_82_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_82_1:RecordName(arg_82_1.leftNameTxt_.text)
				SetActive(arg_82_1.iconTrs_.gameObject, false)
				arg_82_1.callingController_:SetSelectedState("normal")

				local var_85_18 = arg_82_1:GetWordFromCfg(417051020)
				local var_85_19 = arg_82_1:FormatText(var_85_18.content)

				arg_82_1.text_.text = var_85_19

				LuaForUtil.ClearLinePrefixSymbol(arg_82_1.text_)

				local var_85_20 = 12
				local var_85_21 = utf8.len(var_85_19)
				local var_85_22 = var_85_20 <= 0 and var_85_16 or var_85_16 * (var_85_21 / var_85_20)

				if var_85_22 > 0 and var_85_16 < var_85_22 then
					arg_82_1.talkMaxDuration = var_85_22

					if var_85_22 + var_85_15 > arg_82_1.duration_ then
						arg_82_1.duration_ = var_85_22 + var_85_15
					end
				end

				arg_82_1.text_.text = var_85_19
				arg_82_1.typewritter.percent = 0

				arg_82_1.typewritter:SetDirty()
				arg_82_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051020", "story_v_out_417051.awb") ~= 0 then
					local var_85_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051020", "story_v_out_417051.awb") / 1000

					if var_85_23 + var_85_15 > arg_82_1.duration_ then
						arg_82_1.duration_ = var_85_23 + var_85_15
					end

					if var_85_18.prefab_name ~= "" and arg_82_1.actors_[var_85_18.prefab_name] ~= nil then
						local var_85_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_82_1.actors_[var_85_18.prefab_name].transform, "story_v_out_417051", "417051020", "story_v_out_417051.awb")

						arg_82_1:RecordAudio("417051020", var_85_24)
						arg_82_1:RecordAudio("417051020", var_85_24)
					else
						arg_82_1:AudioAction("play", "voice", "story_v_out_417051", "417051020", "story_v_out_417051.awb")
					end

					arg_82_1:RecordHistoryTalkVoice("story_v_out_417051", "417051020", "story_v_out_417051.awb")
				end

				arg_82_1:RecordContent(arg_82_1.text_.text)
			end

			local var_85_25 = math.max(var_85_16, arg_82_1.talkMaxDuration)

			if var_85_15 <= arg_82_1.time_ and arg_82_1.time_ < var_85_15 + var_85_25 then
				arg_82_1.typewritter.percent = (arg_82_1.time_ - var_85_15) / var_85_25

				arg_82_1.typewritter:SetDirty()
			end

			if arg_82_1.time_ >= var_85_15 + var_85_25 and arg_82_1.time_ < var_85_15 + var_85_25 + arg_85_0 then
				arg_82_1.typewritter.percent = 1

				arg_82_1.typewritter:SetDirty()
				arg_82_1:ShowNextGo(true)
			end
		end
	end,
	Play417051021 = function(arg_86_0, arg_86_1)
		arg_86_1.time_ = 0
		arg_86_1.frameCnt_ = 0
		arg_86_1.state_ = "playing"
		arg_86_1.curTalkId_ = 417051021
		arg_86_1.duration_ = 5

		SetActive(arg_86_1.tipsGo_, false)

		function arg_86_1.onSingleLineFinish_()
			arg_86_1.onSingleLineUpdate_ = nil
			arg_86_1.onSingleLineFinish_ = nil
			arg_86_1.state_ = "waiting"
		end

		function arg_86_1.playNext_(arg_88_0)
			if arg_88_0 == 1 then
				arg_86_0:Play417051022(arg_86_1)
			end
		end

		function arg_86_1.onSingleLineUpdate_(arg_89_0)
			local var_89_0 = arg_86_1.actors_["1034"]
			local var_89_1 = 0

			if var_89_1 < arg_86_1.time_ and arg_86_1.time_ <= var_89_1 + arg_89_0 and not isNil(var_89_0) and arg_86_1.var_.actorSpriteComps1034 == nil then
				arg_86_1.var_.actorSpriteComps1034 = var_89_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_89_2 = 0.2

			if var_89_1 <= arg_86_1.time_ and arg_86_1.time_ < var_89_1 + var_89_2 and not isNil(var_89_0) then
				local var_89_3 = (arg_86_1.time_ - var_89_1) / var_89_2

				if arg_86_1.var_.actorSpriteComps1034 then
					for iter_89_0, iter_89_1 in pairs(arg_86_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_89_1 then
							if arg_86_1.isInRecall_ then
								local var_89_4 = Mathf.Lerp(iter_89_1.color.r, arg_86_1.hightColor2.r, var_89_3)
								local var_89_5 = Mathf.Lerp(iter_89_1.color.g, arg_86_1.hightColor2.g, var_89_3)
								local var_89_6 = Mathf.Lerp(iter_89_1.color.b, arg_86_1.hightColor2.b, var_89_3)

								iter_89_1.color = Color.New(var_89_4, var_89_5, var_89_6)
							else
								local var_89_7 = Mathf.Lerp(iter_89_1.color.r, 0.5, var_89_3)

								iter_89_1.color = Color.New(var_89_7, var_89_7, var_89_7)
							end
						end
					end
				end
			end

			if arg_86_1.time_ >= var_89_1 + var_89_2 and arg_86_1.time_ < var_89_1 + var_89_2 + arg_89_0 and not isNil(var_89_0) and arg_86_1.var_.actorSpriteComps1034 then
				for iter_89_2, iter_89_3 in pairs(arg_86_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_89_3 then
						if arg_86_1.isInRecall_ then
							iter_89_3.color = arg_86_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_89_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_86_1.var_.actorSpriteComps1034 = nil
			end

			local var_89_8 = 0
			local var_89_9 = 1.175

			if var_89_8 < arg_86_1.time_ and arg_86_1.time_ <= var_89_8 + arg_89_0 then
				arg_86_1.talkMaxDuration = 0
				arg_86_1.dialogCg_.alpha = 1

				arg_86_1.dialog_:SetActive(true)
				SetActive(arg_86_1.leftNameGo_, false)

				arg_86_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_86_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_86_1:RecordName(arg_86_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_86_1.iconTrs_.gameObject, false)
				arg_86_1.callingController_:SetSelectedState("normal")

				local var_89_10 = arg_86_1:GetWordFromCfg(417051021)
				local var_89_11 = arg_86_1:FormatText(var_89_10.content)

				arg_86_1.text_.text = var_89_11

				LuaForUtil.ClearLinePrefixSymbol(arg_86_1.text_)

				local var_89_12 = 47
				local var_89_13 = utf8.len(var_89_11)
				local var_89_14 = var_89_12 <= 0 and var_89_9 or var_89_9 * (var_89_13 / var_89_12)

				if var_89_14 > 0 and var_89_9 < var_89_14 then
					arg_86_1.talkMaxDuration = var_89_14

					if var_89_14 + var_89_8 > arg_86_1.duration_ then
						arg_86_1.duration_ = var_89_14 + var_89_8
					end
				end

				arg_86_1.text_.text = var_89_11
				arg_86_1.typewritter.percent = 0

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(false)
				arg_86_1:RecordContent(arg_86_1.text_.text)
			end

			local var_89_15 = math.max(var_89_9, arg_86_1.talkMaxDuration)

			if var_89_8 <= arg_86_1.time_ and arg_86_1.time_ < var_89_8 + var_89_15 then
				arg_86_1.typewritter.percent = (arg_86_1.time_ - var_89_8) / var_89_15

				arg_86_1.typewritter:SetDirty()
			end

			if arg_86_1.time_ >= var_89_8 + var_89_15 and arg_86_1.time_ < var_89_8 + var_89_15 + arg_89_0 then
				arg_86_1.typewritter.percent = 1

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(true)
			end
		end
	end,
	Play417051022 = function(arg_90_0, arg_90_1)
		arg_90_1.time_ = 0
		arg_90_1.frameCnt_ = 0
		arg_90_1.state_ = "playing"
		arg_90_1.curTalkId_ = 417051022
		arg_90_1.duration_ = 2.87

		local var_90_0 = {
			zh = 2.866,
			ja = 2.433
		}
		local var_90_1 = manager.audio:GetLocalizationFlag()

		if var_90_0[var_90_1] ~= nil then
			arg_90_1.duration_ = var_90_0[var_90_1]
		end

		SetActive(arg_90_1.tipsGo_, false)

		function arg_90_1.onSingleLineFinish_()
			arg_90_1.onSingleLineUpdate_ = nil
			arg_90_1.onSingleLineFinish_ = nil
			arg_90_1.state_ = "waiting"
		end

		function arg_90_1.playNext_(arg_92_0)
			if arg_92_0 == 1 then
				arg_90_0:Play417051023(arg_90_1)
			end
		end

		function arg_90_1.onSingleLineUpdate_(arg_93_0)
			local var_93_0 = arg_90_1.actors_["1034"]
			local var_93_1 = 0

			if var_93_1 < arg_90_1.time_ and arg_90_1.time_ <= var_93_1 + arg_93_0 and not isNil(var_93_0) and arg_90_1.var_.actorSpriteComps1034 == nil then
				arg_90_1.var_.actorSpriteComps1034 = var_93_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_93_2 = 0.2

			if var_93_1 <= arg_90_1.time_ and arg_90_1.time_ < var_93_1 + var_93_2 and not isNil(var_93_0) then
				local var_93_3 = (arg_90_1.time_ - var_93_1) / var_93_2

				if arg_90_1.var_.actorSpriteComps1034 then
					for iter_93_0, iter_93_1 in pairs(arg_90_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_93_1 then
							if arg_90_1.isInRecall_ then
								local var_93_4 = Mathf.Lerp(iter_93_1.color.r, arg_90_1.hightColor1.r, var_93_3)
								local var_93_5 = Mathf.Lerp(iter_93_1.color.g, arg_90_1.hightColor1.g, var_93_3)
								local var_93_6 = Mathf.Lerp(iter_93_1.color.b, arg_90_1.hightColor1.b, var_93_3)

								iter_93_1.color = Color.New(var_93_4, var_93_5, var_93_6)
							else
								local var_93_7 = Mathf.Lerp(iter_93_1.color.r, 1, var_93_3)

								iter_93_1.color = Color.New(var_93_7, var_93_7, var_93_7)
							end
						end
					end
				end
			end

			if arg_90_1.time_ >= var_93_1 + var_93_2 and arg_90_1.time_ < var_93_1 + var_93_2 + arg_93_0 and not isNil(var_93_0) and arg_90_1.var_.actorSpriteComps1034 then
				for iter_93_2, iter_93_3 in pairs(arg_90_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_93_3 then
						if arg_90_1.isInRecall_ then
							iter_93_3.color = arg_90_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_93_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_90_1.var_.actorSpriteComps1034 = nil
			end

			local var_93_8 = 0
			local var_93_9 = 0.325

			if var_93_8 < arg_90_1.time_ and arg_90_1.time_ <= var_93_8 + arg_93_0 then
				arg_90_1.talkMaxDuration = 0
				arg_90_1.dialogCg_.alpha = 1

				arg_90_1.dialog_:SetActive(true)
				SetActive(arg_90_1.leftNameGo_, true)

				local var_93_10 = arg_90_1:FormatText(StoryNameCfg[1109].name)

				arg_90_1.leftNameTxt_.text = var_93_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_90_1.leftNameTxt_.transform)

				arg_90_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_90_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_90_1:RecordName(arg_90_1.leftNameTxt_.text)
				SetActive(arg_90_1.iconTrs_.gameObject, false)
				arg_90_1.callingController_:SetSelectedState("normal")

				local var_93_11 = arg_90_1:GetWordFromCfg(417051022)
				local var_93_12 = arg_90_1:FormatText(var_93_11.content)

				arg_90_1.text_.text = var_93_12

				LuaForUtil.ClearLinePrefixSymbol(arg_90_1.text_)

				local var_93_13 = 13
				local var_93_14 = utf8.len(var_93_12)
				local var_93_15 = var_93_13 <= 0 and var_93_9 or var_93_9 * (var_93_14 / var_93_13)

				if var_93_15 > 0 and var_93_9 < var_93_15 then
					arg_90_1.talkMaxDuration = var_93_15

					if var_93_15 + var_93_8 > arg_90_1.duration_ then
						arg_90_1.duration_ = var_93_15 + var_93_8
					end
				end

				arg_90_1.text_.text = var_93_12
				arg_90_1.typewritter.percent = 0

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051022", "story_v_out_417051.awb") ~= 0 then
					local var_93_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051022", "story_v_out_417051.awb") / 1000

					if var_93_16 + var_93_8 > arg_90_1.duration_ then
						arg_90_1.duration_ = var_93_16 + var_93_8
					end

					if var_93_11.prefab_name ~= "" and arg_90_1.actors_[var_93_11.prefab_name] ~= nil then
						local var_93_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_90_1.actors_[var_93_11.prefab_name].transform, "story_v_out_417051", "417051022", "story_v_out_417051.awb")

						arg_90_1:RecordAudio("417051022", var_93_17)
						arg_90_1:RecordAudio("417051022", var_93_17)
					else
						arg_90_1:AudioAction("play", "voice", "story_v_out_417051", "417051022", "story_v_out_417051.awb")
					end

					arg_90_1:RecordHistoryTalkVoice("story_v_out_417051", "417051022", "story_v_out_417051.awb")
				end

				arg_90_1:RecordContent(arg_90_1.text_.text)
			end

			local var_93_18 = math.max(var_93_9, arg_90_1.talkMaxDuration)

			if var_93_8 <= arg_90_1.time_ and arg_90_1.time_ < var_93_8 + var_93_18 then
				arg_90_1.typewritter.percent = (arg_90_1.time_ - var_93_8) / var_93_18

				arg_90_1.typewritter:SetDirty()
			end

			if arg_90_1.time_ >= var_93_8 + var_93_18 and arg_90_1.time_ < var_93_8 + var_93_18 + arg_93_0 then
				arg_90_1.typewritter.percent = 1

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(true)
			end
		end
	end,
	Play417051023 = function(arg_94_0, arg_94_1)
		arg_94_1.time_ = 0
		arg_94_1.frameCnt_ = 0
		arg_94_1.state_ = "playing"
		arg_94_1.curTalkId_ = 417051023
		arg_94_1.duration_ = 5.7

		SetActive(arg_94_1.tipsGo_, false)

		function arg_94_1.onSingleLineFinish_()
			arg_94_1.onSingleLineUpdate_ = nil
			arg_94_1.onSingleLineFinish_ = nil
			arg_94_1.state_ = "waiting"
		end

		function arg_94_1.playNext_(arg_96_0)
			if arg_96_0 == 1 then
				arg_94_0:Play417051024(arg_94_1)
			end
		end

		function arg_94_1.onSingleLineUpdate_(arg_97_0)
			local var_97_0 = arg_94_1.actors_["1034"].transform
			local var_97_1 = 0

			if var_97_1 < arg_94_1.time_ and arg_94_1.time_ <= var_97_1 + arg_97_0 then
				arg_94_1.var_.moveOldPos1034 = var_97_0.localPosition
				var_97_0.localScale = Vector3.New(1, 1, 1)

				arg_94_1:CheckSpriteTmpPos("1034", 7)

				local var_97_2 = var_97_0.childCount

				for iter_97_0 = 0, var_97_2 - 1 do
					local var_97_3 = var_97_0:GetChild(iter_97_0)

					if var_97_3.name == "" or not string.find(var_97_3.name, "split") then
						var_97_3.gameObject:SetActive(true)
					else
						var_97_3.gameObject:SetActive(false)
					end
				end
			end

			local var_97_4 = 0.001

			if var_97_1 <= arg_94_1.time_ and arg_94_1.time_ < var_97_1 + var_97_4 then
				local var_97_5 = (arg_94_1.time_ - var_97_1) / var_97_4
				local var_97_6 = Vector3.New(0, -2000, 0)

				var_97_0.localPosition = Vector3.Lerp(arg_94_1.var_.moveOldPos1034, var_97_6, var_97_5)
			end

			if arg_94_1.time_ >= var_97_1 + var_97_4 and arg_94_1.time_ < var_97_1 + var_97_4 + arg_97_0 then
				var_97_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_97_7 = 0

			if var_97_7 < arg_94_1.time_ and arg_94_1.time_ <= var_97_7 + arg_97_0 then
				arg_94_1.allBtn_.enabled = false
			end

			local var_97_8 = 1

			if arg_94_1.time_ >= var_97_7 + var_97_8 and arg_94_1.time_ < var_97_7 + var_97_8 + arg_97_0 then
				arg_94_1.allBtn_.enabled = true
			end

			local var_97_9 = manager.ui.mainCamera.transform
			local var_97_10 = 0.034

			if var_97_10 < arg_94_1.time_ and arg_94_1.time_ <= var_97_10 + arg_97_0 then
				arg_94_1.var_.shakeOldPos = var_97_9.localPosition
			end

			local var_97_11 = 0.666

			if var_97_10 <= arg_94_1.time_ and arg_94_1.time_ < var_97_10 + var_97_11 then
				local var_97_12 = (arg_94_1.time_ - var_97_10) / 0.066
				local var_97_13, var_97_14 = math.modf(var_97_12)

				var_97_9.localPosition = Vector3.New(var_97_14 * 0.13, var_97_14 * 0.13, var_97_14 * 0.13) + arg_94_1.var_.shakeOldPos
			end

			if arg_94_1.time_ >= var_97_10 + var_97_11 and arg_94_1.time_ < var_97_10 + var_97_11 + arg_97_0 then
				var_97_9.localPosition = arg_94_1.var_.shakeOldPos
			end

			local var_97_15 = 1.23333333333333
			local var_97_16 = 1

			if var_97_15 < arg_94_1.time_ and arg_94_1.time_ <= var_97_15 + arg_97_0 then
				local var_97_17 = "play"
				local var_97_18 = "effect"

				arg_94_1:AudioAction(var_97_17, var_97_18, "se_story_128", "se_story_128_bullet", "")
			end

			local var_97_19 = 0
			local var_97_20 = 1

			if var_97_19 < arg_94_1.time_ and arg_94_1.time_ <= var_97_19 + arg_97_0 then
				local var_97_21 = "play"
				local var_97_22 = "effect"

				arg_94_1:AudioAction(var_97_21, var_97_22, "se_story_120_00", "se_story_120_00_door_break02", "")
			end

			if arg_94_1.frameCnt_ <= 1 then
				arg_94_1.dialog_:SetActive(false)
			end

			local var_97_23 = 0.7
			local var_97_24 = 1.675

			if var_97_23 < arg_94_1.time_ and arg_94_1.time_ <= var_97_23 + arg_97_0 then
				arg_94_1.talkMaxDuration = 0

				arg_94_1.dialog_:SetActive(true)

				local var_97_25 = LeanTween.value(arg_94_1.dialog_, 0, 1, 0.3)

				var_97_25:setOnUpdate(LuaHelper.FloatAction(function(arg_98_0)
					arg_94_1.dialogCg_.alpha = arg_98_0
				end))
				var_97_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_94_1.dialog_)
					var_97_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_94_1.duration_ = arg_94_1.duration_ + 0.3

				SetActive(arg_94_1.leftNameGo_, false)

				arg_94_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_94_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_94_1:RecordName(arg_94_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_94_1.iconTrs_.gameObject, false)
				arg_94_1.callingController_:SetSelectedState("normal")

				local var_97_26 = arg_94_1:GetWordFromCfg(417051023)
				local var_97_27 = arg_94_1:FormatText(var_97_26.content)

				arg_94_1.text_.text = var_97_27

				LuaForUtil.ClearLinePrefixSymbol(arg_94_1.text_)

				local var_97_28 = 67
				local var_97_29 = utf8.len(var_97_27)
				local var_97_30 = var_97_28 <= 0 and var_97_24 or var_97_24 * (var_97_29 / var_97_28)

				if var_97_30 > 0 and var_97_24 < var_97_30 then
					arg_94_1.talkMaxDuration = var_97_30
					var_97_23 = var_97_23 + 0.3

					if var_97_30 + var_97_23 > arg_94_1.duration_ then
						arg_94_1.duration_ = var_97_30 + var_97_23
					end
				end

				arg_94_1.text_.text = var_97_27
				arg_94_1.typewritter.percent = 0

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(false)
				arg_94_1:RecordContent(arg_94_1.text_.text)
			end

			local var_97_31 = var_97_23 + 0.3
			local var_97_32 = math.max(var_97_24, arg_94_1.talkMaxDuration)

			if var_97_31 <= arg_94_1.time_ and arg_94_1.time_ < var_97_31 + var_97_32 then
				arg_94_1.typewritter.percent = (arg_94_1.time_ - var_97_31) / var_97_32

				arg_94_1.typewritter:SetDirty()
			end

			if arg_94_1.time_ >= var_97_31 + var_97_32 and arg_94_1.time_ < var_97_31 + var_97_32 + arg_97_0 then
				arg_94_1.typewritter.percent = 1

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(true)
			end
		end
	end,
	Play417051024 = function(arg_100_0, arg_100_1)
		arg_100_1.time_ = 0
		arg_100_1.frameCnt_ = 0
		arg_100_1.state_ = "playing"
		arg_100_1.curTalkId_ = 417051024
		arg_100_1.duration_ = 2.33

		local var_100_0 = {
			zh = 2.333,
			ja = 2.066
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
				arg_100_0:Play417051025(arg_100_1)
			end
		end

		function arg_100_1.onSingleLineUpdate_(arg_103_0)
			local var_103_0 = 0
			local var_103_1 = 0.075

			if var_103_0 < arg_100_1.time_ and arg_100_1.time_ <= var_103_0 + arg_103_0 then
				arg_100_1.talkMaxDuration = 0
				arg_100_1.dialogCg_.alpha = 1

				arg_100_1.dialog_:SetActive(true)
				SetActive(arg_100_1.leftNameGo_, true)

				local var_103_2 = arg_100_1:FormatText(StoryNameCfg[36].name)

				arg_100_1.leftNameTxt_.text = var_103_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_100_1.leftNameTxt_.transform)

				arg_100_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_100_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_100_1:RecordName(arg_100_1.leftNameTxt_.text)
				SetActive(arg_100_1.iconTrs_.gameObject, false)
				arg_100_1.callingController_:SetSelectedState("normal")

				local var_103_3 = arg_100_1:GetWordFromCfg(417051024)
				local var_103_4 = arg_100_1:FormatText(var_103_3.content)

				arg_100_1.text_.text = var_103_4

				LuaForUtil.ClearLinePrefixSymbol(arg_100_1.text_)

				local var_103_5 = 3
				local var_103_6 = utf8.len(var_103_4)
				local var_103_7 = var_103_5 <= 0 and var_103_1 or var_103_1 * (var_103_6 / var_103_5)

				if var_103_7 > 0 and var_103_1 < var_103_7 then
					arg_100_1.talkMaxDuration = var_103_7

					if var_103_7 + var_103_0 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_7 + var_103_0
					end
				end

				arg_100_1.text_.text = var_103_4
				arg_100_1.typewritter.percent = 0

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051024", "story_v_out_417051.awb") ~= 0 then
					local var_103_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051024", "story_v_out_417051.awb") / 1000

					if var_103_8 + var_103_0 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_8 + var_103_0
					end

					if var_103_3.prefab_name ~= "" and arg_100_1.actors_[var_103_3.prefab_name] ~= nil then
						local var_103_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_100_1.actors_[var_103_3.prefab_name].transform, "story_v_out_417051", "417051024", "story_v_out_417051.awb")

						arg_100_1:RecordAudio("417051024", var_103_9)
						arg_100_1:RecordAudio("417051024", var_103_9)
					else
						arg_100_1:AudioAction("play", "voice", "story_v_out_417051", "417051024", "story_v_out_417051.awb")
					end

					arg_100_1:RecordHistoryTalkVoice("story_v_out_417051", "417051024", "story_v_out_417051.awb")
				end

				arg_100_1:RecordContent(arg_100_1.text_.text)
			end

			local var_103_10 = math.max(var_103_1, arg_100_1.talkMaxDuration)

			if var_103_0 <= arg_100_1.time_ and arg_100_1.time_ < var_103_0 + var_103_10 then
				arg_100_1.typewritter.percent = (arg_100_1.time_ - var_103_0) / var_103_10

				arg_100_1.typewritter:SetDirty()
			end

			if arg_100_1.time_ >= var_103_0 + var_103_10 and arg_100_1.time_ < var_103_0 + var_103_10 + arg_103_0 then
				arg_100_1.typewritter.percent = 1

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(true)
			end
		end
	end,
	Play417051025 = function(arg_104_0, arg_104_1)
		arg_104_1.time_ = 0
		arg_104_1.frameCnt_ = 0
		arg_104_1.state_ = "playing"
		arg_104_1.curTalkId_ = 417051025
		arg_104_1.duration_ = 5

		SetActive(arg_104_1.tipsGo_, false)

		function arg_104_1.onSingleLineFinish_()
			arg_104_1.onSingleLineUpdate_ = nil
			arg_104_1.onSingleLineFinish_ = nil
			arg_104_1.state_ = "waiting"
		end

		function arg_104_1.playNext_(arg_106_0)
			if arg_106_0 == 1 then
				arg_104_0:Play417051026(arg_104_1)
			end
		end

		function arg_104_1.onSingleLineUpdate_(arg_107_0)
			local var_107_0 = 0
			local var_107_1 = 1.125

			if var_107_0 < arg_104_1.time_ and arg_104_1.time_ <= var_107_0 + arg_107_0 then
				arg_104_1.talkMaxDuration = 0
				arg_104_1.dialogCg_.alpha = 1

				arg_104_1.dialog_:SetActive(true)
				SetActive(arg_104_1.leftNameGo_, false)

				arg_104_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_104_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_104_1:RecordName(arg_104_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_104_1.iconTrs_.gameObject, false)
				arg_104_1.callingController_:SetSelectedState("normal")

				local var_107_2 = arg_104_1:GetWordFromCfg(417051025)
				local var_107_3 = arg_104_1:FormatText(var_107_2.content)

				arg_104_1.text_.text = var_107_3

				LuaForUtil.ClearLinePrefixSymbol(arg_104_1.text_)

				local var_107_4 = 45
				local var_107_5 = utf8.len(var_107_3)
				local var_107_6 = var_107_4 <= 0 and var_107_1 or var_107_1 * (var_107_5 / var_107_4)

				if var_107_6 > 0 and var_107_1 < var_107_6 then
					arg_104_1.talkMaxDuration = var_107_6

					if var_107_6 + var_107_0 > arg_104_1.duration_ then
						arg_104_1.duration_ = var_107_6 + var_107_0
					end
				end

				arg_104_1.text_.text = var_107_3
				arg_104_1.typewritter.percent = 0

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(false)
				arg_104_1:RecordContent(arg_104_1.text_.text)
			end

			local var_107_7 = math.max(var_107_1, arg_104_1.talkMaxDuration)

			if var_107_0 <= arg_104_1.time_ and arg_104_1.time_ < var_107_0 + var_107_7 then
				arg_104_1.typewritter.percent = (arg_104_1.time_ - var_107_0) / var_107_7

				arg_104_1.typewritter:SetDirty()
			end

			if arg_104_1.time_ >= var_107_0 + var_107_7 and arg_104_1.time_ < var_107_0 + var_107_7 + arg_107_0 then
				arg_104_1.typewritter.percent = 1

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(true)
			end
		end
	end,
	Play417051026 = function(arg_108_0, arg_108_1)
		arg_108_1.time_ = 0
		arg_108_1.frameCnt_ = 0
		arg_108_1.state_ = "playing"
		arg_108_1.curTalkId_ = 417051026
		arg_108_1.duration_ = 4.5

		local var_108_0 = {
			zh = 4.5,
			ja = 4.133
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
				arg_108_0:Play417051027(arg_108_1)
			end
		end

		function arg_108_1.onSingleLineUpdate_(arg_111_0)
			local var_111_0 = 0
			local var_111_1 = 0.25

			if var_111_0 < arg_108_1.time_ and arg_108_1.time_ <= var_111_0 + arg_111_0 then
				arg_108_1.talkMaxDuration = 0
				arg_108_1.dialogCg_.alpha = 1

				arg_108_1.dialog_:SetActive(true)
				SetActive(arg_108_1.leftNameGo_, true)

				local var_111_2 = arg_108_1:FormatText(StoryNameCfg[36].name)

				arg_108_1.leftNameTxt_.text = var_111_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_108_1.leftNameTxt_.transform)

				arg_108_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_108_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_108_1:RecordName(arg_108_1.leftNameTxt_.text)
				SetActive(arg_108_1.iconTrs_.gameObject, true)
				arg_108_1.iconController_:SetSelectedState("hero")

				arg_108_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_108_1.callingController_:SetSelectedState("normal")

				arg_108_1.keyicon_.color = Color.New(1, 1, 1)
				arg_108_1.icon_.color = Color.New(1, 1, 1)

				local var_111_3 = arg_108_1:GetWordFromCfg(417051026)
				local var_111_4 = arg_108_1:FormatText(var_111_3.content)

				arg_108_1.text_.text = var_111_4

				LuaForUtil.ClearLinePrefixSymbol(arg_108_1.text_)

				local var_111_5 = 10
				local var_111_6 = utf8.len(var_111_4)
				local var_111_7 = var_111_5 <= 0 and var_111_1 or var_111_1 * (var_111_6 / var_111_5)

				if var_111_7 > 0 and var_111_1 < var_111_7 then
					arg_108_1.talkMaxDuration = var_111_7

					if var_111_7 + var_111_0 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_7 + var_111_0
					end
				end

				arg_108_1.text_.text = var_111_4
				arg_108_1.typewritter.percent = 0

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051026", "story_v_out_417051.awb") ~= 0 then
					local var_111_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051026", "story_v_out_417051.awb") / 1000

					if var_111_8 + var_111_0 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_8 + var_111_0
					end

					if var_111_3.prefab_name ~= "" and arg_108_1.actors_[var_111_3.prefab_name] ~= nil then
						local var_111_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_108_1.actors_[var_111_3.prefab_name].transform, "story_v_out_417051", "417051026", "story_v_out_417051.awb")

						arg_108_1:RecordAudio("417051026", var_111_9)
						arg_108_1:RecordAudio("417051026", var_111_9)
					else
						arg_108_1:AudioAction("play", "voice", "story_v_out_417051", "417051026", "story_v_out_417051.awb")
					end

					arg_108_1:RecordHistoryTalkVoice("story_v_out_417051", "417051026", "story_v_out_417051.awb")
				end

				arg_108_1:RecordContent(arg_108_1.text_.text)
			end

			local var_111_10 = math.max(var_111_1, arg_108_1.talkMaxDuration)

			if var_111_0 <= arg_108_1.time_ and arg_108_1.time_ < var_111_0 + var_111_10 then
				arg_108_1.typewritter.percent = (arg_108_1.time_ - var_111_0) / var_111_10

				arg_108_1.typewritter:SetDirty()
			end

			if arg_108_1.time_ >= var_111_0 + var_111_10 and arg_108_1.time_ < var_111_0 + var_111_10 + arg_111_0 then
				arg_108_1.typewritter.percent = 1

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(true)
			end
		end
	end,
	Play417051027 = function(arg_112_0, arg_112_1)
		arg_112_1.time_ = 0
		arg_112_1.frameCnt_ = 0
		arg_112_1.state_ = "playing"
		arg_112_1.curTalkId_ = 417051027
		arg_112_1.duration_ = 3.33

		local var_112_0 = {
			zh = 1.4,
			ja = 3.333
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
				arg_112_0:Play417051028(arg_112_1)
			end
		end

		function arg_112_1.onSingleLineUpdate_(arg_115_0)
			local var_115_0 = arg_112_1.actors_["1034"]
			local var_115_1 = 0

			if var_115_1 < arg_112_1.time_ and arg_112_1.time_ <= var_115_1 + arg_115_0 and not isNil(var_115_0) and arg_112_1.var_.actorSpriteComps1034 == nil then
				arg_112_1.var_.actorSpriteComps1034 = var_115_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_115_2 = 0.2

			if var_115_1 <= arg_112_1.time_ and arg_112_1.time_ < var_115_1 + var_115_2 and not isNil(var_115_0) then
				local var_115_3 = (arg_112_1.time_ - var_115_1) / var_115_2

				if arg_112_1.var_.actorSpriteComps1034 then
					for iter_115_0, iter_115_1 in pairs(arg_112_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_115_1 then
							if arg_112_1.isInRecall_ then
								local var_115_4 = Mathf.Lerp(iter_115_1.color.r, arg_112_1.hightColor1.r, var_115_3)
								local var_115_5 = Mathf.Lerp(iter_115_1.color.g, arg_112_1.hightColor1.g, var_115_3)
								local var_115_6 = Mathf.Lerp(iter_115_1.color.b, arg_112_1.hightColor1.b, var_115_3)

								iter_115_1.color = Color.New(var_115_4, var_115_5, var_115_6)
							else
								local var_115_7 = Mathf.Lerp(iter_115_1.color.r, 1, var_115_3)

								iter_115_1.color = Color.New(var_115_7, var_115_7, var_115_7)
							end
						end
					end
				end
			end

			if arg_112_1.time_ >= var_115_1 + var_115_2 and arg_112_1.time_ < var_115_1 + var_115_2 + arg_115_0 and not isNil(var_115_0) and arg_112_1.var_.actorSpriteComps1034 then
				for iter_115_2, iter_115_3 in pairs(arg_112_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_115_3 then
						if arg_112_1.isInRecall_ then
							iter_115_3.color = arg_112_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_115_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_112_1.var_.actorSpriteComps1034 = nil
			end

			local var_115_8 = arg_112_1.actors_["1034"].transform
			local var_115_9 = 0

			if var_115_9 < arg_112_1.time_ and arg_112_1.time_ <= var_115_9 + arg_115_0 then
				arg_112_1.var_.moveOldPos1034 = var_115_8.localPosition
				var_115_8.localScale = Vector3.New(1, 1, 1)

				arg_112_1:CheckSpriteTmpPos("1034", 3)

				local var_115_10 = var_115_8.childCount

				for iter_115_4 = 0, var_115_10 - 1 do
					local var_115_11 = var_115_8:GetChild(iter_115_4)

					if var_115_11.name == "split_6" or not string.find(var_115_11.name, "split") then
						var_115_11.gameObject:SetActive(true)
					else
						var_115_11.gameObject:SetActive(false)
					end
				end
			end

			local var_115_12 = 0.001

			if var_115_9 <= arg_112_1.time_ and arg_112_1.time_ < var_115_9 + var_115_12 then
				local var_115_13 = (arg_112_1.time_ - var_115_9) / var_115_12
				local var_115_14 = Vector3.New(0, -331.9, -324)

				var_115_8.localPosition = Vector3.Lerp(arg_112_1.var_.moveOldPos1034, var_115_14, var_115_13)
			end

			if arg_112_1.time_ >= var_115_9 + var_115_12 and arg_112_1.time_ < var_115_9 + var_115_12 + arg_115_0 then
				var_115_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_115_15 = 0
			local var_115_16 = 0.125

			if var_115_15 < arg_112_1.time_ and arg_112_1.time_ <= var_115_15 + arg_115_0 then
				arg_112_1.talkMaxDuration = 0
				arg_112_1.dialogCg_.alpha = 1

				arg_112_1.dialog_:SetActive(true)
				SetActive(arg_112_1.leftNameGo_, true)

				local var_115_17 = arg_112_1:FormatText(StoryNameCfg[1109].name)

				arg_112_1.leftNameTxt_.text = var_115_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_112_1.leftNameTxt_.transform)

				arg_112_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_112_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_112_1:RecordName(arg_112_1.leftNameTxt_.text)
				SetActive(arg_112_1.iconTrs_.gameObject, false)
				arg_112_1.callingController_:SetSelectedState("normal")

				local var_115_18 = arg_112_1:GetWordFromCfg(417051027)
				local var_115_19 = arg_112_1:FormatText(var_115_18.content)

				arg_112_1.text_.text = var_115_19

				LuaForUtil.ClearLinePrefixSymbol(arg_112_1.text_)

				local var_115_20 = 5
				local var_115_21 = utf8.len(var_115_19)
				local var_115_22 = var_115_20 <= 0 and var_115_16 or var_115_16 * (var_115_21 / var_115_20)

				if var_115_22 > 0 and var_115_16 < var_115_22 then
					arg_112_1.talkMaxDuration = var_115_22

					if var_115_22 + var_115_15 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_22 + var_115_15
					end
				end

				arg_112_1.text_.text = var_115_19
				arg_112_1.typewritter.percent = 0

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051027", "story_v_out_417051.awb") ~= 0 then
					local var_115_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051027", "story_v_out_417051.awb") / 1000

					if var_115_23 + var_115_15 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_23 + var_115_15
					end

					if var_115_18.prefab_name ~= "" and arg_112_1.actors_[var_115_18.prefab_name] ~= nil then
						local var_115_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_112_1.actors_[var_115_18.prefab_name].transform, "story_v_out_417051", "417051027", "story_v_out_417051.awb")

						arg_112_1:RecordAudio("417051027", var_115_24)
						arg_112_1:RecordAudio("417051027", var_115_24)
					else
						arg_112_1:AudioAction("play", "voice", "story_v_out_417051", "417051027", "story_v_out_417051.awb")
					end

					arg_112_1:RecordHistoryTalkVoice("story_v_out_417051", "417051027", "story_v_out_417051.awb")
				end

				arg_112_1:RecordContent(arg_112_1.text_.text)
			end

			local var_115_25 = math.max(var_115_16, arg_112_1.talkMaxDuration)

			if var_115_15 <= arg_112_1.time_ and arg_112_1.time_ < var_115_15 + var_115_25 then
				arg_112_1.typewritter.percent = (arg_112_1.time_ - var_115_15) / var_115_25

				arg_112_1.typewritter:SetDirty()
			end

			if arg_112_1.time_ >= var_115_15 + var_115_25 and arg_112_1.time_ < var_115_15 + var_115_25 + arg_115_0 then
				arg_112_1.typewritter.percent = 1

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(true)
			end
		end
	end,
	Play417051028 = function(arg_116_0, arg_116_1)
		arg_116_1.time_ = 0
		arg_116_1.frameCnt_ = 0
		arg_116_1.state_ = "playing"
		arg_116_1.curTalkId_ = 417051028
		arg_116_1.duration_ = 10.23

		local var_116_0 = {
			zh = 9.666,
			ja = 10.233
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
				arg_116_0:Play417051029(arg_116_1)
			end
		end

		function arg_116_1.onSingleLineUpdate_(arg_119_0)
			local var_119_0 = arg_116_1.actors_["1034"]
			local var_119_1 = 0

			if var_119_1 < arg_116_1.time_ and arg_116_1.time_ <= var_119_1 + arg_119_0 and not isNil(var_119_0) and arg_116_1.var_.actorSpriteComps1034 == nil then
				arg_116_1.var_.actorSpriteComps1034 = var_119_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_119_2 = 0.2

			if var_119_1 <= arg_116_1.time_ and arg_116_1.time_ < var_119_1 + var_119_2 and not isNil(var_119_0) then
				local var_119_3 = (arg_116_1.time_ - var_119_1) / var_119_2

				if arg_116_1.var_.actorSpriteComps1034 then
					for iter_119_0, iter_119_1 in pairs(arg_116_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_119_1 then
							if arg_116_1.isInRecall_ then
								local var_119_4 = Mathf.Lerp(iter_119_1.color.r, arg_116_1.hightColor2.r, var_119_3)
								local var_119_5 = Mathf.Lerp(iter_119_1.color.g, arg_116_1.hightColor2.g, var_119_3)
								local var_119_6 = Mathf.Lerp(iter_119_1.color.b, arg_116_1.hightColor2.b, var_119_3)

								iter_119_1.color = Color.New(var_119_4, var_119_5, var_119_6)
							else
								local var_119_7 = Mathf.Lerp(iter_119_1.color.r, 0.5, var_119_3)

								iter_119_1.color = Color.New(var_119_7, var_119_7, var_119_7)
							end
						end
					end
				end
			end

			if arg_116_1.time_ >= var_119_1 + var_119_2 and arg_116_1.time_ < var_119_1 + var_119_2 + arg_119_0 and not isNil(var_119_0) and arg_116_1.var_.actorSpriteComps1034 then
				for iter_119_2, iter_119_3 in pairs(arg_116_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_119_3 then
						if arg_116_1.isInRecall_ then
							iter_119_3.color = arg_116_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_119_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_116_1.var_.actorSpriteComps1034 = nil
			end

			local var_119_8 = 0
			local var_119_9 = 1.175

			if var_119_8 < arg_116_1.time_ and arg_116_1.time_ <= var_119_8 + arg_119_0 then
				arg_116_1.talkMaxDuration = 0
				arg_116_1.dialogCg_.alpha = 1

				arg_116_1.dialog_:SetActive(true)
				SetActive(arg_116_1.leftNameGo_, true)

				local var_119_10 = arg_116_1:FormatText(StoryNameCfg[1123].name)

				arg_116_1.leftNameTxt_.text = var_119_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_116_1.leftNameTxt_.transform)

				arg_116_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_116_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_116_1:RecordName(arg_116_1.leftNameTxt_.text)
				SetActive(arg_116_1.iconTrs_.gameObject, true)
				arg_116_1.iconController_:SetSelectedState("hero")

				arg_116_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_116_1.callingController_:SetSelectedState("normal")

				arg_116_1.keyicon_.color = Color.New(1, 1, 1)
				arg_116_1.icon_.color = Color.New(1, 1, 1)

				local var_119_11 = arg_116_1:GetWordFromCfg(417051028)
				local var_119_12 = arg_116_1:FormatText(var_119_11.content)

				arg_116_1.text_.text = var_119_12

				LuaForUtil.ClearLinePrefixSymbol(arg_116_1.text_)

				local var_119_13 = 47
				local var_119_14 = utf8.len(var_119_12)
				local var_119_15 = var_119_13 <= 0 and var_119_9 or var_119_9 * (var_119_14 / var_119_13)

				if var_119_15 > 0 and var_119_9 < var_119_15 then
					arg_116_1.talkMaxDuration = var_119_15

					if var_119_15 + var_119_8 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_15 + var_119_8
					end
				end

				arg_116_1.text_.text = var_119_12
				arg_116_1.typewritter.percent = 0

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051028", "story_v_out_417051.awb") ~= 0 then
					local var_119_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051028", "story_v_out_417051.awb") / 1000

					if var_119_16 + var_119_8 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_16 + var_119_8
					end

					if var_119_11.prefab_name ~= "" and arg_116_1.actors_[var_119_11.prefab_name] ~= nil then
						local var_119_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_116_1.actors_[var_119_11.prefab_name].transform, "story_v_out_417051", "417051028", "story_v_out_417051.awb")

						arg_116_1:RecordAudio("417051028", var_119_17)
						arg_116_1:RecordAudio("417051028", var_119_17)
					else
						arg_116_1:AudioAction("play", "voice", "story_v_out_417051", "417051028", "story_v_out_417051.awb")
					end

					arg_116_1:RecordHistoryTalkVoice("story_v_out_417051", "417051028", "story_v_out_417051.awb")
				end

				arg_116_1:RecordContent(arg_116_1.text_.text)
			end

			local var_119_18 = math.max(var_119_9, arg_116_1.talkMaxDuration)

			if var_119_8 <= arg_116_1.time_ and arg_116_1.time_ < var_119_8 + var_119_18 then
				arg_116_1.typewritter.percent = (arg_116_1.time_ - var_119_8) / var_119_18

				arg_116_1.typewritter:SetDirty()
			end

			if arg_116_1.time_ >= var_119_8 + var_119_18 and arg_116_1.time_ < var_119_8 + var_119_18 + arg_119_0 then
				arg_116_1.typewritter.percent = 1

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(true)
			end
		end
	end,
	Play417051029 = function(arg_120_0, arg_120_1)
		arg_120_1.time_ = 0
		arg_120_1.frameCnt_ = 0
		arg_120_1.state_ = "playing"
		arg_120_1.curTalkId_ = 417051029
		arg_120_1.duration_ = 7.8

		local var_120_0 = {
			zh = 5.633,
			ja = 7.8
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
				arg_120_0:Play417051030(arg_120_1)
			end
		end

		function arg_120_1.onSingleLineUpdate_(arg_123_0)
			local var_123_0 = arg_120_1.actors_["1034"]
			local var_123_1 = 0

			if var_123_1 < arg_120_1.time_ and arg_120_1.time_ <= var_123_1 + arg_123_0 and not isNil(var_123_0) and arg_120_1.var_.actorSpriteComps1034 == nil then
				arg_120_1.var_.actorSpriteComps1034 = var_123_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_123_2 = 0.2

			if var_123_1 <= arg_120_1.time_ and arg_120_1.time_ < var_123_1 + var_123_2 and not isNil(var_123_0) then
				local var_123_3 = (arg_120_1.time_ - var_123_1) / var_123_2

				if arg_120_1.var_.actorSpriteComps1034 then
					for iter_123_0, iter_123_1 in pairs(arg_120_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_123_1 then
							if arg_120_1.isInRecall_ then
								local var_123_4 = Mathf.Lerp(iter_123_1.color.r, arg_120_1.hightColor1.r, var_123_3)
								local var_123_5 = Mathf.Lerp(iter_123_1.color.g, arg_120_1.hightColor1.g, var_123_3)
								local var_123_6 = Mathf.Lerp(iter_123_1.color.b, arg_120_1.hightColor1.b, var_123_3)

								iter_123_1.color = Color.New(var_123_4, var_123_5, var_123_6)
							else
								local var_123_7 = Mathf.Lerp(iter_123_1.color.r, 1, var_123_3)

								iter_123_1.color = Color.New(var_123_7, var_123_7, var_123_7)
							end
						end
					end
				end
			end

			if arg_120_1.time_ >= var_123_1 + var_123_2 and arg_120_1.time_ < var_123_1 + var_123_2 + arg_123_0 and not isNil(var_123_0) and arg_120_1.var_.actorSpriteComps1034 then
				for iter_123_2, iter_123_3 in pairs(arg_120_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_123_3 then
						if arg_120_1.isInRecall_ then
							iter_123_3.color = arg_120_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_123_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_120_1.var_.actorSpriteComps1034 = nil
			end

			local var_123_8 = 0
			local var_123_9 = 0.575

			if var_123_8 < arg_120_1.time_ and arg_120_1.time_ <= var_123_8 + arg_123_0 then
				arg_120_1.talkMaxDuration = 0
				arg_120_1.dialogCg_.alpha = 1

				arg_120_1.dialog_:SetActive(true)
				SetActive(arg_120_1.leftNameGo_, true)

				local var_123_10 = arg_120_1:FormatText(StoryNameCfg[1109].name)

				arg_120_1.leftNameTxt_.text = var_123_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_120_1.leftNameTxt_.transform)

				arg_120_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_120_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_120_1:RecordName(arg_120_1.leftNameTxt_.text)
				SetActive(arg_120_1.iconTrs_.gameObject, false)
				arg_120_1.callingController_:SetSelectedState("normal")

				local var_123_11 = arg_120_1:GetWordFromCfg(417051029)
				local var_123_12 = arg_120_1:FormatText(var_123_11.content)

				arg_120_1.text_.text = var_123_12

				LuaForUtil.ClearLinePrefixSymbol(arg_120_1.text_)

				local var_123_13 = 23
				local var_123_14 = utf8.len(var_123_12)
				local var_123_15 = var_123_13 <= 0 and var_123_9 or var_123_9 * (var_123_14 / var_123_13)

				if var_123_15 > 0 and var_123_9 < var_123_15 then
					arg_120_1.talkMaxDuration = var_123_15

					if var_123_15 + var_123_8 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_15 + var_123_8
					end
				end

				arg_120_1.text_.text = var_123_12
				arg_120_1.typewritter.percent = 0

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051029", "story_v_out_417051.awb") ~= 0 then
					local var_123_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051029", "story_v_out_417051.awb") / 1000

					if var_123_16 + var_123_8 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_16 + var_123_8
					end

					if var_123_11.prefab_name ~= "" and arg_120_1.actors_[var_123_11.prefab_name] ~= nil then
						local var_123_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_120_1.actors_[var_123_11.prefab_name].transform, "story_v_out_417051", "417051029", "story_v_out_417051.awb")

						arg_120_1:RecordAudio("417051029", var_123_17)
						arg_120_1:RecordAudio("417051029", var_123_17)
					else
						arg_120_1:AudioAction("play", "voice", "story_v_out_417051", "417051029", "story_v_out_417051.awb")
					end

					arg_120_1:RecordHistoryTalkVoice("story_v_out_417051", "417051029", "story_v_out_417051.awb")
				end

				arg_120_1:RecordContent(arg_120_1.text_.text)
			end

			local var_123_18 = math.max(var_123_9, arg_120_1.talkMaxDuration)

			if var_123_8 <= arg_120_1.time_ and arg_120_1.time_ < var_123_8 + var_123_18 then
				arg_120_1.typewritter.percent = (arg_120_1.time_ - var_123_8) / var_123_18

				arg_120_1.typewritter:SetDirty()
			end

			if arg_120_1.time_ >= var_123_8 + var_123_18 and arg_120_1.time_ < var_123_8 + var_123_18 + arg_123_0 then
				arg_120_1.typewritter.percent = 1

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(true)
			end
		end
	end,
	Play417051030 = function(arg_124_0, arg_124_1)
		arg_124_1.time_ = 0
		arg_124_1.frameCnt_ = 0
		arg_124_1.state_ = "playing"
		arg_124_1.curTalkId_ = 417051030
		arg_124_1.duration_ = 5

		SetActive(arg_124_1.tipsGo_, false)

		function arg_124_1.onSingleLineFinish_()
			arg_124_1.onSingleLineUpdate_ = nil
			arg_124_1.onSingleLineFinish_ = nil
			arg_124_1.state_ = "waiting"
		end

		function arg_124_1.playNext_(arg_126_0)
			if arg_126_0 == 1 then
				arg_124_0:Play417051031(arg_124_1)
			end
		end

		function arg_124_1.onSingleLineUpdate_(arg_127_0)
			local var_127_0 = arg_124_1.actors_["1034"]
			local var_127_1 = 0

			if var_127_1 < arg_124_1.time_ and arg_124_1.time_ <= var_127_1 + arg_127_0 and not isNil(var_127_0) and arg_124_1.var_.actorSpriteComps1034 == nil then
				arg_124_1.var_.actorSpriteComps1034 = var_127_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_127_2 = 0.2

			if var_127_1 <= arg_124_1.time_ and arg_124_1.time_ < var_127_1 + var_127_2 and not isNil(var_127_0) then
				local var_127_3 = (arg_124_1.time_ - var_127_1) / var_127_2

				if arg_124_1.var_.actorSpriteComps1034 then
					for iter_127_0, iter_127_1 in pairs(arg_124_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_127_1 then
							if arg_124_1.isInRecall_ then
								local var_127_4 = Mathf.Lerp(iter_127_1.color.r, arg_124_1.hightColor2.r, var_127_3)
								local var_127_5 = Mathf.Lerp(iter_127_1.color.g, arg_124_1.hightColor2.g, var_127_3)
								local var_127_6 = Mathf.Lerp(iter_127_1.color.b, arg_124_1.hightColor2.b, var_127_3)

								iter_127_1.color = Color.New(var_127_4, var_127_5, var_127_6)
							else
								local var_127_7 = Mathf.Lerp(iter_127_1.color.r, 0.5, var_127_3)

								iter_127_1.color = Color.New(var_127_7, var_127_7, var_127_7)
							end
						end
					end
				end
			end

			if arg_124_1.time_ >= var_127_1 + var_127_2 and arg_124_1.time_ < var_127_1 + var_127_2 + arg_127_0 and not isNil(var_127_0) and arg_124_1.var_.actorSpriteComps1034 then
				for iter_127_2, iter_127_3 in pairs(arg_124_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_127_3 then
						if arg_124_1.isInRecall_ then
							iter_127_3.color = arg_124_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_127_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_124_1.var_.actorSpriteComps1034 = nil
			end

			local var_127_8 = 0
			local var_127_9 = 1.175

			if var_127_8 < arg_124_1.time_ and arg_124_1.time_ <= var_127_8 + arg_127_0 then
				arg_124_1.talkMaxDuration = 0
				arg_124_1.dialogCg_.alpha = 1

				arg_124_1.dialog_:SetActive(true)
				SetActive(arg_124_1.leftNameGo_, false)

				arg_124_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_124_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_124_1:RecordName(arg_124_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_124_1.iconTrs_.gameObject, false)
				arg_124_1.callingController_:SetSelectedState("normal")

				local var_127_10 = arg_124_1:GetWordFromCfg(417051030)
				local var_127_11 = arg_124_1:FormatText(var_127_10.content)

				arg_124_1.text_.text = var_127_11

				LuaForUtil.ClearLinePrefixSymbol(arg_124_1.text_)

				local var_127_12 = 47
				local var_127_13 = utf8.len(var_127_11)
				local var_127_14 = var_127_12 <= 0 and var_127_9 or var_127_9 * (var_127_13 / var_127_12)

				if var_127_14 > 0 and var_127_9 < var_127_14 then
					arg_124_1.talkMaxDuration = var_127_14

					if var_127_14 + var_127_8 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_14 + var_127_8
					end
				end

				arg_124_1.text_.text = var_127_11
				arg_124_1.typewritter.percent = 0

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(false)
				arg_124_1:RecordContent(arg_124_1.text_.text)
			end

			local var_127_15 = math.max(var_127_9, arg_124_1.talkMaxDuration)

			if var_127_8 <= arg_124_1.time_ and arg_124_1.time_ < var_127_8 + var_127_15 then
				arg_124_1.typewritter.percent = (arg_124_1.time_ - var_127_8) / var_127_15

				arg_124_1.typewritter:SetDirty()
			end

			if arg_124_1.time_ >= var_127_8 + var_127_15 and arg_124_1.time_ < var_127_8 + var_127_15 + arg_127_0 then
				arg_124_1.typewritter.percent = 1

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(true)
			end
		end
	end,
	Play417051031 = function(arg_128_0, arg_128_1)
		arg_128_1.time_ = 0
		arg_128_1.frameCnt_ = 0
		arg_128_1.state_ = "playing"
		arg_128_1.curTalkId_ = 417051031
		arg_128_1.duration_ = 9.97

		local var_128_0 = {
			zh = 8.233,
			ja = 9.966
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
				arg_128_0:Play417051032(arg_128_1)
			end
		end

		function arg_128_1.onSingleLineUpdate_(arg_131_0)
			local var_131_0 = 0
			local var_131_1 = 0.7

			if var_131_0 < arg_128_1.time_ and arg_128_1.time_ <= var_131_0 + arg_131_0 then
				arg_128_1.talkMaxDuration = 0
				arg_128_1.dialogCg_.alpha = 1

				arg_128_1.dialog_:SetActive(true)
				SetActive(arg_128_1.leftNameGo_, true)

				local var_131_2 = arg_128_1:FormatText(StoryNameCfg[1123].name)

				arg_128_1.leftNameTxt_.text = var_131_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_128_1.leftNameTxt_.transform)

				arg_128_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_128_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_128_1:RecordName(arg_128_1.leftNameTxt_.text)
				SetActive(arg_128_1.iconTrs_.gameObject, true)
				arg_128_1.iconController_:SetSelectedState("hero")

				arg_128_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_128_1.callingController_:SetSelectedState("normal")

				arg_128_1.keyicon_.color = Color.New(1, 1, 1)
				arg_128_1.icon_.color = Color.New(1, 1, 1)

				local var_131_3 = arg_128_1:GetWordFromCfg(417051031)
				local var_131_4 = arg_128_1:FormatText(var_131_3.content)

				arg_128_1.text_.text = var_131_4

				LuaForUtil.ClearLinePrefixSymbol(arg_128_1.text_)

				local var_131_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051031", "story_v_out_417051.awb") ~= 0 then
					local var_131_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051031", "story_v_out_417051.awb") / 1000

					if var_131_8 + var_131_0 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_8 + var_131_0
					end

					if var_131_3.prefab_name ~= "" and arg_128_1.actors_[var_131_3.prefab_name] ~= nil then
						local var_131_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_128_1.actors_[var_131_3.prefab_name].transform, "story_v_out_417051", "417051031", "story_v_out_417051.awb")

						arg_128_1:RecordAudio("417051031", var_131_9)
						arg_128_1:RecordAudio("417051031", var_131_9)
					else
						arg_128_1:AudioAction("play", "voice", "story_v_out_417051", "417051031", "story_v_out_417051.awb")
					end

					arg_128_1:RecordHistoryTalkVoice("story_v_out_417051", "417051031", "story_v_out_417051.awb")
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
	Play417051032 = function(arg_132_0, arg_132_1)
		arg_132_1.time_ = 0
		arg_132_1.frameCnt_ = 0
		arg_132_1.state_ = "playing"
		arg_132_1.curTalkId_ = 417051032
		arg_132_1.duration_ = 8.23

		local var_132_0 = {
			zh = 3.433,
			ja = 8.233
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
				arg_132_0:Play417051033(arg_132_1)
			end
		end

		function arg_132_1.onSingleLineUpdate_(arg_135_0)
			local var_135_0 = arg_132_1.actors_["1034"]
			local var_135_1 = 0

			if var_135_1 < arg_132_1.time_ and arg_132_1.time_ <= var_135_1 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.actorSpriteComps1034 == nil then
				arg_132_1.var_.actorSpriteComps1034 = var_135_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_135_2 = 0.2

			if var_135_1 <= arg_132_1.time_ and arg_132_1.time_ < var_135_1 + var_135_2 and not isNil(var_135_0) then
				local var_135_3 = (arg_132_1.time_ - var_135_1) / var_135_2

				if arg_132_1.var_.actorSpriteComps1034 then
					for iter_135_0, iter_135_1 in pairs(arg_132_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_135_1 then
							if arg_132_1.isInRecall_ then
								local var_135_4 = Mathf.Lerp(iter_135_1.color.r, arg_132_1.hightColor1.r, var_135_3)
								local var_135_5 = Mathf.Lerp(iter_135_1.color.g, arg_132_1.hightColor1.g, var_135_3)
								local var_135_6 = Mathf.Lerp(iter_135_1.color.b, arg_132_1.hightColor1.b, var_135_3)

								iter_135_1.color = Color.New(var_135_4, var_135_5, var_135_6)
							else
								local var_135_7 = Mathf.Lerp(iter_135_1.color.r, 1, var_135_3)

								iter_135_1.color = Color.New(var_135_7, var_135_7, var_135_7)
							end
						end
					end
				end
			end

			if arg_132_1.time_ >= var_135_1 + var_135_2 and arg_132_1.time_ < var_135_1 + var_135_2 + arg_135_0 and not isNil(var_135_0) and arg_132_1.var_.actorSpriteComps1034 then
				for iter_135_2, iter_135_3 in pairs(arg_132_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_135_3 then
						if arg_132_1.isInRecall_ then
							iter_135_3.color = arg_132_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_135_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_132_1.var_.actorSpriteComps1034 = nil
			end

			local var_135_8 = 0
			local var_135_9 = 0.425

			if var_135_8 < arg_132_1.time_ and arg_132_1.time_ <= var_135_8 + arg_135_0 then
				arg_132_1.talkMaxDuration = 0
				arg_132_1.dialogCg_.alpha = 1

				arg_132_1.dialog_:SetActive(true)
				SetActive(arg_132_1.leftNameGo_, true)

				local var_135_10 = arg_132_1:FormatText(StoryNameCfg[1109].name)

				arg_132_1.leftNameTxt_.text = var_135_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_132_1.leftNameTxt_.transform)

				arg_132_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_132_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_132_1:RecordName(arg_132_1.leftNameTxt_.text)
				SetActive(arg_132_1.iconTrs_.gameObject, false)
				arg_132_1.callingController_:SetSelectedState("normal")

				local var_135_11 = arg_132_1:GetWordFromCfg(417051032)
				local var_135_12 = arg_132_1:FormatText(var_135_11.content)

				arg_132_1.text_.text = var_135_12

				LuaForUtil.ClearLinePrefixSymbol(arg_132_1.text_)

				local var_135_13 = 17
				local var_135_14 = utf8.len(var_135_12)
				local var_135_15 = var_135_13 <= 0 and var_135_9 or var_135_9 * (var_135_14 / var_135_13)

				if var_135_15 > 0 and var_135_9 < var_135_15 then
					arg_132_1.talkMaxDuration = var_135_15

					if var_135_15 + var_135_8 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_15 + var_135_8
					end
				end

				arg_132_1.text_.text = var_135_12
				arg_132_1.typewritter.percent = 0

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051032", "story_v_out_417051.awb") ~= 0 then
					local var_135_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051032", "story_v_out_417051.awb") / 1000

					if var_135_16 + var_135_8 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_16 + var_135_8
					end

					if var_135_11.prefab_name ~= "" and arg_132_1.actors_[var_135_11.prefab_name] ~= nil then
						local var_135_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_132_1.actors_[var_135_11.prefab_name].transform, "story_v_out_417051", "417051032", "story_v_out_417051.awb")

						arg_132_1:RecordAudio("417051032", var_135_17)
						arg_132_1:RecordAudio("417051032", var_135_17)
					else
						arg_132_1:AudioAction("play", "voice", "story_v_out_417051", "417051032", "story_v_out_417051.awb")
					end

					arg_132_1:RecordHistoryTalkVoice("story_v_out_417051", "417051032", "story_v_out_417051.awb")
				end

				arg_132_1:RecordContent(arg_132_1.text_.text)
			end

			local var_135_18 = math.max(var_135_9, arg_132_1.talkMaxDuration)

			if var_135_8 <= arg_132_1.time_ and arg_132_1.time_ < var_135_8 + var_135_18 then
				arg_132_1.typewritter.percent = (arg_132_1.time_ - var_135_8) / var_135_18

				arg_132_1.typewritter:SetDirty()
			end

			if arg_132_1.time_ >= var_135_8 + var_135_18 and arg_132_1.time_ < var_135_8 + var_135_18 + arg_135_0 then
				arg_132_1.typewritter.percent = 1

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(true)
			end
		end
	end,
	Play417051033 = function(arg_136_0, arg_136_1)
		arg_136_1.time_ = 0
		arg_136_1.frameCnt_ = 0
		arg_136_1.state_ = "playing"
		arg_136_1.curTalkId_ = 417051033
		arg_136_1.duration_ = 7.53

		local var_136_0 = {
			zh = 4.066,
			ja = 7.533
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
				arg_136_0:Play417051034(arg_136_1)
			end
		end

		function arg_136_1.onSingleLineUpdate_(arg_139_0)
			local var_139_0 = arg_136_1.actors_["1034"]
			local var_139_1 = 0

			if var_139_1 < arg_136_1.time_ and arg_136_1.time_ <= var_139_1 + arg_139_0 and not isNil(var_139_0) and arg_136_1.var_.actorSpriteComps1034 == nil then
				arg_136_1.var_.actorSpriteComps1034 = var_139_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_139_2 = 0.2

			if var_139_1 <= arg_136_1.time_ and arg_136_1.time_ < var_139_1 + var_139_2 and not isNil(var_139_0) then
				local var_139_3 = (arg_136_1.time_ - var_139_1) / var_139_2

				if arg_136_1.var_.actorSpriteComps1034 then
					for iter_139_0, iter_139_1 in pairs(arg_136_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_139_1 then
							if arg_136_1.isInRecall_ then
								local var_139_4 = Mathf.Lerp(iter_139_1.color.r, arg_136_1.hightColor2.r, var_139_3)
								local var_139_5 = Mathf.Lerp(iter_139_1.color.g, arg_136_1.hightColor2.g, var_139_3)
								local var_139_6 = Mathf.Lerp(iter_139_1.color.b, arg_136_1.hightColor2.b, var_139_3)

								iter_139_1.color = Color.New(var_139_4, var_139_5, var_139_6)
							else
								local var_139_7 = Mathf.Lerp(iter_139_1.color.r, 0.5, var_139_3)

								iter_139_1.color = Color.New(var_139_7, var_139_7, var_139_7)
							end
						end
					end
				end
			end

			if arg_136_1.time_ >= var_139_1 + var_139_2 and arg_136_1.time_ < var_139_1 + var_139_2 + arg_139_0 and not isNil(var_139_0) and arg_136_1.var_.actorSpriteComps1034 then
				for iter_139_2, iter_139_3 in pairs(arg_136_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_139_3 then
						if arg_136_1.isInRecall_ then
							iter_139_3.color = arg_136_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_139_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_136_1.var_.actorSpriteComps1034 = nil
			end

			local var_139_8 = 0
			local var_139_9 = 0.275

			if var_139_8 < arg_136_1.time_ and arg_136_1.time_ <= var_139_8 + arg_139_0 then
				arg_136_1.talkMaxDuration = 0
				arg_136_1.dialogCg_.alpha = 1

				arg_136_1.dialog_:SetActive(true)
				SetActive(arg_136_1.leftNameGo_, true)

				local var_139_10 = arg_136_1:FormatText(StoryNameCfg[1123].name)

				arg_136_1.leftNameTxt_.text = var_139_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_136_1.leftNameTxt_.transform)

				arg_136_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_136_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_136_1:RecordName(arg_136_1.leftNameTxt_.text)
				SetActive(arg_136_1.iconTrs_.gameObject, true)
				arg_136_1.iconController_:SetSelectedState("hero")

				arg_136_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_136_1.callingController_:SetSelectedState("normal")

				arg_136_1.keyicon_.color = Color.New(1, 1, 1)
				arg_136_1.icon_.color = Color.New(1, 1, 1)

				local var_139_11 = arg_136_1:GetWordFromCfg(417051033)
				local var_139_12 = arg_136_1:FormatText(var_139_11.content)

				arg_136_1.text_.text = var_139_12

				LuaForUtil.ClearLinePrefixSymbol(arg_136_1.text_)

				local var_139_13 = 11
				local var_139_14 = utf8.len(var_139_12)
				local var_139_15 = var_139_13 <= 0 and var_139_9 or var_139_9 * (var_139_14 / var_139_13)

				if var_139_15 > 0 and var_139_9 < var_139_15 then
					arg_136_1.talkMaxDuration = var_139_15

					if var_139_15 + var_139_8 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_15 + var_139_8
					end
				end

				arg_136_1.text_.text = var_139_12
				arg_136_1.typewritter.percent = 0

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051033", "story_v_out_417051.awb") ~= 0 then
					local var_139_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051033", "story_v_out_417051.awb") / 1000

					if var_139_16 + var_139_8 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_16 + var_139_8
					end

					if var_139_11.prefab_name ~= "" and arg_136_1.actors_[var_139_11.prefab_name] ~= nil then
						local var_139_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_136_1.actors_[var_139_11.prefab_name].transform, "story_v_out_417051", "417051033", "story_v_out_417051.awb")

						arg_136_1:RecordAudio("417051033", var_139_17)
						arg_136_1:RecordAudio("417051033", var_139_17)
					else
						arg_136_1:AudioAction("play", "voice", "story_v_out_417051", "417051033", "story_v_out_417051.awb")
					end

					arg_136_1:RecordHistoryTalkVoice("story_v_out_417051", "417051033", "story_v_out_417051.awb")
				end

				arg_136_1:RecordContent(arg_136_1.text_.text)
			end

			local var_139_18 = math.max(var_139_9, arg_136_1.talkMaxDuration)

			if var_139_8 <= arg_136_1.time_ and arg_136_1.time_ < var_139_8 + var_139_18 then
				arg_136_1.typewritter.percent = (arg_136_1.time_ - var_139_8) / var_139_18

				arg_136_1.typewritter:SetDirty()
			end

			if arg_136_1.time_ >= var_139_8 + var_139_18 and arg_136_1.time_ < var_139_8 + var_139_18 + arg_139_0 then
				arg_136_1.typewritter.percent = 1

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(true)
			end
		end
	end,
	Play417051034 = function(arg_140_0, arg_140_1)
		arg_140_1.time_ = 0
		arg_140_1.frameCnt_ = 0
		arg_140_1.state_ = "playing"
		arg_140_1.curTalkId_ = 417051034
		arg_140_1.duration_ = 6.67

		local var_140_0 = {
			zh = 5.333,
			ja = 6.666
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
				arg_140_0:Play417051035(arg_140_1)
			end
		end

		function arg_140_1.onSingleLineUpdate_(arg_143_0)
			local var_143_0 = arg_140_1.actors_["1034"]
			local var_143_1 = 0

			if var_143_1 < arg_140_1.time_ and arg_140_1.time_ <= var_143_1 + arg_143_0 and not isNil(var_143_0) and arg_140_1.var_.actorSpriteComps1034 == nil then
				arg_140_1.var_.actorSpriteComps1034 = var_143_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_143_2 = 0.2

			if var_143_1 <= arg_140_1.time_ and arg_140_1.time_ < var_143_1 + var_143_2 and not isNil(var_143_0) then
				local var_143_3 = (arg_140_1.time_ - var_143_1) / var_143_2

				if arg_140_1.var_.actorSpriteComps1034 then
					for iter_143_0, iter_143_1 in pairs(arg_140_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_143_1 then
							if arg_140_1.isInRecall_ then
								local var_143_4 = Mathf.Lerp(iter_143_1.color.r, arg_140_1.hightColor1.r, var_143_3)
								local var_143_5 = Mathf.Lerp(iter_143_1.color.g, arg_140_1.hightColor1.g, var_143_3)
								local var_143_6 = Mathf.Lerp(iter_143_1.color.b, arg_140_1.hightColor1.b, var_143_3)

								iter_143_1.color = Color.New(var_143_4, var_143_5, var_143_6)
							else
								local var_143_7 = Mathf.Lerp(iter_143_1.color.r, 1, var_143_3)

								iter_143_1.color = Color.New(var_143_7, var_143_7, var_143_7)
							end
						end
					end
				end
			end

			if arg_140_1.time_ >= var_143_1 + var_143_2 and arg_140_1.time_ < var_143_1 + var_143_2 + arg_143_0 and not isNil(var_143_0) and arg_140_1.var_.actorSpriteComps1034 then
				for iter_143_2, iter_143_3 in pairs(arg_140_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_143_3 then
						if arg_140_1.isInRecall_ then
							iter_143_3.color = arg_140_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_143_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_140_1.var_.actorSpriteComps1034 = nil
			end

			local var_143_8 = arg_140_1.actors_["1034"].transform
			local var_143_9 = 0

			if var_143_9 < arg_140_1.time_ and arg_140_1.time_ <= var_143_9 + arg_143_0 then
				arg_140_1.var_.moveOldPos1034 = var_143_8.localPosition
				var_143_8.localScale = Vector3.New(1, 1, 1)

				arg_140_1:CheckSpriteTmpPos("1034", 3)

				local var_143_10 = var_143_8.childCount

				for iter_143_4 = 0, var_143_10 - 1 do
					local var_143_11 = var_143_8:GetChild(iter_143_4)

					if var_143_11.name == "split_3" or not string.find(var_143_11.name, "split") then
						var_143_11.gameObject:SetActive(true)
					else
						var_143_11.gameObject:SetActive(false)
					end
				end
			end

			local var_143_12 = 0.001

			if var_143_9 <= arg_140_1.time_ and arg_140_1.time_ < var_143_9 + var_143_12 then
				local var_143_13 = (arg_140_1.time_ - var_143_9) / var_143_12
				local var_143_14 = Vector3.New(0, -331.9, -324)

				var_143_8.localPosition = Vector3.Lerp(arg_140_1.var_.moveOldPos1034, var_143_14, var_143_13)
			end

			if arg_140_1.time_ >= var_143_9 + var_143_12 and arg_140_1.time_ < var_143_9 + var_143_12 + arg_143_0 then
				var_143_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_143_15 = 0
			local var_143_16 = 0.45

			if var_143_15 < arg_140_1.time_ and arg_140_1.time_ <= var_143_15 + arg_143_0 then
				arg_140_1.talkMaxDuration = 0
				arg_140_1.dialogCg_.alpha = 1

				arg_140_1.dialog_:SetActive(true)
				SetActive(arg_140_1.leftNameGo_, true)

				local var_143_17 = arg_140_1:FormatText(StoryNameCfg[1109].name)

				arg_140_1.leftNameTxt_.text = var_143_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_140_1.leftNameTxt_.transform)

				arg_140_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_140_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_140_1:RecordName(arg_140_1.leftNameTxt_.text)
				SetActive(arg_140_1.iconTrs_.gameObject, false)
				arg_140_1.callingController_:SetSelectedState("normal")

				local var_143_18 = arg_140_1:GetWordFromCfg(417051034)
				local var_143_19 = arg_140_1:FormatText(var_143_18.content)

				arg_140_1.text_.text = var_143_19

				LuaForUtil.ClearLinePrefixSymbol(arg_140_1.text_)

				local var_143_20 = 18
				local var_143_21 = utf8.len(var_143_19)
				local var_143_22 = var_143_20 <= 0 and var_143_16 or var_143_16 * (var_143_21 / var_143_20)

				if var_143_22 > 0 and var_143_16 < var_143_22 then
					arg_140_1.talkMaxDuration = var_143_22

					if var_143_22 + var_143_15 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_22 + var_143_15
					end
				end

				arg_140_1.text_.text = var_143_19
				arg_140_1.typewritter.percent = 0

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051034", "story_v_out_417051.awb") ~= 0 then
					local var_143_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051034", "story_v_out_417051.awb") / 1000

					if var_143_23 + var_143_15 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_23 + var_143_15
					end

					if var_143_18.prefab_name ~= "" and arg_140_1.actors_[var_143_18.prefab_name] ~= nil then
						local var_143_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_140_1.actors_[var_143_18.prefab_name].transform, "story_v_out_417051", "417051034", "story_v_out_417051.awb")

						arg_140_1:RecordAudio("417051034", var_143_24)
						arg_140_1:RecordAudio("417051034", var_143_24)
					else
						arg_140_1:AudioAction("play", "voice", "story_v_out_417051", "417051034", "story_v_out_417051.awb")
					end

					arg_140_1:RecordHistoryTalkVoice("story_v_out_417051", "417051034", "story_v_out_417051.awb")
				end

				arg_140_1:RecordContent(arg_140_1.text_.text)
			end

			local var_143_25 = math.max(var_143_16, arg_140_1.talkMaxDuration)

			if var_143_15 <= arg_140_1.time_ and arg_140_1.time_ < var_143_15 + var_143_25 then
				arg_140_1.typewritter.percent = (arg_140_1.time_ - var_143_15) / var_143_25

				arg_140_1.typewritter:SetDirty()
			end

			if arg_140_1.time_ >= var_143_15 + var_143_25 and arg_140_1.time_ < var_143_15 + var_143_25 + arg_143_0 then
				arg_140_1.typewritter.percent = 1

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(true)
			end
		end
	end,
	Play417051035 = function(arg_144_0, arg_144_1)
		arg_144_1.time_ = 0
		arg_144_1.frameCnt_ = 0
		arg_144_1.state_ = "playing"
		arg_144_1.curTalkId_ = 417051035
		arg_144_1.duration_ = 5.87

		local var_144_0 = {
			zh = 4.1,
			ja = 5.866
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
				arg_144_0:Play417051036(arg_144_1)
			end
		end

		function arg_144_1.onSingleLineUpdate_(arg_147_0)
			local var_147_0 = 0
			local var_147_1 = 0.55

			if var_147_0 < arg_144_1.time_ and arg_144_1.time_ <= var_147_0 + arg_147_0 then
				arg_144_1.talkMaxDuration = 0
				arg_144_1.dialogCg_.alpha = 1

				arg_144_1.dialog_:SetActive(true)
				SetActive(arg_144_1.leftNameGo_, true)

				local var_147_2 = arg_144_1:FormatText(StoryNameCfg[1109].name)

				arg_144_1.leftNameTxt_.text = var_147_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_144_1.leftNameTxt_.transform)

				arg_144_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_144_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_144_1:RecordName(arg_144_1.leftNameTxt_.text)
				SetActive(arg_144_1.iconTrs_.gameObject, false)
				arg_144_1.callingController_:SetSelectedState("normal")

				local var_147_3 = arg_144_1:GetWordFromCfg(417051035)
				local var_147_4 = arg_144_1:FormatText(var_147_3.content)

				arg_144_1.text_.text = var_147_4

				LuaForUtil.ClearLinePrefixSymbol(arg_144_1.text_)

				local var_147_5 = 22
				local var_147_6 = utf8.len(var_147_4)
				local var_147_7 = var_147_5 <= 0 and var_147_1 or var_147_1 * (var_147_6 / var_147_5)

				if var_147_7 > 0 and var_147_1 < var_147_7 then
					arg_144_1.talkMaxDuration = var_147_7

					if var_147_7 + var_147_0 > arg_144_1.duration_ then
						arg_144_1.duration_ = var_147_7 + var_147_0
					end
				end

				arg_144_1.text_.text = var_147_4
				arg_144_1.typewritter.percent = 0

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051035", "story_v_out_417051.awb") ~= 0 then
					local var_147_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051035", "story_v_out_417051.awb") / 1000

					if var_147_8 + var_147_0 > arg_144_1.duration_ then
						arg_144_1.duration_ = var_147_8 + var_147_0
					end

					if var_147_3.prefab_name ~= "" and arg_144_1.actors_[var_147_3.prefab_name] ~= nil then
						local var_147_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_144_1.actors_[var_147_3.prefab_name].transform, "story_v_out_417051", "417051035", "story_v_out_417051.awb")

						arg_144_1:RecordAudio("417051035", var_147_9)
						arg_144_1:RecordAudio("417051035", var_147_9)
					else
						arg_144_1:AudioAction("play", "voice", "story_v_out_417051", "417051035", "story_v_out_417051.awb")
					end

					arg_144_1:RecordHistoryTalkVoice("story_v_out_417051", "417051035", "story_v_out_417051.awb")
				end

				arg_144_1:RecordContent(arg_144_1.text_.text)
			end

			local var_147_10 = math.max(var_147_1, arg_144_1.talkMaxDuration)

			if var_147_0 <= arg_144_1.time_ and arg_144_1.time_ < var_147_0 + var_147_10 then
				arg_144_1.typewritter.percent = (arg_144_1.time_ - var_147_0) / var_147_10

				arg_144_1.typewritter:SetDirty()
			end

			if arg_144_1.time_ >= var_147_0 + var_147_10 and arg_144_1.time_ < var_147_0 + var_147_10 + arg_147_0 then
				arg_144_1.typewritter.percent = 1

				arg_144_1.typewritter:SetDirty()
				arg_144_1:ShowNextGo(true)
			end
		end
	end,
	Play417051036 = function(arg_148_0, arg_148_1)
		arg_148_1.time_ = 0
		arg_148_1.frameCnt_ = 0
		arg_148_1.state_ = "playing"
		arg_148_1.curTalkId_ = 417051036
		arg_148_1.duration_ = 4.07

		local var_148_0 = {
			zh = 2.033,
			ja = 4.066
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
				arg_148_0:Play417051037(arg_148_1)
			end
		end

		function arg_148_1.onSingleLineUpdate_(arg_151_0)
			local var_151_0 = 0
			local var_151_1 = 0.2

			if var_151_0 < arg_148_1.time_ and arg_148_1.time_ <= var_151_0 + arg_151_0 then
				arg_148_1.talkMaxDuration = 0
				arg_148_1.dialogCg_.alpha = 1

				arg_148_1.dialog_:SetActive(true)
				SetActive(arg_148_1.leftNameGo_, true)

				local var_151_2 = arg_148_1:FormatText(StoryNameCfg[1109].name)

				arg_148_1.leftNameTxt_.text = var_151_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_148_1.leftNameTxt_.transform)

				arg_148_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_148_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_148_1:RecordName(arg_148_1.leftNameTxt_.text)
				SetActive(arg_148_1.iconTrs_.gameObject, false)
				arg_148_1.callingController_:SetSelectedState("normal")

				local var_151_3 = arg_148_1:GetWordFromCfg(417051036)
				local var_151_4 = arg_148_1:FormatText(var_151_3.content)

				arg_148_1.text_.text = var_151_4

				LuaForUtil.ClearLinePrefixSymbol(arg_148_1.text_)

				local var_151_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051036", "story_v_out_417051.awb") ~= 0 then
					local var_151_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051036", "story_v_out_417051.awb") / 1000

					if var_151_8 + var_151_0 > arg_148_1.duration_ then
						arg_148_1.duration_ = var_151_8 + var_151_0
					end

					if var_151_3.prefab_name ~= "" and arg_148_1.actors_[var_151_3.prefab_name] ~= nil then
						local var_151_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_148_1.actors_[var_151_3.prefab_name].transform, "story_v_out_417051", "417051036", "story_v_out_417051.awb")

						arg_148_1:RecordAudio("417051036", var_151_9)
						arg_148_1:RecordAudio("417051036", var_151_9)
					else
						arg_148_1:AudioAction("play", "voice", "story_v_out_417051", "417051036", "story_v_out_417051.awb")
					end

					arg_148_1:RecordHistoryTalkVoice("story_v_out_417051", "417051036", "story_v_out_417051.awb")
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
	Play417051037 = function(arg_152_0, arg_152_1)
		arg_152_1.time_ = 0
		arg_152_1.frameCnt_ = 0
		arg_152_1.state_ = "playing"
		arg_152_1.curTalkId_ = 417051037
		arg_152_1.duration_ = 5

		SetActive(arg_152_1.tipsGo_, false)

		function arg_152_1.onSingleLineFinish_()
			arg_152_1.onSingleLineUpdate_ = nil
			arg_152_1.onSingleLineFinish_ = nil
			arg_152_1.state_ = "waiting"
		end

		function arg_152_1.playNext_(arg_154_0)
			if arg_154_0 == 1 then
				arg_152_0:Play417051038(arg_152_1)
			end
		end

		function arg_152_1.onSingleLineUpdate_(arg_155_0)
			local var_155_0 = arg_152_1.actors_["1034"]
			local var_155_1 = 0

			if var_155_1 < arg_152_1.time_ and arg_152_1.time_ <= var_155_1 + arg_155_0 and not isNil(var_155_0) and arg_152_1.var_.actorSpriteComps1034 == nil then
				arg_152_1.var_.actorSpriteComps1034 = var_155_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_155_2 = 0.2

			if var_155_1 <= arg_152_1.time_ and arg_152_1.time_ < var_155_1 + var_155_2 and not isNil(var_155_0) then
				local var_155_3 = (arg_152_1.time_ - var_155_1) / var_155_2

				if arg_152_1.var_.actorSpriteComps1034 then
					for iter_155_0, iter_155_1 in pairs(arg_152_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_155_1 then
							if arg_152_1.isInRecall_ then
								local var_155_4 = Mathf.Lerp(iter_155_1.color.r, arg_152_1.hightColor2.r, var_155_3)
								local var_155_5 = Mathf.Lerp(iter_155_1.color.g, arg_152_1.hightColor2.g, var_155_3)
								local var_155_6 = Mathf.Lerp(iter_155_1.color.b, arg_152_1.hightColor2.b, var_155_3)

								iter_155_1.color = Color.New(var_155_4, var_155_5, var_155_6)
							else
								local var_155_7 = Mathf.Lerp(iter_155_1.color.r, 0.5, var_155_3)

								iter_155_1.color = Color.New(var_155_7, var_155_7, var_155_7)
							end
						end
					end
				end
			end

			if arg_152_1.time_ >= var_155_1 + var_155_2 and arg_152_1.time_ < var_155_1 + var_155_2 + arg_155_0 and not isNil(var_155_0) and arg_152_1.var_.actorSpriteComps1034 then
				for iter_155_2, iter_155_3 in pairs(arg_152_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_155_3 then
						if arg_152_1.isInRecall_ then
							iter_155_3.color = arg_152_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_155_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_152_1.var_.actorSpriteComps1034 = nil
			end

			local var_155_8 = 0
			local var_155_9 = 1.1

			if var_155_8 < arg_152_1.time_ and arg_152_1.time_ <= var_155_8 + arg_155_0 then
				arg_152_1.talkMaxDuration = 0
				arg_152_1.dialogCg_.alpha = 1

				arg_152_1.dialog_:SetActive(true)
				SetActive(arg_152_1.leftNameGo_, false)

				arg_152_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_152_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_152_1:RecordName(arg_152_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_152_1.iconTrs_.gameObject, false)
				arg_152_1.callingController_:SetSelectedState("normal")

				local var_155_10 = arg_152_1:GetWordFromCfg(417051037)
				local var_155_11 = arg_152_1:FormatText(var_155_10.content)

				arg_152_1.text_.text = var_155_11

				LuaForUtil.ClearLinePrefixSymbol(arg_152_1.text_)

				local var_155_12 = 44
				local var_155_13 = utf8.len(var_155_11)
				local var_155_14 = var_155_12 <= 0 and var_155_9 or var_155_9 * (var_155_13 / var_155_12)

				if var_155_14 > 0 and var_155_9 < var_155_14 then
					arg_152_1.talkMaxDuration = var_155_14

					if var_155_14 + var_155_8 > arg_152_1.duration_ then
						arg_152_1.duration_ = var_155_14 + var_155_8
					end
				end

				arg_152_1.text_.text = var_155_11
				arg_152_1.typewritter.percent = 0

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(false)
				arg_152_1:RecordContent(arg_152_1.text_.text)
			end

			local var_155_15 = math.max(var_155_9, arg_152_1.talkMaxDuration)

			if var_155_8 <= arg_152_1.time_ and arg_152_1.time_ < var_155_8 + var_155_15 then
				arg_152_1.typewritter.percent = (arg_152_1.time_ - var_155_8) / var_155_15

				arg_152_1.typewritter:SetDirty()
			end

			if arg_152_1.time_ >= var_155_8 + var_155_15 and arg_152_1.time_ < var_155_8 + var_155_15 + arg_155_0 then
				arg_152_1.typewritter.percent = 1

				arg_152_1.typewritter:SetDirty()
				arg_152_1:ShowNextGo(true)
			end
		end
	end,
	Play417051038 = function(arg_156_0, arg_156_1)
		arg_156_1.time_ = 0
		arg_156_1.frameCnt_ = 0
		arg_156_1.state_ = "playing"
		arg_156_1.curTalkId_ = 417051038
		arg_156_1.duration_ = 7.3

		local var_156_0 = {
			zh = 7.3,
			ja = 6.8
		}
		local var_156_1 = manager.audio:GetLocalizationFlag()

		if var_156_0[var_156_1] ~= nil then
			arg_156_1.duration_ = var_156_0[var_156_1]
		end

		SetActive(arg_156_1.tipsGo_, false)

		function arg_156_1.onSingleLineFinish_()
			arg_156_1.onSingleLineUpdate_ = nil
			arg_156_1.onSingleLineFinish_ = nil
			arg_156_1.state_ = "waiting"
		end

		function arg_156_1.playNext_(arg_158_0)
			if arg_158_0 == 1 then
				arg_156_0:Play417051039(arg_156_1)
			end
		end

		function arg_156_1.onSingleLineUpdate_(arg_159_0)
			local var_159_0 = 0
			local var_159_1 = 0.8

			if var_159_0 < arg_156_1.time_ and arg_156_1.time_ <= var_159_0 + arg_159_0 then
				arg_156_1.talkMaxDuration = 0
				arg_156_1.dialogCg_.alpha = 1

				arg_156_1.dialog_:SetActive(true)
				SetActive(arg_156_1.leftNameGo_, true)

				local var_159_2 = arg_156_1:FormatText(StoryNameCfg[1123].name)

				arg_156_1.leftNameTxt_.text = var_159_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_156_1.leftNameTxt_.transform)

				arg_156_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_156_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_156_1:RecordName(arg_156_1.leftNameTxt_.text)
				SetActive(arg_156_1.iconTrs_.gameObject, true)
				arg_156_1.iconController_:SetSelectedState("hero")

				arg_156_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_156_1.callingController_:SetSelectedState("normal")

				arg_156_1.keyicon_.color = Color.New(1, 1, 1)
				arg_156_1.icon_.color = Color.New(1, 1, 1)

				local var_159_3 = arg_156_1:GetWordFromCfg(417051038)
				local var_159_4 = arg_156_1:FormatText(var_159_3.content)

				arg_156_1.text_.text = var_159_4

				LuaForUtil.ClearLinePrefixSymbol(arg_156_1.text_)

				local var_159_5 = 32
				local var_159_6 = utf8.len(var_159_4)
				local var_159_7 = var_159_5 <= 0 and var_159_1 or var_159_1 * (var_159_6 / var_159_5)

				if var_159_7 > 0 and var_159_1 < var_159_7 then
					arg_156_1.talkMaxDuration = var_159_7

					if var_159_7 + var_159_0 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_7 + var_159_0
					end
				end

				arg_156_1.text_.text = var_159_4
				arg_156_1.typewritter.percent = 0

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051038", "story_v_out_417051.awb") ~= 0 then
					local var_159_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051038", "story_v_out_417051.awb") / 1000

					if var_159_8 + var_159_0 > arg_156_1.duration_ then
						arg_156_1.duration_ = var_159_8 + var_159_0
					end

					if var_159_3.prefab_name ~= "" and arg_156_1.actors_[var_159_3.prefab_name] ~= nil then
						local var_159_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_156_1.actors_[var_159_3.prefab_name].transform, "story_v_out_417051", "417051038", "story_v_out_417051.awb")

						arg_156_1:RecordAudio("417051038", var_159_9)
						arg_156_1:RecordAudio("417051038", var_159_9)
					else
						arg_156_1:AudioAction("play", "voice", "story_v_out_417051", "417051038", "story_v_out_417051.awb")
					end

					arg_156_1:RecordHistoryTalkVoice("story_v_out_417051", "417051038", "story_v_out_417051.awb")
				end

				arg_156_1:RecordContent(arg_156_1.text_.text)
			end

			local var_159_10 = math.max(var_159_1, arg_156_1.talkMaxDuration)

			if var_159_0 <= arg_156_1.time_ and arg_156_1.time_ < var_159_0 + var_159_10 then
				arg_156_1.typewritter.percent = (arg_156_1.time_ - var_159_0) / var_159_10

				arg_156_1.typewritter:SetDirty()
			end

			if arg_156_1.time_ >= var_159_0 + var_159_10 and arg_156_1.time_ < var_159_0 + var_159_10 + arg_159_0 then
				arg_156_1.typewritter.percent = 1

				arg_156_1.typewritter:SetDirty()
				arg_156_1:ShowNextGo(true)
			end
		end
	end,
	Play417051039 = function(arg_160_0, arg_160_1)
		arg_160_1.time_ = 0
		arg_160_1.frameCnt_ = 0
		arg_160_1.state_ = "playing"
		arg_160_1.curTalkId_ = 417051039
		arg_160_1.duration_ = 9.3

		local var_160_0 = {
			zh = 6.033,
			ja = 9.3
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
				arg_160_0:Play417051040(arg_160_1)
			end
		end

		function arg_160_1.onSingleLineUpdate_(arg_163_0)
			local var_163_0 = arg_160_1.actors_["1034"]
			local var_163_1 = 0

			if var_163_1 < arg_160_1.time_ and arg_160_1.time_ <= var_163_1 + arg_163_0 and not isNil(var_163_0) and arg_160_1.var_.actorSpriteComps1034 == nil then
				arg_160_1.var_.actorSpriteComps1034 = var_163_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_163_2 = 0.2

			if var_163_1 <= arg_160_1.time_ and arg_160_1.time_ < var_163_1 + var_163_2 and not isNil(var_163_0) then
				local var_163_3 = (arg_160_1.time_ - var_163_1) / var_163_2

				if arg_160_1.var_.actorSpriteComps1034 then
					for iter_163_0, iter_163_1 in pairs(arg_160_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_163_1 then
							if arg_160_1.isInRecall_ then
								local var_163_4 = Mathf.Lerp(iter_163_1.color.r, arg_160_1.hightColor1.r, var_163_3)
								local var_163_5 = Mathf.Lerp(iter_163_1.color.g, arg_160_1.hightColor1.g, var_163_3)
								local var_163_6 = Mathf.Lerp(iter_163_1.color.b, arg_160_1.hightColor1.b, var_163_3)

								iter_163_1.color = Color.New(var_163_4, var_163_5, var_163_6)
							else
								local var_163_7 = Mathf.Lerp(iter_163_1.color.r, 1, var_163_3)

								iter_163_1.color = Color.New(var_163_7, var_163_7, var_163_7)
							end
						end
					end
				end
			end

			if arg_160_1.time_ >= var_163_1 + var_163_2 and arg_160_1.time_ < var_163_1 + var_163_2 + arg_163_0 and not isNil(var_163_0) and arg_160_1.var_.actorSpriteComps1034 then
				for iter_163_2, iter_163_3 in pairs(arg_160_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_163_3 then
						if arg_160_1.isInRecall_ then
							iter_163_3.color = arg_160_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_163_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_160_1.var_.actorSpriteComps1034 = nil
			end

			local var_163_8 = arg_160_1.actors_["1034"].transform
			local var_163_9 = 0

			if var_163_9 < arg_160_1.time_ and arg_160_1.time_ <= var_163_9 + arg_163_0 then
				arg_160_1.var_.moveOldPos1034 = var_163_8.localPosition
				var_163_8.localScale = Vector3.New(1, 1, 1)

				arg_160_1:CheckSpriteTmpPos("1034", 3)

				local var_163_10 = var_163_8.childCount

				for iter_163_4 = 0, var_163_10 - 1 do
					local var_163_11 = var_163_8:GetChild(iter_163_4)

					if var_163_11.name == "split_6" or not string.find(var_163_11.name, "split") then
						var_163_11.gameObject:SetActive(true)
					else
						var_163_11.gameObject:SetActive(false)
					end
				end
			end

			local var_163_12 = 0.001

			if var_163_9 <= arg_160_1.time_ and arg_160_1.time_ < var_163_9 + var_163_12 then
				local var_163_13 = (arg_160_1.time_ - var_163_9) / var_163_12
				local var_163_14 = Vector3.New(0, -331.9, -324)

				var_163_8.localPosition = Vector3.Lerp(arg_160_1.var_.moveOldPos1034, var_163_14, var_163_13)
			end

			if arg_160_1.time_ >= var_163_9 + var_163_12 and arg_160_1.time_ < var_163_9 + var_163_12 + arg_163_0 then
				var_163_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_163_15 = 0
			local var_163_16 = 0.8

			if var_163_15 < arg_160_1.time_ and arg_160_1.time_ <= var_163_15 + arg_163_0 then
				arg_160_1.talkMaxDuration = 0
				arg_160_1.dialogCg_.alpha = 1

				arg_160_1.dialog_:SetActive(true)
				SetActive(arg_160_1.leftNameGo_, true)

				local var_163_17 = arg_160_1:FormatText(StoryNameCfg[1109].name)

				arg_160_1.leftNameTxt_.text = var_163_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_160_1.leftNameTxt_.transform)

				arg_160_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_160_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_160_1:RecordName(arg_160_1.leftNameTxt_.text)
				SetActive(arg_160_1.iconTrs_.gameObject, false)
				arg_160_1.callingController_:SetSelectedState("normal")

				local var_163_18 = arg_160_1:GetWordFromCfg(417051039)
				local var_163_19 = arg_160_1:FormatText(var_163_18.content)

				arg_160_1.text_.text = var_163_19

				LuaForUtil.ClearLinePrefixSymbol(arg_160_1.text_)

				local var_163_20 = 32
				local var_163_21 = utf8.len(var_163_19)
				local var_163_22 = var_163_20 <= 0 and var_163_16 or var_163_16 * (var_163_21 / var_163_20)

				if var_163_22 > 0 and var_163_16 < var_163_22 then
					arg_160_1.talkMaxDuration = var_163_22

					if var_163_22 + var_163_15 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_22 + var_163_15
					end
				end

				arg_160_1.text_.text = var_163_19
				arg_160_1.typewritter.percent = 0

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051039", "story_v_out_417051.awb") ~= 0 then
					local var_163_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051039", "story_v_out_417051.awb") / 1000

					if var_163_23 + var_163_15 > arg_160_1.duration_ then
						arg_160_1.duration_ = var_163_23 + var_163_15
					end

					if var_163_18.prefab_name ~= "" and arg_160_1.actors_[var_163_18.prefab_name] ~= nil then
						local var_163_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_160_1.actors_[var_163_18.prefab_name].transform, "story_v_out_417051", "417051039", "story_v_out_417051.awb")

						arg_160_1:RecordAudio("417051039", var_163_24)
						arg_160_1:RecordAudio("417051039", var_163_24)
					else
						arg_160_1:AudioAction("play", "voice", "story_v_out_417051", "417051039", "story_v_out_417051.awb")
					end

					arg_160_1:RecordHistoryTalkVoice("story_v_out_417051", "417051039", "story_v_out_417051.awb")
				end

				arg_160_1:RecordContent(arg_160_1.text_.text)
			end

			local var_163_25 = math.max(var_163_16, arg_160_1.talkMaxDuration)

			if var_163_15 <= arg_160_1.time_ and arg_160_1.time_ < var_163_15 + var_163_25 then
				arg_160_1.typewritter.percent = (arg_160_1.time_ - var_163_15) / var_163_25

				arg_160_1.typewritter:SetDirty()
			end

			if arg_160_1.time_ >= var_163_15 + var_163_25 and arg_160_1.time_ < var_163_15 + var_163_25 + arg_163_0 then
				arg_160_1.typewritter.percent = 1

				arg_160_1.typewritter:SetDirty()
				arg_160_1:ShowNextGo(true)
			end
		end
	end,
	Play417051040 = function(arg_164_0, arg_164_1)
		arg_164_1.time_ = 0
		arg_164_1.frameCnt_ = 0
		arg_164_1.state_ = "playing"
		arg_164_1.curTalkId_ = 417051040
		arg_164_1.duration_ = 12.37

		local var_164_0 = {
			zh = 3.766,
			ja = 12.366
		}
		local var_164_1 = manager.audio:GetLocalizationFlag()

		if var_164_0[var_164_1] ~= nil then
			arg_164_1.duration_ = var_164_0[var_164_1]
		end

		SetActive(arg_164_1.tipsGo_, false)

		function arg_164_1.onSingleLineFinish_()
			arg_164_1.onSingleLineUpdate_ = nil
			arg_164_1.onSingleLineFinish_ = nil
			arg_164_1.state_ = "waiting"
		end

		function arg_164_1.playNext_(arg_166_0)
			if arg_166_0 == 1 then
				arg_164_0:Play417051041(arg_164_1)
			end
		end

		function arg_164_1.onSingleLineUpdate_(arg_167_0)
			local var_167_0 = arg_164_1.actors_["1034"]
			local var_167_1 = 0

			if var_167_1 < arg_164_1.time_ and arg_164_1.time_ <= var_167_1 + arg_167_0 and not isNil(var_167_0) and arg_164_1.var_.actorSpriteComps1034 == nil then
				arg_164_1.var_.actorSpriteComps1034 = var_167_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_167_2 = 0.2

			if var_167_1 <= arg_164_1.time_ and arg_164_1.time_ < var_167_1 + var_167_2 and not isNil(var_167_0) then
				local var_167_3 = (arg_164_1.time_ - var_167_1) / var_167_2

				if arg_164_1.var_.actorSpriteComps1034 then
					for iter_167_0, iter_167_1 in pairs(arg_164_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_167_1 then
							if arg_164_1.isInRecall_ then
								local var_167_4 = Mathf.Lerp(iter_167_1.color.r, arg_164_1.hightColor2.r, var_167_3)
								local var_167_5 = Mathf.Lerp(iter_167_1.color.g, arg_164_1.hightColor2.g, var_167_3)
								local var_167_6 = Mathf.Lerp(iter_167_1.color.b, arg_164_1.hightColor2.b, var_167_3)

								iter_167_1.color = Color.New(var_167_4, var_167_5, var_167_6)
							else
								local var_167_7 = Mathf.Lerp(iter_167_1.color.r, 0.5, var_167_3)

								iter_167_1.color = Color.New(var_167_7, var_167_7, var_167_7)
							end
						end
					end
				end
			end

			if arg_164_1.time_ >= var_167_1 + var_167_2 and arg_164_1.time_ < var_167_1 + var_167_2 + arg_167_0 and not isNil(var_167_0) and arg_164_1.var_.actorSpriteComps1034 then
				for iter_167_2, iter_167_3 in pairs(arg_164_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_167_3 then
						if arg_164_1.isInRecall_ then
							iter_167_3.color = arg_164_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_167_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_164_1.var_.actorSpriteComps1034 = nil
			end

			local var_167_8 = 0
			local var_167_9 = 0.55

			if var_167_8 < arg_164_1.time_ and arg_164_1.time_ <= var_167_8 + arg_167_0 then
				arg_164_1.talkMaxDuration = 0
				arg_164_1.dialogCg_.alpha = 1

				arg_164_1.dialog_:SetActive(true)
				SetActive(arg_164_1.leftNameGo_, true)

				local var_167_10 = arg_164_1:FormatText(StoryNameCfg[1123].name)

				arg_164_1.leftNameTxt_.text = var_167_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_164_1.leftNameTxt_.transform)

				arg_164_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_164_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_164_1:RecordName(arg_164_1.leftNameTxt_.text)
				SetActive(arg_164_1.iconTrs_.gameObject, true)
				arg_164_1.iconController_:SetSelectedState("hero")

				arg_164_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_bernard")

				arg_164_1.callingController_:SetSelectedState("normal")

				arg_164_1.keyicon_.color = Color.New(1, 1, 1)
				arg_164_1.icon_.color = Color.New(1, 1, 1)

				local var_167_11 = arg_164_1:GetWordFromCfg(417051040)
				local var_167_12 = arg_164_1:FormatText(var_167_11.content)

				arg_164_1.text_.text = var_167_12

				LuaForUtil.ClearLinePrefixSymbol(arg_164_1.text_)

				local var_167_13 = 22
				local var_167_14 = utf8.len(var_167_12)
				local var_167_15 = var_167_13 <= 0 and var_167_9 or var_167_9 * (var_167_14 / var_167_13)

				if var_167_15 > 0 and var_167_9 < var_167_15 then
					arg_164_1.talkMaxDuration = var_167_15

					if var_167_15 + var_167_8 > arg_164_1.duration_ then
						arg_164_1.duration_ = var_167_15 + var_167_8
					end
				end

				arg_164_1.text_.text = var_167_12
				arg_164_1.typewritter.percent = 0

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051040", "story_v_out_417051.awb") ~= 0 then
					local var_167_16 = manager.audio:GetVoiceLength("story_v_out_417051", "417051040", "story_v_out_417051.awb") / 1000

					if var_167_16 + var_167_8 > arg_164_1.duration_ then
						arg_164_1.duration_ = var_167_16 + var_167_8
					end

					if var_167_11.prefab_name ~= "" and arg_164_1.actors_[var_167_11.prefab_name] ~= nil then
						local var_167_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_164_1.actors_[var_167_11.prefab_name].transform, "story_v_out_417051", "417051040", "story_v_out_417051.awb")

						arg_164_1:RecordAudio("417051040", var_167_17)
						arg_164_1:RecordAudio("417051040", var_167_17)
					else
						arg_164_1:AudioAction("play", "voice", "story_v_out_417051", "417051040", "story_v_out_417051.awb")
					end

					arg_164_1:RecordHistoryTalkVoice("story_v_out_417051", "417051040", "story_v_out_417051.awb")
				end

				arg_164_1:RecordContent(arg_164_1.text_.text)
			end

			local var_167_18 = math.max(var_167_9, arg_164_1.talkMaxDuration)

			if var_167_8 <= arg_164_1.time_ and arg_164_1.time_ < var_167_8 + var_167_18 then
				arg_164_1.typewritter.percent = (arg_164_1.time_ - var_167_8) / var_167_18

				arg_164_1.typewritter:SetDirty()
			end

			if arg_164_1.time_ >= var_167_8 + var_167_18 and arg_164_1.time_ < var_167_8 + var_167_18 + arg_167_0 then
				arg_164_1.typewritter.percent = 1

				arg_164_1.typewritter:SetDirty()
				arg_164_1:ShowNextGo(true)
			end
		end
	end,
	Play417051041 = function(arg_168_0, arg_168_1)
		arg_168_1.time_ = 0
		arg_168_1.frameCnt_ = 0
		arg_168_1.state_ = "playing"
		arg_168_1.curTalkId_ = 417051041
		arg_168_1.duration_ = 5

		SetActive(arg_168_1.tipsGo_, false)

		function arg_168_1.onSingleLineFinish_()
			arg_168_1.onSingleLineUpdate_ = nil
			arg_168_1.onSingleLineFinish_ = nil
			arg_168_1.state_ = "waiting"
		end

		function arg_168_1.playNext_(arg_170_0)
			if arg_170_0 == 1 then
				arg_168_0:Play417051042(arg_168_1)
			end
		end

		function arg_168_1.onSingleLineUpdate_(arg_171_0)
			local var_171_0 = arg_168_1.actors_["1034"].transform
			local var_171_1 = 0

			if var_171_1 < arg_168_1.time_ and arg_168_1.time_ <= var_171_1 + arg_171_0 then
				arg_168_1.var_.moveOldPos1034 = var_171_0.localPosition
				var_171_0.localScale = Vector3.New(1, 1, 1)

				arg_168_1:CheckSpriteTmpPos("1034", 7)

				local var_171_2 = var_171_0.childCount

				for iter_171_0 = 0, var_171_2 - 1 do
					local var_171_3 = var_171_0:GetChild(iter_171_0)

					if var_171_3.name == "" or not string.find(var_171_3.name, "split") then
						var_171_3.gameObject:SetActive(true)
					else
						var_171_3.gameObject:SetActive(false)
					end
				end
			end

			local var_171_4 = 0.001

			if var_171_1 <= arg_168_1.time_ and arg_168_1.time_ < var_171_1 + var_171_4 then
				local var_171_5 = (arg_168_1.time_ - var_171_1) / var_171_4
				local var_171_6 = Vector3.New(0, -2000, 0)

				var_171_0.localPosition = Vector3.Lerp(arg_168_1.var_.moveOldPos1034, var_171_6, var_171_5)
			end

			if arg_168_1.time_ >= var_171_1 + var_171_4 and arg_168_1.time_ < var_171_1 + var_171_4 + arg_171_0 then
				var_171_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_171_7 = 0.7
			local var_171_8 = 1

			if var_171_7 < arg_168_1.time_ and arg_168_1.time_ <= var_171_7 + arg_171_0 then
				local var_171_9 = "play"
				local var_171_10 = "effect"

				arg_168_1:AudioAction(var_171_9, var_171_10, "se_story_side_1028", "se_story_side_1028_door", "")
			end

			local var_171_11 = 0
			local var_171_12 = 1.075

			if var_171_11 < arg_168_1.time_ and arg_168_1.time_ <= var_171_11 + arg_171_0 then
				arg_168_1.talkMaxDuration = 0
				arg_168_1.dialogCg_.alpha = 1

				arg_168_1.dialog_:SetActive(true)
				SetActive(arg_168_1.leftNameGo_, false)

				arg_168_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_168_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_168_1:RecordName(arg_168_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_168_1.iconTrs_.gameObject, false)
				arg_168_1.callingController_:SetSelectedState("normal")

				local var_171_13 = arg_168_1:GetWordFromCfg(417051041)
				local var_171_14 = arg_168_1:FormatText(var_171_13.content)

				arg_168_1.text_.text = var_171_14

				LuaForUtil.ClearLinePrefixSymbol(arg_168_1.text_)

				local var_171_15 = 43
				local var_171_16 = utf8.len(var_171_14)
				local var_171_17 = var_171_15 <= 0 and var_171_12 or var_171_12 * (var_171_16 / var_171_15)

				if var_171_17 > 0 and var_171_12 < var_171_17 then
					arg_168_1.talkMaxDuration = var_171_17

					if var_171_17 + var_171_11 > arg_168_1.duration_ then
						arg_168_1.duration_ = var_171_17 + var_171_11
					end
				end

				arg_168_1.text_.text = var_171_14
				arg_168_1.typewritter.percent = 0

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(false)
				arg_168_1:RecordContent(arg_168_1.text_.text)
			end

			local var_171_18 = math.max(var_171_12, arg_168_1.talkMaxDuration)

			if var_171_11 <= arg_168_1.time_ and arg_168_1.time_ < var_171_11 + var_171_18 then
				arg_168_1.typewritter.percent = (arg_168_1.time_ - var_171_11) / var_171_18

				arg_168_1.typewritter:SetDirty()
			end

			if arg_168_1.time_ >= var_171_11 + var_171_18 and arg_168_1.time_ < var_171_11 + var_171_18 + arg_171_0 then
				arg_168_1.typewritter.percent = 1

				arg_168_1.typewritter:SetDirty()
				arg_168_1:ShowNextGo(true)
			end
		end
	end,
	Play417051042 = function(arg_172_0, arg_172_1)
		arg_172_1.time_ = 0
		arg_172_1.frameCnt_ = 0
		arg_172_1.state_ = "playing"
		arg_172_1.curTalkId_ = 417051042
		arg_172_1.duration_ = 5

		SetActive(arg_172_1.tipsGo_, false)

		function arg_172_1.onSingleLineFinish_()
			arg_172_1.onSingleLineUpdate_ = nil
			arg_172_1.onSingleLineFinish_ = nil
			arg_172_1.state_ = "waiting"
		end

		function arg_172_1.playNext_(arg_174_0)
			if arg_174_0 == 1 then
				arg_172_0:Play417051043(arg_172_1)
			end
		end

		function arg_172_1.onSingleLineUpdate_(arg_175_0)
			local var_175_0 = 0
			local var_175_1 = 1.05

			if var_175_0 < arg_172_1.time_ and arg_172_1.time_ <= var_175_0 + arg_175_0 then
				arg_172_1.talkMaxDuration = 0
				arg_172_1.dialogCg_.alpha = 1

				arg_172_1.dialog_:SetActive(true)
				SetActive(arg_172_1.leftNameGo_, false)

				arg_172_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_172_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_172_1:RecordName(arg_172_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_172_1.iconTrs_.gameObject, false)
				arg_172_1.callingController_:SetSelectedState("normal")

				local var_175_2 = arg_172_1:GetWordFromCfg(417051042)
				local var_175_3 = arg_172_1:FormatText(var_175_2.content)

				arg_172_1.text_.text = var_175_3

				LuaForUtil.ClearLinePrefixSymbol(arg_172_1.text_)

				local var_175_4 = 42
				local var_175_5 = utf8.len(var_175_3)
				local var_175_6 = var_175_4 <= 0 and var_175_1 or var_175_1 * (var_175_5 / var_175_4)

				if var_175_6 > 0 and var_175_1 < var_175_6 then
					arg_172_1.talkMaxDuration = var_175_6

					if var_175_6 + var_175_0 > arg_172_1.duration_ then
						arg_172_1.duration_ = var_175_6 + var_175_0
					end
				end

				arg_172_1.text_.text = var_175_3
				arg_172_1.typewritter.percent = 0

				arg_172_1.typewritter:SetDirty()
				arg_172_1:ShowNextGo(false)
				arg_172_1:RecordContent(arg_172_1.text_.text)
			end

			local var_175_7 = math.max(var_175_1, arg_172_1.talkMaxDuration)

			if var_175_0 <= arg_172_1.time_ and arg_172_1.time_ < var_175_0 + var_175_7 then
				arg_172_1.typewritter.percent = (arg_172_1.time_ - var_175_0) / var_175_7

				arg_172_1.typewritter:SetDirty()
			end

			if arg_172_1.time_ >= var_175_0 + var_175_7 and arg_172_1.time_ < var_175_0 + var_175_7 + arg_175_0 then
				arg_172_1.typewritter.percent = 1

				arg_172_1.typewritter:SetDirty()
				arg_172_1:ShowNextGo(true)
			end
		end
	end,
	Play417051043 = function(arg_176_0, arg_176_1)
		arg_176_1.time_ = 0
		arg_176_1.frameCnt_ = 0
		arg_176_1.state_ = "playing"
		arg_176_1.curTalkId_ = 417051043
		arg_176_1.duration_ = 3.13

		local var_176_0 = {
			zh = 1.533,
			ja = 3.133
		}
		local var_176_1 = manager.audio:GetLocalizationFlag()

		if var_176_0[var_176_1] ~= nil then
			arg_176_1.duration_ = var_176_0[var_176_1]
		end

		SetActive(arg_176_1.tipsGo_, false)

		function arg_176_1.onSingleLineFinish_()
			arg_176_1.onSingleLineUpdate_ = nil
			arg_176_1.onSingleLineFinish_ = nil
			arg_176_1.state_ = "waiting"
		end

		function arg_176_1.playNext_(arg_178_0)
			if arg_178_0 == 1 then
				arg_176_0:Play417051044(arg_176_1)
			end
		end

		function arg_176_1.onSingleLineUpdate_(arg_179_0)
			local var_179_0 = 0
			local var_179_1 = 0.1

			if var_179_0 < arg_176_1.time_ and arg_176_1.time_ <= var_179_0 + arg_179_0 then
				arg_176_1.talkMaxDuration = 0
				arg_176_1.dialogCg_.alpha = 1

				arg_176_1.dialog_:SetActive(true)
				SetActive(arg_176_1.leftNameGo_, true)

				local var_179_2 = arg_176_1:FormatText(StoryNameCfg[1109].name)

				arg_176_1.leftNameTxt_.text = var_179_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_176_1.leftNameTxt_.transform)

				arg_176_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_176_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_176_1:RecordName(arg_176_1.leftNameTxt_.text)
				SetActive(arg_176_1.iconTrs_.gameObject, true)
				arg_176_1.iconController_:SetSelectedState("hero")

				arg_176_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1034_split_3")

				arg_176_1.callingController_:SetSelectedState("normal")

				arg_176_1.keyicon_.color = Color.New(1, 1, 1)
				arg_176_1.icon_.color = Color.New(1, 1, 1)

				local var_179_3 = arg_176_1:GetWordFromCfg(417051043)
				local var_179_4 = arg_176_1:FormatText(var_179_3.content)

				arg_176_1.text_.text = var_179_4

				LuaForUtil.ClearLinePrefixSymbol(arg_176_1.text_)

				local var_179_5 = 4
				local var_179_6 = utf8.len(var_179_4)
				local var_179_7 = var_179_5 <= 0 and var_179_1 or var_179_1 * (var_179_6 / var_179_5)

				if var_179_7 > 0 and var_179_1 < var_179_7 then
					arg_176_1.talkMaxDuration = var_179_7

					if var_179_7 + var_179_0 > arg_176_1.duration_ then
						arg_176_1.duration_ = var_179_7 + var_179_0
					end
				end

				arg_176_1.text_.text = var_179_4
				arg_176_1.typewritter.percent = 0

				arg_176_1.typewritter:SetDirty()
				arg_176_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051043", "story_v_out_417051.awb") ~= 0 then
					local var_179_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051043", "story_v_out_417051.awb") / 1000

					if var_179_8 + var_179_0 > arg_176_1.duration_ then
						arg_176_1.duration_ = var_179_8 + var_179_0
					end

					if var_179_3.prefab_name ~= "" and arg_176_1.actors_[var_179_3.prefab_name] ~= nil then
						local var_179_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_176_1.actors_[var_179_3.prefab_name].transform, "story_v_out_417051", "417051043", "story_v_out_417051.awb")

						arg_176_1:RecordAudio("417051043", var_179_9)
						arg_176_1:RecordAudio("417051043", var_179_9)
					else
						arg_176_1:AudioAction("play", "voice", "story_v_out_417051", "417051043", "story_v_out_417051.awb")
					end

					arg_176_1:RecordHistoryTalkVoice("story_v_out_417051", "417051043", "story_v_out_417051.awb")
				end

				arg_176_1:RecordContent(arg_176_1.text_.text)
			end

			local var_179_10 = math.max(var_179_1, arg_176_1.talkMaxDuration)

			if var_179_0 <= arg_176_1.time_ and arg_176_1.time_ < var_179_0 + var_179_10 then
				arg_176_1.typewritter.percent = (arg_176_1.time_ - var_179_0) / var_179_10

				arg_176_1.typewritter:SetDirty()
			end

			if arg_176_1.time_ >= var_179_0 + var_179_10 and arg_176_1.time_ < var_179_0 + var_179_10 + arg_179_0 then
				arg_176_1.typewritter.percent = 1

				arg_176_1.typewritter:SetDirty()
				arg_176_1:ShowNextGo(true)
			end
		end
	end,
	Play417051044 = function(arg_180_0, arg_180_1)
		arg_180_1.time_ = 0
		arg_180_1.frameCnt_ = 0
		arg_180_1.state_ = "playing"
		arg_180_1.curTalkId_ = 417051044
		arg_180_1.duration_ = 5.43

		SetActive(arg_180_1.tipsGo_, false)

		function arg_180_1.onSingleLineFinish_()
			arg_180_1.onSingleLineUpdate_ = nil
			arg_180_1.onSingleLineFinish_ = nil
			arg_180_1.state_ = "waiting"
		end

		function arg_180_1.playNext_(arg_182_0)
			if arg_182_0 == 1 then
				arg_180_0:Play417051045(arg_180_1)
			end
		end

		function arg_180_1.onSingleLineUpdate_(arg_183_0)
			local var_183_0 = 0.166666666666667

			if var_183_0 < arg_180_1.time_ and arg_180_1.time_ <= var_183_0 + arg_183_0 then
				arg_180_1.mask_.enabled = true
				arg_180_1.mask_.raycastTarget = true

				arg_180_1:SetGaussion(false)
			end

			local var_183_1 = 0.266666666666667

			if var_183_0 <= arg_180_1.time_ and arg_180_1.time_ < var_183_0 + var_183_1 then
				local var_183_2 = (arg_180_1.time_ - var_183_0) / var_183_1
				local var_183_3 = Color.New(1, 1, 1)

				var_183_3.a = Mathf.Lerp(1, 0, var_183_2)
				arg_180_1.mask_.color = var_183_3
			end

			if arg_180_1.time_ >= var_183_0 + var_183_1 and arg_180_1.time_ < var_183_0 + var_183_1 + arg_183_0 then
				local var_183_4 = Color.New(1, 1, 1)
				local var_183_5 = 0

				arg_180_1.mask_.enabled = false
				var_183_4.a = var_183_5
				arg_180_1.mask_.color = var_183_4
			end

			local var_183_6 = manager.ui.mainCamera.transform
			local var_183_7 = 0

			if var_183_7 < arg_180_1.time_ and arg_180_1.time_ <= var_183_7 + arg_183_0 then
				arg_180_1.var_.shakeOldPos = var_183_6.localPosition
			end

			local var_183_8 = 0.566666666666667

			if var_183_7 <= arg_180_1.time_ and arg_180_1.time_ < var_183_7 + var_183_8 then
				local var_183_9 = (arg_180_1.time_ - var_183_7) / 0.066
				local var_183_10, var_183_11 = math.modf(var_183_9)

				var_183_6.localPosition = Vector3.New(var_183_11 * 0.13, var_183_11 * 0.13, var_183_11 * 0.13) + arg_180_1.var_.shakeOldPos
			end

			if arg_180_1.time_ >= var_183_7 + var_183_8 and arg_180_1.time_ < var_183_7 + var_183_8 + arg_183_0 then
				var_183_6.localPosition = arg_180_1.var_.shakeOldPos
			end

			local var_183_12 = 0

			if var_183_12 < arg_180_1.time_ and arg_180_1.time_ <= var_183_12 + arg_183_0 then
				arg_180_1.allBtn_.enabled = false
			end

			local var_183_13 = 0.566666666666667

			if arg_180_1.time_ >= var_183_12 + var_183_13 and arg_180_1.time_ < var_183_12 + var_183_13 + arg_183_0 then
				arg_180_1.allBtn_.enabled = true
			end

			local var_183_14 = 0
			local var_183_15 = 1

			if var_183_14 < arg_180_1.time_ and arg_180_1.time_ <= var_183_14 + arg_183_0 then
				local var_183_16 = "play"
				local var_183_17 = "effect"

				arg_180_1:AudioAction(var_183_16, var_183_17, "se_story_side_1148", "se_story_1148_explosion", "")
			end

			local var_183_18 = 0.1
			local var_183_19 = 1

			if var_183_18 < arg_180_1.time_ and arg_180_1.time_ <= var_183_18 + arg_183_0 then
				local var_183_20 = "play"
				local var_183_21 = "effect"

				arg_180_1:AudioAction(var_183_20, var_183_21, "se_story_1310", "se_story_1310_knif", "")
			end

			if arg_180_1.frameCnt_ <= 1 then
				arg_180_1.dialog_:SetActive(false)
			end

			local var_183_22 = 0.433333333333333
			local var_183_23 = 1.4

			if var_183_22 < arg_180_1.time_ and arg_180_1.time_ <= var_183_22 + arg_183_0 then
				arg_180_1.talkMaxDuration = 0

				arg_180_1.dialog_:SetActive(true)

				local var_183_24 = LeanTween.value(arg_180_1.dialog_, 0, 1, 0.3)

				var_183_24:setOnUpdate(LuaHelper.FloatAction(function(arg_184_0)
					arg_180_1.dialogCg_.alpha = arg_184_0
				end))
				var_183_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_180_1.dialog_)
					var_183_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_180_1.duration_ = arg_180_1.duration_ + 0.3

				SetActive(arg_180_1.leftNameGo_, false)

				arg_180_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_180_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_180_1:RecordName(arg_180_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_180_1.iconTrs_.gameObject, false)
				arg_180_1.callingController_:SetSelectedState("normal")

				local var_183_25 = arg_180_1:GetWordFromCfg(417051044)
				local var_183_26 = arg_180_1:FormatText(var_183_25.content)

				arg_180_1.text_.text = var_183_26

				LuaForUtil.ClearLinePrefixSymbol(arg_180_1.text_)

				local var_183_27 = 56
				local var_183_28 = utf8.len(var_183_26)
				local var_183_29 = var_183_27 <= 0 and var_183_23 or var_183_23 * (var_183_28 / var_183_27)

				if var_183_29 > 0 and var_183_23 < var_183_29 then
					arg_180_1.talkMaxDuration = var_183_29
					var_183_22 = var_183_22 + 0.3

					if var_183_29 + var_183_22 > arg_180_1.duration_ then
						arg_180_1.duration_ = var_183_29 + var_183_22
					end
				end

				arg_180_1.text_.text = var_183_26
				arg_180_1.typewritter.percent = 0

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(false)
				arg_180_1:RecordContent(arg_180_1.text_.text)
			end

			local var_183_30 = var_183_22 + 0.3
			local var_183_31 = math.max(var_183_23, arg_180_1.talkMaxDuration)

			if var_183_30 <= arg_180_1.time_ and arg_180_1.time_ < var_183_30 + var_183_31 then
				arg_180_1.typewritter.percent = (arg_180_1.time_ - var_183_30) / var_183_31

				arg_180_1.typewritter:SetDirty()
			end

			if arg_180_1.time_ >= var_183_30 + var_183_31 and arg_180_1.time_ < var_183_30 + var_183_31 + arg_183_0 then
				arg_180_1.typewritter.percent = 1

				arg_180_1.typewritter:SetDirty()
				arg_180_1:ShowNextGo(true)
			end
		end
	end,
	Play417051045 = function(arg_186_0, arg_186_1)
		arg_186_1.time_ = 0
		arg_186_1.frameCnt_ = 0
		arg_186_1.state_ = "playing"
		arg_186_1.curTalkId_ = 417051045
		arg_186_1.duration_ = 6.6

		SetActive(arg_186_1.tipsGo_, false)

		function arg_186_1.onSingleLineFinish_()
			arg_186_1.onSingleLineUpdate_ = nil
			arg_186_1.onSingleLineFinish_ = nil
			arg_186_1.state_ = "waiting"
		end

		function arg_186_1.playNext_(arg_188_0)
			if arg_188_0 == 1 then
				arg_186_0:Play417051046(arg_186_1)
			end
		end

		function arg_186_1.onSingleLineUpdate_(arg_189_0)
			local var_189_0 = manager.ui.mainCamera.transform
			local var_189_1 = 0

			if var_189_1 < arg_186_1.time_ and arg_186_1.time_ <= var_189_1 + arg_189_0 then
				local var_189_2 = arg_186_1.var_.effect089

				if not var_189_2 then
					var_189_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_heibaishan"))
					var_189_2.name = "089"
					arg_186_1.var_.effect089 = var_189_2
				end

				local var_189_3 = var_189_0:Find("")

				if var_189_3 then
					var_189_2.transform.parent = var_189_3
				else
					var_189_2.transform.parent = var_189_0
				end

				var_189_2.transform.localPosition = Vector3.New(0, 0, 0)
				var_189_2.transform.localRotation = Quaternion.Euler(0, 0, 0)

				local var_189_4 = manager.ui.mainCameraCom_
				local var_189_5 = Mathf.Tan(12.5 * Mathf.Deg2Rad) / Mathf.Tan(var_189_4.fieldOfView * 0.5 * Mathf.Deg2Rad)
				local var_189_6 = var_189_2.transform:GetComponentsInChildren(typeof(Transform), true):ToTable()
				local var_189_7 = 15
				local var_189_8 = 2 * var_189_7 * Mathf.Tan(var_189_4.fieldOfView * 0.5 * Mathf.Deg2Rad) * var_189_4.aspect
				local var_189_9 = 1
				local var_189_10 = 1.7777777777777777

				if var_189_10 < var_189_4.aspect then
					var_189_9 = var_189_8 / (2 * var_189_7 * Mathf.Tan(15 * Mathf.Deg2Rad) * var_189_10)
				end

				for iter_189_0, iter_189_1 in ipairs(var_189_6) do
					local var_189_11 = iter_189_1.transform.localScale

					iter_189_1.transform.localScale = Vector3.New(var_189_11.x / var_189_5 * var_189_9, var_189_11.y / var_189_5, var_189_11.z)
				end
			end

			local var_189_12 = 0

			if var_189_12 < arg_186_1.time_ and arg_186_1.time_ <= var_189_12 + arg_189_0 then
				arg_186_1.allBtn_.enabled = false
			end

			local var_189_13 = 1.6

			if arg_186_1.time_ >= var_189_12 + var_189_13 and arg_186_1.time_ < var_189_12 + var_189_13 + arg_189_0 then
				arg_186_1.allBtn_.enabled = true
			end

			local var_189_14 = 0.0333333333333333
			local var_189_15 = 1

			if var_189_14 < arg_186_1.time_ and arg_186_1.time_ <= var_189_14 + arg_189_0 then
				local var_189_16 = "play"
				local var_189_17 = "effect"

				arg_186_1:AudioAction(var_189_16, var_189_17, "se_story_134_01", "se_story_134_01_flash", "")
			end

			if arg_186_1.frameCnt_ <= 1 then
				arg_186_1.dialog_:SetActive(false)
			end

			local var_189_18 = 1.6
			local var_189_19 = 1.375

			if var_189_18 < arg_186_1.time_ and arg_186_1.time_ <= var_189_18 + arg_189_0 then
				arg_186_1.talkMaxDuration = 0

				arg_186_1.dialog_:SetActive(true)

				local var_189_20 = LeanTween.value(arg_186_1.dialog_, 0, 1, 0.3)

				var_189_20:setOnUpdate(LuaHelper.FloatAction(function(arg_190_0)
					arg_186_1.dialogCg_.alpha = arg_190_0
				end))
				var_189_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_186_1.dialog_)
					var_189_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_186_1.duration_ = arg_186_1.duration_ + 0.3

				SetActive(arg_186_1.leftNameGo_, false)

				arg_186_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_186_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_186_1:RecordName(arg_186_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_186_1.iconTrs_.gameObject, false)
				arg_186_1.callingController_:SetSelectedState("normal")

				local var_189_21 = arg_186_1:GetWordFromCfg(417051045)
				local var_189_22 = arg_186_1:FormatText(var_189_21.content)

				arg_186_1.text_.text = var_189_22

				LuaForUtil.ClearLinePrefixSymbol(arg_186_1.text_)

				local var_189_23 = 55
				local var_189_24 = utf8.len(var_189_22)
				local var_189_25 = var_189_23 <= 0 and var_189_19 or var_189_19 * (var_189_24 / var_189_23)

				if var_189_25 > 0 and var_189_19 < var_189_25 then
					arg_186_1.talkMaxDuration = var_189_25
					var_189_18 = var_189_18 + 0.3

					if var_189_25 + var_189_18 > arg_186_1.duration_ then
						arg_186_1.duration_ = var_189_25 + var_189_18
					end
				end

				arg_186_1.text_.text = var_189_22
				arg_186_1.typewritter.percent = 0

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(false)
				arg_186_1:RecordContent(arg_186_1.text_.text)
			end

			local var_189_26 = var_189_18 + 0.3
			local var_189_27 = math.max(var_189_19, arg_186_1.talkMaxDuration)

			if var_189_26 <= arg_186_1.time_ and arg_186_1.time_ < var_189_26 + var_189_27 then
				arg_186_1.typewritter.percent = (arg_186_1.time_ - var_189_26) / var_189_27

				arg_186_1.typewritter:SetDirty()
			end

			if arg_186_1.time_ >= var_189_26 + var_189_27 and arg_186_1.time_ < var_189_26 + var_189_27 + arg_189_0 then
				arg_186_1.typewritter.percent = 1

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(true)
			end
		end
	end,
	Play417051046 = function(arg_192_0, arg_192_1)
		arg_192_1.time_ = 0
		arg_192_1.frameCnt_ = 0
		arg_192_1.state_ = "playing"
		arg_192_1.curTalkId_ = 417051046
		arg_192_1.duration_ = 5

		SetActive(arg_192_1.tipsGo_, false)

		function arg_192_1.onSingleLineFinish_()
			arg_192_1.onSingleLineUpdate_ = nil
			arg_192_1.onSingleLineFinish_ = nil
			arg_192_1.state_ = "waiting"
		end

		function arg_192_1.playNext_(arg_194_0)
			if arg_194_0 == 1 then
				arg_192_0:Play417051047(arg_192_1)
			end
		end

		function arg_192_1.onSingleLineUpdate_(arg_195_0)
			local var_195_0 = manager.ui.mainCamera.transform
			local var_195_1 = 0

			if var_195_1 < arg_192_1.time_ and arg_192_1.time_ <= var_195_1 + arg_195_0 then
				local var_195_2 = arg_192_1.var_.effect089

				if var_195_2 then
					Object.Destroy(var_195_2)

					arg_192_1.var_.effect089 = nil
				end
			end

			local var_195_3 = 0.3
			local var_195_4 = 1

			if var_195_3 < arg_192_1.time_ and arg_192_1.time_ <= var_195_3 + arg_195_0 then
				local var_195_5 = "play"
				local var_195_6 = "effect"

				arg_192_1:AudioAction(var_195_5, var_195_6, "se_story_1310", "se_story_1310_gun01", "")
			end

			local var_195_7 = 0
			local var_195_8 = 1.3

			if var_195_7 < arg_192_1.time_ and arg_192_1.time_ <= var_195_7 + arg_195_0 then
				arg_192_1.talkMaxDuration = 0
				arg_192_1.dialogCg_.alpha = 1

				arg_192_1.dialog_:SetActive(true)
				SetActive(arg_192_1.leftNameGo_, false)

				arg_192_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_192_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_192_1:RecordName(arg_192_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_192_1.iconTrs_.gameObject, false)
				arg_192_1.callingController_:SetSelectedState("normal")

				local var_195_9 = arg_192_1:GetWordFromCfg(417051046)
				local var_195_10 = arg_192_1:FormatText(var_195_9.content)

				arg_192_1.text_.text = var_195_10

				LuaForUtil.ClearLinePrefixSymbol(arg_192_1.text_)

				local var_195_11 = 52
				local var_195_12 = utf8.len(var_195_10)
				local var_195_13 = var_195_11 <= 0 and var_195_8 or var_195_8 * (var_195_12 / var_195_11)

				if var_195_13 > 0 and var_195_8 < var_195_13 then
					arg_192_1.talkMaxDuration = var_195_13

					if var_195_13 + var_195_7 > arg_192_1.duration_ then
						arg_192_1.duration_ = var_195_13 + var_195_7
					end
				end

				arg_192_1.text_.text = var_195_10
				arg_192_1.typewritter.percent = 0

				arg_192_1.typewritter:SetDirty()
				arg_192_1:ShowNextGo(false)
				arg_192_1:RecordContent(arg_192_1.text_.text)
			end

			local var_195_14 = math.max(var_195_8, arg_192_1.talkMaxDuration)

			if var_195_7 <= arg_192_1.time_ and arg_192_1.time_ < var_195_7 + var_195_14 then
				arg_192_1.typewritter.percent = (arg_192_1.time_ - var_195_7) / var_195_14

				arg_192_1.typewritter:SetDirty()
			end

			if arg_192_1.time_ >= var_195_7 + var_195_14 and arg_192_1.time_ < var_195_7 + var_195_14 + arg_195_0 then
				arg_192_1.typewritter.percent = 1

				arg_192_1.typewritter:SetDirty()
				arg_192_1:ShowNextGo(true)
			end
		end
	end,
	Play417051047 = function(arg_196_0, arg_196_1)
		arg_196_1.time_ = 0
		arg_196_1.frameCnt_ = 0
		arg_196_1.state_ = "playing"
		arg_196_1.curTalkId_ = 417051047
		arg_196_1.duration_ = 1.6

		local var_196_0 = {
			zh = 1.6,
			ja = 1.366
		}
		local var_196_1 = manager.audio:GetLocalizationFlag()

		if var_196_0[var_196_1] ~= nil then
			arg_196_1.duration_ = var_196_0[var_196_1]
		end

		SetActive(arg_196_1.tipsGo_, false)

		function arg_196_1.onSingleLineFinish_()
			arg_196_1.onSingleLineUpdate_ = nil
			arg_196_1.onSingleLineFinish_ = nil
			arg_196_1.state_ = "waiting"
		end

		function arg_196_1.playNext_(arg_198_0)
			if arg_198_0 == 1 then
				arg_196_0:Play417051048(arg_196_1)
			end
		end

		function arg_196_1.onSingleLineUpdate_(arg_199_0)
			local var_199_0 = 0
			local var_199_1 = 0.05

			if var_199_0 < arg_196_1.time_ and arg_196_1.time_ <= var_199_0 + arg_199_0 then
				arg_196_1.talkMaxDuration = 0
				arg_196_1.dialogCg_.alpha = 1

				arg_196_1.dialog_:SetActive(true)
				SetActive(arg_196_1.leftNameGo_, true)

				local var_199_2 = arg_196_1:FormatText(StoryNameCfg[1109].name)

				arg_196_1.leftNameTxt_.text = var_199_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_196_1.leftNameTxt_.transform)

				arg_196_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_196_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_196_1:RecordName(arg_196_1.leftNameTxt_.text)
				SetActive(arg_196_1.iconTrs_.gameObject, true)
				arg_196_1.iconController_:SetSelectedState("hero")

				arg_196_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1034_split_3")

				arg_196_1.callingController_:SetSelectedState("normal")

				arg_196_1.keyicon_.color = Color.New(1, 1, 1)
				arg_196_1.icon_.color = Color.New(1, 1, 1)

				local var_199_3 = arg_196_1:GetWordFromCfg(417051047)
				local var_199_4 = arg_196_1:FormatText(var_199_3.content)

				arg_196_1.text_.text = var_199_4

				LuaForUtil.ClearLinePrefixSymbol(arg_196_1.text_)

				local var_199_5 = 2
				local var_199_6 = utf8.len(var_199_4)
				local var_199_7 = var_199_5 <= 0 and var_199_1 or var_199_1 * (var_199_6 / var_199_5)

				if var_199_7 > 0 and var_199_1 < var_199_7 then
					arg_196_1.talkMaxDuration = var_199_7

					if var_199_7 + var_199_0 > arg_196_1.duration_ then
						arg_196_1.duration_ = var_199_7 + var_199_0
					end
				end

				arg_196_1.text_.text = var_199_4
				arg_196_1.typewritter.percent = 0

				arg_196_1.typewritter:SetDirty()
				arg_196_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051047", "story_v_out_417051.awb") ~= 0 then
					local var_199_8 = manager.audio:GetVoiceLength("story_v_out_417051", "417051047", "story_v_out_417051.awb") / 1000

					if var_199_8 + var_199_0 > arg_196_1.duration_ then
						arg_196_1.duration_ = var_199_8 + var_199_0
					end

					if var_199_3.prefab_name ~= "" and arg_196_1.actors_[var_199_3.prefab_name] ~= nil then
						local var_199_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_196_1.actors_[var_199_3.prefab_name].transform, "story_v_out_417051", "417051047", "story_v_out_417051.awb")

						arg_196_1:RecordAudio("417051047", var_199_9)
						arg_196_1:RecordAudio("417051047", var_199_9)
					else
						arg_196_1:AudioAction("play", "voice", "story_v_out_417051", "417051047", "story_v_out_417051.awb")
					end

					arg_196_1:RecordHistoryTalkVoice("story_v_out_417051", "417051047", "story_v_out_417051.awb")
				end

				arg_196_1:RecordContent(arg_196_1.text_.text)
			end

			local var_199_10 = math.max(var_199_1, arg_196_1.talkMaxDuration)

			if var_199_0 <= arg_196_1.time_ and arg_196_1.time_ < var_199_0 + var_199_10 then
				arg_196_1.typewritter.percent = (arg_196_1.time_ - var_199_0) / var_199_10

				arg_196_1.typewritter:SetDirty()
			end

			if arg_196_1.time_ >= var_199_0 + var_199_10 and arg_196_1.time_ < var_199_0 + var_199_10 + arg_199_0 then
				arg_196_1.typewritter.percent = 1

				arg_196_1.typewritter:SetDirty()
				arg_196_1:ShowNextGo(true)
			end
		end
	end,
	Play417051048 = function(arg_200_0, arg_200_1)
		arg_200_1.time_ = 0
		arg_200_1.frameCnt_ = 0
		arg_200_1.state_ = "playing"
		arg_200_1.curTalkId_ = 417051048
		arg_200_1.duration_ = 5

		SetActive(arg_200_1.tipsGo_, false)

		function arg_200_1.onSingleLineFinish_()
			arg_200_1.onSingleLineUpdate_ = nil
			arg_200_1.onSingleLineFinish_ = nil
			arg_200_1.state_ = "waiting"
		end

		function arg_200_1.playNext_(arg_202_0)
			if arg_202_0 == 1 then
				arg_200_0:Play417051049(arg_200_1)
			end
		end

		function arg_200_1.onSingleLineUpdate_(arg_203_0)
			local var_203_0 = 1
			local var_203_1 = 1

			if var_203_0 < arg_200_1.time_ and arg_200_1.time_ <= var_203_0 + arg_203_0 then
				local var_203_2 = "play"
				local var_203_3 = "effect"

				arg_200_1:AudioAction(var_203_2, var_203_3, "se_story_120_00", "se_story_120_00_door_break01", "")
			end

			local var_203_4 = 0
			local var_203_5 = 1.2

			if var_203_4 < arg_200_1.time_ and arg_200_1.time_ <= var_203_4 + arg_203_0 then
				arg_200_1.talkMaxDuration = 0
				arg_200_1.dialogCg_.alpha = 1

				arg_200_1.dialog_:SetActive(true)
				SetActive(arg_200_1.leftNameGo_, false)

				arg_200_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_200_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_200_1:RecordName(arg_200_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_200_1.iconTrs_.gameObject, false)
				arg_200_1.callingController_:SetSelectedState("normal")

				local var_203_6 = arg_200_1:GetWordFromCfg(417051048)
				local var_203_7 = arg_200_1:FormatText(var_203_6.content)

				arg_200_1.text_.text = var_203_7

				LuaForUtil.ClearLinePrefixSymbol(arg_200_1.text_)

				local var_203_8 = 48
				local var_203_9 = utf8.len(var_203_7)
				local var_203_10 = var_203_8 <= 0 and var_203_5 or var_203_5 * (var_203_9 / var_203_8)

				if var_203_10 > 0 and var_203_5 < var_203_10 then
					arg_200_1.talkMaxDuration = var_203_10

					if var_203_10 + var_203_4 > arg_200_1.duration_ then
						arg_200_1.duration_ = var_203_10 + var_203_4
					end
				end

				arg_200_1.text_.text = var_203_7
				arg_200_1.typewritter.percent = 0

				arg_200_1.typewritter:SetDirty()
				arg_200_1:ShowNextGo(false)
				arg_200_1:RecordContent(arg_200_1.text_.text)
			end

			local var_203_11 = math.max(var_203_5, arg_200_1.talkMaxDuration)

			if var_203_4 <= arg_200_1.time_ and arg_200_1.time_ < var_203_4 + var_203_11 then
				arg_200_1.typewritter.percent = (arg_200_1.time_ - var_203_4) / var_203_11

				arg_200_1.typewritter:SetDirty()
			end

			if arg_200_1.time_ >= var_203_4 + var_203_11 and arg_200_1.time_ < var_203_4 + var_203_11 + arg_203_0 then
				arg_200_1.typewritter.percent = 1

				arg_200_1.typewritter:SetDirty()
				arg_200_1:ShowNextGo(true)
			end
		end
	end,
	Play417051049 = function(arg_204_0, arg_204_1)
		arg_204_1.time_ = 0
		arg_204_1.frameCnt_ = 0
		arg_204_1.state_ = "playing"
		arg_204_1.curTalkId_ = 417051049
		arg_204_1.duration_ = 8.43

		SetActive(arg_204_1.tipsGo_, false)

		function arg_204_1.onSingleLineFinish_()
			arg_204_1.onSingleLineUpdate_ = nil
			arg_204_1.onSingleLineFinish_ = nil
			arg_204_1.state_ = "waiting"
		end

		function arg_204_1.playNext_(arg_206_0)
			if arg_206_0 == 1 then
				arg_204_0:Play417051050(arg_204_1)
			end
		end

		function arg_204_1.onSingleLineUpdate_(arg_207_0)
			local var_207_0 = "I05"

			if arg_204_1.bgs_[var_207_0] == nil then
				local var_207_1 = Object.Instantiate(arg_204_1.paintGo_)

				var_207_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_207_0)
				var_207_1.name = var_207_0
				var_207_1.transform.parent = arg_204_1.stage_.transform
				var_207_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_204_1.bgs_[var_207_0] = var_207_1
			end

			local var_207_2 = 1.7

			if var_207_2 < arg_204_1.time_ and arg_204_1.time_ <= var_207_2 + arg_207_0 then
				local var_207_3 = manager.ui.mainCamera.transform.localPosition
				local var_207_4 = Vector3.New(0, 0, 10) + Vector3.New(var_207_3.x, var_207_3.y, 0)
				local var_207_5 = arg_204_1.bgs_.I05

				var_207_5.transform.localPosition = var_207_4
				var_207_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_207_6 = var_207_5:GetComponent("SpriteRenderer")

				if var_207_6 and var_207_6.sprite then
					local var_207_7 = (var_207_5.transform.localPosition - var_207_3).z
					local var_207_8 = manager.ui.mainCameraCom_
					local var_207_9 = 2 * var_207_7 * Mathf.Tan(var_207_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_207_10 = var_207_9 * var_207_8.aspect
					local var_207_11 = var_207_6.sprite.bounds.size.x
					local var_207_12 = var_207_6.sprite.bounds.size.y
					local var_207_13 = var_207_10 / var_207_11
					local var_207_14 = var_207_9 / var_207_12
					local var_207_15 = var_207_14 < var_207_13 and var_207_13 or var_207_14

					var_207_5.transform.localScale = Vector3.New(var_207_15, var_207_15, 0)
				end

				for iter_207_0, iter_207_1 in pairs(arg_204_1.bgs_) do
					if iter_207_0 ~= "I05" then
						iter_207_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_207_16 = 0

			if var_207_16 < arg_204_1.time_ and arg_204_1.time_ <= var_207_16 + arg_207_0 then
				arg_204_1.allBtn_.enabled = false
			end

			local var_207_17 = 0.3

			if arg_204_1.time_ >= var_207_16 + var_207_17 and arg_204_1.time_ < var_207_16 + var_207_17 + arg_207_0 then
				arg_204_1.allBtn_.enabled = true
			end

			local var_207_18 = 0

			if var_207_18 < arg_204_1.time_ and arg_204_1.time_ <= var_207_18 + arg_207_0 then
				arg_204_1.mask_.enabled = true
				arg_204_1.mask_.raycastTarget = true

				arg_204_1:SetGaussion(false)
			end

			local var_207_19 = 1.7

			if var_207_18 <= arg_204_1.time_ and arg_204_1.time_ < var_207_18 + var_207_19 then
				local var_207_20 = (arg_204_1.time_ - var_207_18) / var_207_19
				local var_207_21 = Color.New(0, 0, 0)

				var_207_21.a = Mathf.Lerp(0, 1, var_207_20)
				arg_204_1.mask_.color = var_207_21
			end

			if arg_204_1.time_ >= var_207_18 + var_207_19 and arg_204_1.time_ < var_207_18 + var_207_19 + arg_207_0 then
				local var_207_22 = Color.New(0, 0, 0)

				var_207_22.a = 1
				arg_204_1.mask_.color = var_207_22
			end

			local var_207_23 = 1.7

			if var_207_23 < arg_204_1.time_ and arg_204_1.time_ <= var_207_23 + arg_207_0 then
				arg_204_1.mask_.enabled = true
				arg_204_1.mask_.raycastTarget = true

				arg_204_1:SetGaussion(false)
			end

			local var_207_24 = 2

			if var_207_23 <= arg_204_1.time_ and arg_204_1.time_ < var_207_23 + var_207_24 then
				local var_207_25 = (arg_204_1.time_ - var_207_23) / var_207_24
				local var_207_26 = Color.New(0, 0, 0)

				var_207_26.a = Mathf.Lerp(1, 0, var_207_25)
				arg_204_1.mask_.color = var_207_26
			end

			if arg_204_1.time_ >= var_207_23 + var_207_24 and arg_204_1.time_ < var_207_23 + var_207_24 + arg_207_0 then
				local var_207_27 = Color.New(0, 0, 0)
				local var_207_28 = 0

				arg_204_1.mask_.enabled = false
				var_207_27.a = var_207_28
				arg_204_1.mask_.color = var_207_27
			end

			if arg_204_1.frameCnt_ <= 1 then
				arg_204_1.dialog_:SetActive(false)
			end

			local var_207_29 = 3.43333333333333
			local var_207_30 = 1.15

			if var_207_29 < arg_204_1.time_ and arg_204_1.time_ <= var_207_29 + arg_207_0 then
				arg_204_1.talkMaxDuration = 0

				arg_204_1.dialog_:SetActive(true)

				local var_207_31 = LeanTween.value(arg_204_1.dialog_, 0, 1, 0.3)

				var_207_31:setOnUpdate(LuaHelper.FloatAction(function(arg_208_0)
					arg_204_1.dialogCg_.alpha = arg_208_0
				end))
				var_207_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_204_1.dialog_)
					var_207_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_204_1.duration_ = arg_204_1.duration_ + 0.3

				SetActive(arg_204_1.leftNameGo_, false)

				arg_204_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_204_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_204_1:RecordName(arg_204_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_204_1.iconTrs_.gameObject, false)
				arg_204_1.callingController_:SetSelectedState("normal")

				local var_207_32 = arg_204_1:GetWordFromCfg(417051049)
				local var_207_33 = arg_204_1:FormatText(var_207_32.content)

				arg_204_1.text_.text = var_207_33

				LuaForUtil.ClearLinePrefixSymbol(arg_204_1.text_)

				local var_207_34 = 46
				local var_207_35 = utf8.len(var_207_33)
				local var_207_36 = var_207_34 <= 0 and var_207_30 or var_207_30 * (var_207_35 / var_207_34)

				if var_207_36 > 0 and var_207_30 < var_207_36 then
					arg_204_1.talkMaxDuration = var_207_36
					var_207_29 = var_207_29 + 0.3

					if var_207_36 + var_207_29 > arg_204_1.duration_ then
						arg_204_1.duration_ = var_207_36 + var_207_29
					end
				end

				arg_204_1.text_.text = var_207_33
				arg_204_1.typewritter.percent = 0

				arg_204_1.typewritter:SetDirty()
				arg_204_1:ShowNextGo(false)
				arg_204_1:RecordContent(arg_204_1.text_.text)
			end

			local var_207_37 = var_207_29 + 0.3
			local var_207_38 = math.max(var_207_30, arg_204_1.talkMaxDuration)

			if var_207_37 <= arg_204_1.time_ and arg_204_1.time_ < var_207_37 + var_207_38 then
				arg_204_1.typewritter.percent = (arg_204_1.time_ - var_207_37) / var_207_38

				arg_204_1.typewritter:SetDirty()
			end

			if arg_204_1.time_ >= var_207_37 + var_207_38 and arg_204_1.time_ < var_207_37 + var_207_38 + arg_207_0 then
				arg_204_1.typewritter.percent = 1

				arg_204_1.typewritter:SetDirty()
				arg_204_1:ShowNextGo(true)
			end
		end
	end,
	Play417051050 = function(arg_210_0, arg_210_1)
		arg_210_1.time_ = 0
		arg_210_1.frameCnt_ = 0
		arg_210_1.state_ = "playing"
		arg_210_1.curTalkId_ = 417051050
		arg_210_1.duration_ = 3.87

		local var_210_0 = {
			zh = 2.066,
			ja = 3.866
		}
		local var_210_1 = manager.audio:GetLocalizationFlag()

		if var_210_0[var_210_1] ~= nil then
			arg_210_1.duration_ = var_210_0[var_210_1]
		end

		SetActive(arg_210_1.tipsGo_, false)

		function arg_210_1.onSingleLineFinish_()
			arg_210_1.onSingleLineUpdate_ = nil
			arg_210_1.onSingleLineFinish_ = nil
			arg_210_1.state_ = "waiting"
		end

		function arg_210_1.playNext_(arg_212_0)
			if arg_212_0 == 1 then
				arg_210_0:Play417051051(arg_210_1)
			end
		end

		function arg_210_1.onSingleLineUpdate_(arg_213_0)
			local var_213_0 = arg_210_1.actors_["1034"]
			local var_213_1 = 0

			if var_213_1 < arg_210_1.time_ and arg_210_1.time_ <= var_213_1 + arg_213_0 and not isNil(var_213_0) and arg_210_1.var_.actorSpriteComps1034 == nil then
				arg_210_1.var_.actorSpriteComps1034 = var_213_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_213_2 = 0.2

			if var_213_1 <= arg_210_1.time_ and arg_210_1.time_ < var_213_1 + var_213_2 and not isNil(var_213_0) then
				local var_213_3 = (arg_210_1.time_ - var_213_1) / var_213_2

				if arg_210_1.var_.actorSpriteComps1034 then
					for iter_213_0, iter_213_1 in pairs(arg_210_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_213_1 then
							if arg_210_1.isInRecall_ then
								local var_213_4 = Mathf.Lerp(iter_213_1.color.r, arg_210_1.hightColor1.r, var_213_3)
								local var_213_5 = Mathf.Lerp(iter_213_1.color.g, arg_210_1.hightColor1.g, var_213_3)
								local var_213_6 = Mathf.Lerp(iter_213_1.color.b, arg_210_1.hightColor1.b, var_213_3)

								iter_213_1.color = Color.New(var_213_4, var_213_5, var_213_6)
							else
								local var_213_7 = Mathf.Lerp(iter_213_1.color.r, 1, var_213_3)

								iter_213_1.color = Color.New(var_213_7, var_213_7, var_213_7)
							end
						end
					end
				end
			end

			if arg_210_1.time_ >= var_213_1 + var_213_2 and arg_210_1.time_ < var_213_1 + var_213_2 + arg_213_0 and not isNil(var_213_0) and arg_210_1.var_.actorSpriteComps1034 then
				for iter_213_2, iter_213_3 in pairs(arg_210_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_213_3 then
						if arg_210_1.isInRecall_ then
							iter_213_3.color = arg_210_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_213_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_210_1.var_.actorSpriteComps1034 = nil
			end

			local var_213_8 = arg_210_1.actors_["1034"].transform
			local var_213_9 = 0

			if var_213_9 < arg_210_1.time_ and arg_210_1.time_ <= var_213_9 + arg_213_0 then
				arg_210_1.var_.moveOldPos1034 = var_213_8.localPosition
				var_213_8.localScale = Vector3.New(1, 1, 1)

				arg_210_1:CheckSpriteTmpPos("1034", 3)

				local var_213_10 = var_213_8.childCount

				for iter_213_4 = 0, var_213_10 - 1 do
					local var_213_11 = var_213_8:GetChild(iter_213_4)

					if var_213_11.name == "split_6" or not string.find(var_213_11.name, "split") then
						var_213_11.gameObject:SetActive(true)
					else
						var_213_11.gameObject:SetActive(false)
					end
				end
			end

			local var_213_12 = 0.001

			if var_213_9 <= arg_210_1.time_ and arg_210_1.time_ < var_213_9 + var_213_12 then
				local var_213_13 = (arg_210_1.time_ - var_213_9) / var_213_12
				local var_213_14 = Vector3.New(0, -331.9, -324)

				var_213_8.localPosition = Vector3.Lerp(arg_210_1.var_.moveOldPos1034, var_213_14, var_213_13)
			end

			if arg_210_1.time_ >= var_213_9 + var_213_12 and arg_210_1.time_ < var_213_9 + var_213_12 + arg_213_0 then
				var_213_8.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_213_15 = 0
			local var_213_16 = 0.15

			if var_213_15 < arg_210_1.time_ and arg_210_1.time_ <= var_213_15 + arg_213_0 then
				arg_210_1.talkMaxDuration = 0
				arg_210_1.dialogCg_.alpha = 1

				arg_210_1.dialog_:SetActive(true)
				SetActive(arg_210_1.leftNameGo_, true)

				local var_213_17 = arg_210_1:FormatText(StoryNameCfg[1109].name)

				arg_210_1.leftNameTxt_.text = var_213_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_210_1.leftNameTxt_.transform)

				arg_210_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_210_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_210_1:RecordName(arg_210_1.leftNameTxt_.text)
				SetActive(arg_210_1.iconTrs_.gameObject, false)
				arg_210_1.callingController_:SetSelectedState("normal")

				local var_213_18 = arg_210_1:GetWordFromCfg(417051050)
				local var_213_19 = arg_210_1:FormatText(var_213_18.content)

				arg_210_1.text_.text = var_213_19

				LuaForUtil.ClearLinePrefixSymbol(arg_210_1.text_)

				local var_213_20 = 6
				local var_213_21 = utf8.len(var_213_19)
				local var_213_22 = var_213_20 <= 0 and var_213_16 or var_213_16 * (var_213_21 / var_213_20)

				if var_213_22 > 0 and var_213_16 < var_213_22 then
					arg_210_1.talkMaxDuration = var_213_22

					if var_213_22 + var_213_15 > arg_210_1.duration_ then
						arg_210_1.duration_ = var_213_22 + var_213_15
					end
				end

				arg_210_1.text_.text = var_213_19
				arg_210_1.typewritter.percent = 0

				arg_210_1.typewritter:SetDirty()
				arg_210_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051050", "story_v_out_417051.awb") ~= 0 then
					local var_213_23 = manager.audio:GetVoiceLength("story_v_out_417051", "417051050", "story_v_out_417051.awb") / 1000

					if var_213_23 + var_213_15 > arg_210_1.duration_ then
						arg_210_1.duration_ = var_213_23 + var_213_15
					end

					if var_213_18.prefab_name ~= "" and arg_210_1.actors_[var_213_18.prefab_name] ~= nil then
						local var_213_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_210_1.actors_[var_213_18.prefab_name].transform, "story_v_out_417051", "417051050", "story_v_out_417051.awb")

						arg_210_1:RecordAudio("417051050", var_213_24)
						arg_210_1:RecordAudio("417051050", var_213_24)
					else
						arg_210_1:AudioAction("play", "voice", "story_v_out_417051", "417051050", "story_v_out_417051.awb")
					end

					arg_210_1:RecordHistoryTalkVoice("story_v_out_417051", "417051050", "story_v_out_417051.awb")
				end

				arg_210_1:RecordContent(arg_210_1.text_.text)
			end

			local var_213_25 = math.max(var_213_16, arg_210_1.talkMaxDuration)

			if var_213_15 <= arg_210_1.time_ and arg_210_1.time_ < var_213_15 + var_213_25 then
				arg_210_1.typewritter.percent = (arg_210_1.time_ - var_213_15) / var_213_25

				arg_210_1.typewritter:SetDirty()
			end

			if arg_210_1.time_ >= var_213_15 + var_213_25 and arg_210_1.time_ < var_213_15 + var_213_25 + arg_213_0 then
				arg_210_1.typewritter.percent = 1

				arg_210_1.typewritter:SetDirty()
				arg_210_1:ShowNextGo(true)
			end
		end
	end,
	Play417051051 = function(arg_214_0, arg_214_1)
		arg_214_1.time_ = 0
		arg_214_1.frameCnt_ = 0
		arg_214_1.state_ = "playing"
		arg_214_1.curTalkId_ = 417051051
		arg_214_1.duration_ = 5

		SetActive(arg_214_1.tipsGo_, false)

		function arg_214_1.onSingleLineFinish_()
			arg_214_1.onSingleLineUpdate_ = nil
			arg_214_1.onSingleLineFinish_ = nil
			arg_214_1.state_ = "waiting"
		end

		function arg_214_1.playNext_(arg_216_0)
			if arg_216_0 == 1 then
				arg_214_0:Play417051052(arg_214_1)
			end
		end

		function arg_214_1.onSingleLineUpdate_(arg_217_0)
			local var_217_0 = arg_214_1.actors_["1034"]
			local var_217_1 = 0

			if var_217_1 < arg_214_1.time_ and arg_214_1.time_ <= var_217_1 + arg_217_0 and not isNil(var_217_0) and arg_214_1.var_.actorSpriteComps1034 == nil then
				arg_214_1.var_.actorSpriteComps1034 = var_217_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_217_2 = 0.2

			if var_217_1 <= arg_214_1.time_ and arg_214_1.time_ < var_217_1 + var_217_2 and not isNil(var_217_0) then
				local var_217_3 = (arg_214_1.time_ - var_217_1) / var_217_2

				if arg_214_1.var_.actorSpriteComps1034 then
					for iter_217_0, iter_217_1 in pairs(arg_214_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_217_1 then
							if arg_214_1.isInRecall_ then
								local var_217_4 = Mathf.Lerp(iter_217_1.color.r, arg_214_1.hightColor2.r, var_217_3)
								local var_217_5 = Mathf.Lerp(iter_217_1.color.g, arg_214_1.hightColor2.g, var_217_3)
								local var_217_6 = Mathf.Lerp(iter_217_1.color.b, arg_214_1.hightColor2.b, var_217_3)

								iter_217_1.color = Color.New(var_217_4, var_217_5, var_217_6)
							else
								local var_217_7 = Mathf.Lerp(iter_217_1.color.r, 0.5, var_217_3)

								iter_217_1.color = Color.New(var_217_7, var_217_7, var_217_7)
							end
						end
					end
				end
			end

			if arg_214_1.time_ >= var_217_1 + var_217_2 and arg_214_1.time_ < var_217_1 + var_217_2 + arg_217_0 and not isNil(var_217_0) and arg_214_1.var_.actorSpriteComps1034 then
				for iter_217_2, iter_217_3 in pairs(arg_214_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_217_3 then
						if arg_214_1.isInRecall_ then
							iter_217_3.color = arg_214_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_217_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_214_1.var_.actorSpriteComps1034 = nil
			end

			local var_217_8 = 0
			local var_217_9 = 1.275

			if var_217_8 < arg_214_1.time_ and arg_214_1.time_ <= var_217_8 + arg_217_0 then
				arg_214_1.talkMaxDuration = 0
				arg_214_1.dialogCg_.alpha = 1

				arg_214_1.dialog_:SetActive(true)
				SetActive(arg_214_1.leftNameGo_, false)

				arg_214_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_214_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_214_1:RecordName(arg_214_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_214_1.iconTrs_.gameObject, false)
				arg_214_1.callingController_:SetSelectedState("normal")

				local var_217_10 = arg_214_1:GetWordFromCfg(417051051)
				local var_217_11 = arg_214_1:FormatText(var_217_10.content)

				arg_214_1.text_.text = var_217_11

				LuaForUtil.ClearLinePrefixSymbol(arg_214_1.text_)

				local var_217_12 = 51
				local var_217_13 = utf8.len(var_217_11)
				local var_217_14 = var_217_12 <= 0 and var_217_9 or var_217_9 * (var_217_13 / var_217_12)

				if var_217_14 > 0 and var_217_9 < var_217_14 then
					arg_214_1.talkMaxDuration = var_217_14

					if var_217_14 + var_217_8 > arg_214_1.duration_ then
						arg_214_1.duration_ = var_217_14 + var_217_8
					end
				end

				arg_214_1.text_.text = var_217_11
				arg_214_1.typewritter.percent = 0

				arg_214_1.typewritter:SetDirty()
				arg_214_1:ShowNextGo(false)
				arg_214_1:RecordContent(arg_214_1.text_.text)
			end

			local var_217_15 = math.max(var_217_9, arg_214_1.talkMaxDuration)

			if var_217_8 <= arg_214_1.time_ and arg_214_1.time_ < var_217_8 + var_217_15 then
				arg_214_1.typewritter.percent = (arg_214_1.time_ - var_217_8) / var_217_15

				arg_214_1.typewritter:SetDirty()
			end

			if arg_214_1.time_ >= var_217_8 + var_217_15 and arg_214_1.time_ < var_217_8 + var_217_15 + arg_217_0 then
				arg_214_1.typewritter.percent = 1

				arg_214_1.typewritter:SetDirty()
				arg_214_1:ShowNextGo(true)
			end
		end
	end,
	Play417051052 = function(arg_218_0, arg_218_1)
		arg_218_1.time_ = 0
		arg_218_1.frameCnt_ = 0
		arg_218_1.state_ = "playing"
		arg_218_1.curTalkId_ = 417051052
		arg_218_1.duration_ = 2.07

		local var_218_0 = {
			zh = 2.066,
			ja = 1.733
		}
		local var_218_1 = manager.audio:GetLocalizationFlag()

		if var_218_0[var_218_1] ~= nil then
			arg_218_1.duration_ = var_218_0[var_218_1]
		end

		SetActive(arg_218_1.tipsGo_, false)

		function arg_218_1.onSingleLineFinish_()
			arg_218_1.onSingleLineUpdate_ = nil
			arg_218_1.onSingleLineFinish_ = nil
			arg_218_1.state_ = "waiting"
		end

		function arg_218_1.playNext_(arg_220_0)
			if arg_220_0 == 1 then
				arg_218_0:Play417051053(arg_218_1)
			end
		end

		function arg_218_1.onSingleLineUpdate_(arg_221_0)
			local var_221_0 = "1052"

			if arg_218_1.actors_[var_221_0] == nil then
				local var_221_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1052")

				if not isNil(var_221_1) then
					local var_221_2 = Object.Instantiate(var_221_1, arg_218_1.canvasGo_.transform)

					var_221_2.transform:SetSiblingIndex(1)

					var_221_2.name = var_221_0
					var_221_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_218_1.actors_[var_221_0] = var_221_2

					local var_221_3 = var_221_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_218_1.isInRecall_ then
						for iter_221_0, iter_221_1 in ipairs(var_221_3) do
							iter_221_1.color = arg_218_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_221_4 = arg_218_1.actors_["1052"]
			local var_221_5 = 0

			if var_221_5 < arg_218_1.time_ and arg_218_1.time_ <= var_221_5 + arg_221_0 and not isNil(var_221_4) and arg_218_1.var_.actorSpriteComps1052 == nil then
				arg_218_1.var_.actorSpriteComps1052 = var_221_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_221_6 = 0.2

			if var_221_5 <= arg_218_1.time_ and arg_218_1.time_ < var_221_5 + var_221_6 and not isNil(var_221_4) then
				local var_221_7 = (arg_218_1.time_ - var_221_5) / var_221_6

				if arg_218_1.var_.actorSpriteComps1052 then
					for iter_221_2, iter_221_3 in pairs(arg_218_1.var_.actorSpriteComps1052:ToTable()) do
						if iter_221_3 then
							if arg_218_1.isInRecall_ then
								local var_221_8 = Mathf.Lerp(iter_221_3.color.r, arg_218_1.hightColor1.r, var_221_7)
								local var_221_9 = Mathf.Lerp(iter_221_3.color.g, arg_218_1.hightColor1.g, var_221_7)
								local var_221_10 = Mathf.Lerp(iter_221_3.color.b, arg_218_1.hightColor1.b, var_221_7)

								iter_221_3.color = Color.New(var_221_8, var_221_9, var_221_10)
							else
								local var_221_11 = Mathf.Lerp(iter_221_3.color.r, 1, var_221_7)

								iter_221_3.color = Color.New(var_221_11, var_221_11, var_221_11)
							end
						end
					end
				end
			end

			if arg_218_1.time_ >= var_221_5 + var_221_6 and arg_218_1.time_ < var_221_5 + var_221_6 + arg_221_0 and not isNil(var_221_4) and arg_218_1.var_.actorSpriteComps1052 then
				for iter_221_4, iter_221_5 in pairs(arg_218_1.var_.actorSpriteComps1052:ToTable()) do
					if iter_221_5 then
						if arg_218_1.isInRecall_ then
							iter_221_5.color = arg_218_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_221_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_218_1.var_.actorSpriteComps1052 = nil
			end

			local var_221_12 = 0
			local var_221_13 = 0.125

			if var_221_12 < arg_218_1.time_ and arg_218_1.time_ <= var_221_12 + arg_221_0 then
				arg_218_1.talkMaxDuration = 0
				arg_218_1.dialogCg_.alpha = 1

				arg_218_1.dialog_:SetActive(true)
				SetActive(arg_218_1.leftNameGo_, true)

				local var_221_14 = arg_218_1:FormatText(StoryNameCfg[36].name)

				arg_218_1.leftNameTxt_.text = var_221_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_218_1.leftNameTxt_.transform)

				arg_218_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_218_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_218_1:RecordName(arg_218_1.leftNameTxt_.text)
				SetActive(arg_218_1.iconTrs_.gameObject, true)
				arg_218_1.iconController_:SetSelectedState("hero")

				arg_218_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2030")

				arg_218_1.callingController_:SetSelectedState("normal")

				arg_218_1.keyicon_.color = Color.New(1, 1, 1)
				arg_218_1.icon_.color = Color.New(1, 1, 1)

				local var_221_15 = arg_218_1:GetWordFromCfg(417051052)
				local var_221_16 = arg_218_1:FormatText(var_221_15.content)

				arg_218_1.text_.text = var_221_16

				LuaForUtil.ClearLinePrefixSymbol(arg_218_1.text_)

				local var_221_17 = 5
				local var_221_18 = utf8.len(var_221_16)
				local var_221_19 = var_221_17 <= 0 and var_221_13 or var_221_13 * (var_221_18 / var_221_17)

				if var_221_19 > 0 and var_221_13 < var_221_19 then
					arg_218_1.talkMaxDuration = var_221_19

					if var_221_19 + var_221_12 > arg_218_1.duration_ then
						arg_218_1.duration_ = var_221_19 + var_221_12
					end
				end

				arg_218_1.text_.text = var_221_16
				arg_218_1.typewritter.percent = 0

				arg_218_1.typewritter:SetDirty()
				arg_218_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051052", "story_v_out_417051.awb") ~= 0 then
					local var_221_20 = manager.audio:GetVoiceLength("story_v_out_417051", "417051052", "story_v_out_417051.awb") / 1000

					if var_221_20 + var_221_12 > arg_218_1.duration_ then
						arg_218_1.duration_ = var_221_20 + var_221_12
					end

					if var_221_15.prefab_name ~= "" and arg_218_1.actors_[var_221_15.prefab_name] ~= nil then
						local var_221_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_218_1.actors_[var_221_15.prefab_name].transform, "story_v_out_417051", "417051052", "story_v_out_417051.awb")

						arg_218_1:RecordAudio("417051052", var_221_21)
						arg_218_1:RecordAudio("417051052", var_221_21)
					else
						arg_218_1:AudioAction("play", "voice", "story_v_out_417051", "417051052", "story_v_out_417051.awb")
					end

					arg_218_1:RecordHistoryTalkVoice("story_v_out_417051", "417051052", "story_v_out_417051.awb")
				end

				arg_218_1:RecordContent(arg_218_1.text_.text)
			end

			local var_221_22 = math.max(var_221_13, arg_218_1.talkMaxDuration)

			if var_221_12 <= arg_218_1.time_ and arg_218_1.time_ < var_221_12 + var_221_22 then
				arg_218_1.typewritter.percent = (arg_218_1.time_ - var_221_12) / var_221_22

				arg_218_1.typewritter:SetDirty()
			end

			if arg_218_1.time_ >= var_221_12 + var_221_22 and arg_218_1.time_ < var_221_12 + var_221_22 + arg_221_0 then
				arg_218_1.typewritter.percent = 1

				arg_218_1.typewritter:SetDirty()
				arg_218_1:ShowNextGo(true)
			end
		end
	end,
	Play417051053 = function(arg_222_0, arg_222_1)
		arg_222_1.time_ = 0
		arg_222_1.frameCnt_ = 0
		arg_222_1.state_ = "playing"
		arg_222_1.curTalkId_ = 417051053
		arg_222_1.duration_ = 5.4

		local var_222_0 = {
			zh = 2.833,
			ja = 5.4
		}
		local var_222_1 = manager.audio:GetLocalizationFlag()

		if var_222_0[var_222_1] ~= nil then
			arg_222_1.duration_ = var_222_0[var_222_1]
		end

		SetActive(arg_222_1.tipsGo_, false)

		function arg_222_1.onSingleLineFinish_()
			arg_222_1.onSingleLineUpdate_ = nil
			arg_222_1.onSingleLineFinish_ = nil
			arg_222_1.state_ = "waiting"
			arg_222_1.auto_ = false
		end

		function arg_222_1.playNext_(arg_224_0)
			arg_222_1.onStoryFinished_()
		end

		function arg_222_1.onSingleLineUpdate_(arg_225_0)
			local var_225_0 = arg_222_1.actors_["1034"]
			local var_225_1 = 0

			if var_225_1 < arg_222_1.time_ and arg_222_1.time_ <= var_225_1 + arg_225_0 and not isNil(var_225_0) and arg_222_1.var_.actorSpriteComps1034 == nil then
				arg_222_1.var_.actorSpriteComps1034 = var_225_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_225_2 = 0.2

			if var_225_1 <= arg_222_1.time_ and arg_222_1.time_ < var_225_1 + var_225_2 and not isNil(var_225_0) then
				local var_225_3 = (arg_222_1.time_ - var_225_1) / var_225_2

				if arg_222_1.var_.actorSpriteComps1034 then
					for iter_225_0, iter_225_1 in pairs(arg_222_1.var_.actorSpriteComps1034:ToTable()) do
						if iter_225_1 then
							if arg_222_1.isInRecall_ then
								local var_225_4 = Mathf.Lerp(iter_225_1.color.r, arg_222_1.hightColor1.r, var_225_3)
								local var_225_5 = Mathf.Lerp(iter_225_1.color.g, arg_222_1.hightColor1.g, var_225_3)
								local var_225_6 = Mathf.Lerp(iter_225_1.color.b, arg_222_1.hightColor1.b, var_225_3)

								iter_225_1.color = Color.New(var_225_4, var_225_5, var_225_6)
							else
								local var_225_7 = Mathf.Lerp(iter_225_1.color.r, 1, var_225_3)

								iter_225_1.color = Color.New(var_225_7, var_225_7, var_225_7)
							end
						end
					end
				end
			end

			if arg_222_1.time_ >= var_225_1 + var_225_2 and arg_222_1.time_ < var_225_1 + var_225_2 + arg_225_0 and not isNil(var_225_0) and arg_222_1.var_.actorSpriteComps1034 then
				for iter_225_2, iter_225_3 in pairs(arg_222_1.var_.actorSpriteComps1034:ToTable()) do
					if iter_225_3 then
						if arg_222_1.isInRecall_ then
							iter_225_3.color = arg_222_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_225_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_222_1.var_.actorSpriteComps1034 = nil
			end

			local var_225_8 = arg_222_1.actors_["1052"]
			local var_225_9 = 0

			if var_225_9 < arg_222_1.time_ and arg_222_1.time_ <= var_225_9 + arg_225_0 and not isNil(var_225_8) and arg_222_1.var_.actorSpriteComps1052 == nil then
				arg_222_1.var_.actorSpriteComps1052 = var_225_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_225_10 = 0.2

			if var_225_9 <= arg_222_1.time_ and arg_222_1.time_ < var_225_9 + var_225_10 and not isNil(var_225_8) then
				local var_225_11 = (arg_222_1.time_ - var_225_9) / var_225_10

				if arg_222_1.var_.actorSpriteComps1052 then
					for iter_225_4, iter_225_5 in pairs(arg_222_1.var_.actorSpriteComps1052:ToTable()) do
						if iter_225_5 then
							if arg_222_1.isInRecall_ then
								local var_225_12 = Mathf.Lerp(iter_225_5.color.r, arg_222_1.hightColor2.r, var_225_11)
								local var_225_13 = Mathf.Lerp(iter_225_5.color.g, arg_222_1.hightColor2.g, var_225_11)
								local var_225_14 = Mathf.Lerp(iter_225_5.color.b, arg_222_1.hightColor2.b, var_225_11)

								iter_225_5.color = Color.New(var_225_12, var_225_13, var_225_14)
							else
								local var_225_15 = Mathf.Lerp(iter_225_5.color.r, 0.5, var_225_11)

								iter_225_5.color = Color.New(var_225_15, var_225_15, var_225_15)
							end
						end
					end
				end
			end

			if arg_222_1.time_ >= var_225_9 + var_225_10 and arg_222_1.time_ < var_225_9 + var_225_10 + arg_225_0 and not isNil(var_225_8) and arg_222_1.var_.actorSpriteComps1052 then
				for iter_225_6, iter_225_7 in pairs(arg_222_1.var_.actorSpriteComps1052:ToTable()) do
					if iter_225_7 then
						if arg_222_1.isInRecall_ then
							iter_225_7.color = arg_222_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_225_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_222_1.var_.actorSpriteComps1052 = nil
			end

			local var_225_16 = arg_222_1.actors_["1034"].transform
			local var_225_17 = 0

			if var_225_17 < arg_222_1.time_ and arg_222_1.time_ <= var_225_17 + arg_225_0 then
				arg_222_1.var_.moveOldPos1034 = var_225_16.localPosition
				var_225_16.localScale = Vector3.New(1, 1, 1)

				arg_222_1:CheckSpriteTmpPos("1034", 3)

				local var_225_18 = var_225_16.childCount

				for iter_225_8 = 0, var_225_18 - 1 do
					local var_225_19 = var_225_16:GetChild(iter_225_8)

					if var_225_19.name == "split_6" or not string.find(var_225_19.name, "split") then
						var_225_19.gameObject:SetActive(true)
					else
						var_225_19.gameObject:SetActive(false)
					end
				end
			end

			local var_225_20 = 0.001

			if var_225_17 <= arg_222_1.time_ and arg_222_1.time_ < var_225_17 + var_225_20 then
				local var_225_21 = (arg_222_1.time_ - var_225_17) / var_225_20
				local var_225_22 = Vector3.New(0, -331.9, -324)

				var_225_16.localPosition = Vector3.Lerp(arg_222_1.var_.moveOldPos1034, var_225_22, var_225_21)
			end

			if arg_222_1.time_ >= var_225_17 + var_225_20 and arg_222_1.time_ < var_225_17 + var_225_20 + arg_225_0 then
				var_225_16.localPosition = Vector3.New(0, -331.9, -324)
			end

			local var_225_23 = 0
			local var_225_24 = 0.175

			if var_225_23 < arg_222_1.time_ and arg_222_1.time_ <= var_225_23 + arg_225_0 then
				arg_222_1.talkMaxDuration = 0
				arg_222_1.dialogCg_.alpha = 1

				arg_222_1.dialog_:SetActive(true)
				SetActive(arg_222_1.leftNameGo_, true)

				local var_225_25 = arg_222_1:FormatText(StoryNameCfg[1109].name)

				arg_222_1.leftNameTxt_.text = var_225_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_222_1.leftNameTxt_.transform)

				arg_222_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_222_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_222_1:RecordName(arg_222_1.leftNameTxt_.text)
				SetActive(arg_222_1.iconTrs_.gameObject, false)
				arg_222_1.callingController_:SetSelectedState("normal")

				local var_225_26 = arg_222_1:GetWordFromCfg(417051053)
				local var_225_27 = arg_222_1:FormatText(var_225_26.content)

				arg_222_1.text_.text = var_225_27

				LuaForUtil.ClearLinePrefixSymbol(arg_222_1.text_)

				local var_225_28 = 7
				local var_225_29 = utf8.len(var_225_27)
				local var_225_30 = var_225_28 <= 0 and var_225_24 or var_225_24 * (var_225_29 / var_225_28)

				if var_225_30 > 0 and var_225_24 < var_225_30 then
					arg_222_1.talkMaxDuration = var_225_30

					if var_225_30 + var_225_23 > arg_222_1.duration_ then
						arg_222_1.duration_ = var_225_30 + var_225_23
					end
				end

				arg_222_1.text_.text = var_225_27
				arg_222_1.typewritter.percent = 0

				arg_222_1.typewritter:SetDirty()
				arg_222_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_417051", "417051053", "story_v_out_417051.awb") ~= 0 then
					local var_225_31 = manager.audio:GetVoiceLength("story_v_out_417051", "417051053", "story_v_out_417051.awb") / 1000

					if var_225_31 + var_225_23 > arg_222_1.duration_ then
						arg_222_1.duration_ = var_225_31 + var_225_23
					end

					if var_225_26.prefab_name ~= "" and arg_222_1.actors_[var_225_26.prefab_name] ~= nil then
						local var_225_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_222_1.actors_[var_225_26.prefab_name].transform, "story_v_out_417051", "417051053", "story_v_out_417051.awb")

						arg_222_1:RecordAudio("417051053", var_225_32)
						arg_222_1:RecordAudio("417051053", var_225_32)
					else
						arg_222_1:AudioAction("play", "voice", "story_v_out_417051", "417051053", "story_v_out_417051.awb")
					end

					arg_222_1:RecordHistoryTalkVoice("story_v_out_417051", "417051053", "story_v_out_417051.awb")
				end

				arg_222_1:RecordContent(arg_222_1.text_.text)
			end

			local var_225_33 = math.max(var_225_24, arg_222_1.talkMaxDuration)

			if var_225_23 <= arg_222_1.time_ and arg_222_1.time_ < var_225_23 + var_225_33 then
				arg_222_1.typewritter.percent = (arg_222_1.time_ - var_225_23) / var_225_33

				arg_222_1.typewritter:SetDirty()
			end

			if arg_222_1.time_ >= var_225_23 + var_225_33 and arg_222_1.time_ < var_225_23 + var_225_33 + arg_225_0 then
				arg_222_1.typewritter.percent = 1

				arg_222_1.typewritter:SetDirty()
				arg_222_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/I02f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05"
	},
	voices = {
		"story_v_out_417051.awb"
	}
}
